<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.ImagingUltrasoundBreast" CodeFile="ImagingUltrasoundBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript" type="text/javascript">
	tableArray.UltrasoundHtmlTable = "UltrasoundHtmlTable";
	
	function showHideBreastUltrasound(breastUltrasoundPerformed_value,breastUltrasoundAEDtTxtId, breastUltrasoundAEDtTxtIdVal, breastUltrasoundAEDtId, breastUltrasoundAEDtIdVal, breastUltrasoundAETableId, breastUltrasoundAETableIdVal, breastUltrasoundAEFieldId, breastUltrasoundAEFieldIdVal, breastUltrasoundAEFieldValueId, breastUltrasoundAEFieldValueIdVal, breastUltrasoundAEReasonId, breastUltrasoundAEReasonIdVal, breastUltrasoundAEQltyId, breastUltrasoundAEQltyIdVal)
    {
      var BreastUltrasoundDetailsRow = $('BreastUltrasoundDetails');
      if (breastUltrasoundPerformed_value == "Yes")
      {
        BreastUltrasoundDetailsRow.style.display='block';
        
        //clears absent row data
        clearElementsInParentRow(document.getElementById('BreastUltrasoundAbsentRow'));      
      } 
      else if (breastUltrasoundPerformed_value == "No")
      {        
        BreastUltrasoundDetailsRow.style.display='none';  
        
        //clears breastUltrasound rows data
        clearElementsInParentRow(document.getElementById('BreastUltrasoundRow1'));
        clearElementsInParentRow(document.getElementById('BreastUltrasoundRow2'));
        clearElementsInParentRow(document.getElementById('BreastUltrasoundRow3'));
        clearElementsInParentRow(document.getElementById('BreastUltrasoundRow4'));
		
/*		
        clearElementsInParentRow(document.getElementById('BreastMammogramRow5'));
        clearElementsInParentRow(document.getElementById('BreastMammogramRow6'));
        clearElementsInParentRow(document.getElementById('BreastMammogramRow7'));
        clearElementsInParentRow(document.getElementById('BreastMammogramRow8'));
*/                
        
        document.getElementById(breastUltrasoundAEDtTxtId).value = breastUltrasoundAEDtTxtIdVal;
        document.getElementById(breastUltrasoundAEDtId).value = breastUltrasoundAEDtIdVal;
        document.getElementById(breastUltrasoundAETableId).value = breastUltrasoundAETableIdVal;        
        document.getElementById(breastUltrasoundAEFieldId).value = breastUltrasoundAEFieldIdVal;
        document.getElementById(breastUltrasoundAEFieldValueId).value = breastUltrasoundAEFieldValueIdVal;
        document.getElementById(breastUltrasoundAEReasonId).value = breastUltrasoundAEReasonIdVal;
        document.getElementById(breastUltrasoundAEQltyId).value = breastUltrasoundAEQltyIdVal;
      }
    }
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ImagingUltrasoundBreast" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Imaging"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;"><strong>Ultrasound Imaging Done ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="UltrasoundDone" id="UltrasoundDone" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:40%"></td>
  </tr>
 <tr id="BreastUltrasoundDetails" style="display: none;">
     <td style="padding: 0px 0px 16px 16px;" colspan="3">
        <table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="UltrasoundHtmlTable" style="width: 500px; background-color: #f8f8f8;">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Results</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxSide,DxResult,DxQuality', 'Imaging');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
			<td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxSide")%></td>
			<td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxResult") %></td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr align="left" id="BreastUltrasoundRow1"> 
    <td height="28" >
		<euc:EformTextBox Runat="server" RecordId="5"  ID="DxDateText_5" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="5" Runat="server" ID="DxDate_5" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	

		<euc:EformTextBox Width="1px" style="display: none;" RecordId="5" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_5"/>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="5" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5"/>
		</td>

    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="70" DropDownHeight="auto" style="width:60px;" RecordId="5" Table="Diagnostics" Field="DxSide" LookupCode="OpSide" Runat="server" id="DxSide_5"  /></td>
		
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="220"  style="width:180px;"  RecordId="5" Table="Diagnostics" Field="DxResult" LookupCode="DxResult,Disease,Breast" Runat="server" id="DxResult_5"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" TABLE="Diagnostics" FIELD="DxQuality"   Runat="server" ID="DxQuality_5"/></td>
 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/></td>
  </tr>
  <tr align="left" style="display: none;" id="BreastUltrasoundRow2"> 
    <td height="28" >
		<euc:EformTextBox Runat="server" RecordId="6"  ID="DxDateText_6" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="6" Runat="server" ID="DxDate_6" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="6" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_6"/>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="6" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_6"/></td>

    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="70" DropDownHeight="auto" style="width:60px;" RecordId="6" Table="Diagnostics" Field="DxSide" LookupCode="OpSide" Runat="server" id="DxSide_6"  /></td>
		
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="220"  style="width:180px;"  RecordId="6" Table="Diagnostics" Field="DxResult" LookupCode="DxResult,Disease,Breast" Runat="server" id="DxResult_6"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="6" TABLE="Diagnostics" FIELD="DxQuality"   Runat="server" ID="DxQuality_6"/></td>
 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_6" runat="server"/></td>
  </tr>
  <tr align="left" style="display: none;" id="BreastUltrasoundRow3"> 
    <td height="28" >
		<euc:EformTextBox Runat="server" RecordId="7"  ID="DxDateText_7" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="7" Runat="server" ID="DxDate_7" Table="Diagnostics" Field="DxDate"></euc:EformHidden><euc:EformTextBox Width="1px" style="display: none;" RecordId="7" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_7"/>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="7" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_7"/></td>

    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="70" DropDownHeight="auto" style="width:60px;" RecordId="7" Table="Diagnostics" Field="DxSide" LookupCode="OpSide" Runat="server" id="DxSide_7"  /></td>
		
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="220"  style="width:180px;"  RecordId="7" Table="Diagnostics" Field="DxResult" LookupCode="DxResult,Disease,Breast" Runat="server" id="DxResult_7"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="7" TABLE="Diagnostics" FIELD="DxQuality"   Runat="server" ID="DxQuality_7"/></td>
 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/></td>
  </tr>
  <tr align="left" style="display: none;" id="BreastUltrasoundRow4"> 
    <td height="28" >
		<euc:EformTextBox Runat="server" RecordId="8"  ID="DxDateText_8" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="8" Runat="server" ID="DxDate_8" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="8" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_8"/>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="8" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_8"/></td>

    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="70" DropDownHeight="auto" style="width:60px;" RecordId="8" Table="Diagnostics" Field="DxSide" LookupCode="OpSide" Runat="server" id="DxSide_8"  /></td>
		
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="220"  style="width:180px;"  RecordId="8" Table="Diagnostics" Field="DxResult" LookupCode="DxResult,Disease,Breast" Runat="server" id="DxResult_8"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="8" TABLE="Diagnostics" FIELD="DxQuality"   Runat="server" ID="DxQuality_8"/></td>
 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/></td>
  </tr>


</table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'UltrasoundHtmlTable');" />
     </td>
 </tr>
 </table> 
 <table>
    <tr id="BreastUltrasoundAbsentRow">
        <td>
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_9"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="9" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_9"
                Runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="TableName" ID="TableName_9"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="FieldName" ID="FieldName_9"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_9"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_9"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_9"
                runat="server"  style="width:1px;display:none;"/>
        </td>
    </tr>
</table><br/><br />


<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addUltrasoundEvents(dateTextID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,dxTypeID)
    { 
        $(dateTextID).addEvent('blur',curry(SetUltrasoundHiddenFields,dateTextID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,dxTypeID));
        $(dxSideID).addEvent('blur',curry(SetUltrasoundHiddenFields,dateTextID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,dxTypeID));
        $(dxResultID).addEvent('blur',curry(SetUltrasoundHiddenFields,dateTextID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,dxTypeID));
   }

    addUltrasoundEvents($('<%= DxDateText_5.ClientID %>'),$('<%= DxTarget_5.ClientID %>'),$('<%= DxSide_5.ClientID %>'),$('<%= DxResult_5.ClientID %>'),$('<%= DxQuality_5.ClientID %>'),$('<%= DxType_5.ClientID %>'));
    addUltrasoundEvents($('<%= DxDateText_6.ClientID %>'),$('<%= DxTarget_6.ClientID %>'),$('<%= DxSide_6.ClientID %>'),$('<%= DxResult_6.ClientID %>'),$('<%= DxQuality_6.ClientID %>'),$('<%= DxType_6.ClientID %>'));
    addUltrasoundEvents($('<%= DxDateText_7.ClientID %>'),$('<%= DxTarget_7.ClientID %>'),$('<%= DxSide_7.ClientID %>'),$('<%= DxResult_7.ClientID %>'),$('<%= DxQuality_7.ClientID %>'),$('<%= DxType_7.ClientID %>'));
    addUltrasoundEvents($('<%= DxDateText_8.ClientID %>'),$('<%= DxTarget_8.ClientID %>'),$('<%= DxSide_8.ClientID %>'),$('<%= DxResult_8.ClientID %>'),$('<%= DxQuality_8.ClientID %>'),$('<%= DxType_8.ClientID %>'));

    /* ]]> */
    
function SetUltrasoundHiddenFields(dateTextID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,dxTypeID)
{
    if (dateTextID.value != '' || dxSideID.value != '' || dxResultID.value != '' )
    {
        dxTargetID.value = "Breast";
        dxDataQualityID.value = 'STD';
		dxTypeID.value = 'Ultrasound';
    }
    else
    {
        dxTargetID.value = '';
        dxDataQualityID.value = '';
		dxTypeID.value = '';
    }
}
</script>