<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Actions" CodeFile="Actions.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script type="text/javascript">
	tableArray.ActionsHtmlTable = "ActionsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Actions" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Actions"></asp:Label><br/>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ActionsHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Action Item</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <%--  
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'ActionDateText,ActionDate,DxType,DxResult,DxNotes', 'Imaging');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ActionDateText") %></td>
		  <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxResult") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  --%>
  
  

  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="1"  ID="ActionDateText_1" Table="Actions" FIELD="ActionDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden RecordId="1" Runat="server" ID="ActionDate_1" Table="Actions" Field="ActionDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400" style="width: 200px;"  RecordId="1" LookupCode="ActionItem" Table="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_1"/>
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="1"  style="width:230px;" Table="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_1" ShowTextEditor="true" />
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
<tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="2"  ID="ActionDateText_2" Table="Actions" FIELD="ActionDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden RecordId="2" Runat="server" ID="ActionDate_2" Table="Actions" Field="ActionDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400" style="width: 200px;"  RecordId="2" LookupCode="ActionItem" Table="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_2"/>
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="2"  style="width:230px;" Table="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_2" ShowTextEditor="true" />
	</td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
</tr>
<tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="3"  ID="ActionDateText_3" Table="Actions" FIELD="ActionDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden RecordId="3" Runat="server" ID="ActionDate_3" Table="Actions" Field="ActionDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400" style="width: 200px;"  RecordId="3" LookupCode="ActionItem" Table="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_3"/>
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="3"  style="width:230px;" Table="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_3" ShowTextEditor="true" />
	</td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
</tr>
<tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="4"  ID="ActionDateText_4" Table="Actions" FIELD="ActionDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden RecordId="4" Runat="server" ID="ActionDate_4" Table="Actions" Field="ActionDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400" style="width: 200px;"  RecordId="4" LookupCode="ActionItem" Table="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_4"/>
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="4"  style="width:230px;" Table="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_4" ShowTextEditor="true" />
	</td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
</tr>
<tr align="left" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="5"  ID="ActionDateText_5" Table="Actions" FIELD="ActionDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
		<euc:EformHidden RecordId="5" Runat="server" ID="ActionDate_5" Table="Actions" Field="ActionDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="400" style="width: 200px;"  RecordId="5" LookupCode="ActionItem" Table="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_5"/>
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="5"  style="width:230px;" Table="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_5" ShowTextEditor="true" />
	</td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
</tr>


</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ActionsHtmlTable');" />
<br/><br/>
<br/>
