<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreatitisImaging" CodeFile="PancreatitisImaging.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript">
	tableArray.DiagnosticsHtmlTable = "DiagnosticsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="PancreatitisImaging" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Imaging"></asp:Label><br/>
<table width="675" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Study</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Target</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Results</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxTarget,DxResult,DxNotes', 'PancreatitisImaging');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
		  <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxTarget") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxResult") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="1"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="1" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="1" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="1" Table="Diagnostics" Runat="server" id="DxTarget_1"  />
	</td>
   <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxResult,Disease,@DiseaseView"  style="width:140;" Field="DxResult" RecordId="1" Table="Diagnostics" Runat="server" id="DxResult_1"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_1"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="2"  ID="DxDateText_2" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="DxDate_2" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="2" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_2"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="2" Table="Diagnostics" Runat="server" id="DxTarget_2"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="2" Table="Diagnostics" Runat="server" id="DxResult_2"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_2"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="3"  ID="DxDateText_3" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="DxDate_3" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="3" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_3"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="3" Table="Diagnostics" Runat="server" id="DxTarget_3"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="3" Table="Diagnostics" Runat="server" id="DxResult_3"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_3"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="4"  ID="DxDateText_4" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="4" Runat="server" ID="DxDate_4" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="4" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4"/>
	</td>
      <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="4" Table="Diagnostics" Runat="server" id="DxTarget_4"  />
	</td>
   <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="4" Table="Diagnostics" Runat="server" id="DxResult_4"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_4"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="5"  ID="DxDateText_5" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="5" Runat="server" ID="DxDate_5" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="5" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="5" Table="Diagnostics" Runat="server" id="DxTarget_5"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="5" Table="Diagnostics" Runat="server" id="DxResult_5"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_5"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="6"  ID="DxDateText_6" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="6" Runat="server" ID="DxDate_6" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="6" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_6"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="6" Table="Diagnostics" Runat="server" id="DxTarget_6"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="6" Table="Diagnostics" Runat="server" id="DxResult_6"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_6"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="7"  ID="DxDateText_7" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="7" Runat="server" ID="DxDate_7" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="7" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_7"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="7" Table="Diagnostics" Runat="server" id="DxTarget_7"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="7" Table="Diagnostics" Runat="server" id="DxResult_7"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_7"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="8"  ID="DxDateText_8" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="8" Runat="server" ID="DxDate_8" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="8" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_8"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="8" Table="Diagnostics" Runat="server" id="DxTarget_8"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="8" Table="Diagnostics" Runat="server" id="DxResult_8"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_8"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="9"  ID="DxDateText_9" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="9" Runat="server" ID="DxDate_9" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="9" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_9"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="9" Table="Diagnostics" Runat="server" id="DxTarget_9"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="9" Table="Diagnostics" Runat="server" id="DxResult_9"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_9"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="10"  ID="DxDateText_10" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="10" Runat="server" ID="DxDate_10" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="10" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_10"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="10" Table="Diagnostics" Runat="server" id="DxTarget_10"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="10" Table="Diagnostics" Runat="server" id="DxResult_10"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_10"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="11"  ID="DxDateText_11" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="11" Runat="server" ID="DxDate_11" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="11" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_11"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="11" Table="Diagnostics" Runat="server" id="DxTarget_11"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="11" Table="Diagnostics" Runat="server" id="DxResult_11"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_11"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="12"  ID="DxDateText_12" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="12" Runat="server" ID="DxDate_12" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="12" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_12"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="12" Table="Diagnostics" Runat="server" id="DxTarget_12"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="12" Table="Diagnostics" Runat="server" id="DxResult_12"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_12"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="13"  ID="DxDateText_13" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="13" Runat="server" ID="DxDate_13" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="13" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_13"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="13" Table="Diagnostics" Runat="server" id="DxTarget_13"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="13" Table="Diagnostics" Runat="server" id="DxResult_13"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_13"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="14"  ID="DxDateText_14" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="14" Runat="server" ID="DxDate_14" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="14" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_14"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="14" Table="Diagnostics" Runat="server" id="DxTarget_14"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="14" Table="Diagnostics" Runat="server" id="DxResult_14"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_14"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="15"  ID="DxDateText_15" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="15" Runat="server" ID="DxDate_15" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  RecordId="15" LookupCode="DxType,Disease,@DiseaseView" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_15"/>
	</td>
     <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"  LookupCode="DxTarget,Disease,@DiseaseView"  style="width:100;" Field="DxTarget" RecordId="15" Table="Diagnostics" Runat="server" id="DxTarget_15"  />
	</td>
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="auto"   LookupCode="DxResult,Disease,@DiseaseView" style="width:140;" Field="DxResult" RecordId="15" Table="Diagnostics" Runat="server" id="DxResult_15"  />
	</td>
    <td align="center">
		<euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="Diagnostics" FIELD="DxNotes" ShowTextEditor="True" Runat="server" ID="DxNotes_15"/>
	</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DiagnosticsHtmlTable');" />
<br/><br/>
<br/>
