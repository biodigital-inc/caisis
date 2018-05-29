<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandComorbidities" CodeFile="SalivaryGlandComorbidities.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.SalivaryGlandComorbiditiesHtmlTable = "SalivaryGlandComorbiditiesHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="SalivaryGlandComorbidities" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Comorbidities"></asp:Label><br/>
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SalivaryGlandComorbiditiesHtmlTable">
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="50%" class="controlBoxDataGridHeaderFirstCol">Comorbidity</td>
    <td width="25%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="genComorbidities" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Comorbidities', <%# DataBinder.Eval(Container.DataItem, "ComorbidityId") %>, 'ComorbDateText,ComorbDate,Comorbidity,ComorbQuality','Comorbidities');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ComorbQuality")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  

  <tr id="ComorbRow_1" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_1" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_1"  />
	    <euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_MI" Value="MI" RecordId="1" /> MI </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_1" Runat="server" />
        <euc:EformTextBox RecordId="1" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_1" EnableHiddenOnUIEvent="ComorbQuality_1"/>
        <euc:EformHidden Enabled="false" RecordId="1" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_1" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_1" runat="server"/></td>
  </tr>    
  <tr id="ComorbRow_2" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_2" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_2" />
	    <euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_COPD" Value="COPD" RecordId="2" /> COPD </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_2" Runat="server" />
        <euc:EformTextBox RecordId="2" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_2" EnableHiddenOnUIEvent="ComorbQuality_2"/>
        <euc:EformHidden Enabled="false" RecordId="2" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_2" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_2" runat="server"/></td>
  </tr>
    <tr id="ComorbRow_3" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_3" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_3" />
	    <euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CHF" Value="CHF" RecordId="3" /> CHF </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_3" Runat="server" />
        <euc:EformTextBox RecordId="3" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_3" EnableHiddenOnUIEvent="ComorbQuality_3"/>
        <euc:EformHidden Enabled="false" RecordId="3" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_3" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_3" runat="server"/></td>
  </tr> 
    <tr id="ComorbRow_4" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_4" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_4" />
	    <euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_PipticUlcer" Value="Peptic Ulcer" RecordId="4" /> Peptic Ulcer </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_4" Runat="server" />
        <euc:EformTextBox RecordId="4" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_4" EnableHiddenOnUIEvent="ComorbQuality_4"/>
        <euc:EformHidden Enabled="false" RecordId="4" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_4" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_4" runat="server"/></td>
  </tr>  
  <tr id="ComorbRow_5" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_5" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="5"  ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_5"  />
	    <euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_PeripheralVD" Value="Peripheral Vascular Disease" RecordId="5" /> Peripheral Vascular Disease </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_5" Runat="server" />
        <euc:EformTextBox RecordId="5" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_5" EnableHiddenOnUIEvent="ComorbQuality_5"/>
        <euc:EformHidden Enabled="false" RecordId="5" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_5" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_5" runat="server"/></td>
  </tr>   
  <tr id="ComorbRow_6" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_6" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="6"  ID="ComorbDateText_6" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_6" />
	    <euc:EformHidden RecordId="6" Runat="server" ID="ComorbDate_6" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_MildLiverDisease" Value="Mild Liver Disease" RecordId="6" /> Mild Liver Disease </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_6" Runat="server" />
        <euc:EformTextBox RecordId="6" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_6" EnableHiddenOnUIEvent="ComorbQuality_6"/>
        <euc:EformHidden Enabled="false" RecordId="6" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_6" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_6" runat="server"/></td>
  </tr>    
  <tr id="ComorbRow_7" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_7" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="7"  ID="ComorbDateText_7" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_7"  />
	    <euc:EformHidden RecordId="7" Runat="server" ID="ComorbDate_7" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_ModerateToSevereLiverDisease" Value="Moderate to Severe Liver Disease" RecordId="7" /> Moderate to Severe Liver Disease </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_7" Runat="server" />
        <euc:EformTextBox RecordId="7" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_7" EnableHiddenOnUIEvent="ComorbQuality_7"/>
        <euc:EformHidden Enabled="false" RecordId="7" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_7" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_7" runat="server"/></td>
  </tr> 
  <tr id="ComorbRow_8" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_8" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="8"  ID="ComorbDateText_8" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="ComorbQuality_8" />
	    <euc:EformHidden ecordId="8" Runat="server" ID="ComorbDate_8" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CVA" Value="CVA" RecordId="8" /> CVA </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_8" Runat="server" />
        <euc:EformTextBox RecordId="8" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_8" EnableHiddenOnUIEvent="ComorbQuality_8"/>
        <euc:EformHidden Enabled="false" RecordId="8" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_8" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_8" runat="server"/></td>
  </tr>   
    <tr id="ComorbRow_9" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_9" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="9"  ID="ComorbDateText_9" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_9" />
	    <euc:EformHidden RecordId="9" Runat="server" ID="ComorbDate_9" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Diabetes" Value="Diabetes" RecordId="9" /> Diabetes </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_9" Runat="server" />
        <euc:EformTextBox RecordId="9" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_9" EnableHiddenOnUIEvent="ComorbQuality_9"/>
        <euc:EformHidden Enabled="false" RecordId="9" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_9" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_9" runat="server"/></td>
  </tr> 
  <tr id="ComorbRow_10" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_10" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="10"  ID="ComorbDateText_10" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_10"  />
	    <euc:EformHidden ecordId="10" Runat="server" ID="ComorbDate_10" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Dementia" Value="Dementia" RecordId="10" /> Dementia </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_10" Runat="server" />
        <euc:EformTextBox RecordId="10" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_10" EnableHiddenOnUIEvent="ComorbQuality_10"/>
        <euc:EformHidden Enabled="false" RecordId="10" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_10" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_10" runat="server"/></td>
  </tr>
  <tr id="ComorbRow_11" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_11" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="11"  ID="ComorbDateText_11" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_11" />
	    <euc:EformHidden RecordId="11" Runat="server" ID="ComorbDate_11" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CAD" Value="CAD" RecordId="11" /> CAD </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_11" Runat="server" />
        <euc:EformTextBox RecordId="11" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_11" EnableHiddenOnUIEvent="ComorbQuality_11"/>
        <euc:EformHidden Enabled="false" RecordId="11" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_11" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_11" runat="server"/></td>
  </tr>
  <tr id="ComorbRow_12" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_12" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="12"  ID="ComorbDateText_12" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_12" />
	    <euc:EformHidden RecordId="12" Runat="server" ID="ComorbDate_12" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hemiplegia" Value="Hemiplegia" RecordId="12" /> Hemiplegia </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_12" Runat="server" />
        <euc:EformTextBox RecordId="12" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_12" EnableHiddenOnUIEvent="ComorbQuality_12"/>
        <euc:EformHidden Enabled="false" RecordId="12" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_12" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_12" runat="server"/></td>
  </tr>
  <tr id="ComorbRow_13" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_13" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="13"  ID="ComorbDateText_13" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_13" />
	    <euc:EformHidden RecordId="13" Runat="server" ID="ComorbDate_13" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Renaldis" Value="Moderate to Severe Renal dis." RecordId="13" /> Moderate to Severe Renal dis. </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_13" Runat="server" />
        <euc:EformTextBox RecordId="13" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_13" EnableHiddenOnUIEvent="ComorbQuality_13"/>
        <euc:EformHidden Enabled="false" RecordId="13" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_13" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_13" runat="server"/></td>
  </tr>
  <tr id="ComorbRow_14" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_14" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="14"  ID="ComorbDateText_14" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_14" />
	    <euc:EformHidden RecordId="14" Runat="server" ID="ComorbDate_14" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_DMwithOrganDamage" Value="DM with Organ Damage" RecordId="14" /> DM with Organ Damage </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_14" Runat="server" />
        <euc:EformTextBox RecordId="14" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_14" EnableHiddenOnUIEvent="ComorbQuality_14"/>
        <euc:EformHidden Enabled="false" RecordId="14" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_14" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_14" runat="server"/></td>
  </tr>
  <tr id="ComorbRow_15" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_15" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="15"  ID="ComorbDateText_15" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_15" />
	    <euc:EformHidden RecordId="15" Runat="server" ID="ComorbDate_15" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Leukemia" Value="Leukemia" RecordId="15" /> Leukemia </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_15" Runat="server" />
        <euc:EformTextBox RecordId="15" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_15" EnableHiddenOnUIEvent="ComorbQuality_15"/>
        <euc:EformHidden Enabled="false" RecordId="15" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_15" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_15" runat="server"/></td>
  </tr>
   <tr id="ComorbRow_16" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_16" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="16"  ID="ComorbDateText_16" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_16"  />
	    <euc:EformHidden RecordId="16" Runat="server" ID="ComorbDate_16" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Lymphoma" Value="Lymphoma" RecordId="16" /> Lymphoma </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_16" Runat="server" />
        <euc:EformTextBox RecordId="16" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_16" EnableHiddenOnUIEvent="ComorbQuality_16"/>
        <euc:EformHidden Enabled="false" RecordId="16" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_16" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_16" runat="server"/></td>
  </tr>
   <tr id="ComorbRow_17" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_17" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="17"  ID="ComorbDateText_17" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_17" />
	    <euc:EformHidden RecordId="17" Runat="server" ID="ComorbDate_17" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_MetastaticSolidTumor" Value="Metastatic Solid Tumor" RecordId="17" /> Metastatic Solid Tumor </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_17" Runat="server" />
        <euc:EformTextBox RecordId="17" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_17" EnableHiddenOnUIEvent="ComorbQuality_17"/>
        <euc:EformHidden Enabled="false" RecordId="17" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_17" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_17" runat="server"/></td>
  </tr>
   <tr id="ComorbRow_18" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_18" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="18"  ID="ComorbDateText_18" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_18" />
	    <euc:EformHidden RecordId="18" Runat="server" ID="ComorbDate_18" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_AIDS" Value="AIDS" RecordId="18" /> AIDS</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_18" Runat="server" />
        <euc:EformTextBox RecordId="18" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_18" EnableHiddenOnUIEvent="ComorbQuality_18"/>
        <euc:EformHidden Enabled="false" RecordId="18" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_18" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_18" runat="server"/></td>
  </tr>
  <tr id="ComorbRow_19" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_19" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="19"  ID="ComorbDateText_19" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_19" />
	    <euc:EformHidden RecordId="19" Runat="server" ID="ComorbDate_19" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hypertension" Value="Hypertension" RecordId="19" /> Hypertension </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_19" Runat="server" />
        <euc:EformTextBox RecordId="19" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_19" EnableHiddenOnUIEvent="ComorbQuality_19"/>
        <euc:EformHidden Enabled="false" RecordId="19" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_19" Value="OUT"/></td>
    <td><euc:EformDeleteIcon ID="Delete_19" runat="server"/></td>
  </tr>
<tr > 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Other</td>
    <td width="50%" class="controlBoxDataGridHeaderFirstCol"></td>
    <td width="25%" class="controlBoxDataGridHeaderFirstCol"></td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
 
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="20"  ID="ComorbDateText_20" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_20"  />
	<euc:EformHidden RecordId="20" Runat="server" ID="ComorbDate_20" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="20" Table="Comorbidities" Runat="server" ID="Comorbidity_20"  /></td>
    <td align="center">
        <euc:EformTextBox RecordId="20" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_20" EnableHiddenOnUIEvent="ComorbQuality_20"/>
        <euc:EformHidden Enabled="false" RecordId="20" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_20" Value="OUT"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="21"  ID="ComorbDateText_21" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_21" />
	<euc:EformHidden RecordId="21" Runat="server" ID="ComorbDate_21" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="21" Table="Comorbidities" Runat="server" ID="Comorbidity_21"  /></td>
    <td align="center">
        <euc:EformTextBox RecordId="21" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_21" EnableHiddenOnUIEvent="ComorbQuality_21"/>
        <euc:EformHidden Enabled="false" RecordId="21" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_21" Value="OUT"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="22"  ID="ComorbDateText_22" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_22" />
	<euc:EformHidden RecordId="22" Runat="server" ID="ComorbDate_22" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="22" Table="Comorbidities" Runat="server" ID="Comorbidity_22"  /></td>
    <td align="center">
        <euc:EformTextBox RecordId="22" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_22" EnableHiddenOnUIEvent="ComorbQuality_22"/>
        <euc:EformHidden Enabled="false" RecordId="22" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_22" Value="OUT"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="23"  ID="ComorbDateText_23" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ComorbQuality_23" />
	<euc:EformHidden RecordId="23" Runat="server" ID="ComorbDate_23" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="23" Table="Comorbidities" Runat="server" ID="Comorbidity_23"  /></td>
    <td align="center">
        <euc:EformTextBox RecordId="23" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_23" EnableHiddenOnUIEvent="ComorbQuality_23"/>
        <euc:EformHidden Enabled="false" RecordId="23" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_23" Value="OUT"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="24"  ID="ComorbDateText_24" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="ComorbQuality_24"/>
	<euc:EformHidden RecordId="24" Runat="server" ID="ComorbDate_24" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="24" Table="Comorbidities" Runat="server" ID="Comorbidity_24"  /></td>
    <td align="center">
        <euc:EformTextBox RecordId="24" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ShowTextEditor="true" ID="ComorbNotes_24" EnableHiddenOnUIEvent="ComorbQuality_24"/>
        <euc:EformHidden Enabled="false" RecordId="24" style="width:80px;" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" ID="ComorbQuality_24" Value="OUT"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SalivaryGlandComorbiditiesHtmlTable');" />
<br/><br/>
<br/>
