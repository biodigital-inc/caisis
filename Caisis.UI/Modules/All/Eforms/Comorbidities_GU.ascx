<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Comorbidities_GU" CodeFile="Comorbidities_GU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ComorbiditiesHtmlTable = "ComorbiditiesHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="Comorbidities_GU" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Comorbidities"></asp:Label><br/>
<table cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="ComorbiditiesHtmlTable">
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; width: 110px;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Comorbidity</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
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
  
  
  

  <tr id="ComorbidityRow_CoronaryArteryDisease" runat="server"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CoronaryArteryDisease" Value="Coronary Artery Disease" RecordId="1"  /> Coronary Artery Disease</td>
    <td align="center"><euc:EformTextArea RecordId="1" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr  id="ComorbidityRow_MyocardialInfarction" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_MyocardialInfarction" Value="Myocardial Infarction" RecordId="2" /> Myocardial Infarction</td>
    <td align="center"><euc:EformTextArea RecordId="2" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr id="ComorbidityRow_Hypertension" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hypertension" Value="Hypertension" RecordId="3" />
      Hypertension</td>
    <td align="center"><euc:EformTextArea RecordId="3" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr id="ComorbidityRow_CVA" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_CVA" Value="CVA" RecordId="4" />
      CVA</td>
    <td align="center"><euc:EformTextArea RecordId="4" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr id="ComorbidityRow_ThromboembolicEventsDVT" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="5"  ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_ThromboembolicEventsDVT" Value="Thromboembolic Events / DVT" RecordId="5" />
      Thromboembolic Events / DVT</td>
    <td align="center"><euc:EformTextArea RecordId="5" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr id="ComorbidityRow_Asthma" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="6"  ID="ComorbDateText_6" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="6" Runat="server" ID="ComorbDate_6" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td ><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Asthma" Value="Asthma" RecordId="6" /> Asthma</td>
    <td align="center"><euc:EformTextArea RecordId="6" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr id="ComorbidityRow_DiabetesIDDM" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="7"  ID="ComorbDateText_7" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="7" Runat="server" ID="ComorbDate_7" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_DiabetesIDDM" Value="Diabetes (IDDM)" RecordId="7" /> Diabetes (IDDM)</td>
    <td align="center"><euc:EformTextArea RecordId="7" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr id="ComorbidityRow_DiabetesNIDDM" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="8"  ID="ComorbDateText_8" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="8" Runat="server" ID="ComorbDate_8" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_DiabetesNIDDM" Value="Diabetes (NIDDM)" RecordId="8" />
    Diabetes (NIDDM)</td>
    <td align="center"><euc:EformTextArea RecordId="8" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr id="ComorbidityRow_Hypercholesterolemia" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="9"  ID="ComorbDateText_9" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="9" Runat="server" ID="ComorbDate_9" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Hypercholesterolemia" Value="Hypercholesterolemia" RecordId="9" />
      Hypercholesterolemia</td>
    <td align="center"><euc:EformTextArea RecordId="9" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr id="ComorbidityRow_Depression" runat="server" > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="10"  ID="ComorbDateText_10" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="10" Runat="server" ID="ComorbDate_10" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_Depression" Value="Depression" RecordId="10" />
      Depression</td>
    <td align="center"><euc:EformTextArea RecordId="10" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_10"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr onclick="setAllDefaultOtherComorbDates();" onmouseout="setAllDefaultOtherComorbDates();" onmouseover="setAllDefaultOtherComorbDates();"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="11"  ID="ComorbDateText_11" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="11" Runat="server" ID="ComorbDate_11" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200"  LookupCode="Comorbidity,PercentUsage,Top80"   style="width:140px;" Field="Comorbidity" RecordId="11" Table="Comorbidities" Runat="server" ID="Comorbidity_11" /></td>
    <td align="center"><euc:EformTextArea RecordId="11" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_11"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" onclick="setAllDefaultOtherComorbDates();" onmouseout="setAllDefaultOtherComorbDates();" onmouseover="setAllDefaultOtherComorbDates();"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="12"  ID="ComorbDateText_12" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="12" Runat="server" ID="ComorbDate_12" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200"   LookupCode="Comorbidity,PercentUsage,Top80"   style="width:140px;" Field="Comorbidity" RecordId="12" Table="Comorbidities" Runat="server" ID="Comorbidity_12"  /></td>
    <td align="center"><euc:EformTextArea RecordId="12" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_12"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" onclick="setAllDefaultOtherComorbDates();" onmouseout="setAllDefaultOtherComorbDates();" onmouseover="setAllDefaultOtherComorbDates();"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="13"  ID="ComorbDateText_13" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="13" Runat="server" ID="ComorbDate_13" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200"   LookupCode="Comorbidity,PercentUsage,Top80"   style="width:140px;" Field="Comorbidity" RecordId="13" Table="Comorbidities" Runat="server" ID="Comorbidity_13"  /></td>
    <td align="center"><euc:EformTextArea RecordId="13" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_13"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" onclick="setAllDefaultOtherComorbDates();" onmouseout="setAllDefaultOtherComorbDates();" onmouseover="setAllDefaultOtherComorbDates();"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="14"  ID="ComorbDateText_14" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="14" Runat="server" ID="ComorbDate_14" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200"   LookupCode="Comorbidity,PercentUsage,Top80"   style="width:140px;" Field="Comorbidity" RecordId="14" Table="Comorbidities" Runat="server" ID="Comorbidity_14"  /></td>
    <td align="center"><euc:EformTextArea RecordId="14" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_14"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" onclick="setAllDefaultOtherComorbDates();" onmouseout="setAllDefaultOtherComorbDates();" onmouseover="setAllDefaultOtherComorbDates();"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="15"  ID="ComorbDateText_15" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	<euc:EformHidden RecordId="15" Runat="server" ID="ComorbDate_15" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox DropDownWidth="200"   LookupCode="Comorbidity,PercentUsage,Top80"   style="width:140px;" Field="Comorbidity" RecordId="15" Table="Comorbidities" Runat="server" ID="Comorbidity_15"  /></td>
    <td align="center"><euc:EformTextArea RecordId="15" style="width:260px; height: 29px;" TABLE="Comorbidities" FIELD="ComorbNotes" ShowTextEditor="true" Runat="server" ID="ComorbNotes_15"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesHtmlTable');" />
<br/><br/><br/>

<script type="text/javascript">
function setDefaultComorbDate(comorbCheckbox, ComorbDateTextBox)
{
    if (comorbCheckbox.checked) {if (ComorbDateTextBox.value.length < 1) ComorbDateTextBox.value = '<% = DateTime.Now.ToString("MM/dd/yyyy") %>';}
    else {ComorbDateTextBox.value = '';}
    ComorbDateTextBox.focus();
}
function setDefaultOtherComorbDate(comorbCombo, ComorbDateTextBox, ComorbDateField)
{
    if (comorbCombo.value != '')
    {
        if (ComorbDateTextBox.value.length < 1)
        {
            ComorbDateTextBox.value = '<% = DateTime.Now.ToString("MM/dd/yyyy") %>';
            ComorbDateField.value = '<% = DateTime.Now.ToString("MM/dd/yyyy") %>';
        }
    }
    
}
function setAllDefaultOtherComorbDates()
{
    setDefaultOtherComorbDate($('<% =Comorbidity_11.ClientID %>'), $('<% =ComorbDateText_11.ClientID %>'), $('<% =ComorbDate_11.ClientID %>'));
    setDefaultOtherComorbDate($('<% =Comorbidity_12.ClientID %>'), $('<% =ComorbDateText_12.ClientID %>'), $('<% =ComorbDate_12.ClientID %>'));
    setDefaultOtherComorbDate($('<% =Comorbidity_13.ClientID %>'), $('<% =ComorbDateText_13.ClientID %>'), $('<% =ComorbDate_13.ClientID %>'));
    setDefaultOtherComorbDate($('<% =Comorbidity_14.ClientID %>'), $('<% =ComorbDateText_14.ClientID %>'), $('<% =ComorbDate_14.ClientID %>'));
    setDefaultOtherComorbDate($('<% =Comorbidity_15.ClientID %>'), $('<% =ComorbDateText_15.ClientID %>'), $('<% =ComorbDate_15.ClientID %>'));
}
</script>