<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bone.Eforms.PatientsComorbiditiesOsteo" CodeFile="PatientsComorbiditiesOsteo.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.ComorbiditiesHtmlTable = "ComorbiditiesHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PatientsComorbiditiesOsteo" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Comorbidities"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComorbiditiesHtmlTable">
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="50%" class="controlBoxDataGridHeaderFirstCol">Comorbidity</td>
    <td width="25%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="osteoComorbidities" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Comorbidities', <%# DataBinder.Eval(Container.DataItem, "ComorbidityId") %>, 'ComorbDateText,ComorbDate,Comorbidity,ComorbNotes','Comorbidities');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ComorbNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  

  <tr id="ComorbRow_16" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_16" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="16"  ID="ComorbDateText_16" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="16" Runat="server" ID="ComorbDate_16" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Osteoporosis" Value="Osteoporosis" RecordId="16" /> Osteoporosis </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_16" Runat="server" />
        <euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_16"/></td>
    <td><euc:EformDeleteIcon ID="Delete_16" runat="server"/></td>
  </tr>
  <%--<tr id="ComorbRow_17" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_17" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="17"  ID="ComorbDateText_17" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="17" Runat="server" ID="ComorbDate_17" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Fracture" Value="Fracture" RecordId="17" /> Fracture </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_17" Runat="server" />
        <euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_17"/></td>
    <td><euc:EformDeleteIcon ID="Delete_17" runat="server"/></td>
  </tr>--%>
  <tr id="ComorbRow_18" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_18" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="18"  ID="ComorbDateText_18" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="18" Runat="server" ID="ComorbDate_18" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_PrimaryHyperparathyroidism" Value="Primary Hyperparathyroidism" RecordId="18" /> Primary Hyperparathyroidism </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_18" Runat="server" />
        <euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_18"/></td>
    <td><euc:EformDeleteIcon ID="Delete_18" runat="server"/></td>
  </tr>  
  <tr id="ComorbRow_19" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_19" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="19"  ID="ComorbDateText_19" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="19" Runat="server" ID="ComorbDate_19" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_SecondaryHyperparathyroidism" Value="Secondary Hyperparathyroidism" RecordId="19" /> Secondary Hyperparathyroidism </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_19" Runat="server" />
        <euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_19"/></td>
    <td><euc:EformDeleteIcon ID="Delete_19" runat="server"/></td>
  </tr>   
  <tr id="ComorbRow_20" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_20" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="20"  ID="ComorbDateText_20" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="20" Runat="server" ID="ComorbDate_20" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_VitaminDInsufficiency" Value="Vitamin D Insufficiency" RecordId="20" /> Vitamin D Insufficiency </td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_20" Runat="server" />
        <euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_20"/></td>
    <td><euc:EformDeleteIcon ID="Delete_20" runat="server"/></td>
  </tr>   
  <tr id="ComorbRow_21" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_21" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="21"  ID="ComorbDateText_21" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="21" Runat="server" ID="ComorbDate_21" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_SteriodsinducedOsteoporosis" Value="Steriods-induced Osteoporosis" RecordId="21" /> Steriods-induced Osteo.</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_21" Runat="server" />
        <euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_21"/></td>
    <td><euc:EformDeleteIcon ID="Delete_21" runat="server"/></td>
  </tr>     
  <tr id="ComorbRow_22" runat="server"> 
    <td class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="DateLabel_22" Runat="server" />
    	<euc:EformTextBox Runat="server" RecordId="22"  ID="ComorbDateText_22" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	    <euc:EformHidden RecordId="22" Runat="server" ID="ComorbDate_22" Table="Comorbidities" Field="ComorbDate" /></td>
	    
    <td width="50%" class="ClinicalEformPopulatedColumn" ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_PagetsDisease" Value="Paget's Disease" RecordId="22" />Paget's Disease</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <asp:Label ID="NoteLabel_22" Runat="server" />
        <euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_22"/></td>
    <td><euc:EformDeleteIcon ID="Delete_22" runat="server"/></td>
  </tr>   
</table>
<br/><br/>
<br/>
