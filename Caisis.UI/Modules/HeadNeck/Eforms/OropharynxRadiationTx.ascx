<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxRadiationTx" CodeFile="OropharynxRadiationTx.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.OropharynxRadiationTxHtmlTable = "OropharynxRadiationTxHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<a name="OropharynxRadiationTx" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiation Therapies"></asp:Label><br/>

<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Previous Radiation Therapies ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="RadTxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="RadTxRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="RadTxAbsentDiv" runat="server" style="display: none;" >
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_3"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="3" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_3"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table></div>

<div id="RadTxDiv" runat="server" style="display: none;" > <!-- -->
<table width="630" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OropharynxRadiationTxHtmlTable">
  
  <tr>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Start Date</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Stop Date</td>
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
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxType") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxUnits")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>  

  <tr>
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxDateText_1" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;" ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="21" />
        <euc:EformHidden  RecordId="1" Runat="server" ID="RadTxDate_1" Table="RadiationTherapy" Field="RadTxDate" />    
        <euc:EformTextBox Width="1px" style="display:none"  RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_1"/></td>
    <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxStopDateText_1" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;" ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="21" /><euc:EformHidden  RecordId="1" Runat="server" ID="RadTxStopDate_1" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_1" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="22" Width="80px"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxTarget_1" TabIndex="23" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="1" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_1" TabIndex="24"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="1" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_1" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="25"/>
    <euc:EformTextBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="1" ID="RadTxQuality_1" Runat="server" Width="1px" style="display:none" /></td>
    <td style="white-space: nowrap;" align="center" ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
   <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxDateText_2" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="26"/>
        <euc:EformHidden  RecordId="2" Runat="server" ID="RadTxDate_2" Table="RadiationTherapy" Field="RadTxDate" />
        <euc:EformTextBox Width="1px" style="display:none" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_2"/></td>
    <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxStopDateText_2" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  TabIndex="26"/><euc:EformHidden  RecordId="2" Runat="server" ID="RadTxStopDate_2" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_2" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="27" Width="80px"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxTarget_2" TabIndex="28" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="2" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_2" TabIndex="29"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="2" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_2" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="30"/>
    <euc:EformTextBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="2" ID="RadTxQuality_2" Runat="server" Width="1px" style="display:none" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxDateText_3" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="31" EnableHiddenOnUIEvent="RadTxQuality_3"/>
        <euc:EformHidden  RecordId="3" Runat="server" ID="RadTxDate_3" Table="RadiationTherapy" Field="RadTxDate" />   
        <euc:EformTextBox Width="1px" style="display:none" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_3"/></td>
    <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxStopDateText_3" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="31" EnableHiddenOnUIEvent="RadTxQuality_3"/>
      <euc:EformHidden  RecordId="3" Runat="server" ID="RadTxStopDate_3" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_3" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="32" Width="80px"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxTarget_3"  TabIndex="33"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="3" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_3" TabIndex="34"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="3" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_3" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="35"/>
    <euc:EformTextBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="3" ID="RadTxQuality_3" Runat="server" Width="1px" style="display:none" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="4"  ID="RadTxDateText_4" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="36" EnableHiddenOnUIEvent="RadTxQuality_4"/>
        <euc:EformHidden  RecordId="4" Runat="server" ID="RadTxDate_4" Table="RadiationTherapy" Field="RadTxDate" />    
        <euc:EformTextBox Width="1px" style="display:none" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_4"/></td>
    <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4"  ID="RadTxStopDateText_4" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="36" EnableHiddenOnUIEvent="RadTxQuality_4"/><euc:EformHidden  RecordId="4" Runat="server" ID="RadTxStopDate_4" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_4" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="37" style="width:80px;"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxTarget_4" TabIndex="38" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="4" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_4" TabIndex="39"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="4" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_4" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="40"/>
    <euc:EformTextBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="4" ID="RadTxQuality_4" Runat="server" Width="1px" style="display:none" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="5"  ID="RadTxDateText_5" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="41" EnableHiddenOnUIEvent="RadTxQuality_5"/>
        <euc:EformHidden  RecordId="5" Runat="server" ID="RadTxDate_5" Table="RadiationTherapy" Field="RadTxDate" />    
        <euc:EformTextBox Width="1px" style="display:none" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_5"/></td>
    <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5"  ID="RadTxStopDateText_5" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="41" EnableHiddenOnUIEvent="RadTxQuality_5"/><euc:EformHidden  RecordId="5" Runat="server" ID="RadTxStopDate_5" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_5" LookupCode="RadTxType,Disease,HeadNeck" DropDownHeight="auto" TabIndex="42" style="width:80px;"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox  LookupCode="RadTxTarget,Disease,HeadNeck"  RefBy="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxTarget_5" TabIndex="43" /></td>
    <td style="white-space: nowrap;" align="center"><euc:EformTextBox RecordId="5" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_5" TabIndex="44"/></td>
    <td style="white-space: nowrap;" align="center"><euc:EformComboBox RecordId="5" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_5" LookupCode="RadTxUnits,Disease,HeadNeck" DropDownHeight="auto" DropDownWidth="65px" TabIndex="45"/>
    <euc:EformTextBox TABLE="RadiationTherapy" FIELD="RadTxQuality" RecordId="5" ID="RadTxQuality_5" Runat="server" Width="1px" style="display:none;" /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxRadiationTxHtmlTable');" />
</div>
<table>
    <tr id="RadTxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="TableName" ID="TableName_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldName" ID="FieldName_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_3"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br/><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_1.ClientID %>'),$('<%= RadTxTotalDose_1.ClientID %>'),$('<%= RadTxUnits_1.ClientID %>'),$('<%= RadTxTarget_1.ClientID %>'),$('<%= RadTxType_1.ClientID %>'),$('<%= RadTxDisease_1.ClientID %>'),$('<%= RadTxQuality_1.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_2.ClientID %>'),$('<%= RadTxTotalDose_2.ClientID %>'),$('<%= RadTxUnits_2.ClientID %>'),$('<%= RadTxTarget_2.ClientID %>'),$('<%= RadTxType_2.ClientID %>'),$('<%= RadTxDisease_2.ClientID %>'),$('<%= RadTxQuality_2.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_3.ClientID %>'),$('<%= RadTxTotalDose_3.ClientID %>'),$('<%= RadTxUnits_3.ClientID %>'),$('<%= RadTxTarget_3.ClientID %>'),$('<%= RadTxType_3.ClientID %>'),$('<%= RadTxDisease_3.ClientID %>'),$('<%= RadTxQuality_3.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_4.ClientID %>'),$('<%= RadTxTotalDose_4.ClientID %>'),$('<%= RadTxUnits_4.ClientID %>'),$('<%= RadTxTarget_4.ClientID %>'),$('<%= RadTxType_4.ClientID %>'),$('<%= RadTxDisease_4.ClientID %>'),$('<%= RadTxQuality_4.ClientID %>'));
    addAbsentEvent($('<%= RadTxRecorded.ClientID %>'),$('<%= RadTxDiv.ClientID %>'),$('<%= RadTxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_5.ClientID %>'),$('<%= RadTxTotalDose_5.ClientID %>'),$('<%= RadTxUnits_5.ClientID %>'),$('<%= RadTxTarget_5.ClientID %>'),$('<%= RadTxType_5.ClientID %>'),$('<%= RadTxDisease_5.ClientID %>'),$('<%= RadTxQuality_5.ClientID %>'));

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
	    qltyId.value='OUT';
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
       
        document.getElementById('<%= AbsentDateText_3.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_3.ClientID %>').value='';
        document.getElementById('<%= TableName_3.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_3.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_3.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_3.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_3.ClientID %>').value = '';
        
      } 
      else if (RadTxoption_value == "No")
      {
        RadTxhideDiv.style.display='none';
        RadTxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_3.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_3.ClientID %>').value='';
        document.getElementById('<%= TableName_3.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_3.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_3.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_3.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_3.ClientID %>').value = '';
        
        document.getElementById('<%= RadTxDateText_1.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_1.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_1.ClientID %>').value='';
        document.getElementById('<%= RadTxType_1.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_1.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_1.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_1.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_1.ClientID %>').value='';


        document.getElementById('<%= RadTxDateText_2.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_2.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_2.ClientID %>').value='';
        document.getElementById('<%= RadTxType_2.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_2.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_2.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_2.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_2.ClientID %>').value='';
        
        document.getElementById('<%= RadTxDateText_3.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_3.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_3.ClientID %>').value='';
        document.getElementById('<%= RadTxType_3.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_3.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_3.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_3.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_3.ClientID %>').value='';
        
        document.getElementById('<%= RadTxDateText_4.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_4.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_4.ClientID %>').value='';
        document.getElementById('<%= RadTxType_4.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_4.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_4.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_4.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_4.ClientID %>').value='';
        
        document.getElementById('<%= RadTxDateText_5.ClientID %>').value='';
        document.getElementById('<%= RadTxDate_5.ClientID %>').value='';
        document.getElementById('<%= RadTxDisease_5.ClientID %>').value='';
        document.getElementById('<%= RadTxType_5.ClientID %>').value='';
        document.getElementById('<%= RadTxTarget_5.ClientID %>').value='';
        document.getElementById('<%= RadTxUnits_5.ClientID %>').value='';
        document.getElementById('<%= RadTxTotalDose_5.ClientID %>').value='';
        document.getElementById('<%= RadTxQuality_5.ClientID %>').value='';
        }
    }

</script>