<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportsIndex.aspx.cs" Inherits="Caisis.UI.Core.DataAnalysis.ReportsIndex"
    CodeFileBaseClass="Caisis.UI.Core.Classes.FramePage" %>

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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Caisis: Reports</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        Browser.ResizeElement({ nodeId: 'ReportsContainer', heightOffset: 125 });
        /* ]]> */
    </script>

</head>
<body style="background-color: #ffffff;">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td bgcolor="#ffffff" height="70">
                <uc1:pageHeader ID="PageHeader1" runat="server"></uc1:pageHeader>
            </td>
        </tr>
        <tr>
            <td class="MenuContainter">
                <a href="javascript:;" style="float: left; padding-top: .5em;">
                    <img onclick="MM_showHideLayers('currentList','','hide','commonTasks','','show','flashList','','hide')"
                        src="../../Images/Header/CommonTasks.gif" style="margin-left: 12px; margin-top: 2px;
                        border: none;" />
                </a>
                <div style="float: left; padding-left: 430px;">
                    <%--<custom:CustomMenu ID="menu" XMLMenuFile="~/App_Data/DataAnalysisConfig.xml" runat="server">
					    <custom:MenuBinding runat=server
					        DataMember="menu" 
					        DataTextField="name" 
					        DataFields="link" 
					        URL="{0}" 
					        URLTarget="ReportsContainer" />
					    <custom:MenuBinding runat=server 
					        DataMember="menuItem" 
					        DataTextField="name" 
					        DataFields="form" 
					        URL="Reports/ReportsContainer.aspx?report={0}" 
					        URLTarget="ReportsContainer" />
                    </custom:CustomMenu>--%>
                </div>
                <asp:PlaceHolder runat="server" ID="holder"></asp:PlaceHolder>
            </td>
        </tr>
        <tr>
            <td bgcolor="#c5c5bb">
                <img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <table width="100%" height="100%" cellpadding="0" cellspacing="0" bgcolor="#f8fafc" style=" width: 100%; table-layout: fixed;">
                    <tr>
                        <td align="center" valign="top">
                            <iframe runat="server" id="ReportsContainer" name="ReportsContainer" src="DataAnalysisSplash.aspx"
                                scrolling="no" frameborder="0" width="100%" style="width: 100%; height: 550px; overflow: hidden;"></iframe>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
