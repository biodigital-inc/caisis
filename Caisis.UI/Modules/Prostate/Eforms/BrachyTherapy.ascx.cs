namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Collections.Generic;
	using System.Data;
	using System.Drawing;
	using System.Linq;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.DataAccess;

	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for BrachyTherapy.
	/// </summary>
	public partial class BrachyTherapy : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildBrachy();
            base.SetTitle(ComponentTitle);
		}

		private void BuildBrachy()
		{
			BOL.BrachyTherapy bizo = new BOL.BrachyTherapy();
            bizo.Get(this._patientId);

            //if (bizo.DataSourceView.Count > 0)
			if (!bizo.IsEmpty)
			{
				//Brachy.DataSource = bizo.DataSourceView;
				Brachy.DataSource = new BOL.BrachyTherapy[] { bizo }.AsDataView();
				Brachy.DataBind();
			}
		}

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null)
            {
                        NewTableRow.Visible = false;
            }
        }
	}
}
