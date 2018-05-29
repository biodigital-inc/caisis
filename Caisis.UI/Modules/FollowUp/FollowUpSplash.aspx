<%@ Page Language="c#" CodeFile="FollowUpSplash.aspx.cs" AutoEventWireup="True" Inherits="Caisis.UI.Modules.FollowUp.FollowUpSplash" %>

<%@ Register TagPrefix="module" TagName="Splash" Src="~/Core/Utilities/ModuleSplash.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Follow Up Splash</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="dataForm" method="post" runat="server">
    <module:Splash runat="server" ModuleName="Follow Up" />
    </form>
</body>
</html>
