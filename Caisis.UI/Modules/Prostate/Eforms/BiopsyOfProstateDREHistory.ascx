<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateDREHistory" CodeFile="BiopsyOfProstateDREHistory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">

function loadEncRectalExamRecord(EncounterId, hasFindings) {
    if (EncounterId.toString().length > 0) {
        LoadDataEntryForm('EncRectalExams', EncounterId, '', 'RectalExamHistory', 'EncRectalExamFindings');
//       if (hasFindings) { LoadDataEntryForm('EncRectalExams', EncounterId, '', 'RectalExamHistory', 'EncRectalExamFindings'); }
//       else { LoadDataEntryForm('Encounters', EncounterId, 'EncDateText,EncDate,EncChiefComplaint,EncType,EncPhysician,EncNotes', 'RectalExamHistory', 'EncRectalExams'); }
    }
}

function loadEncRectalExamFindingRecord(EncounterId) {
    if (EncounterId.toString().length > 0) {
        LoadDataEntryForm('EncRectalExams', EncounterId, '', 'RectalExamHistory', 'EncRectalExamFindings');  //EncDateText,EncDate,EncChiefComplaint,EncType,EncPhysician,EncNotes
        stopBubble();
    }
}

</script>

<style type="text/css">

table.DREHistoryTable
{
    border: solid 1px #cccccc;
    border-collapse: collapse;
    border-spacing: 0;
    width: 700px;
    background-color: #ffffff;
}
table.DREHistoryTable td
{
    border: solid 1px #cccccc;
    padding: 2px 3px;
    text-align: center;
}

table.PageBreakable
{
    table-layout: fixed;
}
table.DREHistoryTable tr:last-child td
{
    border-bottom: none;
}



table.DREHistoryTable tr.populated td
{
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#E0E4E6', endColorstr='#F1F3F4'); /* for IE */
    background: linear-gradient(#E0E4E6, #FEFEFE);
    cursor: pointer;
}
table.DREHistoryTable tr.populated:hover td
{
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
    background: linear-gradient(#D0C9D1, #DBA5B2, #EED2D9);
    border: solid 1px #D0C9D1;
    color: #000000;
}

table.DREHistoryTable tr.populated td DREHistoryFindingsTable td
{
    background: none;
}

</style>



<a name="RectalExamHistory" /><span class="controlBoxTitle" style="display: block;">Rectal Exams</span>



    
        <table class="DREHistoryTable" cellspacing="0" id="DREHistoryTable" >
        <tr id="DREHistoryTableHeader" runat="server" visible="false">
        <th style="width: 15%; color: #000000; font-size: 12px;">Date</th>
        <th style="width: 25%; color: #000000; font-size: 12px;">2002 Clinical Stage</th>
        <th style="color: #000000; font-size: 12px;">Findings</th>
        </tr>
        <tr id="NoDREHistoryTableMessage" runat="server"><th style=" color: #000000; font-size: 12px;">No Prior Rectal Exams</th></tr>
    <asp:Repeater ID="DREHistory" runat="server" OnItemDataBound="DREHistoryItemDataBound">
    <ItemTemplate> 
        <tr class="populated" onclick="loadEncRectalExamRecord(<%# DataBinder.Eval(Container.DataItem, "EncounterId")%>, <asp:Literal ID="RectalExamJSLinkModifier" runat="server" Text="false" />);" > 
        <td ><%# DataBinder.Eval(Container.DataItem, "EncDateText")%>&nbsp;</td>
        <td ><asp:Literal ID="ClinicalStageVals" runat="server" />&nbsp;</td>
        <td style="padding: 0px;" >
        
                <asp:Repeater ID="DREFindings" runat="server">
                <%---  ---%>
                <HeaderTemplate>
                    <table class="DREHistoryFindingsTable" cellspacing="0" style=" table-layout: fixed;" >
                    <tr>
                    <th style="width: 20%; color: #000000; font-size: 12px;" >Side</th>
                    <th style="width: 20%; color: #000000; font-size: 12px;" >Laterality</th>
                    <th style="width: 20%; color: #000000; font-size: 12px;" >Level</th>
                    <th style="width: 20%; color: #000000; font-size: 12px;" >Result</th>
                    <th style="width: 20%; color: #000000; font-size: 12px;" >ECE</th>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate> 
                    <tr >    
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindSide")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindLaterality")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindLevel")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindResult")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindExtension")%>&nbsp;</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
                </asp:Repeater>
        </td>
        </tr>
    </ItemTemplate>
    </asp:Repeater>
    </table>
<br/>
<br/>
<br/>
