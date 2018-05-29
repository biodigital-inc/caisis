<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PancreatitisFamilyMembersWithAbsentRecord" CodeFile="PancreatitisFamilyMembersWithAbsentRecord.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.FamilyHistoryTable = "FamilyHistoryTable";
	tableArray.famMemDiag_1 = "famMemDiag_1";
	tableArray.famMemDiag_2 = "famMemDiag_2";
	tableArray.famMemDiag_3 = "famMemDiag_3";
	tableArray.famMemDiag_4 = "famMemDiag_4";
	tableArray.famMemDiag_5 = "famMemDiag_5";
	tableArray.famMemDiag_6 = "famMemDiag_6";
	tableArray.famMemDiag_7 = "famMemDiag_7";
	tableArray.famMemDiag_8 = "famMemDiag_8";
	tableArray.famMemDiag_9 = "famMemDiag_9";
	tableArray.famMemDiag_10 = "famMemDiag_10";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PancreatitisFamilyMembersWithAbsentRecord" /><br/>
<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Family History"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="FamHxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="FamHxRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="FamHxAbsentDiv" runat="server" style="display: none;" >
<br /><br /> 
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="AbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_11"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="11" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_11"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table>

</div>
                 
<div id="FamHxDiv" runat="server" style="display: none;">
<br /><br />
<table  width="500" border="0" cellpadding="0" cellspacing="0" class="ClinicalEformTable" id="Table1">
          
    <asp:Repeater ID="FamilyMemHx" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 
	<ItemTemplate> 
	    
         <tr class="controlBoxDataGridTitleColumn" >
			    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"  >&nbsp;Side of Family</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Relation</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Death Age</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;</td>
        </tr>
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('FamilyMembers',  <%# DataBinder.Eval(Container.DataItem, "FamilyMemberId") %>, 'FamMemSide,FamMemRelation,FamMemDeathAge', 'FamilyMembers');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemSide")%></td>
		   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemRelation")%></td>
		   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemDeathAge")%></td>
		   <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>    
		
	    <tr class="controlBoxDataGridTitleColumn">
	        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;Diagnosis</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Age</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Notes</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" ></td>
         </tr>
		
		<asp:Repeater ID="FamilyMemHx2" runat="server" > 
        <ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('FamilyMemberDiagnosis', <%# DataBinder.Eval(Container.DataItem, "FamilyMemberDiagnosisId") %>, 'FamMemDiagnosis,FamMemDiagnosisAge,FamMemNotes', 'FamilyMemberDiagnosis');"> 
		   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemDiagnosis")%></td>
		   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemDiagnosisAge")%></td>
		   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemNotes")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>   
        </ItemTemplate>
    </asp:Repeater>  
    <tr>
        <td style="text-align: left;" colspan="3" >&nbsp;</td>

    </tr>
    
	</ItemTemplate>
  </asp:Repeater>
  

  <tr id="NoFamMemHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No family member history has been recorded for this patient.</td>
  </tr>  

</table>

<br /><strong>Add Family History</strong>
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="FamilyHistoryTable">

  <tr> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Side of Family</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Relation</td>
    <td width="10%" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Death Age</td>
    <td width="13%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Diagnosis</td>
    <td width="5%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Age</td>
    <td width="15%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td> 
   <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;</td>
  </tr>
  <tr>
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_1"         RecordID="1"  Runat="server" TabIndex="1" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_1"     RecordID="1"  Runat="server" TabIndex="2" LookupCode="FamHxRelation"/></td>    
    <td height="28" valign="top" style="text-align: center;" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_1"     RecordID="1"  Runat="server" TabIndex="3" /></td>    
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >
        <table id="famMemDiag_1" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_1a"  RecordID="1"  Runat="server" TabIndex="4" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_1a" RecordID="1"  Runat="server" TabIndex="5" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_1a"      RecordID="1"  Runat="server" TabIndex="6" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
              <tr id="famMemDiag_1b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                         <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_1b"  RecordID="2"  Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top"><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_1b" RecordID="2"  Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                          <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_1b"      RecordID="2"  Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
              </tr>
              <tr id="famMemDiag_1c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_1c"  RecordID="3"  Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_1c" RecordID="3"  Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_1c"      RecordID="3"  Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
              </tr>
              <tr >
                <td height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'famMemDiag_1');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center" valign="middle" ><euc:EformDeleteIcon runat="server"/></td>
  </tr>

  
  
  <tr style="DISPLAY: none">
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_2"         RecordID="2"  Runat="server" TabIndex="7" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_2"     RecordID="2"  Runat="server" TabIndex="8" LookupCode="FamHxRelation"/></td>    
    <td height="28" style="text-align: center;" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_2"     RecordID="2"  Runat="server" TabIndex="9" /></td>  
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >

        <table id="famMemDiag_2" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_2a"  RecordID="1" ParentRecordId="2" Runat="server" TabIndex="10" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_2a" RecordID="1" ParentRecordId="2" Runat="server" TabIndex="11" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_2a"      RecordID="1" ParentRecordId="2" Runat="server" TabIndex="12" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>           </tr>
              <tr id="famMemDiag_2b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_2b"  RecordID="2" ParentRecordId="2" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_2b" RecordID="2" ParentRecordId="2" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_2b"      RecordID="2" ParentRecordId="2" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
              </tr>
              <tr id="famMemDiag_2c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_2c"  RecordID="3" ParentRecordId="2" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_2c" RecordID="3" ParentRecordId="2" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_2c"      RecordID="3" ParentRecordId="2" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
              </tr>
              <tr>
                <td height="28" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'famMemDiag_2');" /></td>    
              </tr>  
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center" valign="middle"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_3"         RecordID="3"  Runat="server" TabIndex="13" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_3"     RecordID="3"  Runat="server" TabIndex="14" LookupCode="FamHxRelation"/></td>    
    <td height="28" style="text-align: center;" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_3"     RecordID="3"  Runat="server" TabIndex="15" /></td>  
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >

        <table id="famMemDiag_3" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_3a"  RecordID="1" ParentRecordId="3" Runat="server" TabIndex="16" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_3a" RecordID="1" ParentRecordId="3" Runat="server" TabIndex="17" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_3a"      RecordID="1" ParentRecordId="3" Runat="server" TabIndex="18" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>           </tr>
              <tr id="famMemDiag_3b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_3b"  RecordID="2" ParentRecordId="3" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_3b" RecordID="2" ParentRecordId="3" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_3b"      RecordID="2" ParentRecordId="3" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
              </tr>
              <tr id="famMemDiag_3c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_3c"  RecordID="3" ParentRecordId="3" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_3c" RecordID="3" ParentRecordId="3" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_3c"      RecordID="3" ParentRecordId="3" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
              </tr>
              <tr>
                <td height="28" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'famMemDiag_3');" /></td>    
              </tr>  
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center" valign="middle"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
 

  <tr style="DISPLAY: none">
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_4"         RecordID="4"  Runat="server" TabIndex="13" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_4"     RecordID="4"  Runat="server" TabIndex="14" LookupCode="FamHxRelation"/></td>    
    <td height="28" style="text-align: center;" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_4"     RecordID="4"  Runat="server" TabIndex="15" /></td>  
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >

        <table id="famMemDiag_4" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_4a"  RecordID="1" ParentRecordId="4" Runat="server" TabIndex="16" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_4a" RecordID="1" ParentRecordId="4" Runat="server" TabIndex="17" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_4a"      RecordID="1" ParentRecordId="4" Runat="server" TabIndex="18" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server"/></td>           </tr>
              <tr id="famMemDiag_4b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_4b"  RecordID="2" ParentRecordId="4" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_4b" RecordID="2" ParentRecordId="4" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_4b"      RecordID="2" ParentRecordId="4" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
              </tr>
              <tr id="famMemDiag_4c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_4c"  RecordID="3" ParentRecordId="4" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_4c" RecordID="3" ParentRecordId="4" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_4c"      RecordID="3" ParentRecordId="4" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
              </tr>
              <tr>
                <td height="28" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'famMemDiag_4');" /></td>    
              </tr>  
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center" valign="middle"><euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server"/></td>
  </tr>

  <tr style="DISPLAY: none">
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_5"         RecordID="5"  Runat="server" TabIndex="13" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_5"     RecordID="5"  Runat="server" TabIndex="14" LookupCode="FamHxRelation"/></td>    
    <td height="28" style="text-align: center;" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_5"     RecordID="5"  Runat="server" TabIndex="15" /></td>  
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >

        <table id="famMemDiag_5" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_5a"  RecordID="1" ParentRecordId="5" Runat="server" TabIndex="16" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_5a" RecordID="1" ParentRecordId="5" Runat="server" TabIndex="17" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_5a"      RecordID="1" ParentRecordId="5" Runat="server" TabIndex="18" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>           </tr>
              <tr id="famMemDiag_5b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_5b"  RecordID="2" ParentRecordId="5" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_5b" RecordID="2" ParentRecordId="5" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_5b"      RecordID="2" ParentRecordId="5" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
              </tr>
              <tr id="famMemDiag_5c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_5c"  RecordID="3" ParentRecordId="5" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_5c" RecordID="3" ParentRecordId="5" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_5c"      RecordID="3" ParentRecordId="5" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
              </tr>
              <tr>
                <td height="28" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'famMemDiag_5');" /></td>    
              </tr>  
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center" valign="middle"><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/></td>
  </tr>

   <tr style="DISPLAY: none">
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_6"         RecordID="6"  Runat="server" TabIndex="13" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_6"     RecordID="6"  Runat="server" TabIndex="14" LookupCode="FamHxRelation"/></td>    
    <td height="28" style="text-align: center;" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_6"     RecordID="6"  Runat="server" TabIndex="15" /></td>  
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >

        <table id="famMemDiag_6" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_6a"  RecordID="1" ParentRecordId="6" Runat="server" TabIndex="16" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_6a" RecordID="1" ParentRecordId="6" Runat="server" TabIndex="17" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_6a"      RecordID="1" ParentRecordId="6" Runat="server" TabIndex="18" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>           </tr>
              <tr id="famMemDiag_6b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_6b"  RecordID="2" ParentRecordId="6" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_6b" RecordID="2" ParentRecordId="6" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_6b"      RecordID="2" ParentRecordId="6" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
              </tr>
              <tr id="famMemDiag_6c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_6c"  RecordID="3" ParentRecordId="6" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_6c" RecordID="3" ParentRecordId="6" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_6c"      RecordID="3" ParentRecordId="6" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
              </tr>
              <tr>
                <td height="28" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'famMemDiag_6');" /></td>    
              </tr>  
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center" valign="middle"><euc:EformDeleteIcon ID="EformDeleteIcon_6" runat="server"/></td>
  </tr>
 
   <tr style="DISPLAY: none">
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_7"         RecordID="7"  Runat="server" TabIndex="13" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_7"     RecordID="7"  Runat="server" TabIndex="14" LookupCode="FamHxRelation"/></td>    
    <td height="28" style="text-align: center;" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_7"     RecordID="7"  Runat="server" TabIndex="15" /></td>  
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >

        <table id="famMemDiag_7" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_7a"  RecordID="1" ParentRecordId="7" Runat="server" TabIndex="16" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_7a" RecordID="1" ParentRecordId="7" Runat="server" TabIndex="17" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_7a"      RecordID="1" ParentRecordId="7" Runat="server" TabIndex="18" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>           </tr>
              <tr id="famMemDiag_7b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_7b"  RecordID="2" ParentRecordId="7" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_7b" RecordID="2" ParentRecordId="7" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_7b"      RecordID="2" ParentRecordId="7" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server"/></td>
              </tr>
              <tr id="famMemDiag_7c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_7c"  RecordID="3" ParentRecordId="7" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_7c" RecordID="3" ParentRecordId="7" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_7c"      RecordID="3" ParentRecordId="7" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server"/></td>
              </tr>
              <tr>
                <td height="28" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'famMemDiag_7');" /></td>    
              </tr>  
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center" valign="middle"><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/></td>
  </tr>


  <tr style="DISPLAY: none">
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_8"         RecordID="8"  Runat="server" TabIndex="13" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_8"     RecordID="8"  Runat="server" TabIndex="14" LookupCode="FamHxRelation"/></td>    
    <td height="28" style="text-align: center;" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_8"     RecordID="8"  Runat="server" TabIndex="15" /></td>  
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >

        <table id="famMemDiag_8" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_8a"  RecordID="1" ParentRecordId="8" Runat="server" TabIndex="16" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_8a" RecordID="1" ParentRecordId="8" Runat="server" TabIndex="17" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_8a"      RecordID="1" ParentRecordId="8" Runat="server" TabIndex="18" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server"/></td>           </tr>
              <tr id="famMemDiag_8b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_8b"  RecordID="2" ParentRecordId="8" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_8b" RecordID="2" ParentRecordId="8" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_8b"      RecordID="2" ParentRecordId="8" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server"/></td>
              </tr>
              <tr id="famMemDiag_8c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_8c"  RecordID="3" ParentRecordId="8" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_8c" RecordID="3" ParentRecordId="8" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_8c"      RecordID="3" ParentRecordId="8" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server"/></td>
              </tr>
              <tr>
                <td height="28" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'famMemDiag_8');" /></td>    
              </tr>  
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center" valign="middle"><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/></td>
  </tr>

  <tr style="DISPLAY: none">
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_9"         RecordID="9"  Runat="server" TabIndex="13" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_9"     RecordID="9"  Runat="server" TabIndex="14" LookupCode="FamHxRelation"/></td>    
    <td height="28" style="text-align: center;" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_9"     RecordID="9"  Runat="server" TabIndex="15" /></td>  
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >

        <table id="famMemDiag_9" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_9a"  RecordID="1" ParentRecordId="9" Runat="server" TabIndex="16" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_9a" RecordID="1" ParentRecordId="9" Runat="server" TabIndex="17" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_9a"      RecordID="1" ParentRecordId="9" Runat="server" TabIndex="18" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server"/></td>           </tr>
              <tr id="famMemDiag_9b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_9b"  RecordID="2" ParentRecordId="9" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_9b" RecordID="2" ParentRecordId="9" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_9b"      RecordID="2" ParentRecordId="9" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server"/></td>
              </tr>
              <tr id="famMemDiag_9c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_9c"  RecordID="3" ParentRecordId="9" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_9c" RecordID="3" ParentRecordId="9" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_9c"      RecordID="3" ParentRecordId="9" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server"/></td>
              </tr>
              <tr>
                <td height="28" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'famMemDiag_9');" /></td>    
              </tr>  
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center" valign="middle"><euc:EformDeleteIcon ID="EformDeleteIcon_9" runat="server"/></td>
  </tr>

  <tr style="DISPLAY: none">
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_10"         RecordID="10"  Runat="server" TabIndex="13" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox DropDownWidth="300px"   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_10"     RecordID="10"  Runat="server" TabIndex="14" LookupCode="FamHxRelation"/></td>    
    <td height="28" style="text-align: center;" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_10"     RecordID="10"  Runat="server" TabIndex="15" /></td>  
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >

        <table id="famMemDiag_10" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_10a"  RecordID="1" ParentRecordId="10" Runat="server" TabIndex="16" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_10a" RecordID="1" ParentRecordId="10" Runat="server" TabIndex="17" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_10a"      RecordID="1" ParentRecordId="10" Runat="server" TabIndex="18" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server"/></td>           </tr>
              <tr id="famMemDiag_10b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_10b"  RecordID="2" ParentRecordId="10" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_10b" RecordID="2" ParentRecordId="10" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_10b"      RecordID="2" ParentRecordId="10" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server"/></td>
              </tr>
              <tr id="famMemDiag_10c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformComboBox DropDownWidth="300px" style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_10c"  RecordID="3" ParentRecordId="10" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_10c" RecordID="3" ParentRecordId="10" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_10c"      RecordID="3" ParentRecordId="10" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server"/></td>
              </tr>
              <tr>
                <td height="28" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'famMemDiag_10');" /></td>    
              </tr>  
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center" valign="middle"><euc:EformDeleteIcon ID="EformDeleteIcon_10" runat="server"/></td>
  </tr>

</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'FamilyHistoryTable');" />
</div>
<br/><br/><br/>
<table>
    <tr id="FamHxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="TableName" ID="TableName_11"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="FieldName" ID="FieldName_11"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_11"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_11"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_11"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>


<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'),$('<%= FamHxDiv.ClientID %>'),$('<%= FamHxAbsentDiv.ClientID %>'),$('<%= FamMemSide_1.ClientID %>'),$('<%= FamMemRelation_1.ClientID %>'),$('<%= FamMemDeathAge_1.ClientID %>'),$('<%= FamMemDiagnosis_1a.ClientID %>'),$('<%= FamMemDiagnosisAge_1a.ClientID %>'),$('<%= FamMemNotes_1a.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'),$('<%= FamHxDiv.ClientID %>'),$('<%= FamHxAbsentDiv.ClientID %>'),$('<%= FamMemSide_1.ClientID %>'),$('<%= FamMemRelation_1.ClientID %>'),$('<%= FamMemDeathAge_1.ClientID %>'),$('<%= FamMemDiagnosis_1b.ClientID %>'),$('<%= FamMemDiagnosisAge_1b.ClientID %>'),$('<%= FamMemNotes_1b.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'),$('<%= FamHxDiv.ClientID %>'),$('<%= FamHxAbsentDiv.ClientID %>'),$('<%= FamMemSide_1.ClientID %>'),$('<%= FamMemRelation_1.ClientID %>'),$('<%= FamMemDeathAge_1.ClientID %>'),$('<%= FamMemDiagnosis_1c.ClientID %>'),$('<%= FamMemDiagnosisAge_1c.ClientID %>'),$('<%= FamMemNotes_1c.ClientID %>'));

    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'),$('<%= FamHxDiv.ClientID %>'),$('<%= FamHxAbsentDiv.ClientID %>'),$('<%= FamMemSide_2.ClientID %>'),$('<%= FamMemRelation_2.ClientID %>'),$('<%= FamMemDeathAge_2.ClientID %>'),$('<%= FamMemDiagnosis_2a.ClientID %>'),$('<%= FamMemDiagnosisAge_2a.ClientID %>'),$('<%= FamMemNotes_2a.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'),$('<%= FamHxDiv.ClientID %>'),$('<%= FamHxAbsentDiv.ClientID %>'),$('<%= FamMemSide_2.ClientID %>'),$('<%= FamMemRelation_2.ClientID %>'),$('<%= FamMemDeathAge_2.ClientID %>'),$('<%= FamMemDiagnosis_2b.ClientID %>'),$('<%= FamMemDiagnosisAge_2b.ClientID %>'),$('<%= FamMemNotes_2b.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'),$('<%= FamHxDiv.ClientID %>'),$('<%= FamHxAbsentDiv.ClientID %>'),$('<%= FamMemSide_2.ClientID %>'),$('<%= FamMemRelation_2.ClientID %>'),$('<%= FamMemDeathAge_2.ClientID %>'),$('<%= FamMemDiagnosis_2c.ClientID %>'),$('<%= FamMemDiagnosisAge_2c.ClientID %>'),$('<%= FamMemNotes_2c.ClientID %>'));

    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'),$('<%= FamHxDiv.ClientID %>'),$('<%= FamHxAbsentDiv.ClientID %>'),$('<%= FamMemSide_3.ClientID %>'),$('<%= FamMemRelation_3.ClientID %>'),$('<%= FamMemDeathAge_3.ClientID %>'),$('<%= FamMemDiagnosis_3a.ClientID %>'),$('<%= FamMemDiagnosisAge_3a.ClientID %>'),$('<%= FamMemNotes_3a.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'),$('<%= FamHxDiv.ClientID %>'),$('<%= FamHxAbsentDiv.ClientID %>'),$('<%= FamMemSide_3.ClientID %>'),$('<%= FamMemRelation_3.ClientID %>'),$('<%= FamMemDeathAge_3.ClientID %>'),$('<%= FamMemDiagnosis_3b.ClientID %>'),$('<%= FamMemDiagnosisAge_3b.ClientID %>'),$('<%= FamMemNotes_3b.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'),$('<%= FamHxDiv.ClientID %>'),$('<%= FamHxAbsentDiv.ClientID %>'),$('<%= FamMemSide_3.ClientID %>'),$('<%= FamMemRelation_3.ClientID %>'),$('<%= FamMemDeathAge_3.ClientID %>'),$('<%= FamMemDiagnosis_3c.ClientID %>'),$('<%= FamMemDiagnosisAge_3c.ClientID %>'),$('<%= FamMemNotes_3c.ClientID %>'));

    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_4.ClientID %>'), $('<%= FamMemRelation_4.ClientID %>'), $('<%= FamMemDeathAge_4.ClientID %>'), $('<%= FamMemDiagnosis_4a.ClientID %>'), $('<%= FamMemDiagnosisAge_4a.ClientID %>'), $('<%= FamMemNotes_4a.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_4.ClientID %>'), $('<%= FamMemRelation_4.ClientID %>'), $('<%= FamMemDeathAge_4.ClientID %>'), $('<%= FamMemDiagnosis_4b.ClientID %>'), $('<%= FamMemDiagnosisAge_4b.ClientID %>'), $('<%= FamMemNotes_4b.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_4.ClientID %>'), $('<%= FamMemRelation_4.ClientID %>'), $('<%= FamMemDeathAge_4.ClientID %>'), $('<%= FamMemDiagnosis_4c.ClientID %>'), $('<%= FamMemDiagnosisAge_4c.ClientID %>'), $('<%= FamMemNotes_4c.ClientID %>'));

    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_5.ClientID %>'), $('<%= FamMemRelation_5.ClientID %>'), $('<%= FamMemDeathAge_5.ClientID %>'), $('<%= FamMemDiagnosis_5a.ClientID %>'), $('<%= FamMemDiagnosisAge_5a.ClientID %>'), $('<%= FamMemNotes_5a.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_5.ClientID %>'), $('<%= FamMemRelation_5.ClientID %>'), $('<%= FamMemDeathAge_5.ClientID %>'), $('<%= FamMemDiagnosis_5b.ClientID %>'), $('<%= FamMemDiagnosisAge_5b.ClientID %>'), $('<%= FamMemNotes_5b.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_5.ClientID %>'), $('<%= FamMemRelation_5.ClientID %>'), $('<%= FamMemDeathAge_5.ClientID %>'), $('<%= FamMemDiagnosis_5c.ClientID %>'), $('<%= FamMemDiagnosisAge_5c.ClientID %>'), $('<%= FamMemNotes_5c.ClientID %>'));

    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_6.ClientID %>'), $('<%= FamMemRelation_6.ClientID %>'), $('<%= FamMemDeathAge_6.ClientID %>'), $('<%= FamMemDiagnosis_6a.ClientID %>'), $('<%= FamMemDiagnosisAge_6a.ClientID %>'), $('<%= FamMemNotes_6a.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_6.ClientID %>'), $('<%= FamMemRelation_6.ClientID %>'), $('<%= FamMemDeathAge_6.ClientID %>'), $('<%= FamMemDiagnosis_6b.ClientID %>'), $('<%= FamMemDiagnosisAge_6b.ClientID %>'), $('<%= FamMemNotes_6b.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_6.ClientID %>'), $('<%= FamMemRelation_6.ClientID %>'), $('<%= FamMemDeathAge_6.ClientID %>'), $('<%= FamMemDiagnosis_6c.ClientID %>'), $('<%= FamMemDiagnosisAge_6c.ClientID %>'), $('<%= FamMemNotes_6c.ClientID %>'));

    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_7.ClientID %>'), $('<%= FamMemRelation_7.ClientID %>'), $('<%= FamMemDeathAge_7.ClientID %>'), $('<%= FamMemDiagnosis_7a.ClientID %>'), $('<%= FamMemDiagnosisAge_7a.ClientID %>'), $('<%= FamMemNotes_7a.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_7.ClientID %>'), $('<%= FamMemRelation_7.ClientID %>'), $('<%= FamMemDeathAge_7.ClientID %>'), $('<%= FamMemDiagnosis_7b.ClientID %>'), $('<%= FamMemDiagnosisAge_7b.ClientID %>'), $('<%= FamMemNotes_7b.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_7.ClientID %>'), $('<%= FamMemRelation_7.ClientID %>'), $('<%= FamMemDeathAge_7.ClientID %>'), $('<%= FamMemDiagnosis_7c.ClientID %>'), $('<%= FamMemDiagnosisAge_7c.ClientID %>'), $('<%= FamMemNotes_7c.ClientID %>'));

    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_8.ClientID %>'), $('<%= FamMemRelation_8.ClientID %>'), $('<%= FamMemDeathAge_8.ClientID %>'), $('<%= FamMemDiagnosis_8a.ClientID %>'), $('<%= FamMemDiagnosisAge_8a.ClientID %>'), $('<%= FamMemNotes_8a.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_8.ClientID %>'), $('<%= FamMemRelation_8.ClientID %>'), $('<%= FamMemDeathAge_8.ClientID %>'), $('<%= FamMemDiagnosis_8b.ClientID %>'), $('<%= FamMemDiagnosisAge_8b.ClientID %>'), $('<%= FamMemNotes_8b.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_8.ClientID %>'), $('<%= FamMemRelation_8.ClientID %>'), $('<%= FamMemDeathAge_8.ClientID %>'), $('<%= FamMemDiagnosis_8c.ClientID %>'), $('<%= FamMemDiagnosisAge_8c.ClientID %>'), $('<%= FamMemNotes_8c.ClientID %>'));

    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_9.ClientID %>'), $('<%= FamMemRelation_9.ClientID %>'), $('<%= FamMemDeathAge_9.ClientID %>'), $('<%= FamMemDiagnosis_9a.ClientID %>'), $('<%= FamMemDiagnosisAge_9a.ClientID %>'), $('<%= FamMemNotes_9a.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_9.ClientID %>'), $('<%= FamMemRelation_9.ClientID %>'), $('<%= FamMemDeathAge_9.ClientID %>'), $('<%= FamMemDiagnosis_9b.ClientID %>'), $('<%= FamMemDiagnosisAge_9b.ClientID %>'), $('<%= FamMemNotes_9b.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_9.ClientID %>'), $('<%= FamMemRelation_9.ClientID %>'), $('<%= FamMemDeathAge_9.ClientID %>'), $('<%= FamMemDiagnosis_9c.ClientID %>'), $('<%= FamMemDiagnosisAge_9c.ClientID %>'), $('<%= FamMemNotes_9c.ClientID %>'));

    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_10.ClientID %>'), $('<%= FamMemRelation_10.ClientID %>'), $('<%= FamMemDeathAge_10.ClientID %>'), $('<%= FamMemDiagnosis_10a.ClientID %>'), $('<%= FamMemDiagnosisAge_10a.ClientID %>'), $('<%= FamMemNotes_10a.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_10.ClientID %>'), $('<%= FamMemRelation_10.ClientID %>'), $('<%= FamMemDeathAge_10.ClientID %>'), $('<%= FamMemDiagnosis_10b.ClientID %>'), $('<%= FamMemDiagnosisAge_10b.ClientID %>'), $('<%= FamMemNotes_10b.ClientID %>'));
    addAbsentEvent($('<%= FamHxRecorded.ClientID %>'), $('<%= FamHxDiv.ClientID %>'), $('<%= FamHxAbsentDiv.ClientID %>'), $('<%= FamMemSide_10.ClientID %>'), $('<%= FamMemRelation_10.ClientID %>'), $('<%= FamMemDeathAge_10.ClientID %>'), $('<%= FamMemDiagnosis_10c.ClientID %>'), $('<%= FamMemDiagnosisAge_10c.ClientID %>'), $('<%= FamMemNotes_10c.ClientID %>'));

    function addAbsentEvent(FamHxRecordedID,FamHxDivID,FamHxAbsentDivID,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID)
    {  
        $(FamHxRecordedID).addEvent('click',curry(FamHxYesNo,FamHxRecordedID,FamHxDivID,FamHxAbsentDivID,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID));
        $(famMemSideID).addEvent('blur',curry(FamHxYesNo,FamHxRecordedID,FamHxDivID,FamHxAbsentDivID,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID));
        $(famMemRelationID).addEvent('blur',curry(FamHxYesNo,FamHxRecordedID,FamHxDivID,FamHxAbsentDivID,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID));
        $(famMemDeathAgeID).addEvent('blur',curry(FamHxYesNo,FamHxRecordedID,FamHxDivID,FamHxAbsentDivID,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID));
        $(famMemDiagnosisID).addEvent('blur',curry(FamHxYesNo,FamHxRecordedID,FamHxDivID,FamHxAbsentDivID,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID));
        $(famMemDiagnosisAgeID).addEvent('blur',curry(FamHxYesNo,FamHxRecordedID,FamHxDivID,FamHxAbsentDivID,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID));
        $(famMemNotesID).addEvent('blur',curry(FamHxYesNo,FamHxRecordedID,FamHxDivID,FamHxAbsentDivID,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID));

        // check on load as well
        FamHxYesNo(FamHxRecordedID,FamHxDivID,FamHxAbsentDivID,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID);
    }
   
    /* ]]> */
   
    function FamHxYesNo(FamHxRecordedID,FamHxDivID,FamHxAbsentDivID,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID)
    {
       var FamHxRecordedRef = FamHxRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < FamHxRecordedRef.length; i++) 
        if (FamHxRecordedRef[i].checked) {  
            FamHxRadioClick(FamHxRecordedRef[i].value,FamHxDivID,FamHxAbsentDivID,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID);
            }
    }
    
    function FamHxRadioClick(FamHxoption_value,FamHxhideDiv,FamHxhideAbsentDiv,famMemSideID,famMemRelationID,famMemDeathAgeID,famMemDiagnosisID, famMemDiagnosisAgeID, famMemNotesID)
    {
      if (FamHxoption_value == "Yes")
      { 
        FamHxhideDiv.style.display='block';
        FamHxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_11.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_11.ClientID %>').value='';
        document.getElementById('<%= TableName_11.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_11.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_11.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_11.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_11.ClientID %>').value = '';
        
      }
      else if (FamHxoption_value == "No" || FamHxoption_value == "Unknown" || FamHxoption_value == "N/A")
      {
        FamHxhideAbsentDiv.style.display='block';
        FamHxhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_11.ClientID %>').value = 'FamilyMemberDiagnosis';        
        document.getElementById('<%= FieldName_11.ClientID %>').value = 'FamMemDiagnosis';        
        document.getElementById('<%= FieldValue_11.ClientID %>').value = 'Family History'; 
        
        if (FamHxoption_value == "No")       
            document.getElementById('<%= AbsentReason_11.ClientID %>').value = 'None Recorded';        
        else if (FamHxoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_11.ClientID %>').value = 'Unknown';
        else if (FamHxoption_value == "N/A")
            document.getElementById('<%= AbsentReason_11.ClientID %>').value = 'Not Applicable';

        document.getElementById('<%= AbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_11.ClientID %>').value + ' as of ';
        document.getElementById('<%= AbsentQuality_11.ClientID %>').value = 'OUT';        

        famMemSideID.value = '';
        famMemRelationID.value = '';
        famMemDeathAgeID.value = '';
        famMemDiagnosisID.value = '';   
        famMemDiagnosisAgeID.value = '';
        famMemNotesID.value = '';   
     }
    }

</script>