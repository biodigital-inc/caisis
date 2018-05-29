using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Xml.Linq;
using System.Linq;

using Caisis.UI.ClientScript.JSON;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;

namespace Caisis.UI.Admin
{
    public partial class GetEform : AdminBasePage
    {
        // Client Methods
        protected static readonly string METHOD_GET_ITEMS = "getItems";
        protected static readonly string METHOD_GET_SECTION = "getSection";
        protected static readonly string METHOD_GET_SUB_SECTION = "getSubSection";

        protected static readonly string METHOD_SAVE_EFORM = "save";
        protected static readonly string METHOD_DELETE_EFORM = "delete";
        protected static readonly string METHOD_LOAD_EFORM = "load";
        protected static readonly string METHOD_PREVIEW_EFORM = "preview";

        private static readonly string DEFAULT_CONTROL_TYPE = typeof(CaisisTextBox).Name;

        /// <summary>
        /// Gets the "method" value passed in QueryString
        /// </summary>
        protected string QueryMethodName
        {
            get
            {
                return Request.QueryString["method"];
            }
        }

        /// <summary>
        /// Gets the "table" value passed in QueryString
        /// </summary>
        protected string QueryTable
        {
            get
            {
                return Request.Form["table"];
            }
        }

        /// <summary>
        /// Gets the POSTed JSON Eform object
        /// </summary>
        protected string POSTJSONEform
        {
            get
            {
                return Request.Form["eform"];
            }
        }

        /// <summary>
        /// Gets the POSTed Encrypted EFormId
        /// </summary>
        protected string POSTEFormId
        {
            get
            {
                return Request.Form["eformId"];
            }
        }

        protected string EPID
        {
            get
            {
                string epid = string.Empty;
                if (Session[SessionKey.PatientId] != null)
                {
                    epid = Security.CustomCryptoHelper.Encrypt(Session[SessionKey.PatientId].ToString());
                }
                return epid;
            }
        }

        public GetEform()
            : base()
        {
            this.Init += (a, b) =>
                {
                    // create sample blank form
                    _eform = new Eform();
                    EformPage page = new EformPage();
                    page.Sections = new EformSection[] { new EformSection() };
                    _eform.Pages = new EformPage[] { page };

                    // default eform id and JSON eform from client POST
                    EFormId.Value = POSTEFormId;
                    JSONData.Value = POSTJSONEform;

                    ProcessClientRequest();
                };
        }


        protected override void Page_Load(object sender, EventArgs e)
        {
           
        }

        /// <summary>
        /// Delegate approriate method based on client params
        /// </summary>
        private void ProcessClientRequest()
        {
            // determine method called
            if (!string.IsNullOrEmpty(QueryMethodName))
            {
                // with eform, process
                if (!string.IsNullOrEmpty(POSTJSONEform))
                {
                    Eform eform = GetEformObject(POSTJSONEform);
                    if (QueryMethodName == METHOD_SAVE_EFORM)
                    {
                        // insert eform data
                        SaveEForm(eform);
                    }
                    else if (QueryMethodName == METHOD_PREVIEW_EFORM)
                    {
                        PreviewEForm(eform);
                    }
                }
                else
                {
                    if (QueryMethodName == METHOD_LOAD_EFORM && !string.IsNullOrEmpty(POSTEFormId))
                    {
                        MetadataEForm biz = new MetadataEForm();
                        biz.Get(int.Parse(POSTEFormId));
                        BuildPageFromEForm(biz[MetadataEForm.EFormName].ToString());
                        EFormSectionPanel.Visible = true;
                    }
                    else if (QueryMethodName == METHOD_GET_ITEMS && !string.IsNullOrEmpty(QueryTable))
                    {
                        ToolboxPanel.Visible = true;
                        BuildToolboxItems(QueryTable);
                    }
                    else if (QueryMethodName == METHOD_GET_SECTION || QueryMethodName == METHOD_GET_SUB_SECTION)
                    {
                        BuildBlankPage();
                        EFormSectionPanel.Visible = true;
                    }
                    else if (QueryMethodName == METHOD_DELETE_EFORM)
                    {
                        DeleteEForm();
                    }
                }
            }
        }

        /// <summary>
        /// Builds a blank page with a single section
        /// </summary>
        private void BuildBlankPage()
        {
            // build page
            PageOne.BuildPage(_eform.Pages.First());
        }

        #region Builds EFORM Interface from exisitng db Eform

        /// <summary>
        /// Populates UI with page and its sections from db
        /// </summary>
        /// <param name="eformName"></param>
        private void BuildPageFromEForm(string eformName)
        {
            IEnumerable<XElement> metadataList = EformMetadata.GetMetadata(eformName, BuildPage, BuildSection, BuildSectionStatic);
            Action<BOL.BusinessObject, string, IDictionary<string, string>> addControl = AddControl;
            Action<Func<IEnumerable<IBusinessObject>>, Action<IBusinessObject>, IEnumerable<string>, XElement> addGrid =
                (f, a, c, x) => AddGrid(f, a, x);
            Action<string> doTransition = null;

            // add controls via bizo convert
            int? patientId;
            if (!string.IsNullOrEmpty(EPID))
            {
                string dpid = Security.CustomCryptoHelper.Decrypt(EPID);
                if (!string.IsNullOrEmpty(dpid))
                {
                    patientId = int.Parse(dpid);
                }
            }
            var bizos = BOL.BusinessObject.Convert(metadataList, addControl, addGrid, doTransition, null, null);

            _eform.Pages[0].Sections = pageSections.ToArray();
            PageOne.BuildPage(_eform.Pages[0]);
        }

        private Eform _eform;

        private void BuildPage(string pageTitle, int pageNumber)
        {
            EformPage page = new EformPage();
            page.Title = pageTitle;
            page.PageNumber = pageNumber;
            _eform.AddPage(page);
        }

        private List<EformSection> pageSections = new List<EformSection>();
        private void BuildSection(string sectionTitle, bool showSectionTitle, int numRows, int numColumns)
        {
            EformSection section = new EformSection();
            section.IsGrid = false;
            section.Title = sectionTitle;
            section.ShowTitle = showSectionTitle;
            pageSections.Add(section);
        }

        private void BuildSectionStatic(string sectionTitle, bool showSectionTitle, string sectionFileName)
        {
        }


        private void AddGrid(Func<IEnumerable<IBusinessObject>> datasource, Action<IBusinessObject> adder, XElement metadata)
        {
            string name = metadata.Name.LocalName;
            Dictionary<string, string> extensions =
                metadata.Attributes().ToDictionary(a => a.Name.LocalName, a => a.Value);

            // use extensions to find page#, section#, row#, column#
            int page = int.Parse(extensions["Page"]);
            int section = int.Parse(extensions["Section"]);
            int row = int.Parse(extensions["Row"]);
            int column = int.Parse(extensions["Column"]);

            int sectionIndex = section - 1;
            EformSection eformSection = pageSections.ElementAt(sectionIndex); ;
            //eformSection.Title = "Grid Section";
            //eformSection.ShowTitle = true;
            eformSection.IsGrid = true;

            // Add Fields To Sections
            var fieldList = metadata.DescendantNodes();

            for (int colIndex = 0; colIndex < fieldList.Count(); colIndex++)
            {
                XElement xNode = fieldList.ElementAt(colIndex) as XElement;
                string fieldName = xNode.Name.LocalName;
                string tableName = datasource().First().TableName;
                EformField field = GetField(tableName, fieldName, colIndex, 0);
                eformSection.AddField(field);
            }

            //AddControl(new Panel(), page, section, row, column);
        }



        private void AddControl(BOL.BusinessObject b, string fieldname, IDictionary<string, string> extensions)
        {
            int page = int.Parse(extensions["Page"]);
            int section = int.Parse(extensions["Section"]);
            int row = int.Parse(extensions["Row"]);
            int column = int.Parse(extensions["Column"]);
            int sectionIndex = section - 1;

            EformSection eFormSection = pageSections.ElementAt(sectionIndex);
            EformField field = GetField(b.TableName, fieldname, column, row);
            eFormSection.AddField(field);
        }

        private void AddControl(Control c, int page, int section, int row, int column)
        {
            // _eform.Pages[page-1].Sections[section-1].Fields = new 
            ///eformPages[page - 1].AddControlToSection(c, section - 1, row, column);
        }

        private EformField GetField(string tableName, string fieldName, int colIndex, int rowIndex)
        {
            string controlType = BusinessObject.HasControlType(tableName, fieldName) ? BusinessObject.GetControlType(tableName, fieldName) : DEFAULT_CONTROL_TYPE;
            EformField field = new EformField(tableName, fieldName, controlType);
            field.RowIndex = rowIndex;
            field.ColIndex = colIndex;

            return field;
        }

        #endregion



        #region INSERT Dynamic EForm From JSON EFORM

        /// <summary>
        /// Inserts the EForm object into DB
        /// </summary>
        /// <param name="eform"></param>
        private void SaveEForm(Eform eform)
        {
            // default version number
            string versionNumber = "0";
            // ??? version number used for active bit, on insert, turn on, on exisitng, use prvious value
            if (!string.IsNullOrEmpty(POSTEFormId))
            {
                MetadataEForm prevEform = new MetadataEForm();
                prevEform.Get(int.Parse(POSTEFormId));
                versionNumber = prevEform[MetadataEForm.EFormVersionNum].ToString();
            }
            EformMetadataBuilder builder = new EformMetadataBuilder(eform.Name, eform.Disease, versionNumber);
            foreach (EformPage page in eform.Pages)
            {
                builder.NewPage(page.Title, "1");
                for (int i = 0; i < page.Sections.Length; i++)
                {
                    EformSection section = page.Sections[i];
                    ProcessSection(builder, section, i);
                }
            }

            // after traversing, save
            builder.Save();

            // update eform id hidden

            // locate inserted record


            MetadataEForm biz = new MetadataEForm();
            // after save, if existing eform exists, remove duplicate
            if (!string.IsNullOrEmpty(POSTEFormId))// && POSTEFormId != EFormId.Value)
            {
                int eformId = int.Parse(POSTEFormId);
                biz.Delete(eformId);

                biz = GetEFormbyName(eform.Name);
                EFormId.Value = biz[MetadataEForm.MetadataEFormId].ToString();
                // set client message
                OperationMessage.Value = string.Empty;
            }
            else
            {
                biz = GetEFormbyName(eform.Name);
                EFormId.Value = biz[MetadataEForm.MetadataEFormId].ToString();
                // set client message
                OperationMessage.Value = string.Empty;
            }

        }

        /// <summary>
        /// Traverses a Section on nested child section, building INSERT
        /// </summary>
        /// <param name="builder"></param>
        /// <param name="section"></param>
        /// <param name="sectionIndex"></param>
        private void ProcessSection(EformMetadataBuilder builder, EformSection section, int sectionIndex)
        {
            // run date normalization
            NormalizeDateFields(section);
            // validate section
            bool isValid = AuditSectionFields(section);
            // continuing processing section and sub sections
            if (isValid)
            {

                if (section.IsGrid)
                {
                    if (section.Fields.Count() > 0)
                    {
                        string tableName = section.Fields[0].Table;
                        IEnumerable<string> gridFields = from f in section.Fields
                                                         where f.Table == tableName
                                                         select f.Field;
                        // all fields in section should have the same name
                        if (gridFields.Count() == section.Fields.Count())
                        {
                            // use first field in grid as base for generating ids
                            EformField baseField = section.Fields.First();
                            int recordId = GetRecordId(baseField.Table, baseField.Field, sectionIndex);
                            int parentRecordId = GetParentRecordId(baseField.Table, baseField.Field);
                            builder.NewGridSection(section.Title, section.ShowTitle, "1", tableName, gridFields, recordId, parentRecordId);
                        }
                    }

                }
                else
                {
                    int colCount = (from field in section.Fields
                                    select field.ColIndex).Distinct().Count();
                    int rowCount = (from field in section.Fields
                                    select field.RowIndex).Distinct().Count();

                    builder.NewSection(section.Title, section.ShowTitle, "1", rowCount, colCount);

                    // insert fields by col index, using colIndex + secitonIndex
                    // to generate unique seed for each column in each section
                    for (int colIndex = 0, seed = sectionIndex; colIndex < colCount; colIndex++, seed++)
                    {
                        // get list of fields in column
                        var colFields = from field in section.Fields
                                        where field.ColIndex == colIndex
                                        select field;
                        // insert fields
                        foreach (EformField field in colFields)
                        {
                            int recordId = GetRecordId(field.Table, field.Field, seed);
                            int parentRecordId = GetParentRecordId(field.Table, field.Field);
                            builder.AddFieldToSection(field.Table, field.Field, field.RowIndex, colIndex, recordId, parentRecordId);
                        }
                    }
                }
                // recursively process child sections
                if (section.ChildSections.Count() > 0)
                {
                    foreach (EformSection childSection in section.ChildSections)
                    {
                        ProcessSection(builder, childSection, sectionIndex);
                    }
                }
            }
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        private void DeleteEForm()
        {
            // validate eform id passed in FORM
            if (!string.IsNullOrEmpty(POSTEFormId))
            {
                int eformId = int.Parse(POSTEFormId);
                MetadataEForm biz = new MetadataEForm();
                biz.Delete(eformId);

                // update hidden field
                EFormId.Value = string.Empty;
                OperationMessage.Value = string.Empty;
            }
            else
            {
                // update hidden field
                EFormId.Value = POSTEFormId;
                OperationMessage.Value = "EFORM NOT DELETED, NO EFORM TO DELETE.";

            }
        }

        /// <summary>
        /// Previews EForm
        /// </summary>
        /// <param name="eform"></param>
        private void PreviewEForm(Eform eform)
        {
            PreviewPanel.Visible = true;
            // set eform title
            EFormName.Text = eform.Name;

            //PreviewEFormPage.BuildPage(eform.Pages[0]);
        }

        #region RecordId and ParentRecordId

        /// <summary>
        /// Used to generate RecordIds and ParentRecordIds
        /// </summary>
        private RecordIdGenerator KeyGenerator = new RecordIdGenerator();

        /// <summary>
        /// Gets record id based on Table and Field
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="field"></param>
        /// <param name="sectionIndex"></param>
        /// <returns></returns>
        private int GetRecordId(string tableName, string field, int sectionIndex)
        {
            return KeyGenerator.GetRecordId(tableName, field, sectionIndex);
        }

        /// <summary>
        /// Gets parent record id
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="field"></param>
        /// <returns></returns>
        private int GetParentRecordId(string tableName, string field)
        {
            return KeyGenerator.GetParentRecordId(tableName);
        }
        #endregion

        #region HELPERS

        /// <summary>
        /// Returns the most recent eform
        /// </summary>
        /// <param name="eformName"></param>
        /// <returns></returns>
        private MetadataEForm GetEFormbyName(string eformName)
        {
            var eforms = from eform in BOL.BusinessObject.GetByFields<MetadataEForm>(new Dictionary<string, object>() { { MetadataEForm.EFormName, eformName } })
                         select eform;
            if (eforms.Count() > 0)
            {
                return eforms.First();
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Returns an Eform object from its JSON representation
        /// </summary>
        /// <param name="JSON">the json string representation of an EForm</param>
        /// <returns></returns>
        private Eform GetEformObject(string JSON)
        {
            Eform eform = ObjectSerializer.InstanceFromJSON<Eform>(JSON);
            return eform;
        }

        #endregion

        #region Audit

        /// <summary>
        /// Runs an audit to verify all fields belong to the same table.
        /// </summary>
        /// <param name="section"></param>
        /// <returns></returns>
        private bool AuditSectionFields(EformSection section)
        {
            if (section.Fields.Count() > 0)
            {
                var tableNames = from f in section.Fields
                                 select f.Table;
                return tableNames.Distinct().Count() == 1;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// For the given seciton, insert Date fields to match DateTextFields
        /// </summary>
        /// <param name="section">An Eform Section</param>
        private void NormalizeDateFields(EformSection section)
        {
            var dateFields = from field in section.Fields
                             where field.Field.EndsWith("DateText")
                             let dateValueField = field.Field.Replace("DateText", "Date")
                             // only add date fields where exits
                             where BOL.BusinessObject.HasField(field.Table, dateValueField)
                             // create new eform field
                             let dateEformField = new EformField(field.Table, dateValueField, typeof(CaisisHidden).Name)
                             select dateEformField;
            // get a count of exisint columns
            int colCount = (from field in section.Fields
                            select field.ColIndex).Distinct().Count();
            // get count of existing rows
            int rowCount = (from field in section.Fields
                            select field.RowIndex).Distinct().Count();
            // add date fields to section
            for (int i = 0; i < dateFields.Count(); i++)
            {
                EformField dateField = dateFields.ElementAt(i);
                section.AddField(dateField);

                // grid date fields will be inserted at the end of last row
                if (section.IsGrid)
                {
                    dateField.RowIndex = rowCount - 1;
                    dateField.ColIndex = colCount + i;

                }
                // normal section fields will be inserted in a new row in first column
                else
                {
                    dateField.RowIndex = rowCount + i;
                    dateField.ColIndex = 0;
                }
            }

        }

        #endregion

        /// <summary>
        /// Builds the field list with a list of fields form a table
        /// </summary>
        /// <param name="tableName"></param>
        private void BuildToolboxItems(string tableName)
        {
            // get fields and metadata for table
            Caisis.DataAccess.MetadataDa da = new Caisis.DataAccess.MetadataDa();
            DataTable fieldMetadata = da.GetFieldsByTableName(tableName);
            // build a list of Eform fields by metadata
            IEnumerable<EformField> toolboxFields = from record in fieldMetadata.AsEnumerable()
                                                    let field = record[MetadataField.FieldName].ToString()
                                                    let controlType = BusinessObject.HasControlType(QueryTable, field) ? BusinessObject.GetControlType(QueryTable, field) : DEFAULT_CONTROL_TYPE
                                                    select new EformField(tableName, field, controlType);

            ToolboxList.BuildSectionFields(toolboxFields, true, false);
        }

        /// <summary>
        /// Generate RecordId and ParentRecordId for Dyanmic EForm nased on Table and Field
        /// </summary>
        internal class RecordIdGenerator
        {
            private static readonly string TAG_VALUE = "E";
            private static readonly string _RECORD_ID = "_RECORD_ID";
            private static Dictionary<string, Dictionary<string, string>> TableBaseDictionary = new Dictionary<string, Dictionary<string, string>>();
            private Dictionary<string, List<Dictionary<string, string>>> tableToRecords = new Dictionary<string, List<Dictionary<string, string>>>();

            public RecordIdGenerator()
            {

            }

            /// <summary>
            /// Returns RecordId of table
            /// </summary>
            /// <param name="table"></param>
            /// <param name="field"></param>
            /// <param name="seed"></param>
            /// <returns></returns>
            public int GetRecordId(string table, string field, int seed)
            {
                List<Dictionary<string, string>> bizList = GetList(table);
                Dictionary<string, string> last = bizList.Last();
                if (last[field] == string.Empty)
                {
                    last[field] = TAG_VALUE;
                }
                else
                {
                    last = Create(table);
                    last[field] = TAG_VALUE;
                    bizList.Add(last);
                }
                if (!last.ContainsKey(_RECORD_ID))
                {
                    last[_RECORD_ID] = (1 + seed).ToString();
                }
                int recordId = int.Parse(last[_RECORD_ID]);
                // RecordId = last entry+ seed, 
                // i.e., to ensure same table in differnt sections don't get same key

                //int recordId = bizList.Count();
                return recordId;
            }



            /// <summary>
            /// Returns a ParentRecordId based on last parent table's RecordId
            /// </summary>
            /// <param name="table"></param>
            /// <returns></returns>
            public int GetParentRecordId(string table)
            {
                // get parent table name
                string parentTable = BusinessObject.GetParentTablename(table);
                // ignore Patients table
                if (parentTable == "Patients")
                {
                    return 1;
                }
                else
                {
                    // get list for parent table
                    List<Dictionary<string, string>> bizList = GetList(parentTable);
                    // use the last entry for parent table and get record id
                    int parentRecordId = int.Parse(bizList.Last()[_RECORD_ID]);
                    return parentRecordId;
                }
            }

            /// <summary>
            /// 
            /// </summary>
            /// <param name="table"></param>
            /// <returns></returns>
            private Dictionary<string, string> Create(string table)
            {
                // create static dictionary reference instead of building instace on every call of table type
                if (!TableBaseDictionary.ContainsKey(table))
                {
                    Dictionary<string, string> entry = BusinessObjectFactory.BuildBusinessObject(table).FieldNames.ToDictionary(k => k, v => string.Empty);
                    TableBaseDictionary.Add(table, entry);
                }

                return new Dictionary<string, string>(TableBaseDictionary[table]);
            }

            /// <summary>
            /// 
            /// </summary>
            /// <param name="table"></param>
            /// <returns></returns>
            private List<Dictionary<string, string>> GetList(string table)
            {
                List<Dictionary<string, string>> bizList = null;
                if (!tableToRecords.ContainsKey(table))
                {
                    Dictionary<string, string> newEntry = Create(table);
                    bizList = new List<Dictionary<string, string>>();
                    bizList.Add(newEntry);
                    tableToRecords.Add(table, bizList);
                }
                else
                {
                    return tableToRecords[table];
                }
                return bizList;
            }
        }
    }
}