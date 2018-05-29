using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Linq;
using System.Reflection;

using Caisis.Controller;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.Extensions;


/// <summary>
/// CICHelper contains static methods to set Caisis Input Control properties 
/// </summary>
public class CICHelper
{
    protected CICHelper() { } // bas: replaced static class keyword to allow for subclassing elsewhere

    // TODO : DOCUMENT WHAT ALL THESE ATTRIBUTES DO: PUT IN ATTRIBUTES DESC FIELD IN DB

    # region private members

    /// <summary>
    /// A list of fields which are supressed from create ICaisisInputControl instances
    /// </summary>
    private static readonly string[] SUPRESS_FIELD_NAMES = new string[] 
        {
            "FieldSuppress",
            "EnteredBy",
            "EnteredTime",
            "UpdatedBy",
            "UpdatedTime",
            "LockedBy",
            "LockedTime",
        };

    // These strings MUST match the AttributeName stored in the metadata schema
    private const string CONTROLTYPE = "ControlType";
    private const string REQUIRED = "Required";
    //private const string VISIBLE = "Visible";
    private const string READONLY = "ReadOnly";
    private const string MAXLENGTH = "MaxLength";

    // will be language based and dependent on culture specified in web.config
    private const string DESCRIPTION = "FieldDescription";
    private const string LABEL = "FieldLabel";

    private const string LOOKUPCODE = "LookupCode";
    private const string LOOKUPDISTINCT = "LookupDistinct";
    private const string CASCADEVALUESBASEDON = "CascadeValuesBasedOn";
    private const string CASCADEFORMATSTRING = "CascadeFormatString";
    private const string SHOWCALENDAR = "ShowCalendar";
    private const string CALCDATE = "CalcDate";
    private const string SHOWNUMBERPAD = "ShowNumberPad";
    private const string DISPLAYCALCULATEDDATE = "DisplayCalculatedDate";
    private const string FIELDWIDTH = "FieldWidth";
    private const string SHOWTEXTEDITOR = "ShowTextEditor";
    private const string SHOWICDWIZARD = "ShowICDWizard"; // 4.2
    private const string DISPLAYHIDDENVALUE = "DisplayHiddenValue";

    // styles
    private const string REQUIREDLABELCLASS = "pdFormFieldLabelRequired"; // from GlobalStyless.css
    private const string LABELCLASS = "pdFormFieldLabel";

    // javascript
    private const string JSONCLICK = "jsOnClick";
    private const string JSONBLUR = "jsOnBlur";
    private const string JSONSELECTEDINDEXCHANGED = "jsOnSelectedIndexChanged";

    # endregion

    # region helper methods used on render of caisis input controls

    //// showing label is true/displayed by default;
    //public static void RenderFieldLabel(bool showLabel, string labelText, HtmlTextWriter writer, bool isRequired)
    //{
    //    Label cicLabel = new Label();

    //    cicLabel.Text = labelText + "&nbsp;";

    //    if (isRequired)
    //    {
    //        cicLabel.CssClass = REQUIREDLABELCLASS;
    //    }
    //    else
    //    {
    //        cicLabel.CssClass = LABELCLASS;
    //    }
    //    cicLabel.RenderControl(writer);
    //}


    // showing label is true/displayed by default;
    public static void RenderFieldLabel(bool showLabel, string labelText, HtmlTextWriter writer, bool isRequired, bool showBubble, string helpDescription, string labelClass)
    {
        Label cicLabel = new Label();
        // Added - AC to align textarea text to top,
        // other fields will align with field (textbox,select,etc...)
        cicLabel.Style.Add(HtmlTextWriterStyle.VerticalAlign, "top");
        cicLabel.Text = labelText + "&nbsp;";

        if (!String.IsNullOrEmpty(labelClass))
        {
            cicLabel.CssClass = labelClass; //override default class for label if 
        }
        else if (isRequired)
        {
            cicLabel.CssClass = REQUIREDLABELCLASS;
        }
        else
        {
            cicLabel.CssClass = LABELCLASS;
        }

        if (showBubble != false && helpDescription != null && helpDescription.Length > 0)
        {
            string safeHelpDescription = helpDescription.Replace("'", "\\'");
            cicLabel.Attributes.Add("onmouseover", "showToolTipMessage('" + safeHelpDescription + "');");
            cicLabel.Attributes.Add("onmouseout", "hideToolTip();");

        }

        if (showLabel)
        {
            cicLabel.RenderControl(writer);
        }
    }



    //// showBubble label is true/displayed by default;
    //public static void RenderHelpBubble(bool showBubble, string helpDescription, HtmlTextWriter writer)
    //{
    //    if (showBubble != false && helpDescription != null && helpDescription.Length > 0)
    //    {
    //        Label bubbleDescription = new Label();
    //        bubbleDescription.ToolTip = helpDescription;
    //        bubbleDescription.RenderControl(writer);
    //    }
    //}

    # endregion

    /// <summary>
    /// Creates a new instance of an ICaisisInputControl by specificed type
    /// </summary>
    /// <param name="controlType"></param>
    /// <returns></returns>
    public static ICaisisInputControl InvokeInputControl(string controlType)
    {
        switch (controlType)
        {
            case "CaisisTextBox":
                CaisisTextBox ctb = new CaisisTextBox();
                return ctb;

            case "CaisisTextArea":
                CaisisTextArea cta = new CaisisTextArea();
                return cta;

            case "CaisisHidden":
                CaisisHidden ch = new CaisisHidden();
                return ch;

            case "CaisisSelect":
                CaisisSelect cs = new CaisisSelect();
                return cs;

            case "CaisisComboBox":
                CaisisComboBox cb = new CaisisComboBox();
                return cb;

            case "CaisisRadioButton":
                CaisisRadioButton crb = new CaisisRadioButton();
                return crb;

            case "CaisisRadioButtonList":
                CaisisRadioButtonList crbl = new CaisisRadioButtonList();
                return crbl;
            case "CaisisCheckBoxList":
                CaisisCheckBoxList ccbl = new CaisisCheckBoxList();
                return ccbl;
            case "CaisisExtendedRadioButtonList":
                CaisisExtendedRadioButtonList cerbl = new CaisisExtendedRadioButtonList();
                return cerbl;
            case "CaisisCheckBox":
                CaisisCheckBox ccb = new CaisisCheckBox();
                return ccb;
            case "CaisisExtendedCheckBoxList":
                CaisisExtendedCheckBoxList ecbl = new CaisisExtendedCheckBoxList();
                return ecbl;
            default:
                throw new Exception(String.Format("Caisis Input Control type {0} not yet implemented", controlType));
        }
    }

    /// <summary>
    /// Dynamically adds a CaisisGridView to the parent container, setting fields attributes using current disease view.
    /// </summary>
    /// <param name="patientDataControl">The parent container.</param>
    /// <param name="bizos">The list of BizObjects representing the grid's tabular data source.</param>
    /// <param name="tableName">The name of the table represented by the grid.</param>
    /// <returns>A reference to added CaisisGridView</returns>
    public static CaisisGridView AddGridViewByTableName(BasePatientDataControl patientDataControl, IEnumerable<Caisis.BOL.IBusinessObject> bizos, string tableName)
    {		 
        // build grid using current disease
        DiseaseController dc = new DiseaseController();
        string disease = dc.GetDiseaseView();
        return AddGridViewByTableName(patientDataControl, bizos, tableName, disease);
    }

    /// <summary>
    /// Dynamically adds a CaisisGridView to the parent container, setting fields attributes using the specified disease.
    /// NOTE: NULL or empty disease value will use DEFAULT metadata.
    /// </summary>
    /// <param name="patientDataControl">The parent container.</param>
    /// <param name="bizos">The list of BizObjects representing the grid's tabular data source.</param>
    /// <param name="tableName">The name of the table represented by the grid.</param>
    /// <param name="disease">The disease view used for metadata lookup.</param>
    /// <returns>A reference to added CaisisGridView</returns>
    public static CaisisGridView AddGridViewByTableName(BasePatientDataControl patientDataControl, IEnumerable<Caisis.BOL.IBusinessObject> bizos, string tableName, string disease)
    {
        // get current configuration
        PatientDataEntryController pdec = new PatientDataEntryController(disease);
        int blankGridRows = pdec.GetTotalBlankGridRows(tableName);
        int displayableBlankGridRows = pdec.GetVisibleBlankGridRows(tableName);
        // get metadata
        var tableFieldsMetadata = pdec.GetTableFieldsMetadata(tableName);

        return AddGridViewByTableName(patientDataControl, bizos, tableName, blankGridRows, displayableBlankGridRows, tableFieldsMetadata);
    }

    /// <summary>
    /// Dynamically adds a CaisisGridView to the parent container, setting fields attributes using the field metadata.
    /// </summary>
    /// <param name="patientDataControl">The parent container</param>
    /// <param name="bizos">The list of BizObjects representing the grid's tabular data source</param>
    /// <param name="tableName">The name of the table represented by the grid.</param>
    /// <param name="blankGridRows">The number to total blank rows</param>
    /// <param name="displayableBlankGridRows">The number of inital blank rows</param>
    /// <param name="tableFieldsMetadata">A lookup for field names and associated field metadata</param>
    /// <returns>A reference to added CaisisGridView</returns>
    public static CaisisGridView AddGridViewByTableName(BasePatientDataControl patientDataControl, IEnumerable<Caisis.BOL.IBusinessObject> bizos, string tableName, int blankGridRows, int displayableBlankGridRows, Dictionary<string, Dictionary<string, string>> tableFieldsMetadata)
    {
        var bizo = bizos.First();
        // Create a container for holding our Grid and for expanding/colapsing via javascript
        Panel gridHolder = new Panel();
        gridHolder.ID = bizo.TableName + "SectionHolder";
        gridHolder.CssClass = "PDSectionHolder";
        //gridHolder.Style.Add("position", "relative");
        gridHolder.Style.Add("padding", "5px");
        gridHolder.Style.Add("width", "auto");

        // Create Data Source for our GridView
        CustomObjectDataSource gridDataSource = new CustomObjectDataSource(bizos);
        gridDataSource.ID = bizo.TableName + "_ODS";
        gridDataSource.SelectMethod = "GetTable";
        gridDataSource.InsertMethod = "Save";
        gridDataSource.UpdateMethod = "Save";
        gridDataSource.DeleteMethod = "Delete";

        // Create the GridView and set default property values
        CaisisGridView customGridView = new CaisisGridView();
        customGridView.ID = bizo.TableName + "_CGV"; // THIS ID REFERENCED IN PATIENTDATAENTRY SO DO NOT CHANGE
        customGridView.AutoGenerateColumns = false;
        customGridView.DataSourceID = gridDataSource.ID;
        customGridView.Visible = true;
        customGridView.AllowSorting = false;
        customGridView.AllowPaging = false;
        customGridView.HorizontalAlign = HorizontalAlign.Center;
        customGridView.EditButtonID = "EditBtn";

        // Set the total blank rows to render, and set the number of rows to display on render
        customGridView.TotalBlankRows = blankGridRows;
        customGridView.VisibleBlankRows = displayableBlankGridRows;
        // Add columns/templated fields based on MetaData

        // get all fields with metadata
        AddColumnsToGrid(bizo, customGridView, tableFieldsMetadata);


        //MetadataDa da = new MetadataDa();
        //DataTable attributesDt = da.GetFieldMetadataByTableName(tableName);
        //AddColumnsToGrid(bizo, customGridView, attributesDt);

        // Create an ImageButton which is used to add new rows to our grid
        ImageButton addNewRowBtn = new ImageButton();
        addNewRowBtn.ImageUrl = "~/Images/DataGridAddNewRow.gif";
        addNewRowBtn.ID = customGridView.ID + "_NewRow";
        addNewRowBtn.CssClass = "dataGridImageButton";
        customGridView.AddButtonId = addNewRowBtn.ID;

        // Add DataSource and Grid Holder to DataEntry Container
        patientDataControl.Controls.Add(gridHolder);
        patientDataControl.Controls.Add(gridDataSource);

        // Add Grid and Add Button to our Holder
        gridHolder.Controls.Add(customGridView);
        gridHolder.Controls.Add(addNewRowBtn);

        // Special javascript attached to add new row button,
        // needs to be set after controls have been added to container
        // as ClientID is based upon container
        addNewRowBtn.PreRender += (a, b) =>
        {
            addNewRowBtn.OnClientClick = "var grid= document.getElementById('" + customGridView.ClientID + "'); if(grid.showNextRow) {return grid.showNextRow(); } else { return true; }";
        };

        // add audit fields info
        customGridView.AuditTable = bizo.TableName;
         
        // Finally, we bind our grid
        customGridView.DataBind();

        // return a reference to newly created grid
        return customGridView;
    }

    ///// <summary>
    ///// Adds columns to grid based on meta tables
    ///// </summary>
    ///// <param name="biz">The biz object instance to use as datasource</param>
    ///// <param name="grid">The GridView instance</param>
    ///// <param name="attributesDt">optional meta data table for setting grid cic input control properties</param>
    //private static void AddColumnsToGrid(Caisis.BOL.IBusinessObject biz, GridView grid, DataTable attributesDt)
    //{
    //    // partition table metadata by field
    //    Dictionary<string, Dictionary<string, string>> fieldLookup = new Dictionary<string, Dictionary<string, string>>();
    //    if (attributesDt != null)
    //    {
    //        fieldLookup = (from row in attributesDt.AsEnumerable()
    //                       let field = row[MetadataField.FieldName].ToString()
    //                       group row by field into g
    //                       select new
    //                       {
    //                           Field = g.Key,
    //                           Metadata = GetFieldAttributeLookup(g, g.Key).ToDictionary(a => a.Key, a => a.Value)
    //                       }).ToDictionary(a => a.Field, a => a.Metadata, StringComparer.OrdinalIgnoreCase);

    //    }
    //    AddColumnsToGrid(biz, grid, fieldLookup);
    //}

    /// <summary>
    /// Adds a list of columns based on field and field metadata
    /// </summary>
    /// <param name="biz">The BizObject representing the table containing column fields</param>
    /// <param name="grid">The GridView instance to add columns to</param>
    /// <param name="tableFieldsMetadata">The lookup of fields to field metadata</param>
    private static void AddColumnsToGrid(Caisis.BOL.IBusinessObject biz, GridView grid, Dictionary<string, Dictionary<string, string>> tableFieldsMetadata)
    {
        grid.Columns.Clear();
        grid.DataKeyNames = new string[] { biz.PrimaryKeyName, biz.ParentKeyName };

        // Now add non-supressed fields to grid
        string tableName = biz.TableName;
        // get a list of fields, and supress setting metadata if needed, will be set via grid
        //List<ICaisisInputControl> cicList = GetCaisisInputControlsByTableName(tableName);

        // get a list of input fields from metadata
        List<ICaisisInputControl> inputFields = GetCaisisInputControlsByMetadata(tableName, tableFieldsMetadata);
        // add column representing fields
        foreach (ICaisisInputControl iCIC in inputFields)
        {
            CaisisDataBoundField cbf;
            string fieldName = iCIC.Field;
            //if (attributesDt != null)
            // build field with metadata
            if (tableFieldsMetadata.ContainsKey(fieldName))
            {
                //cbf = new CaisisDataBoundField(iCIC, attributesDt);
                var fieldMetadata = tableFieldsMetadata[fieldName];
                cbf = new CaisisDataBoundField(iCIC, fieldMetadata);
            }
            else
            {
                cbf = new CaisisDataBoundField(iCIC);
            }
            grid.Columns.Add(cbf);
        }
    }

    /// <summary>
    /// Gets a list of table field names and their associated field label, excludes suppressed and pri key fields.
    /// NOTE: uses current disease view
    /// </summary>
    /// <param name="tableName">The table to query metadata</param>
    /// <returns></returns>
    public static Dictionary<string, string> GetCaisisInputFields(string tableName)
    {
        string disease = new DiseaseController().GetDiseaseView();
        return GetCaisisInputFields(tableName, disease);
    }

    /// <summary>
    /// Gets a list of table field names and their associated field label, excludes suppressed and pri key fields.
    /// </summary>
    /// <param name="tableName">The table to query metadata</param>
    /// <param name="disease">The disease view used for querying metadata</param>
    /// <returns></returns>
    public static Dictionary<string, string> GetCaisisInputFields(string tableName, string disease)
    {
        var pdec = new PatientDataEntryController(disease);
        var tableFieldMetadata = pdec.GetTableFieldsMetadata(tableName);
        // filter fields, supress, ordering, etc...
        var filteredFields = FilterTableFieldMetadata(tableName, tableFieldMetadata);
        return filteredFields.ToDictionary(field => field.Key, field => pdec.GetFieldLabel(tableName, field.Key));
    }

    /// <summary>
    /// Gets a list of input controls generated from field metadata by table and diseases.
    /// </summary>
    /// <param name="tableName">The table containing the fields.</param>
    /// <returns></returns>
    public static List<ICaisisInputControl> GetCaisisInputControlsByTableName(string tableName)
    {
        DiseaseController dc = new DiseaseController();
        string disease = dc.GetDiseaseView();
        return GetCaisisInputControlsByTableName(tableName, disease);
    }     

    /// <summary>
    /// Gets a list of input controls generated from field metadata by table and diseases.
    /// </summary>
    /// <param name="tableName">The name of the table containing fields</param>
    /// <param name="disease">The disease filter</param>
    /// <returns></returns>
    public static List<ICaisisInputControl> GetCaisisInputControlsByTableName(string tableName, string disease)
    {
        var tableFieldMetadata = PatientDataEntryController.GetTableFieldsMetadata(tableName, disease);
        return GetCaisisInputControlsByMetadata(tableName, tableFieldMetadata);
    }

    /// <summary>
    /// Gets a list of ICaisisInputControls build from metadata
    /// </summary>
    /// <param name="tableName"></param>
    /// <param name="tableFieldMetadata"></param>
    /// <returns></returns>
    public static List<ICaisisInputControl> GetCaisisInputControlsByMetadata(string tableName, Dictionary<string, Dictionary<string, string>> tableFieldMetadata)
    {
        List<ICaisisInputControl> cicList = new List<ICaisisInputControl>();

        // filter fields, supress, ordering, etc...
        var filteredFieldMetadata = FilterTableFieldMetadata(tableName, tableFieldMetadata);            
            
        // build field, and set attributes
        foreach (var field in filteredFieldMetadata)
        {
            // get field
            string fieldName = field.Key;
            // get metadata for field
            var fieldMetadata = field.Value;

            // get control type
            string controlType = GetFieldAttributeValue(fieldMetadata, CONTROLTYPE);
            if (string.IsNullOrEmpty(controlType))
            {
                controlType = typeof(CaisisTextBox).Name;
            }
            // create instance with required properties
            ICaisisInputControl cic = InvokeInputControl(controlType);
            cic.Field = fieldName;
            cic.Table = tableName;

            // set properties via metadata
            SetCICAttributes(cic, fieldMetadata);

            // add input to list
            cicList.Add(cic);
        }
        return cicList;
    }

    /// <summary>
    /// For the given fields and their metadata, filter (required, suppressed) and order
    /// </summary>
    /// <param name="tableName">The table name used to validate special key fields (NULL or empty to skip check).</param>
    /// <param name="tableFieldMetadata">A lookup of field names and their respective metadata.</param>
    /// <returns></returns>
    private static IEnumerable<KeyValuePair<string, Dictionary<string, string>>> FilterTableFieldMetadata(string tableName, Dictionary<string, Dictionary<string, string>> tableFieldMetadata)
    {
        // supress special names and pri key
        bool checkTable = !string.IsNullOrEmpty(tableName) && BusinessObjectFactory.CanBuildBusinessObject(tableName);
        string priKeyName = checkTable ? BusinessObject.GetPrimaryKeyName(tableName) : "";
        var filteredFieldMetadata = from f in tableFieldMetadata
                                    let fieldName = f.Key
                                    let fieldMetadata = f.Value
                                    let fieldSupressValue = GetFieldAttributeValue(fieldMetadata, "FieldSuppress")
                                    let fieldSupress = !string.IsNullOrEmpty(fieldSupressValue) && fieldSupressValue.Equals(bool.TrueString, StringComparison.OrdinalIgnoreCase)
                                    // ignore special fields (including pri keys) and supressed fields
                                    where
                                    // non-special field name + (is not table or is not table's pri key) + not suppressed via metadata
                                    !SUPRESS_FIELD_NAMES.Contains(fieldName) &&
                                    !(!checkTable || priKeyName.Equals(fieldName, StringComparison.OrdinalIgnoreCase)) &&
                                    !fieldSupress
                                    // determine sort
                                    let sortValue = GetFieldAttributeValue(fieldMetadata, "FieldOrder")
                                    let sort = !string.IsNullOrEmpty(sortValue) ? int.Parse(sortValue) : int.MaxValue
                                    // supress PatientId ??
                                    where !fieldName.Equals(Patient.PatientId, StringComparison.OrdinalIgnoreCase)
                                    orderby sort ascending
                                    select f;
        return filteredFieldMetadata;
    }

    /// <summary>
    /// Returns a new instance of the specified ICaisisInputControl with Properties set via source instance.
    /// Properties are public properties which are part of the caisis control's interfaces (i.e, Table, Field) and instance (i.e., ShowCalendar).
    /// </summary>
    /// <param name="origCIC">The ICaisisInputControl instance to clone.</param>
    /// <returns>A new instance of an ICaisisInputControl.</returns>
    public static ICaisisInputControl CloneCIC(ICaisisInputControl origCIC)
    {
        Type origType = origCIC.GetType();
        ICaisisInputControl clonedICIC = InvokeInputControl(origType.Name);

        // clone through reflection
        WebControl wc = origCIC as WebControl;
        WebControl clonedWC = clonedICIC as WebControl;

        // copy attributes
        if (wc != null && clonedWC != null)
        {
            foreach (string key in wc.Attributes.Keys)
            {
                clonedWC.Attributes.Add(key, wc.Attributes[key]);
            }
        }

        // get caisis properties which make sense to instance
        var caisisProperties = CICHelper.GetMetaFieldList(clonedICIC).Select(p => origType.GetProperty(p));
        // get full instance properties
        //var caisisProperties = origType.GetProperties();
        
        // set properties via reflection
        foreach (PropertyInfo prop in caisisProperties)
        {
            if (prop.CanRead && prop.CanWrite)
            {
                // ignore special properties
                if (prop.Name != "Value" && prop.Name != "ID")
                {
                    // get value from source control
                    object origVal = prop.GetValue(origCIC, null);
                    // use value to set value on clonded control
                    prop.SetValue(clonedICIC, origVal, null);
                }
            }
        }

        return clonedICIC;
    }

    // currently handles CaisisSelect and CaisisRadioButtonList
    public static void HandleLookupDistinctAttribute(ICaisisInputControl control, string attValue,
        System.Web.SessionState.HttpSessionState session)
    {
        // validate control types
        if (control is ICaisisLookupControl || BusinessObjectFactory.CanBuildBusinessObject(attValue))
        {
            string[] atts = attValue.Split(new char[] { ';' });

            // restrict data binding to list controls ???
            if (atts.Length >= 3 && control is ListControl)
            {
                string tablename = atts[0].Trim();
                string valuefield = atts[1].Trim();
                string textfield = atts[2].Trim();
                string restriction = null;
                string order = null;

                if (atts.Length >= 4 && atts[3] != null)
                {
                    restriction = atts[3].Trim();

                    if (restriction.Contains("@PatientId") && session != null && session[SessionKey.PatientId] != null)
                    {
                        restriction = restriction.Replace("@PatientId", session[SessionKey.PatientId].ToString());
                    }

                    if (restriction.Contains("@UserName"))
                    {
                        Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
                        restriction = restriction.Replace("@UserName", String.Format("'{0}'", sc.GetUserName()));
                    }

                    if (atts.Length >= 5 && atts[4] != null)
                    {
                        order = atts[4].Trim();
                    }
                }

                DataView view = LookupCodeDa.GetLookupData(tablename, valuefield, textfield, restriction, order);

                if (control is ListControl)
                {
                    ListControl listControl = control as ListControl;
                    // bind generic list control to list of lookup values
                    listControl.DataSource = view;
                    listControl.DataTextField = "DropDownText";
                    listControl.DataValueField = "DropDownValue";
                    listControl.DataBind();
                }
                //// special case for combo (manual data bind)
                //else if (control is CaisisComboBox)
                //{
                //    CaisisComboBox combo = control as CaisisComboBox;
                //    DataTable dataSource = view.Table;
                //    combo.BuildComboData(dataSource, "DropDownText", "DropDownText");
                //}
            }
        }
    }

    /// <summary>
    /// Dynamically set the attributes of the static Caisis Input Controls based on metadata
    /// </summary>
    /// <param name="controls"></param>
    /// <param name="tableName"></param>
    public static void SetStaticFieldAttributes(ControlCollection controls, string tableName)
    {
        MetadataDa mdDa = new MetadataDa();
        DataTable attributesDt = mdDa.GetFieldMetadataByTableName(tableName);

        if (attributesDt.Rows.Count > 0)
        {
            foreach (Control con in controls)
            {
                if (con is ICaisisInputControl)
                {
                    ICaisisInputControl cic = ((ICaisisInputControl)con);

                    //SetCICAttributes(cic, attributesDt);
                    var metadata = GetFieldAttributeLookup(attributesDt, cic.Field);
                    SetCICAttributes(cic, metadata);
                }
            }
        }
    }

    public static void HandleJsEventAttribute(WebControl control, string attName, string attValue)
    {
        if (attValue != null && attValue != "")
        {
            if (control.Attributes[attName] == null)
            {
                control.Attributes[attName] = String.Join(" ", JavascriptMetaparser.Parse(attValue).ToArray());
            }
            else
            {
                control.Attributes[attName] += " ; " + String.Join(" ", JavascriptMetaparser.Parse(attValue).ToArray());
            }
        }
    }

    /// <summary>
    /// Sets the field attributes of static and dynamic forms. Static form inline attributes override those in metadata.
    /// </summary>
    /// <param name="cic"></param>
    /// <param name="attributesDt"></param>
    public static void SetCICAttributes(ICaisisInputControl cic, DataTable attributesDt)
    {
        string fieldName = cic.Field;
        var fieldMetadata = GetFieldAttributeLookup(attributesDt, fieldName);
        SetCICAttributes(cic, fieldMetadata);
    }

    /// <summary>
    /// Sets the ICaisisInputControl public properties via dictionary metadata
    /// </summary>
    /// <param name="icic"></param>
    /// <param name="attributesToValues"></param>
    public static void SetCICAttributes(ICaisisInputControl cic, IDictionary<string, string> fieldMetadata)
    {
        string fieldName = cic.Field;

        if (cic.Visible == true) //can hide a static field, but suppressed fields for dynamic forms are never returned from the DB
        {
            // no need to validate properties, since explicitly setting properties - ac
            //IEnumerable<string> metaFieldList = GetMetaFieldList(cic);

            // SET LABEL : First use FieldLabel set in static form if present, if not check for meta value, 
            // if none, use column name unless the column is a date field. 
            if (cic.FieldLabel == null)// && metaFieldList.Contains(LABEL))
            {
                string labelText = GetFieldAttributeValue(fieldMetadata,  LABEL);

                if (labelText.Equals("") && !fieldName.Contains("Date"))
                {
                    cic.FieldLabel = fieldName;
                }
                else
                {
                    cic.FieldLabel = labelText;
                }
            }


            // SET DESCRIPTION
            if (cic.HelpDescription == null)
                cic.HelpDescription = GetFieldAttributeValue(fieldMetadata, DESCRIPTION);

            // SET REQUIRED
            if (cic.Required == false)// && metaFieldList.Contains(REQUIRED))
            {
                if (GetFieldAttributeValue(fieldMetadata, REQUIRED).ToLower().Equals("true"))
                {
                    cic.Required = true;
                }
            }

            // SET JAVASCRIPT EVENTHANDLERS and append WIDTH Attribute to style if present; Note, these are not properties of the CaisisInputControls
            if (cic is WebControl)
            {
                WebControl wc = cic as WebControl;

                string onblur = GetFieldAttributeValue(fieldMetadata, JSONBLUR);
                string onclick = GetFieldAttributeValue(fieldMetadata, JSONCLICK);
                string onselected = GetFieldAttributeValue(fieldMetadata, JSONSELECTEDINDEXCHANGED);
                string inlineWidth = GetFieldAttributeValue(fieldMetadata, FIELDWIDTH);

                if (!String.IsNullOrEmpty(onblur)) HandleJsEventAttribute(wc, "onblur", onblur);
                if (!String.IsNullOrEmpty(onclick)) HandleJsEventAttribute(wc, "onclick", onclick);
                if (!String.IsNullOrEmpty(onselected)) HandleJsEventAttribute(wc, "onselectedindexchanged", onselected);

                if (!string.IsNullOrEmpty(inlineWidth)) wc.Style.Add("width", inlineWidth + "px");

            }

            // SET WIDTH 
            /*if (cic is WebControl && metaFieldList.Contains(FIELDWIDTH))
            {
                WebControl wc = cic as WebControl;

                string inlineWidth = GetFieldAttributeValue(attributesDt, fieldName, FIELDWIDTH);
                if (!string.IsNullOrEmpty(inlineWidth))
                {
                    wc.Style.Add("width", inlineWidth + "px");
                }
            }
            */

            // HANDLE LOOKUP BASED CONTROLS
            if (cic is ICaisisLookupControl)
            {
                ICaisisLookupControl lkpControl = (ICaisisLookupControl)cic;

                if (lkpControl.LookupDistinct == null)// && metaFieldList.Contains(LOOKUPDISTINCT))
                {
                    string lkpDistinct = GetFieldAttributeValue(fieldMetadata, LOOKUPDISTINCT);
                    if (lkpDistinct != "")
                    {
                        lkpControl.LookupDistinct = lkpDistinct;
                    }
                }

                if (lkpControl.LookupCode == null)// && metaFieldList.Contains(LOOKUPCODE))
                {
                    string lkpCode = GetFieldAttributeValue(fieldMetadata, LOOKUPCODE);
                    if (lkpCode != "")
                    {
                        lkpControl.LookupCode = lkpCode;
                    }
                }

                if (lkpControl.CascadeValuesBasedOn == null)// && metaFieldList.Contains(CASCADEVALUESBASEDON))
                {
                    string lkpBasedOn = GetFieldAttributeValue(fieldMetadata, CASCADEVALUESBASEDON);
                    if (lkpBasedOn != "")
                    {
                        lkpControl.CascadeValuesBasedOn = lkpBasedOn;
                    }
                }

                if (lkpControl.CascadeFormatString == null)// && metaFieldList.Contains(CASCADEFORMATSTRING))
                {
                    string lkpFormatString = GetFieldAttributeValue(fieldMetadata, CASCADEFORMATSTRING);
                    if (lkpFormatString != "")
                    {
                        lkpControl.CascadeFormatString = lkpFormatString;
                    }
                }
            }
            // MaxLength needs to be set on TextBox controls (not part of ICaisisInputControls)
            if (cic is TextBox)
            {
                string maxLengthValue = GetFieldAttributeValue(fieldMetadata, MAXLENGTH);
                if (!string.IsNullOrEmpty(maxLengthValue))
                {
                    int maxLength = 0;
                    if (int.TryParse(maxLengthValue, out maxLength))
                    {
                        (cic as TextBox).MaxLength = maxLength;
                    }
                }
            }

            if (cic is CaisisTextBox)
            {
                CaisisTextBox tb = (CaisisTextBox)cic;

                // false by default, so if set to true on static form then that value overrides what is in the metadata

                //SET CALENDAR
                if (tb.ShowCalendar == false)// && metaFieldList.Contains(SHOWCALENDAR))
                {
                    string showCal = GetFieldAttributeValue(fieldMetadata, SHOWCALENDAR);
                    if (showCal.ToLower().Equals("true"))
                    {
                        tb.ShowCalendar = true;
                    }
                }

                //SET INTERPRETED DATE
                if (tb.CalcDate == false)// && metaFieldList.Contains(CALCDATE))
                {
                    string interpretDate = GetFieldAttributeValue(fieldMetadata, CALCDATE);
                    if (interpretDate.ToLower().Equals("true"))
                    {
                        tb.CalcDate = true;
                    }
                }

                //SET NUMBERPAD
                if (tb.ShowNumberPad == false)// && metaFieldList.Contains(SHOWNUMBERPAD))
                {
                    string showNumPad = GetFieldAttributeValue(fieldMetadata, SHOWNUMBERPAD);
                    if (showNumPad.ToLower().Equals("true"))
                    {
                        tb.ShowNumberPad = true;
                    }
                }

                //SET READ ONLY
                if (tb.ReadOnly == false)// && metaFieldList.Contains(READONLY))
                {
                    string isReadOnly = GetFieldAttributeValue(fieldMetadata, READONLY);
                    if (isReadOnly.ToLower().Equals("true"))
                    {
                        tb.ReadOnly = true;
                    }
                }

                //SET NOTES EDITOR
                string showTextString = GetFieldAttributeValue(fieldMetadata, SHOWTEXTEDITOR);
                bool showTextEditor;
                if (bool.TryParse(showTextString, out showTextEditor))// && metaFieldList.Contains(SHOWTEXTEDITOR))
                {
                    tb.ShowTextEditor = showTextEditor;
                }

                //SET ICD CODE WIZARD
                string showICD = GetFieldAttributeValue(fieldMetadata, SHOWICDWIZARD);
                bool showICDWizard;
                if (bool.TryParse(showICD, out showICDWizard))// && metaFieldList.Contains(SHOWICDWIZARD))
                {
                    tb.ShowICDWizard = showICDWizard;
                }
            }

            if (cic is CaisisTextArea)
            {
                CaisisTextArea ta = (CaisisTextArea)cic;

                //SET NOTES EDITOR
                string showTextString = GetFieldAttributeValue(fieldMetadata, SHOWTEXTEDITOR);
                bool showTextEditor;
                if (bool.TryParse(showTextString, out showTextEditor))// && metaFieldList.Contains(SHOWTEXTEDITOR))
                {
                    ta.ShowTextEditor = showTextEditor;
                }

                // SET MAX LENGTH
                string maxLengthValue = GetFieldAttributeValue(fieldMetadata, MAXLENGTH);
                if (!string.IsNullOrEmpty(maxLengthValue))
                {
                    int maxLength = 0;
                    if (int.TryParse(maxLengthValue, out maxLength))
                    {
                        (cic as CaisisTextArea).MaxLength = maxLength;
                    }
                }
            }

            if (cic is CaisisHidden)
            {
                CaisisHidden hidden = cic as CaisisHidden;

                if (!hidden.DisplayCalculatedDate)// && metaFieldList.Contains(DISPLAYCALCULATEDDATE))
                {
                    string doDisplay = GetFieldAttributeValue(fieldMetadata, DISPLAYCALCULATEDDATE);
                    if (doDisplay.ToLower().Equals("true"))
                    {
                        hidden.DisplayCalculatedDate = true;
                    }
                }

                if (!hidden.DisplayHiddenValue)// && metaFieldList.Contains(DISPLAYHIDDENVALUE))
                {
                    string displayVal = GetFieldAttributeValue(fieldMetadata, DISPLAYHIDDENVALUE);
                    if (displayVal.ToLower().Equals("true"))
                    {
                        hidden.DisplayHiddenValue = true;
                    }
                }

                //SET ICD CODE WIZARD
                string showICDHidden = GetFieldAttributeValue(fieldMetadata, SHOWICDWIZARD);
                bool showICDWizardHid;
                if (bool.TryParse(showICDHidden, out showICDWizardHid))// && metaFieldList.Contains(SHOWICDWIZARD))
                {
                    hidden.ShowICDWizard = showICDWizardHid;
                }
            }

            // checkbox list related metadata
            if (cic is CaisisCheckBoxList)
            {
                CaisisCheckBoxList cbl = cic as CaisisCheckBoxList;
                string dropDown = GetFieldAttributeValue(fieldMetadata, "DropDown");
                if (!string.IsNullOrEmpty(dropDown) && PageUtil.IsTrueString(dropDown))
                {
                    cbl.DropDown = true;
                }
            }
        }
    }

    /// <summary>
    /// Get the attribute value by using the field and attribute name to query the DataTable
    /// </summary>
    /// <param name="dt"></param>
    /// <param name="fieldName"></param>
    /// <param name="attName"></param>
    /// <returns></returns>
    public static string GetFieldAttributeValue(DataTable dt, string fieldName, string attName)
    {
        string searchExpression = "FieldName = '" + fieldName + "' AND AttributeName = '" + attName + "'";

        DataRow[] fieldAttributeRows = dt.Select(searchExpression);
        if (fieldAttributeRows.Length == 1)
        {
            return fieldAttributeRows[0]["AttributeValue"].ToString();
        }
        else
        {
            return "";
        }
    }

    /// <summary>
    /// Gets a dictionary lookup of attribute name => attribute value
    /// </summary>
    /// <param name="dt"></param>
    /// <param name="fieldName"></param>
    /// <returns></returns>
    public static IDictionary<string, string> GetFieldAttributeLookup(DataTable dt, string fieldName)
    {
        return GetFieldAttributeLookup(dt.AsEnumerable(), fieldName);
    }

    /// <summary>
    /// Gets a dictionary lookup of attribute name => attribute value
    /// </summary>
    /// <param name="rowEnum"></param>
    /// <param name="fieldName"></param>
    /// <returns></returns>
    private static IDictionary<string, string> GetFieldAttributeLookup(IEnumerable<DataRow> rowEnum, string fieldName)
    {
        var lookup = from row in rowEnum
                     let field = row["FieldName"].ToString()
                     let attributeName = row["AttributeName"].ToString()
                     let attributeValue = row["AttributeValue"].ToString()
                     where field.Equals(fieldName)
                     let a = new
                     {
                         AttributeName = attributeName,
                         AttributeValue = attributeValue
                     }
                     group a by a.AttributeName into g
                     select g.First();
        return lookup.ToDictionary(a => a.AttributeName, b => b.AttributeValue, StringComparer.OrdinalIgnoreCase);
    }

    /// <summary>
    /// Gets the attribute value by attribute name in the specified lookup
    /// </summary>
    /// <param name="fieldMetadata"></param>
    /// <param name="attName"></param>
    /// <returns></returns>
    public static string GetFieldAttributeValue(IDictionary<string, string> fieldMetadata, string attName)
    {
        // important, case insensitive search
        var foundAttribute = fieldMetadata.Where(p => p.Key.Equals(attName, StringComparison.OrdinalIgnoreCase));
        return foundAttribute.Count() > 0 ? foundAttribute.First().Value : string.Empty;
    }

    /// <summary>
    /// Extract input values from CaisisInputControls and add to Business Objects
    /// </summary>
    /// <param name="controls">form input controls</param>
    /// <param name="bizo">Caisis Business Object</param>
    /// <param name="parentKeyValue">value of parent key</param>
    public static void SetBOValues(ControlCollection controls, List<IBusinessObject> bizos, int parentKeyValue)
    {
        foreach (IBusinessObject bizo in bizos)
        {
            SetBOValues(controls, bizo, parentKeyValue);
        }
    }

	// TODO: MIGRATION - DELETE ME
    /// <summary>
    /// Extract input values from CaisisInputControls and add to a Business Object
    /// </summary>
    /// <param name="controls">form input controls</param>
    /// <param name="bizo">Caisis Business Object</param>
    /// <param name="parentKeyValue">value of parent key</param>
    public static void SetBOValues(ControlCollection controls, IBusinessObject bizo, int parentKeyValue)
    {
        foreach (Control con in controls)
        {
            if (con is ICaisisInputControl)
            {
                ICaisisInputControl cic = (ICaisisInputControl)con;
                if (bizo.TableName == cic.Table && bizo.HasField(cic.Field))
                {
                    bizo[cic.Field] = cic.Value;
                }
            }
            else if (con.HasControls())
            {
                SetBOValues(con.Controls, bizo, parentKeyValue);
            }
        }

        // on insert set the foreign key value
        if (bizo.ParentKeyName != null && bizo[bizo.ParentKeyName].ToString().Equals(""))
        {
            bizo[bizo.ParentKeyName] = parentKeyValue;
        }
    }

    public static void SetFieldValues(ControlCollection controls, IBusinessObject bizo)
    {
        foreach (Control con in controls)
        {
            if (con is ICaisisInputControl)
            {
                ICaisisInputControl cic = (ICaisisInputControl)con;
                if (bizo.TableName == cic.Table && bizo.HasField(cic.Field)) // there can be input fields from multiple bizo objects present on one interface
                {
                    cic.Value = bizo[cic.Field].ToString();
                }
            }
            else if (con.HasControls())
            {
                SetFieldValues(con.Controls, bizo);
            }
        }
    }

    /// <summary>
    /// For the given list of ICaisisInputControl, set the field values based on Biz field values
    /// </summary>
    /// <param name="inputs">A List of IcaisisInputControl</param>
    /// <param name="bizo">A BusinessObject used for populating fields</param>
    public static void SetFieldValues(IEnumerable<ICaisisInputControl> inputs, IBusinessObject bizo)
    {
        foreach (ICaisisInputControl input in inputs)
        {
            string table = input.Table + "";
            string field = input.Field + "";
            if (bizo.TableName == table && bizo.HasField(field))
            {
                input.Value = bizo[field].ToString();
            }
        }
    }

    /// <summary>
    /// Enables/Disables Caisis Input Controls and CaisisGridView
    /// </summary>
    /// <param name="controls"></param>
    /// <param name="enable"></param>
    public static void EnableFields(ControlCollection controls, bool enable)
    {
        foreach (Control con in controls)
        {
            if (con is ICaisisInputControl)
            {
                ICaisisInputControl cic = (ICaisisInputControl)con;
                cic.Enabled = enable;
            }
            else if (con is CaisisGridView)
            {
                ((CaisisGridView)con).Enabled = enable;
            }
            else if (con.HasControls())
            {
                EnableFields(con.Controls, enable);
            }
        }
    }

    /// <summary>
    /// Highlight required field when value missing and throw RequiredValueException
    /// </summary>
    /// <param name="controls">collection of input controls</param>
    public static void ValidFieldValues(ControlCollection controls)
    {
        bool areValuesValid = true;
        foreach (Control con in controls)
        {
            if (con is ICaisisInputControl)
            {
                ICaisisInputControl cic = (ICaisisInputControl)con;
                if (cic.Required && cic.Value.Trim().Equals(""))
                {
                    // If Control is in a Grid, hightlight cell
                    if (((Control)cic).Parent is DataControlFieldCell)
                    {
                        DataControlFieldCell gridCell = (DataControlFieldCell)((Control)cic).Parent;
                        GridViewRow gridRow = Caisis.UI.Core.Classes.CaisisGridView.GetGridViewRowByControl(gridCell);
                        if (gridRow != null)
                        {
                            if (Caisis.UI.Core.Classes.CaisisGridView.IsDirtyGridRow(gridRow))
                            {
                                gridCell.Style.Add(HtmlTextWriterStyle.BackgroundColor, "red");
                                areValuesValid = false;
                            }
                        }
                    }
                    else
                    {
                        cic.FieldLabel = "<img src=\"../../Images/icon_flashingError.gif\" width=\"17\" height=\"12\" /> " + cic.FieldLabel;
                        areValuesValid = false;
                    }
                }
            }
            else if (con.HasControls())
            {
                ValidFieldValues(con.Controls);
            }
        }
        if (areValuesValid == false)
        {
            throw new RequiredValueException();
        }
    }

    private static bool _fieldsValidated = true;
    public static bool ValidateFields(ControlCollection controls)
    {
        foreach (Control c in controls)
        {
            if (c is ICaisisInputControl)
            {
                ICaisisInputControl CIC = (ICaisisInputControl)c;
                if (CIC.Required && string.IsNullOrEmpty(CIC.Value))
                {
                    CIC.FieldLabel = "<img src=\"../../Images/icon_flashingError.gif\" width=\"17\" height=\"12\" /> " + CIC.FieldLabel;
                    _fieldsValidated = false;
                }
            }
            else if (c.HasControls())
            {
                ValidateFields(c.Controls);
            }
        }
        return _fieldsValidated;
    }


    /// <summary>
    /// Returns a list of field (CIC properties) which can be set via MetaData
    /// </summary>
    /// <param name="icic"></param>
    /// <returns></returns>
    public static IEnumerable<string> GetMetaFieldList(ICaisisInputControl icic)
    {
         return ReflectionManager.GetMetaDataFieldNames(icic);
    }

    /// <summary>
    /// Returns a list of CaisisInputControls in a container (deep search)
    /// </summary>
    /// <param name="container"></param>
    /// <returns></returns>
    public static List<ICaisisInputControl> GetCaisisInputControls(Control container)
    {
        List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(container);
        return cicList;
    }

    /// <summary>
    /// Returns a list of CaisisInputControls in a container (deep search)
    /// key = ICaisisInputControl.Field
    /// value = ICaisisInputControl>
    /// </summary>
    /// <param name="container"></param>
    /// <returns></returns>
    public static Dictionary<string, ICaisisInputControl> GetCaisisInputControlDictionary(Control container)
    {
        return GetCaisisInputControls(container).ToDictionary(k => k.Field, v => v);
    }

    /// <summary>
    /// Returns a list of CaisisInputControls in a container (deep search), filtered by TabelName(biz table name)
    /// </summary>
    /// <param name="container">A control which contains other controls</param>
    /// <param name="bizFilter">The BusinessObject table name used to filter list</param>
    /// <returns></returns>
    public static List<ICaisisInputControl> GetCaisisInputControls(Control container, string bizFilter)
    {
        List<ICaisisInputControl> cicList = GetCaisisInputControls(container);
        if (!string.IsNullOrEmpty(bizFilter))
        {
            List<ICaisisInputControl> filteredList = new List<ICaisisInputControl>();
            foreach (ICaisisInputControl cic in cicList)
            {
                if (cic.Table == bizFilter)
                {
                    filteredList.Add(cic);
                }
            }
            return filteredList;
        }
        else
        {
            return cicList;
        }
    }

    /// <summary>
    /// Sets the "Value" property to empty string (""), for each CaisisInputControl in the container
    /// </summary>
    /// <param name="container"></param>
    public static void ClearCaisisInputControlValues(Control container)
    {
        List<ICaisisInputControl> cicList = GetCaisisInputControls(container);
        ClearCaisisInputControlValues(cicList);
    }

    /// <summary>
    /// Sets the "Value" property to empty string (""), for each control in the list of CaisisInputControls
    /// </summary>
    /// <param name="cicList">A list of controls to clear values.</param>
    public static void ClearCaisisInputControlValues(List<ICaisisInputControl> cicList)
    {
        foreach (ICaisisInputControl cic in cicList)
        {
            cic.Value = string.Empty;
        }
    }

    /// <summary>
    /// Gets the MaxLength for the input control based on Table and Field names
    /// </summary>
    /// <param name="iCIC">The control which has Table and Field to check for MaxLength</param>
    /// <returns>Returns the max length field accepts (nullable)</returns>
    public static int? GetInputControlMaxLength(ICaisisInputControl iCIC)
    {
        int? maxLength = null;
        // validate table and field exist
        if (!string.IsNullOrEmpty(iCIC.Table) && !string.IsNullOrEmpty(iCIC.Field))
        {
            // validate table and field map to real biz table and fields
            if (Caisis.BOL.BusinessObjectFactory.CanBuildBusinessObject(iCIC.Table) && Caisis.BOL.BusinessObject.HasField(iCIC.Table, iCIC.Field))
            {
                int? bizMaxLength = Caisis.BOL.BusinessObject.GetFieldMaxLength(iCIC.Table, iCIC.Field);
                return bizMaxLength;
            }
        }
        return maxLength;
    }

    /// <summary>
    /// Sets the default MaxLenght of an ICaisisIputControl field
    /// </summary>
    /// <param name="iCIC"></param>
    public static void DefaultInputControlMaxLength(ICaisisInputControl iCIC)
    {
        // ?? currently only textbox, combo, textarea and checkbox list, should be part of interface
        if (iCIC is TextBox || iCIC is CaisisCheckBoxList)
        {
            int? fieldMaxLength = CICHelper.GetInputControlMaxLength(iCIC);
            // only validate max length on valid values, otherwise no restrictions to check
            if (fieldMaxLength.HasValue)
            {
                int? adjustedMaxLength = null;
                int? controlMaxLength = null;
                // need to clean up
                if (iCIC is TextBox)
                {
                    controlMaxLength = (iCIC as TextBox).MaxLength;
                }
                else if (iCIC is CheckBoxList)
                {
                    controlMaxLength = (iCIC as CaisisCheckBoxList).MaxLength;
                }
                if (controlMaxLength.HasValue)
                {
                    // max length not initalized, set via biz lookup
                    if (controlMaxLength.Value == 0)
                    {
                        adjustedMaxLength = fieldMaxLength.Value;
                    }
                    // otherwise, validate user entered value
                    else
                    {
                        if (controlMaxLength.Value > fieldMaxLength.Value)
                        {
                            adjustedMaxLength = fieldMaxLength.Value;
                        }
                    }
                    // need cleanup
                    if (adjustedMaxLength.HasValue)
                    {
                        if (iCIC is TextBox)
                        {
                            (iCIC as TextBox).MaxLength = adjustedMaxLength.Value;
                        }
                        else if (iCIC is CheckBoxList)
                        {
                            (iCIC as CaisisCheckBoxList).MaxLength = adjustedMaxLength.Value;
                        }
                    }
                }
            }
        }
    }

    /// <summary>
    /// Builds text validation script for input field
    /// </summary>
    /// <param name="iCIC"></param>
    public static void BuildInputControlMaxLengthScript(ICaisisInputControl iCIC)
    {
          // ?? currently only textbox and textarea, should be part of interface
        if (iCIC is TextBox)
        {
            TextBox tb = iCIC as TextBox;
            // textrea (multi-line textbox) doesn't have maxLength attribute, manually supress via script
            if (tb.MaxLength > 0)
            {
                // adjust client max length if needed
                int adjustedMaxLength = tb.MaxLength;
                string invokeMaxLength = "handleFieldMaxLength(this," + adjustedMaxLength + ",event);";
                PageUtil.AttachClientEventToControl(tb, "onkeypress", invokeMaxLength);
                PageUtil.AttachClientEventToControl(tb, "onkeyup", invokeMaxLength);
                // special: capture copy/paste
                PageUtil.AttachClientEventToControl(tb, "onblur", invokeMaxLength);
            }
        }
    }

    /// <summary>
    /// Gets a list of input controls by value
    /// </summary>
    /// <param name="inputs"></param>
    /// <param name="value"></param>
    /// <returns></returns>
    public static IEnumerable<ICaisisInputControl> GetInputControlsByValue(IEnumerable<ICaisisInputControl> inputs, string value)
    {
        return inputs.Where(c => c.Value == value);
    }

    /// <summary>
    /// Returns true if any item in the list of input contorls has a value, else false.
    /// </summary>
    /// <param name="inputs"></param>
    /// <returns></returns>
    public static bool InputControlsHaveValue(IEnumerable<ICaisisInputControl> inputs)
    {
        int count = inputs.Count();
        return count > 0 && count != GetInputControlsByValue(inputs, "").Count();
    }

    /// <summary>
    ///  Return a filtered list of input controls by biz type
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="inputs"></param>
    /// <returns></returns>
    public static IEnumerable<ICaisisInputControl> GetInputControlsByTable<T>(IEnumerable<ICaisisInputControl> inputs) where T : BusinessObject, IBusinessObject, new()
    {
        return GetInputControlsByTable(new T().TableName, inputs);
    }

    /// <summary>
    /// Return a filtered list of input controls by table
    /// </summary>
    /// <param name="tableName"></param>
    /// <param name="inputs"></param>
    /// <returns></returns>
    public static IEnumerable<ICaisisInputControl> GetInputControlsByTable(string tableName, IEnumerable<ICaisisInputControl> inputs)
    {
        return inputs.Where(i => i.Table == tableName);
    }

}
