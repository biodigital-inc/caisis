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
using System.Text;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

public partial class Modules_SpecimenMgmt_StorageManager : System.Web.UI.Page
{
    //private static readonly string AddNewOnImage = "Images/AddNew.gif";
    //private static readonly string AddNewOffImage = "Images/AddNew_Off.gif";

    private static readonly string AddStorageOnImage = "Images/AddNewStorage.gif";
    private static readonly string AddStorageOffImage = "Images/AddNewStorage_Off.gif";

    private static readonly string AddContainerOnImage = "Images/AddNewContainer.gif";
    private static readonly string AddContainerOffImage = "Images/AddNewContainer_Off.gif";

    private static readonly string AddBoxOnImage = "Images/AddNewBox.gif";
    private static readonly string AddBoxOffImage = "Images/AddNewBox_Off.gif";

    StringBuilder sb = new StringBuilder();

    protected void Page_Load(object sender, EventArgs e)
    {
        // could also use Site BO with GetByParent call
        if (Page.IsPostBack)
        {
            this.HandleClickEvent(ItemType.Value, ItemValue.Value);
        }
        else
        {
            //Gets & highligts the path of box after moving entire box to new location
            this.SetSiteItems();
            string siteId = Request.QueryString["siteId"];
            if (!string.IsNullOrEmpty(siteId))
            {
                string highlightPath = "highlightItem('Site', '" + siteId + "');";

                this.SetStorageItems(siteId);
                string storageId = Request.QueryString["storageId"];
                if (!string.IsNullOrEmpty(storageId))
                {
                    highlightPath += "highlightItem('Storage', '" + storageId + "');";
                    this.SetContainerItems(storageId);
                    string containerId = Request.QueryString["containerId"];
                    if (!string.IsNullOrEmpty(containerId))
                    {
                        highlightPath += "highlightItem('Container', '" + containerId + "');";
                        this.SetBoxItems(containerId);
                    }
                }
                Page.ClientScript.RegisterStartupScript(typeof(Page), "highlightPath", highlightPath, true);
            }
        }
    }

    protected void HandleClickEvent(string storageType, string primaryKeyValue)
    {
        switch (storageType)
        {
            case "Site":
                OnSiteChange(primaryKeyValue); break;
            case "Storage":
                OnStorageChange(primaryKeyValue); break;
            case "Container":
                OnContainerChange(primaryKeyValue); break;
            case "Box":
                OnBoxChange(primaryKeyValue); break;
            default:
                break;
        }
    }

    protected void OnSiteChange(string siteId)
    {
        SetSiteItems();
        SetStorageItems(siteId);
        RptContainer.DataBind();
        RptBoxes.DataBind();
        SetAddRowImageStates();
    }

    protected void OnStorageChange(string storageId)
    {
        SetStorageItems(SiteId.Value);
        SetContainerItems(storageId);
        RptBoxes.DataBind();
        SetAddRowImageStates();
    }

    protected void OnContainerChange(string containerId)
    {
        SetContainerItems(StorageId.Value);
        SetBoxItems(containerId);
        SetAddRowImageStates();
    }

    protected void OnBoxChange(string boxId)
    {
        SetBoxItems(ContainerId.Value);
        RenderBox(boxId);
        SetAddRowImageStates();
    }

    protected void SetSiteItems()
    {
        DataView view = LookupCodeDa.GetLookupData("SpecimenSites", "SiteId", "SiteName", "", "");
        RptSite.DataSource = view;
        RptSite.DataBind();
    }

    private void SetStorageItems(string siteId)
    {
        SiteId.Value = siteId;
        StorageId.Value = string.Empty;
        ContainerId.Value = string.Empty;
        BoxId.Value = string.Empty;
        if (PageUtil.IsInteger(siteId))
        {
            int _siteId = int.Parse(siteId);

			DataView view = BusinessObject.GetByParentAsDataView<SpecimenStorage>(_siteId);

			//SpecimenStorage s = new SpecimenStorage();
			//s.GetByParent(_siteId);
			//if (s.RecordCount > 0)
			if (view.Count > 0)
            {
                //RptStorage.DataSource = s.DataSourceView;
				RptStorage.DataSource = view;
                RptStorage.DataBind();
            }
            else
            {
                RptStorage.DataBind();
                RptContainer.DataBind();
                RptBoxes.DataBind();
            }
        }

    }

    private void SetContainerItems(string storageId)
    {
        StorageId.Value = storageId;
        ContainerId.Value = string.Empty;
        BoxId.Value = string.Empty;
        if (PageUtil.IsInteger(storageId))
        {
            int _storageId = int.Parse(storageId);

			//SpecimenContainer c = new SpecimenContainer();
			//c.GetByParent(_storageId);
			//if (c.RecordCount > 0)
			DataView view = BusinessObject.GetByParentAsDataView<SpecimenContainer>(_storageId);
			if (view.Count > 0)
            {
                //RptContainer.DataSource = c.DataSourceView;
				RptContainer.DataSource = view;
                RptContainer.DataBind();
            }
            else
            {
                RptContainer.DataBind();
                RptBoxes.DataBind();
            }
        }

    }

    private void SetBoxItems(string containerId)
    {
        ContainerId.Value = containerId;
        BoxId.Value = string.Empty;
        if (PageUtil.IsInteger(containerId))
        {
            int _containerId = int.Parse(containerId);

			//SpecimenBox b = new SpecimenBox();
			//b.GetByParent(_containerId);
			//if (b.RecordCount > 0)
			DataView view = BusinessObject.GetByParentAsDataView<SpecimenBox>(_containerId);
			if (view.Count > 0)
            {
                //RptBoxes.DataSource = b.DataSourceView;
				RptBoxes.DataSource = view;
                RptBoxes.DataBind();
            }
            else
            {
                RptBoxes.DataBind();
            }
        }

    }


    /// <summary>
    /// Sets the enabled/disabled state of the add row buttons and their on/off images
    /// </summary>
    private void SetAddRowImageStates()
    {
        bool isStorageEnabled = !string.IsNullOrEmpty(SiteId.Value);
        bool isContainerEnabled = !string.IsNullOrEmpty(StorageId.Value);
        bool isBoxEnabled = !string.IsNullOrEmpty(ContainerId.Value);

        this.addStorageBtn.Enabled = isStorageEnabled;
        //this.addStorageBtn.ImageUrl = isStorageEnabled ? AddNewOnImage : AddNewOffImage;
        this.addStorageBtn.ImageUrl = isStorageEnabled ? AddStorageOnImage : AddStorageOffImage;
        this.addStorageBtn.Style["cursor"] = isStorageEnabled ? "pointer" : "default";
        if (isStorageEnabled) sb.Append("highlightItem('Site', '" + SiteId.Value + "');");


        this.addContainerBtn.Enabled = isContainerEnabled;
        //this.addContainerBtn.ImageUrl = isContainerEnabled ? AddNewOnImage : AddNewOffImage;
        this.addContainerBtn.ImageUrl = isContainerEnabled ? AddContainerOnImage : AddContainerOffImage;
        this.addContainerBtn.Style["cursor"] = isContainerEnabled ? "pointer" : "default";
        if (isContainerEnabled) sb.Append("highlightItem('Storage', '" + StorageId.Value + "');");


        this.addBoxBtn.Enabled = isBoxEnabled;
        //this.addBoxBtn.ImageUrl = isBoxEnabled ? AddNewOnImage : AddNewOffImage;
        this.addBoxBtn.ImageUrl = isBoxEnabled ? AddBoxOnImage : AddBoxOffImage;
        this.addBoxBtn.Style["cursor"] = isBoxEnabled ? "pointer" : "default";
        if (isBoxEnabled) sb.Append("highlightItem('Container', '" + ContainerId.Value + "');");

        Page.RegisterStartupScript("xyz", "<script language=javascript>" + sb.ToString() + "</script>");
    }

    private void RenderBox(string boxId)
    {
        BoxId.Value = boxId;
        if (PageUtil.IsInteger(boxId))
        {
            int _boxId = int.Parse(boxId);
        }
    }
}
