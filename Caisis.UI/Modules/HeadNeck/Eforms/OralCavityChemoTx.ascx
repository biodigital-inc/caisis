<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OralCavityChemoTx" CodeFile="OralCavityChemoTx.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
    tableArray.OralCavityChemoTxHtmlTable = "OralCavityChemoTxHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="OralCavityChemoTx" /><br/>

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Chemotherapy"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ChemoTxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="ChemoTxRecorded">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>
        </td>
    </tr>
</table>

<br />

<div id="ChemoTxDiv" runat="server" style="display: none;">        
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="OralCavityChemoTxHtmlTable">  
  
  <tr>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Start Date</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Stop Date </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Agent</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Cycles </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Quality </td>  
	    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>        
  </tr>  
  
  <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxStopDateText,MedTxDate,MedTxAgent,MedTxType,MedTxCycle,MedTxQuality', 'MedicalTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxType") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxCycle")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxQuality")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>  

  <tr >
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="6"  ID="MedTxDateText_6" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="6" Runat="server" ID="MedTxDate_6" Table="MedicalTherapy" Field="MedTxDate" />
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" Runat="server" ID="MedTxDisease_6" Table="MedicalTherapy" Field="MedTxDisease" /></td> 
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="6"  ID="MedTxStopDateText_6" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="6" Runat="server" ID="MedTxStopDate_6" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center">
        <euc:EformComboBox style="width:150px;" Field="MedTxAgent" LookupCode="MedTxAgent,UseAsDefault,Chemo" RecordId="6"  Table="MedicalTherapy" Runat="server" id="MedTxAgent_6"  DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformDropDownList RecordId="6" Runat="server" ID="MedTxType_6" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType,UseAsDefault,Chemo" Width="100px" TabIndex="3" /></td>
   <td style="white-space: nowrap;"align="center"><euc:EformTextBox  RecordId="6" Runat="server" ID="MedTxCycle_6" Table="MedicalTherapy" Field="MedTxCycle" Width="60px" LookupCode="Disease"  /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="250px" RecordId="6" Runat="server" ID="MedTxQuality_6" Table="MedicalTherapy" Field="MedTxQuality" Width="100px" LookupCode="DataQuality"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
    <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="7"  ID="MedTxDateText_7" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="7" Runat="server" ID="MedTxDate_7" Table="MedicalTherapy" Field="MedTxDate" />
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" Runat="server" ID="MedTxDisease_7" Table="MedicalTherapy" Field="MedTxDisease" /></td> 
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="7"  ID="MedTxStopDateText_7" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="7" Runat="server" ID="MedTxStopDate_7" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:150px;" Field="MedTxAgent" LookupCode="MedTxAgent,UseAsDefault,Chemo" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxAgent_7"  DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformDropDownList RecordId="7" Runat="server" ID="MedTxType_7" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType,UseAsDefault,Chemo" Width="100px" TabIndex="3" /></td>
   <td style="white-space: nowrap;"align="center"><euc:EformTextBox  RecordId="7" Runat="server" ID="MedTxCycle_7" Table="MedicalTherapy" Field="MedTxCycle" Width="60px" LookupCode="Disease"  /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="250px" RecordId="7" Runat="server" ID="MedTxQuality_7" Table="MedicalTherapy" Field="MedTxQuality" Width="100px" LookupCode="DataQuality"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="8"  ID="MedTxDateText_8" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="8" Runat="server" ID="MedTxDate_8" Table="MedicalTherapy" Field="MedTxDate" />
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" Runat="server" ID="MedTxDisease_8" Table="MedicalTherapy" Field="MedTxDisease" /></td> 
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="8"  ID="MedTxStopDateText_8" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="8" Runat="server" ID="MedTxStopDate_8" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:150px;" Field="MedTxAgent" LookupCode="MedTxAgent,UseAsDefault,Chemo" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxAgent_8"  DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformDropDownList RecordId="8" Runat="server" ID="MedTxType_8" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType,UseAsDefault,Chemo" Width="100px" TabIndex="3" /></td>
   <td style="white-space: nowrap;"align="center"><euc:EformTextBox  RecordId="8" Runat="server" ID="MedTxCycle_8" Table="MedicalTherapy" Field="MedTxCycle" Width="60px" LookupCode="Disease"  /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="250px" RecordId="8" Runat="server" ID="MedTxQuality_8" Table="MedicalTherapy" Field="MedTxQuality" Width="100px" LookupCode="DataQuality"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="9"  ID="MedTxDateText_9" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="9" Runat="server" ID="MedTxDate_9" Table="MedicalTherapy" Field="MedTxDate" />
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" Runat="server" ID="MedTxDisease_9" Table="MedicalTherapy" Field="MedTxDisease" /></td> 
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="9"  ID="MedTxStopDateText_9" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="9" Runat="server" ID="MedTxStopDate_9" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:150px;" Field="MedTxAgent" LookupCode="MedTxAgent,UseAsDefault,Chemo" RecordId="9" Table="MedicalTherapy" Runat="server" id="MedTxAgent_9"  DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformDropDownList RecordId="9" Runat="server" ID="MedTxType_9" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType,UseAsDefault,Chemo" Width="100px" TabIndex="3" /></td>
   <td style="white-space: nowrap;"align="center"><euc:EformTextBox  RecordId="9" Runat="server" ID="MedTxCycle_9" Table="MedicalTherapy" Field="MedTxCycle" Width="60px" LookupCode="Disease"  /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="250px" RecordId="9" Runat="server" ID="MedTxQuality_9" Table="MedicalTherapy" Field="MedTxQuality" Width="100px" LookupCode="DataQuality"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_9" runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="10"  ID="MedTxDateText_10" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="10" Runat="server" ID="MedTxDate_10" Table="MedicalTherapy" Field="MedTxDate" />
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" Runat="server" ID="MedTxDisease_10" Table="MedicalTherapy" Field="MedTxDisease" /></td> 
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="10"  ID="MedTxStopDateText_10" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="10" Runat="server" ID="MedTxStopDate_10" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:150px;" Field="MedTxAgent" LookupCode="MedTxAgent,UseAsDefault,Chemo" RecordId="10" Table="MedicalTherapy" Runat="server" id="MedTxAgent_10"  DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformDropDownList RecordId="10" Runat="server" ID="MedTxType_10" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType,UseAsDefault,Chemo" Width="100px" TabIndex="3" /></td>
   <td style="white-space: nowrap;"align="center"><euc:EformTextBox  RecordId="10" Runat="server" ID="MedTxCycle_10" Table="MedicalTherapy" Field="MedTxCycle" Width="60px" LookupCode="Disease"  /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="250px" RecordId="10" Runat="server" ID="MedTxQuality_10" Table="MedicalTherapy" Field="MedTxQuality" Width="100px" LookupCode="DataQuality"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_10" runat="server"/></td>
  </tr>
  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OralCavityChemoTxHtmlTable');" />
</div>
<br/><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= ChemoTxRecorded.ClientID %>'),$('<%= ChemoTxDiv.ClientID %>'),$('<%= MedTxDateText_6.ClientID %>'),$('<%= MedTxDate_6.ClientID %>'),$('<%= MedTxStopDateText_6.ClientID %>'),$('<%= MedTxStopDate_6.ClientID %>'),$('<%= MedTxAgent_6.ClientID %>'),$('<%= MedTxType_6.ClientID %>'),$('<%= MedTxCycle_6.ClientID %>'),$('<%= MedTxQuality_6.ClientID %>'),$('<%= MedTxDisease_6.ClientID %>'));
    addAbsentEvent($('<%= ChemoTxRecorded.ClientID %>'),$('<%= ChemoTxDiv.ClientID %>'),$('<%= MedTxDateText_7.ClientID %>'),$('<%= MedTxDate_7.ClientID %>'),$('<%= MedTxStopDateText_7.ClientID %>'),$('<%= MedTxStopDate_7.ClientID %>'),$('<%= MedTxAgent_7.ClientID %>'),$('<%= MedTxType_7.ClientID %>'),$('<%= MedTxCycle_7.ClientID %>'),$('<%= MedTxQuality_7.ClientID %>'),$('<%= MedTxDisease_7.ClientID %>'));
    addAbsentEvent($('<%= ChemoTxRecorded.ClientID %>'),$('<%= ChemoTxDiv.ClientID %>'),$('<%= MedTxDateText_8.ClientID %>'),$('<%= MedTxDate_8.ClientID %>'),$('<%= MedTxStopDateText_8.ClientID %>'),$('<%= MedTxStopDate_8.ClientID %>'),$('<%= MedTxAgent_8.ClientID %>'),$('<%= MedTxType_8.ClientID %>'),$('<%= MedTxCycle_8.ClientID %>'),$('<%= MedTxQuality_8.ClientID %>'),$('<%= MedTxDisease_8.ClientID %>'));
    addAbsentEvent($('<%= ChemoTxRecorded.ClientID %>'),$('<%= ChemoTxDiv.ClientID %>'),$('<%= MedTxDateText_9.ClientID %>'),$('<%= MedTxDate_9.ClientID %>'),$('<%= MedTxStopDateText_9.ClientID %>'),$('<%= MedTxStopDate_9.ClientID %>'),$('<%= MedTxAgent_9.ClientID %>'),$('<%= MedTxType_9.ClientID %>'),$('<%= MedTxCycle_9.ClientID %>'),$('<%= MedTxQuality_9.ClientID %>'),$('<%= MedTxDisease_9.ClientID %>'));
    addAbsentEvent($('<%= ChemoTxRecorded.ClientID %>'),$('<%= ChemoTxDiv.ClientID %>'),$('<%= MedTxDateText_10.ClientID %>'),$('<%= MedTxDate_10.ClientID %>'),$('<%= MedTxStopDateText_10.ClientID %>'),$('<%= MedTxStopDate_10.ClientID %>'),$('<%= MedTxAgent_10.ClientID %>'),$('<%= MedTxType_10.ClientID %>'),$('<%= MedTxCycle_10.ClientID %>'),$('<%= MedTxQuality_10.ClientID %>'),$('<%= MedTxDisease_10.ClientID %>'));

    function addAbsentEvent(chemoTxRecorded,chemoTxDiv,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxCycleID,medTxQualityID,medTxDiseaseID)
    {  
        $(medTxAgentID).addEvent('blur',curry(ShowHiddenFields,chemoTxRecorded,chemoTxDiv,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxCycleID,medTxQualityID,medTxDiseaseID));
        $(medTxTypeID).addEvent('blur',curry(ShowHiddenFields,chemoTxRecorded,chemoTxDiv,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxCycleID,medTxQualityID,medTxDiseaseID));
        $(medTxDateTextID).addEvent('blur',curry(ShowHiddenFields,chemoTxRecorded,chemoTxDiv,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxCycleID,medTxQualityID,medTxDiseaseID));
        $(medTxQualityID).addEvent('blur',curry(ShowHiddenFields,chemoTxRecorded,chemoTxDiv,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxCycleID,medTxQualityID,medTxDiseaseID));
        $(medTxStopDateTextID).addEvent('blur',curry(ShowHiddenFields,chemoTxRecorded,chemoTxDiv,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxCycleID,medTxQualityID,medTxDiseaseID));
 
        $(chemoTxRecorded).addEvent('click',curry(ShowHiddenFields,chemoTxRecorded,chemoTxDiv,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxCycleID,medTxQualityID,medTxDiseaseID));
    
        // show on load
        ShowHiddenFields(chemoTxRecorded,chemoTxDiv,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxCycleID,medTxQualityID,medTxDiseaseID);
    }
   
    /* ]]> */

    function ShowHiddenFields(chemoTxRecorded,chemoTxDiv,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxCycleID,medTxQualityID,medTxDiseaseID)
    {
        var chemoTxRecordedRef = chemoTxRecorded.getElementsByTagName('input');
        for (var i = 0; i < chemoTxRecordedRef.length; i++) 
            if (chemoTxRecordedRef[i].checked) 
            { 
                  if (chemoTxRecordedRef[i].value == "Yes" )
                   chemoTxDiv.style.display='block';
                  else if (chemoTxRecordedRef[i].value == "No")
                  {
                    chemoTxDiv.style.display='none';
                    medTxDateTextID.value = '';
                    medTxStopDateTextID.value = '';
                    medTxAgentID.value = '';
                    medTxQualityID.value = ''; 
                    medTxDateID.value = ''; 
                    medTxStopDateID.value = '';
                    medTxDiseaseID.value = '';
                  }
            }
            
        if (medTxDateTextID.value != '' || medTxStopDateTextID.value != '' || medTxAgentID.value != '' || medTxQualityID.value != '')
        {

            medTxDiseaseID.value = 'Oral Cancer';
        }
        else
        {
            medTxTypeID.value = '';
            medTxDiseaseID.value = '';        
        }
    }

    
</script>