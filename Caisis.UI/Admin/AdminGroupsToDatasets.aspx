<%@ Page EnableEventValidation="false" language="c#" Inherits="Caisis.UI.Admin.AdminGroupsToDatasets" CodeFile="AdminGroupsToDatasets.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 
<HTML>
  <HEAD>
		<title></title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta content="NOINDEX" name="ROBOTS">
		<meta http-equiv="PRAGMAS" content="NO-CACHE">
		<meta http-equiv="EXPIRES" content="0">
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
		<link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css">
  </HEAD>

<body class="AdminBody">
	<form id="dataForm" method="post" runat="server">
	<table width="520" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="right"><a href="AdminGroupsSplash.aspx"  class="requiredField">< back</a>
				<table id="SelectDatasetTable" runat="server" width="520" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="adminFieldLabel" width="120">select dataset</td>
						<td><input id="SelectSubmitted" runat="server" type="hidden" value="false" NAME="SelectSubmitted">
						<select id="SelectDatasetName" runat="server" style="width:200" NAME="SelectDatasetName"></select></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
				</table>
				<table id="SelectGroupTable" runat="server" width="520" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="adminFieldLabel"  width="120" valign="top">groups in dataset</td>
						<td align=left><asp:Literal ID="datasetMessage" Runat=server></asp:Literal>
							<table width="400" border="0" cellspacing="0" cellpadding="0">
							<asp:Repeater ID="rptDatasetGroups" Runat=server>
								<ItemTemplate>
									<tr valign="middle"> 
										<td height="25" width="125">&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["GroupName"]%></td>
										<td width="75" align=left><asp:ImageButton ID="DeleteBtn" OnCommand="DeleteButtonClick" CommandName='<%# ((System.Data.DataRowView)Container.DataItem)["GroupId"]%>' Runat=server src="../Images/ButtonDelete.gif"></asp:ImageButton></td>
									</tr>
								</ItemTemplate>
								<SeparatorTemplate>
									<tr> 
										<td height="1" colspan="2" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
									</tr>
								</SeparatorTemplate>
								<FooterTemplate>
									<tr> 
										<td height="1" colspan="2" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
									</tr>
								</FooterTemplate>
							</asp:Repeater>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td width="120" height="30" class="adminFieldLabel">add new group</td>
						<td align=left>
							<table width="330" border="0" cellspacing="0" cellpadding="0">
								<tr valign="middle"> 
									<td height="30" width="125"><select id="Group" runat="server" style="width:200" NAME="Group"></select></td>
									<td width="50" align=left><asp:ImageButton OnClick="AddButtonClick" Runat=server ID="AddBtn"></asp:ImageButton></td>
								</tr>
							</table>
						</td>
					</tr>		
				</table>
			</td>
		</tr>
	<tr>
		<td height="50" valign="middle"><asp:Literal ID="valMsg" Runat=server></asp:Literal></td>
	</tr>
	</table>
</form>
</body>
</HTML>