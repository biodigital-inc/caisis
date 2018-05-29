using System;
using System.Collections;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Caisis.BOL;
using System.Web.UI.HtmlControls;

namespace Caisis.UI.Core.Classes.CustomControls
{
    #region interfaces
    public interface IEformInputField : ICaisisInputControl
    {
        string RecordId
        {
            get;
            set;
        }

        string ParentRecordId
        {
            get;
            set;
        }
    }
    #endregion

    #region static utilities
    public class _EnableHidden
    {
        public static string GetAttributeString(WebControl wc, string hiddenList, string jsFunction, string prependJsParams)
        {
            if (hiddenList != null)
            {
                ArrayList enable = new ArrayList();
                string[] hiddens = hiddenList.Split(new char[] { ',' });
                foreach (string h in hiddens)
                {
                    Control c = wc.Parent.FindControl(h);
                    if (c != null)
                    {
                        enable.Add(c.ClientID);
                    }
                }

                if (prependJsParams == null)
                {
                    prependJsParams = "";
                }

                // jsFunction + "(" + prependJsParams + "'" + String.Join(",", (string[]) enable.ToArray(typeof (string))) + "');"

                if (enable.Count > 0)
                {
                    StringBuilder buffer = new StringBuilder(jsFunction);
                    buffer.Append("(");
                    buffer.Append(prependJsParams);
                    buffer.Append("'");
                    buffer.Append(String.Join(",", (string[])enable.ToArray(typeof(string))));
                    buffer.Append("');");

                    return buffer.ToString();
                }
            }

            return null;
        }

        public static void AddEnableHiddenAttributes(WebControl wc, string hiddenList, string uiEventType,
            string jsFunction, string prependJsParams)
        {
            /*
            ArrayList enable = new ArrayList();
            string[] hiddens = hiddenList.Split(new char[] {','});
            foreach (string h in hiddens)
            {
                Control c = wc.Parent.FindControl(h);
                if (c != null)
                {
                    enable.Add(c.ClientID);
                }
            }

            if (prependJsParams == null)
            {
                prependJsParams = "";
            }
            */

            string attString = _EnableHidden.GetAttributeString(wc, hiddenList, jsFunction, prependJsParams);

            if (attString != null)
            {
                wc.Attributes.Add(uiEventType, attString);
            }
        }

        public static void AppendEnableHiddenAttributes(WebControl wc, string hiddenList, string uiEventType,
            string jsFunction, string prependJsParams)
        {
            string attString = _EnableHidden.GetAttributeString(wc, hiddenList, jsFunction, prependJsParams);

            if (attString != null)
            {
                if (wc.Attributes[uiEventType] == null)
                {
                    wc.Attributes.Add(uiEventType, attString);
                }
                else
                {
                    wc.Attributes[uiEventType] += " " + attString;
                }
            }
        }

        public static void AddEnableHiddenOnClickAttributes(WebControl wc, string hiddenList)
        {
            _EnableHidden.AddEnableHiddenAttributes(wc, hiddenList, "onclick", "enableHiddens", null);
        }

        public static void AddEnableHiddenOnSelectAttributes(WebControl wc, string hiddenList)
        {
            _EnableHidden.AddEnableHiddenAttributes(wc, hiddenList, "onchange", "enableHiddens", null);
        }

        public static void AddEnableHiddenOnBlurAttributes(WebControl wc, string hiddenList)
        {
            _EnableHidden.AddEnableHiddenAttributes(wc, hiddenList, "onblur", "enableHiddensOnBlur", "this.value,");
        }

        public static void AddEnableHiddenOnChangeAttributes(WebControl wc, string hiddenList)
        {
            _EnableHidden.AddEnableHiddenAttributes(wc, hiddenList, "onchange", "enableHiddensOnBlur", "this.value,");
        }

        public static void AppendEnableHiddenOnClickAttributes(WebControl wc, string hiddenList)
        {
            _EnableHidden.AppendEnableHiddenAttributes(wc, hiddenList, "onclick", "enableHiddens", null);
        }

        public static void AppendEnableHiddenOnSelectAttributes(WebControl wc, string hiddenList)
        {
            _EnableHidden.AppendEnableHiddenAttributes(wc, hiddenList, "onchange", "enableHiddens", null);
        }

        public static void AppendEnableHiddenOnBlurAttributes(WebControl wc, string hiddenList)
        {
            _EnableHidden.AppendEnableHiddenAttributes(wc, hiddenList, "onblur", "enableHiddensOnBlur", "this.value,");
        }

        public static void AppendEnableHiddenOnChangeAttributes(WebControl wc, string hiddenList)
        {
            _EnableHidden.AppendEnableHiddenAttributes(wc, hiddenList, "onchange", "enableHiddensOnBlur", "this.value,");
        }
    }

    // usage: AddEnableHiddenAttributes a = new AddEnableHiddenAttributes(_EnableHidden._AddEnableHiddenAttributes);
    // usage: a(this, this.enableHiddenOnUIEvent);

    // but why do things this way (as opposed to just calling the static method above), since we don't need to inject
    // anonymous code? answer: no good reason, we should just call the static method
    #endregion

    #region widgets
    [DefaultProperty("Text"), ToolboxData("<{0}:EformDeleteIcon runat=server></{0}:EformDeleteIcon")]
    public class EformDeleteIcon : Image
    {
        public EformDeleteIcon()
            : base()
        {
            this.ImageUrl = "~/Images/EFormDeleteRow.gif";
            this.Height = 14;
            this.Width = 22;
            this.Attributes["onclick"] = "clearElementsInParentRow(this);";
        }
    }


    public class EformAjaxCheckBox : CheckBox
    {
        /// <summary>
        /// URL to invoke callback
        /// </summary>
        private string _callbackPath;

        private string table;
        private string key;
        private string clientCallback;
        private bool enableUncheck;

        /// <summary>
        /// Gets or sets the table to stop the record
        /// </summary>
        public string Table
        {
            get
            {
                return table;
            }
            set
            {
                table = value;
            }
        }

        /// <summary>
        /// Gets or sets the field in the table to stop the record
        /// </summary>
        public string Key
        {
            get
            {
                return key;
            }
            set
            {
                key = value;
            }
        }

        public bool EnableUncheck
        {
            get
            {
                return enableUncheck;
            }
            set
            {
                enableUncheck = value;
            }
        }

        /// <summary>
        /// Gets or sets optional client callback function invoked on server response
        /// </summary>
        public string ClientCallback
        {
            get
            {
                return clientCallback;
            }
            set
            {
                clientCallback = value;
            }
        }

        public EformAjaxCheckBox(string callbackPath)
            : base()
        {
            this._callbackPath = callbackPath;
            this.enableUncheck = false;
        }

        protected override void Render(HtmlTextWriter writer)
        {
            SetClientScript();
            base.Render(writer);
            TextBox dateTextBox = new TextBox();
            dateTextBox.Attributes["id"] = this.ClientID + "DateText";
            dateTextBox.RenderControl(writer);
        }

        /// <summary>
        ///  Sets the table and key fields
        /// </summary>
        /// <param name="table"></param>
        /// <param name="key"></param>
        public void SetRecord(string table, string key)
        {
            this.table = table;
            this.key = key;
        }

        /// <summary>
        /// Clears the fields to stop the record
        /// </summary>
        public void ClearRecord()
        {
            this.SetRecord(string.Empty, string.Empty);
        }

        /// <summary>
        /// Sets the client script for invoking callback on click
        /// </summary>
        private void SetClientScript()
        {
            this.Attributes["onclick"] = GetClientScript();
        }

        /// <summary>
        /// Gets the client script used for invoking callback
        /// </summary>
        /// <returns></returns>
        public string GetClientScript()
        {
            if (!string.IsNullOrEmpty(table) && !string.IsNullOrEmpty(key) && !string.IsNullOrEmpty(_callbackPath))
            {
                string url = VirtualPathUtility.ToAbsolute(_callbackPath);
                string tableArg = PageUtil.EscapeSingleQuotes(table);
                // encrypty key
                string encKey = Security.CustomCryptoHelper.Encrypt(key);
                string keyArg = PageUtil.EscapeSingleQuotes(encKey);
                // generate client script for triggering callback
                string clientScriptFormat = "doEformCheckboxCallback('{0}', '{1}', '{2}', document.getElementById('{3}'),{4}, {5} , event);";
                string fullClientScript = string.Format(clientScriptFormat, url, tableArg, keyArg, this.ClientID, EnableUncheck.ToString().ToLower(),(!string.IsNullOrEmpty(ClientCallback) ? ClientCallback : "null"));
                return fullClientScript;
            }
            else
            {
                return string.Empty;
            }
        }
    }

    [DefaultProperty("Text"), ToolboxData("<{0}:EformStopCheckBox runat=server></{0}:EformStopCheckBox")]
    public class EformStopCheckBox : EformAjaxCheckBox
    {
        /// <summary>
        /// URL to invoke with request to set stop dates
        /// </summary>
        private static readonly string AJAX_CALLBACK_PATH = "~/Modules/All/Eforms/StopRecord.aspx";

        public EformStopCheckBox()
            : base(AJAX_CALLBACK_PATH)
        {
            this.Text = "Stop Now";
            this.ToolTip = "Stop this treatment now";
            this.EnableUncheck = true;
        }
    }

    [DefaultProperty("Text"), ToolboxData("<{0}:EformChildRecordCheckBox runat=server></{0}:EformChildRecordCheckBox")]
    public class EformChildRecordCheckBox : EformAjaxCheckBox
    {
        /// <summary>
        /// URL to invoke with request to create child record
        /// </summary>
        private static readonly string AJAX_CALLBACK_PATH = "~/Modules/All/Eforms/CreateChildRecord.aspx";

        public EformChildRecordCheckBox()
            : base(AJAX_CALLBACK_PATH)
        {
            this.Text = "Administered Today";
            this.ToolTip = "This treatment was administered today";
        }
    }

    /// <summary>
    /// A widget used for loading the Related Records interface to relate to an eform table record
    /// </summary>
    [DefaultProperty("Text"), ToolboxData("<{0}:EformRelatedRecordWidget runat=server></{0}:EformRelatedRecordWidget")]
    public class EformRelatedRecordWidget: Label
    {
        private string eformFieldId = "";
        private string relatedFieldId = "";
        private string relatedTable = "";
        private string relatedTablePriKey = "";
        private string relatedTableRecordId = "";
        private string defaultTable;
        private string defaultTitle;
        private string[] relatedTabels = new string[0];

        /// <summary>
        /// Gets or sets the ID of the field used for updating the relation.
        /// </summary>
        public string RelatedFieldId
        {
            get
            {
                return relatedFieldId;
            }
            set
            {
                relatedFieldId = value;
            }
        }               

        public string RelatedTable
        {
            get
            {
                return relatedTable;
            }
            set
            {
                relatedTable = value;
            }
        }

        public string RelatedTablePriKey
        {
            get
            {
                return relatedTablePriKey;
            }
            set
            {
                relatedTablePriKey = value;
            }
        }

        public string RelatedTableRecordId
        {
            get
            {
                return relatedTableRecordId;
            }
            set
            {
                relatedTableRecordId = value;
            }
        }

        /// <summary>
        /// Gets or sets the list of selectable related tables.
        /// </summary>
        [TypeConverter(typeof(StringArrayConverter))]
        public string[] RelatableTables
        {
            get
            {
                return relatedTabels;
            }
            set
            {
                relatedTabels = value;
            }
        }

        public string DefaultTable
        {
            get
            {
                return defaultTable;
            }
            set
            {
                defaultTable = value;
            }
        }

        public string DefaultTitle
        {
            get
            {
                return defaultTitle;
            }
            set
            {
                defaultTitle = value;
            }
        }

        public EformRelatedRecordWidget()
            : base()
        {
            this.CssClass = "eFormRelatedRecordWidget";
            this.Text = "Attribution";
            this.ToolTip = "Add Related Record(s)";
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            BuildClientScript();  
        }

        private void BuildClientScript()
        {
            // validate
            int? eformId = GetEformId();
            if (eformId.HasValue)
            {
               //(eformId, recordId, destTableName, relatedTables, defaultSrcTableName, relatedTitle, relatedClientId)
                string clientEformId = eformId.Value.ToString();
                // set required dest table and dest table record id
                string clientRecordId = RelatedTableRecordId;
                string clientDestTableName = RelatedTable;
                string clientDestTablePriKey = RelatedTablePriKey;
                // if either is blank, determine from RelatedFieldId
                IEformInputField inputField = this.NamingContainer.FindControl(RelatedFieldId) as IEformInputField;
                if (inputField == null)
                {
                    inputField = PageUtil.RecursiveFindControl(this.NamingContainer, RelatedFieldId) as IEformInputField;
                }
                if ((string.IsNullOrEmpty(clientRecordId) || string.IsNullOrEmpty(clientDestTableName)) && !string.IsNullOrEmpty(RelatedFieldId))
                {                    
                    if (inputField != null)
                    {
                        clientRecordId = inputField.RecordId;
                        clientDestTableName = inputField.Table;
                    }
                }

                string clientRelatedTables = RelatableTables.Length == 0 ? "[]" : "['" + string.Join("','", RelatableTables) + "']";
                string defaultSrcTable = DefaultTable;
                string clientDefaultTitle = DefaultTitle;
                string clientRelatedClientId = inputField != null ? (inputField as Control).ClientID : "";
                string clientFormatString = "return showEformRelatedRecords('{0}', '{1}', '{2}', '{3}', {4}, '{5}','{6}', '{7}', event);";
                string[] clientFormatArgs = new string[]
                {
                    clientEformId,
                    clientDestTableName,
                    clientDestTablePriKey,
                    clientRecordId,                    
                    clientRelatedTables,
                    defaultSrcTable,
                    clientDefaultTitle,
                    clientRelatedClientId
                };
                string clientScript = string.Format(clientFormatString, clientFormatArgs);
                this.Attributes["onclick"] = clientScript;
                if (!string.IsNullOrEmpty(DefaultTitle))
                {
                    this.ToolTip = DefaultTitle + " Attribution";
                }
            }
            else
            {
                this.Attributes["onclick"] = "";
                this.ToolTip = "Attribution";
            }
        }

        // refactor (sub class base eform component) ???
        private int? GetEformId()
        {
            int? eformId = null;
            if (Page is EFormBasePage)
            {
                EFormBasePage ePage = Page as EFormBasePage;
                eformId = ePage.EFormId;
            }
            return eformId;
        }
    }

    /// <summary>
    /// A widget used for loading the Upload File interface to relate to an eform table record
    /// </summary>
    [DefaultProperty("Text"), ToolboxData("<{0}:EformUploadFileWidget runat=server></{0}:EformUploadFileWidget")]
    public class EformUploadFileWidget : Image
    {
        #region PARAMETERS

        #region enums
        public enum UploadMode
        {
            [Description("Create a new file mode.")]
            Text,
            [Description("Upload a new file mode.")]
            Upload
        }
        #endregion

        private static readonly string THUMB_EXTENSION = "_thumb";
        private static readonly string ADD_FILE_IMAGE = "~/Images/UploadFile.gif";
        private static readonly string ADD_FILE_TOOLTIP = "Upload a file to associate with Record";
        public static readonly string[] IMG_EXTENSIONS = { ".jpg", ".jpeg", ".gif", ".bmp", ".png" };
        public static readonly string[] DOC_EXTENSIONS = { ".pdf", ".doc", ".txt", ".rtf", ".xls", ".docx", ".xlsx" };

        private string eformFieldId = "";
        private string uploadTable = "";
        private string uploadTablePriKey = "";
        private string uploadTableRecordId = "";
        private string uploadTitle = "";
        private Unit thumbNailListWidth;
        private UploadMode uploadDefaultMode;
        private int? uploadMaxFileCount = null;



        /// <summary>
        /// The table name of xml record node to associate with uploaded file. (Required)
        /// </summary>
        public string UploadTable
        {
            get
            {
                return uploadTable;
            }
            set
            {
                uploadTable = value;
            }
        }

        /// <summary>
        /// The unique primary key of database table record associated with uploaded file. (Optional)
        /// </summary>
        public string UploadTablePriKey
        {
            get
            {
                return uploadTablePriKey;
            }
            set
            {
                uploadTablePriKey = value;
            }
        }

        /// <summary>
        /// The xml 'RecordId' of the table xml node to associate with uploaded file. (Required)
        /// </summary>
        public string UploadTableRecordId
        {
            get
            {
                return uploadTableRecordId;
            }
            set
            {
                uploadTableRecordId = value;
            }
        }

        /// <summary>
        /// Optional title shown on upload modal window . (Optional)
        /// </summary>
        public string UploadTitle
        {
            get
            {
                return uploadTitle;
            }
            set
            {
                uploadTitle = value;
            }
        }

        /// <summary>
        /// Restricts width for list of thumbnails for uploaded files. (Optional)
        /// </summary>
        public Unit ThumbnailListWidth
        {
            get
            {
                return thumbNailListWidth;
            }
            set
            {
                thumbNailListWidth = value;
            }
        }

        /// <summary>
        /// Sets default mode when uploading a new file (Optional)
        /// </summary>
        public UploadMode UploadDefaultMode
        {
            get { return uploadDefaultMode; }
            set { uploadDefaultMode = value; }
        }

        /// <summary>
        /// Sets maximum number of files that can be uploaded for a record. (Optional)
        /// </summary>
        public int? UploadMaxFileCount
        {
            get { return uploadMaxFileCount; }
            set { uploadMaxFileCount = value; }
        }

        #endregion

        public EformUploadFileWidget()
            : base()
        {
            this.ImageUrl = ADD_FILE_IMAGE;
            this.ToolTip = ADD_FILE_TOOLTIP;
            this.Style[HtmlTextWriterStyle.Cursor] = "pointer";

        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            BuildUploadImageClientScript();
        }

        private void BuildUploadImageClientScript()
        {
            // validate
            int eformId = GetEformId();
            string eformName = GetEformName();
            string eformSectionName = GetEformSectionName();
            if (eformId != 0)
            {
                int? currentFileCount = GetReocrdCurrentFileCount();
                int? maxFileCount = UploadMaxFileCount;

                if (maxFileCount == null || (currentFileCount < maxFileCount))
                {

                    // get all currently saved file uploads and disply their image
                    string clientEformId = eformId.ToString();
                    string clientEformName = eformName;
                    string clientEformSectionName = eformSectionName;
                    string clientRecordId = String.Empty;
                    string clientParentRecordId = UploadTableRecordId;
                    string clientUploadTableName = UploadTable;
                    string clientUploadTablePriKey = UploadTablePriKey;
                    string clientUploadTitle = UploadTitle;
                    string clientUploadMode = UploadDefaultMode.ToString();

                    if (TableNameRecordIdPairExists(clientUploadTableName, clientParentRecordId))
                    {
                        string clientFormatString = "return showEformUploadedFiles('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', event);";
                        string[] clientFormatArgs = new string[]
                        {
                            clientEformId,
                            clientEformName,
                            clientEformSectionName,
                            clientRecordId,
                            clientParentRecordId,
                            clientUploadTableName,                
                            clientUploadTablePriKey,
                            clientUploadTitle,
                            clientUploadMode
                        };
                        string clientScript = string.Format(clientFormatString, clientFormatArgs);
                        this.Attributes["onclick"] = clientScript;
                    }
                    else
                    {
                        if (String.IsNullOrEmpty(clientUploadTableName) || String.IsNullOrEmpty(clientParentRecordId))
                            this.Attributes["onclick"] = "return alert('Both the UploadTable and UploadTableRecordId control attributes must be specified to upload a file.');";
                        else
                            this.Attributes["onclick"] = "return alert('No xml node with table name \"" + clientUploadTableName + "\" and record id \"" + clientParentRecordId + "\" was found in the eform xml.  Ensure the correct UploadTable and UploadTableRecordId attributes are specifed for the file upload control.');";
                    }
                }
                else
                {
                    this.Attributes["onclick"] = "return alert('Only " + maxFileCount + " files can be uploaded for this record');";
                }
            }
            else
            {
                this.Attributes["onclick"] = "return alert('Eform must be saved before uploading files');";
            }
        }

        protected override void Render(HtmlTextWriter w)
        {
            try
            {
                // No need for ViewState
                this.EnableViewState = false;

                // only render when visible
                if (this.Visible)
                {
                    string imageListWidth = !ThumbnailListWidth.IsEmpty ? ThumbnailListWidth.ToString() : "";// "75px";

                    LiteralControl listStart = new LiteralControl("<table><tr><td valign=\"middle\" width=\"" + imageListWidth + "\"><div style=\" overflow-x: auto; overflow-y: hidden; width: " + imageListWidth + "; height: 52px; vertical-align: middle; text-align: center; \"><table height=\"100%\" ><tr>");
                    LiteralControl listEnd = new LiteralControl("</tr></table></div></td>");

                    LiteralControl btnStart = new LiteralControl("<td valign=\"middle\" >");
                    LiteralControl btnEnd = new LiteralControl("</td></tr></table>");

                    listStart.RenderControl(w);
                    SetExistingFileImages(w);
                    listEnd.RenderControl(w);

                    btnStart.RenderControl(w);
                    base.Render(w); // renders this control; sequence matters
                    btnEnd.RenderControl(w);
                }

            }
            catch (Exception ex)
            {
                w.Write("Error building EformUploadFileWidget:<br>");
                w.Write(ex.Message);
            }
        }

        private void SetExistingFileImages(HtmlTextWriter w)
        {
            if (!String.IsNullOrEmpty(UploadTable) && !String.IsNullOrEmpty(UploadTableRecordId))
            {
                bool filesFound = false;

                // get main record node
                XmlDocument eformXML = GetEformXml();
                var mainRecordNode = eformXML.SelectSingleNode("//" + UploadTable + "[@RecordId='" + UploadTableRecordId + "']");
                if (mainRecordNode != null)
                {
                    // if file upload nodes exists, then retrieve info
                    XmlNodeList node_Files = mainRecordNode.SelectNodes("Files");
                    if (node_Files != null)
                    {
                        filesFound = node_Files.Count > 0 ? true : false;
                        foreach (XmlNode currentNode in node_Files)
                        {
                            string fileRecordId = currentNode.Attributes["RecordId"].Value;
                            XmlNode node_File = currentNode.SelectSingleNode("File");
                            if (node_File != null)
                            {
                                string fileExt = node_File.Attributes[UploadedFile.FileExtension].Value;
                                string fileLabel = node_File.Attributes[UploadedFile.FileLabel].Value;
                                string vThumbPath = "~/Plugins/FileLoader/support_images/" + GetThumnailPrefix(fileExt) + THUMB_EXTENSION + ".gif";
                                if (!System.IO.File.Exists(HttpContext.Current.Server.MapPath(vThumbPath)))
                                {
                                    // default to .doc thumb image
                                    vThumbPath = "~/Plugins/FileLoader/support_images/doc" + THUMB_EXTENSION + ".gif";
                                }
                                Image fileImage = new Image();
                                fileImage.ImageUrl = vThumbPath;
                                fileImage.ToolTip = !String.IsNullOrEmpty(fileLabel) ? "Edit/View File " + fileLabel : "Edit/View Uploaded File";
                                fileImage.ID = this.ClientID + "_file_" + fileRecordId;
                                //fileImage.Style[HtmlTextWriterStyle.PaddingRight] = "3px";
                                fileImage.Style[HtmlTextWriterStyle.Cursor] = "pointer";
                                if (Enabled && Visible)
                                {
                                    BuildExistingFileScript(fileImage, node_File, fileRecordId);
                                }
                                LiteralControl imageCellStart = new LiteralControl("<td valign=\"top\" align=\"left\" >");
                                LiteralControl imageCellEnd = new LiteralControl("</td>");

                                imageCellStart.RenderControl(w);
                                fileImage.RenderControl(w);
                                imageCellEnd.RenderControl(w);
                            }
                        }
                    }
                }

                if (!filesFound)
                {
                    LiteralControl nofileMsg = new LiteralControl("<td valign=\"middle\" align=\"center\" style=\"font-size: 9pt; font-style: italic; white-space: nowrap;\"><i>no uploads</i></td>");
                    nofileMsg.RenderControl(w);
                }
            }
        }

        private void BuildExistingFileScript(Image fileImage, XmlNode node_File, string fileRecordId)
        {
            // validate
            int eformId = GetEformId();
            string eformName = GetEformName();
            string eformSectionName = GetEformSectionName();
            if (eformId != 0)
            {
                fileImage.Visible = true;

                string clientEformId = eformId.ToString();
                string clientEformName = eformName;
                string clientEformSectionName = eformSectionName;
                string clientRecordId = fileRecordId;
                string clientParentRecordId = UploadTableRecordId;
                string clientUploadTableName = UploadTable;
                string clientUploadTablePriKey = UploadTablePriKey;
                string clientUploadTitle = UploadTitle;
                string clientUploadMode = node_File.Attributes["Mode"].Value;
                string clientFormatString = "return showEformUploadedFiles('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', '{7}', '{8}', event);";
                string[] clientFormatArgs = new string[]
                {
                    clientEformId,
                    clientEformName,
                    clientEformSectionName,
                    clientRecordId,
                    clientParentRecordId,
                    clientUploadTableName,                
                    clientUploadTablePriKey,
                    clientUploadTitle,
                    clientUploadMode
                };
                string clientScript = string.Format(clientFormatString, clientFormatArgs);
                fileImage.Attributes["onclick"] = clientScript;
            }
            else
            {
                // hide upload button if eform has not been saved yet
                fileImage.Visible = false;
            }
        }

        // refactor (sub class base eform component) ???
        private int GetEformId()
        {
            int eformId = 0;
            if (Page is EFormBasePage)
            {
                EFormBasePage ePage = Page as EFormBasePage;
                eformId = ePage.EFormId;
            }
            return eformId;
        }

        private string GetEformName()
        {
            string name = null;
            if (Page is EFormBasePage)
            {
                EFormBasePage ePage = Page as EFormBasePage;
                name = ePage.EFormName;
            }
            return name;
        }

        private string GetEformSectionName()
        {
            string secitonName = null;
            if (Page is EFormBasePage)
            {
                EFormBasePage ePage = Page as EFormBasePage;
                secitonName = ePage.EFormSectionName;
            }
            return secitonName;
        }

        private XmlDocument GetEformXml()
        {
            // load eform
            XmlDocument eformXML = new XmlDocument();
            int eformId = GetEformId();
            EForm eForm = new EForm();
            eForm.Get(eformId);
            if (!eForm.IsNull(BOL.EForm.EFormXML))
            {
                eformXML.LoadXml(eForm[BOL.EForm.EFormXML].ToString());
            }
            return eformXML;
        }

        private int? GetReocrdCurrentFileCount()
        {
            int? fileCount = null;

            if (!String.IsNullOrEmpty(UploadTable) && !String.IsNullOrEmpty(UploadTableRecordId))
            {
                // get main record node
                XmlDocument eformXML = GetEformXml();
                var mainRecordNode = eformXML.SelectSingleNode("//" + UploadTable + "[@RecordId='" + UploadTableRecordId + "']");
                if (mainRecordNode != null)
                {
                    // if file upload nodes already exists, then retrieve info
                    XmlNodeList node_Files = mainRecordNode.SelectNodes("Files");
                    fileCount = node_Files.Count;
                }
            }
            return fileCount;
        }

        private Boolean TableNameRecordIdPairExists(string tableName, string recordId)
        {
            if (!String.IsNullOrEmpty(tableName) && !String.IsNullOrEmpty(recordId))
            {
                // get main record node
                XmlDocument eformXML = GetEformXml();
                var mainRecordNode = eformXML.SelectSingleNode("//" + UploadTable + "[@RecordId='" + UploadTableRecordId + "']");
                if (mainRecordNode != null)
                {
                    return true;
                }
            }
            return false;
        }

        private String GetThumnailPrefix(string ext)
        {
            if (IsDocumentType(IMG_EXTENSIONS, ext))
                return "img";
            else
                return ext.TrimStart('.');
        }

        /// <summary>
        /// Checks extensionsList for extension
        /// </summary>
        /// <param name="extensionsList">List Of extensions</param>
        /// <param name="extension">extension</param>
        /// <returns></returns>
        protected bool IsDocumentType(Array extensionsList, string extension)
        {
            bool occurs = Array.IndexOf(extensionsList, extension.ToLower()) >= 0;
            return occurs;

        }
    }
    #endregion

    /// <summary>
    /// 
    /// </summary>
    public class EformAdjunct : CaisisAdjunct
    {
        private string recordId;
        private string parentRecordId;

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }
    }

    /// <summary>
    /// Represents a Label for displaying the value of a DefaultField
    /// </summary>
    public class EformDefaultLabel:Label
    {
        private string defaultField;

        /// <summary>
        /// Gets or sets the field mapping of the default field
        /// </summary>
        public string DefaultField
        {
            get
            {
                return defaultField;
            }
            set
            {
                defaultField = value;
            }
        }

        public EformDefaultLabel()
            : base()
        {
        }        
    }

    [DefaultProperty("Text"), ToolboxData("<{0}:EformTextBox runat=server></{0}:EformTextBox>")]
    public class EformTextBox : CaisisTextBox, IEformInputField
    {
        #region private instance members
        private string recordId;
        private string parentRecordId;
        #endregion

        #region IEformInputField Members

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }

        #endregion

        #region ICaisisInputControl Members


        public new string Table
        {
            get { return base.Table; }
            set { base.Table = value; }
        }

        public new string Field
        {
            get { return base.Field; }
            set { base.Field = value; }
        }

        public new string FieldLabel
        {
            get { return base.FieldLabel; }
            set { base.FieldLabel = value; }
        }

        public new bool Required
        {
            get { return base.Required; }
            set { base.Required = value; }
        }

        #endregion

        #region enable hidden stuff
        private string enableHiddenOnUIEvent;
        
        [Obsolete]
        public string EnableHiddenOnUIEvent
        {
            get { return enableHiddenOnUIEvent; }
            set { enableHiddenOnUIEvent = value; }
        }
        #endregion

        #region allow adding functionality to the client-side onchange event
        private string appendToOnChange;

        public string AppendToOnChange
        {
            get { return appendToOnChange; }
            set { appendToOnChange = value; }
        }
        #endregion

        public EformTextBox() : base() { }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            // how do we handle the problem of blurring, null input, etc.?
            _EnableHidden.AppendEnableHiddenOnBlurAttributes(this, this.enableHiddenOnUIEvent);

            if (this.appendToOnChange != null && !"".Equals(this.appendToOnChange))
            {
                PageUtil.AttachClientEventToControl(this, "onblur", this.appendToOnChange);
            }
        }
    }


    [DefaultProperty("Text"), ToolboxData("<{0}:EformTextArea runat=server></{0}:EformTextArea>")]
    public class EformTextArea : CaisisTextArea, IEformInputField
    {
        #region private instance members
        private string recordId;
        private string parentRecordId;
        #endregion

        #region IEformInputField Members

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }

        #endregion

        #region ICaisisInputControl Members

        public new string Table
        {
            get { return base.Table; }
            set { base.Table = value; }
        }

        public new string Field
        {
            get { return base.Field; }
            set { base.Field = value; }
        }

        public new string FieldLabel
        {
            get { return base.FieldLabel; }
            set { base.FieldLabel = value; }
        }

        public new bool Required
        {
            get { return base.Required; }
            set { base.Required = value; }
        }

        #endregion

        public EformTextArea() : base() { ShowTextEditor = false; }
    }


    [DefaultProperty("Text"), ToolboxData("<{0}:EformComboBox runat=server></{0}:EformComboBox>")]
    public class EformComboBox : CaisisComboBox, IEformInputField
    {
        #region private instance members
        private string recordId;
        private string parentRecordId;
        #endregion

        #region IEformInputField Members

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }

        #endregion

        #region ICaisisInputControl Members

        public new string Table
        {
            get { return base.Table; }
            set { base.Table = value; }
        }

        public new string Field
        {
            get { return base.Field; }
            set { base.Field = value; }
        }

        public new string FieldLabel
        {
            get { return base.FieldLabel; }
            set { base.FieldLabel = value; }
        }

        public new bool Required
        {
            get { return base.Required; }
            set { base.Required = value; }
        }

        #endregion

        #region enable hidden stuff
        private string enableHiddenOnUIEvent;

        [Obsolete]
        public string EnableHiddenOnUIEvent
        {
            get { return enableHiddenOnUIEvent; }
            set 
            {
                enableHiddenOnUIEvent = value; 
            }
        }
        #endregion

        public EformComboBox() : base() { }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            _EnableHidden.AddEnableHiddenOnBlurAttributes(this, this.enableHiddenOnUIEvent);
        }

        protected override void Render(HtmlTextWriter w)
        {
            this.OnClientEvent("onfocus", "executeEFormComboEvent(this.value,this.id);");
            base.Render(w);
        }
    }


    [DefaultProperty("Text"), ToolboxData("<{0}:EformDropDownList runat=server></{0}:EformDropDownList>")]
    public class EformDropDownList : CaisisSelect, IEformInputField  // rename --> EformDropDownList
    {
        #region private instance members
        private string recordId;
        private string parentRecordId;
        #endregion

        #region IEformInputField Members

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }

        #endregion

        #region ICaisisInputControl Members

        public new string Table
        {
            get { return base.Table; }
            set { base.Table = value; }
        }

        public new string Field
        {
            get { return base.Field; }
            set { base.Field = value; }
        }

        public new string FieldLabel
        {
            get { return base.FieldLabel; }
            set { base.FieldLabel = value; }
        }

        public new bool Required
        {
            get { return base.Required; }
            set { base.Required = value; }
        }

        #endregion

        #region enable hidden stuff
        private string enableHiddenOnUIEvent;

        [Obsolete]
        public string EnableHiddenOnUIEvent
        {
            get { return enableHiddenOnUIEvent; }
            set { enableHiddenOnUIEvent = value; }
        }
        #endregion

        #region allow adding functionality to the client-side onchange event
        private string appendToOnChange;

        public string AppendToOnChange
        {
            get { return appendToOnChange; }
            set { appendToOnChange = value; }
        }
        #endregion

        public EformDropDownList() : base() { }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            ShowLabel = false;
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            _EnableHidden.AddEnableHiddenOnSelectAttributes(this, this.enableHiddenOnUIEvent);

            if (this.appendToOnChange != null && !"".Equals(this.appendToOnChange))
            {
                PageUtil.AttachClientEventToControl(this, "onchange", this.appendToOnChange);
            }
        }
    }


    [DefaultProperty("Text"), ToolboxData("<{0}:EformHidden runat=server></{0}:EformHidden>")]
    public class EformHidden : CaisisHidden, IEformInputField
    {
        #region private instance members
        private string recordId;
        private string parentRecordId;
        #endregion

        #region IEformInputField Members

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }

        #endregion

        #region ICaisisInputControl Members

        public new string Table
        {
            get { return base.Table; }
            set { base.Table = value; }
        }

        public new string Field
        {
            get { return base.Field; }
            set { base.Field = value; }
        }

        public new string FieldLabel
        {
            get { return base.FieldLabel; }
            set { base.FieldLabel = value; }
        }

        public new bool Required
        {
            get { return base.Required; }
            set { base.Required = value; }
        }

        #endregion

        public EformHidden() : base() { }
    }


    [DefaultProperty("Text"), ToolboxData("<{0}:EformCheckBox runat=server></{0}:EformCheckBox>")]
    public class EformCheckBox : CaisisCheckBox, IEformInputField
    {
        #region private instance members
        private string recordId;
        private string parentRecordId;
        private string _value;
        #endregion

        #region IEformInputField Members

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }

        #endregion

        #region ICaisisInputControl Members

        public new string Table
        {
            get { return base.Table; }
            set { base.Table = value; }
        }

        public new string Field
        {
            get { return base.Field; }
            set { base.Field = value; }
        }

        public new string FieldLabel
        {
            get { return base.FieldLabel; }
            set { base.FieldLabel = value; }
        }

        public new bool Required
        {
            get { return base.Required; }
            set { base.Required = value; }
        }

        #endregion

        #region additional properties
        public string Value
        {
            get { return _value; }
            set { _value = value; }
        }
        #endregion

        #region enable hidden stuff
        private string enableHiddenOnUIEvent;

        [Obsolete]
        public string EnableHiddenOnUIEvent
        {
            get { return enableHiddenOnUIEvent; }
            set { enableHiddenOnUIEvent = value; }
        }
        #endregion

        #region allow adding functionality to the client-side onchange event
        private string appendToOnChange;

        public string AppendToOnChange
        {
            get { return appendToOnChange; }
            set { appendToOnChange = value; }
        }
        #endregion

        public EformCheckBox() : base() { }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            if (!string.IsNullOrEmpty(this.EnableHiddenOnUIEvent))
            {
                string hiddenClientIds = string.Join(",", PageUtil.GetListClientIds(this.NamingContainer, EnableHiddenOnUIEvent));
                string onclickEvent = "enableHiddensOnBlur(this.checked?'true':'','" + hiddenClientIds + "');";
                PageUtil.AttachClientEventToControl(this, "onclick", onclickEvent);
            }

            if (this.appendToOnChange != null && !"".Equals(this.appendToOnChange))
            {
                PageUtil.AttachClientEventToControl(this, "onclick", this.appendToOnChange);
            }
        }
    }


    [DefaultProperty("Text"), ToolboxData("<{0}:EformRadioButtonList runat=server></{0}:EformRadioButtonList>")]
    public class EformRadioButtonList : CaisisRadioButtonList, IEformInputField
    {
        #region private instance members
        private string recordId;
        private string parentRecordId;

        private string field1;
        private string field2;
        private string field3;
        private string value1;
        private string value2;
        private string value3;
        #endregion

        #region IEformInputField Members

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }

        #endregion

        #region ICaisisInputControl Members

        public new string Table
        {
            get { return base.Table; }
            set { base.Table = value; }
        }

        public new string Field
        {
            get { return base.Field; }
            set { base.Field = value; }
        }

        public new string FieldLabel
        {
            get { return base.FieldLabel; }
            set { base.FieldLabel = value; }
        }

        public new bool Required
        {
            get { return base.Required; }
            set { base.Required = value; }
        }

        #endregion

        #region boilerplate Properties
        public string Field1
        {
            get { return field1; }
            set { field1 = value; }
        }

        public string Field2
        {
            get { return field2; }
            set { field2 = value; }
        }

        public string Field3
        {
            get { return field3; }
            set { field3 = value; }
        }

        public string Value1
        {
            get { return value1; }
            set { value1 = value; }
        }

        public string Value2
        {
            get { return value2; }
            set { value2 = value; }
        }

        public string Value3
        {
            get { return value3; }
            set { value3 = value; }
        }
        #endregion

        #region enable hidden stuff
        private string enableHiddenOnUIEvent;

        [Obsolete]
        public string EnableHiddenOnUIEvent
        {
            get { return enableHiddenOnUIEvent; }
            set { enableHiddenOnUIEvent = value; }
        }
        #endregion

        public EformRadioButtonList() : base() { }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            _EnableHidden.AddEnableHiddenOnClickAttributes(this, this.enableHiddenOnUIEvent);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    [DefaultProperty("Text"), ToolboxData("<{0}:EformCheckBoxList runat=server></{0}:EformCheckBoxList>")]
    public class EformCheckBoxList : CaisisCheckBoxList, IEformInputField
    {
        #region private instance members
        private string recordId;
        private string parentRecordId;
        private string appendToOnChange;
        #endregion

        #region IEformInputField Members

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }

        public string AppendToOnChange
        {
            get { return appendToOnChange; }
            set { appendToOnChange = value; }
        }

        #endregion

        public EformCheckBoxList()
            : base()
        {
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            PageUtil.AttachClientEventToControl(this, "onchange", appendToOnChange);
        }
    }

    [DefaultProperty("Text"), ToolboxData("<{0}:EformRadioButton runat=server></{0}:EformRadioButton>")]
    public class EformRadioButton : CaisisRadioButton, IEformInputField
    {
        #region private instance members
        private string recordId;
        private string parentRecordId;
        private string _value;
        #endregion

        #region IEformInputField Members

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }

        #endregion

        #region ICaisisInputControl Members

        public new string Table
        {
            get { return base.Table; }
            set { base.Table = value; }
        }

        public new string Field
        {
            get { return base.Field; }
            set { base.Field = value; }
        }

        public new string FieldLabel
        {
            get { return base.FieldLabel; }
            set { base.FieldLabel = value; }
        }

        public new bool Required
        {
            get { return base.Required; }
            set { base.Required = value; }
        }

        #endregion

        #region additional properties
        public string Value
        {
            get { return _value; }
            set { _value = value; }
        }
        #endregion

        #region enable hidden stuff
        private string enableHiddenOnUIEvent;

        [Obsolete]
        public string EnableHiddenOnUIEvent
        {
            get { return enableHiddenOnUIEvent; }
            set { enableHiddenOnUIEvent = value; }
        }
        #endregion

        #region expand clickable area
        private bool expandClickableArea = true; // defaults to true

        public bool ExpandClickableArea
        {
            get { return expandClickableArea; }
            set { expandClickableArea = value; }
        }
        #endregion

        public EformRadioButton() : base() { }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            _EnableHidden.AddEnableHiddenOnClickAttributes(this, this.enableHiddenOnUIEvent);
        }

        protected override void Render(HtmlTextWriter writer)
        {
            // expand clickable area if set
            if (expandClickableArea)
            {
                writer.Write("<label for=\"");
                writer.Write(this.ClientID);
                writer.Write("\">&nbsp;&nbsp;");
            }

            base.Render(writer);

            if (expandClickableArea)
            {
                writer.Write("&nbsp;&nbsp;</label>");
            }
        }
    }


    /// <summary>
    /// This class is designed to comprise a group of EformRadioButtons...
    /// </summary>
    [DefaultProperty("Text"), ToolboxData("<{0}:EformRadioButtonGroup runat=server></{0}:EformRadioButtonGroup>")]
    [ParseChildren(ChildrenAsProperties = false)]
    public class EformRadioButtonGroup : Control, IEformInputField, INamingContainer
    {
        #region private members
        private string groupName;
        private string field;
        private string field1;
        private string field2;
        private string field3;
        private string value1;
        private string value2;
        private string value3;

        private string table;
        private string recordId;
        private string parentRecordId;
        private bool uncheckable;
        #endregion

        /// <summary>
        /// An event signaling that the control's SelectedIndex(selected item in dropdown) has changed during PostBack
        /// </summary>
        public event CaisisEventHandler ValueChanged;

        /// <summary>
        /// 
        /// </summary>
        public event CaisisEventHandler PreRender;

        #region boilerplate Properties
        /// <summary>
        /// If set, will override the GroupName property of each child EformRadioButton control
        /// </summary>
        public string GroupName
        {
            get { return groupName; }
            set { groupName = value; }
        }

        public string Field1
        {
            get { return field1; }
            set { field1 = value; }
        }

        public string Field2
        {
            get { return field2; }
            set { field2 = value; }
        }

        public string Field3
        {
            get { return field3; }
            set { field3 = value; }
        }

        public string Value1
        {
            get { return value1; }
            set { value1 = value; }
        }

        public string Value2
        {
            get { return value2; }
            set { value2 = value; }
        }

        public string Value3
        {
            get { return value3; }
            set { value3 = value; }
        }

        public string Table
        {
            get { return table; }
            set { table = value; }
        }

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }

        /// <summary>
        /// Gets or sets if the radio button group items are uncheckable
        /// </summary>
        public bool Uncheckable
        {
            get
            {
                return uncheckable;
            }
            set
            {
                uncheckable = value;
            }
        }
        #endregion

        #region ICaisisInputControl Members

        public string Field
        {
            get { return field; }
            set { field = value; }
        }

        public string Value
        {
            // TODO: ADD IMPLEMENTATION IF THIS IS USED ANYWHERE
            get { return null; }
            set { }
        }

        public bool Visibility
        {
            get { return this.Visibility; }
            set { this.Visibility = value; }
        }

        public string FieldLabel
        {
            get
            {
                // TODO:  Add EformRadioButtonGroup.FieldLabel getter implementation
                return null;
            }
            set
            {
                // TODO:  Add EformRadioButtonGroup.FieldLabel setter implementation
            }
        }

        public bool Required
        {
            get
            {
                // TODO:  Add EformRadioButtonGroup.Required getter implementation
                return false;
            }
            set
            {
                // TODO:  Add EformRadioButtonGroup.Required setter implementation
            }
        }

        public bool ShowHelpBubble
        {
            get
            {
                // TODO:  Add EformRadioButtonGroup.ShowHelpBubble getter implementation
                return false;
            }
            set
            {
                // TODO:  Add EformRadioButtonGroup.ShowHelpBubble setter implementation
            }
        }

        public string HelpDescription
        {
            get
            {
                // TODO:  Add EformRadioButtonGroup.HelpDescription getter implementation
                return null;
            }
            set
            {
                // TODO:  Add EformRadioButtonGroup.HelpDescription setter implementation
            }
        }

        public bool ShowLabel
        {
            get
            {
                // TODO:  Add EformRadioButtonGroup.ShowLabel getter implementation
                return false;
            }
            set
            {
                // TODO:  Add EformRadioButtonGroup.ShowLabel setter implementation
            }
        }

        public bool Enabled
        {
            get
            {
                return true;
            }
            set
            {
            }
        }


        public string CssClass
        {
            set
            {
                // needed to implemenet ICaisisInputControl
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public string LabelClass
        {
            get
            {
                return string.Empty;
            }
            set
            {

            }
        }

        #endregion

        #region group style
        private string groupStyle;

        /// <summary>
        /// Sets the style attribute for the radio buttons in the group
        /// </summary>
        public string GroupStyle
        {
            get { return groupStyle; }
            set { groupStyle = value; }
        }
        #endregion

        public EformRadioButtonGroup()
            : base()
        {
            this.uncheckable = false;
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            foreach (Control c in this.Controls)
            {
                if (c is EformRadioButton)
                {
                    EformRadioButton r = (EformRadioButton)c;
                    r.Uncheckable = this.Uncheckable;
                    DecorateRadioButton(r);
                }
            }
        }

        protected void OnValueChange(object sender, EventArgs e)
        {
            if (ValueChanged != null)
            {
                ValueChanged(this, e);
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            // handle GroupStyle
            if (groupStyle != null && groupStyle != "")
            {
                foreach (Control c in this.Controls)
                {
                    if (c is EformRadioButton)
                    {
                        EformRadioButton r = (EformRadioButton)c;
                        r.Uncheckable = this.Uncheckable;
                        r.Attributes["style"] = groupStyle;
                    }
                }
            }

            if (PreRender != null)
            {
                PreRender(this, e);
            }
        }

        // need to do this on load, not render
        private void DecorateRadioButton(EformRadioButton r)
        {
            if (groupName != null && !"".Equals(groupName))
            {
                r.GroupName = groupName;
            }

            if (table != null && !"".Equals(table))
            {
                r.Table = table;
            }

            if (recordId != null && !"".Equals(recordId))
            {
                r.RecordId = recordId;
            }
        }

        // why do we need this? because .NET sometimes creates control names using "$" and other times ":" and it's NOT predictable in 2.0
        private string GetUserDefinedRadioButtonId(HttpRequest request)
        {
            int separatorPosition = this.UniqueID.IndexOf(this.Field) - 1;
            string controlIDSeparator = this.UniqueID.Substring(separatorPosition, 1);
            string activatedId = request.Form[this.UniqueID + controlIDSeparator + this.GroupName];
            return activatedId;
        }

        public EformRadioButton GetCheckedButton(HttpRequest request)
        {
            string activatedId = GetUserDefinedRadioButtonId(request);

            if (activatedId == null || "".Equals(activatedId))
            {
                return null;
            }

            foreach (Control c in this.Controls)
            {
                if (c is EformRadioButton)
                {
                    EformRadioButton r = (EformRadioButton)c;
                    if (activatedId.Equals(r.ID))
                    {
                        return r;
                    }
                }
            }

            return null;
        }

        public string GetSelectedValue(HttpRequest request)
        {
            string activatedId = GetUserDefinedRadioButtonId(request);

            if (activatedId == null || "".Equals(activatedId))
            {
                return null;
            }

            foreach (Control c in this.Controls)
            {
                if (c is EformRadioButton)
                {
                    EformRadioButton r = (EformRadioButton)c;
                    if (activatedId.Equals(r.ID))
                    {
                        return r.Value;
                    }
                }
            }

            return null;
        }
    }

    /// <summary>
    /// A read-only combo box.
    /// </summary>
    [DefaultProperty("Text"), ToolboxData("<{0}:EformSelect runat=server></{0}:EformSelect>")]
    public class EformSelect : CaisisComboBox, IEformInputField
    {
        #region private types to implement interfaces
        private string recordId;
        private string parentRecordId;
        #endregion

        #region IEformInputField Members

        public string RecordId
        {
            get { return recordId; }
            set { recordId = value; }
        }

        public string ParentRecordId
        {
            get { return parentRecordId; }
            set { parentRecordId = value; }
        }

        #endregion
        #region enable hidden stuff
        private string enableHiddenOnUIEvent;

        [Obsolete]
        public string EnableHiddenOnUIEvent
        {
            get { return enableHiddenOnUIEvent; }
            set { enableHiddenOnUIEvent = value; }
        }
        #endregion

        #region allow adding functionality to the client-side onchange event
        private string appendToOnChange;

        public string AppendToOnChange
        {
            get { return appendToOnChange; }
            set { appendToOnChange = value; }
        }
        #endregion

        #region SelectedValue - just link to this.Value(Text)
        public string SelectedValue
        {
            get { return this.Value; }
            set { this.Value = value; }
        }
        #endregion

        private string anonymousFunction = null;

        public EformSelect()
        {
            this.ReadOnly = true;
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            this.CssClass = "pdComboBox";
            if (string.IsNullOrEmpty(this.Style["width"]))
            {
                this.Style["width"] = "100px";
            }
            this.anonymousFunction = this.BuildAnonymousFunction();
            this.OnClientEvent("onblur", anonymousFunction);
        }

        /// <summary>
        /// Build Anonymous Function, and execute on client event, only when inital value changes
        /// </summary>
        /// <returns></returns>
        private string BuildAnonymousFunction()
        {
            string anonFunName = "_" + this.ClientID + "anon_";
            StringBuilder b = new StringBuilder("var " + anonFunName + "= function(_val) { ");
            // enable hiddens
            if (this.enableHiddenOnUIEvent != null && this.enableHiddenOnUIEvent != "")
            {
                b.Append("enableHiddens('");
                b.Append(this.GetClientSideHiddenList(this.enableHiddenOnUIEvent));
                b.Append("'); ");
            }
            // we need to replace "this.value" with "document.getElementById('abc').value"
            if (this.appendToOnChange != null && this.appendToOnChange != "")
            {
                b.Append(this.appendToOnChange.Replace("this.value", "_val"));
            }
            // wrap up
            b.Append(" };if(this.value!=this.defaultValue) { " + anonFunName + "(this.value); }");
            return b.ToString();
        }

        private string GetClientSideHiddenList(string baseHiddenList)
        {
            if (baseHiddenList != null)
            {
                ArrayList enable = new ArrayList();
                string[] hiddens = baseHiddenList.Split(new char[] { ',' });
                foreach (string h in hiddens)
                {
                    Control c = this.Parent.FindControl(h);
                    if (c != null)
                    {
                        enable.Add(c.ClientID);
                    }
                }
                return String.Join(",", (string[])enable.ToArray(typeof(string)));
            }
            return "";
        }
    }

    #region Deprecated Controls - Remain for backwards compatibility

    [DefaultProperty("CIC"), ToolboxData("<{0}:EformExtendedRadioButtonList runat=server></{0}:EformExtendedRadioButtonList>")]
    [Obsolete("This control has been deprecated, funcionality acquired by EformRadioButtonList.")]
    public class EformExtendedRadioButtonList : EformRadioButtonList { }

    [DefaultProperty("CIC"), ToolboxData("<{0}:EformExtendedCheckBoxList runat=server></{0}:EformExtendedCheckBoxList>")]
    [Obsolete("This control has been deprecated, funcionality acquired by EformCheckBoxList.")]
    public class EformExtendedCheckBoxList : EformCheckBoxList { }

    #endregion

}
