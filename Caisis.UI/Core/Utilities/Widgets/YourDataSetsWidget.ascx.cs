using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.ComponentModel;
using System.IO;

using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Core.Utilities.Widget
{
    public partial class YourDataSetsWidget : BaseWidgetControl
    {
        private int? _currentDatasetId = null;

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            object datasetId = Session[SessionKey.DatasetId];
            if (datasetId != null && !string.IsNullOrEmpty(datasetId.ToString()))
            {
                _currentDatasetId = int.Parse(datasetId.ToString());
            }

            if (!Page.IsPostBack)
            {
                BuildUserDatasets(_currentDatasetId);

            }
            if (_currentDatasetId.HasValue)
            {
                BuildDataSetStats(_currentDatasetId.Value);
            }
        }

        /// <summary>
        /// Validate chart write access
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            bool chartWriteOK = false;
            // test chart output, else write error message
            try
            {
                StringWriter tmpSW = new StringWriter();
                HtmlTextWriter tmpTW = new HtmlTextWriter(tmpSW);
                DataSetChart.RenderControl(tmpTW);

                chartWriteOK = true;
            }
            catch (Exception ex)
            {
            }
            if (!chartWriteOK)
            {
                ChartErrorMessage.Visible = true;
                DataSetChart.Visible = false;
            }
            base.Render(writer);
        }

        /// <summary>
        /// Ajax method for processing callback to set new session dataset
        /// </summary>
        /// <param name="e"></param>
        protected void SetNewClientSession(Caisis.UI.ClientScript.Ajax.CaisisAjaxEventArgs e)
        {
            bool datasetUpdated = false;
            string clientDatasetId = e.ClientParam;
            if (!string.IsNullOrEmpty(clientDatasetId))
            {
                int datasetId = int.Parse(Security.CustomCryptoHelper.Decrypt(clientDatasetId));
                // udpate dataset
                SetSessionDataset(datasetId);
                // clear patient
                SessionHandler sh = new SessionHandler(Session);
                sh.ClearCurrentPatient();

                datasetUpdated = true;
            }
            e.ReturnValue = datasetUpdated.ToString().ToLower();
        }

        /// <summary>
        /// Rebuilds dataset chanrt on selected chart change
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildDataset(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(UserDataSets.SelectedValue))
            {
                int datasetId = int.Parse(Security.CustomCryptoHelper.Decrypt(UserDataSets.SelectedValue));
                // set session
                SetSessionDataset(datasetId);
                // clear patient
                SessionHandler sh = new SessionHandler(Session);
                sh.ClearCurrentPatient();
                // redirect
                Response.Redirect("Dashboard.aspx");
            }
        }

        private void SetSessionDataset(int datasetId)
        {
            // validate
            Session[SessionKey.DatasetId] = datasetId;
            // get username
            Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
            string username = sc.GetUserName();
            // get purpose
            int loginId = int.Parse(Session[SessionKey.LoginId].ToString());
            var udv = BOL.BusinessObject.GetByFields<BOL.UserDatasetView>(new Dictionary<string, object>
            {
                { BOL.UserDatasetView.UserLoginId, loginId },
                { BOL.UserDatasetView.DatasetId, datasetId }
            });
            string purpose = udv.Count() > 0 ? udv.First()[BOL.UserDatasetView.Purpose].ToString() : "Research";

            // set permission
            UserController _uc = new UserController();
            _uc.SetPermissions(purpose, datasetId, loginId, username);
            // set view code
            Session[SessionKey.GroupViewCode] = _uc.SetGroupViewCode(datasetId);
            // set default view mode
            SetViewMode(datasetId);
        }


        private void SetViewMode(int? datasetId)
        {
            if (datasetId.HasValue)
            {
                DiseaseController dc = new DiseaseController();
                var datasetDisease = dc.GetDiseaseAttributeValue(BOL.Dataset.DatasetId, datasetId.Value.ToString());
                if (datasetDisease != null)
                {
                    var disease = new BOL.Disease();
                    disease.Get((int)datasetDisease[BOL.DiseaseAttributeValue.DiseaseId]);
                    Caisis.Security.CustomPrincipal cp = System.Threading.Thread.CurrentPrincipal as Caisis.Security.CustomPrincipal;
                    string diseaseView = disease[BOL.Disease.DiseaseName].ToString();
                    cp.UserProfile["diseaseView"] = diseaseView;
                }
            }
        }

        /// <summary>
        /// Build a list of available User Datasets and set optional selected value
        /// </summary>
        /// <param name="datasetId"></param>
        private void BuildUserDatasets(int? datasetId)
        {
            Security.SecurityController sc = new Caisis.Security.SecurityController();
            DataSetDa da = new DataSetDa();
            DataTable datasets = da.GetByUser(sc.GetUserName()).Tables[0];
            // encrypted datasetid
            DataColumn encDatasetId = new DataColumn("EncDatasetId", typeof(string));
            datasets.Columns.Add(encDatasetId);
            foreach (DataRow row in datasets.Rows)
            {
                row[encDatasetId] = Security.CustomCryptoHelper.Encrypt(row[BOL.Dataset.DatasetId].ToString());
            }

            var datasetsView = datasets.DefaultView;
            datasetsView.Sort = BOL.Dataset.DatasetName + " ASC";
            UserDataSets.DataSource = datasetsView;
            UserDataSets.DataBind();

            // select current
            if (datasetId.HasValue)
            {
                string currentEncDatasetId = Security.CustomCryptoHelper.Encrypt(datasetId.ToString());
                UserDataSets.SelectedValue = currentEncDatasetId;
            }

            // hide selector on single dataset
            if (datasets.Rows.Count < 2)
            {
                UserDataSets.Visible = false;
                UserDataSetsLabel.Visible = false;
            }
        }

        /// <summary>
        /// For the specified dataset, build stats
        /// </summary>
        /// <param name="datasetId"></param>
        private void BuildDataSetStats(int datasetId)
        {
            BOL.Dataset biz = new Caisis.BOL.Dataset();
            biz.Get(datasetId);
            string datsetsName = biz[BOL.Dataset.DatasetName].ToString();
            string datasetSql = CacheManager.GetDatasetSQL(datasetId);
            DataSetDa da = new DataSetDa();
            DataTable stats = da.GetDataSetStatsPastYear(datasetSql);
            // create friendly label
            DataColumn displayColumn = new DataColumn("Label", typeof(string));
            DataColumn displayColumnTooltip = new DataColumn("LabelTooltip", typeof(string));
            stats.Columns.Add(displayColumn);
            stats.Columns.Add(displayColumnTooltip);

            var series = DataSetChart.Series[0];
            series.Name = string.Format("{0}", datsetsName);

            // get max and min values
            var values = from r in stats.AsEnumerable()
                         select (int)r["TotalCount"];
            if (values.Count() > 0)
            {
                double max = values.Max();
                double min = values.Min();
                if (max > 10)
                {
                    int max10 = SmoothInterval(max, 10);
                    int min10 = SmoothInterval(min, 10);
                    int maxValue = max10 > max ? max10 : max10 + 10;
                    int minValue = min10 < min ? min10 : min10 - 10;
                    DataSetChart.ChartAreas["MainArea"].AxisY.Maximum = maxValue;
                    DataSetChart.ChartAreas["MainArea"].AxisY.Minimum = minValue;
                }
            }

            // build chart
            foreach (DataRow row in stats.Rows)
            {
                int count = (int)row["Count"];
                int month = (int)row["Month"];
                int displayYear = (int)row["Year"];
                string displayMonth = new DateTime(displayYear, month, 1).ToString("MMM"); //System.Globalization.DateTimeFormatInfo.CurrentInfo.GetMonthName(month);
                row[displayColumn] = string.Format("{0} {1}", displayMonth, displayYear);
                row[displayColumnTooltip] = string.Format("{0} {1} : {2} Patient(s) Added", displayMonth, displayYear, count);
            }

            series.Points.DataBind(stats.DefaultView, "Label", "TotalCount", "Tooltip=LabelTooltip, Label=TotalCount");

            DataSetChart.DataBind();
        }

        private int SmoothInterval(int source, int scale)
        {
            return SmoothInterval((double)source, scale);
        }

        private int SmoothInterval(double source, int scale)
        {
            int target = ((int)Math.Round(source / (double)scale)) * scale;
            return target;
        }
    }
}