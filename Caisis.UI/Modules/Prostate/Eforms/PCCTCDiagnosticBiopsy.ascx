<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PCCTCDiagnosticBiopsy"
    CodeFile="PCCTCDiagnosticBiopsy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
    tableArray.DiagnosticBiopsiesHtmlTable = "DiagnosticBiopsiesHtmlTable";
</script>
<script type="text/javascript">
    function calculateBxResult(primaryGleasonId, secondaryGleasonId, gleasonSumId) {
        var ggs = 0;
        var g1 = parseInt(document.getElementById(primaryGleasonId).value);
        var g2 = parseInt(document.getElementById(secondaryGleasonId).value);


        if (!isNaN(g1) && !isNaN(g2)) {
            ggs = g1 + g2;
            document.getElementById(gleasonSumId).value = ggs;

            /*
            if(ggs <2) {
            return;
            } else if(ggs <= 4) {
            resBox.value = "Well"; //should match lookup code values
            } else if(ggs <= 7) {
            resBox.value = "Mod";
            } else if(ggs <= 10) {
            resBox.value = "Poor";
            }
			
            */
        }
    }

 
	
</script>
<a name="PCCTCDiagnosticBiopsy" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Diagnostic Biopsy"></asp:Label>
<br />
<table width="650" cellspacing="0" cellpadding="16" border="0" style="margin-bottom: 20px;"
    class="eformLargePopulatedTable" id="DiagnosticBiopsiesHtmlTable">
    <tbody>
        <tr>
            <td style="width: 75px;">
                <strong>Date</strong>
            </td>
            <td>
                <euc:EformTextBox ShowCalendar="true" CalcDate="true" Style="width: 80px;" Table="Pathology"
                    RecordId="12" Field="PathDateText" runat="server" ID="Path_1DateText" AppendToOnChange="setTimeout('copyDiagnosticValuesToProc()',500)" />
                <euc:EformHidden runat="server" ID="Path_1Date" Table="Pathology" RecordId="12" Field="PathDate" />
                <!-- Procedure -->
                <euc:EformTextBox RecordId="12" Table="Procedures" Field="ProcName" ID="ProcName_12"
                    runat="server" Style="display: none;" />
                <euc:EformTextBox RecordId="12" Table="Procedures" Field="ProcDateText" ID="ProcDateText_12"
                    runat="server" ShowCalendar="false" CalcDate="true" Style="display: none;" />
                <euc:EformHidden RecordId="12" Table="Procedures" Field="ProcDate" ID="ProcDate_12"
                    runat="server" DisplayCalculatedDate="false">
                </euc:EformHidden>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <strong>Type</strong>
            </td>
            <td colspan="5">
                <euc:EformSelect Style="width: 140px" DropDownWidth="200" DropDownHeight="auto" LookupCode="BxType"
                    Table="Pathology" Field="PathSpecimenType" runat="server" ID="PathSpecimenType_1"
                    RecordId="12" AppendToOnChange="copyDiagnosticValuesToProc();" />
            </td>
        </tr>       
        <tr>
            <td colspan="1">
                <strong>Histology</strong>
            </td>
            <td colspan="5">
                <euc:EformComboBox LookupCode="PathHistology" RecordId="12" ID="PathHistology" Style="width: 240px"
                    DropDownWidth="240" Table="Pathology" Field="PathHistology" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>G1</strong>
            </td>
            <td>
                <euc:EformTextBox RecordId="12" ID="PathGG1_1" Style="width: 30px" Table="ProstateBiopsyPath"
                    Field="PathGG1" runat="server" />
            </td>
            <td>
                <strong>G2</strong>
            </td>
            <td>
                <euc:EformTextBox RecordId="12" ID="PathGG2_1" Style="width: 30px" Table="ProstateBiopsyPath"
                    Field="PathGG2" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>G3</strong>
            </td>
            <td>
                <euc:EformTextBox RecordId="12" ID="PathGG3_1" Style="width: 30px" Table="ProstateBiopsyPath"
                    Field="PathGG3" runat="server" />
            </td>
            <td>
                <strong>G Sum</strong>
            </td>
            <td>
                <euc:EformTextBox RecordId="12" ID="PathGGS_1" Style="width: 30px" Table="ProstateBiopsyPath"
                    Field="PathGGS" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>+ Cores</strong>
            </td>
            <td>
                <euc:EformTextBox RecordId="12" ID="PathPosCores" Style="width: 30px" Table="ProstateBiopsyPath"
                    Field="PathPosCores" runat="server" />
            </td>
            <td>
                <strong>Total Cores</strong>
            </td>
            <td>
                <euc:EformTextBox RecordId="12" ID="PathNumCores" Style="width: 30px" Table="ProstateBiopsyPath"
                    Field="PathNumCores" runat="server" />
            </td>
            <td>
                <strong>% Cancer</strong>
            </td>
            <td>
                <euc:EformTextBox RecordId="12" ID="PathPercCancer" Style="width: 30px" Table="ProstateBiopsyPath"
                    Field="PathPercCancer" runat="server" />
            </td>
        </tr>
         <!-- START: PathologyStageGrade-->
        <tr>
            <td colspan="1">
                <strong>Disease</strong>
            </td>
            <td colspan="5">
                <euc:EformDropDownList runat="server" ID="PathStageDisease_12" Table="PathologyStageGrade" Field="PathStageDisease" RecordId="12" LookupCode="ClinStageDisease"></euc:EformDropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <strong>System</strong>
            </td>
            <td colspan="5">
                <euc:EformDropDownList runat="server" ID="PathStageSystem_12" Table="PathologyStageGrade" Field="PathStageSystem" RecordId="12" LookupCode="StagingSystem"></euc:EformDropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <strong>T Stage</strong>
            </td>
            <td colspan="5">
                <euc:EformSelect runat="server" Table="PathologyStageGrade" Field="PathStageT" RecordId="12" CascadeValuesBasedOn="$PathStageDisease_12,$PathStageSystem_12" CascadeFormatString="StagePath_{0}_{n.1}_T"></euc:EformSelect>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <strong>N Stage</strong>
            </td>
            <td colspan="5">
                <euc:EformSelect runat="server" Table="PathologyStageGrade" Field="PathStageN" RecordId="12" CascadeValuesBasedOn="$PathStageDisease_12,$PathStageSystem_12" CascadeFormatString="StagePath_{0}_{n.1}_N"></euc:EformSelect>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <strong>M Stage</strong>
            </td>
            <td colspan="5">
                <euc:EformSelect runat="server" Table="PathologyStageGrade" Field="PathStageM" RecordId="12"   CascadeValuesBasedOn="$PathStageDisease_12,$PathStageSystem_12" CascadeFormatString="StagePath_{0}_{n.1}_M"></euc:EformSelect>
            </td>
        </tr>
        <tr>
            <td colspan="1">
                <strong>Grade</strong>
            </td>
            <td colspan="5">
                <euc:EformDropDownList runat="server" Table="PathologyStageGrade" Field="PathGrade" RecordId="12" LookupCode="PathGrade"></euc:EformDropDownList>
            </td>
        </tr>
        <!-- END PathologyStageGrade-->
    </tbody>
</table>
<script type="text/javascript" language="javascript">
    // loading script for gleason calculations
    var calc_<%= PathGGS_1.ClientID %> = function () { calculateBxResult('<%= PathGG1_1.ClientID %>', '<%= PathGG2_1.ClientID %>', '<%= PathGGS_1.ClientID %>'); };

    document.getElementById('<%= PathGG1_1.ClientID %>').onkeyup = calc_<%= PathGGS_1.ClientID %>;
    document.getElementById('<%= PathGG2_1.ClientID %>').onkeyup = calc_<%= PathGGS_1.ClientID %>;


    function copyDiagnosticValuesToProc() {

        if ($('<% =PathSpecimenType_1.ClientID %>').value != '') {
            $('<% =ProcName_12.ClientID %>').value = $('<% =PathSpecimenType_1.ClientID %>').value;
            $('<% =ProcDateText_12.ClientID %>').value = $('<% =Path_1DateText.ClientID %>').value;
            $('<% =ProcDate_12.ClientID %>').value = $('<% =Path_1Date.ClientID %>').value;
        }
        else {
            $('<% =ProcName_12.ClientID %>').value = '';
            $('<% =ProcDateText_12.ClientID %>').value = '';
            $('<% =ProcDate_12.ClientID %>').value = '';
        }
    }
	
</script>
