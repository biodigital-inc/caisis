<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PhysicianClinicListWidget.ascx.cs"
    Inherits="Caisis.UI.Core.Utilities.Widget.PhysicianClinicListWidget" %>
<%@ Register TagPrefix="ajax" Namespace="Caisis.UI.ClientScript.Ajax" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">
    /* <![CDATA[ */
    
    // invoke ajax callback to populate clinic list
    function doUpdateClinicPostback() {
        var dropDown = jQuery('#<%= ClinicPhysiciansList.ClientID %>');
        var selectedValue = dropDown.val();
        // lock
        dropDown.attr('disabled', 'disabled');
        doUpdateClinicList(selectedValue);
    }

    // updates the clinic list with ajax results
    function onUpdateClinicList(returnValue, returnObject) {
        // get html from rendered rptr
        var tableHTML = returnObject && returnObject.html != null ? returnObject.html : '';
        // fill clinic list with rendered result
        var clinicListBody = jQuery('#ClinicListBody');
        clinicListBody.html(tableHTML);
        // unlock
        var dropDown = jQuery('#<%= ClinicPhysiciansList.ClientID %>');
        dropDown.removeAttr('disabled');
    }

    /* ]]> */
</script>

<img id="otherDate" runat="server" src="~/Images/DashboardButton_ClinicsOnOtherDates.png" onclick="window.location='../PatientLists/PatientListPage.aspx';" style="float: right; cursor: pointer;" />
<asp:Label ID="ClinicPhysiciansListLabel" runat="server" AssociatedControlID="ClinicPhysiciansList" >Clinic: </asp:Label>
<euc:CaisisSelect runat="server" ID="ClinicPhysiciansList" DataTextField="ApptPhysician"
    DataValueField="ApptPhysician" AutoPostBack="false" onchange="return doUpdateClinicPostback();" OnSelectedIndexChanged="SetClinicList"  ShowLabel="false" >
</euc:CaisisSelect>
<ajax:CaisisAjaxHelper runat="server" ID="ajaxDatasetHelper" DoCallbackScript="doUpdateClinicList"
    OnCallbackScript="onUpdateClinicList" OnProcessCallback="GetNewClinicList">
</ajax:CaisisAjaxHelper>

<table style="width: 100%; margin-top: 5px;">
    <thead>
        <tr>
            <th style="width: 20%;">
                Time
            </th>
            <th style="width: 35%;">
                Name
            </th>
            <th style="width: 25%;">
                MRN
            </th>
            <th style="width: 20%;">
                Visit Type
            </th>
        </tr>
    </thead>
</table>
<div class="DashboardScrollingList">
    <table class="DashboardScrollingListTable" cellspacing="0">
        <tbody id="ClinicListBody">
            <asp:Repeater ID="PhysicianClinicRptr" runat="server"  OnItemDataBound="SetRptIdentifiers">
                <ItemTemplate>
        	        <tr class="DashboardScrollingListRowType<%# Container.ItemIndex % 2==0 ? "A" : "B" %>" onclick="if(top.navigateToPatient) { top.navigateToPatient('<asp:Literal ID="encPID" runat="server" />') } return false;">
        	            <td style="width: 20%;"><%# Eval("ApptTime", "{0:t}") %></td>
        	            <td style="width: 35%;"><asp:Label runat="server" ID="PatientName" ></asp:Label></td>
        	            <td style="width: 25%;"><asp:Label runat="server" ID="PatientIdentifier"></asp:Label></td>
        	            <td style="width: 20%;"><%# Eval("ApptVisitType") %>&nbsp;</td>
        	        </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr id="NoResultsMessage" runat="server" visible="false"  >
                <td style="background-color: #efefef; padding: 5px; text-align: center; font-size: 13px; ">
                    No appointments are listed for this physician today (<% = DateTime.Now.Month + "/" + DateTime.Now.Day  %>).
                </td>
            </tr>
            <tr id="SelectPhysicianMessage" runat="server" visible="false"  >
                <td style="background-color: #efefef; padding: 5px; text-align: center; font-size: 13px; ">
                    Select a clinic above to view patient appointments.
                </td>
            </tr>
            <tr id="NoPhysiciansMessage" runat="server" visible="false"  >
                <td style="background-color: #efefef; padding: 5px; text-align: center; font-size: 13px; ">
                    No clinics are listed for today.
                </td>
            </tr>
        </tbody>
    </table>
</div>