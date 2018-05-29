<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolSpecimensTransfer.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolSpecimensTransfer" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Protocol Specimens</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="StyleSheets/ProtocolMgmtStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/jquery.js" type="text/javascript"></script>
    <script src="ProtocolMgmtScripts.js" type="text/javascript"></script>
    <script type="text/javascript">

        jQuery.noConflict();

        jQuery(document).ready(function (e) {
            // check all
            var checkAllBtn = jQuery("#checkall-checkbox");
            var checkboxes = jQuery("#SpecimenInventory input[type='checkbox']");
            checkAllBtn.click(function () {
                var isChecked = jQuery(this).is(":checked");
                if (isChecked)
                    checkboxes.attr("checked", "checked");
                else
                    checkboxes.removeAttr("checked");
                // trigger change
                checkboxes.change();
            });
            checkboxes.change(function (e) {
                var cb = jQuery(this);
                var tr = cb.parents("TR");
                if (cb.is(":checked")) {
                    if (!tr.hasClass("ItemRow_Hover"))
                        tr.addClass("ItemRow_Hover");
                }
                else {
                    tr.removeClass("ItemRow_Hover")
                }
            });
            // trigger change
            checkboxes.change();

            var checkAll;
            var uncheckAll;

            jQuery("#SearchSelection").change(function (e) {
                var searchFilters = jQuery(".searchFilter");
                var emptyFilter = jQuery("#Empty_Layer");
                var selectedOption = jQuery(this).find("option:selected").val();
                if (selectedOption && selectedOption != "") {
                    var selectedFilter = jQuery("#" + selectedOption + "_Layer");
                    searchFilters.hide();
                    emptyFilter.hide();
                    selectedFilter.show();
                }
                else {
                    searchFilters.hide();
                    emptyFilter.show();
                }
            });
            jQuery("#SearchSelection").change();
            adjustOnResize();

            // init script to set read only contact email and phone details
            var contactFields = ['ReceivedContact', 'DispatchedContact'];
            jQuery.each(contactFields, function (index, fieldId) {
                // update on blur
                var field = jQuery("#" + fieldId);
                if (field.size() > 0) {
                    field.blur(updateContactFields);
                    // set inital
                    updateContactFields(e, fieldId);
                }
            });

            // init date field validation
            var dateFields = ['DispatchedDate', 'ReceivedDate'];
            jQuery.each(dateFields, function (index, fieldId) {
                var field = jQuery("#" + fieldId);
                if (field.size() > 0) {
                    field.blur(function (e) {
                        var input = jQuery(this)[0];
                        validateDateField(input);
                    });
                }
            });

        });

        function updateContactFields(e, fieldId) {
            fieldId = fieldId || e.target.id;
            var contactNameField = jQuery("#" + fieldId);
            var contactPhoneField = jQuery("#" + fieldId + "_Phone");
            var contactEmailField = jQuery("#" + fieldId + "_Email");
            var name = contactNameField.val();
            var defaultValue = contactNameField.attr("defaltValue");
            var setDisplayText = function (data) {
                contactPhoneField.text(data.Phone || "");
                contactEmailField.text(data.Email || "");
            };
            // call service to get contact details
            if (name != "") {
                ContactService.GetContactInfo({
                    data: { name: name },
                    success: setDisplayText
                });
            }
            // else
            else {
                setDisplayText({});
            }
        }

        function adjustOnResize() {
            // adjust table headers to data cells
            var th = jQuery("#MainHeader table:first-child thead th");
            var td = jQuery("#MainOverflow table:first-child tbody tr:first-child td");
            var adjustCount = th.size(); // - 1;
            var widthProperty = 'outerWidth'; //: 'width';
            for (var i = 0; i < adjustCount; i++) {
                var thWidth = th.eq(i)[widthProperty]();
                td.eq(i).width(thWidth);
            }
            // adjust overflow
            jQuery("#MainOverflow").css("max-height", jQuery(window).height() - 100 + "px");
        }

        function showTransferSpecimens() {
            // udpate count
            var checkboxes = jQuery("#SpecimenInventory input[type='checkbox']");
            var count = checkboxes.filter(":checked").size();
            // show layer
            jQuery("#Transfer_Overlay,#TransferSlip").show();
            return false;
        }

        function hideTransferSpecimens() {
            jQuery("#Transfer_Overlay,#TransferSlip").hide();
            return false;
        }

        function showTransferListings() {
            jQuery("#Transfer_Overlay,#TransferListing_Layer").show();
            return false;
        }

        function hideTransferListings() {
            jQuery("#Transfer_Overlay,#TransferListing_Layer").hide();
            return false;
        }

                   
    </script>
    <style type="text/css">
        h2
        {
            margin: 2px auto;
            font-size: 13px;
        }
        fieldset
        {
            display: block;
            min-height: 225px;
            border: 1px solid #eeeeee;
        }
        fieldset legend
        {
            font-size: larger;
            font-weight: bold;
        }
        fieldset input[type="text"], fieldset textarea, fieldset select
        {
            width: 100px;
        }
        fieldset table tr > td:first-child
        {
            width: 75px;
        }
        #SpecimensGridOverflow
        {
            max-height: 225px;
            overflow: auto;
        }
        #SpecimensGrid
        {
            width: 100%;
            table-layout: fixed;
            text-align: center;
        }       
        #TransferFooter
        {
            clear: both;
            padding: 8px;
            text-align: center;
        }
        .searchTable
        {
            table-layout: fixed;
            width: 100%;
            margin: 0;
        }
        .searchTable th a
        {
            font-weight: bold;
            text-decoration: underline;
        }
        .searchTable th, .searchTable td
        {
            width: auto;
            vertical-align: top;
            padding: 2px 3px;
            white-space: normal;
        }
        .searchTable th:first-child label, .searchTable td:first-child label
        {
            display: block;
            text-align: center;
        }
    </style>
</head>
<body class="PatientPortalBody_miniTabs">
    <div id="PatientPortalHeaderBar" class="PatientTitleBar" style="height: 55px;">
        <div id="CustomProtocolText" style="padding-top: 5px;">
            <b>Specimen Transfer</b>
        </div>
    </div>
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <form id="form1" runat="server">
    <!-- Transfer Entry Form -->
    <asp:PlaceHolder runat="server" ID="DataEntryPanel">
        <asp:Panel runat="server" ID="ExistingTransferPanel">
            <label for="ExistingTransferSelection" class="boldText">Choose an Existing Transfer: </label>
            <asp:DropDownList runat="server" ID="ExistingTransferSelection" DataTextField="FieldText"
                DataValueField="FieldValue" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="OnSelectExistingTransfer">
                <asp:ListItem Text="--- Use Current ---" Value=""></asp:ListItem>
            </asp:DropDownList>
        </asp:Panel>
        <asp:HiddenField runat="server" ID="SpecimenRequestId" />
        <asp:HiddenField runat="server" ID="CollectionId" />
        <asp:HiddenField runat="server" ID="DistributionId" />
        <asp:HiddenField runat="server" ID="specimens" />
        <cic:CaisisHidden runat="server" ID="RequestType" Table="SpecimenRequests" Field="RequestType"
            Value="External" />
        <table style="width: 100%; table-layout: fixed;">
            <tr>
                <td>
                    <fieldset id="RequestFields" runat="server">
                        <legend>Request</legend>
                        <table class="dataEntryLayoutTable">
                            <tr>
                                <td>
                                    <label for="RequestIdentifier">
                                        Transfer ID
                                    </label>
                                </td>
                                <td>
                                    <cic:CaisisTextBox runat="server" ID="RequestIdentifier" ShowLabel="false" Table="SpecimenRequests"
                                        Field="RequestIdentifier" Enabled="false"></cic:CaisisTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="DispatchedDate">
                                        Date Sent</label>
                                </td>
                                <td>
                                    <cic:CaisisTextBox runat="server" ID="DispatchedDate" ShowLabel="false" Table="SpecimenDistributions"
                                        Field="DispatchedDate" ShowCalendar="true"></cic:CaisisTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="DispatchedContact">
                                        Site Contact Name</label>
                                </td>
                                <td>
                                    <cic:CaisisComboBox runat="server" ID="DispatchedContact" ShowLabel="false" Table="SpecimenDistributions"
                                        Field="DispatchedContact" LookupDistinct="Contact;COALESCE(FirstName,'') + ' ' + COALESCE(LastName,'');COALESCE(FirstName,'') + ' ' + COALESCE(LastName,'')"></cic:CaisisComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Phone #
                                </td>
                                <td>
                                    <b id="DispatchedContact_Phone"></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email
                                </td>
                                <td>
                                    <b id="DispatchedContact_Email"></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="ReceivedInstitution">
                                        Ship To</label>
                                </td>
                                <td>
                                    <cic:CaisisComboBox runat="server" ID="ReceivedInstitution" ShowLabel="false" Table="SpecimenDistributions"
                                        Field="ReceivedInstitution" LookupCode="Institution"></cic:CaisisComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="DispatchedTrackingNumber">
                                        Tracking #</label>
                                </td>
                                <td>
                                    <cic:CaisisTextBox runat="server" ID="DispatchedTrackingNumber" ShowLabel="false"
                                        Table="SpecimenDistributions" Field="DispatchedTrackingNumber"></cic:CaisisTextBox>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td>
                    <fieldset id="ReceivedFields" runat="server">
                        <legend>Received</legend>
                        <table class="dataEntryLayoutTable">
                            <tr>
                                <td>
                                    <label for="ReceivedDate">
                                        Date Received</label>
                                </td>
                                <td>
                                    <cic:CaisisTextBox runat="server" ID="ReceivedDate" ShowLabel="false" Table="SpecimenDistributions"
                                        Field="ReceivedDate" ShowCalendar="true"></cic:CaisisTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="ReceivedContact">
                                        Site Contact Name</label>
                                </td>
                                <td>
                                    <cic:CaisisComboBox runat="server" ID="ReceivedContact" ShowLabel="false" Table="SpecimenDistributions"
                                        Field="ReceivedContact" LookupDistinct="Contact;COALESCE(FirstName,'') + ' ' + COALESCE(LastName,'');COALESCE(FirstName,'') + ' ' + COALESCE(LastName,'')"></cic:CaisisComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Phone #
                                </td>
                                <td>
                                    <b id="ReceivedContact_Phone"></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email
                                </td>
                                <td>
                                    <b id="ReceivedContact_Email"></b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="ReceivedIntegrity">
                                        Condition of Materials</label>
                                </td>
                                <td>
                                    <cic:CaisisTextBox runat="server" ID="ReceivedIntegrity" ShowLabel="false" Table="SpecimenDistributions"
                                        Field="ReceivedIntegrity"></cic:CaisisTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="ReceivedNotes">
                                        Notes</label>
                                </td>
                                <td>
                                    <cic:CaisisTextArea runat="server" ID="ReceivedNotes" ShowLabel="false" Table="SpecimenDistributions"
                                        Field="ReceivedNotes"></cic:CaisisTextArea>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td>
                    <fieldset id="CollectionSpecimenFields" runat="server">
                        <legend>Specimens</legend>
                        <div id="SpecimensGridOverflow">
                            <asp:GridView runat="server" ID="SpecimensGrid" DataKeyNames="SpecimenCollectionId,SpecimenId,CollectionId"
                                AutoGenerateColumns="false"  GridLines="Horizontal" CssClass="dataGrid"
                                HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="ItemRow_A" AlternatingRowStyle-CssClass="ItemRow_B">
                                <Columns>
                                    <asp:TemplateField HeaderText="Include">
                                        <ItemTemplate>
                                            <asp:CheckBox runat="server" ID="IncludeSpecimenCheck" Checked="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Specimen ID" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <%# Eval("SpecimenReferenceNumber")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Specimen Type" ItemStyle-HorizontalAlign="Left">
                                        <ItemTemplate>
                                            <%# Eval("SpecimenSubType")%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </fieldset>
                </td>
            </tr>
        </table>
        <div id="TransferFooter">
            <asp:Button ID="DoTransferBtn" runat="server" Text="Update" CssClass="dataEntryButtonRed"
                OnClick="SaveClick" />
        </div>
    </asp:PlaceHolder>
    </form>
</body>
</html>
