namespace Caisis.UI.Modules.Prostate.PaperForms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroBladCystFU.
	/// </summary>
    public partial class UroSurveyPostTxKidney : BasePaperFormControl
	{

        private BasePaperFormControl AuthFormControl = null;
        private BasePaperFormControl SurveyFormControl = null;

		override protected void SetFormInfo()  
		{
            this._formName = "UroSurveyPostTxKidney";
			this._formTitle = "Urology Kidney Post-Treatment Questionnaire";

		}

        override protected void Page_Load(object sender, EventArgs e)
        {

            base.Page_Load(sender, e);

//            LoadAuthForm();
//            LoadSurveyForm();
        }


		override protected void OnInit(System.EventArgs e)
		{
			IsOnePageForm = true;

			if (this.Parent.Parent.GetType().ToString().IndexOf("HtmlGenericControl") < 0)
			{
				IsEmbeddedForm = true;
			}

			base.OnInit(e);
		}



        protected void LoadAuthForm()
        {
            if (null != AuthFormHolder)
            {
                AuthFormControl = (Caisis.UI.Core.Classes.BasePaperFormControl)this.LoadControl("../../All/PaperForms/UroSurveyAuth.ascx");

                AuthFormControl.BatchPatientId = this._batchPatientId;
                AuthFormControl.FormInPatientId = this._formInPatientId;
                AuthFormControl.FormAppointmentId = this._formAppointmentId;

                AuthFormHolder.Controls.Add(AuthFormControl);
            }
        }


        protected void LoadSurveyForm()
        {
            if (null != SurveyFormHolder)
            {
                SurveyFormControl = (Caisis.UI.Core.Classes.BasePaperFormControl)this.LoadControl("UroSurveyProstateQOL.ascx");


                SurveyFormControl.BatchPatientId = this._batchPatientId;
                SurveyFormControl.FormInPatientId = this._formInPatientId;
                SurveyFormControl.FormAppointmentId = this._formAppointmentId;

                SurveyFormHolder.Controls.Add(SurveyFormControl);
            }
        }



	}
}
