<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminResetCacheItem.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminResetCacheItem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Cache Items</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
</head>
<body class="AdminBody">
    <form id="form1" runat="server">
        <div style="margin: 15px auto auto auto; text-align: center;">
            <span>Please click on the button below to refresh the
                <asp:Label runat="server" ID="CacheTitle"></asp:Label>
                cache.</span>
            <asp:ImageButton ID="RefeshButton" runat="server" ImageUrl="../images/AdminImages/RefreshCache.gif"
                Width="106" Height="22" OnCommand="RefreshCacheItem" CommandArgument='<%= cacheItem %>'
                Style="display: block; margin-top: 10px;" />
            <span runat="server" id="Message" style="color: red; margin-top: 25px; display: block;">
            </span>
        </div>
    </form>
</body>
</html>
