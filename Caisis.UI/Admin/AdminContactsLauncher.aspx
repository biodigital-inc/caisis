<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminContactsLauncher.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminContactsLauncher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Contacts</title>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/GlobalStyles.css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

   <script type="text/javascript">
       Browser.ResizeElement({ nodeId: 'ContactsFrame', heightOffset: 175 });
    
    </script>

</head>
<body class="AdminBody">
    <form id="form1" runat="server">
    <iframe id="ContactsFrame" src="../Modules/ProjectMgmt/ProjectContacts.aspx?admin=true"
        frameborder="0" style="width: 95%; margin: auto; border: 1px solid black; height: 500px;">
    </iframe>
    </form>
</body>
</html>
