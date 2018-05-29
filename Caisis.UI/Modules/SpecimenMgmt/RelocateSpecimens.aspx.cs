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

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class RelocateSpecimens : SpecimenMgmtBasePage
    {
        /// <summary>
        /// Gets the Box Id from the Query String
        /// </summary>
        private int QueryBoxId
        {
            get
            {
                string sId = Request.QueryString["Id"];
                if (!string.IsNullOrEmpty(sId))
                {
                    return int.Parse(sId);
                }
                else
                {
                    return 0; // id of 0 is the same as "Other" box
                }
            }
        }

        /// <summary>
        /// Gets the Collection Id from the Query String (collection the current box is part of) 
        /// </summary>
        private int QueryCollectionId
        {
            get
            {
                string sId = Request.QueryString["ColId"];
                if (!string.IsNullOrEmpty(sId))
                {
                    return int.Parse(sId);
                }
                else
                {
                    return 0; //will never be the case, but just in case 
                }
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count == 0)
            {
                ContentPanel.Visible = false;
                return;
            }

            //if (QueryBoxId == 0)
            //{
            //    this.leftBoxSet.Style.Add("visibility", "hidden");
            //    this.leftBoxSet.Style.Add("display", "none");
            //    this.leftUnboxed.Style.Add("visibility", "visible");

            //    //ListUnboxedSpecimens(QueryCollectionId);
            //}

            CollectionId.Value = QueryCollectionId.ToString();

            if(!Page.IsPostBack) //first time in
            {
                this.boxNameLabel.InnerHtml = getQS("Name");
            }

            BindOriginSelectBoxes();

        }


        //private void ListUnboxedSpecimens(int colId)
        //{
        //    SpecimenManagerDa da = new SpecimenManagerDa();
        //    DataTable dt = da.GetUnboxedSpecimensByCollectionId(colId);
        //    this.unboxedSpecList.DataSource = dt.DefaultView;
        //    this.unboxedSpecList.DataBind();
        //}

        private void BindOriginSelectBoxes()
        {
            if (QueryBoxId > 0)
            {
                SpecimenManagerDa da = new SpecimenManagerDa();
                DataSet resultsDataSet = da.GetBoxAndAncestors(QueryBoxId);

                SpecimenBox box = new SpecimenBox();
                box.Get(QueryBoxId);

                DataTable boxesDT = resultsDataSet.Tables[0];
                Boxes.DataSource = boxesDT;
                Boxes.DataBind();
                Boxes.Value = box[SpecimenBox.BoxId].ToString();

                DataTable containersDT = resultsDataSet.Tables[1];
                Containers.DataSource = containersDT;
                Containers.DataBind();
                Containers.Value = boxesDT.Rows[0][SpecimenBox.ContainerId].ToString();

                DataTable storagesDT = resultsDataSet.Tables[2];
                Storages.DataSource = storagesDT;
                Storages.DataBind();
                Storages.Value = containersDT.Rows[0][SpecimenContainer.StorageId].ToString();
                
                string siteId = resultsDataSet.Tables[3].Rows[0][SpecimenSite.SiteId].ToString();
                Sites.Value = siteId;
            }
        }
    }
}
