<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectManagerSplash.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectManagerSplash" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Administer Project Manager</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    Browser.ResizeElement({ nodeId: 'AdminOptionsFrame', heightOffset: 175 });
    
    function showAdminSection(title)
    {
        $('ProjectSplashContainer').hide('none');
        $('AdminOptionsContainer').show('');       
        $('titleText').innerHTML = title;
        return false;
    }
    
    function showAdminSplash()
    {
        $('ProjectSplashContainer').show('');
        $('AdminOptionsContainer').hide('none');
        return false;
    }
    
    
    </script>

    <style type="text/css">
    .ListManTitle
    {
        font-size: 12px;
    }
    .ListManTitle img
    {
        margin: auto 40px auto 40px;
    }
    img
    {
        border-style: none;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="MenuContainter" style="height: 12px; width: 100%; display: block; border: none;
            margin: 0px;">
        </div>
        <div id="ProjectSplashContainer">
            <table cellpadding="0" cellspacing="0" class="mainSplashBG" width="896" style="margin: auto;">
                <tr>
                    <td height="32" valign="bottom">
                        <img alt="What would you like to do?" title="What would you like to do?" id="splashTitle"
                            runat="server" src="../../Images/SplashWhatWouldYouLikeToDo.gif" height="14"
                            hspace="20" />
                    </td>
                </tr>
                <tr>
                    <td height="6">
                        <img src="../../Images/shim.gif" height="1" width="1" /></td>
                </tr>
                <tr>
                    <td height="1">
                        <img src="../../Images/shim.gif" height="1" width="1" /></td>
                </tr>
                <tr>
                    <td style="height: 210px; vertical-align: top; padding-top: 42px; margin: atuo; text-align: center;">
                        <a title="Manage Existing Project" href="ProjectsList.aspx" class="ListManTitle">
                            <img alt="Manage Existing Project" title="Manage Existing Project" src="Images/splashOptionsManageExistingProject.gif" /></a>
                        <a runat="server" id="CreateProjectBtn" title="Create New Project" href="Admin/AdminCreateProject.aspx"
                            class="ListManTitle">
                            <img alt="Create New Project" title="Create New Project" src="Images/splashOptionsCreateNewProject.gif" /></a>
                        <a onclick="showAdminSection('Contacts');" title="View/Manage Contacts" href="ProjectContacts.aspx?contactType=Project"
                            target="AdminOptionsFrame" class="ListManTitle">
                            <img alt="View/Manage Contacts" title="View/Manage Contacts" src="Images/splashOptionsViewManageContacts.gif" /></a>
                        <a onclick="showAdminSection('Organizations');" title="View/Manage Organizations"
                            href="ProjectOrgs.aspx" target="AdminOptionsFrame" class="ListManTitle">
                            <img alt="View/Manage Organizations" title="View/Manage Organizations" src="Images/splashOptionsViewManageOrganizations.gif" /></a>
                        <a runat="server" id="ManageStagesBtn" onclick="showAdminSection('Stages &amp; Events');"
                            title="Manage Stages &amp; Events" href="Admin/AdminManageStageAndEvents.aspx"
                            target="AdminOptionsFrame" class="ListManTitle">
                            <img alt="Manage Stages &amp; Events" title="Manage Stages &amp; Events" src="Images/splashOptionsManageStagesAndEvents.png" /></a>
                    </td>
                </tr>
            </table>
        </div>
        <div id="AdminOptionsContainer" style="display: none; width: 100%;">
            <table cellpadding="0" cellspacing="0" class="ProjMgrHeader" style="table-layout: fixed;
                border: none; width: 100%;">
                <tr>
                    <td style="height: 41px; vertical-align: top; padding-left: 31px; padding-right: 20px;">
                        <span id="titleText" class="projectTitle" style="font-size: 22px;">Contacts</span></td>
                    <td style="width: 242px; vertical-align: top; text-align: right; padding-right: 31px;">
                        <a href="#" title="Admin Options" onclick="return showAdminSplash();">
                            <img title="Return to Admin Options" alt="Admin Options" src="Images/ReturnToAdminOptions_blue.png"
                                style="border: 0px;" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img src="Images/ProjMgr_HeaderCurveRight.gif" style="float: right;" /><img src="Images/ProjMgr_HeaderCurveLeft.gif" /></td>
                </tr>
            </table>
            <iframe id="AdminOptionsFrame" name="AdminOptionsFrame" src="" style="width: 95%;
                height: 500px; display: block; border-style: none; border: 0px; margin: 10px auto auto auto;
                clear: both;" frameborder="0"></iframe>
        </div>
    </form>
</body>
</html>
