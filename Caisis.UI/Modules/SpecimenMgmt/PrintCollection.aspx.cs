using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;
using Caisis.DataAccess;
namespace Caisis.UI.Modules.SpecimenMgmt
{
	/// <summary>
	/// Summary description for PrintCollection.
	/// </summary>
	public partial class PrintCollection : System.Web.UI.Page
	{
		
	
		public static int gCollectionId=0;
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			if(!Page.IsPostBack)
			{
				//loadList();
				this.tblPrintArea.Visible=false;
				this.btnPrint.Visible=false;
			}

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
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			//this.ibSubmit.Click += new System.Web.UI.ImageClickEventHandler(this.ibSubmit_Click);

		}
		#endregion

        /*
		private void loadList()

		{
			//SpecimenTrackerDa da =new SpecimenTrackerDa();
            SpecimenManagerDa da = new SpecimenManagerDa();

			DataSet ds=new DataSet();
			
			
			ds=da.LoadDropDownList("collectionList","");
			DataTable dt = ds.Tables[0];
			foreach (DataRow dr in dt.Rows)
			{
				this.ddlList.Items.Add(new ListItem(dr["collectionName"].ToString(),dr["collectionId"].ToString()));
			}
		}
         */

        /*
		private void ibSubmit_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			
			if(this.ddlList.SelectedIndex!=0)
			{				
				gCollectionId=Convert.ToInt32(ddlList.SelectedValue);
				LoadCollectionInfo();
				LoadSpecimenInfo();						
			}
			else			
			{
				tblPrintArea.Visible=false;
				this.btnPrint.Visible=false;
			}	
						

		}
         */
        /*
		private void LoadSpecimenInfo()
		{
			//SpecimenTrackerDa da =new SpecimenTrackerDa();
            SpecimenManagerDa da = new SpecimenManagerDa();

			DataSet ds=new DataSet();
			DataTable dt=new DataTable();

			ds=da.GetSpecimenDetails(gCollectionId,"","SingleCollection",this.ddlIdentifierType.SelectedItem.Text); //**identifier type
			this.dgSpecimens.DataSource=ds.Tables[0].DefaultView;
			this.dgSpecimens.DataBind();
			this.lblTotalSpecimens.Text="Total Specimens: "+ds.Tables[0].Rows.Count;
		}
        */
        /*
		private void LoadCollectionInfo()
		{

			Caisis.Security.SecurityController sc=new Caisis.Security.SecurityController();
			string userName=sc.GetUserName();

			//SpecimenTrackerDa da =new SpecimenTrackerDa();
            SpecimenManagerDa da = new SpecimenManagerDa();
			DataSet ds=new DataSet();
			DataTable dt=new DataTable();

			ds=da.GetCollectionDetails(gCollectionId);
			dt = ds.Tables[0];
			if(dt.Rows.Count==0)
			{
				lblMsg.Text="Collection details are not found";
				this.tblPrintArea.Visible=false;
				this.btnPrint.Visible=false;
				return;
			}
			else
			{
				this.tblPrintArea.Visible=true;
				this.btnPrint.Visible=true;
				this.lblPrintInfo.Text="Printed by: "+userName+"<br>Date: "+DateTime.Now.ToString("dd/MM/yyyy");
			}

			foreach (DataRow dr in dt.Rows)
			{				
				this.lblCollectionName.Text=dr["CollectionName"].ToString();
				this.lblCollectionDate.Text=dr["CollectionAssignDate"].ToString();
				this.lblCollectonType.Text=dr["CollectionType"].ToString();
				this.lblCollectionStaus.Text=dr["CollectionStatus"].ToString();
							

			}
		}
         */
	}
}
