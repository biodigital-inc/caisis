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
using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class JournalInfo : System.Web.UI.Page
    {
        private string _dropDownNewValue = " ------ Add New ------ ";
        private string _selectedJournal = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                _selectedJournal = JournalSelect.SelectedValue;
            }
            else
            {
                PopulateJournalDropDown(true);
                LoadBlankForm();
            }

        }

        private void PopulateJournalDropDown(bool resetToBlank)
        {
            // populate drop down; need to reset after saving since doc name may have changed
			//ProjectJournal biz = new ProjectJournal();
			//biz.GetAll();
			//JournalSelect.DataSource = biz.DataSourceView;
			JournalSelect.DataSource = BusinessObject.GetAllAsDataView<ProjectJournal>();
            JournalSelect.DataValueField = "JournalId";
            JournalSelect.DataTextField = "ShortName";
            JournalSelect.DataBind();

            JournalSelect.Items.Insert(0, new ListItem(""));
            JournalSelect.Items.Insert(1, new ListItem(_dropDownNewValue));

            if (IsPostBack && resetToBlank == false)
            {
                JournalSelect.SelectedValue = _selectedJournal;
            }
        }

        protected void JournalSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            string strJournal = JournalSelect.SelectedValue;

            if (strJournal.Contains("Add New"))
            {
                this.LoadBlankForm();
            }
            else if (strJournal != "")
            {
                this.SetFormFieldData(strJournal);
                SetFormState(false);
            }
        }

        private void LoadBlankForm()
        {
            foreach (Control con in PanelJournalInfo.Controls)
            {
                if (con is ICaisisInputControl)
                {
                    ((ICaisisInputControl)con).Value = "";
                }
            }

            JournalSelect.SelectedValue = _dropDownNewValue;
            SetFormState(true);
            UserMessage.Text = "To add a new Journal, enter the information below.  To edit an existing Journal, select the Journal above.<br/>Fields named in <span class=\"requiredField\">red</span> are required.";

        }

        protected void DeleteClick(object sender, CommandEventArgs e)
        {
            ProjectJournal journal = new ProjectJournal();
            string journalId = JournalSelect.SelectedValue;

            try
            {
                if (journalId != "" && journalId != _dropDownNewValue)
                {
                    journal.Delete(Int32.Parse(journalId));
                }
                PopulateJournalDropDown(true);
                LoadBlankForm();
                SetFormState(true);
            }
            catch (ChildDataPreventsDeleteException cde)
            {
                string msg = cde.Message.Replace("unable to delete this journal record", "<span class=\"requiredField\">unable to delete this physician record</span>");
                UserMessage.Text = msg.Replace("\n", "<br/>");
                SetFormState(false);
            }
        }

        private void SetFormFieldData(string journalId)
        {
            ProjectJournal biz = new ProjectJournal();
            biz.Get(int.Parse(journalId));

            CICHelper.SetFieldValues(Form.Controls, biz);
        }

        protected void SaveClick(object sender, CommandEventArgs e)
        {
            ProjectJournal biz = new ProjectJournal();

            if (!_selectedJournal.Equals(_dropDownNewValue) && _selectedJournal != null)
                biz.Get(int.Parse(_selectedJournal));

            CICHelper.SetBOValues(Form.Controls, biz, 0);

            biz.Save();


            _selectedJournal = biz[ProjectJournal.JournalId].ToString();
            JournalId.Value = biz[ProjectJournal.JournalId].ToString();

            PopulateJournalDropDown(false);

            SetFormState(false);

            RefreshMainList(_selectedJournal);
        }

        /// <summary>
        /// Signals list to refresh
        /// </summary>
        private void RefreshMainList(string selectedId)
        {
            string refreshList = "getAllJournals(" + selectedId + ");";
            Page.ClientScript.RegisterStartupScript(typeof(Page), "refreshList", refreshList, true);
        }

        protected void NewClick(object sender, CommandEventArgs e)
        {
            LoadBlankForm();
        }

        protected void CancelClick(object sender, CommandEventArgs e)
        {
            int temp;

            if (Int32.TryParse(_selectedJournal, out temp))
            {
                SetFormFieldData(_selectedJournal);
                SetFormState(false);
            }
            else
            {
                LoadBlankForm();
            }
        }

        protected void EditClick(object sender, CommandEventArgs e)
        {
            SetFormState(true);
        }

        private void SetFormState(bool isFormEnabled)
        {
            bool _isFormEnabled = isFormEnabled;
            CICHelper.EnableFields(this.Form.Controls, _isFormEnabled);

            if (_selectedJournal == "" || _selectedJournal.Equals(_dropDownNewValue))
            {
                // New
                SetButtonVisibility(true, true, true, true, false, true, true);
                SetButtonStates(false, false, true, true, false, true, false);

            }
            else
            {
                if (_isFormEnabled)
                {
                    // Populated Enabled Unlocked Form
                    SetButtonVisibility(true, true, true, true, false, true, true);
                    SetButtonStates(false, false, true, true, false, true, true);
                }
                else
                {
                    // Populated Disabled Unlocked Form
                    SetButtonVisibility(true, true, true, true, false, true, true);
                    SetButtonStates(true, true, false, false, false, false, false);
                }
            }

        }

        private void SetButtonStates(bool enableNewBtn, bool enableEditBtn, bool enableSaveBtn, bool enableLockBtn, bool enableUnlockBtn, bool enableCancelBtn, bool enableDeleteBtn)
        {
            // new
            if (enableNewBtn) { NewBtn.Enabled = true; NewBtn.ImageUrl = "../../Images/DataEntryButtons/Button_New_On.gif"; } else { NewBtn.Enabled = false; NewBtn.ImageUrl = "../../Images/DataEntryButtons/Button_New_Off.gif"; }

            // edit
            if (enableEditBtn) { EditBtn.Enabled = true; EditBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Edit_On.gif"; } else { EditBtn.Enabled = false; EditBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Edit_Off.gif"; }

            // save
            if (enableSaveBtn) { SaveBtn.Enabled = true; SaveBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Save_On.gif"; } else { SaveBtn.Enabled = false; SaveBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Save_Off.gif"; }

            // cancel
            if (enableCancelBtn) { CancelBtn.Enabled = true; CancelBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Cancel_On.gif"; } else { CancelBtn.Enabled = false; CancelBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Cancel_Off.gif"; };


            // delete
            if (enableDeleteBtn) { DeleteBtn.Enabled = true; DeleteBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Delete_On.gif"; }
            else
            {
                DeleteBtn.Enabled = false;
                DeleteBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Delete_Off.gif";
            }
        }

        private void SetButtonVisibility(bool showNewBtn, bool showEditBtn, bool showSaveBtn, bool showLockBtn, bool showUnlockBtn, bool showCancelBtn, bool showDeleteBtn)
        {
            NewBtn.Visible = showNewBtn;
            EditBtn.Visible = showEditBtn;
            SaveBtn.Visible = showSaveBtn;
            CancelBtn.Visible = showCancelBtn;
            DeleteBtn.Visible = showDeleteBtn;
        }
    }
}
