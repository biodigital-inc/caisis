<%@ Page language="c#" Inherits="Caisis.UI.Core.PaperForms.FormsSplash" CodeFile="FormsSplash.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>FormsSplash</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
	<LINK href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script language="javascript">
		var onPatientList = true;
	</script>
  </head>
  <body onload="top.showMenus(false);">
  	<form id="dataForm" method="post"><script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<tr>
		<td align="center" height="380"><br/><br/>
		<table cellpadding="0" cellspacing="0" border="0" class="splashBG" width="776" height="224">
			<tr>
				<td height="46">
					<img id="splashTitle" runat=server src="../../Images/SplashWhatWouldYouLikeToDo.gif" height="14" border="0" hspace="20" />
				</td>
			</tr>
			<tr>
				<td height="1">
					<img src="../../Images/shim.gif" height="1" width="1" border="0" />
				</td>
			</tr>
			<tr>
				<td align="center">
					<table  cellpadding="0" cellspacing="0" border="0" width="700">
						<tr>
						<td align="center" width="175" valign="top"><a id="batchPrintLink" runat="server" href="BatchPrint.aspx"><img id="printForms" runat="server" name="printForms" src="../../Images/FormSplashPrintFormsFor.gif" width="80" height="61" border="0" /></a><br/><asp:Label CssClass="formSplashCurrentClinic" ID="formSplashCurrentClinic" Runat="server"></asp:Label><br/><img id="clinicDateCal" runat="server" src="../../Images/Calendar/cal.gif" width="16" height="16" border="0" alt="Enter Clinic Date" align="absMiddle" class="pdFormFieldButtonOn" /><input type="hidden"  ID="clinicDate" class="pdFormField" runat="server" NAME="clinicDate">
						</td>
						<td align="center" width="175" valign="top"><a id="currentPatientLink" runat="server" href="FormsContainer.aspx"><img id="printFormForCurrentPatient" name="printFormForCurrentPatient" src="../../Images/printPopFormsForTheCurrentPatient.gif" width="119" height="78" border="0" runat="server"></a>
						</td>
						<td align="center" width="150" valign="top"><a href="FormsContainer.aspx?blankForms=true"><img id="blankForms" name="blankForms" src="../../Images/PrintBlankForms.gif" width="67" height="77" border="0"></a>
						</td>
						<!-- need to add security if keep this link here
						<td align="center" width="200" valign="top"><a id="EFormLink" href="../EForms/EFormSplash.aspx" ><img id="EFormIcon" name="EFormIcon" src="../../Images/FormSplashEnterEForm.gif" width="105" height="76" border="0"></a>
						</td>-->
						</tr>
					</table><br/><br/>
				</td>
			</tr>
		</table>
		</td>
		</tr>
	</table>
	</form>
  </body>
</html>
