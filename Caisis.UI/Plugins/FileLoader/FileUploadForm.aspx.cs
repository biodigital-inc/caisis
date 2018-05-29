using System;
using System.Configuration;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.IO;
using System.IO;
using System.Text;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;

using Caisis.UI.Core.Classes;
using Caisis.UI.Plugins.FileLoader;

namespace Caisis.UI.Plugins.FileLoader
{
    /// <summary>
    /// Stores a file with any record in the database.
    /// Files are stored directories under the virtual directory specified in web.config. Files are renamed
    /// using the file Id, and the original file name is stored with the record.
    /// </summary>
    public partial class FileUploadForm : BasePage
    {

        private string _tableName;
        private int _tablePrimaryKey;
        private string _savePath;
        private string JSpathToThumb;
        private string JSpathToFile;
        // TESTING CODE
        private string _fileId;
        private string _fileLabel;

        // constants
        public static readonly string FILE_UPLOAD_ROOT = System.Configuration.ConfigurationSettings.AppSettings["FileUploadLocation"].ToString();
        public static readonly string THUMB_EXTENSION = "_thumb";
        private static readonly int THUMB_WIDTH = 100;
//        private static readonly int THUMB_HEIGHT = 75;

        // allows only files under 3 MB
        private static readonly int MAX_FILE_SIZE = 3145728;

        // allow files with these extensions! need to be accessible from 
        public static readonly string[] IMG_EXTENSIONS = { ".jpg", ".jpeg", ".gif", ".bmp", ".png" };
        public static readonly string[] DOC_EXTENSIONS = { ".pdf", ".doc", ".txt", ".rtf", ".xls", ".docx", ".xlsx" };

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            // defaults
            Page.EnableViewState = false;
            UploadPanel.Visible = false;
            ViewPanel.Visible = false;
            MainImg.Visible = false;
            ThumbnailExplorer.Visible = false;

            // reset messages
            UploadMsg.Text = "Please enter the file name and provide a label below.";
            ThumbMsg.Text = "";
            UploadErrorMsg.Text = String.Empty;

            // view or add image; url params created in code behind of plugin control
            if ((Request.QueryString["tableName"] != null && Request.QueryString["tableName"].Length > 0) && (Request.QueryString["primaryKey"] != null && Request.QueryString["primaryKey"].Length > 0))
            {
                // SET tableName/tablePriKey from QueryString
                _tableName = Request.QueryString["tableName"];
                _tablePrimaryKey = int.Parse(Request.QueryString["primaryKey"]);
                _fileId = Request.QueryString["fileId"];

                // saved in directory named virtual path + table names  : APPSETTING NEEDS to be between / and /
                _savePath = Page.ResolveUrl(FILE_UPLOAD_ROOT) + _tableName + "/";

                FilesDa filesDA = new FilesDa();
                DataTable dt = filesDA.GetRecordsByTableAndTablePK(_tableName, _tablePrimaryKey).Tables[0];

                // Contains Files
                if (dt.Rows.Count > 0)
                {
                    SetViewFilesMode();
                    UploadedFile userFile = new UploadedFile();
                    int firstRecordId = int.Parse(dt.Rows[0][UploadedFile.FileId].ToString());

                    if (!string.IsNullOrEmpty(_fileId))
                    {
                        _fileId = Security.CustomCryptoHelper.Decrypt(_fileId);
                        userFile.Get(int.Parse(_fileId));
                        //if (userFile.RecordCount == 0)
						if (userFile.IsEmpty)
                        {
                            userFile.Get(firstRecordId);
                        }
                    }
                    else
                    {
                        _fileId = firstRecordId.ToString();
                        userFile.Get(firstRecordId);
                    }

                    string userFileId = userFile[UploadedFile.FileId].ToString();
                    string userFileExt = userFile[UploadedFile.FileExtension].ToString();
                    string userFileLabel = userFile[UploadedFile.FileLabel].ToString();


                    // Sets attribute general to all FILES
                    string pathToFile = GetPathToFile(userFileId, false);

                    MainImgTitle.Text = userFileLabel;
                    FileId.Value = userFileId.ToString();
                    FileExtension.Value = userFileExt;

                    // Only 1 contorl per holder
                    DocumentHolder.Controls.Clear();

                    if (IsDocumentType(IMG_EXTENSIONS, userFileExt))
                    {
                        DisplayImage(pathToFile, userFileExt);
                        JSpathToThumb = GetPathToFile(userFileId, true);// _savePath + userFileId + FileUploadForm.THUMB_EXTENSION + userFileExt;
                        JSpathToFile = pathToFile;
                    }
                    else if (IsDocumentType(DOC_EXTENSIONS, userFileExt))
                    {
                        DisplayDocument(pathToFile, userFileExt);
                        JSpathToThumb = "GENERIC";
                    }
                }
                // else show controls to upload an image
                else
                {
                    SetUploadFilesMode();
                    JSpathToThumb = "";


                    if (Request.QueryString["fileLabel"] != null && Request.QueryString["fileLabel"].Length > 0) FileLabel.Text = Request.QueryString["fileLabel"];
                }
            }

        }

        /// <summary>
        /// Method override to add client script to page on render.
        /// If the thumb exist add opening script to set plugin thumb
        /// else show generic file upload thumb
        /// IMPORTANT: Must be here as page_load may fire twice and script
        /// would not register correctly
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            string thumbSrc = "";
            if (string.IsNullOrEmpty(JSpathToThumb))
            {
                thumbSrc = Page.ResolveUrl("~/Images/UploadFile.gif");
            }
            else if (JSpathToThumb == "GENERIC")
            {
                thumbSrc = Page.ResolveUrl("~/Images/ViewFile.gif");
            }
            else
            {
                thumbSrc = JSpathToThumb;
            }
            if (!string.IsNullOrEmpty(thumbSrc))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ChangePluginThumb", "if (window.opener != null && typeof window.opener.setThumb != 'undefined') { opener.setThumb('" + thumbSrc + "'); }  if (window.opener != null && typeof window.opener.setFullImage != 'undefined') { opener.setFullImage('" + JSpathToFile + "'); }", true);
            }
            //if (!File.Exists(Server.MapPath(JSpathToThumb)))
            //{
            //    string genericBlankThumb = JSpathToThumb == "GENERIC" ? "/Images/ViewFile.gif" : "/Images/UploadFile.gif";
            //    if (System.Web.HttpContext.Current.Request.ApplicationPath.Equals("/"))
            //    {
            //        thumbSrc = genericBlankThumb;
            //    }
            //    else
            //    {
            //        thumbSrc = System.Web.HttpContext.Current.Request.ApplicationPath + genericBlankThumb;
            //    }
            //}
            //else
            //{
            //    thumbSrc = JSpathToThumb;
            //}

            //if (!string.IsNullOrEmpty(thumbSrc))
            //{
            //    if (File.Exists(Server.MapPath(thumbSrc)))
            //    {
            //        Page.ClientScript.RegisterStartupScript(this.GetType(), "ChangePluginThumb", "if(opener.setThumb) { opener.setThumb('" + thumbSrc + "'); }", true);
            //    }
            //}
            base.Render(writer);
        }

        #region EVENT HANDLERS - BUTTON CLICKS

        /// <summary>
        /// Deletes File based on FileId. Client side check should be done to confirm deletion.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteBtn_Click(object sender, CommandEventArgs e)
        {
            if (FileId.Value != "" && FileExtension.Value != "")
            {
                string filePath = _savePath + FileId.Value + FileExtension.Value;
                string thumbFilePath = _savePath + FileId.Value + THUMB_EXTENSION + FileExtension.Value;
                string deletionMsg = "";

                if (File.Exists(Server.MapPath(filePath)))
                {
                    // delete the file
                    File.Delete(Server.MapPath(filePath));

                    if (File.Exists(Server.MapPath(thumbFilePath)))
                    {
                        // delete thumbnail
                        File.Delete(Server.MapPath(thumbFilePath));
                    }
                    deletionMsg = "The file has been deleted.";
                }
                else { deletionMsg = "The selected file has already been removed from the server.  The record has been deleted."; }

                this.DeleteFileRecord(int.Parse(FileId.Value));
                // reset page with fields to upload new file


                this.Page_Load(sender, e);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "deleteMsg", "<script type=\"text/javascript\">alert('" + deletionMsg + "');</script>");

            }
        }

        /// <summary>
        /// Add new file to record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddRecordBtn_Click(object sender, CommandEventArgs e)
        {
            SetUploadFilesMode();
        }

        /// <summary>
        /// Upload Image to the server
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UploadBtn_Click(object sender, CommandEventArgs e)
        {
            // If file field isn’t empty
            if (FileToUpload.PostedFile != null)
            {
                HttpPostedFile myFile = FileToUpload.PostedFile;

                // validation checks file size and format
                if (ValidateUploadedFile(myFile))
                {
                    int fileLen = myFile.ContentLength;
                    string fileName = System.IO.Path.GetFileName(myFile.FileName);
                    string fileExtension = System.IO.Path.GetExtension(myFile.FileName).ToLower();

                    // Read file into a data stream
                    byte[] myData = new Byte[fileLen];
                    myFile.InputStream.Read(myData, 0, fileLen);

                    int _primKey;

                    // INSERT NEW FILE
                    if (true)
                    {
                        _primKey = this.InsertFileRecord(myFile);
                    }

                    if (_primKey != null && _primKey != 0)
                    {
                        // Save the stream to disk
                        //this.WriteFile(myData, _primKey.ToString() + fileExtension);
                        this.WriteFile(myFile, _savePath + _primKey.ToString() + fileExtension);

                        // if an image file create a thumbnail
                        if (IsDocumentType(IMG_EXTENSIONS, fileExtension))
                        {
                            this.WriteThumbFile(_primKey.ToString(), fileExtension);
                        }
                        this.Page_Load(sender, e); // reset page to display uploaded image
                    }

                }
            }
        }

        protected void CancelBtn_Click(object sender, CommandEventArgs e)
        {

        }

        #endregion

        #region BIZOBJ HELPERS

        /// <summary>
        /// Insert an Uploaded File into DB
        /// </summary>
        /// <param name="theFile"></param>
        /// <returns></returns>
        private int InsertFileRecord(HttpPostedFile theFile)
        {
            int fileId = 0;
            
            // get lenths of file name (including extension) and label names
            int fileNameLength = System.IO.Path.GetFileName(theFile.FileName).Length;
            int labelLength = FileLabel.Text.Length;
            // get the max lenths of file name and label from database
            int? originalFileNameMaxLength = BOL.UploadedFile.GetFieldMaxLength("Files", BOL.UploadedFile.OriginalFileName);
            int? fileLabelMaxLength = BOL.UploadedFile.GetFieldMaxLength("Files", BOL.UploadedFile.FileLabel);
            
            bool insertFile = true;

            if (originalFileNameMaxLength != null && fileNameLength > originalFileNameMaxLength)
            {
                insertFile = false;
                UploadErrorMsg.Text = UploadErrorMsg.Text + "<br/>File name (including extension) must be " + originalFileNameMaxLength.ToString() + " characters or less.";
            }

            if (fileLabelMaxLength != null && labelLength > fileLabelMaxLength)
            {
                insertFile = false;
                UploadErrorMsg.Text = UploadErrorMsg.Text + "<br/>File label must be " + fileLabelMaxLength.ToString() + " characters or less. ";
            }

            if (insertFile)
            {
                UploadedFile file = LoadFileRecord(theFile);

                // add entered by on insert; no ability to lock records right now
                Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
                file[BusinessObject.EnteredBy] = sc.GetUserName();
                //file[BusinessObject.EnteredTime] = DateTime.Now;

                file.Save();
                fileId = (int)file[UploadedFile.FileId];
            }

            return fileId;
        }

        /// <summary>
        /// Delete file from DB 
        /// </summary>
        /// <param name="fileId"></param>
        private void DeleteFileRecord(int fileId)
        {
            UploadedFile file = new UploadedFile();
            file.Delete(fileId);
        }

        /// <summary>
        /// Load BizObj for saving/updating
        /// </summary>
        /// <param name="theFile"></param>
        /// <returns></returns>
        private UploadedFile LoadFileRecord(HttpPostedFile theFile)
        {
            UploadedFile fileBO = new UploadedFile();

            // Set BizObj Fields
            fileBO[UploadedFile.TableName] = _tableName;
            fileBO[UploadedFile.TablePrimaryKey] = _tablePrimaryKey.ToString();            
            fileBO[UploadedFile.OriginalFileName] = System.IO.Path.GetFileName(theFile.FileName);
            fileBO[UploadedFile.FileType] = theFile.ContentType;
            fileBO[UploadedFile.FileLabel] = FileLabel.Text; // only value submitted by user via interface
            fileBO[UploadedFile.OnFileServer] = "1";
            fileBO[UploadedFile.FileExtension] = new FileInfo(theFile.FileName).Extension;
            // may NOT want to store file path for better portability
            fileBO[UploadedFile.FilePath] = _savePath;

            // add audit info for update and inserts
            Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
            fileBO[BusinessObject.EnteredBy] = sc.GetUserName();
            fileBO[BusinessObject.EnteredTime] = DateTime.Now;

            return fileBO;
        }

        #endregion

        #region PAGE HELPERS

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
        #endregion

        #region FILE HELPERS - VALIDATION/IO/THUMBNAILS

        /// <summary>
        /// Verify file size and format
        /// </summary>
        /// <param name="theFile">posted file</param>
        /// <returns>true/false</returns>
        private bool ValidateUploadedFile(HttpPostedFile theFile)
        {
            int fileLen = theFile.ContentLength;

            // FILE SIZE MUST NOT BE 0
            if (fileLen == 0)
            {
                UploadMsg.Text = "No file was uploaded.";
                return false;
            }

                // FILE SIZE MUST BE LESS THAN 3 MB
            else if (fileLen > MAX_FILE_SIZE)
            {
                UploadMsg.Text = "The file being uploaded must be smaller than 3 MB.";
                return false;
            }

            string fileExtension = System.IO.Path.GetExtension(theFile.FileName).ToLower();

            // VERIFY file extension is valid
            if (Array.IndexOf(IMG_EXTENSIONS, fileExtension) < 0 && Array.IndexOf(DOC_EXTENSIONS, fileExtension) < 0)
            {
                StringBuilder sb = new StringBuilder();
                foreach (string s in IMG_EXTENSIONS)
                {
                    sb.Append(s);
                    sb.Append(", ");
                }
                int i = 0;
                foreach (string s in DOC_EXTENSIONS)
                {
                    i++;
                    sb.Append(s);
                    if (DOC_EXTENSIONS.Length != i) sb.Append(", ");
                }

                UploadMsg.Text = "Your file has an extension of " + fileExtension + "<br><br>The file must have an extension of either:<br>" + sb.ToString();
                return false;
            }

            return true;
        }

        /// <summary>
        /// Write file to disk
        /// </summary>
        /// <param name="postedFile"></param>
        /// <param name="filePath"></param>
        private void WriteFile(HttpPostedFile postedFile, string filePath)
        {
            string dirPath = _savePath;

            if (dirPath.EndsWith("/"))
            {
                //remove trailing "/"
                dirPath = _savePath.Remove(_savePath.LastIndexOf("/"), 1);
            }
            DirectoryInfo dir1 = new DirectoryInfo(Server.MapPath(dirPath));

            if (!dir1.Exists)
            {

                // sub directory for this table does not exist, create it
                DirectoryInfo dir2 = new DirectoryInfo(Server.MapPath(System.Configuration.ConfigurationSettings.AppSettings["FileUploadLocation"].ToString()));

                dir2.CreateSubdirectory(_tableName);
            }

            postedFile.SaveAs(Server.MapPath(filePath));
        }

        /// <summary>
        /// Creates thumbnail of original image. If thumbnail creation fails, other processes should not be interrupted
        /// </summary>
        /// <param name="fileName">name of file</param>
        /// <param name="fileExtension">file extension</param>
        private void WriteThumbFile(string fileName, string fileExtension)
        {
            // Check whether the file is really a JPEG by opening it
            System.Drawing.Image.GetThumbnailImageAbort myCallBack = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
            Bitmap myBitmap;

            string fullFileName = fileName + fileExtension;
            string thumbFileName = fileName + THUMB_EXTENSION + fileExtension;

            try
            {
                myBitmap = new Bitmap(Server.MapPath(_savePath + fullFileName));

                double ratio = ((double)myBitmap.Height / (double)myBitmap.Width);
                int THUMB_HEIGHT = (int)(THUMB_WIDTH * ratio);
                

                // Save thumbnail
                System.Drawing.Image myThumbnail = myBitmap.GetThumbnailImage(THUMB_WIDTH, THUMB_HEIGHT, myCallBack, IntPtr.Zero);
                myThumbnail.Save(Server.MapPath(_savePath + thumbFileName));
                ThumbImg.ImageUrl = Server.MapPath(_savePath + thumbFileName);

                // Currently no reason to display thumbnail 
                //ThumbImg.Visible = true; 
                ThumbImg.Width = THUMB_WIDTH;
                ThumbImg.Height = THUMB_HEIGHT;
                // Destroy objects
                myThumbnail.Dispose();
                myBitmap.Dispose();
            }
            catch (ArgumentException argEx) // don't disrupt process due to thumbnail
            {
                // The file wasn't valid 
                ThumbMsg.Text = "The thumbnail file did not upload properly.<br><br>" + argEx.Message;
                System.IO.File.Delete(Server.MapPath(_savePath + "/" + thumbFileName));
            }
        }

        public bool ThumbnailCallback()
        {
            return false;
        }

        protected void OnThumbsRptrDataBound(object sender, RepeaterItemEventArgs e)
        {
            object dataItem = e.Item.DataItem;
            if (dataItem != null)
            {
                string imgFileId = DataBinder.Eval(dataItem, "FileId").ToString();
                string imgFileExt = DataBinder.Eval(dataItem, "FileExtension").ToString();
                string imgFileLabel = DataBinder.Eval(dataItem, "FileLabel").ToString();
                string imgTablePrimaryKey = DataBinder.Eval(dataItem, "TablePrimaryKey").ToString();
                string imgTableName = DataBinder.Eval(dataItem, "TableName").ToString();

                HyperLink link = e.Item.FindControl("ThumbLink") as HyperLink;
                // fileId is passed encrypted in url
                link.NavigateUrl = "FileUploadForm.aspx?tableName=" + imgTableName + "&primaryKey=" + imgTablePrimaryKey + "&fileId=" + Security.CustomCryptoHelper.Encrypt(imgFileId);
                System.Web.UI.WebControls.Image img = e.Item.FindControl("ThumbLinkImage") as System.Web.UI.WebControls.Image;
                img.Attributes.Add("onmouseover", "this.className = 'ThumbImageOn';");
                img.Attributes.Add("onmouseout", "this.className = 'ThumbImageOff';");

                img.ImageUrl = GetPathToFile(imgFileId, true);

                Label label = e.Item.FindControl("ThumbLabel") as Label;
                label.Text = imgFileLabel;
            }
        }

        #endregion

        #region DISPLAY HELPERS (IMAGES,PANELS...)

        protected void SetUploadFilesMode()
        {
            ThumbnailExplorer.Visible = false;
            ViewPanel.Visible = false;
            UploadPanel.Visible = true;
        }

        protected void SetViewFilesMode()
        {
            UploadPanel.Visible = false;
            ViewPanel.Visible = true;
            ThumbnailExplorer.Visible = true;
        }

        /// <summary>
        /// Displays Image in IFrame
        /// </summary>
        /// <param name="pathToFile"></param>
        /// <param name="docType"></param>
        protected void DisplayImage(string pathToFile, string docType)
        {
            MainImgTitle.Text = "Image:&nbsp;&nbsp;" + MainImgTitle.Text;
            DeleteBtn.ImageUrl = "../../Images/DeleteThisImage.gif";
            MainImg.ImageUrl = pathToFile;
            MainImg.Visible = true;


            // SET Zoom Dropdown For Images
            ZoomLabel.Visible = true;
            ImageZoomSelector.Visible = true;
            ZoomLabel.Text = "Set Zoom:";
            ImageZoomSelector.Items.Clear();
            ImageZoomSelector.Items.Add(new ListItem("Fit In Window", "Fit"));
            ImageZoomSelector.Items.Add(new ListItem("Full Screen", "Full"));

            // Generates a List Item in the Format ("100%","1");
            int[] zoomPercentages = new int[] { 10, 25, 50, 75, 100, 150, 200 };
            foreach (int percentage in zoomPercentages)
            {
                string percentLabel = percentage.ToString() + "%";
                string percentValue = (percentage / 100.0).ToString();
                ListItem tmp = new ListItem(percentLabel, percentValue);
                ImageZoomSelector.Items.Add(tmp);
            }

            // set zoom function
            ImageZoomSelector.Attributes.Add("onchange", "setZoom(this.value, '" + MainImg.ClientID + "');");
        }

        /// <summary>
        /// Displays embedded document in IFrame or prompts for download
        /// </summary>
        /// <param name="pathToFile"></param>
        /// <param name="docType"></param>
        protected void DisplayDocument(string pathToFile, string docType)
        {
            MainImgTitle.Text = "Document:&nbsp;&nbsp;" + MainImgTitle.Text;
            DeleteBtn.ImageUrl = "../../Images/DeleteThisFile.gif";

            ZoomLabel.Visible = false;
            ImageZoomSelector.Visible = false;
            DocumentHolder.Visible = true;


            // fix to embed pdf file in page. IE6 iframe security issues, place embedded content in holder
            if (docType.ToLower() == ".pdf")
            {
                HtmlGenericControl DocumentObject;
                if (Request.Browser.ActiveXControls)
                {
                    DocumentObject = new HtmlGenericControl("embed");
                    DocumentObject.Attributes.Add("src", pathToFile);
                }
                else
                {
                    DocumentObject = new HtmlGenericControl("object");
                    DocumentObject.Attributes.Add("data", pathToFile);
                    DocumentObject.Attributes.Add("type", "application/pdf");
                }

                DocumentObject.Attributes.Add("style", "scrolling:auto; width:620; height:450;");
                DocumentHolder.Controls.Add(DocumentObject);
            }
            // Else create a new iframe and point to document, this should force downloads
            else
            {
                HtmlGenericControl DocumentIFrame = new HtmlGenericControl("iframe");
                DocumentIFrame.Attributes.Add("src", pathToFile);
                DocumentIFrame.Attributes.Add("style", "scrolling:auto; width:620; height:450;");
                DocumentHolder.Controls.Add(DocumentIFrame);
            }
        }
        #endregion

        /// <summary>
        /// Returns a special url for retieving a file
        /// </summary>
        /// <param name="fileId"></param>
        /// <param name="isThumb"></param>
        /// <returns></returns>
        private string GetPathToFile(string fileId, bool isThumb)
        {
            return Page.ResolveUrl("DocumentLoader.aspx") + "?fileId=" + Security.CustomCryptoHelper.Encrypt(fileId) + "&thumb=" + isThumb.ToString().ToLower();
        }
    }
}
