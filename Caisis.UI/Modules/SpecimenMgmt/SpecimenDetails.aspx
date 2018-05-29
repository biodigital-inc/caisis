<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SpecimenDetails.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.SpecimenDetails" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="val" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Specimen Details</title>
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
    
    //height should be 416 and only for events frame for formatting reasons in both IE & firefox
    Browser.ResizeElement( { nodeId: 'processingevntsframe', heightOffset: 425 } );  
    </script>

    <style type="text/css">
        div.header
                {
                    background-color: #00668d;
                    text-align: left; 
                    padding: 3px;
                    padding-left:7px;
                    font-size: 12px;
                    letter-spacing: 1px;
                    font-weight: bold;
                    color: #FFFFFF;
                }
                
        .ListManDataTableTop
        {
            font-size: smaller;
            text-align: center;
        }
        .headerTitle
        {
            font-weight: bold; font-size: 10px; color: #ffffff; 
            font-family: Verdana, Arial, Helvetica, sans-serif; 
            text-align:center;
        }
        .gridHeader
        {
            background-color: #00668d;
            text-align: center;
        }
    </style> 
   
</head>
<body>
    <form id="Form1" runat="server" method="post">
        <table width="100%" height="97%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f8fafc">
            <tr>
                <td height="10" align="center">
                    <img src="../../Images/shim.gif" width="1" height="1">
                </td>            
            </tr>
            
            <tr>
                <td align="center">
                
                    <table id="resultstbl" runat="server" width="820" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td colspan="6" align="left" class="ListManTitle">
                                <asp:ImageButton ID="backToSpecimensListbtn" runat="server" OnClientClick="javascript:history.back();return false;" AlternateText="Back to Specimens List" ImageUrl="Images/button_backToSpecimenList.gif" style="float: right; margin-right: 10px;"/>
                               <asp:Label ID="PtId" runat="server"></asp:Label><asp:Label ID="pagetitle" runat="server" Width="550"></asp:Label>
                                
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <img src="../../Images/shim.gif" width="10" height="8"></td>
                        </tr>
                        <!-- Rounded Top Border -->
                        <tr>
                            <td style="background-color: #F1F7FC; width: 6px;">
                                <img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
                            <td class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="10" height="5"></td>
                            <td class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="20" height="5"></td>
                            <td class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="320" height="5"></td>
                            <td class="ListManagerBGTableTop" style="width: 436px">
                                <img src="../../Images/shim.gif" width="400" height="5"></td>
                            <td style="background-color: #F1F7FC;">
                                <img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
                        </tr>
                        <tr runat="server" style="background-color: #F1F7FC;">
                            <td class="ListManBGTableLeftSide" style="width:1px;">
                                &nbsp;</td>
                            <td colspan="4" valign="top">
                               
                                <!-------------- Specimens hierarchy Repeater and Edit Specimens -------------->
                                <!-- width should be 940 max to as per 1024x768 -->
                                <div style="width: 940px; margin-top:2px; margin-bottom:5px;">
                                    <!-------------- Specimens hierarchy Repeater -------------->
                                    <div style="width: 390px; float: left; margin-top:2px;">
                                        <div id="rptDiv" runat="server" style="width:390px; ">
                                            <iframe id="SpecimensRptFrame" style="width: 100%;height:233px;border: 1px solid #cccccc;"
                                                 frameborder="0" runat="server" />
                                        </div>
                                    </div> 
                                    <!-------------- End Specimens hierarchy repeater -------------->
                                
                                    <!-------------- Edit Specimens -------------->
                                    <div style="width: 540px;height:200px; float: right; margin-top:2px;">
                                        <div id="datadiv" runat="server" style="width:530px; ">
                                            <iframe id="SpecimenDataFrame" style="width: 100%;height:233px;border: 1px solid #cccccc;"
                                                 frameborder="0" runat="server" />
                                        </div>
                                    </div>
                                    <!--------------End Edit Specimens -------------->                                
                                </div>
                                <!-------------- End Specimens hierarchy Repeater and Edit Specimens -------------->  
                                  
                                <!-------------- Processing Events grid -------------->
                                <div style="width: 940px; float: left; margin-top:4px; position:relative;">
                                     <div id="eventsdiv" runat="server">
                                        <iframe id="processingevntsframe" style="width:99%;" frameborder="0" runat="server" scrolling="auto">
                                        </iframe>                                      
                                    </div>
                                </div>
                                <!--------------End Processing Events grid-------------->
                            </td>
                            <td class="ListManBGTableRightSide" style="width:1px;">
                            &nbsp;</td>
			            </tr>
			            
			            <!-- Rounded Bottom Border -->
			            <tr>
                            <td style="background-color:#F1F7FC; width: 6px; height: 5px;">
                                <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
                            <td class="ListManagerBGTableBottom" style="height: 5px">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td class="ListManagerBGTableBottom" style="height: 5px">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td colspan="2" class="ListManagerBGTableBottom" style="height: 5px">
                                <img src="../../Images/shim.gif" width="1" height="5"></td>
                            <td style="background-color:#F1F7FC; width: 5px; height: 5px;">
                                <img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
			            </tr>
		            </table>
		           
		        </td>
	        </tr>
	       
        </table>
    </form>
</body>
</html>
