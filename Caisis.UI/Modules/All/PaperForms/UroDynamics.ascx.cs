namespace Caisis.UI.Modules.All.PaperForms
{
	using System;
	using System.Data;
	using System.Collections;
	using System.Web;
	using System.Web.UI;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	
	using Caisis.DataAccess;

	using System.Data.SqlClient;

	using System.Configuration;

	using Caisis.UI.Core.Classes;

	/// <summary>
	///		Summary description for UroDynamics.
	/// </summary>
	public partial class UroDynamics : BasePaperFormControl
	{


		protected static int NumHpiRowsAllowed = 8;
		protected static int NumMedRowsAllowed = 7;


		override protected void Page_Load(object sender, EventArgs e)
		{

			base.Page_Load(sender, e);

			BuildMedications();

		}



		override protected void SetFormInfo()  
		{
			this._formName = "UroDynamics";
			this._formTitle = "General Urodynamics";
		}


		protected void medicationsItemDataBound(Object Sender, RepeaterItemEventArgs e) 
		{

			Literal StartNextMedColumn;
			StartNextMedColumn = (Literal) e.Item.FindControl("StartNextMedColumn");

			int RowsAllowed = NumMedRowsAllowed;

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				int rowNumber = e.Item.ItemIndex + 1;
				if (System.Math.IEEERemainder(rowNumber, RowsAllowed) == 0)
				{
					StartNextMedColumn.Text = "</td><td  style=\"line-height: 11px; border-left: solid 1px #cccccc; padding-left: 1px;\" valign=\"top\">";
				}
				else
				{
					StartNextMedColumn.Visible = false;
				}
			}
		}

	}
}
