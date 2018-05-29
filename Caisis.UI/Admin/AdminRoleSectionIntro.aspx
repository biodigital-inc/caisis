<%@ Page language="c#" Inherits="Caisis.UI.Admin.AdminRoleSectionIntro" CodeFile="AdminRoleSectionIntro.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>Administrator</title>
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
</head>
  <body  style="background-color: #ffffff">
	
    <form id="Form1" method="post" runat="server">
		<table width="520" cellspacing="2" cellpadding="0">
			<!--- <tr>
				<td colspan="2" align=center class="boldText">Notes & Definitions</td>
			</tr>
			<tr>
				<td height="1" colspan="2" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
			</tr> --->
			<tr>
				<td  width="100" valign="top" class="boldText">Permissions</td><td>One permission can be assigned to zero or many roles.<br>The application is provided with eight permissions. There is no interface to edit these eight permissions and they should not be modified in the database. Permissions are integrated in the application logic and modfications will therefore cause the application to malfunction.</td>
			</tr>
			<tr>
				<td height="1" colspan="2" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
			</tr>
			<tr>
				<td  valign="top" class="boldText">Roles</td><td>One role can be assigned to zero or many groups.<br>Roles represent positions within institutions. Permissions granted to this role are based on the minimum functionality required to accomplish occupational tasks.</td>
			</tr>
			<tr>
				<td height="1" colspan="2" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
			</tr>
			<tr>
				<td  valign="top" class="boldText">Groups</td><td>One group must have only one role, but may be assigned to one or many datasets.<br><br>Groups are aggregations of users that have the same role, and access to the same one or more datasets. Primarily, groups are created to ease the burden of adding users to the system.</td>
			</tr>
			<tr>
				<td height="1" colspan="2" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
			</tr>
			<tr>
				<td  valign="top" class="boldText">Datasets</td><td>Datasets are assemblies of patients associated by any of four criteria (or dimensions): Institution, Disease, Physician, or Protocol. Datasets may be defined by any and/or SQL combination of the same criteria or mixed criteria.<br>
				* Please note, Datasets are defined by the Datasets.xml file in the App_Data folder. The dataset id's in this file MUST match the dataset id's viewed in this admin(the Datasets table). In version 2.0, only datasets defined by one institution are fully supported and have been thoroughly tested. The "Your Institution Name" dataset should be the default patient dataset. Use other datasets at your own risk. When a user is logged into a dataset, all patients they add will automatically be placed in that dataset. Patients imported into the database, must be assigned to the institution by some other means.</td>
			</tr>
		
		</table>
     </form>
	
  </body>
</html>
