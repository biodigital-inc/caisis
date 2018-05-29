<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PCCTCRPDetails.ascx.cs"
    Inherits="Caisis.UI.Modules.Prostate.Eforms.PCCTCRPDetails" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript">
    tableArray.RPDetailsHtmlTable = "RPDetailsHtmlTable";
</script>
<a name="PCCTCRPDetails" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="RP Details"></asp:Label>
<table width="650" cellspacing="0" cellpadding="16" border="0" class="eformLargePopulatedTable"
    id="RPDetailsHtmlTable" style="margin-bottom: 20px;">
    <tr>
        <td colspan="1">
            Date
        </td>
        <td colspan="5">
            <!-- Pathology -->
            <euc:EformTextBox ShowCalendar="true" CalcDate="true" Style="width: 80px;" Table="Pathology"
                RecordId="17" Field="PathDateText" runat="server" ID="Path_17_DateText" AppendToOnChange="setTimeout('copyRPDeatilsValuesToProc()',500)" />
            <euc:EformHidden runat="server" ID="Path_17_Date" Table="Pathology" RecordId="17"
                Field="PathDate" />
            <euc:EformTextBox Table="Pathology" Field="PathSpecimenType" runat="server" ID="PathSpecimenType_17"
                RecordId="17" Style="display: none;"></euc:EformTextBox>
            <!-- Procedure -->
            <euc:EformTextBox RecordId="17" Table="Procedures" Field="ProcName" ID="ProcName_17"
                runat="server" Style="display: none;" />
            <euc:EformTextBox RecordId="17" Table="Procedures" Field="ProcDateText" ID="ProcDateText_17"
                runat="server" ShowCalendar="false" CalcDate="true" Style="display: none;" />
            <euc:EformHidden RecordId="17" Table="Procedures" Field="ProcDate" ID="ProcDate_17"
                runat="server" DisplayCalculatedDate="false">
            </euc:EformHidden>
        </td>
    </tr>
    <!-- START: PathologyStageGrade-->
    <tr>
        <td colspan="1">
            <strong>Disease</strong>
        </td>
        <td colspan="5">
            <euc:EformDropDownList runat="server" ID="PathStageDisease_17" Table="PathologyStageGrade"
                Field="PathStageDisease" RecordId="17" LookupCode="ClinStageDisease">
            </euc:EformDropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="1">
            <strong>System</strong>
        </td>
        <td colspan="5">
            <euc:EformDropDownList runat="server" ID="PathStageSystem_17" Table="PathologyStageGrade"
                Field="PathStageSystem" RecordId="17" LookupCode="StagingSystem">
            </euc:EformDropDownList>
        </td>
    </tr>
    <tr>
        <td colspan="1">
            <strong>T Stage</strong>
        </td>
        <td colspan="5">
            <euc:EformSelect runat="server" ID="PathStageT_17" Table="PathologyStageGrade" Field="PathStageT"
                RecordId="17" CascadeValuesBasedOn="$PathStageDisease_17,$PathStageSystem_17"
                CascadeFormatString="StagePath_{0}_{n.1}_T"></euc:EformSelect>
        </td>
    </tr>
    <tr>
        <td colspan="1">
            <strong>N Stage</strong>
        </td>
        <td colspan="5">
            <euc:EformSelect runat="server" ID="PathStageN_17" Table="PathologyStageGrade" Field="PathStageN"
                RecordId="17" CascadeValuesBasedOn="$PathStageDisease_17,$PathStageSystem_17"
                CascadeFormatString="StagePath_{0}_{n.1}_N"></euc:EformSelect>
        </td>
    </tr>
    <tr>
        <td colspan="1">
            <strong>M Stage</strong>
        </td>
        <td colspan="5">
            <euc:EformSelect runat="server" ID="PathStageM_17" Table="PathologyStageGrade" Field="PathStageM"
                RecordId="17" CascadeValuesBasedOn="$PathStageDisease_17,$PathStageSystem_17"
                CascadeFormatString="StagePath_{0}_{n.1}_M"></euc:EformSelect>
        </td>
    </tr>
    <tr>
        <td colspan="1">
            <strong>Grade</strong>
        </td>
        <td colspan="5">
            <euc:EformDropDownList runat="server" ID="PathGrade_17" Table="PathologyStageGrade"
                Field="PathGrade" RecordId="17" LookupCode="PathGrade">
            </euc:EformDropDownList>
        </td>
    </tr>
    <!-- END PathologyStageGrade-->
</table>
<script type="text/javascript">

    var RPDetailsFields = [
            '<%= Path_17_DateText.ClientID %>',
            '<%= PathStageDisease_17.ClientID %>',
            '<%= PathStageSystem_17.ClientID %>',
            '<%= PathStageT_17.ClientID %>',
            '<%= PathStageN_17.ClientID %>',
            '<%= PathStageM_17.ClientID %>',
            '<%= PathGrade_17.ClientID %>'
        ];

    (function() {
        for (var i = 0; i < RPDetailsFields.length; i++) {
            var field = $(RPDetailsFields[i]);
            field.addEvent('change', copyRPDeatilsValuesToProc);
        }
    })();


    function copyRPDeatilsValuesToProc() {
        var fields = RPDetailsFields;
        var specType = $('<%= PathSpecimenType_17.ClientID %>');
        var procName = $('<%= ProcName_17.ClientID %>');
        var pathDate = $('<%= Path_17_DateText.ClientID %>');
        // if date set, activate field, else clear values
        var setProcName = pathDate.value != "";
        if (setProcName) {
            specType.value = 'RP';
            procName.value = 'RP';
        }
        else {
            specType.value = '';
            procName.value = '';
            // clear fields
            for (var i = 0; i < fields.length; i++) {
                var field = $(fields[i]);
                setValue(field, "");
            }
        }
    }
</script>
