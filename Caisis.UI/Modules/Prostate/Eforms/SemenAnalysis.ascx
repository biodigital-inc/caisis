<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Prostate.Eforms.SemenAnalysis" CodeFile="SemenAnalysis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.SemenAnalysisHTMLTable = "SemenAnalysisHTMLTable";
</script>

<style type="text/css">
table#SemenAnalysisHTMLTable
{
    width: 650px;
    border-collapse: collapse;
}
table#SemenAnalysisHTMLTable th
{
    border: solid 1px #cccccc;
    font-weight: bold;
    padding: 3px;
    text-align: center;
    font-size: 11px;
    font-weight: bold;
    color: #1f1f1f;
    background-color: #dfdfdf;
}
table#SemenAnalysisHTMLTable td
{
    border: solid 1px #cccccc;
    padding: 3px;
    text-align: center;
}

</style>


<a name="SemenAnalysis" /><span class="controlBoxTitle">Semen Analysis</span> <br/>
	  		<table id="SemenAnalysisHTMLTable" cellspacing="0">

				<tr>
					<th >Date</th>
					<th >Concentration</th>
					<th >Motility</th>
					<th >Normal Morphology</th>
					<th >pH</th>
					<th >Volume</th>
					<th >Other</th>
				</tr>
				<tr>
					<td ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="NoTable" FIELD="SemenAnalysis1_DateText" Runat="server" ID="SemenAnalysis1_DateText"/><euc:EformHidden RecordId="1" TABLE="NoTable" FIELD="SemenAnalysis1_Date" Runat="server" ID="SemenAnalysis1_Date"/></td>
					<td ><euc:EformTextBox RecordId="31" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_31" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="32" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_32" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="33" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_33" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="34" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_34" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="35" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_35" Width="40px" /></td>
					<td ><euc:EformTextBox TABLE="NoTable" FIELD="SemenAnalysis1_Other" Runat="server" ID="SemenAnalysis1_Other" Width="150px" ShowTextEditor="true" /></td>
				</tr>
				<tr>
					<td ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="NoTable" FIELD="SemenAnalysis2_DateText" Runat="server" ID="SemenAnalysis2_DateText"/><euc:EformHidden RecordId="1" TABLE="NoTable" FIELD="SemenAnalysis2_Date" Runat="server" ID="SemenAnalysis2_Date"/></td>
					<td ><euc:EformTextBox RecordId="36" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_36" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="37" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_37" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="38" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_38" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="39" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_39" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="40" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_40" Width="40px" /></td>
					<td ><euc:EformTextBox TABLE="NoTable" FIELD="SemenAnalysis2_Other" Runat="server" ID="SemenAnalysis2_Other" Width="150px" ShowTextEditor="true" /></td>
				</tr>
				<tr style="display: none;">
					<td ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="NoTable" FIELD="SemenAnalysis3_DateText" Runat="server" ID="SemenAnalysis3_DateText"/><euc:EformHidden RecordId="1" TABLE="NoTable" FIELD="SemenAnalysis3_Date" Runat="server" ID="SemenAnalysis3_Date"/></td>
					<td ><euc:EformTextBox RecordId="41" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_41" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="42" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_42" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="43" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_43" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="44" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_44" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="45" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_45" Width="40px" /></td>
					<td ><euc:EformTextBox TABLE="NoTable" FIELD="SemenAnalysis3_Other" Runat="server" ID="SemenAnalysis3_Other" Width="150px" ShowTextEditor="true" /></td>
				</tr>
				<tr style="display: none;">
					<td ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" TABLE="NoTable" FIELD="SemenAnalysis4_DateText" Runat="server" ID="SemenAnalysis4_DateText"/><euc:EformHidden RecordId="1" TABLE="NoTable" FIELD="SemenAnalysis4_Date" Runat="server" ID="SemenAnalysis4_Date"/></td>
					<td ><euc:EformTextBox RecordId="46" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_46" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="47" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_47" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="48" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_48" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="49" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_49" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="50" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_50" Width="40px" /></td>
					<td ><euc:EformTextBox TABLE="NoTable" FIELD="SemenAnalysis4_Other" Runat="server" ID="SemenAnalysis4_Other" Width="150px" ShowTextEditor="true" /></td>
				</tr>
		  </table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SemenAnalysisHTMLTable');" /><br /><br />