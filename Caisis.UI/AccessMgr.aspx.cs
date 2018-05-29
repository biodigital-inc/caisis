using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Web.SessionState;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis;

/// <summary>
/// Used only for logging user into Caisis that are authenticated and redirected here by Novell Access Manager.
/// LDAPMode key in the web config must be set to "accessmgr" to active this mode of authentication.
/// </summary>
public partial class AccessMgr : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        string keyName = "";
        string keyValue = "";
        string username = "";

        bool validUser = false;

        if (Request.QueryString.HasKeys())
        {
            for (int i=0; i<Request.QueryString.Keys.Count; i++)
            {
                keyName = Request.QueryString.Keys[i];
                keyValue = Request.QueryString[i];

                if (keyName.ToLower().Equals("name"))
                {
                    username = keyValue;
                }

                //Response.Write("<BR/>" + keyName + " = " + keyValue + "<BR/>"); 
            }

            if (!string.IsNullOrEmpty(username))
            {
                try
                {
                    this.AuthenticateUser(username);
                    validUser = true;
                }
                catch (Exception ex)
                {
                    LoginMessage.Text = ex.Message + "<br/><br/>This username is not recognized by Caisis. <br/></br>Please contact the system administrator for access.<br/><br/>CaisisAdmin@mskcc.org";
                }
            }
        }

        if (!validUser)
        {
            Response.Redirect("Logout.aspx");
        }
    }

    /// <summary>
    /// User was authenticated by Access Manager. Login them in without a password if they exist in Caisis. 
    /// </summary>
    /// <param name="username"></param>
    protected void AuthenticateUser(string username)
    {
        UserController ct = new UserController(Session);

        ct.SetUserLoginCredentials(username, "");

        // log user attempty
        ct.LogLoginAttempt("Bad Authentication From Access Manager", username);
       
        // redirect to splash page
        if (Session[SessionKey.LoginId] != null)
        {
            string purpose = "PCCTC";
            //Response.Redirect("Core/Utilities/Dashboard.aspx?purpose=" + purpose, false); // false important here
            Response.Redirect("Core/Utilities/SetAccessLevel.aspx?login=true&purpose=" + purpose, false); // false important here	
        }
        else
        {
            Response.Write("user login Id is undefined. Please login again");
        }
       
    }
}
