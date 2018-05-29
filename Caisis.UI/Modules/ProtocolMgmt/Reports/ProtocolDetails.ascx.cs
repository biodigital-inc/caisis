using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using System.Xml;
using System.Xml.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class ProtocolDetails : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ExportSection(object sender, CommandEventArgs e)
        {
            string sectionName = e.CommandArgument.ToString();
            var table = this.FindControl(sectionName) as HtmlTable;
            // special case: all
            if (sectionName.Contains("Findings"))
            {
                ExportFindings(sectionName);
            }
            else if (table != null)
            {
                DataTable dt = new DataTable();
                // build columns
                int colCount = table.Rows[0].Cells.Count;
                for (int i = 0; i < colCount; i++)
                {
                    string colName = table.Rows[0].Cells[i].InnerText.Trim();
                    dt.Columns.Add(new DataColumn(colName));
                }

                for (int i = 1; i < table.Rows.Count; i++)
                {
                    DataRow newRow = dt.NewRow();
                    for (int j = 0; j < colCount; j++)
                    {
                        string colValue = table.Rows[i].Cells[j].InnerText.Trim();
                        newRow[j] = colValue;
                    }
                    dt.Rows.Add(newRow);
                }
                DataView dv = dt.DefaultView;
                Caisis.Controller.ExcelExporter.ExportToExcel(Page, dv, sectionName, sectionName + ".xls");
            }
        }

        private void ExportFindings(string tableName)
        {
            // get report
            int protocolId = int.Parse(ProtocolId.Value);
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataSet dataSource = ProtocolMgmtDa.GetProtocolReport(protocolId, datasetSql);
            // get findings
            var clinicalFindings = dataSource.Tables[7];

            // build normalzied output table based on seleted tox section
            List<HtmlTable> tables = new List<HtmlTable>();
            // special case: all findings
            bool useMisc = false;
            if (tableName == "AbnormalFindings")
            {
                useMisc = true;
                tables.AddRange(new HtmlTable[] {
                        AbnormalClinicalFindingsCardiac,
                        AbnormalClinicalFindingsGastrointestinal, 
                        AbnormalClinicalFindingsGeneral,
                        AbnormalClinicalFindingsPulmonary,
                        AbnormalLaboratoryFindings
                });
            }
            // otherwise: single findings section
            else
            {
                var table = this.FindControl(tableName) as HtmlTable;
                if (table != null)
                {
                    useMisc = false;
                    tables.Add(table);
                }
            }
            // validation
            if (tables.Count() > 0)
            {
                DataTable toxicitiesExportTable = NormalizeFindingsTable(clinicalFindings, tables, useMisc);
                DataView dv = toxicitiesExportTable.DefaultView;
                dv.Sort = "Event ASC";
                Caisis.Controller.ExcelExporter.ExportToExcel(Page, dv, tableName, tableName + ".xls");
            }
        }

        //private static object[][] ExtractTableValues(HtmlTable table)
        //{
        //    int rowCount = table.Rows.Count - 1;
        //    if (table.Rows.Count > 0)
        //    {
        //        int colCount = table.Rows[0].Cells.Count;
        //        object[][] rows = new object[rowCount][];
        //        for (int i = 1; i <= rowCount; i++)
        //        {
        //            object[] row = new object[colCount];
        //            for (int j = 0; j < colCount; j++)
        //            {
        //                string colValue = table.Rows[i].Cells[j].InnerText.Trim();
        //                row[j] = colValue;
        //            }
        //            rows[i - 1] = row;
        //        }
        //        return rows;
        //    }
        //    return new object[0][];
        //}

        public virtual void BuildReport(int protocolId, bool showPSAGraph)
        {
            Protocol protocol = new Protocol();
            protocol.Get(protocolId);

            ProtocolId.Value = protocolId.ToString();

            // set labels
            string protocolNum = protocol[Protocol.ProtocolNum].ToString();
            string protocolTitle = protocol[Protocol.ProtocolTitle].ToString();
            ProtocolNumLabel.Text = protocolNum;
            ProtocolTitleLabel.Text = protocolTitle;

            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            DataSet dataSource = ProtocolMgmtDa.GetProtocolReport(protocolId, datasetSql);

            var xDoc = new XDocument(new XDeclaration("1.0", "utf-8", "yes"),
                                new XElement("Tables",
                                    from table in dataSource.Tables.Cast<DataTable>()
                                    select new XElement(table.TableName,
                                        from row in table.AsEnumerable()
                                        select new XElement("Record",
                                        from column in table.Columns.Cast<DataColumn>()
                                        select new XElement(column.ColumnName.Replace(" ", ""), row[column].ToString())
                                        )
                                    )
                               )
                    );

            var age = dataSource.Tables[1];
            var gleason = dataSource.Tables[2];
            var ecog = dataSource.Tables[3];
            var sitesOfDisease = dataSource.Tables[4];
            var procedures = dataSource.Tables[5];
            var clinicalFindings = dataSource.Tables[7];
            var ctc = dataSource.Tables[8];


            int? minAge = null;
            if (!age.Rows[0].IsNull("MinAge"))
            {
                minAge = (int)age.Rows[0]["MinAge"];
            }
            int? maxAge = null;
            if (!age.Rows[0].IsNull("MaxAge"))
            {
                maxAge = (int)age.Rows[0]["MaxAge"];
            }
            int? meanAge = null;
            if (!age.Rows[0].IsNull("MeanAge"))
            {
                meanAge = (int)age.Rows[0]["MeanAge"];
            }

            // demographics
            int enrolledPatients = (int)dataSource.Tables[0].Rows[0][0];
            PatientsEnrolled.Text = enrolledPatients.ToString();
            TotalTreated.Text = dataSource.Tables[0].Rows[0][0].ToString();
            TotalFailed.Text = dataSource.Tables[0].Rows[0][2].ToString();
            MeanAge.Text = meanAge.HasValue ? meanAge + "" : "N/A";

            MinGleason.Text = gleason.Rows[0][0].ToString();
            MaxGleason.Text = gleason.Rows[0][1].ToString();
            MedianGleason.Text = gleason.Rows[0][2].ToString();

            ECOG1.Text = ecog.Rows[0][0].ToString();
            ECOG0.Text = ecog.Rows[0][1].ToString();

            // SITES OF DISEASE
            var sitesOfDiseaseNames = sitesOfDisease.Columns.Cast<DataColumn>().Select(c => c.ColumnName);
            var sitesOfDiseaseTables = sitesOfDisease.AsEnumerable();
            var sitesByPatient = from r in sitesOfDisease.AsEnumerable()
                                 let patientId = (int)r["PatientId"]
                                 group r by patientId into g
                                 select new
                                 {
                                     PatientId = g.Key,
                                     SitesOfDiseases = g.Select(s => s["SiteOfDisease"].ToString())
                                 };
            List<int> sitesOfDiseasesSum = new List<int>();
            for (int i = 1; i < SitesOfDiseases.Rows.Count - 1; i++)
            {
                var row = SitesOfDiseases.Rows[i];
                var siteTypeCell = row.Cells[0];
                var siteSumCell = row.Cells[1];
                // get the sum for that type
                IEnumerable<string> types = siteTypeCell.Attributes["title"].Split('|');
                var otherTypes = sitesOfDiseaseNames.Except(types);
                // Get number of patients with "only" specific site of disease
                if (types.Count() == 1)
                {
                    var patientsBySingleType = from p in sitesByPatient
                                               where p.SitesOfDiseases.Intersect(types).Count() == 1 && p.SitesOfDiseases.Intersect(otherTypes).Count() == 0
                                               select p;
                    int patientCount = patientsBySingleType.Count();
                    siteSumCell.InnerText = patientCount.ToString();
                    sitesOfDiseasesSum.Add(patientCount);
                }
                // Get number of patients with combination of disease
                else if (types.Count() > 1)
                {
                    // account for "viceral", i.e. Neck, Lung etc...
                    if (types.Contains("Visceral"))
                    {
                        var imgFindSites = CacheManager.GetLookupCodeList("ImgFindSite").AsEnumerable().Select(r => r["LkpCode"].ToString());
                        types = types.Concat(imgFindSites).Distinct();
                    }
                    var patientsByTypes = from p in sitesByPatient
                                          where p.SitesOfDiseases.Intersect(types).Count() == types.Count()
                                          select p;
                    int patientCount = patientsByTypes.Count();
                    siteSumCell.InnerText = patientCount.ToString();
                    sitesOfDiseasesSum.Add(patientCount);
                }
            }
            // set total sum
            //SitesOfDiseases.Rows[1].Cells[1].InnerText 
            SitesOfDiseasesTotal.Text = sitesOfDiseasesSum.Sum().ToString();


            // ctc
            //CTCLess5.Text = ctc.Rows[0][0].ToString();
            //CTC5More.Text = ctc.Rows[0][1].ToString();

            //// Prior Therapy
            //PriorProstatectomy.Text = dataSource.Tables[6].Rows[0]["Count"].ToString();
            //PriorRadiation.Text = dataSource.Tables[6].Rows[1]["Count"].ToString();
            //PriorSalvageRadiation.Text = dataSource.Tables[6].Rows[2]["Count"].ToString();
            //PriorHormonal.Text = dataSource.Tables[6].Rows[3]["Count"].ToString();
            //PriorChemotherapy.Text = dataSource.Tables[6].Rows[4]["Count"].ToString();
            //PriorImmunotherapy.Text = dataSource.Tables[6].Rows[5]["Count"].ToString();
            int priorTherapiesSum = 0;
            for (int i = 1; i < PriorTherayTable.Rows.Count; i++)
            {
                var row = PriorTherayTable.Rows[i];
                var procCell = row.Cells[0];
                var countCell = row.Cells[1];
                string table = procCell.Attributes["class"];
                string procName = procCell.Attributes["title"];
                var found = (from record in procedures.AsEnumerable()
                             where record["TableName"].ToString() == table
                             let rowProcedure = record["Procedure"].ToString()
                             where rowProcedure.Contains(procName)
                             select record).FirstOrDefault();
                if (found != null)
                {
                    int count = (int)found["Count"];
                    countCell.InnerText = count.ToString();
                    priorTherapiesSum += count;
                }
                else
                {
                    countCell.InnerText = (0).ToString();
                }
            }
            // TOTAL
            PriorTherapyTotal.Text = priorTherapiesSum.ToString();


            // findings (toxicities)
            //var tables = new HtmlTable[] { AbnormalClinicalFindingsCardiac, AbnormalClinicalFindingsGastrointestinal, AbnormalClinicalFindingsGeneral, AbnormalClinicalFindingsPulmonary, AbnormalLaboratoryFindings };
            // DataTable toxicitiesExportTable = NormalizeFindingsTable(clinicalFindings, tables);
            List<DataRow> miscFindings = new List<DataRow>();
            foreach (var table in new HtmlTable[] { AbnormalClinicalFindingsCardiac, AbnormalClinicalFindingsGastrointestinal, AbnormalClinicalFindingsGeneral, AbnormalClinicalFindingsPulmonary, AbnormalLaboratoryFindings })
            {
                miscFindings.AddRange(SetToxicitiesResults(table, clinicalFindings, enrolledPatients));
            }
            // build misc clinical findings
            if (miscFindings.Count() > 0)
            {
                var toxicities = from row in clinicalFindings.AsEnumerable().Except(miscFindings.Distinct())
                                 orderby row["ToxName"].ToString() ascending
                                 select row;
                foreach (var dataRow in toxicities)
                {
                    var row = new HtmlTableRow();
                    var toxCell = new HtmlTableCell();
                    toxCell.InnerHtml = dataRow[0].ToString();
                    row.Cells.Add(toxCell);
                    for (int i = 1; i < 5; i++)
                    {
                        var cell = new HtmlTableCell();
                        int gradeCount = (int)dataRow[i];
                        cell.InnerHtml = GetGradeDisplayValue(enrolledPatients, gradeCount);
                        row.Cells.Add(cell);
                    }
                    var sumCell = new HtmlTableCell();
                    int gradeSum = (int)dataRow[5];
                    sumCell.InnerHtml = GetGradeDisplayValue(enrolledPatients, gradeSum);
                    row.Cells.Add(sumCell);
                    AbnormalClinicalFindingsMisc.Rows.Add(row);
                }
            }

            // PSA Waterfall
            if (showPSAGraph)
            {
                PSAWaterfallChart.Visible = true;
                MaxPSADecline.Visible = true;

                try
                {
                    var psaPair = ProtocolMgmtDa.GetPSADeclineAndMaxChange(datasetSql, protocolId);
                    var psaDecline = psaPair.Key;
                    var maxPSADecline = psaPair.Value;
                    PSAWaterfallChart.BuildChart(psaDecline, "Percentage Change in PSA from Baseline to 24 Weeks");
                    MaxPSADecline.BuildChart(maxPSADecline, "Maximum PSA Declide on Study");

                    ChartError.Visible = false;
                    PSAWaterfallChart.Visible = true;
                    MaxPSADecline.Visible = true;
                }
                catch (Exception ex)
                {
                    ChartError.Visible = true;
                    PSAWaterfallChart.Visible = false;
                    MaxPSADecline.Visible = false;
                }
            }
            else
            {
                PSAWaterfallChart.Visible = false;
                MaxPSADecline.Visible = false;
            }
        }

        private IEnumerable<DataRow> SetToxicitiesResults(HtmlTable toxicitiesHtmlTable, DataTable dataSource, int enrolledPatients)
        {
            List<DataRow> miscToxicities = new List<DataRow>();
            var abnormalFindings = dataSource.AsEnumerable();
            for (int i = 1; i < toxicitiesHtmlTable.Rows.Count; i++)
            {
                var row = toxicitiesHtmlTable.Rows[i];
                var toxName = row.Cells[0].InnerText.Trim();
                var found = (from record in abnormalFindings
                             where record["ToxName"].ToString().Equals(toxName, StringComparison.OrdinalIgnoreCase)
                             select record).FirstOrDefault();
                if (found != null && !miscToxicities.Contains(found))
                {
                    miscToxicities.Add(found);
                }
                for (int j = 1; j < row.Cells.Count - 1; j++)
                {
                    var cell = row.Cells[j];
                    if (found != null)
                    {
                        int gradeCount = (int)found[j];
                        cell.InnerHtml = GetGradeDisplayValue(enrolledPatients, gradeCount);
                    }
                    else
                    {
                        cell.InnerHtml = GetGradeDisplayValue(enrolledPatients, 0);
                    }
                }
                var sumCell = row.Cells[row.Cells.Count - 1];
                if (found != null)
                {
                    int gradeSum = (int)found[row.Cells.Count - 1];
                    sumCell.InnerHtml = GetGradeDisplayValue(enrolledPatients, gradeSum);
                }
                else
                {
                    sumCell.InnerHtml = GetGradeDisplayValue(enrolledPatients, 0);
                }
            }


            return miscToxicities;
        }

        private DataTable NormalizeFindingsTable(DataTable sourceTable, IEnumerable<HtmlTable> tables, bool addMisc)
        {
            var source = sourceTable.AsEnumerable();
            DataTable normalized = new DataTable("Toxicities");
            var columns = new string[] { "Event", "Grade 1", "Grade 2", "Grade 3", "Grade 4", "Total # Of Events" };
            normalized.Columns.AddRange(columns.Select(c => new DataColumn(c)).ToArray());
            var toxNames = tables.SelectMany(t => t.Rows.Cast<HtmlTableRow>().Select(r => r.Cells[0].InnerText.Trim())).Distinct();
            var data = from tox in toxNames
                       join row in source on tox.ToLower() equals row[0].ToString().ToLower()
                       select new
                       {
                           Toxicity = tox,
                           DataRow = row
                       };
            var _toxicities = from tox in toxNames
                              join a in data on tox equals a.Toxicity into g
                              let d = g.FirstOrDefault()
                              select d != null ? d.DataRow.ItemArray : new object[] { tox, 0, 0, 0, 0, 0 };
            IEnumerable<object[]> _remainder = new List<object[]>();
            if (addMisc)
            {
                _remainder = source.Except(data.Select(d => d.DataRow)).Select(r => r.ItemArray);
            }
            foreach (var itemRow in _toxicities.Concat(_remainder))
                normalized.Rows.Add(itemRow);

            return normalized;
        }


        private string GetGradeDisplayValue(int enrolledCount, int gradeCount)
        {
            return gradeCount.ToString() + " <span class='boldText percentage'>(" + Percentage(enrolledCount, gradeCount) + "%)</span>";
        }

        private int Percentage(int total, int count)
        {
            double baseValue = total > 0 ? ((double)count / (double)total) : 0.0;
            return (int)(baseValue * 100.0);
        }
    }

}