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

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientDemographics : ProtocolMgmtPatientBasePage
    {

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int patientId = int.Parse(BaseDecryptedPatientId);
                PopulatePatient(patientId);
            }
        }

        protected void UpdateClick(object sender, EventArgs e)
        {
            int patientId = int.Parse(BaseDecryptedPatientId);
            UpdatePatient(patientId);
        }

        private void PopulatePatient(int patientId)
        {
            Patient patient = new Patient();
            patient.Get(patientId);
            CICHelper.SetFieldValues(this.Controls, patient);
        }

        private void UpdatePatient(int patientId)
        {
            Patient patient = new Patient();
            patient.Get(patientId);
            CICHelper.SetBOValues(this.Controls, patient, -1);
            patient.Save();
        }

    }
}
