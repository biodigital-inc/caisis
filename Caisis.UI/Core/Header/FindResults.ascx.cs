using System;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


using Caisis.BOL;
using Caisis.Security;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Header
{
    /// <summary>
    ///	Displays list of patients that match search last name or mrn and fall within working dataset.
    /// </summary>
    public partial class FindResults : HeaderControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }
    }
}
