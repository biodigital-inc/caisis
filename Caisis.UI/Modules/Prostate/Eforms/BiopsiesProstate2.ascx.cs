namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for BiopsiesProstate2.
	/// </summary>
    public partial class BiopsiesProstate2 : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildBiopsies(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
		}


		override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
		{

			base.EFormRepeaterOnDataBound(Sender, e);


			Literal ResultField;
			ResultField = (Literal) e.Item.FindControl("ResultField");


            if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && e.Item.DataItem != null) 
			{
				if ( ((DataRowView) e.Item.DataItem )["TableName"].ToString().Length > 0 && ((DataRowView) e.Item.DataItem )["TableName"].ToString().ToUpper().IndexOf("PROSTATE") > -1)
				{
					ResultField.Text = ((DataRowView) e.Item.DataItem )["PathResult2"].ToString();
				}
				else
				{
                    ResultField.Text = ((DataRowView)e.Item.DataItem)["PathResult"].ToString();
				}
			}


		}




	}
}
