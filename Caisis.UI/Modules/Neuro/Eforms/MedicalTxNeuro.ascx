<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.MedicalTxNeuro" CodeFile="MedicalTxNeuro.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.NeuroMedTxHtmlTable = "NeuroMedTxHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="MedicalTxNeuro" /><span class="controlBoxTitle">Medical Therapy</span><br />  
<table border="0" cellspacing="0" cellpadding="16" width="350" class="eformXLargePopulatedTable">
    <tr>
        <td style="white-space:nowrap; width:20%"><strong>Medical Therapy done ?</strong></td>
        <td style="text-align:left;"><euc:EformRadioButtonList ID="MedTxDone" runat="server" RepeatLayout="Table" 
            RepeatDirection="Horizontal" Table="NoTable" Field="MedTxDone">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
    
    <tr id="NeuroMedTxDetails" style="display:none;" runat="server">
        <td colspan="2">
        <table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <table width="800" cellpadding="18" cellspacing="0" class="ClinicalEformTable" id="PrevNeuroMedTxTable">
                <tr id="NoNeuroMedTxMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="16" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Medical Therapies were recorded for this patient.
                    </td>
                </tr>
            </table>
            
            <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 150px; width:1250; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="1240" cellpadding="1" cellspacing="0" class="ClinicalEformTable" id="NeuroMedTxRptTable">
            <asp:Repeater ID="NeuroMedTxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                <HeaderTemplate>
                  <tr runat="server" id="PrevNeuroMedTxRptHdr">
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">StartDate</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">StopDate</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Primary<br />Disease</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Targeted<br />Site</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Agent</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Dose</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Total<br />Dose</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Units</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Route</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Schedule</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Total<br />Cycles</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data<br />Qlty</td>
		            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                  </tr>
                </HeaderTemplate>
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# Eval("MedicalTherapyId") %>, 'MedTxPending,MedTxDateText,MedTxDate,MedTxStopDateText,MedTxStopDate,MedTxDisease,MedTxSite,MedTxAgent,MedTxType,MedTxDose,MedTxTotalDose,MedTxUnits,MedTxRoute,MedTxSchedule,MedTxCycle,MedTxInstitution,MedTxNotes,MedTxQuality', 'MedicalTherapy');"> 
		    <td class="ClinicalEformPopulatedColumn"></td>		    
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxPending").ToString()=="1"?"Yes":"No" %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxDateText")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxStopDateText")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxDisease")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxSite")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxAgent")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxType")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxDose")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxTotalDose")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxUnits")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxRoute")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxSchedule")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxCycle")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxInstitution").ToString() == "Memorial Sloan Kettering Cancer Center" ? "MSKCC" : Eval("MedTxInstitution").ToString()%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxNotes")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTxQuality")%></td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."></td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  </table></div><br /><br />
  
            <table width="650" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="NeuroMedTxHtmlTable">
        <tr runat="server" id="NeuroMedTxHdr"> 
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Protocol #</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">StartDate</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">StopDate</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Primary<br />Disease</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Targeted<br />Site</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Agent</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Dose</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Total<br />Dose</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Units</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Route</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Schedule</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Total<br />Cycles</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data<br />Qlty</td>
		    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
        </tr>
  
        <tr id="MedTxHtmlRow1">
            <td><euc:EformDropDownList RecordId="1" runat="server" ID="ProtocolId_1" Table="MedicalTherapy" Field="ProtocolId" Width="150px" 
                LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)" /></td>
            <td align="center"><euc:EformCheckBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxPending" Runat="server" 
                ID="MedTxPending_1" Value="1" /></td>
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" TABLE="MedicalTherapy" 
                FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_1"/>
		        <euc:EformHidden RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_1"/>
	        </td>
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" TABLE="MedicalTherapy" 
                    FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_1"/>
		        <euc:EformHidden RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_1"/>
	        </td>
	        <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_1" LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>   
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxSite" Runat="server" 
                ID="MedTxSite_1" LookupCode="DxTarget" style="width:70px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_1" 
                LookupCode="MedTxAgent" Width="70px"/></td>
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_1" 
                LookupCode="MedTxType" style="width:70px;"/></td>
            <td ><euc:EformTextBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_1" 
                Width="40px"/></td>
            <td ><euc:EformTextBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxTotalDose" Runat="server" ID="MedTxTotalDose_1" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_1" 
                LookupCode="MedUnits" style="width:50px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxRoute" Runat="server" ID="MedTxRoute_1" 
                LookupCode="MedRoute" style="width:60px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_1" LookupCode="MedSchedule" style="width:60px;" DropDownWidth="300px"/></td>
            <td align="center"><euc:EformTextBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_1" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" ID="MedTxInstitution_1"
                 LookupCode="Institution" Width="80px"/></td>
	        <td align="center"><euc:EformTextBox RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_1" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
	        <td align="center"><euc:EformDropDownList RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_1" 
	            LookupCode="DataQuality"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        <tr id="MedTxHtmlRow2" style="DISPLAY: none">
            <td><euc:EformDropDownList RecordId="2" runat="server" ID="ProtocolId_2" Table="MedicalTherapy" Field="ProtocolId" Width="150px" 
                LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)" /></td>
            <td align="center"><euc:EformCheckBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxPending" Runat="server" 
                ID="MedTxPending_2" Value="1" /></td>
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" TABLE="MedicalTherapy" 
                FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_2"/>
		        <euc:EformHidden RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_2"/>
	        </td>
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" TABLE="MedicalTherapy" 
                    FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_2"/>
		        <euc:EformHidden RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_2"/>
	        </td>
	        <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_2" LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>   
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxSite" Runat="server" 
                ID="MedTxSite_2" LookupCode="DxTarget" style="width:70px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_2" 
                LookupCode="MedTxAgent" Width="70px"/></td>
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_2" 
                LookupCode="MedTxType" style="width:70px;"/></td>
            <td ><euc:EformTextBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_2" 
                Width="40px"/></td>
            <td ><euc:EformTextBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxTotalDose" Runat="server" ID="MedTxTotalDose_2" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_2" 
                LookupCode="MedUnits" style="width:50px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxRoute" Runat="server" ID="MedTxRoute_2" 
                LookupCode="MedRoute" style="width:60px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_2" LookupCode="MedSchedule" style="width:60px;" DropDownWidth="300px"/></td>
            <td align="center"><euc:EformTextBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_2" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" ID="MedTxInstitution_2"
                 LookupCode="Institution" Width="80px"/></td>
	        <td align="center"><euc:EformTextBox RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_2" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
	        <td align="center"><euc:EformDropDownList RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_2" 
	            LookupCode="DataQuality"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        <tr id="MedTxHtmlRow3" style="DISPLAY: none">
            <td><euc:EformDropDownList RecordId="3" runat="server" ID="ProtocolId_3" Table="MedicalTherapy" Field="ProtocolId" Width="150px" 
                LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)" /></td>
            <td align="center"><euc:EformCheckBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxPending" Runat="server" 
                ID="MedTxPending_3" Value="1" /></td>
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" TABLE="MedicalTherapy" 
                FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_3"/>
		        <euc:EformHidden RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_3"/>
	        </td>
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" TABLE="MedicalTherapy" 
                    FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_3"/>
		        <euc:EformHidden RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_3"/>
	        </td>
	        <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_3" LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>   
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxSite" Runat="server" 
                ID="MedTxSite_3" LookupCode="DxTarget" style="width:70px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_3" 
                LookupCode="MedTxAgent" Width="70px"/></td>
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_3" 
                LookupCode="MedTxType" style="width:70px;"/></td>
            <td ><euc:EformTextBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_3" 
                Width="40px"/></td>
            <td ><euc:EformTextBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxTotalDose" Runat="server" ID="MedTxTotalDose_3" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_3" 
                LookupCode="MedUnits" style="width:50px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxRoute" Runat="server" ID="MedTxRoute_3" 
                LookupCode="MedRoute" style="width:60px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_3" LookupCode="MedSchedule" style="width:60px;" DropDownWidth="300px"/></td>
            <td align="center"><euc:EformTextBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_3" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" ID="MedTxInstitution_3"
                 LookupCode="Institution" Width="80px"/></td>
	        <td align="center"><euc:EformTextBox RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_3" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
	        <td align="center"><euc:EformDropDownList RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_3" 
	            LookupCode="DataQuality"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        <tr id="MedTxHtmlRow4" style="DISPLAY: none">
            <td><euc:EformDropDownList RecordId="4" runat="server" ID="ProtocolId_4" Table="MedicalTherapy" Field="ProtocolId" Width="150px" 
                LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)" /></td>
            <td align="center"><euc:EformCheckBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxPending" Runat="server" 
                ID="MedTxPending_4" Value="1" /></td>
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" TABLE="MedicalTherapy" 
                FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_4"/>
		        <euc:EformHidden RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_4"/>
	        </td>
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" TABLE="MedicalTherapy" 
                    FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_4"/>
		        <euc:EformHidden RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_4"/>
	        </td>
	        <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_4" LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>   
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxSite" Runat="server" 
                ID="MedTxSite_4" LookupCode="DxTarget" style="width:70px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_4" 
                LookupCode="MedTxAgent" Width="70px"/></td>
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_4" 
                LookupCode="MedTxType" style="width:70px;"/></td>
            <td ><euc:EformTextBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_4" 
                Width="40px"/></td>
            <td ><euc:EformTextBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxTotalDose" Runat="server" ID="MedTxTotalDose_4" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_4" 
                LookupCode="MedUnits" style="width:50px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxRoute" Runat="server" ID="MedTxRoute_4" 
                LookupCode="MedRoute" style="width:60px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_4" LookupCode="MedSchedule" style="width:60px;" DropDownWidth="300px"/></td>
            <td align="center"><euc:EformTextBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_4" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" ID="MedTxInstitution_4"
                 LookupCode="Institution" Width="80px"/></td>
	        <td align="center"><euc:EformTextBox RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_4" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
	        <td align="center"><euc:EformDropDownList RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_4" 
	            LookupCode="DataQuality"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        <tr id="MedTxHtmlRow5" style="DISPLAY: none">
            <td><euc:EformDropDownList RecordId="5" runat="server" ID="ProtocolId_5" Table="MedicalTherapy" Field="ProtocolId" Width="150px" 
                LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)" /></td>
            <td align="center"><euc:EformCheckBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxPending" Runat="server" 
                ID="MedTxPending_5" Value="1" /></td>
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" TABLE="MedicalTherapy" 
                FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_5"/>
		        <euc:EformHidden RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_5"/>
	        </td>
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" TABLE="MedicalTherapy" 
                    FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_5"/>
		        <euc:EformHidden RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_5"/>
	        </td>
	        <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_5" LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>   
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxSite" Runat="server" 
                ID="MedTxSite_5" LookupCode="DxTarget" style="width:70px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_5" 
                LookupCode="MedTxAgent" Width="70px"/></td>
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_5" 
                LookupCode="MedTxType" style="width:70px;"/></td>
            <td ><euc:EformTextBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_5" 
                Width="40px"/></td>
            <td ><euc:EformTextBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxTotalDose" Runat="server" ID="MedTxTotalDose_5" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_5" 
                LookupCode="MedUnits" style="width:50px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxRoute" Runat="server" ID="MedTxRoute_5" 
                LookupCode="MedRoute" style="width:60px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_5" LookupCode="MedSchedule" style="width:60px;" DropDownWidth="300px"/></td>
            <td align="center"><euc:EformTextBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_5" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" ID="MedTxInstitution_5"
                 LookupCode="Institution" Width="80px"/></td>
	        <td align="center"><euc:EformTextBox RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_5" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
	        <td align="center"><euc:EformDropDownList RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_5" 
	            LookupCode="DataQuality"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        <tr id="MedTxHtmlRow6" style="DISPLAY: none">
            <td><euc:EformDropDownList RecordId="6" runat="server" ID="ProtocolId_6" Table="MedicalTherapy" Field="ProtocolId" Width="150px" 
                LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)" /></td>
            <td align="center"><euc:EformCheckBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxPending" Runat="server" 
                ID="MedTxPending_6" Value="1" /></td>
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="6" TABLE="MedicalTherapy" 
                FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_6"/>
		        <euc:EformHidden RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_6"/>
	        </td>
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="6" TABLE="MedicalTherapy" 
                    FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_6"/>
		        <euc:EformHidden RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_6"/>
	        </td>
	        <td align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_6" LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>   
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxSite" Runat="server" 
                ID="MedTxSite_6" LookupCode="DxTarget" style="width:70px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_6" 
                LookupCode="MedTxAgent" Width="70px"/></td>
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_6" 
                LookupCode="MedTxType" style="width:70px;"/></td>
            <td ><euc:EformTextBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_6" 
                Width="40px"/></td>
            <td ><euc:EformTextBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxTotalDose" Runat="server" ID="MedTxTotalDose_6" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_6" 
                LookupCode="MedUnits" style="width:50px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxRoute" Runat="server" ID="MedTxRoute_6" 
                LookupCode="MedRoute" style="width:60px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_6" LookupCode="MedSchedule" style="width:60px;" DropDownWidth="300px"/></td>
            <td align="center"><euc:EformTextBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_6" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" ID="MedTxInstitution_6"
                 LookupCode="Institution" Width="80px"/></td>
	        <td align="center"><euc:EformTextBox RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_6" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
	        <td align="center"><euc:EformDropDownList RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_6" 
	            LookupCode="DataQuality"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        <tr id="MedTxHtmlRow7" style="DISPLAY: none">
            <td><euc:EformDropDownList RecordId="7" runat="server" ID="ProtocolId_7" Table="MedicalTherapy" Field="ProtocolId" Width="150px" 
                LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)" /></td>
            <td align="center"><euc:EformCheckBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxPending" Runat="server" 
                ID="MedTxPending_7" Value="1" /></td>
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="7" TABLE="MedicalTherapy" 
                FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_7"/>
		        <euc:EformHidden RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_7"/>
	        </td>
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="7" TABLE="MedicalTherapy" 
                    FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_7"/>
		        <euc:EformHidden RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_7"/>
	        </td>
	        <td align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_7" LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>   
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxSite" Runat="server" 
                ID="MedTxSite_7" LookupCode="DxTarget" style="width:70px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_7" 
                LookupCode="MedTxAgent" Width="70px"/></td>
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_7" 
                LookupCode="MedTxType" style="width:70px;"/></td>
            <td ><euc:EformTextBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_7" 
                Width="40px"/></td>
            <td ><euc:EformTextBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxTotalDose" Runat="server" ID="MedTxTotalDose_7" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_7" 
                LookupCode="MedUnits" style="width:50px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxRoute" Runat="server" ID="MedTxRoute_7" 
                LookupCode="MedRoute" style="width:60px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_7" LookupCode="MedSchedule" style="width:60px;" DropDownWidth="300px"/></td>
            <td align="center"><euc:EformTextBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_7" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" ID="MedTxInstitution_7"
                 LookupCode="Institution" Width="80px"/></td>
	        <td align="center"><euc:EformTextBox RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_7" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
	        <td align="center"><euc:EformDropDownList RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_7" 
	            LookupCode="DataQuality"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        <tr id="MedTxHtmlRow8" style="DISPLAY: none">
            <td><euc:EformDropDownList RecordId="8" runat="server" ID="ProtocolId_8" Table="MedicalTherapy" Field="ProtocolId" Width="150px" 
                LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)" /></td>
            <td align="center"><euc:EformCheckBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxPending" Runat="server" 
                ID="MedTxPending_8" Value="1" /></td>
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="8" TABLE="MedicalTherapy" 
                FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_8"/>
		        <euc:EformHidden RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_8"/>
	        </td>
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="8" TABLE="MedicalTherapy" 
                    FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_8"/>
		        <euc:EformHidden RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_8"/>
	        </td>
	        <td align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_8" LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>   
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxSite" Runat="server" 
                ID="MedTxSite_8" LookupCode="DxTarget" style="width:70px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_8" 
                LookupCode="MedTxAgent" Width="70px"/></td>
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_8" 
                LookupCode="MedTxType" style="width:70px;"/></td>
            <td ><euc:EformTextBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_8" 
                Width="40px"/></td>
            <td ><euc:EformTextBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxTotalDose" Runat="server" ID="MedTxTotalDose_8" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_8" 
                LookupCode="MedUnits" style="width:50px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxRoute" Runat="server" ID="MedTxRoute_8" 
                LookupCode="MedRoute" style="width:60px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_8" LookupCode="MedSchedule" style="width:60px;" DropDownWidth="300px"/></td>
            <td align="center"><euc:EformTextBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_8" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" ID="MedTxInstitution_8"
                 LookupCode="Institution" Width="80px"/></td>
	        <td align="center"><euc:EformTextBox RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_8" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
	        <td align="center"><euc:EformDropDownList RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_8" 
	            LookupCode="DataQuality"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        <tr id="MedTxHtmlRow9" style="DISPLAY: none">
            <td><euc:EformDropDownList RecordId="9" runat="server" ID="ProtocolId_9" Table="MedicalTherapy" Field="ProtocolId" Width="150px" 
                LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)" /></td>
            <td align="center"><euc:EformCheckBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxPending" Runat="server" 
                ID="MedTxPending_9" Value="1" /></td>
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="9" TABLE="MedicalTherapy" 
                FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_9"/>
		        <euc:EformHidden RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_9"/>
	        </td>
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="9" TABLE="MedicalTherapy" 
                    FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_9"/>
		        <euc:EformHidden RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_9"/>
	        </td>
	        <td align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_9" LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>   
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxSite" Runat="server" 
                ID="MedTxSite_9" LookupCode="DxTarget" style="width:70px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_9" 
                LookupCode="MedTxAgent" Width="70px"/></td>
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_9" 
                LookupCode="MedTxType" style="width:70px;"/></td>
            <td ><euc:EformTextBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_9" 
                Width="40px"/></td>
            <td ><euc:EformTextBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxTotalDose" Runat="server" ID="MedTxTotalDose_9" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_9" 
                LookupCode="MedUnits" style="width:50px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxRoute" Runat="server" ID="MedTxRoute_9" 
                LookupCode="MedRoute" style="width:60px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_9" LookupCode="MedSchedule" style="width:60px;" DropDownWidth="300px"/></td>
            <td align="center"><euc:EformTextBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_9" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" ID="MedTxInstitution_9"
                 LookupCode="Institution" Width="80px"/></td>
	        <td align="center"><euc:EformTextBox RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_9" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
	        <td align="center"><euc:EformDropDownList RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_9" 
	            LookupCode="DataQuality"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        <tr id="MedTxHtmlRow10" style="DISPLAY: none">
            <td><euc:EformDropDownList RecordId="10" runat="server" ID="ProtocolId_10" Table="MedicalTherapy" Field="ProtocolId" Width="150px" 
                LookupDistinct="Protocols;ProtocolId; COALESCE(ProtocolNum,'') + ': ' + COALESCE(ProtocolTitle,'');ProtocolId IN (SELECT ProtocolId From PatientProtocols WHERE PatientId = @PatientId)" /></td>
            <td align="center"><euc:EformCheckBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxPending" Runat="server" 
                ID="MedTxPending_10" Value="1" /></td>
            <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="10" TABLE="MedicalTherapy" 
                FIELD="MedTxDateText" Runat="server" ID="MedTxDateText_10"/>
		        <euc:EformHidden RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDate" Runat="server" ID="MedTxDate_10"/>
	        </td>
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="10" TABLE="MedicalTherapy" 
                    FIELD="MedTxStopDateText" Runat="server" ID="MedTxStopDateText_10"/>
		        <euc:EformHidden RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxStopDate" Runat="server" ID="MedTxStopDate_10"/>
	        </td>
	        <td align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDisease" Runat="server" 
	            ID="MedTxDisease_10" LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>   
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxSite" Runat="server" 
                ID="MedTxSite_10" LookupCode="DxTarget" style="width:70px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxAgent" Runat="server" ID="MedTxAgent_10" 
                LookupCode="MedTxAgent" Width="70px"/></td>
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_10" 
                LookupCode="MedTxType" style="width:70px;"/></td>
            <td ><euc:EformTextBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_10" 
                Width="40px"/></td>
            <td ><euc:EformTextBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxTotalDose" Runat="server" ID="MedTxTotalDose_10" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_10" 
                LookupCode="MedUnits" style="width:50px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxRoute" Runat="server" ID="MedTxRoute_10" 
                LookupCode="MedRoute" style="width:60px;"/></td>
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxSchedule" Runat="server" 
                ID="MedTxSchedule_10" LookupCode="MedSchedule" style="width:60px;" DropDownWidth="300px"/></td>
            <td align="center"><euc:EformTextBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_10" 
                Width="40px"/></td>
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxInstitution" Runat="server" ID="MedTxInstitution_10"
                 LookupCode="Institution" Width="80px"/></td>
	        <td align="center"><euc:EformTextBox RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" 
                ID="MedTxNotes_10" ShowTextEditor="true" Width="60px" MaxLength="1000"/></td>
	        <td align="center"><euc:EformDropDownList RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxQuality" Runat="server" ID="MedTxQuality_10" 
	            LookupCode="DataQuality"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
    </table>
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'NeuroMedTxHtmlTable');" /><br />
            </td></tr></table>
        </td>
    </tr>
    
    <tr id="MedTxAbsentRow" style="display:none;" runat="server">
        <td colspan="2">           
            
            <table cellpadding="3" cellspacing="0" class="ClinicalEformTable">
              <tr id="MedTxAbsentHdrTR" runat="server"> 
                    <td  class="controlBoxDataGridTitleColumn">Absent Date</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Table</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Field</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Value</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Reason</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
                </tr>
                <tr id="MedTxAbsentHTMLTR">
                    <td><asp:HiddenField ID="MedTxAbsEvntDt" runat="server" />
                        <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_2"
                            runat="server" Width="100px" ShowCalendar="true" AppendToOnChange="UpdateAssociatedDate(this);"/>
                        <euc:EformHidden RecordId="2" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_2"
                            Runat="server"/></td>
                    <td><euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="TableName" ID="TableName_2"
                            runat="server" Width="110px" /></td>
                    <td><euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldName" ID="FieldName_2"
                            runat="server" Width="90px" /></td>
                    <td><euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_2"
                            runat="server" Width="110px" /></td>
                    <td><euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_2"
                            runat="server" Width="100px" /></td>
                    <td><euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_2"
                            runat="server" Width="80px" /></td>
               </tr>
        </table>
        </td>
    </tr>    
</table><br /><br />



<script type="text/javascript">
    //Adds events for medTx   
    addMedTxEvent($('<%= MedTxDone.ClientID %>'),$('<%= NeuroMedTxDetails.ClientID %>'),$('<%= MedTxAbsentRow.ClientID %>'),$('<%= AbsentDateText_2.ClientID %>'),$('<%= AbsentDate_2.ClientID %>'),$('<%= TableName_2.ClientID %>'),$('<%= FieldName_2.ClientID %>'),$('<%= FieldValue_2.ClientID %>'),$('<%= AbsentReason_2.ClientID %>'),$('<%= AbsentQuality_2.ClientID %>'),$('<%= MedTxAbsEvntDt.ClientID %>'));
    
    function addMedTxEvent(MedTxYesNoID,MedTxTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt)
    {  
        $(MedTxYesNoID).addEvent('click',curry(MedTxHxYesNo,MedTxYesNoID,MedTxTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt));

        // check on load as well
        MedTxHxYesNo(MedTxYesNoID,MedTxTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt);
    }
   
    function MedTxHxYesNo(MedTxYesNoID,MedTxTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt)
    {
       var MedTxYesNoRef = MedTxYesNoID.getElementsByTagName('input');
       
       for (var i = 0; i < MedTxYesNoRef.length; i++) 
        if (MedTxYesNoRef[i].checked) 
        {  
            MedTxHxMedioClick(MedTxYesNoRef[i].value,MedTxTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt);
        }
    }
    
    function MedTxHxMedioClick(MedTxoption_value,MedTxhideTR,MedTxAbsentHideTR,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt)
    {
      if (MedTxoption_value == "Yes")
      { 
        MedTxhideTR.style.display='block';
        
        MedTxAbsentHideTR.style.display='none';
        
        //clears absent event data
        clearElementsInParentRow(document.getElementById('MedTxAbsentHTMLTR'));
        
      } 
      else if (MedTxoption_value == "No")
      {
        MedTxhideTR.style.display='none';
        
        MedTxAbsentHideTR.style.display='block';
        
        //clears all rows data
        for(var i=1;i<=10;i++)
        {
            clearElementsInParentRow(document.getElementById('MedTxHtmlRow'+i));
        }
        
        dateTextFieldId.value = HiddenDt.value;
        dateFieldId.value = HiddenDt.value;
        tableId.value = 'MedicalTherapy';
        fieldId.value = 'MedTxType';
        fieldValueId.value = 'Chemo';
        reasonId.value = 'Not Performed';
        qltyId.value = 'STD';
      }
    }
</script>