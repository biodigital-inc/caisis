<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.PancreatitisProceduresPrimary" CodeFile="PancreatitisProceduresPrimary.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
    tableArray.ProceduresPrimaryHtmlTable = "ProceduresPrimaryHtmlTable";
	tableArray.ProceduresPrimaryHtmlTable2a = "ProceduresPrimaryHtmlTable2a";
	tableArray.ProceduresPrimaryHtmlTable2b = "ProceduresPrimaryHtmlTable2b";
	tableArray.ProcedureFindingsHtmlTable = "ProcedureFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="PancreatitisProceduresPrimary" /><br/>

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
           <td><strong> <asp:Label ID="AbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_4"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="4" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_4"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table>

</div>
                 
<div id="SurgDetailDiv" runat="server" style="display: none;">
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
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op In Time</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op Out Time </td>
                   <td class="controlBoxDataGridTitleColumn">&nbsp;</td>
             </tr>
         
             <tr>
             
                <td >
                    <euc:EformTextBox Width="100px"  RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_1" Runat="server" ShowCalendar="true" CalcDate="true"/>
				    <euc:EformHidden  RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate_1"     Runat="server"/></td>

                <td >
                    <euc:EformComboBox DropDownWidth="200px"  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_1" LookupCode="Physician,Disease,@DiseaseView" Runat="server" /></td>
                <td >
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_1" Runat="server"   ShowCalendar="false" CalcDate="false" /></td>
                 <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpInTime" ID="OpInTime" Runat="server"  /></td>
                 <td >
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpOutTime" ID="OpOutTime" Runat="server"  /> </td>
                <td >
                    <euc:EformDeleteIcon ID="EformDeleteIcon_11a" runat="server" /></td>
              </tr>
              <tr>


              </tr> 
              <tr>
                     <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Urine Output</td>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Est Blood Loss (cc)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;RBC Transfused (units) </td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Crystalloid</td>            
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Colloid</td>
                    <td class="controlBoxDataGridTitleColumn">&nbsp;</td>
              </tr>
              <tr>
                <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpUrineOutput" ID="OpUrineOutput" Runat="server"   /> </td>
                <td >
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpEstBloodLoss" ID="OpEstBloodLoss_1" Runat="server"   ShowCalendar="false" CalcDate="false"  /></td>
                <td >
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused_1" Runat="server"  /> </td>
                <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpCrystalloid" ID="OpCrystalloid_1" Runat="server"   /> </td>
                <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpColloid" ID="OpColloid_1" Runat="server"   ShowCalendar="false" CalcDate="false"  /></td>
                <td >
                    <euc:EformDeleteIcon ID="EformDeleteIcon_11b" runat="server" /></td>
             </tr>  
              <tr>
                     <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Notes</td>
                    <td class="controlBoxDataGridTitleColumn">&nbsp;</td>
                    <td class="controlBoxDataGridTitleColumn">&nbsp;</td>
                    <td class="controlBoxDataGridTitleColumn">&nbsp;</td>
                    <td class="controlBoxDataGridTitleColumn">&nbsp;</td>
                    <td class="controlBoxDataGridTitleColumn">&nbsp;</td>
              </tr>
              <tr>
                <td colspan="5">
                    <euc:EformTextBox  Width="675px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpNotes" ID="OpNotes_1" Runat="server"  ShowTextEditor="true" /></td>
                <td >
                    <euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" /></td>
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
        <td>
            <div id="PancDetailsDiv" runat="server" style="display: none; position: relative;">
            <strong>Primary Procedure Details</strong>
            <table width="700" border="0" cellspacing="0" cellpadding="6" class="ClinicalEformTable"  >
                      <tr>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Pancreatic Stent </td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Margin Frozen Result </td>
			                <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Reconstruction  </td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Pancreas  </td>
                      </tr>
                      <tr>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcStent" ID="ProcStent"   LookupCode="YesNoUnknown" Runat="server" TabIndex="6"  /> </td>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcMarginFrozen" ID="ProcMarginFrozen" LookupCode="YesNoUnknown" Runat="server" TabIndex="8" /></td>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcReconstruction" ID="ProcReconstruction" LookupCode="GastricReconstruction"  Runat="server" TabIndex="9"  /></td>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcPancreas" ID="ProcPancreas"   LookupCode="PancreasHardSoft" Runat="server" TabIndex="10"  /> </td>

                      </tr>

                      <tr>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Pancreatic Duct Size (mm) </td> 
			                <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Biliary Bypass </td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Biliary Bypass Origin </td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Gastric Bypass </td>
                      </tr>
                      <tr>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcPancreaticDuctSize" ID="ProcPancreaticDuctSize" LookupCode="PancreasDuctSize" Runat="server" TabIndex="11" /> </td>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcBiliaryBypass" ID="ProcBiliaryBypass" LookupCode="YesNoUnknown"  Runat="server" TabIndex="13"  /></td>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcBiliaryBypassOrigin" ID="ProcBiliaryBypassOrigin"   LookupCode="PancreasOrigin" Runat="server" TabIndex="14"  /> </td>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcGastricBypass" ID="ProcGastricBypass" LookupCode="YesNoUnknown" Runat="server" TabIndex="15" /> </td>

                      </tr>
                      
                      <tr>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Plexus Block   </td> 
			                <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Drains </td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Skin Closure </td>
                            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >Pancreatic Anastamosis</td>
                      </tr>
                      <tr>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcPlexusBlock" ID="ProcPlexusBlock" LookupCode="YesNoUnknown" Runat="server" TabIndex="16" /></td>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcDrains" ID="ProcDrains" LookupCode="YesNoUnknown"  Runat="server" TabIndex="17"  /></td>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcSkinClosure" ID="ProcSkinClosure"   LookupCode="PancreasClosure" Runat="server" TabIndex="18"  /> </td>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcPancreaticAnast" ID="ProcPancreaticAnast" LookupCode="ProcPancreaticAnastamosis"   Runat="server"   /> </td>
                            <%--<euc:EformComboBox  Width="100px" TABLE="NoTable" FIELD="ProcPancreaticAnast" ID="ProcPancreaticAnast" LookupCode="ProcPancreaticAnastamosis"   Runat="server"   /> </td>--%>

                      </tr>
                      <tr>
                            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >Additional Organs Resected</td> 
                            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                      </tr>
                      <tr>
                        <td>
                            <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcAddOrgansResected" ID="ProcAddOrgansResected" LookupCode="YesNoUnknown"   Runat="server"   /> </td>
                            <%--<euc:EformComboBox  Width="100px" TABLE="NoTable" FIELD="ProcAddOrgansResected" ID="ProcAddOrgansResected" LookupCode="YesNoUnknown"   Runat="server"   /> </td>--%>
                 
                     </tr>
                     
                     <tr><td valign="top" height="30px"></td></tr>
            </table>
            </div>        
        </td>
    </tr>

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
   
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_1.ClientID %>'),$('<%= OpCaseSurgeon_1.ClientID %>'),$('<%= OpDate_1.ClientID %>'),$('<%= OpDuration_1.ClientID %>'),$('<%= OpRBC_Transfused_1.ClientID %>'),$('<%= ProcDateText_11.ClientID %>'),$('<%= ProcDate_11.ClientID %>'),$('<%= ProcSurgeon_11.ClientID %>'),$('<%= OpNotes_1.ClientID %>'),$('<%= ProcPrimary_11.ClientID %>'),$('<%= ProcName_11.ClientID %>'),$('<%= ProcApproach_11.ClientID %>'),$('<%= ProcNotes_11.ClientID %>'),$('<%= ProcSite_11.ClientID %>'),$('<%= ProcSubsite_11.ClientID %>'),$('<%= ProcSide_11.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_1.ClientID %>'),$('<%= OpCaseSurgeon_1.ClientID %>'),$('<%= OpDate_1.ClientID %>'),$('<%= OpDuration_1.ClientID %>'),$('<%= OpRBC_Transfused_1.ClientID %>'),$('<%= ProcDateText_12.ClientID %>'),$('<%= ProcDate_12.ClientID %>'),$('<%= ProcSurgeon_12.ClientID %>'),$('<%= OpNotes_1.ClientID %>'),$('<%= ProcPrimary_12.ClientID %>'),$('<%= ProcName_12.ClientID %>'),$('<%= ProcApproach_12.ClientID %>'),$('<%= ProcNotes_12.ClientID %>'),$('<%= ProcSite_12.ClientID %>'),$('<%= ProcSubsite_12.ClientID %>'),$('<%= ProcSide_12.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_1.ClientID %>'),$('<%= OpCaseSurgeon_1.ClientID %>'),$('<%= OpDate_1.ClientID %>'),$('<%= OpDuration_1.ClientID %>'),$('<%= OpRBC_Transfused_1.ClientID %>'),$('<%= ProcDateText_13.ClientID %>'),$('<%= ProcDate_13.ClientID %>'),$('<%= ProcSurgeon_13.ClientID %>'),$('<%= OpNotes_1.ClientID %>'),$('<%= ProcPrimary_13.ClientID %>'),$('<%= ProcName_13.ClientID %>'),$('<%= ProcApproach_13.ClientID %>'),$('<%= ProcNotes_13.ClientID %>'),$('<%= ProcSite_13.ClientID %>'),$('<%= ProcSubsite_13.ClientID %>'),$('<%= ProcSide_13.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_1.ClientID %>'),$('<%= OpCaseSurgeon_1.ClientID %>'),$('<%= OpDate_1.ClientID %>'),$('<%= OpDuration_1.ClientID %>'),$('<%= OpRBC_Transfused_1.ClientID %>'),$('<%= ProcDateText_14.ClientID %>'),$('<%= ProcDate_14.ClientID %>'),$('<%= ProcSurgeon_14.ClientID %>'),$('<%= OpNotes_1.ClientID %>'),$('<%= ProcPrimary_14.ClientID %>'),$('<%= ProcName_14.ClientID %>'),$('<%= ProcApproach_14.ClientID %>'),$('<%= ProcNotes_14.ClientID %>'),$('<%= ProcSite_14.ClientID %>'),$('<%= ProcSubsite_14.ClientID %>'),$('<%= ProcSide_14.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_1.ClientID %>'),$('<%= OpCaseSurgeon_1.ClientID %>'),$('<%= OpDate_1.ClientID %>'),$('<%= OpDuration_1.ClientID %>'),$('<%= OpRBC_Transfused_1.ClientID %>'),$('<%= ProcDateText_15.ClientID %>'),$('<%= ProcDate_15.ClientID %>'),$('<%= ProcSurgeon_15.ClientID %>'),$('<%= OpNotes_1.ClientID %>'),$('<%= ProcPrimary_15.ClientID %>'),$('<%= ProcName_15.ClientID %>'),$('<%= ProcApproach_15.ClientID %>'),$('<%= ProcNotes_15.ClientID %>'),$('<%= ProcSite_15.ClientID %>'),$('<%= ProcSubsite_15.ClientID %>'),$('<%= ProcSide_15.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_1.ClientID %>'),$('<%= OpCaseSurgeon_1.ClientID %>'),$('<%= OpDate_1.ClientID %>'),$('<%= OpDuration_1.ClientID %>'),$('<%= OpRBC_Transfused_1.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= OpNotes_1.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcNotes_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_1.ClientID %>'),$('<%= OpCaseSurgeon_1.ClientID %>'),$('<%= OpDate_1.ClientID %>'),$('<%= OpDuration_1.ClientID %>'),$('<%= OpRBC_Transfused_1.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcSurgeon_17.ClientID %>'),$('<%= OpNotes_1.ClientID %>'),$('<%= ProcPrimary_17.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcApproach_17.ClientID %>'),$('<%= ProcNotes_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'));


    function addEvent(SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,opNotesID,procPrimary,procName,procApproach,procNotes,procSite,procSubsite,procSide)
    {  
        $(SurgDetailRecordedID).addEvent('click',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,opNotesID,procPrimary,procName,procApproach,procNotes,procSite,procSubsite,procSide));
        $(opDateTextID).addEvent('blur',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,opNotesID,procPrimary,procName,procApproach,procNotes,procSite,procSubsite,procSide));
        $(opSurgeonID).addEvent('blur',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,opNotesID,procPrimary,procName,procApproach,procNotes,procSite,procSubsite,procSide));
        $(procPrimary).addEvent('click',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,opNotesID,procPrimary,procName,procApproach,procNotes,procSite,procSubsite,procSide));
        $(procName).addEvent('blur',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,opNotesID,procPrimary,procName,procApproach,procNotes,procSite,procSubsite,procSide));
        $(procNotes).addEvent('blur',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,opNotesID,procPrimary,procName,procApproach,procNotes,procSite,procSubsite,procSide));
      
      // show on load
      SetProcedureFields(SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,opNotesID,procPrimary,procName,procApproach,procNotes,procSite,procSubsite,procSide); 
   }
   
    /* ]]> */
    
 	function SetProcedureFields(SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,opNotesID,procPrimary,procName,procApproach,procNotes,procSite,procSubsite,procSide)
	{ 
	    var SurgDetailoption_value = RetrieveRadioBtnListSelectedValues (SurgDetailRecordedID,"TABLE");

          if (SurgDetailoption_value == "Yes")
          { 
            SurgDetailDivID.style.display='block';
            SurgDetailAbsentDivID.style.display='none';
           
            document.getElementById('<%= AbsentDateText_4.ClientID %>').value='';
            document.getElementById('<%= AbsentDate_4.ClientID %>').value='';
            document.getElementById('<%= TableName_4.ClientID %>').value = '';        
            document.getElementById('<%= FieldName_4.ClientID %>').value = '';        
            document.getElementById('<%= FieldValue_4.ClientID %>').value = '';        
            document.getElementById('<%= AbsentReason_4.ClientID %>').value = '';        
            document.getElementById('<%= AbsentQuality_4.ClientID %>').value = '';
    	
	        if (procName.value != '' || procApproach.value != '' || procSite.value != '' || procSubsite.value != '' || procSide.value != '' || procNotes.value != '')
	        {
                procDateTextID.value = opDateTextID.value;
                procDateID.value = opDateID.value;
                procSurgeonID.value = opSurgeonID.value;
                
                // if primary procedure, check as primary and show pancreas details
                if (procName.id.indexOf('_11') > -1 )
                {
                    procPrimary.checked = true;                    
                    document.getElementById('<%= PancDetailsDiv.ClientID %>').style.display = '';
                }
                
                if (procSite.value == '')
                    procSite.value = 'Pancreas';
	        }
	        else
	        {
                procDateTextID.value = '';
                procDateID.value = '';
                procSurgeonID.value = '';
                procApproach.value = '';
                procPrimary.checked = false;
                if (procName.id.indexOf('_11') > -1 )
                   document.getElementById('<%= PancDetailsDiv.ClientID %>').style.display = 'none';
                opNotesID.value = '';
	        }
	      }
	      else if (SurgDetailoption_value == "No" || SurgDetailoption_value == "Unknown" || SurgDetailoption_value == "N/A")
          {
            SurgDetailAbsentDivID.style.display='block';
            SurgDetailDivID.style.display='none';
          
            document.getElementById('<%= TableName_4.ClientID %>').value = 'Procedures';        
            document.getElementById('<%= FieldName_4.ClientID %>').value = 'ProcName';        
            document.getElementById('<%= FieldValue_4.ClientID %>').value = 'Surgery Detail'; 
            
            if (SurgDetailoption_value == "No")       
                document.getElementById('<%= AbsentReason_4.ClientID %>').value = 'None Recorded';        
            else if (SurgDetailoption_value == "Unknown")       
                document.getElementById('<%= AbsentReason_4.ClientID %>').value = 'Unknown';
            else if (SurgDetailoption_value == "N/A")
                document.getElementById('<%= AbsentReason_4.ClientID %>').value = 'Not Applicable';

            document.getElementById('<%= AbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_4.ClientID %>').value + ' as of ';

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
            document.getElementById('<%= PancDetailsDiv.ClientID %>').style.display = 'none';
            procName.value = '';
            procApproach.value = '';   
            procNotes.value = '';
            procSite.value = '';
            procSubsite.value = '';
            procSide.value = '';
            opNotesID.value = '';
        }
     
 }  
	
</script>
