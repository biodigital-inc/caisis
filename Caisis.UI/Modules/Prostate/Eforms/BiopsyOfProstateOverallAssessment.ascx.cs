namespace Caisis.UI.Modules.Prostate.Eforms
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
    public partial class BiopsyOfProstateOverallAssessment : BaseEFormControl
    {

        protected override void Page_Load(object sender, System.EventArgs e)
        {

            base.Page_Load(sender, e);

            if (Session[SessionKey.CurrentClinicDate] != null)
            {
                string s = Session[SessionKey.CurrentClinicDate].ToString();

                if ((!string.IsNullOrEmpty(s)) && string.IsNullOrEmpty(DxDateText.Value))
                {
                    DxDateText.Value = s;
                    DxDate.Value = DateTime.Parse(s).ToShortDateString();
                }
            }


        }

    }
}
