namespace Caisis.UI.Modules.GI.Eforms
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
    ///		Summary description for PancreasSurgeryDemographics.
	/// </summary>
    public partial class PancreasSurgeryDemographics : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildPatientDemographics(this._patientId, this._eformName, "Dynamic");
            RetrieveSSN(this._patientId, this._eformName, "Dynamic");
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

        private void RetrieveSSN(int PatientID, string FormName, string FormType)
        {
            DataTable ptSSNDt;
            IdentifierDa identifierDa = new IdentifierDa();
            ptSSNDt = identifierDa.GetPatientIdentifierTableByIdType(PatientID, "Social Security Number");

            if (ptSSNDt.Rows.Count > 0)
            {
                rowHasHx1.DataSource = ptSSNDt.DefaultView;
                rowHasHx1.DataBind();

            }
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
                        Age.Text = base.GetPatientAge(ptBirthDate);
                    }
                }
                else
                    Age.Text = "Birth date not specified";
            }


        }

        protected void EFormRepeaterOnDataBound2(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {
                rowNoHx1.Visible = false;
            }
        }

	}
}
