using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

using Caisis.Controller;
using Caisis.DataAccess;
using Caisis.Extensions;
using Caisis.BOL;

namespace Caisis.UI.Modules.ProtocolMgmt
{
	public partial class PatientItemEntry : UserControl
	{
        /// <summary>
        /// A list of table which allow db records to be deleted
        /// </summary>
        private static readonly string[] ALLOW_TABLE_DELETES = new string[] 
        {
            "Medications",
            "Toxicities",
            "Comorbidities",
            "MedicalTherapy",
            "MedTxAdministration"
        };

        private static readonly string[] PATIENT_STATUSES = new string[] { "Deceased", "Alive" };

        private IEnumerable<Caisis.BOL.IBusinessObject> businessObjects = null;

        private IEnumerable<string> lockableTables = new string[0];

        private string protocolNum = "";

        List<Control> controlsToValidate = new List<Control>();
        Dictionary<string, GridView> gridsToValidate = new Dictionary<string, GridView>();

        /// <summary>
        /// c13-124 specific
        /// </summary>
        private bool? includeAnalgesicMedications = null;

        public int PatientItemId
        {
            get;
            set;
        }

        public PatientItemEntry()
            : base()
        {
            // sets the Protocol Num for quick lookup
            this.Init += (o, e) => protocolNum = GetProtocolNum();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            BuildDataEntry();
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "validationLists", GetValidationScript(), true);
        }

        /// <summary>
        /// Builds the data entry interface.
        /// </summary>
        private void BuildDataEntry()
        {
            //KeyValuePair<IEnumerable<XElement>, int?> kvp = Caisis.BOL.ProtocolMgmt.GetMetadata(PatientItemId);

            //IEnumerable<XElement> metadataList = meta.Keys;
            //int? primaryKey = meta.First().Value;

            // call DataEntryController.Build(metadata, key, callbacks, ...)
            // Dictionary<string, int> keyMap = null;

            // get protocol metadata
            IDictionary<XElement, int?> metadata = Caisis.BOL.ProtocolMgmt.GetMetadata(PatientItemId);
            XElement firstElement = metadata.First().Key;
            int? primaryKey = metadata.First().Value;

            // LockedBy validation
            lockableTables = from x in metadata
                             let t = x.Key.Name.LocalName
                             group x by t into g
                             let t = g.Key
                             where BusinessObject.HasField(t, BusinessObject.LockedBy)
                             select g.Key;

            // MedTx Administration hack
            int? previousMedTxId = null;
            bool hasMedTxData =  metadata.Keys.First().Name.LocalName=="MedTxAdministration"
                || metadata.Keys.First().Descendants().Where(x=>x.Name.LocalName=="MedTxAdministration").Count()>0;
            if (hasMedTxData)
            {
                previousMedTxId = ProtocolMgmtDa.GetPreviousMedTxAdministrationParentId(PatientItemId);

                if (previousMedTxId.HasValue)
                    primaryKey = previousMedTxId.Value;
            }
            // special case
            bool isMedGrid = firstElement.Name.LocalName == "Medications" && firstElement.Attribute("GridView").Value == "True";
            if (isMedGrid)
            {
                if (MatchProtocol("c13-124"))
                {
                    // get patient item details
                    string itemDescrition = "";
                    DataView schemaItem = ProtocolMgmtDa.GetSchemaItemByPatientItemId(PatientItemId).DefaultView;
                    if (schemaItem.Count > 0)
                    {
                        itemDescrition = schemaItem[0][SchemaItem.ItemDescription] + "";
                        includeAnalgesicMedications = itemDescrition.Contains("Analgesic");
                    }
                    var medicationMetadata = metadata.Where(e => e.Key.Name.LocalName == "Medications");
                    bool medicationsHaveRecords = medicationMetadata.Any(e => e.Value.HasValue);
                    if (medicationsHaveRecords)
                    {
                        // if grid rows have existing data, remove non records
                        var removeEmptyRecords = medicationMetadata.Where(e => !e.Value.HasValue).ToList();
                        // cleanup extra metadata
                        removeEmptyRecords.ForEach(e => metadata.Remove(e));
                    }
                }
            }

            DataEntryController controller = new DataEntryController(CICHelper.InvokeInputControl);

            if (metadata.Count() == 1 && firstElement.Attribute("GridView").Value == "False") // && not a grid
            {
                XElement simpleMetadata = firstElement;
                string tablename = simpleMetadata.Name.LocalName;
                string primaryKeyName = Caisis.BOL.BusinessObject.GetPrimaryKeyName(tablename);
                businessObjects = controller.Build(simpleMetadata, primaryKeyName, primaryKey, AddEntryField, AddEntryGroupHeader, AddGrid);
            }
            else
            {
                string tablename = firstElement.Name.LocalName;
                string parentTablename = Caisis.BOL.BusinessObject.GetParentTablename(tablename);
                string parentKeyname = Caisis.BOL.BusinessObject.GetPrimaryKeyName(parentTablename);

                // get data entry metadata
                var complexMetadata = metadata.Keys;
                // lookup of data entry items and keys
                var indetifiers = metadata;

                // special case
                if (previousMedTxId.HasValue)
                {
                    businessObjects = controller.Build(complexMetadata, parentKeyname, primaryKey, AddEntryField, AddEntryGroupHeader, AddGrid);
                }
                else
                {
                    businessObjects = controller.Build(complexMetadata, indetifiers, AddEntryField, AddEntryGroupHeader, AddGrid);
                }
            }
        }

        /// <summary>
        /// Updates/Inserts the data entry items and returns a lookup of Table -> list of pri keys of Table.
        /// </summary>
        /// <returns>A dictionary of Table to updates records of Table.</returns>
        public IDictionary<string, IEnumerable<int>> Save()
		{
			if (businessObjects == null)
				throw new Exception("The business object collection for this item is null.");

			int patientId = ProtocolMgmtDa.GetPatientIdByPatientItemId(PatientItemId);
			int protocolId = ProtocolMgmtDa.GetProtocolIdByPatientItemId(PatientItemId);

			businessObjects.ForEach(x => PopulateProtocolId(x, protocolId));

			foreach (Caisis.BOL.IBusinessObject b in businessObjects)
			{
				if (b.HasField(Patient.PatientId))
					b[Patient.PatientId] = patientId;

                // adjust date/date text
                var dateTextFields = b.FieldNames.Where(f => f.EndsWith("DateText"));
                foreach (var dateTextField in dateTextFields)
                {
                    string dateField = dateTextField.Replace("DateText", "Date");
                    if (b.HasField(dateField))
                    {
                        string dateTextFieldValue = b[dateTextField].ToString();
                        if (!string.IsNullOrEmpty(dateTextFieldValue))
                        {
                            DateTime testParse = DateTime.Now;
                            if (!string.IsNullOrEmpty(dateTextFieldValue) && DateTime.TryParse(dateTextFieldValue, out testParse))
                            {
                                b[dateField] = testParse.ToShortDateString();
                            }
                            else
                            {
                                b[dateField] = string.Empty;
                            }
                        }
                        else
                        {
                            b[dateField] = string.Empty;
                        }
                    }
                }
                // validate: don't save locked records
                if (!b.IsLocked)
                {   b.Save();
                }
                // special case: locked
                else
                {
                    if (b is LabTest && !b.IsNull(LabTest.LabTest_Field))
                    {
                        BOL.ProtocolMgmt.SaveLockedRecord(b);
                    }
                }
            }

            // build a dictionary of records which were updates/inserted by table
            var priKeys = (from biz in businessObjects
                           where biz.PrimaryKeyHasValue
                           // creating grouping by table (i.e., "Encounter" records)
                           group biz by biz.TableName into g
                           select new
                           {
                               // table (i.e., "Encounters"
                               Table = g.Key,
                               // pri keys (i.e., list of "EncounterId"s
                               PriKeys = from b in g
                                         select (int)b[b.PrimaryKeyName]
                           }).ToDictionary(k => k.Table, v => v.PriKeys.Distinct());
            return priKeys;

            //Caisis.BOL.IBusinessObject bizo = businessObjects.First();
            //if (businessObjects.Count() > 1)
            //{
            //    string parentTablename = Caisis.BOL.BusinessObject.GetParentTablename(bizo.TableName);
            //    string parentKeyName = Caisis.BOL.BusinessObject.GetPrimaryKeyName(parentTablename);

            //    object o = bizo[parentKeyName];

            //    if (o is int)
            //        return (int) o;
            //    else
            //        return -1;
            //}
            //else
            //{
            //    object o = bizo[bizo.PrimaryKeyName];

            //    if (o is int)
            //        return (int) o;
            //    else
            //        return -1;
            //}
		}

        /// <summary>
        /// Deletes the data entry items.
        /// </summary>
        public void Delete()
        {
            if (businessObjects != null)
                businessObjects.ForEach(b => b.Delete());
        }

        private void PopulateProtocolId(IBusinessObject b, int id)
        {
            if (!b.IsEmpty && b.HasField(BOL.Protocol.ProtocolId))
                b[BOL.Protocol.ProtocolId] = id;

            b.Children.ForEach(x => PopulateProtocolId(x, id));
        }

        private void AddEntryField(ICaisisInputControl control)
        {
            // TODO: handle control.Required
            if (control.Required)
                controlsToValidate.Add(control as Control);

            // TODO: styles and other whatnots
            Panel panel = new Panel();
            panel.CssClass = "DataEntryRow";
            panel.Controls.Add((Control)control);

            // Special Cases
            if ((MatchProtocol("c12-097") || MatchProtocol("c10-070")) && control.Table == "Status" && control.Field == "Status" && control is ListControl)
            {
                ListControl listControl = control as ListControl;
                listControl.PreRender += (a, b) =>
                {
                    listControl.DataTextField = "";
                    listControl.DataValueField = "";
                    listControl.DataSource = PATIENT_STATUSES;
                    listControl.DataBind();
                };
            }
            else if (MatchProtocol("c12-108") && control.Table == "Categories" && control.Field == "Category" && control is ICaisisLookupControl)
            {
                // build static data
                string[] values = new string[] { "Positive", "Negative" };
                DataTable comboData = new DataTable();
                comboData.Columns.Add(new DataColumn("Category"));
                foreach (string value in values)
                    comboData.Rows.Add(value);
                CaisisComboBox combo = control as CaisisComboBox;
                CaisisSelect select = control as CaisisSelect;
                if (combo != null)
                {
                    combo.BuildComboData(comboData, "Category", "Category");
                }
                else if (select != null)
                {
                    select.PreRender += (a, b) =>
                    {
                        select.DataTextField = "Category";
                        select.DataValueField = "Category";
                        select.DataSource = comboData;
                        select.DataBind();
                    };
                }
            }

			container.Controls.Add(panel);
		}

        private void AddEntryGroupHeader(string name)
        {
            //Label l = new Label();
            //l.Text = string.Format("{0}: =================", name);

            //Panel panel = new Panel();
            //panel.Controls.Add(l);

            //container.Controls.Add(panel);

            if (string.IsNullOrEmpty(name))
                return;

            // stolen from PatientDataEntryContainer
            Panel SectionLabelHolder = new Panel();
            SectionLabelHolder.CssClass = "PDSectionHeader";

            /*
                        Image plusMinusImage = new Image();
                        plusMinusImage.ID = name + "PlusMinusImage";
                        plusMinusImage.ImageUrl = "~/Images/icon_minus.gif";
                        plusMinusImage.AlternateText = "Open SubForm Section";
                        plusMinusImage.Style.Add("padding", "2px");
                        plusMinusImage.Style.Add("cursor", "pointer");
                        SectionLabelHolder.Controls.Add(plusMinusImage);
            */

            Label SectionLabel = new Label();
            SectionLabel.Text = name; // TODO: change to use metadata/pdconfig
            SectionLabel.CssClass = "SubFormSectionTitle";
            SectionLabelHolder.Controls.Add(SectionLabel);

            container.Controls.Add(SectionLabelHolder);
        }

        private void AddGrid(GridView grid, ImageButton addNewRowButton, string tableName)
        {
            Panel panel = new Panel();
            panel.CssClass = "PDSectionHolder";
            panel.Style["padding"] = "5px";
            panel.Style["width"] = "auto";

            grid.Style["margin-left"] = "15px";
            grid.Style["margin-top"] = "0px";

            // add clear items columns
            GridRowClearImage clearBtnColumn = new GridRowClearImage();
            grid.Columns.Add(clearBtnColumn);
            string[] keyNames = grid.DataKeyNames;

            // validate: LockedBy
            bool validateAuditField = lockableTables.Contains(tableName);

            // add delete button in special cases
            if (ALLOW_TABLE_DELETES.Contains(tableName))
            {
                string priKeyName = BOL.BusinessObject.GetPrimaryKeyName(tableName);
                GridRowDeleteImage deleteButton = new GridRowDeleteImage();
                grid.Columns.Add(deleteButton);
                grid.RowDeleting += (o, e) =>
                {
                    GridViewRow gridRow = grid.Rows[e.RowIndex];
                    HiddenField priKeyField = gridRow.FindControl(priKeyName) as HiddenField;
                    if (priKeyField != null && !string.IsNullOrEmpty(priKeyField.Value))
                    {
                        // delete record
                        int priKey = int.Parse(priKeyField.Value);
                        BusinessObject bo = BusinessObjectFactory.BuildBusinessObject(tableName);
                        bo.Delete(priKey);
                        // reset patient item fields
                        Dictionary<string, IEnumerable<int>> destTableToKeys = new Dictionary<string, IEnumerable<int>>();
                        destTableToKeys.Add(tableName, new int[] { priKey });
                        string username = new Security.SecurityController().GetUserName();
                        ProtocolMgmtDa.ClearProtocolMgrPatientFieldsWithPKey(PatientItemId, destTableToKeys, username);

                        // TODO: proper redirect
                        Response.Redirect(Request.Url.PathAndQuery, true);
                    }
                };
            }

            // add hidden keys as input fields (used for UI)
            var hiddenKeyNames = keyNames.Except(new string[] { Patient.PatientId });
            grid.RowCreated += (sender, e) =>
            {
                int lastCellIndex = e.Row.Cells.Count - 1;
                if (lastCellIndex > -1)
                {
                    TableCell lastCell = e.Row.Cells[lastCellIndex];
                    foreach (string key in hiddenKeyNames)
                    {
                        HiddenField hidden = new HiddenField();
                        hidden.ID = key;
                        // add field to cell
                        lastCell.Controls.Add(hidden);
                    }
                } 
            };        

            // suppress clear button for existing records
            grid.RowDataBound += (sender, e) =>
            {
                // data retriever
                DataRowView dataRow = e.Row.DataItem as DataRowView;
                Func<string, object> getRowValue = (fieldName) =>
                {
                    return dataRow != null && dataRow.Row.Table.Columns[fieldName] != null ? dataRow[fieldName] : null;
                };
                if (e.Row.RowType == DataControlRowType.DataRow && e.Row.DataItem != null)
                {
                    bool hasEmptyKeys = false;
                    // for each key field, set associated hidden field
                    foreach (string key in keyNames)
                    {
                        string keyValue = getRowValue(key) + "";
                        HiddenField hidden = e.Row.FindControl(key) as HiddenField;
                        if (hidden != null)
                        {
                            hidden.Value = keyValue;
                        }
                        hasEmptyKeys = hasEmptyKeys || string.IsNullOrEmpty(keyValue);
                    }
                    // suppress clear on "real" rows
                    IEnumerable<HyperLink> clearBtn = Caisis.UI.Core.Classes.PageUtil.GetControls<HyperLink>(e.Row).Where(btn => btn.CssClass.Contains("ClearGridRowLink"));
                    if (!hasEmptyKeys)
                        clearBtn.ForEach(b => b.Style["display"] = "none");
                    // suppress delete button on "fake" rows
                    IEnumerable<ImageButton> deleteBtn = Caisis.UI.Core.Classes.PageUtil.GetControls<ImageButton>(e.Row).Where(btn => btn.CommandName == "Delete");
                    if (hasEmptyKeys)
                        deleteBtn.ForEach(b => b.Style["display"] = "none");

                    // validate: LockedBy
                    if (validateAuditField)
                    {
                        object lockedBy = getRowValue(BusinessObject.LockedBy);
                        bool rowIsLocked = lockedBy != null && lockedBy + "" != "";
                        if (rowIsLocked)
                        {
                            // special case
                            var fields = CICHelper.GetCaisisInputControlDictionary(e.Row);
                            if (fields.ContainsKey(LabTest.LabClinicalSignificance))
                            {
                                var input = fields[LabTest.LabClinicalSignificance];
                                input.PreRender += (a, b) => input.Enabled = true;
                            }
 
                        }
                    }

                    // c13-124
                    if (MatchProtocol("c13-124") && tableName == "Medications" && includeAnalgesicMedications.HasValue)
                    {
                        string medType = getRowValue(Medication.MedType) + "";
                        bool showRow = string.IsNullOrEmpty(medType) || (includeAnalgesicMedications.Value ? medType == "Analgesic" : medType != "Analgesic");
                        e.Row.Visible = showRow;
                    }
                }
            };

            gridsToValidate.Add(tableName, grid);

            grid.DataBind();
            grid.DataKeyNames = null; // workaround for ControlState bogosity

            panel.Controls.Add(grid);
            panel.Controls.Add(addNewRowButton);

            container.Controls.Add(panel);
        }

        private string GetValidationScript()
        {
            StringBuilder b = new StringBuilder();

            controlsToValidate.ForEach(c => b.AppendLine("if (fieldValidationList) fieldValidationList.push('" + c.ClientID + "');"));
            gridsToValidate.Values.ForEach(g => b.AppendLine("if (gridValidationList) gridValidationList.push('" + g.ID + "');"));

            return b.ToString();
        }

        /// <summary>
        /// Gets the current Protocol #
        /// </summary>
        /// <returns></returns>
        private string GetProtocolNum()
        {
            if (Page is ProtocolMgmtBasePage)
            {
                return (Page as ProtocolMgmtBasePage).ProtocolNumber + "";
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// Matches if match Protocol # matched current Protocol #
        /// </summary>
        /// <param name="protocolNumMatch"></param>
        /// <returns></returns>
        private bool MatchProtocol(string protocolNumMatch)
        {
            return protocolNum.StartsWith(protocolNumMatch);
        }
    }

}
