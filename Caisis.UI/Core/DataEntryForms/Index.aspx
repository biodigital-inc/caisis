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
<%@ Register TagPrefix="val" TagName="PageHeader" Src="../Header/pageHeader.ascx" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Core_PatientDataEntry_Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Caisis: Cancer Data Management System : Patient Data</title>
    <meta content="NOINDEX" name="ROBOTS" />
    <link href="../../Stylesheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../Stylesheets/MenuStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    <script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
    <script src="../../ClientScripts/Menu.js" type="text/javascript"></script>
    <script src="../../ClientScripts/workflows.js" type="text/javascript"></script>
    <script type="text/javascript">

        function startDynamicEformDataEntry(link) {
            top.WORKFLOW_ACTIVE = true;
            top.pdIsExpanded = true;
            expandPatientDataFrame();
        }

        function endDynamicEformDataEntry() {
            refreshChronList();
            $('DataEntryFrame').src = 'PatientDataEntryContainer.aspx';
        }
    
    </script>
    <style type="text/css">
    ul#menu>li>ul>li>a
    {
        color: #ff0000;
    }
    </style>
</head>
<body>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td bgcolor="#ffffff" height="70">
                <val:PageHeader ID="pageHeader" runat="server"></val:PageHeader>
            </td>
        </tr>
        <tr>
            <td class="MenuContainter">
                <%-- Menu Start --%>
                <a href="javascript:;" style="float: left;">
                    <img onclick="MM_showHideLayers('currentList','','hide','commonTasks','','show','flashList','','hide');"
                        hspace="0" src="../../Images/Header/CommonTasks.gif" border="0" align="middle"  style="margin-left: 12px; margin-top: 6px;" />
                </a>
                <div style="float: left; padding-left: 190px;">
                    <asp:Label ID="PageTitle" runat="server" />
                    <custom:CustomMenu ID="menu" runat="server" Depth="3" CaisisConfigurationType="PatientDataEntryConfig">
				       <custom:MenuBinding runat="server" 
				       DataMember="menu"  
				       DataTextField="title" 
				       DisplayNodeField="display"/>
				       <custom:MenuBinding  runat="server"
				       DataFields="fileName,menuTitle,tableName,chronListOption,title" 
				       DataMember="menuItem" 
				       DataTextField="menuTitle" 
				       URL="PatientDataEntryContainer.aspx?tableName={2}&parentTable={p.2}" 
				       URLTarget="DataEntryFrame" 
				       OnClientClick="refreshChronList('{3}');" 
				       DisplayNodeField="display"
				       />
                    </custom:CustomMenu>
                </div>
                <%-- Menu End --%>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table id="contentTable" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td valign="top" align="center">
                            <iframe id="ChronListFrame" runat=server name="ChronListFrame" src="ChronList.aspx" frameborder="0"
                                width="370" scrolling="no" height="510"></iframe>
                        </td>
                        <td valign="top" align="center"><iframe runat="server" id="DataEntryFrame" name="DataEntryFrame" src="PatientDataEntryContainer.aspx"
                                frameborder="0" width="625" scrolling="no" height="490"></iframe>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
