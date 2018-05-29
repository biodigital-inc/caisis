<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.SpinePriorSurgeries" CodeFile="SpinePriorSurgeries.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.SpineProcTable = "SpineProcTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SpinePriorSurgeries" /><span class="controlBoxTitle">Procedures</span> <br/>
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <table width="650" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PrevSpineProcTable">
                <tr id="NoSpineProcMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Procedures were recorded for this patient.
                    </td>
                </tr>
              </table>
        
        <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 150px; width:1100px; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="1100px" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpineProcRptTable">        
        <asp:Repeater ID="SpineProcRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
        <HeaderTemplate>
            <tr runat="server" id="PrevSpineProcRptHdr"> 
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
	            <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Procedure</td>
	            <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Service</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Surgeon</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Site</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Side</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">CPT Code</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Description</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Indication</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
	            <td height="10%" class="controlBoxDataGridTitleColumn">&nbsp;</td>
            </tr>
        </HeaderTemplate>
	    <ItemTemplate> 
		    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Procedures', <%# Eval("ProcedureId") %>, 'ProcDateText,ProcDate,ProcName,ProcService,ProcSurgeon,ProcSide,ProcSite,ProcCPT_Code,ProcCPT_Description,ProcIndication,ProcInstitution,ProcNotes,ProcQuality', 'Procedures');"> 
			    <td class="ClinicalEformPopulatedColumn"><%# Eval("ProcDateText")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcName")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcService")%></td>
		        <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcSurgeon")%></td>    
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcSite")%></td>
		        <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcSide")%></td>					
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcCPT_Code")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcCPT_Description")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcIndication")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcInstitution").ToString() == "Memorial Sloan Kettering Cancer Center" ? "MSKCC" : Eval("ProcInstitution").ToString()%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcNotes")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcQuality")%></td>
			    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."></td>
		    </tr>      
	    </ItemTemplate>
      </asp:Repeater> 
      </table></div><br /><br />
      
 <table border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable">
    <tr>
        <td> 
        <span class="controlBoxTitle">Operating Room Details</span> <br/> 
        <table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SpineEncountersTable">
            <tr runat="server" id="SpineEncHdr">
                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Service</td>
                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Surgeon</td>
                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>	
                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td> 
	            <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
          </tr>
          <tr style="white-space:nowrap;">
            <td><euc:EformTextBox RecordId="1" Width="80px" TABLE="OperatingRoomDetails" FIELD="OpDateText" 
                ID="OpDateText_1" Runat="server" ShowCalendar="true" CalcDate="true" />
	           <euc:EformHidden  RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_1" Runat="server" /></td>
	        <td align="center"><euc:EformComboBox id="OpService_1" RecordId="1" Table="OperatingRoomDetails" 
	            Field="OpService" runat="server" Width="100px" LookupCode="PhSpecialty,Disease,Spine" DropDownWidth="200px" /></td>
	        <td style="text-align: center;"><euc:EformComboBox LookupCode="OpSurgeon,Disease,Spine" Width="100px" 
	            id="OpCaseSurgeon_1" RecordId="1" Table="OperatingRoomDetails" Field="OpCaseSurgeon" runat="server" 
	            DropDownWidth="200px"/></td>
	        <td><euc:EformComboBox id="OpInstitution_1" RecordId="1" Table="OperatingRoomDetails" Field="OpInstitution" 
	            runat="server" Width="100px" LookupCode="Institution" /></td>
	        <td align="center"><euc:EformDropDownList id="OpQuality_1" RecordId="1" Table="OperatingRoomDetails" Field="OpQuality" 
	            runat="server"  LookupCode="DataQuality"/></td>
          </tr>
      </table><br />
      
      <table border="0" cellpadding="0" cellspacing="0" style="padding-left:30px;">
        <tr>
            <td>
    <table width="750" cellpadding="2" cellspacing="0" class="eformLargePopulatedTable" id="SpineProcTable">
      <tr style="white-space:nowrap; vertical-align: top" id="NewSpineProcTr1">
        <td style="vertical-align: top"><br />
        <span class="controlBoxTitle">Procedure 1</span> <br/>
        <!-- Procedure Table -->
        <table border="0" width="400" cellpadding="1" cellspacing="0" class="ClinicalEformTable">
            <tr>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Procedure</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">CPT Code</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Description</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;"><euc:EformComboBox Width="142px" RecordId="1" TABLE="Procedures" FIELD="ProcName" 
                    ID="ProcName_1" LookupCode="SpineProcName" Runat="server" DropDownWidth="300px" /></td>
                <td><euc:EformTextBox  Width="75px" RecordId="1" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_1" Runat="server" 
                    ShowCalendar="true" CalcDate="true" />
                    <euc:EformHidden  RecordId="1" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_1" Runat="server"/></td>
                <td align="left"><euc:EformComboBox Width="50px" ID="ProcCPT_Code_1" RecordId="1" Table="Procedures" Field="ProcCPT_Code" 
                    runat="server" LookupCode="SpineProcCPTs"/></td>
                <td  align="center"><euc:EformSelect style="width:95px" ID="ProcCPT_Description_1" RecordId="1" Table="Procedures" 
                    Field="ProcCPT_Description" runat="server" LookupCode="SpineProcCPTDesc" DropDownWidth="400px" /></td>
            </tr>
            <tr>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Indication</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;"><euc:EformExtendedCheckBoxList RecordId="1"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_1" 
                    LookupCode="DxTarget,Disease,Spine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="horizontal" RepeatLayout="Table" RepeatColumns="2" DropDownHeight="auto" DropDownWidth="300px" /></td>
                <td><euc:EformSelect RecordId="1" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_1" 
                    LookupCode="OpSide" Runat="server" style="width:75px" DropDownHeight="auto" DropDownWidth="auto" /> </td>
                <td colspan="2"><euc:EformExtendedCheckBoxList id="ProcIndication_1" RecordId="1" Table="Procedures" 
                    Field="ProcIndication" runat="server" LookupCode="Indication,Disease,Spine" DropDownWidth="auto" 
                    DropDown="true" /></td>
            </tr>
            <tr>            
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Service</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Surgeon</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
            </tr>  
            <tr>
                <td align="center"><euc:EformComboBox id="ProcService_1" RecordId="1" Table="Procedures" Field="ProcService" runat="server" 
                    Width="63px" LookupCode="PhSpecialty,Disease,Spine" DropDownWidth="200px" /></td>
                <td style="text-align: center;"><euc:EformComboBox LookupCode="OpSurgeon,Disease,Spine" Width="63px" id="ProcSurgeon_1" 
                    RecordId="1" Table="Procedures" Field="ProcSurgeon" runat="server" DropDownWidth="200px"/></td>
                <td><euc:EformComboBox id="ProcInstitution_1" RecordId="1" Table="Procedures" Field="ProcInstitution" runat="server" 
                    Width="75px" LookupCode="Institution" DropDownWidth="300px"/></td>
                <td align="left"><euc:EformDropDownList id="ProcQuality_1" RecordId="1" Table="Procedures" Field="ProcQuality" 
                    runat="server" LookupCode="DataQuality" Width="65px" /></td>
                <td align="center"><euc:EformTextBox RecordId="1" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_1" 
                    ShowTextEditor="true" Width="95px" MaxLength="1000"/></td>
            </tr></table>
        </td>
        <!-- Spine Procs table -->
        <td><br />
        <table border="0" width="400" cellpadding="0" cellspacing="0" class="ClinicalEformTable">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Tumor<br />Resection </td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Laminectomy<br />levels</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Laminectomy</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Vertebrectomy<br />levels</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Vertebrectomy</td>
        </tr>
        <tr>
            <td align="center"><euc:EformDropDownList id="ProcTumorResection_1" RecordId="1" Table="SpineProc" 
                Field="ProcTumorResection" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumLaminectomyLevel_1" RecordId="1" Table="SpineProc" 
                Field="ProcNumLaminectomyLevel" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcLaminectomyLevels_1" RecordId="1" Table="SpineProc" 
                Field="ProcLaminectomyLevels" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5" Width="60px" DropDown="true"/></td>
            <td align="center"><euc:EformDropDownList id="ProcNumVertebrectomyLevels_1" RecordId="1" Table="SpineProc" 
                Field="ProcNumVertebrectomyLevels" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcVertebrectomyLevels_1" RecordId="1" Table="SpineProc" 
                Field="ProcVertebrectomyLevels" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">% vertebral<br />body removed</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Anterior<br />reconstruction</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Type of Anterior<br />Reconstruction</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Pedicles<br />removed</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Pedicles removed</td>
        </tr>
        <tr>
            <td align="center"><euc:EformDropDownList id="ProcPercVertebralBodyRemoved_1" RecordId="1" Table="SpineProc" 
                Field="ProcPercVertebralBodyRemoved" runat="server" LookupCode="SpineProcVertebralPercents" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcAnteriorReconstruction_1" RecordId="1" Table="SpineProc" 
                Field="ProcAnteriorReconstruction" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="left"><euc:EformExtendedCheckBoxList id="ProcAnteriorReconstructionType_1" RecordId="1" Table="SpineProc" 
                Field="ProcAnteriorReconstructionType" runat="server" LookupCode="SpineProcAnteriorRecon" Width="60px" DropDown="true" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumPediclesRemoved_1" RecordId="1" Table="SpineProc" 
                Field="ProcNumPediclesRemoved" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcPediclesRemovedLevel_1" RecordId="1" Table="SpineProc" 
                Field="ProcPediclesRemovedLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td> 
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Preop<br />embolization</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of levels<br />instrumented</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels<br />instrumented</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Screw Cement<br />augmentation</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Cement</td>
        </tr>
        <tr> 
            <td align="center"><euc:EformDropDownList id="ProcPreOpEmbolization_1" RecordId="1" Table="SpineProc" 
                Field="ProcPreOpEmbolization" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumInstrumentedLevel_1" RecordId="1" Table="SpineProc" 
                Field="ProcNumInstrumentedLevel" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcInstrumentedLevel_1" RecordId="1" Table="SpineProc" 
                Field="ProcInstrumentedLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
            <td align="center"><euc:EformDropDownList id="ProcCementAugmentation_1" RecordId="1" Table="SpineProc" 
                Field="ProcCementAugmentation" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcCementLevel_1" RecordId="1" Table="SpineProc" 
                Field="ProcCementLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Cement Volume (cc)</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Inflation Pressure (psi)</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Graft material used</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">MIS procedure</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"></td>
        </tr>
        <tr>
            <td align="center"><euc:EformTextBox id="ProcCementVolume_1" RecordId="1" Table="SpineProc" Field="ProcCementVolume" runat="server" 
                Width="60px" /></td>
            <td align="center"><euc:EformTextBox id="ProcInflationPressure_1" RecordId="1" Table="SpineProc" Field="ProcInflationPressure" runat="server" 
                Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcGraftMaterialUsed_1" RecordId="1" Table="SpineProc" Field="ProcGraftMaterialUsed" 
                runat="server" LookupCode="SpineProcGraftMaterial" DropDown="true" /></td>
            <td align="center"><euc:EformDropDownList id="ProcMISProcedure_1" RecordId="1" Table="SpineProc" Field="ProcMISProcedure" runat="server" 
                LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"></td>
        </tr>
        </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewSpineProcTr1'));"  style="float: right; cursor: pointer;" /></td>
      </tr>
      
      <tr style="display:none; white-space:nowrap; vertical-align: top" id="NewSpineProcTr2">
        <td style="vertical-align: top"><br />
        <span class="controlBoxTitle">Procedure 2</span> <br/>
        <!-- Procedure Table -->
        <table border="0" width="400" cellpadding="1" cellspacing="0" class="ClinicalEformTable">
            <tr>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Procedure</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">CPT Code</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Description</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;"><euc:EformComboBox Width="142px" RecordId="2" TABLE="Procedures" FIELD="ProcName" 
                    ID="ProcName_2" LookupCode="SpineProcName" Runat="server" DropDownWidth="300px" /></td>
                <td><euc:EformTextBox  Width="75px" RecordId="2" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_2" Runat="server" 
                    ShowCalendar="true" CalcDate="true" />
                    <euc:EformHidden  RecordId="2" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_2" Runat="server"/></td>
                <td align="left"><euc:EformComboBox Width="50px" ID="ProcCPT_Code_2" RecordId="2" Table="Procedures" Field="ProcCPT_Code" 
                    runat="server" LookupCode="SpineProcCPTs"/></td>
                <td  align="center"><euc:EformSelect style="width:95px" ID="ProcCPT_Description_2" RecordId="2" Table="Procedures" 
                    Field="ProcCPT_Description" runat="server" LookupCode="SpineProcCPTDesc" DropDownWidth="400px" /></td>
            </tr>
            <tr>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Indication</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;"><euc:EformExtendedCheckBoxList RecordId="2"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_2" 
                    LookupCode="DxTarget,Disease,Spine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="horizontal" RepeatLayout="Table" RepeatColumns="2" DropDownHeight="auto" DropDownWidth="300px" /></td>
                <td><euc:EformSelect RecordId="2" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_2" 
                    LookupCode="OpSide" Runat="server" style="width:75px" DropDownHeight="auto" DropDownWidth="auto" /> </td>
                <td colspan="2"><euc:EformExtendedCheckBoxList id="ProcIndication_2" RecordId="2" Table="Procedures" 
                    Field="ProcIndication" runat="server" LookupCode="Indication,Disease,Spine" DropDownWidth="auto" 
                    DropDown="true" /></td>
            </tr>
            <tr>            
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Service</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Surgeon</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
            </tr>  
            <tr>
                <td align="center"><euc:EformComboBox id="ProcService_2" RecordId="2" Table="Procedures" Field="ProcService" runat="server" 
                    Width="63px" LookupCode="PhSpecialty,Disease,Spine" DropDownWidth="200px" /></td>
                <td style="text-align: center;"><euc:EformComboBox LookupCode="OpSurgeon,Disease,Spine" Width="63px" id="ProcSurgeon_2" 
                    RecordId="2" Table="Procedures" Field="ProcSurgeon" runat="server" DropDownWidth="200px"/></td>
                <td><euc:EformComboBox id="ProcInstitution_2" RecordId="2" Table="Procedures" Field="ProcInstitution" runat="server" 
                    Width="75px" LookupCode="Institution" DropDownWidth="300px"/></td>
                <td align="left"><euc:EformDropDownList id="ProcQuality_2" RecordId="2" Table="Procedures" Field="ProcQuality" 
                    runat="server" LookupCode="DataQuality" Width="65px" /></td>
                <td align="center"><euc:EformTextBox RecordId="2" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_2" 
                    ShowTextEditor="true" Width="95px" MaxLength="1000"/></td>
            </tr></table>
        </td>
        <!-- Spine Procs table -->
        <td><br />
        <table border="0" width="400" cellpadding="0" cellspacing="0" class="ClinicalEformTable">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Tumor<br />Resection </td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Laminectomy<br />levels</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Laminectomy</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Vertebrectomy<br />levels</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Vertebrectomy</td>
        </tr>
        <tr>
            <td align="center"><euc:EformDropDownList id="ProcTumorResection_2" RecordId="2" Table="SpineProc" 
                Field="ProcTumorResection" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumLaminectomyLevel_2" RecordId="2" Table="SpineProc" 
                Field="ProcNumLaminectomyLevel" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcLaminectomyLevels_2" RecordId="2" Table="SpineProc" 
                Field="ProcLaminectomyLevels" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
            <td align="center"><euc:EformDropDownList id="ProcNumVertebrectomyLevels_2" RecordId="2" Table="SpineProc" 
                Field="ProcNumVertebrectomyLevels" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcVertebrectomyLevels_2" RecordId="2" Table="SpineProc" 
                Field="ProcVertebrectomyLevels" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">% vertebral<br />body removed</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Anterior<br />reconstruction</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Type of Anterior<br />Reconstruction</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Pedicles<br />removed</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Pedicles removed</td>
        </tr>
        <tr>
            <td align="center"><euc:EformDropDownList id="ProcPercVertebralBodyRemoved_2" RecordId="2" Table="SpineProc" 
                Field="ProcPercVertebralBodyRemoved" runat="server" LookupCode="SpineProcVertebralPercents" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcAnteriorReconstruction_2" RecordId="2" Table="SpineProc" 
                Field="ProcAnteriorReconstruction" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="left"><euc:EformExtendedCheckBoxList id="ProcAnteriorReconstructionType_2" RecordId="2" Table="SpineProc" 
                Field="ProcAnteriorReconstructionType" runat="server" LookupCode="SpineProcAnteriorRecon" Width="60px" DropDown="true" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumPediclesRemoved_2" RecordId="2" Table="SpineProc" 
                Field="ProcNumPediclesRemoved" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcPediclesRemovedLevel_2" RecordId="2" Table="SpineProc" 
                Field="ProcPediclesRemovedLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td> 
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Preop<br />embolization</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of levels<br />instrumented</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels<br />instrumented</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Screw Cement<br />augmentation</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Cement</td>
        </tr>
        <tr> 
            <td align="center"><euc:EformDropDownList id="ProcPreOpEmbolization_2" RecordId="2" Table="SpineProc" 
                Field="ProcPreOpEmbolization" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumInstrumentedLevel_2" RecordId="2" Table="SpineProc" 
                Field="ProcNumInstrumentedLevel" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcInstrumentedLevel_2" RecordId="2" Table="SpineProc" 
                Field="ProcInstrumentedLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
            <td align="center"><euc:EformDropDownList id="ProcCementAugmentation_2" RecordId="2" Table="SpineProc" 
                Field="ProcCementAugmentation" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcCementLevel_2" RecordId="2" Table="SpineProc" 
                Field="ProcCementLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Cement Volume (cc)</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Inflation Pressure (psi)</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Graft material used</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">MIS procedure</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"></td>
        </tr>
        <tr>
            <td align="center"><euc:EformTextBox id="ProcCementVolume_2" RecordId="2" Table="SpineProc" Field="ProcCementVolume" runat="server" 
                Width="60px" /></td>
            <td align="center"><euc:EformTextBox id="ProcInflationPressure_2" RecordId="2" Table="SpineProc" Field="ProcInflationPressure" runat="server" 
                Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcGraftMaterialUsed_2" RecordId="2" Table="SpineProc" Field="ProcGraftMaterialUsed" 
                runat="server" LookupCode="SpineProcGraftMaterial" DropDown="true" /></td>
            <td align="center"><euc:EformDropDownList id="ProcMISProcedure_2" RecordId="2" Table="SpineProc" Field="ProcMISProcedure" runat="server" 
                LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"></td>
        </tr>
        </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewSpineProcTr2'));"  style="float: right; cursor: pointer;" /></td>
      </tr>
      
      <tr style="display:none; white-space:nowrap; vertical-align:top;" id="NewSpineProcTr3">
        <td style="vertical-align: top"><br />
        <span class="controlBoxTitle">Procedure 3</span> <br/>
        <!-- Procedure Table -->
        <table border="0" width="400" cellpadding="1" cellspacing="0" class="ClinicalEformTable">
            <tr>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Procedure</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">CPT Code</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Description</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;"><euc:EformComboBox Width="142px" RecordId="3" TABLE="Procedures" FIELD="ProcName" 
                    ID="ProcName_3" LookupCode="SpineProcName" Runat="server" DropDownWidth="300px" /></td>
                <td><euc:EformTextBox  Width="75px" RecordId="3" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_3" Runat="server" 
                    ShowCalendar="true" CalcDate="true" />
                    <euc:EformHidden  RecordId="3" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_3" Runat="server"/></td>
                <td align="left"><euc:EformComboBox Width="50px" ID="ProcCPT_Code_3" RecordId="3" Table="Procedures" Field="ProcCPT_Code" 
                    runat="server" LookupCode="SpineProcCPTs"/></td>
                <td  align="center"><euc:EformSelect style="width:95px" ID="ProcCPT_Description_3" RecordId="3" Table="Procedures" 
                    Field="ProcCPT_Description" runat="server" LookupCode="SpineProcCPTDesc" DropDownWidth="400px" /></td>
            </tr>
            <tr>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Indication</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;"><euc:EformExtendedCheckBoxList RecordId="3"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_3" 
                    LookupCode="DxTarget,Disease,Spine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="horizontal" RepeatLayout="Table" RepeatColumns="2" DropDownHeight="auto" DropDownWidth="300px" /></td>
                <td><euc:EformSelect RecordId="3" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_3" 
                    LookupCode="OpSide" Runat="server" style="width:75px" DropDownHeight="auto" DropDownWidth="auto" /> </td>
                <td colspan="2"><euc:EformExtendedCheckBoxList id="ProcIndication_3" RecordId="3" Table="Procedures" 
                    Field="ProcIndication" runat="server" LookupCode="Indication,Disease,Spine" DropDownWidth="auto" 
                    DropDown="true" /></td>
            </tr>
            <tr>            
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Service</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Surgeon</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
            </tr>  
            <tr>
                <td align="center"><euc:EformComboBox id="ProcService_3" RecordId="3" Table="Procedures" Field="ProcService" runat="server" 
                    Width="63px" LookupCode="PhSpecialty,Disease,Spine" DropDownWidth="200px" /></td>
                <td style="text-align: center;"><euc:EformComboBox LookupCode="OpSurgeon,Disease,Spine" Width="63px" id="ProcSurgeon_3" 
                    RecordId="3" Table="Procedures" Field="ProcSurgeon" runat="server" DropDownWidth="200px"/></td>
                <td><euc:EformComboBox id="ProcInstitution_3" RecordId="3" Table="Procedures" Field="ProcInstitution" runat="server" 
                    Width="75px" LookupCode="Institution" DropDownWidth="300px"/></td>
                <td align="left"><euc:EformDropDownList id="ProcQuality_3" RecordId="3" Table="Procedures" Field="ProcQuality" 
                    runat="server" LookupCode="DataQuality" Width="65px" /></td>
                <td align="center"><euc:EformTextBox RecordId="3" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_3" 
                    ShowTextEditor="true" Width="95px" MaxLength="1000"/></td>
            </tr></table>
        </td>
        <!-- Spine Procs table -->
        <td><br />
        <table border="0" width="400" cellpadding="0" cellspacing="0" class="ClinicalEformTable">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Tumor<br />Resection </td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Laminectomy<br />levels</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Laminectomy</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Vertebrectomy<br />levels</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Vertebrectomy</td>
        </tr>
        <tr>
            <td align="center"><euc:EformDropDownList id="ProcTumorResection_3" RecordId="3" Table="SpineProc" 
                Field="ProcTumorResection" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumLaminectomyLevel_3" RecordId="3" Table="SpineProc" 
                Field="ProcNumLaminectomyLevel" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcLaminectomyLevels_3" RecordId="3" Table="SpineProc" 
                Field="ProcLaminectomyLevels" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
            <td align="center"><euc:EformDropDownList id="ProcNumVertebrectomyLevels_3" RecordId="3" Table="SpineProc" 
                Field="ProcNumVertebrectomyLevels" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcVertebrectomyLevels_3" RecordId="3" Table="SpineProc" 
                Field="ProcVertebrectomyLevels" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">% vertebral<br />body removed</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Anterior<br />reconstruction</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Type of Anterior<br />Reconstruction</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Pedicles<br />removed</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Pedicles removed</td>
        </tr>
        <tr>
            <td align="center"><euc:EformDropDownList id="ProcPercVertebralBodyRemoved_3" RecordId="3" Table="SpineProc" 
                Field="ProcPercVertebralBodyRemoved" runat="server" LookupCode="SpineProcVertebralPercents" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcAnteriorReconstruction_3" RecordId="3" Table="SpineProc" 
                Field="ProcAnteriorReconstruction" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="left"><euc:EformExtendedCheckBoxList id="ProcAnteriorReconstructionType_3" RecordId="3" Table="SpineProc" 
                Field="ProcAnteriorReconstructionType" runat="server" LookupCode="SpineProcAnteriorRecon" Width="60px" DropDown="true" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumPediclesRemoved_3" RecordId="3" Table="SpineProc" 
                Field="ProcNumPediclesRemoved" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcPediclesRemovedLevel_3" RecordId="3" Table="SpineProc" 
                Field="ProcPediclesRemovedLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td> 
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Preop<br />embolization</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of levels<br />instrumented</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels<br />instrumented</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Screw Cement<br />augmentation</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Cement</td>
        </tr>
        <tr> 
            <td align="center"><euc:EformDropDownList id="ProcPreOpEmbolization_3" RecordId="3" Table="SpineProc" 
                Field="ProcPreOpEmbolization" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumInstrumentedLevel_3" RecordId="3" Table="SpineProc" 
                Field="ProcNumInstrumentedLevel" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcInstrumentedLevel_3" RecordId="3" Table="SpineProc" 
                Field="ProcInstrumentedLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
            <td align="center"><euc:EformDropDownList id="ProcCementAugmentation_3" RecordId="3" Table="SpineProc" 
                Field="ProcCementAugmentation" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcCementLevel_3" RecordId="3" Table="SpineProc" 
                Field="ProcCementLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Cement Volume (cc)</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Inflation Pressure (psi)</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Graft material used</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">MIS procedure</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"></td>
        </tr>
        <tr>
            <td align="center"><euc:EformTextBox id="ProcCementVolume_3" RecordId="3" Table="SpineProc" Field="ProcCementVolume" runat="server" 
                Width="60px" /></td>
            <td align="center"><euc:EformTextBox id="ProcInflationPressure_3" RecordId="3" Table="SpineProc" Field="ProcInflationPressure" runat="server" 
                Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcGraftMaterialUsed_3" RecordId="3" Table="SpineProc" Field="ProcGraftMaterialUsed" 
                runat="server" LookupCode="SpineProcGraftMaterial" DropDown="true" /></td>
            <td align="center"><euc:EformDropDownList id="ProcMISProcedure_3" RecordId="3" Table="SpineProc" Field="ProcMISProcedure" runat="server" 
                LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"></td>
        </tr>
        </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewSpineProcTr3'));"  style="float: right; cursor: pointer;" /></td>
      </tr>
      
      <tr style="display:none; white-space:nowrap; vertical-align:top;" id="NewSpineProcTr4">
        <td style="vertical-align: top"><br />
        <span class="controlBoxTitle">Procedure 4</span> <br/>
        <!-- Procedure Table -->
        <table border="0" width="400" cellpadding="1" cellspacing="0" class="ClinicalEformTable">
            <tr>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Procedure</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">CPT Code</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Description</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;"><euc:EformComboBox Width="142px" RecordId="4" TABLE="Procedures" FIELD="ProcName" 
                    ID="ProcName_4" LookupCode="SpineProcName" Runat="server" DropDownWidth="300px" /></td>
                <td><euc:EformTextBox  Width="75px" RecordId="4" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_4" Runat="server" 
                    ShowCalendar="true" CalcDate="true" />
                    <euc:EformHidden  RecordId="4" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_4" Runat="server"/></td>
                <td align="left"><euc:EformComboBox Width="50px" ID="ProcCPT_Code_4" RecordId="4" Table="Procedures" Field="ProcCPT_Code" 
                    runat="server" LookupCode="SpineProcCPTs"/></td>
                <td  align="center"><euc:EformSelect style="width:95px" ID="ProcCPT_Description_4" RecordId="4" Table="Procedures" 
                    Field="ProcCPT_Description" runat="server" LookupCode="SpineProcCPTDesc" DropDownWidth="400px" /></td>
            </tr>
            <tr>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Indication</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;"><euc:EformExtendedCheckBoxList RecordId="4"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_4" 
                    LookupCode="DxTarget,Disease,Spine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="horizontal" RepeatLayout="Table" RepeatColumns="2" DropDownHeight="auto" DropDownWidth="300px" /></td>
                <td><euc:EformSelect RecordId="4" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_4" 
                    LookupCode="OpSide" Runat="server" style="width:75px" DropDownHeight="auto" DropDownWidth="auto" /> </td>
                <td colspan="2"><euc:EformExtendedCheckBoxList id="ProcIndication_4" RecordId="4" Table="Procedures" 
                    Field="ProcIndication" runat="server" LookupCode="Indication,Disease,Spine" DropDownWidth="auto" 
                    DropDown="true" /></td>
            </tr>
            <tr>            
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Service</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Surgeon</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
            </tr>  
            <tr>
                <td align="center"><euc:EformComboBox id="ProcService_4" RecordId="4" Table="Procedures" Field="ProcService" runat="server" 
                    Width="63px" LookupCode="PhSpecialty,Disease,Spine" DropDownWidth="200px" /></td>
                <td style="text-align: center;"><euc:EformComboBox LookupCode="OpSurgeon,Disease,Spine" Width="63px" id="ProcSurgeon_4" 
                    RecordId="4" Table="Procedures" Field="ProcSurgeon" runat="server" DropDownWidth="200px"/></td>
                <td><euc:EformComboBox id="ProcInstitution_4" RecordId="4" Table="Procedures" Field="ProcInstitution" runat="server" 
                    Width="75px" LookupCode="Institution" DropDownWidth="300px"/></td>
                <td align="left"><euc:EformDropDownList id="ProcQuality_4" RecordId="4" Table="Procedures" Field="ProcQuality" 
                    runat="server" LookupCode="DataQuality" Width="65px" /></td>
                <td align="center"><euc:EformTextBox RecordId="4" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_4" 
                    ShowTextEditor="true" Width="95px" MaxLength="1000"/></td>
            </tr></table>
        </td>
        <!-- Spine Procs table -->
        <td><br />
        <table border="0" width="400" cellpadding="0" cellspacing="0" class="ClinicalEformTable">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Tumor<br />Resection </td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Laminectomy<br />levels</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Laminectomy</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Vertebrectomy<br />levels</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Vertebrectomy</td>
        </tr>
        <tr>
            <td align="center"><euc:EformDropDownList id="ProcTumorResection_4" RecordId="4" Table="SpineProc" 
                Field="ProcTumorResection" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumLaminectomyLevel_4" RecordId="4" Table="SpineProc" 
                Field="ProcNumLaminectomyLevel" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcLaminectomyLevels_4" RecordId="4" Table="SpineProc" 
                Field="ProcLaminectomyLevels" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
            <td align="center"><euc:EformDropDownList id="ProcNumVertebrectomyLevels_4" RecordId="4" Table="SpineProc" 
                Field="ProcNumVertebrectomyLevels" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcVertebrectomyLevels_4" RecordId="4" Table="SpineProc" 
                Field="ProcVertebrectomyLevels" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">% vertebral<br />body removed</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Anterior<br />reconstruction</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Type of Anterior<br />Reconstruction</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Pedicles<br />removed</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Pedicles removed</td>
        </tr>
        <tr>
            <td align="center"><euc:EformDropDownList id="ProcPercVertebralBodyRemoved_4" RecordId="4" Table="SpineProc" 
                Field="ProcPercVertebralBodyRemoved" runat="server" LookupCode="SpineProcVertebralPercents" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcAnteriorReconstruction_4" RecordId="4" Table="SpineProc" 
                Field="ProcAnteriorReconstruction" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="left"><euc:EformExtendedCheckBoxList id="ProcAnteriorReconstructionType_4" RecordId="4" Table="SpineProc" 
                Field="ProcAnteriorReconstructionType" runat="server" LookupCode="SpineProcAnteriorRecon" Width="60px" DropDown="true" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumPediclesRemoved_4" RecordId="4" Table="SpineProc" 
                Field="ProcNumPediclesRemoved" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcPediclesRemovedLevel_4" RecordId="4" Table="SpineProc" 
                Field="ProcPediclesRemovedLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td> 
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Preop<br />embolization</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of levels<br />instrumented</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels<br />instrumented</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Screw Cement<br />augmentation</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Cement</td>
        </tr>
        <tr> 
            <td align="center"><euc:EformDropDownList id="ProcPreOpEmbolization_4" RecordId="4" Table="SpineProc" 
                Field="ProcPreOpEmbolization" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumInstrumentedLevel_4" RecordId="4" Table="SpineProc" 
                Field="ProcNumInstrumentedLevel" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcInstrumentedLevel_4" RecordId="4" Table="SpineProc" 
                Field="ProcInstrumentedLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
            <td align="center"><euc:EformDropDownList id="ProcCementAugmentation_4" RecordId="4" Table="SpineProc" 
                Field="ProcCementAugmentation" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcCementLevel_4" RecordId="4" Table="SpineProc" 
                Field="ProcCementLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Cement Volume (cc)</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Inflation Pressure (psi)</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Graft material used</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">MIS procedure</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"></td>
        </tr>
        <tr>
            <td align="center"><euc:EformTextBox id="ProcCementVolume_4" RecordId="4" Table="SpineProc" Field="ProcCementVolume" runat="server" 
                Width="60px" /></td>
            <td align="center"><euc:EformTextBox id="ProcInflationPressure_4" RecordId="4" Table="SpineProc" Field="ProcInflationPressure" runat="server" 
                Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcGraftMaterialUsed_4" RecordId="4" Table="SpineProc" Field="ProcGraftMaterialUsed" 
                runat="server" LookupCode="SpineProcGraftMaterial" DropDown="true" /></td>
            <td align="center"><euc:EformDropDownList id="ProcMISProcedure_4" RecordId="4" Table="SpineProc" Field="ProcMISProcedure" runat="server" 
                LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"></td>
        </tr>
        </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewSpineProcTr4'));"  style="float: right; cursor: pointer;" /></td>
      </tr>
      
      <tr style="display:none; white-space:nowrap; vertical-align:top;" id="NewSpineProcTr5">
        <td style="vertical-align: top"><br />
        <span class="controlBoxTitle">Procedure 5</span> <br/>
        <!-- Procedure Table -->
        <table border="0" width="400" cellpadding="1" cellspacing="0" class="ClinicalEformTable">
            <tr>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Procedure</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">CPT Code</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Description</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;"><euc:EformComboBox Width="142px" RecordId="5" TABLE="Procedures" FIELD="ProcName" 
                    ID="ProcName_5" LookupCode="SpineProcName" Runat="server" DropDownWidth="300px" /></td>
                <td><euc:EformTextBox  Width="75px" RecordId="5" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_5" Runat="server" 
                    ShowCalendar="true" CalcDate="true" />
                    <euc:EformHidden  RecordId="5" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_5" Runat="server"/></td>
                <td align="left"><euc:EformComboBox Width="50px" ID="ProcCPT_Code_5" RecordId="5" Table="Procedures" Field="ProcCPT_Code" 
                    runat="server" LookupCode="SpineProcCPTs"/></td>
                <td  align="center"><euc:EformSelect style="width:95px" ID="ProcCPT_Description_5" RecordId="5" Table="Procedures" 
                    Field="ProcCPT_Description" runat="server" LookupCode="SpineProcCPTDesc" DropDownWidth="400px" /></td>
            </tr>
            <tr>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Indication</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;"><euc:EformExtendedCheckBoxList RecordId="5"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_5" 
                    LookupCode="DxTarget,Disease,Spine" Runat="server" style="text-align:left;" DropDown="true" RepeatDirection="horizontal" RepeatLayout="Table" RepeatColumns="2" DropDownHeight="auto" DropDownWidth="300px" /></td>
                <td><euc:EformSelect RecordId="5" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_5" 
                    LookupCode="OpSide" Runat="server" style="width:75px" DropDownHeight="auto" DropDownWidth="auto" /> </td>
                <td colspan="2"><euc:EformExtendedCheckBoxList id="ProcIndication_5" RecordId="5" Table="Procedures" 
                    Field="ProcIndication" runat="server" LookupCode="Indication,Disease,Spine" DropDownWidth="auto" 
                    DropDown="true" /></td>
            </tr>
            <tr>            
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Service</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Surgeon</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
            </tr>  
            <tr>
                <td align="center"><euc:EformComboBox id="ProcService_5" RecordId="5" Table="Procedures" Field="ProcService" runat="server" 
                    Width="63px" LookupCode="PhSpecialty,Disease,Spine" DropDownWidth="200px" /></td>
                <td style="text-align: center;"><euc:EformComboBox LookupCode="OpSurgeon,Disease,Spine" Width="63px" id="ProcSurgeon_5" 
                    RecordId="5" Table="Procedures" Field="ProcSurgeon" runat="server" DropDownWidth="200px"/></td>
                <td><euc:EformComboBox id="ProcInstitution_5" RecordId="5" Table="Procedures" Field="ProcInstitution" runat="server" 
                    Width="75px" LookupCode="Institution" DropDownWidth="300px"/></td>
                <td align="left"><euc:EformDropDownList id="ProcQuality_5" RecordId="5" Table="Procedures" Field="ProcQuality" 
                    runat="server" LookupCode="DataQuality" Width="65px" /></td>
                <td align="center"><euc:EformTextBox RecordId="5" TABLE="Procedures" FIELD="ProcNotes" Runat="server" ID="ProcNotes_5" 
                    ShowTextEditor="true" Width="95px" MaxLength="1000"/></td>
            </tr></table>
        </td>
        <!-- Spine Procs table -->
        <td><br />
        <table border="0" width="400" cellpadding="0" cellspacing="0" class="ClinicalEformTable">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Tumor<br />Resection </td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Laminectomy<br />levels</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Laminectomy</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Vertebrectomy<br />levels</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Vertebrectomy</td>
        </tr>
        <tr>
            <td align="center"><euc:EformDropDownList id="ProcTumorResection_5" RecordId="5" Table="SpineProc" 
                Field="ProcTumorResection" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumLaminectomyLevel_5" RecordId="5" Table="SpineProc" 
                Field="ProcNumLaminectomyLevel" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcLaminectomyLevels_5" RecordId="5" Table="SpineProc" 
                Field="ProcLaminectomyLevels" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
            <td align="center"><euc:EformDropDownList id="ProcNumVertebrectomyLevels_5" RecordId="5" Table="SpineProc" 
                Field="ProcNumVertebrectomyLevels" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcVertebrectomyLevels_5" RecordId="5" Table="SpineProc" 
                Field="ProcVertebrectomyLevels" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">% vertebral<br />body removed</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Anterior<br />reconstruction</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Type of Anterior<br />Reconstruction</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of Pedicles<br />removed</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Pedicles removed</td>
        </tr>
        <tr>
            <td align="center"><euc:EformDropDownList id="ProcPercVertebralBodyRemoved_5" RecordId="5" Table="SpineProc" 
                Field="ProcPercVertebralBodyRemoved" runat="server" LookupCode="SpineProcVertebralPercents" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcAnteriorReconstruction_5" RecordId="5" Table="SpineProc" 
                Field="ProcAnteriorReconstruction" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="left"><euc:EformExtendedCheckBoxList id="ProcAnteriorReconstructionType_5" RecordId="5" Table="SpineProc" 
                Field="ProcAnteriorReconstructionType" runat="server" LookupCode="SpineProcAnteriorRecon" Width="60px" DropDown="true" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumPediclesRemoved_5" RecordId="5" Table="SpineProc" 
                Field="ProcNumPediclesRemoved" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcPediclesRemovedLevel_5" RecordId="5" Table="SpineProc" 
                Field="ProcPediclesRemovedLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td> 
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Preop<br />embolization</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"># of levels<br />instrumented</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels<br />instrumented</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Screw Cement<br />augmentation</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Levels of<br />Cement</td>
        </tr>
        <tr> 
            <td align="center"><euc:EformDropDownList id="ProcPreOpEmbolization_5" RecordId="5" Table="SpineProc" 
                Field="ProcPreOpEmbolization" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformDropDownList id="ProcNumInstrumentedLevel_5" RecordId="5" Table="SpineProc" 
                Field="ProcNumInstrumentedLevel" runat="server" LookupCode="SpineProcNumberOfLevels" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcInstrumentedLevel_5" RecordId="5" Table="SpineProc" 
                Field="ProcInstrumentedLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
            <td align="center"><euc:EformDropDownList id="ProcCementAugmentation_5" RecordId="5" Table="SpineProc" 
                Field="ProcCementAugmentation" runat="server" LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcCementLevel_5" RecordId="5" Table="SpineProc" 
                Field="ProcCementLevel" runat="server" LookupCode="SpineProcLevels" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="5"  Width="60px" DropDown="true"/></td>
        </tr>
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Cement Volume (cc)</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Inflation Pressure (psi)</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">Graft material used</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;">MIS procedure</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; font-size:9px;"></td>
        </tr>
        <tr>
            <td align="center"><euc:EformTextBox id="ProcCementVolume_5" RecordId="5" Table="SpineProc" Field="ProcCementVolume" runat="server" 
                Width="60px" /></td>
            <td align="center"><euc:EformTextBox id="ProcInflationPressure_5" RecordId="5" Table="SpineProc" Field="ProcInflationPressure" runat="server" 
                Width="60px" /></td>
            <td align="center"><euc:EformExtendedCheckBoxList id="ProcGraftMaterialUsed_5" RecordId="5" Table="SpineProc" Field="ProcGraftMaterialUsed" 
                runat="server" LookupCode="SpineProcGraftMaterial" DropDown="true" /></td>
            <td align="center"><euc:EformDropDownList id="ProcMISProcedure_5" RecordId="5" Table="SpineProc" Field="ProcMISProcedure" runat="server" 
                LookupCode="YesNoUnknown" Width="60px" /></td>
            <td align="center"></td>
        </tr>
        </table>
        </td>
        <td valign="middle"><img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('NewSpineProcTr5'));"  style="float: right; cursor: pointer;" /></td>
      </tr>
      </table>
      <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SpineProcTable');" /><br /><br />
      </td>
      </tr></table>
        </td>
    </tr>
</table>  
</td>
</tr>
</table><br /><br />



<script type="text/javascript">
    //Add OR details to 1st procedure, if Service=NSG
    function addOREvent(opDateText, opDate, opService, opSurgeon, opInst, opQuality, procDateText, procDate, procName, procService, procSurgeon, procInst, procQuality)
    {
        $(opDateText).addEvent('blur', curry(ProcAutoPopulate, opDateText, opDate, opService, opSurgeon, opInst, opQuality, procDateText, procDate, procName, procService, procSurgeon, procInst, procQuality));
        $(procName).addEvent('blur', curry(ProcAutoPopulate, opDateText, opDate, opService, opSurgeon, opInst, opQuality, procDateText, procDate, procName, procService, procSurgeon, procInst, procQuality));
        $(opService).addEvent('blur', curry(ProcAutoPopulate, opDateText, opDate, opService, opSurgeon, opInst, opQuality, procDateText, procDate, procName, procService, procSurgeon, procInst, procQuality));
        $(opSurgeon).addEvent('blur', curry(ProcAutoPopulate, opDateText, opDate, opService, opSurgeon, opInst, opQuality, procDateText, procDate, procName, procService, procSurgeon, procInst, procQuality));
        $(opInst).addEvent('blur', curry(ProcAutoPopulate, opDateText, opDate, opService, opSurgeon, opInst, opQuality, procDateText, procDate, procName, procService, procSurgeon, procInst, procQuality));
        $(opQuality).addEvent('blur', curry(ProcAutoPopulate, opDateText, opDate, opService, opSurgeon, opInst, opQuality, procDateText, procDate, procName, procService, procSurgeon, procInst, procQuality));
    } 
    
    addOREvent($('<%= OpDateText_1.ClientID %>'),$('<%= OpDate_1.ClientID %>'),$('<%= OpService_1.ClientID %>'),$('<%= OpCaseSurgeon_1.ClientID %>'),$('<%= OpInstitution_1.ClientID %>'),$('<%= OpQuality_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcName_1.ClientID %>'),$('<%= ProcService_1.ClientID %>'),$('<%= ProcSurgeon_1.ClientID %>'),$('<%= ProcInstitution_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'));
    
    function ProcAutoPopulate(opDateText, opDate, opService, opSurgeon, opInst, opQuality, procDateText, procDate, procName, procService, procSurgeon, procInst, procQuality)
    {
        if((opService.value == 'Neurosurgery') && (procName.value != '') && (opDateText.value!='' || opService.value!='' || opSurgeon.value!='' || opInst.value!='' || opQuality.value!=''))
        {
            procDateText.value = opDateText.value;
            procDate.value = opDate.value;
            procService.value = opService.value;
            procSurgeon.value = opSurgeon.value;
            procInst.value = opInst.value;
            procQuality.value = opQuality.value;
        }
        else
        {
            procDateText.value = '';
            procDate.value = '';
            procService.value = '';
            procSurgeon.value = '';
            procInst.value = '';
            procQuality.value = '';
        }
    }
</script>