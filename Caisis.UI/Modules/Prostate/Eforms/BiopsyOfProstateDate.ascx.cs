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



    public partial class BiopsyOfProstateDate : BaseEFormControl
    {
        protected override void Page_Load(object sender, System.EventArgs e)
        {
            
            base.Page_Load(sender, e);
            
            if (Session[SessionKey.CurrentClinicDate] != null)
            {
                string s = Session[SessionKey.CurrentClinicDate].ToString();

                if ((!string.IsNullOrEmpty(s)) && string.IsNullOrEmpty(EncDateText.Value))
                {
                    EncDateText.Value = s;
                    EncDate.Value = DateTime.Parse(s).ToShortDateString();
                }
            }
            
           
        }

    }
}
