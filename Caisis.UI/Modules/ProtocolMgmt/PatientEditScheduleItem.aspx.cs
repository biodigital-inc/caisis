using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Specialized;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.Extensions;
using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Controller;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientEditScheduleItem : ProtocolMgmtBasePage
    {
        private static readonly int PAGE_SIZE = 20;

        private List<int> updateRowsIndexes = new List<int>();

        ProtocolMgmtVisitServices service;
        PatientDataEntryController pdec = new PatientDataEntryController(PatientDataEntryController.DEFAULT_METADATA_KEY);

        private int? PatientItemId
        {
            get
            {
                string id = Request.QueryString["patientItemId"];
                if (!string.IsNullOrEmpty(id))
                    return int.Parse(id);
                else
                    return null;
            }
        }

        private DateTime? DateStart
        {
            get
            {
                string date = Request.QueryString["dateStart"];
                if (!string.IsNullOrEmpty(date))
                    return DateTime.Parse(date);
                else
                    return null;
            }
        }

        private DateTime? DateEnd
        {
            get
            {
                string date = Request.QueryString["dateEnd"];
                if (!string.IsNullOrEmpty(date))
                    return DateTime.Parse(date);
                else
                    return null; ;
            }
        }

        private bool RestrictData
        {
            get
            {
                string restrict = Request.QueryString["restrict"];
                if (!string.IsNullOrEmpty(restrict))
                    return bool.Parse(restrict);
                else
                    return true; ;
            }
        }

        private int PageNumber
        {
            get
            {
                string page = Request.QueryString["page"];
                if (!string.IsNullOrEmpty(page))
                    return int.Parse(page);
                return 1;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (PatientItemId.HasValue)
                service = new ProtocolMgmtVisitServices(PatientItemId.Value, DateStart, DateEnd, RestrictData);
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // init filters
                patientItemId.Value = string.Format("{0}", PatientItemId);
                dateStart.Value = string.Format("{0:d}", DateStart);
                dateEnd.Value = string.Format("{0:d}", DateEnd);
                restrict.Checked = RestrictData;

                if (PatientItemId.HasValue)
                {
                    BuildPatientItem(PatientItemId.Value);
                    BuildTableData(PatientItemId.Value);
                }
            }
            // allow special filters for admins
            bool isProtocolAdmin =  UserType == ProtocolMgmtUsers.ProtocolAdmin;
            AdminPanel.Visible = isProtocolAdmin;
            ToggleSelection.Visible = isProtocolAdmin;
        }

        protected void UpdateAdminFilters(object sender, EventArgs e)
        {
            Dictionary<string, string> urlParams = new Dictionary<string, string>
            {
                { "patientItemId", patientItemId.Value},
                { "dateStart", dateStart.Value},
                { "dateEnd", dateEnd.Value},
                { "restrict", restrict.Checked.ToString().ToLower() }
            };
            string url = "PatientEditScheduleItem.aspx?" + PageUtil.CreateUrlPairs(urlParams);
            Response.Redirect(url, true);
        }

        protected void UpdateItemClick(object sender, EventArgs e)
        {
            if (PatientItemId.HasValue)
            {
                PatientItem patientItem = new PatientItem();
                patientItem.Get(PatientItemId.Value);
                CICHelper.SetBOValues(PatientItemFields.Controls, patientItem, -1);
                patientItem.Save();
                RegisterUpdateScript(true);
            }
        }

        protected void UpdateClick(object sender, EventArgs e)
        {
            Dictionary<string, List<int>> addTable = new Dictionary<string, List<int>>();
            Dictionary<string, List<int>> removeTable = new Dictionary<string, List<int>>();
            foreach (int index in updateRowsIndexes)
            {
                GridViewRow row = TableValues.Rows[index];
                var keys = TableValues.DataKeys[index];
                string tableName = keys["TableName"].ToString();
                string tablePriKeyName = BOL.BusinessObject.GetPrimaryKeyName(tableName);
                int tablePriKey = int.Parse(keys[tablePriKeyName].ToString());
                CheckBox check = row.FindControl("CheckBox") as CheckBox;
                // add or remove
                Dictionary<string, List<int>> table = check.Checked ? addTable : removeTable;
                table.Adjoin(tableName, new List<int>());
                var tableKeys = table[tableName];
                tableKeys.Add(tablePriKey);
            }

            string username = new SecurityController().GetUserName();
            int patientItemId = PatientItemId.Value;

            if (removeTable.Count() > 0)
                service.RemoveRecordsFromVisit(username, removeTable.ToDictionary(a => a.Key, b => b.Value.AsEnumerable<int>()));
            if (addTable.Count() > 0)
                service.AddRecordsToVisit(username, addTable.ToDictionary(a => a.Key, b => b.Value.AsEnumerable<int>()));

            // notify parent page
            bool updated = addTable.Keys.Count > 0 || removeTable.Count > 0;
            RegisterUpdateScript(updated);

            // refresh data
            service.RefreshVisits();
            BuildTableData(PatientItemId.Value);
        }

        protected void CleanupClick(object sender, EventArgs e)
        {
            string username = new SecurityController().GetUserName();
            service.RemoveAllRecordsFromVisit(username);
        }

        protected void MarkUpdateRow(object sender, EventArgs e)
        {
            int rowIndex = ((sender as Control).NamingContainer as GridViewRow).RowIndex;
            if (!updateRowsIndexes.Contains(rowIndex))
                updateRowsIndexes.Add(rowIndex);
        }

        private void BuildPatientItem(int patientItemId)
        {
            PatientItem patientItem = new PatientItem();
            patientItem.Get(patientItemId);
            var inputs = CICHelper.GetCaisisInputControls(PatientItemFields);
            foreach (var input in inputs)
                input.Value = string.Format(input.Field.EndsWith("Date") ? "{0:d}" : "{0}", patientItem[input.Field]);
        }

        private void BuildTableData(int patientItemId)
        {
            string tableName = service.GetTableName();
            string tablePriKeyName = service.GetPriKeyName();
            IEnumerable<string> display_fields = service.GetFieldNames();
            DataView view = new DataView();

            int pageNum = PageNumber;
            int start_row_num = GetStart(pageNum);
            int end_row_num = GetEnd(pageNum);

            // build pager
            //int count = service.GetVisitRelatedRecordsCount();
            //BuildPages(count);

            DataTable table = service.GetVisitRelatedRecords(start_row_num, end_row_num);

            // clear columns, except special columns
            while (TableValues.Columns.Count > 1)
                TableValues.Columns.RemoveAt(1);

            //string[] display_columns = new string[] { "TableName" }.Concat(display_fields).Distinct().ToArray();
            // get display fields, flatted date fields
            string[] display_columns = display_fields.Except(from field in display_fields
                                                             where field.EndsWith("DateText") || field.EndsWith("Source") || field.EndsWith("Quality")
                                                             select field).ToArray();

            // add table value fields
            for (int i = 0; i < display_columns.Length; i++)
            {
                string fieldName = display_columns[i];
                BoundField bf = new BoundField();
                bf.DataField = fieldName;
                bf.HeaderText = fieldName == "TableName" ? "Table" : pdec.GetFieldLabel(tableName, fieldName);
                if (fieldName.EndsWith("Date"))
                    bf.DataFormatString = "{0:d}";
                TableValues.Columns.Add(bf);
            }

            updateRowsIndexes.Clear();

            view = table.DefaultView;

            // build header 
            TableHeaderRptr.DataSource = TableValues.Columns.Cast<DataControlField>().Select(c => c.HeaderText).ToArray();
            TableHeaderRptr.DataBind();

            // build data
            TableValues.DataKeyNames = new string[] { "TableName", tablePriKeyName };
            TableValues.DataSource = view;
            TableValues.DataBind();

            RecordCount.Text = view.Count + " Record(s)";

            if (view.Count == 0)
            {
                Message.Text = "There are no " + (!string.IsNullOrEmpty(tableName) ? pdec.GetTableLabel(tableName) : "") + " records for this Patient.";
                Message.Visible = true;
                TableHeaderRptr.Visible = false;
                TableValues.Visible = false;
                UpdateBtn.Visible = false;
            }
            else
            {
                Message.Visible = false;
                TableHeaderRptr.Visible = true;
                TableValues.Visible = true;
                UpdateBtn.Visible = true;
            }
        }

        private void BuildPages(int count)
        {
            int activePageNumber = PageNumber;
            int pageCount = count < 2 ? 1 : ((count / PAGE_SIZE) + (count % PAGE_SIZE == 0 ? 0 : 1));
            int[] pages = new int[pageCount];
            for (int i = 0; i < pageCount; i++)
                pages[i] = i + 1;
            string pid = PatientItemId + "";
            var pageData = from pageNum in pages
                           select new
                           {
                               Number = pageNum,
                               Start = GetStart(pageNum),
                               End = GetEnd(pageNum),
                               URL = string.Format("?patientItemId={0}&page={1}", pid, pageNum),
                               Active = pageNum == activePageNumber
                           };
            PagesRptr.DataSource = pageData;
            PagesRptr.DataBind();
        }

        private int GetStart(int pageNum)
        {
            return ((pageNum - 1) * PAGE_SIZE) + 1;
        }

        private int GetEnd(int pageNum)
        {
            return pageNum * PAGE_SIZE;
        }

        private void RegisterUpdateScript(bool updated)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "updateParent", "if(parent.onPatientLinkUpdated) { parent.onPatientLinkUpdated(" + updated.ToString().ToLower() + "); }", true);
        }
    }
}