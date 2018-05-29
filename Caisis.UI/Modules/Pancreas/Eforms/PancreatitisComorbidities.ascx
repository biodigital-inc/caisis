<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreatitisComorbidities" CodeFile="PancreatitisComorbidities.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.ComorbiditiesHtmlTable = "ComorbiditiesHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="PancreatitisComorbidities" /><br/>


<table class="eformLargePopulatedTable">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Comorbidities"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ComorbRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="ComorbRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="ComorbAbsentDiv" runat="server" style="display: none;" >
 <br /><br />  
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="AbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_1"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="1" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_1"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table>
<br />
</div>
                
<div id="ComorbDiv" runat="server" style="display: none;">
 <br /><br />  
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
	
	<euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CoronaryArteryDisease" Value="Coronary Artery Disease" RecordId="1" /> Coronary Artery Disease</td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_MyocardialInfarction" Value="Myocardial Infarction" RecordId="2" /> Myocardial Infarction</td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hypertension" Value="Hypertension" RecordId="3" />
      Hypertension</td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CVA" Value="CVA" RecordId="4" />
      CVA</td>
    <td align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="5"  ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_ThromboembolicEventsDVT" Value="Thromboembolic Events / DVT" RecordId="5" />
      Thromboembolic Events / DVT</td>
    <td align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="6"  ID="ComorbDateText_6" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="6" Runat="server" ID="ComorbDate_6" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Asthma" Value="Asthma" RecordId="6" /> Asthma</td>
    <td align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="7"  ID="ComorbDateText_7" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="7" Runat="server" ID="ComorbDate_7" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_DiabetesIDDM" Value="Diabetes (IDDM)" RecordId="7" /> Diabetes (IDDM)</td>
    <td align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="8"  ID="ComorbDateText_8" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="8" Runat="server" ID="ComorbDate_8" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_DiabetesNIDDM" Value="Diabetes (NIDDM)" RecordId="8" />
    Diabetes (NIDDM)</td>
    <td align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="9"  ID="ComorbDateText_9" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="9" Runat="server" ID="ComorbDate_9" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hypercholesterolemia" Value="Hypercholesterolemia" RecordId="9" />
      Hypercholesterolemia</td>
    <td align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="10"  ID="ComorbDateText_10" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="10" Runat="server" ID="ComorbDate_10" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Depression" Value="Depression" RecordId="10" />
      Depression</td>
    <td align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_10"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="11"  ID="ComorbDateText_11" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="11" Runat="server" ID="ComorbDate_11" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="300px"  LookupCode="Comorbidity,Disease,@DiseaseView"  style="width:140;" Field="Comorbidity" RecordId="11" Table="Comorbidities" Runat="server" ID="Comorbidity_11"  /></td>
    <td align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_11"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="12"  ID="ComorbDateText_12" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="12" Runat="server" ID="ComorbDate_12" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="300px"   LookupCode="Comorbidity,Disease,@DiseaseView"   style="width:140;" Field="Comorbidity" RecordId="12" Table="Comorbidities" Runat="server" ID="Comorbidity_12"  /></td>
    <td align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_12"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="13"  ID="ComorbDateText_13" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="13" Runat="server" ID="ComorbDate_13" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="300px"   LookupCode="Comorbidity,Disease,@DiseaseView"   style="width:140;" Field="Comorbidity" RecordId="13" Table="Comorbidities" Runat="server" ID="Comorbidity_13"  /></td>
    <td align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_13"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="14"  ID="ComorbDateText_14" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="14" Runat="server" ID="ComorbDate_14" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="300px"   LookupCode="Comorbidity,Disease,@DiseaseView"   style="width:140;" Field="Comorbidity" RecordId="14" Table="Comorbidities" Runat="server" ID="Comorbidity_14"  /></td>
    <td align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_14"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="15"  ID="ComorbDateText_15" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="15" Runat="server" ID="ComorbDate_15" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="300px"   LookupCode="Comorbidity,Disease,@DiseaseView"   style="width:140;" Field="Comorbidity" RecordId="15" Table="Comorbidities" Runat="server" ID="Comorbidity_15"  /></td>
    <td align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_15"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="16"  ID="ComorbDateText_16" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="16" Runat="server" ID="ComorbDate_16" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="300px"   LookupCode="Comorbidity,Disease,@DiseaseView"   style="width:140;" Field="Comorbidity" RecordId="16" Table="Comorbidities" Runat="server" ID="Comorbidity_16"  /></td>
    <td align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_16"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="17"  ID="ComorbDateText_17" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="17" Runat="server" ID="ComorbDate_17" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="300px"   LookupCode="Comorbidity,Disease,@DiseaseView"   style="width:140;" Field="Comorbidity" RecordId="17" Table="Comorbidities" Runat="server" ID="Comorbidity_17"  /></td>
    <td align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_17"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="18"  ID="ComorbDateText_18" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="18" Runat="server" ID="ComorbDate_18" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="300px"   LookupCode="Comorbidity,Disease,@DiseaseView"   style="width:140;" Field="Comorbidity" RecordId="18" Table="Comorbidities" Runat="server" ID="Comorbidity_18"  /></td>
    <td align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_18"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="19"  ID="ComorbDateText_19" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="19" Runat="server" ID="ComorbDate_19" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="300px"   LookupCode="Comorbidity,Disease,@DiseaseView"   style="width:140;" Field="Comorbidity" RecordId="19" Table="Comorbidities" Runat="server" ID="Comorbidity_19"  /></td>
    <td align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_19"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="20"  ID="ComorbDateText_20" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="20" Runat="server" ID="ComorbDate_20" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="300px"   LookupCode="Comorbidity,Disease,@DiseaseView"   style="width:140;" Field="Comorbidity" RecordId="20" Table="Comorbidities" Runat="server" ID="Comorbidity_20"  /></td>
    <td align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_20"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>

</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesHtmlTable');" />

</div>
 <br /><br />  <br />
<table >
    <tr id="ComorbAbsentRow">
        <td>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="TableName" ID="TableName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldName" ID="FieldName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_1"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>


<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_1.ClientID %>'),$('<%= ComorbDate_1.ClientID %>'),$('<%= Comorbidity_CoronaryArteryDisease.ClientID %>'),$('<%= ComorbNotes_1.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_2.ClientID %>'),$('<%= ComorbDate_2.ClientID %>'),$('<%= Comorbidity_MyocardialInfarction.ClientID %>'),$('<%= ComorbNotes_2.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_3.ClientID %>'),$('<%= ComorbDate_3.ClientID %>'),$('<%= Comorbidity_Hypertension.ClientID %>'),$('<%= ComorbNotes_3.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_4.ClientID %>'),$('<%= ComorbDate_4.ClientID %>'),$('<%= Comorbidity_CVA.ClientID %>'),$('<%= ComorbNotes_4.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_5.ClientID %>'),$('<%= ComorbDate_5.ClientID %>'),$('<%= Comorbidity_ThromboembolicEventsDVT.ClientID %>'),$('<%= ComorbNotes_5.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_6.ClientID %>'),$('<%= ComorbDate_6.ClientID %>'),$('<%= Comorbidity_Asthma.ClientID %>'),$('<%= ComorbNotes_6.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_7.ClientID %>'),$('<%= ComorbDate_7.ClientID %>'),$('<%= Comorbidity_DiabetesIDDM.ClientID %>'),$('<%= ComorbNotes_7.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_8.ClientID %>'),$('<%= ComorbDate_8.ClientID %>'),$('<%= Comorbidity_DiabetesNIDDM.ClientID %>'),$('<%= ComorbNotes_8.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_9.ClientID %>'),$('<%= ComorbDate_9.ClientID %>'),$('<%= Comorbidity_Hypercholesterolemia.ClientID %>'),$('<%= ComorbNotes_9.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_10.ClientID %>'),$('<%= ComorbDate_10.ClientID %>'),$('<%= Comorbidity_Depression.ClientID %>'),$('<%= ComorbNotes_10.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_11.ClientID %>'),$('<%= ComorbDate_11.ClientID %>'),$('<%= Comorbidity_11.ClientID %>'),$('<%= ComorbNotes_11.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_12.ClientID %>'),$('<%= ComorbDate_12.ClientID %>'),$('<%= Comorbidity_12.ClientID %>'),$('<%= ComorbNotes_12.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_13.ClientID %>'),$('<%= ComorbDate_13.ClientID %>'),$('<%= Comorbidity_13.ClientID %>'),$('<%= ComorbNotes_13.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_14.ClientID %>'),$('<%= ComorbDate_14.ClientID %>'),$('<%= Comorbidity_14.ClientID %>'),$('<%= ComorbNotes_14.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_15.ClientID %>'),$('<%= ComorbDate_15.ClientID %>'),$('<%= Comorbidity_15.ClientID %>'),$('<%= ComorbNotes_15.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_16.ClientID %>'),$('<%= ComorbDate_16.ClientID %>'),$('<%= Comorbidity_16.ClientID %>'),$('<%= ComorbNotes_16.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_17.ClientID %>'),$('<%= ComorbDate_17.ClientID %>'),$('<%= Comorbidity_17.ClientID %>'),$('<%= ComorbNotes_17.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_18.ClientID %>'),$('<%= ComorbDate_18.ClientID %>'),$('<%= Comorbidity_18.ClientID %>'),$('<%= ComorbNotes_18.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_19.ClientID %>'),$('<%= ComorbDate_19.ClientID %>'),$('<%= Comorbidity_19.ClientID %>'),$('<%= ComorbNotes_19.ClientID %>'));
    addAbsentEvent($('<%= ComorbRecorded.ClientID %>'),$('<%= ComorbDiv.ClientID %>'),$('<%= ComorbAbsentDiv.ClientID %>'),$('<%= ComorbDateText_20.ClientID %>'),$('<%= ComorbDate_20.ClientID %>'),$('<%= Comorbidity_20.ClientID %>'),$('<%= ComorbNotes_20.ClientID %>'));

    function addAbsentEvent(comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID)
    {  
        $(comorbRecordedID).addEvent('click',curry(ComorbYesNo,comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID));
        $(comorbDateTextID).addEvent('blur',curry(ComorbYesNo,comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID));
        $(comorbidityID).addEvent('blur',curry(ComorbYesNo,comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID));
        $(comorbNotesID).addEvent('blur',curry(ComorbYesNo,comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID));

        // check on load as well
        ComorbYesNo(comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID);
    }
   
    /* ]]> */
   
    function ComorbYesNo(comorbRecordedID,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID)
    {
       var comorbRecordedRef = comorbRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < comorbRecordedRef.length; i++) 
        if (comorbRecordedRef[i].checked) {  
            ComorbRadioClick(comorbRecordedRef[i].value,comorbDivID,comorbAbsentDivID,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID);
            }
    }
    
    function ComorbRadioClick(Comorboption_value,ComorbhideDiv,ComorbhideAbsentDiv,comorbDateTextID,comorbDateID,comorbidityID,comorbNotesID)
    {
      if (Comorboption_value == "Yes")
      { 
        ComorbhideDiv.style.display='block';
        ComorbhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_1.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_1.ClientID %>').value='';
        document.getElementById('<%= TableName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_1.ClientID %>').value = '';
        
      }
      else if (Comorboption_value == "No" || Comorboption_value == "Unknown" || Comorboption_value == "N/A")
      {
        ComorbhideAbsentDiv.style.display='block';
        ComorbhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_1.ClientID %>').value = 'Comorbidities';        
        document.getElementById('<%= FieldName_1.ClientID %>').value = 'Comorbidity';        
        document.getElementById('<%= FieldValue_1.ClientID %>').value = 'Comorbidities'; 
        
        if (Comorboption_value == "No")       
            document.getElementById('<%= AbsentReason_1.ClientID %>').value = 'None Recorded';        
        else if (Comorboption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_1.ClientID %>').value = 'Unknown';
        else if (Comorboption_value == "N/A")
            document.getElementById('<%= AbsentReason_1.ClientID %>').value = 'Not Applicable';

        document.getElementById('<%= AbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_1.ClientID %>').value +  ' as of ';
           
        document.getElementById('<%= AbsentQuality_1.ClientID %>').value = 'OUT';        

        comorbDateTextID.value = '';
        comorbDateID.value = '';
        comorbidityID.value = '';
        comorbNotesID.value = '';   
     }
    }

</script>