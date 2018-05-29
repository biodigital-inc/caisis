namespace Caisis.UI.Modules.Breast.Eforms
{
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.DataAccess;


    /// <summary>
    ///		Summary description for Medications for Breast eform.
    /// </summary>
    public partial class MedsBreastFU : BaseEFormControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            //populates all existing medications
            GetMedications();
            //populates all existing allergies
            GetAllergies();
        }

        protected void GetMedications()
        {
            DataView view = BusinessObject.GetByParentAsDataView<Medication>(_patientId);
            if (view.Count >= 1)
            {
                BreastMedsRpt.DataSource = view;
                BreastMedsRpt.DataBind();
            }
        }

        protected void GetAllergies()
        {
            DataView view = BusinessObject.GetByParentAsDataView<Allergy>(_patientId);
            if (view.Count >= 1)
            {
                BreastFUAllergiesRpt.DataSource = view;
                BreastFUAllergiesRpt.DataBind();
            }
        }
    }
}
