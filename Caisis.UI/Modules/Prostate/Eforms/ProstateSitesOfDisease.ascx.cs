namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;


	/// <summary>
    ///		Summary description for ProstateSitesOfDisease.
	/// </summary>
    public partial class ProstateSitesOfDisease : BaseEFormControl
	{




		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            GetProstateSitesOfDisease();
		}

        protected virtual void GetProstateSitesOfDisease()
        {
                SurveyDa sDa = new SurveyDa();
                DataSet sDs = sDa.FormGetRecentSurveyByType(this._patientId, this._eformName, "Dynamic", "Prostate Sites of Disease");


                if (sDs.Tables.Count > 1 && sDs.Tables[1].Rows.Count > 0)
                {
                    // Bone
                    CheckSiteOfDisease(sDs.Tables[1], "Bone", BonePresent, BoneAbsent);
//                    CheckSiteOfDisease(sDs.Tables[1], "Soft Tissue", SoftTissue_Present, SoftTissue_Absent);
                    CheckSiteOfDisease(sDs.Tables[1], "Lymph Nodes", LymphNodesPresent, LymphNodesAbsent);
                    CheckSiteOfDisease(sDs.Tables[1], "Lung", LungPresent, LungAbsent);
                    CheckSiteOfDisease(sDs.Tables[1], "Liver", LiverPresent, LiverAbsent);
                    CheckSiteOfDisease(sDs.Tables[1], "Local Disease", LocalDiseasePresent, LocalDiseaseAbsent);
                }

        }

        protected virtual void CheckSiteOfDisease(DataTable SurveyItemTable, string Site, EformRadioButton PresentRadio, EformRadioButton AbsentRadio)
        {
            if (!PresentRadio.Checked && !AbsentRadio.Checked)
            {
                for (int i = 0; i < SurveyItemTable.Rows.Count; i++)
                {
                    if (SurveyItemTable.Rows[i]["SurveyItem"].ToString().ToUpper().Equals(Site.ToUpper()))
                    {
                        if (SurveyItemTable.Rows[i]["SurveyItemResult"].ToString().ToUpper().Equals("PRESENT"))
                        {
                            PresentRadio.Checked = true;
                            SurveyType_1.Disabled = false;
                            SurveyDate_1.Disabled = false;
                            SurveyDateText_1.Disabled = false;
                        }
                        else if (AbsentRadio != null && SurveyItemTable.Rows[i]["SurveyItemResult"].ToString().ToUpper().Equals("ABSENT"))
                        {
                            AbsentRadio.Checked = true;
                            SurveyType_1.Disabled = false;
                            SurveyDate_1.Disabled = false;
                            SurveyDateText_1.Disabled = false;
                        }
                    }
                }
            }
        }



	}
}
