<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.FocalTherapy" CodeFile="FocalTherapy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.FocalTherapyHtmlTable = "FocalTherapyHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="FocalTherapy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Focal Therapy"></asp:Label><br/>
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="FocalTherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">Target</td>
    <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
<%--  
  
  <asp:Repeater ID="XRT" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,ProcInstitution,ProcNotes', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %>&nbsp;</td>
		  <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcInstitution") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  

  

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="ProcDateText_1" Table="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="ProcDate_1" Table="Procedures" Field="ProcDate" />    </td> 
    <td><euc:EformSelect RecordId="1" LookupCode="FocalTxType" DropDownHeight="auto" Table="Procedures" FIELD="ProcName" Runat="server" ID="ProcName_1"/></td>
    <td><euc:EformComboBox  LookupCode="FocalTxTarget" DropDownHeight="auto"   style="width:120px;" Field="ProcSite" RecordId="1" Table="Procedures" Runat="server" id="ProcSite_1"  /></td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:90px;" DropDownWidth="300" Field="ProcInstitution" RecordId="1" Table="Procedures" Runat="server" id="ProcInstitution_1"  /></td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:130px;" Table="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_1"/></td>
    <td><img src="../../Images/EFormDeleteRow.gif" width="22" height="14"></td>
  </tr>
    --%>
    <tr>
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="ProcDateText_2" Table="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="ProcDate_2" Table="Procedures" Field="ProcDate" />    </td> 
    <td><euc:EformSelect RecordId="2" LookupCode="FocalTxType" DropDownHeight="auto" Table="Procedures" FIELD="ProcName" Runat="server" ID="ProcName_2"/></td>
    <td><euc:EformComboBox  LookupCode="FocalTxTarget" DropDownHeight="auto"   style="width:120px;" Field="ProcSite" RecordId="2" Table="Procedures" Runat="server" id="ProcSite_2"  /></td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:90px;" DropDownWidth="300" Field="ProcInstitution" RecordId="2" Table="Procedures" Runat="server" id="ProcInstitution_2"  /></td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:130px;" Table="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="ProcDateText_3" Table="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="ProcDate_3" Table="Procedures" Field="ProcDate" />    </td> 
    <td><euc:EformSelect RecordId="3" LookupCode="FocalTxType" DropDownHeight="auto" Table="Procedures" FIELD="ProcName" Runat="server" ID="ProcName_3"/></td>
    <td><euc:EformComboBox  LookupCode="FocalTxTarget" DropDownHeight="auto"   style="width:120px;" Field="ProcSite" RecordId="3" Table="Procedures" Runat="server" id="ProcSite_3"  /></td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:90px;" DropDownWidth="300" Field="ProcInstitution" RecordId="3" Table="Procedures" Runat="server" id="ProcInstitution_3"  /></td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:130px;" Table="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4"  ID="ProcDateText_4" Table="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="4" Runat="server" ID="ProcDate_4" Table="Procedures" Field="ProcDate" />    </td> 
    <td><euc:EformSelect RecordId="4" LookupCode="FocalTxType" DropDownHeight="auto" Table="Procedures" FIELD="ProcName" Runat="server" ID="ProcName_4"/></td>
    <td><euc:EformComboBox  LookupCode="FocalTxTarget" DropDownHeight="auto"   style="width:120px;" Field="ProcSite" RecordId="4" Table="Procedures" Runat="server" id="ProcSite_4"  /></td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:90px;" DropDownWidth="300" Field="ProcInstitution" RecordId="4" Table="Procedures" Runat="server" id="ProcInstitution_4"  /></td>
    <td align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:130px;" Table="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5"  ID="ProcDateText_5" Table="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="5" Runat="server" ID="ProcDate_5" Table="Procedures" Field="ProcDate" />    </td> 
    <td><euc:EformSelect RecordId="5" LookupCode="FocalTxType" DropDownHeight="auto" Table="Procedures" FIELD="ProcName" Runat="server" ID="ProcName_5"/></td>
    <td><euc:EformComboBox  LookupCode="FocalTxTarget" DropDownHeight="auto"   style="width:120px;" Field="ProcSite" RecordId="5" Table="Procedures" Runat="server" id="ProcSite_5"  /></td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:90px;" DropDownWidth="300" Field="ProcInstitution" RecordId="5" Table="Procedures" Runat="server" id="ProcInstitution_5"  /></td>
    <td align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:130px;" Table="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="6"  ID="ProcDateText_6" Table="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="6" Runat="server" ID="ProcDate_6" Table="Procedures" Field="ProcDate" />    </td> 
    <td><euc:EformSelect RecordId="6" LookupCode="FocalTxType" DropDownHeight="auto" Table="Procedures" FIELD="ProcName" Runat="server" ID="ProcName_6"/></td>
    <td><euc:EformComboBox  LookupCode="FocalTxTarget" DropDownHeight="auto"   style="width:120px;" Field="ProcSite" RecordId="6" Table="Procedures" Runat="server" id="ProcSite_6"  /></td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:90px;" DropDownWidth="300" Field="ProcInstitution" RecordId="6" Table="Procedures" Runat="server" id="ProcInstitution_6"  /></td>
    <td align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:130px;" Table="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="7"  ID="ProcDateText_7" Table="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="7" Runat="server" ID="ProcDate_7" Table="Procedures" Field="ProcDate" />    </td> 
    <td><euc:EformSelect RecordId="7" LookupCode="FocalTxType" DropDownHeight="auto" Table="Procedures" FIELD="ProcName" Runat="server" ID="ProcName_7"/></td>
    <td><euc:EformComboBox  LookupCode="FocalTxTarget" DropDownHeight="auto"   style="width:120px;" Field="ProcSite" RecordId="7" Table="Procedures" Runat="server" id="ProcSite_7"  /></td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:90px;" DropDownWidth="300" Field="ProcInstitution" RecordId="7" Table="Procedures" Runat="server" id="ProcInstitution_7"  /></td>
    <td align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:130px;" Table="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="8"  ID="ProcDateText_8" Table="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="8" Runat="server" ID="ProcDate_8" Table="Procedures" Field="ProcDate" />    </td> 
    <td><euc:EformSelect RecordId="8" LookupCode="FocalTxType" DropDownHeight="auto" Table="Procedures" FIELD="ProcName" Runat="server" ID="ProcName_8"/></td>
    <td><euc:EformComboBox  LookupCode="FocalTxTarget" DropDownHeight="auto"   style="width:120px;" Field="ProcSite" RecordId="8" Table="Procedures" Runat="server" id="ProcSite_8"  /></td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:90px;" DropDownWidth="300" Field="ProcInstitution" RecordId="8" Table="Procedures" Runat="server" id="ProcInstitution_8"  /></td>
    <td align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:130px;" Table="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="9"  ID="ProcDateText_9" Table="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="9" Runat="server" ID="ProcDate_9" Table="Procedures" Field="ProcDate" />    </td> 
    <td><euc:EformSelect RecordId="9" LookupCode="FocalTxType" DropDownHeight="auto" Table="Procedures" FIELD="ProcName" Runat="server" ID="ProcName_9"/></td>
    <td><euc:EformComboBox  LookupCode="FocalTxTarget" DropDownHeight="auto"   style="width:120px;" Field="ProcSite" RecordId="9" Table="Procedures" Runat="server" id="ProcSite_9"  /></td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:90px;" DropDownWidth="300" Field="ProcInstitution" RecordId="9" Table="Procedures" Runat="server" id="ProcInstitution_9"  /></td>
    <td align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:130px;" Table="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="10"  ID="ProcDateText_10" Table="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="10" Runat="server" ID="ProcDate_10" Table="Procedures" Field="ProcDate" />    </td> 
    <td><euc:EformSelect RecordId="10" LookupCode="FocalTxType" DropDownHeight="auto" Table="Procedures" FIELD="ProcName" Runat="server" ID="ProcName_10"/></td>
    <td><euc:EformComboBox  LookupCode="FocalTxTarget" DropDownHeight="auto"   style="width:120px;" Field="ProcSite" RecordId="10" Table="Procedures" Runat="server" id="ProcSite_10"  /></td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:90px;" DropDownWidth="300" Field="ProcInstitution" RecordId="10" Table="Procedures" Runat="server" id="ProcInstitution_10"  /></td>
    <td align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:130px;" Table="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_10"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="11"  ID="ProcDateText_11" Table="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="11" Runat="server" ID="ProcDate_11" Table="Procedures" Field="ProcDate" />    </td> 
    <td><euc:EformSelect RecordId="11" LookupCode="FocalTxType" DropDownHeight="auto" Table="Procedures" FIELD="ProcName" Runat="server" ID="ProcName_11"/></td>
    <td><euc:EformComboBox  LookupCode="FocalTxTarget" DropDownHeight="auto"   style="width:120px;" Field="ProcSite" RecordId="11" Table="Procedures" Runat="server" id="ProcSite_11"  /></td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:90px;" DropDownWidth="300" Field="ProcInstitution" RecordId="11" Table="Procedures" Runat="server" id="ProcInstitution_11"  /></td>
    <td align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:130px;" Table="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_11"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'FocalTherapyHtmlTable');" />
<br/><br/>
<br/>
