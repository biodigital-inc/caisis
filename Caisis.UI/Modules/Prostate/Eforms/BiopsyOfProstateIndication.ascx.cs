namespace Caisis.UI.Modules.Prostate.Eforms
{
    using System;
    using System.Data;
    using System.Configuration;
    using System.Collections;
    using System.Web;
    using System.Web.Security;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.WebControls.WebParts;
    using System.Web.UI.HtmlControls;

    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;



    public partial class BiopsyOfProstateIndication : BaseEFormControl
    {
        protected override void Page_Load(object sender, System.EventArgs e)
        {

            base.Page_Load(sender, e);


            if (string.IsNullOrEmpty(ProcDateText.Value))
            {
                string s = (Session[SessionKey.CurrentClinicDate] != null && Session[SessionKey.CurrentClinicDate].ToString().Length > 0) ? Session[SessionKey.CurrentClinicDate].ToString() : DateTime.Now.ToShortDateString();
                ProcDateText.Value = s;
                DateTime pd = new DateTime();
                if (DateTime.TryParse(s, out pd)) ProcDate.Value = pd.ToShortDateString();
            }

            if (string.IsNullOrEmpty(ProcSurgeon.Value) 
                && Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") 
                && Session[SessionKey.CurrentListCrit] != null)
                ProcSurgeon.Value = Session[SessionKey.CurrentListCrit].ToString();

            ShowLastStatus();

        }


        protected void ShowLastStatus()
        {
            StatusDa sDa = new StatusDa();
            DataSet sDs = sDa.GetStatus(this._patientId, "Prostate Cancer");

            if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
            {
                DataView sDv = new DataView(sDs.Tables[0]);
                sDv.Sort = BOL.Status.StatusDate + " DESC";

                lastProstateStatus.Text = sDv[0][BOL.Status.Status_Field].ToString() + " on " + sDv[0][BOL.Status.StatusDateText].ToString();
                lastProstateStatusTable.Visible = true;
            }



        }
    }
}
