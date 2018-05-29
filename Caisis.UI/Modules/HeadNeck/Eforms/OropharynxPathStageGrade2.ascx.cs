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
    ///		Summary description for OropharynxPathStageGrade2.
	/// </summary>
    public partial class OropharynxPathStageGrade2 : BaseEFormControl
    {

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            SetHiddenFields(PathStageSystem_1, PathStageT_1, PathStageN_1, PathStageM_1, PathStageDisease_1);
            SetHiddenFields(PathStageSystem_2, PathStageT_2, PathStageN_2, PathStageM_2, PathStageDisease_2);
            SetHiddenFields(PathStageSystem_3, PathStageT_3, PathStageN_3, PathStageM_3, PathStageDisease_3);
            SetHiddenFields(PathStageSystem_4, PathStageT_4, PathStageN_4, PathStageM_4, PathStageDisease_4);
            SetHiddenFields(PathStageSystem_5, PathStageT_5, PathStageN_5, PathStageM_5, PathStageDisease_5);
            SetHiddenFields(PathStageSystem_6, PathStageT_6, PathStageN_6, PathStageM_6, PathStageDisease_6);
            SetHiddenFields(PathStageSystem_7, PathStageT_7, PathStageN_7, PathStageM_7, PathStageDisease_7);
            SetHiddenFields(PathStageSystem_8, PathStageT_8, PathStageN_8, PathStageM_8, PathStageDisease_8);
            SetHiddenFields(PathStageSystem_9, PathStageT_9, PathStageN_9, PathStageM_9, PathStageDisease_9);
            SetHiddenFields(PathStageSystem_10, PathStageT_10, PathStageN_10, PathStageM_10, PathStageDisease_10);
       }

        private void SetHiddenFields(EformComboBox stageSystem, EformComboBox stageT, EformComboBox stageN, EformComboBox stageM, EformHidden disease)
        {
            stageSystem.Attributes.Add("OnBlur", "setPathStageHiddenFields(" + stageT.ClientID + "," + stageN.ClientID + ", " + stageM.ClientID +
                                                  "," + disease.ClientID + ", " + stageSystem.ClientID + ");");

            stageT.Attributes.Add("OnBlur", "setPathStageHiddenFields(" + stageT.ClientID + "," + stageN.ClientID + ", " + stageM.ClientID +
                                                                          "," + disease.ClientID + ", " + stageSystem.ClientID + ");");

            stageN.Attributes.Add("OnBlur", "setPathStageHiddenFields(" + stageT.ClientID + "," + stageN.ClientID + ", " + stageM.ClientID +
                                                                          "," + disease.ClientID + ", " + stageSystem.ClientID + ");");
            stageM.Attributes.Add("OnBlur", "setPathStageHiddenFields(" + stageT.ClientID + "," + stageN.ClientID + ", " + stageM.ClientID +
                                                                          "," + disease.ClientID + ", " + stageSystem.ClientID + ");");

        }
    }
}