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

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.Security;

using Caisis.UI.ClientScript.Ajax;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class ProtocolPatientTitleBar : ProtocolMgmtBaseControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            PopulateProtocolInfo();
            PopulatePatientInfo();
        }

        /// <summary>
        /// Populates the protocol title
        /// </summary>
        private void PopulateProtocolInfo()
        {
            if (PatientPage != null)
            {
                if (!string.IsNullOrEmpty(PatientPage.BaseProtocolId))
                {
                    int protocolId = int.Parse(PatientPage.BaseProtocolId);
                    Protocol biz = new Protocol();
                    biz.Get(protocolId);

                    ProtocolTitle.Text = biz[Protocol.ProtocolNum].ToString();
                }
            }
        }

        /// <summary>
        /// Populates the header with Patient Name, visits, etc...
        /// </summary>
        private void PopulatePatientInfo()
        {
            if (PatientPage != null)
            {
                // set patient text, based on base page logic (account for permissions)
                PatientName.Text = PatientPage.PatientLabel;
                StudyIdField.Text = PatientPage.PatientStudyId;
                // set start date
                if (!string.IsNullOrEmpty(PatientPage.PatientProtocolId))
                {
                    int patientProtocolId = int.Parse(PatientPage.PatientProtocolId);
                    // set start date based on "On Study" status
                    PatientProtocolStatus onStudyStatus = BusinessObject.GetByFields<PatientProtocolStatus>(new Dictionary<string, object> { { PatientProtocol.PatientProtocolId, patientProtocolId }, { PatientProtocolStatus.PtProtocolStatus, "On Study" } }).FirstOrDefault();
                    if (onStudyStatus != null && !onStudyStatus.IsNull(PatientProtocolStatus.PtProtocolStatusDate))
                    {
                        PatientStartDate.Text = ((DateTime)(onStudyStatus[PatientProtocolStatus.PtProtocolStatusDate])).ToShortDateString();
                    }
                }
            }
        }

        /// <summary>
        /// Update Patient's Study Id and/or warn if already exits.
        /// </summary>
        /// <param name="e"></param>
        protected void UpdateStudyId(CaisisAjaxEventArgs e)
        {
            string newStudyId = e.ClientParam;
            if (PatientPage != null && !string.IsNullOrEmpty(newStudyId) && !string.IsNullOrEmpty(PatientPage.PatientProtocolId))
            {
                // ok to update when study id doesn't exits
                if (!ProtocolMgmtDa.StudyIdExists(newStudyId, int.Parse(PatientPage.BaseProtocolId)))
                {
                    int ptProtocolId = int.Parse(PatientPage.PatientProtocolId);
                    PatientProtocol biz = new PatientProtocol();
                    biz.Get(ptProtocolId);
                    biz[PatientProtocol.PtProtocolStudyId] = newStudyId;
                    biz.Save();

                    // CREATE STUDY ID IDENTIFIER
                    PatientProtocolController.CreateStudyIdIdentifier(biz);

                    // echo back value to client
                    e.ReturnValue = newStudyId;
                }
                // otherwise exists, and warn
                else
                {
                    // echo back to client study id exits
                    e.ReturnValue = "The StudyId entered already exits in the system.";
                }
            }
            else
            {
                // echo to client there were issues
                e.ReturnValue = "Please Enter a valid StudyId.";
            }
        }
    }
}
