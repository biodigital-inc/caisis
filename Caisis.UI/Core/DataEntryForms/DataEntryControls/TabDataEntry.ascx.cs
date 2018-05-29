using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Extensions;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Core.DataEntry
{
    public partial class TabDataEntry : BasePatientDataControl
    {
        public event EventHandler MoreTabClick;

        private int seed = 0;
        private int activeTab = 0;
        private bool focusOnTab = false;
        private Dictionary<int, KeyValuePair<Control, Control>> tabLookup = new Dictionary<int, KeyValuePair<Control, Control>>();

        /// <summary>
        /// Returns a lookup of tab index -> (label, tab)
        /// </summary>
        public virtual IDictionary<int, KeyValuePair<Control, Control>> TabLookup
        {
            get
            {
                return tabLookup;
            }
        }

        /// <summary>
        /// Gets if there are tabs
        /// </summary>
        public virtual bool HasTabs
        {
            get
            {
                return tabLookup.Count > 0;
            }
        }

        /// <summary>
        /// Gets or sets the active tab index
        /// </summary>
        public virtual int ActiveTabIndex
        {
            get
            {
                return activeTab;
            }
            set
            {
                activeTab = Math.Max(0, Math.Min(value, tabLookup.Count - 1));
            }
        }

        /// <summary>
        /// Focus on the active tab
        /// </summary>
        public virtual bool ActiveTabFocused
        {
            get
            {
                return focusOnTab;
            }
            set {
                focusOnTab = value;
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (HasTabs)
            {
                // set inital tab unless initalized
                int targetTabIndex = activeTab < tabLookup.Count ? activeTab : 0;
                string script = "if(window.DATA_ENTRY_TABS == null || window.DATA_ENTRY_TABS['" + this.ClientID + "'] == null) { setActiveDataEntryTab('" + this.ClientID + "', " + targetTabIndex + ", " + ActiveTabFocused.ToString().ToLower() + "); }";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "setActiveDataEntryTab" + this.ClientID, script, true);
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            // only render with tabs or more
            bool doShow = HasTabs || MoreTabsItems.Visible;
            if (doShow)
            {
                base.Render(writer);
            }
        }

        /// <summary>
        /// Adds a tab
        /// </summary>
        /// <param name="title"></param>
        /// <param name="tab"></param>
        public virtual HtmlGenericControl AddTab(string title, Control tab)
        {
            int nextTabIndex = seed;
            // add header
            HtmlGenericControl label = AddTabTitle(title, nextTabIndex);
            // add tab content
            Control content = AddTabContent(tab, nextTabIndex);
            // add lookup
            tabLookup.Add(nextTabIndex, new KeyValuePair<Control, Control>(label, content));
            //increment
            seed++;

            return label;
        }

        /// <summary>
        /// Adds a tab under "More"
        /// </summary>
        /// <param name="title"></param>
        /// <param name="link"></param>
        public virtual void AddMoreTab(string title, string link)
        {
            // add more hyperlink item
            LinkButton moreTab = new LinkButton();
            moreTab.Text = title;
            AddMoreTab(moreTab);
        }

        /// <summary>
        /// Adds a tab under "More"
        /// </summary>
        /// <param name="moreLink"></param>
        public virtual void AddMoreTab(LinkButton moreLink)
        {
            // add more link
            MoreTabsItems.Controls.Add(moreLink);
            // invoke tab click event on click
            moreLink.Click += (a, e) =>
            {
                if (MoreTabClick != null)
                    MoreTabClick(a, e);
            };
            // turn on visibility
            MoreTabs.Visible = true;
        }

        public virtual void ClearMoreTabs()
        {
            // remove more items
            MoreTabsItems.Controls.Clear();
            // turn off visibility
            MoreTabs.Visible = false;
        }

        private HtmlGenericControl AddTabTitle(string title, int index)
        {
            HtmlGenericControl inner = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            inner.Attributes["class"] = "EditDataEntryForm_ChildTableTitleInnerContainer";
            HtmlGenericControl child = new System.Web.UI.HtmlControls.HtmlGenericControl("span");
            child.Attributes["class"] = "EditDataEntryForm_ChildTableTitle";

            child.InnerText = title;
            inner.Controls.Add(child);
            TabTitles.Controls.Add(inner);

            this.PreRender += (a, b) =>
            {
                inner.Attributes["id"] = this.ClientID + "_Link_" + index;
                child.Attributes["id"] = this.ClientID + "_Text_" + index;
                inner.Attributes["onclick"] = "setActiveDataEntryTab('" + this.ClientID + "', " + index + ", true, event);";
            };

            return child;
        }

        private Control AddTabContent(Control tab, int index)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl tabContent = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            // supress other tabs
            if (index != 0)
            {
                tabContent.Style.Add("display", "none");
            }
            //tabContent.Style["position"] = "relative";
            tabContent.Controls.Add(tab);
            TabContent.Controls.Add(tabContent);

            this.PreRender += (a, b) =>
            {
                tabContent.Attributes["id"] = this.ClientID + "_Tab_" + index;
            };

            return tabContent;
        }

        /// <summary>
        /// Gets the persisted tab index value during postbacks
        /// </summary>
        /// <returns></returns>
        public virtual int? GetPersistedTabIndex()
        {
            int? index = null;
            string formIndex = Request.Form[this.ClientID + "_Index"];
            if (!string.IsNullOrEmpty(formIndex))
            {
                if (PageUtil.IsInteger(formIndex))
                {
                    index = int.Parse(formIndex);
                }
            }
            return index;
        }
    }
}