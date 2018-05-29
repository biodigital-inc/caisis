namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using Caisis.UI.Core.Classes;
    using Caisis.BOL;
    using Caisis.DataAccess;
	/// <summary>
    ///		Summary description for ProstateSpecimenDemographics.
	/// </summary>
    public partial class ProstateSpecimenDemographics : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildPatientDemographics(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
        }

        private void BuildPatientDemographics(int PatientID, string FormName, string FormType)
        {
            DataSet ptDemoGxDs;
            PatientDa ptDemoDa = new PatientDa();
            ptDemoGxDs = ptDemoDa.FormGetPatientsIdentificationAll(PatientID, FormName, FormType);

            if (ptDemoGxDs.Tables.Count > 0 && ptDemoGxDs.Tables[0].Rows.Count > 0)
            {
                PtDemoGx.DataSource = ptDemoGxDs.Tables[0].DefaultView;
                PtDemoGx.DataBind();
            }
        }
	}
}
