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

using Caisis.UI.Core.Classes;
using Caisis.BOL;
using Caisis.Security;
using Caisis.UI.Plugins.FileLoader;

namespace Caisis.UI.Plugins.FileLoader
{
    /// <summary>
    /// Handles display of documents such as pdf, word, excel, txt and rtf.
    /// </summary>
    public partial class DocumentLoader : BasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            string fId = Request.QueryString["fileId"];
            string thumb = Request.QueryString["thumb"];
            bool isThumb = !string.IsNullOrEmpty(thumb) && thumb.ToLower() == bool.TrueString.ToLower() ? true : false;


            // Load file by field id
            if (!string.IsNullOrEmpty(fId))
            {
                int fileId = -1;
                string decrypyedFileId = Security.CustomCryptoHelper.Decrypt(fId);
                int.TryParse(decrypyedFileId, out fileId);

                UploadedFile userFile = new UploadedFile();
                userFile.Get(fileId);
                WriteFile(userFile, isThumb);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="userFile"></param>
        /// <param name="isThumb"></param>
        private void WriteFile(UploadedFile userFile, bool isThumb)
        {
            // Verify Files Exists
            string fullFilePath = FileLoaderUtil.GetFileOnDisk(userFile, isThumb);
            if (System.IO.File.Exists(fullFilePath))
            {
                // Write File
                Response.WriteFile(fullFilePath);

                // Set Header
                string contentType = userFile[UploadedFile.FileType].ToString();
                Response.ContentType = contentType;
            }
        }
    }
}
