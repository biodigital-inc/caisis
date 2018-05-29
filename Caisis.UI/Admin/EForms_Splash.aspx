<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EForms_Splash.aspx.cs" Inherits="Caisis.UI.Admin.EForms_Splash" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EForms Splash</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/jQuery.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();

        Browser.ResizeElement({ nodeId: 'reportFrame', heightOffset: 125 });

        function loadEformPage(url, link) {
            window.frames['reportFrame'].location = url;
            jQuery('li.selected').removeClass('selected');
            jQuery(link).parents('li').addClass('selected');
            return false;
        }

        /* ]]> */
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div id="SelectFormBox" class="adminNavBoxContainer" style="width: 175px;">
        <span class="adminNavBoxContainerTitle">EForm Tasks</span>
        <div id="mainAdminBox" class="adminBox" style="margin-top: 0px;">
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;">
                <ul class="adminBoxNavList">
                    <li class="alternate selected"><a href="AdminEformActivity.aspx" target="reportFrame" onclick="return loadEformPage(this.href, this);">
                        EForm Activity</a></li>
                    <li><a href="AdminSendEformNotifications.aspx" target="reportFrame" onclick="return loadEformPage(this.href, this);">
                        Send EForm Notifications</a></li>
                    <li><a href="AdminEformNotificationLog.aspx" target="reportFrame" onclick="return loadEformPage(this.href, this);">
                        View EForm Notifications</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="EditFormBox" style="margin-left: 175px;">
        <iframe id="reportFrame" name="reportFrame" frameborder="0" src="AdminEformActivity.aspx" style="border-style: none; display: block; width: 98%; margin: 4px auto;"></iframe>
    </div>
    </form>
</body>
</html>
