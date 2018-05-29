namespace Caisis.UI.Modules.Bladder.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	using Caisis.DataAccess;

	/// <summary>
	///		Summary description for ChiefComplaint.
	/// </summary>
    public partial class BreastProcedure : BaseEFormControl
	{
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
/*
            if (Session[SessionKey.CurrentClinicDate] != null)
            {
                string s = Session[SessionKey.CurrentClinicDate].ToString();

                if ((!string.IsNullOrEmpty(s)) && string.IsNullOrEmpty(OpDateText_1.Value))
                {
                    OpDateText_1.Value = s;
                    OpDate_1.Value = DateTime.Parse(s).ToShortDateString();
                }
            }
*/
            string Surgeon = "";
            if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") && Session[SessionKey.CurrentListCrit].ToString().Length > 0)
            {
                Surgeon = Session[SessionKey.CurrentListCrit].ToString();
            }
            if (Surgeon.Length > 0 && string.IsNullOrEmpty(OpCaseSurgeon_1.Value))
            {
                if (Surgeon.IndexOf(",") > -1)
                {
                    Surgeon = Surgeon.Remove(Surgeon.IndexOf(","));
                }
                OpCaseSurgeon_1.Value = Surgeon;
            }


            foreach (ListItem BreastProcli in ProcName_Breast.Items)
            {
                string BreastProcstr = "showHideBreastProc('" + BreastProcli.Value + "','" + AbsentDateText_1.ClientID + "','" + AbsentDate_1.ClientID + "','" + TableName_1.ClientID + "', 'Procedures','" + FieldName_1.ClientID + "', 'ProcName','" + FieldValue_1.ClientID + "', 'Breast Procedure','" + AbsentReason_1.ClientID + "', 'Not Performed','" + AbsentQuality_1.ClientID + "', 'STD');";

                BreastProcli.Attributes.Add("onclick", BreastProcstr);

                if (BreastProcli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "BreastProcjScript", BreastProcstr, true);
                }
            }
            
        }
	

	}
}
