<%@ Page EnableViewState="false" Language="C#" AutoEventWireup="true" CodeFile="AjaxGantLoader.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.AjaxGantLoader" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gant Chart Loader</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script type="text/javascript">
    /* <![CDATA[ */
    
    // Loads a child gant chart on gant item click
    function loadChildGant(bar,e,tableName,priKey,color)
    {
        if(<%= loadFromParent %>) 
        { 
            parent.loadChildGant.apply(parent,arguments);
        }
        else
        {
            var params = new Param();
            params.add('projectId','<%= projectId %>');
            params.add('tableName',tableName);
            params.add('priKey',priKey);
            params.add('color',color);
            window.location = '?' + params.toQueryString();
        }
    }

    // Sets column width of label column, and Gant column will fill rest of table
    function adjustLabelsColumn()
    {
        var labelCol = $('LabelsCol');
        var labelContainer = $('LabelsContainer');
        var adjustedWidth = Math.max(1,labelContainer.offsetWidth) + 10; 
        labelCol.style.width = adjustedWidth + 'px';
    }   
        
    window.addEvent('load',adjustLabelsColumn);

    /* ]]> */
    </script>

    <style type="text/css">
    body
    {
        background-image: url('Images/AjaxGantBackground.gif');
    }
    .GantItemLabel
    {
        display: block;
        left: 0px;
        color: #000000;
        font-weight: bolder;
        text-align: left;
        height: <%= GantChart.ITEM_TOP_OFFSET %>px;
        z-index: 2000;
        white-space: nowrap;
    }
    .GantColorBox
    {
        display: block; 
        height: 12px; 
        width: 12px; 
        border: 1px solid #333333;
        margin: auto;
        vertical-align: middle;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Table -->
        <table class="AjaxGantHeaderTable" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td runat="server" id="GantColorBoxColumn" style="width: 40px;">
                    <asp:Label runat="server" ID="GantColorBox" CssClass="GantColorBox"></asp:Label>
                </td>
                <td>
                    <asp:Label runat="server" ID="GantTitle" CssClass="AjaxGantHeaderTitle"></asp:Label></td>
            </tr>
        </table>
        <!-- Gant Chart Container -->
        <table style="table-layout: fixed; width: 100%;">
            <tr>
                <td id="LabelsCol" style="vertical-align: top;">
                    <div runat="server" id="LabelsContainer" style="float: left; width: auto; position: relative;
                        color: #ffffff; font-weight: bold; z-index: 2000; padding-left: 10px; white-space: nowrap;">
                    </div>
                </td>
                <td style="vertical-align: top;">
                    <div style="position: relative; width: 100%; height: 225px; margin: 0px;">
                        <custom:GantChart runat="server" ShowGantTitle="false" ID="DynamicGantChart" GantTitleCss="GantTitle"
                            MarkerCount="12" AlternateMarkers="true" UseDynamicColors="false" ShowGantItemDescriptions="false">
                        </custom:GantChart>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
