using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;

using Caisis.DataAccess;
using Caisis.DataAnalysis;

/// <summary>
/// Summary description for ClinicalDataAnalysis
/// </summary>

namespace Caisis.UI.Modules.Prostate.DataAnalysis
{
    using DAH = Caisis.DataAccess.DataAccessHelper;

    public class ClinicalDataAnalysis
    {
        string _path;

        public ClinicalDataAnalysis(string physicalApplicationPath)
        {
            _path = physicalApplicationPath;
        }

        public void Analyze()
        {
            PrepareInputCSV("z_cs_survey_types");
            PrepareInputCSV("z_cs_cleaned_clinical");
            PrepareInputCSV("z_cs_quarterly_surveys");
            
            RunAnalysis();

            UpdateFiles();
        }

        #region input
        // run queries (exported as CSVs) for clinical_data, qs, and survey types
        // z_cs_cleaned_clinical.csv
        // z_cs_quarterly_surveys.csv
        // z_cs_survey_types.csv

        private void PrepareInputCSV(string name)
        {
            PrepareInputCSV(name + ".sql", name + ".csv", true);
        }
       
        private void PrepareInputCSV(string sqlFilename, string outputFilename, bool useWarehouse)
        {
            string sql = LoadSQLFromFile(sqlFilename);

            using (SqlConnection conn = useWarehouse ? DAH.GetWarehouseConnection() : DAH.GetConnection())
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.CommandTimeout = 1800; // 30 mins
                cmd.CommandText = sql;

                if (conn.State != ConnectionState.Open)
                    conn.Open();

                //CSV.Write(GetEnumerator(cmd), outputFilename);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                CSV.Write(dt, _path + @"\App_Data\RData\" + outputFilename);
            }
        }

        private string LoadSQLFromFile(string sqlFile)
        {
            string fileSQL = string.Empty;
            if (!string.IsNullOrEmpty(sqlFile))
            {
                string path = _path + @"\App_Data\SQLFiles\" + sqlFile;
                // validate file exists
                if (System.IO.File.Exists(path))
                {
                    System.IO.FileInfo fi = new System.IO.FileInfo(path);
                    // validate of type sql file, and load text                    
                    if (fi.Extension.Equals(".sql", StringComparison.CurrentCultureIgnoreCase))
                    {
                        System.IO.StreamReader reader = fi.OpenText();
                        fileSQL = reader.ReadToEnd();
                        // cleanup
                        reader.Close();
                    }
                }
            }
            return fileSQL;
        }

        private IEnumerable<IDataRecord> GetEnumerator(SqlCommand c)
        {
            using (SqlDataReader r = c.ExecuteReader())
            {
                while (r.Read())
                    yield return r;
            }
        }
        #endregion 

        #region R
        // set working directory to App_Data/RData
        // run R wrapper script
        private void RunAnalysis()
        {
            string scriptname = "everything.r";
            string outfile = "rlog.txt";

            string stdout = Run(_path, scriptname, outfile);

            // email the output?
        }

        private string Run(string path, string scriptName, string outfile)
        {
            ProcessStartInfo psi = new ProcessStartInfo();

            psi.WorkingDirectory = path + @"\App_Data\RData";
            psi.FileName = path + @"\bin\R\bin\x64\Rterm.exe";
            psi.Arguments = string.Format("-f {0} --vanilla > {1}", scriptName, outfile);
            psi.UseShellExecute = false;
            psi.RedirectStandardOutput = true;
            psi.CreateNoWindow = true;

            Process p = Process.Start(psi);
            return p.StandardOutput.ReadToEnd();
        }
        #endregion

        #region output
        // backup existing output CSVs
        // Surgeon Rate Results.csv
        // Patient Model Results.csv
        // Restricted Cubic Spline Knots.csv
        // Imputation Model Results.csv

        private void UpdateFiles()
        {
            UpdateFile(_path, "Patient Model Results");
            UpdateFile(_path, "Restricted Cubic Spline Knots");
            UpdateFile(_path, "Imputation Model Results");
            UpdateFile(_path, "Surgeon Rate Results");
        }

        private void UpdateFile(string path, string name)
        {
            string rdata = path + @"\App_Data\Rdata";
            string[] files = Directory.GetFiles(rdata, name + "*.csv");

            // sort the files from newest to oldest
            Array.Sort(files, (x, y) => Directory.GetCreationTime(y).CompareTo(Directory.GetCreationTime(x)));

            File.Copy(files.First(), rdata + @"\" + name + ".csv");
        }
        #endregion
    }
}
