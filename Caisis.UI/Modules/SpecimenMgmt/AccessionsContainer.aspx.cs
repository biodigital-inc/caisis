using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    /// <summary>
    /// Contains Accessions Chronological list
    /// and allows updating Accession & Specimens details
    /// and create new Accessions
    /// </summary>

    public partial class AccessionsContainer : SpecimenMgmtBasePage
    {
        private int patientId = 0;
        private int accessionId = 0;
        SpecimenAccession sa;

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            patientId = Convert.ToInt32(DecryptPatientId(Request.QueryString["patientId"].ToString()));
            if (!string.IsNullOrEmpty(Request.QueryString["specimenaccessionId"]))
            {
                accessionId = int.Parse(Request.QueryString["specimenaccessionId"].ToString());
            }

           //get Accession
            sa = new SpecimenAccession();
            sa.Get(accessionId);

            if (!Page.IsPostBack)
            {
                LoadAccessionInfo();
            }
        }

        private void LoadAccessionInfo()
        {
            //loading frames
            this.AccessionsRptFrame.Attributes["src"] = "AccessionQueryResults.aspx?patientId=" + EncryptPatientId(patientId.ToString());
            this.AccessionsDataFrame.Attributes["src"] = "SpecimenAccessions.aspx?patientId=" + EncryptPatientId(patientId.ToString()) + "&specimenaccessionId=" + accessionId;
        }
    }
}