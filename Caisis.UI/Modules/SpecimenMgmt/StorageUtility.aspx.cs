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
using Caisis.UI.Core.Classes;

public partial class Modules_SpecimenMgmt_StorageUtility : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void OnSiteChange(Object sender, EventArgs e)
    {
       string siteId = Sites.SelectedValue;
       SetStorageItems(siteId);  
    }

    protected void OnStorageChange(Object sender, EventArgs e)
    {
        string storageId = Storages.SelectedValue;
        SetContainerItems(storageId);
    }

    protected void OnContainerChange(Object sender, EventArgs e)
    {
        string containerId = Containers.SelectedValue;
        SetBoxItems(containerId);
    }

    protected void OnBoxChange(Object sender, EventArgs e)
    {
        string boxId = Boxes.SelectedValue;
        RenderBox(boxId);
    }

    private void SetStorageItems(string siteId)
    {
        if (PageUtil.IsInteger(siteId))
        {
			//SpecimenStorage s = new SpecimenStorage();
			//s.GetByParent(int.Parse(siteId));
			//Storages.DataSource = s.DataSourceView;
			Storages.DataSource = BusinessObject.GetByParentAsDataView<SpecimenStorage>(int.Parse(siteId));
            Storages.DataTextField = SpecimenStorage.StorageName; // need to display storage type?
            Storages.DataValueField = SpecimenStorage.StorageId;
            Storages.DataBind();
        }
        else 
        { 
            Storages.Items.Clear();
            Containers.Items.Clear();
            Boxes.Items.Clear();
        }
    }

    private void SetContainerItems(string storageId)
    {
        if (PageUtil.IsInteger(storageId))
        {
			//SpecimenContainer c = new SpecimenContainer();
			//c.GetByParent(int.Parse(storageId));
			//Containers.DataSource = c.DataSourceView;
			Containers.DataSource = BusinessObject.GetByParentAsDataView<SpecimenContainer>(int.Parse(storageId));
            Containers.DataTextField = SpecimenContainer.ContainerName; // need to display storage type?
            Containers.DataValueField = SpecimenContainer.ContainerId;
            Containers.DataBind();
        }
        else 
        { 
            Containers.Items.Clear();
            Boxes.Items.Clear();
        }
    }

    private void SetBoxItems(string containerId)
    {
        if (PageUtil.IsInteger(containerId))
        {
			//SpecimenBox b = new SpecimenBox();
			//b.GetByParent(int.Parse(containerId));
			//Boxes.DataSource = b.DataSourceView;
			Boxes.DataSource = BusinessObject.GetByParentAsDataView<SpecimenBox>(int.Parse(containerId));
            Boxes.DataTextField = SpecimenBox.BoxName; // need to display box type?
            Boxes.DataValueField = SpecimenBox.BoxId;
            Boxes.DataBind();
        }
        else 
        {
            Boxes.Items.Clear();
        }
    }

    private void RenderBox(string boxId)
    {

    }
}
