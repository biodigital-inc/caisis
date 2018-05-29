<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.MRIHistory_Prostate" CodeFile="MRIHistory_Prostate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script type="text/javascript">
    tableArray.DiagnosticsHtmlTable = "DiagnosticsHtmlTable";

    function loadASDiagnosticRecord(DiagnosticId) {
        if (DiagnosticId.toString().length > 0) LoadDataEntryForm('Diagnostics', DiagnosticId, 'DxDateText,DxDate,DxType,DxTarget,DxResult,DxNotes', 'MRIHistory_Prostate', 'DxImageFindings');
    }

</script>
<style type="text/css">
table.MRIHistoryTable
{
    border: solid 1px #999999;
    table-layout: auto;
    border-collapse: collapse;
}

table.MRIHistoryTable th
{
    border: solid 1px #999999;
    padding: 3px;
    text-align: center;
    background-color: #efefef;
    color: #333333;
    font-size: 12px;
}
table.MRIHistoryTable td
{
    border: solid 1px #999999;
    padding: 10px 3px;
    text-align: center;
    background-color: #ffffff;
}
table.MRIHistoryTable tr:nth-of-type(odd) td
{
    background-color: #f2f2f2;
}



table.MRIHistoryTable tr.populated td
{
    background: linear-gradient(#E0E4E6, #FEFEFE);
    cursor: pointer;
}
table.MRIHistoryTable tr.populated:hover td
{
    background: linear-gradient(#D0C9D1, #DBA5B2, #EED2D9);
    border: solid 1px #D0C9D1;
    color: #000000;
}
</style>

<a name="MRIHistory_Prostate" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="MRI History"></asp:Label>
<table class="MRIHistoryTable" cellspacing="0" cellpadding="0" border="0" id="DiagnosticsHtmlTable">
            <tr >
            <th style="width: 15%;">Date</th>
            <th style="width: 15%;">Side</th>
            <th style="width: 25%;">Site</th>
            <th style="width: 45%;">Probability</th>
<%--            <th style="width: 10%;">SVI</th>
            <th style="width: 10%;">ECE</th>
            <th style="width: 10%;">LNI</th>
--%>            </tr>


<asp:Repeater ID="images" Runat="server" ><%-- OnItemDataBound="AddExtentionAndInvasion"--%>
<ItemTemplate>
            <tr class="populated" onclick="loadASDiagnosticRecord(<%# DataBinder.Eval(Container.DataItem, "DiagnosticId")%>);" >
            <td style="height: 24px;" ><%# DataBinder.Eval(Container.DataItem, "DxDateText")%>&nbsp;</td>
            <td ><%# DataBinder.Eval(Container.DataItem, "ImgFindSide")%>&nbsp;</td>
            <td ><%# DataBinder.Eval(Container.DataItem, "ImgFindSubsite")%>&nbsp;</td>
            <td ><%# DataBinder.Eval(Container.DataItem, "ImgFindResult")%>&nbsp;</td>
<%--            <td ><asp:Label ID="SVI" runat="server" />&nbsp;</td>
            <td ><asp:Label ID="ECE" runat="server" />&nbsp;</td>
            <td ><asp:Label ID="LNI" runat="server" />&nbsp;</td>
--%>            </tr>
</ItemTemplate>
</asp:Repeater>


<tr>
<td><euc:EformTextBox Runat="server" RecordId="1"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="1" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"/></td>
<td><euc:EformDropDownList RecordId="1" LookupCode="FindSide" TABLE="DxImageFindings" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_1" /></td>
<td><euc:EformComboBox DropDownWidth="200" style="width: 120px;"  RecordId="1" LookupCode="ImgFindSubsite" TABLE="DxImageFindings" FIELD="ImgFindSubsite" Runat="server" ID="ImgFindSubsite_1"/></td>
<td><euc:EformDropDownList RecordId="1" LookupCode="DxResult" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_1" style="width: 200px;" /></td>
<%--<td colspan="3"><euc:EformComboBox DropDownWidth="200"  RecordId="1" LookupCode="DxResult" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_1"/></td>
--%></tr>
<tr style="display: none;">
<td><euc:EformTextBox Runat="server" RecordId="2"  ID="DxDateText_2" TABLE="Diagnostics" FIELD="DxDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="2" Runat="server" ID="DxDate_2" Table="Diagnostics" Field="DxDate"/></td>
<td><euc:EformDropDownList RecordId="2" LookupCode="FindSide" TABLE="DxImageFindings" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_2" /></td>
<td><euc:EformComboBox DropDownWidth="200" style="width: 120px;"  RecordId="2" LookupCode="ImgFindSubsite" TABLE="DxImageFindings" FIELD="ImgFindSubsite" Runat="server" ID="ImgFindSubsite_2"/></td>
<td><euc:EformDropDownList RecordId="2" LookupCode="DxResult" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_2" style="width: 200px;" /></td>
<%--<td colspan="3"><euc:EformComboBox DropDownWidth="200"  RecordId="2" LookupCode="DxResult" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_2"/></td>
--%></tr>
<tr style="display: none;">
<td><euc:EformTextBox Runat="server" RecordId="3"  ID="DxDateText_3" TABLE="Diagnostics" FIELD="DxDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="3" Runat="server" ID="DxDate_3" Table="Diagnostics" Field="DxDate"/></td>
<td><euc:EformDropDownList RecordId="3" LookupCode="FindSide" TABLE="DxImageFindings" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_3" /></td>
<td><euc:EformComboBox DropDownWidth="200" style="width: 120px;"  RecordId="3" LookupCode="ImgFindSubsite" TABLE="DxImageFindings" FIELD="ImgFindSubsite" Runat="server" ID="ImgFindSubsite_3"/></td>
<td><euc:EformDropDownList RecordId="3" LookupCode="DxResult" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_3" style="width: 200px;" /></td>
<%--<td colspan="3"><euc:EformComboBox DropDownWidth="200"  RecordId="3" LookupCode="DxResult" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_3"/></td>
--%></tr>
<tr style="display: none;">
<td><euc:EformTextBox Runat="server" RecordId="4"  ID="DxDateText_4" TABLE="Diagnostics" FIELD="DxDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="4" Runat="server" ID="DxDate_4" Table="Diagnostics" Field="DxDate"/></td>
<td><euc:EformDropDownList RecordId="4" LookupCode="FindSide" TABLE="DxImageFindings" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_4" /></td>
<td><euc:EformComboBox DropDownWidth="200" style="width: 120px;"  RecordId="4" LookupCode="ImgFindSubsite" TABLE="DxImageFindings" FIELD="ImgFindSubsite" Runat="server" ID="ImgFindSubsite_4"/></td>
<td><euc:EformDropDownList RecordId="4" LookupCode="DxResult" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_4" style="width: 200px;" /></td>
<%--<td colspan="3"><euc:EformComboBox DropDownWidth="200"  RecordId="4" LookupCode="DxResult" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_4"/></td>
--%></tr>
<tr style="display: none;">
<td><euc:EformTextBox Runat="server" RecordId="5"  ID="DxDateText_5" TABLE="Diagnostics" FIELD="DxDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="5" Runat="server" ID="DxDate_5" Table="Diagnostics" Field="DxDate"/></td>
<td><euc:EformDropDownList RecordId="5" LookupCode="FindSide" TABLE="DxImageFindings" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_5" /></td>
<td><euc:EformComboBox DropDownWidth="200" style="width: 120px;"  RecordId="5" LookupCode="ImgFindSubsite" TABLE="DxImageFindings" FIELD="ImgFindSubsite" Runat="server" ID="ImgFindSubsite_5"/></td>
<td><euc:EformDropDownList RecordId="5" LookupCode="DxResult" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_5" style="width: 200px;" /></td>
<%--<td colspan="3"><euc:EformComboBox DropDownWidth="200"  RecordId="5" LookupCode="DxResult" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_5"/></td>
--%></tr>
<tr style="display: none;">
<td><euc:EformTextBox Runat="server" RecordId="6"  ID="DxDateText_6" TABLE="Diagnostics" FIELD="DxDateText" style="width:70px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="6" Runat="server" ID="DxDate_6" Table="Diagnostics" Field="DxDate"/></td>
<td><euc:EformDropDownList RecordId="6" LookupCode="FindSide" TABLE="DxImageFindings" FIELD="ImgFindSide" Runat="server" ID="ImgFindSide_6" /></td>
<td><euc:EformComboBox DropDownWidth="200" style="width: 120px;"  RecordId="6" LookupCode="ImgFindSubsite" TABLE="DxImageFindings" FIELD="ImgFindSubsite" Runat="server" ID="ImgFindSubsite_6"/></td>
<td><euc:EformDropDownList RecordId="6" LookupCode="DxResult" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult_6" style="width: 200px;" /></td>
<%--<td colspan="3"><euc:EformComboBox DropDownWidth="200"  RecordId="6" LookupCode="DxResult" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_6"/></td>
--%></tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DiagnosticsHtmlTable');" />
<br/><br/>
<br/>
