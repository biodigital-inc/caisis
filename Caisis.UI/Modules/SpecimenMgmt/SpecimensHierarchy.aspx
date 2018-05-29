<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SpecimensHierarchy.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.SpecimensHierarchy" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="val" Namespace="Caisis.UI.Core.Classes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Specimens Hierarchy</title>
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
                
//        function onmouseoutRowColor(row, id, pid)
//        {
//            var sid=document.getElementById("listspecimenId").value;
//            if (id==sid)
//            {
//                row.style.background="#ADDFFF";
//                row.title="Selected Specimen";
//            }
//            else if(pid!="" && sid==pid)
//            {
//                //row.style.background="#dfedf9";
//                row.style.background="#ffffff";
//                row.title="Sub-Specimen";
//            }
//            else
//            {
//                row.style.background="#ffffff";
//                row.title="Parent Specimen";
//            }
//        }
        function DeselectAllSpecListRows()
	    {
	        var spec = $('specimensTable');
	        for (i=0;i<spec.rows.length;i++) { spec.rows[i].className = 'ListManDataTableRow'; }
	    }
	    
	    function HighlightSelectedRow(row)
	    {
	        DeselectAllSpecListRows();
	        row.className = 'chronListClicked';
	    }
	            
        function showSpecimenDetails(row,id)
	    {	        
            var editpage = "EditSpecimenDetails.aspx?specimenId=" + id;
            window.parent.document.getElementById("SpecimenDataFrame").src = editpage;
            
            window.parent.document.getElementById('processingevntsframe').style.display = '';
            var eventspage="AddSpecimenEvents.aspx?specimenId=" + id;
            window.parent.document.getElementById("processingevntsframe").src = eventspage;
        }
        
        
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
            height: 28px;
        }
    </style> 
   
</head>
<body>
    <form id="Form1" runat="server" method="post">
    <asp:HiddenField ID="listspecimenId" runat="server" />
        <table width="100%" id="resultstbl" runat="server" border="0" cellspacing="0" cellpadding="0"> 
            <tr id="Tr1" runat="server" style="background-color: #F1F7FC;">
                <td colspan="4" valign="top">                                
                    <!-------------- Specimens hierarchy repeater header -------------->
                    <table width="100%" cellpadding="2" border="0" cellspacing="0">
                        <tr class="gridHeader" valign="middle">
                            <td class="headerTitle" style="width: 87px;">
                                Reference #</td>
                            <td class="headerTitle" style="width: 40px;">
                                Org Qty</td>
                            <td class="headerTitle" style="width: 40px;">
                                Rem Qty</td>
                            <td class="headerTitle" style="width: 65px;">
                                Box</td>
                            <td class="headerTitle" style="width: 30px;">
                                Pstn</td>
                        </tr>
                    </table>
                    <!-------------- End Specimens hierarchy repeater header -------------->
                            
                    <!-- Specimens hierarchy repeater -->
                    <div id="resultsDiv" style="overflow-y: auto; overflow-x:hidden; height: 185px; width: 100%; background-color:#ffffff;">
                        <table id="specimensTable" cellspacing="0" cellpadding="2" style="background-color: #ffffff; width:100%;">
                            <asp:Repeater ID="rptSpecimens" runat="server" OnItemDataBound="RowIcon">
                                <ItemTemplate>
                                    <tr height="15" id="specimenRow" class="ListManDataTableRow" valign="middle" style="cursor: pointer; text-align:center;" onmouseover="if(this.className!='chronListClicked'){this.className='chronListHilighted';}" onmouseout="if(this.className!='chronListClicked'){this.className='ListManDataTableRow';}" onclick="showSpecimenDetails(this,<%#Eval("SpecimenId") %>); HighlightSelectedRow(this);">
                                    <%--<tr height="20" <%#FormatRowColor((DataBinder.Eval(Container.DataItem, "SpecimenId").ToString()),(DataBinder.Eval(Container.DataItem, "ParentSpecimenId").ToString())) %> id="Tr1" class="ListManDataTableRow" valign="middle" style="cursor: pointer;" onmouseover="style.backgroundColor='#e9d5d6';" onmouseout="onmouseoutRowColor(this,'<%# Eval("SpecimenId") %>','<%#Eval("ParentSpecimenId") %>' );" onmousedown="style.backgroundColor='#e9d5d6';" onclick="showSpecimenDetails(this,<%#Eval("SpecimenId") %>);">--%>
                                        <td style="width: 85px; text-align:left; border-bottom: solid 1px #cccccc;">
                                            <asp:HiddenField runat="server" ID="RowParentSpecimenId" Value='<%# Eval("ParentSpecimenId") %>' />
                                            <asp:HiddenField runat="server" ID="RowSpecimenId" Value='<%# Eval("SpecimenId") %>' />
                                           <img id="spaceicon" alt="icon" runat="server"><%# Eval("SpecimenReferenceNumber")%>
                                        </td>
                                        <td style="width: 40px; text-align:center; border-bottom: solid 1px #cccccc;">
                                            <%# Eval("SpecimenOriginalQty")%><%# Eval("SpecimenUnits")%>&nbsp;
                                        </td>
                                        <td style="width: 40px; text-align:center; border-bottom: solid 1px #cccccc;">
                                            <%# Eval("SpecimenRemainingQty") %><%# Eval("SpecimenUnits")%>&nbsp;
                                        </td>
                                        <td style="width: 60px; text-align:center; border-bottom: solid 1px #cccccc;">
                                            <%# Eval("BoxName")%>&nbsp;
                                        </td>
                                        <td style="width: 30px; text-align:center; border-bottom: solid 1px #cccccc;">
                                            <%# Eval("Position")%>&nbsp;
                                        </td>
                                    </tr>
                                </ItemTemplate>

                            </asp:Repeater>
                        </table>
                    </div>
                    <!-------------- End Specimens hierarchy repeater -------------->                                
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

