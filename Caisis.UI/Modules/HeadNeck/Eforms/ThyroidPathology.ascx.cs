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
    ///		Summary description for Thyroid Pathology
    /// </summary>
    public partial class ThyroidPathology : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!string.IsNullOrEmpty(PathDateText.Value))
            {
                PathInstitution.Value = "Memorial Sloan Kettering Cancer Center";
                PathSite.Value = "Thyroid";
                PathQuality.Value = "STD";
            }

            SetTumorLocChk();

            if(string.IsNullOrEmpty(PathR_Lobe.Value))
            {
                PathR_Lobe.Value="No";
            }
            if (string.IsNullOrEmpty(PathL_Lobe.Value))
            {
                PathL_Lobe.Value = "No";
            }
            if (string.IsNullOrEmpty(PathIsthmus.Value))
            {
                PathIsthmus.Value = "No";
            }
        }

        protected void SetTumorLocChk()
        {
            GetTumorLocChk(PathLobe_Right, PathR_Lobe);
            GetTumorLocChk(PathLobe_Left, PathL_Lobe);
            GetTumorLocChk(PathLobe_Isthmus, PathIsthmus);
        }

        protected void GetTumorLocChk(EformCheckBox tumorChk, EformTextBox tumorLoc)
        {
            tumorChk.Attributes.Add("onclick", "tumorLocCheck(this,'" + tumorChk.Value + "','" + tumorLoc.ClientID + "');");
        }
    }
}