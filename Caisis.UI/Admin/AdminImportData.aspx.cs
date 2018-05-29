using System;
using System.Collections;
using System.Collections.Generic;
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
using System.IO;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    public partial class AdminImportData : AdminBasePage
    {
        private const string STATUS_COLUMN = "RecordStatus";

        private const string STATUS_UPDATED = "Updated";
        private const string STATUS_NOT_IMPORTED = "Not Imported";
        private const string STATUS_INSERTED = "Inserted";

        protected override void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                OnTableSelection(sender, e);
            }
        }

        protected void OnTableSelection(object sender, EventArgs e)
        {
            string selectedTable = TableSelection.SelectedValue;
            // determine selection panel
            foreach (ListItem item in TableSelection.Items)
            {
                string itemTable = item.Value;
                // set panel visibility
                Panel panel = FindControl(itemTable + "Panel") as Panel;
                if (panel != null)
                {
                    panel.Visible = itemTable == selectedTable;
                }
            }
            // set main panel
            MainImportContainer.Visible = !string.IsNullOrEmpty(selectedTable);
            // set labels
            SelectedTable.InnerText = "";
            SelectedFields.InnerText = "";
            if (!string.IsNullOrEmpty(selectedTable))
            {
                SelectedTable.InnerText = selectedTable;
                SelectedFields.InnerText = string.Join(", ", GetFieldNames(selectedTable));
            }
        }

        protected void UploadActionItems(object sender, CommandEventArgs e)
        {
            bool preview = e.CommandArgument.ToString() == "preview";
            UploadActionItems(preview);
        }

        protected void UploadPathTest(object sender, CommandEventArgs e)
        {
            bool preview = e.CommandArgument.ToString() == "preview";
            UploadPathTest(preview);
        }

        protected void SetGridViewState(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView drv = (DataRowView)e.Row.DataItem;
                string field = drv["RecordStatus"].ToString();
                string css = "";
                switch (field)
                {
                    case (STATUS_UPDATED):
                        css = "updated";
                        break;
                    case (STATUS_NOT_IMPORTED):
                        css = "not-impotred";
                        break;
                    case (STATUS_INSERTED):
                        css = "inserted";
                        break;
                    default:
                        break;
                }
                e.Row.CssClass = css;
            }
        }

        //export data to Excel
        protected void ExportToExcelClick(object sender, EventArgs e)
        {
            ExportReportToExcel();
        }

        private void ExportReportToExcel()
        {
            DataTable dt = (DataTable)Session["excelView"];
            DataView excelView = dt.DefaultView;

            if (excelView != null && excelView.Table.Rows.Count > 0)
            {
                string fileName = (string)Session["fileName"];
                Caisis.Controller.ExcelExporter.ExportToExcel(this, excelView, "PathTests Feed", fileName + "_Imported.xls");
            }
            else
            {
                AlertMessage("alertNoData");
            }
        }
        #region UPLOAD DATA

        private void UploadActionItems(bool preview)
        {
            if (ActionItemFileUpload.HasFile)
            {
                try
                {
                    if (GetFileExtensions(ActionItemFileUpload.PostedFile) == "csv")
                    {
                        UploadActionItemData(preview);
                    }
                    else
                    {
                        AlertMessage("alertError");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        private void UploadPathTest(bool preview)
        {
            if (FileUploadBtn.HasFile)
            {
                try
                {
                    if (GetFileExtensions(FileUploadBtn.PostedFile) == "csv")
                    {
                        UploadPathTestData(preview);
                    }
                    else
                    {
                        AlertMessage("alertError");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        private void UploadPathTestData(bool preview)
        {
            // get table from file
            DataTable tableData = GetFileAsDataTable(FileUploadBtn.PostedFile);
            // do import
            if (!preview)
            {
                HttpPostedFile uploadedFile = FileUploadBtn.PostedFile;
                string fileName = Path.GetFileNameWithoutExtension(Path.GetFileName(FileUploadBtn.PostedFile.FileName.ToString()));
                Session["fileName"] = fileName;

                // process each row
                foreach (DataRow row in tableData.Rows)
                {
                    //Create biz object
                    //IBusinessObject pTestbiz = Caisis.BOL.BusinessObjectFactory.BuildBusinessObject(fileName);
                    PathologyTest pTestbiz = new PathologyTest();
                    string pTestId = row[PathologyTest.PathTestId].ToString();

                    if (!string.IsNullOrEmpty(pTestId))
                    {
                        pTestbiz.Get(int.Parse(pTestId));
                        if (pTestbiz[PathologyTest.PathTest].ToString() == row[PathologyTest.PathTest].ToString() && (pTestbiz[PathologyTest.PathResult].ToString() != row[PathologyTest.PathResult].ToString() || pTestbiz[PathologyTest.PathNotes].ToString() != row[PathologyTest.PathNotes].ToString()))
                        {
                            //read column values
                            pTestbiz[PathologyTest.PathologyId] = int.Parse(row[PathologyTest.PathologyId].ToString());
                            pTestbiz[PathologyTest.PathTest] = row[PathologyTest.PathTest].ToString();
                            pTestbiz[PathologyTest.PathResult] = row[PathologyTest.PathResult].ToString();
                            pTestbiz[PathologyTest.PathNotes] = row[PathologyTest.PathNotes].ToString();
                            pTestbiz[PathologyTest.PathDataSource] = row[PathologyTest.PathDataSource].ToString();
                            pTestbiz[PathologyTest.PathQuality] = row[PathologyTest.PathQuality].ToString();

                            //update
                            pTestbiz.Save();

                            //capture record status
                            row[STATUS_COLUMN] = STATUS_UPDATED;
                        }
                        else
                        {
                            //capture record status
                            row[STATUS_COLUMN] = STATUS_NOT_IMPORTED;
                        }
                    }
                    else
                    {
                        //read column values
                        pTestbiz[PathologyTest.PathologyId] = int.Parse(row[PathologyTest.PathologyId].ToString());
                        pTestbiz[PathologyTest.PathTest] = row[PathologyTest.PathTest].ToString();
                        pTestbiz[PathologyTest.PathResult] = row[PathologyTest.PathResult].ToString();
                        pTestbiz[PathologyTest.PathNotes] = row[PathologyTest.PathNotes].ToString();
                        pTestbiz[PathologyTest.PathDataSource] = row[PathologyTest.PathDataSource].ToString();
                        pTestbiz[PathologyTest.PathQuality] = row[PathologyTest.PathQuality].ToString();

                        //insert
                        pTestbiz.Save();

                        //capture record status
                        row[STATUS_COLUMN] = STATUS_INSERTED;
                    }
                }

                //msg after data uploaded
                AlertMessage("alertSuccess");

                //for export to excel
                ExcelBtn.Visible = true;
                Session["excelView"] = tableData;
            }

            //bind data
            dataGrid.DataSource = tableData;
            dataGrid.DataBind();
        }

        private void UploadActionItemData(bool preview)
        {
            // read into .NET Data Table
            DataTable tableData = GetFileAsDataTable(ActionItemFileUpload.PostedFile);
            // do import
            if (!preview)
            {
                foreach (DataRow row in tableData.Rows)
                {
                    string status = STATUS_NOT_IMPORTED;

                    // validate patient
                    string mrn = row[BOL.Patient.PtMRN].ToString();
                    string pid = row[BOL.Patient.PatientId].ToString();
                    int? patientId = null;
                    if (!string.IsNullOrEmpty(pid))
                    {
                        patientId = int.Parse(pid);
                    }
                    bool validPatient = ValidatePatient(patientId, mrn, "");

                    // OK
                    if (validPatient && patientId.HasValue)
                    {
                        BOL.Action bizo = new BOL.Action();
                        // set patient id
                        bizo[BOL.Action.PatientId] = patientId.Value;
                        // set fields
                        bizo[BOL.Action.ActionDateText] = row[BOL.Action.ActionDateText];
                        bizo[BOL.Action.ActionDate] = row[BOL.Action.ActionDate];
                        bizo[BOL.Action.ActionItem] = row[BOL.Action.ActionItem];
                        bizo[BOL.Action.ActionNotes] = row[BOL.Action.ActionNotes];
                        // update
                        bizo.Save();
                        status = STATUS_INSERTED;
                    }

                    // set update status
                    row[STATUS_COLUMN] = status;
                }
            }
            // create a status column
            ActionItemPreview.DataSource = tableData;
            ActionItemPreview.DataBind();
        }

        #endregion

        #region UTILITIES

        private static DataTable GetFileAsDataTable(HttpPostedFile file)
        {
            if (file != null && file.InputStream != null)
            {
                StreamReader fileStream = new StreamReader(file.InputStream);
                DataTable table = Caisis.DataAnalysis.CSV.Read(fileStream);
                // create status column
                string statusColumn = "RecordStatus";
                table.Columns.Add(statusColumn, typeof(String));
                return table;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Validates if Patient exists against multiple fields
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="mrn"></param>
        /// <param name="lastName"></param>
        /// <returns></returns>
        private bool ValidatePatient(int? patientId, string mrn, string lastName)
        {
            Dictionary<string, object> validateFields = new Dictionary<string, object>();
            if (patientId.HasValue)
                validateFields.Add(Patient.PatientId, patientId);
            if (!string.IsNullOrEmpty(mrn))
                validateFields.Add(Patient.PtMRN, mrn);
            if (!string.IsNullOrEmpty(lastName))
                validateFields.Add(Patient.PtLastName, lastName);
            return BOL.BusinessObject.Exists<Patient>(validateFields);
        }

        private string[] GetFieldNames(string table)
        {
            return BOL.BusinessObject.GetFieldNames(table).Except(new string[] { 
                                                BusinessObject.EnteredBy, 
                                                BusinessObject.EnteredTime, 
                                                BusinessObject.UpdatedBy,
                                                BusinessObject.UpdatedTime,
                                                BusinessObject.LockedBy,
                                                BusinessObject.LockedTime}).ToArray();
        }

        private void AlertMessage(string type)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), type, type + "();", true);
        }

        private string GetFileExtensions(HttpPostedFile file)
        {
            return (file != null ? Path.GetExtension(file.FileName) : "").TrimStart('.').ToLower();
        }

        #endregion
    }
}