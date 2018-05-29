using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Caisis.UI.Core.DataAnalysis.Export
{
    public partial class ProstateDataExportListener : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["run"] == "true")
            {
                string tablename = Request.QueryString["export"] == "true" ? "RPT_ProstateDataExport" : "RPT_ProstateDataExport_Test";
                int rows = ExportToRemoteTable(tablename);
                Response.Write(string.Format("{0} rows inserted into {1}.<br/>", rows, tablename));
            }
            else
            {
                Response.Write("Hello.");
            }
            
            Response.End();
        }

        int ExportToRemoteTable(string destTablename)
        {
            string whConnStr = ConfigurationManager.AppSettings["warehouseConnectionstring"];

            // TODO: param for prostate or amplio
            // ACTION: export $algoclass data into $algoexport table -- expose via URL params
            Algorithm algorithm = new Algorithm(whConnStr);
            int rowsInserted = 0;

            // TODO: use a queue that we can pop from for memory efficiency
            Queue<DataRow> records = new Queue<DataRow>(algorithm.GenerateOutput());

            Response.Write(string.Format("{0} rows retrieved from the warehouse.<br/>", records.Count));
            Response.Flush();

            // build a DataTable based on column intersection
            using (SqlConnection conn = new SqlConnection(whConnStr))
            {
                conn.Open();

                // determine destination columns; only output field if column in destination
                string metasql =
                    @"SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, ORDINAL_POSITION
                    FROM INFORMATION_SCHEMA.COLUMNS
                    WHERE TABLE_NAME = @ExportTableName
                    ORDER BY ORDINAL_POSITION";

                SqlCommand metaCommand = new SqlCommand(metasql, conn);
                metaCommand.Parameters.Add(new SqlParameter("@ExportTableName", destTablename));

                DataTable exportTable = new DataTable();
                using (SqlDataReader reader = metaCommand.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string columnName = reader.GetString(0);
                        int columnLength;

                        if (!int.TryParse(reader.IsDBNull(2) ? "" : reader[2].ToString(), out columnLength))
                        {
                            columnLength = 255;
                        }

                        DataColumn c = new DataColumn(columnName, typeof(string));
                        c.MaxLength = columnLength;

                        exportTable.Columns.Add(c);
                    }
                }

                // "pour" queue into DT for memory efficiency
                while (records.Count > 0)
                {
                    DataRow sourceRecord = records.Dequeue();
                    DataRow exportRecord = exportTable.NewRow();

                    foreach (DataColumn c in exportTable.Columns)
                    {
                        string name = c.ColumnName;
                        if (!sourceRecord.IsNull(name))
                        {
                            string v = (string) sourceRecord[name];
                            if (string.IsNullOrEmpty(v))
                            {
                                continue;
                            }

                            string value = v.Length > c.MaxLength ? v.Substring(0, c.MaxLength) : v;
                            exportRecord[name] = v;
                        }
                        //else
                        //{
                        //    exportRecord[name] = sourceRecord[name];
                        //}
                    }

                    exportTable.Rows.Add(exportRecord);
                }

                records = null;

                Response.Write("Export table filled.<br/>");
                Response.Flush();

                SqlTransaction transaction = conn.BeginTransaction();

                try
                {
                    // delete old data
                    string deleteSql = string.Format("DELETE FROM {0};", destTablename);
                    SqlCommand delete = new SqlCommand(deleteSql, conn, transaction);
                    int deleted = delete.ExecuteNonQuery();

                    Response.Write(string.Format("{0} rows scheduled for deletion<br/>", deleted));

                    // bulk insert
                    SqlBulkCopy bulkCopy = new SqlBulkCopy(conn, SqlBulkCopyOptions.Default, transaction);
                    bulkCopy.DestinationTableName = destTablename;
                    bulkCopy.WriteToServer(exportTable);

                    transaction.Commit();

                    rowsInserted = exportTable.Rows.Count;
                    exportTable.Clear();
                }
                catch (Exception ex)
                {
                    Response.Write(string.Format("Bad things happened.<br/>{0}<br/>Transaction rolled back.<br/>", ex.Message));
                    transaction.Rollback();
                }
            }

            return rowsInserted;
        }

        SqlCommand BuildInsertCommand(SqlConnection conn, SqlTransaction transaction, string tablename, 
            Dictionary<string, int?> outputColumns)
        {
            string[] fields = outputColumns.Keys.ToArray();
            
            string sql =
                string.Format("INSERT INTO {0} ({1}) VALUES ({2});",
                    tablename,
                    string.Join(", ", fields),
                    string.Join(", ", fields.Select(f => "@" + f).ToArray())
                );

            return new SqlCommand(sql, conn, transaction);
        }

        Dictionary<string, int?> InitOutputColumns(Dictionary<string, int?> destinationColumns, DataRow row)
        {
            // return intersection of destination columns and row columns
            Dictionary<string, int?> outputColumns = new Dictionary<string, int?>();

            var rowcols = row.Table.Columns.Cast<DataColumn>().Select(c => c.ColumnName);
            foreach (string k in destinationColumns.Keys.Intersect(rowcols))
            {
                outputColumns[k] = destinationColumns[k];
            }

            return outputColumns;
        }
    }
}
