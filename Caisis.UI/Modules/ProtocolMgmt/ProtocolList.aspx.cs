using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Caisis.DataAccess;
using Caisis.BOL;
using System.Collections.Specialized;

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class ProtocolList : ProtocolMgmtBasePage
    {
        /// <summary>
        /// Controls the size of each Protocol list during paging
        /// </summary>
        protected static readonly int PROTOCOL_LIST_PAGE_SIZE = 250;

        // List of columns which are searched upon in project list
        private static readonly string[] searchColumnsProtocol = new string[] { Protocol.ProtocolTitle, Protocol.ProtocolNum };
        private static readonly string[] searchColumnsSchema = new string[] { ProtocolSchema.ProtocolArmDescription };

        private string callbackSearchType;
        private string callbackSearchValue;
        private string callbackType;
        private string callbackSortCol;
        private string callbackStartIndex;
        private string callbackEndIndex;
        protected int recordCount;

        private bool restrictByUserOrganization = false;

        private DataTable dtSchemas = null;

        protected int PROTOCOL_COUNT;
        protected int PAGE_COUNT;
        protected int[] PAGES;
        protected int FIRST_PAGE_INDEX;
        protected int LAST_PAGE_INDEX;

        private int? _userId;

        private int? UserId
        {
            get
            {
                if (!_userId.HasValue)
                {
                    // special case for admin: no user filter for Admins
                    if (!restrictByUserOrganization || (UserType == ProtocolMgmtUsers.ProtocolAdmin && ShowAllProtocolCheck.Checked))
                    {
                        return null;
                    }
                    else
                    {
                        _userId = new Caisis.Controller.UserController().GetUserId();
                    }
                }
                return _userId;
            }
        }


        /// <summary>
        /// Returns if user is a Protocol Admin
        /// </summary>
        public bool IsUserAdmin
        {
            get
            {
                return base.UserType == ProtocolMgmtUsers.ProtocolAdmin;
            }
        }

        public ProtocolList()
            : base()
        {
            // set paging variables
            //this.Init += new EventHandler();
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            //base.Page_Load(sender, e);

            //if (!Page.IsPostBack)
            {
                InitPage(sender, e);
            }
        }

        protected void InitPage(object sender, EventArgs e)
        {
            // set restrict configuration
            var config = ProtocolMgmtUtil.GetProtocolConfigurationNode();
            restrictByUserOrganization = config != null && config.SelectSingleNode("configuration/RestrictByUserOrganization[text() = 'true' or text() = 'True']") != null;

            InitPagingVariables();

            AdminPanel.Visible = base.UserType == ProtocolMgmtUsers.ProtocolAdmin;
            if (AdminPanel.Visible)
            {
                ShowAllProtocolCheck.Visible = restrictByUserOrganization;
            }

            DataView protocolsList = LoadProtocols();
            recordCount = protocolsList.Count;

            // Bind projects to user's view
            BindProtocolList(protocolsList);

            // build paging
            BuildPaging();

            // Add scripts for dynamic postsback
            //RegisterProtocolSearchScript();
        }

        private String GetSortString(String SortColumn)
        {
            return HiddenSortColumn.Value + " " + HiddenSortOrder.Value;
        }

        /// <summary>
        /// Builds a list of paging buttons used for paging though Protocol List
        /// </summary>
        private void BuildPaging()
        {
            ProtocolPageRptr.DataSource = PAGES;
            ProtocolPageRptr.DataBind();
        }

        private DataView LoadProtocols()
        {
            DataView protocolsList = new DataView();
            // If filtering by user, determine which project a user belongs
            /*if (FilterByUser)
            {
                string uName = new Caisis.Security.SecurityController().GetUserName();
                UserDa uda = new UserDa();
                int uId = uda.GetUserId(uName);
                projectsList = ProtocolMgmtDa.GetAllProtocolsByUserId(uId).DefaultView;
            }
            // Else, user has access to all projects
            else*/
            {
                // load first page of records
                protocolsList = ProtocolMgmtDa.GetAllProtocols(FIRST_PAGE_INDEX, GetLastRecordIndexByPage(FIRST_PAGE_INDEX), Protocol.ProtocolNum, "ASC", UserId).DefaultView;
            }

            TrimColumn(protocolsList.Table, Protocol.ProtocolTitle);

            // Force default sort to earliest records first
            //protocolsList.Sort = SortString;

            return protocolsList;
        }

        /// <summary>
        /// Adjust Protocol Title by trimmig long values
        /// </summary>
        /// <param name="dtList"></param>
        /// <param name="columnName"></param>
        private void TrimColumn(DataTable dtList, string columnName)
        {
            foreach (DataRow row in dtList.Rows)
            {
                string title = row[columnName].ToString();
                if (title.Length > 60)
                {
                    string shortTitle = title.Substring(0, 60);
                    row[columnName] = string.Format("{0}...", shortTitle);
                }
            }
        }

        /// <summary>
        /// Binds the list of Protocols based on User's Permission
        /// </summary>
        /// <param name="dv"></param>
        private void BindProtocolList(DataView dv)
        {
            ProtocolsListRptr.DataSource = dv;
            ProtocolsListRptr.DataBind();
        }

        private void LoopSearchColumns(object sender, RepeaterItemEventArgs e, string[] searchColumns)
        {
            foreach (string colName in searchColumns)
            {
                Label labelField = e.Item.FindControl(colName + "Field") as Label;
                Label first = e.Item.FindControl(colName + "Pre") as Label;
                Label match = e.Item.FindControl(colName + "Match") as Label;
                Label pos = e.Item.FindControl(colName + "Post") as Label;
                string colValue = DataBinder.Eval(e.Item.DataItem, colName).ToString();

                // if labels exist for hilighting, color text
                if (first != null)
                {
                    int textFoundIndex = System.Globalization.CultureInfo.CurrentCulture.CompareInfo.IndexOf(colValue, callbackSearchValue, System.Globalization.CompareOptions.IgnoreCase);
                    if (textFoundIndex > -1)
                    {
                        int textFoundEndIndex = textFoundIndex + callbackSearchValue.Length;
                        first.Text = colValue.Substring(0, textFoundIndex);
                        match.Text = colValue.Substring(textFoundIndex, callbackSearchValue.Length);
                        pos.Text = colValue.Substring(textFoundEndIndex, colValue.Length - textFoundEndIndex);

                        // Hide standard label
                        labelField.Visible = false;
                    }
                    else
                    {
                        // Hide highlighted text labels
                        first.Visible = false;
                        match.Visible = false;
                        pos.Visible = false;
                    }
                }
            }
        }

        /// <summary>
        /// Hilight found text in search columns
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HilightFoundText(object sender, RepeaterItemEventArgs e)
        {
            // If invoked from callback, value is set
            if (!string.IsNullOrEmpty(callbackSearchValue))
            {
                // Search through each search columns and highlight if text found
                LoopSearchColumns(sender, e, searchColumnsProtocol);
            }
        }

        #region SEARCH CALLBACK METHODS

        /// <summary>
        /// 
        /// </summary>
        /// <param name="e"></param>
        protected void DoProtocolSearch(Caisis.UI.ClientScript.Ajax.CaisisAjaxEventArgs e)
        {
            callbackSearchType = e.ClientParams["SearchType"];
            callbackSearchValue = e.ClientParams["SearchValue"];
            callbackType = e.ClientParams["CallbackType"];
            callbackSortCol = e.ClientParams["CallbackSortCol"];
            callbackStartIndex = e.ClientParams["CallbackStartIndex"];
            callbackEndIndex = e.ClientParams["CallbackEndIndex"];

            e.ReturnValue = GetProtocolSearchTable();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private HtmlGenericControl GetProtocolSearchTable()
        {
            // Determine if need to filter by user id
            DataView protocolsList = new DataView();
            /*if (FilterByUser)
            {
                string uName = new Caisis.Security.SecurityController().GetUserName();
                UserDa uda = new UserDa();
                int uId = uda.GetUserId(uName);

                projectsList = ProtocolMgmtDa.ProtocolMgmtSearch((callbackSearchValue, searchColumns, uId).DefaultView;
            }
            else
            {*/
            CallBackVars callbackVars;
            callbackVars.SortString = callbackSortCol;
            callbackVars.Type = callbackType;
            callbackVars.Value = callbackSearchValue;



            if (String.IsNullOrEmpty(callbackVars.SortString))
                callbackVars.SortString = GetSortString(Protocol.ProtocolNum);

            string sortExpression = !string.IsNullOrEmpty(callbackSortCol) ? callbackSortCol : GetSortString(Protocol.ProtocolNum);

            // get sort column and sort direction
            string sortColumn = sortExpression.Replace(" DESC", "").Replace(" ASC", "");
            sortColumn = sortColumn == "SchemaCount" || Protocol.HasField("Protocols", sortColumn) ? sortColumn : Protocol.ProtocolNum;
            string sortDirection = sortExpression.Contains(" DESC") ? "DESC" : "ASC";

            // EXPLICIT Paging
            if (!string.IsNullOrEmpty(callbackStartIndex) && !string.IsNullOrEmpty(callbackEndIndex))
            {
                protocolsList = ProtocolMgmtDa.GetAllProtocols(int.Parse(callbackStartIndex), int.Parse(callbackEndIndex), sortColumn, sortDirection, UserId).DefaultView;
                //protocolsList.Sort = sortExpression;
            }
            else
            {
                // IMPLICIT Paging
                // when sorting empty list, go to first or last page
                if (callbackType == "Sort" && string.IsNullOrEmpty(callbackSearchValue))
                {
                    int pageSortStart;
                    int pageSortEnd;
                    // when sorting a pages list, go to first page when column ASC
                    if (sortExpression.EndsWith(" ASC", StringComparison.CurrentCultureIgnoreCase))
                    {
                        pageSortStart = FIRST_PAGE_INDEX;
                        pageSortEnd = GetLastRecordIndexByPage(FIRST_PAGE_INDEX);
                    }
                    // otherwise go to last page of results
                    else
                    {
                        int lastRecord = GetLastRecordIndex();
                        pageSortStart = lastRecord - PROTOCOL_LIST_PAGE_SIZE;
                        pageSortEnd = lastRecord;
                    }
                    protocolsList = ProtocolMgmtDa.GetAllProtocols(pageSortStart, pageSortEnd, sortColumn, sortDirection, UserId).DefaultView;
                }
                else
                {
                    protocolsList = ProtocolMgmtDa.ProtocolMgmtSearch(callbackVars, searchColumnsProtocol, searchColumnsSchema, sortColumn, sortDirection, UserId).DefaultView;
                }
                //}
            }

            // Bind list of Protocols to Build Table
            BindProtocolList(protocolsList);

            return ContentTableHolder;
        }

        #endregion

        /// <summary>
        /// Initalize paging related variables
        /// </summary>
        private void InitPagingVariables()
        {
            // set required variables
            PROTOCOL_COUNT = ProtocolMgmtDa.GetProtocolCount(UserId);
            if (PROTOCOL_COUNT > 0)
            {
                PAGE_COUNT = (int)Math.Ceiling((double)PROTOCOL_COUNT / (double)PROTOCOL_LIST_PAGE_SIZE);
                PAGES = new int[PAGE_COUNT];
                for (int i = 0; i < PAGE_COUNT; i++)
                {
                    PAGES[i] = i;
                }
                FIRST_PAGE_INDEX = PAGES[0];
                LAST_PAGE_INDEX = PAGES[PAGES.Length - 1];
            }
            else
            {
                PAGE_COUNT = 0;
                PAGES = new int[0];
                FIRST_PAGE_INDEX = 0;
                LAST_PAGE_INDEX = 0;
            }
        }

        /// <summary>
        /// Returns the last record index on a page
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <returns></returns>
        private int GetLastRecordIndexByPage(int startPageIndex)
        {
            int startPageRecord = startPageIndex + 1;
            return (startPageRecord * PROTOCOL_LIST_PAGE_SIZE) - 1;
        }

        /// <summary>
        /// Returns the last possible record by last record index of last page
        /// </summary>
        /// <returns></returns>
        private int GetLastRecordIndex()
        {
            return GetLastRecordIndexByPage(LAST_PAGE_INDEX);
        }

    }
}
