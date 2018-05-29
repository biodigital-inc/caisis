using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Solmetra.Spaw2;
using Solmetra.Spaw2.SpawFM;
using System.Collections.Generic;
using System.Text;

public partial class spaw2_plugins_spawfm_dialogs_spawfm : Solmetra.Spaw2.DialogControl
{
    protected bool TypeFixed
    {
        get
        {
            return (Request.QueryString["nofilter"] != null);
        }
    }
    private string _current_type = String.Empty;
    protected string CurrentType
    {
        set { this._current_type = value; }
        get
        {
            if (Request.Form["type"] == null)
            {
                if (Request.QueryString["type"] != null)
                    this._current_type = Request.QueryString["type"];
            }
            else
                return Request.Form["type"];

            return this._current_type;
        }
    }

    protected Directory CurrentDirectory = null;

    private string _error_msg = String.Empty;
    protected string ErrorMsg
    {
        set
        {
            this._error_msg += (String.IsNullOrEmpty(this._error_msg) ? String.Empty : ", ") + value;
        }
        get { return this._error_msg; }
    }

    protected string _on_load_select = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Language.Module = "spawfm";

        if (!Page.ClientScript.IsClientScriptIncludeRegistered("spawfm.js"))
        {
            Page.ClientScript.RegisterClientScriptInclude("spawfm.js", Solmetra.Spaw2.Configuration.PluginDirectory + "spawfm/dialogs/spawfm.js?" + DateTime.Now.Ticks.ToString());

            // css
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "spawfm.css", "<link rel=\"stylesheet\" type=\"text/css\" href=\"" + Solmetra.Spaw2.Configuration.PluginDirectory + "spawfm/dialogs/spawfm.css" + "\" />");
        }

        BindData();
    }

    void BindData()
    {
        string current_dir = String.IsNullOrEmpty(Request.Form["dir"]) ? String.Empty : Request.Form["dir"]; //"/spaw2web/spaw2/uploads/images/|mega/giga/supa/dupa/";
        List<Directory> dirs = Directory.GetDirectories(this.Configuration, current_dir);
        dir.Items.Clear();
        foreach (Directory directory in dirs)
        {
            dir.Items.Add(new ListItem(directory.Caption, directory.FullPath));
            // set selected index
            if ((current_dir != String.Empty && directory.FullPath == current_dir)
                || (current_dir == String.Empty && directory.DefaultDirectory))
            {
                dir.SelectedIndex = dir.Items.Count - 1;
                this.CurrentDirectory = directory;
            }
        }
        if (this.CurrentDirectory == null && dirs != null && dirs.Count > 0)
        {
            // no current directory and no default dir
            dir.SelectedIndex = 0;
            this.CurrentDirectory = dirs[0];
        }

        if (this.CurrentDirectory != null)
        {
            go_up_button.Attributes["title"] = this.Language.GetMessage("buttons", "go_up");
            if (this.CurrentDirectory.CurrentSubdirectory != String.Empty)
            {
                go_up_button.Src = "../img/btn_up.gif";
                go_up_button.Attributes["onclick"] = "SpawFm.goUpClick();";
                go_up_button.Disabled = false;
            }
            else
            {
                // top dir
                go_up_button.Src = "../img/btn_up_off.gif";
                go_up_button.Attributes["onclick"] = String.Empty;
                go_up_button.Disabled = true;
            }

            create_dir_button.Attributes["title"] = this.Language.GetMessage("buttons", "create_directory");
            if (this.CurrentDirectory.Settings.Recursive && this.CurrentDirectory.Settings.AllowCreateSubdirectories)
            {
                create_dir_button.Attributes["onclick"] = "SpawFm.createDirectoryClick();";
                create_dir_button.Src = "../img/btn_new_folder.gif";
                create_dir_button.Disabled = false;
            }
            else
            {
                create_dir_button.Attributes["onclick"] = String.Empty;
                create_dir_button.Src = "../img/btn_new_folder_off.gif";
                create_dir_button.Disabled = true;
            }

            if (this.CurrentDirectory.Settings.AllowUpload)
            {
                upload_file.Disabled = false;
            }
            else
            {
                upload_file.Disabled = true;
            }
        }

        // file types
        if (this.TypeFixed)
            type.Visible = false;
        else
        {
            type.Visible = true;
            List<FileType> ftypes = FileType.GetFileTypes(this.Configuration);
            type.Items.Clear();
            if (this.CurrentDirectory.Settings.AllowAnyFiletypes)
                type.Items.Add(new ListItem(this.Language.GetMessage("filetypes", "any"), String.Empty));
            foreach (FileType ftype in ftypes)
            {
                if (this.CurrentDirectory.Settings.AllowAnyFiletypes || this.CurrentDirectory.Settings.AllowedFileTypes.Contains(ftype.Name))
                {
                    string ft_title = (this.Language.GetMessage("filetypes", ftype.Name) == String.Empty) ? ftype.Name : this.Language.GetMessage("filetypes", ftype.Name);
                    ft_title += " (" + ftype.ExtensionList + ")";
                    type.Items.Add(new ListItem(ft_title, ftype.Name));
                    if (ftype.Name == this.CurrentType)
                        type.SelectedIndex = type.Items.Count - 1;
                }
            }
        }

        // handle events
        
        // delete
        if (!String.IsNullOrEmpty(Request.Form["delete_file"]))
        {
            try
            {
                // delete
                File.Delete(this.CurrentDirectory, Request.Form["delete_file"]);
            }
            catch (System.IO.IOException)
            {
                if (System.IO.Directory.Exists(this.CurrentDirectory.FullPhysicalPath + Request.Form["delete_file"]))
                    this.ErrorMsg = this.Language.GetMessage("spawfm", "error_delete_subdirectories_not_empty");
                else
                    this.ErrorMsg = this.Language.GetMessage("spawfm", "error_delete_failed");
            }
            catch (System.Security.SecurityException)
            {
                this.ErrorMsg = this.Language.GetMessage("spawfm", "error_delete_forbidden");
            }
            catch (Exception)
            {
                this.ErrorMsg = this.Language.GetMessage("spawfm", "error_delete_failed");
            }
        }

        // rename
        if (!String.IsNullOrEmpty(Request.Form["rename_from"]) && !String.IsNullOrEmpty(Request.Form["rename_to"]))
        {
            try
            {
                // rename
                File.Rename(this.CurrentDirectory, Request.Form["rename_from"], Request.Form["rename_to"]);
                this._on_load_select = Request.Form["rename_to"];
            }
            catch (System.Data.DuplicateNameException)
            {
                this.ErrorMsg = this.Language.GetMessage("spawfm", "error_rename_file_exists").Replace("[*FILE*]", Request.Form["rename_to"]);
            }
            catch (System.Security.SecurityException)
            {
                this.ErrorMsg = this.Language.GetMessage("spawfm", "error_rename_forbidden");
            }
            catch (Exception)
            {
                this.ErrorMsg = this.Language.GetMessage("spawfm", "error_rename_failed");
            }
        }

        // create directory
        if (!String.IsNullOrEmpty(Request.Form["new_folder"]))
        {
            try
            {
                File.CreateDirectory(this.CurrentDirectory, Request.Form["new_folder"]);
                this._on_load_select = Request.Form["new_folder"];
            }
            catch (System.Data.DuplicateNameException)
            {
                this.ErrorMsg = this.Language.GetMessage("spawfm", "error_create_directories_name_used");
            }
            catch (ArgumentException)
            {
                this.ErrorMsg = this.Language.GetMessage("spawfm", "error_create_directories_name_invalid");
            }
            catch (Exception)
            {
                this.ErrorMsg = this.Language.GetMessage("spawfm", "error_create_directories_failed");
            }
        }

        // file upload
        if (upload_file.PostedFile != null && upload_file.PostedFile.ContentLength > 0)
        {
            try
            {
                this._on_load_select = File.UploadFile(this.CurrentDirectory, upload_file.PostedFile);
            }
            catch (ArgumentException excp)
            {
                switch (excp.InnerException.Message)
                {
                    case "extension":
                        this.ErrorMsg = this.Language.GetMessage("spawfm", "error_bad_filetype");
                        break;
                    case "size":
                        this.ErrorMsg = this.Language.GetMessage("spawfm", "error_max_filesize") + " " + (Math.Round((double)this.CurrentDirectory.Settings.MaxUploadFilesize / 1024, 2)).ToString() + " KB";
                        break;
                    case "img_size":
                        this.ErrorMsg = this.Language.GetMessage("spawfm", "error_img_width_max").Replace("[*MAXWIDTH*]", this.CurrentDirectory.Settings.MaxImageWidth.ToString());
                        this.ErrorMsg = this.Language.GetMessage("spawfm", "error_img_height_max").Replace("[*MAXHEIGHT*]", this.CurrentDirectory.Settings.MaxImageHeight.ToString());
                        break;
                    default:
                        this.ErrorMsg = this.Language.GetMessage("spawfm", "error_upload_failed");
                        break;
                }
            }
            catch (System.Security.SecurityException)
            {
                this.ErrorMsg = this.Language.GetMessage("spawfm", "error_upload_forbidden");
            }
            catch (Exception)
            {
                this.ErrorMsg = this.Language.GetMessage("spawfm", "error_upload_failed");
            }
        }

        // javascript
        OutputScript();
    }

    void OutputScript()
    {
        if (!Page.ClientScript.IsClientScriptBlockRegistered("directory_listing_js"))
        {
            StringBuilder js_sb = new StringBuilder();
            string[] dirs = this.CurrentDirectory.GetSubdirectories();
            
            int total_index = 0;
            int selected_index = -1;

            if (dirs != null)
            {
                foreach (string dir_name in dirs)
                {
                    System.IO.DirectoryInfo di = new System.IO.DirectoryInfo(dir_name);
                    js_sb.Append("SpawFm.addDirectory(\"" + di.Name + "\", "
                        + "\"\", " // size
                        + "\"" + di.LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss") + "\", "
                        + "\"" + this.Language.GetMessage("file_details", "file_folder") + "\", "
                        + "\"../plugins/spawfm/img/" + Icon.GetDefaultFolderIcon(this.Configuration).Small + "\", "
                        + "\"../plugins/spawfm/img/" + Icon.GetDefaultFolderIcon(this.Configuration).Large + "\", "
                        + "\"\", " // thumb
                        + "\"\"" // other - reserved
                        + ");"
                    );
                    if (di.Name == this._on_load_select)
                        selected_index = total_index;

                    total_index++;
                }
            }
            string[] files = this.CurrentDirectory.GetFiles(String.IsNullOrEmpty(this.CurrentType) ? null : FileType.GetFileType(this.Configuration, this.CurrentType));
            if (files != null)
            {
                foreach (string file_name in files)
                {
                    System.IO.FileInfo fi = new System.IO.FileInfo(file_name);
                    js_sb.Append("SpawFm.addFile(\"" + fi.Name + "\", "
                        + "\"" + fi.Length + "\", " // size
                        + "\"" + fi.LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss") + "\", "
                        + "\"" + (String.IsNullOrEmpty(fi.Extension)?String.Empty:fi.Extension.Substring(1).ToUpper()) + " " + this.Language.GetMessage("file_details", "filetype_suffix") + "\", "
                        + "\"../plugins/spawfm/img/" + Icon.GetFileIcon(this.Configuration, fi.FullName).Small + "\", "
                        + "\"../plugins/spawfm/img/" + Icon.GetFileIcon(this.Configuration, fi.FullName).Large + "\", "
                        + "\"\", " // thumb
                        + "\"\"" // other - reserved
                        + ");"
                    );
                    if (fi.Name == this._on_load_select)
                        selected_index = total_index;

                    total_index++;
                }
            }

            js_sb.Append("SpawFm.setViewMode(1);");

            js_sb.Append("SpawFm.txtFileSize = \"" + this.Language.GetMessage("file_details", "size").Replace("\"","\\\"") + "\";");
            js_sb.Append("SpawFm.txtFileDate = \"" + this.Language.GetMessage("file_details", "date").Replace("\"", "\\\"") + "\";");
            js_sb.Append("SpawFm.txtConfirmDelete = \"" + this.Language.GetMessage("spawfm", "confirm_delete").Replace("\"", "\\\"") + "\";");
            js_sb.Append("SpawFm.txtDownload = \"" + this.Language.GetMessage("spawfm", "download_file").Replace("\"", "\\\"") + "\";");
            js_sb.Append("SpawFm.txtRename = \"" + this.Language.GetMessage("spawfm", "rename_text").Replace("\"", "\\\"") + "\";");
            js_sb.Append("SpawFm.txtCreateDirectory = \"" + this.Language.GetMessage("spawfm", "newdirectory_text").Replace("\"", "\\\"") + "\";");
            js_sb.Append("SpawFm.txtConfirmDeleteDir = \"" + this.Language.GetMessage("spawfm", "confirmdeletedir_text").Replace("\"", "\\\"") + "\";");

            js_sb.Append("SpawFm.filePath = \"" + this.CurrentDirectory.FullVirtualPath + "\";");
            js_sb.Append("SpawFm.allowModify = " + this.CurrentDirectory.Settings.AllowModify.ToString().ToLower() + ";");
            js_sb.Append("SpawFm.allowModifySubdirectories = " + this.CurrentDirectory.Settings.AllowModifySubdirectories.ToString().ToLower() + ";");

            if (selected_index > -1)
                js_sb.Append("SpawFm.onloadSelectFile = " + selected_index.ToString() + ";");

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "directory_listing_js", js_sb.ToString(), true);
        }
    }

}
