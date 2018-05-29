using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    public partial class ListFilter_Control : System.Web.UI.UserControl
    {
        public readonly string DEFAULT_SEARCH_MESSAGE = "type to search/filter...";

        public event EventHandler DoClientSearch;

        private string listId;
        private bool liveSeach = true;

        public virtual string Value
        {
            get
            {
                return FilterTextBox.Text;
            }
            set
            {
                FilterTextBox.Text = value;
            }
        }

        public virtual string ListId
        {
            get
            {
                return listId;
            }
            set
            {
                listId = value;
            }
        }

        /// <summary>
        /// Gets or sets if search is live (i.e., filtered client side)
        /// </summary>
        public virtual bool LiveSearch
        {
            get
            {
                return liveSeach;
            }
            set
            {
                liveSeach = value;
            }
        }

        /// <summary>
        /// Gets or sets the search box's text
        /// </summary>
        public virtual string TextValue
        {
            get
            {
                return !FilterTextBox.Text.Equals(DEFAULT_SEARCH_MESSAGE) ? FilterTextBox.Text : string.Empty;
            }
            set
            {
                FilterTextBox.Text = value;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (!Page.IsPostBack)
                FilterTextBox.Text = DEFAULT_SEARCH_MESSAGE;
            PageUtil.RegitserControlPostBackScript(FilterTextBox, "doClientSearchPostback");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void InvokeClientSearch(object sender, EventArgs e)
        {
            if (DoClientSearch != null)
            {
                DoClientSearch(sender, e);
            }
        }
    }
}