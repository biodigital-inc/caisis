<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandMedicalTx" CodeFile="SalivaryGlandMedicalTx.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
    tableArray.SalivaryGlandMedicalTxHtmlTable = "SalivaryGlandMedicalTxHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SalivaryGlandMedicalTx" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medical Therapies"></asp:Label><br/>
        
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SalivaryGlandMedicalTxHtmlTable">  
  
  <tr>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Start Date</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Stop Date </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Agent</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Disease </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Quality </td>  
	    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>        
  </tr>  
  
  <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxStopDateText,MedTxDate,MedTxAgent,MedTxType,MedTxDisease,MedTxQuality', 'MedicalTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxType") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDisease")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxQuality")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>  

  <tr >
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxDateText_1" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="1" Runat="server" ID="MedTxDate_1" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxStopDateText_1" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="1" Runat="server" ID="MedTxStopDate_1" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center">
        <euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="1"  Table="MedicalTherapy" Runat="server" id="MedTxAgent_1" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="1" Runat="server" ID="MedTxType_1" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="3" /></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="auto" RecordId="1" Runat="server" ID="MedTxDisease_1" Table="MedicalTherapy" Field="MedTxDisease" Width="100px" LookupCode="Disease"  /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="250px" RecordId="1" Runat="server" ID="MedTxQuality_1" Table="MedicalTherapy" Field="MedTxQuality" Width="100px" LookupCode="DataQuality"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
    <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxDateText_2" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="2" Runat="server" ID="MedTxDate_2" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxStopDateText_2" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="2" Runat="server" ID="MedTxStopDate_2" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxAgent_2" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="2" Runat="server" ID="MedTxType_2" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="3" /></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="auto" RecordId="2" Runat="server" ID="MedTxDisease_2" Table="MedicalTherapy" Field="MedTxDisease" Width="100px" LookupCode="Disease"  /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="250px" RecordId="2" Runat="server" ID="MedTxQuality_2" Table="MedicalTherapy" Field="MedTxQuality" Width="100px" LookupCode="DataQuality"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxDateText_3" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="3" Runat="server" ID="MedTxDate_3" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxStopDateText_3" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="3" Runat="server" ID="MedTxStopDate_3" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxAgent_3" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="3" Runat="server" ID="MedTxType_3" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="3" /></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="auto" RecordId="3" Runat="server" ID="MedTxDisease_3" Table="MedicalTherapy" Field="MedTxDisease" Width="100px" LookupCode="Disease"  /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="250px" RecordId="3" Runat="server" ID="MedTxQuality_3" Table="MedicalTherapy" Field="MedTxQuality" Width="100px" LookupCode="DataQuality"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_3" runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxDateText_4" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="4" Runat="server" ID="MedTxDate_4" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxStopDateText_4" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="4" Runat="server" ID="MedTxStopDate_4" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxAgent_4" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="4" Runat="server" ID="MedTxType_4" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="3" /></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="auto" RecordId="4" Runat="server" ID="MedTxDisease_4" Table="MedicalTherapy" Field="MedTxDisease" Width="100px" LookupCode="Disease"  /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="250px" RecordId="4" Runat="server" ID="MedTxQuality_4" Table="MedicalTherapy" Field="MedTxQuality" Width="100px" LookupCode="DataQuality"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxDateText_5" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="5" Runat="server" ID="MedTxDate_5" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxStopDateText_5" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" TabIndex="1" />
        <euc:EformHidden Enabled="false" RecordId="5" Runat="server" ID="MedTxStopDate_5" Table="MedicalTherapy" Field="MedTxStopDate" /></td> 
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox style="width:140px;" Field="MedTxAgent" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxAgent_5" LookupCode="MedTxAgent" DropDownHeight="auto" TabIndex="2" /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox RecordId="5" Runat="server" ID="MedTxType_5" Table="MedicalTherapy" Field="MedTxType" LookupCode="MedTxType" Width="100px" TabIndex="3" /></td>
   <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="auto" RecordId="5" Runat="server" ID="MedTxDisease_5" Table="MedicalTherapy" Field="MedTxDisease" Width="100px" LookupCode="Disease"  /></td>
    <td style="white-space: nowrap;"align="center"><euc:EformComboBox DropDownWidth="250px" RecordId="5" Runat="server" ID="MedTxQuality_5" Table="MedicalTherapy" Field="MedTxQuality" Width="100px" LookupCode="DataQuality"  /></td>
    <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/></td>
  </tr>
  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SalivaryGlandMedicalTxHtmlTable');" />
<br/><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= MedTxDateText_1.ClientID %>'),$('<%= MedTxDate_1.ClientID %>'),$('<%= MedTxStopDateText_1.ClientID %>'),$('<%= MedTxStopDate_1.ClientID %>'),$('<%= MedTxAgent_1.ClientID %>'),$('<%= MedTxType_1.ClientID %>'),$('<%= MedTxDisease_1.ClientID %>'),$('<%= MedTxQuality_1.ClientID %>'));
    addAbsentEvent($('<%= MedTxDateText_2.ClientID %>'),$('<%= MedTxDate_2.ClientID %>'),$('<%= MedTxStopDateText_2.ClientID %>'),$('<%= MedTxStopDate_2.ClientID %>'),$('<%= MedTxAgent_2.ClientID %>'),$('<%= MedTxType_2.ClientID %>'),$('<%= MedTxDisease_2.ClientID %>'),$('<%= MedTxQuality_2.ClientID %>'));
    addAbsentEvent($('<%= MedTxDateText_3.ClientID %>'),$('<%= MedTxDate_3.ClientID %>'),$('<%= MedTxStopDateText_3.ClientID %>'),$('<%= MedTxStopDate_3.ClientID %>'),$('<%= MedTxAgent_3.ClientID %>'),$('<%= MedTxType_3.ClientID %>'),$('<%= MedTxDisease_3.ClientID %>'),$('<%= MedTxQuality_3.ClientID %>'));
    addAbsentEvent($('<%= MedTxDateText_4.ClientID %>'),$('<%= MedTxDate_4.ClientID %>'),$('<%= MedTxStopDateText_4.ClientID %>'),$('<%= MedTxStopDate_4.ClientID %>'),$('<%= MedTxAgent_4.ClientID %>'),$('<%= MedTxType_4.ClientID %>'),$('<%= MedTxDisease_4.ClientID %>'),$('<%= MedTxQuality_4.ClientID %>'));
    addAbsentEvent($('<%= MedTxDateText_5.ClientID %>'),$('<%= MedTxDate_5.ClientID %>'),$('<%= MedTxStopDateText_5.ClientID %>'),$('<%= MedTxStopDate_5.ClientID %>'),$('<%= MedTxAgent_5.ClientID %>'),$('<%= MedTxType_5.ClientID %>'),$('<%= MedTxDisease_5.ClientID %>'),$('<%= MedTxQuality_5.ClientID %>'));

    function addAbsentEvent(medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxDiseaseID,medTxQualityID)
    {  
        $(medTxAgentID).addEvent('blur',curry(ShowHiddenFields,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxDiseaseID,medTxQualityID));
        $(medTxTypeID).addEvent('blur',curry(ShowHiddenFields,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxDiseaseID,medTxQualityID));
        $(medTxDateTextID).addEvent('blur',curry(ShowHiddenFields,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxDiseaseID,medTxQualityID));
        $(medTxQualityID).addEvent('blur',curry(ShowHiddenFields,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxDiseaseID,medTxQualityID));
        $(medTxStopDateTextID).addEvent('blur',curry(ShowHiddenFields,medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxDiseaseID,medTxQualityID));
    }
   
    /* ]]> */

    function ShowHiddenFields(medTxDateTextID,medTxDateID,medTxStopDateTextID,medTxStopDateID,medTxAgentID,medTxTypeID,medTxDiseaseID,medTxQualityID)
    {
        if (medTxDateTextID.value != '' || medTxStopDateTextID.value != '' || medTxAgentID.value != '' || medTxTypeID.value != '' || medTxQualityID.value != '')
        {
            medTxDiseaseID.value = 'Salivary Cancer';
        }
    }

</script>