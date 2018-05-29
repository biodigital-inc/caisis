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
    /// <summary>
    /// SpecimenDetails displays specimens hierarchy 
    /// and allows updating Parent Specimen & Sub-Specimens
    /// and Processing Events
    /// </summary>

    public partial class SpecimenDetails : SpecimenMgmtBasePage
    {
        private int specimenId=0;
        private string parentspecimenId="" ;
        private string _identifierType = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
        Specimen specimen;
        SpecimenManagerDa da = new SpecimenManagerDa();

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            specimenId = Convert.ToInt32(Request.QueryString["specimenId"]);
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
            //getting patient identifier
            PtId.Text = _identifierType + " :";
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataTable identifiersdt = da.GetIdentifier(specimenId, _identifierType, datasetSql);
            string identifier = identifiersdt.Rows[0].ItemArray[2].ToString();
            this.pagetitle.Text = identifier.ToString();            

            //loading frames
            this.SpecimensRptFrame.Attributes["src"] = "SpecimensHierarchy.aspx?specimenId=" + specimenId + "&parentspecimenId=" + parentspecimenId;
            this.SpecimenDataFrame.Attributes["src"] = "EditSpecimenDetails.aspx?specimenId=" + specimenId;
            this.processingevntsframe.Attributes["src"] = "AddSpecimenEvents.aspx?specimenId=" + specimenId;
        }
        
        //protected void gotoSpecimenslist(object sender, CommandEventArgs e)
        //{
        //    Response.Redirect("SpecimenQueryResults.aspx?viewall=false");
        //}
    }
}
