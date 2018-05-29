using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;

using System.IO;
using System.Xml;
using Caisis.BOL;
using Caisis.UI.Plugins.FileLoader;

namespace Caisis.UI.Plugins.FileLoader
{
    public partial class BulkUploadForm : System.Web.UI.Page
    {
        private static readonly string PATH_UPLAOD_DIRECTORY = "PathTumorMaps_NotUploaded";
        private static readonly string FILE_LABEL = "Tumor Map";

        private static readonly string THUMB_EXTENSION = "_thumb";
        private static readonly int THUMB_WIDTH = 100;
        private static readonly int THUMB_HEIGHT = 75;

        private static readonly Dictionary<string, string> MIME_TYPES =
            new Dictionary<string, string>
            (
                new Dictionary<string, string>
                {
                    { ".jpg", "image/jpeg" },
                    { ".jpeg", "image/jpeg" }
                },
                StringComparer.OrdinalIgnoreCase
            );

        /// <summary>
        /// Gets the full path (Mapped Path/Non-Virtual) to the File Upload location
        /// </summary>
        public string FILE_UPLOAD_ROOT
        {
            get
            {
                string webConfigUploadPath = CaisisConfiguration.GetWebConfigValue("FileUploadLocation");
                return GetPath(webConfigUploadPath);
            }
        }

        /// <summary>
        /// Gets the target Pathology upload folder
        /// </summary>
        public string FILE_DESTINATION_TARGET
        {
            get
            {
                return FILE_UPLOAD_ROOT + "Pathology";
            }
        }

        /// <summary>
        /// Gets the destination upload location
        /// </summary>
        private string FILE_SOURCE_ROOT
        {
            get
            {
                return GetPath(FILE_UPLOAD_ROOT) + PATH_UPLAOD_DIRECTORY;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // security??
            if (!Security.PermissionManager.HasPermission(Security.PermissionManager.EditSecurity))
                Response.End();

            // set values
            SourceDirectory.Text = FILE_SOURCE_ROOT;
            DestinationDirectory.Text = FILE_DESTINATION_TARGET;
            string doRun = Request.QueryString["run"];
            if (!string.IsNullOrEmpty(doRun) && bool.Parse(doRun))
            {
                BulkUpload(false);
            }
        }

        protected void DoBulkUpload(object sender, EventArgs e)
        {
            bool isPreview = sender != DoRunBtn;
            BulkUpload(isPreview);
        }

        /// <summary>
        /// From the specified virtual, relative or physical path, resolve to physical location
        /// </summary>
        /// <param name="checkPath"></param>
        /// <returns></returns>
        private string GetPath(string checkPath)
        {
            string path = string.Empty;
            if (!string.IsNullOrEmpty(checkPath))
            {
                // i.e., X://Source_Files
                if (Path.IsPathRooted(checkPath))
                {
                    path = checkPath;
                }
                // i.e., ~/App_Data/FileUploads
                else
                {
                    path = Server.MapPath(checkPath);
                }
            }
            // normalize ending
            if (!string.IsNullOrEmpty(path))
            {
                string seperator = path.EndsWith(System.IO.Path.DirectorySeparatorChar.ToString()) ? "" : System.IO.Path.DirectorySeparatorChar.ToString();
                path = path + seperator;
            }
            return path;
        }

        private void BulkUpload(bool isPreview)
        {
            // data source for preview/audit
            DataTable auditTable = new DataTable();
            auditTable.Columns.AddRange(new DataColumn[]
            {
                new DataColumn("PathologyId"),
                new DataColumn("PathNum"),
                new DataColumn("Source"),
                new DataColumn("Target"),
                new DataColumn("DuplicatePathologyId", typeof(bool)),
                new DataColumn("DuplicateTargetFileId", typeof(bool))
            });
            // validation
            if (!string.IsNullOrEmpty(FILE_DESTINATION_TARGET) && !string.IsNullOrEmpty(FILE_SOURCE_ROOT))
            {
                try
                {
                    // validate source and files
                    DirectoryInfo sourceDirectory = new DirectoryInfo(FILE_SOURCE_ROOT);
                    if (!sourceDirectory.Exists)
                    {
                        Message.Text = "Source directory does not exists.";
                        return;
                    }
                    FileInfo[] sourceFiles = sourceDirectory.GetFiles();
                    if (sourceFiles.Count() == 0)
                    {
                        Message.Text = "No Files to copy.";
                        return;
                    }

                    DirectoryInfo targetDirectory = new DirectoryInfo(FILE_DESTINATION_TARGET);
                    // create target upload directory if needed
                    if (!targetDirectory.Exists)
                    {
                        targetDirectory = System.IO.Directory.CreateDirectory(FILE_DESTINATION_TARGET);
                    }
                    // for each source file, upload
                    foreach (FileInfo source_file in sourceFiles)
                    {
                        // locals
                        int pathologyId = int.MinValue;
                        string pathNum = string.Empty;
                        string sourceFullFileName = string.Empty;
                        string targetFileFullName = string.Empty;
                        bool duplicatePathologyId = false;
                        bool duplicateTargetFile = false;

                        string sourceFileName = source_file.Name;
                        sourceFullFileName = source_file.FullName;
                        string fileExtension = source_file.Extension.ToLower();
                        // validate mime types
                        if (string.IsNullOrEmpty(fileExtension) || !MIME_TYPES.Keys.Contains(fileExtension))
                            continue;
                        string mimeType = MIME_TYPES[fileExtension];
                        // parse path num
                        pathNum = Path.GetFileNameWithoutExtension(source_file.FullName);
                        // cleanup
                        int foundIndex = pathNum.IndexOf('_');
                        // PATH-NUM_C.jpg
                        if (foundIndex > -1)
                        {
                            pathNum = pathNum.Substring(0, foundIndex);
                        }

                        // check for Pathology record
                        if (!string.IsNullOrEmpty(pathNum))
                        {
                            // search for pathology records
                            IEnumerable<Pathology> pathologyRecords = BusinessObject.GetByFields<Pathology>(new Dictionary<string, object> { { Pathology.PathNum, pathNum } });
                            // do upload, only when single result found
                            if (pathologyRecords.Count() == 1 || (pathologyRecords.Count() > 0 && isPreview))
                            {
                                // get Pathology record
                                Pathology pathologyRecord = pathologyRecords.First();
                                pathologyId = (int)pathologyRecord[Pathology.PathologyId];

                                // don't upload when Table=Pathology + TablePriKey = PathologyId + OriginalFileName = SourceFileName 
                                duplicateTargetFile = BusinessObject.GetByFields<UploadedFile>(new Dictionary<string, object> { { UploadedFile.TableName, pathologyRecord.TableName }, { UploadedFile.TablePrimaryKey, pathologyId }, { UploadedFile.OriginalFileName, sourceFileName } }).Count() > 0;
                                // don't upload when 
                                if (!duplicateTargetFile || isPreview)
                                {
                                    // only do insert when file doesn't exist
                                    if (!isPreview)
                                    {
                                        // create FileUpload record
                                        UploadedFile fileUpload = new UploadedFile();
                                        fileUpload[UploadedFile.TableName] = pathologyRecord.TableName;
                                        fileUpload[UploadedFile.TablePrimaryKey] = pathologyId;
                                        fileUpload[UploadedFile.OriginalFileName] = source_file.Name;
                                        fileUpload[UploadedFile.FileExtension] = fileExtension;
                                        fileUpload[UploadedFile.FilePath] = targetDirectory.FullName;
                                        fileUpload[UploadedFile.FileType] = mimeType;
                                        fileUpload[UploadedFile.FileLabel] = FILE_LABEL;
                                        fileUpload[UploadedFile.OnFileServer] = 1;
                                        fileUpload.Save();

                                        int fileId = (int)fileUpload[UploadedFile.FileId];

                                        targetFileFullName = targetDirectory.FullName + System.IO.Path.DirectorySeparatorChar + fileId + fileExtension;
                                        string targetThumbFileName = targetDirectory.FullName + System.IO.Path.DirectorySeparatorChar + fileId + THUMB_EXTENSION + fileExtension;

                                        if (!File.Exists(targetFileFullName))
                                        {
                                            // upload/copy file
                                            source_file.CopyTo(targetFileFullName, false);

                                            // create thumbnail
                                            System.Drawing.Bitmap sourceBitmap = new System.Drawing.Bitmap(targetFileFullName);
                                            System.Drawing.Image sourceFileThumb = sourceBitmap.GetThumbnailImage(THUMB_WIDTH, THUMB_HEIGHT, OnThumbnailCreationFail, IntPtr.Zero);
                                            sourceFileThumb.Save(targetThumbFileName);

                                            // cleanup after creation
                                            sourceFileThumb.Dispose();
                                            sourceBitmap.Dispose();

                                        }
                                    }
                                }

                            }
                        }
                        // add audit data
                        object[] rowData = new object[]
                        {
                            pathologyId,
                            pathNum,
                            sourceFullFileName,
                            targetFileFullName,
                            duplicatePathologyId,
                            duplicateTargetFile
                        };
                        auditTable.Rows.Add(rowData);
                    }


                    // update message
                    LivePanel.Visible = auditTable.Rows.Count > 0;
                    if (isPreview)
                    {
                        if (auditTable.Rows.Count > 0)
                            Message.Text = "Review Files Below";
                        else
                            Message.Text = "No Files to Preview";
                    }
                    else
                    {
                        Message.Text = "Files Below Uploaded";
                    }
                }
                catch (Exception ex)
                {
                    Message.Text = ex.Message;
                }
            }
            else
            {
                Message.Text = "Please check upload settings";
            }

            // update results
            var dataView = auditTable.DefaultView;
            dataView.Sort = "PathNum ASC, PathologyId ASC";
            AuditGridView.DataSource = dataView;
            AuditGridView.DataBind();

            // display number of acutal uploads
            TotalFiles.Text = dataView.Count.ToString();
            // !important, filter then adjust counts
            dataView.RowFilter = "PathologyId > -1 AND DuplicateTargetFileId = 0";
            TotalToUploadFiles.Text = dataView.Count.ToString();
            TotalUploaded.Text = isPreview ? "0" : dataView.Count.ToString();
        }

        public bool OnThumbnailCreationFail()
        {
            return false;
        }
    }
}