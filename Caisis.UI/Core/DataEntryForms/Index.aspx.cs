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
using System.Xml;

using Caisis.Security;
using Caisis.BOL;
using Caisis.UI.Core.Classes;

public partial class Core_PatientDataEntry_Index : FramePage
{
    override protected void Page_Load(object sender, System.EventArgs e)
    {
        base.Page_Load(sender, e); //base FramePage should handle 
    }
}
