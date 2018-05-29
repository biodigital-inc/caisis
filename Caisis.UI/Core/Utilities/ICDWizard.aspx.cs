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
using System.Text;


using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.UI.Core.Utilities
{
    public partial class ICDWizard : BasePage, ICallbackEventHandler
    {

        private string serverReturnString = "";
        ICDDa da = new ICDDa();

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!Page.IsPostBack)
            {
                DataTable dt = da.GetICDGroups();
                a.DataSource = dt.DefaultView;
                a.DataTextField = "CONCATFIELD";
                a.DataValueField = "ICDGroupId";
                a.DataBind();
                a.Items.Insert(0, new ListItem("---- SELECT GROUP -----")); // start with blank row
            }
            // Register callback init function
            RegisterAJAXScript();
        }

        /// <summary>
        /// Registers a js function for calling server with args
        /// </summary>
        private void RegisterAJAXScript()
        {
            ClientScriptManager cm = Page.ClientScript;
            String cbReference = cm.GetCallbackEventReference(this, "arg",
                "handleServerReturn", "");
            String callbackScript = "function CallServer(arg, context) {" +
                cbReference + "; }";
            cm.RegisterClientScriptBlock(this.GetType(),
                "CallServer", callbackScript, true);

        }

        /// <summary>
        /// Function gets called from client (i.e., callback)
        /// </summary>
        /// <param name="valueFromClient"></param>
        public void RaiseCallbackEvent(string valueFromClient)
        {
            string[] parsed = valueFromClient.Split(";".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
            
            if (parsed.Length == 2)
            {
                string type = parsed[0]; // type of query to run
                string key = parsed[1]; // pri key of field 'type' from client
                string displayColumn = "";
                string primaryKeyName = "";

                ICDDa da = new ICDDa();
                DataTable dt = new DataTable();
                
                if(type.ToLower().Equals("group"))
                {
                    dt = da.GetSubgroupsByGroupId(key);
                    primaryKeyName = "ICDSubGroupId";
                    displayColumn = "CONCATFIELD";
                }
                else if(type.ToLower().Equals("subgroup"))
                {
                    dt = da.GetICDCategoriesBySubGroupId(key);
                    primaryKeyName = "ICDCode";
                    displayColumn = "CONCATFIELD";
                }
                else if(type.ToLower().Equals("category"))
                {
                    dt = da.GetICDCodesByICDCategory(key);
                    primaryKeyName = "ICDCode";
                    displayColumn = "CONCATFIELD";
                    
                }
                
                // GetDataFromMySQl(paramers);
                // Set the return string to return liternal HTML content

                serverReturnString = this.GetOptionsString(dt, primaryKeyName, displayColumn);
            }
        }

        private string GetOptionsString(DataTable dt, string priKeyName, string displayNameField)
        {
            StringBuilder output = new StringBuilder();
            
            foreach (DataRow row in dt.Rows)
            {
                string priKey = row[priKeyName].ToString();
                string fieldName = row[displayNameField].ToString();

                string optText = fieldName.Trim(); // Here is where the text for the option is formatted
                optText = PageUtil.EscapeSingleQuotes(optText);
                string optValue = priKey.Trim();
                output.Append(optValue + ":" + optText + "|");
            }
            return output.ToString();
        }

       
        /// <summary>
        /// Gets the literal HTML string for the options to be inserted into drop  down
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="priKeyField">The primary key field of the dropdown being populate</param>
        /// <param name="displayNameField">The name field used for formatting option text</param>
        /// <returns></returns>
        /*private string GetOutputString(DataTable dt, string priKeyName, string displayNameField)
        {
            string output = "<option></option>";
            foreach (DataRow row in dt.Rows)
            {
                string priKey = row[priKeyName].ToString();
                string fieldName = row[displayNameField].ToString();

                string optText = fieldName; // Here is where the text for the option is formatted
                optText = PageUtil.EscapeSingleQuotes(optText);
                string optValue = priKey;
                output += "<option value='" + optValue + "'>" + optText + "</option>";
            }
            return output;
        }
        */

        /// <summary>
        /// String to return to client after processing the client's request, will be literal HTML
        /// </summary>
        /// <returns></returns>
        public string GetCallbackResult()
        {
            return serverReturnString;
        }

    }

}
