namespace Caisis.UI.Modules.HeadNeck.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.DataAccess;
    using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for OropharynxComorbidities.
    /// </summary >
    public partial class OropharynxComorbidities : BaseEFormControl
	{



		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            BuildGeneralComorbidities(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
		}

        protected void BuildGeneralComorbidities(int PatientID, string FormName, string FormType)
        {
            ComorbidityDa CombDa = new ComorbidityDa();

            DataSet ComorbiditiesDs = CombDa.FormGetRecords(PatientID, FormName, FormType);
            if (ComorbiditiesDs.Tables.Count > 0 && ComorbiditiesDs.Tables[0].Rows.Count > 0)
            {
                genComorbidities.DataSource = ComorbiditiesDs.Tables[0].DefaultView;
                genComorbidities.DataBind();
            }
        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {
                if (((DataRowView)e.Item.DataItem)[Comorbidity.Comorbidity_Field].ToString().Length > 0)
                {
                    string value = ((DataRowView)e.Item.DataItem)[Comorbidity.Comorbidity_Field].ToString();

                    if (value.ToUpper() == Comorbidity_MI.Value.ToUpper())
                    {
                        ComorbRow_1.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_COPD.Value.ToUpper())
                    {
                        ComorbRow_2.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_CHF.Value.ToUpper())
                    {
                        ComorbRow_3.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_PipticUlcer.Value.ToUpper())
                    {
                        ComorbRow_4.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_PeripheralVD.Value.ToUpper())
                    {
                        ComorbRow_5.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_MildLiverDisease.Value.ToUpper())
                    {
                        ComorbRow_6.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_ModerateToSevereLiverDisease.Value.ToUpper())
                    {
                        ComorbRow_7.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_CVA.Value.ToUpper())
                    {
                        ComorbRow_8.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_Diabetes.Value.ToUpper())
                    {
                        ComorbRow_9.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_Dementia.Value.ToUpper())
                    {
                        ComorbRow_10.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_CAD.Value.ToUpper())
                    {
                        ComorbRow_11.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_Hemiplegia.Value.ToUpper())
                    {
                        ComorbRow_12.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_Renaldis.Value.ToUpper())
                    {
                        ComorbRow_13.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_DMwithOrganDamage.Value.ToUpper())
                    {
                        ComorbRow_14.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_Leukemia.Value.ToUpper())
                    {
                        ComorbRow_15.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_Lymphoma.Value.ToUpper())
                    {
                        ComorbRow_16.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_MetastaticSolidTumor.Value.ToUpper())
                    {
                        ComorbRow_17.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_AIDS.Value.ToUpper())
                    {
                        ComorbRow_18.Visible = false;
                    }
                    if (value.ToUpper() == Comorbidity_Hypertension.Value.ToUpper())
                    {
                        ComorbRow_19.Visible = false;
                    }
                }
            }
        }
	}
}
