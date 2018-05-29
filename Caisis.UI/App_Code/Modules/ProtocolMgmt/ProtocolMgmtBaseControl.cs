using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    /// <summary>
    /// Summary description for ProtocolMgmtBaseControl
    /// </summary>
    public class ProtocolMgmtBaseControl : BaseControl
    {
        /// <summary>
        /// Gets the ProtocolMgmtPatientBasePage in which in the control is loaded
        /// </summary>
        protected ProtocolMgmtPatientBasePage PatientPage
        {
            get
            {
                ProtocolMgmtPatientBasePage patientPage = Page as ProtocolMgmtPatientBasePage;
                return patientPage;
            }
        }

        public ProtocolMgmtBaseControl()
            : base()
        {
        }
    }
}
