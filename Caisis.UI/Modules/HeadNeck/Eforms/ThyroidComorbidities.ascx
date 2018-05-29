<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidComorbidities" CodeFile="ThyroidComorbidities.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.ComorbiditiesHtmlTable = "ComorbiditiesHtmlTable";
	
	function updateComorQlty(chkbox, qltyId)
    {
	    if (chkbox.checked == true)
	    {
		    document.getElementById(qltyId).value = 'STD';
	    }
        else
        {
            document.getElementById(qltyId).value = '';
        }
    }
    
    function updateComorComboQlty(qltyId)
    {
	    document.getElementById(qltyId).value = 'STD';
    }
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ThyroidComorbidities" /><span class="controlBoxTitle">Comorbidities</span><br/>
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
	
	<euc:EformTextBox Runat="server" RecordId="1"  ID="ComorbDateText_1" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="9" />
	<euc:EformHidden RecordId="1" Runat="server" ID="ComorbDate_1" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_1" Value="Grave's" RecordId="1" TabIndex="10" /> Grave's</td>
    <td align="center"><euc:EformTextBox RecordId="1" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_1" TabIndex="11"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="1" ID="ComorbQuality_1" Runat="server" Width="1px" style="display:none;"/>
    </td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="2"  ID="ComorbDateText_2" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="12" />
	<euc:EformHidden RecordId="2" Runat="server" ID="ComorbDate_2" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_2" Value="Hashimoto's" RecordId="2" TabIndex="13" /> Hashimoto's</td>
    <td align="center"><euc:EformTextBox RecordId="2" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_2" TabIndex="14"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="2" ID="ComorbQuality_2" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="3"  ID="ComorbDateText_3" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="15"  />
	<euc:EformHidden RecordId="3" Runat="server" ID="ComorbDate_3" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_3" Value="Hypothyroid" RecordId="3" TabIndex="16" /> Hypothyroid</td>
    <td align="center"><euc:EformTextBox RecordId="3" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_3" TabIndex="17"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="3" ID="ComorbQuality_3" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="4"  ID="ComorbDateText_4" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="18" />
	<euc:EformHidden RecordId="4" Runat="server" ID="ComorbDate_4" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_4" Value="Hyperthyroid" RecordId="4" TabIndex="19" /> Hyperthyroid</td>
    <td align="center"><euc:EformTextBox RecordId="4" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_4" TabIndex="20"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="4" ID="ComorbQuality_4" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="5"  ID="ComorbDateText_5" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="21"  />
	<euc:EformHidden RecordId="5" Runat="server" ID="ComorbDate_5" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_5" Value="Peptic Ulcer" RecordId="5" TabIndex="22" /> Peptic Ulcer</td>
    <td align="center"><euc:EformTextBox RecordId="5" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_5" TabIndex="23"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="5" ID="ComorbQuality_5" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="6"  ID="ComorbDateText_6" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="24" />
	<euc:EformHidden RecordId="6" Runat="server" ID="ComorbDate_6" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td width="50%"><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_6" Value="Myocardial Infarction" RecordId="6" TabIndex="25" /> Myocardial Infarction</td>
    <td align="center"><euc:EformTextBox RecordId="6" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_6" TabIndex="26"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="6" ID="ComorbQuality_6" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="7"  ID="ComorbDateText_7" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="27"  />
	<euc:EformHidden RecordId="7" Runat="server" ID="ComorbDate_7" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_7" Value="Chronic Obstructive Pulmonary Disease" RecordId="7" TabIndex="28" /> Chronic Obstructive Pulmonary Disease</td>
    <td align="center"><euc:EformTextBox RecordId="7" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_7" TabIndex="29"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="7" ID="ComorbQuality_7" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="8"  ID="ComorbDateText_8" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="30"  />
	<euc:EformHidden RecordId="8" Runat="server" ID="ComorbDate_8" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_8" Value="Congestive Heart Faliure" RecordId="8" TabIndex="31" /> Congestive Heart Faliure</td>
    <td align="center"><euc:EformTextBox RecordId="8" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_8" TabIndex="32"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="8" ID="ComorbQuality_8" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="9"  ID="ComorbDateText_9" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="33"  />
	<euc:EformHidden RecordId="9" Runat="server" ID="ComorbDate_9" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_9" Value="Peripheral Vascular Disease" RecordId="9" TabIndex="34" /> Peripheral Vascular Disease</td>
    <td align="center"><euc:EformTextBox RecordId="9" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_9" TabIndex="35"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="9" ID="ComorbQuality_9" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="10"  ID="ComorbDateText_10" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="36" />
	<euc:EformHidden RecordId="10" Runat="server" ID="ComorbDate_10" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformCheckBox TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" ID="Comorbidity_10" Value="Mild Liver Disease" RecordId="10" TabIndex="37" /> Mild Liver Disease</td>
    <td align="center"><euc:EformTextBox RecordId="10" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_10" TabIndex="38"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="10" ID="ComorbQuality_10" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="11"  ID="ComorbDateText_11" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="39" />
	<euc:EformHidden RecordId="11" Runat="server" ID="ComorbDate_11" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="11" Table="Comorbidities" Runat="server" ID="Comorbidity_11" TabIndex="40"  /></td>
    <td align="center"><euc:EformTextBox RecordId="11" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_11" TabIndex="41"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="11" ID="ComorbQuality_11" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="12"  ID="ComorbDateText_12" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="42" />
	<euc:EformHidden RecordId="12" Runat="server" ID="ComorbDate_12" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="12" Table="Comorbidities" Runat="server" ID="Comorbidity_12" TabIndex="43"  /></td>
    <td align="center"><euc:EformTextBox RecordId="12" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_12" TabIndex="44"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="12" ID="ComorbQuality_12" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="13"  ID="ComorbDateText_13" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="45" />
	<euc:EformHidden RecordId="13" Runat="server" ID="ComorbDate_13" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="13" Table="Comorbidities" Runat="server" ID="Comorbidity_13" TabIndex="46"  /></td>
    <td align="center"><euc:EformTextBox RecordId="13" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_13" TabIndex="47"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="13" ID="ComorbQuality_13" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="14"  ID="ComorbDateText_14" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="48"  />
	<euc:EformHidden RecordId="14" Runat="server" ID="ComorbDate_14" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="14" Table="Comorbidities" Runat="server" ID="Comorbidity_14" TabIndex="49"  /></td>
    <td align="center"><euc:EformTextBox RecordId="14" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_14" TabIndex="50"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="14" ID="ComorbQuality_14" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	<euc:EformTextBox Runat="server" RecordId="15"  ID="ComorbDateText_15" TABLE="Comorbidities" FIELD="ComorbDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="51" />
	<euc:EformHidden RecordId="15" Runat="server" ID="ComorbDate_15" Table="Comorbidities" Field="ComorbDate" />	</td>
    <td><euc:EformComboBox  LookupCode="Comorbidity"  RefBy="Comorbidity" style="width:140;" Field="Comorbidity" RecordId="15" Table="Comorbidities" Runat="server" ID="Comorbidity_15" TabIndex="52"  /></td>
    <td align="center"><euc:EformTextBox RecordId="15" style="width:200px;" TABLE="Comorbidities" FIELD="ComorbNotes" Runat="server" ID="ComorbNotes_15" TabIndex="53"/>
    <euc:EformTextBox TABLE="Comorbidities" FIELD="ComorbQuality" RecordId="15" ID="ComorbQuality_15" Runat="server" Width="1px" style="display:none;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ComorbiditiesHtmlTable');" />
<br/><br/>
<br/>
