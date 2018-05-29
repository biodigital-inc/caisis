<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.DataEntryForms.ClinicalStage_ProstateUICC02"
    CodeFile="ClinicalStage_ProstateUICC02.ascx.cs" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<h3 id="ClinicalStage_ProstateUICC02">
    Clinical Stage at Diagnosis (TNM) AJCC/UICC02</h3>
<table id="ClinicalStage_ProstateUICC02Table" class="DataRecords EditableRecords" style="width: 400px;">
    <tbody>
        <tr>
            <td style="width: 100px;">
                <asp:Label runat="server" AssociatedControlID="ClinStageDateText" CssClass="boldText">Date</asp:Label>
            </td>
            <td>
                <asp:HiddenField runat="server" ID="ClinicalStageId" />
                <cic:CaisisTextBox Table="ClinicalStages" Field="ClinStageDateText" runat="server"
                    ShowCalendar="True" CalcDate="True" ID="ClinStageDateText" Width="70px" ShowLabel="false"></cic:CaisisTextBox>
                <cic:CaisisHidden Table="ClinicalStages" Field="ClinStageDate" runat="server" ID="ClinStageDate" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" AssociatedControlID="ClinStageT" CssClass="requiredField">T Stage</asp:Label>
            </td>
            <td>
                <cic:CaisisComboBox LookupCode="StageClin_Prostate_02_T" Table="ClinicalStages" Field="ClinStageT"
                    runat="server" ID="ClinStageT" ReadOnly="true" ShowLabel="false" Width="100px" Required="true"></cic:CaisisComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" AssociatedControlID="ClinStageN" CssClass="boldText">N Stage</asp:Label>
            </td>
            <td>
                <cic:CaisisComboBox LookupCode="StageClin_Prostate_02_N" Table="ClinicalStages" Field="ClinStageN"
                    runat="server" ID="ClinStageN" ReadOnly="true" ShowLabel="false" Width="100px"></cic:CaisisComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" AssociatedControlID="ClinStageM" CssClass="boldText">M Stage</asp:Label>
            </td>
            <td>
                <cic:CaisisComboBox LookupCode="StageClin_Prostate_02_M" Table="ClinicalStages" Field="ClinStageM"
                    runat="server" ID="ClinStageM" ReadOnly="true" ShowLabel="false" Width="100px"></cic:CaisisComboBox>
            </td>
        </tr>
    </tbody>
</table>
