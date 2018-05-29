<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLdapSearch.aspx.cs"
    Inherits="Admin_AdminLdapSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LDAP Search</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        /* <![CDATA[ */
        
        function returnUserInfo(selectEl) {
            username = '';
            email = '';
            fname = '';
            lname = '';
            employeeID = '';

            if (selectEl.selectedIndex > 0) {
                key = selectEl.options[selectEl.selectedIndex].text.split(', ');
                val = selectEl.value.split(',');

                username = val[0];

                if (val[1]) {
                    email = val[1];
                }

                if (val[2]) {
                    employeeID = val[2];
                }

                if (key[1]) {
                    fname = key[1];
                }

                lname = key[0];
            }

            if (window.parent.populateUser) {
                window.parent.populateUser(username, email, fname, lname, employeeID);
            }
        }

        function checkEnableSearch() {
            var el = document.getElementById('SearchButton');

            if (el.disabled) {
                if (document.getElementById('DomainPassword').value && document.getElementById('SearchString').value) {
                    el.disabled = false;
                }
            }
        }
        /* ]]> */
    </script>
    
    <style type="text/css">
    body
    {
	    background-image: url(../Images/AdminImages/MetadataTooltipBG_top.png);
	    background-repeat: no-repeat;
	    background-position: center -54px;
    }
    
    
    </style>

</head>
<body>
    <form id="searchForm" runat="server">
    <table cellspacing="0" cellpadding="4" >
        <tr>
            <td class="boldText" style="width: 150px;">
                search by
            </td>
            <td>
                <asp:RadioButton ID="LastNameSearchOption" Checked="true" GroupName="SearchOption"
                    Text="Last Name" runat="server" />
            </td>
            <td>
                <asp:RadioButton ID="EmailSearchOption" GroupName="SearchOption" Text="Email" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="boldText">
                <label for="DomainPassword">
                    your windows password</label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="DomainPassword" CssClass="adminField" TextMode="password" runat="server"
                    Width="100%" />
            </td>
        </tr>
        <tr>
            <td class="boldText">
                <label for="SearchString">
                    search characters</label>
            </td>
            <td colspan="2">
                <asp:TextBox ID="SearchString" CssClass="adminField" runat="server" Width="100%" autocomplete="off" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
            <td style="text-align: right;">
                <asp:Button ID="SearchButton" OnClick="SearchLDAP" CssClass="dataEntryButtonGray"
                    Text="Search" Enabled="false" runat="server" />
            </td>
        </tr>
        <tr runat="server" id="SearchResultsRow" visible="false">
            <td>
                <asp:Label runat="server" Text="select a user" CssClass="boldText" AssociatedControlID="SearchResults"></asp:Label>
            </td>
            <td colspan="2">
                <asp:DropDownList ID="SearchResults" CssClass="adminField" runat="server" Width="100%"
                    DataTextField="Key" DataValueField="Value" />
            </td>
        </tr>
    </table>
    <asp:Label runat="server" ID="ErrorMessage" CssClass="redText" Visible="false" Text="ldap error: please validate username and/or password"></asp:Label>
    </form>
</body>
</html>
