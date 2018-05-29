<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Prostate.Eforms.UroHypogonadism" CodeFile="UroHypogonadism.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.HypogonadismHTMLTable = "HypogonadismHTMLTable";
</script>


<a name="UroHypogonadism" /><span class="controlBoxTitle">Hypogonadism</span> <br/>
<style type="text/css" >
table#HypogonadismHTMLTable
{
}
table#HypogonadismHTMLTable td.FormInsideTableRegCell
{
    text-align: center;
}
</style>

	  		<table id="HypogonadismHTMLTable" align="center" border="0"  cellpadding="0" cellspacing="0" style="border: solid 1px #cccccc;">
				<tr>
					<td align="center" height="25" valign="middle" width="10%" class="controlBoxDataGridTitleColumn">Date</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn">Medication</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn">Dose</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn">Units</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn">PSA</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn">tT</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn">fT</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn">SHBG</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn">E2</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn">LH</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn">FSH</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn">PRL</td>
					<td align="center" valign="middle" class="controlBoxDataGridTitleColumn HypogonadismHCTCol">HCT</td>
				</tr>
				
			    <asp:Repeater ID="Hypogonadism" runat="server" > 
                <ItemTemplate>
				<tr>
					<td height="26" class="FormInsideTableRegCell" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DateText")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "MedicationId").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('Medications', '" + DataBinder.Eval(Container.DataItem, "MedicationId") + "', 'MedDateText,MedDate,Medication,MedDose,MedUnits,MedIndications,MedRoute,MedSchedule,MedNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "Medication")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "MedicationId").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('Medications', '" + DataBinder.Eval(Container.DataItem, "MedicationId") + "', 'MedDateText,MedDate,Medication,MedDose,MedUnits,MedIndications,MedRoute,MedSchedule,MedNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedDose")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "MedicationId").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('Medications', '" + DataBinder.Eval(Container.DataItem, "MedicationId") + "', 'MedDateText,MedDate,Medication,MedDose,MedUnits,MedIndications,MedRoute,MedSchedule,MedNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedUnits")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "PSAId").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('LabTests', '" + DataBinder.Eval(Container.DataItem, "PSAId") + "', 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "PSA")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "tTId").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('LabTests', '" + DataBinder.Eval(Container.DataItem, "tTId") + "', 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "tT")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "fTId").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('LabTests', '" + DataBinder.Eval(Container.DataItem, "fTId") + "', 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "fT")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "SHBGId").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('LabTests', '" + DataBinder.Eval(Container.DataItem, "SHBGId") + "', 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "SHBG")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "E2Id").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('LabTests', '" + DataBinder.Eval(Container.DataItem, "E2Id") + "', 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "E2")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "LHId").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('LabTests', '" + DataBinder.Eval(Container.DataItem, "LHId") + "', 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "LH")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "FSHId").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('LabTests', '" + DataBinder.Eval(Container.DataItem, "FSHId") + "', 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "FSH")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "PRLId").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('LabTests', '" + DataBinder.Eval(Container.DataItem, "PRLId") + "', 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "PRL")%></td>
					<td <%# DataBinder.Eval(Container.DataItem, "HCTId").ToString().Length > 0 ? "onmouseover=\"this.className='FormInsideTableRegCell HypogonadismHCTCol ClinicalEformHighlightedRow';\" onmouseout=\"this.className='FormInsideTableRegCell ClinicalEformPopulatedRow HypogonadismHCTCol';\" style=\"cursor: pointer;\" class=\"FormInsideTableRegCell HypogonadismHCTCol ClinicalEformPopulatedRow\"  onclick=\"LoadDataEntryForm('LabTests', '" + DataBinder.Eval(Container.DataItem, "HCTId") + "', 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabNotes', 'UroHypogonadism');\" " : "class=\"FormInsideTableRegCell HypogonadismHCTCol\" " %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "HCT")%></td>
				</tr>
                </ItemTemplate>
                </asp:Repeater>


				<tr>
					<td height="26" class="FormInsideTableRegCell" ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="NoTable" FIELD="Hypogonadism1_DateText"  Runat="server" ID="Hypogonadism1_DateText"/><euc:EformHidden  TABLE="NoTable" FIELD="Hypogonadism1_Date" Runat="server" ID="Hypogonadism1_Date"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformComboBox style="width:80px;" RecordId="12" TABLE="Medications" FIELD="Medication" Runat="server" 
        ID="Medication_12" LookupCode="Medication"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_12" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformDropDownList RecordId="12" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_12" style="width: 80px;" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_1" RecordId="1" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_2" RecordId="2" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_3" RecordId="3" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_4" RecordId="4" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_5" RecordId="5" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_6" RecordId="6" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_7" RecordId="7" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_8" RecordId="8" /></td>
					<td class="FormInsideTableRegCell HypogonadismHCTCol" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_9" RecordId="9" /></td>
				</tr>
				<tr  style="display: none;" >
					<td height="26" class="FormInsideTableRegCell" ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="NoTable" FIELD="Hypogonadism2_DateText"  Runat="server" ID="Hypogonadism2_DateText"/><euc:EformHidden  TABLE="NoTable" FIELD="Hypogonadism2_Date" Runat="server" ID="Hypogonadism2_Date"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformComboBox style="width:80px;" RecordId="13" TABLE="Medications" FIELD="Medication" Runat="server" 
        ID="Medication_13" LookupCode="Medication"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_13" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformDropDownList RecordId="13" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_13" style="width: 80px;" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_10" RecordId="10" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_11" RecordId="11" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_12" RecordId="12" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_13" RecordId="13" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_14" RecordId="14" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_15" RecordId="15" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_16" RecordId="16" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_17" RecordId="17" /></td>
					<td class="FormInsideTableRegCell HypogonadismHCTCol" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_18" RecordId="18" /></td>
				</tr>
				<tr  style="display: none;" >
					<td height="26" class="FormInsideTableRegCell" ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="NoTable" FIELD="Hypogonadism3_DateText"  Runat="server" ID="Hypogonadism3_DateText"/><euc:EformHidden  TABLE="NoTable" FIELD="Hypogonadism3_Date" Runat="server" ID="Hypogonadism3_Date"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformComboBox style="width:80px;" RecordId="14" TABLE="Medications" FIELD="Medication" Runat="server" 
        ID="Medication_14" LookupCode="Medication"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="Medications" FIELD="MedDose" Runat="server" ID="MedDose_14" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformDropDownList RecordId="14" LookupCode="MedUnits" TABLE="Medications" FIELD="MedUnits" Runat="server" ID="MedUnits_14" style="width: 80px;" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_19" RecordId="19" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_20" RecordId="20" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_21" RecordId="21" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_22" RecordId="22" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_23" RecordId="23" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_24" RecordId="24" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_25" RecordId="25" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_26" RecordId="26" /></td>
					<td class="FormInsideTableRegCell HypogonadismHCTCol" ><euc:EformTextBox style="width:40px;" LookupCode="LabResult" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_27" RecordId="27" /></td>
				</tr>

				</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'HypogonadismHTMLTable');" /><br/><br/><br />
