<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.ImagingMammogramBreast" CodeFile="ImagingMammogramBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript" type="text/javascript">
	tableArray.DiagnosticsHtmlTable = "DiagnosticsHtmlTable";
	
	function showHideBreastMammogram(breastMammogramPerformed_value,breastMammogramAEDtTxtId, breastMammogramAEDtTxtIdVal, breastMammogramAEDtId, breastMammogramAEDtIdVal, breastMammogramAETableId, breastMammogramAETableIdVal, breastMammogramAEFieldId, breastMammogramAEFieldIdVal, breastMammogramAEFieldValueId, breastMammogramAEFieldValueIdVal, breastMammogramAEReasonId, breastMammogramAEReasonIdVal, breastMammogramAEQltyId, breastMammogramAEQltyIdVal)
    {
      var BreastMammogramDetailsRow = $('BreastMammogramDetails');
      if (breastMammogramPerformed_value == "Yes")
      {
        BreastMammogramDetailsRow.style.display='block';
        
        //clears absent row data
        clearElementsInParentRow(document.getElementById('BreastMammogramAbsentRow'));      
      } 
      else if (breastMammogramPerformed_value == "No")
      {        
        BreastMammogramDetailsRow.style.display='none';  
        
        //clears breastMammogram rows data
        clearElementsInParentRow(document.getElementById('BreastMammogramRow1'));
        clearElementsInParentRow(document.getElementById('BreastMammogramRow2'));
        clearElementsInParentRow(document.getElementById('BreastMammogramRow3'));
        clearElementsInParentRow(document.getElementById('BreastMammogramRow4'));
		
/*		
        clearElementsInParentRow(document.getElementById('BreastMammogramRow5'));
        clearElementsInParentRow(document.getElementById('BreastMammogramRow6'));
        clearElementsInParentRow(document.getElementById('BreastMammogramRow7'));
        clearElementsInParentRow(document.getElementById('BreastMammogramRow8'));
*/                
        
        document.getElementById(breastMammogramAEDtTxtId).value = breastMammogramAEDtTxtIdVal;
        document.getElementById(breastMammogramAEDtId).value = breastMammogramAEDtIdVal;
        document.getElementById(breastMammogramAETableId).value = breastMammogramAETableIdVal;        
        document.getElementById(breastMammogramAEFieldId).value = breastMammogramAEFieldIdVal;
        document.getElementById(breastMammogramAEFieldValueId).value = breastMammogramAEFieldValueIdVal;
        document.getElementById(breastMammogramAEReasonId).value = breastMammogramAEReasonIdVal;
        document.getElementById(breastMammogramAEQltyId).value = breastMammogramAEQltyIdVal;
      }
    }
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ImagingMammogramBreast" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Imaging"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;"><strong>Mammogram Imaging Done ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="MammogramUltrasoundDone" id="MammogramUltrasoundDone" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:40%"></td>
  </tr>
 <tr id="BreastMammogramDetails" style="display: none;">
     <td style="padding: 0px 0px 16px 16px;" colspan="3">
        <table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsHtmlTable" style="width: 500px; background-color: #f8f8f8;">
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
  
  
  

  <tr align="left" id="BreastMammogramRow1"> 
    <td height="28" >
		<euc:EformTextBox Runat="server" RecordId="1"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="1" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	

		<euc:EformTextBox Width="1px" style="display: none;" RecordId="1" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_1"/>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="1" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1"/>
		</td>

    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="70" DropDownHeight="auto" style="width:60px;" RecordId="1" Table="Diagnostics" Field="DxSide" LookupCode="OpSide" Runat="server" id="DxSide_1"  /></td>
		
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="220"  style="width:180px;"  RecordId="1" Table="Diagnostics" Field="DxResult" LookupCode="DxResult,Disease,Breast" Runat="server" id="DxResult_1"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="1" TABLE="Diagnostics" FIELD="DxQuality"   Runat="server" ID="DxQuality_1"/></td>
 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td>
  </tr>
  <tr align="left" style="display: none;" id="BreastMammogramRow2"> 
    <td height="28" >
		<euc:EformTextBox Runat="server" RecordId="2"  ID="DxDateText_2" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="2" Runat="server" ID="DxDate_2" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="2" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_2"/>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="2" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_2"/></td>

    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="70" DropDownHeight="auto" style="width:60px;" RecordId="2" Table="Diagnostics" Field="DxSide" LookupCode="OpSide" Runat="server" id="DxSide_2"  /></td>
		
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="220"  style="width:180px;"  RecordId="2" Table="Diagnostics" Field="DxResult" LookupCode="DxResult,Disease,Breast" Runat="server" id="DxResult_2"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" TABLE="Diagnostics" FIELD="DxQuality"   Runat="server" ID="DxQuality_2"/></td>
 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server"/></td>
  </tr>
  <tr align="left" style="display: none;" id="BreastMammogramRow3"> 
    <td height="28" >
		<euc:EformTextBox Runat="server" RecordId="3"  ID="DxDateText_3" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="3" Runat="server" ID="DxDate_3" Table="Diagnostics" Field="DxDate"></euc:EformHidden><euc:EformTextBox Width="1px" style="display: none;" RecordId="3" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_3"/>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="3" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_3"/></td>

    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="70" DropDownHeight="auto" style="width:60px;" RecordId="3" Table="Diagnostics" Field="DxSide" LookupCode="OpSide" Runat="server" id="DxSide_3"  /></td>
		
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="220"  style="width:180px;"  RecordId="3" Table="Diagnostics" Field="DxResult" LookupCode="DxResult,Disease,Breast" Runat="server" id="DxResult_3"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" TABLE="Diagnostics" FIELD="DxQuality"   Runat="server" ID="DxQuality_3"/></td>
 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_3" runat="server"/></td>
  </tr>
  <tr align="left" style="display: none;" id="BreastMammogramRow4"> 
    <td height="28" >
		<euc:EformTextBox Runat="server" RecordId="4"  ID="DxDateText_4" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="4" Runat="server" ID="DxDate_4" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="4" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_4"/>
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="4" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4"/></td>

    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="70" DropDownHeight="auto" style="width:60px;" RecordId="4" Table="Diagnostics" Field="DxSide" LookupCode="OpSide" Runat="server" id="DxSide_4"  /></td>
		
    <td align="left" style="white-space: nowrap;">
		<euc:EformComboBox DropDownWidth="220"  style="width:180px;"  RecordId="4" Table="Diagnostics" Field="DxResult" LookupCode="DxResult,Disease,Breast" Runat="server" id="DxResult_4"  />  
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" TABLE="Diagnostics" FIELD="DxQuality"   Runat="server" ID="DxQuality_4"/></td>
 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server"/></td>
  </tr>


</table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DiagnosticsHtmlTable');" />
     </td>
 </tr>
 </table> 
 <table>
    <tr id="BreastMammogramAbsentRow">
        <td>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_7"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="7" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_7"
                Runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="TableName" ID="TableName_7"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="FieldName" ID="FieldName_7"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_7"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_7"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_7"
                runat="server"  style="width:1px;display:none;"/>
        </td>
    </tr>
</table><br/><br />


<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(dateTextID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,dxTypeID)
    { 
        $(dateTextID).addEvent('blur',curry(SetHiddenFields,dateTextID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,dxTypeID));
        $(dxSideID).addEvent('blur',curry(SetHiddenFields,dateTextID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,dxTypeID));
        $(dxResultID).addEvent('blur',curry(SetHiddenFields,dateTextID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,dxTypeID));
   }

    addEvents($('<%= DxDateText_1.ClientID %>'),$('<%= DxTarget_1.ClientID %>'),$('<%= DxSide_1.ClientID %>'),$('<%= DxResult_1.ClientID %>'),$('<%= DxQuality_1.ClientID %>'),$('<%= DxType_1.ClientID %>'));
    addEvents($('<%= DxDateText_2.ClientID %>'),$('<%= DxTarget_2.ClientID %>'),$('<%= DxSide_2.ClientID %>'),$('<%= DxResult_2.ClientID %>'),$('<%= DxQuality_2.ClientID %>'),$('<%= DxType_2.ClientID %>'));
    addEvents($('<%= DxDateText_3.ClientID %>'),$('<%= DxTarget_3.ClientID %>'),$('<%= DxSide_3.ClientID %>'),$('<%= DxResult_3.ClientID %>'),$('<%= DxQuality_3.ClientID %>'),$('<%= DxType_3.ClientID %>'));
    addEvents($('<%= DxDateText_4.ClientID %>'),$('<%= DxTarget_4.ClientID %>'),$('<%= DxSide_4.ClientID %>'),$('<%= DxResult_4.ClientID %>'),$('<%= DxQuality_4.ClientID %>'),$('<%= DxType_4.ClientID %>'));

    /* ]]> */
    
function SetHiddenFields(dateTextID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,dxTypeID)
{
    if (dateTextID.value != '' || dxSideID.value != '' || dxResultID.value != '' )
    {
        dxTargetID.value = "Breast";
        dxDataQualityID.value = 'STD';
		dxTypeID.value = 'Mammogram';
    }
    else
    {
        dxTargetID.value = '';
        dxDataQualityID.value = '';
		dxTypeID.value = '';
    }
}
</script>