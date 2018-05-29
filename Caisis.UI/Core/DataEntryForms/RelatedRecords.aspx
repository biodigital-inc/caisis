<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RelatedRecords.aspx.cs" Inherits="Caisis.UI.Core.RelatedRecords" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/AdminStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/jquery.js" type="text/javascript"></script>

    <script type="text/javascript">

        jQuery.noConflict();

        // unchecks all radio buttons in the specified row
        function clearRelatedRecordRadio(index) {
            var dataRow = jQuery('#Record' + index + '_Row');
            var radios = dataRow.find("input[type='radio']");
            radios.removeAttr("checked");
            return false;
        }

        function refreshAndCloseRelatedRecords(clientId, updatedRelatedRecords) {
            if (clientId && clientId != '') {
                var clientField = window.parent.document.getElementById(clientId);
                if (clientField) {
                    var displayValue = '';
                    if (updatedRelatedRecords.length == 1) {
                        displayValue = getRelatedRecordStrength(updatedRelatedRecords[0]);
                    }
                    else if (updatedRelatedRecords.length > 1) {
                        displayValue = 'Multiple';
                    }
                    clientField.value = displayValue;
                }
            }
            // refresh list
            if (parent.refreshRelatedRecordLinks)
                parent.refreshRelatedRecordLinks();
            // close popup
            if (parent.cancelAddOtherRelatedRecord)
                parent.cancelAddOtherRelatedRecord();
        }

        function getRelatedRecordStrength(relationInt) {
            var lookup = document.getElementById('<% =RelationStrengthLookup.ClientID %>').getElementsByTagName('td');
            var strengthString = '';
            if (lookup && relationInt <= lookup.length) {
                var cell = lookup[relationInt];
                strengthString = cell.title;
            }
            return strengthString;
        }

        function showRecordData(index, show, recordDataHtmlRow) {
            var dataCell = jQuery('#Record' + index + '_Cell');
            var dataBubble = jQuery('#Record' + index + '_Data');
            var row = jQuery(recordDataHtmlRow);
            var rowOffset = row.offset();
            if (show) {
                dataBubble.show();
                dataBubble.offset({ top: rowOffset.top-70, left: 3 });
            }
            else {
                dataBubble.hide();
            }
        }
        
        function setAttributionTable(attributionTableSelector) {
            /*	var AttributionHtmlTable =  document.getElementById('AttributionHtmlTable');
            if (attributionTableSelector.selectedIndex != 0) { AttributionHtmlTable.className = '';} 
            else { AttributionHtmlTable.className = 'pendingSelection'; }
            */
        }

        function loadRelatedDataEntryRecord(table, tablePriKey) {
            if (table != '' && tablePriKey != '') {
                window.parent.location = 'PatientDataEntryContainer.aspx?tableName=' + table + '&primKey=' + tablePriKey;
            }
            return false;
        }
    
    </script>
    <style type="text/css">
        body
        {
            background-color: transparent;
        }
        .RelatedRecordStrength0
        {
            background-image: url(../../Images/Icon_RelatedRecordStrength_0.png);
        }
        .RelatedRecordStrength1
        {
            background-image: url(../../Images/Icon_RelatedRecordStrength_1.png);
        }
        .RelatedRecordStrength2
        {
            background-image: url(../../Images/Icon_RelatedRecordStrength_2.png);
        }
        .RelatedRecordStrength3
        {
            background-image: url(../../Images/Icon_RelatedRecordStrength_3.png);
        }
        .RelatedRecordStrength4
        {
            background-image: url(../../Images/Icon_RelatedRecordStrength_4.png);
        }
        .RelatedRecordStrength5
        {
            background-image: url(../../Images/Icon_RelatedRecordStrength_5.png);
        }
        .SmallPopup
        {
            max-width: 500px;
            margin: 10px 10px 0px 220px;
        }
        .SmallPopupContentContainer
        {
            background-image: url(../../Images/RelatedRecordPopupBG_TopRight.png);
            background-repeat: no-repeat;
            background-position: right top;
            padding-right: 18px;
        }
        .SmallPopupContent
        {
            background-image: url(../../Images/RelatedRecordPopupBG_TopLeft.png);
            background-repeat: no-repeat;
            padding-left: 17px;
            padding-top: 12px;
            min-height: 100px;
        }
        .SmallPopupBottomContainer
        {
            background-image: url(../../Images/RelatedRecordPopupBG_BottomRight.png);
            background-repeat: no-repeat;
            background-position: right bottom;
            padding-right: 18px;
            font-size: 1px;
            line-height: 1px;
        }
        .SmallPopupBottom
        {
            background-image: url(../../Images/RelatedRecordPopupBG_BottomLeft.png);
            background-repeat: no-repeat;
            background-position: left bottom;
            height: 19px;
            font-size: 1px;
            line-height: 1px;
        }
        .SmallPopupTitle
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: bold;
            color: #ffffff;
            position: relative;
        }
        .SmallPopupContent img.closeButton
        {
            width: 13px;
            height: 11px;
            background-image: url(../../Images/PanelRedTitleBarButton_Close.png);
            background-repeat: no-repeat;
            cursor: pointer;
            float: right;
            margin-right: -5px;
            margin-top: 1px;
        }
        .SmallPopupContent img.closeButton:hover
        {
            background-image: url(../../Images/PanelRedTitleBarButton_Close_hover.png);
        }
        #AttributionHtmlTable
        {
            width: 100%;
            border-collapse: collapse;
            margin: 14px 0px 0px 0px;
            
        }
        #AttributionHtmlTable td
        {
            border: solid 1px #cccccc;
            width: auto;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            font-weight: normal;
            color: #111111;
            text-align: center;
            padding: 2px 2px 2px 2px;
        }
        #AttributionHtmlTable td.AttributionTableSelectorCell
        {
            width: auto;
            border-top: none;
            border-left: none;
            border-bottom: none;
            border-right: none;
            text-align: left;
            padding: 0px 8px 0px 0px;
            vertical-align: top;
            display: table-cell !important;
        }
        #AttributionHtmlTable td.AttributionTableTopRightColumn
        {
	        width: 26px;
	        border-top: none;
	        border-right: none;
	        border-bottom: none;
	        font-size: 1px;
	        line-height: 1px;
	        padding: 1px 1px 1px 0px;
        }
        
        #AttributionRowsHtmlTable td.AttributionTableFirstColumn
        {
            width: auto;
            text-align: left;
            border: solid 1px #cccccc;
            padding: 2px 2px 2px 4px;
            cursor: pointer;
        }
        #AttributionRowsHtmlTable td.AttributionTableFirstColumn:hover
        {
            color: #000000;
            
	        background-color: #EEDFE0;
            
	        *filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
	        background-image: -webkit-gradient(
		        linear,
		        left top,
		        left bottom,
		        color-stop(0, #D0C9D1),
		        color-stop(0.47, #DBA5B2),
		        color-stop(1, #EED2D9)
	        );
	        background-image: -moz-linear-gradient(
		        center top,
		        #D0C9D1 0%,
		        #DBA5B2 47%,
		        #EED2D9 100%
	        );
        }
        
        #AttributionRowsHtmlTable td.AttributionTableDeleteColumn
        {
            width: 26px;
        }
        #AttributionHtmlTable td.AttributionTableRelationStrengthHeading
        {
            width: auto;
            font-size: 9px;
            font-weight: bold;
            padding: 1px 0px 1px 0px;
            background-color: #EBEBEB;
        }
        #AttributionHtmlTable td.AttributionTableRelationStrengthSingleHeading
        {
            width: 28px;
            font-size: 1px;
            font-weight: bold;
            padding: 1px 0px 1px 0px;
            height: 11px;
            background-repeat: no-repeat;
            background-position: center center;
            background-color: #ffffff;
            border-bottom: none;
        }
        #AttributionHtmlTable select.AttributionTableSelector
        {
            width: 100%;
        }
        
        #AttributionRowsHtmlTable
        {
            width: 100%;
            border-collapse: collapse;
            margin: 0px 0px 0px 0px;
            table-layout: fixed;
        }
        #AttributionRowsHtmlTable td
        {
            border: solid 1px #cccccc;
            width: 28px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11px;
            font-weight: normal;
            color: #111111;
            text-align: center;
            padding: 1px 0px 1px 0px;
        }
        #AttributionRowsHtmlTable tr.RelatedRecordsRowA
        {
            background-color: #ebebeb;
        }
        #AttributionRowsHtmlTable tr.RelatedRecordsRowB
        {
            background-color: #ffffff;
        }
        img.DeleteRelatedRecord
        {
            width: 18px;
            height: 15px;
            cursor: pointer;
            background-image: url(../../Images/EFormDeleteRow.png);
            background-repeat: no-repeat;
            background-position: center center;
        }
        div.RelatedRecordInfoBubble
        {
            display: none;
            width: auto;
            text-align: left;
            position: absolute;
            top: 0px;
            left: 0px;
            background-image: url(../../Images/RelatedRecordInfoBubbleBG_Bottom.png);
            background-repeat: no-repeat;
            background-position: left bottom;
            padding-bottom: 13px;
        }
        div.RelatedRecordInfoBubbleContent
        {
            width: 200px;
            text-align: left;
            background-image: url(../../Images/RelatedRecordInfoBubbleBG_Top.png);
            background-repeat: no-repeat;
            background-position: left top;
            padding: 20px 20px 5px 20px;
            min-height: 70px;
        }

        div.RelatedRecordInfoBubble table
        {
            width: 93%;
            table-layout: fixed;
            border-collapse: collapse;
        }
        div.RelatedRecordInfoBubble td
        {
            color: #333333;
            border-left: none;
            border-right: none;
            border-top: solid 1px #E0E0D9;
            border-bottom: solid 1px #E0E0D9;
            white-space: normal;
            word-wrap: break-word;
            vertical-align: top;
        }
        table#AttributionHtmlTable.pendingSelection td
        {
            display: none !important;
        }
        table#AttributionHtmlTable.pendingSelection td.AttributionTableSelectorCell
        {
            display: table-cell !important;
        }
        #DataEntryButtons
        {
            height: 20px;
            text-align: center;
            margin-top: 8px;
        }
        #SaveBtn
        {
        }
        #AttributionRowsContainer
        {
            max-height: 300px;
            overflow: auto;
            overflow-x: hidden;
        }
        tr.NoRecordsMsgRow td
        {
            background-color: #efefef;
            text-align: center;
            padding-right: 40px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <%-- CURRENT RELATED RECORDS --%>
    <div id="CurrentRecords">
        <asp:Repeater runat="server" ID="RelatedRecordsRptr">
            <ItemTemplate>
                <a title="<%# GetTableLabel(Eval("SrcTableName").ToString()) %>" class="RelatedRecordStrength<%# Eval("RelationStrength") %>" href="?tableName=<%# Eval("SrcTableName") %>&primKey=<%# Eval("SrcPrimaryKey") %>">
                    <%# GetRelatedRecordDisplayLabel(Container.DataItem) %></a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <%-- MAIN INTERFACE --%>
    <div id="RelatedRecordsSelector" class="SmallPopup">
	<div class="SmallPopupContentContainer"><div class="SmallPopupContent">
        <div class="SmallPopupTitle">
            <img alt="Close" title="Close" class="closeButton" src="../../Images/shim.gif" onclick="parent.cancelAddOtherRelatedRecord(); return false;" /><%= GetAttributionTitle() %>
            Attribution</div>
        <table id="AttributionHtmlTable"  cellspacing="0">
          <tr>
              <td rowspan="2" class="AttributionTableSelectorCell" style="display: table-cell;">
                  <asp:DropDownList runat="server" ID="SourceTables" CssClass="AttributionTableSelector"
                      AutoPostBack="true" OnSelectedIndexChanged="BuildRelatedRecords" AppendDataBoundItems="true"
                      DataTextField="TableLabel" DataValueField="TableName" Style="display: inline-block;">
                      <asp:ListItem Text="-- Select Record Type --" Value=""></asp:ListItem>
                  </asp:DropDownList>
              </td>
            <td colspan="5" id="AttributionTableRelationStrengthHeading" runat="server" class="AttributionTableRelationStrengthHeading">Relation Strength</td>
            <td class="AttributionTableTopRightColumn">&nbsp;</td>
          </tr>
          <tr id="RelationStrengthLookup" runat="server">
            <td title="Unrelated" class="AttributionTableRelationStrengthSingleHeading RelatedRecordStrength0">&nbsp;</td>

            <td title="Unlikely" class="AttributionTableRelationStrengthSingleHeading RelatedRecordStrength1">&nbsp;</td>
            <td title="Possible" class="AttributionTableRelationStrengthSingleHeading RelatedRecordStrength2">&nbsp;</td>
            <td title="Probable" class="AttributionTableRelationStrengthSingleHeading RelatedRecordStrength3">&nbsp;</td>
            <td title="Definite" class="AttributionTableRelationStrengthSingleHeading RelatedRecordStrength4">&nbsp;</td>
            <td class="AttributionTableTopRightColumn">&nbsp;</td>
          </tr>
          </table>
          <div id="AttributionRowsContainer">
          <table id="AttributionRowsHtmlTable"  cellspacing="0">
          <%-- Repeater --%>
            <asp:Repeater runat="server" ID="TableRecordsRptr" OnItemDataBound="SetRelatedRadioButtons">
                <ItemTemplate>
                    <tr id="Record<%# Container.ItemIndex %>_Row" class="<%# Container.ItemIndex % 2 ==0 ? "RelatedRecordsRowA" : "RelatedRecordsRowB" %>"
                        onmouseover="showRecordData(<%# Container.ItemIndex %>,true,this);" onmouseout="showRecordData(<%# Container.ItemIndex %>,false,this);">
                        <td id="Record<%# Container.ItemIndex %>_Cell" class="AttributionTableFirstColumn" title="<%# IsActualRecord ? "Go to record" : "" %>" onclick="return loadRelatedDataEntryRecord('<%# Eval("SrcTableName") %>', '<%# Eval("SrcPrimaryKey") %>');">
                            <%# GetDisplayColumn(Container.DataItem) %>
                            <asp:HiddenField runat="server" ID="RelatedRecordId" />
                            <asp:HiddenField runat="server" ID="SrcTablePriKey" />                            
                        </td>
                        <td title="Unrelated"><asp:RadioButton runat="server" ID="Relation_Radio_0" GroupName="Relation_Radio" /></td>
                        <td title="Unlikely"><asp:RadioButton runat="server" ID="Relation_Radio_1" GroupName="Relation_Radio" /></td>
                        <td title="Possible"><asp:RadioButton runat="server" ID="Relation_Radio_2" GroupName="Relation_Radio" /></td>
                        <td title="Probable"><asp:RadioButton runat="server" ID="Relation_Radio_3" GroupName="Relation_Radio" /></td>
                        <td title="Definite"><asp:RadioButton runat="server" ID="Relation_Radio_4" GroupName="Relation_Radio" /></td>
                        <td class="AttributionTableDeleteColumn"><img alt="Delete Relation" title="Delete Relation" src="../../Images/shim.gif" class="DeleteRelatedRecord" onclick="return clearRelatedRecordRadio(<%# Container.ItemIndex %>);" /></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
                    <tr id="NoRecordsMsgRow" class="NoRecordsMsgRow" runat="server" visible="false"><td>No records of this type exist for this patient.</td></tr>
        </table>
        </div>
        <div id="DataEntryButtons" style="text-align: center;">
            <span class="dataEntryButtonGray" onclick="parent.cancelAddOtherRelatedRecord(); return false;" style="margin-right: 80px;">Cancel</span>
        
            <asp:Button runat="server" ID="SaveBtn" Text="Save" CssClass="dataEntryButtonGray" OnClick="SaveClick" /></div>
    </div></div>

	<div class="SmallPopupBottomContainer"><div class="SmallPopupBottom">&nbsp;</div>
	</div>
	<%-- Related Record Details --%>
        <div id="RelatedRecordDetailsContainer">
            <asp:Repeater runat="server" ID="TableRecordsDetailsRptr" OnItemDataBound="BuildRelatedDetails">
                <ItemTemplate>
                    <%-- Related Record Details --%>
                    <div id="Record<%# Container.ItemIndex %>_Data" class="RelatedRecordInfoBubble" onclick="return loadRelatedDataEntryRecord('<%# Eval("SrcTableName") %>', '<%# Eval("SrcPrimaryKey") %>');">
                        <div class="RelatedRecordInfoBubbleContent">
                            <table>
                                <asp:Repeater runat="server" ID="RelatedRecordsDetailsRptr">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%# Eval("FieldLabel")%>
                                            </td>
                                            <td>
                                                <%# Eval("FieldValue") %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
</div>
    
    </form>
<script type="text/javascript">

function syncTableWidths()
{
    if (document.getElementById('AttributionRowsHtmlTable') != null && document.getElementById('AttributionRowsHtmlTable').offsetWidth > 0)
    {
        document.getElementById('AttributionHtmlTable').style.width = document.getElementById('AttributionRowsHtmlTable').offsetWidth + 'px';
    }
}
syncTableWidths();
</script>
</body>
</html>
