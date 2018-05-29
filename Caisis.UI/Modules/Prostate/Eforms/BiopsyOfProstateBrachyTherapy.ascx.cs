namespace Caisis.UI.Modules.Prostate.Eforms
{
    using System;
    using System.Data;
    using System.Drawing;
	using System.Linq;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
    using Caisis.DataAccess;

    using Caisis.UI.Core.Classes.CustomControls;

    /// <summary>
    ///		Summary description for MedicationsClinical.
    /// </summary>
    public partial class BiopsyOfProstateBrachyTherapy : BaseEFormControl
    {


        // show this only if repeater is empty

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildBrachy();

            //			SetDivDisplay();
        }

        private void BuildBrachy()
        {
            Caisis.BOL.BrachyTherapy bizo = new Caisis.BOL.BrachyTherapy();
            bizo.Get(this._patientId);

            //if (bizo.DataSourceView.Count > 0)
			if (!bizo.IsEmpty)
            {
                //Brachy.DataSource = bizo.DataSourceView;
				Brachy.DataSource = new BOL.BrachyTherapy[] { bizo }.AsDataView();
                Brachy.DataBind();
                //NewTableRow.Style["display"] = "none";
            }
        }

        protected void SetDivDisplay()
        {
            bool ShowDiv = false;

            if (BrachyDateText_1.Text.Length > 0 || BrachyPrescribedDose_1.Text.Length > 0 || BrachyNotes_1.Text.Length > 0)
            {
                ShowDiv = true;
            }
            else if (BrachyIsotope_1.Value.Length > 0)
            {
                ShowDiv = true;
            }
            else if (BrachyInstitution_1.Value.Length > 0)
            {
                ShowDiv = true;
            }


            if (ShowDiv == true)
            {
                DivDisplay.Text = "block";
                ShowDivScript.Text = "<script>if (document.getElementById('BrachyTxCheckbox')) document.getElementById('BrachyTxCheckbox').checked = true;</script>";
            }

        }


    }
}

