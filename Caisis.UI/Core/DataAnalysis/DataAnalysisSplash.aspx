<%@ Page Language="c#" Inherits="Caisis.UI.Core.DataAnalysis.DataAnalysisSplash"
    CodeFile="DataAnalysisSplash.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>

<%@ Register TagPrefix="module" TagName="Splash" Src="~/Core/Utilities/ModuleSplash.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Data Analysis Splash</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="dataForm" method="post" runat="server">
    <module:Splash ID="SplashDataAnalysis" runat="server" ModuleName="Data Analysis" />
    </form>
</body>
</html>
