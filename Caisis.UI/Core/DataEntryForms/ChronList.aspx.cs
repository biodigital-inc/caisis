using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;

using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis;
using Caisis.Controller;

public partial class Core_PatientDataEntry_ChronList : BasePage
{
    /// <summary>
    /// The default Chron List Option
    /// </summary>
    private static readonly string DEFAULT_CHRONLIST = "ListAll";

    protected int recordCount;
    protected string selectedOption;
    // v3.5 private int lastPrimaryKey;
    string lastRowsDateText;
    static string ATTRIBUTE_NAME = "Exclude Labs";
    static string ATTRIBUTE_TYPE = "Chron List Preference";

    /// <summary>
    /// Gets the chron list parameter in Query String
    /// </summary>
    protected string ChronListType
    {
        get
        {
            return Request.QueryString["ChronListType"];
        }
    }

    protected override void Page_Load(object sender, EventArgs e)
    {
        // set setlected option based on Query String
        selectedOption = !string.IsNullOrEmpty(ChronListType) ? ChronListType : DEFAULT_CHRONLIST;
        if (!Page.IsPostBack)
        {
            SetFilterDropDownOptions();
            PublishChronList();
        }
    }

    /// <summary>
    /// Builds a list of Chron List Options
    /// </summary>
    private void SetFilterDropDownOptions()
    {
        PatientDataEntryController pdec = new PatientDataEntryController();
        DataView dv = pdec.GetChronListDropDownItems().DefaultView;
        dv.Sort = "ChronListPriority DESC, ChronListDisplayText ASC";
        ViewTypeRpt.DataSource = dv;
        ViewTypeRpt.DataBind();        
    }

    /// <summary>
    /// Builds the Chron List based on selected option
    /// </summary>
    private void PublishChronList()
    {
        UserController uc = new UserController();
        string userAttributeValue = uc.GetUserAttributeValue(ATTRIBUTE_NAME);
        bool excludeLabValues = false;
        bool.TryParse(userAttributeValue, out excludeLabValues);
        PublishChronList(excludeLabValues);
    }

    private void PublishChronList(bool excludeLabValues)
    {
        SessionHandler sh = new SessionHandler(Session);
        int patientId = sh.GetPatientId();
        bool isLabTest = selectedOption == "LabTests";
        if (isLabTest)
        {
            excludeLabValues = false;
        }
        // moved to ViewTypeSelectorItemCreate
        // ListTypeDisplay.Text = selectedOption;

        //if no listType is passed in Query String, and listType is not ItemsMissed or ItemsPending chronList Name is emptry string and will default to Most Relevant list
        ChronoDa da = new ChronoDa();
        DataSet ds = da.GetChronoList(patientId, selectedOption, User.Identity.Name, excludeLabValues);
        DataView chronDataSource = ds.Tables[0].DefaultView;
        if (isLabTest)
        {
            // during first load, build list and select value based on current session
            if (!Page.IsPostBack)
            {
                FillLabTestCheckBox(ds);
                SetLabCheckboxes(ds);
            }

            if (Session[SessionKey.LabsFilter] != null && !Session[SessionKey.LabsFilter].ToString().Equals(""))
            {
                string filter = "VarName IN (" + Session[SessionKey.LabsFilter] + ")";
                chronDataSource.RowFilter = filter;
            }

            LabTestFilter.Visible = true;
        }
        else if (selectedOption == "ListAll" || selectedOption == "ListCommon")
        {
            HideShowLabsBtnTd.Visible = true;
            if (excludeLabValues) { HideShowLabsBtn.ImageUrl = "../../Images/Button_IncludeLabsOff.png"; }
            else { HideShowLabsBtn.ImageUrl = "../../Images/Button_IncludeLabsOn.png"; }
        }
        else
        {
            LabTestFilter.Visible = false;
        }

        rptChrono.DataSource = chronDataSource;
        rptChrono.DataBind();

        recordCount = chronDataSource.Count;
    }
   

    /// <summary>
    /// Hides date field of sub items in Chronological List. Compares current and last primary key to determine if date should be displayed.
    /// Also shows post it note icon in Quality column if a note is pending for the record.
    /// </summary>
    /// <param name="Sender"></param>
    /// <param name="e"></param>
    protected void ChronListItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        Literal ChronListDateField = (Literal)e.Item.FindControl("ChronListDateField");
        Image NoteIcon = (Image)e.Item.FindControl("NoteIcon");

        DataRowView drv = (DataRowView)(e.Item.DataItem);

        int primaryKey = int.Parse(drv.Row["PrimaryKey"].ToString());
        int parentKey  = int.Parse(drv.Row["ParentKey"].ToString());
        bool pendingNote = (bool)drv.Row["PendingNote"];

        if (pendingNote)
        {
            NoteIcon.Visible = true;
        }

        // int groupNum = 0;
        //if (!drv.Row["GroupNumber"].Equals(System.DBNull.Value))
        //{
            // Chron Items that never have a date are in the .........
            // Encounter group numbers in the 100's
            // Procedures in the 300's
            // Items without date columns are in the 10's (like Identifier would 
            // groupNum = int.Parse(drv.Row["GroupNumber"].ToString());
        //}

        string thisRowsDateText = drv.Row["varDate"].ToString().Replace("/", "-"); // format dates as 12.25.2007

        if (thisRowsDateText.Equals(lastRowsDateText))
        {
            ChronListDateField.Text = "";
        }
        else
        {
            ChronListDateField.Text = thisRowsDateText;
        }
        lastRowsDateText = thisRowsDateText;
    }

   
    protected void ViewTypeSelectorItemCreate(object Sender, RepeaterItemEventArgs e)
    {
        HtmlImage PrimaryImage = (HtmlImage)e.Item.FindControl("PrimaryImage");
        HtmlImage SecondaryImage = (HtmlImage)e.Item.FindControl("SecondaryImage");



        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
			DataRowView drView = (DataRowView) e.Item.DataItem;
            if (drView["ChronListValue"] != null)
            {
                string specialCase = "";
				string val = drView["ChronListValue"].ToString();
				string display = drView["ChronListDisplayText"].ToString();

				if (selectedOption == val)
				{
					ListTypeDisplay.Text = display;
				}

                string viewValue = val.ToUpper();
                if (viewValue.IndexOf("LISTCOMMON") > -1)
                {
                    specialCase = "noIcon";
                }
                else if (viewValue.IndexOf("LISTALL") > -1)
                {
                    specialCase = "noIcon";
                }
                else if (viewValue.IndexOf("ITEMSMISSING") > -1)
                {
                    specialCase = "noIcon";
                }
                else if (viewValue.IndexOf("ITEMSPENDING") > -1)
                {
                    specialCase = "noIcon";
                }
                else if (viewValue.IndexOf("OPERATINGROOMDETAILS") > -1)
                {
                    specialCase = "ProceduresAndPathology";
                }



                if (specialCase == "noIcon")
                {
                    SecondaryImage.Visible = false;
                    PrimaryImage.Visible = false;

                }
                else if (specialCase == "ProceduresAndPathology")
                {
                    SecondaryImage.Visible = true;
                    PrimaryImage.Src = "../../Images/icon_Pathology.png";
                    SecondaryImage.Src = "../../Images/icon_Procedures.png";
                }
                else
                {
                    SecondaryImage.Visible = false;
                    PrimaryImage.Src = "../../Images/icon_" + val + ".png";
                }



            }


        }
    }

    #region LAB TESTS

    protected void OnHideShowLabBtnCommand(object sender, CommandEventArgs e)
    {
        UserController uc = new UserController();

        string attributeValue = uc.GetUserAttributeValue(ATTRIBUTE_NAME);

        attributeValue = attributeValue.ToLower().Equals("true") ? "false" : "true";

        uc.UpdateUserAttribute(ATTRIBUTE_NAME, attributeValue, ATTRIBUTE_TYPE);
        
        this.PublishChronList(bool.Parse(attributeValue));
    }

    /// <summary>
    /// Fills the lab test checkboxes with with distinct lab values
    /// </summary>
    /// <param name="ds"></param>
    protected void FillLabTestCheckBox(DataSet ds)
    {
        var labTestList = (from lab in ds.Tables[0].AsEnumerable()
                           let labTest = lab["VarName"].ToString()
                           select labTest).Distinct();

        LabCheckList.DataSource = labTestList;
        LabCheckList.DataBind();
    }
    /// <summary>
    /// Created Lab test checkboxes
    /// </summary>
    /// <param name="ds"></param>
    protected void SetLabCheckboxes(DataSet ds)
    {
        // check labs based on Session
        if (Session[SessionKey.LabsFilter] != null && !Session[SessionKey.LabsFilter].ToString().Equals(""))
        {
            //remove single quotes from values stored in session
            string listOfLabs = Session[SessionKey.LabsFilter].ToString().Replace("'", "");
            // put list in array
            string[] filterArray = listOfLabs.Split(new Char[] { ',' });
            // check items based on found session items
            FilterLabTests(filterArray);
        }
    }

    /// <summary>
    /// Create filter and store in Session based on checked boxes
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    public void CreateLabFilter(object sender, EventArgs e)
    {
        // build a list of selected lab filters where filter checked
        IEnumerable<string> selectedLabFilters = GetSelectedLabs();
        // update session lab filter
        if (selectedLabFilters.Count() > 0)
        {
            Session[SessionKey.LabsFilter] = "'" + string.Join("','", selectedLabFilters.ToArray()) + "'";
        }
        else
        {
            Session[SessionKey.LabsFilter] = string.Empty;
        }

        // update chron list
        PublishChronList();
    }

    /// <summary>
    /// Clears Lab Filter Checkboxes and shows all
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    public void ClearLabFilter(object sender, EventArgs e)
    {
        Session[SessionKey.LabsFilter] = string.Empty;
        LabCheckList.SelectedIndex = -1;
        // update list to reflect filter
        CreateLabFilter(sender, e);
    }

    /// <summary>
    /// Returns a list of selected Lab Test Checkboxes
    /// </summary>
    /// <returns></returns>
    private IEnumerable<string> GetSelectedLabs()
    {
        IEnumerable<string> selectedLabFilters = (from item in LabCheckList.Items.Cast<ListItem>()
                                                  let labValue = item.Value
                                                  where item.Selected
                                                  select labValue).Distinct();
        return selectedLabFilters;
    }

    /// <summary>
    /// Checks Lab Test Checkboxes based on a list of Lab Values
    /// </summary>
    /// <param name="labs"></param>
    private void FilterLabTests(IEnumerable<string> labs)
    {
        foreach (ListItem item in LabCheckList.Items)
        {
            string labItemValue = Server.HtmlDecode(item.Value);
            // if item is found in list, check
            if (labs.Contains(labItemValue))
            {
                item.Selected = true;
            }
            // otherwise uncheck
            else
            {
                item.Selected = false;
            }
        }
    }

    #endregion


}
