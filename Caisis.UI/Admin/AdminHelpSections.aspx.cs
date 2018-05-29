using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// </summary>
	public partial class AdminHelpSections : System.Web.UI.Page
	{
 		// TODO: make stored procedures?
		#region ugly sql strings
        private static readonly string SECTION_LIST_SQL = "SELECT HelpSectionId, HelpSectionName FROM HelpSections ORDER BY HelpSectionName";
        private static readonly string SECTION_LIST_DETAILS_SQL = "SELECT HelpSectionId, HelpSectionName, HelpSectionDescription FROM HelpSections WHERE HelpSectionId = @HelpSectionId";
        private static readonly string UPDATE_SQL = "UPDATE HelpSections SET HelpSectionName = @HelpSectionName, HelpSectionDescription = @HelpSectionDescription WHERE HelpSectionId = @HelpSectionId";
        private static readonly string INSERT_SQL = "INSERT INTO HelpSections (HelpSectionName, HelpSectionDescription) VALUES (@HelpSectionName, @HelpSectionDescription);SELECT @@IDENTITY";
        private static readonly string DELETE_SQL = "DELETE FROM HelpSections WHERE HelpSectionId = @HelpSectionId";
       
        #endregion

		protected void Page_Load(object sender, System.EventArgs e)
		{ 
			
			if (!Page.IsPostBack)
			{
                PopulateSectionList();
                setViewMode("start");
			}
		}

		protected void SectionList_OnSelectedIndexChanged(object sender, System.EventArgs e)
		{
            string viewMode = "start";
            int id = int.Parse(SectionList.SelectedValue.ToString());
            if (id < -1)
            { }
            else if (id < 0)
            { viewMode = "new"; }
            else
            {
                displayInfo(id);
                viewMode = "edit";
            }
            setViewMode(viewMode);
		}
        private void displayInfo(int id)
        {
            DataTable dt = GetHelpSectionDetails(id);
            id = int.Parse(dt.Rows[0]["HelpSectionId"].ToString());
            string name = dt.Rows[0]["HelpSectionName"].ToString();
            string description = dt.Rows[0]["HelpSectionDescription"].ToString();
            lblHelpSectionId.Text = id.ToString();
            txtHelpSectionName.Text = name;
            txtHelpSectionDescription.Text = description;
            PreSelectDropDown(SectionList,id.ToString());
            setEditMode();
        }
        protected void btnHelpSectionEdit_Click(object sender, EventArgs e)
        {
        }
        protected void btnHelpSectionSave_Click(object sender, EventArgs e)
        {
            string sid = lblHelpSectionId.Text;
            string name = txtHelpSectionName.Text;
            string description = txtHelpSectionDescription.Text;
            int id;

            if (sid == "New")
            {
                
                SqlCommand cmd1 = DataAccessHelper.CreateCommand(INSERT_SQL);
                cmd1.CommandType = CommandType.Text;

                AddParameterWithNullCheck(cmd1, "@HelpSectionName", name);
                AddParameterWithNullCheck(cmd1, "@HelpSectionDescription", description);

                DataSet ds = DataAccessHelper.GetList(cmd1);
                id = int.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            else
            {
                id = Int32.Parse(sid);

                SqlCommand cmd = DataAccessHelper.CreateCommand(UPDATE_SQL);
                cmd.CommandType = CommandType.Text;

                AddParameterWithNullCheck(cmd, "@HelpSectionId", id);
                AddParameterWithNullCheck(cmd, "@HelpSectionName", name);
                AddParameterWithNullCheck(cmd, "@HelpSectionDescription", description);

                DataAccessHelper.ExecuteScalar(cmd);
            }
            PopulateSectionList();
            displayInfo(id);
           
        }
        protected void btnHelpSectionCancel_Click(object sender, EventArgs e)
        {
            if (lblHelpSectionId.Text == "New")
            {
                setViewMode("start");
            }
            else 
            {
                int id = int.Parse(lblHelpSectionId.Text);
                displayInfo(id);
            }
        }
        protected void btnHelpSectionDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = null;
            cmd = DataAccessHelper.CreateCommand(DELETE_SQL);
            cmd.CommandType = CommandType.Text;
            string id = lblHelpSectionId.Text;
            AddParameterWithNullCheck(cmd, "@HelpSectionId", Int32.Parse(id));

            DataAccessHelper.ExecuteScalar(cmd);
            PopulateSectionList();
            setViewMode("start");
        }
        private void setViewMode(string mode)
        {
            switch(mode)
            {
                case "start":
                    pnlEdit.Visible = false;
                    lblHelpSectionId.Text = "";
                    txtHelpSectionName.Text = "";
                    txtHelpSectionDescription.Text = "";
                    SectionList.SelectedIndex = 0;
                    break;
                case "edit":
                    pnlEdit.Visible = true;
                    btnHelpSectionCancel.Enabled = false;
                    btnHelpSectionDelete.Enabled = true;
                    btnHelpSectionEdit.Enabled = true;
                    btnHelpSectionSave.Enabled = false;
                    lblHelpSectionId.Enabled = false;
                    txtHelpSectionDescription.Enabled = false;
                    break;
                case "new":
                    pnlEdit.Visible = true;
                    lblHelpSectionId.Text = "New";
                    txtHelpSectionDescription.Text = "";
                    txtHelpSectionName.Enabled = true;
                    txtHelpSectionDescription.Enabled = true;
                    txtHelpSectionName.Text = "";
                    btnHelpSectionCancel.Enabled = true;
                    btnHelpSectionDelete.Enabled = false;
                    btnHelpSectionEdit.Enabled = false;
                    btnHelpSectionSave.Enabled = false;
                    break;
            }
        }
        private void setEditMode()
        {
            pnlEdit.Visible = true;
            btnHelpSectionCancel.Enabled = false;
            btnHelpSectionDelete.Enabled = true;
            btnHelpSectionEdit.Enabled = true;
            btnHelpSectionSave.Enabled = false;
            lblHelpSectionId.Enabled = false;
            txtHelpSectionDescription.Enabled = false;
        }
        private void PreSelectDropDown(DropDownList ddl, string value)
		{
			if (ddl != null)
			{
				ddl.SelectedValue = value;
			}
		}
        
		private void AddParameterWithNullCheck(SqlCommand cmd, string fieldname, object val)
		{
			if (val == null)
			{
				cmd.Parameters.Add(new SqlParameter(fieldname, DBNull.Value));
			}
			else
			{
				cmd.Parameters.Add(new SqlParameter(fieldname, val));
			}
		}
		private void PopulateSectionList()
		{
            SectionList.DataSource = GetHelpSectionsNames().DefaultView;
            SectionList.DataTextField = "HelpSectionName";
            SectionList.DataValueField = "HelpSectionId";
            SectionList.DataBind();
            SectionList.Items.Insert(0, new ListItem("-- New Help Section", "-1"));
            SectionList.Items.Insert(0, new ListItem("", "-99"));
		}

        private DataTable GetHelpSectionsNames()
        {
            return GetDataTable(SECTION_LIST_SQL);
        }
        private DataTable GetHelpSectionDetails(int id)
        {
            SqlCommand cmd = null;
            DataTable table = null;
            try
            {
                cmd = DataAccessHelper.CreateCommand(SECTION_LIST_DETAILS_SQL);
                cmd.CommandType = CommandType.Text;
                AddParameterWithNullCheck(cmd, "@HelpSectionId", id);

                DataSet ds = DataAccessHelper.GetList(cmd);
                table = ds.Tables[0];
            }
            finally
            {
                cmd.Connection.Close();
            }
            return table;
        }
		#region database interaction
		private DataTable GetDataTable(string sql)
		{
			SqlCommand cmd = null;
			DataTable table = null;
			try
			{
				cmd = DataAccessHelper.CreateCommand(sql);
				cmd.CommandType = CommandType.Text;
				DataSet ds = DataAccessHelper.GetList(cmd);
				table = ds.Tables[0];
			}
			finally
			{
				cmd.Connection.Close();
			}
			return table;
		}
		#endregion

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

		}
		#endregion
	}
}
