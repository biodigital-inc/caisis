using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Caisis.UI.ClientScript.Ajax
{

    /// <summary>
    /// 
    /// </summary>
    public class CaisisAjaxEventArgs
    {
        private NameValueCollection _clientParams;
        private NameValueCollection _returnParams;
        private string _clientParam = string.Empty;
        private object _returnValue = string.Empty;

        /// <summary>
        /// Returns the raw string argument passed from the Client
        /// </summary>
        public string ClientParam
        {
            get
            {
                return _clientParam;
            }
        }

        /// <summary>
        /// A NameValue parsed from ClientParam
        /// </summary>
        public NameValueCollection ClientParams
        {
            get
            {
                return _clientParams;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        public NameValueCollection ReturnParams
        {
            get
            {
                return _returnParams;
            }
        }

        /// <summary>
        /// The object to return to the client
        /// </summary>
        public object ReturnValue
        {
            get
            {
                return _returnValue;
            }
            set
            {
                _returnValue = value;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="parseableQueryString"></param>
        public CaisisAjaxEventArgs(string parseableQueryString)
            : base()
        {
            _clientParam = parseableQueryString;
            _clientParams = HttpUtility.ParseQueryString(parseableQueryString);

            // Default
            _returnParams = new NameValueCollection();
            _returnValue = string.Empty;
        }
    }

    public interface ICaisisCallbackEventHandler
    {
        CaisisAjaxEventArgs ClientArgs
        {
            get;
        }

        void ProcessCallback(CaisisAjaxEventArgs e);
    }

    /// <summary>
    /// Represents a method used for Processing client messages
    /// </summary>
    /// <param name="e"></param>
    public delegate void ProcessAjaxCallbackHandler(CaisisAjaxEventArgs e);

    /// <summary>
    /// Simple NON-UI Control for initiating callback
    /// </summary>
    public class CaisisAjaxHelper : Control, ICallbackEventHandler
    {
        /// <summary>
        /// The default name of the script used to initiate a server callback
        /// </summary>
        private static readonly string DEFAULT_DOCALLBACK_KEY = "doCaisisCallback";

        /// <summary>
        /// The default name of the script which is invoked when server call returns
        /// </summary>
        private static readonly string DEFAULT_ONCALLBACK_KEY = "onCaisisCallback";

        /// <summary>
        /// The name of the hashtable key for getting the raw return paramters
        /// </summary>
        private static readonly string CLIENT_RETURN_VALUE_KEY = "returnValue";

        private string _rawCallbackArg = "";
        private string _doCallbackScript = "";
        private string _onCallbackScript = "";
        private string _defaultReturnValue = "";
        private bool asynchronous = true;
        private bool enabled = true;

        /// <summary>
        /// Gets or sets the name of the callback script used for invoking server call
        /// </summary>
        public string DoCallbackScript
        {
            get
            {
                return _doCallbackScript;
            }
            set
            {
                _doCallbackScript = value;
            }
        }

        /// <summary>
        /// Gets or sets the name of the callback script which receives server messages
        /// </summary>
        public string OnCallbackScript
        {
            get
            {
                return _onCallbackScript;
            }
            set
            {
                _onCallbackScript = value;
            }
        }

        /// <summary>
        /// Gets or sets the default return value if no value is explicitly return.
        /// </summary>
        public string DefaultReturnValue
        {
            get
            {
                return _defaultReturnValue;
            }

            set
            {
                _defaultReturnValue = value;
            }
        }

        /// <summary>
        /// Gets or sets if the callback happens asynchronously (i.e., non blocking)
        /// </summary>
        public bool Asynchronous
        {
            get
            {
                return asynchronous;
            }
            set
            {
                asynchronous = value;
            }
        }

        /// <summary>
        /// Gets or sets whether contorl is enabled (scripts rendered and callback handled)
        /// or disabled (no scripts are register and no callback initatied)
        /// </summary>
        public bool Enabled
        {
            get
            {
                return enabled;
            }
            set
            {
                enabled = value;
            }
        }

        /// <summary>
        /// Public event for processing client messages and returning
        /// </summary>
        public event ProcessAjaxCallbackHandler ProcessCallback;

        /// <summary>
        /// 
        /// </summary>
        public CaisisAjaxHelper()
        {
            // Register callback script
            this.PreRender += new EventHandler(delegate(object sender, EventArgs args) { RegisterCallbackScript(); });
        }

        /// <summary>
        /// Registers a client function at runtime used to initiate callback to server
        /// </summary>
        private void RegisterCallbackScript()
        {
            // registers a startup script used to initiate callback
            // not rendered when Disabled (Enabled=false)
            if (Enabled)
            {
                // Determine defaults
                string doCallbackName = !string.IsNullOrEmpty(_doCallbackScript) ? _doCallbackScript : DEFAULT_DOCALLBACK_KEY;
                string onCallbackName = !string.IsNullOrEmpty(_onCallbackScript) ? _onCallbackScript : DEFAULT_ONCALLBACK_KEY;

                // Create an anonmous function which will eval string return value and pass object to client onCallback Method
                string onCallbackInvoke = "_getAjaxProcessor(" + onCallbackName + ")";
                // Create a wrapper function used for internal .NET callback
                string runtimeCallbackScript = Page.ClientScript.GetCallbackEventReference(this, "arg", onCallbackInvoke, "", asynchronous);
                string clientCallbackFunction = "function " + doCallbackName + "(arg, context) {" + runtimeCallbackScript + "; }";

                // A unique key to register the callback
                string uniqueCallbackName = doCallbackName + "AjaxCallback";

                // Register a user defined function to initiate callback
                if (!Page.ClientScript.IsClientScriptBlockRegistered(this.GetType(), uniqueCallbackName))
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), uniqueCallbackName, clientCallbackFunction, true);
                }
            }
        }

        #region ICallbackEventHandler Required

        /// <summary>
        /// 
        /// </summary>
        /// <param name="eventArgument"></param>
        public void RaiseCallbackEvent(String eventArgument)
        {
            // only process callback when enabled
            if (Enabled)
            {
                _rawCallbackArg = eventArgument;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public string GetCallbackResult()
        {
            // only enabled controls will return processed callback
            if (Enabled)
            {
                // Invoke callback methods
                CaisisAjaxEventArgs e = new CaisisAjaxEventArgs(_rawCallbackArg);
                // Process args subscribed event handlers
                if (ProcessCallback != null)
                {
                    ProcessCallback(e);
                }
                // Otherwise nothing to process, return value is default return value
                else
                {
                    e.ReturnValue = DefaultReturnValue;
                }
                string clientReturnValue;
                // Dictionary will contain entry for raw return value
                if (e.ReturnValue is Control)
                {
                    clientReturnValue = "";
                    e.ReturnParams.Add("html", RenderCallbackControl(e.ReturnValue as Control));
                }
                else
                {
                    clientReturnValue = e.ReturnValue.ToString();
                }
                // Raw return value will be added to collection and decoded on client return script
                e.ReturnParams.Add(CLIENT_RETURN_VALUE_KEY, clientReturnValue);

                // Convert return params into js object { } and return
                string obj = ParamsToObject(e.ReturnParams);
                return obj;
            }
            else
            {
                return string.Empty;
            }
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="collection"></param>
        /// <returns></returns>
        private string ParamsToObject(NameValueCollection collection)
        {
            List<string> objectProperties = new List<string>(collection.Keys.Count);
            foreach (string key in collection.Keys)
            {
                string objKey = "'" + key + "'";
                string objEncodedValue = HttpUtility.UrlEncode(collection[key]);
                // .NET UrlEncoding does not properly escapes single quotes and uses '+' instead of '%20' for spaces
                // Correct before returning to client
                objEncodedValue = objEncodedValue.Replace("+", "%20");
                objEncodedValue = objEncodedValue.Replace("'", "%27");
                // The client object at specified key will contain the unscaped version of the above value
                // "That's Right" -> { value : 'That%27s%20Right' }['value'] -> "That's Right"
                objEncodedValue = "unescape('" + objEncodedValue + "')";
                objectProperties.Add(objKey + " : " + objEncodedValue);
            }
            string obj = "{ " + string.Join(",", objectProperties.ToArray()) + " }";
            return obj;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="con"></param>
        /// <returns></returns>
        private string RenderCallbackControl(Control con)
        {
            StringWriter stream = new StringWriter();
            HtmlTextWriter writer = new HtmlTextWriter(stream);
            // Unique ID
            con.ID = con.ID + "_Ajax";
            con.RenderControl(writer);

            writer.Flush();
            string rawHTML = stream.ToString();
            return rawHTML;
        }
    }

    public static class AjaxUtil
    {
        public static void RegitserClientCallbackHandler(object sender, EventArgs e)
        {

        }

        public static void RegitserClientCallbackScript(Page page, Control target, string doCallbackName, string onCallbackName)
        {

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="clientParams"></param>
        /// <returns></returns>
        public static NameValueCollection ProcessClientString(string clientParams)
        {
            return new NameValueCollection();
        }
    }
}