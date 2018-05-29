<%@ Page language="c#" Inherits="Caisis.UI.Admin.AdminGroupTabAccess" CodeFile="AdminGroupTabAccess.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>AdminGroupTabAccess</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
  <meta http-equiv="PRAGMAS" content="NO-CACHE">
		<meta http-equiv="EXPIRES" content="0">
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
		<link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css">
  </HEAD>

<body class="AdminBody">
	<form id="dataForm" method="post" runat="server">
	<table width="520" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30" class="adminFieldLabel" nowrap>select user group:&nbsp;&nbsp;&nbsp;</td>
			<td align=left>
				<table width="440" border="0" cellspacing="0" cellpadding="0">
					<tr valign="middle"> 
						<td height="30" width="125"><asp:ListBox AutoPostBack=True OnSelectedIndexChanged="OnGroupNameChange" id="SbGroup" runat="server" Width=200 Rows=1/></td>
						
						<td align="right" nowrap><img src="../images/shim.gif" height=1 width=140><a href="AdminGroupsSplash.aspx"  class="requiredField">< back</a></td>
					</tr>
				</table>
			</td>
		</tr>	
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td height="30" class="adminFieldLabel" align=right  valign="top" title="tabs specified in ModulesRegistry.xml file" nowrap>tabs:&nbsp;&nbsp;&nbsp;</td>
			<td><asp:CheckBoxList runat="server" id="TabCheckBoxList"></asp:CheckBoxList></td>
		</tr>
		<tr>
			<td></td>
			<td><td width="100"><asp:ImageButton ID="UpdateCodesBtn" OnCommand="UpdateCodesBtn_Click" ImageUrl="../Images/buttonSubmit.gif" Runat="server"></asp:ImageButton></td>
		</tr>
	 </table>
     </form>
  </body>
</html>
