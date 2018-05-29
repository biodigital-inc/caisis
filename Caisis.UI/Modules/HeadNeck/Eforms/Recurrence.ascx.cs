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
    ///		Summary description for Distant Metastasis.
    /// </summary>

    public partial class Recurrence : BaseEFormControl
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (Page.IsPostBack)
            {
                //if (!string.IsNullOrEmpty(StatusNotes_7.Value) && !StatusNotes_7.Value.Contains("Level"))
                //{
                //    StatusNotes_7.Value = "Level " + StatusNotes_7.Value;
                //}
            }
            else
            {
                foreach (ListItem item in StatusNotes_7.Items)
                {
                    if (item.Value == "")
                    {
                        item.Attributes.CssStyle.Add("display", "none");
                        item.Enabled = false;
                    }
                }
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.BuildStatus(this._patientId, "Thyroid Cancer");

            RandomChklistSelects(StatusNotes_7);

            SetStatusDetails();
        }

        protected void RandomChklistSelects(EformExtendedCheckBoxList statusNotes)
        {
            if (!Page.IsPostBack && !string.IsNullOrEmpty(statusNotes.Value))
            {
                string value = statusNotes.Value.Replace("Level ", "");
                string[] values = value.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                foreach (ListItem item in statusNotes.Items)
                {
                    for (int i = 0; i < values.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(item.Value))
                        {
                            if (values[i] == item.Value)
                            {
                                item.Selected = true;
                                break;
                            }
                            else
                            {
                                item.Selected = false;
                            }
                        }
                    }
                }
            }
        }

        protected void SetStatusDetails()
        {
            GetStatusDetails(Status_9,StatusDisease_9, StatusQuality_9);
            GetStatusDetails(Status_10, StatusDisease_10, StatusQuality_10);
            GetStatusDetails(Status_11, StatusDisease_11, StatusQuality_11);
            GetStatusDetails(Status_12, StatusDisease_12, StatusQuality_12);
            GetStatusDetails(Status_13, StatusDisease_13, StatusQuality_13);
            GetStatusDetails(Status_14, StatusDisease_14, StatusQuality_14);
        }

        protected void GetStatusDetails(EformComboBox statusCombo,EformTextBox statusdiseaseTxt, EformTextBox statusQltyTxt)
        {
            statusCombo.Attributes.Add("onblur", "updateRecurDetails('" + statusdiseaseTxt.ClientID + "','" + statusQltyTxt.ClientID + "');");
        }
    }
}
