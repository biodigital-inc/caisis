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


using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{

    /// <summary>
    /// Handles refreshing of various application cached items
    /// </summary>
    public partial class AdminResetCacheItem : AdminBasePage
    {
        protected string cacheItem;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            // Check item and reset
            cacheItem = Request.QueryString["item"];
            CacheTitle.Text = cacheItem;
        }

        /// <summary>
        /// Reset lookup code cache
        /// </summary>
        private void ResetLookupCache()
        {
            CacheManager.ResetLookupCodeCache();
        }

        /// <summary>
        /// Refresh main application cache
        /// </summary>
        private void RefreshApplicationCache()
        {
            CacheManager.RefreshApplicationCache();
			RefreshBusinessObjects();
        }

		private void RefreshBusinessObjects()
		{
			Caisis.BOL.BusinessObject.RefreshTableMetadataFromDatabase();
			Caisis.BOL.BusinessObject.RefreshFieldMetadataFromDatabase();
		}

        /// <summary>
        /// Handles refresh btn click to refresh item based on query string
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RefreshCacheItem(object sender, CommandEventArgs e)
        {
            if (!string.IsNullOrEmpty(cacheItem))
            {
                bool refreshed = false;
                switch (cacheItem)
                {
                    case "LookupCodes":
                        ResetLookupCache();
                        refreshed = true;
                        break;
                    case "Application":
                        RefreshApplicationCache();
                        refreshed = true;
                        break;
                }
                if (refreshed)
                {
                    Message.InnerText = "The " + cacheItem + " cache has been refreshed.";
                }
            }
        }
    }
}