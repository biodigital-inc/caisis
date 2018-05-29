<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls"  %>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintableCollection.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.PrintableCollection" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Basic Specimen Query</title>
    
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
	
</head>

<body style="margin: 0px;">
     <form id="searchForm" method="post" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:#f8fafc; height:100%;">
	        <tr> 
		        <td align="center"> 
		            <table width="760" border="0" cellspacing="0" cellpadding="0" style="text-align:left;">
                        <tr> 
                            <td class="ListManTitle" colspan="2" height="45" valign="bottom" align="left">
                                <asp:Label ID="pageTitle" runat="server">
                                    <%--Collection Name--%>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Collection Name
                            </td>
                            <td>
                                <asp:Label ID="CollectionName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Date Created
                            </td>
                            <td>
                                <asp:Label ID="CollectionAssignDate" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Type
                            </td>
                            <td>
                               <asp:Label ID="CollectionType" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Status
                            </td>
                            <td>
                                <asp:Label ID="CollectionStatus" runat="server"></asp:Label>
                            </td>
                        </tr>
		            </table>
		        </td>
	        </tr>
	       
        </table>   
        
        <div align="center" style="width:800px;">
            <div style="width:400px; text-align:left;">
                Collection Name: 
                <br />
                Date Created: 
                <br />
                Type: 
                <br />
                Status: 
            </div>
            <div style="width:400px; text-align:left;">
                Project Code: <asp:Label ID="CollectionProjectCode" runat="server"></asp:Label>
                <br />
                Notes: <asp:Label ID="CollectionAssignNotes" runat="server"></asp:Label>
            </div>
        </div>
    </form>

</body>
</html>
