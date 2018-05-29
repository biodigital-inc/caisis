<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxRadiationTx2" CodeFile="OropharynxRadiationTx2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.OropharynxRadiationTx2HtmlTable = "OropharynxRadiationTx2HtmlTable";
	</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<a name="OropharynxRadiationTx2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiation Therapies"></asp:Label><br/>

<table  >
    <tr>
        <td>
            <span class="controlBoxTitle">Radiation Therapies ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="RadTxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="RadTxRecorded2">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="RadTxAbsentDiv" runat="server" style="display: none;" >
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_5"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="5" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_5"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table></div>


<div id="RadTxDiv" runat="server" style="display: none;">
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OropharynxRadiationTx2HtmlTable">
  
  <tr>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Target</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Dose</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Units</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Quality</td>
	    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>        
  </tr>    
  
  <asp:Repeater ID="XRT" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxDisease,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxType") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxUnits")%>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxQuality")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>  

  <tr>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="11"  ID="RadTxDateText_11" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;" ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="21" />
        <euc:EformHidden Enabled="false" RecordId="11" Runat="server" ID="RadTxDate_11" Table="RadiationTherapy" Field="RadTxDate" />
        <euc:EformTextBox Width="1px" style="display:none" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_11"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_11" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="22" Width="80px"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="11" Table="RadiationTherapy" Runat="server" id="RadTxTarget_11" TabIndex="23" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="11" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_11" TabIndex="24"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="11" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_11" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="25"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="11" ID="RadTxQuality_11" Runat="server" Width="80px" LookupCode="DataQuality" DropDownWidth="auto"  /></td>
    <td style="white-space: nowrap;" align="center" ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
   <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="12"  ID="RadTxDateText_12" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="26"/>
        <euc:EformHidden Enabled="false" RecordId="12" Runat="server" ID="RadTxDate_12" Table="RadiationTherapy" Field="RadTxDate" />
        <euc:EformTextBox Width="1px" style="display:none" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_12"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_12" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="27" Width="80px"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="12" Table="RadiationTherapy" Runat="server" id="RadTxTarget_12" TabIndex="28" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="12" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_12" TabIndex="29"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="12" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_12" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="30"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="12" ID="RadTxQuality_12" Runat="server" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="13"  ID="RadTxDateText_13" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="31" EnableHiddenOnUIEvent="RadTxQuality_13"/>
        <euc:EformHidden Enabled="false" RecordId="13" Runat="server" ID="RadTxDate_13" Table="RadiationTherapy" Field="RadTxDate" />
        <euc:EformTextBox Width="1px" style="display:none" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_13"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_13" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="32" Width="80px"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="13" Table="RadiationTherapy" Runat="server" id="RadTxTarget_13"  TabIndex="33"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="13" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_13" TabIndex="34"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="13" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_13" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="35"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="13" ID="RadTxQuality_13" Runat="server" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="14"  ID="RadTxDateText_14" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="36" EnableHiddenOnUIEvent="RadTxQuality_14"/>
        <euc:EformHidden Enabled="false" RecordId="14" Runat="server" ID="RadTxDate_14" Table="RadiationTherapy" Field="RadTxDate" />
        ><euc:EformTextBox Width="1px" style="display:none" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_14"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_14" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="37" style="width:80px;"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="14" Table="RadiationTherapy" Runat="server" id="RadTxTarget_14" TabIndex="38" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="14" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_14" TabIndex="39"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="14" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_14" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="40"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="14" ID="RadTxQuality_14" Runat="server" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="15"  ID="RadTxDateText_15" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="41" EnableHiddenOnUIEvent="RadTxQuality_15"/>
        <euc:EformHidden Enabled="false" RecordId="15" Runat="server" ID="RadTxDate_15" Table="RadiationTherapy" Field="RadTxDate" />
        ><euc:EformTextBox Width="1px" style="display:none" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_15"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_15" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="42" style="width:80px;"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="15" Table="RadiationTherapy" Runat="server" id="RadTxTarget_15" TabIndex="43" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="15" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_15" TabIndex="44"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="15" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_15" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="45"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="15" ID="RadTxQuality_15" Runat="server" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxRadiationTx2HtmlTable');" />
</div>
<table>
    <tr id="RadTxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="TableName" ID="TableName_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldName" ID="FieldName_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_5"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br/><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_11.ClientID %>'),$('<%= RadTxTotalDose_11.ClientID %>'),$('<%= RadTxUnits_11.ClientID %>'),$('<%= RadTxTarget_11.ClientID %>'),$('<%= RadTxType_11.ClientID %>'),$('<%= RadTxDisease_11.ClientID %>'),$('<%= RadTxQuality_11.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_12.ClientID %>'),$('<%= RadTxTotalDose_12.ClientID %>'),$('<%= RadTxUnits_12.ClientID %>'),$('<%= RadTxTarget_12.ClientID %>'),$('<%= RadTxType_12.ClientID %>'),$('<%= RadTxDisease_12.ClientID %>'),$('<%= RadTxQuality_12.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_13.ClientID %>'),$('<%= RadTxTotalDose_13.ClientID %>'),$('<%= RadTxUnits_13.ClientID %>'),$('<%= RadTxTarget_13.ClientID %>'),$('<%= RadTxType_13.ClientID %>'),$('<%= RadTxDisease_13.ClientID %>'),$('<%= RadTxQuality_13.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_14.ClientID %>'),$('<%= RadTxTotalDose_14.ClientID %>'),$('<%= RadTxUnits_14.ClientID %>'),$('<%= RadTxTarget_14.ClientID %>'),$('<%= RadTxType_14.ClientID %>'),$('<%= RadTxDisease_14.ClientID %>'),$('<%= RadTxQuality_14.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_15.ClientID %>'),$('<%= RadTxTotalDose_15.ClientID %>'),$('<%= RadTxUnits_15.ClientID %>'),$('<%= RadTxTarget_15.ClientID %>'),$('<%= RadTxType_15.ClientID %>'),$('<%= RadTxDisease_15.ClientID %>'),$('<%= RadTxQuality_15.ClientID %>'));

    function addAbsentEvent(radTxRecordedID,radTxDivID,radTxAbsentDivID,radTxDateTextID,radTxTotalDoseID,radTxUnitsID,radTxTargetID,radTxTypeID,radTxDiseaseID,radTxQualityID)
    {  
        $(radTxRecordedID).addEvent('click',curry(RadTxYesNo,radTxRecordedID,radTxDivID,radTxAbsentDivID));

        $(radTxTargetID).addEvent('blur',curry(updateRadTxDetails,radTxDiseaseID,radTxQualityID));
        $(radTxTypeID).addEvent('blur',curry(updateRadTxDetails,radTxDiseaseID,radTxQualityID));
        $(radTxDateTextID).addEvent('blur',curry(updateRadTxDetails,radTxDiseaseID,radTxQualityID));
        $(radTxTotalDoseID).addEvent('blur',curry(updateRadTxDetails,radTxDiseaseID,radTxQualityID));
        $(radTxUnitsID).addEvent('blur',curry(updateRadTxDetails,radTxDiseaseID,radTxQualityID));

        // check on load as well
        RadTxYesNo(radTxRecordedID,radTxDivID,radTxAbsentDivID);
    }
   
    /* ]]> */
 
    function  updateRadTxDetails(diseaseId, qltyId)
	{
	    diseaseId.value = 'Oropharyngeal Cancer';
//	    qltyId.value='STD';
	}
   
    function RadTxYesNo(radTxRecordedID,radTxDivID,radTxAbsentDivID)
    {
       var radTxRecordedRef = radTxRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < radTxRecordedRef.length; i++) 
        if (radTxRecordedRef[i].checked) {  
            RadTxRadioClick(radTxRecordedRef[i].value,radTxDivID,radTxAbsentDivID);
            }
    }
    
    function RadTxRadioClick(RadTxoption_value,RadTxhideDiv,RadTxhideAbsentDiv)
    {
      if (RadTxoption_value == "Yes")
      { 
        RadTxhideDiv.style.display='block';
        RadTxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_5.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_5.ClientID %>').value='';
        document.getElementById('<%= TableName_5.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_5.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_5.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_5.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_5.ClientID %>').value = '';
      } 
      else if (RadTxoption_value == "No")
      {
        RadTxhideDiv.style.display='none';
        RadTxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_5.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_5.ClientID %>').value='';
        document.getElementById('<%= TableName_5.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_5.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_5.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_5.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_5.ClientID %>').value = '';
        
        document.getElementById('<%= RadTxDateText_11.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_11.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_11.ClientID %>').value='';
        document.getElementById('<%= RadTxType_11.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_11.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_11.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_11.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_11.ClientID %>').value='';


        document.getElementById('<%= RadTxDateText_12.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_12.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_12.ClientID %>').value='';
        document.getElementById('<%= RadTxType_12.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_12.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_12.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_12.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_12.ClientID %>').value='';
        
        document.getElementById('<%= RadTxDateText_13.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_13.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_13.ClientID %>').value='';
        document.getElementById('<%= RadTxType_13.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_13.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_13.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_13.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_13.ClientID %>').value='';
        
        document.getElementById('<%= RadTxDateText_14.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_14.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_14.ClientID %>').value='';
        document.getElementById('<%= RadTxType_14.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_14.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_14.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_14.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_14.ClientID %>').value='';
        
        document.getElementById('<%= RadTxDateText_15.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_15.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_15.ClientID %>').value='';
        document.getElementById('<%= RadTxType_15.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_15.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_15.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_15.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_15.ClientID %>').value='';
        }
    }

</script>