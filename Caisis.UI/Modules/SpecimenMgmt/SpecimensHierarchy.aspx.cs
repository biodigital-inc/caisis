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

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class SpecimensHierarchy : SpecimenMgmtBasePage
    {
        private int specimenId = 0;
        private string parentspecimenId = "";
        private string _identifierType = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
        Specimen specimen;
        SpecimenManagerDa da = new SpecimenManagerDa();

        protected override void Page_Load(object sender, EventArgs e)
        {
            specimenId = Convert.ToInt32(Request.QueryString["specimenId"]);
            //listspecimenId.Value = specimenId.ToString();

            parentspecimenId = (Request.QueryString["parentspecimenId"]);

           //get parent specimen
           specimen = new Specimen();
           specimen.Get(specimenId);

            if (!Page.IsPostBack)
            {
                LoadSpecimenInfo();
            }
        }

        private void LoadSpecimenInfo()
        { 
            //populating repeater
            DataTable dt = null;
            dt = da.GetParentsSiblingsAndSubsById(parentspecimenId, specimenId);

            rptSpecimens.DataSource = dt.DefaultView;
            rptSpecimens.DataBind();
        }

        //protected string FormatRowColor(string strrowspecimenid, string strrowparentspecimenid)
        //{
        //    int rowspecimenid = Int32.Parse(strrowspecimenid);

        //    if (specimenId == rowspecimenid)
        //    {
        //        return "style=background-color:#BB7F80";
        //    }
        //    else if (!string.IsNullOrEmpty(strrowparentspecimenid) && specimenId == Int32.Parse(strrowparentspecimenid))
        //    {
        //        //return "style=background-color:#dfedf9";
        //        return "style=background-color:#ffffff";
        //    }
        //    else
        //    {
        //        return "style=background-color:#ffffff";
        //    }
        //}
        
        protected void RowIcon(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //HtmlTableRow rptRow = (HtmlTableRow)e.Item.FindControl("specimenRow");
                HtmlImage icon = (HtmlImage)e.Item.FindControl("spaceicon");
                HiddenField specid = (HiddenField)e.Item.FindControl("RowSpecimenId");
                HiddenField parspecid = (HiddenField)e.Item.FindControl("RowParentSpecimenId");
                string strRowSpecimenId = specid.Value;
                string strRowParentSpecimenId = parspecid.Value;

                int rowspecimenId = Int32.Parse(strRowSpecimenId.ToString());
                if (specimenId == rowspecimenId)        //for active/selected specimen from previous list of specimens
                {
                    if (!string.IsNullOrEmpty(strRowParentSpecimenId))
                    {
                        //icon.Src = "~/Images/icon_Categories.gif";
                        icon.Src = "Images/Icon_SubSpecimen.gif";
                        icon.Style.Add(HtmlTextWriterStyle.PaddingLeft, "15px");
                    }
                    else
                    {
                        icon.Src = "Images/Icon_Specimen.gif";
                    }
                     
                }
                else if (!string.IsNullOrEmpty(strRowParentSpecimenId) && specimenId == Int32.Parse(strRowParentSpecimenId.ToString()))
                {
                    icon.Src = "Images/Icon_SubSpecimen.gif";
                    icon.Style.Add(HtmlTextWriterStyle.PaddingLeft, "30px"); //for sub-specimens
                }
                else if (parentspecimenId == strRowParentSpecimenId)
                {
                    //icon.Src = "~/Images/LoginBullet.gif";
                    icon.Src = "Images/Icon_SubSpecimen.gif";
                    icon.Style.Add(HtmlTextWriterStyle.PaddingLeft, "15px"); //for siblings
                }
                else
                {
                    icon.Src = "Images/Icon_Specimen.gif"; //for hierarchy of parent specimens
                }
            }
        }    
    }
}
