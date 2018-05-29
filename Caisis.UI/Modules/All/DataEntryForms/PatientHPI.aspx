<%@ Page language="c#" Inherits="Caisis.UI.Modules.All.DataEntryForms.PatientHPI" CodeFile="PatientHPI.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Caisis: Reports</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta content="NOINDEX" name="ROBOTS">
		<meta http-equiv="PRAGMAS" content="NO-CACHE">
		<meta http-equiv="EXPIRES" content="0">
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
	<link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css">
	
	
	<script type="text/javascript">
	    function setSummaryTDHeight()
	    {
	        parent.document.getElementById('HPIFrame').style.height = (document.getElementById('HPITable').offsetHeight + 10) + "px";
	    }
	
	</script>
	
  </head>
 <body style="background-color:white;" class="reportContentBody" bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" onload="setSummaryTDHeight()" >
<table align="center" border="0" cellpadding="4" cellspacing="0" style="width: 440px;" id="HPITable">
	<tr>
		<td valign="top">
			<table width="100%">
				<tr>
					<td valign="top" >
					<span style="font-weight:bold; white-space: nowrap;">History of Present Illness<asp:Literal ID="HpiTypeDisplay" runat="server" />:</span><br/><asp:Literal ID="HPIerrorMsg" Visible="False" Runat="server" />
						<asp:Repeater ID="hpi" runat="server" OnItemDataBound="hpiItemDataBound">
						<ItemTemplate>
							<%# DataBinder.Eval(Container.DataItem, "patientHPI") %><br/><asp:Literal ID="StartNextHpiColumn" Runat="server" />
						</ItemTemplate>
						</asp:Repeater>
						<asp:Repeater ID="hpiBreast" runat="server" OnItemDataBound="hpiItemDataBound">
						<ItemTemplate>
							<%# DataBinder.Eval(Container.DataItem, "VarDate") %> <%# DataBinder.Eval(Container.DataItem, "VarSummary") %><br/><asp:Literal ID="StartNextHpiColumn" Runat="server" />
						</ItemTemplate>
						</asp:Repeater>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	
	<div id="nomogramPanel" runat="server" visible="false">
	<tr>
		<td >
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td rowspan="4" width="170" valign="top"><span style="font-weight:bold;">Nomogram Scores:</span></td>
					<td width="40">PreRP&nbsp;5:</td>
					<td width="85"><asp:Label ID="preRP5Nomo" Runat="server"></asp:Label></td>
					<td width="70">Post 2 year:</td>
					<td  width="75"><asp:Label ID="postRP2yrNomo" Runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td>PreRP&nbsp;10:</td>
					<td><asp:Label ID="preRP10Nomo" Runat="server"></asp:Label></td>
					<td>Post 5 year:</td>
					<td><asp:Label ID="postRP5yrNomo" Runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td>PreXRT:</td>
					<td><asp:Label ID="preXRTNomo" Runat="server"></asp:Label></td>
					<td>Post 7 year:</td>
					<td><asp:Label ID="postRP7yrNomo" Runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td>PreBrachy:</td>
					<td><asp:Label ID="preBrachyNomo" Runat="server"></asp:Label></td>
					<td>Post 10 year:</td>
					<td><asp:Label ID="postRP10yrNomo" Runat="server"></asp:Label></td>
				</tr>
				<tr id="NomogramErrorTableRow" runat="server">
					<td colspan="5"><br/><asp:Label ID="NomogramError" Runat="server" /></td>
				</tr>
			</table>
		</td>
	</tr>
	</div>
</table>
  </body>
</html>
