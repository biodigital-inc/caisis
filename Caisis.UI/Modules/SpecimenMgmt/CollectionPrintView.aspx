<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls"  %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CollectionPrintView.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.CollectionPrintView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Print Collection</title>
    
    <meta name="GENERATOR" content="Microsoft Visual Studio 7.0" />
	<meta name="CODE_LANGUAGE" content="C#" />
	<meta name="vs_defaultClientScript" content="JavaScript" />
	<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
	
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
	<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
	<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
	
	<link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
	
    <style type="text/css">
        body{ margin:0px; background-color:#ffffff; font-size:11px; }
        td.label{ width:100px; text-align:right; vertical-align:top; padding-right:5px; font-weight:bold; }
    </style>
</head>

<body onload="this.window.print(); this.window.close();">
    <form id="searchForm" method="post" runat="server">
        <div align="center">
            <table width="760" border="0" cellpadding="2" cellspacing="0" style="height: 100%; text-align:left;">
                <tr>
                    <td style="width: 50%;">
                        <table>
                            <tr>
                                <td class="ListManTitle" colspan="2" height="10" valign="bottom" align="left">
                                    <asp:Label ID="pageTitle" runat="server">
                            <%--Collection Name--%>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">
                                    Collection Name:
                                </td>
                                <td>
                                    <asp:Label ID="CollectionName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">
                                    Date Created:
                                </td>
                                <td>
                                    <asp:Label ID="CollectionAssignDate" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">
                                    Type:
                                </td>
                                <td>
                                    <asp:Label ID="CollectionType" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">
                                    Status:
                                </td>
                                <td>
                                    <asp:Label ID="CollectionStatus" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width:50%;">
                        <table>
                            <tr>
                                <td class="label">
                                    Project Code:
                                </td>
                                <td>
                                    <asp:Label ID="CollectionProjectCode" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="label">
                                    Notes:
                                </td>
                                <td valign="top">
                                    <asp:Label ID="CollectionAssignNotes" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        
        <div align="center" style="margin-top:15px;">
            <div style="margin-bottom:5px;">
                <span style="font-weight:bold; padding-right:5px;">Total Specimens: </span><asp:Label ID="totalSpecimens" runat="server"></asp:Label> 
            </div>
            <asp:GridView ID="SpecimenGridView" runat="server" Width="760" CellPadding="4" CellSpacing="0" BorderStyle="Solid" BorderWidth="1px" BorderColor="black" HeaderStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center">
            </asp:GridView>
            <div style="margin-top:25px; width:760px;">
                <table align="right" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="label">Printed By:</td>
                        <td style="text-align:left;">
                             <asp:Label ID="printedBy" runat="server">Printed By: </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Date:</td>
                        <td>
                            <asp:Label ID="printedDate" runat="server">Date: </asp:Label> 
                        </td>
                    </tr>
                </table>
            </div>
        </div>
     </form>
</body>
</html>
