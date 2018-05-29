<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidMedicalTx" CodeFile="ThyroidMedicalTx.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.MedicalTherapyHtmlTable = "MedicalTherapyHtmlTable";
	
	function  updateMedTxDetails(TxTypeId, diseaseId, qltyId)
	{
	    document.getElementById(TxTypeId).value='RADIOISOTOPE';
	    document.getElementById(diseaseId).value='Thyroid Cancer';
	    document.getElementById(qltyId).value='STD';
	}
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ThyroidMedicalTx" /><span class="controlBoxTitle">Medical Therapy </span><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicalTherapyHtmlTable">  
  
  <tr>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Agent</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Dose </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Units </td>
	    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>        
  </tr>  
  
  <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxAgent,MedTxType,MedTxDose,MedTxUnits', 'MedicalTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxType") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDose") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxUnits") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>  

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxDateText_1" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden RecordId="1" Runat="server" ID="MedTxDate_1" Table="MedicalTherapy" Field="MedTxDate" /> 
        <euc:EformTextBox RecordId="1" Runat="server" ID="MedTxDisease_1" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox RecordId="1" Runat="server" ID="MedTxQuality_1" Table="MedicalTherapy" Field="MedTxQuality" Width="1px" style="display:none;" />
        </td> 
    <td align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxAgent_1" LookupCode="ThyroidMedTxAgent" DropDownHeight="auto" /></td>
    <td align="center"><euc:EformTextBox RecordId="1" Runat="server" ID="MedTxType_1" Table="MedicalTherapy" Field="MedTxType" Width="100px" TabIndex="3" /></td>
    <td align="center"><euc:EformTextBox RecordId="1" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_1" TabIndex="4"/></td>
   <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_1" LookupCode="MedUnits,Disease,Thyroid" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="5" /></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
    <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxDateText_2" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="6"/>
        <euc:EformHidden RecordId="2" Runat="server" ID="MedTxDate_2" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="2" Runat="server" ID="MedTxDisease_2" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox RecordId="2" Runat="server" ID="MedTxQuality_2" Table="MedicalTherapy" Field="MedTxQuality" Width="1px" style="display:none;" />
        </td> 
    <td align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxAgent_2" LookupCode="ThyroidMedTxAgent" DropDownHeight="auto" /></td>
    <td align="center"><euc:EformTextBox RecordId="2" Runat="server" ID="MedTxType_2" Table="MedicalTherapy" Field="MedTxType" Width="100px" TabIndex="8"/></td> 
    <td align="center"><euc:EformTextBox RecordId="2" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_2" TabIndex="9"/></td>
   <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_2" LookupCode="MedUnits,Disease,Thyroid" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="10"/></td>
    <td ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxDateText_3" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="11"/>
        <euc:EformHidden RecordId="3" Runat="server" ID="MedTxDate_3" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="3" Runat="server" ID="MedTxDisease_3" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox RecordId="3" Runat="server" ID="MedTxQuality_3" Table="MedicalTherapy" Field="MedTxQuality" Width="1px" style="display:none;" />
        </td> 
    <td align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxAgent_3" LookupCode="ThyroidMedTxAgent" DropDownHeight="auto" /></td>
    <td align="center"><euc:EformTextBox RecordId="3" Runat="server" ID="MedTxType_3" Table="MedicalTherapy" Field="MedTxType" Width="100px" TabIndex="13"/></td>
    <td align="center"><euc:EformTextBox RecordId="3" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_3" TabIndex="14"/></td>
   <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_3" LookupCode="MedUnits,Disease,Thyroid" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="15"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxDateText_4" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="16"/>
        <euc:EformHidden RecordId="4" Runat="server" ID="MedTxDate_4" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="4" Runat="server" ID="MedTxDisease_4" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox RecordId="4" Runat="server" ID="MedTxQuality_4" Table="MedicalTherapy" Field="MedTxQuality" Width="1px" style="display:none;" />
        </td> 
    <td align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxAgent_4" LookupCode="ThyroidMedTxAgent" DropDownHeight="auto" /></td>
    <td align="center"><euc:EformTextBox RecordId="4" Runat="server" ID="MedTxType_4" Table="MedicalTherapy" Field="MedTxType" Width="100px" TabIndex="18"/></td>
    <td align="center"><euc:EformTextBox RecordId="4" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_4" TabIndex="19"/></td>
   <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_4" LookupCode="MedUnits,Disease,Thyroid" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="20"/></td>
    <td ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxDateText_5" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="21"/>
        <euc:EformHidden RecordId="5" Runat="server" ID="MedTxDate_5" Table="MedicalTherapy" Field="MedTxDate" />    
        <euc:EformTextBox RecordId="5" Runat="server" ID="MedTxDisease_5" Table="MedicalTherapy" Field="MedTxDisease" Width="1px" style="display:none;" />
        <euc:EformTextBox RecordId="5" Runat="server" ID="MedTxQuality_5" Table="MedicalTherapy" Field="MedTxQuality" Width="1px" style="display:none;" />
        </td> 
	<td align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxAgent_5" LookupCode="ThyroidMedTxAgent" DropDownHeight="auto" /></td>
	<td align="center"><euc:EformTextBox RecordId="5" Runat="server" ID="MedTxType_5" Table="MedicalTherapy" Field="MedTxType" Width="100px" TabIndex="23"/></td>
    <td align="center"><euc:EformTextBox RecordId="5" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_5" TabIndex="24"/></td>
   <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_5" LookupCode="MedUnits,Disease,Thyroid" style="width: 55px;" DropDownHeight="auto" DropDownWidth="100px" TabIndex="25"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicalTherapyHtmlTable');" />
<br/><br/>