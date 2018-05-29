using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using System.Text;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    /// <summary>
    /// Specimen Storage Box displays and allows updates to existing specimen.
    /// </summary>
    public partial class SpecimenStorageBox : SpecimenMgmtBasePage
    {
        private int _boxId;
        private int _containerId;
        SpecimenManagerDa da = new SpecimenManagerDa();

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            _containerId = Convert.ToInt32(Request.QueryString["containerId"]);

            //Checks for BoxId is NULL or not
            if (string.IsNullOrEmpty(BoxId.Value))
            {
                if (!string.IsNullOrEmpty(Request.QueryString["boxId"]))
                {
                    BoxId.Value = Request.QueryString["boxId"];
                    _boxId = int.Parse(BoxId.Value);
                    LoadBoxInfo();
                    SpecimenBox box = new SpecimenBox();
                    box.Get(_boxId);
                    string boxType = box["BoxType"].ToString();

                    if (boxType == "Unstructured")
                    {
                        RegisterFilledSpecimensArray(_boxId);
                        SpecimensList.Style.Add("display", "block");
                        BoxMatrix.Style.Add("display", "none");
                        cellclk.Text = "Click on Reference #s in adjacent Box to show Specimen details";
                    }
                    else
                    {
                        RegisterFilledPositionsArray(_boxId);
                        SpecimensList.Style.Add("display", "none");
                        cellclk.Text = "Click on adjacent Box cells to show Specimen details";
                    }
                    
                    ReloadSpecimenStorageManager(_boxId, false);
                }
            }
            else
            {
                _boxId = int.Parse(BoxId.Value);
            }
        }

        //For unstructured boxes
        private void RegisterFilledSpecimensArray(int boxId)
        {
            DataTable specimenInBox = da.GetSpecimensInBoxbyOrder(boxId);
            StringBuilder sb=new StringBuilder();

            if (specimenInBox.Rows.Count > 0)
            {
                foreach (DataRow specimens in specimenInBox.Rows)
                {
                    HtmlAnchor a = new HtmlAnchor();
                    string specId = specimens["SpecimenId"].ToString();
                    string specRef = specimens["SpecimenReferenceNumber"].ToString();
                    sb.Append("<a href=javascript:showSpecimenInfo("+specId+")>" + specRef + "</a>\t");
                    SpecimensList.Text = sb.ToString();
                }
            }

            // Set Total Specimens Count
            DataTable totalspecimensinBox = da.GetSpecimensInBox(boxId);
            TotalSpecimens.Text = totalspecimensinBox.Rows.Count.ToString();
        }

        //For all other boxes
        private void RegisterFilledPositionsArray(int boxId)
        {
            DataTable specimenInBox = da.GetSpecimensByBoxId(boxId);
			//SpecimenPosition biz = new SpecimenPosition();
			//biz.GetByParent(boxId);
			DataView view = BusinessObject.GetByParentAsDataView<SpecimenPosition>(boxId);
            string jsArray = "";
            string jsFilledSpecimenIds = "";
            //foreach (DataRow row in biz.DataSourceView.Table.Rows)
			foreach (DataRow row in view.Table.Rows)
            {
                string positionName = row[SpecimenPosition.Position].ToString();
                string positionId = row[SpecimenPosition.PositionId].ToString();
                DataRow[] specimenByPositions = specimenInBox.Select("PositionId = " + positionId);
                if (!string.IsNullOrEmpty(positionName) && specimenByPositions.Length == 1)
                {
                    string specimenId = specimenByPositions[0][Specimen.SpecimenId].ToString();
                    jsArray += positionName + ",";
                    // Register Positions to SpecimenId
                    jsFilledSpecimenIds += "[" + positionName + "," + specimenId + "],";
                }
            }
            jsArray = jsArray.TrimEnd(",".ToCharArray());
            jsFilledSpecimenIds = jsFilledSpecimenIds.TrimEnd(",".ToCharArray());
            // Register javascript arrays (NOTE: must use [] instead of new Array())
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "filledPositionsArrayScript", "filledPositionsArray = [" + jsArray + "];", true);
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "filledSpecimenPositionArrayScript", "filledSpecimenPositionArray = [" + jsFilledSpecimenIds + "];", true);

            // Set Total Specimens Count
            DataTable totalspecimensinBox = da.GetSpecimensInBox(boxId);
            TotalSpecimens.Text = totalspecimensinBox.Rows.Count.ToString();
        }

        private void LoadBoxInfo()
        {
            SpecimenBox box = new SpecimenBox();
            box.Get(this._boxId);
            CICHelper.SetFieldValues(this.inputControlsRow.Controls, box);

            SpecimenContainer container = new SpecimenContainer();
            container.Get(this._containerId);

            Caisis.BOL.SpecimenStorage storage = new Caisis.BOL.SpecimenStorage();
            storage.Get(Int32.Parse(container[SpecimenContainer.StorageId].ToString()));

            SpecimenSite site = new SpecimenSite();
            site.Get(Int32.Parse(storage[Caisis.BOL.SpecimenStorage.SiteId].ToString()));

            this.PageTitle.Text = site[SpecimenSite.SiteName].ToString() + " > " + storage[Caisis.BOL.SpecimenStorage.StorageName].ToString() + " > " + container[SpecimenContainer.ContainerName].ToString() + " > " + box[SpecimenBox.BoxName].ToString();
            BoxName.Value = box[SpecimenBox.BoxName].ToString();

            DataTable dt = da.GetSpecimensByBoxId(_boxId);

            //Disables editing of columns & rows if box contains specimens
            if (dt.Rows.Count == 0)
            {
                NoOfColumns.ReadOnly = false;
                NoOfRows.ReadOnly = false;
            }
            else
            {
                NoOfColumns.ReadOnly = true;
                NoOfRows.ReadOnly = true;
                NoOfColumns.ToolTip = "# of columns can not be changed with specimens in Box";
                NoOfRows.ToolTip = "# of rows can not be changed with specimens in Box";
            }
        }

        protected void Save_Click(object sender, CommandEventArgs e)
        {
            bool isNewRecord = this._containerId == 0 ? false : true;

            SpecimenBox box = new SpecimenBox();
            box.Get(this._boxId);

            CICHelper.SetBOValues(Page.FindControl("inputControlsRow").Controls, box, 0);

            // set parent id for new record
            if (isNewRecord)
            {
                box[SpecimenBox.ContainerId] = _containerId;
            }
            box.Save();

            //Gets BoxId & reloads 
            _boxId = int.Parse(box[SpecimenBox.BoxId].ToString());

            ReloadSpecimenStorageManager(_boxId, false);
            CloseThisPage();
        }

        protected void Delete_Click(object sender, CommandEventArgs e)
        {
            ReloadSpecimenStorageManager(this._boxId, true);

            // set BoxId and PositionId in Specimens to NULL for the deleting Box
            SpecimenManagerDa da = new SpecimenManagerDa();
            da.DeleteBoxReferenceFromSpecimens(this._boxId);
            
            SpecimenBox box = new SpecimenBox();
            box.Delete(this._boxId);

            CloseThisPage();
        }

        private void CloseThisPage()
        {
            Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "CloseModal", "top.hideModal();", true);
        }

        //Reloads Parent window by getting all the parameters through BoxId
        //checks for the Box delete
        private void ReloadSpecimenStorageManager(int boxId, bool isDelete)
        {
            DataSet resultsDataSet = da.GetBoxAndAncestors(boxId);
            DataTable boxesDT = resultsDataSet.Tables[0];
            string boxIdStr = boxId.ToString();
            DataTable containersDT = resultsDataSet.Tables[1];
            string containerIdStr = boxesDT.Rows[0][SpecimenBox.ContainerId].ToString();
            DataTable storagesDT = resultsDataSet.Tables[2];
            string storagesIdStr = containersDT.Rows[0][SpecimenContainer.StorageId].ToString();
            string siteId = resultsDataSet.Tables[3].Rows[0][SpecimenSite.SiteId].ToString();

            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "RefreshStorageManger", "refreshStorageManger(" + siteId + "," + storagesIdStr + "," + containerIdStr + "," + boxIdStr + "," + isDelete.ToString().ToLower() + ");", true);
        }
    }
}
