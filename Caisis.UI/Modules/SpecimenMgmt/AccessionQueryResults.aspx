<%@ Page Language="c#" CodeFile="AccessionQueryResults.aspx.cs" AutoEventWireup="True" Inherits="Caisis.UI.Modules.SpecimenMgmt.AccessionQueryResults" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="val" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Accession Query Results</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>    
    <script type="text/javascript">
    
    //Browser.ResizeElement( { nodeId: 'PDFormDiv', heightOffset: 250 } );
    
    function isRowClick(evt)
    {   
        var n = evt.srcElement||evt.target;
        return n.nodeName=='INPUT'?false:true;
    }
    
    function showAccessionInfo(row, id)
    {
        var editpage = 'SpecimenAccessions.aspx?patientId=<%= Request.QueryString["patientId"] %>&specimenaccessionId=' + id;
        window.parent.document.getElementById("AccessionsDataFrame").src = editpage;
    }
    </script>
    <style type="text/css">
    td.ListManDataTableCell
    {
        text-align:center;
    }
    td.ListManDataTableCellBordered
    {
        border: 1px dotted #00668D;
        text-align:center;
    }
    td.ListManDataTableCellBorderedOn
    {
        border: 1px solid #00668D;
        text-align:center;
    }
    .boldTitle
    {
        font-weight:bold; font-size:10px;
    }
    .TableTitle
    {
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 10px;
        color: #003366;
    }
    </style>
    
</head>
<body>
    <form id="Form1" method="post" runat="server">
    <asp:HiddenField ID="endRecordNumber" runat="server" />
     <asp:HiddenField ID="startRecordNumber" runat="server" />
     <asp:HiddenField ID="HiddenOrderBy" runat="server" />
     <div id="AccessionsChronlist" runat="server" style="padding-top:20px;">
        <asp:Label ID="numOfRecordsMsg" runat="server" CssClass="TableTitle"></asp:Label>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:#f8fafc; ">
            <tr>
                <td align="center">
                    <table id="shimTbl" runat="server" width="285" border="0" cellspacing="0" cellpadding="0">
                        <!-- Rounded Top Border -->
                        <tr>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5" /></td>
                            <td colspan="4" class="ListManagerBGTableTop">
                                <img src="../../Images/shim.gif" width="10" height="5" /></td>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerTopRight.gif" width="5" height="5" /></td>
                        </tr>                        
                        
                                                
                        <!-- Specimen Accessions Panel -->
                        <tr style="background-color: #F1F7FC;">
                            <td class="ListManBGTableLeftSide" style="width: 1px;">&nbsp;</td>
                            <td colspan="4" align="center" >
                                    <table id="resultsTitles" cellpadding="1" cellspacing="0" border="0" runat="server" width="265">
                                        <tr>
                                            <td style=" width:45px; text-align:left;" class="boldTitle">Date</td>
					                        <td style=" width:120px; text-align:center;" class="boldTitle">Variable</td>
					                        <td style=" width:45px; text-align:center;" class="boldTitle">Value</td>
					                        <td style=" width:45px; text-align:left;" class="boldTitle">Quality</td>
                                        </tr>
                                    </table>                                    
                                    <!-- Content - Results Table -->
                                    <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 370px; width:285px ; border:0px;">
                                        <table id="accessionsTable" width="265" cellpadding="2" cellspacing="1" border="0" bgcolor="#cccccc">
                                            <asp:Repeater ID="rptAccessionResults" runat="server">
                                               <ItemTemplate>
                                                    <tr id="listRow" class="chronList" onclick="if(isRowClick(event)) { showAccessionInfo(this,'<%# DataBinder.Eval(Container.DataItem, "primaryKey") %>'); }" onmouseover="this.className='ListManDataTableRowOver';" onmouseout="this.className='ListManDataTableRow';" title="Click to edit Specimen Accession or add Specimens">
                                                    <td align="left" style="white-space:nowrap; font-size:10px; width:45px;"><%# DataBinder.Eval(Container.DataItem, "VarDate")%></td>
							<td align="left" style="white-space:nowrap;font-size:10px;width:120px;"><img src="../../Images/icon_<%# DataBinder.Eval(Container.DataItem, "tableName") %>.gif" border="0" title="<%# DataBinder.Eval(Container.DataItem, "tableName") %>" width="11" height="11" align="absmiddle">&nbsp;<%# DataBinder.Eval(Container.DataItem, "VarName")%></td>
							<td align="left" style="white-space:nowrap;font-size:10px;width:45px;"><%# DataBinder.Eval(Container.DataItem, "VarValue")%></td>
							<td align="left" style="white-space:nowrap;font-size:10px;width:45px;"><%# DataBinder.Eval(Container.DataItem, "Quality") %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                            
                                            <!-- Message - Search Returns Empty -->
							                <tr id="noAccessionsRow" runat="server" class="ListManDataTableRow" valign="middle" visible="false" style="cursor: default;" > 
										        <td colspan="4" style="height: 325px; text-align: center; font-size: 13px; color: #8d2a2c;">
										            <asp:Label ID="noRecordsFound" runat="server">No Accession Records Matched Your Search Criteria.</asp:Label>
										        </td>
									        </tr> 
                                        </table>
                                    </div>
                            </td>
                            <td class="ListManBGTableRightSide" style="width: 5px;">&nbsp;</td>
                        </tr>
							        
                        <!-- Rounded Bottom Border -->
                        <tr>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5" /></td>
                            <td colspan="4" class="ListManagerBGTableBottom">
                                <img src="../../Images/shim.gif" width="1" height="5" /></td>
                            <td style="background-color: #F1F7FC; width: 5px;">
                                <img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5" /></td>
                        </tr>
                        </table>
                </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>