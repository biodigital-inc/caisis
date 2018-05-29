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

	using System.Security.Permissions;



	/// <summary>
    ///		Summary description for PCCTCSurgicalHistory.
	/// </summary>
    public partial class PCCTCSurgicalHistory : BaseEFormControl
	{


		protected int recordCount;
		protected int groupNum;

		private int lastPrimaryKey;



 

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildSurgicalHistory();
		}


		protected void BuildSurgicalHistory()
		{
			ChronoDa da = new ChronoDa();
			DataSet ds;
			ds = da.GetChronoList(this._patientId, "Procedures", Page.User.Identity.Name);

			if (ds.Tables[0].Rows.Count > 0)
			{
				rptSurgicalHistory.DataSource = ds.Tables[0].DefaultView;
				rptSurgicalHistory.DataBind();
				NoSurgicalHistoryMsgTr.Visible = false;
			}

		}




		protected void ChronListItemDataBound(Object Sender, RepeaterItemEventArgs e)
		{
			Literal ChronListDateField;
			ChronListDateField = (Literal) e.Item.FindControl("ChronListDateField");

			HtmlTableRow SurgicalHistoryRow;
			SurgicalHistoryRow = (HtmlTableRow) e.Item.FindControl("SurgicalHistoryRow");
			
			DataRowView drv = (DataRowView)(e.Item.DataItem);

			int primaryKey = int.Parse(drv.Row["PrimaryKey"].ToString());
			int parentKey  = int.Parse(drv.Row["ParentKey"].ToString());

			if(!drv.Row["GroupNumber"].Equals(System.DBNull.Value))
			{
				int groupNum   = int.Parse(drv.Row["GroupNumber"].ToString());
			
				//
				//surgeries and subitems are in 100's range. encounters and subitems in 200 range  
				//groupNums defined in the lookup codes table.
				//
				if(groupNum >= 100 && groupNum <= 299)
				{
					
					if(primaryKey == this.lastPrimaryKey)
					{
						ChronListDateField.Text = "";
						this.lastPrimaryKey = primaryKey;
					}
					else if(parentKey == this.lastPrimaryKey)
					{
						//
						//could be slight flaw here due to data leftover from version 1.2
						//in v1.2 the patient id was the primKey of the surgeries table 
						//
						ChronListDateField.Text = "";
						this.lastPrimaryKey = parentKey;
					}
					else
					{
						ChronListDateField.Text = drv.Row["varDate"].ToString();
						this.lastPrimaryKey = primaryKey;
					}
				}
			}
			else
			{
				ChronListDateField.Text = drv.Row["varDate"].ToString();
				this.lastPrimaryKey = 0;
			}

            string ProcName = drv.Row["VarName"].ToString().ToUpper();

            if (ProcName.IndexOf("PROSTATECTOMY") > -1 || ProcName.Equals("RP") || ProcName.Equals("LP") || ProcName.Equals("RALP") || ProcName.Equals("CP") || ProcName.Equals("PP") || ProcName.Equals("SALVRP") || ProcName.Equals("SALVLP") || ProcName.Equals("SALVCP"))
			{
				AddProstatectomyDiv.Visible = false;
			}

	


			

		}

	}
}
