<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.LiverSurgeryRadiationTherapy2" CodeFile="LiverSurgeryRadiationTherapy2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.RadiationTherapyHtmlTable = "RadiationTherapyHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="LiverSurgeryRadiationTherapy2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiation Therapy"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="RadiationTherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">Target</td>
    <td class="controlBoxDataGridHeaderFirstCol">Total Dose</td>
    <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="XRT" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	    <HeaderTemplate>
		    <tr  ><td align="center" colspan="7"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	    </HeaderTemplate>	    
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxInstitution,RadTxNotes', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %>&nbsp;</td>
		  <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxInstitution") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="11"  ID="RadTxDateText_11" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="11" Runat="server" ID="RadTxDate_11" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td><euc:EformSelect RecordId="11" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_11"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="11" Table="RadiationTherapy" Runat="server" id="RadTxTarget_11"  /></td>
    <td><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_11"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="11" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_11"  /></td>
    <td align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" ID="RadTxNotes_11"/></td>
    <td><img alt="" src="../../Images/EFormDeleteRow.gif" width="22" height="14"></td>
  </tr>
    <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="12"  ID="RadTxDateText_12" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="12" Runat="server" ID="RadTxDate_12" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td><euc:EformSelect RecordId="12" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_12"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="12" Table="RadiationTherapy" Runat="server" id="RadTxTarget_12"  /></td>
    <td><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_12"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="12" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_12"  /></td>
    <td align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" ID="RadTxNotes_12"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="13"  ID="RadTxDateText_13" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="13" Runat="server" ID="RadTxDate_13" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td><euc:EformSelect RecordId="13" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_13"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="13" Table="RadiationTherapy" Runat="server" id="RadTxTarget_13"  /></td>
    <td><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_13"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="13" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_13"  /></td>
    <td align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" ID="RadTxNotes_13"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="14"  ID="RadTxDateText_14" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="14" Runat="server" ID="RadTxDate_14" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td><euc:EformSelect RecordId="14" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_14"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="14" Table="RadiationTherapy" Runat="server" id="RadTxTarget_14"  /></td>
    <td><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_14"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="14" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_14"  /></td>
    <td align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" ID="RadTxNotes_14"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="15"  ID="RadTxDateText_15" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="15" Runat="server" ID="RadTxDate_15" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td><euc:EformSelect RecordId="15" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_15"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="15" Table="RadiationTherapy" Runat="server" id="RadTxTarget_15"  /></td>
    <td><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_15"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="15" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_15"  /></td>
    <td align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" ID="RadTxNotes_15"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="16"  ID="RadTxDateText_16" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="16" Runat="server" ID="RadTxDate_16" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td><euc:EformSelect RecordId="16" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_16"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="16" Table="RadiationTherapy" Runat="server" id="RadTxTarget_16"  /></td>
    <td><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_16"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="16" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_16"  /></td>
    <td align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" ID="RadTxNotes_16"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="17"  ID="RadTxDateText_17" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="17" Runat="server" ID="RadTxDate_17" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td><euc:EformSelect RecordId="17" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_17"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="17" Table="RadiationTherapy" Runat="server" id="RadTxTarget_17"  /></td>
    <td><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_17"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="17" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_17"  /></td>
    <td align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" ID="RadTxNotes_17"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="18"  ID="RadTxDateText_18" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="18" Runat="server" ID="RadTxDate_18" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td><euc:EformSelect RecordId="18" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_18"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="18" Table="RadiationTherapy" Runat="server" id="RadTxTarget_18"  /></td>
    <td><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_18"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top180" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="18" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_18"  /></td>
    <td align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" ID="RadTxNotes_18"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="19"  ID="RadTxDateText_19" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="19" Runat="server" ID="RadTxDate_19" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td><euc:EformSelect RecordId="19" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_19"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="19" Table="RadiationTherapy" Runat="server" id="RadTxTarget_19"  /></td>
    <td><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_19"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="19" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_19"  /></td>
    <td align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" ID="RadTxNotes_19"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="20"  ID="RadTxDateText_20" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="20" Runat="server" ID="RadTxDate_20" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td><euc:EformSelect RecordId="20" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_20"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="20" Table="RadiationTherapy" Runat="server" id="RadTxTarget_20"  /></td>
    <td><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_20"/>&nbsp;</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  style="width:80px;" Field="RadTxInstitution" RecordId="20" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_20"  /></td>
    <td align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" ID="RadTxNotes_20"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'RadiationTherapyHtmlTable');" />
<br/><br/>
<br/>
</div>

<asp:Literal ID="ShowDivScript" Runat="server" />