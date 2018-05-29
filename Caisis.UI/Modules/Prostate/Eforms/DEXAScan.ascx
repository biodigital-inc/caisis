<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Prostate.Eforms.DEXAScan" CodeFile="DEXAScan.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.DEXAScanHTMLTable = "DEXAScanHTMLTable";
</script>

<style type="text/css">
table#DEXAScanHTMLTable
{
    width: 600px;
    border-collapse: collapse;
}
table#DEXAScanHTMLTable th
{
    border: solid 1px #cccccc;
    font-weight: bold;
    padding: 3px;
    text-align: center;
    font-size: 11px;
    font-weight: bold;
    color: #1f1f1f;
}
table#DEXAScanHTMLTable td
{
    border: solid 1px #cccccc;
    padding: 3px;
    text-align: center;
}

</style>


<a name="DEXAScan" /><span class="controlBoxTitle">DEXA Scan</span> <br/>
	  		<table id="DEXAScanHTMLTable" cellspacing="0">
				<tr>
				  <th >&nbsp;</th>
				  <th colspan="4" style="padding: 0px 0px;background-color: #dfdfdf;">T-Scores</th>
			  </tr>
				<tr>
					<th style="width: 20%;" >Date</th>
					<th style="width: 20%;" >Total Hip </th>
					<th style="width: 20%;" >Femoral Neck </th>
					<th style="width: 20%;" >Lumbar / Spine </th>
					<th style="width: 20%;" >Forearm</th>
				</tr>
				<tr>
					<td ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="Diagnostics" FIELD="DxDateText" Runat="server" ID="DxDateText_2"/><euc:EformHidden RecordId="2" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_2"/></td>
					<td ><euc:EformTextBox RecordId="1" ParentRecordId="2" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_2_1" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="2" ParentRecordId="2" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_2_2" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="3" ParentRecordId="2" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_2_3" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="4" ParentRecordId="2" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_2_4" Width="40px" /></td>
				</tr>
				<tr>
					<td ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="Diagnostics" FIELD="DxDateText" Runat="server" ID="DxDateText_3"/><euc:EformHidden RecordId="3" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_3"/></td>
					<td ><euc:EformTextBox RecordId="1" ParentRecordId="3" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_3_1" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="2" ParentRecordId="3" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_3_2" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="3" ParentRecordId="3" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_3_3" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="4" ParentRecordId="3" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_3_4" Width="40px" /></td>
				</tr>
				<tr>
					<td ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="Diagnostics" FIELD="DxDateText" Runat="server" ID="DxDateText_4"/><euc:EformHidden RecordId="4" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_4"/></td>
					<td ><euc:EformTextBox RecordId="1" ParentRecordId="4" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_4_1" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="2" ParentRecordId="4" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_4_2" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="3" ParentRecordId="4" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_4_3" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="4" ParentRecordId="4" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_4_4" Width="40px" /></td>
				</tr>
				<tr style="display: none;" >
					<td ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="Diagnostics" FIELD="DxDateText" Runat="server" ID="DxDateText_5"/><euc:EformHidden RecordId="5" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_5"/></td>
					<td ><euc:EformTextBox RecordId="1" ParentRecordId="5" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_5_1" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="2" ParentRecordId="5" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_5_2" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="3" ParentRecordId="5" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_5_3" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="4" ParentRecordId="5" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_5_4" Width="40px" /></td>
				</tr>
				<tr style="display: none;" >
					<td ><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="6" TABLE="Diagnostics" FIELD="DxDateText" Runat="server" ID="DxDateText_6"/><euc:EformHidden RecordId="6" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_6"/></td>
					<td ><euc:EformTextBox RecordId="1" ParentRecordId="6" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_6_1" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="2" ParentRecordId="6" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_6_2" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="3" ParentRecordId="6" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_6_3" Width="40px" /></td>
					<td ><euc:EformTextBox RecordId="4" ParentRecordId="6" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_6_4" Width="40px" /></td>
				</tr>
		  </table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DEXAScanHTMLTable');" /><br /><br /><br />