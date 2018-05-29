namespace Caisis.UI.Modules.Gynecology.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

    using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for GTDSocialHistory.
	/// </summary>
    public partial class GTDSocialHistory : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);
            GetGynSocHx();
        }

        protected void GetGynSocHx()
        {
            DataView view = BusinessObject.GetByParentAsDataView<SocialHistory>(_patientId);
            if (view.Count > 0)
            {
                NoSocialHxMsgTr.Visible = false;
                SocialHxMsgTr.Visible = true;
                SocialHxEditTr.Visible = true;

//                SetLabel(ExistingSoxHxMenopauseStatus, view[0][BOL.SocialHistory.SocHxMenopauseStatus].ToString());
                SetLabel(ExistingSocHxMenarcheAge, view[0][BOL.SocialHistory.SocHxMenarcheAge].ToString());
                SetLabel(ExistingSocHxMenopauseAge, view[0][BOL.SocialHistory.SocHxMenopauseAge].ToString());
                SetLabel(ExistingSocHxGravida, view[0][BOL.SocialHistory.SocHxGravida].ToString());
                SetLabel(ExistingSocHxParity, view[0][BOL.SocialHistory.SocHxParity].ToString());
                SetLabel(ExistingSocHxFirstBirthAge, view[0][BOL.SocialHistory.SocHxFirstBirthAge].ToString());
                SetLabel(ExistingSocHxNotes, view[0][BOL.SocialHistory.SocHxNotes].ToString());

//                EditSocHxBtn.Attributes.Add("onclick", "LoadDataEntryForm('SocialHistories', " + view[0][BOL.SocialHistory.PatientId].ToString() + ", 'SocHxMenopauseStatus,SocHxMenarcheAge,SocHxMenopauseAge,SocHxGravida,SocHxParity,SocHxFirstBirthAge', 'GTDSocialHistory');");
                EditSocHxBtn2.Attributes.Add("onclick", "LoadDataEntryForm('SocialHistories', " + view[0][BOL.SocialHistory.PatientId].ToString() + ", 'SocHxMenopauseStatus,SocHxMenarcheAge,SocHxMenopauseAge,SocHxGravida,SocHxParity,SocHxFirstBirthAge,SocHxNotes', 'GTDSocialHistory');");

                
                HideInputs();
            }
            else
            {
                NoSocialHxMsgTr.Visible = true;
                SocialHxMsgTr.Visible = false;
                SocialHxEditTr.Visible = false;
            }
        }

        protected void SetLabel(Label label, string labelVal)
        {
            if (labelVal.Length > 0)
            {
                label.Text = labelVal;
            }
            else
            {
                label.Text = "---";
                label.CssClass = "noSocHistoryVal";
            }
        }

        protected void HideInputs()
        {
            //SocHxMenopauseStatus.Visible = false;
            SocHxMenarcheAge.Visible = false;
            SocHxMenopauseAge.Visible = false;
            SocHxGravida.Visible = false;
            SocHxParity.Visible = false;
            SocHxFirstBirthAge.Visible = false;
            SocHxNotes.Visible = false;
        }

 
	}
}
