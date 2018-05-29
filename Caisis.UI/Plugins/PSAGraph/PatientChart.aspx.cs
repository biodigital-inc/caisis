using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;
using System.Collections.Generic;

using System.Web.UI.DataVisualization.Charting;


using Caisis.DataAccess;
using Caisis.UI.Core.Classes;

using Caisis.UI.Core.Classes.CustomControls;

public partial class Core_Utilities_PatientChart : System.Web.UI.Page
{
    private static readonly string defaultChronListView = "LabTests";
    private string defaultLabValue = "PSA";
    private List<string> LabHasBadPoints = new List<string>();

    private DateTime? MinLabDate = null;
    private DateTime? MaxLabDate = null;

    /// <summary>
    /// Gets the chron list var name
    /// </summary>
    private static string LAB_TEST_VARNAME
    {
        get
        {
            string specialLabsTable = CaisisConfiguration.GetWebConfigValue("ExtendedLabsTable");
            return !string.IsNullOrEmpty(specialLabsTable) ? specialLabsTable : defaultChronListView;
        }
    }

    private SessionHandler sh;

    public Core_Utilities_PatientChart()
        : base()
    {
        // set session handler
        this.Init += (a, b) =>
            {
                sh = new SessionHandler(Session);
            };
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            PatientName.Text = sh.GetPatientName();
            DataTable labValues = GetLabs();
            if (labValues.Rows.Count > 0)
            {
                BuildLabSelectors(labValues);
                BuildChart(labValues);
            }
            else
            {
                MainChart.Visible = false;
                noLabsMsg.Visible = true;
                chartLegend.Visible = false;
                PrintButton.Visible = false;
            }
        }

        // chart embedded in other pages; remove header info if url variable exists
        if (!String.IsNullOrEmpty(Request.QueryString["showHeader"]) && Request.QueryString["showHeader"].Equals("false"))
        {
            HeaderInfo.Visible = false;
        }
    }

    protected void SetLabOnCheckChange(object sender, EventArgs e)
    {
        BuildLabs();
    }

    private DataTable GetLabs()
    {
        int patientId = sh.GetPatientId();

        ChronoDa da = new ChronoDa();
        DataTable labValues = da.GetChronoList(patientId, LAB_TEST_VARNAME, User.Identity.Name).Tables[0];

        labValues.Columns.Add("LabDate", System.Type.GetType("System.DateTime"));
        labValues.Columns.Add("LabResult", System.Type.GetType("System.Double"));

        if (labValues.Rows.Count > 0)
        {
            for (int i = 0; i < labValues.Rows.Count; i++)
            {
                DataRow row = labValues.Rows[i];

                DateTime d = new DateTime();
                if (DateTime.TryParse(row["varDate"].ToString(), out d))
                {
                    row["LabDate"] = d;

                    Double v = new Double();
                    if (Double.TryParse(row["varValue"].ToString(), out v))
                    {
                        row["LabResult"] = v;
                    }
                    else if (row["varValue"].ToString().StartsWith("<") && Double.TryParse(row["varValue"].ToString().Substring(1), out v))
                    {
                        row["LabResult"] = v;
                    }
                    else
                    {
                        if (!LabHasBadPoints.Contains(row["varName"].ToString())) LabHasBadPoints.Add(row["varName"].ToString());
                    }
                }
                else // remove rows without dates, can't be graphed
                {
                    if (!LabHasBadPoints.Contains(row["varName"].ToString())) LabHasBadPoints.Add(row["varName"].ToString());
                    labValues.Rows.Remove(labValues.Rows[i]);
                    i -= 1;
                }
        }


            labValues.Columns["varDate"].ColumnName = "varDateString";
            labValues.Columns["LabDate"].ColumnName = "varDate";

            labValues.Columns["varValue"].ColumnName = "varValueString";
            labValues.Columns["LabResult"].ColumnName = "varValue";
        }

        return labValues;
    }

    private void BuildLabs()
    {
        DataTable labValues = GetLabs();
        BuildChart(labValues);
        SetDateRange();
    }

    private void BuildLabSelectors(DataTable labs)
    {
        // get a distinct list of lab types sorting ascending
        var distinctLabs = (from row in labs.AsEnumerable()
                            let lab = row["VarName"].ToString()
                            where row["VarValue"].ToString().Length > 0
                            where row["VarDate"].ToString().Length > 0
                            orderby lab ascending
                            select lab).Distinct();
        LabCheckList.DataSource = distinctLabs;
        LabCheckList.DataBind();

        // set default lab value
        ListItem i = LabCheckList.Items.FindByText(defaultLabValue);
        if (i != null)
            i.Selected = true;

        LabCheckList2.DataSource = distinctLabs;
        LabCheckList2.DataBind();
        LabCheckList2.Items.Insert(0, new ListItem(String.Empty, String.Empty));

//        if (LabCheckList.SelectedValue.Length > 0) LabCheckList2.Items.Remove(LabCheckList.SelectedValue);


    }

    private void BuildChart(DataTable labs)
    {
        SessionHandler sh = new SessionHandler(Session);
        int patientId = sh.GetPatientId();

        // get a list of selected charting types
        var selectedLabs = from labItem in LabCheckList.Items.Cast<ListItem>()
                           where labItem.Selected
                           select labItem.Value;

        if (selectedLabs.Count() > 0)
        {

            LabCheckList2.Visible = true;

            if (LabCheckList2.SelectedValue.Length > 0)
            {
                selectedLabs = selectedLabs.Union
                    (from labItem in LabCheckList2.Items.Cast<ListItem>()
                     where labItem.Selected
                     select labItem.Value);


                MainChart.BuildChart(labs, selectedLabs);


                // if there are exactly two labs to chart, use right Y axis for second series
                if (MainChart.Series.Count.Equals(2))
                {
                    MainChart.ChartAreas[0].AxisY.Enabled = AxisEnabled.True;
                    MainChart.Series[0].YAxisType = AxisType.Primary;
                    MainChart.Series[0].XAxisType = AxisType.Primary;
                    MainChart.Series[0].XValueType = ChartValueType.DateTime;
//                    MainChart.ChartAreas[0].AxisY.LineColor = MainChart.Series[0].Color;
//                    MainChart.ChartAreas[0].AxisY.LineWidth = 2;
                    MainChart.ChartAreas[0].AxisY.TitleForeColor = MainChart.Series[0].Color;

                    MainChart.ChartAreas[0].AxisY2.Enabled = AxisEnabled.True;
                    MainChart.ChartAreas[0].AxisY2.MajorGrid.Enabled = false;
                    MainChart.Series[1].YAxisType = AxisType.Secondary;
                    MainChart.Series[1].XAxisType = AxisType.Primary;
                    MainChart.Series[1].XValueType = ChartValueType.DateTime;
 //                   MainChart.ChartAreas[0].AxisY2.LineColor = MainChart.Series[1].Color;
//                    MainChart.ChartAreas[0].AxisY2.LineWidth = 2;
//                    MainChart.ChartAreas[0].AxisY2.MajorTickMark.LineColor = MainChart.Series[1].Color;
                    MainChart.ChartAreas[0].AxisY2.Title = MainChart.Series[1].Name;
                    MainChart.ChartAreas[0].AxisY2.TextOrientation = TextOrientation.Rotated270;
                    MainChart.ChartAreas[0].AxisY2.TitleForeColor = MainChart.Series[1].Color;
//                    MainChart.ChartAreas[0].AxisY2.TitleFont = new Font(MainChart.ChartAreas[0].AxisY2.TitleFont, FontStyle.Bold);

                    MainChart.ChartAreas[0].AxisX.Minimum = (MainChart.Series[0].Points[0].XValue < MainChart.Series[1].Points[0].XValue) ? MainChart.Series[0].Points[0].XValue : MainChart.Series[1].Points[0].XValue;
                }

                MainChart.ChartAreas[0].AxisY.Title = MainChart.Series[0].Name;
                MainChart.ChartAreas[0].AxisY.TextOrientation = TextOrientation.Rotated90;
//                MainChart.ChartAreas[0].AxisY.TitleFont = new Font(MainChart.ChartAreas[0].AxisY.TitleFont, FontStyle.Bold);



            }
            else
            {
                MainChart.BuildChart(labs, selectedLabs);
            }


            SetMinMaxDates(labs, selectedLabs);


            
            // override default width
            if (!String.IsNullOrEmpty(Request.QueryString["width"]))
            {
                MainChart.Width = int.Parse(Request.QueryString["width"]);
            }

            // override default height
            if (!String.IsNullOrEmpty(Request.QueryString["height"]))
            {
                MainChart.Height = int.Parse(Request.QueryString["height"]);
            }

            chartErrors.Visible = false;
            chartErrors.InnerHtml = "";
            foreach (string selectedLab in selectedLabs)
            {
                if (LabHasBadPoints.Contains(selectedLab))
                {
                    chartErrors.Visible = true;
                    chartErrors.InnerHtml += ("One or more " + selectedLab + " values could not be graphed.<br/><br/>");
                }
            }


        }


    }

    protected void SetDateRange(Object sender, EventArgs e)
    {
        BuildLabs();
    }

    protected void SetDateRange()
    {
        DateTime d0 = new DateTime();
        DateTime? DateStart = null;

        string dateRangeError = "";

        if (!String.IsNullOrEmpty(DateRange_Start.Value))
        {
            if (DateTime.TryParse(DateRange_Start.Value, out d0))
            {
                //if (d0.ToOADate() <= MaxLabDateDouble) DateStart = d0;
                //else dateRangeError += "The start date entered is out of range.<br/><br/>";
                DateStart = d0;
            }
            else dateRangeError += "The start date entered is invalid.<br/><br/>";
        }


        DateTime d1 = new DateTime();
        DateTime? DateEnd = null;

        if (!String.IsNullOrEmpty(DateRange_End.Value))
        {
            if (DateTime.TryParse(DateRange_End.Value, out d1))
            {
                //if (d1.ToOADate() >= MinLabDateDouble) DateEnd = d1;
                //else dateRangeError += "The end date entered is out of range.<br/><br/>";
                DateEnd = d1;
            }
            else dateRangeError += "The end date entered is invalid.<br/><br/>";
        }

        if (DateStart != null && DateEnd != null && (DateStart > DateEnd)) dateRangeError += "The end date entered is before the start date.<br/><br/>";
        else
        {
            if (DateStart != null)
            {
                if (d0 <= MaxLabDate) MainChart.ChartAreas[0].AxisX.Minimum = d0.ToOADate();
                else dateRangeError += "The start date entered is out of range.<br/><br/>";
            }

            if (DateEnd != null)
            {
                if (d1 >= MinLabDate) MainChart.ChartAreas[0].AxisX.Maximum = d1.ToOADate();
                else dateRangeError += "The end date entered is out of range.";
            }

        }
        if (dateRangeError.Length > 0)
        {
            chartErrors.Visible = true;
            chartErrors.InnerHtml += dateRangeError;
        }


    }

    protected void SetMinMaxDates(DataTable allLabs, IEnumerable<string> selectedLabTypes)
    {
        var searchTypes = selectedLabTypes.Select(v => v.ToLower());

        var maxDate = (from lab in allLabs.AsEnumerable()
                        let labType = lab["VarName"].ToString().ToLower()
                        let labDate = lab["VarDate"]
                        where searchTypes.Contains(labType)
                        select lab["VarDate"])
                        .Max();

        var minDate = (from lab in allLabs.AsEnumerable()
                       let labType = lab["VarName"].ToString().ToLower()
                       let labDate = lab["VarDate"]
                       where searchTypes.Contains(labType)
                       select lab["VarDate"])
                       .Min();

        MinLabDate = (DateTime)minDate;
        MaxLabDate = (DateTime)maxDate;
    }



}
