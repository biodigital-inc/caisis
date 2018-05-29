<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgeryProceduresPrimary" CodeFile="EsophagusSurgeryProceduresPrimary.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
    tableArray.ProceduresPrimaryHtmlTable = "ProceduresPrimaryHtmlTable";
	tableArray.ProceduresPrimaryHtmlTable2a = "ProceduresPrimaryHtmlTable2a";
	tableArray.ProceduresPrimaryHtmlTable2b = "ProceduresPrimaryHtmlTable2b";
	tableArray.ProcedureFindingsHtmlTable = "ProcedureFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="EsophagusSurgeryProceduresPrimary" /><br/>

<table class="eformLargePopulatedTableBlue" >
    <tr>
        <td><span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Surgery Detail"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="SurgDetailRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="SurgDetailRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="SurgDetailAbsentDiv" runat="server" style="display: none;" >
<br /><br /> 
    <table class="eformLargePopulatedTable">
        <tr>
            <td><strong> <asp:Label ID="SurgDetailAbsentEventPrefix" runat="server" /></strong></td>
          <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_4"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="4" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_4"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table>

</div>
                 
<div id="SurgDetailDiv" runat="server" style="display: none; position: relative; " >
<br /><br />
<table  width="575" cellpadding="5" cellspacing="0" border="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable" > 

    <tr>
        <td valign="top">
             <strong>Operative Detail</strong>
             <table  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OperativeDetailHTMLTable">
              <tr>
			       <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap; " >Date of Operation</td>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap; " >Surgeon</td>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left;  white-space:nowrap; " >Op Duration (min) </td>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left;  white-space:nowrap; " >Lowest Heart Rate </td>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left;  white-space:nowrap; " >Lowest Mean Arterial Pressure </td>
                   <td class="controlBoxDataGridTitleColumn">&nbsp;</td>
             </tr>
         
             <tr>
             
                <td >
                    <euc:EformTextBox Width="100px"  RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_11" Runat="server" ShowCalendar="true" CalcDate="true"/>
				    <euc:EformHidden  RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate_11"     Runat="server"/></td>

                <td >
                    <euc:EformComboBox DropDownWidth="300px"  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_11" LookupCode="Physician,Disease,@DiseaseView" Runat="server" /></td>
                <td >
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_11" Runat="server"   ShowCalendar="false" CalcDate="false" /></td>
                <td >
                    <euc:EformTextBox  Width="130px" TABLE="NoTable" FIELD="LowestHeartRate_11" ID="LowestHeartRate_11" Runat="server"    /></td>
                <td >
                    <euc:EformTextBox  Width="130px" TABLE="NoTable" FIELD="LowestMeanArtPressure_11" ID="LowestMeanArtPressure_11" Runat="server"   />
                    <euc:EformTextBox Width="1px" style="display: none; "  RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpPostOpSummary" ID="OpPostOpSummary_11" Runat="server"   /></td>
                <td >
                    <euc:EformDeleteIcon ID="EformDeleteIcon_11a" runat="server" /></td>
              </tr>
              <tr>


              </tr> 
              <tr>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >Est Blood Loss (cc)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;RBC Transfused (units) </td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Crystalloid</td>            
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Colloid</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Urine Output</td>
                    <td class="controlBoxDataGridTitleColumn">&nbsp;</td>
              </tr>
              <tr>
                <td >
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpEstBloodLoss" ID="OpEstBloodLoss_11" Runat="server"   ShowCalendar="false" CalcDate="false"  /></td>
                <td >
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused_11" Runat="server"  /> </td>
                <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpCrystalloid" ID="OpCrystalloid_11" Runat="server"   /> </td>
                <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpColloid" ID="OpColloid_11" Runat="server"   ShowCalendar="false" CalcDate="false"  /></td>
                <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpUrineOutput" ID="OpUrineOutput_11" Runat="server"      /></td>
                <td >
                    <euc:EformDeleteIcon ID="EformDeleteIcon_11b" runat="server" /></td>
             </tr>  
              <tr>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >Hespan</td>
                   <td colspan="4" class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Notes </td>
                   <td class="controlBoxDataGridTitleColumn">&nbsp;</td>
              </tr>
              <tr>
                <td >
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpFluidHespan" ID="OpFluidHespan_11" Runat="server"      /></td>
                <td colspan="4" >
                    <euc:EformTextBox  Width="330px" TABLE="NoTable" FIELD="UserOpNotes_11" ID="UserOpNotes_11" Runat="server"  ShowTextEditor="true" />
                    <euc:EformTextBox  Width="1px" style="display: none; " RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpNotes" ID="OpNotes_11" Runat="server"  /></td>
                <td >
                    <euc:EformDeleteIcon ID="EformDeleteIcon_11c" runat="server" /></td>
             </tr>  
            </table>       
        </td>
    </tr>

    <tr><td valign="top" height="30px"></td></tr>
    
    <tr>
        <td valign="top">
            <strong>Primary Procedure</strong>
            <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable2a" >

                  <tr>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Approach</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Site</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Subsite</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Side</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                        <td class="controlBoxDataGridTitleColumn" >&nbsp;</td>
                  </tr>
                  <tr >
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="120px" RecordId="11" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_11"     LookupCode="ProcName,Disease,@DiseaseView"  Runat="server" TabIndex="2" />
                        
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="11" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_11" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="11" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_11"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="11"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_11"   Runat="server" />                        
                         <euc:EformCheckBox style="display: none; " Width="1px" RecordId="11" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_11" Runat="server" Value="1" />

                        </td>

                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="11" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_11" LookupCode="OpApproach,Disease,@DiseaseView"    Runat="server" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="11" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSite"    ID="ProcSite_11"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="11" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSubsite"    ID="ProcSubsite_11"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="11" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSide"    ID="ProcSide_11"    Runat="server" LookupCode="OpSide,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="11" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_11"    Runat="server" ShowTextEditor="true" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformDeleteIcon  ID="EformDeleteIcon_11" Runat="server" /></td>
                  </tr>
            </table>        
        </td>
    </tr>
    
    <tr><td valign="top" height="30px"></td></tr>
 
     <tr>
        <td valign="top">
            <strong>Surgery Techniques</strong>
            <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="Table2" >

                  <tr >
                   <td style="white-space: nowrap;">
                        <euc:EformCheckBox TABLE="NoTable" FIELD="SurgTechniqueColonic_11" ID="SurgTechniqueColonic_11" Runat="server" Value="Colonic Interposition" Text="Colonic Interposition" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformCheckBox TABLE="NoTable" FIELD="SurgTechniquePyloroplasty_11" ID="SurgTechniquePyloroplasty_11" Runat="server" Value="Pyloroplasty" Text="Pyloroplasty"/></td>
                   <td style="white-space: nowrap;">
                        <euc:EformCheckBox TABLE="NoTable" FIELD="SurgTechniqueGastrostomy_11" ID="SurgTechniqueGastrostomy_11" Runat="server" Value="Feeding gastrostomy" Text="Feeding gastrostomy"/></td>
                   <td style="white-space: nowrap;">
                        <euc:EformCheckBox TABLE="NoTable" FIELD="SurgTechniqueJejunostomy_11" ID="SurgTechniqueJejunostomy_11" Runat="server" Value="Feeding jejunostomy" Text="Feeding jejunostomy"/></td>
                  </tr>
            </table>        
        </td>
    </tr>
    
    
    <tr><td valign="top" height="30px"></td></tr>
    
    <tr>
        <td valign="top">
            <strong>Lymphadenectomy (gastric ca only)</strong>
                <table  border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="Table3" > 
                    
                    <tr>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="20" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_20" runat="server" Text="D1" Value="Lymphadenectomy D1" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="20" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_20" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="20" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_20"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="20"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_20"   Runat="server" /></td>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="21" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_21" runat="server" Text="D1+" Value="Lymphadenectomy D1+" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="21" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_21" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="21" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_21"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="21"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_21"   Runat="server" /></td>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="22" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_22" runat="server" Text="D2" Value="Lymphadenectomy D2" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="22" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_22" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="22" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_22"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="22"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_22"   Runat="server" /></td>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="23" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_23" runat="server" Text="D3" Value="Lymphadenectomy D3" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="23" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_23" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="23" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_23"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="23"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_23"   Runat="server" /></td>
                    </tr>

                </table>
 
        </td>
    </tr>   

    <tr><td valign="top" height="30px"></td></tr>
    
    <tr>
        <td valign="top">
            <strong>Other organ resected</strong>
                <table  border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="Table1" > 
                    
                    <tr>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="30" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_30" runat="server" Text="Adrenal" Value="Adrenal Resected" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="30" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_30" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="30" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_30"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="30"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_30"   Runat="server" /></td>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="31" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_31" runat="server" Text="Colon" Value="Colon Resected" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="31" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_31" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="31" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_31"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="31"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_31"   Runat="server" /></td>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="32" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_32" runat="server" Text="Gallbladder" Value="Gallbladder Resected" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="32" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_32" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="32" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_32"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="32"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_32"   Runat="server" /></td>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="33" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_33" runat="server" Text="Kidney" Value="Kidney Resected" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="33" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_33" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="33" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_33"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="33"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_33"   Runat="server" /></td>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="34" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_34" runat="server" Text="Liver" Value="Liver Resected" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="34" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_34" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="34" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_34"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="34"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_34"   Runat="server" /></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="35" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_35" runat="server" Text="Ovary" Value="Ovary Resected" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="35" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_35" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="35" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_35"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="35"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_35"   Runat="server" /></td>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="36" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_36" runat="server" Text="Pancreas" Value="Pancreas Resected" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="36" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_36" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="36" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_36"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="36"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_36"   Runat="server" /></td>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="37" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_37" runat="server" Text="Small bowel" Value="Small bowel Resected" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="37" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_37" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="37" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_37"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="37"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_37"   Runat="server" /></td>
                        <td valign="top">
                            <euc:EformCheckBox RecordId="38" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_38" runat="server" Text="Spleen" Value="Spleen Resected" />
                            
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="38" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_38" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="38" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_38"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="38"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_38"   Runat="server" /></td>
                        <td valign="top">
                            Other:  <euc:EformTextBox Width="100px" Table="NoTable" Field="ProcNameOtherOrganResected_39" ID="ProcNameOtherOrganResected_39" runat="server" />
                             
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="39" ParentRecordId="11" Table="Procedures" Field="ProcName" ID="ProcName_39" runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="39" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_39" Runat="server" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="39" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_39"     Runat="server"/>
                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="39"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_39"   Runat="server" /></td>
                    
                    </tr>

                </table>
 
        </td>
    </tr>   
    
    
    <tr><td valign="top" height="30px"></td></tr>   
    <tr>
        <td valign="top">
            <strong>Surgery Findings</strong>
                <table  width="250" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ProcedureFindingsHtmlTable" > 


                          <tr>
                                 <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Metastasis</td>
                               <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Site</td>
                                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                          </tr>
                          

                          <asp:Repeater ID="AncillaryProcs" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                                <ItemTemplate> 
                                    <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, 'ProcFindSide,ProcFindSite,ProcFindSubsite,ProcFindDissection,ProcFinding,ProcFindPrimaryDimension,ProcFindExtension,ProcFindEncapsulation,ProcFindDiseaseExtent,ProcFindStatus,ProcFindFrozen', 'ProcedureFindingsHtmlTable');"> 
                                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindSite")%></td>
                                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFinding")%></td>
                                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
                                        <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
                                    </tr>      
                                </ItemTemplate>
                            </asp:Repeater>
                            
                          <tr>
                            <td>
                                <euc:EformHidden RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_1" Runat="server" Value="Metastasis"  />
                                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_1" LookupCode="YesNoUnknown"   Runat="server" EnableHiddenOnUIEvent="ProcFinding_1" /> </td>
                            
                            <td>
                                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_1" LookupCode="RadTxTarget,Disease,@DiseaseView" Runat="server"    /></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
                         </tr>
                          <tr style="display: none;">
                            <td>
                                <euc:EformHidden RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_2" Runat="server" Value="Metastasis"  />
                                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_2" LookupCode="YesNoUnknown"   Runat="server" EnableHiddenOnUIEvent="ProcFinding_2" /> </td>
                            
                            <td>
                                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_2" LookupCode="RadTxTarget,Disease,@DiseaseView" Runat="server"    /></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
                         </tr>
                          <tr style="display: none;">
                            <td>
                                <euc:EformHidden RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_3" Runat="server" Value="Metastasis"  />
                                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_3" LookupCode="YesNoUnknown"   Runat="server" EnableHiddenOnUIEvent="ProcFinding_3" /> </td>
                            
                            <td>
                                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_3" LookupCode="RadTxTarget,Disease,@DiseaseView" Runat="server"    /></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
                         </tr>
                          <tr style="display: none;">
                            <td>
                                <euc:EformHidden RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_4" Runat="server" Value="Metastasis"  />
                                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_4" LookupCode="YesNoUnknown"   Runat="server" EnableHiddenOnUIEvent="ProcFinding_4" /> </td>
                            
                            <td>
                                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_4" LookupCode="RadTxTarget,Disease,@DiseaseView" Runat="server"    /></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
                         </tr>
                          <tr style="display: none;">
                            <td>
                                <euc:EformHidden RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_5" Runat="server" Value="Metastasis"  />
                                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_5" LookupCode="YesNoUnknown"   Runat="server" EnableHiddenOnUIEvent="ProcFinding_5" /> </td>
                            
                            <td>
                                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_5" LookupCode="RadTxTarget,Disease,@DiseaseView" Runat="server"    /></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
                         </tr>
                          <tr style="display: none;">
                            <td>
                                <euc:EformHidden RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_6" Runat="server" Value="Metastasis"  />
                                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_6" LookupCode="YesNoUnknown"   Runat="server" EnableHiddenOnUIEvent="ProcFinding_6" /> </td>
                            
                            <td>
                                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_6" LookupCode="RadTxTarget,Disease,@DiseaseView" Runat="server"    /></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
                         </tr>
                </table>
                <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProcedureFindingsHtmlTable');" />
 
        </td>
    </tr>   
   
    <tr><td valign="top" height="30px"></td></tr>
    
    <tr>
        <td valign="top">
            <strong>Supplementary Procedures</strong>
            <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable2b" >

                  <tr>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Approach</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Site</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Subsite</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Side</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                        <td class="controlBoxDataGridTitleColumn" >&nbsp;</td>
                 </tr>
                  <tr >
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="120px" RecordId="12" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_12"     LookupCode="ProcName,Disease,@DiseaseView"  Runat="server" TabIndex="2" />
                        
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="12" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_12" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="12" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_12"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="12"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_12"   Runat="server" />                        
                         <euc:EformCheckBox style="display: none; " Width="1px" RecordId="12" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_12" Runat="server" Value="1" />

                        </td>

                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="12" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_12" LookupCode="OpApproach,Disease,@DiseaseView"    Runat="server" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="12" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSite"    ID="ProcSite_12"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="12" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSubsite"    ID="ProcSubsite_12"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="12" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSide"    ID="ProcSide_12"    Runat="server" LookupCode="OpSide,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="12" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_12"    Runat="server" ShowTextEditor="true" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformDeleteIcon  ID="EformDeleteIcon_12" Runat="server" /></td>
                  </tr>
                  <tr style="display: none; ">
                   <td style="white-space: ">
                        <euc:EformComboBox DropDownWidth="auto"  Width="120px" RecordId="13" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_13"     LookupCode="ProcName,Disease,@DiseaseView"  Runat="server" TabIndex="2" />
                        
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="13" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_13" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="13" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_13"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="13"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_13"   Runat="server" />                        
                         <euc:EformCheckBox style="display: none; " Width="1px" RecordId="13" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_13" Runat="server" Value="1" />

                        </td>

                   <td style="white-space: nowrap; " >
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="13" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_13" LookupCode="OpApproach,Disease,@DiseaseView"    Runat="server" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="13" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSite"    ID="ProcSite_13"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="13" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSubsite"    ID="ProcSubsite_13"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="13" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSide"    ID="ProcSide_13"    Runat="server" LookupCode="OpSide,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="13" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_13"    Runat="server" ShowTextEditor="true" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformDeleteIcon  ID="EformDeleteIcon_13" Runat="server" /></td>
                  </tr>
                   <tr style="display: none; ">
                   <td style="white-space: nowrap; ">
                        <euc:EformComboBox DropDownWidth="auto"  Width="120px" RecordId="14" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_14"     LookupCode="ProcName,Disease,@DiseaseView"  Runat="server" TabIndex="2" />
                        
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="14" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_14" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="14" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_14"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="14"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_14"   Runat="server" />                        
                         <euc:EformCheckBox style="display: none; " Width="1px" RecordId="14" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_14" Runat="server" Value="1" />

                        </td>

                   <td style="white-space: nowrap;" >
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="14" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_14" LookupCode="OpApproach,Disease,@DiseaseView"    Runat="server" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="14" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSite"    ID="ProcSite_14"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="14" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSubsite"    ID="ProcSubsite_14"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="14" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSide"    ID="ProcSide_14"    Runat="server" LookupCode="OpSide,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="14" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_14"    Runat="server" ShowTextEditor="true" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformDeleteIcon  ID="EformDeleteIcon_14" Runat="server" /></td>
                  </tr>
                  <tr style="display: none; ">
                   <td style="white-space: nowrap; " >
                        <euc:EformComboBox DropDownWidth="auto"  Width="120px" RecordId="15" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_15"     LookupCode="ProcName,Disease,@DiseaseView"  Runat="server" TabIndex="2" />
                        
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="15" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_15" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="15" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_15"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="15"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_15"   Runat="server" />                        
                         <euc:EformCheckBox style="display: none; " Width="1px" RecordId="15" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_15" Runat="server" Value="1" />

                        </td>

                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="15" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_15" LookupCode="OpApproach,Disease,@DiseaseView"    Runat="server" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="15" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSite"    ID="ProcSite_15"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="15" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSubsite"    ID="ProcSubsite_15"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="15" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSide"    ID="ProcSide_15"    Runat="server" LookupCode="OpSide,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="15" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_15"    Runat="server" ShowTextEditor="true" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformDeleteIcon  ID="EformDeleteIcon_15" Runat="server" /></td>
                  </tr>
                  <tr style="display: none; ">
                   <td style="white-space: nowrap; " >
                        <euc:EformComboBox DropDownWidth="auto"  Width="120px" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_16"     LookupCode="ProcName,Disease,@DiseaseView"  Runat="server" TabIndex="2" />
                        
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_16" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="16" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_16"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="16"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_16"   Runat="server" />                        
                         <euc:EformCheckBox style="display: none; " Width="1px" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_16" Runat="server" Value="1" />

                        </td>

                   <td style="white-space: nowrap; " >
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_16" LookupCode="OpApproach,Disease,@DiseaseView"    Runat="server" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSite"    ID="ProcSite_16"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSubsite"    ID="ProcSubsite_16"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSide"    ID="ProcSide_16"    Runat="server" LookupCode="OpSide,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_16"    Runat="server" ShowTextEditor="true" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformDeleteIcon  ID="EformDeleteIcon_16" Runat="server" /></td>
                  </tr>
                   <tr style="display: none; ">
                   <td style="white-space: nowrap; " >
                        <euc:EformComboBox DropDownWidth="auto"  Width="120px" RecordId="17" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_17"     LookupCode="ProcName,Disease,@DiseaseView"  Runat="server" TabIndex="2" />
                        
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="17" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_17" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="17" ParentRecordId="11"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_17"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="17"  ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_17"   Runat="server" />                        
                         <euc:EformCheckBox style="display: none; " Width="1px" RecordId="17" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_17" Runat="server" Value="1" />

                        </td>

                   <td style="white-space: nowrap; " >
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="17" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_17" LookupCode="OpApproach,Disease,@DiseaseView"    Runat="server" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="17" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSite"    ID="ProcSite_17"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="17" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSubsite"    ID="ProcSubsite_17"    Runat="server" LookupCode="DxTarget,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="17" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSide"    ID="ProcSide_17"    Runat="server" LookupCode="OpSide,Disease,@DiseaseView" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="17" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_17"    Runat="server" ShowTextEditor="true" /></td>
                   <td style="white-space: nowrap;">
                        <euc:EformDeleteIcon  ID="EformDeleteIcon_17" Runat="server" /></td>
                  </tr>
               </table>        
            <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresPrimaryHtmlTable2b');" />

        </td>
    </tr>
    
</table>

<br />
<br />



</div>

<br/><br/><br/>
<table>
    <tr id="SurgDetailAbsentRow">
        <td>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="TableName" ID="TableName_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldName" ID="FieldName_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_4"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>

<script type="text/javascript">
    /* <![CDATA[ */

    addEventOpDetail($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= OpDuration_11.ClientID %>'), $('<%= LowestHeartRate_11.ClientID %>'), $('<%= LowestMeanArtPressure_11.ClientID %>'), $('<%= OpPostOpSummary_11.ClientID %>'), $('<%= OpEstBloodLoss_11.ClientID %>'), $('<%= OpRBC_Transfused_11.ClientID %>'), $('<%= OpCrystalloid_11.ClientID %>'), $('<%= OpColloid_11.ClientID %>'), $('<%= UserOpNotes_11.ClientID %>'), $('<%= OpNotes_11.ClientID %>'));


    function addEventOpDetail(opDateTextID,opDateID,opCaseSurgeonID, opDurationID, lowestHeartRateID,lowestMeanArtPressureID,opPostOpSummaryID,opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID) {

        $(opDateTextID).addEvent('blur', curry(SetOpDetailFields, opDateTextID, opDateID, opCaseSurgeonID, opDurationID, lowestHeartRateID, lowestMeanArtPressureID, opPostOpSummaryID, opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID));
        $(opCaseSurgeonID).addEvent('blur', curry(SetOpDetailFields, opDateTextID, opDateID, opCaseSurgeonID, opDurationID, lowestHeartRateID, lowestMeanArtPressureID, opPostOpSummaryID, opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID));
        $(opDurationID).addEvent('blur', curry(SetOpDetailFields, opDateTextID, opDateID, opCaseSurgeonID, opDurationID, lowestHeartRateID, lowestMeanArtPressureID, opPostOpSummaryID, opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID));
        $(lowestHeartRateID).addEvent('blur', curry(SetOpDetailFields, opDateTextID, opDateID, opCaseSurgeonID, opDurationID, lowestHeartRateID, lowestMeanArtPressureID, opPostOpSummaryID, opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID));
        $(lowestMeanArtPressureID).addEvent('blur', curry(SetOpDetailFields, opDateTextID, opDateID, opCaseSurgeonID, opDurationID, lowestHeartRateID, lowestMeanArtPressureID, opPostOpSummaryID, opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID));
        $(opEstBloodLossID).addEvent('blur', curry(SetOpDetailFields, opDateTextID, opDateID, opCaseSurgeonID, opDurationID, lowestHeartRateID, lowestMeanArtPressureID, opPostOpSummaryID, opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID));
        $(opRbcTransfusedID).addEvent('blur', curry(SetOpDetailFields, opDateTextID, opDateID, opCaseSurgeonID, opDurationID, lowestHeartRateID, lowestMeanArtPressureID, opPostOpSummaryID, opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID));
        $(opCrystalloidID).addEvent('blur', curry(SetOpDetailFields, opDateTextID, opDateID, opCaseSurgeonID, opDurationID, lowestHeartRateID, lowestMeanArtPressureID, opPostOpSummaryID, opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID));
        $(opColloidID).addEvent('blur', curry(SetOpDetailFields, opDateTextID, opDateID, opCaseSurgeonID, opDurationID, lowestHeartRateID, lowestMeanArtPressureID, opPostOpSummaryID, opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID));
        $(userOpNotesID).addEvent('blur', curry(SetOpDetailFields, opDateTextID, opDateID, opCaseSurgeonID, opDurationID, lowestHeartRateID, lowestMeanArtPressureID, opPostOpSummaryID, opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID));


    }

    /* ]]> */

    function SetOpDetailFields(opDateTextID, opDateID, opCaseSurgeonID, opDurationID, lowestHeartRateID, lowestMeanArtPressureID, opPostOpSummaryID, opEstBloodLossID, opRbcTransfusedID, opCrystalloidID, opColloidID, userOpNotesID, opNotesID) {

        opPostOpSummaryID.value = '';
        if (lowestHeartRateID.value != '')
            opPostOpSummaryID.value = opPostOpSummaryID.value + 'Lowest Heart Rate:  ' + lowestHeartRateID.value + ' | ';
        if (lowestMeanArtPressureID.value != '')
            opPostOpSummaryID.value = opPostOpSummaryID.value + 'Lowest Mean Arterial Pressure:  ' + lowestMeanArtPressureID.value + ' | ';
    }


    /**************************************************************************/
    /**************************************************************************/
    /**************************************************************************/


    addEventSurgDetail($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpDuration_11.ClientID %>'), $('<%= OpRBC_Transfused_11.ClientID %>'), $('<%= ProcDateText_11.ClientID %>'), $('<%= ProcDate_11.ClientID %>'), $('<%= ProcSurgeon_11.ClientID %>'), $('<%= OpNotes_11.ClientID %>'), $('<%= UserOpNotes_11.ClientID %>'), $('<%= ProcPrimary_11.ClientID %>'), $('<%= ProcName_11.ClientID %>'), $('<%= ProcApproach_11.ClientID %>'), $('<%= ProcNotes_11.ClientID %>'), $('<%= ProcSite_11.ClientID %>'), $('<%= ProcSubsite_11.ClientID %>'), $('<%= ProcSide_11.ClientID %>'));
    addEventSurgDetail($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpDuration_11.ClientID %>'), $('<%= OpRBC_Transfused_11.ClientID %>'), $('<%= ProcDateText_12.ClientID %>'), $('<%= ProcDate_12.ClientID %>'), $('<%= ProcSurgeon_12.ClientID %>'), $('<%= OpNotes_11.ClientID %>'), $('<%= UserOpNotes_11.ClientID %>'), $('<%= ProcPrimary_12.ClientID %>'), $('<%= ProcName_12.ClientID %>'), $('<%= ProcApproach_12.ClientID %>'), $('<%= ProcNotes_12.ClientID %>'), $('<%= ProcSite_12.ClientID %>'), $('<%= ProcSubsite_12.ClientID %>'), $('<%= ProcSide_12.ClientID %>'));
    addEventSurgDetail($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpDuration_11.ClientID %>'), $('<%= OpRBC_Transfused_11.ClientID %>'), $('<%= ProcDateText_13.ClientID %>'), $('<%= ProcDate_13.ClientID %>'), $('<%= ProcSurgeon_13.ClientID %>'), $('<%= OpNotes_11.ClientID %>'), $('<%= UserOpNotes_11.ClientID %>'), $('<%= ProcPrimary_13.ClientID %>'), $('<%= ProcName_13.ClientID %>'), $('<%= ProcApproach_13.ClientID %>'), $('<%= ProcNotes_13.ClientID %>'), $('<%= ProcSite_13.ClientID %>'), $('<%= ProcSubsite_13.ClientID %>'), $('<%= ProcSide_13.ClientID %>'));
    addEventSurgDetail($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpDuration_11.ClientID %>'), $('<%= OpRBC_Transfused_11.ClientID %>'), $('<%= ProcDateText_14.ClientID %>'), $('<%= ProcDate_14.ClientID %>'), $('<%= ProcSurgeon_14.ClientID %>'), $('<%= OpNotes_11.ClientID %>'), $('<%= UserOpNotes_11.ClientID %>'), $('<%= ProcPrimary_14.ClientID %>'), $('<%= ProcName_14.ClientID %>'), $('<%= ProcApproach_14.ClientID %>'), $('<%= ProcNotes_14.ClientID %>'), $('<%= ProcSite_14.ClientID %>'), $('<%= ProcSubsite_14.ClientID %>'), $('<%= ProcSide_14.ClientID %>'));
    addEventSurgDetail($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpDuration_11.ClientID %>'), $('<%= OpRBC_Transfused_11.ClientID %>'), $('<%= ProcDateText_15.ClientID %>'), $('<%= ProcDate_15.ClientID %>'), $('<%= ProcSurgeon_15.ClientID %>'), $('<%= OpNotes_11.ClientID %>'), $('<%= UserOpNotes_11.ClientID %>'), $('<%= ProcPrimary_15.ClientID %>'), $('<%= ProcName_15.ClientID %>'), $('<%= ProcApproach_15.ClientID %>'), $('<%= ProcNotes_15.ClientID %>'), $('<%= ProcSite_15.ClientID %>'), $('<%= ProcSubsite_15.ClientID %>'), $('<%= ProcSide_15.ClientID %>'));
    addEventSurgDetail($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpDuration_11.ClientID %>'), $('<%= OpRBC_Transfused_11.ClientID %>'), $('<%= ProcDateText_16.ClientID %>'), $('<%= ProcDate_16.ClientID %>'), $('<%= ProcSurgeon_16.ClientID %>'), $('<%= OpNotes_11.ClientID %>'), $('<%= UserOpNotes_11.ClientID %>'), $('<%= ProcPrimary_16.ClientID %>'), $('<%= ProcName_16.ClientID %>'), $('<%= ProcApproach_16.ClientID %>'), $('<%= ProcNotes_16.ClientID %>'), $('<%= ProcSite_16.ClientID %>'), $('<%= ProcSubsite_16.ClientID %>'), $('<%= ProcSide_16.ClientID %>'));
    addEventSurgDetail($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpDuration_11.ClientID %>'), $('<%= OpRBC_Transfused_11.ClientID %>'), $('<%= ProcDateText_17.ClientID %>'), $('<%= ProcDate_17.ClientID %>'), $('<%= ProcSurgeon_17.ClientID %>'), $('<%= OpNotes_11.ClientID %>'), $('<%= UserOpNotes_11.ClientID %>'), $('<%= ProcPrimary_17.ClientID %>'), $('<%= ProcName_17.ClientID %>'), $('<%= ProcApproach_17.ClientID %>'), $('<%= ProcNotes_17.ClientID %>'), $('<%= ProcSite_17.ClientID %>'), $('<%= ProcSubsite_17.ClientID %>'), $('<%= ProcSide_17.ClientID %>'));


    function addEventSurgDetail(SurgDetailRecordedID, SurgDetailDivID, SurgDetailAbsentDivID, opDateTextID, opSurgeonID, opDateID, opDuration, opRbcTransfusedID, procDateTextID, procDateID, procSurgeonID, opNotesID, userOpNotesID, procPrimary, procName, procApproach, procNotes, procSite, procSubsite, procSide) {
        $(SurgDetailRecordedID).addEvent('click', curry(SetProcedureFields, SurgDetailRecordedID, SurgDetailDivID, SurgDetailAbsentDivID, opDateTextID, opSurgeonID, opDateID, opDuration, opRbcTransfusedID, procDateTextID, procDateID, procSurgeonID, opNotesID, userOpNotesID, procPrimary, procName, procApproach, procNotes, procSite, procSubsite, procSide));
        $(opDateTextID).addEvent('blur', curry(SetProcedureFields, SurgDetailRecordedID, SurgDetailDivID, SurgDetailAbsentDivID, opDateTextID, opSurgeonID, opDateID, opDuration, opRbcTransfusedID, procDateTextID, procDateID, procSurgeonID, opNotesID, userOpNotesID, procPrimary, procName, procApproach, procNotes, procSite, procSubsite, procSide));
        $(opSurgeonID).addEvent('blur', curry(SetProcedureFields, SurgDetailRecordedID, SurgDetailDivID, SurgDetailAbsentDivID, opDateTextID, opSurgeonID, opDateID, opDuration, opRbcTransfusedID, procDateTextID, procDateID, procSurgeonID, opNotesID, userOpNotesID, procPrimary, procName, procApproach, procNotes, procSite, procSubsite, procSide));
        $(procPrimary).addEvent('click', curry(SetProcedureFields, SurgDetailRecordedID, SurgDetailDivID, SurgDetailAbsentDivID, opDateTextID, opSurgeonID, opDateID, opDuration, opRbcTransfusedID, procDateTextID, procDateID, procSurgeonID, opNotesID, userOpNotesID, procPrimary, procName, procApproach, procNotes, procSite, procSubsite, procSide));
        $(procName).addEvent('blur', curry(SetProcedureFields, SurgDetailRecordedID, SurgDetailDivID, SurgDetailAbsentDivID, opDateTextID, opSurgeonID, opDateID, opDuration, opRbcTransfusedID, procDateTextID, procDateID, procSurgeonID, opNotesID, userOpNotesID, procPrimary, procName, procApproach, procNotes, procSite, procSubsite, procSide));
        $(procNotes).addEvent('blur', curry(SetProcedureFields, SurgDetailRecordedID, SurgDetailDivID, SurgDetailAbsentDivID, opDateTextID, opSurgeonID, opDateID, opDuration, opRbcTransfusedID, procDateTextID, procDateID, procSurgeonID, opNotesID, userOpNotesID, procPrimary, procName, procApproach, procNotes, procSite, procSubsite, procSide));

        // show on load
        SetProcedureFields(SurgDetailRecordedID, SurgDetailDivID, SurgDetailAbsentDivID, opDateTextID, opSurgeonID, opDateID, opDuration, opRbcTransfusedID, procDateTextID, procDateID, procSurgeonID, opNotesID, userOpNotesID, procPrimary, procName, procApproach, procNotes, procSite, procSubsite, procSide);
    }

    /* ]]> */

    function SetProcedureFields(SurgDetailRecordedID, SurgDetailDivID, SurgDetailAbsentDivID, opDateTextID, opSurgeonID, opDateID, opDuration, opRbcTransfusedID, procDateTextID, procDateID, procSurgeonID, opNotesID, userOpNotesID, procPrimary, procName, procApproach, procNotes, procSite, procSubsite, procSide) {
        var SurgDetailoption_value = RetrieveRadioBtnListSelectedValues(SurgDetailRecordedID, "TABLE");

        if (SurgDetailoption_value == "Yes") {
            SurgDetailDivID.style.display = '';
            SurgDetailAbsentDivID.style.display = 'none';

            document.getElementById('<%= AbsentDateText_4.ClientID %>').value = '';
            document.getElementById('<%= AbsentDate_4.ClientID %>').value = '';
            document.getElementById('<%= TableName_4.ClientID %>').value = '';
            document.getElementById('<%= FieldName_4.ClientID %>').value = '';
            document.getElementById('<%= FieldValue_4.ClientID %>').value = '';
            document.getElementById('<%= AbsentReason_4.ClientID %>').value = '';
            document.getElementById('<%= AbsentQuality_4.ClientID %>').value = '';

            if (procName.value != '' || procApproach.value != '' || procSite.value != '' || procSubsite.value != '' || procSide.value != '' || procNotes.value != '') {
                procDateTextID.value = opDateTextID.value;
                procDateID.value = opDateID.value;
                procSurgeonID.value = opSurgeonID.value;

                // if primary procedure, 
                if (procName.id.indexOf('_11') > -1) {
                    procPrimary.checked = true;
                }

                if (procSite.value == '')
                    procSite.value = 'Esophagus';
            }
            else {
                procDateTextID.value = '';
                procDateID.value = '';
                procSurgeonID.value = '';
                procApproach.value = '';
                procPrimary.checked = false;
            }
        }
        else if (SurgDetailoption_value == "No" || SurgDetailoption_value == "Unknown" || SurgDetailoption_value == "N/A") {
            SurgDetailAbsentDivID.style.display = '';
            SurgDetailDivID.style.display = 'none';

            document.getElementById('<%= TableName_4.ClientID %>').value = 'Procedures';
            document.getElementById('<%= FieldName_4.ClientID %>').value = 'ProcName';
            document.getElementById('<%= FieldValue_4.ClientID %>').value = 'Surgery Detail';

            if (SurgDetailoption_value == "No")
                document.getElementById('<%= AbsentReason_4.ClientID %>').value = 'None Recorded';
            else if (SurgDetailoption_value == "Unknown")
                document.getElementById('<%= AbsentReason_4.ClientID %>').value = 'Unknown';
            else if (Comorboption_value == "N/A")
                document.getElementById('<%= AbsentReason_4.ClientID %>').value = 'Not Applicable';

            document.getElementById('<%= SurgDetailAbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_4.ClientID %>').value + ' as of ';

            document.getElementById('<%= AbsentQuality_4.ClientID %>').value = 'OUT';

            opDateTextID.value = '';
            opDateID.value = '';
            opSurgeonID.value = '';
            opDuration.value = '';
            opRbcTransfusedID.value = '';
            procDateTextID.value = '';
            procDateID.value = '';
            procSurgeonID.value = '';
            procPrimary.checked = false;
            procName.value = '';
            procApproach.value = '';
            procNotes.value = '';
            procSite.value = '';
            procSubsite.value = '';
            procSide.value = '';
            opNotesID.value = '';
            userOpNotesID.value = '';
        }

    }


    /**************************************************************************/
    /**************************************************************************/
    /**************************************************************************/

    addEventOpNotes($('<%= OpNotes_11.ClientID %>'), $('<%= UserOpNotes_11.ClientID %>'), $('<%= SurgTechniqueColonic_11.ClientID %>'), $('<%= SurgTechniquePyloroplasty_11.ClientID %>'), $('<%= SurgTechniqueGastrostomy_11.ClientID %>'), $('<%= SurgTechniqueJejunostomy_11.ClientID %>'));


    function addEventOpNotes(opNotesID, userOpNotesID, colonicCB, pyloroplastyCB, gastrostomyCB, jejunostomyCB) {
        $(userOpNotesID).addEvent('blur', curry(SetOpNotes, opNotesID, userOpNotesID, colonicCB, pyloroplastyCB, gastrostomyCB, jejunostomyCB));
        $(colonicCB).addEvent('click', curry(SetOpNotes, opNotesID, userOpNotesID, colonicCB, pyloroplastyCB, gastrostomyCB, jejunostomyCB));
        $(pyloroplastyCB).addEvent('click', curry(SetOpNotes, opNotesID, userOpNotesID, colonicCB, pyloroplastyCB, gastrostomyCB, jejunostomyCB));
        $(gastrostomyCB).addEvent('click', curry(SetOpNotes, opNotesID, userOpNotesID, colonicCB, pyloroplastyCB, gastrostomyCB, jejunostomyCB));
        $(jejunostomyCB).addEvent('click', curry(SetOpNotes, opNotesID, userOpNotesID, colonicCB, pyloroplastyCB, gastrostomyCB, jejunostomyCB));

        // show on load
        SetOpNotes(opNotesID, userOpNotesID, colonicCB, pyloroplastyCB, gastrostomyCB, jejunostomyCB);
    }

    /* ]]> */

    function SetOpNotes(opNotesID, userOpNotesID, colonicCB, pyloroplastyCB, gastrostomyCB, jejunostomyCB) {

        opNotesID.value = '';

        if (colonicCB.checked)
            opNotesID.value = opNotesID.value + 'Colonic Interposition Done ||| ';
        if (pyloroplastyCB.checked)
            opNotesID.value = opNotesID.value + 'Pyloroplasty Done ||| ';
        if (gastrostomyCB.checked)
            opNotesID.value = opNotesID.value + 'Feeding gastrostomy Done ||| ';
        if (jejunostomyCB.checked)
            opNotesID.value = opNotesID.value + 'Feeding jejunostomy Done ||| ';
        if (userOpNotesID.value != '')
            opNotesID.value = opNotesID.value + 'Notes: ' + userOpNotesID.value + ' ||| ';

    }


    /**************************************************************************/
    /**************************************************************************/
    /**************************************************************************/

    addEventLymphadenetomy($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_20.ClientID %>'), $('<%= ProcDate_20.ClientID %>'), $('<%= ProcName_20.ClientID %>'), $('<%= ProcSurgeon_20.ClientID %>'));
    addEventLymphadenetomy($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_21.ClientID %>'), $('<%= ProcDate_21.ClientID %>'), $('<%= ProcName_21.ClientID %>'), $('<%= ProcSurgeon_21.ClientID %>'));
    addEventLymphadenetomy($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_22.ClientID %>'), $('<%= ProcDate_22.ClientID %>'), $('<%= ProcName_22.ClientID %>'), $('<%= ProcSurgeon_22.ClientID %>'));
    addEventLymphadenetomy($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_23.ClientID %>'), $('<%= ProcDate_23.ClientID %>'), $('<%= ProcName_23.ClientID %>'), $('<%= ProcSurgeon_23.ClientID %>'));


    function addEventLymphadenetomy(opDateTextID, opDateID, opSurgeonID, procDateTextID, procDateID, procNameCB, procSurgeonID) {
        $(opDateTextID).addEvent('blur', curry(SetLymphadenetomy, opDateTextID, opDateID, opSurgeonID, procDateTextID, procDateID, procNameCB, procSurgeonID));
        $(procNameCB).addEvent('click', curry(SetLymphadenetomy, opDateTextID, opDateID, opSurgeonID, procDateTextID, procDateID, procNameCB, procSurgeonID));

    }

    /* ]]> */

    function SetLymphadenetomy(opDateTextID, opDateID, opSurgeonID, procDateTextID, procDateID, procNameCB, procSurgeonID) {

        if (procNameCB.checked) {

            procDateTextID.value = opDateTextID.value;
            procDateID.value = opDateID.value;
            procSurgeonID.value = opSurgeonID.value;
        }
        else {

            procDateTextID.value = '';
            procDateID.value = '';
            procSurgeonID.value = '';

        }

    }


    /**************************************************************************/
    /**************************************************************************/
    /**************************************************************************/

    addEventOtherOrganResected($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_30.ClientID %>'), $('<%= ProcDate_30.ClientID %>'), $('<%= ProcName_30.ClientID %>'), $('<%= ProcSurgeon_30.ClientID %>'));
    addEventOtherOrganResected($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_31.ClientID %>'), $('<%= ProcDate_31.ClientID %>'), $('<%= ProcName_31.ClientID %>'), $('<%= ProcSurgeon_31.ClientID %>'));
    addEventOtherOrganResected($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_32.ClientID %>'), $('<%= ProcDate_32.ClientID %>'), $('<%= ProcName_32.ClientID %>'), $('<%= ProcSurgeon_32.ClientID %>'));
    addEventOtherOrganResected($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_33.ClientID %>'), $('<%= ProcDate_33.ClientID %>'), $('<%= ProcName_33.ClientID %>'), $('<%= ProcSurgeon_33.ClientID %>'));
    addEventOtherOrganResected($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_34.ClientID %>'), $('<%= ProcDate_34.ClientID %>'), $('<%= ProcName_34.ClientID %>'), $('<%= ProcSurgeon_34.ClientID %>'));
    addEventOtherOrganResected($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_35.ClientID %>'), $('<%= ProcDate_35.ClientID %>'), $('<%= ProcName_35.ClientID %>'), $('<%= ProcSurgeon_35.ClientID %>'));
    addEventOtherOrganResected($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_36.ClientID %>'), $('<%= ProcDate_36.ClientID %>'), $('<%= ProcName_36.ClientID %>'), $('<%= ProcSurgeon_36.ClientID %>'));
    addEventOtherOrganResected($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_37.ClientID %>'), $('<%= ProcDate_37.ClientID %>'), $('<%= ProcName_37.ClientID %>'), $('<%= ProcSurgeon_37.ClientID %>'));
    addEventOtherOrganResected($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_38.ClientID %>'), $('<%= ProcDate_38.ClientID %>'), $('<%= ProcName_38.ClientID %>'), $('<%= ProcSurgeon_38.ClientID %>'));
    addEventOtherOrganResected($('<%= OpDateText_11.ClientID %>'), $('<%= OpDate_11.ClientID %>'), $('<%= OpCaseSurgeon_11.ClientID %>'), $('<%= ProcDateText_39.ClientID %>'), $('<%= ProcDate_39.ClientID %>'), $('<%= ProcName_39.ClientID %>'), $('<%= ProcSurgeon_39.ClientID %>'));

    
    function addEventOtherOrganResected(opDateTextID, opDateID, opSurgeonID, procDateTextID, procDateID, procNameID, procSurgeonID) {
        $(opDateTextID).addEvent('blur', curry(SetOtherOrganResected, opDateTextID, opDateID, opSurgeonID, procDateTextID, procDateID, procNameID, procSurgeonID));
       
        if (procNameID.type == 'checkbox')
            $(procNameID).addEvent('click', curry(SetOtherOrganResected, opDateTextID, opDateID, opSurgeonID, procDateTextID, procDateID, procNameID, procSurgeonID));
        else if (procNameID.type == 'text')
            $(procNameID).addEvent('blur', curry(SetOtherOrganResected, opDateTextID, opDateID, opSurgeonID, procDateTextID, procDateID, procNameID, procSurgeonID));

        var otherTextBox = document.getElementById('<%= ProcNameOtherOrganResected_39.ClientID %>');
        $(otherTextBox).addEvent('blur', curry(SetOtherOrganResected, opDateTextID, opDateID, opSurgeonID, procDateTextID, procDateID, procNameID, procSurgeonID));
    }

    /* ]]> */

    function SetOtherOrganResected(opDateTextID, opDateID, opSurgeonID, procDateTextID, procDateID, procNameID, procSurgeonID) {

        if (procNameID.type == 'checkbox') {
        
            if (procNameID.checked) {

                procDateTextID.value = opDateTextID.value;
                procDateID.value = opDateID.value;
                procSurgeonID.value = opSurgeonID.value;
            }
            else {

                procDateTextID.value = '';
                procDateID.value = '';
                procSurgeonID.value = '';

            }
        }
        else if (procNameID.type == 'text') {

               var otherTextBox = document.getElementById('<%= ProcNameOtherOrganResected_39.ClientID %>');
               if (otherTextBox.value != '') {

                procNameID.value = otherTextBox.value + ' Resected';
                procDateTextID.value = opDateTextID.value;
                procDateID.value = opDateID.value;
                procSurgeonID.value = opSurgeonID.value;
            }
            else {

                procNameID.value = '';
                procDateTextID.value = '';
                procDateID.value = '';
                procSurgeonID.value = '';

            }

        }

    }   
    
</script>
