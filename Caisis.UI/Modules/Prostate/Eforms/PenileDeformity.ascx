<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PenileDeformity" CodeFile="PenileDeformity.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.PenileDeformityHTMLTable = "PenileDeformityHTMLTable";
</script>


<a name="PenileDeformity" /><span class="controlBoxTitle">Penile Deformity Assessment</span><br/>
<style type="text/css" >
table#PenileDeformityHTMLTable
{
    margin: 0px 0px 0px 0px;
}
table#PenileDeformityHTMLTable td
{
    text-align: center;
    padding: 4px 2px 4px 2px;
}
</style>
<table id="PenileDeformityHTMLTable" border="0"  cellpadding="0" cellspacing="0" style="border: solid 1px #cccccc;">
				<tr>
					<td class="controlBoxDataGridTitleColumn" style="vertical-align: bottom;">Date</td>
					<td class="controlBoxDataGridTitleColumn" style="vertical-align: bottom;">Agent</td>
					<td class="controlBoxDataGridTitleColumn" style="vertical-align: bottom;">Dose</td>
					<td class="controlBoxDataGridTitleColumn" style="vertical-align: bottom;">% Erection</td>
					<td class="controlBoxDataGridTitleColumn" style="vertical-align: bottom; width: 110px;">Primary Deformity</td>
					<td class="controlBoxDataGridTitleColumn" style="vertical-align: bottom; width: 110px;">Secondary Deformity</td>
					<td class="controlBoxDataGridTitleColumn" style="vertical-align: bottom; width: 110px;">Associated Deformities</td>
					<td class="controlBoxDataGridTitleColumn" style="vertical-align: bottom;">&nbsp;</td>
				</tr>
				
			    <asp:Repeater ID="SurveyRpt" runat="server" OnItemDataBound="GetSurveyItems" > 
                <ItemTemplate>
				<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Surveys', '<%# DataBinder.Eval(Container.DataItem, "SurveyId") %>', 'SurveyDateText,SurveyDate,SurveyType', 'UroHypogonadism', 'SurveyItems');" >
					<td height="26" class="FormInsideTableRegCell" ><%# DataBinder.Eval(Container.DataItem, "SurveyDateText") %></td>
					<td class="FormInsideTableRegCell" ><asp:Literal ID="Agent" runat="server" />&nbsp;</td>
					<td class="FormInsideTableRegCell" ><asp:Literal ID="Dose" runat="server" />&nbsp;</td>
					<td class="FormInsideTableRegCell" ><asp:Literal ID="PercErection" runat="server" />&nbsp;</td>
					<td class="FormInsideTableRegCell" ><asp:Literal ID="PrimaryDeformity" runat="server" />&nbsp;</td>
					<td class="FormInsideTableRegCell" ><asp:Literal ID="SecondaryDeformity" runat="server" />&nbsp;</td>
					<td class="FormInsideTableRegCell" ><asp:Literal ID="AssociatedDeformities" runat="server" />&nbsp;</td>
					<td class="FormInsideTableRegCell" >&nbsp;</td>
				</tr>
                </ItemTemplate>
                </asp:Repeater>

				<tr>
					<td height="26" class="FormInsideTableRegCell" ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Surveys" RecordId="4" FIELD="SurveyDateText"  Runat="server" ID="SurveyDateText_4"/><euc:EformHidden  TABLE="Surveys" RecordId="4" FIELD="SurveyDate" Runat="server" ID="SurveyDate_4"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformComboBox style="width:80px;" RecordId="41" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_41" LookupCode="Medication"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="42" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_42" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="43" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_43" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="44" ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_44" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="45" ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_45" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="46" ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_46" /></td>
					<td class="FormInsideTableRegCell"><euc:EformDeleteIcon runat="server" /></td>
				</tr>
				<tr style="display: none;">
					<td height="26" class="FormInsideTableRegCell" ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Surveys" RecordId="8" FIELD="SurveyDateText"  Runat="server" ID="SurveyDateText_8"/><euc:EformHidden  TABLE="Surveys" RecordId="8" FIELD="SurveyDate" Runat="server" ID="SurveyDate_8"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformComboBox style="width:80px;" RecordId="134" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_134" LookupCode="Medication"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="135" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_135" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="136" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_136" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="137" ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_137" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="138" ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_138" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="139" ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_139" /></td>
					<td class="FormInsideTableRegCell"><euc:EformDeleteIcon runat="server" /></td>
				</tr>
				<tr style="display: none;">
					<td height="26" class="FormInsideTableRegCell" ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="Surveys" RecordId="9" FIELD="SurveyDateText"  Runat="server" ID="SurveyDateText_9"/><euc:EformHidden  TABLE="Surveys" RecordId="9" FIELD="SurveyDate" Runat="server" ID="SurveyDate_9"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformComboBox style="width:80px;" RecordId="140" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_140" LookupCode="Medication"/></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="141" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_141" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="142" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_142" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="143" ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_143" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="144" ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_144" /></td>
					<td class="FormInsideTableRegCell" ><euc:EformTextBox RecordId="145" ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="SurveyItems" FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_145" /></td>
					<td class="FormInsideTableRegCell"><euc:EformDeleteIcon runat="server" /></td>
				</tr>


				</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PenileDeformityHTMLTable');" /><br/><br/><br />
