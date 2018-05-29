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

using System.Xml;
using System.Linq;
using System.Xml.Linq;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class AdminEformComponentHolder : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            string componentPath = Request.QueryString["componentPath"];
            if (!string.IsNullOrEmpty(componentPath))
            {
                try
                {
                    LoadComponent(componentPath);
                }
                catch (Exception ex)
                {
                }
            }
        }


        /// <summary>
        /// Loads a component into the container Panel
        /// </summary>
        /// <param name="componentPath"></param>
        protected void LoadComponent(string componentPath)
        {
            componentPath = Server.UrlDecode(componentPath);
            Control componenet = Page.LoadControl(componentPath);
            if (componenet != null)
            {
                ComponentHolder.Controls.Add(componenet);

                // generate XML debug
                var eFormDebug = new XElement("EformComponent",
                            from eControl in PageUtil.GetCaisisInputControlsInContainer(componenet).OfType<IEformInputField>()
                            let table = eControl.Table
                            let recordId = eControl.RecordId
                            let parentRecordId = eControl.ParentRecordId
                            let depth = BOL.BusinessObjectFactory.CanBuildBusinessObject(table) ? BOL.BusinessObject.GetTableDepth(table) : int.MaxValue
                            group eControl by new { Table = table, RecordId = recordId, Depth = depth } into g
                            let sortOrder = !string.IsNullOrEmpty(g.Key.RecordId) ? int.Parse(g.Key.RecordId) : 0
                            orderby g.Key.Depth ascending, sortOrder ascending, g.Key.Table ascending
                            select new XElement(g.Key.Table,
                                       g.Key.RecordId != null ? new XAttribute("RecordId", g.Key.RecordId) : null,
                                       from e in g
                                       orderby e.Field ascending
                                       select new XElement(e.Field, string.Empty)));

                EFromXMLDebug.Text = eFormDebug.ToString();
            }
            else
            {
                EFromXMLDebug.Text = string.Empty;
            }
        }
    }

}