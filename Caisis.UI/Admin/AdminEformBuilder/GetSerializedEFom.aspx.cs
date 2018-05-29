using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.UI.ClientScript.JSON;
using System.Xml;

namespace Caisis.UI.Admin
{
    public partial class GetSerializedEFom : AdminBasePage
    {
        private static readonly string OUTPUT_JSON = "json";
        private static readonly string OUTPUT_XML = "xml";
        private static readonly string DEFAULT_OUTPUT_TYPE = OUTPUT_XML;

        /// <summary>
        /// Gets the Output type of the EForm
        /// </summary>
        private string OutputType
        {
            get
            {
                string defaulOutputType = DEFAULT_OUTPUT_TYPE;
                string queryOutputType = Request.QueryString["type"];
                if (!string.IsNullOrEmpty(queryOutputType))
                {
                    if (queryOutputType == OUTPUT_JSON)
                    {
                        defaulOutputType = OUTPUT_JSON;
                    }
                    else if (queryOutputType == OUTPUT_XML)
                    {
                        defaulOutputType = OUTPUT_XML;
                    }
                }
                return defaulOutputType;

            }
        }

        /// <summary>
        /// The raw JSON formatted eform object
        /// </summary>
        private string JSONEForm
        {
            get
            {
                return Request.Form["eform"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            WriteEForm();
        }

        /// <summary>
        /// Writes the EForm to the Response
        /// </summary>
        private void WriteEForm()
        {
            Response.Clear();
            Eform eform = ObjectSerializer.InstanceFromJSON<Eform>(JSONEForm);
            if (OutputType == OUTPUT_JSON)
            {
                WriteJSON(eform);
            }
            else if (OutputType == OUTPUT_XML)
            {
                WriteXML(eform);
            }

            Response.End();
        }

        /// <summary>
        /// Writes the EForm as JSON text
        /// </summary>
        /// <param name="eform"></param>
        private void WriteJSON(Eform eform)
        {
            Response.ContentType = "text/plain";
            Response.Write(eform.ToJSON());
        }

        /// <summary>
        /// Writes the EForm as xml
        /// </summary>
        /// <param name="eform"></param>
        private void WriteXML(Eform eform)
        {
            Response.ContentType = "text/xml";
            eform.ToXml().Save(Response.OutputStream);
        }
    }

}