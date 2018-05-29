namespace Caisis.UI.Modules.All.Eforms
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
    ///		Summary description for PatientsDemographics.
	/// </summary>
    public partial class PatientsDemographics : BaseEFormControl
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

                PtDemoGx2.DataSource = ptDemoGxDs.Tables[0].DefaultView;
                PtDemoGx2.DataBind();

                PtDemoGx3.DataSource = ptDemoGxDs.Tables[0].DefaultView;
                PtDemoGx3.DataBind();
            }

        }

        private String GetAge(DateTime bdObj)
        {
            // get the difference in years
            int years = DateTime.Now.Year - bdObj.Year;

            //// subtract another year if we're before the
            //// birth day in the current year
            if (DateTime.Now.Month < bdObj.Month || (DateTime.Now.Month == bdObj.Month && DateTime.Now.Day < bdObj.Day))
                years--;

            return years.ToString();
        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {
                if (((DataRowView)e.Item.DataItem)[Patient.PtBirthDateText].ToString().Length > 0)
                {

                    string ptBirthDateString = (e.Item.DataItem as DataRowView)[Patient.PtBirthDateText].ToString();
                    DateTime ptBirthDate;
                    if (DateTime.TryParse(ptBirthDateString, out ptBirthDate))
                    {
                        Age.Text = GetAge(ptBirthDate);
                    }
                }
                else
                    Age.Text = "Not Specified";
            }
        }
	}
}
