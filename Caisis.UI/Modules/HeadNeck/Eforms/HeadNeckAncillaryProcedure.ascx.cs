namespace Caisis.UI.Modules.HeadNeck.Eforms
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    public partial class HeadNeckAncillaryProcedure : BaseEFormControl
    {
        protected string Surgeon = "";

        override protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") && Session[SessionKey.CurrentListCrit].ToString().Length > 0)
            {
                Surgeon = Session[SessionKey.CurrentListCrit].ToString();
            }
            if (Surgeon.Length > 0 )
            {
                if (Surgeon.IndexOf(",") > -1)
                {
                    Surgeon = Surgeon.Remove(Surgeon.IndexOf(","));
                }                
            }
        }
    }
}