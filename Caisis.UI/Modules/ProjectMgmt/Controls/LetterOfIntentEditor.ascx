<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LetterOfIntentEditor.ascx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.LetterOfIntentEditor" %>
<%@ Register TagPrefix="spaw" Namespace="Solmetra.Spaw2" Assembly="Solmetra.Spaw2" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="diseaseState" TagName="DiseaseEditor" Src="DiseaseState.ascx" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>

<script type="text/javascript">

var F_NAME_ID = '<%= FindCompletedByName.ClientID %>';
var F_EMAIL_ID = '<%=FindCompletedByEmail.ClientID %>';
var F_PHONE_ID = '<%=FindCompletedByPhone.ClientID %>';

function onCompletedByChange(completedBy)
{
    var contactId = getSelectValue(completedBy);
    if(contactId && contactId!=null && contactId!= '' && LOICallback)
    {
        LOICallback(contactId);
    }
    clearEmailPhone();
}

function onLOICallBackEnd(arg)
{
    var cEmail = $(F_EMAIL_ID);
    cEmail.clear();
    var cPhone = $(F_PHONE_ID);
    cPhone.clear();
    
    if(arg && arg!='')
    {
        var emailPhoneArray = eval(arg);
        popualteSelectFromArray(cEmail, emailPhoneArray[0]);
        popualteSelectFromArray(cPhone, emailPhoneArray[1]);
    }
}

function clearEmailPhone()
{
    $(F_EMAIL_ID).clear(); 
    $(F_PHONE_ID).clear();
}

function showContactPicker()
{
    $('ContactPicker').show('');
}

function closeContactPicker()
{
    $('ContactPicker').hide('none');
}

function copyContactInfo()
{
    var cName = $(F_NAME_ID);
    var cEmail = $(F_EMAIL_ID);
    var cPhone = $(F_PHONE_ID);
    
    var names = getSelectText(cName).split(',');
    var lName = names[0];
    var fName = names[1];
    $('<%= CompletedByLastName.ClientID %>').value = lName;
    $('<%= CompletedByFirstName.ClientID %>').value = fName;
    $('<%= CompletedByEmail.ClientID %>').value = getSelectText(cEmail);
    $('<%= CompletedByPhone.ClientID %>').value = getSelectText(cPhone);
    closeContactPicker();
    return false;
}

function cancelContactPicker()
{
    $(F_NAME_ID).selectedIndex = 0;
    clearEmailPhone();
    closeContactPicker();
    return false;
}
</script>

<style type="text/css">
    .LeftCell
    {
        padding-left: 5px;
        border-left: #999999 1px solid;
    }
    .RightCell
    {
        padding-left: 5px;
        border-right: #999999 1px solid;
    }
    .TopLeftCell
    {
        padding-left: 5px;
        padding-top: 5px;
        border-top: #999999 1px solid;
        border-left: #999999 1px solid;
    }
    .TopRightCell
    {
        padding-left: 5px;
        padding-top: 5px;
        border-top: #999999 1px solid;
        border-right: #999999 1px solid;
    }
    .BottomLeftCell
    {
        padding-left: 5px;
        border-bottom: #999999 1px solid;
        border-left: #999999 1px solid;
        padding-bottom: 5px;
    }
    .BottomRightCell
    {
        padding-left: 5px;
        border-right: #999999 1px solid;
        border-bottom: #999999 1px solid;
        padding-bottom: 5px;
    }
    .EntireCell
    {
        padding-top: 5px;
        border-top: #999999 1px solid;
        border-left: #999999 1px solid;
        border-bottom: #999999 1px solid;
        border-right: #999999 1px solid;
        padding-bottom: 5px;
    }
    .SingleLeftCell
    {
        padding-left: 5px;
        border-bottom: #999999 1px solid;
        border-top: #999999 1px solid;
        border-left: #999999 1px solid;
        padding-bottom: 5px;
    }
    .SingleRightCell
    {
        padding-left: 5px;
        border-right: #999999 1px solid;
        border-top: #999999 1px solid;
        border-bottom: #999999 1px solid;
        padding-bottom: 5px;
    }
    .CallBackSelect 
    {
        width: 150px;
        display: block;
    }
</style>
<table runat="server" cellpadding="0" cellspacing="0" style="table-layout: fixed;
    width: 95%; margin: 10px auto 25px auto; vertical-align: top;" id="MainTable">
    <tr>
        <td>
            <div id="ProjectContainerModal" style="position: absolute; z-index: 5; background-color: #000000;
                width: 100%; margin: 0; padding: 0; height: 300px; top: 0px; left: 0px; display: none;">
            </div>
        </td>
    </tr>
  
    <tr>
        <td style="font-weight: bold; padding-top: 20px; font-size: 13px; color: #000000;" colspan="4">
            Protocol Status<br />
            <table cellpadding="4" cellspacing="0" style="border: solid 1px #999999; width: 100%; font-weight: normal;" >
                <tr>
        <td >
            <label for="ProtocolWritten" title="Protocol Written">
                Protocol Written</label>
        </td>
        <td >
            <cc:CaisisComboBox ID="ProtocolWritten" runat="server" CssClass="UnselectedField"
                ShowLabel="false" Table="ProjectLetterOfIntent" Field="ProtocolWritten" LookupCode="YesNoUnknown" MaxLength="50"></cc:CaisisComboBox>
        </td>
        <td >
            <label for="ProtocolProvided" title="Protocol Provided">
                Protocol Provided</label>
        </td>
        <td >
            <cc:CaisisComboBox ID="ProtocolProvided" runat="server" CssClass="UnselectedField"
                ShowLabel="false" Table="ProjectLetterOfIntent" Field="ProtocolProvided" LookupCode="YesNoUnknown" MaxLength="50"></cc:CaisisComboBox>
        </td>
    </tr>
    <tr>
        <td >
            <label for="ProtocolIRBApproved" title="Protocol IRB Approved">
                Protocol IRB Approved</label>
        </td>
        <td >
            <cc:CaisisComboBox ID="ProtocolIRBApproved" runat="server" CssClass="UnselectedField"
                ShowLabel="false" Table="ProjectLetterOfIntent" Field="ProtocolIRBApproved" LookupCode="YesNoUnknown" MaxLength="50"></cc:CaisisComboBox>
        </td>
        <td >
            <label for="OpeningAtOtherCenters" title="Protocol Opening At Other Centers">
                Protocol Opening At Other Centers</label>
        </td>
        <td >
            <cc:CaisisComboBox ID="OpeningAtOtherCenters" runat="server" CssClass="UnselectedField"
                ShowLabel="false" Table="ProjectLetterOfIntent" Field="OpeningAtOtherCenters"
                LookupCode="YesNoUnknown" MaxLength="50"></cc:CaisisComboBox>
        </td>
        </tr>
        </table>
        </td>
    </tr>
    <tr>
        <td style="font-weight: bold; padding-top: 20px; font-size: 13px; color: #000000;" colspan="4">
            Patient Population<br />
            <table cellpadding="10" cellspacing="0"  style="border: solid 1px #999999; width: 100%; font-weight: normal; table-layout: fixed;" >
                <tr>
                    <td valign="top" style="width: 20%">
                        <span title="Population Disease State">Population Disease State</span>
                    </td>
                    <td  style="width: 80%">
                        <diseaseState:DiseaseEditor ID="DiseaseStateEditor" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td style="font-weight: bold; padding-top: 20px; font-size: 13px; color: #000000;" colspan="4">
            Data Collection<br />
            <table cellpadding="10" cellspacing="0"  style="border: solid 1px #999999; width: 100%; font-weight: normal; table-layout: fixed;" >
                <tr>
                    <td  >
                        <label for="DataCollection" title="Data Collection">
                            Data Collection</label><cc:CaisisComboBox ID="DataCollection" runat="server" CssClass="UnselectedField"
                            ShowLabel="false" Table="ProjectLetterOfIntent" Field="DataCollection" LookupCode="DataCollection" MaxLength="50"
                            LookupDistinct="ProjectLetterOfIntent;DataCollection;DataCollection;;DataCollection ASC" style="margin-left: 30px;"></cc:CaisisComboBox>
                    </td>

                </tr>
            </table>
        </td>
    </tr>

    <tr>
        <td style="font-weight: bold; padding-top: 20px; font-size: 13px; color: #000000;" colspan="4">
            Form Completed By<br />
            <table cellpadding="4" cellspacing="0" style="table-layout: fixed; width: 100%; margin: auto auto 25px auto;
                vertical-align: top; position: relative; border: solid 1px #999999;">
                <tr>
                    <td>
                        <label for="CompletedByFirstName" title="First Name">
                            First Name</label>
                    </td>
                    <td>
                        <cc:CaisisTextBox ID="CompletedByFirstName" ShowLabel="false" runat="server" Table="ProjectLetterOfIntent"
                            Field="CompletedByFirstName" MaxLength="50" />
                    </td>
                    <td>
                        <label for="CompletedByEmail" title="Email">
                            Email</label>
                    </td>
                    <td>
                        <cc:CaisisTextBox ID="CompletedByEmail" ShowLabel="false" runat="server" Table="ProjectLetterOfIntent"
                            Field="CompletedByEmail" MaxLength="50" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="CompletedByLastName" title="Last Name">
                            Last Name</label>
                    </td>
                    <td>
                        <cc:CaisisTextBox ID="CompletedByLastName" ShowLabel="false" runat="server" Table="ProjectLetterOfIntent"
                            Field="CompletedByLastName" MaxLength="50" />
                    </td>
                    <td>
                        <label for="CompletedByPhone" title="Phone">
                            Phone</label>
                    </td>
                    <td>
                        <cc:CaisisTextBox ID="CompletedByPhone" ShowLabel="false" runat="server" Table="ProjectLetterOfIntent"
                            Field="CompletedByPhone" MaxLength="50" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: right; padding-right: 15px;">
                        <span onclick="showContactPicker();" style="display: block; margin-top: 10px; font-weight: bold;
                            cursor: pointer; color: #660000;">Find Contact</span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div id="ContactPicker" style="width: 80%; position: absolute; top: 0px; left: 10%;
                            z-index: 100; background-color: #ffffff; border: 2px solid #000000; display: none;">
                            <table style="table-layout: fixed; width: 50%; margin: auto;">
                                <tr>
                                    <td>
                                        <label for="FindCompletedByName" title="Completed By Name">
                                            Name</label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="FindCompletedByName" CssClass="CallBackSelect" onchange="onCompletedByChange(this);"
                                            runat="server" DataTextField="Name" DataValueField="ContactId" AppendDataBoundItems="true">
                                            <asp:ListItem Text="---- Choose A Contact ----" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="FindCompletedByEmail" title="Completed By Email">
                                            Email</label>
                                    </td>
                                    <td>
                                        <select runat="server" id="FindCompletedByEmail" style="width: 150px; display: block;"
                                            class="CallBackSelect">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="FindCompletedByPhone" title="Completed By Phone">
                                            Phone</label>
                                    </td>
                                    <td>
                                        <select runat="server" id="FindCompletedByPhone" style="width: 150px; display: block;"
                                            class="CallBackSelect">
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;">
                                        <button onclick="return copyContactInfo();">
                                            Use Info</button></td>
                                    <td style="text-align: left;">
                                        <button onclick="return cancelContactPicker();">
                                            Cancel</button></td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            
        </td>
    </tr>
</table>
