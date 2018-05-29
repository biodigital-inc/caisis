<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.SpineMedications" CodeFile="SpineMedications.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.SpineMedsTable = "SpineMedsTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SpineMedications" /><span class="controlBoxTitle">Medications</span><br />  

<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevSpineMedsTable">
                <tr id="NoSpineMedsMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="11" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Medications were recorded for this patient.
                    </td>
                </tr>
              </table>
              
              <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 150px; width:825; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="825" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpineMedsRptTable"> 
              <asp:Repeater ID="SpineMedsRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                <HeaderTemplate>
                  <tr runat="server" id="PrevSpineMedsRptHdr">
		            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Start Date</td>
		            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Stop Date</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Medication</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Dose</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Units</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Route</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Schedule</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data<br />Qlty</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
                  </tr>
                </HeaderTemplate>
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Medications', <%# Eval("MedicationId") %>, 'MedDateText,MedDate,MedStopDateText,MedStopDate,MedType,Medication,MedDose,MedUnits,MedRoute,MedSchedule,MedNotes,MedQuality', 'Medications');"> 
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedDateText")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedStopDateText")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedType")%></td>		            
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("Medication")%></td>	           
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedDose")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedUnits")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedRoute")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedSchedule")%></td>	
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedNotes")%></td>	            
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedQuality")%></td>
			            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
              </table></div><br /><br />
              
<table width="650" border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="SpineMedsTable">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Start Date</td>
	<td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Stop Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Medication</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Dose</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Units</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Route</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Schedule</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data<br />Qlty</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>   
  <tr style="white-space:nowrap;">
	<td style="text-align: center;">
	    <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" TABLE="Medications" 
	    FIELD="MedDateText" Runat="server" ID="MedDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_1"/></td>
    <td style="text-align: center;">
	    <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" TABLE="Medications" 
	    FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_1"/></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="1" runat="server" ID="MedType_1" Table="Medications" 
	    Field="MedType" style="Width:80px" DropDownWidth="200px" LookupCode="MedType,Disease,Spine"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="1" runat="server" ID="Medication_1" Table="Medications" 
	    Field="Medication" Width="80px" LookupCode="Medication,Disease,Spine"/></td> 
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="MedDose_1" RecordId="1" Table="Medications" 
	    Field="MedDose" Width="50px" /></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="1" runat="server" ID="MedUnits_1" Table="Medications" 
	    Field="MedUnits" style="Width:50px" DropDownWidth="200px" LookupCode="MedUnits"/></td> 	
	<td style="text-align: center;"><euc:EformSelect RecordId="1" runat="server" ID="MedRoute_1" Table="Medications" 
	    Field="MedRoute" style="Width:60px" DropDownWidth="200px" LookupCode="MedRoute"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="1" runat="server" ID="MedSchedule_1" Table="Medications" 
	    Field="MedSchedule" Width="60px" LookupCode="MedSchedule"/></td>
	<td align="center"><euc:EformTextBox RecordId="1" width="60px" TABLE="Medications" FIELD="MedNotes" Runat="server" 
	    ID="MedNotes_1" ShowTextEditor="true" MaxLength="1000"/></td>
	<td style="text-align: center;"><euc:EformDropDownList RecordId="1" runat="server" ID="MedQuality_1" Table="Medications" 
	    Field="MedQuality" LookupCode="DataQuality"/></td> 	
	<td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none; white-space:nowrap;">
     <td style="text-align: center;">
     <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" TABLE="Medications" 
	    FIELD="MedDateText" Runat="server" ID="MedDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_2"/></td>
    <td style="text-align: center;">
	    <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" TABLE="Medications" 
	    FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_2"/></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="2" runat="server" ID="MedType_2" Table="Medications" 
	    Field="MedType" style="Width:80px" DropDownWidth="200px" LookupCode="MedType,Disease,Spine"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="2" runat="server" ID="Medication_2" Table="Medications" 
	    Field="Medication" Width="80px" LookupCode="Medication,Disease,Spine"/></td> 
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="MedDose_2" RecordId="2" Table="Medications" 
	    Field="MedDose" Width="50px" /></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="2" runat="server" ID="MedUnits_2" Table="Medications" 
	    Field="MedUnits" style="Width:50px" DropDownWidth="200px" LookupCode="MedUnits"/></td> 
	<td style="text-align: center;"><euc:EformSelect RecordId="2" runat="server" ID="MedRoute_2" Table="Medications" 
	    Field="MedRoute" style="Width:60px" DropDownWidth="200px" LookupCode="MedRoute"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="2" runat="server" ID="MedSchedule_2" Table="Medications" 
	    Field="MedSchedule" Width="60px" LookupCode="MedSchedule"/></td>
	<td align="center"><euc:EformTextBox RecordId="2" width="60px" TABLE="Medications" FIELD="MedNotes" Runat="server" 
	    ID="MedNotes_2" ShowTextEditor="true" MaxLength="1000"/></td>
	<td style="text-align: center;"><euc:EformDropDownList RecordId="2" runat="server" ID="MedQuality_2" Table="Medications" 
	    Field="MedQuality" LookupCode="DataQuality"/></td> 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none; white-space:nowrap;">
    <td style="text-align: center;">
     <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" TABLE="Medications" 
	    FIELD="MedDateText" Runat="server" ID="MedDateText_3"/>
		    <euc:EformHidden RecordId="3" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_3"/></td> 
    <td style="text-align: center;">
	    <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" TABLE="Medications" 
	    FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_3"/>
		    <euc:EformHidden RecordId="3" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_3"/></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="3" runat="server" ID="MedType_3" Table="Medications" 
	    Field="MedType" style="Width:80px" DropDownWidth="200px" LookupCode="MedType,Disease,Spine"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="3" runat="server" ID="Medication_3" Table="Medications" 
	    Field="Medication" Width="80px" LookupCode="Medication,Disease,Spine"/></td> 
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="MedDose_3" RecordId="3" Table="Medications" 
	    Field="MedDose" Width="50px" /></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="3" runat="server" ID="MedUnits_3" Table="Medications" 
	    Field="MedUnits" style="Width:50px" DropDownWidth="200px" LookupCode="MedUnits"/></td> 
	<td style="text-align: center;"><euc:EformSelect RecordId="3" runat="server" ID="MedRoute_3" Table="Medications" 
	    Field="MedRoute" style="Width:60px" DropDownWidth="200px" LookupCode="MedRoute"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="3" runat="server" ID="MedSchedule_3" Table="Medications" 
	    Field="MedSchedule" Width="60px" LookupCode="MedSchedule"/></td>
	<td align="center"><euc:EformTextBox RecordId="3" width="60px" TABLE="Medications" FIELD="MedNotes" Runat="server" 
	    ID="MedNotes_3" ShowTextEditor="true" MaxLength="1000"/></td>
	<td style="text-align: center;"><euc:EformDropDownList RecordId="3" runat="server" ID="MedQuality_3" Table="Medications" 
	    Field="MedQuality" LookupCode="DataQuality"/></td> 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none; white-space:nowrap;"">
    <td style="text-align: center;">
     <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" TABLE="Medications" 
	    FIELD="MedDateText" Runat="server" ID="MedDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_4"/></td>	  
	<td style="text-align: center;">
	    <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" TABLE="Medications" 
	    FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_4"/></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="4" runat="server" ID="MedType_4" Table="Medications" 
	    Field="MedType" style="Width:80px" DropDownWidth="200px" LookupCode="MedType,Disease,Spine"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="4" runat="server" ID="Medication_4" Table="Medications" 
	    Field="Medication" Width="80px" LookupCode="Medication,Disease,Spine"/></td> 
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="MedDose_4" RecordId="4" Table="Medications" 
	    Field="MedDose" Width="50px" /></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="4" runat="server" ID="MedUnits_4" Table="Medications" 
	    Field="MedUnits" style="Width:50px" DropDownWidth="200px" LookupCode="MedUnits"/></td> 
	<td style="text-align: center;"><euc:EformSelect RecordId="4" runat="server" ID="MedRoute_4" Table="Medications" 
	    Field="MedRoute" style="Width:60px" DropDownWidth="200px" LookupCode="MedRoute"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="4" runat="server" ID="MedSchedule_4" Table="Medications" 
	    Field="MedSchedule" Width="60px" LookupCode="MedSchedule"/></td>
	<td align="center"><euc:EformTextBox RecordId="4" width="60px" TABLE="Medications" FIELD="MedNotes" Runat="server" 
	    ID="MedNotes_4" ShowTextEditor="true" MaxLength="1000"/></td>
	<td style="text-align: center;"><euc:EformDropDownList RecordId="4" runat="server" ID="MedQuality_4" Table="Medications" 
	    Field="MedQuality" LookupCode="DataQuality"/></td> 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none; white-space:nowrap;"">
    <td style="text-align: center;">
     <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" TABLE="Medications" 
	    FIELD="MedDateText" Runat="server" ID="MedDateText_5"/>
		    <euc:EformHidden RecordId="5" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_5"/></td>	 
	<td style="text-align: center;">
	    <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" TABLE="Medications" 
	    FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_5"/>
		    <euc:EformHidden RecordId="5" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_5"/></td> 
	<td style="text-align: center;"><euc:EformSelect RecordId="5" runat="server" ID="MedType_5" Table="Medications" 
	    Field="MedType" style="Width:80px" DropDownWidth="200px" LookupCode="MedType,Disease,Spine"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="5" runat="server" ID="Medication_5" Table="Medications" 
	    Field="Medication" Width="80px" LookupCode="Medication,Disease,Spine"/></td> 
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="MedDose_5" RecordId="5" Table="Medications" 
	    Field="MedDose" Width="50px" /></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="5" runat="server" ID="MedUnits_5" Table="Medications" 
	    Field="MedUnits" style="Width:50px" DropDownWidth="200px" LookupCode="MedUnits"/></td> 
	<td style="text-align: center;"><euc:EformSelect RecordId="5" runat="server" ID="MedRoute_5" Table="Medications" 
	    Field="MedRoute" style="Width:60px" DropDownWidth="200px" LookupCode="MedRoute"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="5" runat="server" ID="MedSchedule_5" Table="Medications" 
	    Field="MedSchedule" Width="60px" LookupCode="MedSchedule"/></td>
	<td align="center"><euc:EformTextBox RecordId="5" width="60px" TABLE="Medications" FIELD="MedNotes" Runat="server" 
	    ID="MedNotes_5" ShowTextEditor="true" MaxLength="1000"/></td>
	<td style="text-align: center;"><euc:EformDropDownList RecordId="5" runat="server" ID="MedQuality_5" Table="Medications" 
	    Field="MedQuality" LookupCode="DataQuality"/></td> 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  
                onclick="return showFirstAdditionalRow(this,'SpineMedsTable');" /><br />
</td></tr></table><br /><br />