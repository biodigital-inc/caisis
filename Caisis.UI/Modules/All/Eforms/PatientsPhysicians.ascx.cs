namespace Caisis.UI.Modules.All.Eforms
{
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;
    using System.Data.SqlClient;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.DataAccess;
    using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for PatientsPhysicians.
	/// </summary>
    public partial class PatientsPhysicians : BaseEFormControl
	{
		override protected void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            base.BuildPatientPhysicians(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
            SetPatientIdsPhysicianNames();
            
             //store the required field for saving and re-loading current eform section when the 'Add Physician' btn is clicked
            if (Request.QueryString["eformId"] != null && Request.QueryString["eformId"].Length > 0)
            {
                HiddenEformID.Text = Request.QueryString["eformId"];

                string sql = "SELECT * FROM Eforms ";
                sql += "WHERE Eforms.EformId = @EformId ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "EformId", int.Parse(HiddenEformID.Text));
                DataSet eformDs = DataAccessHelper.GetList(com);

               if (eformDs.Tables[0].Rows[0]["EformName"].ToString().Length > 0)
                {
                    HiddenEformName.Text = eformDs.Tables[0].Rows[0]["EformName"].ToString();
                }

            }

            if (Request.QueryString["sectionName"] != null && Request.QueryString["sectionName"].Length > 0)
            {
                HiddenSectionName.Text = Request.QueryString["sectionName"];
            }
        }

        private void SetPatientIdsPhysicianNames()
        {

            PhysicianId_1.Attributes.Add("OnBlur", "setPatientIdPhysicianNameFields(" + PatientId_1.ClientID + "," + this._patientId.ToString() + ", " + PhysicianId_1.ClientID + "," + PhName_1.ClientID + ");");
            PhysicianId_2.Attributes.Add("OnBlur", "setPatientIdPhysicianNameFields(" + PatientId_2.ClientID + "," + this._patientId.ToString() + ", " + PhysicianId_2.ClientID + "," + PhName_2.ClientID + ");");
            PhysicianId_3.Attributes.Add("OnBlur", "setPatientIdPhysicianNameFields(" + PatientId_3.ClientID + "," + this._patientId.ToString() + ", " + PhysicianId_3.ClientID + "," + PhName_3.ClientID + ");");
            PhysicianId_4.Attributes.Add("OnBlur", "setPatientIdPhysicianNameFields(" + PatientId_4.ClientID + "," + this._patientId.ToString() + ", " + PhysicianId_4.ClientID + "," + PhName_4.ClientID + ");");
            PhysicianId_5.Attributes.Add("OnBlur", "setPatientIdPhysicianNameFields(" + PatientId_5.ClientID + "," + this._patientId.ToString() + ", " + PhysicianId_5.ClientID + "," + PhName_5.ClientID + ");");
            PhysicianId_6.Attributes.Add("OnBlur", "setPatientIdPhysicianNameFields(" + PatientId_6.ClientID + "," + this._patientId.ToString() + ", " + PhysicianId_6.ClientID + "," + PhName_6.ClientID + ");");
            PhysicianId_7.Attributes.Add("OnBlur", "setPatientIdPhysicianNameFields(" + PatientId_7.ClientID + "," + this._patientId.ToString() + ", " + PhysicianId_7.ClientID + "," + PhName_7.ClientID + ");");
            PhysicianId_8.Attributes.Add("OnBlur", "setPatientIdPhysicianNameFields(" + PatientId_8.ClientID + "," + this._patientId.ToString() + ", " + PhysicianId_8.ClientID + "," + PhName_8.ClientID + ");");
            PhysicianId_9.Attributes.Add("OnBlur", "setPatientIdPhysicianNameFields(" + PatientId_9.ClientID + "," + this._patientId.ToString() + ", " + PhysicianId_9.ClientID + "," + PhName_9.ClientID + ");");
            PhysicianId_10.Attributes.Add("OnBlur", "setPatientIdPhysicianNameFields(" + PatientId_10.ClientID + "," + this._patientId.ToString() + ", " + PhysicianId_10.ClientID + "," + PhName_10.ClientID + ");");

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            Literal ResultField;
            ResultField = (Literal)e.Item.FindControl("ResultField");

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {
                if (((DataRowView)e.Item.DataItem)[Physician.PhSpecialty].ToString().Length <= 0)
                {
                    ResultField.Text = "Not Specified";

                }
                else
                    ResultField.Text = ((DataRowView)e.Item.DataItem)[Physician.PhSpecialty].ToString();
            }
        }
    }
}
