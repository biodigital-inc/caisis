<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.ProcPathPedsNeuro" CodeFile="ProcPathPedsNeuro.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.PedsNeuroProcTable = "PedsNeuroProcTable";
    tableArray.PedsNeuroPathTable = "PedsNeuroPathTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<span class="controlBoxTitle">Procedure</span><br />  
<table width="650" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroProcTable">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Case Surgeon</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Procedure</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Service</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>   
  <tr>
	<td style="text-align: left;">
        <euc:EformTextBox  Width="70px" RecordId="1" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_1" Runat="server"  
            ShowCalendar="true" CalcDate="true" />
	    <euc:EformHidden  RecordId="1" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_1" Runat="server"/></td>
    <td style="text-align: center;">
        <euc:EformComboBox LookupCode="OpSurgeon" Width="80px" id="ProcSurgeon_1" RecordId="1" Table="Procedures" 
            Field="ProcSurgeon" runat="server" DropDownWidth="200px"/></td>
    <td style="text-align: center;"><euc:EformComboBox Width="90px" RecordId="1" TABLE="Procedures" FIELD="ProcName" ID="ProcName_1" 
            LookupCode="ProcName" Runat="server" DropDownWidth="200px" /></td>
    <td style="text-align: center;"><euc:EformSelect RecordId="1" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_1" 
        LookupCode="OpSide" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px" /></td>
    <td style="text-align: center;"><euc:EformSelect RecordId="1"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_1" 
        LookupCode="DxTarget" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/> </td>
    <td><euc:EformComboBox id="ProcInstitution_1" RecordId="1" Table="Procedures" Field="ProcInstitution" runat="server" Width="80px" 
            LookupCode="Institution" /></td>
	<td align="center"><euc:EformComboBox id="ProcService_1" RecordId="1" Table="Procedures" Field="ProcService" runat="server" 
	    Width="70px" LookupCode="PhSpecialty" DropDownWidth="auto" /></td>
	<td align="center"><euc:EformDropDownList id="ProcQuality_1" RecordId="1" Table="Procedures" Field="ProcQuality" runat="server" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	<td style="text-align: left;">
        <euc:EformTextBox  Width="70px" RecordId="2" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_2" Runat="server"  
            ShowCalendar="true" CalcDate="true" />
	    <euc:EformHidden  RecordId="2" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_2" Runat="server"/></td>
    <td style="text-align: center;">
        <euc:EformComboBox LookupCode="OpSurgeon" Width="80px" id="ProcSurgeon_2" RecordId="2" Table="Procedures" 
            Field="ProcSurgeon" runat="server" DropDownWidth="200px"/></td>
    <td style="text-align: center;"><euc:EformComboBox Width="90px" RecordId="2" TABLE="Procedures" FIELD="ProcName" ID="ProcName_2" 
            LookupCode="ProcName" Runat="server" DropDownWidth="200px" /></td>
    <td style="text-align: center;"><euc:EformSelect RecordId="2" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_2" 
        LookupCode="OpSide" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px" /></td>
    <td style="text-align: center;"><euc:EformSelect RecordId="2"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_2" 
        LookupCode="DxTarget" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/> </td>
    <td><euc:EformComboBox id="ProcInstitution_2" RecordId="2" Table="Procedures" Field="ProcInstitution" runat="server" Width="80px" 
            LookupCode="Institution" /></td>
	<td align="center"><euc:EformComboBox id="ProcService_2" RecordId="2" Table="Procedures" Field="ProcService" runat="server" 
	    Width="70px" LookupCode="PhSpecialty" DropDownWidth="auto" /></td>
	<td align="center"><euc:EformDropDownList id="ProcQuality_2" RecordId="2" Table="Procedures" Field="ProcQuality" runat="server" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	<td style="text-align: left;">
        <euc:EformTextBox  Width="70px" RecordId="3" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_3" Runat="server"  
            ShowCalendar="true" CalcDate="true" />
	    <euc:EformHidden  RecordId="3" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_3" Runat="server"/></td>
    <td style="text-align: center;">
        <euc:EformComboBox LookupCode="OpSurgeon" Width="80px" id="ProcSurgeon_3" RecordId="3" Table="Procedures" 
            Field="ProcSurgeon" runat="server" DropDownWidth="200px"/></td>
    <td style="text-align: center;"><euc:EformComboBox Width="90px" RecordId="3" TABLE="Procedures" FIELD="ProcName" ID="ProcName_3" 
            LookupCode="ProcName" Runat="server" DropDownWidth="200px" /></td>
    <td style="text-align: center;"><euc:EformSelect RecordId="3" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_3" 
        LookupCode="OpSide" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px" /></td>
    <td style="text-align: center;"><euc:EformSelect RecordId="3"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_3" 
        LookupCode="DxTarget" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/> </td>
    <td><euc:EformComboBox id="ProcInstitution_3" RecordId="3" Table="Procedures" Field="ProcInstitution" runat="server" Width="80px" 
            LookupCode="Institution" /></td>
	<td align="center"><euc:EformComboBox id="ProcService_3" RecordId="3" Table="Procedures" Field="ProcService" runat="server" 
	    Width="70px" LookupCode="PhSpecialty" DropDownWidth="auto" /></td>
	<td align="center"><euc:EformDropDownList id="ProcQuality_3" RecordId="3" Table="Procedures" Field="ProcQuality" runat="server" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	<td style="text-align: left;">
        <euc:EformTextBox  Width="70px" RecordId="4" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_4" Runat="server"  
            ShowCalendar="true" CalcDate="true" />
	    <euc:EformHidden  RecordId="4" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_4" Runat="server"/></td>
    <td style="text-align: center;">
        <euc:EformComboBox LookupCode="OpSurgeon" Width="80px" id="ProcSurgeon_4" RecordId="4" Table="Procedures" 
            Field="ProcSurgeon" runat="server" DropDownWidth="200px"/></td>
    <td style="text-align: center;"><euc:EformComboBox Width="90px" RecordId="4" TABLE="Procedures" FIELD="ProcName" ID="ProcName_4" 
            LookupCode="ProcName" Runat="server" DropDownWidth="200px" /></td>
    <td style="text-align: center;"><euc:EformSelect RecordId="4" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_4" 
        LookupCode="OpSide" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px" /></td>
    <td style="text-align: center;"><euc:EformSelect RecordId="4"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_4" 
        LookupCode="DxTarget" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/> </td>
    <td><euc:EformComboBox id="ProcInstitution_4" RecordId="4" Table="Procedures" Field="ProcInstitution" runat="server" Width="80px" 
            LookupCode="Institution" /></td>
	<td align="center"><euc:EformComboBox id="ProcService_4" RecordId="4" Table="Procedures" Field="ProcService" runat="server" 
	    Width="70px" LookupCode="PhSpecialty" DropDownWidth="auto" /></td>
	<td align="center"><euc:EformDropDownList id="ProcQuality_4" RecordId="4" Table="Procedures" Field="ProcQuality" runat="server" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	<td style="text-align: left;">
        <euc:EformTextBox  Width="70px" RecordId="5" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_5" Runat="server"  
            ShowCalendar="true" CalcDate="true" />
	    <euc:EformHidden  RecordId="5" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_5" Runat="server"/></td>
    <td style="text-align: center;">
        <euc:EformComboBox LookupCode="OpSurgeon" Width="80px" id="ProcSurgeon_5" RecordId="5" Table="Procedures" 
            Field="ProcSurgeon" runat="server" DropDownWidth="200px"/></td>
    <td style="text-align: center;"><euc:EformComboBox Width="90px" RecordId="5" TABLE="Procedures" FIELD="ProcName" ID="ProcName_5" 
            LookupCode="ProcName" Runat="server" DropDownWidth="200px" /></td>
    <td style="text-align: center;"><euc:EformSelect RecordId="5" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_5" 
        LookupCode="OpSide" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px" /></td>
    <td style="text-align: center;"><euc:EformSelect RecordId="5"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_5" 
        LookupCode="DxTarget" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/> </td>
    <td><euc:EformComboBox id="ProcInstitution_5" RecordId="5" Table="Procedures" Field="ProcInstitution" runat="server" Width="80px" 
            LookupCode="Institution" /></td>
	<td align="center"><euc:EformComboBox id="ProcService_5" RecordId="5" Table="Procedures" Field="ProcService" runat="server" 
	    Width="70px" LookupCode="PhSpecialty" DropDownWidth="auto" /></td>
	<td align="center"><euc:EformDropDownList id="ProcQuality_5" RecordId="5" Table="Procedures" Field="ProcQuality" runat="server" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  
                onclick="return showFirstAdditionalRow(this,'PedsNeuroProcTable');" /><br /><br /><br />
                

<span class="controlBoxTitle">Pathology</span><br />  
<table width="650" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroPathTable">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Histology</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Path #</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Spec Type</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>    
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Pathologist</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>   
  <tr>
	<td height="28" class="ClinicalEformGridColumnOne">
	    <euc:EformTextBox  Width="75px" TABLE="Pathology" RecordId="1" FIELD="PathDateText" ID="PathDateText_1" Runat="server" ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="1"   ID="PathDate_1" Runat="server"/> 
    </td> 
    <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology" RecordId="1" ID="PathHistology_1" 
        LookupCode="PathHistology" Runat="server" DropDownWidth="350px"/></td> 
    <td align="center"><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="1" FIELD="PathNum" ID="PathNum_1" Runat="server" /></td>
    <td align="center"><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="1" FIELD="PathSpecimenType" ID="PathSpecimenType_1" 
        Runat="server" LookupCode="ProcName" /></td>
    <td align="center"><euc:EformSelect RecordId="1"  TABLE="Pathology" FIELD="PathSide" ID="PathSide_1" LookupCode="NodeSide" 
        Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="1"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_1" 
        LookupCode="DxTarget" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="1" FIELD="PathResult" ID="PathResult_1" 
        Runat="server" LookupCode="DxResult" /></td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="1" FIELD="Pathologist" ID="Pathologist_1" 
        Runat="server" LookupCode="Pathologist" /></td>
    <td><euc:EformComboBox id="PathInstitution_1" RecordId="1" Table="Pathology" Field="PathInstitution" runat="server" Width="80px" 
        LookupCode="Institution" /></td>
    <td align="center"><euc:EformTextBox  TABLE="Pathology" RecordId="1" FIELD="PathNotes" ID="PathNotes_1" Runat="server" 
        ShowTextEditor="true" MaxLength="8000" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="Pathology" RecordId="1" FIELD="PathQuality" ID="PathQuality_1" Runat="server"
        LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	<td height="28" class="ClinicalEformGridColumnOne">
	    <euc:EformTextBox  Width="75px" TABLE="Pathology" RecordId="2" FIELD="PathDateText" ID="PathDateText_2" Runat="server" ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="2"   ID="PathDate_2" Runat="server"/> 
    </td> 
    <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology" RecordId="2" ID="PathHistology_2" 
        LookupCode="PathHistology" Runat="server" DropDownWidth="350px"/></td> 
    <td align="center"><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="2" FIELD="PathNum" ID="PathNum_2" Runat="server" /></td>
    <td align="center"><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="2" FIELD="PathSpecimenType" ID="PathSpecimenType_2" 
        Runat="server" LookupCode="ProcName" /></td>
    <td align="center"><euc:EformSelect RecordId="2"  TABLE="Pathology" FIELD="PathSide" ID="PathSide_2" LookupCode="NodeSide" 
        Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="2"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_2" 
        LookupCode="DxTarget" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="2" FIELD="PathResult" ID="PathResult_2" 
        Runat="server" LookupCode="DxResult" /></td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="2" FIELD="Pathologist" ID="Pathologist_2" 
        Runat="server" LookupCode="Pathologist" /></td>
    <td><euc:EformComboBox id="PathInstitution_2" RecordId="2" Table="Pathology" Field="PathInstitution" runat="server" Width="80px" 
        LookupCode="Institution" /></td>
    <td align="center"><euc:EformTextBox  TABLE="Pathology" RecordId="2" FIELD="PathNotes" ID="PathNotes_2" Runat="server" 
        ShowTextEditor="true" MaxLength="8000" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="Pathology" RecordId="2" FIELD="PathQuality" ID="PathQuality_2" Runat="server"
        LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	<td height="28" class="ClinicalEformGridColumnOne">
	    <euc:EformTextBox  Width="75px" TABLE="Pathology" RecordId="3" FIELD="PathDateText" ID="PathDateText_3" Runat="server" ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="3"   ID="PathDate_3" Runat="server"/> 
    </td> 
    <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology" RecordId="3" ID="PathHistology_3" 
        LookupCode="PathHistology" Runat="server" DropDownWidth="350px"/></td> 
    <td align="center"><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="3" FIELD="PathNum" ID="PathNum_3" Runat="server" /></td>
    <td align="center"><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="3" FIELD="PathSpecimenType" ID="PathSpecimenType_3" 
        Runat="server" LookupCode="ProcName" /></td>
    <td align="center"><euc:EformSelect RecordId="3"  TABLE="Pathology" FIELD="PathSide" ID="PathSide_3" LookupCode="NodeSide" 
        Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="3"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_3" 
        LookupCode="DxTarget" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="3" FIELD="PathResult" ID="PathResult_3" 
        Runat="server" LookupCode="DxResult" /></td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="3" FIELD="Pathologist" ID="Pathologist_3" 
        Runat="server" LookupCode="Pathologist" /></td>
    <td><euc:EformComboBox id="PathInstitution_3" RecordId="3" Table="Pathology" Field="PathInstitution" runat="server" Width="80px" 
        LookupCode="Institution" /></td>
    <td align="center"><euc:EformTextBox  TABLE="Pathology" RecordId="3" FIELD="PathNotes" ID="PathNotes_3" Runat="server" 
        ShowTextEditor="true" MaxLength="8000" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="Pathology" RecordId="3" FIELD="PathQuality" ID="PathQuality_3" Runat="server"
        LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	<td height="28" class="ClinicalEformGridColumnOne">
	    <euc:EformTextBox  Width="75px" TABLE="Pathology" RecordId="4" FIELD="PathDateText" ID="PathDateText_4" Runat="server" ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="4"   ID="PathDate_4" Runat="server"/> 
    </td> 
    <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology" RecordId="4" ID="PathHistology_4" 
        LookupCode="PathHistology" Runat="server" DropDownWidth="350px"/></td> 
    <td align="center"><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="4" FIELD="PathNum" ID="PathNum_4" Runat="server" /></td>
    <td align="center"><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="4" FIELD="PathSpecimenType" ID="PathSpecimenType_4" 
        Runat="server" LookupCode="ProcName" /></td>
    <td align="center"><euc:EformSelect RecordId="4"  TABLE="Pathology" FIELD="PathSide" ID="PathSide_4" LookupCode="NodeSide" 
        Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="4"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_4" 
        LookupCode="DxTarget" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="4" FIELD="PathResult" ID="PathResult_4" 
        Runat="server" LookupCode="DxResult" /></td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="4" FIELD="Pathologist" ID="Pathologist_4" 
        Runat="server" LookupCode="Pathologist" /></td>
    <td><euc:EformComboBox id="PathInstitution_4" RecordId="4" Table="Pathology" Field="PathInstitution" runat="server" Width="80px" 
        LookupCode="Institution" /></td>
    <td align="center"><euc:EformTextBox  TABLE="Pathology" RecordId="4" FIELD="PathNotes" ID="PathNotes_4" Runat="server" 
        ShowTextEditor="true" MaxLength="8000" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="Pathology" RecordId="4" FIELD="PathQuality" ID="PathQuality_4" Runat="server"
        LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	<td height="28" class="ClinicalEformGridColumnOne">
	    <euc:EformTextBox  Width="75px" TABLE="Pathology" RecordId="5" FIELD="PathDateText" ID="PathDateText_5" Runat="server" ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="5"   ID="PathDate_5" Runat="server"/> 
    </td> 
    <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology" RecordId="5" ID="PathHistology_5" 
        LookupCode="PathHistology" Runat="server" DropDownWidth="350px"/></td> 
    <td align="center"><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="5" FIELD="PathNum" ID="PathNum_5" Runat="server" /></td>
    <td align="center"><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="5" FIELD="PathSpecimenType" ID="PathSpecimenType_5" 
        Runat="server" LookupCode="ProcName" /></td>
    <td align="center"><euc:EformSelect RecordId="5"  TABLE="Pathology" FIELD="PathSide" ID="PathSide_5" LookupCode="NodeSide" 
        Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="5"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_5" 
        LookupCode="DxTarget" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="5" FIELD="PathResult" ID="PathResult_5" 
        Runat="server" LookupCode="DxResult" /></td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="5" FIELD="Pathologist" ID="Pathologist_5" 
        Runat="server" LookupCode="Pathologist" /></td>
    <td><euc:EformComboBox id="PathInstitution_5" RecordId="5" Table="Pathology" Field="PathInstitution" runat="server" Width="80px" 
        LookupCode="Institution" /></td>
    <td align="center"><euc:EformTextBox  TABLE="Pathology" RecordId="5" FIELD="PathNotes" ID="PathNotes_5" Runat="server" 
        ShowTextEditor="true" MaxLength="8000" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="Pathology" RecordId="5" FIELD="PathQuality" ID="PathQuality_5" Runat="server"
        LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  
                onclick="return showFirstAdditionalRow(this,'PedsNeuroPathTable');" /><br /><br />
