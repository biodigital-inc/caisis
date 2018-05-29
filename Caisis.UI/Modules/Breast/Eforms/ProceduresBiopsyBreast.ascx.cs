namespace Caisis.UI.Modules.Breast.Eforms
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
    ///		Summary description for ProceduresBiopsyBreast.
	/// </summary>
    public partial class ProceduresBiopsyBreast : BaseEFormControl
    {

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);


            BuildSurgicalHistory(this._patientId, this._eformName, "Dynamic");

            foreach (ListItem BreastBxli in BxDone.Items)
            {
                string BreastBxstr = "showHideBreastBx('" + BreastBxli.Value + "','" + AbsentDateText_6.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_6.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + TableName_6.ClientID + "', 'Procedures','" + FieldName_6.ClientID + "', 'ProcName','" + FieldValue_6.ClientID + "', 'Breast Biopsy','" + AbsentReason_6.ClientID + "', 'Not Performed','" + AbsentQuality_6.ClientID + "', 'STD');";
                // this one defaults to Breast Biopsy: string ClickBreastBxstr = BreastBxstr + "setDefaultProcValues('" + BreastBxli.Value + "',$('" + ProcName_11.ClientID + "'),'Breast Biopsy',$('" + ProcSite_11.ClientID + "'),'Breast',$('" + ProcQuality_11.ClientID + "'))";
                string ClickBreastBxstr = BreastBxstr + "setDefaultProcValues('" + BreastBxli.Value + "',$('" + ProcName_11.ClientID + "'),'',$('" + ProcSite_11.ClientID + "'),'Breast',$('" + ProcQuality_11.ClientID + "'))";
                BreastBxli.Attributes.Add("onclick", ClickBreastBxstr);

                if (BreastBxli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "BreastBxjScript", BreastBxstr, true);
                }
            }

            foreach (ListItem AxillaBxli in AxillaBxDone.Items)
            {
                string AxillaBxstr = "showHideAxillaBx('" + AxillaBxli.Value + "','" + AbsentDateText_10.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + AbsentDate_10.ClientID + "','" + System.DateTime.Now.ToShortDateString() + "','" + TableName_10.ClientID + "', 'Procedures','" + FieldName_10.ClientID + "', 'ProcName','" + FieldValue_10.ClientID + "', 'Axilla Biopsy','" + AbsentReason_10.ClientID + "', 'Not Performed','" + AbsentQuality_10.ClientID + "', 'STD');";
                // this one defaulted to "Axilla Biopsy": string ClickAxillaBxstr = AxillaBxstr + "setDefaultProcValues('" + AxillaBxli.Value + "',$('" + ProcName_12.ClientID + "'),'Axilla Biopsy',$('" + ProcSite_12.ClientID + "'),'Axilla',$('" + ProcQuality_12.ClientID + "'))";
                string ClickAxillaBxstr = AxillaBxstr + "setDefaultProcValues('" + AxillaBxli.Value + "',$('" + ProcName_12.ClientID + "'),'',$('" + ProcSite_12.ClientID + "'),'Axilla',$('" + ProcQuality_12.ClientID + "'))";

                AxillaBxli.Attributes.Add("onclick", ClickAxillaBxstr);

                if (AxillaBxli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AxillaBxjScript", AxillaBxstr, true);
                }
            }

        }

        protected void BuildSurgicalHistory(int PatientID, string FormName, string FormType)
		{
            ProcedureDa procdedureDa = new ProcedureDa();
			DataSet ds;
            ds = procdedureDa.FormGetRecords(PatientID, FormName, FormType);

			if (ds.Tables[0].Rows.Count > 0)
			{
				rptSurgicalHistory.DataSource = ds.Tables[0].DefaultView;
				rptSurgicalHistory.DataBind();
			}

		}

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

        //    Literal ResultField;
        //    ResultField = (Literal)e.Item.FindControl("ResultField");

        //    if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
        //    {
        //        if (((DataRowView)e.Item.DataItem)[Procedure.ProcPrimary].ToString().Length > 0)
        //        {
        //            ResultField.Text = "Yes";

        //        }
        //        else                                        
        //            ResultField.Text = "No";

        //    }
        }

    }
}