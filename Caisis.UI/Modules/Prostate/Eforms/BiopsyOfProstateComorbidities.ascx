<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateComorbidities" CodeFile="BiopsyOfProstateComorbidities.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ComorbiditiesHtmlTable = "ComorbiditiesHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Comorbidities" /><span class="controlBoxTitle">Encarditis Prophylaxis</span><br/>
<table  border="0" width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComorbiditiesHtmlTable">
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
			<td align="left" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>&nbsp;</td>
			<td align="left" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ComorbNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" />	
	</td>
    <td width="50%"><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_1" Value="Mitral Valve Prolapse" RecordId="1" EnableHiddenOnUIEvent="ComorbDataSource_1,ComorbQuality_1"/> Mitral Valve Prolapse
    <euc:EformHidden RecordId="1" Runat="server" ID="ComorbDataSource_1" Table="Comorbidities" Field="ComorbDataSource" Value="EForm" Enabled="false"/>
	<euc:EformHidden RecordId="1" Runat="server" ID="ComorbQuality_1" Table="Comorbidities" Field="ComorbQuality" Value="STD" Enabled="false"/>
    </td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" />	
	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_2" Value="Cardiac Stent/Valve" RecordId="2" EnableHiddenOnUIEvent="ComorbDataSource_2,ComorbQuality_2" /> Cardiac Stent Valve
    <euc:EformHidden RecordId="2" Runat="server" ID="ComorbDataSource_2" Table="Comorbidities" Field="ComorbDataSource" Value="EForm" Enabled="false"/>
	<euc:EformHidden RecordId="2" Runat="server" ID="ComorbQuality_2" Table="Comorbidities" Field="ComorbQuality" Value="STD" Enabled="false"/>
    </td>
    <td align="left"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" />	
	</td>
    <td><euc:EformCheckbox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_3" Value="Joint Prothesis" RecordId="3" EnableHiddenOnUIEvent="ComorbDataSource_3,ComorbQuality_3" /> Joint Prothesis
    <euc:EformHidden RecordId="3" Runat="server" ID="ComorbDataSource_3" Table="Comorbidities" Field="ComorbDataSource" Value="EForm" Enabled="false"/>
	<euc:EformHidden RecordId="3" Runat="server" ID="ComorbQuality_3" Table="Comorbidities" Field="ComorbQuality" Value="STD" Enabled="false"/>
    </td>
    <td align="left"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
	<euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" />	
	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="4" Table="Comorbidities" Runat="server" ID="Comorbidity_4"  EnableHiddenOnUIEvent="ComorbDataSource_4,ComorbQuality_4" />
    <euc:EformHidden RecordId="4" Runat="server" ID="ComorbDataSource_4" Table="Comorbidities" Field="ComorbDataSource" Value="EForm" Enabled="false"/>
	<euc:EformHidden RecordId="4" Runat="server" ID="ComorbQuality_4" Table="Comorbidities" Field="ComorbQuality" Value="STD" Enabled="false"/>
    </td>
    <td align="left"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="5"  ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" />	
	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="5" Table="Comorbidities" Runat="server" ID="Comorbidity_5" EnableHiddenOnUIEvent="ComorbDataSource_5,ComorbQuality_5" />
    <euc:EformHidden RecordId="5" Runat="server" ID="ComorbDataSource_5" Table="Comorbidities" Field="ComorbDataSource" Value="EForm" Enabled="false"/>
	<euc:EformHidden RecordId="5" Runat="server" ID="ComorbQuality_5" Table="Comorbidities" Field="ComorbQuality" Value="STD" Enabled="false"/>
    </td>
    <td align="left"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="6"  ID="ComorbDateText_6" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
	<euc:EformHidden RecordId="6" Runat="server" ID="ComorbDate_6" Table="Comorbidities" Field="ComorbDate" />	
	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity,PercentUsage,Top80"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="6" Table="Comorbidities" Runat="server" ID="Comorbidity_6"  EnableHiddenOnUIEvent="ComorbDataSource_6,ComorbQuality_6"/>
    <euc:EformHidden RecordId="6" Runat="server" ID="ComorbDataSource_6" Table="Comorbidities" Field="ComorbDataSource" Value="EForm" Enabled="false"/>
	<euc:EformHidden RecordId="6" Runat="server" ID="ComorbQuality_6" Table="Comorbidities" Field="ComorbQuality" Value="STD" Enabled="false"/>
    </td>
    <td align="left"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>

</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesHtmlTable');" />
<br/><br/>
<br/>
