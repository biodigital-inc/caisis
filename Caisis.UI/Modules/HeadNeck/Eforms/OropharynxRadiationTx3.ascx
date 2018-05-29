<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxRadiationTx3" CodeFile="OropharynxRadiationTx3.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.OropharynxRadiationTx3HtmlTable = "OropharynxRadiationTx3HtmlTable";
	</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<a name="OropharynxRadiationTx3" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiation Therapies"></asp:Label><br/>
 
<table  >
    <tr>
        <td>
            <span class="controlBoxTitle">Radiation Therapies ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="RadTxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="RadTxRecorded3">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="RadTxAbsentDiv" runat="server" style="display: none;" >
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_10"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="10" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_10"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table></div>


<div id="RadTxDiv" runat="server" style="display: none;">
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OropharynxRadiationTx3HtmlTable">
  
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
        <euc:EformTextBox Runat="server" RecordId="16"  ID="RadTxDateText_16" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;" ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="21" />
        <euc:EformHidden Enabled="false" RecordId="16" Runat="server" ID="RadTxDate_16" Table="RadiationTherapy" Field="RadTxDate" />
        <euc:EformTextBox Width="1px" style="display:none" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_16"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_16" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="22" Width="80px"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="16" Table="RadiationTherapy" Runat="server" id="RadTxTarget_16" TabIndex="23" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="16" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_16" TabIndex="24"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="16" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_16" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="25"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="16" ID="RadTxQuality_16" Runat="server" Width="80px" LookupCode="DataQuality" DropDownWidth="auto"  /></td>
    <td style="white-space: nowrap;" align="center" ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
   <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="17"  ID="RadTxDateText_17" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="26"/>
        <euc:EformHidden Enabled="false" RecordId="17" Runat="server" ID="RadTxDate_17" Table="RadiationTherapy" Field="RadTxDate" />
        <euc:EformTextBox Width="1px" style="display:none" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_17"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_17" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="27" Width="80px"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="17" Table="RadiationTherapy" Runat="server" id="RadTxTarget_17" TabIndex="28" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="17" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_17" TabIndex="29"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="17" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_17" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="30"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="17" ID="RadTxQuality_17" Runat="server" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="18"  ID="RadTxDateText_18" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="31" EnableHiddenOnUIEvent="RadTxQuality_18"/>
        <euc:EformHidden Enabled="false" RecordId="18" Runat="server" ID="RadTxDate_18" Table="RadiationTherapy" Field="RadTxDate" />
        <euc:EformTextBox Width="1px" style="display:none" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_18"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_18" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="32" Width="80px"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="18" Table="RadiationTherapy" Runat="server" id="RadTxTarget_18"  TabIndex="33"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="18" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_18" TabIndex="34"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="18" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_18" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="35"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="18" ID="RadTxQuality_18" Runat="server" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="19"  ID="RadTxDateText_19" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="36" EnableHiddenOnUIEvent="RadTxQuality_19"/>
        <euc:EformHidden Enabled="false" RecordId="19" Runat="server" ID="RadTxDate_19" Table="RadiationTherapy" Field="RadTxDate" />
        ><euc:EformTextBox Width="1px" style="display:none" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_19"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_19" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="37" style="width:80px;"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="19" Table="RadiationTherapy" Runat="server" id="RadTxTarget_19" TabIndex="38" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="19" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_19" TabIndex="39"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="19" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_19" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="40"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="19" ID="RadTxQuality_19" Runat="server" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="20"  ID="RadTxDateText_20" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="41" EnableHiddenOnUIEvent="RadTxQuality_20"/>
        <euc:EformHidden Enabled="false" RecordId="20" Runat="server" ID="RadTxDate_20" Table="RadiationTherapy" Field="RadTxDate" />
        ><euc:EformTextBox Width="1px" style="display:none" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_20"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_20" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="42" style="width:80px;"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="20" Table="RadiationTherapy" Runat="server" id="RadTxTarget_20" TabIndex="43" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="20" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_20" TabIndex="44"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="20" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_20" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="45"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="20" ID="RadTxQuality_20" Runat="server" Width="80px" LookupCode="DataQuality" DropDownWidth="auto" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxRadiationTx3');" />
</div>
<table>
    <tr id="RadTxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="TableName" ID="TableName_10"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="FieldName" ID="FieldName_10"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_10"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_10"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_10"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br/><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_16.ClientID %>'),$('<%= RadTxTotalDose_16.ClientID %>'),$('<%= RadTxUnits_16.ClientID %>'),$('<%= RadTxTarget_16.ClientID %>'),$('<%= RadTxType_16.ClientID %>'),$('<%= RadTxDisease_16.ClientID %>'),$('<%= RadTxQuality_16.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_17.ClientID %>'),$('<%= RadTxTotalDose_17.ClientID %>'),$('<%= RadTxUnits_17.ClientID %>'),$('<%= RadTxTarget_17.ClientID %>'),$('<%= RadTxType_17.ClientID %>'),$('<%= RadTxDisease_17.ClientID %>'),$('<%= RadTxQuality_17.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_18.ClientID %>'),$('<%= RadTxTotalDose_18.ClientID %>'),$('<%= RadTxUnits_18.ClientID %>'),$('<%= RadTxTarget_18.ClientID %>'),$('<%= RadTxType_18.ClientID %>'),$('<%= RadTxDisease_18.ClientID %>'),$('<%= RadTxQuality_18.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_19.ClientID %>'),$('<%= RadTxTotalDose_19.ClientID %>'),$('<%= RadTxUnits_19.ClientID %>'),$('<%= RadTxTarget_19.ClientID %>'),$('<%= RadTxType_19.ClientID %>'),$('<%= RadTxDisease_19.ClientID %>'),$('<%= RadTxQuality_19.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_20.ClientID %>'),$('<%= RadTxTotalDose_20.ClientID %>'),$('<%= RadTxUnits_20.ClientID %>'),$('<%= RadTxTarget_20.ClientID %>'),$('<%= RadTxType_20.ClientID %>'),$('<%= RadTxDisease_20.ClientID %>'),$('<%= RadTxQuality_20.ClientID %>'));

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
       
        document.getElementById('<%= AbsentDateText_10.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_10.ClientID %>').value='';
        document.getElementById('<%= TableName_10.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_10.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_10.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_10.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_10.ClientID %>').value = '';
      } 
      else if (RadTxoption_value == "No")
      {
        RadTxhideDiv.style.display='none';
        RadTxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_10.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_10.ClientID %>').value='';
        document.getElementById('<%= TableName_10.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_10.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_10.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_10.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_10.ClientID %>').value = '';
        
        document.getElementById('<%= RadTxDateText_16.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_16.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_16.ClientID %>').value='';
        document.getElementById('<%= RadTxType_16.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_16.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_16.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_16.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_16.ClientID %>').value='';


        document.getElementById('<%= RadTxDateText_17.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_17.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_17.ClientID %>').value='';
        document.getElementById('<%= RadTxType_17.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_17.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_17.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_17.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_17.ClientID %>').value='';
        
        document.getElementById('<%= RadTxDateText_18.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_18.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_18.ClientID %>').value='';
        document.getElementById('<%= RadTxType_18.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_18.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_18.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_18.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_18.ClientID %>').value='';
        
        document.getElementById('<%= RadTxDateText_19.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_19.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_19.ClientID %>').value='';
        document.getElementById('<%= RadTxType_19.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_19.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_19.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_19.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_19.ClientID %>').value='';
        
        document.getElementById('<%= RadTxDateText_20.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_20.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_20.ClientID %>').value='';
        document.getElementById('<%= RadTxType_20.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_20.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_20.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_20.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_20.ClientID %>').value='';
        }
    }

</script>