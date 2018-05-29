using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.PluginFramework;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core;

namespace Caisis.UI.Plugins.FileLoader
{
    //public enum FileLoaderUploadType
    //{
    //    Image,
    //    Document,
    //}

    //public class FileLoaderFileType
    //{
    //    private string ext;
    //    public string Extension
    //    {
    //        get
    //        {
    //            return ext;
    //        }
    //    }

    //    private string thumbPath;
    //    public string ThumbPath
    //    {
    //        get
    //        {
    //            return thumbPath;
    //        }
    //    }

    //    private FileLoaderUploadType fileType;
    //    public FileLoaderUploadType FileType
    //    {
    //        get
    //        {
    //            return fileType;
    //        }
    //    }

    //    /// <summary>
    //    /// 
    //    /// </summary>
    //    public bool IsImage
    //    {
    //        get
    //        {
    //            return fileType == FileLoaderUploadType.Image;
    //        }
    //    }

    //    /// <summary>
    //    /// 
    //    /// </summary>
    //    public bool IsDocument
    //    {
    //        get
    //        {
    //            return fileType == FileLoaderUploadType.Document;
    //        }
    //    }

    //    public FileLoaderFileType(string ext, string thumbPath, FileLoaderUploadType fileType)
    //    {
    //        this.ext = ext;
    //        this.thumbPath = thumbPath;
    //        this.fileType = fileType;
    //    }
    //}

    public static class FileLoaderUtil
    {
        public static readonly List<string> IMG_EXTENSIONS = new List<string>(new string[] { ".jpg", ".jpeg", ".gif", ".bmp", ".png" });
        public static readonly List<string> DOC_EXTENSIONS = new List<string>(new string[] { ".pdf", ".doc", ".txt", ".rtf", ".xls", ".docx", ".xlsx" });

        public static readonly string THUMB_EXTENSION = "_thumb";
        private static readonly int THUMB_WIDTH = 100;
        private static readonly int THUMB_HEIGHT = 75;

        // allows only files under 3 MB
        private static readonly int MAX_FILE_SIZE = 3145728;

        /// <summary>
        /// Gets the full path (Mapped Path/Non-Virtual) to the File Upload location
        /// </summary>
        public static string FILE_UPLOAD_ROOT
        {
            get
            {
                string webConfigUploadPath = System.Configuration.ConfigurationSettings.AppSettings["FileUploadLocation"].ToString();
                string fullVirtualPath = VirtualPathUtility.ToAbsolute(webConfigUploadPath);
                // Absolute path needs trailing "/"
                if (!fullVirtualPath.EndsWith("/"))
                {
                    fullVirtualPath = fullVirtualPath + "/";
                }
                string fullPathOnDisk = HttpContext.Current.Server.MapPath(fullVirtualPath);
                return fullPathOnDisk;
            }
        }

        public static string GetFileOnDisk(UploadedFile userFile, bool isThumb)
        {
            string userTable = userFile[UploadedFile.TableName].ToString();
            string userFileId = userFile[UploadedFile.FileId].ToString();
            string userFileExt = userFile[UploadedFile.FileExtension].ToString();
            if (isThumb && IsDocument(userFileExt))
            {
                string vThumbPath = "support_images/" + userFileExt.TrimStart('.') + THUMB_EXTENSION + ".gif";
                string fullPathToThumb = HttpContext.Current.Server.MapPath(vThumbPath);
                return fullPathToThumb;
            }
            string fullPathToFile = FILE_UPLOAD_ROOT + userTable + System.IO.Path.DirectorySeparatorChar + userFileId + (isThumb ? THUMB_EXTENSION : "") + userFileExt;
            return fullPathToFile;
        }

        /// <summary>
        /// Returns whether or not a file type (based on extensions w/ ".") is valid for uploading/viewing.
        /// </summary>
        /// <param name="ext"></param>
        /// <returns></returns>
        public static bool IsValidFileType(string ext)
        {
            return IsImage(ext) || IsDocument(ext);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ext"></param>
        /// <returns></returns>
        public static bool IsImage(string ext)
        {
            return IMG_EXTENSIONS.Contains(ext);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ext"></param>
        /// <returns></returns>
        public static bool IsDocument(string ext)
        {
            return DOC_EXTENSIONS.Contains(ext);
        }
    }
    /// <summary>
    ///	Associates an image(.jpg, .bmp, .png) or a document file (.pdf, .rtf, .txt) with any record in the database. 
    /// </summary>
    /// 

    // TODO: if record is deleted, file will be orphaned. what to do?
    // PLUGIN DEPENDENCY: calling page must use naming convention TableName + Form: TODO; turn table name into an attribute of the plugin
    public partial class FileLoaderPlugin : CaisisPlugin
    {

        private string _tableName;
        private string _primaryKeyValue;
        private string _linkName;
        private bool _showThumbNail;
        private string _enteredByValue;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            //if (Request.QueryString["tableName"] != null && Request.QueryString["tableName"].ToString().Length > 0)
            //{
            //    _tableName = Request.QueryString["tableName"].ToString();
            //}

            // need both table name and primary key to activate plugin link
            //if( (_tableName != null && _tableName.Length > 0) && (PrimaryKeyValue != null && !PrimaryKeyValue.Equals("") )  && EnteredTimeValue.Length > 0  )
            if ((PrimaryKeyValue != null && !PrimaryKeyValue.Equals("")))
            {
                // Include groupId to identify file grouping
                string fileUploadPath = "FileUploadForm.aspx?tableName=" + this.PrimaryKeyTable + "&primaryKey=" + this.PrimaryKeyValue;
                string resolvedFileUploadPath = ResolveUrl(fileUploadPath);
                string onClickScript = "window.open('" + resolvedFileUploadPath + "','FileUploader', 'toolbars=no,resizable=yes,scrollbars=yes,width=900,height=800,left=20,top=20'); return false;";

                link.Attributes.Add("onclick", onClickScript);
                this.DisplayLink(this.PrimaryKeyTable, this.PrimaryKeyValue);
            }
            else
            {
                linkImage.ImageUrl = "~/Images/UploadFile.gif";
                link.Attributes.Add("onclick", "alert('Before uploading a file this form must saved and in an editable state.'); return false;");
            }
        }

        /// <summary>
        /// Displays thumbnail if one exists and property set to true, otherwise display file Label. Default to display generic "Upload File" image
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="tablePrimaryKey"></param>
        private void DisplayLink(string tableName, string tablePrimaryKey)
        {
            string _savePath = System.Configuration.ConfigurationSettings.AppSettings["FileUploadLocation"].ToString() + this.PrimaryKeyTable;
            _savePath = Page.ResolveUrl(_savePath);

            // Cheeck to see if files are uploaded for this record
            FilesDa da = new FilesDa();
            DataSet ds = da.GetRecordsByTableAndTablePK(this.PrimaryKeyTable, int.Parse(tablePrimaryKey));

            // If files are uploaded, show thumb for default
            if (ds.Tables[0].Rows.Count > 0)
            {
                string fileId = ds.Tables[0].Rows[0][UploadedFile.FileId].ToString();
                string fileExtension = ds.Tables[0].Rows[0][UploadedFile.FileExtension].ToString();
                string fileLabel = ds.Tables[0].Rows[0][UploadedFile.FileLabel].ToString();

                bool isFileAnImage = FileLoaderUtil.IsImage(fileExtension);

                // show thumbnail of image
                if (_showThumbNail == true && isFileAnImage)
                {
                    linkText.Visible = false;
                    linkImage.Visible = true;
                    UploadedFile biz = new UploadedFile();
                    biz.Get(int.Parse(fileId));

                    linkImage.ImageUrl = "DocumentLoader.aspx?fileId=" + Security.CustomCryptoHelper.Encrypt(fileId) + "&thumb=true";
                    linkImage.Attributes.Add("style", "border: solid 1px #cccccc; cursor: pointer;");
                    linkImage.ToolTip = "Click to view or edit this image.";

                }
                // show file label as link
                else if (!string.IsNullOrEmpty(fileLabel))
                {

                    //link.InnerHtml = "View " + fileLabel;
                    linkText.Text = "View " + fileLabel;
                    linkText.Visible = true;
                    linkImage.Visible = false;
                    link.Attributes.Add("style", "cursor: pointer;");
                }
                // default to showing generic view file image
                else
                {
                    linkText.Visible = false;
                    linkImage.Visible = true;
                    linkImage.ImageUrl = "~/Images/ViewFile.gif";
                }
            }
            else if (!string.IsNullOrEmpty(_linkName))
            {
                //link.InnerHtml = _linkName;
                linkText.Text = _linkName;
                linkText.Visible = true;
                linkImage.Visible = false;
            }
            else
            {
                linkText.Visible = false;
                linkImage.Visible = true;
                linkImage.ImageUrl = "~/Images/UploadFile.gif";
            }

            // Register's function for setting thumb image on plugin
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ImageReloader", "function setThumb(newSrc) {  var pluginTmb = document.getElementById('" + linkImage.ClientID + "'); if(pluginTmb) { pluginTmb.src = newSrc; } }", true);
        }

        /// <summary>
        /// if image file, display a thumbnail of the image as the link
        /// </summary>
        public bool ShowThumbnail
        {
            set
            {
                _showThumbNail = value;
            }
        }

        /// <summary>
        /// provide a link in text format 
        /// </summary>
        public string LinkName
        {
            get
            {
                return _linkName;
            }
            set
            {
                _linkName = value;
            }
        }

        /// <summary>
        /// the primary key value of the record the file should be associated to
        /// </summary>
        public string PrimaryKeyValue
        {
            get
            {
                if (_primaryKeyValue == null)
                {
                    // 4.0
                    // BusinessObjectFactory factory = new BusinessObjectFactory();
                    // BusinessObject bizo = BusinessObjectFactory.BuildBusinessObject(_tableName);
                    //_primaryKeyValue = ((HtmlInputHidden)Parent.FindControl(bizo.PrimaryKeyName)).Value;
                    if (Request["primKey"] != null)
                    {
                        _primaryKeyValue = Request["primKey"].ToString();
                    }
                    else if (this.Page != null)
                    {
                        object pkVal = this.Page.FindControl("PagePrimaryKey");
                        if (pkVal != null)
                        {
                            string tmpVal = ((HiddenField)pkVal).Value;
                            _primaryKeyValue = !string.IsNullOrEmpty(tmpVal) ? tmpVal : _primaryKeyValue;
                        }
                    }
                }

                return _primaryKeyValue;

            }
        }

        public string PrimaryKeyTable
        {
            get
            {
                if (_tableName == null)
                {
                    // 4.0
                    // BusinessObjectFactory factory = new BusinessObjectFactory();
                    // BusinessObject bizo = BusinessObjectFactory.BuildBusinessObject(_tableName);
                    //_primaryKeyValue = ((HtmlInputHidden)Parent.FindControl(bizo.PrimaryKeyName)).Value;
                    if (Request.QueryString["tableName"] != null && Request.QueryString["tableName"].ToString().Length > 0)
                    {
                        _tableName = Request.QueryString["tableName"].ToString();
                    }
                    else if (this.Page != null && this.Page.FindControl("PagePrimaryKeyTable") != null)
                    {
                        object ptVal = this.Page.FindControl("PagePrimaryKeyTable");
                        if (ptVal != null)
                        {
                            string tmpVal = ((HiddenField)ptVal).Value;
                            _tableName = !string.IsNullOrEmpty(tmpVal) ? tmpVal : _tableName;
                        }
                    }
                }

                return _tableName;

            }
        }

        #region CaisisPlugin members

        public override string ControlIdToModify
        {
            get
            {
                return null; //since we aren't modifying any controls on the parent page, just return null.
            }
        }

        public override PluginType Type
        {
            get
            {
                return Caisis.PluginFramework.PluginType.WebHtml;
            }
        }

        public override string Name
        {
            get
            {
                return "Upload File";
            }
        }

        #endregion
    }
}
