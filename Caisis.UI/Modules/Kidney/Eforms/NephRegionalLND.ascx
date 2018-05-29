<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.NephRegionalLND" CodeFile="NephRegionalLND.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="NephRegionalLND" />


<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Regional Lymph Node Dissection</strong>
				<euc:EformRadioButtonList TABLE="Procedures" RecordId="11" FIELD="ProcName" id="ProcName" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				    <asp:ListItem Value="Regional Lymph Node Dissection" Text="Yes" />
				    <asp:ListItem Value="" Text="No" />
				</euc:EformRadioButtonList>

	</td>
</tr>
<tr>
	
	<td style="padding-top: 12px;">
		<strong>If yes, specify site</strong><br />

				<euc:EformExtendedCheckBoxList LookupCode="KidneyProcSite" TABLE="Procedures" RecordId="11" FIELD="ProcSite" id="ProcSite" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">

				</euc:EformExtendedCheckBoxList>

	</td>	
  </tr>
  
</table>
<br/><br/>








