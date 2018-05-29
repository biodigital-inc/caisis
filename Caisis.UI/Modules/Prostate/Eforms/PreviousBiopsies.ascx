<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PreviousBiopsies" CodeFile="PreviousBiopsies.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript">
	tableArray.PreviousBiopsiesHtmlTable = "PreviousBiopsiesHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="PreviousBiopsies" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Previous Biopsies" style="margin-right: 40px;"></asp:Label>
<span id="PreviousBiopsiesNotesContainer">
<euc:EformCheckBox runat="server" Table="NoTable" Field="PreviousBiopsiesNotes" id="PreviousBiopsiesNotes" Value="true" onclick="" style="margin-left: 40px;" />Check if None
</span>
<span id="PreviousBiopsiesContainer">
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PreviousBiopsiesHtmlTable">
  <tr> 
            <td height="20" align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Date</td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Biopsy Type</td>
            <td align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Results</td>
            <td  align="center" valign="middle" class="controlBoxDataGridHeaderFirstCol">Comments</td>
            <td align="center"  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td class="hpiDateColumn">
      <euc:EformTextBox Runat="server" RecordId="21"  ID="ProcDateText_21" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" />
      <euc:EformHidden RecordId="21" Runat="server" ID="ProcDate_21" Table="Procedures" Field="ProcDate" />    </td>
    <td><euc:EformComboBox  LookupCode="ProcName"  DropDownWidth="450px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_21"  runat="server" RecordId="21"    /></td>
    <td><euc:EformComboBox   LookupCode="BxResult"  style="width:150px;" Field="PathResult" DropDownWidth="330px"  RecordId="21" Table="Pathology" Runat="server" id="PathResult_21"    /></td>
    <td><euc:EformTextBox   style="width:140px;" Field="PathNotes"  ShowTextEditor="true"  RecordId="21" Table="Pathology" Runat="server" id="PathNotes_21"    /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="hpiDateColumn">
      <euc:EformTextBox Runat="server" RecordId="22"  ID="ProcDateText_22" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" />
      <euc:EformHidden RecordId="22" Runat="server" ID="ProcDate_22" Table="Procedures" Field="ProcDate" />    </td>
    <td><euc:EformComboBox  LookupCode="ProcName"  DropDownWidth="450px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_22"  runat="server" RecordId="22"    /></td>
    <td><euc:EformComboBox   LookupCode="BxResult"  style="width:150px;" Field="PathResult" DropDownWidth="330px"  RecordId="22" Table="Pathology" Runat="server" id="PathResult_22"    /></td>
    <td><euc:EformTextBox   style="width:140px;" Field="PathNotes"  ShowTextEditor="true"  RecordId="22" Table="Pathology" Runat="server" id="PathNotes_22"    /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td class="hpiDateColumn">
      <euc:EformTextBox Runat="server" RecordId="23"  ID="ProcDateText_23" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" />
      <euc:EformHidden RecordId="23" Runat="server" ID="ProcDate_23" Table="Procedures" Field="ProcDate" />    </td>
    <td><euc:EformComboBox  LookupCode="ProcName"  DropDownWidth="450px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_23"  runat="server" RecordId="23"    /></td>
    <td><euc:EformComboBox   LookupCode="BxResult"  style="width:150px;" Field="PathResult" DropDownWidth="330px"  RecordId="23" Table="Pathology" Runat="server" id="PathResult_23"    /></td>
    <td><euc:EformTextBox   style="width:140px;" Field="PathNotes"  ShowTextEditor="true"  RecordId="23" Table="Pathology" Runat="server" id="PathNotes_23"    /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;">
    <td class="hpiDateColumn">
      <euc:EformTextBox Runat="server" RecordId="24"  ID="ProcDateText_24" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" />
      <euc:EformHidden RecordId="24" Runat="server" ID="ProcDate_24" Table="Procedures" Field="ProcDate" />    </td>
    <td><euc:EformComboBox  LookupCode="ProcName"  DropDownWidth="450px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_24"  runat="server" RecordId="24"    /></td>
    <td><euc:EformComboBox   LookupCode="BxResult"  style="width:150px;" Field="PathResult" DropDownWidth="330px"  RecordId="24" Table="Pathology" Runat="server" id="PathResult_24"    /></td>
    <td><euc:EformTextBox   style="width:140px;" Field="PathNotes"  ShowTextEditor="true"  RecordId="24" Table="Pathology" Runat="server" id="PathNotes_24"    /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;">
    <td class="hpiDateColumn">
      <euc:EformTextBox Runat="server" RecordId="25"  ID="ProcDateText_25" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" />
      <euc:EformHidden RecordId="25" Runat="server" ID="ProcDate_25" Table="Procedures" Field="ProcDate" />    </td>
    <td><euc:EformComboBox  LookupCode="ProcName"  DropDownWidth="450px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_25"  runat="server" RecordId="25"    /></td>
    <td><euc:EformComboBox   LookupCode="BxResult"  style="width:150px;" Field="PathResult" DropDownWidth="330px"  RecordId="25" Table="Pathology" Runat="server" id="PathResult_25"    /></td>
    <td><euc:EformTextBox   style="width:140px;" Field="PathNotes"  ShowTextEditor="true"  RecordId="25" Table="Pathology" Runat="server" id="PathNotes_25"    /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PreviousBiopsiesHtmlTable');" />
</span>
<br/><br/><br/>
<script type="text/javascript">
//showHideBasedOnCheckboxToggle($('PreviousBiopsiesNotesContainer'), $('PreviousBiopsiesContainer'));
</script>