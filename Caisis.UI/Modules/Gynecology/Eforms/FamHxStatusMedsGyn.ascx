<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.FamHxStatusMedsGyn" CodeFile="FamHxStatusMedsGyn.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.famMemDiag_1 = "famMemDiag_1";
	
	tableArray.GynStatusTbl = "GynStatusTbl";
	
	tableArray.GynMedsTbl = "GynMedsTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="FamHxStatusMedsGyn" /><span class="controlBoxTitle" style="font-size: 12px;">Family History</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <span class="controlBoxTitle" style="font-size: 12px;">Previous Family History</span><br/>
            <table width="500" border="0" cellpadding="0" cellspacing="0" class="ClinicalEformTable" id="PrevFamHxTbl">
                <asp:Repeater ID="FamilyMemHx" runat="server" OnItemDataBound="EFormRepeaterOnDataBound">
                    <ItemTemplate>
                        <tr class="controlBoxDataGridTitleColumn">
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Relation</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;</td>
                        </tr>
                        <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';"
                            onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('FamilyMembers',  <%# DataBinder.Eval(Container.DataItem, "FamilyMemberId") %>, 'FamMemSide,FamMemRelation,FamMemDeathAge', 'FamilyMembers');">
                            <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemRelation")%></td>
                            <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
                        </tr>
                        <tr class="controlBoxDataGridTitleColumn">
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Diagnosis</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;</td>
                        </tr>
                <asp:Repeater ID="FamilyMemHx2" runat="server">
                <ItemTemplate>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';"
                        onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('FamilyMemberDiagnosis', <%# DataBinder.Eval(Container.DataItem, "FamilyMemberDiagnosisId") %>, 'FamMemDiagnosis,FamMemDiagnosisAge,FamMemNotes', 'FamilyMemberDiagnosis');">
                        <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemDiagnosis")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td style="text-align: left;" colspan="3">&nbsp;
                    
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
                <tr id="NoFamMemHxMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No family member history has been recorded for this patient.
                    </td>
                </tr>
            </table><br />
            
            <strong>Add New Family History</strong>
            <table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="FamilyHistoryTable">
                <tr>
        <td width="40%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Relation</td>
        <td width="40%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Diagnosis</td>
        <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;</td>
    </tr>
                <tr>
        <td height="28" valign="top">
            <euc:EformComboBox Style="width: 120px;" Table="FamilyMembers" Field="FamMemRelation" ID="FamMemRelation_1" RecordId="1" 
                runat="server"  LookupCode="FamHxRelation" />&nbsp;&nbsp; <euc:EformDeleteIcon ID="EformDeleteIcon" runat="server" /></td>
                
        <td height="28" class="controlBoxDataGridValueColumn" colspan="2">
            <table id="famMemDiag_1" cellspacing="0">
                <tr id="famMemDiag_1a">
                    <td height="28" width="40%" valign="top"><euc:EformComboBox Style="width: 110px;" Table="FamilyMemberDiagnosis" 
                        Field="FamMemDiagnosis" ID="FamMemDiagnosis_1a" RecordId="1" runat="server"  LookupCode="FamMemDiagnosis,Disease,Gynecology" DropDownHeight="auto" /></td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
                </tr>
                <tr id="famMemDiag_1b">
                    <td height="28" width="40%" valign="top"><euc:EformComboBox Style="width: 110px;" Table="FamilyMemberDiagnosis" 
                        Field="FamMemDiagnosis" ID="FamMemDiagnosis_1b" RecordId="2" runat="server" LookupCode="FamMemDiagnosis,Disease,Gynecology" DropDownHeight="auto" /></td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" /></td>
                </tr>
                <tr id="famMemDiag_1c">
                    <td height="28" width="40%"  valign="top"><euc:EformComboBox Style="width: 110px;" Table="FamilyMemberDiagnosis" 
                        Field="FamMemDiagnosis" ID="FamMemDiagnosis_1c" RecordId="3" runat="server" LookupCode="FamMemDiagnosis,Disease,Gynecology" DropDownHeight="auto" /></td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" /></td>
                </tr>
                <tr id="famMemDiag_1d">
                    <td height="28" width="40%"  valign="top"><euc:EformComboBox Style="width: 110px;" Table="FamilyMemberDiagnosis" 
                        Field="FamMemDiagnosis" ID="FamMemDiagnosis_1d" RecordId="4" runat="server" LookupCode="FamMemDiagnosis,Disease,Gynecology" DropDownHeight="auto" /></td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" /></td>
                </tr>
                <tr id="famMemDiag_1e">
                    <td height="28" width="40%"  valign="top"><euc:EformComboBox Style="width: 110px;" Table="FamilyMemberDiagnosis" 
                        Field="FamMemDiagnosis" ID="FamMemDiagnosis_1e" RecordId="5" runat="server" LookupCode="FamMemDiagnosis,Disease,Gynecology" DropDownHeight="auto" /></td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" /></td>
                </tr>
                <tr id="famMemDiag_1f" style="display: none">
                    <td height="28" width="40%"  valign="top"><euc:EformComboBox Style="width: 110px;" Table="FamilyMemberDiagnosis" 
                        Field="FamMemDiagnosis" ID="FamMemDiagnosis_1f" RecordId="6" runat="server" LookupCode="FamMemDiagnosis,Disease,Gynecology" DropDownHeight="auto" /></td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" /></td>
                </tr>
                <tr id="famMemDiag_1g" style="display: none">
                    <td height="28" width="40%"  valign="top"><euc:EformComboBox Style="width: 110px;" Table="FamilyMemberDiagnosis" 
                        Field="FamMemDiagnosis" ID="FamMemDiagnosis_1g" RecordId="7" runat="server" LookupCode="FamMemDiagnosis,Disease,Gynecology" DropDownHeight="auto" /></td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" /></td>
                </tr>
                <tr id="famMemDiag_1h" style="display: none">
                    <td height="28" width="40%"  valign="top"><euc:EformComboBox Style="width: 110px;" Table="FamilyMemberDiagnosis" 
                        Field="FamMemDiagnosis" ID="FamMemDiagnosis_1h" RecordId="8" runat="server" LookupCode="FamMemDiagnosis,Disease,Gynecology" DropDownHeight="auto" /></td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" /></td>
                </tr>
                <tr id="famMemDiag_1i" style="display: none">
                    <td height="28" width="40%"  valign="top"><euc:EformComboBox Style="width: 110px;" Table="FamilyMemberDiagnosis" 
                        Field="FamMemDiagnosis" ID="FamMemDiagnosis_1i" RecordId="9" runat="server" LookupCode="FamMemDiagnosis,Disease,Gynecology" DropDownHeight="auto" /></td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" /></td>
                </tr>
                <tr id="famMemDiag_1j" style="display: none">
                    <td height="28" width="40%"  valign="top"><euc:EformComboBox Style="width: 110px;" Table="FamilyMemberDiagnosis" 
                        Field="FamMemDiagnosis" ID="FamMemDiagnosis_1j" RecordId="10" runat="server" LookupCode="FamMemDiagnosis,Disease,Gynecology" DropDownHeight="auto" /></td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" /></td>
                </tr>
                <tr>
                    <td style="padding-top: 0px; border-top: solid 1px #cccccc;">
                        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" 
                            class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'famMemDiag_1');" /></td>
                </tr>
            </table>
        </td>
       
    </tr>
</table>
        </td>
    </tr>
</table><br /><br /><br />
    

<!-- Status -->
<span class="controlBoxTitle">Status</span> <br/>
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <span class="controlBoxTitle" style="font-size: 12px;">Previous Statuses</span><br/>
            <table width="690" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevGynStatusTable">
                <tr id="NoGynStatusMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Statuses were recorded for this patient.                    </td>
                </tr>                
                  <tr runat="server" id="PrevGynStatusRptHdr">
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>		
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Source</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
                    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
              
                <asp:Repeater ID="GynStatusRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	                <ItemTemplate> 
		                <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# DataBinder.Eval(Container.DataItem, "StatusId") %>, 'StatusDateText,StatusDate,StatusDisease,Status,StatusPhysician,StatusDataSource,StatusQuality', 'Status');"> 
			            <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusDateText")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusDisease")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Status")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusPhysician")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "StatusDataSource")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "StatusQuality")%></td>
			            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
            </table>
            <br /><br />
            
            <span class="controlBoxTitle" style="font-size: 12px;">Add new Status</span><br/>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="GynStatusTbl">
                <tr id="GynStatusHdr" runat="server">
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>	
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Source</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
                    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
              <tr>
                 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="Status" 
                    FIELD="StatusDateText" Runat="server" ID="StatusDateText_1"/>
                        <euc:EformHidden RecordId="1" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_1"/>                </td>
                 <td align="center"><euc:EformDropDownList RecordId="1" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_1" 
                    style="width:140px;" DropDownWidth="300px" LookupCode="Disease,Disease,Gynecology"/></td>
                <td align="center"><euc:EformComboBox RecordId="1" TABLE="Status" FIELD="Status" Runat="server" ID="Status_1" 
                    LookupCode="Status,Disease,Gynecology" style="width:100px;" DropDownWidth="300px"/></td>
                <td align="center"><euc:EformComboBox RecordId="1" TABLE="Status" FIELD="StatusPhysician" Runat="server" 
                    ID="StatusPhysician_1" LookupCode="Physician,Disease,Gynecology" style="width:90px;" DropDownWidth="200px"/></td>   
                <td align="center"><euc:EformDropDownList RecordId="1" style="width:90px;" TABLE="Status" 
                    FIELD="StatusDataSource" Runat="server" ID="StatusDataSource_1" LookupCode="DataSource" DropDownWidth="200px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="1" style="width:70px;" TABLE="Status" FIELD="StatusQuality" 
                    Runat="server" ID="StatusQuality_1" LookupCode="DataQuality"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr style="display:none;">
                 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="Status" 
                    FIELD="StatusDateText" Runat="server" ID="StatusDateText_2"/>
                        <euc:EformHidden RecordId="2" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_2"/>                </td>
                 <td align="center"><euc:EformDropDownList RecordId="2" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_2" 
                    style="width:140px;" DropDownWidth="300px" LookupCode="Disease,Disease,Gynecology"/></td>
                <td align="center"><euc:EformComboBox RecordId="2" TABLE="Status" FIELD="Status" Runat="server" ID="Status_2" 
                    LookupCode="Status,Disease,Gynecology" style="width:100px;" DropDownWidth="300px"/></td>
                <td align="center"><euc:EformComboBox RecordId="2" TABLE="Status" FIELD="StatusPhysician" Runat="server" 
                    ID="StatusPhysician_2" LookupCode="Physician,Disease,Gynecology" style="width:90px;" DropDownWidth="200px"/></td>  
                <td align="center"><euc:EformDropDownList RecordId="2" style="width:90px;" TABLE="Status" 
                    FIELD="StatusDataSource" Runat="server" ID="StatusDataSource_2" LookupCode="DataSource" DropDownWidth="200px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="2" style="width:70px;" TABLE="Status" FIELD="StatusQuality" 
                    Runat="server" ID="StatusQuality_2" LookupCode="DataQuality"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr style="display:none;">
                 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="Status" 
                    FIELD="StatusDateText" Runat="server" ID="StatusDateText_3"/>
                        <euc:EformHidden RecordId="3" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_3"/>                </td>
                 <td align="center"><euc:EformDropDownList RecordId="3" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_3" 
                    style="width:140px;" DropDownWidth="300px" LookupCode="Disease,Disease,Gynecology"/></td>
                <td align="center"><euc:EformComboBox RecordId="3" TABLE="Status" FIELD="Status" Runat="server" ID="Status_3" 
                    LookupCode="Status,Disease,Gynecology" style="width:100px;" DropDownWidth="300px"/></td>
                <td align="center"><euc:EformComboBox RecordId="3" TABLE="Status" FIELD="StatusPhysician" Runat="server" 
                    ID="StatusPhysician_3" LookupCode="Physician,Disease,Gynecology" style="width:90px;" DropDownWidth="200px"/></td>  
                <td align="center"><euc:EformDropDownList RecordId="3" style="width:90px;" TABLE="Status" 
                    FIELD="StatusDataSource" Runat="server" ID="StatusDataSource_3" LookupCode="DataSource" DropDownWidth="200px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="3" style="width:70px;" TABLE="Status" FIELD="StatusQuality" 
                    Runat="server" ID="StatusQuality_3" LookupCode="DataQuality"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr style="display:none;">
                 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="Status" 
                    FIELD="StatusDateText" Runat="server" ID="StatusDateText_4"/>
                        <euc:EformHidden RecordId="4" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_4"/>                </td>
                 <td align="center"><euc:EformDropDownList RecordId="4" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_4" 
                    style="width:140px;" DropDownWidth="300px" LookupCode="Disease,Disease,Gynecology"/></td>
                <td align="center"><euc:EformComboBox RecordId="4" TABLE="Status" FIELD="Status" Runat="server" ID="Status_4" 
                    LookupCode="Status,Disease,Gynecology" style="width:100px;" DropDownWidth="300px"/></td>
                <td align="center"><euc:EformComboBox RecordId="4" TABLE="Status" FIELD="StatusPhysician" Runat="server" 
                    ID="StatusPhysician_4" LookupCode="Physician,Disease,Gynecology" style="width:90px;" DropDownWidth="200px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="4" style="width:90px;" TABLE="Status" 
                    FIELD="StatusDataSource" Runat="server" ID="StatusDataSource_4" LookupCode="DataSource" DropDownWidth="200px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="4" style="width:70px;" TABLE="Status" FIELD="StatusQuality" 
                    Runat="server" ID="StatusQuality_4" LookupCode="DataQuality"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr style="display:none;">
                 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="Status" 
                    FIELD="StatusDateText" Runat="server" ID="StatusDateText_5"/>
                        <euc:EformHidden RecordId="5" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_5"/>                </td>
                 <td align="center"><euc:EformDropDownList RecordId="5" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_5" 
                    style="width:140px;" DropDownWidth="300px" LookupCode="Disease,Disease,Gynecology"/></td>
                <td align="center"><euc:EformComboBox RecordId="5" TABLE="Status" FIELD="Status" Runat="server" ID="Status_5" 
                    LookupCode="Status,Disease,Gynecology" style="width:100px;" DropDownWidth="300px"/></td>
                <td align="center"><euc:EformComboBox RecordId="5" TABLE="Status" FIELD="StatusPhysician" Runat="server" 
                    ID="StatusPhysician_5" LookupCode="Physician,Disease,Gynecology" style="width:90px;" DropDownWidth="200px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="5" style="width:90px;" TABLE="Status" 
                    FIELD="StatusDataSource" Runat="server" ID="StatusDataSource_5" LookupCode="DataSource" DropDownWidth="200px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="5" style="width:70px;" TABLE="Status" FIELD="StatusQuality" 
                    Runat="server" ID="StatusQuality_5" LookupCode="DataQuality"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon25" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'GynStatusTbl');" /><br />
</td></tr></table><br /><br /><br />

<span class="controlBoxTitle">Medications</span> <br/>
<table border="0" cellspacing="0" cellpadding="16" width="350" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <span class="controlBoxTitle" style="font-size: 12px;">Previous Medications</span><br/>
            <table width="350" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevGynMedsTbl">
                <tr id="NoPrevMedsMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="2" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Medications were recorded for this patient.
                    </td>
                </tr>
                
                <tr runat="server" id="PrevGynMedsRptHdr">
	                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Medication</td>
	                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
              
              <asp:Repeater ID="GynMedsRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Medications', <%# DataBinder.Eval(Container.DataItem, "MedicationId") %>, 'Medication', 'Medications');"> 
			            <td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "Medication")%></td>
			            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
            </table><br /><br />
            
            <span class="controlBoxTitle" style="font-size: 12px;">Add new Medications</span><br/>
            <table width="200" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="GynMedsTbl">
                <tr id="Tr3" runat="server">
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Medication</td>
                    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
              <tr>
                <td align="center"><euc:EformComboBox RecordId="1" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_1" 
                    LookupCode="Medication,PercentUsage,Top80" style="width:100px;" DropDownWidth="300px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon26" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr style="display:none;">
                 <td align="center"><euc:EformComboBox RecordId="2" TABLE="Medications" FIELD="Medication" Runat="server" 
                    ID="Medication_2" LookupCode="Medication,PercentUsage,Top80" style="width:100px;" DropDownWidth="300px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon27" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr style="display:none;">
              <td align="center"><euc:EformComboBox RecordId="3" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_3" 
                    LookupCode="Medication,PercentUsage,Top80" style="width:100px;" DropDownWidth="300px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon28" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr style="display:none;">
                <td align="center"><euc:EformComboBox RecordId="4" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_4" 
                    LookupCode="Medication,PercentUsage,Top80" style="width:100px;" DropDownWidth="300px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon29" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr style="display:none;">
                <td align="center"><euc:EformComboBox RecordId="5" TABLE="Medications" FIELD="Medication" Runat="server" ID="Medication_5" 
                    LookupCode="Medication,PercentUsage,Top80" style="width:100px;" DropDownWidth="300px"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon30" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>              
            </table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'GynMedsTbl');" /><br />
</td></tr></table>



<script type="text/javascript">
    //Adds events to controls
    function addGynStatusEvents(GynStatus,GynStSource,GynStQlty)
    { 
        $(GynStatus).addEvent('blur',curry(StatusAutoPopulates,GynStatus,GynStSource,GynStQlty));
   }

    addGynStatusEvents($('<%= Status_1.ClientID %>'),$('<%= StatusDataSource_1.ClientID %>'),$('<%= StatusQuality_1.ClientID %>'));
    addGynStatusEvents($('<%= Status_2.ClientID %>'),$('<%= StatusDataSource_2.ClientID %>'),$('<%= StatusQuality_2.ClientID %>'));
    addGynStatusEvents($('<%= Status_3.ClientID %>'),$('<%= StatusDataSource_3.ClientID %>'),$('<%= StatusQuality_3.ClientID %>'));
    addGynStatusEvents($('<%= Status_4.ClientID %>'),$('<%= StatusDataSource_4.ClientID %>'),$('<%= StatusQuality_4.ClientID %>'));
    addGynStatusEvents($('<%= Status_5.ClientID %>'),$('<%= StatusDataSource_5.ClientID %>'),$('<%= StatusQuality_5.ClientID %>'));
    
    function StatusAutoPopulates(GynStatus,GynStSource,GynStQlty)
    {
        if (GynStatus.value != '')
        {
            GynStSource.value = 'Medical Record';
            GynStQlty.value = 'STD';
        }
//        else
//        { 
//            GynStSource.value = '';
//            GynStQlty.value = '';
//        }
    }
</script>