<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dataset_Edit.aspx.cs" Inherits="Caisis.UI.Admin.Dataset_Edit" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Dataset</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../ClientScripts/Admin.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery-ui.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        var DIMENSIONS = ['Diseases', 'Institutions', 'Protocols', 'Categories'];

        jQuery.noConflict();
        
        jQuery(document).ready(function(e) {
            // adjust main content height
            adjustMainContentScroll();        
            jQuery(window).resize(adjustMainContentScroll);
        });

        function adjustMainContentScroll() {
            var winHeight = jQuery(window).height() - 75;
            var mainContainer = jQuery('#adminBoxNavListContainer');
            mainContainer.css('max-height', Math.max(winHeight, 100) + 'px');
        }

        jQuery(document).ready(function() {
            // add change handler to update xml debug
            jQuery.each(DIMENSIONS, function(index, item) {
                var dimension = jQuery('#' + item + '_DropDown');
                if (dimension.size() > 0) {
                    dimension.change(buildXML);
                }
            });
            // add change to dataset name
            jQuery('#DatasetName').change(buildXML);
            // run inital debug
            buildXML();
        });

        // build the required XML output for the dataset configuration
        function buildXML() {
            var buffer = new Array();
            // build xml
            buffer.push('<dataset id="' + jQuery('#DatasetId').val() + '" name="' + jQuery('#DatasetName').val() + '">');
            // dimension
            jQuery.each(DIMENSIONS, function(index, item) {
                var dimension = jQuery('#' + item + '_DropDown');
                if (dimension.size() > 0) {
                    var dimName = item == 'Categories' ? 'Category' : item.substring(0, item.length - 1);
                    var dimValue = dimension.val();
                    if (dimValue != '') {
                        buffer.push('   <dimension type="' + dimName + '" value="' + dimValue + '"/>');
                    }
                }
            });
            buffer.push('</dataset>');
            // end build
            var output = buffer.join('\n');
            jQuery('#DebugXml').val(output);
        }

        function editDimension(url, title) {
            top.showModalWithConfig(url, title, { width: 600, height: 500, context: window });
            return false;
        }

        /* ]]> */
    </script>

    <style type="text/css">
        #DebugXml
        {
            display: block;
            width: 95%;
            margin: 2px auto;
            height: auto;
            min-height: 50px;
            max-height: 150px;
        }
        input[type="text"], select
        {
            min-width: 150px;
        }
    </style>
</head>
<body onload="top.setActiveButton('Datasets');">
    <form id="form1" runat="server">
    <div id="AdminUserGroupPopupContainer" style="width: 400px;">
        <span class="dataEntryButtonGray slideNavRight" style="float: left; margin-right: 30px;
            clear: none;" onclick="window.location='Dataset_List.aspx';">< All Datasets</span>
        <asp:Label ID="DatasetTitle" runat="server" CssClass="adminNavHeading"></asp:Label>
        <div id="mainAdminBox" class="adminBox" style="width: 95%; border-color: #e1e1e1;
            -webkit-box-shadow: 0px 0px 10px #ddd; box-shadow: 0px 0px 10px #ddd;">
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden;
                max-height: 600px;">
                <asp:Panel runat="server" ID="DatasetEditPanel">
                    <asp:HiddenField runat="server" ID="DatasetIdField" />
                    <table style="margin-top: 10px;">
                        <tr>
                            <td>
                                <label for="DatasetName" class="adminNavBoxContainerTitle">
                                    Name
                                </label>
                            </td>
                            <td colspan="3">
                                <cic:CaisisTextBox runat="server" ID="DatasetName" ShowLabel="false" Table="Datasets"
                                    Field="DatasetName" Width="100%"></cic:CaisisTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DatasetName"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="DatasetId" class="adminNavBoxContainerTitle">
                                    Id
                                </label>
                            </td>
                            <td>
                                <asp:TextBox runat="server" ID="DatasetId" Enabled="false" Text="auto" style="width: 35px; min-width: 25px;"></asp:TextBox>
                            </td>
                            <td>
                                <label for="DatasetActive" class="adminNavBoxContainerTitle">
                                    Active
                                </label>
                            </td>
                            <td>
                                <cic:CaisisCheckBox runat="server" ID="DatasetActive" ShowLabel="false" Table="Datasets"
                                    Field="DatasetActive"></cic:CaisisCheckBox>
                            </td>
                        </tr>
                    </table>
                    <%-- Dimensions --%>
                    <div class="EditDataEntryForm_ChildTable">
                        <div class="EditDataEntryForm_ChildTableTitleOuterContainer">
                            <span class="EditDataEntryForm_ChildTableTitleInnerContainer"><span class="EditDataEntryForm_ChildTableTitle"
                                style="cursor: default;">Dimensions</span></span>
                            <table>
                                <tr>
                                    <td>
                                        <label for="Diseases_DropDown" class="adminNavBoxContainerTitle">
                                            <a title="Edit Diseases" href="Diseases_Edit.aspx" onclick="return editDimension(this.href, this.title);">
                                                Disease</a>
                                        </label>
                                    </td>
                                    <td>
                                        <cic:CaisisHidden runat="server" ID="DatasetDiseaseAttributeValueId" ShowLabel="false"
                                            Table="DiseaseAttributeValues" Field="DiseaseAttributeValueId">
                                        </cic:CaisisHidden>
                                        <cic:CaisisSelect runat="server" ID="Diseases_DropDown" ShowLabel="false" Table="DiseaseAttributeValues"
                                            Field="DiseaseId" DataTextField="DiseaseName" DataValueField="DiseaseId">
                                        </cic:CaisisSelect>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="Institutions_DropDown" class="adminNavBoxContainerTitle">
                                            <a title="Edit Institutions" href="Institutions_List.aspx" onclick="return editDimension(this.href, this.title);">
                                                Institutions</a></label>
                                    </td>
                                    <td>
                                        <cic:CaisisSelect runat="server" ID="Institutions_DropDown" ShowLabel="false" DataTextField="Institution"
                                            DataValueField="Institution">
                                        </cic:CaisisSelect>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="Protocols_DropDown" class="adminNavBoxContainerTitle">
                                            Protocols</label>
                                    </td>
                                    <td>
                                        <cic:CaisisSelect runat="server" ID="Protocols_DropDown" ShowLabel="false" DataTextField="ProtocolNum"
                                            DataValueField="ProtocolNum">
                                        </cic:CaisisSelect>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="Categories_DropDown" class="adminNavBoxContainerTitle">
                                            Categories</label>
                                    </td>
                                    <td>
                                        <cic:CaisisSelect runat="server" ID="Categories_DropDown" ShowLabel="false" DataTextField="Category"
                                            DataValueField="Category">
                                        </cic:CaisisSelect>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="EditDataEntryForm_ChildTable">
                        <div class="EditDataEntryForm_ChildTableTitleOuterContainer">
                            <span class="EditDataEntryForm_ChildTableTitleInnerContainer"><span class="EditDataEntryForm_ChildTableTitle"
                                style="cursor: default;">XML</span></span>
                            <textarea id="DebugXml" rows="5"></textarea>
                        </div>
                    </div>                    
                </asp:Panel>
            </div>
            <div class="dataEntryButtons" style="text-align: center; padding: 5px; clear: both;">
                <asp:Button ID="SaveBtn" runat="server" CssClass="dataEntryButtonGray" AlternateText="Save"
                    Text="Save" ToolTip="Save" OnClick="SaveClick" />
                <asp:Button ID="DeleteBtn" runat="server" CssClass="dataEntryButtonGray" AlternateText="Delete"
                    Text="Delete" ToolTip="Delete" OnClick="DeleteClick" OnClientClick="return confirmDelete('Are you sure you would like to delete this Dataset?');"
                    Visible="false" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
