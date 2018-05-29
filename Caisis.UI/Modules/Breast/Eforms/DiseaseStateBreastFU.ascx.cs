namespace Caisis.UI.Modules.Breast.Eforms
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


    /// <summary>
    ///		Summary description for Cosmesis and DiseaseState for Breast eform.
    /// </summary>
    public partial class DiseaseStateBreastFU : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            LastStatus.Text = GetLastStatus(_patientId, _eformName, "Dynamic");
        }
    }
}
