<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryProceduresPrimary" CodeFile="LiverSurgeryProceduresPrimary.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
    tableArray.ProceduresPrimaryHtmlTable = "ProceduresPrimaryHtmlTable";
	tableArray.ProceduresPrimaryHtmlTable2a = "ProceduresPrimaryHtmlTable2a";
	tableArray.ProceduresPrimaryHtmlTable2b = "ProceduresPrimaryHtmlTable2b";
	tableArray.ProceduresPrimaryHtmlTable2c = "ProceduresPrimaryHtmlTable2c";
	tableArray.ProceduresPrimaryHtmlTable2d = "ProceduresPrimaryHtmlTable2d";
	tableArray.ProceduresPrimaryHtmlTable2e = "ProceduresPrimaryHtmlTable2e";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="LiverSurgeryProceduresPrimary" /><br/>

<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Surgery Detail"></asp:Label> ?</span></td>
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
<table  width="575" cellpadding="8" cellspacing="0" border="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable" > 

    <tr>
        <td valign="top">
            <strong>Operative Detail</strong>
            <table  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OpDetailTable1">
                  <tr>
			            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Date of Operation</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgeon</td>
                         <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgical Approach </td>
                 </tr>
                 
                 <tr>
                 
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox Width="100px"  RecordId="40"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_40" Runat="server" ShowCalendar="true" CalcDate="true"/>
				        <euc:EformHidden  RecordId="40"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate_40"     Runat="server"/></td>

                    <td style="white-space: nowrap;">
                        <euc:EformComboBox  Width="100px" RecordId="40"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_40" LookupCode="Physician" Runat="server" /></td>
                    <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" TABLE="NoTable" FIELD="ProcApproachGlobal_40" ID="ProcApproachGlobal_40" LookupCode="OpApproach,Disease,@DiseaseView" Runat="server" /></td>
                  </tr>
                  <tr>
                       <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >Operating Time (min) </td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >RBC Transfused (units) </td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >Duration of Pringle (minutes)</td>

                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="40"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_40" Runat="server" ShowCalendar="false" CalcDate="false" /></td>
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="40"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused_40" Runat="server"  /> </td>
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" TABLE="NoTable" FIELD="Duration_of_Pringle_min_40" ID="Duration_of_Pringle_min_40" Runat="server"  />
                        
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="40" TABLE="OperatingRoomDetails" FIELD="OpPostOpSummary" ID="OpPostOpSummary_40" Runat="server" />
                       
                        </td>        
                </tr>            
            </table>
        </td>
        
         <td valign="top">
                      <strong>Primary Procedure</strong>
            <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable2aprimary" >

                  <tr>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                  </tr>
                  <tr >
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="40" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_40" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="40" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_40"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="40"  ParentRecordId="40"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_40"   Runat="server" />
                         
                         <euc:EformCheckBox Width="1px" style="display: none;" RecordId="40" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_40" Runat="server" Value="1" /> 
                        <euc:EformComboBox Width="100px" RecordId="40" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_40"     LookupCode="ProcName" DropDownWidth="200px" Runat="server"  />
                        <euc:EformTextBox  Width="1px" style="display: none;"  RecordId="40" ParentRecordId="40"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_40"    Runat="server"  /></td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="40" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_40"    Runat="server" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
            </table>
            
            <br />
             <strong>Supplementary Procedures</strong>
            <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable2a" >

                  <tr>
                        <%--<td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Primary</td>--%>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                  </tr>
                  <%--<tr >
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="40" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_40" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="40" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_40"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="40"  ParentRecordId="40"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_40"   Runat="server" />
                         
                         <euc:EformCheckBox Width="5px" RecordId="40" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_40" Runat="server" Value="1" /> </td>

                   <td style="white-space: nowrap;">
                        <euc:EformComboBox Width="100px" RecordId="40" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_40"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        <euc:EformTextBox  Width="1px" style="display: none;"  RecordId="40" ParentRecordId="40"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_40"    Runat="server"  /></td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="40" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_40"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>--%>
                   <tr >
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="41"  ParentRecordId="40"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_41" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="41" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_41"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="41" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_41"   Runat="server" />
                         
                         <euc:EformCheckBox Width="1px" style="display: none;" RecordId="41" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_41" Runat="server" Value="1" /> 
                        <euc:EformComboBox Width="100px" RecordId="41" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_41"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="41" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_41"      Runat="server"  /></td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="41" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_41"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
                   <tr style="display: none;">
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="42" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_42" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="42" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_42"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="42" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_42"   Runat="server" />
                         
                         <euc:EformCheckBox Width="1px" style="display: none;" RecordId="42" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_42" Runat="server" Value="1" /> 
                        <euc:EformComboBox Width="100px" RecordId="42" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_42"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="42" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_42" LookupCode="OpApproach,Disease,@DiseaseView"    DropDownWidth="200px" Runat="server"  /></td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="42" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_42"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
                  <tr style="display: none;">
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="43" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_43" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="43" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_43"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="43" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_43"   Runat="server" />
                         
                         <euc:EformCheckBox Width="1px" style="display: none;" RecordId="43" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_43" Runat="server" Value="1" /> 
                        <euc:EformComboBox Width="100px" RecordId="43" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_43"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="43" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_43"  Runat="server"  /></td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="43" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_43"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>

                  <tr style="display: none;">
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="44" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_44" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="44" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_44"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="44" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_44"   Runat="server" />
                         
                         <euc:EformCheckBox Width="1px" style="display: none;" RecordId="44" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_44" Runat="server" Value="1" /> 
                        <euc:EformComboBox Width="100px" RecordId="44" ParentRecordId="40"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_44"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="44" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_44"  Runat="server"  /></td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="44" ParentRecordId="40"    TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_44"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
            </table>
            <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresPrimaryHtmlTable2a');" />
               
          </td>
    </tr> 

    <tr style="display: none;">
        <td valign="top">
            <strong>Operative Detail</strong>
            <table  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OpDetailTable2">
                  <tr>
			            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Date of Operation</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgeon</td>
                         <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgical Approach </td>
                 </tr>
                 
                 <tr>
                 
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox Width="100px"  RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_2" Runat="server" ShowCalendar="true" CalcDate="true"/>
				        <euc:EformHidden  RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate_2"     Runat="server"/></td>

                    <td style="white-space: nowrap;">
                        <euc:EformComboBox  Width="100px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_2" LookupCode="Physician" Runat="server" /></td>
                    <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto" Width="100px" TABLE="NoTable" FIELD="ProcApproachGlobal_2" ID="ProcApproachGlobal_2" LookupCode="OpApproach,Disease,@DiseaseView" Runat="server" /></td>
                  </tr>
                  <tr>
                       <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >Operating Time (min) </td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >RBC Transfused (units) </td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >Duration of Pringle (minutes)</td>

                </tr>
                <tr>
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_2" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false" /></td>
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused_2" Runat="server" TabIndex="10"  /> </td>
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" TABLE="NoTable" FIELD="Duration_of_Pringle_min_2" ID="Duration_of_Pringle_min_2" Runat="server" TabIndex="10"  />
                       
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="2" TABLE="OperatingRoomDetails" FIELD="OpPostOpSummary" ID="OpPostOpSummary_2" Runat="server" />
                        </td>        
      
                </tr>            
            </table>
        </td>
        
         <td valign="top">
             <strong>Procedures</strong>
            <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable2b" >

                  <tr>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Primary</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                  </tr>
                  <tr >
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="45" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_45" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="45" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_45"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="45"  ParentRecordId="2"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_45"   Runat="server" />
                         
                         <euc:EformCheckBox Width="5px" RecordId="45" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_45" Runat="server" Value="1" /> </td>

                   <td style="white-space: nowrap;">
                        <euc:EformComboBox Width="100px" RecordId="45" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_45"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        <euc:EformTextBox  Width="1px" style="display: none;"  RecordId="45" ParentRecordId="2" TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_45"    Runat="server"  /></td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="45" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_45"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
                   <tr style="display: none;">
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="46" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_46" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="46" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_46"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="46" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_46"   Runat="server" />
                         
                         <euc:EformCheckBox Width="5px" RecordId="46" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_46" Runat="server" Value="1" /> </td>

                   <td style="white-space: nowrap;">
                        <euc:EformComboBox Width="100px" RecordId="46" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_46"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="46" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_46"      Runat="server"  /></td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="46" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_46"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
                   <tr style="display: none;">
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="47"  ParentRecordId="2"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_47" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="47" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_47"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="47"  ParentRecordId="2"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_47"   Runat="server" />
                         
                         <euc:EformCheckBox Width="5px" RecordId="47" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_47" Runat="server" Value="1" /> </td>

                   <td style="white-space: nowrap;">
                        <euc:EformComboBox Width="100px" RecordId="47" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_47"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="47" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_47" LookupCode="OpApproach,Disease,@DiseaseView"    DropDownWidth="200px" Runat="server"  /></td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="47" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_47"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
                  <tr style="display: none;">
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="48" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_48" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="48" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_48"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="48" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_48"   Runat="server" />
                         
                         <euc:EformCheckBox Width="5px" RecordId="48" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_48" Runat="server" Value="1" /> </td>

                   <td style="white-space: nowrap;">
                        <euc:EformComboBox Width="100px" RecordId="48" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_48"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="48" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_48"  Runat="server"  /></td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="48" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_48"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>

                  <tr style="display: none;">
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="49"  ParentRecordId="2"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_49" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="49" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_49"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="49" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_49"   Runat="server" />
                         
                         <euc:EformCheckBox Width="5px" RecordId="49" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_49" Runat="server" Value="1" /> </td>

                   <td style="white-space: nowrap;">
                        <euc:EformComboBox Width="100px" RecordId="49" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_49"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="49" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_49"  Runat="server"  /></td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="49" ParentRecordId="2" TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_49"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
            </table>
            <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresPrimaryHtmlTable2b');" />
               
          </td>
    </tr>
    
    
    <tr style="display: none;">
            
            <td valign="top">
                <strong>Operative Detail</strong>
                <table  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OpDetailTable3">
                      <tr>
			                <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Date of Operation</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgeon</td>
                             <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgical Approach </td>
                     </tr>
                     
                     <tr>
                     
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox Width="100px"  RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_3" Runat="server" ShowCalendar="true" CalcDate="true"/>
				            <euc:EformHidden  RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate_3"     Runat="server"/></td>

                        <td style="white-space: nowrap;">
                            <euc:EformComboBox  Width="100px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_3" LookupCode="Physician" Runat="server" /></td>
                        <td style="white-space: nowrap;">
                            <euc:EformComboBox DropDownWidth="auto" Width="100px" TABLE="NoTable" FIELD="ProcApproachGlobal_3" ID="ProcApproachGlobal_3" LookupCode="OpApproach,Disease,@DiseaseView" Runat="server" /></td>
                      </tr>
                      <tr>
                           <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >Operating Time (min) </td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >RBC Transfused (units) </td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >Duration of Pringle (minutes)</td>

                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_3" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false" /></td>
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused_3" Runat="server" TabIndex="10"  /> </td>
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" TABLE="NoTable" FIELD="Duration_of_Pringle_min_3" ID="Duration_of_Pringle_min_3" Runat="server" TabIndex="10"  />
                       
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="3" TABLE="OperatingRoomDetails" FIELD="OpPostOpSummary" ID="OpPostOpSummary_3" Runat="server" />
                        </td>        

                    </tr>            
                </table>
            </td>
            
             <td valign="top">
                 <strong>Procedures</strong>
                <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable2c" >

                      <tr>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Primary</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                      </tr>
                      <tr >
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="50" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_50" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="50" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_50"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="50"  ParentRecordId="3"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_50"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="50" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_50" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="50" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_50"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;"  RecordId="50" ParentRecordId="3" TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_50"    Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="50" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_50"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="51"  ParentRecordId="3"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_51" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="51" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_51"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="51" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_51"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="51" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_51" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="51" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_51"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="51" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_51"      Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="51" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_51"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="52"  ParentRecordId="3"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_52" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="52" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_52"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="52"  ParentRecordId="3"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_52"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="52" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_52" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="52" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_52"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="52" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_52" LookupCode="OpApproach,Disease,@DiseaseView"    DropDownWidth="200px" Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="52" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_52"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="53" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_53" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="53" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_53"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="53" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_53"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="53" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_53" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="53" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_53"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="53" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_53"  Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="53" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_53"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>

                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="54" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_54" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="54" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_54"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="54" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_54"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="54"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_54" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="54"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_54"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="54"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_54"  Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="54" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_54"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                </table>
                <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresPrimaryHtmlTable2c');" />
                   
              </td>
        </tr>    

    <tr style="display: none;">
            
            <td valign="top">
                <strong>Operative Detail</strong>
                <table  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OpDetailTable4">
                      <tr>
			                <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Date of Operation</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgeon</td>
                             <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgical Approach </td>
                     </tr>
                     
                     <tr>
                     
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox Width="100px"  RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_4" Runat="server" ShowCalendar="true" CalcDate="true"/>
				            <euc:EformHidden  RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate_4"     Runat="server"/></td>

                        <td style="white-space: nowrap;">
                            <euc:EformComboBox  Width="100px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_4" LookupCode="Physician" Runat="server" /></td>
                        <td style="white-space: nowrap;">
                            <euc:EformComboBox DropDownWidth="auto" Width="100px" TABLE="NoTable" FIELD="ProcApproachGlobal_4" ID="ProcApproachGlobal_4" LookupCode="OpApproach,Disease,@DiseaseView" Runat="server" /></td>
                      </tr>
                      <tr>
                           <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >Operating Time (min) </td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >RBC Transfused (units) </td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >Duration of Pringle (minutes)</td>

                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_4" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false" /></td>
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused_4" Runat="server" TabIndex="10"  /> </td>
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" TABLE="NoTable" FIELD="Duration_of_Pringle_min_4" ID="Duration_of_Pringle_min_4" Runat="server" TabIndex="10"  />
                       
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="4" TABLE="OperatingRoomDetails" FIELD="OpPostOpSummary" ID="OpPostOpSummary_4" Runat="server" />
                        </td>        
        
                    </tr>            
                </table>
            </td>
            
             <td valign="top">
                 <strong>Procedures</strong>
                <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable2d" >

                      <tr>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Primary</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                      </tr>
                      <tr >
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="55" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_55" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="55" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_55"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="55"  ParentRecordId="4"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_55"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="55" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_55" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="55" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_55"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;"  RecordId="55" ParentRecordId="4" TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_55"    Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="55" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_55"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="56" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_56" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="56" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_56"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="56" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_56"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="56" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_56" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="56" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_56"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="56" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_56"      Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="56" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_56"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="57"  ParentRecordId="4"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_57" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="57" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_57"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="57"  ParentRecordId="4"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_57"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="57" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_57" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="57" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_57"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="57" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_57" LookupCode="OpApproach,Disease,@DiseaseView"    DropDownWidth="200px" Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="57" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_57"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="58"  ParentRecordId="4"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_58" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="58" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_58"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="58" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_58"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="58" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_58" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="58" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_58"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="58" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_58"  Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="58" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_58"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>

                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="59" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_59" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="59" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_59"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="59" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_59"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="59" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_59" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="59" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_59"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="59" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_59"  Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="59" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_59"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                </table>
                <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresPrimaryHtmlTable2d');" />
                   
              </td>
        </tr>            

    <tr style="display: none;">
            
            <td valign="top">
                <strong>Operative Detail</strong>
                <table  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OpDetailTable5">
                      <tr>
			                <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Date of Operation</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgeon</td>
                             <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgical Approach </td>
                     </tr>
                     
                     <tr>
                     
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox Width="100px"  RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_5" Runat="server" ShowCalendar="true" CalcDate="true"/>
				            <euc:EformHidden  RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate_5"     Runat="server"/></td>

                        <td style="white-space: nowrap;">
                            <euc:EformComboBox  Width="100px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_5" LookupCode="Physician" Runat="server" /></td>
                        <td style="white-space: nowrap;">
                            <euc:EformComboBox DropDownWidth="auto"  Width="100px" TABLE="NoTable" FIELD="ProcApproachGlobal_5" ID="ProcApproachGlobal_5" LookupCode="OpApproach,Disease,@DiseaseView" Runat="server" /></td>
                      </tr>
                      <tr>
                           <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >Operating Time (min) </td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >RBC Transfused (units) </td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 100px; " >Duration of Pringle (minutes)</td>

                    </tr>
                    <tr>
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_5" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false" /></td>
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused_5" Runat="server" TabIndex="10"  /> </td>
                        <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" TABLE="NoTable" FIELD="Duration_of_Pringle_min_5" ID="Duration_of_Pringle_min_5" Runat="server" TabIndex="10"  />
                       
                        <euc:EformTextBox  Width="1px" style="display: none;" RecordId="5" TABLE="OperatingRoomDetails" FIELD="OpPostOpSummary" ID="OpPostOpSummary_5" Runat="server" />
                        </td>        
     
                    </tr>            
                </table>
            </td>
            
             <td valign="top">
                 <strong>Procedures</strong>
                <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable2e" >

                      <tr>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Primary</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                      </tr>
                      <tr >
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="60" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_60" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="60" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_60"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="60" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_60"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="60" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_60" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="60" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_60"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;"  RecordId="60" ParentRecordId="5" TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_60"    Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="60" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_60"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="61" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_61" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="61" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_61"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="61" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_61"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="61" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_61" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="61" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_61"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="61" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_61"      Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="61" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_61"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="62"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_62" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="62" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_62"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="62"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_62"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="62" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_62" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="62" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_62"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="62" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_62" LookupCode="OpApproach,Disease,@DiseaseView"    DropDownWidth="200px" Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="62" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_62"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="63"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_63" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="63" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_63"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="63"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_63"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="63" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_63" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="63" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_63"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="63" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_63"  Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="63" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_63"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>

                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="64"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_64" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="64" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_64"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="64" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_64"   Runat="server" />
                             
                             <euc:EformCheckBox Width="5px" RecordId="64" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_64" Runat="server" Value="1" /> </td>

                       <td style="white-space: nowrap;">
                            <euc:EformComboBox Width="100px" RecordId="64" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_64"     LookupCode="ProcName" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            <euc:EformTextBox  Width="1px" style="display: none;" RecordId="64" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcApproach"    ID="ProcApproach_64"  Runat="server"  /></td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="64"  ParentRecordId="5" TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_64"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                </table>
                <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresPrimaryHtmlTable2e');" />
                   
              </td>
        </tr>              

</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresPrimaryHtmlTable');" />
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

    addEvent($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_40.ClientID %>'), $('<%= OpCaseSurgeon_40.ClientID %>'), $('<%= OpDate_40.ClientID %>'), $('<%= OpDuration_40.ClientID %>'), $('<%= OpRBC_Transfused_40.ClientID %>'), $('<%= ProcDateText_40.ClientID %>'), $('<%= ProcDate_40.ClientID %>'), $('<%= ProcSurgeon_40.ClientID %>'), $('<%= ProcApproachGlobal_40.ClientID %>'), $('<%= OpPostOpSummary_40.ClientID %>'), $('<%= Duration_of_Pringle_min_40.ClientID %>'), $('<%= ProcPrimary_40.ClientID %>'), $('<%= ProcName_40.ClientID %>'), $('<%= ProcApproach_40.ClientID %>'), $('<%= ProcNotes_40.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_40.ClientID %>'), $('<%= OpCaseSurgeon_40.ClientID %>'), $('<%= OpDate_40.ClientID %>'), $('<%= OpDuration_40.ClientID %>'), $('<%= OpRBC_Transfused_40.ClientID %>'), $('<%= ProcDateText_41.ClientID %>'), $('<%= ProcDate_41.ClientID %>'), $('<%= ProcSurgeon_41.ClientID %>'), $('<%= ProcApproachGlobal_40.ClientID %>'), $('<%= OpPostOpSummary_40.ClientID %>'), $('<%= Duration_of_Pringle_min_40.ClientID %>'), $('<%= ProcPrimary_41.ClientID %>'), $('<%= ProcName_41.ClientID %>'), $('<%= ProcApproach_41.ClientID %>'), $('<%= ProcNotes_41.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_40.ClientID %>'), $('<%= OpCaseSurgeon_40.ClientID %>'), $('<%= OpDate_40.ClientID %>'), $('<%= OpDuration_40.ClientID %>'), $('<%= OpRBC_Transfused_40.ClientID %>'), $('<%= ProcDateText_42.ClientID %>'), $('<%= ProcDate_42.ClientID %>'), $('<%= ProcSurgeon_42.ClientID %>'), $('<%= ProcApproachGlobal_40.ClientID %>'), $('<%= OpPostOpSummary_40.ClientID %>'), $('<%= Duration_of_Pringle_min_40.ClientID %>'), $('<%= ProcPrimary_42.ClientID %>'), $('<%= ProcName_42.ClientID %>'), $('<%= ProcApproach_42.ClientID %>'), $('<%= ProcNotes_42.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_40.ClientID %>'), $('<%= OpCaseSurgeon_40.ClientID %>'), $('<%= OpDate_40.ClientID %>'), $('<%= OpDuration_40.ClientID %>'), $('<%= OpRBC_Transfused_40.ClientID %>'), $('<%= ProcDateText_43.ClientID %>'), $('<%= ProcDate_43.ClientID %>'), $('<%= ProcSurgeon_43.ClientID %>'), $('<%= ProcApproachGlobal_40.ClientID %>'), $('<%= OpPostOpSummary_40.ClientID %>'), $('<%= Duration_of_Pringle_min_40.ClientID %>'), $('<%= ProcPrimary_43.ClientID %>'), $('<%= ProcName_43.ClientID %>'), $('<%= ProcApproach_43.ClientID %>'), $('<%= ProcNotes_43.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_40.ClientID %>'), $('<%= OpCaseSurgeon_40.ClientID %>'), $('<%= OpDate_40.ClientID %>'), $('<%= OpDuration_40.ClientID %>'), $('<%= OpRBC_Transfused_40.ClientID %>'), $('<%= ProcDateText_44.ClientID %>'), $('<%= ProcDate_44.ClientID %>'), $('<%= ProcSurgeon_44.ClientID %>'), $('<%= ProcApproachGlobal_40.ClientID %>'), $('<%= OpPostOpSummary_40.ClientID %>'), $('<%= Duration_of_Pringle_min_40.ClientID %>'), $('<%= ProcPrimary_44.ClientID %>'), $('<%= ProcName_44.ClientID %>'), $('<%= ProcApproach_44.ClientID %>'), $('<%= ProcNotes_44.ClientID %>'));

    addEvent($('<%= SurgDetailRecorded.ClientID %>'), $('<%= SurgDetailDiv.ClientID %>'), $('<%= SurgDetailAbsentDiv.ClientID %>'), $('<%= OpDateText_2.ClientID %>'), $('<%= OpCaseSurgeon_2.ClientID %>'), $('<%= OpDate_2.ClientID %>'), $('<%= OpDuration_2.ClientID %>'), $('<%= OpRBC_Transfused_2.ClientID %>'), $('<%= ProcDateText_45.ClientID %>'), $('<%= ProcDate_45.ClientID %>'), $('<%= ProcSurgeon_45.ClientID %>'), $('<%= ProcApproachGlobal_2.ClientID %>'), $('<%= OpPostOpSummary_2.ClientID %>'), $('<%= Duration_of_Pringle_min_2.ClientID %>'), $('<%= ProcPrimary_45.ClientID %>'), $('<%= ProcName_45.ClientID %>'), $('<%= ProcApproach_45.ClientID %>'), $('<%= ProcNotes_45.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_2.ClientID %>'),$('<%= OpCaseSurgeon_2.ClientID %>'),$('<%= OpDate_2.ClientID %>'),$('<%= OpDuration_2.ClientID %>'),$('<%= OpRBC_Transfused_2.ClientID %>'),$('<%= ProcDateText_46.ClientID %>'),$('<%= ProcDate_46.ClientID %>'),$('<%= ProcSurgeon_46.ClientID %>'),$('<%= ProcApproachGlobal_2.ClientID %>'), $('<%= OpPostOpSummary_2.ClientID %>'),$('<%= Duration_of_Pringle_min_2.ClientID %>'),$('<%= ProcPrimary_46.ClientID %>'),$('<%= ProcName_46.ClientID %>'),$('<%= ProcApproach_46.ClientID %>'),$('<%= ProcNotes_46.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_2.ClientID %>'),$('<%= OpCaseSurgeon_2.ClientID %>'),$('<%= OpDate_2.ClientID %>'),$('<%= OpDuration_2.ClientID %>'),$('<%= OpRBC_Transfused_2.ClientID %>'),$('<%= ProcDateText_47.ClientID %>'),$('<%= ProcDate_47.ClientID %>'),$('<%= ProcSurgeon_47.ClientID %>'),$('<%= ProcApproachGlobal_2.ClientID %>'), $('<%= OpPostOpSummary_2.ClientID %>'),$('<%= Duration_of_Pringle_min_2.ClientID %>'),$('<%= ProcPrimary_47.ClientID %>'),$('<%= ProcName_47.ClientID %>'),$('<%= ProcApproach_47.ClientID %>'),$('<%= ProcNotes_47.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_2.ClientID %>'),$('<%= OpCaseSurgeon_2.ClientID %>'),$('<%= OpDate_2.ClientID %>'),$('<%= OpDuration_2.ClientID %>'),$('<%= OpRBC_Transfused_2.ClientID %>'),$('<%= ProcDateText_48.ClientID %>'),$('<%= ProcDate_48.ClientID %>'),$('<%= ProcSurgeon_48.ClientID %>'),$('<%= ProcApproachGlobal_2.ClientID %>'), $('<%= OpPostOpSummary_2.ClientID %>'),$('<%= Duration_of_Pringle_min_2.ClientID %>'),$('<%= ProcPrimary_48.ClientID %>'),$('<%= ProcName_48.ClientID %>'),$('<%= ProcApproach_48.ClientID %>'),$('<%= ProcNotes_48.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_2.ClientID %>'),$('<%= OpCaseSurgeon_2.ClientID %>'),$('<%= OpDate_2.ClientID %>'),$('<%= OpDuration_2.ClientID %>'),$('<%= OpRBC_Transfused_2.ClientID %>'),$('<%= ProcDateText_49.ClientID %>'),$('<%= ProcDate_49.ClientID %>'),$('<%= ProcSurgeon_49.ClientID %>'),$('<%= ProcApproachGlobal_2.ClientID %>'), $('<%= OpPostOpSummary_2.ClientID %>'),$('<%= Duration_of_Pringle_min_2.ClientID %>'),$('<%= ProcPrimary_49.ClientID %>'),$('<%= ProcName_49.ClientID %>'),$('<%= ProcApproach_49.ClientID %>'),$('<%= ProcNotes_49.ClientID %>'));

    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_3.ClientID %>'),$('<%= OpCaseSurgeon_3.ClientID %>'),$('<%= OpDate_3.ClientID %>'),$('<%= OpDuration_3.ClientID %>'),$('<%= OpRBC_Transfused_3.ClientID %>'),$('<%= ProcDateText_50.ClientID %>'),$('<%= ProcDate_50.ClientID %>'),$('<%= ProcSurgeon_50.ClientID %>'),$('<%= ProcApproachGlobal_3.ClientID %>'), $('<%= OpPostOpSummary_3.ClientID %>'),$('<%= Duration_of_Pringle_min_3.ClientID %>'),$('<%= ProcPrimary_50.ClientID %>'),$('<%= ProcName_50.ClientID %>'),$('<%= ProcApproach_50.ClientID %>'),$('<%= ProcNotes_50.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_3.ClientID %>'),$('<%= OpCaseSurgeon_3.ClientID %>'),$('<%= OpDate_3.ClientID %>'),$('<%= OpDuration_3.ClientID %>'),$('<%= OpRBC_Transfused_3.ClientID %>'),$('<%= ProcDateText_51.ClientID %>'),$('<%= ProcDate_51.ClientID %>'),$('<%= ProcSurgeon_51.ClientID %>'),$('<%= ProcApproachGlobal_3.ClientID %>'), $('<%= OpPostOpSummary_3.ClientID %>'),$('<%= Duration_of_Pringle_min_3.ClientID %>'),$('<%= ProcPrimary_51.ClientID %>'),$('<%= ProcName_51.ClientID %>'),$('<%= ProcApproach_51.ClientID %>'),$('<%= ProcNotes_51.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_3.ClientID %>'),$('<%= OpCaseSurgeon_3.ClientID %>'),$('<%= OpDate_3.ClientID %>'),$('<%= OpDuration_3.ClientID %>'),$('<%= OpRBC_Transfused_3.ClientID %>'),$('<%= ProcDateText_52.ClientID %>'),$('<%= ProcDate_52.ClientID %>'),$('<%= ProcSurgeon_52.ClientID %>'),$('<%= ProcApproachGlobal_3.ClientID %>'), $('<%= OpPostOpSummary_3.ClientID %>'),$('<%= Duration_of_Pringle_min_3.ClientID %>'),$('<%= ProcPrimary_52.ClientID %>'),$('<%= ProcName_52.ClientID %>'),$('<%= ProcApproach_52.ClientID %>'),$('<%= ProcNotes_52.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_3.ClientID %>'),$('<%= OpCaseSurgeon_3.ClientID %>'),$('<%= OpDate_3.ClientID %>'),$('<%= OpDuration_3.ClientID %>'),$('<%= OpRBC_Transfused_3.ClientID %>'),$('<%= ProcDateText_53.ClientID %>'),$('<%= ProcDate_53.ClientID %>'),$('<%= ProcSurgeon_53.ClientID %>'),$('<%= ProcApproachGlobal_3.ClientID %>'), $('<%= OpPostOpSummary_3.ClientID %>'),$('<%= Duration_of_Pringle_min_3.ClientID %>'),$('<%= ProcPrimary_53.ClientID %>'),$('<%= ProcName_53.ClientID %>'),$('<%= ProcApproach_53.ClientID %>'),$('<%= ProcNotes_53.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_3.ClientID %>'),$('<%= OpCaseSurgeon_3.ClientID %>'),$('<%= OpDate_3.ClientID %>'),$('<%= OpDuration_3.ClientID %>'),$('<%= OpRBC_Transfused_3.ClientID %>'),$('<%= ProcDateText_54.ClientID %>'),$('<%= ProcDate_54.ClientID %>'),$('<%= ProcSurgeon_54.ClientID %>'),$('<%= ProcApproachGlobal_3.ClientID %>'), $('<%= OpPostOpSummary_3.ClientID %>'),$('<%= Duration_of_Pringle_min_3.ClientID %>'),$('<%= ProcPrimary_54.ClientID %>'),$('<%= ProcName_54.ClientID %>'),$('<%= ProcApproach_54.ClientID %>'),$('<%= ProcNotes_54.ClientID %>'));

    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_4.ClientID %>'),$('<%= OpCaseSurgeon_4.ClientID %>'),$('<%= OpDate_4.ClientID %>'),$('<%= OpDuration_4.ClientID %>'),$('<%= OpRBC_Transfused_4.ClientID %>'),$('<%= ProcDateText_55.ClientID %>'),$('<%= ProcDate_55.ClientID %>'),$('<%= ProcSurgeon_55.ClientID %>'),$('<%= ProcApproachGlobal_4.ClientID %>'), $('<%= OpPostOpSummary_4.ClientID %>'),$('<%= Duration_of_Pringle_min_4.ClientID %>'),$('<%= ProcPrimary_55.ClientID %>'),$('<%= ProcName_55.ClientID %>'),$('<%= ProcApproach_55.ClientID %>'),$('<%= ProcNotes_55.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_4.ClientID %>'),$('<%= OpCaseSurgeon_4.ClientID %>'),$('<%= OpDate_4.ClientID %>'),$('<%= OpDuration_4.ClientID %>'),$('<%= OpRBC_Transfused_4.ClientID %>'),$('<%= ProcDateText_56.ClientID %>'),$('<%= ProcDate_56.ClientID %>'),$('<%= ProcSurgeon_56.ClientID %>'),$('<%= ProcApproachGlobal_4.ClientID %>'), $('<%= OpPostOpSummary_4.ClientID %>'),$('<%= Duration_of_Pringle_min_4.ClientID %>'),$('<%= ProcPrimary_56.ClientID %>'),$('<%= ProcName_56.ClientID %>'),$('<%= ProcApproach_56.ClientID %>'),$('<%= ProcNotes_56.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_4.ClientID %>'),$('<%= OpCaseSurgeon_4.ClientID %>'),$('<%= OpDate_4.ClientID %>'),$('<%= OpDuration_4.ClientID %>'),$('<%= OpRBC_Transfused_4.ClientID %>'),$('<%= ProcDateText_57.ClientID %>'),$('<%= ProcDate_57.ClientID %>'),$('<%= ProcSurgeon_57.ClientID %>'),$('<%= ProcApproachGlobal_4.ClientID %>'), $('<%= OpPostOpSummary_4.ClientID %>'),$('<%= Duration_of_Pringle_min_4.ClientID %>'),$('<%= ProcPrimary_57.ClientID %>'),$('<%= ProcName_57.ClientID %>'),$('<%= ProcApproach_57.ClientID %>'),$('<%= ProcNotes_57.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_4.ClientID %>'),$('<%= OpCaseSurgeon_4.ClientID %>'),$('<%= OpDate_4.ClientID %>'),$('<%= OpDuration_4.ClientID %>'),$('<%= OpRBC_Transfused_4.ClientID %>'),$('<%= ProcDateText_58.ClientID %>'),$('<%= ProcDate_58.ClientID %>'),$('<%= ProcSurgeon_58.ClientID %>'),$('<%= ProcApproachGlobal_4.ClientID %>'), $('<%= OpPostOpSummary_4.ClientID %>'),$('<%= Duration_of_Pringle_min_4.ClientID %>'),$('<%= ProcPrimary_58.ClientID %>'),$('<%= ProcName_58.ClientID %>'),$('<%= ProcApproach_58.ClientID %>'),$('<%= ProcNotes_58.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_4.ClientID %>'),$('<%= OpCaseSurgeon_4.ClientID %>'),$('<%= OpDate_4.ClientID %>'),$('<%= OpDuration_4.ClientID %>'),$('<%= OpRBC_Transfused_4.ClientID %>'),$('<%= ProcDateText_59.ClientID %>'),$('<%= ProcDate_59.ClientID %>'),$('<%= ProcSurgeon_59.ClientID %>'),$('<%= ProcApproachGlobal_4.ClientID %>'), $('<%= OpPostOpSummary_4.ClientID %>'),$('<%= Duration_of_Pringle_min_4.ClientID %>'),$('<%= ProcPrimary_59.ClientID %>'),$('<%= ProcName_59.ClientID %>'),$('<%= ProcApproach_59.ClientID %>'),$('<%= ProcNotes_59.ClientID %>'));

    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_5.ClientID %>'),$('<%= OpCaseSurgeon_5.ClientID %>'),$('<%= OpDate_5.ClientID %>'),$('<%= OpDuration_5.ClientID %>'),$('<%= OpRBC_Transfused_5.ClientID %>'),$('<%= ProcDateText_60.ClientID %>'),$('<%= ProcDate_60.ClientID %>'),$('<%= ProcSurgeon_60.ClientID %>'),$('<%= ProcApproachGlobal_5.ClientID %>'), $('<%= OpPostOpSummary_5.ClientID %>'),$('<%= Duration_of_Pringle_min_5.ClientID %>'),$('<%= ProcPrimary_60.ClientID %>'),$('<%= ProcName_60.ClientID %>'),$('<%= ProcApproach_60.ClientID %>'),$('<%= ProcNotes_60.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_5.ClientID %>'),$('<%= OpCaseSurgeon_5.ClientID %>'),$('<%= OpDate_5.ClientID %>'),$('<%= OpDuration_5.ClientID %>'),$('<%= OpRBC_Transfused_5.ClientID %>'),$('<%= ProcDateText_61.ClientID %>'),$('<%= ProcDate_61.ClientID %>'),$('<%= ProcSurgeon_61.ClientID %>'),$('<%= ProcApproachGlobal_5.ClientID %>'), $('<%= OpPostOpSummary_5.ClientID %>'),$('<%= Duration_of_Pringle_min_5.ClientID %>'),$('<%= ProcPrimary_61.ClientID %>'),$('<%= ProcName_61.ClientID %>'),$('<%= ProcApproach_61.ClientID %>'),$('<%= ProcNotes_61.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_5.ClientID %>'),$('<%= OpCaseSurgeon_5.ClientID %>'),$('<%= OpDate_5.ClientID %>'),$('<%= OpDuration_5.ClientID %>'),$('<%= OpRBC_Transfused_5.ClientID %>'),$('<%= ProcDateText_62.ClientID %>'),$('<%= ProcDate_62.ClientID %>'),$('<%= ProcSurgeon_62.ClientID %>'),$('<%= ProcApproachGlobal_5.ClientID %>'), $('<%= OpPostOpSummary_5.ClientID %>'),$('<%= Duration_of_Pringle_min_5.ClientID %>'),$('<%= ProcPrimary_62.ClientID %>'),$('<%= ProcName_62.ClientID %>'),$('<%= ProcApproach_62.ClientID %>'),$('<%= ProcNotes_62.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_5.ClientID %>'),$('<%= OpCaseSurgeon_5.ClientID %>'),$('<%= OpDate_5.ClientID %>'),$('<%= OpDuration_5.ClientID %>'),$('<%= OpRBC_Transfused_5.ClientID %>'),$('<%= ProcDateText_63.ClientID %>'),$('<%= ProcDate_63.ClientID %>'),$('<%= ProcSurgeon_63.ClientID %>'),$('<%= ProcApproachGlobal_5.ClientID %>'), $('<%= OpPostOpSummary_5.ClientID %>'),$('<%= Duration_of_Pringle_min_5.ClientID %>'),$('<%= ProcPrimary_63.ClientID %>'),$('<%= ProcName_63.ClientID %>'),$('<%= ProcApproach_63.ClientID %>'),$('<%= ProcNotes_63.ClientID %>'));
    addEvent($('<%= SurgDetailRecorded.ClientID %>'),$('<%= SurgDetailDiv.ClientID %>'),$('<%= SurgDetailAbsentDiv.ClientID %>'),$('<%= OpDateText_5.ClientID %>'),$('<%= OpCaseSurgeon_5.ClientID %>'),$('<%= OpDate_5.ClientID %>'),$('<%= OpDuration_5.ClientID %>'),$('<%= OpRBC_Transfused_5.ClientID %>'),$('<%= ProcDateText_64.ClientID %>'),$('<%= ProcDate_64.ClientID %>'),$('<%= ProcSurgeon_64.ClientID %>'),$('<%= ProcApproachGlobal_5.ClientID %>'), $('<%= OpPostOpSummary_5.ClientID %>'),$('<%= Duration_of_Pringle_min_5.ClientID %>'),$('<%= ProcPrimary_64.ClientID %>'),$('<%= ProcName_64.ClientID %>'),$('<%= ProcApproach_64.ClientID %>'),$('<%= ProcNotes_64.ClientID %>'));

    function addEvent(SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,procApproachGlobalID,pringleOpSummary,Duration_of_Pringle_minID,procPrimary,procName,procApproach,procNotes)
    {  
        $(SurgDetailRecordedID).addEvent('click',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,procApproachGlobalID,pringleOpSummary,Duration_of_Pringle_minID,procPrimary,procName,procApproach,procNotes));
        $(opDateTextID).addEvent('blur',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,procApproachGlobalID,pringleOpSummary,Duration_of_Pringle_minID,procPrimary,procName,procApproach,procNotes));
        $(opSurgeonID).addEvent('blur',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,procApproachGlobalID,pringleOpSummary,Duration_of_Pringle_minID,procPrimary,procName,procApproach,procNotes));
        $(procPrimary).addEvent('click',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,procApproachGlobalID,pringleOpSummary,Duration_of_Pringle_minID,procPrimary,procName,procApproach,procNotes));
        $(procName).addEvent('blur',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,procApproachGlobalID,pringleOpSummary,Duration_of_Pringle_minID,procPrimary,procName,procApproach,procNotes));
        $(procApproachGlobalID).addEvent('blur',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,procApproachGlobalID,pringleOpSummary,Duration_of_Pringle_minID,procPrimary,procName,procApproach,procNotes));
        $(procNotes).addEvent('blur',curry(SetProcedureFields,SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,procApproachGlobalID,pringleOpSummary,Duration_of_Pringle_minID,procPrimary,procName,procApproach,procNotes));
        $(Duration_of_Pringle_minID).addEvent('blur', curry(SetProcedureFields, SurgDetailRecordedID, SurgDetailDivID, SurgDetailAbsentDivID, opDateTextID, opSurgeonID, opDateID, opDuration, opRbcTransfusedID, procDateTextID, procDateID, procSurgeonID, procApproachGlobalID, pringleOpSummary, Duration_of_Pringle_minID, procPrimary, procName, procApproach, procNotes));
      
      // show on load
      SetProcedureFields(SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,procApproachGlobalID,pringleOpSummary,Duration_of_Pringle_minID,procPrimary,procName,procApproach,procNotes); 
   }
   
    /* ]]> */
    
 	function SetProcedureFields(SurgDetailRecordedID,SurgDetailDivID,SurgDetailAbsentDivID,opDateTextID,opSurgeonID,opDateID,opDuration,opRbcTransfusedID,procDateTextID,procDateID,procSurgeonID,procApproachGlobalID,pringleOpSummary,Duration_of_Pringle_minID,procPrimary,procName,procApproach,procNotes)
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

            
            if (Duration_of_Pringle_minID.value != '')  
            {
                pringleOpSummary.value = "Duration of Pringle (min): " + Duration_of_Pringle_minID.value + " ||| ";
            }    
            else
            {
               pringleOpSummary.value = '';
           
            }      
            
   	
	        if (procPrimary.checked || procName.value != '' || procNotes.value != '')
	        {
	            if (procName.id.indexOf('_40') > -1)
                    procPrimary.checked = true;
                
                procDateTextID.value = opDateTextID.value;
                procDateID.value = opDateID.value;
                procSurgeonID.value = opSurgeonID.value;
                procApproach.value = procApproachGlobalID.value;
	        }
	        else
	        {
                procDateTextID.value = '';
                procDateID.value = '';
                procSurgeonID.value = '';
                procApproach.value = '';
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
            procApproachGlobalID.value = '';   
            Duration_of_Pringle_minID.value = '';
            procPrimary.value = '';
            procName.value = '';
            procApproach.value = '';   
            procNotes.value = '';
            pringleOpSummary.value = '';
             
        }
     
 }  
	
</script>
