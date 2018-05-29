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

using Caisis.BOL;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminSchema : ProtocolMgmtBaseAdminPage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

        }

        /// <summary>
        /// Optinal tab to load passed in query string
        /// </summary>
        protected string QueryTab
        {
            get
            {
                return Request.QueryString["tab"];
            }
        }

        protected bool HasSchemaBeenAdded
        {
            get
            {
                bool hasSchemaBeenAdded = !string.IsNullOrEmpty(BaseSchemaId) && !BaseSchemaId.Equals("-1");
                return hasSchemaBeenAdded;
            }
        }

        protected bool HasSchemaItems
        {
            get
            {
                bool hasSchemas = false;
                if (!string.IsNullOrEmpty(BaseSchemaId))
                {
					//SchemaItem items = new SchemaItem();
					//items.GetByParent(int.Parse(BaseSchemaId));
					//hasSchemas = items.RecordCount > 0;

					var c = new Dictionary<string, object>() { { "ProtocolSchemaId", int.Parse(BaseSchemaId) } };
					hasSchemas = BusinessObject.Exists<SchemaItem>(c);
                }
                return hasSchemas;
            }
        }

        protected string GetQueryStringWithVersion(string url)
        {
            string addVersionAttr = GetQueryString(url);
            addVersionAttr += "&prvr=" + Request["prvr"];

            return addVersionAttr;
        }
    }

}