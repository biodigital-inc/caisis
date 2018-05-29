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
using Caisis.BOL;

public partial class CoversheetFaxNeedMD_Contact : BaseLongitudinalControl
{
    protected override void Page_Load(object sender, EventArgs e)
    {
        logo.Src = Page.ResolveUrl("../../../Images/FormImages/"+CaisisConfiguration.GetWebConfigValue("institutionShortName") + "_FormLogo.gif");
    }
}
