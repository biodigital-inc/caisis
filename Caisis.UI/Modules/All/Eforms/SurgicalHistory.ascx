<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.SurgicalHistory" CodeFile="SurgicalHistory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ProceduresHtmlTable = "ProceduresHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="SurgicalHistory" /><span class="controlBoxTitle">Surgical History </span><br>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SurgeriesHtmlTable">
  <tr> 
    <td width="18%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Surgery Type </td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result(?)</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="rptSurgicalHistory" runat="server" OnItemDataBound="ChronListItemDataBound"> 
	<ItemTemplate> 
		<tr id="SurgicalHistoryRow" runat="server" class="ClinicalEformPopulatedRowNonClickable" > 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<asp:Literal ID="ChronListDateField" Runat="server" /></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "varName") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "varValue") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr id="NoSurgicalHistoryMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No prior surgical procedures have been recorded for this patient.</td>
  </tr> 
  
  
</table>
<br/>
<div id="AddProstatectomyDiv" runat="server" >
<a name="Prostatectomy" /><span class="controlBoxTitle" style="font-size: 11px;">Add Prostatectomy</span><br>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProstatectomyHtmlTable">
  <tr> 
    <td width="18%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Prostatectomy Type </td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Surgeon</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne" style="white-space: nowrap;">&nbsp;<euc:EformTextBox Runat="server" RecordId="1"  ID="ProcDateText_1" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /><euc:EformHidden RecordId="1" Runat="server" ID="ProcDate_1" Table="Procedures" Field="ProcDate" /></td>
    <td valign="baseline" nowrap>
	
	<euc:EformSelect  LookupCode="OpTypeProstatectomy"  DropDownWidth="90" DropDownHeight="auto"   TABLE="Procedures" FIELD="ProcName" id="OpType_Prostatectomy"  runat="server" RecordId="1"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformComboBox   LookupCode="OpSurgeon" RefBy="CaseSurgeon" style="width:100;" Field="ProcSurgeon" RecordId="1" Table="Procedures" Runat="server" id="ProstatectomySurgeon"  /></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
</table>
<br/>
</div>


<%-- 
<div id="AddNeuralStimDiv" runat="server" >
<a name="NeuralStimulation" /><span class="controlBoxTitle" style="font-size: 11px;">Add Neural Stimulation</span><br>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="NeuralStimulationHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;Site</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;&nbsp;Max Response </td>
    <td align="center" class="controlBoxDataGridHeaderFirstCol">mA</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr >
    <td  class="ClinicalEformGridColumnOne"><euc:EFormSelect LookupCode="ProstateSide" runat="server" ID="ProcNS_Side_1" TABLE="ProcNeuralStimulations" FIELD="ProcNS_Side" RecordId="1"/></td>
    <td class="controlBoxDataGridTable">&nbsp;&nbsp;<euc:EFormSelect LookupCode="ProcNS_Site"  runat="server" ID="ProcNS_Site_1" TABLE="ProcNeuralStimulations" FIELD="ProcNS_Site" RecordId="1"/></td>
    <td class="controlBoxDataGridTable" ><euc:EformTextBox style="width:80" ID="ProcNS_Movement_1"  TABLE="ProcNeuralStimulations" FIELD="ProcNS_Movement" RecordId="1" class="InputText"  ShowNumberPad="true"  runat="server"></euc:EFormTextBox></td>
    <td align="center" class="controlBoxDataGridTable" ><euc:EformTextBox style="width:80" ID="ProcNS_mA_1"  TABLE="ProcNeuralStimulations" FIELD="ProcNS_mA" RecordId="1" class="InputText"  ShowNumberPad="true"  runat="server"></euc:EFormTextBox></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td class="ClinicalEformGridColumnOne"><euc:EFormSelect LookupCode="ProstateSide" runat="server" ID="ProcNS_Side_2" TABLE="ProcNeuralStimulations" FIELD="ProcNS_Side" RecordId="2"/></td>
    <td class="controlBoxDataGridTable">&nbsp;&nbsp;<euc:EFormSelect LookupCode="ProcNS_Site" runat="server" ID="ProcNS_Site_2" TABLE="ProcNeuralStimulations" FIELD="ProcNS_Site" RecordId="2"/></td>
    <td class="controlBoxDataGridTable" ><euc:EformTextBox style="width:80" ID="ProcNS_Movement_2"  TABLE="ProcNeuralStimulations" FIELD="ProcNS_Movement" RecordId="2" class="InputText"  ShowNumberPad="true"  runat="server"></euc:EFormTextBox></td>
    <td align="center" class="controlBoxDataGridTable" ><euc:EformTextBox style="width:80" ID="ProcNS_mA_2"  TABLE="ProcNeuralStimulations" FIELD="ProcNS_mA" RecordId="2" class="InputText"  ShowNumberPad="true"  runat="server"></euc:EFormTextBox></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td class="ClinicalEformGridColumnOne"><euc:EFormSelect LookupCode="ProstateSide" runat="server" ID="ProcNS_Side_3" TABLE="ProcNeuralStimulations" FIELD="ProcNS_Side" RecordId="3"/></td>
    <td class="controlBoxDataGridTable">&nbsp;&nbsp;<euc:EFormSelect LookupCode="ProcNS_Site" runat="server" ID="ProcNS_Site_3" TABLE="ProcNeuralStimulations" FIELD="ProcNS_Site" RecordId="3"/></td>
    <td class="controlBoxDataGridTable" ><euc:EformTextBox style="width:80" ID="ProcNS_Movement_3"  TABLE="ProcNeuralStimulations" FIELD="ProcNS_Movement" RecordId="3" class="InputText"  ShowNumberPad="true"  runat="server"></euc:EFormTextBox></td>
    <td align="center" class="controlBoxDataGridTable" ><euc:EformTextBox style="width:80" ID="ProcNS_mA_3"  TABLE="ProcNeuralStimulations" FIELD="ProcNS_mA" RecordId="3" class="InputText"  ShowNumberPad="true"  runat="server"></euc:EFormTextBox></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td class="ClinicalEformGridColumnOne"><euc:EFormSelect LookupCode="ProstateSide" runat="server" ID="ProcNS_Side_4" TABLE="ProcNeuralStimulations" FIELD="ProcNS_Side" RecordId="4"/></td>
    <td class="controlBoxDataGridTable">&nbsp;&nbsp;<euc:EFormSelect LookupCode="ProcNS_Site" runat="server" ID="ProcNS_Site_4" TABLE="ProcNeuralStimulations" FIELD="ProcNS_Site" RecordId="4"/></td>
    <td class="controlBoxDataGridTable" ><euc:EformTextBox style="width:80" ID="ProcNS_Movement_4"  TABLE="ProcNeuralStimulations" FIELD="ProcNS_Movement" RecordId="4" class="InputText"  ShowNumberPad="true"  runat="server"></euc:EFormTextBox></td>
    <td align="center" class="controlBoxDataGridTable" ><euc:EformTextBox style="width:80" ID="ProcNS_mA_4"  TABLE="ProcNeuralStimulations" FIELD="ProcNS_mA" RecordId="4" class="InputText"  ShowNumberPad="true"  runat="server"></euc:EFormTextBox></td> 
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
</table>
<br/>
</div>
--%>



<a name="SurgicalHistory" /><span class="controlBoxTitle" style="font-size: 11px;">Add Surgical Procedures</span><br>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresHtmlTable">
  <tr> 
    <td width="18%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Procedure Type </td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Side</td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <%--  removing this row because prostatectomy needs to use a procedures record now
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
		 </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox   LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="1" Table="Procedures" Runat="server" id="ProcName_1"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_1"  runat="server" RecordId="1" /></td>
    <td  style="white-space: nowrap;">&nbsp;
	
	<euc:EformTextBox  RecordId="1" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_1"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  --%>
  
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="2"  ID="ProcDateText_2" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="2" Runat="server" ID="ProcDate_2" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"    LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="2" Table="Procedures" MaxLength="50"  Runat="server" id="ProcName_2"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect style="width:65px;"  LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_2"  runat="server" RecordId="2" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="2" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_2"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="3"  ID="ProcDateText_3" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="3" Runat="server" ID="ProcDate_3" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"    LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="3" Table="Procedures" MaxLength="50"  Runat="server" id="ProcName_3"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect style="width:65px;"  LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_3"  runat="server" RecordId="3" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="3" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_3"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="4"  ID="ProcDateText_4" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="4" Runat="server" ID="ProcDate_4" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"    LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="4" Table="Procedures" MaxLength="50"  Runat="server" id="ProcName_4"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_4"  runat="server" RecordId="4" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="4" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_4"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="5"  ID="ProcDateText_5" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="5" Runat="server" ID="ProcDate_5" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"    LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="5" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_5"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_5"  runat="server" RecordId="5" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="5" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_5"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="6"  ID="ProcDateText_6" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="6" Runat="server" ID="ProcDate_6" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"    LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="6" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_6"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_6"  runat="server" RecordId="6" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="6" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_6"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="7"  ID="ProcDateText_7" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="7" Runat="server" ID="ProcDate_7" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"    LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="7" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_7"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_7"  runat="server" RecordId="7" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="7" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_7"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="8"  ID="ProcDateText_8" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="8" Runat="server" ID="ProcDate_8" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"    LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="8" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_8"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_8"  runat="server" RecordId="8" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="8" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_8"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="9"  ID="ProcDateText_9" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="9" Runat="server" ID="ProcDate_9" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"    LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="9" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_9"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_9"  runat="server" RecordId="9" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="9" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_9"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="10"  ID="ProcDateText_10" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="10" Runat="server" ID="ProcDate_10" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"    LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="10" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_10"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_10"  runat="server" RecordId="10" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="10" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_10"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
   <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">&nbsp;<euc:EformTextBox Runat="server" RecordId="11"  ID="ProcDateText_11" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="11" Runat="server" ID="ProcDate_11" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="auto"    LookupCode="ProcName" RefBy="ProcName" style="width:150;" Field="ProcName" RecordId="11" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_11"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformSelect  style="width:65px;" LookupCode="OpSide"  DropDownWidth="90" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide"  id="ProcSide_12"  runat="server" RecordId="11" /></td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="11" ShowCalendar="False" CalcDate="False" style="width:190px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_11"/></td>
    <td align="center">&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
</table>
<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProceduresHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
<br/>
<br/><br/>
