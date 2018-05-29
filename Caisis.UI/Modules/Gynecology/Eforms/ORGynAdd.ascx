<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.ORGynAdd" CodeFile="ORGynAdd.ascx.cs" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">
    //procedure tables
    tableArray.NewORProcsTbl = "NewORProcsTbl";

    //pathology tables
    tableArray.GynPathFindingsTable = "GynPathFindingsTable";
    
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="ORGynAdd" /><span class="controlBoxTitle">Operative Detail</span>
<br />
<table border="0" cellspacing="0" cellpadding="5" width="750" class="eformXLargePopulatedTable">
    <tr>
        <td>
            <!--  NEW OR RECORD -->
                <table width="840" cellpadding="3" cellspacing="0" class="eformLargePopulatedTable" id="ORHtmlTbl">
                    <tr id="ORTr1">
                        <td>Surgery Date</td>
                        <td><euc:EformTextBox RecordId="1" Table="OperatingRoomDetails" Field="OpDateText" ID="OpDateText_1"
                                runat="server" Width="110px" ShowCalendar="true" CalcDate="true" TabIndex="1" />
                            <euc:EformHidden RecordId="1" Table="OperatingRoomDetails" Field="OpDate" ID="OpDate_1"
                                runat="server" /> </td>
                                
                        <td>Admit Status</td>
                        <td><euc:EformDropDownList Style="width: 130px" RecordId="1" Table="OperatingRoomDetails" 
                                Field="OpAdmitStatus" ID="OpAdmitStatus_1" LookupCode="OpAdmitStatus" runat="server" 
                                TabIndex="5" /></td>
                                
                        <td>Pre-op Summary</td>
                        <td><euc:EformTextBox RecordId="1" Table="OperatingRoomDetails" Field="OpPreOpSummary"
                                ID="OpPreOpSummary_1" runat="server" Width="110px" ShowTextEditor="true" TabIndex="9" /></td>
                                                   
                        <td valign="middle" rowspan="4"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ORHtmlTbl'));"  style="float: right; cursor: pointer;" /></td>
                    </tr>
                    
                    <tr id="ORTr2">
                        <td>Institution</td>
                        <td><euc:EformComboBox Width="110px" RecordId="1" Table="OperatingRoomDetails" Field="OpInstitution"
                                ID="OpInstitution_1" LookupCode="Institution" runat="server" DropDownWidth="200px" TabIndex="2" /></td>
                                
                        <td>Admit Date</td>
                        <td><euc:EformTextBox RecordId="1" Table="OperatingRoomDetails" Field="OpAdmitDateText"
                                ID="OpAdmitDateText_1" runat="server" Width="110px" ShowCalendar="true" CalcDate="true" TabIndex="6" />
                            <euc:EformHidden RecordId="1" Table="OperatingRoomDetails" Field="OpAdmitDate" ID="OpAdmitDate_1"
                                runat="server" /></td>
                                
                        <td>Post-op Summary</td>
                        <td><euc:EformTextBox Width="110px" RecordId="1" Table="OperatingRoomDetails" Field="OpPostOpSummary"
                                ID="OpPostOpSummary_1" ShowTextEditor="true" runat="server" TabIndex="10" /></td>
                    </tr>
                    
                    <tr id="ORTr3">
                        <td>Service</td>
                        <td><euc:EformDropDownList Style="width: 130px" RecordId="1" Table="OperatingRoomDetails" Field="OpService"
                                ID="OpService_1" LookupCode="HospitalService" runat="server" DropDownWidth="200px" TabIndex="3" /></td>
                        
                        <td>Discharge Date</td>
                        <td><euc:EformTextBox RecordId="1" Table="OperatingRoomDetails" Field="OpDischargeDateText"
                                ID="OpDischargeDateText_1" runat="server" Width="110px" ShowCalendar="true" CalcDate="true" TabIndex="7" />
                            <euc:EformHidden RecordId="1" Table="OperatingRoomDetails" Field="OpDischargeDate"
                                ID="OpDischargeDate_1" runat="server" /></td>
                        
                        <td>Data Source</td>
                        <td><euc:EformDropDownList ID="OpDataSource_1" RecordId="1" Table="OperatingRoomDetails" 
                                Field="OpDataSource" runat="server" LookupCode="DataSource" style=" width:130px" 
                                DropDownWidth="200px" TabIndex="11" /></td>
                    </tr>
                    
                    <tr id="ORTr4">
                        <td>Surgeon</td>
                        <td><euc:EformComboBox Width="110px" RecordId="1" Table="OperatingRoomDetails" Field="OpCaseSurgeon"
                                ID="OpCaseSurgeon_1" LookupCode="OpSurgeon, Disease, Gynecology" runat="server"
                                DropDownWidth="200px" TabIndex="4" /></td>
                        
                        <td>Est Blood Loss (cc)</td>
                        <td><euc:EformTextBox RecordId="1" Table="OperatingRoomDetails" Field="OpEstBloodLoss"
                                ID="OpEstBloodLoss_1" runat="server" Width="125px" TabIndex="8" /></td>
                        
                        <td>Data Quality</td>
                        <td><euc:EformDropDownList ID="OpQuality_1" RecordId="1" Table="OperatingRoomDetails" Field="OpQuality"
                                runat="server" style=" width:130px" LookupCode="DataQuality" DropDownWidth="250px" 
                                DropDownHeight="auto" TabIndex="12" /></td>
                    </tr>
                </table><br />
            <!-- END NEW OR RECORD -->
            
            <%--Start of previous Procs and New procs for New OR record --%>
            <!--Add New Procedures-->
            <table width="750" cellpadding="2" cellspacing="0" class="eformLargePopulatedTable" id="NewORProcsTbl" >
                <!-- 1st Procedure -->
                <tr style="vertical-align: top" id="NewORProcsTr1">
                    <td style="vertical-align: top"><br />
                        <span  class="controlBoxTitle">Procedure 1</span><br />
                        <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProceduresTable1">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="1" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_1" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="1" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_1" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="1" Table="Procedures" Field="ProcDate" ID="ProcDate_1" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="1" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_1" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="1" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_1" LookupCode="OpSide"  runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_1" RecordId="1" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_1"
                                     RecordId="1" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_1" RecordId="1" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="1" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_1" LookupCode="PhysicianLevel" 
                                    runat="server"  /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td align="center" colspan="2" ><euc:EformComboBox ID="ProcInstitution_1" RecordId="1" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_1" RecordId="1" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_1" RecordId="1" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px"  /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_1" RecordId="1" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px"  /></td>
                            </tr>
                        </table>
                    </td>
                    <!-- Assistants Table -->
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable1">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_1" RecordId="1" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="1" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_1" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="1" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_1" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_2" RecordId="2" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="2" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_2" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="2" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_2" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_3" RecordId="3" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="3" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_3" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="3" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_3" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_4" RecordId="4" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="4" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_4" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="4" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_4" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                    </td>                            
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr1'));"  style="float: right; cursor: pointer;" /></td>
                </tr>
                <!-- END of 1st Procedure -->
                   
                <!-- 2nd Procedure -->
                <tr style="display: none;" id="NewORProcsTr2">
                    <td style="vertical-align: top"><br />
                        <span  class="controlBoxTitle">Procedure 2</span><br />
                        <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable2">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="2" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_2" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="2" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_2" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="2" Table="Procedures" Field="ProcDate" ID="ProcDate_2" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="2" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_2" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr><td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="2" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_2" LookupCode="opSide" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_2" RecordId="2" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_2"
                                     RecordId="2" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_2" RecordId="2" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="2" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_2" LookupCode="PhysicianLevel" 
                                    runat="server"  /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center"><euc:EformComboBox ID="ProcInstitution_2" RecordId="2" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_2" RecordId="2" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_2" RecordId="2" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_2" RecordId="2" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px"  /></td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable2">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_5" RecordId="5" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="5" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_5" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"  /></td>
                                <td align="center"><euc:EformCheckBox RecordId="5" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_5" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_6" RecordId="6" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="6" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_6" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"  /></td>
                                <td align="center"><euc:EformCheckBox RecordId="6" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_6" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_7" RecordId="7" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="7" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_7" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="7" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_7" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_8" RecordId="8" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="8" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_8" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="8" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_8" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                    </td>                           
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr2'));"  style="float: right; cursor: pointer;" /></td>
                </tr>
                <!-- END of 2nd Procedure -->
                
                <!-- 3rd Procedure -->
                <tr style="display: none;" id="NewORProcsTr3">
                    <td style="vertical-align: top"><br />
                    <span  class="controlBoxTitle">Procedure 3</span><br />
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable3">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="3" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_3" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="3" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_3" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="3" Table="Procedures" Field="ProcDate" ID="ProcDate_3" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="3" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_3" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr><td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="3" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_3" LookupCode="opSide" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_3" RecordId="3" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_3"
                                     RecordId="3" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_3" RecordId="3" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="3" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_3" LookupCode="PhysicianLevel" 
                                    runat="server" /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center"><euc:EformComboBox ID="ProcInstitution_3" RecordId="3" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_3" RecordId="3" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_3" RecordId="3" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px"   /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_3" RecordId="3" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px" /></td>
                            </tr>
                        </table>
                    </td>
                    
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable3">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_9" RecordId="9" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="9" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_9" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="9" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_9" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_10" RecordId="10" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="10" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_10" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"  /></td>
                                <td align="center"><euc:EformCheckBox RecordId="10" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_10" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_11" RecordId="11" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="11" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_11" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"  /></td>
                                <td align="center"><euc:EformCheckBox RecordId="11" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_11" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_12" RecordId="12" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="12" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_12" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"  /></td>
                                <td align="center"><euc:EformCheckBox RecordId="12" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_12" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                   </td>                          
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr3'));"  style="float: right; cursor: pointer;" /></td>             
                </tr>
                <!-- END od 3rd Procedure -->
                
                <!-- 4th Procedure -->
                <tr style="display: none;" id="NewORProcsTr4">
                    <td style="vertical-align: top"><br />
                    <span  class="controlBoxTitle">Procedure 4</span><br />
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable4">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="4" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_4" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="4" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_4" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="4" Table="Procedures" Field="ProcDate" ID="ProcDate_4" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="4" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_4" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr><td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="4" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_4" LookupCode="opSide" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_4" RecordId="4" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_4"
                                     RecordId="4" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_4" RecordId="4" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="4" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_4" LookupCode="PhysicianLevel" 
                                    runat="server"  /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center"><euc:EformComboBox ID="ProcInstitution_4" RecordId="4" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_4" RecordId="4" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_4" RecordId="4" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px"  /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_4" RecordId="4" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px"   /></td>
                            </tr>
                        </table>
                    </td>
                    
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="300" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable4">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_13" RecordId="13" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="13" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_13" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="13" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_13" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_14" RecordId="14" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="14" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_14" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"  /></td>
                                <td align="center"><euc:EformCheckBox RecordId="14" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_14" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_15" RecordId="15" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="15" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_15" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="15" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_15" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_16" RecordId="16" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="16" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_16" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="16" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_16" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                    </td>                                             
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr4'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 4th Procedure -->
                
                <!-- 5th Procedure -->
                <tr style="display: none;" id="NewORProcsTr5">
                    <td style="vertical-align: top"><br />
                    <span  class="controlBoxTitle">Procedure 5</span><br />
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable5">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="5" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_5" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="5" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_5" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="5" Table="Procedures" Field="ProcDate" ID="ProcDate_5" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="5" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_5" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr><td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="5" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_5" LookupCode="opSide" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_5" RecordId="5" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_5"
                                     RecordId="5" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_5" RecordId="5" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="5" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_5" LookupCode="PhysicianLevel" 
                                    runat="server" /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center"><euc:EformComboBox ID="ProcInstitution_5" RecordId="5" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_5" RecordId="5" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_5" RecordId="5" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_5" RecordId="5" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px" /></td>
                            </tr>
                        </table>
                    </td>
                    
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="350" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable5">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_17" RecordId="17" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="17" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_17" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="17" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_17" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_18" RecordId="18" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="18" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_18" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="18" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_18" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_19" RecordId="19" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="19" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_19" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="19" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_19" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_20" RecordId="20" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="20" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_20" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="20" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_20" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon25" runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                    </td>                                             
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr5'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 5th Procedure -->
                
                <!-- 6th Procedure -->
                <tr style="display: none;" id="NewORProcsTr6">
                    <td style="vertical-align: top"><br />
                    <span  class="controlBoxTitle">Procedure 6</span><br />
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable6">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="16" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_16" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="16" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_16" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="16" Table="Procedures" Field="ProcDate" ID="ProcDate_16" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="16" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_16" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr><td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="16" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_16" LookupCode="opSide" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_16" RecordId="16" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_16"
                                     RecordId="16" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_16" RecordId="16" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="16" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_16" LookupCode="PhysicianLevel" 
                                    runat="server"  /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center"><euc:EformComboBox ID="ProcInstitution_16" RecordId="16" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_16" RecordId="16" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_16" RecordId="16" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px"  /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_16" RecordId="16" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px"  /></td>
                            </tr>
                        </table>
                    </td>
                    
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="350" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable6">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_61" RecordId="61" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="61" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_61" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="61" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_61" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_62" RecordId="62" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="62" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_62" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="62" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_62" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_63" RecordId="63" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="63" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_63" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="63" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_63" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_64" RecordId="64" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="64" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_64" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                    DropDownWidth="640px" DropDownHeight="auto" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="64" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_64" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                    </td>                                             
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr6'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 6th Procedure -->
                
                <!-- 7th Procedure -->
                <tr style="display: none;" id="NewORProcsTr7">
                    <td style="vertical-align: top"><br />
                    <span  class="controlBoxTitle">Procedure 7</span><br />
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable7">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="17" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_17" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="17" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_17" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="17" Table="Procedures" Field="ProcDate" ID="ProcDate_17" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="17" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_17" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr><td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="17" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_17" LookupCode="opSide" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_17" RecordId="17" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_17"
                                     RecordId="17" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_17" RecordId="17" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="17" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_17" LookupCode="PhysicianLevel" 
                                    runat="server"  /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center"><euc:EformComboBox ID="ProcInstitution_17" RecordId="17" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_17" RecordId="17" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_17" RecordId="17" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px"  /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_17" RecordId="17" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px"  /></td>
                            </tr>
                        </table>
                    </td>
                    
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="350" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable7">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_65" RecordId="65" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="65" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_65" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="65" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_65" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_66" RecordId="66" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="66" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_66" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="66" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_66" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_67" RecordId="67" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="67" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_67" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="67" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_67" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_68" RecordId="68" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="68" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_68" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                    DropDownWidth="680px" DropDownHeight="auto" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="68" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_68" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                    </td>                                             
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr7'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 7th Procedure -->
                
                <!-- 8th Procedure -->
                <tr style="display: none;" id="NewORProcsTr8">
                    <td style="vertical-align: top"><br />
                    <span  class="controlBoxTitle">Procedure 8</span><br />
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable8">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="18" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_18" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="18" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_18" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="18" Table="Procedures" Field="ProcDate" ID="ProcDate_18" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="18" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_18" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr><td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="18" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_18" LookupCode="opSide" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_18" RecordId="18" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_18"
                                     RecordId="18" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_18" RecordId="18" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="18" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_18" LookupCode="PhysicianLevel" 
                                    runat="server"  /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center"><euc:EformComboBox ID="ProcInstitution_18" RecordId="18" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_18" RecordId="18" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_18" RecordId="18" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px"  /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_18" RecordId="18" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px"  /></td>
                            </tr>
                        </table>
                    </td>
                    
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="350" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable8">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_69" RecordId="69" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="69" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_69" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="69" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_69" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_70" RecordId="70" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="70" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_70" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="70" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_70" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_71" RecordId="71" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="71" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_71" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="71" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_71" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_72" RecordId="72" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="72" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_72" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                    DropDownWidth="720px" DropDownHeight="auto" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="72" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_72" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                    </td>                                             
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr8'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 8th Procedure -->
                
                <!-- 9th Procedure -->
                <tr style="display: none;" id="NewORProcsTr9">
                    <td style="vertical-align: top"><br />
                    <span  class="controlBoxTitle">Procedure 9</span><br />
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable9">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="19" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_19" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="19" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_19" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="19" Table="Procedures" Field="ProcDate" ID="ProcDate_19" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="19" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_19" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr><td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="19" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_19" LookupCode="opSide" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_19" RecordId="19" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_19"
                                     RecordId="19" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_19" RecordId="19" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="19" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_19" LookupCode="PhysicianLevel" 
                                    runat="server"  /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center"><euc:EformComboBox ID="ProcInstitution_19" RecordId="19" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_19" RecordId="19" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_19" RecordId="19" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px"  /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_19" RecordId="19" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px"  /></td>
                            </tr>
                        </table>
                    </td>
                    
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="350" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable9">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_73" RecordId="73" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="73" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_73" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="73" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_73" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_74" RecordId="74" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="74" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_74" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="74" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_74" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_75" RecordId="75" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="75" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_75" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="75" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_75" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_76" RecordId="76" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="76" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_76" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                    DropDownWidth="760px" DropDownHeight="auto" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="76" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_76" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                    </td>                                             
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr9'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 9th Procedure -->
                
                <!-- 10th Procedure -->
                <tr style="display: none;" id="NewORProcsTr10">
                    <td style="vertical-align: top"><br />
                    <span  class="controlBoxTitle">Procedure 10</span><br />
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable10">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="20" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_20" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="20" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_20" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="20" Table="Procedures" Field="ProcDate" ID="ProcDate_20" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="20" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_20" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr><td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="20" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_20" LookupCode="opSide" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_20" RecordId="20" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_20"
                                     RecordId="20" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_20" RecordId="20" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="20" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_20" LookupCode="PhysicianLevel" 
                                    runat="server"  /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center"><euc:EformComboBox ID="ProcInstitution_20" RecordId="20" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_20" RecordId="20" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_20" RecordId="20" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px"  /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_20" RecordId="20" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px"  /></td>
                            </tr>
                        </table>
                    </td>
                    
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="350" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable10">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_77" RecordId="77" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="77" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_77" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="77" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_77" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_78" RecordId="78" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="78" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_78" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="78" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_78" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_79" RecordId="79" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="79" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_79" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="79" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_79" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_80" RecordId="80" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="80" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_80" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                    DropDownWidth="800px" DropDownHeight="auto" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="80" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_80" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                    </td>                                             
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr10'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 10th Procedure -->
                
                  <!-- 11th Procedure -->
                <tr style="display: none;" id="NewORProcsTr11">
                    <td style="vertical-align: top"><br />
                    <span  class="controlBoxTitle">Procedure 11</span><br />
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable11">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="21" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_21" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="21" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_21" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="21" Table="Procedures" Field="ProcDate" ID="ProcDate_21" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="21" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_21" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr><td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="21" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_21" LookupCode="opSide" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_21" RecordId="21" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_21"
                                     RecordId="21" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_21" RecordId="21" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="21" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_21" LookupCode="PhysicianLevel" 
                                    runat="server"  /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center"><euc:EformComboBox ID="ProcInstitution_21" RecordId="21" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_21" RecordId="21" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_21" RecordId="21" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px"  /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_21" RecordId="21" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px"  /></td>
                            </tr>
                        </table>
                    </td>
                    
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="350" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable11">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_81" RecordId="81" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="81" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_81" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="81" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_81" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_82" RecordId="82" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="82" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_82" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="82" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_82" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_83" RecordId="83" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="83" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_83" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="83" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_83" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_84" RecordId="84" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="84" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_84" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                    DropDownWidth="800px" DropDownHeight="auto" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="84" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_84" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                    </td>                                             
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr11'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 11th Procedure -->
                
                <!-- 12th Procedure -->
                <tr style="display: none;" id="NewORProcsTr12">
                    <td style="vertical-align: top"><br />
                    <span  class="controlBoxTitle">Procedure 12</span><br />
                    <table border="0" width="450" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="ProceduresTable12">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Primary</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Date</td>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Procedure</td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformCheckBox RecordId="22" Table="Procedures" 
                                    Field="ProcPrimary" runat="server" ID="ProcPrimary_22" Value="1"/></td>
                                <td colspan="2" align="center"><euc:EformTextBox Width="90px" RecordId="22" Table="Procedures" 
                                    Field="ProcDateText" ID="ProcDateText_22" runat="server" ShowCalendar="true" 
                                    CalcDate="true" />
                                    <euc:EformHidden RecordId="22" Table="Procedures" Field="ProcDate" ID="ProcDate_22" 
                                        runat="server" /></td>
                                <td colspan="2" align="center"><euc:EformComboBox Width="200px" RecordId="22" 
                                    Table="Procedures" Field="ProcName" ID="ProcName_22" 
                                    LookupCode="ProcName,Disease,Gynecology" runat="server" 
                                    DropDownWidth="300px"/></td>
                            </tr>
                            
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">CPT Description</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Surgeon Type</td>
                            </tr>
                            
                            <tr><td align="center"><euc:EformDropDownList Style="width: 70px" RecordId="22" Table="Procedures" 
                                    Field="ProcSide" ID="ProcSide_22" LookupCode="opSide" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="70px" ID="ProcCPT_Code_22" RecordId="22" 
                                    Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
                                <td align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_22"
                                     RecordId="22" Table="Procedures" Field="ProcCPT_Description" 
                                     runat="server" ShowTextEditor="true" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcSurgeon_22" RecordId="22" 
                                    Table="Procedures" Field="ProcSurgeon" runat="server" Width="90px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 90px" RecordId="22" Table="Procedures" 
                                    Field="ProcSurgeonType" ID="ProcSurgeonType_22" LookupCode="PhysicianLevel" 
                                    runat="server"  /></td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" align="center">Insitution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Service</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Data Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" align="center">Quality</td>
                            </tr>
                            
                            <tr>
                                <td colspan="2" align="center"><euc:EformComboBox ID="ProcInstitution_22" RecordId="22" 
                                    Table="Procedures" Field="ProcInstitution" runat="server" Width="140px" 
                                    LookupCode="Institution" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformComboBox ID="ProcService_22" RecordId="22" 
                                    Table="Procedures" Field="ProcService" runat="server" Width="90px" 
                                    LookupCode="PhSpecialty" DropDownWidth="200px" /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcDataSource_22" RecordId="22" 
                                    Table="Procedures" Field="ProcDataSource" runat="server" LookupCode="DataSource" 
                                    Style="width: 90px"  /></td>
                                <td align="center"><euc:EformDropDownList ID="ProcQuality_22" RecordId="22" 
                                    Table="Procedures" Field="ProcQuality" runat="server"  LookupCode="DataQuality" 
                                    Style="width: 90px"  /></td>
                            </tr>
                        </table>
                    </td>
                    
                    <td>
                        <br /><span style="font-weight: bold;">Assistants</span><br />
                        <table border="0" width="350" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                            id="ProcAsstsTable12">
                            <tr>
                                <td class="controlBoxDataGridHeaderFirstCol">Name</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Type</td>
                                <td class="controlBoxDataGridHeaderFirstCol">Credit</td>
                                <td class="controlBoxDataGridHeaderFirstCol"></td>
                            </tr>
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_85" RecordId="85" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="85" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_85" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="85" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_85" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_86" RecordId="86" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="86" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_86" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="86" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_86" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="center"><euc:EformComboBox ID="ProcAssistant_87" RecordId="87" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="87" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_87" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                     /></td>
                                <td align="center"><euc:EformCheckBox RecordId="87" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_87" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                            
                            <tr>
                               <td align="center"><euc:EformComboBox ID="ProcAssistant_88" RecordId="88" 
                                    Table="ProcedureAssistants" Field="ProcAssistant" runat="server" Width="100px" 
                                    LookupCode="Physician" DropDownWidth="300px" /></td>
                                <td align="center"><euc:EformDropDownList Style="width: 100px" RecordId="88" 
                                    Table="ProcedureAssistants" Field="ProcAssistantType" ID="ProcAssistantType_88" 
                                    LookupCode="PhysicianLevel,Disease,Gynecology" runat="server"
                                    DropDownWidth="800px" DropDownHeight="auto" /></td>
                                <td align="center"><euc:EformCheckBox RecordId="88" Table="ProcedureAssistants" 
                                    Field="ProcAccreditation" runat="server" ID="ProcAccreditation_88" Value="1"/></td>
                                <td align="center"><euc:EformDeleteIcon runat="server" 
                                    ToolTip="Clear all fields" Style="cursor: pointer;"/>
                                </td>
                            </tr>
                        </table>
                    </td>                                             
                    <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewORProcsTr12'));"  style="float: right; cursor: pointer;" /></td> 
                </tr>
                <!-- END of 12th Procedure -->
            </table>
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0"
                class="ClickableImage" align="center" onclick="return showFirstAdditionalRow(this,'NewORProcsTbl');" /><br />
            <br /><br />
            <%--End of New procs for New OR record --%>
            
            
            <%--Start of previous path and New path for new OR record --%>
            <table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable"
                id="NewORPathTbl" runat="server" style="display: block;">
                <tr>
                    <td>
                        <span class="controlBoxTitle">Add Pathology</span><br />
                        <br />
                        <table width="1000" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="GynPathologyTbl">
                            <tr id="PathHdrRow" runat="server">
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
                                 <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">SubSite</td>
                               
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Histology</td>
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">
                                    Secondary<br />Histology</td>
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">
                                    Data<br /> Source</td>
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">
                                    Data<br />Quality</td>
                                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
                            </tr>
                            <tr id="newORPathTr">
                                <td height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox Width="80px" Table="Pathology" RecordId="1" Field="PathDateText"
                                        ID="PathDateText_1" runat="server" ShowCalendar="true" CalcDate="true" />
                                    <euc:EformHidden Table="Pathology" Field="PathDate" RecordId="1" ID="PathDate_1"
                                        runat="server" />
                                </td>
                                  <td align="center">
                                    <euc:EformComboBox RecordId="1" Table="Pathology" Field="PathSide" ID="PathSide_1"
                                        LookupCode="OpSide" runat="server" Style="width: 70px" DropDownWidth="150px"
                                        DropDownHeight="auto" />
                                </td>
                                
                                <td align="center">
                                    <euc:EformComboBox RecordId="1" Table="Pathology" Field="PathSite" ID="PathSite_1"
                                        LookupCode="DxTarget" runat="server" Style="width: 70px" DropDownWidth="200px" />
                                </td>
                                <td align="center">
                                    <euc:EformComboBox RecordId="1" Table="Pathology" Field="PathSubsite" ID="PathSubsite_1"
                                        LookupCode="BxSubSite" runat="server" Style="width: 70px" DropDownWidth="200px" />
                                </td>
                              
                                <td align="center">
                                    <euc:EformComboBox Width="80px" Table="Pathology" Field="PathHistology" RecordId="1"
                                        ID="PathHistology_1" LookupCode="PathHistology" runat="server" 
                                        DropDownWidth="350px" />
                                </td>
                                <td align="center">
                                    <euc:EformComboBox Width="80px" Table="Pathology" Field="PathHistology2" RecordId="1"
                                        ID="PathHistology2_1" LookupCode="PathHistology" runat="server" 
                                        DropDownWidth="350px" />
                                </td>
                                <td align="center">
                                    <euc:EformDropDownList RecordId="1" Table="Pathology" Field="PathResult" ID="PathResult_1"
                                        LookupCode="BxResult,Disease,Gynecology" runat="server" Style="width: 70px" 
                                        DropDownWidth="200px" />
                                </td>
                                <td align="center">
                                    <euc:EformComboBox ID="PathInstitution_1" RecordId="1" Table="Pathology" 
                                        Field="PathInstitution" runat="server" Width="100px" LookupCode="Institution" />
                                </td>
                                <td align="center">
                                    <euc:EformDropDownList Table="Pathology" RecordId="1" Field="PathDataSource" 
                                        ID="PathDataSource_1" runat="server" LookupCode="DataSource" Style="width: 70px" 
                                        DropDownWidth="200px" />
                                </td>
                                <td align="center">
                                    <euc:EformDropDownList Table="Pathology" RecordId="1" Field="PathQuality" ID="PathQuality_1"
                                        runat="server" LookupCode="DataQuality" Style="width: 60px" DropDownWidth="200px" />
                                </td>
                                <td>
                                    <euc:EformDeleteIcon ID="EformDeleteIcon26" runat="server" ToolTip="Clear all fields"
                                        Style="cursor: pointer;" />
                                </td>
                            </tr>
                            
                            <tr><td style="height: 10px"></td></tr>
                            
                            <tr>
                                <td colspan="10">
                                    <span style="font-weight: bold;">Pathology Findings</span><br />
                                    <table width="550" cellpadding="2" cellspacing="0" class="ClinicalEformTable" 
                                        id="GynPathFindingsTable">
                                        <tr runat="server" id="Tr1">
                                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Side</td>
                                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Site</td>
                                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Subsite</td>
                                            <td class="controlBoxDataGridHeaderFirstCol" align="center">Histology</td>
                                            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                                        </tr>
                                        
                                        <tr id="newORPathFindingsTr1">
                                            <td align="center">
                                                <euc:EFormComboBox ID="PathFindSide_1" RecordId="1" Table="PathologyFinding" 
                                                    Field="PathFindSide" runat="server" Style="width: 80px" 
                                                    LookupCode="FindSide" DropDownWidth="150px" DropDownHeight="auto" /></td>
                                            <td align="center">
                                                <euc:EFormComboBox Style="width: 100px" RecordId="1" Table="PathologyFinding" 
                                                    Field="PathFindSite" ID="PathFindSite_1" LookupCode="DxTarget" 
                                                    runat="server" DropDownWidth="300px" DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EFormComboBox RecordId="1" Table="PathologyFinding" 
                                                    Field="PathFindSubsite" runat="server" ID="PathFindSubsite_1" 
                                                    LookupCode="DxTarget" DropDownWidth="300px" DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EformComboBox RecordId="1" Table="PathologyFinding" 
                                                    Field="PathFindHistology" runat="server" ID="PathFindHistology_1" 
                                                    LookupCode="PathHistology" DropDownWidth="300px"
                                                    DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EformDeleteIcon ID="EformDeleteIcon27" runat="server" 
                                                    ToolTip="Clear all fields" Style="cursor: pointer;" /></td>
                                        </tr>
                                        
                                        <tr style="display: none;" id="newORPathFindingsTr2">
                                            <td align="center">
                                                <euc:EFormComboBox ID="PathFindSide_2" RecordId="2" Table="PathologyFinding" 
                                                    Field="PathFindSide" runat="server" Style="width: 80px" 
                                                    LookupCode="FindSide" DropDownWidth="150px" DropDownHeight="auto" /></td>
                                            <td align="center">
                                                <euc:EFormComboBox Style="width: 100px" RecordId="2" Table="PathologyFinding" 
                                                    Field="PathFindSite" ID="PathFindSite_2" LookupCode="DxTarget" 
                                                    runat="server" DropDownWidth="300px" DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EFormComboBox RecordId="2" Table="PathologyFinding" 
                                                    Field="PathFindSubsite" runat="server" ID="PathFindSubsite_2" 
                                                    LookupCode="DxTarget" DropDownWidth="300px" DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EformComboBox RecordId="2" Table="PathologyFinding" 
                                                    Field="PathFindHistology" runat="server" ID="PathFindHistology_2" 
                                                    LookupCode="PathHistology" DropDownWidth="300px" 
                                                    DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EformDeleteIcon ID="EformDeleteIcon28" runat="server" 
                                                    ToolTip="Clear all fields" Style="cursor: pointer;" /></td>
                                        </tr>
                                        <tr style="display: none;" id="newORPathFindingsTr3">
                                            <td align="center">
                                                <euc:EFormComboBox ID="PathFindSide_3" RecordId="3" Table="PathologyFinding" 
                                                    Field="PathFindSide" runat="server" Style="width: 80px" 
                                                    LookupCode="FindSide" DropDownWidth="150px" DropDownHeight="auto" /></td>
                                            <td align="center">
                                                <euc:EFormComboBox Style="width: 100px" RecordId="3" Table="PathologyFinding" 
                                                    Field="PathFindSite" ID="PathFindSite_3" LookupCode="DxTarget" 
                                                    runat="server" DropDownWidth="300px" DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EFormComboBox RecordId="3" Table="PathologyFinding" 
                                                    Field="PathFindSubsite" runat="server" ID="PathFindSubsite_3" 
                                                    LookupCode="DxTarget" DropDownWidth="300px" DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EformComboBox RecordId="3" Table="PathologyFinding" 
                                                    Field="PathFindHistology" runat="server" ID="PathFindHistology_3" 
                                                    LookupCode="PathHistology" DropDownWidth="300px" 
                                                    DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EformDeleteIcon ID="EformDeleteIcon29" runat="server" 
                                                    ToolTip="Clear all fields" Style="cursor: pointer;" /></td>
                                        </tr>
                                        <tr style="display: none;" id="newORPathFindingsTr4">
                                            <td align="center">
                                                <euc:EFormComboBox ID="PathFindSide_4" RecordId="4" Table="PathologyFinding" 
                                                    Field="PathFindSide" runat="server" Style="width: 80px" 
                                                    LookupCode="FindSide" DropDownWidth="150px" DropDownHeight="auto" /></td>
                                            <td align="center">
                                                <euc:EFormComboBox Style="width: 100px" RecordId="4" Table="PathologyFinding" 
                                                    Field="PathFindSite" ID="PathFindSite_4" LookupCode="DxTarget" 
                                                    runat="server" DropDownWidth="300px" DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EFormComboBox RecordId="4" Table="PathologyFinding" 
                                                    Field="PathFindSubsite" runat="server" ID="PathFindSubsite_4" 
                                                    LookupCode="DxTarget" DropDownWidth="300px" DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EformComboBox RecordId="4" Table="PathologyFinding" 
                                                    Field="PathFindHistology" runat="server" ID="PathFindHistology_4" 
                                                    LookupCode="PathHistology" DropDownWidth="300px" 
                                                    DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EformDeleteIcon ID="EformDeleteIcon30" runat="server" 
                                                    ToolTip="Clear all fields" Style="cursor: pointer;" /></td>
                                        </tr>
                                        <tr style="display: none;" id="newORPathFindingsTr5">
                                            <td align="center">
                                                <euc:EFormComboBox ID="PathFindSide_5" RecordId="5" Table="PathologyFinding" 
                                                    Field="PathFindSide" runat="server" Style="width: 80px" 
                                                    LookupCode="FindSide" DropDownWidth="150px" DropDownHeight="auto" /></td>
                                            <td align="center">
                                                <euc:EFormComboBox Style="width: 100px" RecordId="5" Table="PathologyFinding" 
                                                    Field="PathFindSite" ID="PathFindSite_5" LookupCode="DxTarget" 
                                                    runat="server" DropDownWidth="300px" DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EFormComboBox RecordId="5" Table="PathologyFinding" 
                                                    Field="PathFindSubsite" runat="server" ID="PathFindSubsite_5" 
                                                    LookupCode="DxTarget" DropDownWidth="300px" DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EformComboBox RecordId="5" Table="PathologyFinding" 
                                                    Field="PathFindHistology" runat="server" ID="PathFindHistology_5" 
                                                    LookupCode="PathHistology" DropDownWidth="300px" 
                                                    DropDownHeight="130px" /></td>
                                            <td align="center">
                                                <euc:EformDeleteIcon ID="EformDeleteIcon31" runat="server" 
                                                    ToolTip="Clear all fields" Style="cursor: pointer;" /></td>
                                        </tr>
                                    </table>
                                    <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0"
                                        class="ClickableImage" align="center" onclick="return showFirstAdditionalRow(this,'GynPathFindingsTable');" /><br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <%--End of previous path and New path for new OR record --%>
        </td>
    </tr>
</table>

<script type="text/javascript">
    //Adds events to OR controls
    function addNewGynOREvents(NewGynOpDate,NewGynOpSurgeon,NewGynOpInst,NewGynOpService,NewGynOpSource,NewGynOpQlty)
    { 
        $(NewGynOpDate).addEvent('blur',curry(NewGynORAutoPopulates,NewGynOpDate,NewGynOpSurgeon,NewGynOpInst,NewGynOpService,NewGynOpSource,NewGynOpQlty));
        $(NewGynOpSurgeon).addEvent('blur',curry(NewGynORAutoPopulates,NewGynOpDate,NewGynOpSurgeon,NewGynOpInst,NewGynOpService,NewGynOpSource,NewGynOpQlty));
   }

   addNewGynOREvents($('<%= OpDateText_1.ClientID %>'),$('<%= OpCaseSurgeon_1.ClientID %>'),$('<%= OpInstitution_1.ClientID %>'),$('<%= OpService_1.ClientID %>'),$('<%= OpDataSource_1.ClientID %>'),$('<%= OpQuality_1.ClientID %>'));
    
    function NewGynORAutoPopulates(NewGynOpDate,NewGynOpSurgeon,NewGynOpInst,NewGynOpService,NewGynOpSource,NewGynOpQlty)
    {
        if (NewGynOpDate.value != '' || NewGynOpSurgeon.value != '')
        {
            if (NewGynOpInst.value.length < 1) NewGynOpInst.value = 'Memorial Sloan Kettering Cancer Center';
            if (NewGynOpService.value.length < 1) NewGynOpService.value = 'Gynecology';
            if (NewGynOpSource.value.length < 1) NewGynOpSource.value = 'Medical Record';
            if (NewGynOpQlty.value.length < 1) NewGynOpQlty.value = 'STD';
        }
//        else
//        { 
//            NewGynOpInst.value = '';
//            NewGynOpService.value = '';
//            NewGynOpSource.value = '';
//            NewGynOpQlty.value = '';
//        }
       }
    
    
     
    
    //Adds events to procedure controls
    function addNewGynProcEvents1(NewGynProcName,NewGynProcInst,NewGynProcService,NewGynProcQlty,NewGynProcSource)
    { 
        $(NewGynProcName).addEvent('blur',curry(NewGynProcAutoPopulates1,NewGynProcName,NewGynProcInst,NewGynProcService,NewGynProcQlty,NewGynProcSource));
    }

    addNewGynProcEvents1($('<%= ProcName_1.ClientID %>'),$('<%= ProcInstitution_1.ClientID %>'),$('<%= ProcService_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'),$('<%= ProcDataSource_1.ClientID %>'));
    
    function NewGynProcAutoPopulates1(NewGynProcName,NewGynProcInst,NewGynProcService,NewGynProcQlty,NewGynProcSource)
    {
        if (NewGynProcName.value != '')
        {
            NewGynProcInst.value = 'Memorial Sloan Kettering Cancer Center';
            NewGynProcService.value = 'Gynecology';
            NewGynProcSource.value = 'Medical Record';
            NewGynProcQlty.value = 'STD';
        }
        else
        { 
            NewGynProcInst.value = '';
            NewGynProcService.value = '';
            NewGynProcSource.value = '';
            NewGynProcQlty.value = '';
        }
    }
    
    //updates  first proc record values (for new OR) to all other procedures only if procname is not null and values exists
    function addNewGynProcEvents2(NewGynProcInst1,NewGynProcService1,NewGynprocSurgeon1,NewGynProcSurgType1,NewGynProcQlty1,NewGynProcSource1,NewGynProcPrimary1,NewGynProcDateText1,NewGynProcDate1,NewGynProcName2,NewGynProcInst2,NewGynProcService2,NewGynprocSurgeon2,NewGynProcSurgType2,NewGynProcQlty2,NewGynProcSource2,NewGynProcPrimary2,NewGynProcDateText2,NewGynProcDate2)
    { 
        $(NewGynProcName2).addEvent('blur',curry(NewGynProcAutoPopulates2,NewGynProcInst1,NewGynProcService1,NewGynprocSurgeon1,NewGynProcSurgType1,NewGynProcQlty1,NewGynProcSource1,NewGynProcPrimary1,NewGynProcDateText1,NewGynProcDate1,NewGynProcName2,NewGynProcInst2,NewGynProcService2,NewGynprocSurgeon2,NewGynProcSurgType2,NewGynProcQlty2,NewGynProcSource2,NewGynProcPrimary2,NewGynProcDateText2,NewGynProcDate2));
        $(NewGynProcInst1).addEvent('blur',curry(NewGynProcAutoPopulates2,NewGynProcInst1,NewGynProcService1,NewGynprocSurgeon1,NewGynProcSurgType1,NewGynProcQlty1,NewGynProcSource1,NewGynProcPrimary1,NewGynProcDateText1,NewGynProcDate1,NewGynProcName2,NewGynProcInst2,NewGynProcService2,NewGynprocSurgeon2,NewGynProcSurgType2,NewGynProcQlty2,NewGynProcSource2,NewGynProcPrimary2,NewGynProcDateText2,NewGynProcDate2));
        $(NewGynProcService1).addEvent('blur',curry(NewGynProcAutoPopulates2,NewGynProcInst1,NewGynProcService1,NewGynprocSurgeon1,NewGynProcSurgType1,NewGynProcQlty1,NewGynProcSource1,NewGynProcPrimary1,NewGynProcDateText1,NewGynProcDate1,NewGynProcName2,NewGynProcInst2,NewGynProcService2,NewGynprocSurgeon2,NewGynProcSurgType2,NewGynProcQlty2,NewGynProcSource2,NewGynProcPrimary2,NewGynProcDateText2,NewGynProcDate2));
        $(NewGynprocSurgeon1).addEvent('blur',curry(NewGynProcAutoPopulates2,NewGynProcInst1,NewGynProcService1,NewGynprocSurgeon1,NewGynProcSurgType1,NewGynProcQlty1,NewGynProcSource1,NewGynProcPrimary1,NewGynProcDateText1,NewGynProcDate1,NewGynProcName2,NewGynProcInst2,NewGynProcService2,NewGynprocSurgeon2,NewGynProcSurgType2,NewGynProcQlty2,NewGynProcSource2,NewGynProcPrimary2,NewGynProcDateText2,NewGynProcDate2));
        $(NewGynProcSurgType1).addEvent('blur',curry(NewGynProcAutoPopulates2,NewGynProcInst1,NewGynProcService1,NewGynprocSurgeon1,NewGynProcSurgType1,NewGynProcQlty1,NewGynProcSource1,NewGynProcPrimary1,NewGynProcDateText1,NewGynProcDate1,NewGynProcName2,NewGynProcInst2,NewGynProcService2,NewGynprocSurgeon2,NewGynProcSurgType2,NewGynProcQlty2,NewGynProcSource2,NewGynProcPrimary2,NewGynProcDateText2,NewGynProcDate2));
        $(NewGynProcQlty1).addEvent('blur',curry(NewGynProcAutoPopulates2,NewGynProcInst1,NewGynProcService1,NewGynprocSurgeon1,NewGynProcSurgType1,NewGynProcQlty1,NewGynProcSource1,NewGynProcPrimary1,NewGynProcDateText1,NewGynProcDate1,NewGynProcName2,NewGynProcInst2,NewGynProcService2,NewGynprocSurgeon2,NewGynProcSurgType2,NewGynProcQlty2,NewGynProcSource2,NewGynProcPrimary2,NewGynProcDateText2,NewGynProcDate2));
        $(NewGynProcSource1).addEvent('blur',curry(NewGynProcAutoPopulates2,NewGynProcInst1,NewGynProcService1,NewGynprocSurgeon1,NewGynProcSurgType1,NewGynProcQlty1,NewGynProcSource1,NewGynProcPrimary1,NewGynProcDateText1,NewGynProcDate1,NewGynProcName2,NewGynProcInst2,NewGynProcService2,NewGynprocSurgeon2,NewGynProcSurgType2,NewGynProcQlty2,NewGynProcSource2,NewGynProcPrimary2,NewGynProcDateText2,NewGynProcDate2));
    }

    addNewGynProcEvents2($('<%= ProcInstitution_1.ClientID %>'),$('<%= ProcService_1.ClientID %>'),$('<%= ProcSurgeon_1.ClientID %>'),$('<%= ProcSurgeonType_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'),$('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcName_2.ClientID %>'),$('<%= ProcInstitution_2.ClientID %>'),$('<%= ProcService_2.ClientID %>'),$('<%= ProcSurgeon_2.ClientID %>'),$('<%= ProcSurgeonType_2.ClientID %>'),$('<%= ProcQuality_2.ClientID %>'),$('<%= ProcDataSource_2.ClientID %>'),$('<%= ProcPrimary_2.ClientID %>'),$('<%= ProcDateText_2.ClientID %>'),$('<%= ProcDate_2.ClientID %>'));    
    addNewGynProcEvents2($('<%= ProcInstitution_1.ClientID %>'),$('<%= ProcService_1.ClientID %>'),$('<%= ProcSurgeon_1.ClientID %>'),$('<%= ProcSurgeonType_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'),$('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcName_3.ClientID %>'),$('<%= ProcInstitution_3.ClientID %>'),$('<%= ProcService_3.ClientID %>'),$('<%= ProcSurgeon_3.ClientID %>'),$('<%= ProcSurgeonType_3.ClientID %>'),$('<%= ProcQuality_3.ClientID %>'),$('<%= ProcDataSource_3.ClientID %>'),$('<%= ProcPrimary_3.ClientID %>'),$('<%= ProcDateText_3.ClientID %>'),$('<%= ProcDate_3.ClientID %>'));
    addNewGynProcEvents2($('<%= ProcInstitution_1.ClientID %>'),$('<%= ProcService_1.ClientID %>'),$('<%= ProcSurgeon_1.ClientID %>'),$('<%= ProcSurgeonType_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'),$('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcName_4.ClientID %>'),$('<%= ProcInstitution_4.ClientID %>'),$('<%= ProcService_4.ClientID %>'),$('<%= ProcSurgeon_4.ClientID %>'),$('<%= ProcSurgeonType_4.ClientID %>'),$('<%= ProcQuality_4.ClientID %>'),$('<%= ProcDataSource_4.ClientID %>'),$('<%= ProcPrimary_4.ClientID %>'),$('<%= ProcDateText_4.ClientID %>'),$('<%= ProcDate_4.ClientID %>'));
    addNewGynProcEvents2($('<%= ProcInstitution_1.ClientID %>'),$('<%= ProcService_1.ClientID %>'),$('<%= ProcSurgeon_1.ClientID %>'),$('<%= ProcSurgeonType_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'),$('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcName_5.ClientID %>'),$('<%= ProcInstitution_5.ClientID %>'),$('<%= ProcService_5.ClientID %>'),$('<%= ProcSurgeon_5.ClientID %>'),$('<%= ProcSurgeonType_5.ClientID %>'),$('<%= ProcQuality_5.ClientID %>'),$('<%= ProcDataSource_5.ClientID %>'),$('<%= ProcPrimary_5.ClientID %>'),$('<%= ProcDateText_5.ClientID %>'),$('<%= ProcDate_5.ClientID %>'));
    addNewGynProcEvents2($('<%= ProcInstitution_1.ClientID %>'),$('<%= ProcService_1.ClientID %>'),$('<%= ProcSurgeon_1.ClientID %>'),$('<%= ProcSurgeonType_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'),$('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= ProcInstitution_16.ClientID %>'),$('<%= ProcService_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcSurgeonType_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcDataSource_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'));
    addNewGynProcEvents2($('<%= ProcInstitution_1.ClientID %>'),$('<%= ProcService_1.ClientID %>'),$('<%= ProcSurgeon_1.ClientID %>'),$('<%= ProcSurgeonType_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'),$('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcInstitution_17.ClientID %>'),$('<%= ProcService_17.ClientID %>'),$('<%= ProcSurgeon_17.ClientID %>'),$('<%= ProcSurgeonType_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcDataSource_17.ClientID %>'),$('<%= ProcPrimary_17.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'));
    addNewGynProcEvents2($('<%= ProcInstitution_1.ClientID %>'),$('<%= ProcService_1.ClientID %>'),$('<%= ProcSurgeon_1.ClientID %>'),$('<%= ProcSurgeonType_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'),$('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcName_18.ClientID %>'),$('<%= ProcInstitution_18.ClientID %>'),$('<%= ProcService_18.ClientID %>'),$('<%= ProcSurgeon_18.ClientID %>'),$('<%= ProcSurgeonType_18.ClientID %>'),$('<%= ProcQuality_18.ClientID %>'),$('<%= ProcDataSource_18.ClientID %>'),$('<%= ProcPrimary_18.ClientID %>'),$('<%= ProcDateText_18.ClientID %>'),$('<%= ProcDate_18.ClientID %>'));
    addNewGynProcEvents2($('<%= ProcInstitution_1.ClientID %>'),$('<%= ProcService_1.ClientID %>'),$('<%= ProcSurgeon_1.ClientID %>'),$('<%= ProcSurgeonType_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'),$('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcName_19.ClientID %>'),$('<%= ProcInstitution_19.ClientID %>'),$('<%= ProcService_19.ClientID %>'),$('<%= ProcSurgeon_19.ClientID %>'),$('<%= ProcSurgeonType_19.ClientID %>'),$('<%= ProcQuality_19.ClientID %>'),$('<%= ProcDataSource_19.ClientID %>'),$('<%= ProcPrimary_19.ClientID %>'),$('<%= ProcDateText_19.ClientID %>'),$('<%= ProcDate_19.ClientID %>'));
    addNewGynProcEvents2($('<%= ProcInstitution_1.ClientID %>'), $('<%= ProcService_1.ClientID %>'), $('<%= ProcSurgeon_1.ClientID %>'), $('<%= ProcSurgeonType_1.ClientID %>'), $('<%= ProcQuality_1.ClientID %>'), $('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'), $('<%= ProcName_20.ClientID %>'), $('<%= ProcInstitution_20.ClientID %>'), $('<%= ProcService_20.ClientID %>'), $('<%= ProcSurgeon_20.ClientID %>'), $('<%= ProcSurgeonType_20.ClientID %>'), $('<%= ProcQuality_20.ClientID %>'), $('<%= ProcDataSource_20.ClientID %>'),$('<%= ProcPrimary_20.ClientID %>'),$('<%= ProcDateText_20.ClientID %>'),$('<%= ProcDate_20.ClientID %>'));
    addNewGynProcEvents2($('<%= ProcInstitution_1.ClientID %>'), $('<%= ProcService_1.ClientID %>'), $('<%= ProcSurgeon_1.ClientID %>'), $('<%= ProcSurgeonType_1.ClientID %>'), $('<%= ProcQuality_1.ClientID %>'), $('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'), $('<%= ProcName_21.ClientID %>'), $('<%= ProcInstitution_21.ClientID %>'), $('<%= ProcService_21.ClientID %>'), $('<%= ProcSurgeon_21.ClientID %>'), $('<%= ProcSurgeonType_21.ClientID %>'), $('<%= ProcQuality_21.ClientID %>'), $('<%= ProcDataSource_21.ClientID %>'),$('<%= ProcPrimary_21.ClientID %>'),$('<%= ProcDateText_21.ClientID %>'),$('<%= ProcDate_21.ClientID %>'));
    addNewGynProcEvents2($('<%= ProcInstitution_1.ClientID %>'), $('<%= ProcService_1.ClientID %>'), $('<%= ProcSurgeon_1.ClientID %>'), $('<%= ProcSurgeonType_1.ClientID %>'), $('<%= ProcQuality_1.ClientID %>'), $('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'), $('<%= ProcName_22.ClientID %>'), $('<%= ProcInstitution_22.ClientID %>'), $('<%= ProcService_22.ClientID %>'), $('<%= ProcSurgeon_22.ClientID %>'), $('<%= ProcSurgeonType_22.ClientID %>'), $('<%= ProcQuality_22.ClientID %>'), $('<%= ProcDataSource_22.ClientID %>'),$('<%= ProcPrimary_22.ClientID %>'),$('<%= ProcDateText_22.ClientID %>'),$('<%= ProcDate_22.ClientID %>'));
  
    
    
    function NewGynProcAutoPopulates2(NewGynProcInst1,NewGynProcService1,NewGynprocSurgeon1,NewGynProcSurgType1,NewGynProcQlty1,NewGynProcSource1,NewGynProcPrimary1,NewGynProcDateText1,NewGynProcDate1,NewGynProcName2,NewGynProcInst2,NewGynProcService2,NewGynprocSurgeon2,NewGynProcSurgType2,NewGynProcQlty2,NewGynProcSource2,NewGynProcPrimary2,NewGynProcDateText2,NewGynProcDate2)
    {
        if (NewGynProcName2.value != '')
        {
            if(NewGynProcInst1.value != '' || NewGynProcService1.value != '' || NewGynprocSurgeon1.value != '' || NewGynProcSurgType1.value != '' || NewGynProcQlty1.value != '' || NewGynProcSource1.value != '')
            {
                NewGynProcInst2.value = NewGynProcInst1.value;
                NewGynProcService2.value = NewGynProcService1.value;
                NewGynprocSurgeon2.value = NewGynprocSurgeon1.value;
                NewGynProcSurgType2.value = NewGynProcSurgType1.value;
                NewGynProcSource2.value = NewGynProcSource1.value;
                NewGynProcQlty2.value = NewGynProcQlty1.value;
                
                NewGynProcPrimary2.checked = NewGynProcPrimary1.checked;
                NewGynProcDateText2.value = NewGynProcDateText1.value;
                NewGynProcDate2.value = NewGynProcDate1.value;
            }
        }
        else
        { 
            NewGynProcInst2.value = '';
            NewGynProcService2.value = '';
            NewGynprocSurgeon2.value = '';
            NewGynProcSurgType2.value = '';
            NewGynProcSource2.value = '';
            NewGynProcQlty2.value = '';
            
            NewGynProcPrimary2.checked = false;
            NewGynProcDateText2.value = '';
            NewGynProcDate2.value = '';
        }
    }
    
    //updates first proc assistant values to all other procedures only if procname is not null and values exists
    function addNewGynProcAsstEvents(NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4)
    { 
        //change values on procname change
        $(NewGynProcName2).addEvent('blur',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        
        //change values on Asst name change        
        $(NewGynProcAsst1_1).addEvent('blur',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        $(NewGynProcAsst1_2).addEvent('blur',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        $(NewGynProcAsst1_3).addEvent('blur',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        $(NewGynProcAsst1_4).addEvent('blur',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        
        //change values on Asst type change
        $(NewGynProcAsstType1_1).addEvent('blur',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        $(NewGynProcAsstType1_2).addEvent('blur',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        $(NewGynProcAsstType1_3).addEvent('blur',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        $(NewGynProcAsstType1_4).addEvent('blur',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        
        //change values on Asst accreditation change
        $(NewGynProcAsstAccr1_1).addEvent('click',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        $(NewGynProcAsstAccr1_2).addEvent('click',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        $(NewGynProcAsstAccr1_3).addEvent('click',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        $(NewGynProcAsstAccr1_4).addEvent('click',curry(NewGynProcAsstAutoPopulates,NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4));
        
        
    }

    addNewGynProcAsstEvents($('<%= ProcAssistant_1.ClientID %>'),$('<%= ProcAssistantType_1.ClientID %>'),$('<%= ProcAccreditation_1.ClientID %>'),$('<%= ProcAssistant_2.ClientID %>'),$('<%= ProcAssistantType_2.ClientID %>'),$('<%= ProcAccreditation_2.ClientID %>'),$('<%= ProcAssistant_3.ClientID %>'),$('<%= ProcAssistantType_3.ClientID %>'),$('<%= ProcAccreditation_3.ClientID %>'),$('<%= ProcAssistant_4.ClientID %>'),$('<%= ProcAssistantType_4.ClientID %>'),$('<%= ProcAccreditation_4.ClientID %>'), $('<%= ProcName_2.ClientID %>'), $('<%= ProcAssistant_5.ClientID %>'),$('<%= ProcAssistantType_5.ClientID %>'),$('<%= ProcAccreditation_5.ClientID %>'),$('<%= ProcAssistant_6.ClientID %>'),$('<%= ProcAssistantType_6.ClientID %>'),$('<%= ProcAccreditation_6.ClientID %>'),$('<%= ProcAssistant_7.ClientID %>'),$('<%= ProcAssistantType_7.ClientID %>'),$('<%= ProcAccreditation_7.ClientID %>'),$('<%= ProcAssistant_8.ClientID %>'),$('<%= ProcAssistantType_8.ClientID %>'),$('<%= ProcAccreditation_8.ClientID %>')); 
    addNewGynProcAsstEvents($('<%= ProcAssistant_1.ClientID %>'),$('<%= ProcAssistantType_1.ClientID %>'),$('<%= ProcAccreditation_1.ClientID %>'),$('<%= ProcAssistant_2.ClientID %>'),$('<%= ProcAssistantType_2.ClientID %>'),$('<%= ProcAccreditation_2.ClientID %>'),$('<%= ProcAssistant_3.ClientID %>'),$('<%= ProcAssistantType_3.ClientID %>'),$('<%= ProcAccreditation_3.ClientID %>'),$('<%= ProcAssistant_4.ClientID %>'),$('<%= ProcAssistantType_4.ClientID %>'),$('<%= ProcAccreditation_4.ClientID %>'), $('<%= ProcName_3.ClientID %>'), $('<%= ProcAssistant_9.ClientID %>'),$('<%= ProcAssistantType_9.ClientID %>'),$('<%= ProcAccreditation_9.ClientID %>'),$('<%= ProcAssistant_10.ClientID %>'),$('<%= ProcAssistantType_10.ClientID %>'),$('<%= ProcAccreditation_10.ClientID %>'),$('<%= ProcAssistant_11.ClientID %>'),$('<%= ProcAssistantType_11.ClientID %>'),$('<%= ProcAccreditation_11.ClientID %>'),$('<%= ProcAssistant_12.ClientID %>'),$('<%= ProcAssistantType_12.ClientID %>'),$('<%= ProcAccreditation_12.ClientID %>')); 
    addNewGynProcAsstEvents($('<%= ProcAssistant_1.ClientID %>'),$('<%= ProcAssistantType_1.ClientID %>'),$('<%= ProcAccreditation_1.ClientID %>'),$('<%= ProcAssistant_2.ClientID %>'),$('<%= ProcAssistantType_2.ClientID %>'),$('<%= ProcAccreditation_2.ClientID %>'),$('<%= ProcAssistant_3.ClientID %>'),$('<%= ProcAssistantType_3.ClientID %>'),$('<%= ProcAccreditation_3.ClientID %>'),$('<%= ProcAssistant_4.ClientID %>'),$('<%= ProcAssistantType_4.ClientID %>'),$('<%= ProcAccreditation_4.ClientID %>'), $('<%= ProcName_4.ClientID %>'), $('<%= ProcAssistant_13.ClientID %>'),$('<%= ProcAssistantType_13.ClientID %>'),$('<%= ProcAccreditation_13.ClientID %>'),$('<%= ProcAssistant_14.ClientID %>'),$('<%= ProcAssistantType_14.ClientID %>'),$('<%= ProcAccreditation_14.ClientID %>'),$('<%= ProcAssistant_15.ClientID %>'),$('<%= ProcAssistantType_15.ClientID %>'),$('<%= ProcAccreditation_15.ClientID %>'),$('<%= ProcAssistant_16.ClientID %>'),$('<%= ProcAssistantType_16.ClientID %>'),$('<%= ProcAccreditation_16.ClientID %>')); 
    addNewGynProcAsstEvents($('<%= ProcAssistant_1.ClientID %>'),$('<%= ProcAssistantType_1.ClientID %>'),$('<%= ProcAccreditation_1.ClientID %>'),$('<%= ProcAssistant_2.ClientID %>'),$('<%= ProcAssistantType_2.ClientID %>'),$('<%= ProcAccreditation_2.ClientID %>'),$('<%= ProcAssistant_3.ClientID %>'),$('<%= ProcAssistantType_3.ClientID %>'),$('<%= ProcAccreditation_3.ClientID %>'),$('<%= ProcAssistant_4.ClientID %>'),$('<%= ProcAssistantType_4.ClientID %>'),$('<%= ProcAccreditation_4.ClientID %>'), $('<%= ProcName_5.ClientID %>'), $('<%= ProcAssistant_17.ClientID %>'),$('<%= ProcAssistantType_17.ClientID %>'),$('<%= ProcAccreditation_17.ClientID %>'),$('<%= ProcAssistant_18.ClientID %>'),$('<%= ProcAssistantType_18.ClientID %>'),$('<%= ProcAccreditation_18.ClientID %>'),$('<%= ProcAssistant_19.ClientID %>'),$('<%= ProcAssistantType_19.ClientID %>'),$('<%= ProcAccreditation_19.ClientID %>'),$('<%= ProcAssistant_20.ClientID %>'),$('<%= ProcAssistantType_20.ClientID %>'),$('<%= ProcAccreditation_20.ClientID %>')); 
    addNewGynProcAsstEvents($('<%= ProcAssistant_1.ClientID %>'),$('<%= ProcAssistantType_1.ClientID %>'),$('<%= ProcAccreditation_1.ClientID %>'),$('<%= ProcAssistant_2.ClientID %>'),$('<%= ProcAssistantType_2.ClientID %>'),$('<%= ProcAccreditation_2.ClientID %>'),$('<%= ProcAssistant_3.ClientID %>'),$('<%= ProcAssistantType_3.ClientID %>'),$('<%= ProcAccreditation_3.ClientID %>'),$('<%= ProcAssistant_4.ClientID %>'),$('<%= ProcAssistantType_4.ClientID %>'),$('<%= ProcAccreditation_4.ClientID %>'), $('<%= ProcName_16.ClientID %>'), $('<%= ProcAssistant_61.ClientID %>'),$('<%= ProcAssistantType_61.ClientID %>'),$('<%= ProcAccreditation_61.ClientID %>'),$('<%= ProcAssistant_62.ClientID %>'),$('<%= ProcAssistantType_62.ClientID %>'),$('<%= ProcAccreditation_62.ClientID %>'),$('<%= ProcAssistant_63.ClientID %>'),$('<%= ProcAssistantType_63.ClientID %>'),$('<%= ProcAccreditation_63.ClientID %>'),$('<%= ProcAssistant_64.ClientID %>'),$('<%= ProcAssistantType_64.ClientID %>'),$('<%= ProcAccreditation_64.ClientID %>')); 
    addNewGynProcAsstEvents($('<%= ProcAssistant_1.ClientID %>'),$('<%= ProcAssistantType_1.ClientID %>'),$('<%= ProcAccreditation_1.ClientID %>'),$('<%= ProcAssistant_2.ClientID %>'),$('<%= ProcAssistantType_2.ClientID %>'),$('<%= ProcAccreditation_2.ClientID %>'),$('<%= ProcAssistant_3.ClientID %>'),$('<%= ProcAssistantType_3.ClientID %>'),$('<%= ProcAccreditation_3.ClientID %>'),$('<%= ProcAssistant_4.ClientID %>'),$('<%= ProcAssistantType_4.ClientID %>'),$('<%= ProcAccreditation_4.ClientID %>'), $('<%= ProcName_17.ClientID %>'), $('<%= ProcAssistant_65.ClientID %>'),$('<%= ProcAssistantType_65.ClientID %>'),$('<%= ProcAccreditation_65.ClientID %>'),$('<%= ProcAssistant_66.ClientID %>'),$('<%= ProcAssistantType_66.ClientID %>'),$('<%= ProcAccreditation_66.ClientID %>'),$('<%= ProcAssistant_67.ClientID %>'),$('<%= ProcAssistantType_67.ClientID %>'),$('<%= ProcAccreditation_67.ClientID %>'),$('<%= ProcAssistant_68.ClientID %>'),$('<%= ProcAssistantType_68.ClientID %>'),$('<%= ProcAccreditation_68.ClientID %>')); 
    addNewGynProcAsstEvents($('<%= ProcAssistant_1.ClientID %>'),$('<%= ProcAssistantType_1.ClientID %>'),$('<%= ProcAccreditation_1.ClientID %>'),$('<%= ProcAssistant_2.ClientID %>'),$('<%= ProcAssistantType_2.ClientID %>'),$('<%= ProcAccreditation_2.ClientID %>'),$('<%= ProcAssistant_3.ClientID %>'),$('<%= ProcAssistantType_3.ClientID %>'),$('<%= ProcAccreditation_3.ClientID %>'),$('<%= ProcAssistant_4.ClientID %>'),$('<%= ProcAssistantType_4.ClientID %>'),$('<%= ProcAccreditation_4.ClientID %>'), $('<%= ProcName_18.ClientID %>'), $('<%= ProcAssistant_69.ClientID %>'),$('<%= ProcAssistantType_69.ClientID %>'),$('<%= ProcAccreditation_69.ClientID %>'),$('<%= ProcAssistant_70.ClientID %>'),$('<%= ProcAssistantType_70.ClientID %>'),$('<%= ProcAccreditation_70.ClientID %>'),$('<%= ProcAssistant_71.ClientID %>'),$('<%= ProcAssistantType_71.ClientID %>'),$('<%= ProcAccreditation_71.ClientID %>'),$('<%= ProcAssistant_72.ClientID %>'),$('<%= ProcAssistantType_72.ClientID %>'),$('<%= ProcAccreditation_72.ClientID %>')); 
    addNewGynProcAsstEvents($('<%= ProcAssistant_1.ClientID %>'),$('<%= ProcAssistantType_1.ClientID %>'),$('<%= ProcAccreditation_1.ClientID %>'),$('<%= ProcAssistant_2.ClientID %>'),$('<%= ProcAssistantType_2.ClientID %>'),$('<%= ProcAccreditation_2.ClientID %>'),$('<%= ProcAssistant_3.ClientID %>'),$('<%= ProcAssistantType_3.ClientID %>'),$('<%= ProcAccreditation_3.ClientID %>'),$('<%= ProcAssistant_4.ClientID %>'),$('<%= ProcAssistantType_4.ClientID %>'),$('<%= ProcAccreditation_4.ClientID %>'), $('<%= ProcName_19.ClientID %>'), $('<%= ProcAssistant_73.ClientID %>'),$('<%= ProcAssistantType_73.ClientID %>'),$('<%= ProcAccreditation_73.ClientID %>'),$('<%= ProcAssistant_74.ClientID %>'),$('<%= ProcAssistantType_74.ClientID %>'),$('<%= ProcAccreditation_74.ClientID %>'),$('<%= ProcAssistant_75.ClientID %>'),$('<%= ProcAssistantType_75.ClientID %>'),$('<%= ProcAccreditation_75.ClientID %>'),$('<%= ProcAssistant_76.ClientID %>'),$('<%= ProcAssistantType_76.ClientID %>'),$('<%= ProcAccreditation_76.ClientID %>')); 
    addNewGynProcAsstEvents($('<%= ProcAssistant_1.ClientID %>'),$('<%= ProcAssistantType_1.ClientID %>'),$('<%= ProcAccreditation_1.ClientID %>'),$('<%= ProcAssistant_2.ClientID %>'),$('<%= ProcAssistantType_2.ClientID %>'),$('<%= ProcAccreditation_2.ClientID %>'),$('<%= ProcAssistant_3.ClientID %>'),$('<%= ProcAssistantType_3.ClientID %>'),$('<%= ProcAccreditation_3.ClientID %>'),$('<%= ProcAssistant_4.ClientID %>'),$('<%= ProcAssistantType_4.ClientID %>'),$('<%= ProcAccreditation_4.ClientID %>'), $('<%= ProcName_20.ClientID %>'), $('<%= ProcAssistant_77.ClientID %>'),$('<%= ProcAssistantType_77.ClientID %>'),$('<%= ProcAccreditation_77.ClientID %>'),$('<%= ProcAssistant_78.ClientID %>'),$('<%= ProcAssistantType_78.ClientID %>'),$('<%= ProcAccreditation_78.ClientID %>'),$('<%= ProcAssistant_79.ClientID %>'),$('<%= ProcAssistantType_79.ClientID %>'),$('<%= ProcAccreditation_79.ClientID %>'),$('<%= ProcAssistant_80.ClientID %>'),$('<%= ProcAssistantType_80.ClientID %>'),$('<%= ProcAccreditation_80.ClientID %>'));
    addNewGynProcAsstEvents($('<%= ProcAssistant_1.ClientID %>'), $('<%= ProcAssistantType_1.ClientID %>'), $('<%= ProcAccreditation_1.ClientID %>'), $('<%= ProcAssistant_2.ClientID %>'), $('<%= ProcAssistantType_2.ClientID %>'), $('<%= ProcAccreditation_2.ClientID %>'), $('<%= ProcAssistant_3.ClientID %>'), $('<%= ProcAssistantType_3.ClientID %>'), $('<%= ProcAccreditation_3.ClientID %>'), $('<%= ProcAssistant_4.ClientID %>'), $('<%= ProcAssistantType_4.ClientID %>'), $('<%= ProcAccreditation_4.ClientID %>'), $('<%= ProcName_21.ClientID %>'), $('<%= ProcAssistant_81.ClientID %>'), $('<%= ProcAssistantType_81.ClientID %>'), $('<%= ProcAccreditation_81.ClientID %>'), $('<%= ProcAssistant_82.ClientID %>'), $('<%= ProcAssistantType_82.ClientID %>'), $('<%= ProcAccreditation_82.ClientID %>'), $('<%= ProcAssistant_83.ClientID %>'), $('<%= ProcAssistantType_83.ClientID %>'), $('<%= ProcAccreditation_83.ClientID %>'), $('<%= ProcAssistant_84.ClientID %>'), $('<%= ProcAssistantType_84.ClientID %>'), $('<%= ProcAccreditation_84.ClientID %>'));
    addNewGynProcAsstEvents($('<%= ProcAssistant_1.ClientID %>'), $('<%= ProcAssistantType_1.ClientID %>'), $('<%= ProcAccreditation_1.ClientID %>'), $('<%= ProcAssistant_2.ClientID %>'), $('<%= ProcAssistantType_2.ClientID %>'), $('<%= ProcAccreditation_2.ClientID %>'), $('<%= ProcAssistant_3.ClientID %>'), $('<%= ProcAssistantType_3.ClientID %>'), $('<%= ProcAccreditation_3.ClientID %>'), $('<%= ProcAssistant_4.ClientID %>'), $('<%= ProcAssistantType_4.ClientID %>'), $('<%= ProcAccreditation_4.ClientID %>'), $('<%= ProcName_22.ClientID %>'), $('<%= ProcAssistant_85.ClientID %>'), $('<%= ProcAssistantType_85.ClientID %>'), $('<%= ProcAccreditation_85.ClientID %>'), $('<%= ProcAssistant_86.ClientID %>'), $('<%= ProcAssistantType_86.ClientID %>'), $('<%= ProcAccreditation_86.ClientID %>'), $('<%= ProcAssistant_87.ClientID %>'), $('<%= ProcAssistantType_87.ClientID %>'), $('<%= ProcAccreditation_87.ClientID %>'), $('<%= ProcAssistant_88.ClientID %>'), $('<%= ProcAssistantType_88.ClientID %>'), $('<%= ProcAccreditation_88.ClientID %>')); 
   
    
    function NewGynProcAsstAutoPopulates(NewGynProcAsst1_1,NewGynProcAsstType1_1,NewGynProcAsstAccr1_1, NewGynProcAsst1_2,NewGynProcAsstType1_2,NewGynProcAsstAccr1_2, NewGynProcAsst1_3,NewGynProcAsstType1_3,NewGynProcAsstAccr1_3, NewGynProcAsst1_4,NewGynProcAsstType1_4,NewGynProcAsstAccr1_4, NewGynProcName2, NewGynProcAsst2_1,NewGynProcAsstType2_1,NewGynProcAsstAccr2_1, NewGynProcAsst2_2,NewGynProcAsstType2_2,NewGynProcAsstAccr2_2, NewGynProcAsst2_3,NewGynProcAsstType2_3,NewGynProcAsstAccr2_3, NewGynProcAsst2_4,NewGynProcAsstType2_4,NewGynProcAsstAccr2_4)
    {
        if (NewGynProcName2.value != '')
        {
            if(NewGynProcAsst1_1.value != '')
            {
                NewGynProcAsst2_1.value = NewGynProcAsst1_1.value;
                NewGynProcAsstType2_1.value = NewGynProcAsstType1_1.value;
                if(NewGynProcAsstAccr1_1.checked)
                {
                    NewGynProcAsstAccr2_1.checked=true;
                }
            }
            else
            {
                NewGynProcAsstType1_1.value = '';
                NewGynProcAsstAccr1_1.checked=false; 
                NewGynProcAsst2_1.value = '';
                NewGynProcAsstType2_1.value = '';
                NewGynProcAsstAccr2_1.checked=false;   
            }
            
            if(NewGynProcAsst1_2.value != '')
            {                
                NewGynProcAsst2_2.value = NewGynProcAsst1_2.value;
                NewGynProcAsstType2_2.value = NewGynProcAsstType1_2.value;
                if(NewGynProcAsstAccr1_2.checked)
                {
                    NewGynProcAsstAccr2_2.checked=true;
                }
            }
            else
            {
                NewGynProcAsstType1_2.value = '';
                NewGynProcAsstAccr1_2.checked=false;
                NewGynProcAsst2_2.value = '';
                NewGynProcAsstType2_2.value = '';
                NewGynProcAsstAccr2_2.checked=false;
            }
            
            if(NewGynProcAsst1_3.value != '')
            {                
                NewGynProcAsst2_3.value = NewGynProcAsst1_3.value;
                NewGynProcAsstType2_3.value = NewGynProcAsstType1_3.value;
                if(NewGynProcAsstAccr1_3.checked)
                {
                    NewGynProcAsstAccr2_3.checked=true;
                }
            }
            else
            {
                NewGynProcAsstType1_3.value = '';
                NewGynProcAsstAccr1_3.checked=false;  
                NewGynProcAsst2_3.value = '';
                NewGynProcAsstType2_3.value = '';
                NewGynProcAsstAccr2_3.checked=false;                
            }
            
            if(NewGynProcAsst1_4.value != '')
            {                
                NewGynProcAsst2_4.value = NewGynProcAsst1_4.value;
                NewGynProcAsstType2_4.value = NewGynProcAsstType1_4.value;
                if(NewGynProcAsstAccr1_4.checked)
                {
                    NewGynProcAsstAccr2_4.checked=true;
                }
            }
            else
            {
                NewGynProcAsstType1_4.value = '';
                NewGynProcAsstAccr1_4.checked=false;  
                NewGynProcAsst2_4.value = '';
                NewGynProcAsstType2_4.value = '';
                NewGynProcAsstAccr2_4.checked=false;
            }
        }
        else
        { 
            NewGynProcAsst2_1.value = '';
            NewGynProcAsstType2_1.value = '';
            NewGynProcAsstAccr2_1.checked=false;
            
            NewGynProcAsst2_2.value = '';
            NewGynProcAsstType2_2.value = '';
            NewGynProcAsstAccr2_2.checked=false;
            
            NewGynProcAsst2_3.value = '';
            NewGynProcAsstType2_3.value = '';
            NewGynProcAsstAccr2_3.checked=false;
            
            NewGynProcAsst2_4.value = '';
            NewGynProcAsstType2_4.value = '';
            NewGynProcAsstAccr2_4.checked=false;
        }
    }
    
    
    //Adds events to path controls
    function addNewGynPathEvents(NewGynPathDt,NewGynPath,NewGynPathInst,NewGynPathSource,NewGynPathQlty)
    { 
        $(NewGynPathDt).addEvent('blur',curry(NewGynPathAutoPopulates,NewGynPathDt,NewGynPath,NewGynPathInst,NewGynPathSource,NewGynPathQlty));
        $(NewGynPath).addEvent('blur',curry(NewGynPathAutoPopulates,NewGynPathDt,NewGynPath,NewGynPathInst,NewGynPathSource,NewGynPathQlty));
    }

    addNewGynPathEvents($('<%= PathDateText_1.ClientID %>'),$('<%= PathHistology_1.ClientID %>'),$('<%= PathInstitution_1.ClientID %>'),$('<%= PathDataSource_1.ClientID %>'),$('<%= PathQuality_1.ClientID %>'));
    
    
    function NewGynPathAutoPopulates(NewGynPathDt,NewGynPath,NewGynPathInst,NewGynPathSource,NewGynPathQlty)
    {
        if (NewGynPathDt.value != '' || NewGynPath.value != '')
        {
            NewGynPathInst.value = 'Memorial Sloan Kettering Cancer Center';
            NewGynPathSource.value = 'Medical Record';
            NewGynPathQlty.value = 'STD';
        }
        else
        { 
            NewGynPathInst.value = '';
            NewGynPathSource.value = '';
            NewGynPathQlty.value = '';
        }
    }    
</script>

