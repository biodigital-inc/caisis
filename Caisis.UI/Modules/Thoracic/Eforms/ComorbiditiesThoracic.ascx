<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.ComorbiditiesThoracic" CodeFile="ComorbiditiesThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.ComorbiditiesHtmlTable = "ComorbiditiesHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ComorbiditiesThoracic" /><span class="controlBoxTitle">Comorbidities</span> <br/>

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComorbiditiesHtmlTable">
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="50%" class="controlBoxDataGridHeaderFirstCol">Comorbidity</td>
    <td width="25%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>  
  
  
  <asp:Repeater ID="comorbidities" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Comorbidities', <%# DataBinder.Eval(Container.DataItem, "ComorbidityId") %>, 'ComorbDateText,ComorbDate,Comorbidity,ComorbNotes','Comorbidities');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ComorbNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_1" Value="Asthma" RecordId="1" />Asthma</td>
    <td align="center"><euc:EformTextBox RecordId="1" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_1" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="1" ID="ComorbQuality_1" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_2" Value="Chronic Obstructive Pulmonary Disease" RecordId="2" />Chronic Obstructive Pulmonary Disease(COPD)</td>
    <td align="center"><euc:EformTextBox RecordId="2" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_2" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="2" ID="ComorbQuality_2" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_3" Value="Tuberculosis" RecordId="3" />Tuberculosis</td>
    <td align="center"><euc:EformTextBox RecordId="3" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_3" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="3" ID="ComorbQuality_3" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_4" Value="Pulmonary Fibrosis" RecordId="4" />Pulmonary Fibrosis</td>
    <td align="center"><euc:EformTextBox RecordId="4" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_4" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="4" ID="ComorbQuality_4" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="5"  ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_5" Value="Cystic Fibrosis" RecordId="5" />Cystic Fibrosis</td>
    <td align="center"><euc:EformTextBox RecordId="5" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_5" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="5" ID="ComorbQuality_5" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="6"  ID="ComorbDateText_6" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="6" Runat="server" ID="ComorbDate_6" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_6" Value="α-1-AT" RecordId="6" />α-1-AT</td>
    <td align="center"><euc:EformTextBox RecordId="6" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_6" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="6" ID="ComorbQuality_6" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr><td height="10" colspan="4"><hr /></td></tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="7"  ID="ComorbDateText_7" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="7" Runat="server" ID="ComorbDate_7" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_7" Value="Hypertension" RecordId="7" />Hypertension</td>
    <td align="center"><euc:EformTextBox RecordId="7" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_7" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="7" ID="ComorbQuality_7" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="14"  ID="ComorbDateText_14" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="14" Runat="server" ID="ComorbDate_14" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_14" Value="Afib" RecordId="14" />Afib</td>
    <td align="center"><euc:EformTextBox RecordId="14" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_14" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="14" ID="ComorbQuality_14" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="15"  ID="ComorbDateText_15" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="15" Runat="server" ID="ComorbDate_15" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_15" Value="Coronary Artery Disease" RecordId="15" />Coronary Artery Disease</td>
    <td align="center"><euc:EformTextBox RecordId="15" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_15" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="15" ID="ComorbQuality_15" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="16"  ID="ComorbDateText_16" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="16" Runat="server" ID="ComorbDate_16" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_16" Value="Angina" RecordId="16" />Angina</td>
    <td align="center"><euc:EformTextBox RecordId="16" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_16" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="16" ID="ComorbQuality_16" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="17"  ID="ComorbDateText_17" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="17" Runat="server" ID="ComorbDate_17" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_17" Value="Chronic Heart Failure" RecordId="17" />Chronic Heart Failure</td>
    <td align="center"><euc:EformTextBox RecordId="17" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_17" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="17" ID="ComorbQuality_17" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="18"  ID="ComorbDateText_18" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="18" Runat="server" ID="ComorbDate_18" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_18" Value="CABG" RecordId="18" />CABG</td>
    <td align="center"><euc:EformTextBox RecordId="18" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_18" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="18" ID="ComorbQuality_18" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="19"  ID="ComorbDateText_19" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="19" Runat="server" ID="ComorbDate_19" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_19" Value="PCTA" RecordId="19" />PCTA</td>
    <td align="center"><euc:EformTextBox RecordId="19" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_19" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="19" ID="ComorbQuality_19" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="20"  ID="ComorbDateText_20" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="20" Runat="server" ID="ComorbDate_20" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_20" Value="Valve" RecordId="20" />Valve</td>
    <td align="center"><euc:EformTextBox RecordId="20" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_20" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="20" ID="ComorbQuality_20" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="21"  ID="ComorbDateText_21" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="21" Runat="server" ID="ComorbDate_21" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_21" Value="Myocardial Infarction" RecordId="21" />Myocardial Infarction</td>
    <td align="center"><euc:EformTextBox RecordId="21" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_21" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="21" ID="ComorbQuality_21" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr><td height="10" colspan="4"><hr /></td></tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="22"  ID="ComorbDateText_22" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="22" Runat="server" ID="ComorbDate_22" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_22" Value="IDDM" RecordId="22" />IDDM</td>
    <td align="center"><euc:EformTextBox RecordId="22" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_22" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="22" ID="ComorbQuality_22" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="23"  ID="ComorbDateText_23" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="23" Runat="server" ID="ComorbDate_23" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_23" Value="NIDDM" RecordId="23" />NIDDM</td>
    <td align="center"><euc:EformTextBox RecordId="23" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_23" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="23" ID="ComorbQuality_23" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr><td height="10" colspan="4"><hr /></td></tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="24"  ID="ComorbDateText_24" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="24" Runat="server" ID="ComorbDate_24" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_24" Value="Acute Renal Failure" RecordId="24" />Acute Renal Failure</td>
    <td align="center"><euc:EformTextBox RecordId="24" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_24" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="24" ID="ComorbQuality_24" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="25"  ID="ComorbDateText_25" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="25" Runat="server" ID="ComorbDate_25" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_25" Value="Chonic Renal Insufficiency" RecordId="25" />Chonic Renal Insufficiency</td>
    <td align="center"><euc:EformTextBox RecordId="25" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_25" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="25" ID="ComorbQuality_25" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="8"  ID="ComorbDateText_8" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="8" Runat="server" ID="ComorbDate_8" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformComboBox  LookupCode="Comorbidity" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_8" RecordId="8" /></td>
    <td align="center"><euc:EformTextBox RecordId="8" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_8" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="8" ID="ComorbQuality_8" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="9"  ID="ComorbDateText_9" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="9" Runat="server" ID="ComorbDate_9" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformComboBox  LookupCode="Comorbidity" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_9" RecordId="9" /></td>
    <td align="center"><euc:EformTextBox RecordId="9" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_9" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="9" ID="ComorbQuality_9" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="10"  ID="ComorbDateText_10" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="10" Runat="server" ID="ComorbDate_10" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformComboBox  LookupCode="Comorbidity" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_10" RecordId="10" /></td>
    <td align="center"><euc:EformTextBox RecordId="10" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_10" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="10" ID="ComorbQuality_10" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="11"  ID="ComorbDateText_11" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="11" Runat="server" ID="ComorbDate_11" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformComboBox  LookupCode="Comorbidity" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_11" RecordId="11" /></td>
    <td align="center"><euc:EformTextBox RecordId="11" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_11" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="11" ID="ComorbQuality_11" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="12"  ID="ComorbDateText_12" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="12" Runat="server" ID="ComorbDate_12" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformComboBox  LookupCode="Comorbidity" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_12" RecordId="12" /></td>
    <td align="center"><euc:EformTextBox RecordId="12" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_12" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="12" ID="ComorbQuality_12" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	
	<euc:EformTextBox Runat="server" RecordId="13"  ID="ComorbDateText_13" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="13" Runat="server" ID="ComorbDate_13" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformComboBox  LookupCode="Comorbidity" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_13" RecordId="13" /></td>
    <td align="center"><euc:EformTextBox RecordId="13" width="100px" ShowTextEditor="true" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_13" />
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="13" ID="ComorbQuality_13" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  </table>  
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesHtmlTable');" />
<br/><br/><br />

<script type="text/javascript">
    //Adds events to controls
    function addEvents(comorDateTxt,comor,comorNotes,comorQlty)
    { 
        $(comorDateTxt).addEvent('blur',curry(AutoPopulates,comorDateTxt,comor,comorNotes,comorQlty));
        $(comor).addEvent('blur',curry(AutoPopulates,comorDateTxt,comor,comorNotes,comorQlty));
        $(comor).addEvent('click',curry(updateQltyonChk,comor,comorQlty));
        $(comorNotes).addEvent('blur',curry(AutoPopulates,comorDateTxt,comor,comorNotes,comorQlty));
    }
 
    addEvents($('<%= ComorbDateText_1.ClientID %>'),$('<%= Comorbidity_1.ClientID %>'),$('<%= ComorbNotes_1.ClientID %>'),$('<%= ComorbQuality_1.ClientID %>'));
    addEvents($('<%= ComorbDateText_2.ClientID %>'),$('<%= Comorbidity_2.ClientID %>'),$('<%= ComorbNotes_2.ClientID %>'),$('<%= ComorbQuality_2.ClientID %>'));
    addEvents($('<%= ComorbDateText_3.ClientID %>'),$('<%= Comorbidity_3.ClientID %>'),$('<%= ComorbNotes_3.ClientID %>'),$('<%= ComorbQuality_3.ClientID %>'));
    addEvents($('<%= ComorbDateText_4.ClientID %>'),$('<%= Comorbidity_4.ClientID %>'),$('<%= ComorbNotes_4.ClientID %>'),$('<%= ComorbQuality_4.ClientID %>'));
    addEvents($('<%= ComorbDateText_5.ClientID %>'),$('<%= Comorbidity_5.ClientID %>'),$('<%= ComorbNotes_5.ClientID %>'),$('<%= ComorbQuality_5.ClientID %>'));
    addEvents($('<%= ComorbDateText_6.ClientID %>'),$('<%= Comorbidity_6.ClientID %>'),$('<%= ComorbNotes_6.ClientID %>'),$('<%= ComorbQuality_6.ClientID %>'));
    addEvents($('<%= ComorbDateText_7.ClientID %>'),$('<%= Comorbidity_7.ClientID %>'),$('<%= ComorbNotes_7.ClientID %>'),$('<%= ComorbQuality_7.ClientID %>'));
    addEvents($('<%= ComorbDateText_8.ClientID %>'),$('<%= Comorbidity_8.ClientID %>'),$('<%= ComorbNotes_8.ClientID %>'),$('<%= ComorbQuality_8.ClientID %>'));
    addEvents($('<%= ComorbDateText_9.ClientID %>'),$('<%= Comorbidity_9.ClientID %>'),$('<%= ComorbNotes_9.ClientID %>'),$('<%= ComorbQuality_9.ClientID %>'));
    addEvents($('<%= ComorbDateText_10.ClientID %>'),$('<%= Comorbidity_10.ClientID %>'),$('<%= ComorbNotes_10.ClientID %>'),$('<%= ComorbQuality_10.ClientID %>'));
    addEvents($('<%= ComorbDateText_11.ClientID %>'),$('<%= Comorbidity_11.ClientID %>'),$('<%= ComorbNotes_11.ClientID %>'),$('<%= ComorbQuality_11.ClientID %>'));
    addEvents($('<%= ComorbDateText_12.ClientID %>'),$('<%= Comorbidity_12.ClientID %>'),$('<%= ComorbNotes_12.ClientID %>'),$('<%= ComorbQuality_12.ClientID %>'));
    addEvents($('<%= ComorbDateText_13.ClientID %>'),$('<%= Comorbidity_13.ClientID %>'),$('<%= ComorbNotes_13.ClientID %>'),$('<%= ComorbQuality_13.ClientID %>'));
    addEvents($('<%= ComorbDateText_14.ClientID %>'),$('<%= Comorbidity_14.ClientID %>'),$('<%= ComorbNotes_14.ClientID %>'),$('<%= ComorbQuality_14.ClientID %>'));
    addEvents($('<%= ComorbDateText_15.ClientID %>'),$('<%= Comorbidity_15.ClientID %>'),$('<%= ComorbNotes_15.ClientID %>'),$('<%= ComorbQuality_15.ClientID %>'));
    addEvents($('<%= ComorbDateText_16.ClientID %>'),$('<%= Comorbidity_16.ClientID %>'),$('<%= ComorbNotes_16.ClientID %>'),$('<%= ComorbQuality_16.ClientID %>'));
    addEvents($('<%= ComorbDateText_17.ClientID %>'),$('<%= Comorbidity_17.ClientID %>'),$('<%= ComorbNotes_17.ClientID %>'),$('<%= ComorbQuality_17.ClientID %>'));
    addEvents($('<%= ComorbDateText_18.ClientID %>'),$('<%= Comorbidity_18.ClientID %>'),$('<%= ComorbNotes_18.ClientID %>'),$('<%= ComorbQuality_18.ClientID %>'));
    addEvents($('<%= ComorbDateText_19.ClientID %>'),$('<%= Comorbidity_19.ClientID %>'),$('<%= ComorbNotes_19.ClientID %>'),$('<%= ComorbQuality_19.ClientID %>'));
    addEvents($('<%= ComorbDateText_20.ClientID %>'),$('<%= Comorbidity_20.ClientID %>'),$('<%= ComorbNotes_20.ClientID %>'),$('<%= ComorbQuality_20.ClientID %>'));
    addEvents($('<%= ComorbDateText_21.ClientID %>'),$('<%= Comorbidity_21.ClientID %>'),$('<%= ComorbNotes_21.ClientID %>'),$('<%= ComorbQuality_21.ClientID %>'));
    addEvents($('<%= ComorbDateText_22.ClientID %>'),$('<%= Comorbidity_22.ClientID %>'),$('<%= ComorbNotes_22.ClientID %>'),$('<%= ComorbQuality_22.ClientID %>'));
    addEvents($('<%= ComorbDateText_23.ClientID %>'),$('<%= Comorbidity_23.ClientID %>'),$('<%= ComorbNotes_23.ClientID %>'),$('<%= ComorbQuality_23.ClientID %>'));
    addEvents($('<%= ComorbDateText_24.ClientID %>'),$('<%= Comorbidity_24.ClientID %>'),$('<%= ComorbNotes_24.ClientID %>'),$('<%= ComorbQuality_24.ClientID %>'));
    addEvents($('<%= ComorbDateText_25.ClientID %>'),$('<%= Comorbidity_25.ClientID %>'),$('<%= ComorbNotes_25.ClientID %>'),$('<%= ComorbQuality_25.ClientID %>'));  


    function AutoPopulates(comorDateTxt,comor,comorNotes,comorQlty)
    {
       if (comorDateTxt.value != '' || comor.value != '' || comorNotes.value != '')
        {
           comorQlty.value = 'STD';
        }
        else
        {
            comorQlty.value = '';
        }
    }
    
    function updateQltyonChk(comor,comorQlty)
    {
        if(comor.checked==true)
        {
            comorQlty.value = 'STD';
        }
        else
        {
            comorQlty.value = '';
        }
    }
</script>