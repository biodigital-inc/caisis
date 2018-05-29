using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;
using System.Xml;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class ProtocolIndex : ProtocolMgmtBasePage
    {
        private static readonly string ALL_PATIENTS_STATUS_FILTER = "All Patients";

        /// <summary>
        /// A list of PatientProtocolStatuses which should be unchecked by default
        /// </summary>
        private static readonly string[] DEFAULT_UNCHECKED_STATUSES =
            new string[] 
            {
                PatientProtocolController.ScreeningFailed,
                PatientProtocolController.OffStudy,
                // special first item in status filter
                ALL_PATIENTS_STATUS_FILTER
            };

        private DataTable uniqueStatuses;
        private string[] defaultStatuses = new string[0];

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            this.EnableViewState = true;

            if (!Page.IsPostBack)
            {
                BuildUniqueStatuses();

                SetFramesSrc();
                SetPageTitle();
                SetBtnStates();

                // build arm filter
                BuildTreatmentArmFilter();
                // build status filter
                BuildStatusesFilter();

                // set specimens
                BtnSpecimens.Visible = EnableSpecimens(int.Parse(BaseProtocolId)) && UserSpecimenType.HasValue;
            }
        }

        private void BuildUniqueStatuses()
        {
            int protocolId = int.Parse(BaseProtocolId);
            string dataset = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            bool showIdentifiers = ShowPatientIdentifiers();
            bool includeDeceased = true;

            DataTable dt = ProtocolMgmtDa.GetLatestPatientProtocolStatuses(protocolId, dataset, showIdentifiers, includeDeceased);
            // get a total list for all statuses
            int patientCount = (from row in dt.AsEnumerable()
                                let count = (int)row["PatientCount"]
                                select count).Sum();
            // insert "All Patients" selection as first item
            DataRow dr = dt.NewRow();
            dr[PatientProtocolStatus.PtProtocolStatus] = ALL_PATIENTS_STATUS_FILTER;
            dr["PatientCount"] = patientCount;
            dt.Rows.InsertAt(dr, 0);

            // create a new column in which special exclusions will be unchecked
            DataColumn defaultCheckColumn = new DataColumn("DefaultCheck", typeof(int));
            // all values checked by default
            defaultCheckColumn.DefaultValue = 1;
            dt.Columns.Add(defaultCheckColumn);
            // find values to uncheck
            foreach (DataRow row in dt.Rows)
            {
                string status = row[PatientProtocolStatus.PtProtocolStatus].ToString();
                // if row status is in exclude list, supress
                if (DEFAULT_UNCHECKED_STATUSES.Contains(status))
                {
                    row[defaultCheckColumn] = 0;
                }
            }
            // set main status list
            uniqueStatuses = dt;
            // build default status qs only if there are more than 2 statuses (including all)
            if (uniqueStatuses.Rows.Count > 2)
            {
                // build a csv list of checked statuses
                defaultStatuses = (from row in uniqueStatuses.AsEnumerable()
                                   let isDefault = (int)row[defaultCheckColumn]
                                   where isDefault == 1
                                   let encodedStatus = Server.UrlEncode(row[PatientProtocolStatus.PtProtocolStatus].ToString())
                                   select encodedStatus).ToArray();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected void SetPageTitle()
        {
            ProtocolTitleLabel.Text = base.ProtocolTitle;
            ProtocolNumberLabel.Text = base.ProtocolNumber;
            if (base.ProtocolNumber.Length > 10) ProtocolNumberTd.Attributes["class"] = "ProtocolTitleBarBG_ProtNum_Smallest";
            else if (base.ProtocolNumber.Length > 7) ProtocolNumberTd.Attributes["class"] = "ProtocolTitleBarBG_ProtNum_Smaller";
        }

        /// <summary>
        /// 
        /// </summary>
        protected void SetBtnStates()
        {
            // show admin button for protocol admins
            if (base.UserType == ProtocolMgmtUsers.ProtocolAdmin)
            {
                BtnAdminOptions.Visible = true;
                BtnAdminOptions.HRef = GetQueryString("AdminProtocol.aspx");
            }

            // set patient registration buttons: display bulk entry when no versions exists
            bool displayBulkEdit = BusinessObject.Count<ProtocolVersion>(new Dictionary<string, object> { { ProtocolVersion.ProtocolId, BaseProtocolId } }) == 0;
            BtnAssignPatient.Visible = !displayBulkEdit;
            BtnAccrualDetails.Visible = displayBulkEdit;
        }

        /// <summary>
        /// Set default location for frames
        /// </summary>
        protected void SetFramesSrc()
        {
            ProtocolCalendarFrame.Attributes["src"] = GetQueryString("ProtocolPatientCalendar.aspx");
            // add optional list of default checkboxese
            // set QS
            string qsDefaultStatuses = string.Join(",", defaultStatuses);
            ProtocolListFrame.Attributes["src"] = GetQueryString("ProtocolPatientList.aspx") + "&statuses=" + qsDefaultStatuses;
        }

        /// <summary>
        /// Builds treatment arm filter
        /// </summary>
        protected void BuildTreatmentArmFilter()
        {
            // get list of treatment arms
            DataTable dtSchemas = ProtocolMgmtDa.GetSchemasByProtocol(int.Parse(BaseProtocolId));
            DataRow dr = dtSchemas.NewRow();

            // insert "All" selection as first item
            dr[ProtocolSchema.ProtocolArmDescription] = "All Patients";
            dr[ProtocolSchema.ProtocolSchemaId] = -1;
            dtSchemas.Rows.InsertAt(dr, 0);

            // no need to build filter
            // hide the treatment arm selector if there is only one arm, i.e., 0 or 1 items, plus 'All'
            if (dtSchemas.Rows.Count <= 2)
            {
                TreatmentArmSection.Visible = false;
            }
            else
            {
                TreatmentArmSection.Visible = true;
                // build arm filter
                TreatmentArms.DataSource = dtSchemas;
                TreatmentArms.DataBind();
            }
        }

        /// <summary>
        /// Builds filter of statuses
        /// </summary>
        private void BuildStatusesFilter()
        {
            // no need to build if no more than 2 status (including All item)
            //if (uniqueStatuses.Rows.Count <= 2)
            //{
            //    StatusFilterSection.Visible = false;
            //}
            //else

            // 6.x - include all statuses, including deceased
            {
                StatusFilterSection.Visible = true;

                StatusFilterRptr.DataSource = uniqueStatuses;
                StatusFilterRptr.DataBind();

                // set text, will always be more than 2
                StatusFilterDisplay.Text = "Showing " + defaultStatuses.Count() + " Statuses";
            }
        }

        private static bool EnableSpecimens(int protocolId)
        {
            // read config
            var xDoc = XmlUtil.GetModulesConfigXml();
            var protocolMatchNodes = xDoc.SelectNodes("//module[@name='Protocol Management']//EditSpecimens/Protocol");

            // get protocol
            DataView data = BusinessObject.GetByFieldsAsDataView<Protocol>(new Dictionary<string, object> { { Protocol.ProtocolId, protocolId } });
            if (data.Count > 0 && protocolMatchNodes.Count > 0)
            {
                // for each protocol config, check if current Protocol shows specimen
                foreach (XmlNode match in protocolMatchNodes)
                {
                    // restrict by protocol
                    string expr = match.Attributes["match"] != null ? match.Attributes["match"].Value : "";
                    if (!string.IsNullOrEmpty(expr))
                    {
                        data.RowFilter = expr;
                        return data.Count > 0;
                    }
                }
            }
            return false;
        }
    }
}
