<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MPXAdmin.aspx.cs" Inherits="Caisis.UI.Admin.MPXAdmin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Protocol Mgmt: MPX Admin</title>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/GlobalStyles.css" />
</head>
<body>
    <form id="form1" runat="server">
    <h3>
        Select Stratum</h3>
    <a href="MPXAdmin.aspx?stratum=1" class="dataEntryButtonGray">Stratum 1</a>
    <a href="MPXAdmin.aspx?stratum=2" class="dataEntryButtonGray">Stratum 2</a>
    <a href="MPXAdmin.aspx?stratum=3" class="dataEntryButtonGray">Stratum 3</a>
    <a href="MPXAdmin.aspx?stratum=4" class="dataEntryButtonGray">Stratum 4</a>
    <br />
    <h3 runat="server" id="StratumTitle"></h3>
    <asp:GridView runat="server" ID="StratumData" AutoGenerateColumns="true"></asp:GridView>
    </form>
</body>
</html>
