namespace Caisis.UI.Modules.Prostate.Eforms
{
    using System;
    using System.Data;
    using System.Configuration;
    using System.Collections;
    using System.Drawing;
    using System.Web;
    using System.Web.Security;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.WebControls.WebParts;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

   
    public partial class BiopsyOfProstateClinicalStageDRE : BaseEFormControl
    {



        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            if (Session[SessionKey.CurrentClinicDate] != null)
            {
                string s = Session[SessionKey.CurrentClinicDate].ToString();

                if ((!string.IsNullOrEmpty(s)) && string.IsNullOrEmpty(ClinStageDateText.Value))
                {
                    ClinStageDateText.Value = s;
                    ClinStageDate.Value = DateTime.Parse(s).ToShortDateString();
                }
            }

            BuildAllClinicalStages(this._patientId);
        }

        protected void BuildAllClinicalStages(int PatientID)
        {
            ClinicalStageDa clinicalstageDa = new ClinicalStageDa();
            DataTable clinicalstageDs = clinicalstageDa.FormGetRecords(PatientID);

            DataView dv = clinicalstageDs.DefaultView;
            dv.RowFilter = BOL.ClinicalStage.ClinStageDisease + "='Prostate'";

            if (dv.Count > 0)
            {
                clinicalstagesAll.DataSource = dv;
                clinicalstagesAll.DataBind();
            }
        }

       
        
        protected void DecorateClinicalStagesAll(object sender, RepeaterItemEventArgs e)
        {
            DataRowView rowView = (DataRowView)e.Item.DataItem;

            if (rowView != null)
            {
                HtmlImage LockImage;
                LockImage = (HtmlImage)e.Item.FindControl("LockImage");
                string clinicalstageId = rowView["ClinicalStageId"].ToString();

                if (LockImage != null)
                {
                    LockImage.Visible = false;
                }

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    if (rowView.DataView.Table.Columns.Contains("LockedBy"))
                    {
                        if (rowView["LockedBy"] != null && !string.IsNullOrEmpty(rowView["LockedBy"].ToString()))
                        {
                            if (LockImage != null)
                            {
                                LockImage.Visible = true;
                            }
                        }
                    }

                }

                // decorate tr
                HtmlTableRow tr = (HtmlTableRow)e.Item.FindControl("_tr_");

                tr.Attributes["onclick"] = "LoadDataEntryForm('ClinicalStages'," + clinicalstageId + ",'ClinStageSystem,ClinStageDateText,ClinStageT, ClinStageDisease, ClinStageNotes');";
               
            }
        }
        
        
    }
}