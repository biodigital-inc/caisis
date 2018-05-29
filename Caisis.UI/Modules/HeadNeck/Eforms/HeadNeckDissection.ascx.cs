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

    public partial class HeadNeckDissection : BaseEFormControl
    {
        protected string sOpDate = string.Empty;
        protected string sOpDateShort = string.Empty;
        
        override protected void Page_Load(object sender, EventArgs e)
        {            
            bool blnNeckDissection = false;

            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            if (Session[SessionKey.CurrentClinicDate] != null)
            {
                sOpDate = Session[SessionKey.CurrentClinicDate].ToString();
                sOpDateShort = DateTime.Parse(sOpDate).ToShortDateString();
            }

            if (NeckDissecitonRecorded.Items.Count > 0)
            {
                for (int i = 0; i < NeckDissecitonRecorded.Items.Count; i++)
                {
                    if (NeckDissecitonRecorded.Items[i].Selected == true && NeckDissecitonRecorded.Items[i].Value == "Yes")
                    {
                        blnNeckDissection = true;
                        break;
                    }
                }
            }

            if (blnNeckDissection)
            {
                if ((!string.IsNullOrEmpty(sOpDate)) && string.IsNullOrEmpty(ProcDateText_17.Value))
                {
                    ProcDateText_17.Value = sOpDate;
                    ProcDate_17.Value = sOpDateShort; //DateTime.Parse(sOpDate).ToShortDateString();
                }
            }
            else
            {
                ProcDateText_17.Value = string.Empty;
                ProcDate_17.Value = string.Empty; 
            }

            //if (primSiteVal.Text == "Neck")
            //{
            //    if (!string.IsNullOrEmpty(primProcVal.Text))
            //    {
            //        ProcName_17.Value = primProcVal.Text;
            //    }
            //}
        }
    }

}