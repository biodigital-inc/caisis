<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProtocolDetails.ascx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolDetails" %>
<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Modules.Prostate.Charts" %>
<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>
<asp:HiddenField runat="server" ID="ProtocolId" />
<h1>
    <asp:Label runat="server" ID="ProtocolNumLabel"></asp:Label>:
    <asp:Label runat="server" ID="ProtocolTitleLabel"></asp:Label>
</h1>
<h2>
    PSA Charts</h2>
<div class="chartContainer">
    <asp:Label runat="server" ID="ChartError" CssClass="redText" Visible="false" Text="There was a problem fetching the charts."></asp:Label>
    <chart:PSAWaterfallChart runat="server" ID="PSAWaterfallChart" CssClass="SmallProtocolChart" BackColor="Red">
    </chart:PSAWaterfallChart>
    <chart:PSAWaterfallChart runat="server" ID="MaxPSADecline" CssClass="SmallProtocolChart"  BackColor="Red">
    </chart:PSAWaterfallChart>
</div>
<h2>
    Demographics</h2>
<table>
    <thead>
        <tr>
            <th colspan="2">
                Enrollment
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                Total Number Treated
            </td>
            <td>
                <asp:Label runat="server" ID="TotalTreated"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Total Number of Screen Failures
            </td>
            <td>
                <asp:Label runat="server" ID="TotalFailed"></asp:Label>
            </td>
        </tr>
    </tbody>
    <tfoot>
        <tr class="total boldText">
            <td>
                Total Enrollment
            </td>
            <td>
                <asp:Label runat="server" ID="PatientsEnrolled"></asp:Label>
            </td>
        </tr>
    </tfoot>
</table>
<table>
    <thead>
        <tr>
            <th colspan="2">
                Evaluable Status (n=XX)
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                Number evaluable for toxicity
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Number evaluable for study endpoints
            </td>
            <td>
            </td>
        </tr>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th colspan="2">
                Baseline characteristics
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                Mean Age (range)
            </td>
            <td>
                <asp:Label runat="server" ID="MeanAge"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Median Gleason Score (range)
            </td>
            <td>
                MIN:<asp:Label runat="server" ID="MinGleason"></asp:Label><br />
                MAX:<asp:Label runat="server" ID="MaxGleason"></asp:Label><br />
                MEDIAN:<asp:Label runat="server" ID="MedianGleason"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Median PSA Level at Diagnosis, ng/mL* (range)
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Number of patients with baseline ECOG 1 (KPS 70-80%)
            </td>
            <td>
                <asp:Label runat="server" ID="ECOG1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Number of patients with baseline ECOG 0 (KPS 90-100%)
            </td>
            <td>
                <asp:Label runat="server" ID="ECOG0"></asp:Label>
            </td>
        </tr>
    </tbody>
</table>
<h4>
    Sites of Disease</h4>
<table runat="server" id="SitesOfDiseases">
    <thead>
        <tr>
            <th>
                Sites of Disease
            </th>
            <th>
                Count
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td title="Bone">
                # with bone metastases only
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td title="Lymph Nodes">
                # with LN metastases only
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td title="Visceral">
                # with Visceral metastases only
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td title="Bone|Lymph Nodes">
                # with bone and LN metastases
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td title="Bone|Lymph Nodes|Visceral">
                # with bone and visceral metastases
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td title="Bone|Lymph Nodes|Visceral">
                # with bone, LN, and visceral metastases
            </td>
            <td>
            </td>
        </tr>
    </tbody>
    <tfoot>
        <tr class="total boldText">
            <td>
                Total Metastatic Disease
            </td>
            <td>
                <asp:Label runat="server" ID="SitesOfDiseasesTotal"></asp:Label>
            </td>
        </tr>
    </tfoot>
</table>
<h4>
    Prior Therapy</h4>
<table runat="server" id="PriorTherayTable">
    <thead>
        <tr>
            <th>
                Prior Therapy
            </th>
            <th>
                Count
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="Procedures" title="Prostatectomy">
                Prior Prostatectomy
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="Procedures" title="Radiation Therapy">
                Prior Radiation Therapy
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="RadiationTherapy" title="Salvage">
                Salvage Radiation Therapy
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="MedicalTherapy" title="HORM">
                Primary Hormonal Therapy
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="MedicalTherapy" title="CHEMO">
                Prior Chemotherapy
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="MedicalTherapy" title="IMMUNO">
                Prior Immunotherapy
            </td>
            <td>
            </td>
        </tr>
    </tbody>
    <tfoot>
        <tr class="total boldText">
            <td>
                Total Prior Therapies
            </td>
            <td>
                <asp:Label runat="server" ID="PriorTherapyTotal"></asp:Label>
            </td>
        </tr>
    </tfoot>
</table>
<h2 style="page-break-before: always;">
    2.0 Analysis of endpoints</h2>
<h3>
    2.1 Primary endpoint</h3>
<h4>
    Progression Free Survival in MOS</h4>
<table>
    <thead>
        <tr>
            <th colspan="2">
                Progression Free Survival in MOS
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                N=XX
            </td>
            <td>
                Median (Range)
            </td>
        </tr>
    </tbody>
</table>
<h3>
    2.2 Secondary endpoints</h3>
<h4>
    RECIST 1.1 defined radiologic response rates
</h4>
<table>
    <thead>
        <tr>
            <th colspan="2">
                RECIST 1.1 response criteria for target lesions
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                Complete Response (CR)
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Partial Response (PR)
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Stable Disease (SD)
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Progressive Disease (PD)
            </td>
            <td>
            </td>
        </tr>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th colspan="2">
                RECIST 1.1 response criteria for non-target lesions
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                Complete Response (CR)
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Complete Response (CR)
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Progressive Disease (PD)
            </td>
            <td>
            </td>
        </tr>
    </tbody>
</table>
<h4>
    PSA declines over time and time to PSA progression (proportion achieving 30%, 50%,
    and 90% declines)</h4>
<table>
    <thead>
        <tr>
            <th colspan="2">
                PSA Decline (N=XX)
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                90%
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                50%
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                30%
            </td>
            <td>
            </td>
        </tr>
    </tbody>
</table>
<h4>
    Overall survival</h4>
<table>
    <thead>
        <tr>
            <th colspan="2">
                Overall Survival in MOS
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                N=XX
            </td>
            <td>
                Median (Range)
            </td>
        </tr>
    </tbody>
</table>
<h3 style="page-break-before: always;">
    Safety (NCI CTC v4.0) [Toxicities (experienced above baseline) in patients evaluable
    for toxicity (n=XX)]</h3>
<excel:ExcelExportButton ID="ExcelExportButton6" runat="server" CssClass="dataEntryButtonGray"
    OnCommand="ExportSection" CommandArgument="AbnormalFindings" Text="Export All Clinical Findings" />
<h4>
    Abnormal Clinical Findings: General</h4>
<table runat="server" id="AbnormalClinicalFindingsGeneral" class="gradesTable sortable">
    <thead>
        <tr>
            <th>
                Event
            </th>
            <th>
                Grade 1
            </th>
            <th>
                Grade 2
            </th>
            <th>
                Grade3
            </th>
            <th>
                Grade 4
            </th>
            <th>
                Total # events*
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                Fatigue
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Fever
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Muscle Weakness
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Numbness
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Edema
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Pain Requiring Hospitalization
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Rash
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Hematuria
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Dysuria
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Nocturia
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </tbody>
</table>
<excel:ExcelExportButton runat="server" CssClass="dataEntryButtonGray" OnCommand="ExportSection"
    CommandArgument="AbnormalClinicalFindingsGeneral" />
<h4>
    Abnormal Clinical Findings: Gastrointestinal
</h4>
<table runat="server" id="AbnormalClinicalFindingsGastrointestinal" class="gradesTable">
    <thead>
        <tr>
            <th>
                Event
            </th>
            <th>
                Grade 1
            </th>
            <th>
                Grade 2
            </th>
            <th>
                Grade3
            </th>
            <th>
                Grade 4
            </th>
            <th>
                Total # events*
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                Diarrhea
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Constipation
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Nausea
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Vomiting
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Anorexia
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Weight Loss
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </tbody>
</table>
<excel:ExcelExportButton ID="ExcelExportButton1" runat="server" CssClass="dataEntryButtonGray"
    OnCommand="ExportSection" CommandArgument="AbnormalClinicalFindingsGastrointestinal" />
<h4>
    Abnormal Clinical Findings: Cardiac
</h4>
<table runat="server" id="AbnormalClinicalFindingsCardiac" class="gradesTable">
    <thead>
        <tr>
            <th>
                Event
            </th>
            <th>
                Grade 1
            </th>
            <th>
                Grade 2
            </th>
            <th>
                Grade3
            </th>
            <th>
                Grade 4
            </th>
            <th>
                Total # events*
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                Atrial Fibrillation
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Conduction Abnormalities
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </tbody>
</table>
<excel:ExcelExportButton ID="ExcelExportButton2" runat="server" CssClass="dataEntryButtonGray"
    OnCommand="ExportSection" CommandArgument="AbnormalClinicalFindingsCardiac" />
<h4>
    Abnormal Clinical Findings: Pulmonary
</h4>
<table runat="server" id="AbnormalClinicalFindingsPulmonary" class="gradesTable">
    <thead>
        <tr>
            <th>
                Event
            </th>
            <th>
                Grade 1
            </th>
            <th>
                Grade 2
            </th>
            <th>
                Grade3
            </th>
            <th>
                Grade 4
            </th>
            <th>
                Total # events*
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                dyspnea
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Pneumonitis
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </tbody>
</table>
<excel:ExcelExportButton ID="ExcelExportButton3" runat="server" CssClass="dataEntryButtonGray"
    OnCommand="ExportSection" CommandArgument="AbnormalClinicalFindingsPulmonary" />
<h4>
    Abnormal Clinical Findings: MISC</h4>
<table runat="server" id="AbnormalClinicalFindingsMisc" class="gradesTable">
    <thead>
        <tr>
            <th>
                Event
            </th>
            <th>
                Grade 1
            </th>
            <th>
                Grade 2
            </th>
            <th>
                Grade3
            </th>
            <th>
                Grade 4
            </th>
            <th>
                Total # events*
            </th>
        </tr>
    </thead>
    <tbody>
    </tbody>
</table>
<excel:ExcelExportButton ID="ExcelExportButton4" runat="server" CssClass="dataEntryButtonGray"
    OnCommand="ExportSection" CommandArgument="AbnormalClinicalFindingsMisc" />
<h4>
    Abnormal Laboratory Findings</h4>
<table runat="server" id="AbnormalLaboratoryFindings" class="gradesTable">
    <thead>
        <tr>
            <th>
                Event
            </th>
            <th>
                Grade 1
            </th>
            <th>
                Grade 2
            </th>
            <th>
                Grade3
            </th>
            <th>
                Grade 4
            </th>
            <th>
                Total # events
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                ALT, SGPT
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                AST, SGOT
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Hypoalbuminemia
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Creatine Phosphokinase
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Creatinine
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Hemoglobin
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Leukocytes
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Lymphopenia
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Neutrophils/granulocytes
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Platelets
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
    </tbody>
</table>
<excel:ExcelExportButton ID="ExcelExportButton5" runat="server" CssClass="dataEntryButtonGray"
    OnCommand="ExportSection" CommandArgument="AbnormalLaboratoryFindings" />
<%--
<h4>
    Changes in circulating tumor cells over time (unfavorable to favorable conversion
    rates)</h4>
<table>
    <thead>
        <tr>
            <th>
                Favorable (<5 CTCs)
            </th>
            <th>
                Unfavorable ( ≥5 CTCs)
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <asp:Label runat="server" ID="CTCLess5"></asp:Label>
            </td>
            <td>
                <asp:Label runat="server" ID="CTC5More"></asp:Label>
            </td>
        </tr>
    </tbody>
</table>--%>
<h4>
    Time to new metastatic disease is defined from the date of first study agent administration
    to the onset of a new evaluable site of disease as per PCWG2 and RECIST 1.1 guidelines,
    excluding the primary site and all sites documented at baseline will be assessed</h4>
<table>
    <thead>
        <tr>
            <th colspan="2">
                Time to New Metastatic Disease
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                Bone
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Lymph Node
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Visceral
            </td>
            <td>
            </td>
        </tr>
    </tbody>
</table>
