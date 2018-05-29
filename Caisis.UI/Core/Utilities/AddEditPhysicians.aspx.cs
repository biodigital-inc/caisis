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
using Caisis.DataAccess;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;
using Caisis.Security;

// TODO: ADD VALIDATION BEFORE DELETE THAT PHYSICIAN HAS NO ASSOCIATIONS


public partial class Core_Utilities_AddEditPhysicians : BasePage //BasePage
{
    private string _dropDownNewValue = " ------ Add New ------ ";
    private string _selectedPhysician = "";
    

    override protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            _selectedPhysician = PhysiciansDropDown.SelectedValue;
            UserMessage.Text = "Listed below is the current record for this physician. Fields named in <span class=\"requiredField\">red</span> are required.";
        }
        else
        {
            string physid = Request["physid"];
            
            if (physid != null && physid != "")
            {
                PopulatePhysicianDropDown(false);
                PhysiciansDropDown.SelectedValue = physid;
                _selectedPhysician = physid;
                SetFormFieldData(physid);
                SetFormState(false);
            }
            else
            {
                PopulatePhysicianDropDown(true);
                //SetFormState(true);
                LoadBlankForm();
            }
        }
    }

    private void PopulatePhysicianDropDown(bool resetToBlank)
    {
        // populate drop down; need to reset after saving since doc name may have changed
        PhysicianDa da = new PhysicianDa();
        DataSet ds = da.GetDistinctPhysicians();
        PhysiciansDropDown.DataSource = ds.Tables[0].DefaultView;
        PhysiciansDropDown.DataValueField = "PhysicianId";
        PhysiciansDropDown.DataTextField = "PhName";
        PhysiciansDropDown.DataBind();
        PhysiciansDropDown.Items.Insert(0, new ListItem(""));
        PhysiciansDropDown.Items.Insert(1, new ListItem(_dropDownNewValue));

        if (IsPostBack && resetToBlank == false)
        { 
            PhysiciansDropDown.SelectedValue = _selectedPhysician;
        }
    }

    protected void OnDropDownChange(object sender, EventArgs e)
    {
        string doc = PhysiciansDropDown.SelectedValue;

        if (doc.Contains("Add New"))
        {
            this.LoadBlankForm();
        }
        else if (doc != "")
        {
            this.SetFormFieldData(doc);
            SetFormState(false);
        }
    }

    private void LoadBlankForm()
    {
        foreach (Control con in Form.Controls)
        {
            if (con is ICaisisInputControl)
            {
                ((ICaisisInputControl)con).Value = "";
            }
        }

        PhysiciansDropDown.SelectedValue = _dropDownNewValue;
        ResetAuditLabels();
        SetFormState(true);
        UserMessage.Text = "To add a new physician, enter his or her information below.  To edit an existing physician, select the physician above.<br/>Fields named in <span class=\"requiredField\">red</span> are required.";  

    }

    private void SetFormFieldData(string docId)
    {
        Physician physician = new Physician();
        physician.Get(int.Parse(docId));
       
        foreach (Control con in Form.Controls)
        {
            if (con is ICaisisInputControl)
            {
                ICaisisInputControl cic = (ICaisisInputControl)con;
                string fieldName = cic.Field;
                cic.Value = physician[fieldName].ToString();
            }
        }

        // set EnteredBy if present
        EnteredBy.Text = physician[Physician.EnteredBy].ToString();
        EnteredTime.Text = physician[Physician.EnteredTime].ToString();
        UpdatedBy.Text = physician[Physician.UpdatedBy].ToString();
        UpdatedTime.Text = physician[Physician.UpdatedTime].ToString();
        LockedBy.Text = physician[Physician.LockedBy].ToString();
        LockedTime.Text = physician[Physician.LockedBy].ToString();
        
    }

    protected void SaveClick(object sender, CommandEventArgs e)
    {
        Physician physician = new Physician();
        foreach (Control con in Form.Controls)
        {
            if (con is ICaisisInputControl)
            {
                ICaisisInputControl cic = (ICaisisInputControl)con;
                if (cic.Required && cic.Value.Trim() == "")
                {
                    UserMessage.Text = "<span class=\"requiredField\">Fields named in red are required.</span>";
                    return;
                }
                string fieldName = cic.Field;
                physician[fieldName] = cic.Value;
            }
        }

        // need to set entered
        physician[Physician.EnteredBy] = EnteredBy.Text;
        physician[Physician.EnteredTime] = EnteredTime.Text;

        if (e.CommandName.Equals("Lock"))
        {
            physician.Lock();
        }
        else if (e.CommandName.Equals("Unlock"))
        {
            physician.Unlock();
        }
        else
        {
            physician.Save();
        }

        _selectedPhysician = physician[Physician.PhysicianId].ToString();
        PhysicianId.Value = physician[Physician.PhysicianId].ToString();
        EnteredBy.Text = physician[Physician.EnteredBy].ToString();
        EnteredTime.Text = physician[Physician.EnteredTime].ToString();
        UpdatedBy.Text = physician[Physician.UpdatedBy].ToString();
        UpdatedTime.Text = physician[Physician.UpdatedTime].ToString();
        LockedBy.Text = physician[Physician.LockedBy].ToString();
        LockedTime.Text = physician[Physician.LockedTime].ToString();

        PopulatePhysicianDropDown(false);

        SetFormState(false);

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "CloseWindowScript", "ClosePhysicianPopup();", true);
    }

    protected void NewClick(object sender, CommandEventArgs e)
    {
        LoadBlankForm();
    }

    protected void CancelClick(object sender, CommandEventArgs e)
    {
        int temp;

        if (Int32.TryParse(_selectedPhysician, out temp))
        {
            SetFormFieldData(_selectedPhysician);
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

    protected void DeleteClick(object sender, CommandEventArgs e)
    {
        Physician physician = new Physician();
        string physicianId = PhysiciansDropDown.SelectedValue;

        //// NEED TO VALIDATE
        //if (physicianId != "" && physicianId != _dropDownNewValue)
        //{
        //    physician.Delete(int.Parse(physicianId));
        //}

        //PopulatePhysicianDropDown(true);
        //LoadBlankForm();
        //ResetAuditLabels();
        //SetFormState(true);

        try
        {
            if (physicianId != "" && physicianId != _dropDownNewValue)
            {
                physician.Delete(Int32.Parse(physicianId));
            }
            PopulatePhysicianDropDown(true);
            LoadBlankForm();
            ResetAuditLabels();
            SetFormState(true);
            RegisterClientScriptBlock("CloseWindowScript", "<script>ClosePhysicianPopup();</script>");
        }
        catch (ChildDataPreventsDeleteException cde)
        {
            string msg = cde.Message.Replace("unable to delete this physician record", "<span class=\"requiredField\">unable to delete this physician record</span>");
            UserMessage.Text = msg.Replace("\n", "<br/>");
            SetFormState(false);
        }
    }

    private void SetFormState(bool isFormEnabled)
    {
        bool _isFormEnabled = isFormEnabled;
        CICHelper.EnableFields(this.Form.Controls, _isFormEnabled);

        if (_selectedPhysician == "" || _selectedPhysician.Equals(_dropDownNewValue))
        {
            // New
            SetButtonVisibility(true, true, true, true, false, true, true);
            SetButtonStates(false, false, true, true, false, true, false);

        }
        else
        {
            if (LockedBy.Text != "")
            {
                // Populated  Locked Form
                SetButtonVisibility(true, true, true, false, true, true, true);
                SetButtonStates(true, false, false, false, true, false, false);
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

    }

     private void SetButtonStates(bool enableNewBtn, bool enableEditBtn, bool enableSaveBtn, bool enableLockBtn, bool enableUnlockBtn, bool enableCancelBtn, bool enableDeleteBtn)
     {
            bool canUnlockRecords = false;
            bool canDeleteRecords = false;
            bool canAddEditRecords = false;

            if (PermissionManager.HasPermission(PermissionManager.UnlockData) ) canUnlockRecords = true;
            if (PermissionManager.HasPermission(PermissionManager.DeleteData)) canDeleteRecords = true;
            if (PermissionManager.HasPermission(PermissionManager.EditData)) canAddEditRecords = true;
            
            // new
            if (enableNewBtn && canAddEditRecords) { NewBtn.Enabled = true; NewBtn.ImageUrl = "../../Images/DataEntryButtons/Button_New_On.gif"; } else { NewBtn.Enabled = false; NewBtn.ImageUrl = "../../Images/DataEntryButtons/Button_New_Off.gif"; }
            
            // edit
            if (enableEditBtn && canAddEditRecords) { EditBtn.Enabled = true; EditBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Edit_On.gif"; } else { EditBtn.Enabled = false; EditBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Edit_Off.gif"; }
            
            // save
            if (enableSaveBtn && canAddEditRecords) { SaveBtn.Enabled = true; SaveBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Save_On.gif"; } else { SaveBtn.Enabled = false; SaveBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Save_Off.gif"; }

            // cancel
            if (enableCancelBtn) { CancelBtn.Enabled = true; CancelBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Cancel_On.gif"; } else { CancelBtn.Enabled = false; CancelBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Cancel_Off.gif"; };
         
            // lock
            if (enableLockBtn && canAddEditRecords) { LockBtn.Enabled = true; LockBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Lock_On.gif"; } else { LockBtn.Enabled = false; LockBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Lock_Off.gif"; }
            
            // unlock
            if (enableUnlockBtn && canUnlockRecords) { UnlockBtn.Enabled = true; UnlockBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Unlock_On.gif"; }
            else 
            { 
                UnlockBtn.Enabled = false;  
                UnlockBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Unlock_Off.gif";
                if (canUnlockRecords = false)
                {
                    UnlockBtn.Attributes.Add("onclick", "alert('Sorry. You do not have rights to unlock records.')");
                }
            }
 
            // delete
            if (enableDeleteBtn && canDeleteRecords) { DeleteBtn.Enabled = true; DeleteBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Delete_On.gif"; }
            else 
            { 
                DeleteBtn.Enabled = false;  
                DeleteBtn.ImageUrl = "../../Images/DataEntryButtons/Button_Delete_Off.gif";
                if (canDeleteRecords = false)
                {
                    DeleteBtn.Attributes.Add("onclick", "alert('Sorry. You do not have rights to delete records.')");
                }
            }
        }

     private void SetButtonVisibility(bool showNewBtn, bool showEditBtn, bool showSaveBtn, bool showLockBtn, bool showUnlockBtn, bool showCancelBtn, bool showDeleteBtn)
     {
            NewBtn.Visible = showNewBtn;
            EditBtn.Visible = showEditBtn;
            SaveBtn.Visible = showSaveBtn;
            LockBtn.Visible = showLockBtn;
            UnlockBtn.Visible = showUnlockBtn;
            CancelBtn.Visible = showCancelBtn;
            DeleteBtn.Visible = showDeleteBtn;
     }

    private void ResetAuditLabels()
    {
        EnteredBy.Text = "";
        EnteredTime.Text = "";
        UpdatedBy.Text = "";
        UpdatedTime.Text = "";
        LockedBy.Text = "";
        LockedTime.Text = "";
    }
}
