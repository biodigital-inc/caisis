<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Caisis.UI.Admin.Index" %>
<%@ Register TagPrefix="admin" TagName="Header" Src="AdminHeader.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Caisis Admin</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />
    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>
    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>
    
    
    
     <script type="text/javascript">
        /* <![CDATA[ */

        // resize main data entry
//        Browser.ResizeElement({ nodeId: 'MainInterface', heightOffset: 200 });

        jQuery.noConflict();

        jQuery(document).ready(function(e) {
            var helpBlocks = jQuery('.adminSplashHelpBlockContainer');
            helpBlocks.mouseenter(function() {
                if (jQuery.browser.msie)
                {
//                    helpBlocks.find('div').css('visibility', 'hidden');
//                    jQuery(this).find('div').css('visibility', 'visible');
                    var id = jQuery(this)[0].id;
                    helpBlocks.filter(':not(#'+id+')').animate({marginTop:15},200);
                    jQuery(this).animate({marginTop:0},200);
                }
                else
                {
                    var id = jQuery(this)[0].id;
                    helpBlocks.filter(':not(#'+id+')').find('div').animate({opacity:0.4},300);
                    jQuery(this).find('div').animate({opacity:1},300);
                }
                clearTimeout(hideHelpBlocksTimer);
            });
            helpBlocks.mouseleave(function() {
                hideHelpBlocksTimer = setTimeout('showAllHelpBlocks()',200);
            });


        });

        var hideHelpBlocksTimer;

        function showAllHelpBlocks()
        {
            var helpBlocks = jQuery('.adminSplashHelpBlockContainer');
            if (jQuery.browser.msie)
            {
                helpBlocks.find('div').css('visibility', 'visible');
            }
            else
            {
                helpBlocks.find('div').animate({opacity:1},300);
            }
        }
        
        
        

     /* ]]> */
    </script>
    
    <style type="text/css">
    a.groupedLink>span
    {
        display: block;
        margin-left: 10px;
    }
    </style>
    
    
</head>
<body>
    <form id="form1" runat="server">
    <admin:Header ID="AdminHeader" runat="server" />
    <div id="adminPageContentContainer" style="margin-top: -20px; min-width: 1000px;">

<div id="adminSplashBG">&nbsp;</div>
<div id="adminSplashLeftBlock">
<div id="adminSplashLeftBlockTitle">Welcome to the <span style="font-size: 16px;">Caisis Administrator</span></div>
<div id="adminSplashLeftBlockSummaryTitle">
System Summary for Today, <% = System.DateTime.Now.DayOfWeek + " " + System.DateTime.Now.ToShortDateString() %>
<div id="adminSplashLeftBlockSummaryContent">
<p><a href="AdminReports.aspx"><asp:Label runat="server" ID="ErrorCount"></asp:Label> Errors</a> were recorded by the system.</p>
<p><a href="AdminReports.aspx"><asp:Label runat="server" ID="UserLoginCount"></asp:Label> Different Users</a> have logged into the system today.</p>
<%--<p><a href="AdminReports.aspx">1 Email</a> has been sent to the Caisis Administrator.</p>
--%></div>
<div id="adminSplashLeftBlockSummaryBottom">&nbsp;</div>
</div>
</div>
<%--<div id="adminSplashRightBlock">
<div id="adminSplashRightBlockTitle">
System Summary for Today, <% = System.DateTime.Now.DayOfWeek + " " + System.DateTime.Now.ToShortDateString() %>
</div>
<div id="adminSplashRightBlockContent">
<p><a href="#">3 Errors</a> were recorded by the system.</p>
<p><a href="#">48 Users</a> have logged into the system today.</p>
<p><a href="#">1 Email</a> has been sent to the Caisis Administrator.</p>
</div>
</div>--%>


<div id="adminSplashHelpBlocks">
<div class="adminSplashHelpBlockContainer" id="adminSplashHelpBlockUsersGroupsContainer" <%--style="margin-left: 214px;"--%>>
<div class="adminSplashHelpBlockInnerContainer" id="adminSplashHelpBlockUsersGroupsInnerContainer">
<div class="adminSplashHelpBlockArrow" >&nbsp;</div>
<div class="adminSplashHelpBlock" id="adminSplashHelpBlockUsersGroups">
Go here to:<br />
<a href="AdminUsersAndGroups.aspx?page=User_Edit">Add a New User</a>
<a href="AdminUsersAndGroups.aspx?page=User_List">Reset a User's Password</a>
<a href="AdminUsersAndGroups.aspx?page=Group_List">Add/Remove Users from a Group</a>       
<a href="AdminUsersAndGroups.aspx?page=Group_List">Associate Groups with Roles</a>
<a href="AdminUsersAndGroups.aspx?page=Group_List">Associate Groups with DataSets</a>
<a href="AdminUsersAndGroups.aspx?page=Role_List">Add / Update Roles</a>
<a href="AdminUsersAndGroups.aspx?page=Group_List">Give Groups Access to Tabs</a>
<a href="AdminUsersAndGroups.aspx">Manage Contacts</a>
</div>
<div class="adminSplashHelpBlockBottomTitle" style="color: #ffffff;">Users &amp; Groups</div>
</div>
</div>
<div class="adminSplashHelpBlockContainer" id="adminSplashHelpBlockSystemConfigContainer">
<div class="adminSplashHelpBlockInnerContainer" id="adminSplashHelpBlockSystemConfigInnerContainer">
<div class="adminSplashHelpBlockArrow" >&nbsp;</div>
<div class="adminSplashHelpBlock" id="adminSplashHelpBlockSystemConfig">
Go here to:<br />
<a href="AdminSystemConfig.aspx">Customize Data Entry Interfaces</a>
<a href="AdminSystemConfig.aspx?page=LookupCode_Edit">Manage Vocabulary (including lookup<br/>codes and help)</a>
<a href="AdminSystemConfig.aspx?page=EForms_List">Manage EForms</a>
<a href="AdminSystemConfig.aspx?page=Workflow_List">Manage Workflows</a>
<a href="AdminSystemConfig.aspx?page=Surveys_Edit">Manage Surveys</a>
<a href="AdminSystemConfig.aspx?page=PaperForms_View">Preview Paper Forms</a>
<a href="AdminSystemConfig.aspx?page=AdminListReports">List Reports</a>
<%--<a href="AdminSystemConfig.aspx?page=">Configure Protocol Manager</a>
<a href="AdminSystemConfig.aspx?page=">Configure Specimen Manager</a>
<a href="AdminSystemConfig.aspx?page=">Manage Datasets</a>
<a href="AdminSystemConfig.aspx?page=">Review Data Integrity</a>--%>
<%--<a href="AdminSystemConfig.aspx?page=">Configure Patient Education module</a>
<a href="AdminSystemConfig.aspx?page=">Refresh Application Cache</a>--%>
</div>
<div class="adminSplashHelpBlockBottomTitle" >System Config</div>
</div>
</div>
<div class="adminSplashHelpBlockContainer" id="adminSplashHelpBlockAdminReportsContainer">
<div class="adminSplashHelpBlockInnerContainer" id="adminSplashHelpBlockAdminReportsInnerContainer">
<div class="adminSplashHelpBlockArrow" >&nbsp;</div>
<div class="adminSplashHelpBlock" id="adminSplashHelpBlockAdminReports">
Go here to:<br />
<a href="AdminReports.aspx?page=AdminLookupCodesDataIntegrity">Review &amp; Improve Data Integrity</a>
<a href="AdminReports.aspx?page=AdminSendEformNotifications">Review EForm Notifications</a>
<a href="AdminReports.aspx?page=Contact_List">Manage Contacts</a>
<a href="AdminReports.aspx?page=Application_Utilities">Refresh System &amp; Lookup Caches</a>
<a href="AdminReports.aspx" class="groupedLink">View Reports, including:
<span>Days Since Password Change</span>
<span>Error Log</span>
<span>Login attempts</span>
<span>Logins For Selected User</span>
<span>Patients Viewed by Selected User</span>
<span>Security: No Password Changes</span>
<span>Security: Password Reuse</span>
<span>Security: Termination of Access</span>
<span>User record updates</span>
<span>User Statistics</span>
<span>User Summary</span>
<span>Users that Viewed Selected Patient</span>
<span>Views of Patients</span>
</a>
</div>
<div class="adminSplashHelpBlockBottomTitle" >Admin Reports</div>
</div>
</div>

</div>

</div>
    </form>
</body>
</html>
