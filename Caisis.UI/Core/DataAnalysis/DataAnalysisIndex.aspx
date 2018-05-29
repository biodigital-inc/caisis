<%@ Page language="c#" Inherits="Caisis.UI.Core.DataAnalysis.DataAnalysisIndex" CodeFile="DataAnalysisIndex.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.FramePage" %>
<%@ Register TagPrefix="uc1" TagName="pageHeader" Src="../Header/pageHeader.ascx" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<!--
		*********************************************************************************************************************
		
	    Caisis : Data Management System
		Copyright(C) 2015 BioDigital, Inc., All Rights Reserved. 

		Unless explicitly acquired and licensed from Licensor, the contents of this file are subject to  the GNU PUBLIC LICENSE 
		("GPU") Version 2, or subsequent versions as allowed by the GPU, and You may not copy or use this file in either source
		code or executable form, except in compliance with the terms and conditions of the GPU. 

		You may obtain a copy of both the GPU at http://www.caisis.org. 

		All software distributed under the Licenses is provided strictly on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND,  EITHER EXPRESS OR IMPLIED, AND THE CAISIS TEAM HEREBY DISCLAIMS ALL SUCH WARRANTIES, INCLUDING WITHOUT LIMITATION,  ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR  PURPOSE, QUIET ENJOYMENT, OR NON-INFRINGEMENT.  FOR THE AVOIDANCE OF DOUBT, LICENSOR DOES NOT WARRANT THAT THE SOFTWARE WILL MEET CUSTOMER'S REQUIREMENTS OR BE ERROR-FREE OR SECURE. USE OF THE SOFTWARE IS AT YOUR OWN RISK AND YOU ARE SOLELY RESPONSIBLE FOR THE SECURITY, ACCURACY, TRANSMISSION AND USE OF THE DATA.
        See the  Licenses for specific language governing rights and limitations under the Licenses. 
		
		
		**********************************************************************************************************************
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Caisis: Data Analysis</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta content="NOINDEX" name="ROBOTS">
		<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
		<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
		<LINK href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
		<script src="../../ClientScripts/Menu.js" type="text/javascript"></script>
	</HEAD>
	<body leftMargin="0" topMargin="0" rightMargin="0">
		<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td bgColor="#ffffff" height="70"><uc1:PageHeader id="PageHeader1" runat="server"></uc1:PageHeader></td>
				</tr>
				<tr>
					<td  class="MenuContainter">
				<a href="javascript:;"  style="float: left; padding-top: .5em;">
				    <img onclick="MM_showHideLayers('currentList','','hide','commonTasks','','show','flashList','','hide')" src="../../Images/Header/CommonTasks.gif"  style="margin-left: 12px; margin-top: 2px; border: none;" />
				</a>
				<div style="float:left; padding-left: 218px;">
					<custom:CustomMenu ID="menu" XMLMenuFile="~/App_Data/DataAnalysisConfig.xml" runat="server">
					    <custom:MenuBinding runat=server 
					        DataMember="menu" 
					        DataTextField="name" 
					        DataFields="link" 
					        URL="{0}" 
					        URLTarget="DataAnalysisContainer" />
					    <custom:MenuBinding runat=server 
					        DataMember="menuItem" 
					        DataTextField="name" 
					        DataFields="form" 
					        URL="Reports/ReportsContainer.aspx?report={0}" 
					        URLTarget="DataAnalysisContainer" />
					</custom:CustomMenu>
					</div>
					<asp:PlaceHolder runat="server" ID="holder"></asp:PlaceHolder>
					</td>
				</tr>
				<!--<tr><td bgColor="#00668d" height="23"><A href="javascript:;"><IMG onclick="MM_showHideLayers('currentList','','hide','commonTasks','','show','flashList','','hide')" hspace="15" src="../../Images/Header/CommonTasks.gif" border="0" vspace="3" align="middle"></A></td></tr>-->
				<tr>
					<td bgColor="#c5c5bb"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
				</tr>
			<tr>
				<td align="center" valign="top">
					<table width="100%" height="95%" cellpadding="0" cellspacing="0" bgcolor="#f8fafc">
						<tr>
							<td height="10" align="center">&nbsp;</td>
						</tr>
						<tr>
							<td align="center" valign="top">
								<iframe id="DataAnalysisContainer" name="DataAnalysisContainer" src="DataAnalysisSplash.aspx" width="950" height="550" scrolling="no" frameborder="0" runat="server">
								</iframe>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>
