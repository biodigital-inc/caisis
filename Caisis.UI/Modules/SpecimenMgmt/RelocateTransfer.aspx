<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="RelocateTransfer.aspx.cs" Inherits="Caisis.UI.Modules.SpecimenMgmt.RelocateTransfer" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Relocate Transfer</title>    
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script type="text/javascript">
	    var currentCollectionId;
	    var currentBoxId;
        
        function submitItem(id)
	    {
	        document.getElementById('relocateSpecimensFrame').style.display='';
	        document.Form1.CollectionId.value = id;
	        document.Form1.submit();
	    }
	    function loadRelocateSpecimensFrame(id, bname)
	    {
	        document.getElementById('relocateSpecimensFrame').style.display='';
	        document.Form1.BoxId.value = id;
	        highlightItem('Box', id);
	        
	        var theColId = currentCollectionId.split("_")[1];
	        document.getElementById('relocateSpecimensFrame').src = "RelocateSpecimens.aspx?Id="+id+"&Name="+bname+"&ColId="+theColId+"";    
	    }
	    
	    function highlightItem(type, id)
	    {
	        var elementId = type + "_" + id;
	        //alert(elementId);

	        if(type == "Collection")
	        {
	            currentCollectionId = elementId;
	        }
	        else if(type == "Box")
	        {
	            if(document.getElementById(currentBoxId))
	            {
	                document.getElementById(currentBoxId).className = 'itemDiv';
	            }
	            currentBoxId = elementId;
	        }
	        document.getElementById(elementId).className = 'ActiveItem';
	    }
    </script>

    <style type="text/css">
        .title
        {
            width:250px;
            text-align:center;
            font-size:13px;
        }
        .column
        {
            border-right: 1px solid #CCCCCC;
            text-align:left;
            vertical-align: top;
        }
        .ActiveItem
        {
            cursor: default; 
            background-color: #e9d5d6;
            color: #00668d;
            padding:4px 0px 4px 5px;
        }
        .itemDiv
        {
            cursor: pointer; 
            text-align:left; 
            padding:4px 0px 4px 5px;
        }
        table.itemTable
        {
             border: 1px solid #dddddd;  
             background-color:#f1f7fc;
             padding:4px;
             padding-left:0px;
        }
        table.itemTable td
        {
             padding:4px;
        }
        .leftAligned
        {
            text-align:left;
        }
    </style>
    </head>
    
<body>
    <form id="Form1" runat="server">
    <!-- Keep Track of Ids -->
    <asp:HiddenField runat="server" ID="CollectionId" />
    <asp:HiddenField runat="server" ID="BoxId" />
        <div align="center" style="margin-top: 15px;">
            <table width="850">
                <tr>
                    <td height="30" class="leftAligned">
                        <span class="ListManTitle">Move Specimens in Transfer: </span>
                        <span class="ListManTitle" id="transferName" runat="server"></span>
                    </td>
                </tr>   
                <tr>
                    <td class="leftAligned">
                        <table class="itemTable">
                             <tr style="height: 20px; font-weight: bold; text-align: left;">
                                <td class="title">Collections In Transfer</td>
                                <td class="title">Boxes In Selected Collection</td>
                            </tr>
                            <tr>
                                <td class="column">
                                    <asp:Repeater ID="RptCollections" runat="server">
                                        <HeaderTemplate><ol></HeaderTemplate>
                                        <ItemTemplate>
                                            <li>
                                                <div id="Collection_<%# Eval("CollectionId") %>" class="itemDiv" onclick="submitItem('<%# Eval("CollectionId") %>');">
                                                    <%# Eval("CollectionName") %>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                        <FooterTemplate><ol></FooterTemplate>
                                    </asp:Repeater>
                                </td>
                                <td valign="top">
                                    <asp:Repeater ID="RptBoxes" runat="server">
                                        <HeaderTemplate><ol></HeaderTemplate>
                                        <ItemTemplate>
                                            <li>
                                                <div id="Box_<%# Eval("BoxId") %>" class="itemDiv" onclick="loadRelocateSpecimensFrame('<%# Eval("BoxId") %>','<%# Eval("BoxName") %>');">
                                                    <%# Eval("BoxName") %>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                       <FooterTemplate><ol></FooterTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="leftAligned">
                        <iframe src="RelocateSpecimens.aspx" id="relocateSpecimensFrame" height="350" width="800" frameborder="0" style="border: 1px solid gray; display:none; overflow:auto;"></iframe>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
