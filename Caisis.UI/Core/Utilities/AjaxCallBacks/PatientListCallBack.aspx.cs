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

using Caisis.DataAccess;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities
{
    public partial class PatientListCallBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Request.Form["type"];
            string filterExpr = Request.Form["filter"];
            string[] menuFields = Request.Form["fields"].Split(new char[] { ',' });
            DataTable menuItems = GetFilteredPatientMenuItems(type, filterExpr);
            string output = PageUtil.DataTableToJSArray(menuItems, menuFields, true);
            Response.Write(output);
        }

        /// <summary>
        /// Returns a DataTable of filterd patient menu items
        /// </summary>
        /// <param name="filterType"></param>
        /// <param name="filterExpr"></param>
        /// <returns></returns>
        private DataTable GetFilteredPatientMenuItems(string filterType, string filterExpr)
        {
            DataTable results = new DataTable();
            switch (filterType)
            {
                case "Protocols":
                    if (string.IsNullOrEmpty(filterExpr) || filterExpr.ToLower() == "all")
                    {
                        results = new ProtocolDa().GetDistinctProtocols().Tables[0];
                    }
                    else
                    {
                        results = new ProtocolDa().GetDistinctProtocols(filterExpr).Tables[0];
                    }
                    break;
                case "Physicians":
                    if (string.IsNullOrEmpty(filterExpr) || filterExpr.ToLower() == "all")
                    {
                        results = new PhysicianDa().GetDistinctPhysicians().Tables[0];
                    }
                    else
                    {
                        results = new PhysicianDa().GetDistinctPhysicians(filterExpr).Tables[0];
                    }
                    break;
            }
            return results;
        }
    }
}
