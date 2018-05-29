<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Cytology" CodeFile="Cytology.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script type="text/javascript" language="javascript">
	tableArray.CytologyHtmlTable = "CytologyHtmlTable";
</script>
<a name="Cytology" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Cytology" style="margin-right: 40px;"></asp:Label>


<euc:EformCheckBoxList RepeatLayout="Flow"  RepeatDirection="Horizontal" Table="NoTable" FIELD="Cytology_Notes" id="Cytology_Notes"  runat="server"  ShowOther="false">
			<asp:ListItem Value="Reviewed with Pathologist">Reviewed with Pathologist</asp:ListItem>
</euc:EformCheckBoxList>


<br/>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="CytologyHtmlTable">
  <tr> 
            <td height="20" align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Date</td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Source</td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Results</td>
            <td  align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Data Source</td>
            <td align="center"  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <asp:Repeater ID="Cytolgy" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate>
		
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Pathology', <%# DataBinder.Eval(Container.DataItem, "PathologyId") %>, 'PathDateText,PathDate,PathSpecimenType,PathSite,PathResult,PathDataSource', 'Cytology');"> 
            <td height="34" class="ClinicalEformPopulatedColumn" align="center">&nbsp;<strong><%# DataBinder.Eval(Container.DataItem, "PathDateText")%></strong></td>
            <td class="ClinicalEformPopulatedColumn" style="padding-left: 4px;"><strong><%# DataBinder.Eval(Container.DataItem, "PathSite")%></strong>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathResult")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn"><strong><%# DataBinder.Eval(Container.DataItem, "PathDataSource")%></strong>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="11"  ID="PathDateText_11" Table="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
		<euc:EformHidden RecordId="11" Runat="server" ID="PathDate_11" Table="Pathology" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="200px" style="width: 130px;"  RecordId="11" LookupCode="BxSite" Table="Pathology" FIELD="PathSite" Runat="server" ID="PathSite_11"/></td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="360px" style="width: 180px;"  RecordId="11" LookupCode="BxResult" Table="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_11"/></td>
    <td><euc:EformComboBox DropDownWidth="200px" style="width: 140px;"  RecordId="11" LookupCode="DataSource" Table="Pathology" FIELD="PathDataSource" Runat="server" ID="PathDataSource_11"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="12"  ID="PathDateText_12" Table="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
		<euc:EformHidden RecordId="12" Runat="server" ID="PathDate_12" Table="Pathology" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="200px" style="width: 130px;"  RecordId="12" LookupCode="BxSite" Table="Pathology" FIELD="PathSite" Runat="server" ID="PathSite_12"/></td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="360px" style="width: 180px;"  RecordId="12" LookupCode="BxResult" Table="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_12"/></td>
    <td><euc:EformComboBox DropDownWidth="200px" style="width: 140px;"  RecordId="12" LookupCode="DataSource" Table="Pathology" FIELD="PathDataSource" Runat="server" ID="PathDataSource_12"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="13"  ID="PathDateText_13" Table="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
		<euc:EformHidden RecordId="13" Runat="server" ID="PathDate_13" Table="Pathology" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="200px" style="width: 130px;"  RecordId="13" LookupCode="BxSite" Table="Pathology" FIELD="PathSite" Runat="server" ID="PathSite_13"/></td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="360px" style="width: 180px;"  RecordId="13" LookupCode="BxResult" Table="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_13"/></td>
    <td><euc:EformComboBox DropDownWidth="200px" style="width: 140px;"  RecordId="13" LookupCode="DataSource" Table="Pathology" FIELD="PathDataSource" Runat="server" ID="PathDataSource_13"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="14"  ID="PathDateText_14" Table="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
		<euc:EformHidden RecordId="14" Runat="server" ID="PathDate_14" Table="Pathology" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="200px" style="width: 130px;"  RecordId="14" LookupCode="BxSite" Table="Pathology" FIELD="PathSite" Runat="server" ID="PathSite_14"/></td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="360px" style="width: 180px;"  RecordId="14" LookupCode="BxResult" Table="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_14"/></td>
    <td><euc:EformComboBox DropDownWidth="200px" style="width: 140px;"  RecordId="14" LookupCode="DataSource" Table="Pathology" FIELD="PathDataSource" Runat="server" ID="PathDataSource_14"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="15"  ID="PathDateText_15" Table="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
		<euc:EformHidden RecordId="15" Runat="server" ID="PathDate_15" Table="Pathology" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="200px" style="width: 130px;"  RecordId="15" LookupCode="BxSite" Table="Pathology" FIELD="PathSite" Runat="server" ID="PathSite_15"/></td>
    <td align="left" style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="360px" style="width: 180px;"  RecordId="15" LookupCode="BxResult" Table="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_15"/></td>
    <td><euc:EformComboBox DropDownWidth="200px" style="width: 140px;"  RecordId="15" LookupCode="DataSource" Table="Pathology" FIELD="PathDataSource" Runat="server" ID="PathDataSource_15"/></td>	
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'CytologyHtmlTable');" />
<br/><br/>
<br/>