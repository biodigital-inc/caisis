using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Core.Utilities.Widget
{
    public partial class UserEformsWidget : BaseWidgetControl
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!Page.IsPostBack)
            {
                BuildRecentEforms();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void BuildRecentEforms()
        {
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            UserController uc = new UserController();
            EFormController ec = new EFormController();
            EFormsDa da = new EFormsDa();
            int userId = uc.GetUserId();
            System.Data.DataTable dt = da.GetUserRecentEforms(userId, datasetSql, null, null);

            if (dt.Rows.Count > 0)
            {
                UserEformsRpt.DataSource = dt;
                UserEformsRpt.DataBind();
                NoEformsMessage.Visible = false;
            }

        }


        protected override void SetRptIdentifiers(object sender, RepeaterItemEventArgs e)
        {
            base.SetRptIdentifiers(sender, e);

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Literal encPID = e.Item.FindControl("encPID") as Literal;
                string patientId = DataBinder.Eval(e.Item.DataItem, BOL.EForm.PatientId).ToString();
                string eformId = DataBinder.Eval(e.Item.DataItem, BOL.EForm.EFormId).ToString();
                string eformName = DataBinder.Eval(e.Item.DataItem, BOL.EForm.EFormName).ToString();
                string eformStatus = DataBinder.Eval(e.Item.DataItem, BOL.EForm.CurrentStatus).ToString();

                var kvp = new Dictionary<string, string>()
                {
                    { "epid", Security.CustomCryptoHelper.Encrypt(patientId) },
                    { "eformId", eformId },
                    { "status", eformStatus }
                };
                string eformPath = Page.ResolveUrl("~/Core/Eforms/Index.aspx?") + PageUtil.CreateUrlPairs(kvp);
                encPID.Text = eformPath;


                Image StatusImg = (Image)e.Item.FindControl("StatusImg") as Image;
                Literal EFormStatus = (Literal)e.Item.FindControl("EFormStatus");
                switch (eformStatus)
                {
                    case EformStatusManager.Status_DataEntryInProgress:
                        StatusImg.ImageUrl = "~/Images/EFormStatus_InProgress.gif";
                        break;
                    case EformStatusManager.Status_DataEntryComplete:
                        StatusImg.ImageUrl = "~/Images/EFormStatus_DataComplete.gif";
                        break;
                    case EformStatusManager.Status_Narrated:
                        StatusImg.ImageUrl = "~/Images/EFormStatus_DataReviewed.gif";
                        break;
                    case EformStatusManager.Status_Approved:
                        StatusImg.ImageUrl = "~/Images/EFormStatus_Approved.gif";
                        break;
                    default:
                        EFormStatus.Text = eformStatus;
                        StatusImg.Visible = false;
                        break;
                }


            }
        }
    }
}