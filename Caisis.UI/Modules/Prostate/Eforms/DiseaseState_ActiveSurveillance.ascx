<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.DiseaseState_ActiveSurveillance" CodeFile="DiseaseState_ActiveSurveillance.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="DiseaseState_ActiveSurveillance" /><span class="controlBoxTitle">Disease State</span><br>

<table width="650" border="0" cellspacing="0" cellpadding="5" class="eformLargePopulatedTable" >
  <tr>
    <td nowrap>
	
		<asp:Label ID="LastStatus" Runat="server" /><br/>
		<strong>Status:</strong>
        <euc:EformTextBox style="display: none;" id="StatusDisease" Table="Status" Field="StatusDisease" Runat="server"/>
<%--	  <euc:EformHidden Runat="server" ID="StatusDisease" Table="Status" Field="StatusDisease" Value="Prostate Cancer" />
--%>		
	  <euc:EformRadioButtonList RepeatLayout="Flow"  RepeatDirection="Horizontal" TABLE="Status" RecordId="1" FIELD="Status" id="Status" CellPadding="0" runat="server">
				<asp:ListItem Value="No Recurrence">Stable</asp:ListItem>
				<asp:ListItem Value="Disease Progression">Disease Progression</asp:ListItem>
				<asp:ListItem Value="Distant Metastasis">Mets</asp:ListItem>
	  </euc:EformRadioButtonList>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<strong>Date:</strong> 
	  <euc:EformTextBox Runat="server" ID="StatusDateText" TABLE="Status" RecordId="1" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden Runat="server" ID="StatusDate" Table="Status" RecordId="1" Field="StatusDate" />
	
	</td>
  </tr>
</table>
<br/>
<br/>
<br/>
