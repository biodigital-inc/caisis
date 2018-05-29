
<%@ Page language="c#" CodeFile="ResearchSpecimenQuery.aspx.cs" AutoEventWireup="false" Inherits="Caisis.UI.Modules.SpecimenMgmt.ResearchSpecimenQuery" CodeBehind="ResearchSpecimenQuery.aspx.cs" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>LocalSpecimenQuery</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
		<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
		<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
		<script language="JavaScript" src="../../ClientScripts/aMask.js"> </script>
	</HEAD>
	<body >
		<form id="Form1" method="post" runat="server">
			<table width="700" align="center">
				<tr>
					<td class="sectiontitle" style="height:50px;" valign="bottom">Advanced Specimen Search</td>
				</tr>
			</table>
			<table class="PDForm" id="mainBody" style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; BORDER-BOTTOM: gray 1px solid"
				height="400" cellSpacing="0" cellPadding="0" width="700" align="center">
				<tr align="center">
					<td><asp:label id="lblMsg" runat="server" ForeColor="Red"></asp:label>
						<TABLE id="Table1" style="WIDTH: 682px; HEIGHT: 320px" cellSpacing="2" cellPadding="0"
							width="682" align="center" border="0">
							<TR>
								<TD style="WIDTH: 139px">1.Patients</TD>
								<TD style="WIDTH: 171px"></TD>
								<TD style="WIDTH: 96px"></TD>
								<td style="WIDTH: 123px; HEIGHT: 21px">
								&nbsp; 3. Treatment
								<td style="WIDTH: 82px"></td>
								<td></td>
							</TR>
							<tr>
								<td style="WIDTH: 139px; HEIGHT: 14px">Age at diagnosis:</td>
								<td style="HEIGHT: 14px">From&nbsp; <INPUT class="pdFormField" id="txtAgeFrom" style="WIDTH: 32px; HEIGHT: 19px" tabIndex="1"
										type="text" maxLength="50" size="1" name="VialBox#" runat="server" onkeypress="return aMask(this,event, '9999999999');">&nbsp;&nbsp;&nbsp; 
									To&nbsp; <INPUT class="pdFormField" id="txtAgeTo" style="WIDTH: 32px; HEIGHT: 19px" tabIndex="2"
										type="text" maxLength="50" size="1" name="VialBox#" runat="server" onkeypress="return aMask(this,event, '9999999999');">
								</td>
								<td style="WIDTH: 96px; HEIGHT: 14px"></td>
								<td style="WIDTH: 123px; HEIGHT: 14px">AdjuventAgent:</td>
								<td style="WIDTH: 82px; HEIGHT: 14px"><cc:caisisselect id="ddlAdjuventAgent" tabIndex="9" Width="108px" Runat="server" CssClass="pdFormField"></cc:caisisselect></td>
								<td style="HEIGHT: 14px"></td>
							</tr>
							<TR>
								<TD style="WIDTH: 139px">2.Diagnosis_Pathology</TD>
								<TD style="WIDTH: 172px"></TD>
								<TD style="WIDTH: 96px"></TD>
								<td style="WIDTH: 123px">4.Outcome</td>
								<td style="WIDTH: 82px"></td>
								<td></td>
							</TR>
							<TR>
								<TD style="WIDTH: 139px">Primary Historic Diagnosis</TD>
								<TD style="WIDTH: 172px"><cc:caisisselect id="ddlPriHistoricDiag" tabIndex="3" Width="145px" Runat="server" LookupCode="WMI_PATH_HISTDX"
										CssClass="pdFormField"></cc:caisisselect></TD>
								<TD style="WIDTH: 96px"></TD>
								<td style="WIDTH: 123px">Relapse Status(Yes)</td>
								<td style="WIDTH: 82px"><INPUT id="chkRelapseStatus" tabIndex="10" type="checkbox" name="RelapseStatus" runat="server"></td>
								<td></td>
							</TR>
							<TR>
								<TD style="WIDTH: 139px; HEIGHT: 19px">Histopathological Grade:</TD>
								<TD style="WIDTH: 172px; HEIGHT: 19px"><cc:caisisselect id="ddlHistopaGrade" tabIndex="4" Width="145px" Runat="server" LookupCode="WMI_PATH_NORMHISTDX"
										CssClass="pdFormField"></cc:caisisselect></TD>
								<TD style="WIDTH: 96px; HEIGHT: 19px"></TD>
								<td style="WIDTH: 123px; HEIGHT: 19px">Blood Samples:</td>
								<td style="WIDTH: 82px; HEIGHT: 19px">TissueSamples:</td>
								<td style="HEIGHT: 19px"></td>
							</TR>
							<TR>
								<TD style="WIDTH: 139px"></TD>
								<TD></TD>
								<td style="WIDTH: 96px"></td>
								<td style="WIDTH: 123px"><INPUT id="chkWholeBlood" tabIndex="11" type="checkbox" name="WholeBlood" runat="server">
									Whole Blood</td>
								<td style="WIDTH: 82px"><INPUT id="chkFresh" tabIndex="17" type="checkbox" name="Fresh" runat="server">
									Fresh</td>
								<td></td>
							</TR>
							<TR>
								<TD style="WIDTH: 139px">ER:</TD>
								<TD style="WIDTH: 172px"><cc:caisisselect id="ddlER" tabIndex="5" Width="108px" Runat="server" LookupCode="WMI_POSNEG" CssClass="pdFormField"></cc:caisisselect></TD>
								<TD style="WIDTH: 96px"></TD>
								<td style="WIDTH: 123px"><INPUT id="chkSerum" tabIndex="12" type="checkbox" name="WholeBlood" runat="server">
									Serum</td>
								<td style="WIDTH: 82px"><INPUT id="chkFFPE" tabIndex="18" type="checkbox" name="Fresh" runat="server">FFPE</td>
								<td></td>
							</TR>
							<tr>
								<td style="WIDTH: 139px">PR:</td>
								<td style="WIDTH: 172px"><cc:caisisselect id="ddlPR" tabIndex="6" Width="108px" Runat="server" LookupCode="WMI_POSNEG" CssClass="pdFormField"></cc:caisisselect></td>
								<td style="WIDTH: 96px"></td>
								<td style="WIDTH: 123px"><INPUT id="chkEDTAPlasma" tabIndex="13" type="checkbox" name="EDTAPlasma" runat="server">
									EDTA Plasma</td>
								<td style="WIDTH: 82px"><INPUT id="chkTMA" tabIndex="19" type="checkbox" name="TMA" runat="server">
									TMA</td>
								<td></td>
							</tr>
							<tr>
								<td style="WIDTH: 139px; HEIGHT: 26px">Her-21CC:</td>
								<td style="HEIGHT: 26px"><cc:caisisselect id="ddlHer" tabIndex="7" Width="108px" Runat="server" LookupCode="WMI_Path_Her2ICCValue"
										CssClass="pdFormField"></cc:caisisselect></td>
								<td style="WIDTH: 96px; HEIGHT: 26px"></td>
								<td style="WIDTH: 123px; HEIGHT: 26px"><INPUT id="chkBuffyCoat" tabIndex="14" type="checkbox" name="BuffyCoat" runat="server">Buffy 
									Coat</td>
								<td style="WIDTH: 82px; HEIGHT: 26px"></td>
								<td style="HEIGHT: 26px"></td>
							</tr>
							<tr>
								<td style="WIDTH: 139px; HEIGHT: 28px">Node Positive:</td>
								<td style="HEIGHT: 28px"><cc:caisisselect id="ddlNodePositive" tabIndex="7" Width="108px" Runat="server" LookupCode="WMI_YESNO"
										CssClass="pdFormField"></cc:caisisselect></td>
								<td style="WIDTH: 96px; HEIGHT: 28px"></td>
								<td style="WIDTH: 123px; HEIGHT: 28px"><INPUT id="chkGuthrieCard" tabIndex="15" type="checkbox" name="GuthrieCard" runat="server">Guthrie 
									Card</td>
								<td style="WIDTH: 82px; HEIGHT: 28px">TissueType:</td>
								<td style="HEIGHT: 28px"></td>
							</tr>
							<tr>
								<td style="WIDTH: 139px"></td>
								<td></td>
								<td style="WIDTH: 96px"></td>
								<td style="WIDTH: 123px"><INPUT id="chkDNA" tabIndex="16" type="checkbox" name="DNA" runat="server">DNA</td>
								<td style="WIDTH: 82px"><cc:caisisselect id="ddlTissueType" tabIndex="20" Width="108px" Runat="server" LookupCode="WMI_TissueType"
										CssClass="pdFormField"></cc:caisisselect></td>
								<td></td>
							</tr>
							<tr>
								<td style="WIDTH: 139px"></td>
								<td>
									<asp:imagebutton id="ibtnClear" runat="server" ImageUrl="..\..\Images\buttonClear.gif" EnableViewState="False"></asp:imagebutton></td>
								<td style="WIDTH: 96px"><asp:imagebutton id="enterButton" Width="66" Runat="server" Height="22" ImageUrl="../../images/Search_small.gif"></asp:imagebutton></td>
								<td style="WIDTH: 123px"></td>
								<td style="WIDTH: 82px"></td>
								<td></td>
							</tr>
						</TABLE>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
