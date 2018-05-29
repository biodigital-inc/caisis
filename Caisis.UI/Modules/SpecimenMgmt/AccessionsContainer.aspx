<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccessionsContainer.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.AccessionsContainer" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="val" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Accessions Container</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script type="text/javascript">
    
    //height should be 135 formatting reasons depending on different resolution in both IE & firefox
    //Browser.ResizeElement( { nodeId: 'AccessionsRptFrame', heightOffset: 135 } );
   // Browser.ResizeElement( { nodeId: 'AccessionsDataFrame', heightOffset: 125 } );  
    
        
    </script>
    
</head>
<body>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td valign="top">
                <table id="contentTable" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td valign="top" align="center">
                            <iframe id="AccessionsRptFrame" runat="server" frameborder="0" width="295" scrolling="no" height="495"></iframe>
                        </td>
                        <td valign="top" align="center">
                            <br /><iframe runat="server" id="AccessionsDataFrame" frameborder="0" width="650" scrolling="no" height="495"></iframe> 
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
