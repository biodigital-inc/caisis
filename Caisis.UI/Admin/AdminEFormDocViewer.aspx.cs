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

namespace Caisis.UI.Admin
{
    public partial class AdminEFormDocViewer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string docType = Request.QueryString["docType"];
            string eFormId = Request.QueryString["eFormId"];
            if (!string.IsNullOrEmpty(eFormId))
            {
                int id = int.Parse(eFormId);
                if (!string.IsNullOrEmpty(docType))
                {
                    docType = docType == "xml" ? "text/xml" : "text/html";
                }
                else
                {
                    docType = "text/html";
                }
                Response.ContentType = docType;
                EForm biz = new EForm();
                biz.Get(id);
                if (docType == "text/xml")
                {
                    Response.Write(biz[EForm.EFormXML]);
                }
                else
                {
                    object s = biz[EForm.EFormReport];
                    if (s != null)
                    {
                        if (s.ToString() != "" && s != DBNull.Value)
                        {
                            Response.Write(biz[EForm.EFormReport]);
                        }
                    }
                    else
                    {
                        Response.Write("<html><head></head><body></body></html>");
                    }
                }
            }
            else
            {
                Response.Write("<html><head></head><body></body></html>");
            }
        }
    }
}
