<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidRadiationTx" CodeFile="ThyroidRadiationTx.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.RadiationTherapyHtmlTable = "RadiationTherapyHtmlTable";
	
	function updateRadTxQlty(QltyId)
	{
	    document.getElementById(QltyId).value='STD';	    
	}
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<a name="ThyroidRadiationTx" /><span class="controlBoxTitle">Radiation Therapy </span><br />
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="RadiationTherapyHtmlTable">
  
  <tr>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Disease</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Target</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Dose</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Units</td>
	    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>        
  </tr>    
  
  <asp:Repeater ID="XRT" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxDisease,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxDisease") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxType") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxUnits")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>  

  <tr>
    <td height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="11"  ID="RadTxDateText_11" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;" ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="26" />
        <euc:EformHidden RecordId="11" Runat="server" ID="RadTxDate_11" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="11" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_11" TabIndex="27"/></td>
    <td align="center"><euc:EformComboBox RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_11" LookupCode="RadTxType,Disease,Thyroid" DropDownHeight="auto" Width="80px"/></td>
    <td align="center"><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="11" Table="RadiationTherapy" Runat="server" id="RadTxTarget_11" TabIndex="29" /></td>
    <td align="center"><euc:EformTextBox RecordId="11" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_11" TabIndex="30"/></td>
    <td align="center"><euc:EformComboBox RecordId="11" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_11" LookupCode="RadTxUnits,Disease,Thyroid" DropDownHeight="auto" DropDownWidth="65px" TabIndex="31"/>
    <euc:EformTextBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="11" ID="RadTxQuality_11" Runat="server" Width="1px" style="display:none" /></td>
    <td align="center" ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
   <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="12"  ID="RadTxDateText_12" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="32"/>
        <euc:EformHidden RecordId="12" Runat="server" ID="RadTxDate_12" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="12" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_12" TabIndex="33"/></td>
    <td align="center"><euc:EformComboBox RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_12" LookupCode="RadTxType,Disease,Thyroid" DropDownHeight="auto" Width="80px"/></td>
    <td align="center"><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="12" Table="RadiationTherapy" Runat="server" id="RadTxTarget_12" TabIndex="35" /></td>
    <td align="center"><euc:EformTextBox RecordId="12" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_12" TabIndex="36"/></td>
    <td align="center"><euc:EformComboBox RecordId="12" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_12" LookupCode="RadTxUnits,Disease,Thyroid" DropDownHeight="auto" DropDownWidth="65px" TabIndex="37"/>
    <euc:EformTextBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="12" ID="RadTxQuality_12" Runat="server" Width="1px" style="display:none" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="13"  ID="RadTxDateText_13" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="38"/>
        <euc:EformHidden RecordId="13" Runat="server" ID="RadTxDate_13" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="13" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_13" TabIndex="39"/></td>
    <td align="center"><euc:EformComboBox RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_13" LookupCode="RadTxType,Disease,Thyroid" DropDownHeight="auto" Width="80px"/></td>
    <td align="center"><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="13" Table="RadiationTherapy" Runat="server" id="RadTxTarget_13"  TabIndex="41"/></td>
    <td align="center"><euc:EformTextBox RecordId="13" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_13" TabIndex="42"/></td>
    <td align="center"><euc:EformComboBox RecordId="13" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_13" LookupCode="RadTxUnits,Disease,Thyroid" DropDownHeight="auto" DropDownWidth="65px" TabIndex="43"/>
    <euc:EformTextBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="13" ID="RadTxQuality_13" Runat="server" Width="1px" style="display:none" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="14"  ID="RadTxDateText_14" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="44"/>
        <euc:EformHidden RecordId="14" Runat="server" ID="RadTxDate_14" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="14" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_14" TabIndex="45"/></td>
    <td align="center"><euc:EformComboBox RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_14" LookupCode="RadTxType,Disease,Thyroid" DropDownHeight="auto" style="width:80px;"/></td>
    <td align="center"><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="14" Table="RadiationTherapy" Runat="server" id="RadTxTarget_14" TabIndex="47" /></td>
    <td align="center"><euc:EformTextBox RecordId="14" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_14" TabIndex="48"/></td>
    <td align="center"><euc:EformComboBox RecordId="14" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_14" LookupCode="RadTxUnits,Disease,Thyroid" DropDownHeight="auto" DropDownWidth="65px" TabIndex="49"/>
    <euc:EformTextBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="14" ID="RadTxQuality_14" Runat="server" Width="1px" style="display:none" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="15"  ID="RadTxDateText_15" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="50"/>
        <euc:EformHidden RecordId="15" Runat="server" ID="RadTxDate_15" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center" ><euc:EformDropDownList RecordId="15" LookupCode="Disease" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_15" TabIndex="51"/></td>
    <td align="center"><euc:EformComboBox RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_15" LookupCode="RadTxType,Disease,Thyroid" DropDownHeight="auto" style="width:80px;"/></td>
    <td align="center"><euc:EformComboBox  LookupCode="RadTxTarget"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="15" Table="RadiationTherapy" Runat="server" id="RadTxTarget_15" TabIndex="53" /></td>
    <td align="center"><euc:EformTextBox RecordId="15" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_15" TabIndex="54"/></td>
    <td align="center"><euc:EformComboBox RecordId="15" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_15" LookupCode="RadTxUnits,Disease,Thyroid" DropDownHeight="auto" DropDownWidth="65px" TabIndex="55"/>
    <euc:EformTextBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="15" ID="RadTxQuality_15" Runat="server" Width="1px" style="display:none;" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>  
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'RadiationTherapyHtmlTable');" />
<br/><br/>