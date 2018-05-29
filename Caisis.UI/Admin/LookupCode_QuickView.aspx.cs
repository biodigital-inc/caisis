using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class LookupCode_QuickView : AdminBasePage
    {

        protected string QueryLkpField
        {
            get
            {
                return Request.QueryString["lkpFieldName"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!string.IsNullOrEmpty(QueryLkpField))
            {
                BuildLookupCodeList(QueryLkpField);
            }
        }

        /// <summary>
        /// Builds a list of lookup codes, optionally filtered by disease
        /// </summary>
        /// <param name="lkpFieldName"></param>
        private void BuildLookupCodeList(string lkpFieldName)
        {
            var lkpCodes = !string.IsNullOrEmpty(QueryDiseaseName) ? CacheManager.GetLookupCodeList(lkpFieldName, QueryDiseaseName) : CacheManager.GetLookupCodeList(lkpFieldName);
            LkpCodesRptr.DataSource = lkpCodes;
            LkpCodesRptr.DataBind();
        }
    }
}