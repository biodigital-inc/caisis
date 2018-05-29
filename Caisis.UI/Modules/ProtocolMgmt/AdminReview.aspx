<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminReview.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminReview" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Review</title>
    
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
    /* <![CDATA[ */
  
      // Adjust various containers on load and resize
    Browser.ResizeElement( { customResizer: adjustOverflowContent });
    
    var LAYER_LEFT_DOCK = 0;
    
    // Adjusts the height and width of various container to fit on page
    function adjustOverflowContent(e)
    {
//        // Adjust popup layer filler to grow to fill space of positioned items
//        var scrolledHeaderWidth = $('TimelineTabDiv').scrollWidth;
//        $('TimelineTabDivFiller').style.width = scrolledHeaderWidth + 'px';
        // Position scrolling popup data entry layer
        LAYER_LEFT_DOCK = getLeftPos($('TimelineTabDiv'));
        $('TimelineTabPopupDiv').style.left = LAYER_LEFT_DOCK + 'px';
        
        // Determine width for overflow items on right (header, header popup, and checkbox layer)
        var shellWidth = $('schemaItemsShell').offsetWidth;
        var pageWidth = getWidth(window);
        var adjustedWidth = pageWidth - shellWidth - 30  + 'px';
        
        // Adjust various overflow containers
        $('TimelineTabDiv').style.width = adjustedWidth;
        //$('TimelineTabPopupDiv').style.width = adjustedWidth;
        $('TimelineMainDiv').style.width = adjustedWidth;

        // Grow Schema and Items Shell to hold content
        var adjustedHeight = getHeight(window) - 225;
        $('TimelineMainDiv').style.height = adjustedHeight + 17 + 'px';
        $('schemaItemsDiv').style.height =  adjustedHeight + 'px';
    }
    
    /* SCROLLING DIVs */
    function scrollNodeTop(a,b,e) { $(b).scrollTop = $(a).scrollTop; }
    function scrollNodeLeft(a,b,e) { $(b).scrollLeft = $(a).scrollLeft; }
    
    // Adds handlers to scroll containers to match up with check-box matrix
    function initScrollers(e)
    {
        var headerLayer = $('TimelineTabDiv');
        var headerPopupLayer = $('TimelineTabPopupDiv');
        var schemaItems = $('schemaItemsDiv');
        var checkBoxLayer = $('TimelineMainDiv');
        var adjustTop = curry(scrollNodeTop,checkBoxLayer,schemaItems);
        var adjustLeft = curry(scrollNodeLeft,checkBoxLayer,headerLayer);
        
        // Add scrolling event handlers
        checkBoxLayer.addEvent('mousemove',adjustTop);
        checkBoxLayer.addEvent('mousemove',adjustLeft);
        
        // some browser, i.e., IE doesn't track movement on scrollbars, but handle scroll event
        if(typeof(document.body.scroll))
        {
            checkBoxLayer.addEvent('scroll',adjustTop);
            checkBoxLayer.addEvent('scroll',adjustLeft);
        }
    }
    
    // Events which fire during load
    window.addEvent('load',adjustOverflowContent);
    window.addEvent('load',initScrollers);
    
    </script>
    
    <style type="text/css">

    html { height: 100%; }
    body
    {
	    min-height: 100%;
	    padding: 0px;
	    margin: 0px;
	    background-color: #ffffff;
    }

    .TimelineTopLeftBG
    {
	    background-image: url(Images/Timeline_TopLeftBG.png);
	    background-position:bottom;
	    background-repeat: no-repeat;
	    width: 157px;
	    height: 90px;
	    text-align: center;
	    vertical-align: top;
    }
    .TimelineTopRightBG
    {
	    background-image: url(Images/Timeline_TopRightBG.gif);
	    background-position: right top;
	    background-repeat: no-repeat;
	    vertical-align: top;
	    padding-top: 5px;
	    padding-right: 12px;
    }
    .TimelineMidLeftBG
    {
	    background-color: #efefef;
	    vertical-align: top;
	    padding-top: 5px;
	    padding-left: 12px;
    }
    .TimelineBottomLeftBG
    {
	    background-image: url(Images/Timeline_BottomLeftBG.gif);
	    background-position:bottom left;
	    background-repeat: no-repeat;
	    height: 13px;
    }
    .TimelineBottomRightBG
    {
	    background-image: url(Images/Timeline_BottomRightBG.gif);
	    background-position:bottom right;
	    background-repeat: no-repeat;
	    height: 13px;


    }
    #schemaItemsShell
    {
	   
	    border: solid 2px #dddddd;
	    border-right: solid 1px #dddddd;
	    background-color: #ffffff;
    }
    .schemaItemsTable
    {
	    width: 100%;

    }
    #VisitColumnsShell
    {
	
	    border: solid 2px #dddddd;
	    border-left: none;
	    background-color: #ffffff;
    }
    #TimelineTabDiv
    {
	    height: 78px;
	    width: 970px;
	    overflow: hidden;
    }
    
    .TimelineTab_PreStudy
    {
	    background-image: url(Images/TimelineTab_PreStudy.gif);
	    background-position: 4px 0px;
	    background-repeat: no-repeat;
	    width: 166px;
	    height: 78px;
	    text-align: center;
	    vertical-align: top;
	    padding-top: 7px;
    }
    .TimelineTab_OnStudy
    {
	    background-image: url(Images/TimelineTab_OnStudy.gif);
	    background-position: 4px 0px;
	    background-repeat: no-repeat;
	    width: 166px;
	    height: 78px;
	    text-align: center;
	    vertical-align: top;
	    padding-top: 7px;
    }
    .TimelineTab_OnStudyMarker
    {
	    background-image: url(Images/Timeline_OnStudyDateMarker.gif);
	    background-position: 4px 49px;
	    background-repeat: no-repeat;
	    width: 52px;
	    height: 78px;
    }
    .TimelineOnStudy_A
    {
	    width: 166px;
	    height: 32px;
	    background-color: #E0EBF1;
	    text-align: center;
	    vertical-align: middle;
	    font-size: 12px;
	    font-family: Arial, Helvetica, sans-serif;
	    color: #1C3B68;
    }
    .TimelineOnStudy_B
    {
	    width: 166px;
	    height: 32px;
	    background-color: #F8FAFC;
	    text-align: center;
	    vertical-align: middle;
	    font-size: 12px;
	    font-family: Arial, Helvetica, sans-serif;
	    color: #1C3B68;
    }
    .TimelinePreStudy_A
    {
	    width: 166px;
	    height: 32px;
	    background-color: #D8E3E9;
	    text-align: center;
	    vertical-align: middle;
    }
    .TimelinePreStudy_B
    {
	    width: 166px;
	    height: 32px;
	    background-color: #F6F8FA;
	    text-align: center;
	    vertical-align: middle;
    }
    .TimelineOnStudyDateDividerA
    {
	    background-image: url(Images/Timeline_OnStudyDateDividerA.png);
	    background-position: center center;
	    background-repeat: repeat-y;
	    width: 52px;
	    height: 32px;
    }
    .TimelineOnStudyDateDividerB
    {
	    background-image: url(Images/Timeline_OnStudyDateDividerB.png);
	    background-position: center center;
	    background-repeat: repeat-y;
	    width: 52px;
	    height: 32px;
    }
    .TimelineColSizer
    {
	    width: 166px;
	    height: 1px;
    }
    .TimelineTabContentsTable
    {
	    width: 155px;
	    margin-top: 5px;
	    margin-bottom: 5px;
	    margin-left: auto;
	    margin-right: auto;
    }
    .OnStudyDateSizer
    {
	    width: 52px;
	    height: 1px;
	    margin-bottom: 6px;
    }
    #TimelineMainDiv
    {
	    height: 400px;
	    width: 802px;
	    overflow: auto;
    }
    #TimelineMainDiv * label
    {
        display: block;
    }
    .TimelineSizerCell
    {
	    height: 1px;
    }
    #schemaItemsDiv
    {
	    height: 400px;
	    overflow: hidden;
    }
    .TimelineTabNameTitleEntryField
    {
	    width: 132px;
	    height: 15px;
	    font-size: 14px; 
	    color: #111111;
	    border: solid 1px #cccccc;
	    text-align: center;
    }
    .DataEntrySelect
    {
        width: 80px;
        vertical-align: middle;
    }
    .WeekText
    {
	    font-size: 11px;
	    font-family: Arial, Helvetica, sans-serif;
	    color: #000000;
	    font-weight: bold;
	    line-height: 11px;
	    cursor: pointer;
    }
    .BufferText
    {
	    font-size: 11px;
	    font-family: Arial, Helvetica, sans-serif;
	    color: #000000;
	    font-weight: normal;
	    line-height: 11px;
	    cursor: pointer;
    }
    .VisitDescriptionText
    {
	    font-size: 10px;
	    font-family: Arial, Helvetica, sans-serif;
	    color: #000000;
	    font-weight: bold;
	    line-height: 10px;
	    cursor: pointer;
    }
    #TimelineTabPopupDiv
    {
        display: none;
        position: absolute;
        top: 0px;
        left: 0px;
        z-index: 10;
	    width: 172px;
	    height: 285px;
        /* 
        width: 970px; 
        height: 280px; 
         */
        overflow: hidden;
 
    }
    .TimelineTabLayer_PreStudy
    {
        position: absolute;
        top: 0px;
        left: 0px;
	    z-index: 99;
	    overflow: hidden;
	    width: 172px;
	    height: 285px;
	    background-image: url(Images/TimelineTabLayerBG_PreStudy.png);
	    background-position: -3px 0px;
	    background-repeat: no-repeat;
	    display: none;
    }
    .TimelineTabLayer_OnStudy
    {
        position: absolute;
        top: 0px;
        left: 0px;
	    z-index: 99;
	    overflow: hidden;
	    width: 172px;
	    height: 285px;
	    background-image: url(Images/TimelineTabLayerBG_OnStudy.png);
	    background-position: -3px 0px;
	    background-repeat: no-repeat;
	    display: none;
    }
    .WeekDataEntryField
    {
	    width: 40px;
	    border: solid 1px #cccccc;
    }
    .BufferDataEntryField
    {
	    width: 20px;
	    border: solid 1px #cccccc;
    }
    .TimelineTabLayerOptionsRow
    {
	    padding-left: 18px; 
	    font-size:12px; 
	    text-align: left; 
	    font-size: 12px;
	    font-family: Arial, Helvetica, sans-serif;
	    color: #111111;
	    font-weight: bold;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 100%;">
            <table width="99%" border="0" cellspacing="0" cellpadding="0" style="margin-left: auto;
                margin-right: auto;">
                <tr>
                    <td class="TimelineTopLeftBG">
                        <span style="font-size: 10px; color: #666666; font-family: Arial, Helvetica, sans-serif;">
                            </span></td>
                    <td style="vertical-align: bottom; padding-left: 2px;">
                        <div id="TimelineTabDiv">
                            <%-- POPUP DATA-ENTRY LAYERS --%>
                            <div id="TimelineTabPopupDiv">
                                <asp:Repeater runat="server" ID="PreStudyItemsLayerRptr">
                                    <ItemTemplate>
                                        <div class="TimelineTabLayer_PreStudy" id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>">
                                            <table border="0" cellspacing="0" cellpadding="0" class="TimelineTabContentsTable">
                                                <tr>
                                                    <td>
                                                        <cic:CaisisTextBox runat="server" ID="VisitLabel" ShowLabel="false" CssClass="TimelineTabNameTitleEntryField"
                                                            Table="ProtocolMgr_Timeline" Field="VisitLabel"></cic:CaisisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-top: 8px;">
                                                        <cic:CaisisSelect runat="server" ID="DisplayUnitName" Table="ProtocolMgr_Timeline"
                                                            Field="DisplayUnitName" ShowLabel="false" CssClass="DataEntrySelect">
                                                            <asp:ListItem Text="" Value="">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Day" Value="Day">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Week" Value="Week">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Month" Value="Month">
                                                            </asp:ListItem>
                                                        </cic:CaisisSelect>
                                                        <cic:CaisisTextBox runat="server" ID="NumUnits" Table="ProtocolMgr_Timeline" Field="NumberOfUnits"
                                                            ShowLabel="false" CssClass="WeekDataEntryField"></cic:CaisisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="VisitDescriptionText" style="padding-top: 3px; font-size: 11px;">
                                                        +<cic:CaisisTextBox runat="server" ID="BufferUnitsPlus" Table="ProtocolMgr_Timeline"
                                                            Field="BufferNumberOfUnitsPlus" ShowLabel="false" CssClass="BufferDataEntryField"></cic:CaisisTextBox>
                                                        &#47;<span style="cursor: pointer;">-</span>
                                                        <cic:CaisisTextBox runat="server" ID="BufferUnitsMinus" Table="ProtocolMgr_Timeline"
                                                            Field="BufferNumberOfUnitsMinus" ShowLabel="false" CssClass="BufferDataEntryField"></cic:CaisisTextBox>
                                                        <cic:CaisisSelect runat="server" ID="BufferUnitName" Table="ProtocolMgr_Timeline"
                                                            Field="BufferUnitName" ShowLabel="false" CssClass="DataEntrySelect">
                                                            <asp:ListItem Text="" Value="">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Days" Value="Day">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Weeks" Value="Week">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Months" Value="Month">
                                                            </asp:ListItem>
                                                        </cic:CaisisSelect>
                                                </tr>
                                                <tr>
                                                    <td class="TimelineTabLayerOptionsRow" style="padding-top: 30px;">
                                                        Schedule Options</td>
                                                </tr>
                                                <tr>
                                                    <td class="TimelineTabLayerOptionsRow" style="padding-top: 4px;">
                                                        <cic:CaisisSelect runat="server" Table="ProtocolMgr_Timeline" Field="ItemIntervalType"
                                                            ShowLabel="false" Width="120px">
                                                            <asp:ListItem Text="" Value="">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Pre-Study" Value="Pre-Study">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Dependent on Visit" Value="Dependent on Visit">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Recurring Visit" Value="Recurring Visit">
                                                            </asp:ListItem>
                                                        </cic:CaisisSelect>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="TimelineTabLayerOptionsRow">
                                                        <span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_CloseBtn">close</span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:Repeater runat="server" ID="OnStudyItemsLayerRptr">
                                    <ItemTemplate>
                                        <div class="TimelineTabLayer_OnStudy" id="TimelineTabLayer_<%# Container.ItemIndex %>">
                                            <table border="0" cellspacing="0" cellpadding="0" class="TimelineTabContentsTable">
                                                <tr>
                                                    <td>
                                                        <cic:CaisisTextBox runat="server" ID="VisitLabel" ShowLabel="false" CssClass="TimelineTabNameTitleEntryField"
                                                            Table="ProtocolMgr_Timeline" Field="VisitLabel"></cic:CaisisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding-top: 8px;">
                                                        <cic:CaisisSelect runat="server" ID="DisplayUnitName" Table="ProtocolMgr_Timeline"
                                                            Field="DisplayUnitName" ShowLabel="false" CssClass="DataEntrySelect">
                                                            <asp:ListItem Text="" Value="">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Day" Value="Day">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Week" Value="Week">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Month" Value="Month">
                                                            </asp:ListItem>
                                                        </cic:CaisisSelect>
                                                        <cic:CaisisTextBox runat="server" ID="NumUnits" Table="ProtocolMgr_Timeline" Field="NumberOfUnits"
                                                            ShowLabel="false" CssClass="WeekDataEntryField"></cic:CaisisTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="VisitDescriptionText" style="padding-top: 3px; font-size: 11px;">
                                                        +<cic:CaisisTextBox runat="server" ID="BufferUnitsPlus" Table="ProtocolMgr_Timeline"
                                                            Field="BufferNumberOfUnitsPlus" ShowLabel="false" CssClass="BufferDataEntryField"></cic:CaisisTextBox>
                                                        &#47;<span style="cursor: pointer;">-</span>
                                                        <cic:CaisisTextBox runat="server" ID="BufferUnitsMinus" Table="ProtocolMgr_Timeline"
                                                            Field="BufferNumberOfUnitsMinus" ShowLabel="false" CssClass="BufferDataEntryField"></cic:CaisisTextBox>
                                                        <cic:CaisisSelect runat="server" ID="BufferUnitName" Table="ProtocolMgr_Timeline"
                                                            Field="BufferUnitName" ShowLabel="false" CssClass="DataEntrySelect">
                                                            <asp:ListItem Text="" Value="">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Days" Value="Day">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Weeks" Value="Week">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Months" Value="Month">
                                                            </asp:ListItem>
                                                        </cic:CaisisSelect>
                                                </tr>
                                                <tr>
                                                    <td class="TimelineTabLayerOptionsRow" style="padding-top: 30px;">
                                                        Schedule Options</td>
                                                </tr>
                                                <tr>
                                                    <td class="TimelineTabLayerOptionsRow" style="padding-top: 4px;">
                                                        <cic:CaisisSelect runat="server" Table="ProtocolMgr_Timeline" Field="ItemIntervalType"
                                                            ShowLabel="false" Width="120px">
                                                            <asp:ListItem Text="" Value="">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Pre-Study" Value="Pre-Study">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Dependent on Visit" Value="Dependent on Visit">
                                                            </asp:ListItem>
                                                            <asp:ListItem Text="Recurring Visit" Value="Recurring Visit">
                                                            </asp:ListItem>
                                                        </cic:CaisisSelect>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="TimelineTabLayerOptionsRow">
                                                        <span id="TimelineTabLayer_<%# Container.ItemIndex %>_CloseBtn">close</span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <%-- HEADER COLUMNS --%>
                            <table id="TimelineHeaderTable" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;">
                                <tr>
                                    <%-- Pre-Study Items --%>
                                    <asp:Repeater runat="server" ID="PreStudyItemsRptr">
                                        <ItemTemplate>
                                            <td class="TimelineTab_PreStudy" id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_Cell">
                                                <table border="0" cellspacing="0" cellpadding="0" class="TimelineTabContentsTable">
                                                    <tr>
                                                        <td>
                                                            <input id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_VisitLabel" type="text"
                                                                class="TimelineTabNameTitleEntryField" value='<%# Eval("VisitLabel")%>' /></td>
                                                    </tr>
                                                </table>
                                                <table id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_Cell_Launcher" border="0"
                                                    cellspacing="0" cellpadding="0" class="TimelineTabContentsTable">
                                                    <tr>
                                                        <td>
                                                            <span class="WeekText"><span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_DisplayUnitName">
                                                                <%# Eval("DisplayUnitName")%>
                                                            </span><span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_NumberOfUnits">
                                                                <%# Eval("NumberOfUnits")%>
                                                            </span></span><span class="BufferText">(+ <span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_BufferNumberOfUnitsPlus">
                                                                <%# Eval("BufferNumberOfUnitsPlus")%>
                                                            </span>/- <span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_BufferNumberOfUnitsMinus">
                                                                <%# Eval("BufferNumberOfUnitsMinus")%>
                                                            </span><span id="TimelineTabLayer_Pre_<%# Container.ItemIndex %>_BufferUnitName">
                                                                <%# Eval("BufferUnitName")%>
                                                            </span>) </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table width="120" border="0" cellspacing="0" cellpadding="1" style="margin-top: 4px;
                                                                margin-left: auto; margin-right: auto;">
                                                                <tr>
                                                                    <td class="VisitDescriptionText">
                                                                        Pre-Study</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <%--  On-Study Marker --%>
                                    <td class="TimelineTab_OnStudyMarker">
                                        <img alt="On-Study Date" title="On-Study Date" src="Images/shim.gif" class="OnStudyDateSizer" />
                                    </td>
                                    <%--  On-Study Items --%>
                                    <asp:Repeater runat="server" ID="OnStudyItemsRptr">
                                        <ItemTemplate>
                                            <td class="TimelineTab_OnStudy" id="TimelineTabLayer_<%# Container.ItemIndex %>_Cell">
                                                <table border="0" cellspacing="0" cellpadding="0" class="TimelineTabContentsTable">
                                                    <tr>
                                                        <td>
                                                            <input id="TimelineTabLayer_<%# Container.ItemIndex %>_VisitLabel" type="text" class="TimelineTabNameTitleEntryField"
                                                                value='<%# Eval("VisitLabel")%>' onkeypress='<asp:Literal runat="server" ID="ClientArgList2" />' />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table id="TimelineTabLayer_<%# Container.ItemIndex %>_Cell_Launcher" border="0"
                                                    cellspacing="0" cellpadding="0" class="TimelineTabContentsTable">
                                                    <tr>
                                                        <td>
                                                            <span class="WeekText"><span id="TimelineTabLayer_<%# Container.ItemIndex %>_DisplayUnitName">
                                                                <%# Eval("DisplayUnitName")%>
                                                            </span><span id="TimelineTabLayer_<%# Container.ItemIndex %>_NumberOfUnits">
                                                                <%# Eval("NumberOfUnits")%>
                                                            </span></span><span class="BufferText">(+ <span id="TimelineTabLayer_<%# Container.ItemIndex %>_BufferNumberOfUnitsPlus">
                                                                <%# Eval("BufferNumberOfUnitsPlus")%>
                                                            </span>/- <span id="TimelineTabLayer_<%# Container.ItemIndex %>_BufferNumberOfUnitsMinus">
                                                                <%# Eval("BufferNumberOfUnitsMinus")%>
                                                            </span><span id="TimelineTabLayer_<%# Container.ItemIndex %>_BufferUnitName">
                                                                <%# Eval("BufferUnitName")%>
                                                            </span>) </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table width="120" border="0" cellspacing="0" cellpadding="1" style="margin-top: 4px;
                                                                margin-left: auto; margin-right: auto;">
                                                                <tr>
                                                                    <td style="vertical-align: top;">
                                                                        <img src="Images/TimelineIcon_Dependent.png" width="12" height="12"></td>
                                                                    <td class="VisitDescriptionText" style="text-align: left;">
                                                                        Occurs 9 Days after Cycle 1, Week 1</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="TimelineMidLeftBG">
                        <div id="schemaItemsShell">
                            <div id="schemaItemsDiv">
                                <%-- List of Schema Items --%>
                                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                        <td>
                                            <img src="Images/shim.gif" style="width: 2px; height: 2px" /></td>
                                    </tr>
                                    <asp:Repeater runat="server" ID="SchemaItemsRptr">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="TimelineOnStudy_<%# Container.ItemIndex % 2==0 ? "A" : "B" %>" style="width: 100%">
                                                    <%# Eval("ItemDescription") %>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>
                        </div>
                    </td>
                    <td class="TimelineTopRightBG">
                        <div id="VisitColumnsShell">
                            <div id="TimelineMainDiv" style="width: 970px; height: 100%;">
                                <table border="0" cellspacing="0" cellpadding="0">
                                    <asp:Repeater runat="server" ID="SchemaItemsTimelineItemRptr" OnItemCreated="BindStudyItems">
                                        <%-- Header Sizing Columns --%>
                                        <HeaderTemplate>
                                            <tr>
                                                <td style="width: 2px;">
                                                    <img src="Images/shim.gif" class="TimelineColSizer" style="width: 2px; height: 2px" /></td>
                                                <asp:Repeater runat="server" ID="PreStudyItems">
                                                    <ItemTemplate>
                                                        <td>
                                                            <img src="Images/shim.gif" class="TimelineColSizer" /></td>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <td>
                                                    <img src="Images/shim.gif" class="TimelineColSizer" style="width: 52px;" /></td>
                                                <asp:Repeater runat="server" ID="OnStudyItems">
                                                    <ItemTemplate>
                                                        <td>
                                                            <img src="Images/shim.gif" class="TimelineColSizer" /></td>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tr>
                                        </HeaderTemplate>
                                        <%-- Rows of SchemaItems TimelineItems --%>
                                        <ItemTemplate>
                                            <tr>
                                                <td class="TimelineOnStudy_<%# Container.ItemIndex % 2==0 ? "A" : "B" %>" style="width: 2px;">
                                                    &nbsp;
                                                    <cic:CaisisHidden runat="server" ID="SchemaItemIdField" Value='<%# Eval("SchemaItemId") %>'>
                                                    </cic:CaisisHidden>
                                                </td>
                                                <%-- List of Pre-Study Items --%>
                                                <asp:Repeater runat="server" ID="PreStudyItems">
                                                    <ItemTemplate>
                                                        <td class="TimelinePreStudy_<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex % 2==0 ? "A" : "B" %>">
                                                            <label for="<%# Container.FindControl("CheckBoxHolder").ClientID %>" style="display: block;
                                                                text-align: center;">
                                                                <asp:PlaceHolder runat="server" ID="CheckBoxHolder" />
                                                            </label>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <%-- On-Study Marker --%>
                                                <td class="TimelineOnStudyDateDivider<%# Container.ItemIndex % 2==0 ? "A" : "B" %>">
                                                    &nbsp;</td>
                                                <%-- List of On-Study Items --%>
                                                <asp:Repeater runat="server" ID="OnStudyItems">
                                                    <ItemTemplate>
                                                        <td class="TimelineOnStudy_<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex % 2==0 ? "A" : "B" %>">
                                                            <label for="<%# Container.FindControl("CheckBoxHolder").ClientID %>" style="display: block;
                                                                text-align: center;">
                                                                <asp:PlaceHolder runat="server" ID="CheckBoxHolder" />
                                                            </label>
                                                        </td>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="TimelineBottomLeftBG">
                        &nbsp;</td>
                    <td class="TimelineBottomRightBG">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="padding-top: 14px; padding-left: 50px;">
                        <asp:ImageButton runat="server" ID="PrevBtn" OnClick="PrevClick" AlternateText="Previous Screen"
                            ImageUrl="Images/Button_Previous.png" />
                    </td>
                    <td style="padding-top: 14px; padding-right: 80px; text-align: right">
                        <asp:ImageButton runat="server" ID="SaveBtn" OnClick="SaveClick" AlternateText="Save"
                            ImageUrl="Images/Button_Save.png" Style="margin-right: 70px;" />
                        <asp:ImageButton runat="server" ID="NextBtn" OnClick="NextClick" AlternateText="Next"
                            ImageUrl="Images/Button_Next.png" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
