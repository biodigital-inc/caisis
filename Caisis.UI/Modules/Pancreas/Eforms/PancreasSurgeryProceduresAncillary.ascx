<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryProceduresAncillary" CodeFile="PancreasSurgeryProceduresAncillary.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.ProceduresAdditionalHtmlTable = "ProceduresAdditionalHtmlTable";
	tableArray.ProceduresAdditionalHtmlTable1 = "ProceduresAdditionalHtmlTable1";
	tableArray.ProceduresAdditionalHtmlTable2 = "ProceduresAdditionalHtmlTable2";
	tableArray.ProceduresAdditionalHtmlTable3 = "ProceduresAdditionalHtmlTable3";
	tableArray.ProceduresAdditionalHtmlTable4 = "ProceduresAdditionalHtmlTable4";

</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="PancreasSurgeryProceduresAncillary" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Additional Operations"></asp:Label><br/>

<table  cellpadding="8" cellspacing="0" border="0" class="ClinicalEformTable" id="ProceduresAdditionalHtmlTable" > 

    <tr>
        <td valign="top">
            
            <strong>Operative Detail</strong>
            <table  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OperativeDetailHTMLTable1">
              <tr>
			        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Date of Operation</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgeon</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Op Duration (min) </td>
             </tr>
         
             <tr>
             
                <td style="white-space: nowrap;">
                    <euc:EformTextBox Width="100px"  RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_2" Runat="server" ShowCalendar="true" CalcDate="true"/>
				    <euc:EformHidden  RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate_2"     Runat="server"/></td>

                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_2" LookupCode="Physician,Disease,@DiseaseView" Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformTextBox  Width="60px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_2" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false" /></td>

              </tr>
                <tr>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op In Time</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op Out Time </td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Urine Output</td>
              </tr>
              <tr>
                 <td>
                    <euc:EformTextBox  Width="60px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpInTime" ID="OpInTime_2" Runat="server"  /></td>

                 <td >
                    <euc:EformTextBox  Width="60px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpOutTime" ID="OpOutTime_2" Runat="server"  /> </td>
                <td>
                    <euc:EformTextBox  Width="60px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpUrineOutput" ID="OpUrineOutput_2" Runat="server"   /> </td>

              </tr> 
               <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Est Blood Loss<br />(cc)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;RBC Transfused<br />(units) </td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Crystalloid</td>
              </tr>
              <tr>
                 <td>
                    <euc:EformTextBox  Width="60px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpEstBloodLoss" ID="OpEstBloodLoss_2" Runat="server" TabIndex="8"  ShowCalendar="false" CalcDate="false" /></td>

                <td >
                    <euc:EformTextBox  Width="60px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused_2" Runat="server" TabIndex="10" /> </td>
                <td>
                    <euc:EformTextBox  Width="60px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpCrystalloid" ID="OpCrystalloid_2" Runat="server" TabIndex="10"  /> </td>
              </tr> 
               <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Colloid</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;</td>
              </tr>
              <tr>
                <td>
                    <euc:EformTextBox  Width="100px" RecordId="2"  TABLE="OperatingRoomDetails" FIELD="OpColloid" ID="OpColloid_2" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false"  /></td>

              </tr> 
  
            
            </table>
        </td>
        
         <td valign="top">
             <strong>Procedures</strong>
            <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresAdditionalHtmlTable1" >

                  <tr>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                  </tr>
                  <tr >
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="40" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_40" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="40" ParentRecordId="2"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_40"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="40"  ParentRecordId="2"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_40"   Runat="server" />
                         

                        <euc:EformComboBox Width="100px" RecordId="40" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_40"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="auto" Runat="server" TabIndex="2" />
                        </td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="40" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_40"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
                   <tr style="display: none;">
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="41" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_41" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="41" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_41"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="41"  ParentRecordId="2"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_41"   Runat="server" />
                         

                        <euc:EformComboBox Width="100px" RecordId="41" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcName"     ID="ProcName_41"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        </td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="41" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_41"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
                   <tr style="display: none;">
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="42" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_42" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="42" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_42"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="42" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_42"   Runat="server" />
                         
                        <euc:EformComboBox Width="100px" RecordId="42" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_42"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        </td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="42" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_42"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
                  <tr style="display: none;">
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="43" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_43" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="43" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_43"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="43" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_43"   Runat="server" />
                         
                         
                        <euc:EformComboBox Width="100px" RecordId="43" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_43"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        </td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="43" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_43"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>

                  <tr style="display: none;">
                    <td style="white-space: nowrap;">
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="44" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_44" Runat="server" />
                         <euc:EformTextBox  Width="1px" style="display: none;" RecordId="44" ParentRecordId="2"    TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_44"     Runat="server"/>
                         <euc:EformTextBox Width="1px" style="display: none;" RecordId="44"  ParentRecordId="2"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_44"   Runat="server" />
                         
                        <euc:EformComboBox Width="100px" RecordId="44" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_44"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                        </td>

                   <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="100px" RecordId="44" ParentRecordId="2"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_44"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                  </tr>
            </table>
            <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresAdditionalHtmlTable1');" />
               
          </td>
    </tr>

    <tr style="display: none;">
            <td valign="top">
                
                <strong>Operative Detail</strong>
                <table  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OperativeDetailHTMLTable2">
                  <tr>
			            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Date of Operation</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgeon</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Op Duration (min) </td>
                 </tr>
             
                 <tr>
                 
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox Width="100px"  RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_3" Runat="server" ShowCalendar="true" CalcDate="true"/>
				        <euc:EformHidden  RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate_3"     Runat="server"/></td>

                    <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_3" LookupCode="Physician,Disease,@DiseaseView" Runat="server" /></td>
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="60px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_3" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false" /></td>

                  </tr>
                <tr>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op In Time</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op Out Time </td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Urine Output</td>
              </tr>
              <tr>
                 <td>
                    <euc:EformTextBox  Width="60px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpInTime" ID="OpInTime_3" Runat="server"  /></td>

                 <td >
                    <euc:EformTextBox  Width="60px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpOutTime" ID="OpOutTime_3" Runat="server"  /> </td>
                <td>
                    <euc:EformTextBox  Width="60px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpUrineOutput" ID="OpUrineOutput_3" Runat="server"   /> </td>

              </tr> 
                   <tr>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Est Blood Loss<br />(cc)</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;RBC Transfused<br />(units) </td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Crystalloid</td>
                  </tr>
                  <tr>
                     <td>
                        <euc:EformTextBox  Width="60px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpEstBloodLoss" ID="OpEstBloodLoss_3" Runat="server" TabIndex="8"  ShowCalendar="false" CalcDate="false" /></td>

                    <td >
                        <euc:EformTextBox  Width="60px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused_3" Runat="server" TabIndex="10" /> </td>
                    <td>
                        <euc:EformTextBox  Width="60px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpCrystalloid" ID="OpCrystalloid_3" Runat="server" TabIndex="10"  /> </td>
                  </tr> 
                   <tr>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Colloid</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;</td>
                  </tr>
                  <tr>
                    <td>
                        <euc:EformTextBox  Width="100px" RecordId="3"  TABLE="OperatingRoomDetails" FIELD="OpColloid" ID="OpColloid_3" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false"  /></td>

                  </tr> 
      
                
                </table>
            </td>
            
             <td valign="top">
                 <strong>Procedures</strong>
                <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresAdditionalHtmlTable2" >

                      <tr>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                      </tr>
                      <tr >
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="45" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_45" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="45"  ParentRecordId="3"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_45"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="45"  ParentRecordId="3"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_45"   Runat="server" />
                             

                            <euc:EformComboBox Width="100px" RecordId="45" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_45"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="45" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_45"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="46"  ParentRecordId="3"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_46" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="46" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_46"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="46"  ParentRecordId="3"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_46"   Runat="server" />
                             

                            <euc:EformComboBox Width="100px" RecordId="46" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_46"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="46" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_46"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="47"  ParentRecordId="3"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_47" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="47" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_47"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="47"  ParentRecordId="3"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_47"   Runat="server" />
                             
                            <euc:EformComboBox Width="100px" RecordId="47" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_47"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="47" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_47"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="48" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_48" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="48" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_48"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="48"  ParentRecordId="3"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_48"   Runat="server" />
                             
                             
                            <euc:EformComboBox Width="100px" RecordId="48" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcName"     ID="ProcName_48"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="48" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_48"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>

                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="49" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_49" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="49" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_49"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="49" ParentRecordId="3"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_49"   Runat="server" />
                             
                            <euc:EformComboBox Width="100px" RecordId="49" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_49"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="49" ParentRecordId="3"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_49"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                </table>
                <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresAdditionalHtmlTable2');" />
                   
              </td>
        </tr>    

    <tr style="display: none;">
            <td valign="top">
                
                <strong>Operative Detail</strong>
                <table  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OperativeDetailHTMLTable3">
                  <tr>
			            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Date of Operation</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgeon</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Op Duration (min) </td>
                 </tr>
             
                 <tr>
                 
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox Width="100px"  RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_4" Runat="server" ShowCalendar="true" CalcDate="true"/>
				        <euc:EformHidden  RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate_4"     Runat="server"/></td>

                    <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_4" LookupCode="Physician,Disease,@DiseaseView" Runat="server" /></td>
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="60px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_4" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false" /></td>

                  </tr>
                    <tr>
                       <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op In Time</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op Out Time </td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Urine Output</td>
                  </tr>
                  <tr>
                     <td>
                        <euc:EformTextBox  Width="60px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpInTime" ID="OpInTime_4" Runat="server"  /></td>

                     <td >
                        <euc:EformTextBox  Width="60px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpOutTime" ID="OpOutTime_4" Runat="server"  /> </td>
                    <td>
                        <euc:EformTextBox  Width="60px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpUrineOutput" ID="OpUrineOutput_4" Runat="server"   /> </td>

                  </tr> 
                   <tr>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Est Blood Loss<br />(cc)</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;RBC Transfused<br />(units) </td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Crystalloid</td>
                  </tr>
                  <tr>
                     <td>
                        <euc:EformTextBox  Width="60px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpEstBloodLoss" ID="OpEstBloodLoss_4" Runat="server" TabIndex="8"  ShowCalendar="false" CalcDate="false" /></td>

                    <td >
                        <euc:EformTextBox  Width="60px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused_4" Runat="server" TabIndex="10" /> </td>
                    <td>
                        <euc:EformTextBox  Width="60px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpCrystalloid" ID="OpCrystalloid_4" Runat="server" TabIndex="10"  /> </td>
                  </tr> 
                   <tr>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Colloid</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;</td>
                  </tr>
                  <tr>
                    <td>
                        <euc:EformTextBox  Width="100px" RecordId="4"  TABLE="OperatingRoomDetails" FIELD="OpColloid" ID="OpColloid_4" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false"  /></td>

                  </tr> 
      
                
                </table>
            </td>
            
             <td valign="top">
                 <strong>Procedures</strong>
                <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresAdditionalHtmlTable3" >

                      <tr>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                      </tr>
                      <tr >
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="50" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_50" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="50" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_50"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="50"  ParentRecordId="4"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_50"   Runat="server" />
                             

                            <euc:EformComboBox Width="100px" RecordId="50" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_50"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="50" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_50"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="51" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_51" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="51" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_51"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="51" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_51"   Runat="server" />
                             

                            <euc:EformComboBox Width="100px" RecordId="51" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_51"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="51" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_51"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="52" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_52" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="52" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_52"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="52"  ParentRecordId="4"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_52"   Runat="server" />
                             
                            <euc:EformComboBox Width="100px" RecordId="52" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_52"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="52" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_52"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="53"  ParentRecordId="4"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_53" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="53" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_53"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="53"  ParentRecordId="4"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_53"   Runat="server" />
                             
                             
                            <euc:EformComboBox Width="100px" RecordId="53" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_53"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="53" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_53"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>

                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="54" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_54" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="54" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_54"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="54" ParentRecordId="4"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_54"   Runat="server" />
                             
                            <euc:EformComboBox Width="100px" RecordId="54" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_54"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="54" ParentRecordId="4"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_54"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                </table>
                <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresAdditionalHtmlTable3');" />
                   
              </td>
        </tr> 

    <tr style="display: none;">
            <td valign="top">
                
                <strong>Operative Detail</strong>
                <table  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OperativeDetailHTMLTable4">
                  <tr>
			            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Date of Operation</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgeon</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Op Duration (min) </td>
                 </tr>
             
                 <tr>
                 
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox Width="100px"  RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_5" Runat="server" ShowCalendar="true" CalcDate="true"/>
				        <euc:EformHidden  RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate_5"     Runat="server"/></td>

                    <td style="white-space: nowrap;">
                        <euc:EformComboBox DropDownWidth="auto"  Width="100px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_5" LookupCode="Physician,Disease,@DiseaseView" Runat="server" /></td>
                    <td style="white-space: nowrap;">
                        <euc:EformTextBox  Width="60px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_5" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false" /></td>

                  </tr>
                <tr>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op In Time</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op Out Time </td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Urine Output</td>
              </tr>
              <tr>
                 <td>
                    <euc:EformTextBox  Width="60px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpInTime" ID="OpInTime_5" Runat="server"  /></td>

                 <td >
                    <euc:EformTextBox  Width="60px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpOutTime" ID="OpOutTime_5" Runat="server"  /> </td>
                <td>
                    <euc:EformTextBox  Width="60px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpUrineOutput" ID="OpUrineOutput_5" Runat="server"   /> </td>

              </tr> 
                   <tr>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Est Blood Loss<br />(cc)</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;RBC Transfused<br />(units) </td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Crystalloid</td>
                  </tr>
                  <tr>
                     <td>
                        <euc:EformTextBox  Width="60px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpEstBloodLoss" ID="OpEstBloodLoss_5" Runat="server" TabIndex="8"  ShowCalendar="false" CalcDate="false" /></td>

                    <td >
                        <euc:EformTextBox  Width="60px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="OpRBC_Transfused_5" Runat="server" TabIndex="10" /> </td>
                    <td>
                        <euc:EformTextBox  Width="60px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpCrystalloid" ID="OpCrystalloid_5" Runat="server" TabIndex="10"  /> </td>
                  </tr> 
                   <tr>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Colloid</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;</td>
                        <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;</td>
                  </tr>
                  <tr>
                    <td>
                        <euc:EformTextBox  Width="100px" RecordId="5"  TABLE="OperatingRoomDetails" FIELD="OpColloid" ID="OpColloid_5" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false"  /></td>

                  </tr> 
      
                
                </table>
            </td>
            
             <td valign="top">
                 <strong>Procedures</strong>
                <table  width="300"  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProceduresAdditionalHtmlTable4" >

                      <tr>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgery Type</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                      </tr>
                      <tr >
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="55" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_55" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="55" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_55"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="55"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_55"   Runat="server" />
                             

                            <euc:EformComboBox Width="100px" RecordId="55" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_55"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="55" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_55"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="56" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_56" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="56" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_56"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="56"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_56"   Runat="server" />
                             

                            <euc:EformComboBox Width="100px" RecordId="56" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_56"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="56" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_56"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="57"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_57" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="57" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_57"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="57"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_57"   Runat="server" />
                             
                            <euc:EformComboBox Width="100px" RecordId="57"  ParentRecordId="5" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_57"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="57" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_57"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="58" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_58" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="58" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_58"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="58"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_58"   Runat="server" />
                             
                             
                            <euc:EformComboBox Width="100px" RecordId="58" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_58"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="58" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_58"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>

                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="59"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_59" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="59" ParentRecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_59"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="59"  ParentRecordId="5"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_59"   Runat="server" />
                             
                            <euc:EformComboBox Width="100px" RecordId="59" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_59"     LookupCode="ProcName,Disease,@DiseaseView" DropDownWidth="200px" Runat="server" TabIndex="2" />
                            </td>

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="59" ParentRecordId="5"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_59"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                </table>
                <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresAdditionalHtmlTable4');" />
                   
              </td>
        </tr>         
        
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresAdditionalHtmlTable');" />

<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo
    addAbsentEvent($('<%= OpDateText_2.ClientID %>'),$('<%= OpCaseSurgeon_2.ClientID %>'),$('<%= ProcDateText_40.ClientID %>'),$('<%= ProcDate_40.ClientID %>'),$('<%= ProcSurgeon_40.ClientID %>'),$('<%= ProcName_40.ClientID %>'),$('<%= ProcNotes_40.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_2.ClientID %>'),$('<%= OpCaseSurgeon_2.ClientID %>'),$('<%= ProcDateText_41.ClientID %>'),$('<%= ProcDate_41.ClientID %>'),$('<%= ProcSurgeon_41.ClientID %>'),$('<%= ProcName_41.ClientID %>'),$('<%= ProcNotes_41.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_2.ClientID %>'),$('<%= OpCaseSurgeon_2.ClientID %>'),$('<%= ProcDateText_42.ClientID %>'),$('<%= ProcDate_42.ClientID %>'),$('<%= ProcSurgeon_42.ClientID %>'),$('<%= ProcName_42.ClientID %>'),$('<%= ProcNotes_42.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_2.ClientID %>'),$('<%= OpCaseSurgeon_2.ClientID %>'),$('<%= ProcDateText_43.ClientID %>'),$('<%= ProcDate_43.ClientID %>'),$('<%= ProcSurgeon_43.ClientID %>'),$('<%= ProcName_43.ClientID %>'),$('<%= ProcNotes_43.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_2.ClientID %>'),$('<%= OpCaseSurgeon_2.ClientID %>'),$('<%= ProcDateText_44.ClientID %>'),$('<%= ProcDate_44.ClientID %>'),$('<%= ProcSurgeon_44.ClientID %>'),$('<%= ProcName_44.ClientID %>'),$('<%= ProcNotes_44.ClientID %>'));

    addAbsentEvent($('<%= OpDateText_3.ClientID %>'),$('<%= OpCaseSurgeon_3.ClientID %>'),$('<%= ProcDateText_45.ClientID %>'),$('<%= ProcDate_45.ClientID %>'),$('<%= ProcSurgeon_45.ClientID %>'),$('<%= ProcName_45.ClientID %>'),$('<%= ProcNotes_45.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_3.ClientID %>'),$('<%= OpCaseSurgeon_3.ClientID %>'),$('<%= ProcDateText_46.ClientID %>'),$('<%= ProcDate_46.ClientID %>'),$('<%= ProcSurgeon_46.ClientID %>'),$('<%= ProcName_46.ClientID %>'),$('<%= ProcNotes_46.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_3.ClientID %>'),$('<%= OpCaseSurgeon_3.ClientID %>'),$('<%= ProcDateText_47.ClientID %>'),$('<%= ProcDate_47.ClientID %>'),$('<%= ProcSurgeon_47.ClientID %>'),$('<%= ProcName_47.ClientID %>'),$('<%= ProcNotes_47.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_3.ClientID %>'),$('<%= OpCaseSurgeon_3.ClientID %>'),$('<%= ProcDateText_48.ClientID %>'),$('<%= ProcDate_48.ClientID %>'),$('<%= ProcSurgeon_48.ClientID %>'),$('<%= ProcName_48.ClientID %>'),$('<%= ProcNotes_48.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_3.ClientID %>'),$('<%= OpCaseSurgeon_3.ClientID %>'),$('<%= ProcDateText_49.ClientID %>'),$('<%= ProcDate_49.ClientID %>'),$('<%= ProcSurgeon_49.ClientID %>'),$('<%= ProcName_49.ClientID %>'),$('<%= ProcNotes_49.ClientID %>'));

    addAbsentEvent($('<%= OpDateText_4.ClientID %>'),$('<%= OpCaseSurgeon_4.ClientID %>'),$('<%= ProcDateText_50.ClientID %>'),$('<%= ProcDate_50.ClientID %>'),$('<%= ProcSurgeon_50.ClientID %>'),$('<%= ProcName_50.ClientID %>'),$('<%= ProcNotes_50.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_4.ClientID %>'),$('<%= OpCaseSurgeon_4.ClientID %>'),$('<%= ProcDateText_51.ClientID %>'),$('<%= ProcDate_51.ClientID %>'),$('<%= ProcSurgeon_51.ClientID %>'),$('<%= ProcName_51.ClientID %>'),$('<%= ProcNotes_51.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_4.ClientID %>'),$('<%= OpCaseSurgeon_4.ClientID %>'),$('<%= ProcDateText_52.ClientID %>'),$('<%= ProcDate_52.ClientID %>'),$('<%= ProcSurgeon_52.ClientID %>'),$('<%= ProcName_52.ClientID %>'),$('<%= ProcNotes_52.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_4.ClientID %>'),$('<%= OpCaseSurgeon_4.ClientID %>'),$('<%= ProcDateText_53.ClientID %>'),$('<%= ProcDate_53.ClientID %>'),$('<%= ProcSurgeon_53.ClientID %>'),$('<%= ProcName_53.ClientID %>'),$('<%= ProcNotes_53.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_4.ClientID %>'),$('<%= OpCaseSurgeon_4.ClientID %>'),$('<%= ProcDateText_54.ClientID %>'),$('<%= ProcDate_54.ClientID %>'),$('<%= ProcSurgeon_54.ClientID %>'),$('<%= ProcName_54.ClientID %>'),$('<%= ProcNotes_54.ClientID %>'));

    addAbsentEvent($('<%= OpDateText_5.ClientID %>'),$('<%= OpCaseSurgeon_5.ClientID %>'),$('<%= ProcDateText_55.ClientID %>'),$('<%= ProcDate_55.ClientID %>'),$('<%= ProcSurgeon_55.ClientID %>'),$('<%= ProcName_55.ClientID %>'),$('<%= ProcNotes_55.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_5.ClientID %>'),$('<%= OpCaseSurgeon_5.ClientID %>'),$('<%= ProcDateText_56.ClientID %>'),$('<%= ProcDate_56.ClientID %>'),$('<%= ProcSurgeon_56.ClientID %>'),$('<%= ProcName_56.ClientID %>'),$('<%= ProcNotes_56.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_5.ClientID %>'),$('<%= OpCaseSurgeon_5.ClientID %>'),$('<%= ProcDateText_57.ClientID %>'),$('<%= ProcDate_57.ClientID %>'),$('<%= ProcSurgeon_57.ClientID %>'),$('<%= ProcName_57.ClientID %>'),$('<%= ProcNotes_57.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_5.ClientID %>'),$('<%= OpCaseSurgeon_5.ClientID %>'),$('<%= ProcDateText_58.ClientID %>'),$('<%= ProcDate_58.ClientID %>'),$('<%= ProcSurgeon_58.ClientID %>'),$('<%= ProcName_58.ClientID %>'),$('<%= ProcNotes_58.ClientID %>'));
    addAbsentEvent($('<%= OpDateText_5.ClientID %>'),$('<%= OpCaseSurgeon_5.ClientID %>'),$('<%= ProcDateText_59.ClientID %>'),$('<%= ProcDate_59.ClientID %>'),$('<%= ProcSurgeon_59.ClientID %>'),$('<%= ProcName_59.ClientID %>'),$('<%= ProcNotes_59.ClientID %>'));


    function addAbsentEvent(opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,procName,procNotes)
    {  
        $(opDateTextID).addEvent('blur',curry(SetProcedureFields,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,procName,procNotes));
        $(opSurgeonID).addEvent('blur',curry(SetProcedureFields,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,procName,procNotes));
        $(procName).addEvent('blur',curry(SetProcedureFields,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,procName,procNotes));
        $(procNotes).addEvent('blur',curry(SetProcedureFields,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,procName,procNotes));
   }
      
    /* ]]> */
    
 	function SetProcedureFields(opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,procName,procNotes)
	{ 
	    if (procName.value != '' || procNotes.value != '')
	    {
            procDateTextID.value = opDateTextID.value;
            procDateID.value = opDateTextID.value;
            procSurgeonID.value = opSurgeonID.value;

	    }
	    else
	    {
            procDateTextID.value = '';
            procDateID.value = '';
            procSurgeonID.value = '';
	    }
	}  

</script>

