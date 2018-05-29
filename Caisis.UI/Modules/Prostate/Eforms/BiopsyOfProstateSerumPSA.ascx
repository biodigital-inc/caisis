<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateSerumPSA" CodeFile="BiopsyOfProstateSerumPSA.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript">
	tableArray.PSALabTestsHtmlTable = "PSALabTestsHtmlTable";
	var lastPSA = <% = lastPSA.ToString() %>; 
	var lastPSADate = '<% = lastPSADate.ToString() %>'; 
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="BiopsyOfProstateSerumPSA" />
<a name="PSAsAnchor" /><span class="controlBoxTitle">Serum PSA Level</span><br>

<table width="650" cellpadding="0" cellspacing="0" border="0">
<tr>
<td valign="top">
<table border="0" width="550" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PSALabTestsHtmlTable">
  <tr> 
    <td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="23%" class="controlBoxDataGridHeaderFirstCol">Marker</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol">Value<span style="display: block; font-size: 10px; font-weight: normal;">(ng/ml)</span></td>
    <td width="17%" class="controlBoxDataGridHeaderFirstCol">Quality</td>
    <%--<td width="28%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>--%>
    <td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="PSAs" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabTest,LabResult,LabQuality', 'BiochemicalMarkers');"> 
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
	    </tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne">
	
	
			<euc:EformTextBox Runat="server" RecordId="1"  ID="LabDateText_1" TABLE="LabTests" FIELD="LabDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			<euc:EformHidden RecordId="1" Runat="server" ID="LabDate_1" Table="LabTests" Field="LabDate"/>	</td>
    <td align="center">PSA</td>
   
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_1" /></td>
    <td align="center"><euc:EformSelect RecordId="1" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_1" style="width: 40px;"  /></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1" NAME="Eformdeleteicon1"/></td>
  </tr>
    <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	
			<euc:EformTextBox Runat="server" RecordId="2"  ID="LabDateText_2" TABLE="LabTests" FIELD="LabDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
			<euc:EformHidden RecordId="2" Runat="server" ID="LabDate_2" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA</td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_2" /></td>
    <td align="center"><euc:EformSelect RecordId="2" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_2" style="width: 40px;" /></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon2" NAME="Eformdeleteicon2"/></td>
  </tr>
    <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	
			<euc:EformTextBox Runat="server" RecordId="3"  ID="LabDateText_3" TABLE="LabTests" FIELD="LabDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
			<euc:EformHidden RecordId="3" Runat="server" ID="LabDate_3" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA</td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_3"/></td>
    <td align="center"><euc:EformSelect RecordId="3" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_3" style="width: 40px;"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon3" NAME="Eformdeleteicon3"/></td>
   </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="4"  ID="LabDateText_4" TABLE="LabTests" FIELD="LabDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
			<euc:EformHidden RecordId="4" Runat="server" ID="LabDate_4" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA</td>
    <td align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_4" /></td>
    <td align="center"><euc:EformSelect RecordId="4" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_4" style="width: 40px;" /></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon4" NAME="Eformdeleteicon4"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="5"  ID="LabDateText_5" TABLE="LabTests" FIELD="LabDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText"   />
			<euc:EformHidden RecordId="5" Runat="server" ID="LabDate_5" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA</td>
    <td align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_5" /></td>
    <td align="center"><euc:EformSelect RecordId="5" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_5" style="width: 40px;" /></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon5" NAME="Eformdeleteicon5"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="6"  ID="LabDateText_6" TABLE="LabTests" FIELD="LabDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText" />
			<euc:EformHidden RecordId="6" Runat="server" ID="LabDate_6" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA</td>
    <td align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_6" /></td>
    <td align="center"><euc:EformSelect RecordId="6" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_6" style="width: 40px;" /></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon6" NAME="Eformdeleteicon6"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="7"  ID="LabDateText_7" TABLE="LabTests" FIELD="LabDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="7" Runat="server" ID="LabDate_7" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA</td>
    <td align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_7" /></td>
    <td align="center"><euc:EformSelect RecordId="7" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_7" style="width: 40px;" /></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon7" NAME="Eformdeleteicon7"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="8"  ID="LabDateText_8" TABLE="LabTests" FIELD="LabDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="8" Runat="server" ID="LabDate_8" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA</td>
    <td align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_8" /></td>
    <td align="center"><euc:EformSelect RecordId="8" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_8" style="width: 40px;" /></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon8" NAME="Eformdeleteicon8"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="9"  ID="LabDateText_9" TABLE="LabTests" FIELD="LabDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="9" Runat="server" ID="LabDate_9" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA</td>
    <td align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_9" /></td>
    <td align="center"><euc:EformSelect RecordId="9" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_9" style="width: 40px;" /></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon9" NAME="Eformdeleteicon9"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="10"  ID="LabDateText_10" TABLE="LabTests" FIELD="LabDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="10" Runat="server" ID="LabDate_10" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA</td>
    <td align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_10" /></td>
    <td align="center"><euc:EformSelect RecordId="10" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_10" style="width: 40px;" /></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon10" NAME="Eformdeleteicon10"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PSALabTestsHtmlTable');" />

</td>
</tr>
</table>
<br/>
<br/>
