<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupCode_Edit.aspx.cs"
    Inherits="Caisis.UI.Admin.LookupCode_Edit" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="filter" TagName="SearchFilter" Src="~/Admin/ListFilter_Control.ascx" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="~/Core/Help/helpToolTip.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Lookup Codes</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../ClientScripts/Admin.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        
        var FIELD_SORT_ENABLED = '<%= (!QueryDiseaseId.HasValue).ToString().ToLower() %>';

        jQuery.noConflict();

        jQuery(document).ready(function(e) {
        
            // scroll to active table LI
            var lkpField = jQuery('#CurrentLkpFieldName').val();
            if (lkpField != '') {
                var li = jQuery('#LkpField_' + lkpField);
                var scrollToPos = li.position().top - 45;
                // hilight active
                li.addClass('selected');
                // scroll to active
                jQuery('#adminBoxNavListContainer').scrollTop(scrollToPos);
            }
            
            // set inital supress state of fields
            jQuery('#LookupCodeGrid tr').each(function(index, row) {
                var lkpSupressCB = jQuery(row).find('input[name*="LkpSuppress"]');
                setRowSupress(row, lkpSupressCB.is(':checked'));
            });          
            
            // adjust main content height
            adjustMainContentScroll();        
            jQuery(window).resize(adjustMainContentScroll);
            
            // setup sorting
            if (FIELD_SORT_ENABLED) {
                initTableFieldSorting('<%= LookupCodeGrid.ClientID %>', 'LkpOrder', 'dataGridItemRowA', 'dataGridItemRowB');
            }
         });     
        
        function adjustMainContentScroll(optOffset) {
            var winHeight = jQuery(window).height() - 150;
            var mainContainer = jQuery('#EditEFormMainContent');
            var mainContentOffset = winHeight - 200 - (optOffset != null ? optOffset : 0);
            mainContainer.css('max-height', Math.max(mainContentOffset, 50) + 'px');
            var formListContainer = jQuery('#adminBoxNavListContainer');
            formListContainer.css('max-height', (winHeight + 50) + 'px');
        }

        function showTableFieldsLookup() {
            // only show if there are values
            if (jQuery('#TableFieldsLookupCodes tr').size() > 0) {
                jQuery('#TableFieldsLookupCodes').fadeIn();
            }
        }

        function hideTableFieldsLookup() {
            jQuery('#TableFieldsLookupCodes').fadeOut();
        }

        function setRowSupress(rowIndex, doSupress) {
            var row;
            // check for jQuery reference or DOM object
            if(typeof(rowIndex)=='object') {
                row = jQuery(rowIndex);
            }
            // otherwise find row by index
            else {
                row = jQuery('#LookupCodeGrid tr:eq(' + rowIndex + ')');
            }
            // supress all fields except supress checkbox
            var inputs = row.find(':input').not('input[name*="LkpSuppress"]');
            if(doSupress) {
                inputs.attr('disabled', 'disabled');   
            }
            else{
                inputs.removeAttr('disabled');   
            }                     
        }
        
        function _setRowSupress(cb, doSupress) {
            var row = jQuery(cb).parents('tr');
            setRowSupress(row, doSupress);
         }

        function showNextGridRow(gridId) {
            var blankRows = jQuery('#' +  gridId + ' tr.dataGridBlankRowHidden');
            if (blankRows.size() == 0) {
                alert('save before adding more rows');
            }
            else {
                blankRows.first().removeClass('dataGridBlankRowHidden');
            }
            return false;
        }

        function editLkpField(editURL) {
            window.location = editURL;
        }

        function addNewLkpCode() {
            top.showModalWithConfig('LookupCode_Add.aspx', 'Add New Lookup Code', { width: '500px', height: '50px' });
            return false;
        }
        
        function editLookupAttributes() {
            top.showModalWithConfig('LookupCode_EditAttributes.aspx', 'Edit Lookup Code Attributes', { width: '500px', height: '150px' });
            return false;
        }

        function showHideBulkEntryContainer() {
            var BulkEntryContainer = jQuery('#BulkEntryContainer');
            var bulkCodes = jQuery('#<% = BulkLkpCodes.ClientID %>');
            var enterBulkButton = jQuery('#enterBulkButton');
            var show = !BulkEntryContainer.is(':visible');

            if (show) {
                BulkEntryContainer.show();
                enterBulkButton.text('Hide Bulk Entry Field');
            }
            else {
                BulkEntryContainer.hide();
                bulkCodes.val('');
                enterBulkButton.text('Bulk Enter Codes');
            }
            adjustMainContentScroll(show ? (BulkEntryContainer.height()) : 0);
        }

        function warnDuplicateCodes(list) {
            if (list.length > 0) {
                var message = 'The following codes were not inserted because they already exist.\n\n';
                message += list.join(', ');
                alert(message);
            }
        }

        /* ]]> */
    </script>
    <style type="text/css">
        #mainAdminBox
        {
            padding-top: 0px;
        }
        .FilterSearchBox
        {

        }
        #BulkEntryContainer
        {
            width: 500px;
            margin: 10px auto 10px auto;
            border: solid 1px #cccccc;
            background-color: #eeeeee;
            
        }
        #EditFormBox
        {
	        margin-left: 240px;
	        margin-right: 0px;
        }

        #EditEFormMainContent td
        {
            padding: 4px 0px 4px 0px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="CurrentLkpFieldName" />
    <div id="SelectFormBox" class="adminNavBoxContainer" style="width: 230px;">
        <span class="adminNavBoxContainerTitle">Select Vocabulary Term</span>        
        <div id="mainAdminBox" class="adminBox" style="margin-top: 0px;">
            <filter:SearchFilter runat="server" ListId="LkpFieldNamesList"  />
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;">
                <ul id="LkpFieldNamesList" class="adminBoxNavList">
                    <asp:Repeater runat="server" ID="LkpFieldsRptr">
                        <ItemTemplate>
                            <li id="LkpField_<%# Eval("LkpFieldName") %>" onclick="editLkpField('LookupCode_Edit.aspx?diseaseId=<%= QueryDiseaseId %>&lkpField=<%# Eval("LkpFieldName") %>');"  <%# Container.ItemIndex % 2 == 0 ? "class=\"alternate\"" : "" %> >
                                <a href="LookupCode_Edit.aspx?diseaseId=<%= QueryDiseaseId %>&lkpField=<%# Eval("LkpFieldName") %>">
                                    <%# Eval("LkpFieldName") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
<%--        <img runat="server" id="AddLkpCodeBtn" alt="Add New Lookup Code" title="Add New Lookup Code"
            class="NavListFooterButton" src="../Images/AdminImages/AdminButton_AddLookupCode.png"
            onclick="return addNewLkpCode();" />--%>
        <span class="dataEntryButtonGray NavListFooterButton" onclick="return addNewLkpCode();">Add Lookup Code</span>
    </div>
    
    <!-- START MAIN BOX-->
    <div id="EditFormBox" runat="server">
        <span class="adminNavBoxContainerTitle" style="margin-right: 10px;"><%= QueryLkpField %></span>
                  (currently in use with&nbsp;<asp:Label runat="server" ID="TableFieldsLookupLabel" style="cursor: help;"></asp:Label> data entry fields)
                  
        <div id="MainInterface" class="adminBox">
        
        
	    <uc1:helpToolTip id="HelpToolTipLayer" runat="server" />	                
        <div class="adminBoxHeaderArea" id="HeaderArea" runat="server">
        
            <table cellspacing="8" runat="server" ID="FilterByPanel" Visible="true" style="display: inline; background-color: #f6f6f6;">
                <tr>
                  
                    <td style="">
                    <label for="FilterBy" style="font-weight: bold; width:90px;">List filtered by</label><img src="../Images/Icon_QuestionMark_10px.png" style="width: 10px; height: 10px; vertical-align:top; cursor: help;" /><br />
                    <cic:CaisisSelect runat="server" ID="FilterBy" ShowLabel="false" AutoPostBack="true"
                        OnSelectedIndexChanged="AdjustFilterBy">
                        <asp:ListItem Text="None" Value=""></asp:ListItem>
                        <asp:ListItem Text="Attribute" Value="Attribute"></asp:ListItem>
                        <asp:ListItem Text="Parent Field" Value="Parent"></asp:ListItem>
                    </cic:CaisisSelect>
                    </td>
                    <td runat="server" ID="FilterByAttributeColumn1" Visible="false" >
                        <label for="AttributeName" style="font-weight: bold; width:105px; display:inline-block;">Attribute</label><br />
                        <cic:CaisisSelect runat="server" ID="FilterByAttributeNames" ShowLabel="false" DataTextField="AttributeName" DataValueField="AttributeId" AutoPostBack="true" OnSelectedIndexChanged="BuildLookupAttributeValues" Width="100"></cic:CaisisSelect>
                    </td>
                    <td runat="server" ID="FilterByAttributeColumn2" Visible="false"  style="">
                        <label for="AttributeValue" style="font-weight: bold; width:75px; display:inline-block;">Value</label><br />
                        <cic:CaisisComboBox runat="server" ID="FilterByAttributeValues" ShowLabel="false"></cic:CaisisComboBox>
                    </td>
                    <td runat="server" ID="FilterByAttributeColumn3" Visible="false"  style="vertical-align: bottom;">
                        <asp:LinkButton runat="server" ID="BuildAttributeValues" OnClick="BuildLookupCodeByAttribute" Text="view values" CssClass="dataEntryButtonGray" />
                        <span class="dataEntryButtonGray" onclick="return editLookupAttributes();">edit attributes</span>
                    </td>
                    <td runat="server" ID="FilterByParentColumn1" Visible="false" >
                        <label for="FilterByParentLkpFieldNames" style="font-weight: bold; width:200px; display:inline-block;">List</label><br />
                        <cic:CaisisSelect Width="200" runat="server" ID="FilterByParentLkpFieldNames" ShowLabel="false" DataTextField="LkpFieldName" DataValueField="LkpFieldName" AutoPostBack="true" OnSelectedIndexChanged="BuildFilterByParentLkpCodes"></cic:CaisisSelect>
                    </td>
                    <td runat="server" ID="FilterByParentColumn2" Visible="false" >
                        <label for="FilterByParentLkpCodes" style="font-weight: bold; display:inline-block;">Value</label><br />
                        <cic:CaisisSelect runat="server" ID="FilterByParentLkpCodes" ShowLabel="false" DataTextField="LkpCode" DataValueField="LookupCodeId" AutoPostBack="true" OnSelectedIndexChanged="BuildFilterByParent"></cic:CaisisSelect>
                    </td>
                </tr>
            
            </table>
           
                          
                            
                            <div id="TableFieldsLookupCodes" style="display: none; position: absolute; left: 0px;
                                background-color: #ffffff; border: 1px solid #cccccc; border-radius: .75ex; padding: 10px;
                                max-width: 350px;">
                                <table style="table-layout: fixed; width: 100%;">
                                    <thead>
                                        <tr>
                                            <td style="font-weight: bold;">
                                                Table
                                            </td>
                                            <td style="font-weight: bold;">
                                                Field
                                            </td>
                                        </tr>
                                    </thead>
                                </table>
                                <div style="overflow: auto; overflow-x: hidden; border: 1px solid #cccccc; max-height: 250px;">
                                    <table style="table-layout: fixed; width: 100%;">
                                        <tbody>
                                            
                                            
                                            
                                            <asp:Repeater runat="server" ID="TableStatsRprt">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <strong>
                                                                <%# Eval("Table") %></strong>
                                                        </td>
                                                        <td>
                                                            <%# Eval("Field") %>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
        </div>
        

            <div id="EditEFormMainContent" style="margin: 10px 5px 10px 5px; min-height: 100px;">
            
            <div style="text-align:center"><asp:Label runat="server" ID="LkpStats" ></asp:Label></div>
            
                <custom:ExtendedGridView CssClass="dataGrid" RowStyle-CssClass="dataGridItemRowA"
                    AlternatingRowStyle-CssClass="dataGridItemRowB" TableName="LookupCodes" DataKeyNames="LookupCodeId"
                    BlankRows="20" VisibleBlankRows="3" BlankRowCssClass="dataGridBlankRowHidden"
                    VisibleBlankRowCssClass="dataGridBlankRowVisible" GridLines="None" BorderStyle="None"
                    BorderWidth="0" RowStyle-BorderStyle="None" RowStyle-BorderWidth="0" runat="server"
                    ID="LookupCodeGrid" AutoGenerateColumns="false" ShowHeader="true" ShowFooter="false"
                    UseAccessibleHeader="true" OnRowDeleted="RebindOnDelete" OnRowDataBound="SetDiseaseAttribute" Width="500">
                    <Columns>
                        <%-- apply to disease (disease mode=true, filter mode=false) --%>
                        <asp:TemplateField ItemStyle-Width="40" ItemStyle-HorizontalAlign="Center" HeaderText="Associate" HeaderStyle-Font-Size="10px"  >
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="DiseaseAttribute" />
                                <asp:HiddenField runat="server" ID="DiseaseAttributeId" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- apply to attribute (disease mode=false, filter mode=by attribute) --%>
                        <asp:TemplateField ItemStyle-Width="40" ItemStyle-HorizontalAlign="Center" HeaderText="Apply Attribute" HeaderStyle-Font-Size="10px"  >
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="ApplyToAttribute" />
                                <asp:HiddenField runat="server" ID="ApplyToAttributeId" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- apply to parent code (disease mode=false, filter mode=by parent) --%>
                        <asp:TemplateField ItemStyle-Width="40" ItemStyle-HorizontalAlign="Center" HeaderText="Apply To<br/>Parent" HeaderStyle-Font-Size="10px"  >
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="ApplyToParent" />
                                <asp:HiddenField runat="server" ID="ApplyToParentId" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="30px" ItemStyle-Width="30px" HeaderText="">
                            <ItemTemplate>
                                <%-- Field Sorting Widgets --%>
                                <span class="sortWidgetContainer">
                                <a href="#" class="fieldSortWidget fieldSortWidgetUp" title="Move this field up">&nbsp;</a><br />
                                <a href="#" class="fieldSortWidget fieldSortWidgetDown" title="Move this field down">&nbsp;</a>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="60px" ItemStyle-Width="60px" HeaderText="Order" HeaderStyle-HorizontalAlign="Left" HeaderStyle-Font-Size="10px" >
                            <ItemTemplate>
                                <cic:CaisisTextBox runat="server" ID="LkpOrder" Table="LookupCodes" Field="LkpOrder"
                                    ShowLabel="false" Width="25px">
                                </cic:CaisisTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="180" ItemStyle-HorizontalAlign="Center" HeaderText="Value" HeaderStyle-Font-Size="10px" >
                            <ItemTemplate>
                                <cic:CaisisTextBox Width="170" runat="server" ID="LkpCode" Field="LkpCode" Table="LookupCodes"
                                    ShowLabel="false"></cic:CaisisTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="180" ItemStyle-HorizontalAlign="Center" HeaderText="Description" HeaderStyle-Font-Size="10px" >
                            <ItemTemplate>
                                <cic:CaisisTextBox Width="170" runat="server" ID="LkpDescription" Field="LkpDescription"
                                    Table="LookupCodes" ShowLabel="false"></cic:CaisisTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                         <asp:TemplateField ItemStyle-Width="40" ItemStyle-HorizontalAlign="Center" HeaderText="Hide" HeaderStyle-Font-Size="10px"  >
                            <ItemTemplate>
                                <cic:CaisisCheckBox runat="server" ID="LkpSuppress" Field="LkpSuppress" Table="LookupCodes"
                                    ShowLabel="false" onclick="_setRowSupress(this, this.checked);"></cic:CaisisCheckBox>
                            </ItemTemplate>
                        </asp:TemplateField> 
                        
                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="30" ItemStyle-HorizontalAlign="Center" HeaderStyle-Font-Size="10px" >
                            <ItemTemplate>
                                <asp:ImageButton runat="server" ID="DeleteBtn" ImageUrl="~/Images/EFormDeleteRow.png"
                                    CommandName="Delete" Visible=<%# Eval("LookupCodeId").ToString() != "" %> OnClientClick="return confirmDelete();" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </custom:ExtendedGridView>
                <div  style="text-align: center;">
                <span class="dataEntryButtonGray NavListFooterButton" title="Add Another Row" onclick="showNextGridRow('LookupCodeGrid');">Add Another Row</span>
                
                </div>

            </div>
            
            
            
            
            <div id="BulkEntryContainer" style="display: none;">
            <table style="margin: auto;"><tr><td style="white-space:nowrap; vertical-align: top; padding-right: 5px; padding-top: 7px;"><label for="BulkLkpCodes">
                Enter codes in bulk<br /><span style="font-size: 10px; color: #888888;">(separated by new<br />lines or commas)</span></label></td>
            <td style="white-space:nowrap;"><cic:CaisisTextArea runat="server" ID="BulkLkpCodes" ShowLabel="false"></cic:CaisisTextArea></td>    
            </tr></table>
            
            
           </div>
            <div style="text-align: center;">
                <span id="enterBulkButton" class="dataEntryButtonGray NavListFooterButton" style="margin-right: 40px;"
                    title="Enter many lookup codes at once" onclick="showHideBulkEntryContainer();">
                    Bulk Enter Codes</span>
                <asp:LinkButton CssClass="dataEntryButtonGray" runat="server" ID="SaveBtn" Text="Save"
                    OnClick="SaveClick" />
            </div>
               
        </div>
    </div>
    </form>
</body>
</html>
