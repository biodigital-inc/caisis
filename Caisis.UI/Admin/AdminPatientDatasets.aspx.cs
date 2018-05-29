using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Admin
{
    public partial class AdminPatientDatasets : AdminBasePage
    {

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            DataAccess.DataSetDa dsd = new DataSetDa();
            DataSet AllDataSets = dsd.GetDatasets();
            Dataset pda = new Dataset();
            DataSetsList.DataSource = AllDataSets;
            DataSetsList.DataTextField = "DataSetName";
            DataSetsList.DataValueField = "DataSetId";
            DataSetsList.DataBind();
            //ResultsPanel.Visible = false;
            //AddPanel.Visible = true;

            //DataSet dataset = new DataSet();
            //if (Page.IsPostBack && SearchField.Text != "")
            //{
            //    DataSetDa Inst = new DataSetDa();
            //    DataRowCollection InstIds = Inst.GetDatasets().Tables[0].Rows;


            //    Caisis.Controller.SearchController sc = new Caisis.Controller.SearchController();
            //    string search = SearchField.Text;
            //    foreach (DataRow DRow in InstIds)
            //    {
            //        DataSet local;
            //        CacheManager.ResetDatasetSqlCache();
            //        int dsID = int.Parse(DRow[0].ToString());
            //        string datasetSQL = CacheManager.GetDatasetSQL(dsID);
            //        local = sc.FindPatient(search, datasetSQL);
            //        dataset.Merge(local);
            //    }
            //    if (dataset.Tables[0].Rows.Count > 0)
            //    {
            //        AddPanel.Visible = false;
            //        ResultsPanel.Visible = true;
            //        ResultsGrid.DataSource = dataset;
            //        ResultsGrid.DataBind();
            //    }
            //}
            //// Put user code to initialize the page here
            //DataSetDa datasets = new DataSetDa();
            //PatientInstitutionDa pi = new PatientInstitutionDa();
            //PatientInstitution pio = new Caisis.BOL.PatientInstitution();
            //DataRow row = pio.Tables[PatientInstitution.Table_PatientInstitutions].NewRow();
            //DataSet ds = datasets.GetDatasets();
            //DataSetsList.DataSource = ds;
            //DataSetsList.DataTextField = "DatasetName";
            //DataSetsList.DataValueField = "DatasetId";
            //DataSetsList.DataBind();
            //			if (PatientID.Text != "" && DataSetsList.SelectedValue != null)
            //			{
            //				row[PatientInstitution.InstitutionId] = DataSetsList.SelectedValue;
            //				row[PatientInstitution.PatientId] = PatientID.Text;
            //				row[PatientInstitution.EnteredTime] = System.DateTime.Now;
            //
            //				//int i = pi.InsertRecord(row);
            //			}

        }

        public void AddDataSet(object sender, CommandEventArgs e)
        {
            Response.Write(Request.QueryString + "asdasd");
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
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion
    }
}