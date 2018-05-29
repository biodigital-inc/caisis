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
using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AddUnplannedEvent : ProtocolMgmtBaseControl
    {
        private bool showDropDown = true;
        private string onUpdateScript = "";

        /// <summary>
        /// Controls if the drop down list is shown
        /// </summary>
        public virtual bool ShowDropDown
        {
            get
            {
                return showDropDown;
            }
            set
            {
                showDropDown = value;
            }
        }

        public virtual string OnUpdateScript
        {
            get
            {
                return onUpdateScript;
            }
            set
            {
                onUpdateScript = value;
            }
        }

        /// <summary>
        /// Returns a url with relevent query string parameters appended
        /// </summary>
        /// <param name="baseURL"></param>
        /// <returns></returns>
        protected string GetQueryString(string baseURL)
        {
            string qs = "";
            if (Page is ProtocolMgmtPatientBasePage)
            {
                return (Page as ProtocolMgmtPatientBasePage).GetQueryString(baseURL);
            }
            else if (Page is ProtocolMgmtBasePage)
            {
                return (Page as ProtocolMgmtBasePage).GetQueryString(baseURL);
            }
            else
            {
                return baseURL;
            }
        }

        /// <summary>
        /// Returns a client string (single quotes escaped) representing the table title.
        /// </summary>
        /// <param name="table"></param>
        /// <param name="defaultTitle"></param>
        /// <returns></returns>
        protected string GetClientTableTitle(string table, string defaultTitle)
        {
            string tableLabel = BusinessObject.HasTableLabel(table) ? BusinessObject.GetTableLabel(table) : defaultTitle;
            return PageUtil.EscapeSingleQuotes(tableLabel);
        }

        protected override void OnPreRender(EventArgs e)
        {
            // set dropdown visibility
            AddUnplannedBtn.Visible = ShowDropDown;
            base.OnPreRender(e);
        }
    }
}
