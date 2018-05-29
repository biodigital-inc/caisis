using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

using Caisis.Security;

namespace Caisis.UI.Core.Eforms
{
    /// <summary>
    /// Summary description for EformSpit_Test.
    /// </summary>
    public partial class EformDebug : System.Web.UI.Page
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // Verify User Permission and Valid Eform Id
            string queryEformId = Request.QueryString["encEformId"];
            string queryEformName = Request.QueryString["encEformName"];
            if (PermissionManager.HasPermission(PermissionManager.EditSecurity))
            {
                XmlDocument xmlDoc = null;
                // load xml from db
                if (!string.IsNullOrEmpty(queryEformId))
                {
                    int eformId = int.Parse(Security.CustomCryptoHelper.Decrypt(queryEformId));
                    BOL.EForm biz = new Caisis.BOL.EForm();
                    biz.Get(eformId);
                    string eformXML = biz[BOL.EForm.EFormXML].ToString();
                    // attempt to load/parse xml into document
                    try
                    {
                        xmlDoc = new XmlDocument();
                        xmlDoc.LoadXml(eformXML);
                    }
                    catch
                    {
                        Response.Write(eformXML);
                    }
                }
                // load eform from file
                else if (!string.IsNullOrEmpty(queryEformName))
                {
                    string eformName = Security.CustomCryptoHelper.Decrypt(queryEformName);
                    xmlDoc = CaisisConfiguration.GetEFormsXmlByName(eformName);
                }
                // write if xml document exists
                if (xmlDoc != null && !string.IsNullOrEmpty(xmlDoc.InnerXml))
                {
                    Response.Clear();
                    // set header
                    Response.ContentType = "text/xml";
                    // write xml to response stream
                    xmlDoc.Save(Response.OutputStream);
                }

                // cleanup
                Response.Flush();
                Response.End();
            }
        }
    }
}
