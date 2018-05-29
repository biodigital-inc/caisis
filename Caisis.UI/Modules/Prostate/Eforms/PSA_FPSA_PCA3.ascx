<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PSA_FPSA_PCA3" CodeFile="PSA_FPSA_PCA3.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.PSALabTestsHtmlTable = "PSALabTestsHtmlTable";
	tableArray.FPSALabTestsHtmlTable = "FPSALabTestsHtmlTable";
	tableArray.OtherLabTestsHtmlTable = "OtherLabTestsHtmlTable";
</script>
<a name="PSA_FPSA_PCA3" />
<table cellpadding="0" cellspacing="0">
<tr>
<td valign="top">
<a name="PSAsAnchor" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="PSAs" /><br/>
<table cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PSALabTestsHtmlTable">
  <tr> 
    <td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol">Value</td>
    <td width="17%" class="controlBoxDataGridHeaderFirstCol">Quality</td>
    <%--<td width="28%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>--%>
    <td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="PSAs" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabTest,LabResult,LabQuality', 'BiochemicalMarkers');"> 
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
	    </tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	
			<euc:EformTextBox Runat="server" RecordId="1"  ID="LabDateText_1" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_1"  />
			<euc:EformHidden RecordId="1" Runat="server" ID="LabDate_1" Table="LabTests" Field="LabDate"/>			</td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_1" EnableHiddenOnUIEvent="LabTest_1"/></td>
    <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="1" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_1" style="width: 55px;" EnableHiddenOnUIEvent="LabTest_1" /></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1" NAME="Eformdeleteicon1"/></td>
  </tr>
    <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	
			<euc:EformTextBox Runat="server" RecordId="2"  ID="LabDateText_2" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_2"/>
			<euc:EformHidden RecordId="2" Runat="server" ID="LabDate_2" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_2" EnableHiddenOnUIEvent="LabTest_2"/></td>
    <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="2" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_2" style="width: 55px;" EnableHiddenOnUIEvent="LabTest_2"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon2" NAME="Eformdeleteicon2"/></td>
  </tr>
    <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	
			<euc:EformTextBox Runat="server" RecordId="3"  ID="LabDateText_3" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_3"/>
			<euc:EformHidden RecordId="3" Runat="server" ID="LabDate_3" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_3" EnableHiddenOnUIEvent="LabTest_3"/></td>
    <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="3" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_3" style="width: 55px;" EnableHiddenOnUIEvent="LabTest_3"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon3" NAME="Eformdeleteicon3"/></td>
   </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="4"  ID="LabDateText_4" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_4" />
			<euc:EformHidden RecordId="4" Runat="server" ID="LabDate_4" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_4" EnableHiddenOnUIEvent="LabTest_4"/></td>
    <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="4" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_4" style="width: 55px;" EnableHiddenOnUIEvent="LabTest_4"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon4" NAME="Eformdeleteicon4"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="5"  ID="LabDateText_5" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_5"  />
			<euc:EformHidden RecordId="5" Runat="server" ID="LabDate_5" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_5" EnableHiddenOnUIEvent="LabTest_5"/></td>
    <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="5" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_5" style="width: 55px;" EnableHiddenOnUIEvent="LabTest_5"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon5" NAME="Eformdeleteicon5"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="6"  ID="LabDateText_6" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_6"/>
			<euc:EformHidden RecordId="6" Runat="server" ID="LabDate_6" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_6" EnableHiddenOnUIEvent="LabTest_6"/></td>
    <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="6" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_6" style="width: 55px;" EnableHiddenOnUIEvent="LabTest_6"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon6" NAME="Eformdeleteicon6"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PSALabTestsHtmlTable');" /></td>
<td valign="top" style="padding-left: 30px;"><a name="PSAsAnchor" id="PSAsAnchor" /></a>
    <asp:Label ID="ComponentTitle1" runat="server" CssClass="controlBoxTitle" Text="FPSA" />  
  <br/>
    <table cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="FPSALabTestsHtmlTable">
      <tr>
        <td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
        <td width="20%" class="controlBoxDataGridHeaderFirstCol">Value</td>
        <td width="17%" class="controlBoxDataGridHeaderFirstCol">Quality</td>
        <%--<td width="28%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>--%>
        <td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
      </tr>
      <asp:Repeater ID="FPSAs" runat="server" OnItemDataBound="EFormRepeaterOnDataBound">
        <ItemTemplate>
          <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabTest,LabResult,LabQuality', 'BiochemicalMarkers');">
            <td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
            <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
            <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
      <tr>
        <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="7"  ID="LabDateText_7" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_7" />
            <euc:EformHidden RecordId="7" Runat="server" ID="LabDate_7" Table="LabTests" Field="LabDate"></euc:EformHidden>        </td>
        <td align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_7" EnableHiddenOnUIEvent="LabTest_7"/></td>
        <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="7" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_7" style="width: 55px;" EnableHiddenOnUIEvent="LabTest_7"/></td>
        <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon7" NAME="Eformdeleteicon7"/></td>
      </tr>
      <tr>
        <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="8"  ID="LabDateText_8" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_8" />
            <euc:EformHidden RecordId="8" Runat="server" ID="LabDate_8" Table="LabTests" Field="LabDate"></euc:EformHidden>        </td>
        <td align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_8" EnableHiddenOnUIEvent="LabTest_8"/></td>
        <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="8" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_8" style="width: 55px;" EnableHiddenOnUIEvent="LabTest_8"/></td>
        <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon8" NAME="Eformdeleteicon8"/></td>
      </tr>
      <tr>
        <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="9"  ID="LabDateText_9" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_9" />
            <euc:EformHidden RecordId="9" Runat="server" ID="LabDate_9" Table="LabTests" Field="LabDate"></euc:EformHidden>        </td>
        <td align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_9" EnableHiddenOnUIEvent="LabTest_9"/></td>
        <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="9" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_9" style="width: 55px;" EnableHiddenOnUIEvent="LabTest_9"/></td>
        <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon9" NAME="Eformdeleteicon9"/></td>
      </tr>
      <tr style="DISPLAY: none">
        <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="10"  ID="LabDateText_10" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_10" />
            <euc:EformHidden RecordId="10" Runat="server" ID="LabDate_10" Table="LabTests" Field="LabDate"></euc:EformHidden>        </td>
        <td align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_10" EnableHiddenOnUIEvent="LabTest_10"/></td>
        <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="10" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_10" style="width: 55px;" EnableHiddenOnUIEvent="LabTest_10"/></td>
        <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon10" NAME="Eformdeleteicon10"/></td>
      </tr>
      <tr style="DISPLAY: none">
        <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="11"  ID="LabDateText_11" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
            <euc:EformHidden RecordId="11" Runat="server" ID="LabDate_11" Table="LabTests" Field="LabDate"></euc:EformHidden>        </td>
        <td align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_11"/></td>
        <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="11" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_11" style="width: 55px;"/></td>
        <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon11" NAME="Eformdeleteicon11"/></td>
      </tr>
      <tr style="DISPLAY: none">
        <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="12"  ID="LabDateText_12" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
            <euc:EformHidden RecordId="12" Runat="server" ID="LabDate_12" Table="LabTests" Field="LabDate"></euc:EformHidden>        </td>
        <td align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_12"/></td>
        <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="12" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_12" style="width: 55px;"/></td>
        <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon12" NAME="Eformdeleteicon12"/></td>
      </tr>
    </table>
  <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'FPSALabTestsHtmlTable');" /></td>
</tr>
<tr>
  <td colspan="2" valign="top" style="padding-top: 20px;"><span class="controlBoxTitle">Other Lab Tests</span><br/>
      <table cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OtherLabTestsHtmlTable">
        <tr>
          <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
          <td class="controlBoxDataGridHeaderFirstCol">Marker</td>
          <td class="controlBoxDataGridHeaderFirstCol">Value</td>
          <td class="controlBoxDataGridHeaderFirstCol">Quality</td>
          <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
        </tr>
        <asp:Repeater ID="OtherLabTests" runat="server" OnItemDataBound="EFormRepeaterOnDataBoundForOther">
          <ItemTemplate>
            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabTest,LabResult,LabQuality', 'BiochemicalMarkers');">
              <td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
              <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;</td>
              <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
              <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
              <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="OtherLockImage" runat="server" title="This record has been locked." />&nbsp;</td>
            </tr>
          </ItemTemplate>
        </asp:Repeater>
        <tr>
          <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="13"  ID="LabDateText_13" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
              <euc:EformHidden RecordId="13" Runat="server" ID="LabDate_13" Table="LabTests" Field="LabDate"></euc:EformHidden>
          </td>
          <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:120px;" Field="LabTest" RecordId="13" Table="LabTests" Runat="server" id="LabTest_13"  /></td>
          <td align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_13"/></td>
          <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="13" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_13" style="width: 55px;"/></td>
          <%--<td>&nbsp;</td>--%>
          <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon13" NAME="Eformdeleteicon13"/></td>
        </tr>
        <tr>
          <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="14"  ID="LabDateText_14" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
              <euc:EformHidden RecordId="14" Runat="server" ID="LabDate_14" Table="LabTests" Field="LabDate"></euc:EformHidden>
          </td>
          <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:120px;" Field="LabTest" RecordId="14" Table="LabTests" Runat="server" id="LabTest_14"  /></td>
          <td align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_14"/></td>
          <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="14" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_14" style="width: 55px;"/></td>
          <%--<td>&nbsp;</td>--%>
          <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon14" NAME="Eformdeleteicon14"/></td>
        </tr>
        <tr>
          <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="15"  ID="LabDateText_15" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
              <euc:EformHidden RecordId="15" Runat="server" ID="LabDate_15" Table="LabTests" Field="LabDate"></euc:EformHidden>
          </td>
          <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:120px;" Field="LabTest" RecordId="15" Table="LabTests" Runat="server" id="LabTest_15"  /></td>
          <td align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_15"/></td>
          <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="15" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_15" style="width: 55px;"/></td>
          <%--<td>&nbsp;</td>--%>
          <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon15" NAME="Eformdeleteicon15"/></td>
        </tr>
        <tr style="DISPLAY: none">
          <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="16"  ID="LabDateText_16" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
              <euc:EformHidden RecordId="16" Runat="server" ID="LabDate_16" Table="LabTests" Field="LabDate"></euc:EformHidden>
          </td>
          <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:120px;" Field="LabTest" RecordId="16" Table="LabTests" Runat="server" id="LabTest_16"  /></td>
          <td align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_16"/></td>
          <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="16" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_16" style="width: 55px;"/></td>
          <%--<td>&nbsp;</td>--%>
          <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon16" NAME="Eformdeleteicon16"/></td>
        </tr>
        <tr style="DISPLAY: none">
          <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="17"  ID="LabDateText_17" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
              <euc:EformHidden RecordId="17" Runat="server" ID="LabDate_17" Table="LabTests" Field="LabDate"></euc:EformHidden>
          </td>
          <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:120px;" Field="LabTest" RecordId="17" Table="LabTests" Runat="server" id="LabTest_17"  /></td>
          <td align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_17"/></td>
          <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="17" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_17" style="width: 55px;"/></td>
          <%--<td>&nbsp;</td>--%>
          <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon17" NAME="Eformdeleteicon17"/></td>
        </tr>
        <tr style="DISPLAY: none">
          <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="18"  ID="LabDateText_18" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
              <euc:EformHidden RecordId="18" Runat="server" ID="LabDate_18" Table="LabTests" Field="LabDate"></euc:EformHidden>
          </td>
          <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:120px;" Field="LabTest" RecordId="18" Table="LabTests" Runat="server" id="LabTest_18"  /></td>
          <td align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_18"/></td>
          <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="18" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_18" style="width: 55px;"/></td>
          <%--<td>&nbsp;</td>--%>
          <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon18" NAME="Eformdeleteicon18"/></td>
        </tr>
        <tr style="DISPLAY: none">
          <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="19"  ID="LabDateText_19" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
              <euc:EformHidden RecordId="19" Runat="server" ID="LabDate_19" Table="LabTests" Field="LabDate"></euc:EformHidden>
          </td>
          <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:120px;" Field="LabTest" RecordId="19" Table="LabTests" Runat="server" id="LabTest_19"  /></td>
          <td align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_19"/></td>
          <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="19" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_19" style="width: 55px;"/></td>
          <%--<td>&nbsp;</td>--%>
          <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon19" NAME="Eformdeleteicon19"/></td>
        </tr>
        <tr style="DISPLAY: none">
          <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="20"  ID="LabDateText_20" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
              <euc:EformHidden RecordId="20" Runat="server" ID="LabDate_20" Table="LabTests" Field="LabDate"></euc:EformHidden>
          </td>
          <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:120px;" Field="LabTest" RecordId="20" Table="LabTests" Runat="server" id="LabTest_20"  /></td>
          <td align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_20"/></td>
          <td style="white-space: nowrap;"><euc:EformDropDownList RecordId="20" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_20" style="width: 55px;"/></td>
          <%--<td>&nbsp;</td>--%>
          <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon20" NAME="Eformdeleteicon20"/></td>
        </tr>
      </table>
    <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OtherLabTestsHtmlTable');" /></td>
</tr>
</table>
<br/><br/><br/>
