namespace Caisis.UI.Modules.Bone.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
    using Caisis.Controller;
	using Caisis.UI.Core.Classes;
    using Caisis.BOL;
    using Caisis.DataAccess;
	/// <summary>
    ///		Summary description for PatientsDemographicsOsteo.
	/// </summary>
    public partial class PatientsDemographicsOsteo : BaseEFormControl
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
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {
                if (((DataRowView)e.Item.DataItem)[Patient.PtMRN].ToString().Length > 0)
                {

                    PatientController pc = new PatientController();
                    UserController uc = new UserController();
                    string defaultIdType = uc.GetDefaultIdentifierType();

                    // use the default identifier as the patient id for eform transform
                    if (!string.IsNullOrEmpty(defaultIdType) && defaultIdType != PatientController.LAST_NAME_MRN_IDENTIFIER)
                    {
                        string idValue = pc.GetPatientIdentifier(this._patientId, defaultIdType);
                        string idTitle = defaultIdType;

                        PtMRNTitle.Text = idTitle;

                        if (!string.IsNullOrEmpty(idValue))
                            PtMRN.Text = idValue;

                    }
                    // otherwise default to MRN
                    else
                    {
                        PtMRNTitle.Text = "MRN";
                        PtMRN.Text = ((DataRowView)e.Item.DataItem)[Patient.PtMRN].ToString();
                    }

                   
                }

                if (((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString().Length > 0)
                {
                    PtFirstName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString();
                }


                if (((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString().Length > 0)
                {
                    PtLastName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString();
                }


                if (((DataRowView)e.Item.DataItem)[Patient.PtMiddleName].ToString().Length > 0)
                {
                    PtMiddleName.Text = ((DataRowView)e.Item.DataItem)[Patient.PtMiddleName].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtGender].ToString().Length > 0)
                {
                    PtGender.Text = ((DataRowView)e.Item.DataItem)[Patient.PtGender].ToString();
                }

                if (((DataRowView)e.Item.DataItem)[Patient.PtAddress1].ToString().Length > 0)
                {
                    PtAddress1.Text = ((DataRowView)e.Item.DataItem)[Patient.PtAddress1].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtAddress2].ToString().Length > 0)
                {
                    PtAddress2.Text = ((DataRowView)e.Item.DataItem)[Patient.PtAddress2].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtCity].ToString().Length > 0)
                {
                    PtCity.Text = ((DataRowView)e.Item.DataItem)[Patient.PtCity].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtState].ToString().Length > 0)
                {
                    PtState.Text = ((DataRowView)e.Item.DataItem)[Patient.PtState].ToString();
                }
                if (((DataRowView)e.Item.DataItem)[Patient.PtPostalCode].ToString().Length > 0)
                {
                    PtPostalCode.Text = ((DataRowView)e.Item.DataItem)[Patient.PtPostalCode].ToString();
                }

                
                if (((DataRowView)e.Item.DataItem)[Patient.PtBirthDateText].ToString().Length > 0)
                {

                    PtBirthDateText.Text = (e.Item.DataItem as DataRowView)[Patient.PtBirthDateText].ToString();
                    string ptBirthDateString = PtBirthDateText.Text;
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


	}
}
