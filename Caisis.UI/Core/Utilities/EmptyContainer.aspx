<%@ Page language="c#" Inherits="Caisis.UI.Core.Utilities.CommonTasks" CodeFile="EmptyContainer.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.FramePage" %>


<%@ Register TagPrefix="val" TagName="PageHeader" Src="../Header/pageHeader.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Caisis</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta content="NOINDEX" name="ROBOTS">
		<meta http-equiv="PRAGMAS" content="NO-CACHE">
		<meta http-equiv="EXPIRES" content="0">
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
		

		
		<LINK href="../../Stylesheets/GlobalStyles.css" type="text/css" rel="stylesheet">
		<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
		
		

	</HEAD>
	<body leftMargin="0" topMargin="0" rightMargin="0">
		<table height="100%" cellSpacing="0" cellPadding="0" width="100%" border="0">
			<tr>
				<td height="70" bgcolor="#ffffff"><val:PageHeader id="pageHeader" runat="server"></val:PageHeader></td>
			</tr>
			<tr>
				<td bgColor="#3d556d" height="23"><A href="javascript:;"><IMG onclick="MM_showHideLayers('currentList','','hide','commonTasks','','show','flashList','','hide')" hspace="15" src="../../Images/Header/CommonTasks.gif" border="0" vspace="3" align="middle"></A></td>
			</tr>
			<tr>
				<td align="middle" valign="top">
					<iframe id="TaskContainer" frameBorder="0" width="950" height="500" scrolling="no" runat="server"></iframe>
				</td>
			</tr>
		</table>
	</body>
</HTML>
