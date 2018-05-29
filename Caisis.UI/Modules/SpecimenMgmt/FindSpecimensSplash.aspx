<%@ Page language="c#" CodeFile="FindSpecimensSplash.aspx.cs" AutoEventWireup="True" Inherits="Caisis.UI.Modules.SpecimenMgmt.FindSpecimensSplash"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>SpecimenSplash</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1" />
		<meta name="CODE_LANGUAGE" Content="C#" />
		<meta name="vs_defaultClientScript" content="JavaScript" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
		<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	</head>
	<body>
		<div id="ReportsMsg" style="Z-INDEX: 4; LEFT: 100px; VISIBILITY: hidden; OVERFLOW: auto; WIDTH: 100%; POSITION: absolute; TOP: 10px">
		</div>
		<form id="dataForm" method="post" runat="server">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td align="center" height="380">
					    <br>
						<br>
						<table cellpadding="0" cellspacing="0" border="0" class="splashBG" width="776" height="224">
							<tr>
								<td height="46">
									<img id="splashTitle" runat="server" src="../../Images/SplashWhatWouldYouLikeToDo.gif" height="14" border="0" hspace="20">
								</td>
							</tr>
							<tr>
								<td height="1">
									<img src="../../Images/shim.gif" height="1" width="1" border="0">
								</td>
							</tr>
							<tr>
								<td align="center">
									<table cellpadding="0" cellspacing="0" border="0" width="700">
										<tr style="text-align:center;">
											<td>
											    <a href="SpecimenQueryResults.aspx">
											        <img runat="server" alt="View All Specimens" src="Images\ViewAllSpecimens.gif" border="0" />
											    </a>
											</td>
											<td>
											    <a href="LocalSpecimenQuery.aspx">
											        <img runat="server" alt="Basic Specimen Query" src="Images\BasicSpecimenSearch.gif" border="0" />
											    </a>
											</td>
											<td>
											    <a href="AdvancedBreastSpecimenQuery.aspx">
											        <img runat="server" alt="Breast Specimen Query" src="Images\BreastSpecimenSearch.gif" border="0" />
											    </a>
											</td>
											<td>
												<a href="AdvancedProstateSpecimenQuery.aspx">
												    <img runat="server"  alt="Prostate Specimen Query" src="Images\ProstateSpecimenSearch.gif" border="0" />
												</a>
											</td>
										</tr>
									</table>
									<br>
									<br>
									<br>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
