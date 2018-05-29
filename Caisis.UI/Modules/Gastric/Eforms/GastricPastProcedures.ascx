<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.GastricPastProcedures" CodeFile="GastricPastProcedures.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="GastricPastProcedures" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Past Procedures"></asp:Label><br/>

<style type="text/css">
a.dataEntryButtonGray:hover
{
    border: solid 1px #8d2a2c;
    color: #8d2a2c;
}
table#pastGastricProcsHtmlTable td.ClinicalEformPopulatedColumn
{
    font-size: 11px;
}
</style>
<asp:Literal ID="SurgicalHistoryMsg" runat="server" Visible="false">Listed below are this patient's past procedures. Click a record to edit.<br/></asp:Literal>
<table style="width: 700px;" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="pastGastricProcsHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; width: 100px;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Procedure</td>
    <td class="controlBoxDataGridHeaderFirstCol">Surgeon</td>
    <td class="controlBoxDataGridHeaderFirstCol">Indication</td>
    <td class="controlBoxDataGridHeaderFirstCol">Approach</td>
    <td class="controlBoxDataGridHeaderFirstCol">Site</td>
    <td class="controlBoxDataGridHeaderFirstCol">Subsite</td>
    <td class="controlBoxDataGridHeaderFirstCol">More</td>
  </tr>
  
  <asp:Repeater ID="rptSurgicalHistory" Runat="server"  OnItemDataBound="getLinkedData"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'OperatingRoomDetailId,ProcDateText,ProcDate,ProcName,ProcSurgeon,ProcIndication,ProcApproach,ProcSite,ProcSubsite', 'Procedures', 'GastricProc,NodeProc');"> 
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcName") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcSurgeon")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcIndication")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcApproach")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcSite")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcSubsite")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><span id="ORDetailsLink" runat="server"><a onclick="LoadDataEntryForm('OperatingRoomDetails', <%# DataBinder.Eval(Container.DataItem, "OperatingRoomDetailId") %>, 'OpDateText,OpDate,OpCaseSurgeon,OpService,OpInstitution,OpQuality,OpAdmitDateText,OpAdmitDate,OpDischargeDateText,OpDischargeDate,OpDuration', 'OperatingRoomDetails', '');stopBubble(event);" onmouseover="stopBubble(event);" class="dataEntryButtonGray" style="white-space: nowrap;" title="View/Edit OR Details">OR Details</a></span>
			
  <asp:Repeater ID="linkedPathologies" Runat="server"> 
	<ItemTemplate> 
			<span id="PathologyLink" runat="server" style="margin-top: 1px;"><a onclick="LoadDataEntryForm('Pathology', <%# DataBinder.Eval(Container.DataItem, "PathologyId") %>, 'PathDateText,PathDate,PathNum,PathSpecimenType,PathSpecimenCollection,PathSite,PathSubsite,PathSide,PathResult,PathInstitution,PathNotes,PathQuality,PathDataSource,PathHistology', 'Pathology', 'GastricPath,PathologyStageGrade,NodePathFinding,PathTest');stopBubble(event);" onmouseover="stopBubble(event);" class="dataEntryButtonGray" style="white-space: nowrap;" title="View/Edit Pahtology">Path: <%# DataBinder.Eval(Container.DataItem, "PathSpecimenType")%></a></span>
	</ItemTemplate>
  </asp:Repeater>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr id="NoSurgicalHistoryMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="9" class="ClinicalEformPopulatedColumn" align="center" height="40"> No prior gastric surgical procedures have been recorded for this patient.</td>
  </tr> 

  
  
</table>
<br/>
<br/><br/>
