using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Controller;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.Classes
{
    /// <summary>
    /// Summary description for DynamicPage.
    /// </summary>
    public class DynamicPage : BasePage
    {
        #region private members
        private string tableName;
        private int primaryKey = -1;
        private int patientID;
        // private DynamicModel model;

        private BusinessObject bizo;
        private BusinessObject parent;
        //private IEnumerable<IBusinessObject> children = new List<IBusinessObject>();
        //private List<Control> childDataEntryControls = new List<Control>();
        private IDictionary<string, IEnumerable<IBusinessObject>> _children = new Dictionary<string, IEnumerable<IBusinessObject>>();
        //private Dictionary<string, Control> _childDataEntryControls = new Dictionary<string, Control>();

        private Control mainContainer;
        private Control hiddenContainer;

        // the mode of our optional field selection; true = hide things in the list, show everything else;
        private bool hideSelectedFields = false;
        private string[] selectedFields = new string[0];

        //private List<string> selectedFields;

		protected bool recordIsLocked = false;


        private Dictionary<string, bool> isTableDirty = new Dictionary<string, bool>();

        // ??? use default metadata
        private PatientDataEntryController pdec = new PatientDataEntryController(null);

        #endregion

        public DynamicPage()
            : base()
        {
            this.Init += InitPageVariables;
        }

        #region protected Properties
        protected Control MainContainer
        {
            get { return mainContainer; }
            set { mainContainer = value; }
        }

        protected Control HiddenContainer
        {
            get { return hiddenContainer; }
            set { hiddenContainer = value; }
        }

        /// <summary>
        /// Returns a list of child table names
        /// </summary>
        protected string[] ChildTableNames
        {
            get
            {
                string childTableName = Request.QueryString["childTableName"];
                if (!string.IsNullOrEmpty(childTableName))
                {
                    string[] childTables = childTableName.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                    return childTables;
                }
                return new string[0];
            }
        }


        #endregion

        #region page flow handlers

        protected void InitPageVariables(object sender, EventArgs e)
        {
            // set main table
            tableName = Request["tablename"];

            // set filter options
            hideSelectedFields = Request.QueryString["hide"] == "yes";

            // set main table fieltered fields
            string fields = Request.QueryString["fields"];
            if (!string.IsNullOrEmpty(fields))
            {
                selectedFields = fields.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            }
            else
            {
                selectedFields = new string[0];
            }  

            // get the patient id
            if (Session[SessionKey.PatientId] != null && !Session[SessionKey.PatientId].ToString().Equals(""))
            {
                patientID = (int)Session[SessionKey.PatientId];
            }
            else
            {
                // this should NEVER happen
                throw new Exception("Cannot initialize a Dynamic Page without a current patient selected");
            }
         }

        virtual protected void Page_Load(object sender, System.EventArgs e)
        {
            bool retrieveValues = false;
            string pks = Request["pkey"];
            if (pks != null && pks.Length > 0)
            {
                primaryKey = int.Parse(pks);
                //v4.0 model = new DynamicModel(tableName, primaryKey, patientID, new ValidateNullsDelegate(NullsValidatorWrapper.ValidateNullsHaveData));
                // model = new DynamicModel();

                bizo = BusinessObjectFactory.BuildBusinessObject(tableName);
                bizo.Get(primaryKey);

                retrieveValues = true;

				// peek at the lockedby
				if (bizo.HasField(BusinessObject.LockedBy))
				{
					if (bizo[BusinessObject.LockedBy] != null && !string.IsNullOrEmpty(bizo[BusinessObject.LockedBy].ToString()))
					{
						recordIsLocked = true;
					}
				}
            }
            else
            {
                //v4.0 model = new DynamicModel(tableName, patientID, new ValidateNullsDelegate(NullsValidatorWrapper.ValidateNullsHaveData));
                // model = new DynamicModel();

                bizo = BusinessObjectFactory.BuildBusinessObject(tableName);

                // is this necessary?
                if (bizo.HasField("PatientId"))
                {
                    bizo["PatientId"] = patientID;
                }
            }

            // set parent biz
            if (bizo != null)
            {
                // LOAD OPTIONAL PARENT TABLE

                // verify has parent which isn't Patient
                if (!string.IsNullOrEmpty(bizo.ParentTableName) && bizo.ParentTableName != "Patients")
                {
                    // validate no multiple foreign keys
                    if (bizo.ForeignKeyNames.Count() == 1 && !bizo.ForeignKeyNames.Contains(Patient.PatientId))
                    {
                        var pBiz = BusinessObjectFactory.BuildBusinessObject(bizo.ParentTableName);
                        // one last verification
                        if (!(pBiz is Patient))
                        {
                            parent = pBiz;
                            // load parent biz if applicable
                            if (bizo.PrimaryKeyHasValue)
                            {
                                int parPriKey = (int)bizo[bizo.ParentKeyName];
                                parent.Get(parPriKey);
                            }
                        }
                    }
                }
                // LOAD CHILD TABLES
                if (ChildTableNames.Length > 0)
                {
                    // rebuild child table lookup
                    _children = new Dictionary<string, IEnumerable<IBusinessObject>>();

                    int parentKey = (int)bizo[bizo.PrimaryKeyName];
                    // build lookup: child table -> child records
                    var childTableNames = ChildTableNames.Where(t => BusinessObject.GetParentTablename(t) == bizo.TableName);
                    var childTableToRecords = childTableNames.ToDictionary(t => t, t=> BusinessObject.GetByParent(t, parentKey));
                    
                    // validation: validate children
                    foreach (var child in childTableToRecords)
                    {
                        string childTable = child.Key;
                        IEnumerable<IBusinessObject> childBizos = child.Value;

                        // if child is grid with no record, create blank data
                        bool isGrid = pdec.IsGridView(childTable);
                        if (isGrid && childBizos.Count() == 0)
                        {
                            // init blank rows
                            childBizos = new IBusinessObject[] { BusinessObjectFactory.BuildBusinessObject(childTable) };
                            // set parent key
                            foreach (var b in childBizos)
                            {
                                b[b.ParentKeyName] = parentKey;
                            }
                        }
                        // add entry
                        _children.Add(childTable, childBizos);
                    }
                    
                }
                
            }

            if (Page.IsPostBack)
            {
                BuildControls(bizo, false);
            }
            else
            {
                BuildControls(bizo, retrieveValues);
            }
            // init field-tracking: note late bound binding
            foreach (var input in PageUtil.GetControls<ICaisisInputControl>(Page))
                input.ValueChanged += MarkTableFieldsDirty;
        }

        virtual protected void Save(object sender, System.EventArgs e)
        {
            // validation hooks?

            // TODO: we could refactor w/ custom iterators

            // set bizo fields from main fields
            IEnumerable<ICaisisInputControl> controls = CICHelper.GetCaisisInputControls(this);
            SetBizoValues(bizo, controls);

            // set parent fields (if applicable)
            if (parent != null)
            {
                SetBizoValues(parent, controls);
            }

            //foreach (ICaisisInputControl c in controls)
            //{
            //    // validate table and field
            //    if (bizo.TableName == c.Table && bizo.HasField(c.Field))
            //    {
            //        bizo[c.Field] = c.Value;
            //    }
            //}

            string squery = Request.Url.Query;

            squery = this.RemoveParameterFromUrlQueryString(squery, "error");
            squery = this.RemoveParameterFromUrlQueryString(squery, "save");

            string redirectURL = "DynamicForm.aspx" + squery;
            try
            {
                //if (primaryKey > -1)
                //{
                //    model.UpdateRecord();
                //}
                //else
                //{
                //    primaryKey = model.InsertRecord();
                //    redirectURL += "&pkey=" + primaryKey;
                //}

                // save parent (optional)
                if (parent != null)
                {
                    parent.Save();
                    //  update foreign key
                    bizo[bizo.ParentKeyName] = parent[parent.PrimaryKeyName];
                }

                // save main biz
                bizo.Save();

                // save children (optional)
                if (ChildTableNames.Count() > 0)
                {
                    // get child tables rptr
                    Repeater childTablesRptr = Page.FindControl("ChildTablesRptr") as Repeater;

                    // get required parent key
                    string parentTableName = bizo.TableName;
                    string parentKeyName = bizo.PrimaryKeyName;
                    int parentPriKey = (int)bizo[bizo.PrimaryKeyName];

                    // save each child table
                    foreach (RepeaterItem rptrItem in childTablesRptr.Items)
                    {
                        HiddenField tableNameField = rptrItem.FindControl("TableNameField") as HiddenField;
                        if (tableNameField!=null&& !string.IsNullOrEmpty(tableNameField.Value))
                        {
                            string childTableName = tableNameField.Value;
                            bool isGrid = pdec.IsGridView(childTableName);
                            // validate: child table and "dirty" (!important: grid has own tracking)
                            if (ChildTableNames.Contains(childTableName) && (isGrid || isTableDirty.ContainsKey(childTableName)))
                            {
                                // grid tables
                                if (isGrid)
                                {
                                    // locate child grid
                                    var childTableGrid = PageUtil.GetControls<CaisisGridView>(rptrItem).FirstOrDefault();
                                    // should only by 1 grid per child table
                                    if (childTableGrid != null)
                                    {
                                        childTableGrid.Save();
                                    }
                                }
                                // standard data entry tables
                                else
                                {
                                    var inputFields = PageUtil.GetControls<ICaisisInputControl>(rptrItem);
                                    IBusinessObject childBizo;
                                    // update
                                    if (_children.ContainsKey(childTableName) && _children[childTableName].Count() > 0)
                                    {
                                        childBizo = _children[childTableName].First();
                                    }
                                    // insert
                                    else
                                    {
                                        childBizo = BusinessObjectFactory.BuildBusinessObject(childTableName);
                                        // set parent key
                                        childBizo[parentKeyName] = parentPriKey;
                                    }
                                    // set field values
                                    SetBizoValues(childBizo, inputFields);
                                    // update/save
                                    childBizo.Save();
                                }
                            }
                        }
                    }
                  
                }

                if (!redirectURL.Contains("pkey="))
                {
                    redirectURL += "&pkey=" + bizo[bizo.PrimaryKeyName].ToString();
                }

                redirectURL += "&saved=true";
            }
            catch (Exception ex)
            {
                // TODO: we can parse exception for more detail ...

                //if (ex is ClientException)
                //{
                //    string field = ex.Message;
                //    DataRow row = model.GetHelpFieldInfo(field);

                //    // we need to map this field to metadata
                //    redirectURL += "&error=" + row["FieldLabel"].ToString();
                //}
                //else
                //{
                    redirectURL += "&error=_default";

                    // let everyone know
                    ExceptionHandler.Publish(ex);
                //}
            }

            Response.Redirect(redirectURL);
            // added saved=true, should prob move that portion at later date - jf

        }

        #endregion

        #region private utilities

        /// <summary>
        /// For the specified table, return a list of input fields
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        protected List<ICaisisInputControl> GetInputControls(string table)
        {
            // get a list of controls by table
            List<ICaisisInputControl> inputs = CICHelper.GetCaisisInputControlsByTableName(table);

            // cleanup
            foreach (ICaisisInputControl input in inputs)
            {
                // supress labels
                input.ShowLabel = false;

                // trigger calc date on text fields
                if (input is CaisisTextBox && input.Field.EndsWith("DateText"))
                {
                    CaisisTextBox ctb = input as CaisisTextBox;
                    ctb.Attributes["onblur"] = "UpdateDate(this);";
                }
                // cleanup spacer on date fields
                if (input is CaisisHidden)
                {
                    CaisisHidden hiddenInput = input as CaisisHidden;
                    if (hiddenInput.DisplayCalculatedDate)
                    {
                        hiddenInput.ShowSpacer = false;
                    }
                }
            }
            return inputs;
        }

        /// <summary>
        /// Populate the fields by bizo
        /// </summary>
        /// <param name="ibo"></param>
        /// <param name="controls"></param>
        private void SetFieldValues(IBusinessObject ibo, IEnumerable<ICaisisInputControl> controls)
        {
            foreach (ICaisisInputControl cic in controls)
            {
                if (cic.Table == ibo.TableName && ibo.HasField(cic.Field))
                    cic.Value = ibo[cic.Field].ToString();
            }
        }

        /// <summary>
        /// Populates the biz object based on input fields of biz table
        /// </summary>
        /// <param name="ibo"></param>
        /// <param name="controls"></param>
        private void SetBizoValues(IBusinessObject ibo, IEnumerable<ICaisisInputControl> controls)
        {
            foreach (ICaisisInputControl cic in controls)
            {
                // readonly text boxes shouldn't be modified, won't retain client values
                if (cic is CaisisTextBox && (cic as CaisisTextBox).ReadOnly)
                    continue;

                if (cic.Table == ibo.TableName && ibo.HasField(cic.Field))
                    ibo[cic.Field] = cic.Value;
            }
        }

        private void BuildControls(BusinessObject b, bool retrieveValues)
        {
            // get panels and labels
            var parentRptr = Page.FindControl("ParentRptr") as Repeater;
            var parentPanel = Page.FindControl("ParentFieldsPanel") as Control;
            var parentLabel = Page.FindControl("ParentFieldsLabel") as Label;
            var mainLabel = Page.FindControl("MainFieldsLabel") as Label;
            var childPanel = Page.FindControl("ChildFieldsPanel") as Control; ;
            var childLabel = Page.FindControl("ChildFieldsLabel") as Label;

            Repeater childTablesRptr = Page.FindControl("ChildTablesRptr") as Repeater;
            Repeater childTablesHeaderRptr = Page.FindControl("ChildTablesHeaderRptr") as Repeater;

            // BUILD: parent table
            if (parent != null)
            {
                string parentTable = parent.TableName;
                // validate container
                if (parentPanel != null)
                {
                    // show relevant sections
                    parentPanel.Visible = true;
                    parentLabel.Visible = true;
                    mainLabel.Visible = true;

                    // set title
                    parentLabel.Text = GetTableLabel(parentTable);

                    // get parent fields
                    List<ICaisisInputControl> parentInputFields = GetInputControls(parentTable);

                    // build controls
                    parentRptr.DataSource = parentInputFields;
                    parentRptr.DataBind();

                    if (retrieveValues)
                    {
                        SetFieldValues(parent, parentInputFields);
                    }
                }                
            }
            // BUILD: main table

            // need to branch here if containers are repeaters (should be split into methods too)
            List<ICaisisInputControl> mainInputFields = GetInputControls(b.TableName);
            List<ICaisisInputControl> mainFields = new List<ICaisisInputControl>();
            List<ICaisisInputControl> hiddenFields = new List<ICaisisInputControl>();

            foreach (ICaisisInputControl iCIC in mainInputFields)
            {
                if (!hideSelectedFields)
                {
                    if (selectedFields.Length == 0 || selectedFields.Contains(iCIC.Field))
                    {
                        mainFields.Add(iCIC);
                    }
                    else
                    {
                        hiddenFields.Add(iCIC);
                    }
                }
                else
                {
                    if (selectedFields.Contains(iCIC.Field))
                    {
                        hiddenFields.Add(iCIC);
                    }
                    else
                    {
                        mainFields.Add(iCIC);
                    }
                }
            }

            if (mainContainer is Repeater)
            {                
                Repeater mainRpt = (Repeater)mainContainer;
                Repeater hiddenRpt = (Repeater)hiddenContainer;

                mainRpt.DataSource = mainFields;
                hiddenRpt.DataSource = hiddenFields;

                mainRpt.DataBind();
                hiddenRpt.DataBind();
            }
            else
            {
                DynamicControlContainer mainWrapper = new DynamicControlContainer(mainContainer);
                DynamicControlContainer hiddenWrapper = new DynamicControlContainer(hiddenContainer);

                foreach (Control c in mainFields.OfType<Control>())
                    mainWrapper.AddChildControl(c);
                foreach (Control c in hiddenFields.OfType<Control>())
                    hiddenWrapper.AddChildControl(c);               
            }
            if (retrieveValues)
            {
                SetFieldValues(bizo, mainInputFields);
            }
            // set main title
            mainLabel.Text = GetTableLabel(b.TableName);

            // BUILD: child tables
            if (childTablesRptr != null && ChildTableNames.Length > 0)
            {
                // show child fields
                childPanel.Visible = true;
                mainLabel.Visible = true;

                // build child table headers                
                childTablesHeaderRptr.DataSource = ChildTableNames;
                childTablesHeaderRptr.DataBind();

                // build child table data entry
                childTablesRptr.DataSource = ChildTableNames;
                childTablesRptr.DataBind();
            }
        }

        /// <summary>
        /// Adds the child table's data entry input fields for the child table 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildRptrChildDataEntry(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // get child table and data
                string childTableName = childTableName = e.Item.DataItem.ToString();
                IEnumerable<IBusinessObject> childRecords = _children[childTableName];
                // locate data entry control
                var childDataEntry = GetChildDataEntry(e.Item);
                // get child input fields
                var childInputFields = GetInputControls(childTableName);
                // build interface
                bool childIsGrid = pdec.IsGridView(childTableName);
                // grid interface
                if (childIsGrid)
                {
                    // add data entry fields interface
                    // important, at least 1 child bizo
                    var childGridRecords = childRecords;
                    // shouldn't ever hit here, blank data populated ??? - ac
                    if (childRecords.Count() == 0)
                    {
                        childRecords = new List<IBusinessObject>() { BusinessObjectFactory.BuildBusinessObject(childTableName) };
                    }
                    CaisisGridView grid = CICHelper.AddGridViewByTableName(childDataEntry, childRecords, childTableName);
                    bool childRecordsExist = childRecords.Where(c => c.PrimaryKeyHasValue).Count() > 0;
                    grid.VisibleBlankRows = childRecordsExist ? 0 : 1;
                }
                // standard data entry interface
                else
                {
                    var childDataEntryControl = BuildChildDataEntryInterface(childInputFields);
                    // add data entry fields interface
                    childDataEntry.Controls.Add(childDataEntryControl);

                    // set values on inital load
                    if (childRecords.Count() > 0 && !Page.IsPostBack)
                    {
                        IEnumerable<ICaisisInputControl> inputFields = PageUtil.GetControls<ICaisisInputControl>(e.Item);
                        SetFieldValues(childRecords.First(), inputFields);
                    }
                }
            }
        }

        /// <summary>
        /// Marks the input field's table as "dirty", i.e., value changed during POSTs
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MarkTableFieldsDirty(ICaisisInputControl sender, EventArgs e)
        {
            string table = sender.Table;
            if (!string.IsNullOrEmpty(table) && !isTableDirty.ContainsKey(table))
            {
                isTableDirty.Add(table, true);
            }
        }

        /// <summary>
        /// Builds a new child data entry interface
        /// </summary>
        /// <param name="inputControls"></param>
        /// <returns></returns>
        private Control BuildChildDataEntryInterface(IEnumerable<ICaisisInputControl> inputControls)
        {
            HtmlTable table = new HtmlTable();
            table.Attributes["class"] = "DynamicDataEntryTable";
            table.CellSpacing = 0;
            table.Style["width"] = "100%";
            var inputControlsArray = inputControls.ToArray();
            for (int i = 0; i < inputControlsArray.Length; i++)
            {
                // build table row with required cells
                ICaisisInputControl inputControl = inputControlsArray[i];
                var control = inputControl as Control;
                var row = new HtmlTableRow();                
                var labelCell = new HtmlTableCell();
                var controlCell = new HtmlTableCell();
                var label = new Label();

                // build label and control
                labelCell.Controls.Add(label);
                controlCell.Controls.Add(control);

                // set metadata
                string className = i % 2 == 0 ? "ControlBoxRowAlternatingRowsA" : "ControlBoxRowAlternatingRowsB";
                row.Attributes["class"] = className;
                control.ID = inputControl.Table + "_" + inputControl.Field;
                // set field label
                inputControl.ShowLabel = false;
                if (inputControl.Required)
                {
                    label.CssClass = "requiredField";
                }
                label.Text = inputControl.FieldLabel;
                label.AssociatedControlID = control.ID;

                // build table row
                row.Cells.Add(labelCell);
                row.Cells.Add(controlCell);
                table.Rows.Add(row);
            }
            return table;
        }

        private string RemoveParameterFromUrlQueryString(string queryString, string parameterName)
        {
            System.Text.StringBuilder param = new System.Text.StringBuilder(parameterName.Length + 2);
            param.Append('&');
            param.Append(parameterName);
            param.Append('=');

            int index = queryString.IndexOf(param.ToString());
            if (index > -1)
            {
                int nextAmp = queryString.IndexOf('&', index + 1);
                if (nextAmp > -1)
                {
                    return queryString.Remove(index, nextAmp - index);
                }
                else
                {
                    return queryString.Remove(index, queryString.Length - index);
                }
            }

            return queryString;
        }
        #endregion


        /// <summary>
        /// Returns the friendly table label
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        protected string GetTableLabel(string table)
        {
            return pdec.GetTableLabel(table);
        }

        /// <summary>
        /// Gets the data entry container for loading/updating child records
        /// </summary>
        /// <returns></returns>
        private BasePatientDataControl GetChildDataEntry()
        {
            return GetChildDataEntry(Page);
        }

        /// <summary>
        /// Gets the data entry container for loading/updating child records
        /// </summary>
        /// <param name="container"></param>
        /// <returns></returns>
        private BasePatientDataControl GetChildDataEntry(Control container)
        {
            return container.FindControl("ChildDataEntry") as BasePatientDataControl;
        }
    }


    #region DynamicControlContainer definition
    /// <summary>
    /// Wraps an ASP.NET control, and tries to figure out, based on the Control type, 
    /// how to "intelligently" render child controls.
    /// </summary>
    public class DynamicControlContainer
    {
        private Control container;

        public DynamicControlContainer(Control control)
        {
            container = control;
        }

        public void AddChildControl(Control child)
        {
            if (container is HtmlTable)
            {
                AddToTable((HtmlTable)container, child);
            }
            else
            {
                AddToGenericContainer(child);
            }
        }

        private void AddToTable(HtmlTable table, Control child)
        {
            HtmlTableRow row = new HtmlTableRow();
            HtmlTableCell cell = new HtmlTableCell();
            cell.Controls.Add(child);
            row.Cells.Add(cell);
            table.Rows.Add(row);
        }

        private void AddToGenericContainer(Control child)
        {
            container.Controls.Add(child);
            container.Controls.Add(new LiteralControl("<br/>"));
        }
    }
    #endregion
}
