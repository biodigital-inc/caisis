<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.LabTests_ActiveSurveillance" CodeFile="LabTests_ActiveSurveillance.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript">
    tableArray.ActiveSurveillancePSATable = "ActiveSurveillancePSATable";

    function loadASLabTestRecord(LabTestId) {
        if (LabTestId.toString().length > 0) LoadDataEntryForm('LabTests', LabTestId, 'LabDateText,LabDate,LabTest,LabResult,LabQuality,LabNotes', 'LabTests_ActiveSurveillance');
    }

</script>
<style type="text/css">
table.ActiveSurveillancePSATable
{
    border: solid 1px #999999;
    table-layout: auto;
    border-collapse: collapse;
}

table.ActiveSurveillancePSATable th
{
    border: solid 1px #999999;
    padding: 3px;
    text-align: center;
    background-color: #efefef;
    color: #333333;
    font-size: 12px;
}
table.ActiveSurveillancePSATable td
{
    border: solid 1px #999999;
    padding: 10px 3px;
    text-align: center;
    background-color: #ffffff;
}
table.ActiveSurveillancePSATable tr:nth-of-type(odd) td
{
    background-color: #f2f2f2;
}



table.ActiveSurveillancePSATable td.populated
{
    background: linear-gradient(#E0E4E6, #FEFEFE);
    cursor: pointer;
}
table.ActiveSurveillancePSATable td.populated:hover
{
    background: linear-gradient(#D0C9D1, #DBA5B2, #EED2D9);
    border: solid 1px #8d2a2c;
    color: #000000;
}


</style>
<a name="LabTests_ActiveSurveillance" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="PSAs" />

<table id="ActiveSurveillancePSATable" cellspacing="0" class="ActiveSurveillancePSATable">
<tr > 
<th  >Date</th>
<th  >PSA</th>
<th  >PSA Density</th>
<th  >Prolaris Score</th>
<th  >Prolaris AUA</th>
<th  >Oncotype GPS</th>
<th  >Oncotype Path</th>
<th  >PCA3</th>
<th  >PHI</th>
<th  >4K</th>
</tr>

<asp:Repeater ID="labTests" Runat="server"> 
<ItemTemplate>
 <%# (Container.ItemIndex+1) % 8==0 ? "<tr ><th  >Date</th><th  >PSA</th><th  >PSA Density</th><th  >Prolaris Score</th><th  >Prolaris AUA</th><th  >Oncotype GPS</th><th  >Oncotype Path</th><th  >PCA3</th><th  >PHI</th><th  >4K</th></tr>" : "" %>
<tr> 
<td ><%# DataBinder.Eval(Container.DataItem, "LabDateText")%></td>
<td <%# (DataBinder.Eval(Container.DataItem, "PSAId").ToString().Length > 0) ? "class=\"populated\"" : "" %> onclick="loadASLabTestRecord(<%# DataBinder.Eval(Container.DataItem, "PSAId")%>)" ><%# DataBinder.Eval(Container.DataItem, "PSA")%>&nbsp;</td>
<td ><%# DataBinder.Eval(Container.DataItem, "PSADT")%></td>
<td <%# (DataBinder.Eval(Container.DataItem, "Prolaris ScoreId").ToString().Length > 0) ? "class=\"populated\"" : "" %> onclick="loadASLabTestRecord(<%# DataBinder.Eval(Container.DataItem, "Prolaris ScoreId")%>)" ><%# DataBinder.Eval(Container.DataItem, "Prolaris Score")%>&nbsp;</td>
<td <%# (DataBinder.Eval(Container.DataItem, "Prolaris ScoreId").ToString().Length > 0) ? "class=\"populated\"" : "" %> onclick="loadASLabTestRecord(<%# DataBinder.Eval(Container.DataItem, "Prolaris ScoreId")%>)" ><%# DataBinder.Eval(Container.DataItem, "Prolaris AUA")%>&nbsp;</td>
<td <%# (DataBinder.Eval(Container.DataItem, "Oncotype GPSId").ToString().Length > 0) ? "class=\"populated\"" : "" %> onclick="loadASLabTestRecord(<%# DataBinder.Eval(Container.DataItem, "Oncotype GPSId")%>)" ><%# DataBinder.Eval(Container.DataItem, "Oncotype GPS")%>&nbsp;</td>
<td <%# (DataBinder.Eval(Container.DataItem, "Oncotype GPSId").ToString().Length > 0) ? "class=\"populated\"" : "" %> onclick="loadASLabTestRecord(<%# DataBinder.Eval(Container.DataItem, "Oncotype GPSId")%>)" ><%# DataBinder.Eval(Container.DataItem, "Oncotype Path")%>&nbsp;</td>
<td <%# (DataBinder.Eval(Container.DataItem, "UPCA3Id").ToString().Length > 0) ? "class=\"populated\"" : "" %> onclick="loadASLabTestRecord(<%# DataBinder.Eval(Container.DataItem, "UPCA3Id")%>)" ><%# DataBinder.Eval(Container.DataItem, "UPCA3")%>&nbsp;</td>
<td <%# (DataBinder.Eval(Container.DataItem, "PHIId").ToString().Length > 0) ? "class=\"populated\"" : "" %> onclick="loadASLabTestRecord(<%# DataBinder.Eval(Container.DataItem, "PHIId")%>)" ><%# DataBinder.Eval(Container.DataItem, "PHI")%>&nbsp;</td>
<td <%# (DataBinder.Eval(Container.DataItem, "4KId").ToString().Length > 0) ? "class=\"populated\"" : "" %> onclick="loadASLabTestRecord(<%# DataBinder.Eval(Container.DataItem, "4KId")%>)" ><%# DataBinder.Eval(Container.DataItem, "4K")%>&nbsp;</td>
</tr>
</ItemTemplate>
</asp:Repeater>


<tr>
<td><euc:EformTextBox Runat="server" ID="ActiveSurveillanceLabTest1_DateText" TABLE="NoTable" FIELD="ActiveSurveillanceLabTest1_DateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden Runat="server" ID="ActiveSurveillanceLabTest1_Date" Table="NoTable" Field="ActiveSurveillanceLabTest1_Date"/></td>
<td><euc:EformTextBox RecordId="1" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_1" /></td>
<td></td>
<td><euc:EformTextBox RecordId="2" style="width:20px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_2" /></td>
<td><euc:EformTextBox RecordId="2" style="width:20px;" TABLE="LabTests" FIELD="LabNotes" Runat="server" ID="LabNotes_2" /></td>
<td><euc:EformTextBox RecordId="3" style="width:20px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_3" /></td>
<td><euc:EformTextBox RecordId="3" style="width:20px;" TABLE="LabTests" FIELD="LabNotes" Runat="server" ID="LabNotes_3" /></td>
<td><euc:EformTextBox RecordId="4" style="width:20px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_4" /></td>
<td><euc:EformTextBox RecordId="5" style="width:20px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_5" /></td>
<td><euc:EformTextBox RecordId="6" style="width:20px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_6" /></td>
</tr>


</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ActiveSurveillancePSATable');" />
<br/><br/><br/>
