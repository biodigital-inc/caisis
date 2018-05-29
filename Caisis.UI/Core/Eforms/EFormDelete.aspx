<%@ Reference Page="~/Core/Eforms/EFormList.aspx" %>
<%@ Page language="c#" Inherits="Caisis.UI.Core.Eforms.EFormDelete" CodeFile="EFormDelete.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.EFormBasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>EFormDelete</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../StyleSheets/EFormStyles.css" rel="stylesheet" type="text/css">
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css">
  </head>
  <body>
	<form id="Form1" method="post" runat="server">

	<table width="925" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td colspan="6" height="28">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="6" class="patientDataSectionTitle"></td>
	</tr>
	<tr>
		<td colspan="6"><img src="../../Images/shim.gif" width="10" height="8"></td>
	</tr>
	<tr>
		<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
		<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="10" height="5"></td>
		<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="20" height="5"></td>
		<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="490" height="5"></td>
		<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="395" height="5"></td>
		<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
	</tr>
	<tr>
		<td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
		<td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8"></td>
		<td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
	</tr>
	<tr>
		<td class="ListManBGTableLeftSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
		<td colspan="4" class="ListManBGTableBody"><img src="../../Images/shim.gif" width="10" height="8"></td>
		<td class="ListManBGTableRightSide"><img src="../../Images/shim.gif" width="1" height="1"></td>
	</tr>
	<tr>
		<td height="370" class="ListManBGTableLeftSide">&nbsp;</td>
		<td colspan="2" class="ListManBGTableBody">&nbsp;</td>
		<td colspan="2" class="ListManBGTableBody" align=center>
		<br>
		<span class="patientDataSectionTitle"><asp:Literal ID="UserMsg" Runat= server></asp:Literal></span>
		<br><br><br>
		
		<asp:ImageButton ID="CancelBtn" Visible="False" ImageUrl="../../Images/ReturnToEForm.gif" OnCommand="ReturnToEFormOnBtnClick" Runat=server width="164" height="25" border="0" style="cursor:pointer;"/>
		<img src="../../Images/shim.gif" width="30" height="1">
		<asp:ImageButton ID="DeleteBtn" Visible="False" ImageUrl="../../Images/DeleteThisEForm.gif" OnCommand="DeleteOnBtnClick" Runat=server width="133" height="22" border="0" style="cursor:pointer;"/>
     	<br/><br/><br/><br/>
	 </td>
		<td class="ListManBGTableRightSide">&nbsp;</td>
	</tr>
	<tr>
		<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
		<td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="10" height="5"></td>
		<td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="20" height="5"></td>
		<td colspan="2" class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="1" height="1"></td>
		<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
	</tr>

	</table>
	 </form>
  </body>
</html>
