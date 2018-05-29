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
    ///		Summary description for PatientsDemographicsBasicDisplayOnly.
    /// </summary>
    public partial class PatientsDemographicsBasicDisplayOnly : BaseEFormControl
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
            ptDemoGxDs = ptDemoDa.FormGetPatientsIdentification(PatientID, FormName, FormType);

            if (ptDemoGxDs.Tables.Count > 0 && ptDemoGxDs.Tables[0].Rows.Count > 0)
            {
                PtDemoGx.DataSource = ptDemoGxDs.Tables[0].DefaultView;
                PtDemoGx.DataBind();

                PtDemoGx2.DataSource = ptDemoGxDs.Tables[0].DefaultView;
                PtDemoGx2.DataBind();

            }

        }


        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {
                //if (((DataRowView)e.Item.DataItem)[Patient.PtMRN].ToString().Length > 0)
                //{
                //    PtMRN.Value = ((DataRowView)e.Item.DataItem)[Patient.PtMRN].ToString();
                //}
                //if (((DataRowView)e.Item.DataItem)[Patient.PtTitle].ToString().Length > 0)
                //{
                //    PtTitle.Text = ((DataRowView)e.Item.DataItem)[Patient.PtTitle].ToString();
                //}
                if (((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString().Length > 0)
                {
                    PtFirstName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString();
                }
                else
                    PtFirstName.Text = "Not Specified";

                if (((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString().Length > 0)
                {
                    PtLastName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString();
                }
                else
                    PtLastName.Text = "Not Specified";

                //if (((DataRowView)e.Item.DataItem)[Patient.PtMiddleName].ToString().Length > 0)
                //{
                //    PtMiddleName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtMiddleName].ToString();
                //}
                //if (((DataRowView)e.Item.DataItem)[Patient.PtSuffix].ToString().Length > 0)
                //{
                //    PtSuffix.Text = ((DataRowView)e.Item.DataItem)[Patient.PtSuffix].ToString();
                //}
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
                if (((DataRowView)e.Item.DataItem)[Patient.PtGender].ToString().Length > 0)
                {
                    PtGender.Text = ((DataRowView)e.Item.DataItem)[Patient.PtGender].ToString();
                }
                else
                    PtGender.Text = "Not Specified";
                //if (((DataRowView)e.Item.DataItem)[Patient.PtAddress1].ToString().Length > 0)
                //{
                //    PtAddress1.Text = ((DataRowView)e.Item.DataItem)[Patient.PtAddress1].ToString();
                //}
                //if (((DataRowView)e.Item.DataItem)[Patient.PtAddress2].ToString().Length > 0)
                //{
                //    PtAddress2.Text = ((DataRowView)e.Item.DataItem)[Patient.PtAddress2].ToString();
                //}
                //if (((DataRowView)e.Item.DataItem)[Patient.PtCity].ToString().Length > 0)
                //{
                //    PtCity.Text = ((DataRowView)e.Item.DataItem)[Patient.PtCity].ToString();
                //}
                //if (((DataRowView)e.Item.DataItem)[Patient.PtState].ToString().Length > 0)
                //{
                //    PtState.Text = ((DataRowView)e.Item.DataItem)[Patient.PtState].ToString();
                //}
                //if (((DataRowView)e.Item.DataItem)[Patient.PtPostalCode].ToString().Length > 0)
                //{
                //    PtPostalCode.Text = ((DataRowView)e.Item.DataItem)[Patient.PtPostalCode].ToString();
                //}
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
    }
}
