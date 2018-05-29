<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.MedsPedsNeuro" CodeFile="MedsPedsNeuro.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.PedsNeuroMedsTable = "PedsNeuroMedsTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="MedsPedsNeuro" /><span class="controlBoxTitle">Medications</span><br />  

<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <span class="controlBoxTitle" style="font-size: 12px;">Previous Medications</span><br/>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevPedsNeuroMedsTable">
                <tr id="NoPedsNeuroMedsMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Medications were recorded for this patient.
                    </td>
                </tr>
                
                <tr runat="server" id="PrevPedsNeuroMedsRptHdr">
		            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Start Date</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Stop Date</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Medication</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Total<br />Dose</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Units</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data<br />Quality</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
              </tr>
              
              <asp:Repeater ID="PedsNeuroMedsRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Medications', <%# Eval("MedicationId") %>, 'MedDateText,MedDate,MedStopDateText,MedStopDate,MedType,Medication,MedTotalDose,MedUnits,MedQuality', 'Medications');"> 
			            <td class="ClinicalEformPopulatedColumn">&nbsp;<%# Eval("MedDateText")%></td>
			            <td class="ClinicalEformPopulatedColumn">&nbsp;<%# Eval("MedStopDateText")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedType")%></td>			            
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("Medication")%></td>			            
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedTotalDose")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedUnits")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("MedQuality")%></td>
			            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
              </table><br /><br />
              
<span class="controlBoxTitle" style="font-size: 12px;">Add new Medications</span><br/>
<table width="650" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroMedsTable">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Start Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Stop Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Medication</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Total<br />Dose</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Units</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data<br />Quality</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>   
  <tr>
	<td style="text-align: center;">
	    <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="Medications" 
	    FIELD="MedDateText" Runat="server" ID="MedDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_1"/></td>
	<td style="text-align: center;">
	<euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="Medications" 
	    FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="DMedStopDate_1"/></td>	  
	<td style="text-align: center;"><euc:EformSelect RecordId="1" runat="server" ID="MedType_1" Table="Medications" 
	    Field="MedType" style="Width:80px" DropDownWidth="200px" LookupCode="MedType"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="1" runat="server" ID="Medication_1" Table="Medications" 
	    Field="Medication" Width="80px" LookupCode="Medication"/></td> 
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="MedTotalDose_1" RecordId="1" Table="Medications" 
	    Field="MedTotalDose" Width="80px" /></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="1" runat="server" ID="MedUnits_1" Table="Medications" 
	    Field="MedUnits" style="Width:80px" DropDownWidth="200px" LookupCode="MedUnits"/></td> 
	<td style="text-align: center;"><euc:EformDropDownList RecordId="1" runat="server" ID="MedQuality_1" Table="Medications" 
	    Field="MedQuality" LookupCode="DataQuality"/></td> 	
	<td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
     <td style="text-align: center;">
     <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="Medications" 
	    FIELD="MedDateText" Runat="server" ID="MedDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_2"/></td>
	<td style="text-align: center;">
	<euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="Medications" 
	    FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="DMedStopDate_2"/></td>	  
	<td style="text-align: center;"><euc:EformSelect RecordId="2" runat="server" ID="MedType_2" Table="Medications" 
	    Field="MedType" style="Width:80px" DropDownWidth="200px" LookupCode="MedType"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="2" runat="server" ID="Medication_2" Table="Medications" 
	    Field="Medication" Width="80px" LookupCode="Medication"/></td> 
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="MedTotalDose_2" RecordId="2" Table="Medications" 
	    Field="MedTotalDose" Width="80px" /></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="2" runat="server" ID="MedUnits_2" Table="Medications" 
	    Field="MedUnits" style="Width:80px" DropDownWidth="200px" LookupCode="MedUnits"/></td> 
	<td style="text-align: center;"><euc:EformDropDownList RecordId="2" runat="server" ID="MedQuality_2" Table="Medications" 
	    Field="MedQuality" LookupCode="DataQuality"/></td> 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td style="text-align: center;">
     <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="Medications" 
	    FIELD="MedDateText" Runat="server" ID="MedDateText_3"/>
		    <euc:EformHidden RecordId="3" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_3"/></td>
	<td style="text-align: center;">
	<euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="Medications" 
	    FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_3"/>
		    <euc:EformHidden RecordId="3" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="DMedStopDate_3"/></td>	  
	<td style="text-align: center;"><euc:EformSelect RecordId="3" runat="server" ID="MedType_3" Table="Medications" 
	    Field="MedType" style="Width:80px" DropDownWidth="200px" LookupCode="MedType"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="3" runat="server" ID="Medication_3" Table="Medications" 
	    Field="Medication" Width="80px" LookupCode="Medication"/></td> 
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="MedTotalDose_3" RecordId="3" Table="Medications" 
	    Field="MedTotalDose" Width="80px" /></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="3" runat="server" ID="MedUnits_3" Table="Medications" 
	    Field="MedUnits" style="Width:80px" DropDownWidth="200px" LookupCode="MedUnits"/></td> 
	<td style="text-align: center;"><euc:EformDropDownList RecordId="3" runat="server" ID="MedQuality_3" Table="Medications" 
	    Field="MedQuality" LookupCode="DataQuality"/></td> 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td style="text-align: center;">
     <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="Medications" 
	    FIELD="MedDateText" Runat="server" ID="MedDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_4"/></td>
	<td style="text-align: center;">
	<euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="Medications" 
	    FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="DMedStopDate_4"/></td>	  
	<td style="text-align: center;"><euc:EformSelect RecordId="4" runat="server" ID="MedType_4" Table="Medications" 
	    Field="MedType" style="Width:80px" DropDownWidth="200px" LookupCode="MedType"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="4" runat="server" ID="Medication_4" Table="Medications" 
	    Field="Medication" Width="80px" LookupCode="Medication"/></td> 
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="MedTotalDose_4" RecordId="4" Table="Medications" 
	    Field="MedTotalDose" Width="80px" /></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="4" runat="server" ID="MedUnits_4" Table="Medications" 
	    Field="MedUnits" style="Width:80px" DropDownWidth="200px" LookupCode="MedUnits"/></td> 
	<td style="text-align: center;"><euc:EformDropDownList RecordId="4" runat="server" ID="MedQuality_4" Table="Medications" 
	    Field="MedQuality" LookupCode="DataQuality"/></td> 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td style="text-align: center;">
     <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="Medications" 
	    FIELD="MedDateText" Runat="server" ID="MedDateText_5"/>
		    <euc:EformHidden RecordId="5" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_5"/></td>
	<td style="text-align: center;">
	<euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="Medications" 
	    FIELD="MedStopDateText" Runat="server" ID="MedStopDateText_5"/>
		    <euc:EformHidden RecordId="5" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="DMedStopDate_5"/></td>	  
	<td style="text-align: center;"><euc:EformSelect RecordId="5" runat="server" ID="MedType_5" Table="Medications" 
	    Field="MedType" style="Width:80px" DropDownWidth="200px" LookupCode="MedType"/></td> 
	<td style="text-align: center;"><euc:EformComboBox RecordId="5" runat="server" ID="Medication_5" Table="Medications" 
	    Field="Medication" Width="80px" LookupCode="Medication"/></td> 
	<td style="text-align:center;"><euc:EformTextBox runat="server" ID="MedTotalDose_5" RecordId="5" Table="Medications" 
	    Field="MedTotalDose" Width="80px" /></td>
	<td style="text-align: center;"><euc:EformSelect RecordId="5" runat="server" ID="MedUnits_5" Table="Medications" 
	    Field="MedUnits" style="Width:80px" DropDownWidth="200px" LookupCode="MedUnits"/></td> 
	<td style="text-align: center;"><euc:EformDropDownList RecordId="5" runat="server" ID="MedQuality_5" Table="Medications" 
	    Field="MedQuality" LookupCode="DataQuality"/></td> 
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  
                onclick="return showFirstAdditionalRow(this,'PedsNeuroMedsTable');" /><br />
</td></tr></table><br /><br />