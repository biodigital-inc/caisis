<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.AxillaProcedure" CodeFile="AxillaProcedure.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">

    function updateAxillaPathSide()
    {
        if($('<%= ProcSide_14.ClientID %>').value!='')
        {    	
	        $('<%= PathSide_2.ClientID %>').value = $('<%= ProcSide_14.ClientID %>').value;
        }
        else{$('<%= PathSide_2.ClientID %>').value = '';}
    }

    function showHideAxillaProc(AxillaPerformed_value,AxillaAEDtTxtId, AxillaAEDtId, AxillaAETableId, AxillaAETableIdVal, AxillaAEFieldId, AxillaAEFieldIdVal, AxillaAEFieldValueId, AxillaAEFieldValueIdVal, AxillaAEReasonId, AxillaAEReasonIdVal, AxillaAEQltyId, AxillaAEQltyIdVal)
    {
      var AxillaProcDetailsRow = $('AxillaProcDetails');
      if (AxillaPerformed_value == "Yes")
      {
        AxillaProcDetailsRow.style.display='block';
        
        
        // adding this to auto populate the proc date based on value entered for the OR Date
		if (typeof ORDateTextField != 'undefined' && typeof ORDateField != 'undefined')
		{
			var AxillaProcDateTextField = $('<%= ProcDateText_14.ClientID %>');
			var AxillaProcDateField = $('<%= ProcDate_14.ClientID %>');
			var AxillaPathDateTextField = $('<%= _2PathologyDateText.ClientID %>');
			var AxillaPathDateField = $('<%= _2PathologyDate.ClientID %>');
			$('<%= PathSite_2.ClientID %>').disabled = false;
			$('<%= PathQuality_2.ClientID %>').disabled = false;
			if (ORDateTextField.value.length > 0 && AxillaProcDateTextField.value.length < 1)
			{
				AxillaProcDateTextField.value = ORDateTextField.value;
				AxillaProcDateField.disabled = false;
				AxillaProcDateField.value = ORDateField.value;
			}
			if (ORDateTextField.value.length > 0 && AxillaPathDateTextField.value.length < 1)
			{
				AxillaPathDateTextField.value = ORDateTextField.value;
				AxillaPathDateField.disabled = false;
				AxillaPathDateField.value = ORDateField.value;
			}
        }
        
        //clears absent row data
        clearElementsInParentRow(document.getElementById('AxillaProcAbsentRow'));      
      } 
      else if (AxillaPerformed_value == "No")
      {        
        AxillaProcDetailsRow.style.display='none';  
        
        //clears Axilla proc and path rows data
        clearElementsInParentRow(document.getElementById('AxillaProcRow'));
        clearElementsInParentRow(document.getElementById('AxillaProcPathRow'));
//        clearElementsInParentRow(document.getElementById('AxillaPathFindingsRow1'));
//        clearElementsInParentRow(document.getElementById('AxillaPathFindingsRow2'));
//        clearElementsInParentRow(document.getElementById('AxillaPathFindingsRow3'));
//        clearElementsInParentRow(document.getElementById('AxillaPathFindingsRow4'));
//        clearElementsInParentRow(document.getElementById('AxillaPathFindingsRow5'));
//        clearElementsInParentRow(document.getElementById('AxillaPathFindingsRow6'));
//        clearElementsInParentRow(document.getElementById('AxillaPathFindingsRow7'));
//        clearElementsInParentRow(document.getElementById('AxillaPathFindingsRow8'));
//        clearElementsInParentRow(document.getElementById('AxillaPathFindingsRow9'));
//        clearElementsInParentRow(document.getElementById('AxillaPathFindingsRow10'));
//        clearElementsInParentRow(document.getElementById('AxillaTumorDimRow'));
//        clearElementsInParentRow(document.getElementById('AxillaExtentInSituRow'));
//        clearElementsInParentRow(document.getElementById('AxillaNuclearGradeRow'));
//        clearElementsInParentRow(document.getElementById('AxillaLVIRow'));
//        clearElementsInParentRow(document.getElementById('AxillaMultifocalRow'));
//        clearElementsInParentRow(document.getElementById('AxillaReexcisionsRow'));
//        clearElementsInParentRow(document.getElementById('AxillaMarginStatusRow'));
//        clearElementsInParentRow(document.getElementById('AxillaPosMarginsRow'));
//        clearElementsInParentRow(document.getElementById('AxillaPathStageRow1'));
//        clearElementsInParentRow(document.getElementById('AxillaPathStageRow2'));
        clearElementsInParentRow(document.getElementById('AxillaPathNodeRow1'));
        clearElementsInParentRow(document.getElementById('AxillaPathNodeRow2'));
        clearElementsInParentRow(document.getElementById('AxillaPathNodeRow3'));
        clearElementsInParentRow(document.getElementById('AxillaPathNodeRow4'));
        clearElementsInParentRow(document.getElementById('AxillaPathNodeRow5'));
        clearElementsInParentRow(document.getElementById('AxillaPathNodeRow6'));
        clearElementsInParentRow(document.getElementById('AxillaPathNodeRow7'));
        clearElementsInParentRow(document.getElementById('AxillaPathNodeRow8'));
        clearElementsInParentRow(document.getElementById('AxillaPathNodeRow9'));
        clearElementsInParentRow(document.getElementById('AxillaPathNodeRow10'));        
        clearElementsInParentRow(document.getElementById('AxillaPathTestRow1'));
        clearElementsInParentRow(document.getElementById('AxillaPathTestRow2'));
        clearElementsInParentRow(document.getElementById('AxillaPathTestRow3'));
        clearElementsInParentRow(document.getElementById('AxillaPathTestRow4'));
        clearElementsInParentRow(document.getElementById('AxillaPathTestRow5'));
        clearElementsInParentRow(document.getElementById('AxillaPathTestRow6'));
        clearElementsInParentRow(document.getElementById('AxillaPathTestRow7'));
        clearElementsInParentRow(document.getElementById('AxillaPathTestRow8'));
        clearElementsInParentRow(document.getElementById('AxillaPathTestRow9'));
        clearElementsInParentRow(document.getElementById('AxillaPathTestRow10'));
        clearElementsInParentRow(document.getElementById('AxillaProcNotesRow'));
        
        if (typeof ORDateTextField != 'undefined' && typeof ORDateField != 'undefined')
		{
			document.getElementById(AxillaAEDtTxtId).value = ORDateTextField.value;
			document.getElementById(AxillaAEDtId).value = ORDateField.value;
		}
        document.getElementById(AxillaAETableId).value = AxillaAETableIdVal;        
        document.getElementById(AxillaAEFieldId).value = AxillaAEFieldIdVal;
        document.getElementById(AxillaAEFieldValueId).value = AxillaAEFieldValueIdVal;
        document.getElementById(AxillaAEReasonId).value = AxillaAEReasonIdVal;
        document.getElementById(AxillaAEQltyId).value = AxillaAEQltyIdVal;
      }
    }


tableArray.AxillaProcedurePathFindingsHtmlTable = "AxillaProcedurePathFindingsHtmlTable";
tableArray.AxillaPathTestHtmlTable = "AxillaPathTestHtmlTable";
tableArray.AxillaNodePathFindingsHtmlTable = "AxillaNodePathFindingsHtmlTable";

var pathTestDateTextFieldId = ['<%= _1_PathDateText.ClientID %>', '<%= _2_PathDateText.ClientID %>', '<%= _3_PathDateText.ClientID %>', '<%= _4_PathDateText.ClientID %>', '<%= _5_PathDateText.ClientID %>', '<%= _6_PathDateText.ClientID %>', '<%= _7_PathDateText.ClientID %>', '<%= _8_PathDateText.ClientID %>', '<%= _9_PathDateText.ClientID %>', '<%= _10_PathDateText.ClientID %>'];
var pathTestDateFieldId = ['<%= _1_PathDate.ClientID %>', '<%= _2_PathDate.ClientID %>', '<%= _3_PathDate.ClientID %>', '<%= _4_PathDate.ClientID %>', '<%= _5_PathDate.ClientID %>', '<%= _6_PathDate.ClientID %>', '<%= _7_PathDate.ClientID %>', '<%= _8_PathDate.ClientID %>', '<%= _9_PathDate.ClientID %>', '<%= _10_PathDate.ClientID %>'];

function setDefaultPathTestDate(PathTestInput,RecordId)
{
	var PathTestDateTextInput = $(pathTestDateTextFieldId[RecordId-1]);
	var PathTestDateInput = $(pathTestDateFieldId[RecordId-1]);
	if (PathTestInput.value.length > 0 && PathTestDateTextInput.value.length < 1)
	{
		PathTestDateTextInput.value = $('<%= _2PathologyDateText.ClientID %>').value;
		PathTestDateInput.value = $('<%= _2PathologyDate.ClientID %>').value;
	}
}

</script>

<style type="text/css">
	.controlBoxDataGridTitleColumn {background-color: #E2E6E9;}
	.controlBoxDataGridValueColumn {background-color: #E8EBED;}
	
	.controlBoxDataGridTitleColumn td {color: #111111;}
	.controlBoxDataGridValueColumn td {color: #111111;}
	
	.eformXLargePopulatedTable input[type="radio"] { margin-left: 100px; }
	
</style>


<a name="AxillaProcedure" id="AxillaProcedure" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Axilla Procedure"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;"><strong>Axilla Procedure Performed?</strong><euc:EformRadioButtonList Table="NoTable" Field="Axilla_ProcName" id="ProcName_Axilla" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;">
	        <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
	    </euc:EformRadioButtonList>

</td>
  </tr>
 <tr id="AxillaProcDetails" style="display: none;">
    <td style="padding: 0px;"  >
<table border="0" cellspacing="0" cellpadding="16" width="100%" >
 <tr >
   <td style="padding-top: 0px; vertical-align: top; "><table width="400" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable"  style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px; border: solid 1px #cccccc; background-color: #ffffff;">
       <tr>
         <td class="controlBoxDataGridHeader" style="font-size:10px;">Date</td>
         <td class="controlBoxDataGridHeader" style="font-size:10px;">Procedure</td>
         <td class="controlBoxDataGridHeader" style="font-size:10px;">Side</td>
         <td class="controlBoxDataGridHeader" style="font-size:10px;">Indication</td>
         <td class="controlBoxDataGridHeader" style="font-size:10px;">Surgeon</td>
        </tr>
       <tr id="AxillaProcRow">
         <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="ProcDateText_14" Table="Procedures" Field="ProcDateText" RecordId="14" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;" />
           <euc:EformHidden id="ProcDate_14" Table="Procedures" Field="ProcDate"  RecordId="14" runat="server"/></td>
         <td style="padding-left: 10px;" >
            <euc:EformComboBox  runat="server" LookupCode="AxillaProcedure"  MaxLength="50" style="width:140px;" Field="ProcName" RecordId="14" Table="Procedures" id="ProcName_14" EnableHiddenOnUIEvent="ProcSite_14,ProcQuality_14"  />
            
		    <euc:EformHidden id="ProcQuality_14" runat="server" RecordId="14" Table="Procedures" Field="ProcQuality" Value="STD" />
            <euc:EformHidden id="ProcSite_14" runat="server" RecordId="14" Table="Procedures" Field="ProcSite" Value="Axilla" />
         </td>          
         <td style="padding-left: 10px;" >
            <euc:EFormDropDownList style="width:56px;" LookupCode="OpSide" runat="server"  Field="ProcSide" RecordId="14" Table="Procedures" 
                id="ProcSide_14" AppendToOnChange="updateAxillaPathSide();" EnableHiddenOnUIEvent="PathSite_2,PathQuality_2"/>
            
            <euc:EformTextBox id="PathSide_2" Table="Pathology" Field="PathSide" RecordId="2" runat="server" Width="1px" style="display:none"/>
           <euc:EformHidden id="PathSite_2" Table="Pathology" Field="PathSite"  RecordId="2" runat="server" Value="Axilla" />
           <euc:EformHidden id="PathQuality_2" Table="Pathology" Field="PathQuality"  RecordId="2" runat="server" Value="STD" />         
                
         </td>
         <td style="padding-left: 10px;" ><euc:EformComboBox  runat="server" LookupCode="Indication" DropDownWidth="300"  style="width:140;" MaxLength="50" Field="ProcIndication" RecordId="14" Table="Procedures" id="ProcIndication_14" /></td>
         <td style="padding-left: 10px;" >
            <euc:EformComboBox  runat="server" LookupCode="OpSurgeon,Disease,Breast" style="width:100px;" Field="ProcSurgeon" RecordId="14" 
                Table="Procedures" id="ProcSurgeon_14" />
         </td>
        </tr>
     </table></td>
  </tr>
 <tr >
   <td style=""><table cellspacing="0" cellpadding="0" class="controlBoxDataGridTable" style=" border:solid 1px #cccccc; margin-left: 0px; background-color: #ffffff;">
     <tr>
       <td class="controlBoxDataGridHeader" style="font-size:10px;" align="center">Path Report Date</td>
       <%-- <td class="controlBoxDataGridHeader" style="font-size:10px;" align="center">Primary Histology</td> --%>
     </tr>
     <tr id="AxillaProcPathRow"  >
       <td style="padding-left: 30px; height: 24px; padding-right: 30px;" align="center"><euc:EformTextBox id="_2PathologyDateText" Table="Pathology" Field="PathDateText" RecordId="2" runat="server" ShowCalendar="True" 
                    CalcDate="True" style="width: 80px;"  />
           <euc:EformHidden id="_2PathologyDate" Table="Pathology" Field="PathDate"  RecordId="2" runat="server"/></td>
       <%-- <td align="center"><euc:EformComboBox id="PathHistology_2" LookupCode="PathHistology" Table="Pathology" Field="PathHistology"  RecordId="2" runat="server" DropDownWidth="380" style="width: 400px;" EnableHiddenOnUIEvent="PathSite_2,PathQuality_2"/>
</td>--%>
     </tr>
   </table></td>
  </tr>
 <tr style=" display:none;" >
   <td ><strong>Pathology Findings</strong>&nbsp;&nbsp;&nbsp;(Axilla)
     <table width="550" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" id="AxillaProcedurePathFindingsHtmlTable"  style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px; border: solid 1px #cccccc; background-color: #ffffff;">
    <tr> 
      <td class="controlBoxDataGridHeader" style="font-size:10px;">Side</td>
      <td   height="18" class="controlBoxDataGridHeader" style="font-size:10px;">Site</td>
      <td   class="controlBoxDataGridHeader" style="font-size:10px;">Histology</td>
      </tr>

    <tr id="AxillaPathFindingsRow1"> 
      <td style="padding-left: 10px; height: 24px;"><euc:EFormSelect style="width:56px;" LookupCode="OpSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="1" ParentRecordId="2" Table="PathologyFinding" id="PathFindSide_2_1"  /></td>
      <td style="padding-left: 10px;" ><euc:EFormSelect style="width:100px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSite" RecordId="1" ParentRecordId="2" Table="PathologyFinding" id="PathFindSite_2_1"  /></td>
      <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_2_1" LookupCode="PathHistology" Table="PathologyFinding" Field="PathFindHistology" ParentRecordId="2"  RecordId="1" style="width: 270px;" runat="server" /></td>
    </tr>
	<tr id="AxillaPathFindingsRow2"> 
      <td style="padding-left: 10px; height: 24px;"><euc:EFormSelect style="width:56px;" LookupCode="OpSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="2" ParentRecordId="2" Table="PathologyFinding" id="PathFindSide_2_2"  /></td>
      <td style="padding-left: 10px;" ><euc:EFormSelect style="width:100px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSite" RecordId="2" ParentRecordId="2" Table="PathologyFinding" id="PathFindSite_2_2"  /></td>
      <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_2_2" LookupCode="PathHistology" Table="PathologyFinding" Field="PathFindHistology" ParentRecordId="2"  RecordId="2" style="width: 270px;" runat="server" /></td>
	</tr>
	<tr id="AxillaPathFindingsRow3"> 
		  <td style="padding-left: 10px; height: 24px;"><euc:EFormSelect style="width:56px;" LookupCode="OpSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="3" ParentRecordId="2" Table="PathologyFinding" id="PathFindSide_2_3"  /></td>
		  <td style="padding-left: 10px;" ><euc:EFormSelect style="width:100px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSite" RecordId="3" ParentRecordId="2" Table="PathologyFinding" id="PathFindSite_2_3"  /></td>
		  <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_2_3" LookupCode="PathHistology" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="2" RecordId="3" style="width: 270px;" runat="server" /></td>
	</tr>
	<tr id="AxillaPathFindingsRow4"> 
		  <td style="padding-left: 10px; height: 24px;"><euc:EFormSelect style="width:56px;" LookupCode="OpSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="4" ParentRecordId="2" Table="PathologyFinding" id="PathFindSide_2_4"  /></td>
		  <td style="padding-left: 10px;" ><euc:EFormSelect style="width:100px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSite" RecordId="4" ParentRecordId="2" Table="PathologyFinding" id="PathFindSite_2_4"  /></td>
		  <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_2_4" LookupCode="PathHistology" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="2" RecordId="4" style="width: 270px;" runat="server" /></td>
	</tr>
	<tr id="AxillaPathFindingsRow5"> 
      <td style="padding-left: 10px; height: 24px;"><euc:EFormSelect style="width:56px;" LookupCode="OpSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="5" ParentRecordId="2" Table="PathologyFinding" id="PathFindSide_2_5"  /></td>
      <td style="padding-left: 10px;" ><euc:EFormSelect style="width:100px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSite" RecordId="5" ParentRecordId="2" Table="PathologyFinding" id="PathFindSite_2_5"  /></td>
      <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_2_5" LookupCode="PathHistology" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="2" RecordId="5" style="width: 270px;" runat="server" /></td>
</tr>
<tr style="display: none;" id="AxillaPathFindingsRow6"> 
      <td style="padding-left: 10px; height: 24px;"><euc:EFormSelect style="width:56px;" LookupCode="OpSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="6" ParentRecordId="2" Table="PathologyFinding" id="PathFindSide_2_6"  /></td>
      <td style="padding-left: 10px;" ><euc:EFormSelect style="width:100px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSite" RecordId="6" ParentRecordId="2" Table="PathologyFinding" id="PathFindSite_2_6"  /></td>
      <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_2_6" LookupCode="PathHistology" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="2" RecordId="6" style="width: 270px;" runat="server" /></td>
</tr>
<tr style="display: none;" id="AxillaPathFindingsRow7"> 
      <td style="padding-left: 10px; height: 24px;"><euc:EFormSelect style="width:56px;" LookupCode="OpSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="7" ParentRecordId="2" Table="PathologyFinding" id="PathFindSide_2_7"  /></td>
      <td style="padding-left: 10px;" ><euc:EFormSelect style="width:100px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSite" RecordId="7" ParentRecordId="2" Table="PathologyFinding" id="PathFindSite_2_7"  /></td>
      <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_2_7" LookupCode="PathHistology" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="2" RecordId="7" style="width: 270px;" runat="server" /></td>
</tr>
<tr style="display: none;" id="AxillaPathFindingsRow8"> 
      <td style="padding-left: 10px; height: 24px;"><euc:EFormSelect style="width:56px;" LookupCode="OpSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="8" ParentRecordId="2" Table="PathologyFinding" id="PathFindSide_2_8"  /></td>
      <td style="padding-left: 10px;" ><euc:EFormSelect style="width:100px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSite" RecordId="8" ParentRecordId="2" Table="PathologyFinding" id="PathFindSite_2_8"  /></td>
      <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_2_8" LookupCode="PathHistology" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="2"  RecordId="8" style="width: 270px;" runat="server" /></td>
</tr>
<tr style="display: none;" id="AxillaPathFindingsRow9"> 
      <td style="padding-left: 10px; height: 24px;"><euc:EFormSelect style="width:56px;" LookupCode="OpSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="9" ParentRecordId="2" Table="PathologyFinding" id="PathFindSide_2_9"  /></td>
      <td style="padding-left: 10px;" ><euc:EFormSelect style="width:100px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSite" RecordId="9" ParentRecordId="2" Table="PathologyFinding" id="PathFindSite_2_9"  /></td>
      <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_2_9" LookupCode="PathHistology" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="2" RecordId="9" style="width: 270px;" runat="server" /></td>
</tr>
<tr style="display: none;" id="AxillaPathFindingsRow10"> 
      <td style="padding-left: 10px; height: 24px;"><euc:EFormSelect style="width:56px;" LookupCode="OpSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSide" RecordId="10" ParentRecordId="2" Table="PathologyFinding" id="PathFindSide_2_10"  /></td>
      <td style="padding-left: 10px;" ><euc:EFormSelect style="width:100px;" LookupCode="FindSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="PathFindSite" RecordId="10" ParentRecordId="2" Table="PathologyFinding" id="PathFindSite_2_10"  /></td>
      <td style="padding-left: 20px;"><euc:EformComboBox id="PathFindHistology_2_10" LookupCode="PathHistology" Table="PathologyFinding" Field="PathFindHistology"  ParentRecordId="2" RecordId="10" style="width: 270px;" runat="server" /></td>
</tr>
</table><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" onclick="return showFirstAdditionalRow(this,'AxillaProcedurePathFindingsHtmlTable');" /></td>
 </tr>
<%-- <tr >
   <td style=""><table border="0" cellspacing="0" cellpadding="4" style="width: 70%; border: solid 1px #cccccc;">
     <tr class="controlBoxDataGridTitleColumn" id="AxillaTumorDimRow">
       <td height="24" style="width: 180px; font-weight: bold;">Tumor Max Dimension (cm)</td>
       <td ><euc:EformTextBox id="PathTumorMaxDim_1"  Table="AxillaPath" Field="PathTumorMaxDim" ParentRecordId="2" RecordId="1" runat="server" style="width: 60px;"/></td>
     </tr>
	 <tr class="controlBoxDataGridValueColumn" id="AxillaExtentInSituRow">
	 <td height="24" style="font-weight: bold;">Extent of In Situ</td>
	   <td ><euc:EFormSelect id="PathExtentInSitu_1" LookupCode="AxillaExtentInSitu"  Table="AxillaPath" DropDownHeight="auto" DropDownWidth="120"  Field="PathExtentInSitu" ParentRecordId="2" RecordId="1" runat="server" style="width: 100px;"/></td>
     </tr>
	 <tr class="controlBoxDataGridTitleColumn" id="AxillaNuclearGradeRow">
	 <td height="24" style="font-weight: bold;">Nuclear Grade</td>
	   <td ><euc:EformComboBox id="PathNuclearGrade_1" LookupCode="AxillaNuclearGrade"  Table="AxillaPath" DropDownHeight="auto" DropDownWidth="120"  Field="PathNuclearGrade" ParentRecordId="2" RecordId="1" runat="server" style="width: 100px;"/></td>
     </tr>
	 <tr class="controlBoxDataGridValueColumn">
	 <td height="24" style="font-weight: bold;">Lymphatic Invasion</td>
	   <td ><euc:EformComboBox id="PathLymphaticInv_1" LookupCode="YesNoUnknown"  Table="AxillaPath" DropDownHeight="auto" DropDownWidth="auto"  Field="PathLymphaticInv" ParentRecordId="2" RecordId="1" runat="server" style="width: 70px;"/></td>
     </tr>
	 <tr class="controlBoxDataGridTitleColumn">
	 <td height="24" style="font-weight: bold;">Vascular Invasion</td>
	   <td ><euc:EformComboBox id="PathVascularInv_1" LookupCode="YesNoUnknown"  Table="AxillaPath" DropDownHeight="auto" DropDownWidth="auto"  Field="PathVascularInv" ParentRecordId="2" RecordId="1" runat="server" style="width: 70px;"/></td>
     </tr>
	 <tr class="controlBoxDataGridValueColumn">
	 <td height="24" style="font-weight: bold;">Perineural Invasion</td>
	   <td ><euc:EformComboBox id="PathPerineuralInv_1" LookupCode="YesNoUnknown"  Table="AxillaPath" DropDownHeight="auto" DropDownWidth="auto"  Field="PathPerineuralInv" ParentRecordId="2" RecordId="1" runat="server" style="width: 70px;"/></td>
     </tr>
	 <tr class="controlBoxDataGridTitleColumn" id=AxillaMultifocalRow">
	 <td height="24" style="font-weight: bold;">Multifocal Tumor</td>
	   <td ><euc:EformSelect id="PathMultifocal_1" LookupCode="YesNoUnknown"  Table="AxillaPath" DropDownHeight="auto" DropDownWidth="auto"  Field="PathMultifocal" ParentRecordId="2" RecordId="1" runat="server" style="width: 70px;"/></td>
     </tr>
	 <tr class="controlBoxDataGridValueColumn" id="AxillaReexcisionsRow">
	 <td height="24" style="font-weight: bold;">Number of reexcisions</td>
	   <td ><euc:EformTextBox id="PathNumReExcision_1"  Table="AxillaPath" Field="PathNumReExcision" ParentRecordId="2" RecordId="1" runat="server" style="width: 70px;"/></td>
     </tr>
	 <tr class="controlBoxDataGridTitleColumn" id="AxillaMarginStatusRow">
	 <td height="24" style="font-weight: bold;">Margin Status</td>
	   <td ><euc:EformComboBox id="PathMargin_1" LookupCode="BxResult"  Table="AxillaPath" DropDownHeight="auto" DropDownWidth="170"  Field="PathMargin" ParentRecordId="2" RecordId="1" runat="server" style="width: 150px;"/></td>
     </tr>
	 <tr class="controlBoxDataGridValueColumn" id="AxillaPosMarginsRow">
	 <td height="24" style="font-weight: bold;"># of Positive Margins</td>
	   <td ><euc:EformTextBox id="PathNumPositiveMargins_1"  Table="AxillaPath"   Field="PathNumPositiveMargins" ParentRecordId="2" RecordId="1" runat="server" style="width: 70px;"/></td>
     </tr>
   </table></td>
  </tr> --%>
<%-- <tr >
   <td ><strong>Pathology Stage/Grade </strong>&nbsp;&nbsp;&nbsp;(Axilla)
     <table width="400" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px; border: solid 1px #cccccc; background-color: #ffffff;">
         <tr>
           <td class="controlBoxDataGridHeader" style="font-size:10px;">T</td>
           <td class="controlBoxDataGridHeader" style="font-size:10px;">N</td>
           <td   height="18" class="controlBoxDataGridHeader" style="font-size:10px;">M</td>
           <td   class="controlBoxDataGridHeader" style="font-size:10px;">Grade</td>
         </tr>
         <tr id="AxillaPathStageRow1">
           <td style="padding-left: 10px; height: 24px;">
		   <euc:EformHidden id="PathStageDisease_1" runat="server" RecordId="1" ParentRecordId="2" Table="PathologyStageGrade" Field="PathStageDisease" Value="Axilla" />
	   <euc:EformHidden id="PathStageSystem_1" runat="server" RecordId="1" ParentRecordId="2" Table="PathologyStageGrade" Field="PathStageSystem" Value="AJCC_02" />
	<euc:EformSelect id="PathStageT_1" LookupCode="StagePath_Axilla_02_T"  Table="PathologyStageGrade" DropDownWidth="450"  Field="PathStageT" ParentRecordId="2" RecordId="1" runat="server" style="width: 50px;" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathStageN_1" LookupCode="StagePath_Axilla_02_N"  Table="PathologyStageGrade" DropDownWidth="450"  Field="PathStageN" ParentRecordId="2" RecordId="1" runat="server" style="width: 50px;" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathStageM_1" LookupCode="StagePath_Axilla_02_M"  Table="PathologyStageGrade" DropDownWidth="300" DropDownHeight="auto"  Field="PathStageM" ParentRecordId="2" RecordId="1" runat="server" style="width: 50px;" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformSelect id="PathGrade_1" LookupCode="PathGrade"  Table="PathologyStageGrade" DropDownWidth="180"  Field="PathGrade" ParentRecordId="2" RecordId="1" runat="server" style="width: 160px;" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
         </tr>
         <tr id="AxillaPathStageRow2">
           <td style="padding-left: 10px; height: 24px;">
		   <euc:EformHidden id="PathStageDisease_2" runat="server" RecordId="2" ParentRecordId="2" Table="PathologyStageGrade" Field="PathStageDisease" Value="Axilla" />
	   <euc:EformHidden id="PathStageSystem_2" runat="server" RecordId="2" ParentRecordId="2" Table="PathologyStageGrade" Field="PathStageSystem" Value="AJCC_02" />
	<euc:EformSelect id="PathStageT_2" LookupCode="StagePath_Axilla_02_T"  Table="PathologyStageGrade" DropDownWidth="450"  Field="PathStageT" ParentRecordId="2" RecordId="2" runat="server" style="width: 50px;" EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathStageN_2" LookupCode="StagePath_Axilla_02_N"  Table="PathologyStageGrade" DropDownWidth="450"  Field="PathStageN" ParentRecordId="2" RecordId="2" runat="server" style="width: 50px;" EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathStageM_2" LookupCode="StagePath_Axilla_02_M"  Table="PathologyStageGrade" DropDownWidth="300" DropDownHeight="auto"  Field="PathStageM" ParentRecordId="2" RecordId="2" runat="server" style="width: 50px;" EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformSelect id="PathGrade_2" LookupCode="PathGrade"  Table="PathologyStageGrade" DropDownWidth="180"  Field="PathGrade" ParentRecordId="2" RecordId="2" runat="server" style="width: 160px;" EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"/></td>
         </tr>
       </table>    </td>
 </tr> --%>
 <tr >
   <td ><strong>Lymph Node Pathology Findings </strong>&nbsp;&nbsp;&nbsp;(Axilla)
       <table width="450" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" id="AxillaNodePathFindingsHtmlTable"  style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px; border: solid 1px #cccccc; background-color: #ffffff;">
         <tr>
           <td class="controlBoxDataGridHeader" style="font-size:10px;">Side</td>
           <td class="controlBoxDataGridHeader" style="font-size:10px;">Site</td>
           <td class="controlBoxDataGridHeader" style="font-size:10px;">Extension</td>
           <td   height="18" class="controlBoxDataGridHeader" style="font-size:10px;"># Positive Nodes </td>
           <td   class="controlBoxDataGridHeader" style="font-size:10px;" colspan="2">Total # Nodes </td>
         </tr>
         <tr id="AxillaPathNodeRow1">
           <td style="padding-left: 10px; height: 24px;">
		        <euc:EFormSelect style="width:100px;" LookupCode="NodeSide" DropDownHeight="auto" DropDownWidth="100"  runat="server"  Field="PathFindSide" ParentRecordId="2" RecordId="1" Table="NodePathFinding" id="PathFindSide_1" EnableHiddenOnUIEvent="PathFindSite_1" /></td>
	       <td style="padding-left: 10px; height: 24px;">
	        <euc:EformSelect id="PathFindSite_1" LookupCode="AxillaNodeSite" runat="server" ParentRecordId="2" RecordId="1" Table="NodePathFinding" 
	            Field="PathFindSite" DropDownHeight="auto"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathFindExtension_1" LookupCode="AxillaNodeExtension"  Table="NodePathFinding" DropDownHeight="auto" DropDownWidth="70"  Field="PathFindExtension" ParentRecordId="2" RecordId="1" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_1" /></td>
           <td style="padding-left: 15px;" ><euc:EformTextBox id="PathFindPosNodes_1"  Table="NodePathFinding"   Field="PathFindPosNodes" ParentRecordId="2" RecordId="1" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_1" /></td>
           <td style="padding-left: 15px;padding-right: 10px;"><euc:EformTextBox id="PathFindNumNodes_1"  Table="NodePathFinding"   Field="PathFindNumNodes" ParentRecordId="2" RecordId="1" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_1" /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
         </tr>
		 <tr id="AxillaPathNodeRow2">
           <td style="padding-left: 10px; height: 24px;">
		   <euc:EFormSelect style="width:100px;" LookupCode="NodeSide" DropDownHeight="auto" DropDownWidth="100"  runat="server"  Field="PathFindSide" ParentRecordId="2" RecordId="2" Table="NodePathFinding" id="PathFindSide_2" EnableHiddenOnUIEvent="PathFindSite_2" /></td>
		   <td style="padding-left: 10px; height: 24px;">
	        <euc:EformSelect id="PathFindSite_2" LookupCode="AxillaNodeSite" runat="server" ParentRecordId="2" RecordId="2" Table="NodePathFinding" 
	            Field="PathFindSite" DropDownHeight="auto"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathFindExtension_2" LookupCode="AxillaNodeExtension"  Table="NodePathFinding" DropDownHeight="auto" DropDownWidth="70"  Field="PathFindExtension" ParentRecordId="2" RecordId="2" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_2" /></td>
           <td style="padding-left: 15px;" ><euc:EformTextBox id="PathFindPosNodes_2"  Table="NodePathFinding"   Field="PathFindPosNodes" ParentRecordId="2" RecordId="2" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_2" /></td>
           <td style="padding-left: 15px;padding-right: 10px;"><euc:EformTextBox id="PathFindNumNodes_2"  Table="NodePathFinding"   Field="PathFindNumNodes" ParentRecordId="2" RecordId="2" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_2" /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
         </tr>
		 <tr id="AxillaPathNodeRow3">
           <td style="padding-left: 10px; height: 24px;">
		   <euc:EFormSelect style="width:100px;" LookupCode="NodeSide" DropDownHeight="auto" DropDownWidth="100"  runat="server"  Field="PathFindSide" ParentRecordId="2" RecordId="3" Table="NodePathFinding" id="PathFindSide_3" EnableHiddenOnUIEvent="PathFindSite_3" /></td>
		   <td style="padding-left: 10px; height: 24px;">
	        <euc:EformSelect id="PathFindSite_3" LookupCode="AxillaNodeSite" runat="server" ParentRecordId="2" RecordId="3" Table="NodePathFinding" 
	            Field="PathFindSite" DropDownHeight="auto"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathFindExtension_3" LookupCode="AxillaNodeExtension"  Table="NodePathFinding" DropDownHeight="auto" DropDownWidth="70"  Field="PathFindExtension" ParentRecordId="2" RecordId="3" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_3" /></td>
           <td style="padding-left: 15px;" ><euc:EformTextBox id="PathFindPosNodes_3"  Table="NodePathFinding"   Field="PathFindPosNodes" ParentRecordId="2" RecordId="3" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_3" /></td>
           <td style="padding-left: 15px;padding-right: 10px;"><euc:EformTextBox id="PathFindNumNodes_3"  Table="NodePathFinding"   Field="PathFindNumNodes" ParentRecordId="2" RecordId="3" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_3" /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
         </tr>
		 <tr id="AxillaPathNodeRow4">
           <td style="padding-left: 10px; height: 24px;">
		   <euc:EFormSelect style="width:100px;" LookupCode="NodeSide" DropDownHeight="auto" DropDownWidth="100"  runat="server"  Field="PathFindSide" ParentRecordId="2" RecordId="4" Table="NodePathFinding" id="PathFindSide_4" EnableHiddenOnUIEvent="PathFindSite_4" /></td>
		   <td style="padding-left: 10px; height: 24px;">
	        <euc:EformSelect id="PathFindSite_4" LookupCode="AxillaNodeSite" runat="server" ParentRecordId="2" RecordId="4" Table="NodePathFinding" 
	            Field="PathFindSite" DropDownHeight="auto"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathFindExtension_4" LookupCode="AxillaNodeExtension"  Table="NodePathFinding" DropDownHeight="auto" DropDownWidth="70"  Field="PathFindExtension" ParentRecordId="2" RecordId="4" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_4" /></td>
           <td style="padding-left: 15px;" ><euc:EformTextBox id="PathFindPosNodes_4"  Table="NodePathFinding"   Field="PathFindPosNodes" ParentRecordId="2" RecordId="4" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_4" /></td>
           <td style="padding-left: 15px;padding-right: 10px;"><euc:EformTextBox id="PathFindNumNodes_4"  Table="NodePathFinding"   Field="PathFindNumNodes" ParentRecordId="2" RecordId="4" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_4" /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
         </tr>
		 <tr id="AxillaPathNodeRow5">
           <td style="padding-left: 10px; height: 24px;">
		   <euc:EFormSelect style="width:100px;" LookupCode="NodeSide" DropDownHeight="auto" DropDownWidth="100"  runat="server"  Field="PathFindSide" ParentRecordId="2" RecordId="5" Table="NodePathFinding" id="PathFindSide_5" EnableHiddenOnUIEvent="PathFindSite_5" /></td>
		   <td style="padding-left: 10px; height: 24px;">
	        <euc:EformSelect id="PathFindSite_5" LookupCode="AxillaNodeSite" runat="server" ParentRecordId="2" RecordId="5" Table="NodePathFinding" 
	            Field="PathFindSite" DropDownHeight="auto"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathFindExtension_5" LookupCode="AxillaNodeExtension"  Table="NodePathFinding" DropDownHeight="auto" DropDownWidth="70"  Field="PathFindExtension" ParentRecordId="2" RecordId="5" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_5" /></td>
           <td style="padding-left: 15px;" ><euc:EformTextBox id="PathFindPosNodes_5"  Table="NodePathFinding"   Field="PathFindPosNodes" ParentRecordId="2" RecordId="5" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_5" /></td>
           <td style="padding-left: 15px;padding-right: 10px;"><euc:EformTextBox id="PathFindNumNodes_5"  Table="NodePathFinding"   Field="PathFindNumNodes" ParentRecordId="2" RecordId="5" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_5" /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
         </tr>
		 <tr style="display: none;" id="AxillaPathNodeRow6">
           <td style="padding-left: 10px; height: 24px;">
		   <euc:EFormSelect style="width:100px;" LookupCode="NodeSide" DropDownHeight="auto" DropDownWidth="100"  runat="server"  Field="PathFindSide" ParentRecordId="2" RecordId="6" Table="NodePathFinding" id="PathFindSide_6" EnableHiddenOnUIEvent="PathFindSite_6" /></td>
		   <td style="padding-left: 10px; height: 24px;">
	        <euc:EformSelect id="PathFindSite_6" LookupCode="AxillaNodeSite" runat="server" ParentRecordId="2" RecordId="6" Table="NodePathFinding" 
	            Field="PathFindSite" DropDownHeight="auto"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathFindExtension_6" LookupCode="AxillaNodeExtension"  Table="NodePathFinding" DropDownHeight="auto" DropDownWidth="70"  Field="PathFindExtension" ParentRecordId="2" RecordId="6" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_6" /></td>
           <td style="padding-left: 15px;" ><euc:EformTextBox id="PathFindPosNodes_6"  Table="NodePathFinding"   Field="PathFindPosNodes" ParentRecordId="2" RecordId="6" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_6" /></td>
           <td style="padding-left: 15px;padding-right: 10px;"><euc:EformTextBox id="PathFindNumNodes_6"  Table="NodePathFinding"   Field="PathFindNumNodes" ParentRecordId="2" RecordId="6" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_6" /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
         </tr>
		 <tr style="display: none;" id="AxillaPathNodeRow7">
           <td style="padding-left: 10px; height: 24px;">
		   <euc:EFormSelect style="width:100px;" LookupCode="NodeSide" DropDownHeight="auto" DropDownWidth="100"  runat="server"  Field="PathFindSide" ParentRecordId="2" RecordId="7" Table="NodePathFinding" id="PathFindSide_7" EnableHiddenOnUIEvent="PathFindSite_7" /></td>
		   <td style="padding-left: 10px; height: 24px;">
	        <euc:EformSelect id="PathFindSite_7" LookupCode="AxillaNodeSite" runat="server" ParentRecordId="2" RecordId="7" Table="NodePathFinding" 
	            Field="PathFindSite" DropDownHeight="auto"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathFindExtension_7" LookupCode="AxillaNodeExtension"  Table="NodePathFinding" DropDownHeight="auto" DropDownWidth="70"  Field="PathFindExtension" ParentRecordId="2" RecordId="7" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_7" /></td>
           <td style="padding-left: 15px;" ><euc:EformTextBox id="PathFindPosNodes_7"  Table="NodePathFinding"   Field="PathFindPosNodes" ParentRecordId="2" RecordId="7" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_7" /></td>
           <td style="padding-left: 15px;padding-right: 10px;"><euc:EformTextBox id="PathFindNumNodes_7"  Table="NodePathFinding"   Field="PathFindNumNodes" ParentRecordId="2" RecordId="7" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_7" /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
         </tr>
		 <tr style="display: none;" id="AxillaPathNodeRow8">
           <td style="padding-left: 10px; height: 24px;">
		   <euc:EFormSelect style="width:100px;" LookupCode="NodeSide" DropDownHeight="auto" DropDownWidth="100"  runat="server"  Field="PathFindSide" ParentRecordId="2" RecordId="8" Table="NodePathFinding" id="PathFindSide_8" EnableHiddenOnUIEvent="PathFindSite_8" /></td>
		   <td style="padding-left: 10px; height: 24px;">
	        <euc:EformSelect id="PathFindSite_8" LookupCode="AxillaNodeSite" runat="server" ParentRecordId="2" RecordId="8" Table="NodePathFinding" 
	            Field="PathFindSite" DropDownHeight="auto"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathFindExtension_8" LookupCode="AxillaNodeExtension"  Table="NodePathFinding" DropDownHeight="auto" DropDownWidth="70"  Field="PathFindExtension" ParentRecordId="2" RecordId="8" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_8" /></td>
           <td style="padding-left: 15px;" ><euc:EformTextBox id="PathFindPosNodes_8"  Table="NodePathFinding"   Field="PathFindPosNodes" ParentRecordId="2" RecordId="8" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_8" /></td>
           <td style="padding-left: 15px;padding-right: 10px;"><euc:EformTextBox id="PathFindNumNodes_8"  Table="NodePathFinding"   Field="PathFindNumNodes" ParentRecordId="2" RecordId="8" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_8" /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
         </tr>
		 <tr style="display: none;" id="AxillaPathNodeRow9">
           <td style="padding-left: 10px; height: 24px;">
		   <euc:EFormSelect style="width:100px;" LookupCode="NodeSide" DropDownHeight="auto" DropDownWidth="100"  runat="server"  Field="PathFindSide" ParentRecordId="2" RecordId="9" Table="NodePathFinding" id="PathFindSide_9" EnableHiddenOnUIEvent="PathFindSite_9" /></td>
		   <td style="padding-left: 10px; height: 24px;">
	        <euc:EformSelect id="PathFindSite_9" LookupCode="AxillaNodeSite" runat="server" ParentRecordId="2" RecordId="9" Table="NodePathFinding" 
	            Field="PathFindSite" DropDownHeight="auto"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathFindExtension_9" LookupCode="AxillaNodeExtension"  Table="NodePathFinding" DropDownHeight="auto" DropDownWidth="70"  Field="PathFindExtension" ParentRecordId="2" RecordId="9" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_9" /></td>
           <td style="padding-left: 15px;" ><euc:EformTextBox id="PathFindPosNodes_9"  Table="NodePathFinding"   Field="PathFindPosNodes" ParentRecordId="2" RecordId="9" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_9" /></td>
           <td style="padding-left: 15px;padding-right: 10px;"><euc:EformTextBox id="PathFindNumNodes_9"  Table="NodePathFinding"   Field="PathFindNumNodes" ParentRecordId="2" RecordId="9" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_9" /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
         </tr>
		 <tr style="display: none;" id="AxillaPathNodeRow10">
           <td style="padding-left: 10px; height: 24px;">
		   <euc:EFormSelect style="width:100px;" LookupCode="NodeSide" DropDownHeight="auto" DropDownWidth="100"  runat="server"  Field="PathFindSide" ParentRecordId="2" RecordId="10" Table="NodePathFinding" id="PathFindSide_10" EnableHiddenOnUIEvent="PathFindSite_10" /></td>
		   <td style="padding-left: 10px; height: 24px;">
	        <euc:EformSelect id="PathFindSite_10" LookupCode="AxillaNodeSite" runat="server" ParentRecordId="2" RecordId="10" 
	            Table="NodePathFinding" Field="PathFindSite" DropDownHeight="auto"/></td>
           <td style="padding-left: 10px;" ><euc:EformSelect id="PathFindExtension_10" LookupCode="AxillaNodeExtension"  Table="NodePathFinding" DropDownHeight="auto" DropDownWidth="70"  Field="PathFindExtension" ParentRecordId="2" RecordId="10" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_10" /></td>
           <td style="padding-left: 15px;" ><euc:EformTextBox id="PathFindPosNodes_10"  Table="NodePathFinding"   Field="PathFindPosNodes" ParentRecordId="2" RecordId="10" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_10" /></td>
           <td style="padding-left: 15px;padding-right: 10px;"><euc:EformTextBox id="PathFindNumNodes_10"  Table="NodePathFinding"   Field="PathFindNumNodes" ParentRecordId="2" RecordId="10" runat="server" style="width: 70px;"  EnableHiddenOnUIEvent="PathFindSite_10" /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>
         </tr>
       </table>
     <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" onclick="return showFirstAdditionalRow(this,'AxillaNodePathFindingsHtmlTable');" /></td>
 </tr>
 <tr >
   <td ><strong>Pathology Tests  </strong>&nbsp;&nbsp;&nbsp;(Axilla)
       <table width="550" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" id="AxillaPathTestHtmlTable"  style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px; border: solid 1px #cccccc; background-color: #ffffff;">
         <tr>
           <td class="controlBoxDataGridHeader" style="font-size:10px;">Date</td>
           <td class="controlBoxDataGridHeader" style="font-size:10px;">Test</td>
           <td   height="18" class="controlBoxDataGridHeader" style="font-size:10px;">Result</td>
           <td   class="controlBoxDataGridHeader" style="font-size:10px;" colspan="2">Notes</td>
         </tr>
         <tr id="AxillaPathTestRow1">
           <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="_1_PathDateText" Table="PathTest" Field="PathDateText" RecordId="1" ParentRecordId="2" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="_1_PathDate" Table="PathTest" Field="PathDate" ParentRecordId="2"  RecordId="1" runat="server"/></td>
           <td style="padding-left: 10px;" >
		   <euc:EformComboBox id="PathTest_1" LookupCode="PathTest,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="280"  Field="PathTest" ParentRecordId="2" RecordId="1" runat="server" style="width: 100px;" onblur="setDefaultPathTestDate(this,1)" /></td>
           <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_1" LookupCode="PathTestResult"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="2" RecordId="1" runat="server" style="width: 70px;"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_1" Table="PathTest" Field="PathNotes" ParentRecordId="2" RecordId="1" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server"/></td>
         </tr>
		 <tr id="AxillaPathTestRow2">
           <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="_2_PathDateText" Table="PathTest" Field="PathDateText" RecordId="2" ParentRecordId="2" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="_2_PathDate" Table="PathTest" Field="PathDate" ParentRecordId="2"  RecordId="2" runat="server"/></td>
           <td style="padding-left: 10px;" >
		   <euc:EformComboBox id="PathTest_2" LookupCode="PathTest,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="280"  Field="PathTest" ParentRecordId="2" RecordId="2" runat="server" style="width: 100px;" onblur="setDefaultPathTestDate(this,2)"/></td>
           <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_2" LookupCode="PathTestResult"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="2" RecordId="2" runat="server" style="width: 70px;"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_2" Table="PathTest" Field="PathNotes" ParentRecordId="2" RecordId="2" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server"/></td>
         </tr>
		 <tr id="AxillaPathTestRow3">
           <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="_3_PathDateText" Table="PathTest" Field="PathDateText" RecordId="3" ParentRecordId="2" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="_3_PathDate" Table="PathTest" Field="PathDate" ParentRecordId="2"  RecordId="3" runat="server"/></td>
           <td style="padding-left: 10px;" >
		   <euc:EformComboBox id="PathTest_3" LookupCode="PathTest,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="280"  Field="PathTest" ParentRecordId="2" RecordId="3" runat="server" style="width: 100px;" onblur="setDefaultPathTestDate(this,3)"/></td>
           <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_3" LookupCode="PathTestResult"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="2" RecordId="3" runat="server" style="width: 70px;"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_3" Table="PathTest" Field="PathNotes" ParentRecordId="2" RecordId="3" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server"/></td>
         </tr>
		 <tr id="AxillaPathTestRow4">
           <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="_4_PathDateText" Table="PathTest" Field="PathDateText" RecordId="4" ParentRecordId="2" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="_4_PathDate" Table="PathTest" Field="PathDate" ParentRecordId="2"  RecordId="4" runat="server"/></td>
           <td style="padding-left: 10px;" >
		   <euc:EformComboBox id="PathTest_4" LookupCode="PathTest,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="280"  Field="PathTest" ParentRecordId="2" RecordId="4" runat="server" style="width: 100px;" onblur="setDefaultPathTestDate(this,4)"/></td>
           <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_4" LookupCode="PathTestResult"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="2" RecordId="4" runat="server" style="width: 70px;"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_4" Table="PathTest" Field="PathNotes" ParentRecordId="2" RecordId="4" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server"/></td>
         </tr>
		 <tr id="AxillaPathTestRow5">
           <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="_5_PathDateText" Table="PathTest" Field="PathDateText" RecordId="5" ParentRecordId="2" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="_5_PathDate" Table="PathTest" Field="PathDate" ParentRecordId="2"  RecordId="5" runat="server"/></td>
           <td style="padding-left: 10px;" >
		   <euc:EformComboBox id="PathTest_5" LookupCode="PathTest,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="280"  Field="PathTest" ParentRecordId="2" RecordId="5" runat="server" style="width: 100px;" onblur="setDefaultPathTestDate(this,5)"/></td>
           <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_5" LookupCode="PathTestResult"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="2" RecordId="5" runat="server" style="width: 70px;"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_5" Table="PathTest" Field="PathNotes" ParentRecordId="2" RecordId="5" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server"/></td>
         </tr>
		 <tr style="display: none;" id="AxillaPathTestRow6">
           <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="_6_PathDateText" Table="PathTest" Field="PathDateText" RecordId="6" ParentRecordId="2" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="_6_PathDate" Table="PathTest" Field="PathDate" ParentRecordId="2"  RecordId="6" runat="server"/></td>
           <td style="padding-left: 10px;" >
		   <euc:EformComboBox id="PathTest_6" LookupCode="PathTest,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="280"  Field="PathTest" ParentRecordId="2" RecordId="6" runat="server" style="width: 100px;" onblur="setDefaultPathTestDate(this,6)"/></td>
           <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_6" LookupCode="PathTestResult"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="2" RecordId="6" runat="server" style="width: 70px;"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_6" Table="PathTest" Field="PathNotes" ParentRecordId="2" RecordId="6" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server"/></td>
         </tr>
		 <tr style="display: none;" id="AxillaPathTestRow7">
           <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="_7_PathDateText" Table="PathTest" Field="PathDateText" RecordId="7" ParentRecordId="2" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="_7_PathDate" Table="PathTest" Field="PathDate" ParentRecordId="2"  RecordId="7" runat="server"/></td>
           <td style="padding-left: 10px;" >
		   <euc:EformComboBox id="PathTest_7" LookupCode="PathTest,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="280"  Field="PathTest" ParentRecordId="2" RecordId="7" runat="server" style="width: 100px;" onblur="setDefaultPathTestDate(this,7)"/></td>
           <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_7" LookupCode="PathTestResult"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="2" RecordId="7" runat="server" style="width: 70px;"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_7" Table="PathTest" Field="PathNotes" ParentRecordId="2" RecordId="7" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server"/></td>
         </tr>
		 <tr style="display: none;" id="AxillaPathTestRow8">
           <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="_8_PathDateText" Table="PathTest" Field="PathDateText" RecordId="8" ParentRecordId="2" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="_8_PathDate" Table="PathTest" Field="PathDate" ParentRecordId="2"  RecordId="8" runat="server"/></td>
           <td style="padding-left: 10px;" >
		   <euc:EformComboBox id="PathTest_8" LookupCode="PathTest,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="280"  Field="PathTest" ParentRecordId="2" RecordId="8" runat="server" style="width: 100px;" onblur="setDefaultPathTestDate(this,8)"/></td>
           <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_8" LookupCode="PathTestResult"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="2" RecordId="8" runat="server" style="width: 70px;"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_8" Table="PathTest" Field="PathNotes" ParentRecordId="2" RecordId="8" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server"/></td>
         </tr>
		 <tr style="display: none;" id="AxillaPathTestRow9">
           <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="_9_PathDateText" Table="PathTest" Field="PathDateText" RecordId="9" ParentRecordId="2" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="_9_PathDate" Table="PathTest" Field="PathDate"  ParentRecordId="2" RecordId="9" runat="server"/></td>
           <td style="padding-left: 10px;" >
		   <euc:EformComboBox id="PathTest_9" LookupCode="PathTest,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="280"  Field="PathTest" ParentRecordId="2" RecordId="9" runat="server" style="width: 100px;" onblur="setDefaultPathTestDate(this,9)"/></td>
           <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_9" LookupCode="PathTestResult"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="2" RecordId="9" runat="server" style="width: 70px;"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_9" Table="PathTest" Field="PathNotes" ParentRecordId="2" RecordId="9" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server"/></td>
         </tr>
		 <tr style="display: none;" id="AxillaPathTestRow10">
           <td style="padding-left: 10px; height: 24px;"><euc:EformTextBox id="_10_PathDateText" Table="PathTest" Field="PathDateText" RecordId="10" ParentRecordId="2" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="_10_PathDate" Table="PathTest" Field="PathDate"  ParentRecordId="2" RecordId="10" runat="server"/></td>
           <td style="padding-left: 10px;" >
		   <euc:EformComboBox id="PathTest_10" LookupCode="PathTest,Disease,Breast"  Table="PathTest" DropDownHeight="auto" DropDownWidth="280"  Field="PathTest" ParentRecordId="2" RecordId="10" runat="server" style="width: 100px;" onblur="setDefaultPathTestDate(this,10)"/></td>
           <td style="padding-left: 10px;" ><euc:EformComboBox id="PathResult_10" LookupCode="PathTestResult"  Table="PathTest" DropDownHeight="auto" DropDownWidth="auto"  Field="PathResult" ParentRecordId="2" RecordId="10" runat="server" style="width: 70px;"/></td>
           <td style="padding-left: 10px;padding-right: 10px;"><euc:EformTextBox id="PathNotes_10" Table="PathTest" Field="PathNotes" ParentRecordId="2" RecordId="10" runat="server"   style="width: 170px;" ShowTextEditor="True"  /></td>
           <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server"/></td>
         </tr>
     </table>
       <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" onclick="return showFirstAdditionalRow(this,'AxillaPathTestHtmlTable');" /></td>
 </tr>
 
 <tr id="AxillaProcNotesRow">
    <td><strong>Notes</strong><br />
        <euc:EformTextBox id="PathNotes" Table="Pathology" Field="PathNotes" RecordId="2" runat="server" Width="500px" Height="80px" 
            ShowTextEditor="true"/>
    </td>
 </tr>
 </table>
 </td></tr>
</table><table>
    <tr id="AxillaProcAbsentRow">
        <td>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_2"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="2" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_2"
                Runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="TableName" ID="TableName_2"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldName" ID="FieldName_2"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_2"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_2"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_2"
                runat="server" style="width:1px;display:none;"/>
        </td>
    </tr>
</table><br/><br/>

<script type="text/javascript">

    //Adds events to controls
    function addEvents(LNPathSideID,LNPathSiteID)
    { 
        $(LNPathSideID).addEvent('blur',curry(SetHiddenFields,LNPathSideID,LNPathSiteID));
   }

    addEvents($('<%= PathFindSide_1.ClientID %>'),$('<%= PathFindSite_1.ClientID %>'));
    addEvents($('<%= PathFindSide_2.ClientID %>'),$('<%= PathFindSite_2.ClientID %>'));
    addEvents($('<%= PathFindSide_3.ClientID %>'),$('<%= PathFindSite_3.ClientID %>'));
    addEvents($('<%= PathFindSide_4.ClientID %>'),$('<%= PathFindSite_4.ClientID %>'));
    addEvents($('<%= PathFindSide_5.ClientID %>'),$('<%= PathFindSite_5.ClientID %>'));
    addEvents($('<%= PathFindSide_6.ClientID %>'),$('<%= PathFindSite_6.ClientID %>'));
    addEvents($('<%= PathFindSide_7.ClientID %>'),$('<%= PathFindSite_7.ClientID %>'));
    addEvents($('<%= PathFindSide_8.ClientID %>'),$('<%= PathFindSite_8.ClientID %>'));
    addEvents($('<%= PathFindSide_9.ClientID %>'),$('<%= PathFindSite_9.ClientID %>'));
    addEvents($('<%= PathFindSide_10.ClientID %>'),$('<%= PathFindSite_10.ClientID %>'));

    
function SetHiddenFields(LNPathSideID,LNPathSiteID)
{
    if (LNPathSideID.value != '')
    {
        LNPathSiteID.value = 'Sentinel Lymph Node';        
    }
}
</script>