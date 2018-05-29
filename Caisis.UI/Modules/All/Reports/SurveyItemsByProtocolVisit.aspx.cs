using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.DataAccess;
using Caisis.DataAnalysis;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.All.Reports
{
    public partial class SurveyItemsByProtocolVisit : BaseReportPage
    {

        protected string QueryProtocolId
        {
            get
            {
                return Request.QueryString["protocolId"];
            }
        }


        protected string QuerySchemaId
        {
            get
            {
                return Request.QueryString["schemaId"];
            }
        }


        protected string QueryTimelineId
        {
            get
            {
                return Request.QueryString["timelineId"];
            }
        }

        protected string QuerySurveyTypes
        {
            get
            {
                return Request.QueryString["surveys"];
            }
        }

        protected string QueryAction
        {
            get
            {
                return Request.QueryString["action"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            // suppress view state
            this.EnableViewState = false;

            // initial label state
            SchemaLabel.ForeColor = Color.Empty;

            if (!Page.IsPostBack)
            {
                // populate protocol list
                PopulateProtocolList();

                if (!string.IsNullOrEmpty(QueryProtocolId))
                {
                    ProtocolList.SelectedValue = QueryProtocolId;

                    // build schema list
                    ProtocolListSelectedIndexChanged(sender, e);

                    if (!string.IsNullOrEmpty(QuerySchemaId))
                    {
                        SchemaList.SelectedValue = QuerySchemaId;

                        // build visits
                        SchemaListSelectedIndexChanged(sender, e);

                        if (!string.IsNullOrEmpty(QueryTimelineId))
                        {
                            VisitList.SelectedValue = QueryTimelineId;

                            // build surveys
                            VisitListSelectedIndexChanged(sender, e);

                            // determine action
                            if (!string.IsNullOrEmpty(QueryAction))
                            {
                                if (QueryAction == "run")
                                {
                                    RunReportClick(sender, e);
                                }
                                else if (QueryAction == "export-excel")
                                {
                                    ExcelExportClick(sender, e);
                                }
                                else if (QueryAction == "export-csv")
                                {
                                    CSVExportClick(sender, e);
                                }
                            }
                        }
                    }
                }
            }
        }

        protected void ProtocolListSelectedIndexChanged(object sender, EventArgs e)
        {
            // populate and display schema list with selected protocol id
            string v = ProtocolList.SelectedValue;
            int protocolid;

            // hide everything but the protocol list
            VisitRow.Visible = false;
            ShowSearchExport(false, false);
            ResultsGridView.Visible = false;
            SurveyRow.Visible = false;

            if (!string.IsNullOrEmpty(v) && int.TryParse(v, out protocolid))
            {
                PopulateSchemaList(protocolid);
                SchemaRow.Visible = true;
            }
            else
            {
                // make the "select a protocol" text red
                ProtocolLabel.ForeColor = Color.Red;
                SchemaRow.Visible = false;
            }
        }

        protected void SchemaListSelectedIndexChanged(object sender, EventArgs e)
        {
            string v = SchemaList.SelectedValue;
            int schemaid;

            // hide the results
            ResultsGridView.Visible = false;
            SurveyRow.Visible = false;

            if (!string.IsNullOrEmpty(v) && int.TryParse(v, out schemaid))
            {
                PopulateVisitList(schemaid);
                VisitRow.Visible = true;
                ShowSearchExport(true, false);
            }
            else
            {
                // make the "select a schema" text red
                SchemaLabel.ForeColor = Color.Red;
                VisitRow.Visible = false;
                ShowSearchExport(false, false);
            }
        }

        protected void VisitListSelectedIndexChanged(object sender, EventArgs e)
        {
            string v = VisitList.SelectedValue;
            int timelineid;

            SurveyRow.Visible = false;

            if (!string.IsNullOrEmpty(v) && int.TryParse(v, out timelineid))
            {
                PopulateSurveyTypeList(timelineid);
                SurveyRow.Visible = true;
            }
        }

        protected void RunReportClick(object sender, EventArgs e)
        {
            string v = VisitList.SelectedValue;
            int timelineid;

            if (!string.IsNullOrEmpty(v) && int.TryParse(v, out timelineid))
            {
                string[] surveyTypes = GetSelectedSurveyTypes();
                //string[] surveyTypes = GetSelectedItems(SurveyTypeList);
                DataTable results = ProtocolMgmtDa.GetSurveyItemsByTimelineId(timelineid, surveyTypes);
                ResultsGridView.DataSource = results;
                ResultsGridView.DataBind();
                

                if (results.Rows.Count > 0)
                {
                    ShowSearchExport(true, true);
                    ResultsGridView.Visible = true;
                }
            }
        }

        protected void ExcelExportClick(object sender, EventArgs e)
        {
            Export(x => ExcelExporter.ExportToExcel(Page, x.DefaultView, ReportTitle, "export.xls"));
        }

        protected void CSVExportClick(object sender, EventArgs e)
        {
            Export(x => ExcelExporter.ExportToCSV(x, Page, ReportTitle));
        }

        private void Export(Action<DataTable> exportAction)
        {
            if (CanExportToExcel())
            {
                string v = VisitList.SelectedValue;
                int timelineid;

                if (!string.IsNullOrEmpty(v) && int.TryParse(v, out timelineid))
                {
                    string[] surveyTypes = GetSelectedSurveyTypes();
                    //string[] surveyTypes = GetSelectedItems(SurveyTypeList);
                    DataTable results = ProtocolMgmtDa.GetSurveyItemsByTimelineId(timelineid, surveyTypes);
                    exportAction(results);
                }
            }
        }

        private void PopulateProtocolList()
        {
            var ds =
                from p in BusinessObject.GetAll<Protocol>()
                let title = p[Protocol.ProtocolTitle].ToString()
                orderby p[Protocol.ProtocolNum].ToString()
                select new
                {
                    Id = p[Protocol.ProtocolId],
                    Text = p[Protocol.ProtocolNum].ToString() + ": " + title.Substring(0, Math.Min(25, title.Length))
                };

            PopulateDropDownList(ProtocolList, ds, "Text", "Id");
        }

        private void PopulateSchemaList(int protocolid)
        {
            DataTable dt = ProtocolMgmtDa.GetSchemasByProtocol(protocolid);
            var datasource =
                from row in dt.AsEnumerable()
                let schemaid = row["ProtocolSchemaId"]
                let desc = row["ProtocolArmDescription"].ToString()
                select new
                {
                    Id = schemaid,
                    Text = desc.Substring(0, Math.Min(25, desc.Length))
                };

            PopulateDropDownList(SchemaList, datasource, "Text", "Id");
        }

        private void PopulateVisitList(int protocolschemaid)
        {
            var ds =
                from t in BusinessObject.GetByParent<Timeline>(protocolschemaid)
                let timelineId = t[Timeline.TimelineId]
                let unitName = t[Timeline.DisplayUnitName].ToString()
                let unitCount = t[Timeline.NumberOfUnits].ToString()
                let label = t[Timeline.VisitLabel].ToString()
                let unitDetail = unitName + " " + unitCount
                let extend = (!string.IsNullOrEmpty(label)) && label != unitDetail
                orderby t[Timeline.DisplayColumnPosition], timelineId
                select new
                {
                    TimelineId = timelineId,
                    Text = string.Format("{0}{1}", unitDetail, extend ? ": " + label : "")
                };

            PopulateDropDownList(VisitList, ds, "Text", "TimelineId");
        }

        private void PopulateSurveyTypeList(int timelineid)
        {            
            var surveyTypes = ProtocolMgmtDa.GetSurveyTypesByTimelineId(timelineid);
            
            /*
            SurveyTypeList.DataSource = surveyTypes;
            SurveyTypeList.DataBind();
              
            PreRender += new EventHandler(
                (o, e) =>
                {
                    foreach (ListItem i in SurveyTypeList.Items)
                    {
                        i.Selected = true;
                    }
                });
            */

            // encode values
            var selectedSurveys = GetSelectedSurveyTypes();
            var dataSource = from survey in surveyTypes
                             select new
                             {
                                 SurveyType = Server.HtmlEncode(survey),
                                 Selected = selectedSurveys.Contains(survey)
                             };
            var encodedSurveyTypes = dataSource;
            SurveyTypeListRptr.DataSource = encodedSurveyTypes;
            SurveyTypeListRptr.DataBind();

            
        }

        private void PopulateDropDownList(DropDownList dd, object datasource, string textField, string valueField)
        {
            dd.Items.Clear();
            dd.Items.Add(new ListItem());
            dd.DataSource = datasource;
            dd.DataTextField = textField;
            dd.DataValueField = valueField;
            dd.DataBind();
        }

        private void ShowSearchExport(bool search, bool export)
        {
            if (search)
            {
                RunReportBtn.Visible = true;
                ExportButtons.Visible = export;
            }
            else
            {
                RunReportBtn.Visible = false;
                ExportButtons.Visible = false;
            }
        }

        private string[] GetSelectedItems(CheckBoxList list)
        {
            var selected =
                from ListItem cb in list.Items
                where cb.Selected
                select cb.Value;

            return selected.ToArray();
        }

        private string[] GetSelectedSurveyTypes()
        {
            if (!string.IsNullOrEmpty(QuerySurveyTypes))
            {
                return QuerySurveyTypes.Split(',').Select(s => Server.UrlDecode(s)).ToArray();
            }
            return new string[0];
        }
    }
}
