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

public partial class Core_Utilities_AddEditProtocols : BasePage
{
    private string _dropDownNewValue = " ------ Add New ------ ";
    private string _selectedProtocol = "";

    // TODO: ADD VALIDATION BEFORE DELETE THAT PROTOCOL HAS NO ASSOCIATIONS


    override protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            _selectedProtocol = ProtocolsDropDown.SelectedValue;
            UserMessage.Text = "Listed below is the current record for this Protocol. Fields named in <span class=\"requiredField\">red</span> are required.";
        }
        else
        {
            PopulateProtocolDropDown(true);
            //SetFormState(true);
            LoadBlankForm();
        }
    }

    private void PopulateProtocolDropDown(bool resetToBlank)
    {
        // populate drop down; need to reset after saving since doc name may have changed
        ProtocolDa da = new ProtocolDa();
        DataSet ds = da.GetDistinctProtocols();
        ProtocolsDropDown.DataSource = ds.Tables[0].DefaultView;
        ProtocolsDropDown.DataValueField = "ProtocolId";
        ProtocolsDropDown.DataTextField = "Protocol";
        ProtocolsDropDown.DataBind();
        ProtocolsDropDown.Items.Insert(0, new ListItem(""));
        ProtocolsDropDown.Items.Insert(1, new ListItem(_dropDownNewValue));

        if (IsPostBack && resetToBlank == false)
        {
            ProtocolsDropDown.SelectedValue = _selectedProtocol;
        }
    }

    protected void OnDropDownChange(object sender, EventArgs e)
    {
        string doc = ProtocolsDropDown.SelectedValue;

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

        ProtocolsDropDown.SelectedValue = _dropDownNewValue;
        ResetAuditLabels();
        SetFormState(true);
        UserMessage.Text = "To add a new protocol, enter the information below.  To edit an existing protocol, select from the drop down items above.<br/>Fields named in <span class=\"requiredField\">red</span> are required.";

    }

    private void SetFormFieldData(string docId)
    {
        Protocol Protocol = new Protocol();
        Protocol.Get(int.Parse(docId));

        foreach (Control con in Form.Controls)
        {
            if (con is ICaisisInputControl)
            {
                ICaisisInputControl cic = (ICaisisInputControl)con;
                string fieldName = cic.Field;
                cic.Value = Protocol[fieldName].ToString();
            }
        }

        // set EnteredBy if present
        EnteredBy.Text = Protocol[Protocol.EnteredBy].ToString();
        EnteredTime.Text = Protocol[Protocol.EnteredTime].ToString();
        UpdatedBy.Text = Protocol[Protocol.UpdatedBy].ToString();
        UpdatedTime.Text = Protocol[Protocol.UpdatedTime].ToString();
        LockedBy.Text = Protocol[Protocol.LockedBy].ToString();
        LockedTime.Text = Protocol[Protocol.LockedBy].ToString();

    }

    protected void SaveClick(object sender, CommandEventArgs e)
    {
        Protocol Protocol = new Protocol();
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
                Protocol[fieldName] = cic.Value;
            }
        }

        // need to set entered
        Protocol[Protocol.EnteredBy] = EnteredBy.Text;
        Protocol[Protocol.EnteredTime] = EnteredTime.Text;

        if (e.CommandName.Equals("Lock"))
        {
            Protocol.Lock();
        }
        else if (e.CommandName.Equals("Unlock"))
        {
            Protocol.Unlock();
        }
        else
        {
            Protocol.Save();
        }

        _selectedProtocol = Protocol[Protocol.ProtocolId].ToString();
        ProtocolId.Value = Protocol[Protocol.ProtocolId].ToString();
        EnteredBy.Text = Protocol[Protocol.EnteredBy].ToString();
        EnteredTime.Text = Protocol[Protocol.EnteredTime].ToString();
        UpdatedBy.Text = Protocol[Protocol.UpdatedBy].ToString();
        UpdatedTime.Text = Protocol[Protocol.UpdatedTime].ToString();
        LockedBy.Text = Protocol[Protocol.LockedBy].ToString();
        LockedTime.Text = Protocol[Protocol.LockedTime].ToString();

        PopulateProtocolDropDown(false);

        SetFormState(false);
    }

    protected void NewClick(object sender, CommandEventArgs e)
    {
        LoadBlankForm();
    }

    protected void CancelClick(object sender, CommandEventArgs e)
    {
        int temp;

        if (Int32.TryParse(_selectedProtocol, out temp))
        {
            SetFormFieldData(_selectedProtocol);
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
        Protocol protocol = new Protocol();
        string protocolId = ProtocolsDropDown.SelectedValue;

        // NEED TO VALIDATE
        //if (protocolId != "" && protocolId != _dropDownNewValue)
        //{
        //    ProtocolDa pda = new ProtocolDa();
        //    DataSet ds = pda.ValidateProtocolDeletion(int.Parse(protocolId));
        //    if (ds.Tables[0].Rows.Count == 0)
        //    {
        //        protocol.Delete(int.Parse(protocolId));
        //        PopulateProtocolDropDown(true);
        //        LoadBlankForm();
        //        ResetAuditLabels();
        //        SetFormState(true);
        //    }
        //    else
        //    {
        //        UserMessage.Text = "You are <span class=\"requiredField\">unable to delete this protocol</span> because there are currently " + ds.Tables[0].Rows.Count + " patients associated with it. <br>Please contact the system admin for help deleting this Protocol.";
        //        SetFormState(false);
        //    }
        //}

        try
        {
            protocol.Delete(int.Parse(protocolId));
            PopulateProtocolDropDown(true);
            LoadBlankForm();
            ResetAuditLabels();
            SetFormState(true);
        }
        catch (ChildDataPreventsDeleteException cde)
        {
            string msg = cde.Message.Replace("unable to delete this protocol", "<span class=\"requiredField\">unable to delete this protocol</span>");
            msg = msg.Replace("\n", "<br/>");
            UserMessage.Text = msg;
            SetFormState(false);
        }
    }

    private void SetFormState(bool isFormEnabled)
    {
        bool _isFormEnabled = isFormEnabled;
        CICHelper.EnableFields(this.Form.Controls, _isFormEnabled);

        if (_selectedProtocol == "" || _selectedProtocol.Equals(_dropDownNewValue))
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

        if (PermissionManager.HasPermission(PermissionManager.UnlockData)) canUnlockRecords = true;
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
