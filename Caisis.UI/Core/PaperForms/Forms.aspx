<%@ Reference Page="~/Core/PaperForms/FormsContainer.aspx" %>
<%@ Register TagPrefix="val" TagName="PageHeader" Src="../Header/pageHeader.ascx" %>

<%@ Page Language="c#" Inherits="Caisis.UI.Core.PaperForms.Forms" CodeFile="Forms.aspx.cs"
    CodeFileBaseClass="Caisis.UI.Core.Classes.FramePage" %>

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
<html>
<head>
    <title>Caisis: Forms</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta content="NOINDEX" name="ROBOTS" />
    <meta http-equiv="PRAGMAS" content="NO-CACHE" />
    <meta http-equiv="EXPIRES" content="0" />
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>

    <script src="../../ClientScripts/Menu.js" type="text/javascript"></script>

    <script type="text/javascript">
    Browser.ResizeElement( { nodeId: 'FormsContainer', heightOffset: 175 } );
    
    function showMenus(show)
    {
        $('menuHolder').style.visibility = show ? 'visible': 'hidden';
    }
    </script>

</head>
<body>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td height="70" bgcolor="#ffffff">
                <val:PageHeader ID="PageHeader1" runat="server"></val:PageHeader>
            </td>
        </tr>
        <tr>
            <td bgcolor="#3d556d">
                <a href="javascript:;" style="float: left; padding-top: .5em;">
                    <img onclick="MM_showHideLayers('currentList','','hide','commonTasks','','show','flashList','','hide')"
                        hspace="0" src="../../Images/Header/CommonTasks.gif" border="0" vspace="3" align="middle"
                        style="margin-left: 12px;">
                </a>
                <div id="menuHolder" style="float: left; padding-left: 218px; visibility: hidden;">
                    <ul id="menu">
                        <asp:Repeater runat="server" ID="PaperFormsMenu" OnItemDataBound="BindSubMenu">
                            <ItemTemplate>
                                <li>
                                    <%# Container.DataItem %>
                                    <ul runat="server" id="SubMenuList">
                                        <asp:Repeater runat="server" ID="PaperFormsSubMenu" OnItemDataBound="SetFormNames">
                                            <ItemTemplate>
                                                <li>
                                                    <asp:HyperLink runat="server" ID="SubMenuLink" NavigateUrl="FormsContent.aspx?formType={0}" Target="FormsContent" onclick="window.frames['FormsContainer'].togglePrintButton(false);"></asp:HyperLink>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </td>
        </tr>
        <tr>
            <td bgcolor="#c5c5bb">
                <img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
        </tr>
        <tr>
            <td align="middle" valign="top">
                <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f8fafc">
                    <tr>
                        <td height="27" align="middle">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="middle">
                            <iframe id="FormsContainer" name="FormsContainer" src="FormsSplash.aspx" style="width: 950px;
                                height: 485px; border-style: none;" scrolling="no" frameborder="0" runat="server">
                            </iframe>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
