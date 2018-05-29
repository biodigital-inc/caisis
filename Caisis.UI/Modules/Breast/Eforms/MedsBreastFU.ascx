<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.MedsBreastFU" CodeFile="MedsBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
    tableArray.BreastMedsTbl="BreastMedsTbl";
    tableArray.BreastAllergiesTbl="BreastAllergiesTbl";
</script>

<a name="MedsBreastFU" /><span class="controlBoxTitle">Medications</span> <br/>

<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
 <tr >
    <td style="white-space:nowrap;"><strong>Any medications changed since last appointment ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="MedsChangedYesNo" id="MedsChangedYesNo" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:30%"></td>
  </tr>
  
  <tr id="MedsTR" runat="server" style="display: none;">
     <td colspan="3">
        <span class="controlBoxTitle" style="font-size: 12px;">Previous Medications</span><br/>
            <table cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="MedsHxTable">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:95px;">Start Date</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:90px;">Stop Date</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:85px;">Type</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:85px;">Medication</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:60px;">Dose</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:60px;">Units</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:90px;">Schedule</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:90px;">Indication</td>
	                <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:20px;">&nbsp;</td>
                </tr>
                
                <asp:Repeater ID="BreastMedsRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound">
            <ItemTemplate>
                <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Medications', <%# DataBinder.Eval(Container.DataItem, "MedicationId") %>, 'MedDateText,MedDate,MedType,Medication,MedStopDateText,MedStopDate,MedDose,MedUnits,MedSchedule,MedIndication,MedQuality','Medications');">
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedDateText")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedStopDateText")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedType")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Medication")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedDose")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedUnits")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedSchedule")%></td>
                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedIndication")%></td>
                    <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9"
                            height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
            </table><br /><br />
            
            <span class="controlBoxTitle" style="font-size: 12px;">Add Medications</span><br/>
            <table width="600" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastMedsTbl">
          <tr>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Start Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Stop Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Medication</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Dose</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Units</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Schedule</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
	        <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
          </tr>
          
          <tr id="BreastMedsTr1">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" Runat="server" 
                TABLE="Medications" FIELD="MedDateText" ID="MedDateText_1"/>
		        <euc:EformHidden RecordId="1" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_1"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" Runat="server" 
                TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_1"/>
		        <euc:EformHidden RecordId="1" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_1"/></td>	
		        
            <td align="center"><euc:EformSelect RecordId="1" TABLE="Medications" FIELD="MedType" Runat="server" 
                ID="MedType_1" LookupCode="MedType" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="1" TABLE="Medications" FIELD="Medication" Runat="server" 
                ID="Medication_1" LookupCode="Medication" style="width:70px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="1" TABLE="Medications" FIELD="MedDose" Runat="server" 
	            ID="MedDose_1" style="width:40px" ShowNumberPad="true"/></td>
	            
	        <td align="center"><euc:EformSelect RecordId="1" TABLE="Medications" FIELD="MedUnits" Runat="server" 
                ID="MedUnits_1" LookupCode="MedUnits" style="width:50px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="Medications" FIELD="MedSchedule" Runat="server" 
                ID="MedSchedule_1" LookupCode="MedSchedule" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="Medications" FIELD="MedIndication" Runat="server" 
                ID="MedIndication_1" LookupCode="MedIndication" style="width:70px" DropDownWidth="200px"/>
                
                <euc:EformTextBox RecordId="1" TABLE="Medications" FIELD="MedQuality" Runat="server" ID="MedQuality_1" 
                    style="display:none;width:1px;"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedsTr2" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" Runat="server" 
                TABLE="Medications" FIELD="MedDateText" ID="MedDateText_2"/>
		        <euc:EformHidden RecordId="2" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_2"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" Runat="server" 
                TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_2"/>
		        <euc:EformHidden RecordId="2" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_2"/></td>	
		        
            <td align="center"><euc:EformSelect RecordId="2" TABLE="Medications" FIELD="MedType" Runat="server" 
                ID="MedType_2" LookupCode="MedType" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="2" TABLE="Medications" FIELD="Medication" Runat="server" 
                ID="Medication_2" LookupCode="Medication" style="width:70px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="2" TABLE="Medications" FIELD="MedDose" Runat="server" 
	            ID="MedDose_2" style="width:40px" ShowNumberPad="true"/></td>
	            
	        <td align="center"><euc:EformSelect RecordId="2" TABLE="Medications" FIELD="MedUnits" Runat="server" 
                ID="MedUnits_2" LookupCode="MedUnits" style="width:50px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="Medications" FIELD="MedSchedule" Runat="server" 
                ID="MedSchedule_2" LookupCode="MedSchedule" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="Medications" FIELD="MedIndication" Runat="server" 
                ID="MedIndication_2" LookupCode="MedIndication" style="width:70px" DropDownWidth="200px"/>
                
                <euc:EformTextBox RecordId="2" TABLE="Medications" FIELD="MedQuality" Runat="server" ID="MedQuality_2" 
                    style="display:none;width:2px;"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedsTr3"  style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" Runat="server" 
                TABLE="Medications" FIELD="MedDateText" ID="MedDateText_3"/>
		        <euc:EformHidden RecordId="3" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_3"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" Runat="server" 
                TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_3"/>
		        <euc:EformHidden RecordId="3" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_3"/></td>	
		        
            <td align="center"><euc:EformSelect RecordId="3" TABLE="Medications" FIELD="MedType" Runat="server" 
                ID="MedType_3" LookupCode="MedType" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="3" TABLE="Medications" FIELD="Medication" Runat="server" 
                ID="Medication_3" LookupCode="Medication" style="width:70px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="3" TABLE="Medications" FIELD="MedDose" Runat="server" 
	            ID="MedDose_3" style="width:40px" ShowNumberPad="true"/></td>
	            
	        <td align="center"><euc:EformSelect RecordId="3" TABLE="Medications" FIELD="MedUnits" Runat="server" 
                ID="MedUnits_3" LookupCode="MedUnits" style="width:50px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="Medications" FIELD="MedSchedule" Runat="server" 
                ID="MedSchedule_3" LookupCode="MedSchedule" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="Medications" FIELD="MedIndication" Runat="server" 
                ID="MedIndication_3" LookupCode="MedIndication" style="width:70px" DropDownWidth="200px"/>
                
                <euc:EformTextBox RecordId="3" TABLE="Medications" FIELD="MedQuality" Runat="server" ID="MedQuality_3" 
                    style="display:none;width:3px;"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedsTr4"  style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" Runat="server" 
                TABLE="Medications" FIELD="MedDateText" ID="MedDateText_4"/>
		        <euc:EformHidden RecordId="4" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_4"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" Runat="server" 
                TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_4"/>
		        <euc:EformHidden RecordId="4" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_4"/></td>	
		        
            <td align="center"><euc:EformSelect RecordId="4" TABLE="Medications" FIELD="MedType" Runat="server" 
                ID="MedType_4" LookupCode="MedType" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="4" TABLE="Medications" FIELD="Medication" Runat="server" 
                ID="Medication_4" LookupCode="Medication" style="width:70px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="4" TABLE="Medications" FIELD="MedDose" Runat="server" 
	            ID="MedDose_4" style="width:40px" ShowNumberPad="true"/></td>
	            
	        <td align="center"><euc:EformSelect RecordId="4" TABLE="Medications" FIELD="MedUnits" Runat="server" 
                ID="MedUnits_4" LookupCode="MedUnits" style="width:50px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="Medications" FIELD="MedSchedule" Runat="server" 
                ID="MedSchedule_4" LookupCode="MedSchedule" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="Medications" FIELD="MedIndication" Runat="server" 
                ID="MedIndication_4" LookupCode="MedIndication" style="width:70px" DropDownWidth="200px"/>
                
                <euc:EformTextBox RecordId="4" TABLE="Medications" FIELD="MedQuality" Runat="server" ID="MedQuality_4" 
                    style="display:none;width:4px;"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedsTr5" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" Runat="server" 
                TABLE="Medications" FIELD="MedDateText" ID="MedDateText_5"/>
		        <euc:EformHidden RecordId="5" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_5"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" Runat="server" 
                TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_5"/>
		        <euc:EformHidden RecordId="5" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_5"/></td>	
		        
            <td align="center"><euc:EformSelect RecordId="5" TABLE="Medications" FIELD="MedType" Runat="server" 
                ID="MedType_5" LookupCode="MedType" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="5" TABLE="Medications" FIELD="Medication" Runat="server" 
                ID="Medication_5" LookupCode="Medication" style="width:70px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="5" TABLE="Medications" FIELD="MedDose" Runat="server" 
	            ID="MedDose_5" style="width:40px" ShowNumberPad="true"/></td>
	            
	        <td align="center"><euc:EformSelect RecordId="5" TABLE="Medications" FIELD="MedUnits" Runat="server" 
                ID="MedUnits_5" LookupCode="MedUnits" style="width:50px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="Medications" FIELD="MedSchedule" Runat="server" 
                ID="MedSchedule_5" LookupCode="MedSchedule" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="Medications" FIELD="MedIndication" Runat="server" 
                ID="MedIndication_5" LookupCode="MedIndication" style="width:70px" DropDownWidth="200px"/>
                
                <euc:EformTextBox RecordId="5" TABLE="Medications" FIELD="MedQuality" Runat="server" ID="MedQuality_5" 
                    style="display:none;width:5px;"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedsTr6" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="6" Runat="server" 
                TABLE="Medications" FIELD="MedDateText" ID="MedDateText_6"/>
		        <euc:EformHidden RecordId="6" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_6"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="6" Runat="server" 
                TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_6"/>
		        <euc:EformHidden RecordId="6" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_6"/></td>	
		        
            <td align="center"><euc:EformSelect RecordId="6" TABLE="Medications" FIELD="MedType" Runat="server" 
                ID="MedType_6" LookupCode="MedType" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="6" TABLE="Medications" FIELD="Medication" Runat="server" 
                ID="Medication_6" LookupCode="Medication" style="width:70px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="6" TABLE="Medications" FIELD="MedDose" Runat="server" 
	            ID="MedDose_6" style="width:40px" ShowNumberPad="true"/></td>
	        
	        <td align="center"><euc:EformSelect RecordId="6" TABLE="Medications" FIELD="MedUnits" Runat="server" 
                ID="MedUnits_6" LookupCode="MedUnits" style="width:50px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="Medications" FIELD="MedSchedule" Runat="server" 
                ID="MedSchedule_6" LookupCode="MedSchedule" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="Medications" FIELD="MedIndication" Runat="server" 
                ID="MedIndication_6" LookupCode="MedIndication" style="width:70px" DropDownWidth="200px"/>
                
                <euc:EformTextBox RecordId="6" TABLE="Medications" FIELD="MedQuality" Runat="server" ID="MedQuality_6" 
                    style="display:none;width:6px;"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedsTr7" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="7" Runat="server" 
                TABLE="Medications" FIELD="MedDateText" ID="MedDateText_7"/>
		        <euc:EformHidden RecordId="7" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_7"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="7" Runat="server" 
                TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_7"/>
		        <euc:EformHidden RecordId="7" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_7"/></td>	
		        
            <td align="center"><euc:EformSelect RecordId="7" TABLE="Medications" FIELD="MedType" Runat="server" 
                ID="MedType_7" LookupCode="MedType" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="7" TABLE="Medications" FIELD="Medication" Runat="server" 
                ID="Medication_7" LookupCode="Medication" style="width:70px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="7" TABLE="Medications" FIELD="MedDose" Runat="server" 
	            ID="MedDose_7" style="width:40px" ShowNumberPad="true"/></td>
	            
	        <td align="center"><euc:EformSelect RecordId="7" TABLE="Medications" FIELD="MedUnits" Runat="server" 
                ID="MedUnits_7" LookupCode="MedUnits" style="width:50px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="Medications" FIELD="MedSchedule" Runat="server" 
                ID="MedSchedule_7" LookupCode="MedSchedule" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="Medications" FIELD="MedIndication" Runat="server" 
                ID="MedIndication_7" LookupCode="MedIndication" style="width:70px" DropDownWidth="200px"/>
                
                <euc:EformTextBox RecordId="7" TABLE="Medications" FIELD="MedQuality" Runat="server" ID="MedQuality_7" 
                    style="display:none;width:7px;"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedsTr8" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="8" Runat="server" 
                TABLE="Medications" FIELD="MedDateText" ID="MedDateText_8"/>
		        <euc:EformHidden RecordId="8" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_8"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="8" Runat="server" 
                TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_8"/>
		        <euc:EformHidden RecordId="8" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_8"/></td>	
		        
            <td align="center"><euc:EformSelect RecordId="8" TABLE="Medications" FIELD="MedType" Runat="server" 
                ID="MedType_8" LookupCode="MedType" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="8" TABLE="Medications" FIELD="Medication" Runat="server" 
                ID="Medication_8" LookupCode="Medication" style="width:70px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="8" TABLE="Medications" FIELD="MedDose" Runat="server" 
	            ID="MedDose_8" style="width:40px" ShowNumberPad="true"/></td>
	            
	        <td align="center"><euc:EformSelect RecordId="8" TABLE="Medications" FIELD="MedUnits" Runat="server" 
                ID="MedUnits_8" LookupCode="MedUnits" style="width:50px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="Medications" FIELD="MedSchedule" Runat="server" 
                ID="MedSchedule_8" LookupCode="MedSchedule" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="Medications" FIELD="MedIndication" Runat="server" 
                ID="MedIndication_8" LookupCode="MedIndication" style="width:70px" DropDownWidth="200px"/>
                
                <euc:EformTextBox RecordId="8" TABLE="Medications" FIELD="MedQuality" Runat="server" ID="MedQuality_8" 
                    style="display:none;width:8px;"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedsTr9" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="9" Runat="server" 
                TABLE="Medications" FIELD="MedDateText" ID="MedDateText_9"/>
		        <euc:EformHidden RecordId="9" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_9"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="9" Runat="server" 
                TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_9"/>
		        <euc:EformHidden RecordId="9" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_9"/></td>	
		        
            <td align="center"><euc:EformSelect RecordId="9" TABLE="Medications" FIELD="MedType" Runat="server" 
                ID="MedType_9" LookupCode="MedType" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="9" TABLE="Medications" FIELD="Medication" Runat="server" 
                ID="Medication_9" LookupCode="Medication" style="width:70px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="9" TABLE="Medications" FIELD="MedDose" Runat="server" 
	            ID="MedDose_9" style="width:40px" ShowNumberPad="true"/></td>
	            
	        <td align="center"><euc:EformSelect RecordId="9" TABLE="Medications" FIELD="MedUnits" Runat="server" 
                ID="MedUnits_9" LookupCode="MedUnits" style="width:50px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="Medications" FIELD="MedSchedule" Runat="server" 
                ID="MedSchedule_9" LookupCode="MedSchedule" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="Medications" FIELD="MedIndication" Runat="server" 
                ID="MedIndication_9" LookupCode="MedIndication" style="width:70px" DropDownWidth="200px"/>
                
                <euc:EformTextBox RecordId="9" TABLE="Medications" FIELD="MedQuality" Runat="server" ID="MedQuality_9" 
                    style="display:none;width:9px;"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        <tr id="BreastMedsTr10" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="10" Runat="server" 
                TABLE="Medications" FIELD="MedDateText" ID="MedDateText_10"/>
		        <euc:EformHidden RecordId="10" TABLE="Medications" FIELD="MedDate" Runat="server" ID="MedDate_10"/></td>
		        
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="10" Runat="server" 
                TABLE="Medications" FIELD="MedStopDateText" ID="MedStopDateText_10"/>
		        <euc:EformHidden RecordId="10" TABLE="Medications" FIELD="MedStopDate" Runat="server" ID="MedStopDate_10"/></td>	
		        
            <td align="center"><euc:EformSelect RecordId="10" TABLE="Medications" FIELD="MedType" Runat="server" 
                ID="MedType_10" LookupCode="MedType" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformSelect RecordId="10" TABLE="Medications" FIELD="Medication" Runat="server" 
                ID="Medication_10" LookupCode="Medication" style="width:70px" DropDownWidth="250px"/></td>
                
            <td align="center"><euc:EformTextBox RecordId="10" TABLE="Medications" FIELD="MedDose" Runat="server" 
	            ID="MedDose_10" style="width:40px" ShowNumberPad="true"/></td>
	            
	        <td align="center"><euc:EformSelect RecordId="10" TABLE="Medications" FIELD="MedUnits" Runat="server" 
                ID="MedUnits_10" LookupCode="MedUnits" style="width:50px" DropDownWidth="250px"/></td>
	            
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="Medications" FIELD="MedSchedule" Runat="server" 
                ID="MedSchedule_10" LookupCode="MedSchedule" style="width:70px" DropDownWidth="200px"/></td>
                
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="Medications" FIELD="MedIndication" Runat="server" 
                ID="MedIndication_10" LookupCode="MedIndication" style="width:70px" DropDownWidth="200px"/>
                
                <euc:EformTextBox RecordId="10" TABLE="Medications" FIELD="MedQuality" Runat="server" ID="MedQuality_10" 
                    style="display:none;width:10px;"/></td>
	            
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
        </tr>
        
        </table>
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" 
            onclick="return showFirstAdditionalRow(this,'BreastMedsTbl');" /><br /><br />
     </td>
  </tr>
</table><br /><br />



<span class="controlBoxTitle">Allergies</span> <br/>
<table width="350" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastAllergiesTbl">
      <tr>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Allergen</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Response</td>
        <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
      </tr>
      
      <asp:Repeater ID="BreastFUAllergiesRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound">
        <ItemTemplate>
            <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Allergies', <%# DataBinder.Eval(Container.DataItem, "AllergyId") %>, 'Allergen,AllergyResponse','Allergies');">
                <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "Allergen")%></td>
                <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "AllergyResponse")%></td>
                <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9"
                        height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
      
      <tr> 
        <td align="center"><euc:EformComboBox RecordId="1" TABLE="Allergies" FIELD="Allergen" Runat="server" 
            ID="Allergen_1" LookupCode="Allergen" style="width:120px" DropDownWidth="250px"/></td>
            
        <td align="center"><euc:EformComboBox RecordId="1" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" 
            ID="AllergyResponse_1" LookupCode="AllergyResponse" style="width:120px" DropDownWidth="200px" DropDownHeight="auto"/></td>
            
        <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;"> 
        <td align="center"><euc:EformComboBox RecordId="2" TABLE="Allergies" FIELD="Allergen" Runat="server" 
            ID="Allergen_2" LookupCode="Allergen" style="width:120px" DropDownWidth="250px"/></td>
            
        <td align="center"><euc:EformComboBox RecordId="2" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" 
            ID="AllergyResponse_2" LookupCode="AllergyResponse" style="width:120px" DropDownWidth="200px" DropDownHeight="auto"/></td>
            
        <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;"> 
        <td align="center"><euc:EformComboBox RecordId="3" TABLE="Allergies" FIELD="Allergen" Runat="server" 
            ID="Allergen_3" LookupCode="Allergen" style="width:120px" DropDownWidth="250px"/></td>
            
        <td align="center"><euc:EformComboBox RecordId="3" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" 
            ID="AllergyResponse_3" LookupCode="AllergyResponse" style="width:120px" DropDownWidth="200px" DropDownHeight="auto"/></td>
            
        <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;"> 
        <td align="center"><euc:EformComboBox RecordId="4" TABLE="Allergies" FIELD="Allergen" Runat="server" 
            ID="Allergen_4" LookupCode="Allergen" style="width:120px" DropDownWidth="250px"/></td>
            
        <td align="center"><euc:EformComboBox RecordId="4" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" 
            ID="AllergyResponse_4" LookupCode="AllergyResponse" style="width:120px" DropDownWidth="200px" DropDownHeight="auto"/></td>
            
        <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;"> 
        <td align="center"><euc:EformComboBox RecordId="5" TABLE="Allergies" FIELD="Allergen" Runat="server" 
            ID="Allergen_5" LookupCode="Allergen" style="width:120px" DropDownWidth="250px"/></td>
            
        <td align="center"><euc:EformComboBox RecordId="5" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" 
            ID="AllergyResponse_5" LookupCode="AllergyResponse" style="width:120px" DropDownWidth="200px" DropDownHeight="auto"/></td>
            
        <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;"> 
        <td align="center"><euc:EformComboBox RecordId="6" TABLE="Allergies" FIELD="Allergen" Runat="server" 
            ID="Allergen_6" LookupCode="Allergen" style="width:120px" DropDownWidth="250px"/></td>
            
        <td align="center"><euc:EformComboBox RecordId="6" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" 
            ID="AllergyResponse_6" LookupCode="AllergyResponse" style="width:120px" DropDownWidth="200px" DropDownHeight="auto"/></td>
            
        <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;"> 
        <td align="center"><euc:EformComboBox RecordId="7" TABLE="Allergies" FIELD="Allergen" Runat="server" 
            ID="Allergen_7" LookupCode="Allergen" style="width:120px" DropDownWidth="250px"/></td>
            
        <td align="center"><euc:EformComboBox RecordId="7" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" 
            ID="AllergyResponse_7" LookupCode="AllergyResponse" style="width:120px" DropDownWidth="200px" DropDownHeight="auto"/></td>
            
        <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;"> 
        <td align="center"><euc:EformComboBox RecordId="8" TABLE="Allergies" FIELD="Allergen" Runat="server" 
            ID="Allergen_8" LookupCode="Allergen" style="width:120px" DropDownWidth="250px"/></td>
            
        <td align="center"><euc:EformComboBox RecordId="8" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" 
            ID="AllergyResponse_8" LookupCode="AllergyResponse" style="width:120px" DropDownWidth="200px" DropDownHeight="auto"/></td>
            
        <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;"> 
        <td align="center"><euc:EformComboBox RecordId="9" TABLE="Allergies" FIELD="Allergen" Runat="server" 
            ID="Allergen_9" LookupCode="Allergen" style="width:120px" DropDownWidth="250px"/></td>
            
        <td align="center"><euc:EformComboBox RecordId="9" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" 
            ID="AllergyResponse_9" LookupCode="AllergyResponse" style="width:120px" DropDownWidth="200px" DropDownHeight="auto"/></td>
            
        <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
    
    <tr style="display:none;"> 
        <td align="center"><euc:EformComboBox RecordId="10" TABLE="Allergies" FIELD="Allergen" Runat="server" 
            ID="Allergen_10" LookupCode="Allergen" style="width:120px" DropDownWidth="250px"/></td>
            
        <td align="center"><euc:EformComboBox RecordId="10" TABLE="Allergies" FIELD="AllergyResponse" Runat="server" 
            ID="AllergyResponse_10" LookupCode="AllergyResponse" style="width:120px" DropDownWidth="200px" DropDownHeight="auto"/></td>
            
        <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
    </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" 
    onclick="return showFirstAdditionalRow(this,'BreastAllergiesTbl');" /><br /><br />



<script type="text/javascript">
    //Adds events to controls
    function addMedsEvents(medStartDate,med,medQlty)
    { 
        $(medStartDate).addEvent('blur',curry(MedAutoPopulates,medStartDate,med,medQlty));
        $(med).addEvent('blur',curry(MedAutoPopulates,medStartDate,med,medQlty));
   }

    addMedsEvents($('<%= MedDateText_1.ClientID %>'),$('<%= Medication_1.ClientID %>'),$('<%= MedQuality_1.ClientID %>'));
    addMedsEvents($('<%= MedDateText_2.ClientID %>'),$('<%= Medication_2.ClientID %>'),$('<%= MedQuality_2.ClientID %>'));
    addMedsEvents($('<%= MedDateText_3.ClientID %>'),$('<%= Medication_3.ClientID %>'),$('<%= MedQuality_3.ClientID %>'));
    addMedsEvents($('<%= MedDateText_4.ClientID %>'),$('<%= Medication_4.ClientID %>'),$('<%= MedQuality_4.ClientID %>'));
    addMedsEvents($('<%= MedDateText_5.ClientID %>'),$('<%= Medication_5.ClientID %>'),$('<%= MedQuality_5.ClientID %>'));
    addMedsEvents($('<%= MedDateText_6.ClientID %>'),$('<%= Medication_6.ClientID %>'),$('<%= MedQuality_6.ClientID %>'));
    addMedsEvents($('<%= MedDateText_7.ClientID %>'),$('<%= Medication_7.ClientID %>'),$('<%= MedQuality_7.ClientID %>'));
    addMedsEvents($('<%= MedDateText_8.ClientID %>'),$('<%= Medication_8.ClientID %>'),$('<%= MedQuality_8.ClientID %>'));
    addMedsEvents($('<%= MedDateText_9.ClientID %>'),$('<%= Medication_9.ClientID %>'),$('<%= MedQuality_9.ClientID %>'));
    addMedsEvents($('<%= MedDateText_10.ClientID %>'),$('<%= Medication_10.ClientID %>'),$('<%= MedQuality_10.ClientID %>'));
    
    function MedAutoPopulates(medStartDate,med,medQlty)
    {
        if (medStartDate.value != '' || med.value != '')
        {
            medQlty.value = 'STD';
        }
        else
        { 
            medQlty.value = '';
        }
    }
    
    
    //Adds events for Meds   
    addMedsEvent($('<%= MedsChangedYesNo.ClientID %>'),$('<%= MedsTR.ClientID %>'));
    
    function addMedsEvent(MedsYesNoID,MedsTRID)
    {  
        $(MedsYesNoID).addEvent('click',curry(MedsHxYesNo,MedsYesNoID,MedsTRID));

        // check on load as well
        MedsHxYesNo(MedsYesNoID,MedsTRID);
    }
   
    function MedsHxYesNo(MedsYesNoID,MedsTRID)
    {
       var MedsYesNoRef = MedsYesNoID.getElementsByTagName('input');
       
       for (var i = 0; i < MedsYesNoRef.length; i++) 
        if (MedsYesNoRef[i].checked) 
        {  
            MedsHxRadioClick(MedsYesNoRef[i].value,MedsTRID);
        }
    }
    
    function MedsHxRadioClick(Medsoption_value,MedshideTR)
    {
      if (Medsoption_value == "Yes")
      { 
        MedshideTR.style.display='block';
        
      } 
      else if (Medsoption_value == "No")
      {
        MedshideTR.style.display='none';
        
        //clears all rows data
        for(var i=1;i<=10;i++)
        {
            clearElementsInParentRow(document.getElementById('BreastMedsTr'+i));
        }
      }
    }
</script>