<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.HealthMaintenance" CodeFile="HealthMaintenance.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<a name="HealthMaintenance" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Health Maintenance" style="margin-right: 40px;"></asp:Label><br/>
<table width="675" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="HealthMaintenanceHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Diagnostic Test</td>
    <td width="12%" class="controlBoxDataGridHeaderFirstCol">&nbsp;Date</td>
    <td width="60%" class="controlBoxDataGridHeaderFirstCol">Results</td>
<%--   <td width="35%" class="controlBoxDataGridHeaderFirstCol">Notes</td> --%> 
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxResult,DxNotes', 'Imaging');"> 
			
		  <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
		  <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxResult") %></td>
<%--   			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td> --%>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  

  <tr >
    <td style="white-space: nowrap;">Last Colonoscopy</td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="11"  ID="DxDateText_11" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="11" Runat="server" ID="DxDate_11" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:350px;" Field="DxResult" RecordId="11" Table="Diagnostics" Runat="server" id="DxResult_11"  />
	</td>
<%--       <td align="center">
		<euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_11"/>
	</td> --%>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr >
    <td style="white-space: nowrap;">Last Stress Test</td>
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="12"  ID="DxDateText_12" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="12" Runat="server" ID="DxDate_12" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult" style="width:350px;" Field="DxResult" RecordId="12" Table="Diagnostics" Runat="server" id="DxResult_12"  />
	</td>
<%--       <td align="center">
		<euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_12"/>
	</td> --%>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<br/><br/>
<br/>