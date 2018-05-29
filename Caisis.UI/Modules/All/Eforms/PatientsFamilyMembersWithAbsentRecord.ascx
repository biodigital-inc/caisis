<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.PatientsFamilyMembersWithAbsentRecord" CodeFile="PatientsFamilyMembersWithAbsentRecord.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.FamilyHistoryTable = "FamilyHistoryTable";
	tableArray.famMemDiag_1 = "famMemDiag_1";
	tableArray.famMemDiag_2 = "famMemDiag_2";
	tableArray.famMemDiag_3 = "famMemDiag_3";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PatientsFamilyMembersWithAbsentRecord" /><br/>
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
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="FamHxAbsentDiv" runat="server" style="display: none;" >
<br /><br /> 
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="11" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_11"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="11" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_11"
                Runat="server" Width="1px" Style="display: none;" /></td>
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
    <td height="28" valign="top" >                            <euc:EformComboBox   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_1"         RecordID="1"  Runat="server" TabIndex="1" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_1"     RecordID="1"  Runat="server" TabIndex="2" LookupCode="FamHxRelation"/></td>    
    <td height="28" valign="top" style="text-align: center;" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_1"     RecordID="1"  Runat="server" TabIndex="3" /></td>    
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >
        <table id="famMemDiag_1" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_1a"  RecordID="1"  Runat="server" TabIndex="4" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_1a" RecordID="1"  Runat="server" TabIndex="5" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_1a"      RecordID="1"  Runat="server" TabIndex="6" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
              <tr id="famMemDiag_1b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                         <euc:EformComboBox style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_1b"  RecordID="2"  Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top"><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_1b" RecordID="2"  Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                          <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_1b"      RecordID="2"  Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
              </tr>
              <tr id="famMemDiag_1c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_1c"  RecordID="3"  Runat="server" LookupCode="FamMemDiagnosis" /></td>    
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
    <td height="28" valign="top" >                            <euc:EformComboBox   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_2"         RecordID="2"  Runat="server" TabIndex="7" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_2"     RecordID="2"  Runat="server" TabIndex="8" LookupCode="FamHxRelation"/></td>    
    <td height="28" style="text-align: center;" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_2"     RecordID="2"  Runat="server" TabIndex="9" /></td>  
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >

        <table id="famMemDiag_2" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_2a"  RecordID="1" ParentRecordId="2" Runat="server" TabIndex="10" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_2a" RecordID="1" ParentRecordId="2" Runat="server" TabIndex="11" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_2a"      RecordID="1" ParentRecordId="2" Runat="server" TabIndex="12" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>           </tr>
              <tr id="famMemDiag_2b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_2b"  RecordID="2" ParentRecordId="2" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_2b" RecordID="2" ParentRecordId="2" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_2b"      RecordID="2" ParentRecordId="2" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
              </tr>
              <tr id="famMemDiag_2c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformComboBox style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_2c"  RecordID="3" ParentRecordId="2" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
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
    <td height="28" valign="top" >                            <euc:EformComboBox   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemSide"           ID="FamMemSide_3"         RecordID="3"  Runat="server" TabIndex="13" LookupCode="FamMemSide" /></td>
    <td height="28" valign="top" >                            <euc:EformComboBox   style="width:80px;" TABLE="FamilyMembers"          FIELD="FamMemRelation"       ID="FamMemRelation_3"     RecordID="3"  Runat="server" TabIndex="14" LookupCode="FamHxRelation"/></td>    
    <td height="28" style="text-align: center;" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMembers"          FIELD="FamMemDeathAge"       ID="FamMemDeathAge_3"     RecordID="3"  Runat="server" TabIndex="15" /></td>  
    <td height="28" class="controlBoxDataGridValueColumn" colspan="3" >

        <table id="famMemDiag_3" >
            <tr>
                <td height="28" width="40%" valign="top"   >                                                                <euc:EformComboBox style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_3a"  RecordID="1" ParentRecordId="3" Runat="server" TabIndex="16" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_3a" RecordID="1" ParentRecordId="3" Runat="server" TabIndex="17" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_3a"      RecordID="1" ParentRecordId="3" Runat="server" TabIndex="18" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>           </tr>
              <tr id="famMemDiag_3b" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top"  >                          <euc:EformComboBox style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_3b"  RecordID="2" ParentRecordId="3" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
                <td height="28" width="9%" style="text-align: center;" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformTextBox  style="width:40px;" TABLE="FamilyMemberDiagnosis"  FIELD="FamMemDiagnosisAge" ID="FamMemDiagnosisAge_3b" RecordID="2" ParentRecordId="3" Runat="server" /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformTextBox  style="width:100px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemNotes"          ID="FamMemNotes_3b"      RecordID="2" ParentRecordId="3" Runat="server" /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
              </tr>
              <tr id="famMemDiag_3c" style="DISPLAY: none">
                <td height="28" width="40%" class="controlBoxDataGridValueColumn" valign="top" >                           <euc:EformComboBox style="width:90px;" TABLE="FamilyMemberDiagnosis" FIELD="FamMemDiagnosis"      ID="FamMemDiagnosis_3c"  RecordID="3" ParentRecordId="3" Runat="server" LookupCode="FamMemDiagnosis" /></td>    
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
      else if (FamHxoption_value == "No" || FamHxoption_value == "Unknown")
      {
        FamHxhideAbsentDiv.style.display='block';
        FamHxhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_11.ClientID %>').value = 'FamilyMemberDiagnosis';        
        document.getElementById('<%= FieldName_11.ClientID %>').value = 'FamMemDiagnosis';        
        document.getElementById('<%= FieldValue_11.ClientID %>').value = 'Family History'; 
        
        if (FamHxoption_value == "No")       
            document.getElementById('<%= AbsentReason_11.ClientID %>').value = 'None Recorded';        
        if (FamHxoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_11.ClientID %>').value = 'Unknown';        

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