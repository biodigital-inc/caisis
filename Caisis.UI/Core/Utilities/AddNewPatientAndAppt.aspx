<%@ Reference Control="~/Core/Utilities/ErrorMsg.ascx" %>
<%@ Register TagPrefix="val" TagName="ErrorMsg" Src="../Utilities/ErrorMsg.ascx" %>
<%@ Register TagPrefix="val" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="../Help/helpToolTip.ascx" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Page language="c#" Inherits="Caisis.UI.Core.Utilities.AddNewPatientAndAppt" CodeFile="AddNewPatientAndAppt.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<%@ Import Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>New Patient and Appointment</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<link href="../../StyleSheets/EformStyles.css" type="text/css" rel="stylesheet">
		<link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css">
		<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
		<script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>	
		<script src="../../ClientScripts/Help.js" type="text/javascript"></script>
		<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
		<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
		<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
		
		
		<script type="text/javascript">
		var helpArray = new Array();
		<asp:Repeater ID="rptToolTip" runat=server>
		<ItemTemplate>
			helpArray.<%# DataBinder.Eval(Container.DataItem, "FieldName") %>="<%# PageUtil.EscapeDoubleQuotes(DataBinder.Eval(Container.DataItem, "FieldDescription").ToString()) %>";
		</ItemTemplate>
		</asp:Repeater>
		</script>
		
		<style type="text/css">
        span.pdFormFieldLabel {
            display: none;
        }
        </style>

	</HEAD>
	<body id="addAPatientAndApptBody" runat="server" bottomMargin="0" leftMargin="0" topMargin="0"
		rightMargin="0" style="background-color: #ffffff;">
		<uc1:helpToolTip id="HelpToolTipLayer" runat="server" />
		<form id="dataForm" method="post" runat="server">
			<input type="hidden" id="IsDirtyPostBack" name="IsDirtyPostBack" value="true" runat="server">
			<table width="100%" height="93%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center" valign="top">
						<table width="590" border="0" cellspacing="0" cellpadding="0" >
							<tr>
								<td colspan="6" class="EFormPopupTitleCell" height="23"><img src="../../Images/CloseSmall.gif" width="38" height="8" vspace="3" align="right" style="cursor: pointer;" onClick="parent.ClosePopup();" />Add a New Patient and Appointment<!--- &nbsp;&nbsp;<asp:label ID="patientDataTitleSection" Runat="server"></asp:label><asp:label ID="patientDataTitleName" Runat="server"></asp:label><img src="../../Images/shim.gif" width="30" height="1"><a href="#"><IMG border="0" alt="" src="../../Images/Workflows/WorkflowPage1On.gif" hspace="15"></a><a href="#"><IMG alt="" src="../../Images/Workflows/WorkflowPage2Off.gif" hspace="15" border="0"></a><a href="#"><IMG alt="" src="../../Images/Workflows/WorkflowPage3Off.gif" hspace="15" border="0"></a><a href="#"><IMG alt="" src="../../Images/Workflows/WorkflowPage4Off.gif" hspace="15" border="0"></a> ---></td>
							</tr>
							<tr>
								<td colspan="6"><img src="../../Images/shim.gif" width="10" height="8"></td>
							</tr>
							<tr>
								<td ><img src="../../Images/shim.gif" width="1" height="1"></td>
								<td colspan="4" ><img src="../../Images/shim.gif" width="10" height="8"></td>
								<td ><img src="../../Images/shim.gif" width="1" height="1"></td>
							</tr>
							<tr>
								<td  valign="top">&nbsp;
								</td>
								<td colspan="2">&nbsp;</td>
								<td colspan="2"> <asp:Literal ID="PageText" Runat="server" >Please enter all available information 
									for this patient. Fields named in <span class="requiredField">red</span> are 
									required.</asp:Literal><br>
									<br>
									<val:ErrorMsg id="errMsg" runat="server"></val:ErrorMsg></td>
								<td >&nbsp;</td>
							</tr>
							<tr>
								<td ><img src="../../Images/shim.gif" width="1" height="1"></td>
								<td colspan="4" ><img src="../../Images/shim.gif" width="10" height="8"></td>
								<td><img src="../../Images/shim.gif" width="1" height="1"></td>
							</tr>
							<tr>
								<td >&nbsp;</td>
								<td colspan="2" >&nbsp;</td>
								<td colspan="2" valign="top"  height="190">
									<div class="patientDataFormDiv" id="PDFormDiv" style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; VISIBILITY: visible; OVERFLOW: auto; BORDER-LEFT: #000000 1px; WIDTH: 560px; BORDER-BOTTOM: #000000 1px; HEIGHT: 220px; background-color: #ffffff;">
										<!-- begin patient form -->
										<table width="555" border="0" cellspacing="0" cellpadding="4" >
											<tr> 
												<td width="65"><val:PDLabel id="PtFirstName_PdLabel" Text="First" Field="PtFirstName" Required="No" runat=server /></td>
												<td width="190"><INPUT type="text" runat=server id="PtFirstName" tabindex="1" NAME="PtFirstName"/></td>
												<td width="70"><val:PDLabel id="AppointmentDate_PdLabel" Text="Date" Field="ApptClinicDate" Required="Yes" runat=server /></td>
												<td width="200">
													<INPUT type="text" runat=server id="AppointmentDate" tabindex="5"  NAME="AppointmentDate"/>
													<img id="AppointmentDateCal" Src="../../Images/Calendar/cal.gif" width="16" height="16" border="0" alt="select date" runat="server"/>
												</td>
												<td width="10">&nbsp;</td>
											</tr>
											<tr> 

												<td ><val:PDLabel id="PtLastName_PdLabel" Text="Last" Field="PtLastName" Required="Yes" runat=server /></td>
												<td><INPUT type="text" runat=server id="PtLastName" name="ptLastName" tabindex="2"  /></td>
												<td><val:PDLabel id="AppointmentTime_PdLabel" Text="Time" Field="ApptTime" Required="Yes" runat=server /></td>
												<td><INPUT type="text" runat=server id="AppointmentTime" tabindex="6"  NAME="AppointmentTime"/></td>
												<td>&nbsp;</td>
											</tr>
											<tr> 
												<td><val:PDLabel id="PtMRN_PdLabel" Text="MRN" Field="PtMRN" Required="Yes" runat=server /></td>
												<td><INPUT type="text" runat=server id="PtMRN" NAME="PtMRN" tabindex="3"  /></td>
												<td><val:PDLabel id="ApptVisitType_PdLabel" Text="Visit Type" Field="ApptVisitType" Required="No" runat=server /></td>
												<td>
													<select runat="server" id="ApptVisitType" name="ApptVisitType" tabindex="7"/>
												</td>
												<td>&nbsp;</td>
											</tr>
											<tr> 
												<%--<td><select id="ApptPhysician" name="ApptPhysician" tabindex="4" runat="server"/></td>--%>
												<td><val:PDLabel id="ApptPhysician_PdLabel" Text="Physician" Field="ApptPhysician" Required="Yes" runat=server /></td>
												<td><cic:CaisisComboBox LookupDistinct="Appointments;ApptPhysician;ApptPhysician" Table="Appointments" Field="ApptPhysician" FieldLabel="" ID="ApptPhysician" runat=server></cic:CaisisComboBox></td>
												<td><val:PDLabel id="ApptNotes_PdLabel" Text="Notes" Field="ApptNotes" Required="No" runat=server /></td>
												<td rowspan="2" valign="top"><textarea id="ApptNotes" maxlength="253" cols="20" rows="4" class="inputFieldFlat" runat="server" NAME="ApptNotes" tabindex="8" ></textarea></td>
												<td>&nbsp;</td>
											</tr>
											<tr> 
												<td><val:PDLabel id="ApptDept_PdLabel" Text="Department" Field="ApptDept" Required="No" runat=server /></td>
												<td>
													<select id="ApptDept" name="ApptDept" tabindex="9" runat="server"/>
												</td>
												<td>&nbsp;</td>
											</tr>
										</table>
										<!-- end form -->
									</div>
								</td>
								<td >&nbsp;</td>
							</tr>
							<tr>
								<td  height="25">&nbsp;</td>
								<td colspan="4"  align="center" valign="bottom">
									<asp:Label ID="PermissionsMsg" Runat="server"></asp:Label>
									<asp:imagebutton ID="saveBtn" TabIndex="11" OnCommand="onBtn_Click" EnableViewState="False" runat="server"
										ImageUrl="../../Images/addThisPatientToTheDatabase.gif" Height="22px" Width="200px" CssClass="PDButtonOn"></asp:imagebutton></td>
								<td >&nbsp;</td>
							</tr>

						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
