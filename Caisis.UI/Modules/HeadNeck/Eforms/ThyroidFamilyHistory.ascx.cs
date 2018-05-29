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
    ///		Summary description for Family History for Thyroid Cancer.
    /// </summary>

    public partial class ThyroidFamilyHistory : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            SetFamDxValues();
        }

        protected void SetFamDxValues()
        {
            FamDxValues(FamMemRelation_1, FamMemDiagnosis_1);
            FamDxValues(FamMemRelation_2, FamMemDiagnosis_2);
            FamDxValues(FamMemRelation_3, FamMemDiagnosis_3);
            FamDxValues(FamMemRelation_4, FamMemDiagnosis_4);
            FamDxValues(FamMemOther, FamMemDiagnosis_5);
        }

        protected void FamDxValues(EformCheckBox FamMemChk, EformTextBox FamMemDx)
        {
            FamMemChk.Attributes.Add("onclick", "FamMemCheck(this,'" + FamMemChk.Value + "', '" + FamMemDx.ClientID + "', 'Thyroid Cancer');");
        }
    }
}
