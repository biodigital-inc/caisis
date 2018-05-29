<%@ Control Language="c#" Inherits="Caisis.UI.Modules.ProtocolMgmt.DataEntryForms.PCCTCProstatectomyDetails"
    CodeFile="PCCTCProstatectomyDetails.ascx.cs" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="custom" TagName="AbsentEventQuestion" Src="~/Modules/All/DataEntryForms/AbsentEventYesNo.ascx" %>
<h3>
    Prostatectomy Details</h3>
<!-- prior prostatectomy -->
<custom:AbsentEventQuestion runat="server" ID="ProstatectomyAbsentEvent" AbsentTable="Procedures"
    AbsentField="ProcName" AbsentFieldValue="Prostatectomy" AbsentQuestionText="Has the subject had prior prostatectomy?"
    PanelId="AdditionalProstatectomyPanel" />
<div id="AdditionalProstatectomyPanel" style="display: none; vertical-align: top;">
    <!-- prior prostatectomy -->
    <div id="ProstatectomyDetails">
        <span class="boldText">&nbsp;</span>
        <table class="DataRecords EditableRecords" cellspacing="0" style="width: 400px;">
            <tbody>
                <asp:PlaceHolder runat="server" ID="ProstatectomyDetailsFields">
                    <tr>
                        <td style="width: 125px;">
                            <strong>Date</strong>
                        </td>
                        <td colspan="5">
                            <%--key fields --%>
                            <asp:HiddenField runat="server" ID="ProcedureId" />
                            <asp:HiddenField runat="server" ID="PathologyId" />
                            <cic:CaisisTextBox runat="server" ID="ProcDateText" Table="Procedures" Field="ProcDateText"
                                ShowLabel="false" ShowCalendar="true" CalcDate="true" Width="70px"></cic:CaisisTextBox>
                            <cic:CaisisHidden runat="server" ID="ProcDate" Table="Procedures" Field="ProcDate"
                                ShowLabel="false" DisplayCalculatedDate="false">
                            </cic:CaisisHidden>
                            <img src="~/Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage"
                                runat="server" title="This record has been locked." alt="Locked" />
                        </td>
                    </tr>
                    <tr>
                        <td class="required">
                            <strong class="requiredField">Prostatectomy Type</strong>
                        </td>
                        <td colspan="5">
                            <cic:CaisisComboBox runat="server" ID="ProcName" Table="Procedures" Field="ProcName"
                                ShowLabel="false" Width="150px" LookupCode="OpTypeProstatectomy" Required="true">
                            </cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Approach</strong>
                        </td>
                        <td colspan="5">
                            <cic:CaisisComboBox runat="server" ID="ProcApproach" Table="Procedures" Field="ProcApproach"
                                ShowLabel="false" LookupCode="OpApproach" Width="150px"></cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>Histology</strong>
                        </td>
                        <td colspan="5">
                            <cic:CaisisComboBox runat="server" ID="PathHistology" Table="Pathology" Field="PathHistology"
                                Width="150px" ShowLabel="false" LookupCode="PathHistology,Disease,@DiseaseView"></cic:CaisisComboBox>
                        </td>
                        <tr>
                            <td style="width: 100px;">
                                <strong>G1</strong>
                            </td>
                            <td>
                                <cic:CaisisTextBox runat="server" ID="PathGG1" Table="ProstatectomyPath" Field="PathGG1"
                                    Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                            </td>
                            <td style="width: 100px;">
                                <strong>G2</strong>
                            </td>
                            <td>
                                <cic:CaisisTextBox runat="server" ID="PathGG2" Table="ProstatectomyPath" Field="PathGG2"
                                    Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                            </td>
                            <td style="width: 100px;">
                                <strong>G Sum</strong>
                            </td>
                            <td>
                                <cic:CaisisTextBox runat="server" ID="PathGGS" Table="ProstatectomyPath" Field="PathGGS"
                                    Width="30px" ShowLabel="false"></cic:CaisisTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>ECE</strong>
                            </td>
                            <td colspan="5">
                                <cic:CaisisSelect runat="server" ID="PathExtension" Table="ProstatectomyPath" Field="PathExtension"
                                    Width="150px" ShowLabel="false" LookupCode="LocalExtensionProstate">
                                </cic:CaisisSelect>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Margin Status</strong>
                            </td>
                            <td colspan="5">
                                <cic:CaisisComboBox runat="server" ID="PathMargin" Table="ProstatectomyPath" Field="PathMargin"
                                    Width="150px" ShowLabel="false" LookupCode="MarginStatus"></cic:CaisisComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>SV Inv</strong>
                            </td>
                            <td colspan="5">
                                <cic:CaisisSelect runat="server" ID="PathSV_Inv" Table="ProstatectomyPath" Field="PathSV_Inv"
                                    Width="150px" ShowLabel="false" LookupCode="SVI">
                                </cic:CaisisSelect>
                            </td>
                        </tr>
                </asp:PlaceHolder>
                <!-- RP Details -->
                <asp:PlaceHolder runat="server" ID="GradeDetailsPanel">
                    <!-- START: PathologyStageGrade-->
                    <tr>
                        <td colspan="1">
                            <strong>System</strong>
                        </td>
                        <td colspan="5">
                            <asp:HiddenField runat="server" ID="PathologyStageGradeId" />
                            <cic:CaisisSelect runat="server" ID="PathStageSystem" Table="PathologyStageGrade"
                                ShowLabel="false" Field="PathStageSystem" LookupCode="StagingSystem">
                            </cic:CaisisSelect>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1">
                            <strong>T Stage</strong>
                        </td>
                        <td colspan="5">
                            <cic:CaisisComboBox runat="server" ID="PathStageT" Table="PathologyStageGrade" ShowLabel="false"
                                Field="PathStageT" CascadeValuesBasedOn="$PathStageSystem"
                                CascadeFormatString="StagePath_Prostate_{n.0}_T"></cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1">
                            <strong>N Stage</strong>
                        </td>
                        <td colspan="5">
                            <cic:CaisisComboBox runat="server" ID="PathStageN" Table="PathologyStageGrade" ShowLabel="false"
                                Field="PathStageN" CascadeValuesBasedOn="$PathStageSystem"
                                CascadeFormatString="StagePath_Prostate_{n.0}_N"></cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1">
                            <strong>M Stage</strong>
                        </td>
                        <td colspan="5">
                            <cic:CaisisComboBox runat="server" ID="PathStageM" Table="PathologyStageGrade" ShowLabel="false"
                                Field="PathStageM" CascadeValuesBasedOn="$PathStageSystem"
                                CascadeFormatString="StagePath_Prostate_{n.0}_M"></cic:CaisisComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1">
                            <strong>Grade</strong>
                        </td>
                        <td colspan="5">
                            <cic:CaisisSelect runat="server" ID="PathGrade" Table="PathologyStageGrade" ShowLabel="false"
                                Field="PathGrade" LookupCode="PathGrade">
                            </cic:CaisisSelect>
                        </td>
                    </tr>
                    <!-- END PathologyStageGrade-->
                </asp:PlaceHolder>
            </tbody>
        </table>
    </div>
</div>
