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
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminTreatmentArms : ProtocolMgmtBaseAdminPage
    {
        /// <summary>
        /// ProtocolVersionId passed in query string
        /// </summary>
        protected string QuereyVersionId
        {
            get
            {
                return Request.QueryString["prvr"];
            }
        }

        /// <summary>
        /// Gets the protocol version number passed in query string
        /// </summary>
        protected string ProtocolVersionNumber
        {
            get
            {
                return Request.QueryString["prvrNum"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(QuereyVersionId))
            {
                 PopulateTreatmentArms();
            }
           // if not version supress interface
            else
            {
                this.form1.Visible = false;
            }
        }

        /// <summary>
        /// Build list of treatment arms.
        /// </summary>
        protected void PopulateTreatmentArms()
        {
            DataView TreatmentArmsView = GetTreatmentArms();
            TreatmentArmsView.Sort = ProtocolSchema.ProtocolSchemaId + " ASC";
            if (TreatmentArmsView.Count > 0)
            {
                noTreatmentArmsMsg.Visible = false;
            }
            else
            {
                noTreatmentArmsMsg.Visible = true;
            }
            ArmsListRptr.DataSource = TreatmentArmsView;
            ArmsListRptr.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private DataView GetTreatmentArms()
        {
            int versionId = int.Parse(QuereyVersionId);
            DataTable dtTreatmentArms = ProtocolMgmtDa.GetSchemasByProtocolVersion(versionId);
            return dtTreatmentArms.DefaultView;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteTreatment(object sender, CommandEventArgs e)
        {
            int schemaId = int.Parse(e.CommandArgument.ToString());
            //ProtocolSchema biz = new ProtocolSchema();
            //biz.Delete(schemaId);
            ProtocolMgmtDa.DeleteTreatmentArm(schemaId);
            PopulateTreatmentArms();
            // refresh when no arms available
            if (noTreatmentArmsMsg.Visible)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "refreshParent", "window.parent.location = window.parent.location", true);
            }
        }

        /// <summary>
        /// Sets the max accural text as well as determine if delete btn visible
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetAccuralLimitLabel(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                // set description
                Label armLabel = e.Item.FindControl("ArmDescription") as Label;
                string armDescription = DataBinder.Eval(e.Item.DataItem, ProtocolSchema.ProtocolArmDescription).ToString();
                // trim long descriptions, but show full description on tooltip
                armLabel.Text = Caisis.UI.Core.Classes.PageUtil.GetTrimmedDescription(armDescription, 80);
                // set tooltip to full label
                armLabel.ToolTip = armDescription;

                string schemaId = DataBinder.Eval(e.Item.DataItem, ProtocolSchema.ProtocolSchemaId).ToString();

                // set accural text
                string protocolArmMaxAccrual = DataBinder.Eval(e.Item.DataItem, ProtocolSchema.ProtocolArmMaxAccrual).ToString();
                int patientSchemaCount = int.Parse(DataBinder.Eval(e.Item.DataItem, "PatientSchemaCount").ToString());
                // normalize text
                string accuralText = string.Empty;
                bool hasMAX = !string.IsNullOrEmpty(protocolArmMaxAccrual);
                // if max exists
                if (hasMAX)
                {
                    accuralText = string.Format("{0} of {1} Accrued", patientSchemaCount, protocolArmMaxAccrual);
                }
                // otherwise just list patients
                else
                {
                    accuralText = string.Format("{0} Accrued", patientSchemaCount);
                }
                HyperLink accuralLimitLabel = e.Item.FindControl("AccuralLimitLabel") as HyperLink;
                accuralLimitLabel.Text = accuralText;
                // activate edit layer
                if (patientSchemaCount > 0)
                {
                    accuralLimitLabel.ToolTip = "Edit Treatment Arm Patients";
                    accuralLimitLabel.NavigateUrl = "#";
                    accuralLimitLabel.Attributes["onclick"] = "return editSchemaPatients(" + schemaId + ");";
                }

                // hide delete button when read-only (i.e, patients on schema)
                bool isReadOnly = patientSchemaCount > 0;
                if (isReadOnly)
                {
                    ImageButton deleteBtn = e.Item.FindControl("DeleteTreatmentArm") as ImageButton;
                    deleteBtn.Visible = false;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="SchemaId"></param>
        /// <returns></returns>
        protected string GetQueryStringBySchema(string SchemaId)
        {
            string strUrl = GetQueryString("AdminSchema.aspx", BaseProtocolId, SchemaId, BaseDecryptedPatientId, false) + "&prvr=" + QuereyVersionId;
            return strUrl;
        }
    }
}
