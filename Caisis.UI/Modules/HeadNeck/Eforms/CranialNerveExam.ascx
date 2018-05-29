<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.CranialNerveExam" CodeFile="CranialNerveExam.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style type="text/css">
table#CranialNerveExamHTMLTable
{
    border-collapse: collapse;
    border-spacing: 0px;
}
table#CranialNerveExamHTMLTable td
{
    border-top: solid 1px #cccccc;
    padding: 8px;
}
table#CranialNerveExamHTMLTable td table td
{
    border-top: none;
    padding: 0px 20px 0px 0px;
}
</style>

<div id="CranialNerveExam_HTMLContainer">
<a name="CranialNerveExam" /><span class="controlBoxTitle">Cranial Nerve Exam</span>
<table cellspacing="0" class="eformLargePopulatedTable" id="CranialNerveExamHTMLTable" >
<tr>
<td  style="font-weight: bold;">Side</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncSide" Id="EncSide" LookupCode="HeadNeckPNIside" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Cranial Nerve II</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncCranialNerveII" Id="EncCranialNerveII" LookupCode="HeadNeckCranialNerveII" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /> 
</td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Cranial Nerve III/IV/VI</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncCranialNerveIII_IV_VI" Id="EncCranialNerveIII_IV_VI" LookupCode="HeadNeckCranialNerveIII_IV_VI" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Supraorbital V1</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncSupraorbitalV1" Id="EncSupraorbitalV1" LookupCode="HeadNeckCranialNerveSupraorbital" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Supratrochlear V1</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncSupratrochlearV1" Id="EncSupratrochlearV1" LookupCode="HeadNeckCranialNerveSupraorbital" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Infraorbital V2</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncInfraorbitalV2" Id="EncInfraorbitalV2" LookupCode="HeadNeckCranialNerveSupraorbital" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Lingual V3</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EnclingualV3" Id="EnclingualV3" LookupCode="HeadNeckCranialNerveSupraorbital" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Mental V3</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncMentalV3" Id="EncMentalV3" LookupCode="HeadNeckCranialNerveSupraorbital" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Inf. Alveolar V3</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncInfAlveolarV3" Id="EncInfAlveolarV3" LookupCode="HeadNeckCranialNerveSupraorbital" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Masseter atrophy V3</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncMasseterAtrophyV3" Id="EncMasseterAtrophyV3" LookupCode="HeadNeckCranialNerveSupraorbital" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Temporal VII</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncTemporalVII" Id="EncTemporalVII" LookupCode="HeadNeckCranialNerveSymptom" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Zygomatic VII</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncZygomaticVII" Id="EncZygomaticVII" LookupCode="HeadNeckCranialNerveSymptom" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Buccal VII</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncBuccalVII" Id="EncBuccalVII" LookupCode="HeadNeckCranialNerveSymptom" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Marginal VII</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncMarginalVII" Id="EncMarginalVII" LookupCode="HeadNeckCranialNerveSymptom" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">House-Brackmann Score</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncHouseBrackmannScore" Id="EncHouseBrackmannScore" LookupCode="HeadNeckHouseBrackmannScore" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Palate Rise</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncVagusX" Id="EncVagusX" LookupCode="HeadNeckCranialNerveSymptom" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Vocal Cord</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncVocalCord" Id="EncVocalCord" LookupCode="HeadNeckCranialNerveVocalCord" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Accessory XI</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncAccessoryXI" Id="EncAccessoryXI" LookupCode="HeadNeckCranialNerveAccessory" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" RepeatColumns="3" /></td>

<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td  style="font-weight: bold;">Hypoglossal XII</td>
<td><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncHypoglossalXII" Id="EncHypoglossalXII" LookupCode="HeadNeckCranialNerveHypoglossal" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></td>
<td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr>
<td style="font-weight: bold; border-bottom: none; padding-bottom: 0px;" colspan="3">Other Named Nerve</td>
</tr>
<tr>
<td style="font-weight: bold; border-top: none; padding-top: 0px;"><euc:EformTextBox RecordId="1" TABLE="EncHeadNeckCranialNerveExam" FIELD="EncOtherNamedNerve" Runat="server" ID="EncOtherNamedNerve" style="width: 140px;" onkeyup="showHideNamedNerveResult();" /></td>
<td style="border-top: none; padding-top: 0px;"><span id="OtherNamedNerveResultContainer"><euc:EformRadioButtonList RecordId="1" Table="EncHeadNeckCranialNerveExam" Field="EncOtherNamedNerveResult" Id="EncOtherNamedNerveResult"  LookupCode="HeadNeckCranialNerveOtherNamedNerveResult" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" /></span></td>
<td style="border-top: none; padding-top: 0px;"><euc:EformDeleteIcon runat="server" onclick="clearElementsInParentRow(this);showHideNamedNerveResult();" /></td>
</tr>
</table>
<br/>
<br/>
<br/>
</div>
<script type="text/javascript">

    function showHideNamedNerveResult() {
        var doShow = ($('<% = EncOtherNamedNerve.ClientID %>').value.length > 0);
        showHideSection($('OtherNamedNerveResultContainer'), doShow);
    }

    showHideNamedNerveResult();

    var CranialNerveExam_HTMLContainer = $('CranialNerveExam_HTMLContainer');
    if (typeof ExistingEncounterIdField != 'undefined' && (ExistingEncounterIdField.options.length == 0 || jQuery(ExistingEncounterIdField).val().length < 1)) {
        CranialNerveExam_HTMLContainer.style.display = 'none';
    }

    if (typeof showHidePerineuralEFormSections == 'function') { showHidePerineuralEFormSections(); }



    var PNI_CranialNerveExamRadiosWithUnknownValue = jQuery('input[value=Unknown][type=radio]', CranialNerveExam_HTMLContainer);

    PNI_CranialNerveExamRadiosWithUnknownValue.each(function () {
        var c = jQuery(this).closest('td').parent().closest('td');
        var selectedRadios = jQuery('input:checked', c);
        if (selectedRadios.length < 1) {
            jQuery(this).attr('checked', 'checked');
        }

    });



</script>