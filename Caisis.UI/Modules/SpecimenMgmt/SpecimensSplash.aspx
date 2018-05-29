<%@ Page language="c#" CodeFile="SpecimensSplash.aspx.cs" AutoEventWireup="True" Inherits="Caisis.UI.Modules.SpecimenMgmt.SpecimensSplash"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml" >
	<head>
		<title>View Specimens Splash</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1" />
		<meta name="CODE_LANGUAGE" Content="C#" />
		<meta name="vs_defaultClientScript" content="JavaScript" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
		<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	</head>
	<body>
		<form id="dataForm" method="post" runat="server">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td align="center" height="380">
					    <br/>
						<br/>
						<table cellpadding="0" cellspacing="0" border="0" class="splashBG" width="776" height="224">
							<tr>
								<td height="46">
									<img src="../../Images/SplashWhatWouldYouLikeToDo.gif" height="14" border="0" hspace="20">
								</td>
							</tr>
							<tr>
								<td align="center">
									<table cellpadding="0" cellspacing="0" border="0" width="700">
										<tr style="text-align:center;">
											<td style="width:25%;">
											    <a href="SpecimenQueryResults.aspx?viewall=true">
											        <img alt="View All Specimens" title="View All Specimens" src="Images\ViewAllSpecimens.gif" border="0" />
											    </a>
											</td>
											<td style="width:25%;">
											    <a href="SpecimenQueryResults.aspx?viewall=false">
											        <img alt="View Available Specimens" title="View Available Specimens" src="Images\splashOptionsViewAvailableSpecimens.gif" border="0" />
											    </a>
											</td>
											<td style="width:25%;">
											    <a href="LocalSpecimenQuery.aspx">
											        <img alt="Basic Specimen Search" title="Basic Specimen Search" src="Images\BasicSpecimenSearch.gif" border="0" />
											    </a>
											</td>
											<td style="width:25%;">
											    <a href="BTCSpecimenQuery.aspx">
											        <img alt="BTC Specimen Search" title="BTC Specimen Search" src="Images\splashOptionsBrainTumorSpecimenSearch.gif" border="0" />
											    </a>
											</td>
											<td style="width:25%;">
											    <a href="AdvancedBreastSpecimenQuery.aspx">
											        <img alt="Breast Specimen Search" title="Breast Specimen Search" src="Images\BreastSpecimenSearch.gif" border="0" />
											    </a>
											</td>
										</tr>
									</table>
									<br />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
