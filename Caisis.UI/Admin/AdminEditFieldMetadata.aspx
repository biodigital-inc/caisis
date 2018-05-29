<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEditFieldMetadata.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminEditFieldMetadata" %>

<%@ Register TagPrefix="grid" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="tooltip" TagName="helpToolTip" Src="~/Core/Help/helpToolTip.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit Field Metadata</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/Admin.js" type="text/javascript"></script>

    <script src="../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>

    <script src="../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../ClientScripts/headerJS.js" type="text/javascript"></script>

    <script src="../ClientScripts/Help.js" type="text/javascript"></script>

    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery-ui.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        var FIELD_SORT_ENABLED = true;//'<%= (!QueryDiseaseId.HasValue).ToString().ToLower() %>';

        Browser.ResizeElement({ customResizer: resizeMainContainer });

        jQuery.noConflict();

        jQuery(document).ready(function() {
            // set default
//            setActiveDataEntryTab('Metadata', 0);

            // SORTABLE METADTAA
//            jQuery("#MetadataGrid tbody").sortable({
//                update: function(event, ui) {
//                    // sync fields
//                    var sortFields = jQuery("#MetadataGrid input.FieldOrderField");
//                    sortFields.blur();
//                } 
//            });
//            jQuery("#MetadataGrid tbody").disableSelection();

            // add focus for new metadata fields
            jQuery('#NonMetadataFields tr').each(function(index, tr) {
                var row = jQuery(tr);
                var cb = row.find('input[id*="MetaFieldCheckBox"]');
                var tb = row.find('input[id*="MetaFieldName"]');
                var setTextField = function(e) {
                    if (tb.val() == '') {
                        cb.removeAttr('checked');
                    }
                    else {
                        cb.attr('checked', 'checked');
                    }
                }
                tb.focus(setTextField).keyup(setTextField);
            });

            // add field sorting (if enabled)
            if (FIELD_SORT_ENABLED) {
                initTableFieldSorting('<%= MetadataGrid.ClientID %>', 'FieldOrder', 'dataGridItemRowA', 'dataGridItemRowB');
            }
            // add Lookup code toggling (hide column on non lookup control)
            jQuery('#MetadataGrid tr').each(function(index, tr) {
                var row = jQuery(tr);
                var controlField = row.find('select[id*="ControlType"]');
                var lookupField = row.find('input[type="text"][id*="LookupCode"]');
                var lookupCell = lookupField.parent('td');
                var doShowHideLookup = function() {
                    var controlType = controlField.val() + "";
                    if(controlField) {
                        var isListControl = controlType.indexOf("List") > -1;
                        if (controlType == 'CaisisSelect' || controlType == 'CaisisComboBox' || isListControl) {
                            lookupCell.css('visibility', 'visible');
                        }
                        else {
                            lookupCell.css('visibility', 'hidden');
                        }
                    }
                };
                // add change hanlder and inital UI adjust
                controlField.change(doShowHideLookup);
                doShowHideLookup();

                // adjust Table layout
                var numDisplayCol = jQuery('#<%= NumDisplayColumns.ClientID %>');
                var columnLayout = jQuery('#ColumnLayoutAttributes');
                var gridViewCheckBox = jQuery('#<%= GridView.ClientID %>');
                var gridLayout = jQuery('#GridLayoutAttributes');
                var doGridViewLayoutAdjust = function() {
                    var selectedLayout = numDisplayCol.val();
                    var isGridChecked = gridViewCheckBox.is(':checked');
                    if (numDisplayCol[0].selectedIndex == 2) {
                        gridViewCheckBox.attr('checked', 'checked');
                        gridLayout.show();
                        columnLayout.hide();
                    }
                    else {
                        gridViewCheckBox.removeAttr('checked');
                        gridLayout.hide();
                        columnLayout.show();
                    }
                }
                // add change handler
                numDisplayCol.change(doGridViewLayoutAdjust);
                // run inital adjust
                doGridViewLayoutAdjust();
            });
        });

        function resizeMainContainer() {
            var adjustedHeight = Math.max(100, getHeight(window) - 100);
            jQuery('#TabOverflow').css({ 'height': adjustedHeight + 'px', 'max-height': adjustedHeight + 'px' });
        }

        function viewFieldLookupCode(srcElement, lkpClientId) {
            var lkpFieldName = jQuery('#' + lkpClientId).val();
            // get current disease id (if applicable)
            var diseaseId = '<%= QueryDiseaseId %>';
            // set iframe src
            window.frames['LookupCodeEdit'].location = 'LookupCode_QuickView.aspx?diseaseId=' + diseaseId + '&lkpFieldName=' + escape(lkpFieldName);
            // show popup
            jQuery('#popupTitle').text('Lookup Code: ' + lkpFieldName);
            var popupLayer = jQuery('#ViewLookupCodeLayer').show();
            var left = jQuery(srcElement).position().left - popupLayer.width();
            popupLayer.css('left', left + 'px');
        }

        function closeFieldLookupCode() {
            jQuery('#ViewLookupCodeLayer').hide();
        }    
        
        function showMiscFieldAttributes(index, btn, tableId, fieldId) {           
            var allLayers = jQuery('div.MiscFieldAttributes');
            var layer = allLayers.eq(index);
            
            // important: move inside <form>, otherwise values aren't POSTed
            var mainForm = jQuery('form').first();
            if (mainForm.data('_movedToForm') != true) {                
                mainForm.append(allLayers);
                mainForm.data('_movedToBody', true);
            }
          
            // set URL for editing misc field attributes
            var editFieldURL = 'AdminEditFieldMetadataMisc.aspx?diseaseId=' + '<%= QueryDiseaseId %>' + '&tableId=' + tableId + '&fieldId=' + fieldId + '&exclude=' + '<%= ExcludedFieldAttributes %>';
            var layerFrame = jQuery('#EditMiscAttributes_' + index);
            layerFrame.attr('src', editFieldURL);
            
            // hide all other layers
            hideMiscFieldAttributes();

            // show and position layer
            layer.show();
            var winHeight = jQuery(window).height();
            var winWidth = jQuery(window).width();
            var left = (winWidth - layer.width()) / 2;
            layer.css( { 'top': 25 + 'px' , 'left' : left + 'px' } );
            
            return false;
        }
        
        function hideMiscFieldAttributes() {
            var popups = jQuery('div.MiscFieldAttributes');
            popups.hide();
        }

        /* ]]> */
    </script>

    <style type="text/css">
        table.CheckBoxListLayer
        {
            max-height: 100px;
            overflow: auto;
        }
        .LabelCol, label
        {
            min-width: 125px;
            font-weight: bold;
        }
        .dataGrid
        {
            margin-top: 0px;
            margin-left: 0px;
            border-style: none;
        }
        .metaTab
        {
            display: inline-block;
            margin: 2px 0px 0px 5px;
            padding: 2px 10px;
            color: #333333;
            border: 1px solid #cccccc;
            border-bottom: none;
            text-decoration: none;
        }
        .metaTab:hover
        {
            border: 1px solid #666666;
            border-bottom: none;
        }
        #ViewLookupCodeLayer
        {
            position: absolute;
            top: 100px;
            width: 50%;
            left: 25%;
            z-index: 101;
        }
        #ViewLookupCodeLayer iframe
        {
            display: block;
            width: 95%;
            height: 350px;
            margin: auto;
            border: 1px solid #ccc;
        }
        .MiscFieldAttributes
        {
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            min-width: 400px;
            max-width: 725px;
        }
        #dataGrid td
        {
            width: auto;
        }
        #TableAttributesTable
        {
            width: 90%;
            margin: 10px auto 30px auto;
        }
        #TableAttributesTable td
        {
            padding: 6px 2px 6px 2px;
            vertical-align: middle;
            border-bottom: solid 1px #e8e8e8;
        }
        #MiscAttributesTable
        {
            width: 90%;
            margin: 10px auto 30px auto;
        }
        #MiscAttributesTable td
        {
            padding: 6px 2px 6px 2px;
            vertical-align: middle;
            border-bottom: solid 1px #e8e8e8;
        }
        .MiscAttributesTable
        {
            width: 90%;
            margin: 10px auto 10px auto;
        }
        .attributeFieldWrapper
        {
            display: block;
            width: 48%;
            margin: auto;
            float: left;
            padding: 6px 2px 6px 2px;
            vertical-align: middle;
            border-bottom: solid 1px #e8e8e8;
        }
        .attributeFieldWrapper label
        {
            display: inline-block;
        }
        .attributeFieldWrapper input,.attributeFieldWrapper select
        {
            margin-right: 10px;
            min-width: 150px;
        }
        .MiscFieldAttributes * div.attributeFieldWrapper
        {
            float: left;
            width: 350px;
        }
        .MiscColumnCell
        {

        }
        .miniPopupFrame
        {
            display: block;
            margin: 3px auto;
            width: 650px;
            height: 350px;
        }
    </style>
</head>
<body class="AdminBody" style="height: 95%;">
    <form id="form1" runat="server">
    <%-- Table Level Metadata --%>
    <div>
        <%-- Table Attributes --%>
        <asp:PlaceHolder runat="server" ID="TableAttributesPanel">
            <cic:CaisisHidden runat="server" ID="TableLabel_Id" Table="MetadataTableAttributes"
                Field="TableLabel" />
            <cic:CaisisHidden runat="server" ID="TableDescription_Id" Table="MetadataTableAttributes"
                Field="TableDescription" />
            <cic:CaisisHidden runat="server" ID="GridView_Id" Table="MetadataTableAttributes"
                Field="GridView" />
            <cic:CaisisHidden runat="server" ID="NumDisplayColumns_Id" Table="MetadataTableAttributes"
                Field="NumDisplayColumns" />
            <cic:CaisisHidden runat="server" ID="Plugins_Id" Table="MetadataTableAttributes"
                Field="Plugins" />
            <%-- MISC Table Attributes --%>
            <cic:CaisisHidden runat="server" ID="Form_Id" Table="MetadataTableAttributes" Field="Form" />
            <cic:CaisisHidden runat="server" ID="Menu_Id" Table="MetadataTableAttributes" Field="Menu" />
            <cic:CaisisHidden runat="server" ID="MenuOrder_Id" Table="MetadataTableAttributes" Field="MenuOrder" />
            <cic:CaisisHidden runat="server" ID="AllowAbsentEvent_Id" Table="MetadataTableAttributes"
                Field="AllowAbsentEvent" />
            <cic:CaisisHidden runat="server" ID="ProtocolMgmtTopLevelTable_Id" Table="MetadataTableAttributes"
                Field="ProtocolMgmtTopLevelTable" />
            <cic:CaisisHidden runat="server" ID="UseInWorkflows_Id" Table="MetadataTableAttributes"
                Field="UseInWorkflows" />
            <cic:CaisisHidden runat="server" ID="FileName_Id" Table="MetadataTableAttributes"
                Field="FileName" />
            <cic:CaisisHidden runat="server" ID="DisplayWithParent_Id" Table="MetadataTableAttributes"
                Field="DisplayWithParent" />
            <cic:CaisisHidden runat="server" ID="DisplayWithChild_id" Table="MetadataTableAttributes"
                Field="DisplayWithChild" />
            <cic:CaisisHidden runat="server" ID="MostRelevantTables_Id" Table="MetadataTableAttributes"
                Field="MostRelevantTables" />
            <cic:CaisisHidden runat="server" ID="TotalBlankGridRows_Id" Table="MetadataTableAttributes"
                Field="TotalBlankGridRows" />
            <cic:CaisisHidden runat="server" ID="VisibleBlankGridRows_Id" Table="MetadataTableAttributes"
                Field="VisibleBlankGridRows" />
            <cic:CaisisHidden runat="server" ID="RelatedRecordUtility_Id" Table="MetadataTableAttributes"
                Field="RelatedRecordUtility" />
        </asp:PlaceHolder>
        <%-- Table Attribute Values --%>
        <asp:PlaceHolder runat="server" ID="TablePanel">
            <tooltip:helpToolTip runat="server" ID="HelpLayer" />
            <div class="EditDataEntryForm_ChildTable">
                <div class="EditDataEntryForm_ChildTableTitleOuterContainer" style="min-height: 125px;">
                    <span onclick="setActiveDataEntryTab('TableMetadata', 0);" id="TableMetadata_Link_0"
                        class="EditDataEntryForm_ChildTableTitleInnerContainer"><span id="TableMetadata_Text_0"
                            class="EditDataEntryForm_ChildTableTitle">Table Attributes</span></span>

                    <span onclick="setActiveDataEntryTab('TableMetadata', 1);" id="TableMetadata_Link_1"
                        class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled"><span id="TableMetadata_Text_1"
                            class="EditDataEntryForm_ChildTableTitle">Field Attributes</span></span>
                    <span onclick="setActiveDataEntryTab('TableMetadata', 2);" id="TableMetadata_Link_2"
                        class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled"><span id="TableMetadata_Text_2"
                            class="EditDataEntryForm_ChildTableTitle">Add a Field</span></span>


   
<div id="TabOverflow" style="max-height: 400px; overflow: auto;">


                    <div id="TableMetadata_Tab_0">
                        <table id="TableAttributesTable" cellspacing="0">
                            <tr>
                                <td class="LabelCol" style="width: 100px;">
                                    <asp:Label runat="server" ID="TableLabel_Label" AssociatedControlID="TableLabel">Table Label</asp:Label>
                                </td>
                                <td colspan="3">
                                    <cic:CaisisHidden runat="server" ID="TableLabel_ValueId" Table="MetadataTableAttributeValues"
                                        Field="TableLabel" />
                                    <cic:CaisisHidden runat="server" ID="TableLabel_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                        Field="TableLabel" />
                                    <cic:CaisisTextBox runat="server" ID="TableLabel" Table="MetadataTableAttributeValues"
                                        Field="TableLabel" ShowLabel="false" Width="98%">
                                    </cic:CaisisTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="LabelCol">
                                    <asp:Label runat="server" ID="TableDescription_Label" AssociatedControlID="TableDescription">Description</asp:Label>
                                </td>
                                <td colspan="3">
                                    <cic:CaisisHidden runat="server" ID="TableDescription_ValueId" Table="MetadataTableAttributeValues"
                                        Field="TableDescription" />
                                    <cic:CaisisHidden runat="server" ID="TableDescription_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                        Field="TableDescription" />
                                    <cic:CaisisTextBox runat="server" ID="TableDescription" Table="MetadataTableAttributeValues"
                                        Field="TableDescription" ShowLabel="false" Width="98%">
                                    </cic:CaisisTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="LabelCol">
                                    <asp:Label runat="server" ID="NumDisplayColumns_Label" AssociatedControlID="NumDisplayColumns">Layout</asp:Label>
                                </td>
                                <td colspan="2">
                                    <cic:CaisisHidden runat="server" ID="NumDisplayColumns_ValueId" Table="MetadataTableAttributeValues"
                                        Field="NumDisplayColumns" />
                                    <cic:CaisisHidden runat="server" ID="NumDisplayColumns_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                        Field="NumDisplayColumns" />
                                    <cic:CaisisSelect runat="server" ID="NumDisplayColumns" Table="MetadataTableAttributeValues"
                                        Field="NumDisplayColumns" ShowLabel="false" ShowEmptyListItem="false">
                                        <asp:ListItem Text="-- 1 Column --" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="-- 2 Columns --" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="-- Grid --" Value=""></asp:ListItem>
                                    </cic:CaisisSelect>
                                </td>
                                <td>
                                    <%-- Column Attribuets --%>
                                    <div id="ColumnLayoutAttributes">
                                        <asp:Label runat="server" ID="DisplayWithChild_Label" AssociatedControlID="DisplayWithChild">Display with children</asp:Label>
                                        <cic:CaisisHidden runat="server" ID="DisplayWithChild_ValueId" Table="MetadataTableAttributeValues"
                                            Field="DisplayWithChild" />
                                        <cic:CaisisHidden runat="server" ID="DisplayWithChild_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                            Field="DisplayWithChild" />
                                        <cic:CaisisCheckBoxList runat="server" ID="DisplayWithChild" Table="MetadataTableAttributeValues"
                                            Field="DisplayWithChild" ShowLabel="false" DropDown="true" ShowOther="false">
                                        </cic:CaisisCheckBoxList>
                                    </div>
                                    <div id="GridLayoutAttributes">
                                        <%-- GRID VIEW Attribuets --%>
                                        <div style="display: none;">
                                            <asp:Label runat="server" ID="GridView_Label" AssociatedControlID="GridView">Display As Grid</asp:Label>
                                            <cic:CaisisHidden runat="server" ID="GridView_ValueId" Table="MetadataTableAttributeValues"
                                                Field="GridView" />
                                            <cic:CaisisHidden runat="server" ID="GridView_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                                Field="GridView" />
                                            <cic:CaisisCheckBox runat="server" ID="GridView" Table="MetadataTableAttributeValues"
                                                Field="GridView" ShowLabel="false"></cic:CaisisCheckBox>
                                        </div>
                                        <div class="attributeFieldWrapper">
                                            <asp:Label runat="server" ID="TotalBlankGridRows_Label" AssociatedControlID="TotalBlankGridRows">Total Blank Grid Rows</asp:Label>
                                            <cic:CaisisHidden runat="server" ID="TotalBlankGridRows_ValueId" Table="MetadataTableAttributeValues"
                                                Field="TotalBlankGridRows" />
                                            <cic:CaisisHidden runat="server" ID="TotalBlankGridRows_DiseaseAttributeValueId"
                                                Table="DiseaseAttributeValues" Field="TotalBlankGridRows" />
                                            <cic:CaisisTextBox runat="server" ID="TotalBlankGridRows" Table="MetadataTableAttributeValues"
                                                Field="TotalBlankGridRows" ShowLabel="false"></cic:CaisisTextBox>
                                        </div>
                                        <div class="attributeFieldWrapper">
                                            <asp:Label runat="server" ID="VisibleBlankGridRows_Label" AssociatedControlID="VisibleBlankGridRows">Visible Blank Grid Rows</asp:Label>
                                            <cic:CaisisHidden runat="server" ID="VisibleBlankGridRows_ValueId" Table="MetadataTableAttributeValues"
                                                Field="VisibleBlankGridRows" />
                                            <cic:CaisisHidden runat="server" ID="VisibleBlankGridRows_DiseaseAttributeValueId"
                                                Table="DiseaseAttributeValues" Field="VisibleBlankGridRows" />
                                            <cic:CaisisTextBox runat="server" ID="VisibleBlankGridRows" Table="MetadataTableAttributeValues"
                                                Field="VisibleBlankGridRows" ShowLabel="false"></cic:CaisisTextBox>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="LabelCol">
                                    <asp:Label runat="server" ID="DisplayWithParent_Label" AssociatedControlID="DisplayWithParent">Display With Parent?</asp:Label>
                                </td>
                                <td colspan="3">
                                    <cic:CaisisHidden runat="server" ID="DisplayWithParent_ValueId" Table="MetadataTableAttributeValues"
                                        Field="DisplayWithParent" />
                                    <cic:CaisisHidden runat="server" ID="DisplayWithParent_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                        Field="DisplayWithParent" />
                                    <cic:CaisisCheckBox runat="server" ID="DisplayWithParent" Table="MetadataTableAttributeValues"
                                        Field="DisplayWithParent" ShowLabel="false" Text="Yes"></cic:CaisisCheckBox>
                                </td>
                            </tr>  
                            <tr>
                                <td class="LabelCol">
                                    <asp:Label runat="server" ID="Plugins_Label" AssociatedControlID="Plugins">Plugins</asp:Label>
                                </td>
                                <td colspan="3">
                                    <cic:CaisisHidden runat="server" ID="Plugins_ValueId" Table="MetadataTableAttributeValues"
                                        Field="Plugins" />
                                    <cic:CaisisHidden runat="server" ID="Plugins_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                        Field="Plugins" />
                                    <cic:CaisisCheckBoxList runat="server" ID="Plugins" Table="MetadataTableAttributeValues"
                                        Field="Plugins" ShowLabel="false" DropDown="true" ShowOther="false">
                                    </cic:CaisisCheckBoxList>
                                </td>
                            </tr>
                            <tr>
                                <td class="LabelCol">
                                    <asp:Label runat="server" ID="RelatedRecordUtility_Label" AssociatedControlID="RelatedRecordUtility">Related Record Utility</asp:Label>
                                </td>
                                <td colspan="3">
                                    <cic:CaisisHidden runat="server" ID="RelatedRecordUtility_ValueId" Table="MetadataTableAttributeValues"
                                        Field="RelatedRecordUtility" />
                                    <cic:CaisisHidden runat="server" ID="RelatedRecordUtility_DiseaseAttributeValueId"
                                        Table="DiseaseAttributeValues" Field="RelatedRecordUtility" />
                                    <cic:CaisisCheckBox runat="server" ID="RelatedRecordUtility" Table="MetadataTableAttributeValues"
                                        Field="RelatedRecordUtility" ShowLabel="false"></cic:CaisisCheckBox>
                                </td>
                            </tr>
                        </table>                    
                        <%-- MISC Table Attribute Values --%>
                        <div class="MiscAttributesTable">                            
                            <div class="attributeFieldWrapper">
                                <asp:Label runat="server" ID="MostRelevantTables_Label" AssociatedControlID="MostRelevantTables">Most Relevant Tables</asp:Label>
                                <cic:CaisisHidden runat="server" ID="MostRelevantTables_ValueId" Table="MetadataTableAttributeValues"
                                    Field="MostRelevantTables" />
                                <cic:CaisisHidden runat="server" ID="MostRelevantTables_DiseaseAttributeValueId"
                                    Table="DiseaseAttributeValues" Field="MostRelevantTables" />
                                <cic:CaisisCheckBoxList runat="server" ID="MostRelevantTables" Table="MetadataTableAttributeValues"
                                    Field="MostRelevantTables" ShowLabel="false" DropDown="true" ShowOther="false">
                                </cic:CaisisCheckBoxList>
                            </div>
                            <div class="attributeFieldWrapper">
                                <asp:Label runat="server" ID="Form_Label" AssociatedControlID="Form">Form</asp:Label>
                                <cic:CaisisHidden runat="server" ID="Form_ValueId" Table="MetadataTableAttributeValues"
                                    Field="Form" />
                                <cic:CaisisHidden runat="server" ID="Form_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                    Field="Form" />
                                <cic:CaisisCheckBox runat="server" ID="Form" Table="MetadataTableAttributeValues"
                                    Field="Form" ShowLabel="false"></cic:CaisisCheckBox>
                            </div>
                            <div class="attributeFieldWrapper">
                                <asp:Label runat="server" ID="Menu_Label" AssociatedControlID="Menu">Menu Grouping</asp:Label>
                                <cic:CaisisHidden runat="server" ID="Menu_ValueId" Table="MetadataTableAttributeValues"
                                    Field="Menu" />
                                <cic:CaisisHidden runat="server" ID="Menu_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                    Field="Menu" />
                                <cic:CaisisTextBox runat="server" ID="Menu" Table="MetadataTableAttributeValues"
                                    Field="Menu" ShowLabel="false">
                                </cic:CaisisTextBox>
                            </div>
                            <div class="attributeFieldWrapper">
                                <asp:Label runat="server" ID="MenuOrder_Label" AssociatedControlID="MenuOrder">Menu Order</asp:Label>
                                <cic:CaisisHidden runat="server" ID="MenuOrder_ValueId" Table="MetadataTableAttributeValues"
                                    Field="MenuOrder" />
                                <cic:CaisisHidden runat="server" ID="MenuOrder_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                    Field="MenuOrder" />
                                <cic:CaisisTextBox runat="server" ID="MenuOrder" Table="MetadataTableAttributeValues"
                                    Field="MenuOrder" ShowLabel="false">
                                </cic:CaisisTextBox>
                            </div>
                            <div class="attributeFieldWrapper">
                                <asp:Label runat="server" ID="AllowAbsentEvent_Label" AssociatedControlID="AllowAbsentEvent">Absent Event</asp:Label>
                                <cic:CaisisHidden runat="server" ID="AllowAbsentEvent_ValueId" Table="MetadataTableAttributeValues"
                                    Field="AllowAbsentEvent" />
                                <cic:CaisisHidden runat="server" ID="AllowAbsentEvent_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                    Field="AllowAbsentEvent" />
                                <cic:CaisisCheckBox runat="server" ID="AllowAbsentEvent" Table="MetadataTableAttributeValues"
                                    Field="AllowAbsentEvent" ShowLabel="false"></cic:CaisisCheckBox>
                            </div>
                            <div class="attributeFieldWrapper">
                                <asp:Label runat="server" ID="ProtocolMgmtTopLevelTable_Label" AssociatedControlID="ProtocolMgmtTopLevelTable">Protocol Table</asp:Label>
                                <cic:CaisisHidden runat="server" ID="ProtocolMgmtTopLevelTable_ValueId" Table="MetadataTableAttributeValues"
                                    Field="ProtocolMgmtTopLevelTable" />
                                <cic:CaisisHidden runat="server" ID="ProtocolMgmtTopLevelTable_DiseaseAttributeValueId"
                                    Table="DiseaseAttributeValues" Field="ProtocolMgmtTopLevelTable" />
                                <cic:CaisisCheckBox runat="server" ID="ProtocolMgmtTopLevelTable" Table="MetadataTableAttributeValues"
                                    Field="ProtocolMgmtTopLevelTable" ShowLabel="false"></cic:CaisisCheckBox>
                            </div>
                            <div class="attributeFieldWrapper">
                                <asp:Label runat="server" ID="UseInWorkflows_Label" AssociatedControlID="UseInWorkflows">Use In Workflows</asp:Label>
                                <cic:CaisisHidden runat="server" ID="UseInWorkflows_ValueId" Table="MetadataTableAttributeValues"
                                    Field="UseInWorkflows" />
                                <cic:CaisisHidden runat="server" ID="UseInWorkflows_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                    Field="UseInWorkflows" />
                                <cic:CaisisCheckBox runat="server" ID="UseInWorkflows" Table="MetadataTableAttributeValues"
                                    Field="UseInWorkflows" ShowLabel="false"></cic:CaisisCheckBox>
                            </div>
                            <div class="attributeFieldWrapper">
                                <asp:Label runat="server" ID="FileName_Label" AssociatedControlID="FileName">Filename</asp:Label>
                                <cic:CaisisHidden runat="server" ID="FileName_ValueId" Table="MetadataTableAttributeValues"
                                    Field="FileName" />
                                <cic:CaisisHidden runat="server" ID="FileName_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                    Field="FileName" />
                                <cic:CaisisTextBox runat="server" ID="FileName" Table="MetadataTableAttributeValues"
                                    Field="FileName" ShowLabel="false"></cic:CaisisTextBox>
                            </div>
                            <%-- MISC Table Attribute Values (Dynamic) --%>
                            <div runat="server" id="TableMiscAttributesPanel">
                            </div>
                        </div>
                        
                    </div>

                    
                <div id="TableMetadata_Tab_1" style="display: none; margin: 10px 0px 0px 10px;">
                    <asp:PlaceHolder runat="server" ID="TableFieldsPanel">
                        <cic:CaisisHidden runat="server" ID="DiseaseAttributeId" Table="DiseaseAttributes"
                            Field="DiseaseAttributeId">
                        </cic:CaisisHidden>
                        <asp:PlaceHolder runat="server" ID="MetadataAttributesContainer">
                            <cic:CaisisHidden runat="server" ID="FieldSuppress_Id" Table="MetadataFieldAttributes"
                                Field="FieldSuppress" />
                            <cic:CaisisHidden runat="server" ID="FieldOrder_Id" Table="MetadataFieldAttributes"
                                Field="FieldOrder" />
                            <cic:CaisisHidden runat="server" ID="FieldLabel_Id" Table="MetadataFieldAttributes"
                                Field="FieldLabel" />
                            <cic:CaisisHidden runat="server" ID="FieldDescription_Id" Table="MetadataFieldAttributes"
                                Field="FieldDescription" />
                            <cic:CaisisHidden runat="server" ID="ControlType_Id" Table="MetadataFieldAttributes"
                                Field="ControlType" />
                            <cic:CaisisHidden runat="server" ID="LookupCode_Id" Table="MetadataFieldAttributes"
                                Field="LookupCode" />
<%--                            <cic:CaisisHidden runat="server" ID="ShowCalendar_Id" Table="MetadataFieldAttributes"
                                Field="ShowCalendar" />
                            <cic:CaisisHidden runat="server" ID="CalcDate_Id" Table="MetadataFieldAttributes"
                                Field="CalcDate" />
                            <cic:CaisisHidden runat="server" ID="ShowTextEditor_Id" Table="MetadataFieldAttributes"
                                Field="ShowTextEditor" />
                            <cic:CaisisHidden runat="server" ID="ShowNumberPad_Id" Table="MetadataFieldAttributes"
                                Field="ShowNumberPad" />--%>
                            <%-- MISC Field Attributes (inserted dynamically) --%>
                        </asp:PlaceHolder>
                        <asp:GridView runat="server" ID="MetadataGrid" DataKeyNames="FieldId,FieldName" AutoGenerateColumns="false"
                            CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA"
                            AlternatingRowStyle-CssClass="dataGridItemRowB" GridLines="None" OnRowCreated="AddDynamicFieldAttributes" OnRowDeleting="DeleteMetadataField">
                            <Columns>
                                <asp:TemplateField HeaderText="Hidden" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <cic:CaisisHidden runat="server" ID="FieldSuppress_ValueId" Table="MetadataFieldAttributeValues"
                                            Field="FieldSuppress" />
                                        <cic:CaisisHidden runat="server" ID="FieldSuppress_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                            Field="FieldSuppress" />
                                        <cic:CaisisCheckBox runat="server" ID="FieldSuppress" Table="MetadataFieldAttributeValues"
                                            Field="FieldSuppress" ShowLabel="false"></cic:CaisisCheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sort Order" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <cic:CaisisHidden runat="server" ID="FieldOrder_ValueId" Table="MetadataFieldAttributeValues"
                                            Field="FieldOrder" />
                                        <cic:CaisisHidden runat="server" ID="FieldOrder_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                            Field="FieldOrder" />
                                        <%-- Field Sorting Widgets --%>
                                        <div class="sortWidgetWrapper">
                                            <span class="sortWidgetContainer"><a href="#" class="fieldSortWidget fieldSortWidgetUp"
                                                title="Move field up">&nbsp;</a><br />
                                                <a href="#" class="fieldSortWidget fieldSortWidgetDown" title="Move field down">&nbsp;</a>
                                            </span>
                                            <cic:CaisisTextBox runat="server" ID="FieldOrder" Table="MetadataFieldAttributeValues"
                                                Field="FieldOrder" ShowLabel="false" CssClass="FieldOrderField" Width="25px" Style="float: left;">
                                            </cic:CaisisTextBox>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Field">
                                    <ItemTemplate>
                                        <%-- update/edit metadata field name --%>
                                        <cic:CaisisTextBox runat="server" ID="FieldName" Table="MetadataFields" Field="FieldName"
                                            ShowLabel="false" Enabled="false"></cic:CaisisTextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Label">
                                    <ItemTemplate>
                                        <cic:CaisisHidden runat="server" ID="FieldLabel_ValueId" Table="MetadataFieldAttributeValues"
                                            Field="FieldLabel" />
                                        <cic:CaisisHidden runat="server" ID="FieldLabel_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                            Field="FieldLabel" />
                                        <cic:CaisisTextBox runat="server" ID="FieldLabel" Table="MetadataFieldAttributeValues"
                                            Field="FieldLabel" ShowLabel="false">
                                        </cic:CaisisTextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate>
                                        <cic:CaisisHidden runat="server" ID="FieldDescription_ValueId" Table="MetadataFieldAttributeValues"
                                            Field="FieldDescription" />
                                        <cic:CaisisHidden runat="server" ID="FieldDescription_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                            Field="FieldDescription" />
                                        <cic:CaisisTextBox runat="server" ID="FieldDescription" Table="MetadataFieldAttributeValues"
                                            Field="FieldDescription" ShowLabel="false">
                                        </cic:CaisisTextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Control Type">
                                    <ItemTemplate>
                                        <cic:CaisisHidden runat="server" ID="ControlType_ValueId" Table="MetadataFieldAttributeValues"
                                            Field="ControlType" />
                                        <cic:CaisisHidden runat="server" ID="ControlType_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                            Field="ControlType" />
                                        <cic:CaisisSelect runat="server" ID="ControlType" Table="MetadataFieldAttributeValues"
                                            Field="ControlType" ShowLabel="false">
                                        </cic:CaisisSelect>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Lookup Code">
                                    <ItemTemplate>
                                        <cic:CaisisHidden runat="server" ID="LookupCode_ValueId" Table="MetadataFieldAttributeValues"
                                            Field="LookupCode" />
                                        <cic:CaisisHidden runat="server" ID="LookupCode_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                            Field="LookupCode" />
                                        <cic:CaisisComboBox runat="server" ID="LookupCode" Table="MetadataFieldAttributeValues"
                                            Field="LookupCode" ShowLabel="false">
                                        </cic:CaisisComboBox>
                                        <asp:Image runat="server" ID="LookupCode_EditImg" ImageUrl="~/Images/icon_info_yellow.gif"
                                            Style="cursor: pointer;" />
                                    </ItemTemplate>
                                </asp:TemplateField>
<%--                                <asp:TemplateField HeaderText="Show Cal" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <cic:CaisisHidden runat="server" ID="ShowCalendar_ValueId" Table="MetadataFieldAttributeValues"
                                            Field="ShowCalendar" />
                                        <cic:CaisisHidden runat="server" ID="ShowCalendar_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                            Field="ShowCalendar" />
                                        <cic:CaisisCheckBox runat="server" ID="ShowCalendar" Table="MetadataFieldAttributeValues"
                                            Field="ShowCalendar" ShowLabel="false"></cic:CaisisCheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Calc Date" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <cic:CaisisHidden runat="server" ID="CalcDate_ValueId" Table="MetadataFieldAttributeValues"
                                            Field="CalcDate" />
                                        <cic:CaisisHidden runat="server" ID="CalcDate_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                            Field="CalcDate" />
                                        <cic:CaisisCheckBox runat="server" ID="CalcDate" Table="MetadataFieldAttributeValues"
                                            Field="CalcDate" ShowLabel="false"></cic:CaisisCheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Text Editor" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <cic:CaisisHidden runat="server" ID="ShowTextEditor_ValueId" Table="MetadataFieldAttributeValues"
                                            Field="ShowTextEditor" />
                                        <cic:CaisisHidden runat="server" ID="ShowTextEditor_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                            Field="ShowTextEditor" />
                                        <cic:CaisisCheckBox runat="server" ID="ShowTextEditor" Table="MetadataFieldAttributeValues"
                                            Field="ShowTextEditor" ShowLabel="false"></cic:CaisisCheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Number Pad" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <cic:CaisisHidden runat="server" ID="ShowNumberPad_ValueId" Table="MetadataFieldAttributeValues"
                                            Field="ShowNumberPad" />
                                        <cic:CaisisHidden runat="server" ID="ShowNumberPad_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                            Field="ShowNumberPad" />
                                        <cic:CaisisCheckBox runat="server" ID="ShowNumberPad" Table="MetadataFieldAttributeValues"
                                            Field="ShowNumberPad" ShowLabel="false"></cic:CaisisCheckBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                --%>
                                <%-- MISC Field Attribute Values (inserted dynamically) --%>
                                <asp:TemplateField HeaderText="MISC" ItemStyle-CssClass="MiscColumnCell">
                                    <ItemTemplate>
                                        <button class="dataEntryButtonGray" onclick="return showMiscFieldAttributes(<%# Container.DataItemIndex %>, this, '<%# Eval("TableId") %>', '<%# Eval("FieldId") %>');">
                                            view</button>
                                        <div class="MiscFieldAttributes miniPopupLayer">
                                            <div class="miniPopupHeader">
                                                <span class="miniPopupText" id="popupTitle"><%# Eval("FieldName") %> Attributes</span>
                                                <img onclick="hideMiscFieldAttributes(<%# Container.DataItemIndex %>);" src="../Images/Modal_Close.gif"
                                                    class="miniPopupClose" alt="Close"></div>
                                            <div class="miniPopupContent">
                                                <iframe class="miniPopupFrame" id="EditMiscAttributes_<%# Container.DataItemIndex %>" name="EditMiscAttributes_<%# Container.DataItemIndex %>" frameborder="0" src=""></iframe>
                                                <asp:PlaceHolder runat="server" ID="MiscFieldAttributesPanel"></asp:PlaceHolder>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:Button runat="server" ID="DeleteBtn" CommandName="Delete" Text="Delete" CssClass="dataEntryButtonGray"
                                            OnClientClick="return confirmDelete('Are you sure you want to delete this Metadata Field?');" Width="75px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </asp:PlaceHolder>
                </div>
                <div id="TableMetadata_Tab_2" style="display: none; ">
                    <table id="NonMetadataFields" class="dataGrid" style="table-layout: fixed; margin: 20px auto 0px auto; border: solid 1px #dddddd;">
                        <thead class="dataGridHeader">
                            <tr>
                                <th>
                                    Add
                                </th>
                                <th>
                                    Column Name
                                </th>
                                <th>
                                    Data Type
                                </th>
                                <th>
                                    Max Length
                                </th>
                                <th>
                                    Is Virtual
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater runat="server" ID="NonMetadataFields">
                                <ItemTemplate>
                                    <tr class="<%# Container.ItemIndex % 2 == 0? "dataGridItemRowA" : "dataGridItemRowB" %>">
                                        <td>
                                            <asp:CheckBox runat="server" ID="MetaFieldCheckBox" />
                                        </td>
                                        <td>
                                            <asp:TextBox runat="server" ID="MetaFieldName" Text='<%# Eval("COLUMN_NAME") %>'
                                                Enabled='<%# (bool)Eval("IS_VIRTUAL")==true %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <%# Eval("DATA_TYPE") %>
                                        </td>
                                        <td>
                                            <%# Eval("CHAR_MAX_LEN") %>
                                        </td>
                                        <td>
                                            <asp:CheckBox runat="server" ID="MetaFieldIsVirtual" Checked='<%# (bool)Eval("IS_VIRTUAL") %>'
                                                Enabled="false" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
                    
                    
                    
</div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                </div>
            </div>
        </asp:PlaceHolder>
    </div>
    
    
            
        
    <asp:Button runat="server" ID="UpdateBtn" OnClick="UpdateClick" Text="Save All Changes" CssClass="dataEntryButtonGray largeButton"
        Style="float: right; margin-right: 200px; margin-top: 6px;" />
    

    <div id="ViewLookupCodeLayer" class="miniPopupLayer" style="display: none;">
        <div class="miniPopupHeader">
            <span id="popupTitle" class="miniPopupText">Lookup Code</span>
            <img alt="Close" class="miniPopupClose" src="../Images/Modal_Close.gif" onclick="closeFieldLookupCode();" />
        </div>
        <div class="miniPopupContent">
            <iframe id="LookupCodeEdit" name="LookupCodeEdit" src="LookupCode_QuickView.aspx"
                frameborder="1"></iframe>
        </div>
    </div>
    </form>
</body>
</html>