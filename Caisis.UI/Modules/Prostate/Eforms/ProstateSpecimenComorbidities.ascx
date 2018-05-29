<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenComorbidities" CodeFile="ProstateSpecimenComorbidities.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.ComorbiditiesHtmlTable = "ComorbiditiesHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="ProstateSpecimenComorbidities" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Comorbidities"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComorbiditiesHtmlTable">
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="50%" class="controlBoxDataGridHeaderFirstCol">Comorbidity</td>
    <td width="25%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="genComorbidities" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Comorbidities', <%# DataBinder.Eval(Container.DataItem, "ComorbidityId") %>, 'ComorbDateText,ComorbDate,Comorbidity,ComorbNotes','Comorbidities');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ComorbNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  

  <tr id="ComorbRow_1" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_1" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CoronaryArteryDisease" Value="Coronary Artery Disease" RecordId="1" /> Coronary Artery Disease </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_1" Runat="server" />
        <euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_1"/></td>
    <td><euc:EformDeleteIcon ID="Delete_1" runat="server"/></td>
  </tr>    
  <tr id="ComorbRow_2" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_2" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_MyocardialInfarction" Value="Myocardial Infarction" RecordId="2" /> Myocardial Infarction </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_2" Runat="server" />
        <euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_2"/></td>
    <td><euc:EformDeleteIcon ID="Delete_2" runat="server"/></td>
  </tr>
    <tr id="ComorbRow_3" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_3" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hypertension" Value="Hypertension" RecordId="3" /> Hypertension </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_3" Runat="server" />
        <euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_3"/></td>
    <td><euc:EformDeleteIcon ID="Delete_3" runat="server"/></td>
  </tr> 
    <tr id="ComorbRow_4" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_4" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CVA" Value="CVA" RecordId="4" /> CVA </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_4" Runat="server" />
        <euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_4"/></td>
    <td><euc:EformDeleteIcon ID="Delete_4" runat="server"/></td>
  </tr>  
  <tr id="ComorbRow_5" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_5" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="5"  ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_ThromboembolicEventsDVT" Value="Thromboembolic Events / DVT" RecordId="5" /> Thromboembolic Events / DVT </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_5" Runat="server" />
        <euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_5"/></td>
    <td><euc:EformDeleteIcon ID="Delete_5" runat="server"/></td>
  </tr>   
  <tr id="ComorbRow_6" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_6" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="6"  ID="ComorbDateText_6" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="6" Runat="server" ID="ComorbDate_6" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Asthma" Value="Asthma" RecordId="6" /> Asthma </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_6" Runat="server" />
        <euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_6"/></td>
    <td><euc:EformDeleteIcon ID="Delete_6" runat="server"/></td>
  </tr>    
  <tr id="ComorbRow_7" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_7" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="7"  ID="ComorbDateText_7" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="7" Runat="server" ID="ComorbDate_7" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_DiabetesIDDM" Value="Diabetes (IDDM)" RecordId="7" /> Diabetes (IDDM) </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_7" Runat="server" />
        <euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_7"/></td>
    <td><euc:EformDeleteIcon ID="Delete_7" runat="server"/></td>
  </tr> 
  <tr id="ComorbRow_8" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_8" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="8"  ID="ComorbDateText_8" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="8" Runat="server" ID="ComorbDate_8" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_DiabetesNIDDM" Value="Diabetes (NIDDM)" RecordId="8" /> Diabetes (NIDDM) </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_8" Runat="server" />
        <euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_8"/></td>
    <td><euc:EformDeleteIcon ID="Delete_8" runat="server"/></td>
  </tr>   
    <tr id="ComorbRow_9" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_9" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="9"  ID="ComorbDateText_9" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="9" Runat="server" ID="ComorbDate_9" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hypercholesterolemia" Value="Hypercholesterolemia" RecordId="9" /> Hypercholesterolemia </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_9" Runat="server" />
        <euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_9"/></td>
    <td><euc:EformDeleteIcon ID="Delete_9" runat="server"/></td>
  </tr> 
  <tr id="ComorbRow_10" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_10" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="10"  ID="ComorbDateText_10" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="10" Runat="server" ID="ComorbDate_10" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Depression" Value="Depression" RecordId="10" /> Depression </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_10" Runat="server" />
        <euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_10"/></td>
    <td><euc:EformDeleteIcon ID="Delete_10" runat="server"/></td>
  </tr>
  
  <tr > 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Other</td>
    <td width="50%" class="controlBoxDataGridHeaderFirstCol"></td>
    <td width="25%" class="controlBoxDataGridHeaderFirstCol"></td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
 
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="11"  ID="ComorbDateText_21" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="11" Runat="server" ID="ComorbDate_21" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="11" Table="Comorbidities" Runat="server" ID="Comorbidity_21"  /></td>
    <td align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_21"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="12"  ID="ComorbDateText_22" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="12" Runat="server" ID="ComorbDate_22" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="12" Table="Comorbidities" Runat="server" ID="Comorbidity_22"  /></td>
    <td align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_22"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="13"  ID="ComorbDateText_23" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="13" Runat="server" ID="ComorbDate_23" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="13" Table="Comorbidities" Runat="server" ID="Comorbidity_23"  /></td>
    <td align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_23"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="14"  ID="ComorbDateText_24" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="14" Runat="server" ID="ComorbDate_24" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="14" Table="Comorbidities" Runat="server" ID="Comorbidity_24"  /></td>
    <td align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_24"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="15"  ID="ComorbDateText_25" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="15" Runat="server" ID="ComorbDate_25" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="15" Table="Comorbidities" Runat="server" ID="Comorbidity_25"  /></td>
    <td align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_25"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesHtmlTable');" />
<br/><br/>
<br/>
