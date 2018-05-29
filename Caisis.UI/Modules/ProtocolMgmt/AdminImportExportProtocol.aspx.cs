using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.IO;
using System.IO.Compression;
using System.Text;

using Caisis.Data;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;
using Caisis.BOL;
using Caisis.Extensions;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminImportExportProtocol : ProtocolMgmtBaseAdminPage
    {
        private ProtocolMgmtServices service = new ProtocolMgmtServices();
        Caisis.Controller.PatientDataEntryController pdec = new Controller.PatientDataEntryController(null);

        protected string QueryProtocolId
        {
            get
            {
                return Request.QueryString["protocolId"];
            }
        }

        private bool IsExportProtocolMode
        {
            get
            {
                string export = Request.QueryString["export"];
                return !string.IsNullOrEmpty(export) && bool.Parse(export);
            }
        }

        private bool IsExportPatientsMode
        {
            get
            {
                string exportPatients = Request.QueryString["exportPatients"];
                return !string.IsNullOrEmpty(exportPatients) && bool.Parse(exportPatients);
            }
        }

        private string ExportMode
        {
            get
            {
                string mode = Request.QueryString["mode"];
                return mode + "";
            }
        }

        private bool IsPreviewMode
        {
            get
            {
                bool isPreview = ExportMode == "preview";
                return isPreview;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            // render full table <thead>,<tbody>
            DataPreview.DataBound += SetTableRender;
            ExportTableNames.DataBound += SetTableRender;
        }

        protected void SetTableRender(object sender, EventArgs e)
        {
            GridView table = sender as GridView;
            if (table.ShowHeader == true && table.Rows.Count > 0)
                table.HeaderRow.TableSection = TableRowSection.TableHeader;
            if (table.ShowFooter == true && table.Rows.Count > 0)
                table.FooterRow.TableSection = TableRowSection.TableFooter;

        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            // only Admin Users
            if (base.UserType != ProtocolMgmtUsers.ProtocolAdmin)
                Response.End();

            ErrorText.Text = "";

            if (!string.IsNullOrEmpty(ExportMode))
            {
                if (ExportMode == "export")
                {
                    ExportPanel.Visible = true;
                }
                else if (ExportMode == "import")
                {
                    ImportPanel.Visible = true;
                    // build protocol selection
                    if (!Page.IsPostBack)
                    {
                        // build protocol list
                        var emptyProtocol = new
                        {
                            Title = "--- Create New Protocol ---",
                            Value = ""
                        };
                        
                        var protocols = from row in Caisis.DataAccess.ProtocolMgmtDa.GetAllProtocols().AsEnumerable()
                                        let id = row[Protocol.ProtocolId].ToString()
                                        let num = row[Protocol.ProtocolNum].ToString()
                                        let title = row[Protocol.ProtocolTitle].ToString()
                                        let description = string.Format("{0} - {1}", num, title)
                                        select new
                                        {
                                            Title = PageUtil.GetTrimmedDescription(description, 40),
                                            Value = id
                                        };
                        var protocolsList = protocols.ToList();
                        protocolsList.Insert(0, emptyProtocol);
                        ProtocolSelection.DataSource = protocolsList;
                        ProtocolSelection.DataBind();
                    }
                }
                else if (IsPreviewMode)
                {
                    ExportPreviewPanel.Visible = true;
                    ExportProtocolPreviewPanel.Visible = IsExportProtocolMode;
                }
            }
            if (!Page.IsPostBack)
            {
                // validate protocol id
                if (!string.IsNullOrEmpty(QueryProtocolId))
                {
                    int protocolId = int.Parse(QueryProtocolId);
                    if (IsExportProtocolMode)
                    {
                        if (IsPreviewMode)
                        {
                            // build info
                            BuildProtocolExportInfo();

                            PreviewExportProtocol(protocolId);
                        }
                        else
                        {
                            ExportProtocol(protocolId);
                        }
                        return;
                    }
                    else if (IsExportPatientsMode)
                    {
                        // set export state
                        if (CanExportPatients())
                        {
                            ExportProtocolPatientsBtn.Enabled = true;
                            ExportProtocolPatientsBtn.Text = "Export Protocol Patients";
                        }
                        else
                        {
                            ExportProtocolPatientsBtn.Enabled = false;
                            ExportProtocolPatientsBtn.Text = "Export Not Enabled for this Trial";
                        }
                        if (IsPreviewMode)
                        {
                            // build info
                            BuildPatientExportInfo();

                            BuildExportTableFilters();
                            PreviewExportProtocolPatients(protocolId);
                        }
                        else
                        {
                            bool unmasked = UnmaskedCheck.Checked;
                            ExportProtocolPatients(protocolId, false, unmasked);
                        }
                        return;
                    }
                }


                BuildProtocols();
            }
        }

        private bool CanExportPatients()
        {
            int protocolId = int.Parse(QueryProtocolId);
            bool canExport = Caisis.Security.PermissionManager.HasPermission(Caisis.Security.PermissionManager.ExportData) && ProtocolMgmtUtil.EnablePatientExport(protocolId);
            return canExport;
        }

        /// <summary>
        /// Get a list of field filters for export
        /// </summary>
        private void BuildExportTableFilters()
        {
            int protocolId = int.Parse(QueryProtocolId);
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            bool unmaskDates = UnmaskedCheck.Checked;
            // get a list of tables and filters
            Dictionary<string, List<string>> filtersByTable = ProtocolMgmtServices.GetDataExportFilters(datasetSQL, protocolId, unmaskDates);
            IEnumerable<CaisisCheckBoxList> inputs = PageUtil.GetControls<CaisisCheckBoxList>(PatientPanel_Filters);
            // data bind checkbox lists to values
            foreach (CaisisCheckBoxList input in inputs)
            {
                if (filtersByTable.ContainsKey(input.Table))
                {
                    // tmp fix
                    input.PreRender += new CaisisEventHandler(input_PreRender);
                    input.DataSource = filtersByTable[input.Table];
                    input.DataBind();
                }
            }
            // static binding for Encounters filter
            string encountersTable = new BOL.Encounter().TableName;
            var encounterFields = from field in service.GetFieldNames(encountersTable)
                                  let name = field.Key
                                  let label = pdec.GetFieldLabel(encountersTable, name)
                                  orderby label ascending
                                  select new
                                   {
                                       FieldName = name,
                                       FieldLabel = label
                                   };

            Encounters_Filter.DataSource = encounterFields;
            Encounters_Filter.DataBind();
        }

        void input_PreRender(ICaisisInputControl sender, EventArgs e)
        {
            var input = sender as CaisisCheckBoxList;
            input.MaxLength = int.MaxValue;
        }

        #region PREVIEW

        /// <summary>
        /// Build a preview view of the Protocol export
        /// </summary>
        /// <param name="protocolId"></param>
        private void PreviewExportProtocol(int protocolId)
        {
            var protocolTree = from v in BusinessObject.GetByParent<ProtocolVersion>(protocolId)
                               let versionId = (int)v[ProtocolVersion.ProtocolVersionId]
                               let versionNum = v[ProtocolVersion.VersionNumber].ToString()
                               orderby (int)v[v.PrimaryKeyName] ascending
                               let schemas = BusinessObject.GetByParent<ProtocolSchema>(versionId)
                               let firstSchema = schemas.FirstOrDefault()
                               from schema in schemas
                               let schemaId = (int)schema[schema.PrimaryKeyName]
                               orderby (int)schema[schema.PrimaryKeyName] ascending
                               let isFirstSchema = schema == firstSchema
                               select new
                               {
                                   IsFirst = isFirstSchema,
                                   ProtocolVersionId = versionId,
                                   ProtocolSchemaId = schemaId,
                                   VersionNum = versionNum,
                                   ArmNumber = schema[ProtocolSchema.ProtocolArmNumber].ToString(),
                                   ArmDescription = schema[ProtocolSchema.ProtocolArmDescription].ToString()
                               };

            ExportProtocolControls.Visible = true;
            ExportProtocolBtn.Visible = true;

            SetProtocolTitle(protocolId);

            DataPreview.Visible = false;
            ExportProtocolGrid.Visible = true;

            ExportProtocolGrid.DataSource = protocolTree;
            ExportProtocolGrid.DataBind();
        }

        private void PreviewExportProtocolPatients(int protocolId)
        {
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            bool canViewIdentifiers = new Caisis.Controller.UserController().CanViewPatientIdentifiers();
            bool includeDeceased = ExportProtocolIncludeDeceased.Checked;
            bool unmaskedDates = UnmaskedCheck.Checked;

            // get all patients on protocol
            var allPatients = Caisis.DataAccess.ProtocolMgmtDa.GetPatientsByProtocol(protocolId, datasetSQL, canViewIdentifiers, includeDeceased);
            var eligiblePatients = ProtocolMgmtServices.GetEligibleProtocolExportPatients(datasetSQL, protocolId, unmaskedDates);
            // create view of data, validating exportable patients
            var exportPatientsView = from record in allPatients.AsEnumerable()
                                     let ptProtocolId = (int)record[PatientProtocol.PatientProtocolId]
                                     let patientId = (int)record["PatientId"]
                                     let name = record["Name"].ToString()
                                     let mrn = record["PtMRN"].ToString()
                                     let screeningId = record["PtProtocolScreeningId"].ToString()
                                     let studyId = record["PtProtocolStudyId"].ToString()
                                     let schemaId = record["ProtocolSchemaId"].ToString()
                                     let schema = GetSchemaName(schemaId)
                                     let eligibleRecord = eligiblePatients.Select(PatientProtocol.PatientProtocolId + " = " + ptProtocolId).FirstOrDefault()
                                     let isExportable = eligibleRecord != null
                                     let ptAge = isExportable ? eligibleRecord[PatientProtocolRegistration.PtRegistrationAge].ToString() : ""
                                     let passedScreeningDate = isExportable ? (DateTime?)eligibleRecord["PassedScreeningDate"] : null
                                     orderby name ascending// isExportable ? 0 : 1 ascending, studyId ascending
                                     select new
                                     {
                                         Exportable = isExportable ? "Yes" : "No",
                                         PatientId = patientId,
                                         Arm = schema,
                                         Name = name,
                                         MRN = mrn,
                                         RegistrationAge = ptAge,
                                         ScreeningId = screeningId,
                                         StudyId = studyId,
                                         PassedScreeningDate = string.Format("{0:d}", passedScreeningDate)
                                     };

            ExportProtocolPatientsControls.Visible = true;
            ExportProtocolPatientsBtns.Visible = true;

            // set count
            int totalPatientsCount = exportPatientsView.Count();
            int eligiblePatientsCount = exportPatientsView.Where(p => p.Exportable == "Yes").Count();
            ExportPatientCount.Text = string.Format("<b>{0}</b> of <b>{1}</b> patients eligible for export.", eligiblePatientsCount, totalPatientsCount);

            // build patient export preview
            DataPreview.DataKeyNames = new string[] { Patient.PatientId };
            DataPreview.DataSource = exportPatientsView;
            DataPreview.DataBind();
            DataPreview.Columns[0].Visible = true;

            // build patient export tables
            var exportTableNames = from table in ProtocolMgmtServices.GetPatientTableNames()
                                   let label = pdec.GetTableLabel(table)
                                   orderby table == "Patients" ? 0 : 1 ascending, label ascending
                                   select new
                                   {
                                       TableName = table,
                                       TableLabel = string.Format("{0} [{1}]", label, table)
                                   };
            ExportTableNames.DataSource = exportTableNames;
            ExportTableNames.DataBind();

            // set header
            SetProtocolTitle(protocolId);

            // set dataset
            var dataset = new BOL.Dataset();
            dataset.Get(int.Parse(Session[SessionKey.DatasetId].ToString()));
            string datasetName = dataset[BOL.Dataset.DatasetName].ToString();
            CurrentDataset.Text = datasetName;

            // set filter text
            MaskedDatesPanel.Visible = !unmaskedDates;
            UnmaskedDatesPanel.Visible = unmaskedDates;
        }

        private string GetSchemaName(string protocolSchemaId)
        {
            if (!string.IsNullOrEmpty(protocolSchemaId))
            {
                int schemaId = int.Parse(protocolSchemaId);
                ProtocolSchema biz = new ProtocolSchema();
                biz.Get(schemaId);

                return biz[ProtocolSchema.ProtocolArmDescription].ToString();
            }
            return "";
        }

        /// <summary>
        /// Build a list of Protocols (only those with schemas)
        /// </summary>
        private void BuildProtocols()
        {
            var protocols = Caisis.DataAccess.ProtocolMgmtDa.GetAllProtocols().DefaultView;
            protocols.Sort = Protocol.ProtocolNum + " ASC";
            protocols.RowFilter = "SchemaCount > 0";
            ProtocolList.DataSource = protocols;
            ProtocolList.DataBind();
        }

        protected void PreviewClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ProtocolList.Value))
            {
                int protocolId = int.Parse(ProtocolList.Value);
                BuildVersions(protocolId);
                PreviewListing.Visible = true;
            }
        }

        private void BuildVersions(int protocolId)
        {
            SetProtocolTitle(protocolId);

            var versions = BusinessObject.GetByParentAsDataView<ProtocolVersion>(protocolId);
            VersionsRptr.DataSource = versions;
            VersionsRptr.DataBind();
        }

        protected void BuildSchemas(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var versionId = (int)DataBinder.Eval(e.Item.DataItem, ProtocolVersion.ProtocolVersionId);
                var schemas = BusinessObject.GetByParentAsDataView<ProtocolSchema>(versionId);
                var rptr = e.Item.FindControl("SchemasRptr") as Repeater;
                rptr.DataSource = schemas;
                rptr.DataBind();
            }
        }

        protected void BuildSchemasItems(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var schamaId = (int)DataBinder.Eval(e.Item.DataItem, ProtocolSchema.ProtocolSchemaId);
                var schemaItems = BusinessObject.GetByParentAsDataView<SchemaItem>(schamaId);
                var rptr = e.Item.FindControl("SchemaItemsRptr") as Repeater;
                rptr.DataSource = schemaItems;
                rptr.DataBind();
            }
        }

        protected void SetExportRow(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (IsExportPatientsMode)
                {
                    bool exportable = DataBinder.Eval(e.Row.DataItem, "Exportable").ToString() == "Yes";
                    CheckBox exportCheck = e.Row.FindControl("ExportCheckBox") as CheckBox;
                    if (exportable)
                    {
                        e.Row.CssClass = "activeRow";
                        exportCheck.Enabled = true;
                        //exportCheck.Checked = true;
                    }
                    else
                    {
                        exportCheck.Enabled = false;
                        exportCheck.Checked = false;
                    }

                }
            }
        }

        protected void SetCheckboxValues(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string tableName = DataBinder.Eval(e.Row.DataItem, "TableName").ToString();
                string tableLabel = DataBinder.Eval(e.Row.DataItem, "TableLabel").ToString();
                var input = e.Row.FindControl("TableCheckBox") as HtmlInputCheckBox;
                var label = e.Row.FindControl("TableNameLabel") as Label;
                input.Value = tableName;
                label.Text = tableLabel;
                // check all by default
                input.Checked = true;
                // disable: special case
                if (tableName == "Patients")
                    input.Disabled = true;
                // inputs which have optional check box filters
                if (this.FindControl(tableName + "_Filter") != null)
                    input.Attributes["class"] = "filterable";
            }
        }

        protected void SetCheckAll(object sender, EventArgs e)
        {
            if (sender is ListControl)
            {
                var list = sender as ListControl;
                foreach (ListItem item in list.Items)
                    item.Selected = true;
            }
        }

        #endregion

        #region EXPORT

        protected void ExportProtocolClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QueryProtocolId))
            {
                int protocolId = int.Parse(QueryProtocolId);
                ExportProtocol(protocolId);
            }
        }

        protected void ExportProtocolPatientsClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QueryProtocolId))
            {
                int protocolId = int.Parse(QueryProtocolId);
                bool validate = ExportProtocolPatientsValidate.Checked;
                bool unmasked = UnmaskedCheck.Checked;
                ExportProtocolPatients(protocolId, validate, unmasked);
            }
        }

        protected void PreviewProtocolPatientsClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QueryProtocolId))
            {
                int protocolId = int.Parse(QueryProtocolId);
                PreviewExportProtocolPatients(protocolId);
            }
        }

        protected void ExportProtocolPatientsXSDClick(object sender, EventArgs e)
        {
            XDocument patientXSD = service.GetPatientProtocolSchema();
            string fileName = "ProtocolPatientSchema.xsd";
            WriteXDocument(patientXSD, fileName);
        }

        /// <summary>
        /// Exports the Protocol, Versions, Schemas and related items
        /// </summary>
        /// <param name="protocolId"></param>
        private void ExportProtocol(int protocolId)
        {
            // get optional filters
            List<int> protocolVersionIds = new List<int>();
            foreach (GridViewRow row in ExportProtocolGrid.Rows)
            {
                CheckBox cb = row.FindControl("Exportable") as CheckBox;
                int versionId = int.Parse((row.FindControl("ProtocolVersionId_Field") as HiddenField).Value);
                if (cb.Visible && cb.Checked)
                {
                    protocolVersionIds.Add(versionId);
                }
            }
            // TODO: ProtocolAdmin can export or explicit permission ???
            Protocol protocol = new Protocol();
            protocol.Get(protocolId);
            string fileName = GetExportFileName(protocol, "Protocol");
            // build restrictions
            Dictionary<string, IEnumerable<int>> keyRestrictions = new Dictionary<string, IEnumerable<int>>();
            keyRestrictions.Add("ProtocolMgr_ProtocolVersions", protocolVersionIds);
            XDocument exportDocument = BOL.ProtocolMgmtServices.ExportProtocol(protocolId, keyRestrictions);
            // output
            WriteXDocument(exportDocument, fileName);
        }

        private void ExportProtocolPatients(int protocolId, bool validateAgainstSchema, bool unmasked)
        {
            int userLoginId = (int)Session[SessionKey.LoginId];
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            // validate permission
            try
            {
                if (CanExportPatients())
                {
                    // write export file
                    Protocol protocol = new Protocol();
                    protocol.Get(protocolId);
                    string fileName = GetExportFileName(protocol, "ProtocolPatients");

                    // export patients
                    var patients = GetExportPatients();
                    var table_names = GetExportTables();
                    var table_restrictions = GetExportTableRestrictions(table_names);
                    var table_fields = new Dictionary<string, IEnumerable<string>>();
                    // add xml element restrictions
                    var encounter_fields = GetEncounterFields();
                    if (encounter_fields.Count() > 0)
                        table_fields.Add(new BOL.Encounter().TableName, encounter_fields);

                    BeginWriteXml(fileName);

                    XmlWriterSettings settings = new XmlWriterSettings();
                    settings.Encoding = new UTF8Encoding(false);
                    settings.Indent = true;
                    settings.IndentChars = "\t";
                    XmlWriter writer = XmlWriter.Create(Response.OutputStream, settings);
                    bool exportOK = false;
                    try
                    {
                        service.ExportProtocolPatients(writer, datasetSQL, userLoginId, protocolId, patients, table_names, table_restrictions, table_fields, unmasked);
                        exportOK = true;
                        // log export
                        Caisis.Controller.ReportController.LogReportView("Protocol Patient Export", new Dictionary<string, string> { { Protocol.ProtocolId, protocolId.ToString() } });
                    }
                    catch (Exception ex)
                    {
                        exportOK = false;
                    }
                    Response.OutputStream.Close();
                    if (exportOK)
                    {
                        EndWriteXml();
                    }
                    else
                    {
                        throw new ClientException("Error export patients.");
                    }
                    //// validate
                    //if (exportOK && validateAgainstSchema)
                    //{
                    //    var errors = service.ValidatePatientProtocolSchema(xPatientsDocument);
                    //    if (errors.Count() > 0)
                    //    {
                    //        string errorMessages = string.Join("<br/>", errors.ToArray());
                    //        throw new ClientException("Failed to export, does not validate against XSD.<br />" + errorMessages);
                    //    }
                    //}
                }
                else
                {
                    throw new ClientException("No ExportData permission");
                }
            }
            catch (ClientException ex)
            {
                Response.Write(ex.Message);
            }
            catch (Exception ex)
            {
                ExceptionHandler.Publish(ex);
            }
        }

        #endregion

        #region IMPORT

        protected void ImportClick(object sender, EventArgs e)
        {
            XDocument xDoc = null;
            var file = FileUploadBtn.PostedFile;
            // attempt to read uploaded file
            if (file != null)
            {
                int fileLen = file.ContentLength;
                string fileExtension = System.IO.Path.GetExtension(file.FileName).ToLower();
                // validate ???
                try
                {
                    if (file.ContentType == "text/xml")
                    {
                        // load POSTed XML file
                        var reader = new System.IO.StreamReader(file.InputStream);
                        xDoc = XDocument.Load(reader);
                    }
                }
                catch (Exception ex)
                {
                }
            }
            if (xDoc == null)
            {
                ErrorText.Text = "Error processing the file, please verify it is a valid Protocol XML Mapping.";
            }
                // import
            else
            {
                // get optional existing Protocol
                int? existingProtocolId = null;
                if (!string.IsNullOrEmpty(ProtocolSelection.Value))
                    existingProtocolId = int.Parse(ProtocolSelection.Value);

                ImportProtocol(xDoc, existingProtocolId);
            }
        }

        private void ImportProtocol(XDocument xDoc, int? existingProtocolId)
        {
            try
            {
                // import data
                string[] validateFields = ValidationFields.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Value).ToArray();
                string error = "";
                var importedData = BOL.ProtocolMgmtServices.ImportProtocol(xDoc, existingProtocolId, out error, validateFields);
                if (!string.IsNullOrEmpty(error))
                    throw new ClientException(error);
                DisplayResults(importedData);

                // register update script
                var protocols = importedData.OfType<Protocol>();
                if (protocols.Count() > 0)
                {
                    Protocol protocol = protocols.First();
                    int protocolId = (int)protocol[Protocol.ProtocolId];
                    string protocolTitle = PageUtil.EscapeSingleQuotes(protocol[Protocol.ProtocolTitle].ToString());
                    string protocolNum = PageUtil.EscapeSingleQuotes(protocol[Protocol.ProtocolNum].ToString());
                    string url = base.GetQueryString(Page.ResolveUrl("AdminProtocol.aspx"), protocolId.ToString(), "", "", false);
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "refreshMainList", "refreshMainList('" + url + "', '" + protocolTitle + "', '" + protocolNum + "')", true);
                }
            }
            catch (ClientException ex)
            {
                ErrorText.Text = ex.Message;
            }
            catch (Exception ex)
            {
                ErrorText.Text = "Error processing the file, please verify it is a valid Protocol XML Mapping.";
            }
        }

        private void DisplayResults(IEnumerable<BusinessObject> importedData)
        {

        }

        #endregion

        private void BuildProtocolExportInfo()
        {
        }

        private void BuildPatientExportInfo()
        {
            Dictionary<string, IEnumerable<string>> dataSource = new Dictionary<string, IEnumerable<string>>
            {
                 { "Exclude tables: ", ProtocolMgmtServices.NO_EXPORT_PATIENT_TABLES.Select(t=> !string.IsNullOrEmpty(pdec.GetTableLabel(t))?pdec.GetTableLabel(t):t) },
                 { "Exclude fields ending with: ", ProtocolMgmtServices.NO_EXPORT_ENDS_WITH_FIELDS },
                 { "Exclude fields containing: ", ProtocolMgmtServices.NO_EXPORT_CONTAIN_FIELDS },
                 { "Include statuses:  ", ProtocolMgmtServices.INCLUDED_STATUSES }
            };
            PatientExportInfoRptr.DataSource = dataSource;
            PatientExportInfoRptr.DataBind();
        }

        private void SetProtocolTitle(int protocolId)
        {
            Protocol protocol = new Protocol();
            protocol.Get(protocolId);
            string protocolTitle = protocol[Protocol.ProtocolTitle].ToString();
            string protocolNum = protocol[Protocol.ProtocolNum].ToString();

            ProtocolNum.Text = protocolNum + ": ";
            ProtocolTitle.Text = protocolTitle;
        }

        /// <summary>
        /// Gets a friendly download name for the protocol export
        /// </summary>
        /// <param name="protocol"></param>
        /// <param name="prefix"></param>
        /// <returns></returns>
        private string GetExportFileName(Protocol protocol, string prefix)
        {
            string protocolNum = protocol[Protocol.ProtocolNum].ToString();
            string fileName = string.Format("{0}_{1}", prefix, protocolNum);
            // cleanup
            fileName = Server.UrlEncode(fileName.Replace(" ", "").Trim()) + ".xml";
            return fileName;
        }

        private void WriteXDocument(XDocument xDoc, string fileName)
        {
            BeginWriteXml(fileName);
            xDoc.Save(Response.Output);
            EndWriteXml();
        }

        private void BeginWriteXml(string fileName)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.ContentType = "text/xml";
            Response.Charset = string.Empty;
        }

        private void EndWriteXml()
        {
            Response.End();
        }

        #region utilities

        /// <summary>
        /// Returns a list of tables to export
        /// </summary>
        /// <returns></returns>
        private IEnumerable<string> GetExportTables()
        {
            foreach (GridViewRow row in ExportTableNames.Rows)
            {
                HtmlInputCheckBox cb = row.FindControl("TableCheckBox") as HtmlInputCheckBox;
                string tableName = cb.Value;
                if (cb.Checked)
                    yield return tableName;
            }
        }

        private Dictionary<string, List<Dictionary<string, object>>> GetExportTableRestrictions(IEnumerable<string> tables)
        {
            int protocolId = int.Parse(QueryProtocolId);
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            bool unmaskDates = UnmaskedCheck.Checked;
            // get a list of tables and filters
            Dictionary<string, List<string>> filtersByTable = ProtocolMgmtServices.GetDataExportFilters(datasetSQL, protocolId, unmaskDates);
            Dictionary<string, List<Dictionary<string, object>>> tableToListOfRestrictions = new Dictionary<string, List<Dictionary<string, object>>>();
            IEnumerable<CaisisCheckBoxList> inputs = PageUtil.GetControls<CaisisCheckBoxList>(PatientPanel_Filters);
            IEnumerable<string> formKeys = Request.Form.Keys.Cast<string>();
            foreach (CaisisCheckBoxList input in inputs)
            {
                string formInputName = input.Table + "_Filter";
                string[] formExcludeNames = new string[] { input.Table + "_FilterCheckBox", input.Table + "_FilterTextBoxKey" };
                // check for values POSTed
                int selectedCount = formKeys.Where(k => k.StartsWith(formInputName)).Except(formExcludeNames).Count();
                bool addRestriction = filtersByTable.ContainsKey(input.Table) && selectedCount > 0 ? filtersByTable[input.Table].Count() != selectedCount : false;
                // manually add each restriction if 1-(n-1) items selected
                if (addRestriction)
                {
                    string table = input.Table;
                    string field = input.Field;
                    string[] field_filters = input.ValueList;
                    if (field_filters.Length > 0)
                    {
                        if (tables.Contains(table))
                        {
                            var filterList = new List<Dictionary<string, object>>();
                            foreach (string field_filter in field_filters)
                            {
                                filterList.Add(new Dictionary<string, object> { { field, field_filter } });
                            }
                            tableToListOfRestrictions.Add(table, filterList);
                        }
                    }
                }
            }
            return tableToListOfRestrictions;
        }

        private IEnumerable<string> GetEncounterFields()
        {
            return Encounters_Filter.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Value);
        }

        /// <summary>
        /// Return a list of patients to be exported
        /// </summary>
        /// <returns></returns>
        private IEnumerable<int> GetExportPatients()
        {
            if (IsExportPatientsMode)
            {
                foreach (GridViewRow row in DataPreview.Rows)
                {
                    int patientId = (int)DataPreview.DataKeys[row.RowIndex][Patient.PatientId];
                    CheckBox cb = row.FindControl("ExportCheckBox") as CheckBox;
                    if (cb.Enabled && cb.Checked)
                    {
                        yield return patientId;

                    }
                }
            }
        }

        #endregion

    }
}
