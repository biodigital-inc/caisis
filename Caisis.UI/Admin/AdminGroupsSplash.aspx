<%@ Page Language="C#" Inherits="Caisis.UI.Admin.AdminGroupsSplash" CodeFile="AdminGroupsSplash.aspx.cs"
    CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Administrator</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    /* <![CDATA[ */
    function setTitle(title) { top.frames[0].setSectionTitle(title); }
     /* ]]> */
    </script>
</head>
<body onload="setTitle('Manage User Groups');" style="background-color: #ffffff">
    <span class="boldText">Would you like to:</span>
    <ul>
        <li style="margin-bottom: 10px;"><a  class="boldText" href="AdminGroups.aspx?addNew=yes" onclick="setTitle('Create New Groups')">
            Create New Groups</a></li>
        <li style="margin-bottom: 10px;"><a class="boldText" href="AdminGroups.aspx" onclick="setTitle('Edit Groups or Associate with Roles')">
            Edit Groups or Associate with Roles</a></li>
        <li style="margin-bottom: 10px;"><a class="boldText" href="AdminGroupsToDatasets.aspx" onclick="setTitle('Associate Groups with Datasets')">
            Associate Groups with Datasets</a></li>
        <li style="margin-bottom: 10px;"><a class="boldText" href="AdminGroupTabAccess.aspx" onclick="setTitle('Give Groups Access to Tabs')">
            Give Groups Access to Tabs</a></li>
    </ul>
</body>
</html>
