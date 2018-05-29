using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.UI.Core;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.All.DataEntryForms
{
    /// <summary>
    ///		Summary description for PatientPhysiciansForm.
    /// </summary>
    public partial class PatientPhysiciansForm : BasePatientDataControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            // always refresh physician info
            if (PhysicianId.SelectedIndex > 0)
            {
                ShowPhysicianInfo();
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            // prepend isDirty = false to onchange of PhysicianId dropdown
            PhysicianId.Attributes["onchange"] += "disIsDirty(); " + PhysicianId.Attributes["onchange"];
        }

        protected void SelectPhysician(object sender, EventArgs e)
        {
            // load the physican details control with the info for the selected physician
            if (PhysicianId.SelectedIndex > 0)
            {
                ShowPhysicianInfo();
            }
            else
            {
                ClearPhysicianInfo();
            }
        }

        private void ClearPhysicianInfo()
        {
            PhysicianName.Text = "";
            PhysicianSpecialty.Text = "";
            PhysicianAddress1.Text = "";
            PhysicianAddress2.Text = "";
            PhysicianCity.Text = "";
            PhysicianState.Text = "";
            PhysicianPostalCode.Text = "";
            PhysicianInstitution.Text = "";
            PhysicianPhone.Text = "";
            PhysicianFax.Text = "";

            PhysicianInfoTable.Style["visibility"] = "hidden";

            EditPhysicianLink.Attributes["onclick"] = "popupAddEditPhysician('../Utilities/AddEditPhysicians.aspx?newWindow=true');";
        }

        private void ShowPhysicianInfo()
        {
            Physician physician = new Physician();
            physician.Get(Int32.Parse(PhysicianId.SelectedValue));
            PopulatePhysicianInfo(physician);
            PhysicianInfoTable.Style["visibility"] = "visible";

            EditPhysicianLink.Attributes["onclick"] = "popupAddEditPhysician('../Utilities/AddEditPhysicians.aspx?physid=" + physician[Physician.PhysicianId] + "');";
        }

        private void PopulatePhysicianInfo(Physician p)
        {
            PhysicianName.Text = GetPhysicanName(p);
            PhysicianSpecialty.Text = p[Physician.PhSpecialty].ToString();
            PhysicianAddress1.Text = p[Physician.PhAddress1].ToString();
            PhysicianAddress2.Text = p[Physician.PhAddress2].ToString();
            PhysicianCity.Text = p[Physician.PhCity].ToString();
            PhysicianState.Text = p[Physician.PhState].ToString();
            PhysicianPostalCode.Text = p[Physician.PhPostalCode].ToString();
            PhysicianInstitution.Text = p[Physician.PhInstitution].ToString();
            PhysicianPhone.Text = p[Physician.PhWorkPhone].ToString();
            PhysicianFax.Text = p[Physician.PhFax].ToString();
        }

        private string GetPhysicanName(Physician p)
        {
            StringBuilder b = new StringBuilder();
            b.Append(p[Physician.PhTitle].ToString());
            b.Append(" ");
            b.Append(p[Physician.PhFirstName].ToString());
            b.Append(" ");
            b.Append(p[Physician.PhLastName].ToString());

            string suffix = p[Physician.PhSuffix].ToString();

            if (suffix != "")
            {
                b.Append(" ");
                b.Append(suffix);
            }

            return b.ToString();
        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //	
            InitializeComponent();
            base.OnInit(e);

        }

        /// <summary>
        ///		Required method for Designer support - do not modify
        ///		the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
        }
        #endregion
    }
}