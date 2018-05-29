<%@ Page EnableEventValidation="false" language="c#" Inherits="Caisis.UI.Admin.AdminRoles" CodeFile="AdminRoles.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>Group Administrator</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta content="NOINDEX" name="ROBOTS">
		<meta http-equiv="PRAGMAS" content="NO-CACHE">
		<meta http-equiv="EXPIRES" content="0">
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
		<link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
  </HEAD>

<body  style="background-color: #ffffff">
<form id="dataForm" method="post" runat="server">
<table width="490" border="0" cellspacing="0" cellpadding="0" align="left">
	
	<tr>
		<td colspan="2" align="right">
			<div id="RepeaterDiv" runat="server">
			<table width="570" border="0" cellspacing="0" cellpadding="0">
						<tr> 
							<td width="130" class="requiredField"> Name</td>
							<td width="190" class="requiredField">&nbsp;Description</td>
							<td width="125" class="requiredField" align=center>Updated</td>
							<td width="135" height="20" align="right" class="requiredField"><a class="requiredField" href="AdminRolePermissions.aspx?roleid=-1">Add New Role >></a></td>
						</tr>
						<tr> 
							<td height="1" colspan="4" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
						</tr>
						<tr> 
							<td colspan="4" height="268" valign="top" align="left"><img src="../Images/shim.gif" width="1" height="1"><br>
			            <div class="patientDataFormDiv" id="PDFormDiv" style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; Z-INDEX: 1; VISIBILITY: visible; OVERFLOW: auto; BORDER-LEFT: #000000 1px; WIDTH: 600px; BORDER-BOTTOM: #000000 1px; POSITION: absolute; HEIGHT: 435px; BACKGROUND-COLOR: #ffffff; layer-background-color: #ffffff">	
			            <table width="570" border="0" cellspacing="0" cellpadding="0" align="left">
						<tr> 
							<td width="130" ><img src="../Images/shim.gif" width="1" height="1"></td>
							<td width="190" ><img src="../Images/shim.gif" width="1" height="1"></td>
							<td width="125" align=center><img src="../Images/shim.gif" width="1" height="1"></td>
							<td width="135" ><img src="../Images/shim.gif" width="1" height="1"></td>
						</tr>
						<asp:Repeater ID="rptRoles" Runat=server>
								<ItemTemplate>
									<tr> 
										<td height="25"  ><%# ((System.Data.DataRowView)Container.DataItem)["Role"]%>&nbsp;</td>
										<td height="25" ><%# ((System.Data.DataRowView)Container.DataItem)["RoleDescription"]%>&nbsp;</td>
										<td height="25"  align="right" ><%# ((System.Data.DataRowView)Container.DataItem)["UpdatedTime"]%>&nbsp;</td>
										<td align="right" nowrap>&nbsp;&nbsp;<a href="AdminRolePermissions.aspx?roleid=<%# ((System.Data.DataRowView)Container.DataItem)["RoleId"]%>"><img align="absbottom" src="../Images/ButtonEditSmall.gif" border="0"/></a>&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="DeleteBtn" OnCommand="DeleteButtonClick" CommandName='<%# ((System.Data.DataRowView)Container.DataItem)["RoleId"]%>' Runat=server ImageUrl="../Images/ButtonDeleteSmall.gif"></asp:ImageButton></td>
									</tr>
								</ItemTemplate>
								<SeparatorTemplate>
									<tr> 
										<td height="1" colspan="4" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
									</tr>
								</SeparatorTemplate>
								<FooterTemplate>
									<tr> 
										<td height="1" colspan="4" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
									</tr>
								</FooterTemplate>
						</asp:Repeater>
						</table>
					    </div>		
                        </td>
						</tr>
			</table>
			</div>
		
		<td>
    </tr>
    <tr>
		<td colspan="2"  valign="middle"><asp:Literal ID="valMsg" Runat=server></asp:Literal><img src="../Images/shim.gif" width="1" height="1"></td>
	</tr>
</table>
</form>
</body>
</html>
