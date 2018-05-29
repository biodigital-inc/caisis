namespace Caisis.UI.Modules.Thoracic.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

	using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for Thoracic Initial Encounter
    /// </summary>
    public partial class InitialEncThoracic : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            //gets all existing encounters of the patient
            GetEncounters();
        }

        protected void GetEncounters()
        {
			//Caisis.BOL.Encounter EncObj = new Caisis.BusinessObject.Encounter();
			//EncObj.GetByParent(_patientId);

			//if (EncObj.DataSourceView.Table.Rows.Count >= 1)
			//{
			//    EncountersRpt.DataSource = EncObj.DataSourceView;
			//    EncountersRpt.DataBind();
			//}

			DataView dv = BusinessObject.GetByParentAsDataView<Encounter>(_patientId);

			if (dv.Count > 0)
			{
				EncountersRpt.DataSource = dv;
				EncountersRpt.DataBind();
			}
        }
    }
}