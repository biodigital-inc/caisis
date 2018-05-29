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

namespace Caisis.UI.Plugins.SpecimenLocation
{
    public partial class SpecimenBoxCallBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string methodName = Request.Form["methodName"];
            switch (methodName)
            {
                case ("getStorages"):
                    GetStorages();
                    break;
                case ("getContainers"):
                    GetContainers();
                    break;
                case ("getBoxes"):
                    GetBoxes();
                    break;
                case ("getBoxMatrix"):
                    GetBoxMatrix();
                    break;
                case ("updateSpecimenLocation"):
                    UpdateSpecimenLocation();
                    break;
                case ("moveBoxToNewContainer"):
                    MoveBoxToNewContainer();
                    break;

            }
        }

        protected void MoveBoxToNewContainer()
        {
            int boxId = int.Parse(Request.Form["boxId"]);
            int newContainerId = int.Parse(Request.Form["newContainerId"]);
            SpecimenBox box = new SpecimenBox();
            box.Get(boxId);
            box[SpecimenBox.ContainerId] = newContainerId;
            box.Save();
        }

        protected void UpdateSpecimenLocation()
        {
            Response.ContentType = "text/html";

            int collectionId = int.Parse(Request.Form["collectionId"]);
            int srcBoxId = int.Parse(Request.Form["srcBoxId"]);
            int srcPos = int.Parse(Request.Form["srcPosition"]);
            int destBoxId = int.Parse(Request.Form["destBoxId"]);
            int destPos = int.Parse(Request.Form["destPosition"]);

            SpecimenManagerDa da = new SpecimenManagerDa();
            DataTable tmp = da.GetSpecimensByBoxId(srcBoxId, collectionId);
            // Trace back to specimen record
            DataRow[] rows = tmp.Select(SpecimenPosition.Position + " = '" + srcPos + "'");
            if (rows.Length > 0)
            {
                DataRow row = rows[0];
                SpecimenPosition specPosBiz = new SpecimenPosition();
                int positionId = int.Parse(row[Specimen.PositionId].ToString());
                specPosBiz.Get(positionId);
                specPosBiz[SpecimenPosition.BoxId] = destBoxId;
                specPosBiz[SpecimenPosition.Position] = destPos;
                specPosBiz.Save();

                Specimen specBiz = new Specimen();
                int specimenId = int.Parse(row[Specimen.SpecimenId].ToString());
                specBiz.Get(specimenId);
                specBiz[Specimen.BoxId] = destBoxId;
                specBiz.Save();

                Response.Write("true");
                Response.End();
            }
            Response.Write("false");
            Response.End();
        }

        protected void GetStorages()
        {
            string mySiteId = Request.Form["SitesId"];
            int siteId = int.Parse(mySiteId);
			//SpecimenStorage biz = new SpecimenStorage();
			//biz.GetByParent(siteId);
			//DropDownResults.DataSource = biz.DataSourceView;
			DropDownResults.DataSource = BusinessObject.GetByParentAsDataView<SpecimenStorage>(siteId);
            DropDownResults.DataValueField = SpecimenStorage.StorageId;
            DropDownResults.DataTextField = SpecimenStorage.StorageName;
            DropDownResults.DataBind();
        }

        protected void GetContainers()
        {
            string myStorageId = Request.Form["StoragesId"];
            int containerId = int.Parse(myStorageId);
			//SpecimenContainer biz = new SpecimenContainer();
			//biz.GetByParent(containerId);
			//DropDownResults.DataSource = biz.DataSourceView;
			DropDownResults.DataSource = BusinessObject.GetByParentAsDataView<SpecimenContainer>(containerId);
            DropDownResults.DataValueField = SpecimenContainer.ContainerId;
            DropDownResults.DataTextField = SpecimenContainer.ContainerName;
            DropDownResults.DataBind();
        }

        protected void GetBoxes()
        {
            string myContainerId = Request.Form["ContainersId"];
            int boxId = int.Parse(myContainerId);
			//SpecimenBox biz = new SpecimenBox();
			//biz.GetByParent(boxId);
			//DropDownResults.DataSource = biz.DataSourceView;
			DropDownResults.DataSource = BusinessObject.GetByParentAsDataView<SpecimenBox>(boxId);
            DropDownResults.DataValueField = SpecimenBox.BoxId;
            DropDownResults.DataTextField = SpecimenBox.BoxName;
            DropDownResults.DataBind();
        }

        protected void GetBoxMatrix()
        {
            string myBoxId = Request.Form["BoxId"];
            int boxId;
            if (int.TryParse(myBoxId, out boxId))
            {
                SpecimenBox box = new SpecimenBox();
                box.Get(boxId);
				//SpecimenPosition pos = new SpecimenPosition();
				//pos.GetByParent(boxId);
				//// Build a string array of position indexes
				//DataTable positionDataTable = pos.DataSourceView.Table;
				DataTable positionDataTable = BusinessObject.GetByParentAsDataView<SpecimenPosition>(boxId).Table;
                int positionIndexCount = positionDataTable.Rows.Count;
                string[] posIndexes = new string[positionIndexCount];
                string posIndexStringArray = "[";
                for (int i = 0; i < positionIndexCount; i++)
                {
                    object val = positionDataTable.Rows[i][SpecimenPosition.Position];
                    if (val != null)
                    {
                        int index;
                        if (int.TryParse(val.ToString(), out index))
                        {
                            posIndexStringArray += index + ",";
                        }
                    }
                }
                posIndexStringArray = posIndexStringArray.TrimEnd(",".ToCharArray());
                posIndexStringArray += "]";
                int rows = 20;
                if (box[SpecimenBox.NoOfRows] != null && !string.IsNullOrEmpty(box[SpecimenBox.NoOfRows].ToString()))
                {
                    rows = int.Parse(box[SpecimenBox.NoOfRows].ToString());
                }
                int cols = 20; 
                if (box[SpecimenBox.NoOfColumns] != null && !string.IsNullOrEmpty(box[SpecimenBox.NoOfColumns].ToString()))
                {
                    cols = int.Parse(box[SpecimenBox.NoOfColumns].ToString());
                }

                string boxType = String.Empty;
                if (box[SpecimenBox.BoxType] != null && !string.IsNullOrEmpty(box[SpecimenBox.BoxType].ToString()))
                {
                    boxType = box[SpecimenBox.BoxType].ToString();
                }

                int maxPos = rows * cols;
                if (box[SpecimenBox.MaxPositionNo] != null && !string.IsNullOrEmpty(box[SpecimenBox.MaxPositionNo].ToString()))
                {
                    maxPos = int.Parse(box[SpecimenBox.MaxPositionNo].ToString());
                }
                // Check if calling for transfer
                SpecimenManagerDa da = new SpecimenManagerDa();
                string transferPositionsArray = "";
                if (!string.IsNullOrEmpty(Request.Form["getTransfers"]) && !string.IsNullOrEmpty(Request.Form["collectionId"]))
                {
                    int collectionId = int.Parse(Request.Form["collectionId"]);
                    DataTable specsInBoxDT = da.GetSpecimensByBoxId(boxId, collectionId);

                    ArrayList oBoxTransferPosArr = new ArrayList();
                    foreach (DataRow dr in specsInBoxDT.Rows)
                    {
                        if (dr["Transferable"].ToString() == "yes")
                        {
                            oBoxTransferPosArr.Add(dr[SpecimenPosition.Position].ToString());
                        }
                    }
                    string oBoxTransferPos = String.Join(", ", (string[])oBoxTransferPosArr.ToArray(typeof(string)));
                    transferPositionsArray = "[" + oBoxTransferPos + "]";
                }

                string clientTransferArray = !string.IsNullOrEmpty(transferPositionsArray) ? ("," + transferPositionsArray) : string.Empty;

                //if (!string.IsNullOrEmpty(Request.Form["NeedPath"]) || true)
                //{

                int specimensInBox = da.GetSpecimensInBox(boxId).Rows.Count;
                DataSet resultsDataSet = da.GetBoxAndAncestors(boxId);
                DataTable boxesDT = resultsDataSet.Tables[0];
                string boxIdStr = boxId.ToString();
                DataRow boxRow = boxesDT.Select(SpecimenBox.BoxId + "=" + boxIdStr)[0];
                string boxName=PageUtil.EscapeSingleQuotes(boxRow[SpecimenBox.BoxName].ToString());

                DataTable containersDT = resultsDataSet.Tables[1];
                string containerIdStr = boxesDT.Rows[0][SpecimenBox.ContainerId].ToString();
                DataRow containerRow = containersDT.Select(SpecimenContainer.ContainerId + " = " + containerIdStr)[0];
                string containerName = PageUtil.EscapeSingleQuotes(containerRow[SpecimenContainer.ContainerName].ToString());

                DataTable storagesDT = resultsDataSet.Tables[2];
                string storagesIdStr = containersDT.Rows[0][SpecimenContainer.StorageId].ToString();
                DataRow specimenRow = storagesDT.Select(SpecimenStorage.StorageId + " = " + storagesIdStr)[0];
                string storageName = PageUtil.EscapeSingleQuotes(specimenRow[SpecimenStorage.StorageName].ToString());

                DataTable siteDT = resultsDataSet.Tables[3];
                string siteId = siteDT.Rows[0][SpecimenSite.SiteId].ToString();
                DataRow siteRow = siteDT.Select(SpecimenSite.SiteId + " = " + siteId)[0];
                string siteName = PageUtil.EscapeSingleQuotes(siteRow[SpecimenSite.SiteName].ToString());

                BindDropDownList(StoragesDropDown, storagesDT, SpecimenStorage.StorageName, SpecimenStorage.StorageId, storagesIdStr);
                BindDropDownList(ContainersDropDown, containersDT, SpecimenContainer.ContainerName, SpecimenContainer.ContainerId, containerIdStr);
                BindDropDownList(BoxesDropDown, boxesDT, SpecimenBox.BoxName, SpecimenBox.BoxId, boxIdStr);
                SiteId.Text = siteId;
                //}

                string js = "new Array(" + rows + "," + cols + "," + maxPos + "," + posIndexStringArray + clientTransferArray + ",'" + siteName + "','" + storageName + "','" + containerName + "'," + specimensInBox + ",'" + boxName + "','" + boxType +"')";
                BoxMatrix.Text = js;
            }
        }

        private void BindDropDownList(CaisisSelect dropdown, DataTable dt, string textField, string valueField, string selectedVal)
        {
            dropdown.DataSource = dt;
            dropdown.DataTextField = textField;
            dropdown.DataValueField = valueField;
            dropdown.DataBind();
            dropdown.Value = selectedVal;

        }
    }
}
