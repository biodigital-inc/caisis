<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminNavigationPage.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminNavigationPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Administrator</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript">
    /* <![CDATA[ */
    
    var navExpanded = false;
    var ADMIN_NAV_EXPAND_WIDTH = '100%';
    var ADMIN_NAV_CLOSE_WIDTH = '625px';

    var ADMIN_NAV_MIN_HEIGHT = 300;
    var ADMIN_NAV_HEIGHT_OFFSET = 50;

    // adjust data entry frame height
    function onWindowResize() {
        var winHeight = getHeight(window);
        var adjustedHeight = Math.max(ADMIN_NAV_MIN_HEIGHT, winHeight - ADMIN_NAV_HEIGHT_OFFSET);
        $('<%= adminPage.ClientID %>').style.height =  adjustedHeight + 'px';
    }
    
    // Sets the pagge title, highlights active link and expands page if needed
    function setSectionTitle(title,doExpand,doAutoExpand)
    {
        setPageTitle(title);
        setActiveLink(title);
        var EXPAND_MESSAGE = 'Would you like to expand ' + title +' for better viewing?';
        if(doExpand)
        {  
            if(doAutoExpand || confirm(EXPAND_MESSAGE)) 
            { 
                showHideAdminNav(); 
            }
        }
    }
    
    // Sets page title
    function setPageTitle(title) { document.getElementById('pageTitle').innerHTML = title; }
    
    // Sets active link in navigation
    function setActiveLink(title)
    {
        var nav = document.getElementById('NavTable');
        var links = nav.getElementsByTagName('A');
        for(var i=0;i<links.length;i++)
        {
            var link = links[i];
            link.className = link.title == title ? 'adminSectionNavOn' : 'adminSectionNav';
        }
    }

    // Expands/Collapses content to page
    function showHideAdminNav(doExpand) {
        if (doExpand != null) {
            navExpanded = !doExpand;
        }
        var btn = document.getElementById('ShowHideAdminBtn');
        var navCol = document.getElementById('NavColumn');
        var navSectionTitle = document.getElementById('NavSectionTitle');
        var loadFrame = document.getElementById('adminPage');

        btn.src = navExpanded ? '../Images/buttonExpand.gif' : '../Images/buttonReturn.gif';
        btn.alt = navExpanded ? 'Expand' : 'Return';
        navCol.style.display = navExpanded ? '' : 'none';
        navSectionTitle.style.display = navExpanded ? '' : 'none';
 
        navExpanded = !navExpanded;
//        loadFrame.style.width = (navExpanded ? ADMIN_NAV_EXPAND_WIDTH : ADMIN_NAV_CLOSE_WIDTH);

    }
    /* ]]> */
    </script>

</head>
<body class="AdminBody">
    <table border="0" cellspacing="0" cellpadding="0" style="width: 100%; background-color: #ffffff;">
        <tr>
            <td id="NavSectionTitle" style="width: 200px" class="adminSectionTitle">
                <asp:Label ID="SectionTitle" runat="server"></asp:Label></td>
            <td style="width: 12px">
                <img src="../Images/AdminImages/AdminWidgetRed.gif" style="width: 6px; height: 8px;
                    margin-right: 2px;" alt="Admin Section" /></td>
            <td>
                <span id="pageTitle" class="adminPageTitle" runat="server"></span>
            </td>
            <td style="width: 10px">&nbsp;
                </td>
        </tr>
        <tr>
            <td colspan="3" class="adminSectionTitleLine"><img src="../Images/shim.gif" width="1" height="1" /></td>
            <td><img src="../Images/shim.gif" width="1" height="1" /></td>
        </tr>
        <tr>
            <td valign="top">&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td valign="top" id="NavColumn"  style="width: 225px">
                <!-- Navigation Handled by AdminConfig.xml -->
                <table border="0" cellspacing="0" cellpadding="0" id="NavTable" style="width: 225px">
                    <asp:Repeater runat="server" ID="NavRptr" DataSourceID="NavDataSource" OnItemDataBound="HandleItemBound">
                        <ItemTemplate>
                            <tr>
                                <td style="height: 24px">
                                    <img src="../Images/AdminImages/AdminWidgetBlue.gif" name="WidgetEditUser" width="6"
                                        height="8" id="WidgetManageDatasets" alt="<%# Eval("pageTitle") %>" />
                                </td>
                                <td>
                                    <asp:HyperLink runat="server" ID="AdminItemLink" Target="adminPage" CssClass="adminSectionNav"></asp:HyperLink>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <asp:XmlDataSource ID="NavDataSource" runat="server" DataFile="~/App_Data/AdminConfig.xml">
                </asp:XmlDataSource>
            </td>
            <td>&nbsp;
                </td>
            <td valign="top">
                <iframe runat="server" id="adminPage" name="adminPage" src="AdminDatasets.aspx" frameborder="0"
                    style="width: 100%; height: 550px; overflow: auto;"></iframe>
                <div>
                    <img id="ShowHideAdminBtn" src="../Images/buttonExpand.gif" onclick="showHideAdminNav();"
                        style="cursor: pointer;" alt="Expand" /></div>
            </td>
            <td>&nbsp;
                </td>
        </tr>
    </table>

    <script type="text/javascript">
             <asp:Literal runat="server" ID="jsSectionTitle" />
             onWindowResize();
    </script>

</body>
</html>
