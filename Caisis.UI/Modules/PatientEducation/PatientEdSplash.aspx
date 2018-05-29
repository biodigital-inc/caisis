<%@ Page language="c#" CodeFile="PatientEdSplash.aspx.cs" AutoEventWireup="True" Inherits="Caisis.UI.Modules.PatientEducation.PatientEdSplash"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml" >
	<head>
		<title>Patient Education Splash</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1" />
		<meta name="CODE_LANGUAGE" Content="C#" />
		<meta name="vs_defaultClientScript" content="JavaScript" />
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
		<link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />

		<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
		<script src="PatientEdScripts.js" type="text/javascript"></script>
		<script type="text/javascript">

		
		function setCallBackType(s) 
		{
		    $('_callbackType').value = s;
		    //alert($('_callbackType').value); 
		}
	    </script>
	</head>
	<body>
		<form id="dataForm" method="post" runat="server">
		    <asp:HiddenField ID="_callbackType" runat="server" />
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
					                <table  cellpadding="0" cellspacing="0" border="0" width="600">
						                <tr>
						                    <td align="center" width="33%" valign="top"><a href="Index.aspx?goToSection=AssembleContent" target="_parent" onclick="top.clearPatientInHeader();"><img  src="Images/IconPrintEducationMaterial.gif"  border="0" title="Print education material for no particular patient"></a> </td>
						                    <td align="center" width="33%" valign="top"><img style="cursor:pointer;" onclick="parent.showSelectPatientPanel('PtEd');" src="Images/IconPrintMaterialForASpecificPatient.gif"  border="0" title="Print education material for a patient"></td>
						                    <td runat=server id="ManagementIcon" visible="false" align="center" width="33%" valign="top"><a href="ManageContent.aspx?mode=Single"><img  src="Images/IconManageEducationMaterials.gif"  border="0" title="Manage education materials"></a></td>
						                </tr>
					                </table><br><br>
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
