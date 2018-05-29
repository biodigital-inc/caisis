using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.DirectoryServices;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;

using Caisis.Security;

public partial class Admin_AdminLdapSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SearchResultsRow.Visible = false;
        ErrorMessage.Visible = false;

        SearchResults.Attributes["onchange"] = "returnUserInfo(this);";

        SearchString.Attributes["onkeyup"] = "checkEnableSearch();";
        DomainPassword.Attributes["onkeyup"] = "checkEnableSearch();";
    }

    protected void SearchLDAP(object sender, EventArgs e)
    {
        SecurityController sc = new SecurityController();
        string ldapServer = CaisisConfiguration.GetWebConfigValue("LDAPServer");

        if (!string.IsNullOrEmpty(ldapServer))
        {
            ldapServer = "LDAP://" + ldapServer;
        }

        string username = sc.GetUserName();
        string password = DomainPassword.Text;

        IEnumerable<KeyValuePair<string, string>> searchResults = null;
        try
        {
            if (LastNameSearchOption.Checked)
            {
                searchResults = SearchLDAPByLastName(SearchString.Text, ldapServer, username, password);
            }
            else if (EmailSearchOption.Checked)
            {
                searchResults = SearchLDAPByEmail(SearchString.Text, ldapServer, username, password);
            }
            else
            {
                // do nothing
            }
        }
        // ?? ideally validate server vs client auth exception
        catch (Exception ex)
        {
            ErrorMessage.Visible = true;
        }

        // build results
        SearchResults.DataSource = searchResults;
        SearchResults.DataBind();

        if (searchResults == null || searchResults.Count() == 0)
        {
            SearchResultsRow.Visible = false;
        }
        else
        {
            SearchResults.Items.Insert(0, new ListItem("select a user ...", ""));
            SearchResultsRow.Visible = true;
        }
    }

    private IEnumerable<KeyValuePair<string, string>> SearchLDAPByEmail(string emailSubstring, string path, string username, string password)
    {
        return SearchLDAP(string.Format("(&(objectClass=user)(mail=*{0}*)(givenName=*))", emailSubstring), path, username, password);
    }

    private IEnumerable<KeyValuePair<string, string>> SearchLDAPByLastName(string lastNamePrefix, string path, string username, string password)
    {
        return SearchLDAP(string.Format("(&(objectClass=user)(sn={0}*)(givenName=*))", lastNamePrefix), path, username, password);
    }

    private IEnumerable<KeyValuePair<string, string>> SearchLDAP(string searchString, string path, string username, string password)
    {
        List<KeyValuePair<string, string>> sortedResults = new List<KeyValuePair<string, string>>();

        Action<SearchResult> consumer =
            delegate(SearchResult result)
            {
                string firstName = GetLDAPResultProperty(result, "givenName");
                string lastName = GetLDAPResultProperty(result, "sn");
                string email = GetLDAPResultProperty(result, "mail");
                string loginName = GetLDAPResultProperty(result, "sAMAccountName").ToLower(); // do other sites use this convention for login name?
                string employeeID = GetLDAPResultProperty(result, "employeeID");

                string key = Join(", ", lastName, firstName);
                string value = Join(",", loginName, email, employeeID);

                sortedResults.Add(new KeyValuePair<string, string>(key, value));
            };

        ConsumeLDAPSearchResults(searchString, consumer, path, username, password);

        Comparison<KeyValuePair<string, string>> comparer =
            delegate(KeyValuePair<string, string> x, KeyValuePair<string, string> y)
            {
                return string.Compare(x.Key, y.Key);
            };

        sortedResults.Sort(comparer);

        return sortedResults;
    }

    private void ConsumeLDAPSearchResults(string filterString, Action<SearchResult> consumer, string path, string username, string password)
    {
        using (DirectoryEntry entry = new DirectoryEntry())
        {
            if (!string.IsNullOrEmpty(path))
            {
                entry.Path = path;
            }

            entry.Username = username;
            entry.Password = password;

            DirectorySearcher searcher = new DirectorySearcher(entry);
            searcher.Filter = filterString;

            foreach (SearchResult result in searcher.FindAll())
            {
                consumer(result);
            }
        }
    }

    private string Join(string separator, params string[] list)
    {
        return string.Join(separator, list);
    }

    private string GetLDAPResultProperty(SearchResult result, string propertyName)
    {
        if (result.Properties.Contains(propertyName))
        {
            return result.Properties[propertyName][0].ToString();
        }
        else
        {
            return "";
        }
    }
}
