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

    public partial class HeadNeckPrimaryProcedure : BaseEFormControl
    {
        protected string Surgeon = "";

        protected override void Page_Load(object sender, System.EventArgs e)
        {            
            ProcInstitution_1.Value = CaisisConfiguration.GetWebConfigValue("institutionShortName"); 
            base.Page_Load(sender, e);

            string SurgeryDate = "";
            if (Session[SessionKey.CurrentClinicDate] != null) SurgeryDate = Session[SessionKey.CurrentClinicDate].ToString();
            if (SurgeryDate.Length > 0)
            {
                SetHiddenDateFieldPair(ProcDateText_1, ProcDate_1, SurgeryDate);
            }
            
            ////string Surgeon = "";
            //if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") && Session[SessionKey.CurrentListCrit].ToString().Length > 0)
            //{
            //    Surgeon = Session[SessionKey.CurrentListCrit].ToString();
            //}
            //if (Surgeon.Length > 0 && string.IsNullOrEmpty(ProcSurgeon_1.Value))
            //{
            //    if (Surgeon.IndexOf(",") > -1)
            //    {
            //        Surgeon = Surgeon.Remove(Surgeon.IndexOf(","));
            //    }
            //    ProcSurgeon_1.Value = Surgeon;
            //}

        }

        //protected override void OnPreRender(EventArgs e)
        //{
        //    Control ndr = PageUtil.DeepFindControl(this.Page, "NeckDissecitonRecorded");
        //   ICaisisInputControl contr = PageUtil.DeepFindICaisisInputControl(this.Page, "NeckDissecitonRecorded");
        //    base.OnPreRender(e);
        //}
    }
}