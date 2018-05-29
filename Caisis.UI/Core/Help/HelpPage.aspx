<%@ Page Language="c#" ContentType="text/html" ResponseEncoding="iso-8859-1" Inherits="Caisis.UI.Core.Help.HelpPage" CodeFile="HelpPage.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Caisis Help</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--

//opens window to email admin
function popupAdminEmailWindow()
{
	window.open('../Utilities/EmailAdmin.aspx','EmailAdmin', 'toolbars=no,resize=no,scrollbars=no,width=500,height=400,left=300,top=200');
}


function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
			</script>
	</head>
	<body>
		<table width="620" border="0" cellspacing="0" cellpadding="0">
			<tr class="helpPageHeader">
				<td width="145"><img src="../../Images/shim.gif" width="1" height="1"></td>
				<td width="20"><img src="../../Images/shim.gif" width="1" height="1"></td>
				<td width="455"><img src="../../Images/shim.gif" width="1" height="1"></td>
			</tr>
			<tr>
				<td height="42" colspan="3" class="helpPageHeader"><img src="../../Images/HelpPageHeaderTitle.gif" width="135" height="28" hspace="5"></td>
			</tr>
			<tr>
				<td height="20"><img src="../../Images/shim.gif" width="1" height="1"></td>
				<td><img src="../../Images/shim.gif" width="1" height="1"></td>
				<td><img src="../../Images/shim.gif" width="1" height="1"></td>
			</tr>
			<tr>
				<td rowspan="2" valign="top" class="helpLeftNavBar">
				<table width="140" border="0" cellspacing="0" cellpadding="2" align="center">
						<tr>
							<td>&nbsp</td>
							<td colspan="2"><strong>New to Caisis?</strong></td>
						</tr>
						<tr>
							<td width="10">&nbsp;</td>
							<td width="10">&nbsp;</td>
							<td width="120"><a href="HelpPage.aspx?helpSection=NewToCaisis" class="helpLink">Get Started Here</a></td>
						</tr>
					</table>
				</td>
				<td>&nbsp;</td>
				<td class="helpPageTitle"><asp:Label ID="pageTitle" Runat="server"></asp:Label></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td height="250" valign="top"><br />
					<div id="PageHelp" style="width:450px; height:290px; z-index:1; overflow: auto;">
                        <asp:Label ID="pageDescription" runat="server" CssClass="boldText">No help summary is available for this page.</asp:Label>
                        <br/>
					<table width="415" border="0" cellspacing="0" cellpadding="4">
					<tr>
						<td height="20"><img src="../../Images/shim.gif" width="100" height="1"></td>
						<td><img src="../../Images/shim.gif" width="315" height="1"></td>
					</tr>
                    <tr runat="server" id="ItemsOnThisPageRow" visible="false">
                        <td height="20" colspan="2">
                            <asp:Label ID="ItemsOnThisPage" runat="server">Fields on This Page:</asp:Label>
                        </td>
                    </tr>
					<asp:Repeater ID="rptFieldDesciptions" runat="server">
						<ItemTemplate>
                            <tr>
                                <td class="helpPageFieldName" valign="top">
                                    <span class="boldText">
                                        <%# Eval("FieldLabel") %></span>
                                </td>
                                <td valign="top">
                                    <span>
                                        <%# Eval("FieldDescription") %>
                                    </span>
                                </td>
                            </tr>
						</ItemTemplate>
					</asp:Repeater>
					</table>
					</div>
                    <span runat="server" id="DiseaseCustomized" visible="false" style="position: absolute; right: 10px;">
                        <img alt="Disease Customized" title="customized for this disease" src="../../Images/AdminImages/AdminIcon_CustomizedField.png"
                            style="vertical-align: baseline; margin-right: 5px; cursor: pointer;" />customized
                        for this disease</span>
                </td>
			</tr>
			<tr bgcolor="f1f7fc">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td height="60" align="center"><a href="javascript:popupAdminEmailWindow();window.close();"><img src="../../Images/contactAdminForMoreInfo.gif" border="0" width="178" height="22" hspace="30"></a><a href="javascript:window.close();"><img src="../../Images/closeWindow.gif" width="98" height="22" hspace="30" border="0"></a></td>
			</tr>
		</table>
	</body>
</html>
