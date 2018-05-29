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
    ///		Summary description for Death
    /// </summary>
    public partial class VitalStatus : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            //updating values from previous page
            if (!string.IsNullOrEmpty(StatusNotes_7.Value) && string.IsNullOrEmpty(NeckRecurSide_1.Value))
            {
                NeckRecurLocSide.Value = "Level " + StatusNotes_7.Value;
            }
            else if (!string.IsNullOrEmpty(StatusNotes_7.Value) && !string.IsNullOrEmpty(NeckRecurSide_1.Value))
            {
                NeckRecurLocSide.Value = "Level " + StatusNotes_7.Value + ", " + NeckRecurSide_1.Value;
            }

            SetDischargeDate();
            SetDeathStatus();

            SetDefaultActionDate();           
        }

        protected void SetDeathStatus()
        {
            Patient ptObj = new Patient();
            ptObj.Get(this._patientId);

            //if (ptObj.DataSourceView.Table.Rows.Count >= 1)
			if (!ptObj.IsEmpty)
            {
                //DeathStatusRpt.DataSource = ptObj.DataSourceView;
				DeathStatusRpt.DataSource = new Patient[] { ptObj }.AsDataView();
                DeathStatusRpt.DataBind();
            }
            else
            {
                DeadHtmlRow.Visible = true;
            }
        }

        protected void SetDischargeDate()
        {
            DischargedfromPractice.Attributes.Add("onclick", "dischargeCheck(this, '" + ActionDateText_2.ClientID + "','" + ActionDate_2.ClientID + "');");
        }

        protected void SetDefaultActionDate()
        {
            if (string.IsNullOrEmpty(ActionDateText.Value))
            {
                ActionDateText.Value = System.DateTime.Now.ToShortDateString();
                ActionDate.Value = System.DateTime.Now.ToString();
                ActionItem.Value = "Data Entry Complete";

                AdditionalEntryNeeded.Attributes.Add("onclick", "additionalDataCheck(this, '" + ActionDateText.ClientID + "', '" + System.DateTime.Now.ToShortDateString() + "','" + ActionDate.ClientID + "', '" + System.DateTime.Now.ToString() + "','" + ActionItem.ClientID + "', 'Additional Entry Needed','Data Entry Complete');");
            }
        }
    }
}