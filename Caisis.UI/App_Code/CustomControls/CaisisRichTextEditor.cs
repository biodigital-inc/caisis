using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Solmetra.Spaw2;
using Solmetra.Spaw2.SpawFM;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Classes.CustomControls
{
    /// <summary>
    /// A rich text editor allowing for a custom upload directory.
    /// </summary>
    public class CaisisRichTextEditor : Editor
    {
        private string fileUploadDirectory;
        private string fileUploadCaption;

        private bool allowFileUploads = true;

        private static readonly string WEB_CONFIG_UPLOAD_KEY = "FileUploadLocation";

        /// <summary>
        /// Gets or sets the folder in which files will be uploaded. NOTE: this folder
        /// must exists in the FileUploadRoot specified in the web.config file.
        /// </summary>
        public string FileUploadDirectory
        {
            get
            {
                return fileUploadDirectory;
            }
            set
            {
                fileUploadDirectory = value;
            }
        }

        /// <summary>
        /// Gets or sets the Title for the Upload Directory.
        /// </summary>
        public string FileUploadCaption
        {
            get
            {
                return fileUploadCaption;
            }
            set
            {
                fileUploadCaption = value;
            }
        }

        /// <summary>
        /// Gets or sets whether a user can upload files to the FileUploadDirectory (default: true)
        /// </summary>
        public bool AllowFileUploads
        {
            get
            {
                return allowFileUploads;
            }
            set
            {
                allowFileUploads = value;
            }
        }

        /// <summary>
        /// Override page load and handle custom uploading logic.
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            SetUploadDirectory();
        }

        /// <summary>
        /// Adds an upload directory as specified by user control.
        /// </summary>
        private void SetUploadDirectory()
        {
            if (!string.IsNullOrEmpty(fileUploadDirectory) && this.Configuration != null)
            {
                // Use Application File Upload Root Folder
                string fileUploadLocation = CaisisConfiguration.GetWebConfigValue(WEB_CONFIG_UPLOAD_KEY);
                
                // Verify key has a value
                if (!string.IsNullOrEmpty(fileUploadLocation))
                {
                    // Resolve and cleanup virtual path
                    string baseUploadPath = Page.ResolveUrl(fileUploadLocation);
                    if (!baseUploadPath.EndsWith("/"))
                    {
                        baseUploadPath += "/";
                    }
                    // Set upload directory
                    string fullVirtualPath = baseUploadPath + fileUploadDirectory + "/";

                    try
                    {

                        // Check if directory exists else, create
                        string systemPath = MapPathSecure(fullVirtualPath);
                        if (!System.IO.Directory.Exists(systemPath))
                        {
                            System.IO.DirectoryInfo dirInfo = System.IO.Directory.CreateDirectory(systemPath);
                            if (!dirInfo.Exists)
                            {
                                return;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        return;
                    }

                    // Get a List of current Directories, don't overlap
                    bool uploadDirExists = false;
                    List<Directory> uploadDirs = Directory.GetDirectories(this.Configuration, "");
                    foreach (Directory uploadDir in uploadDirs)
                    {
                        if (uploadDir.FullVirtualPath.Equals(fullVirtualPath))
                        {
                            uploadDirExists = true;
                            break;
                        }
                    }
                    // If directory doesn't exist in current list, add directory
                    if (!uploadDirExists)
                    {
                        // Create a new Directory object
                        string caption = !string.IsNullOrEmpty(fileUploadCaption) ? fileUploadCaption : fileUploadDirectory;
                        Directory webConfigDir = new Directory(this.Configuration);
                        webConfigDir.Caption = caption;
                        webConfigDir.Path = fullVirtualPath;
                        webConfigDir.Settings = new Settings();
                        webConfigDir.Settings.AllowedFileTypes.Add("images");
                        webConfigDir.Settings.AllowUpload = allowFileUploads;

                        // Add to upload directories
                        uploadDirs.Add(webConfigDir);

                        // Finally, update upload directories
                        Directory.SetDirectories(this.Configuration, uploadDirs);
                    }
                }
            }
        }
    }
}