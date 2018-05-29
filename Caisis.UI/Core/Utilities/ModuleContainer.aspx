<%@ Page language="c#" Inherits="Caisis.UI.Core.Utilities.ModuleContainer" CodeFile="ModuleContainer.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.FramePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 
<%@ Register TagPrefix="val" TagName="PageHeader" Src="../Header/pageHeader.ascx" %>
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
		<link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
		<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
		<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
		<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
		
		
		<script type="text/javascript">  
        /* <![CDATA[ */

		    Browser.ResizeElement({ nodeId: 'ModuleWindow', heightOffset: 71 });
           
         /* ]]> */
        </script>
		
	</HEAD>
	<body style="margin: 0px 0px 0px 0px; height: 100%; padding: 0px 0px 0px 0px;" >
		<table height="100%" cellspacing="0" cellpadding="0" width="100%" border="0">
			<tr>
				<td bgColor="#ffffff" height="70">
					<val:PageHeader id="pageHeader" runat="server"></val:PageHeader>
				</td>
			</tr>
			<tr>
				<td valign="top" height="100%">
					<table id="contentTable" cellspacing="0" cellpadding="0" width="100%" height="100%" border="0">
						<tr>
							<td  align="center" style="vertical-align: top; border-top: 1px solid #3d556d;" >
								<iframe id="ModuleWindow" name="ModuleWindow" runat="server" frameBorder="0" width="100%" scrolling="no" height="100%"></iframe>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</HTML>