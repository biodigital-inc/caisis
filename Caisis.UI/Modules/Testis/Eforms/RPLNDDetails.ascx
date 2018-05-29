<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Testis.Eforms.RPLNDDetails" CodeFile="RPLNDDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="RPLNDDetails" />
<span class="controlBoxTitle">RPLND Details</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="650" class="eformLargePopulatedTable">

 <tr >
      <tr >
	<td colspan="2">
				<strong style="margin-right: 15px;">RPLND Type</strong>
				<euc:EformCheckBoxList TABLE="Procedures" RecordId="1" FIELD="ProcNotes" id="ProcNotes_1" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" >
				<asp:ListItem Value="Primary">1&deg;&nbsp;&nbsp;&nbsp;</asp:ListItem>
				<asp:ListItem Value="Post-Chemo">Post-Chemo</asp:ListItem>
				</euc:EformCheckBoxList>
				<euc:EformCheckBox TABLE="RPLND_Proc" RecordId="1" ParentRecordId="1" FIELD="ProcDesperation" id="ProcDesperation" CellSpacing="0" runat="server" Value="Yes" style="margin-left: 6px;"/>Desperation
					</td>
	</tr>
	<tr>
	<td >
				<strong>RPLND Dissecion Extent</strong><br />
				<euc:EformRadioButtonList ShowOther="true" TABLE="RPLND_Proc" RecordId="1" ParentRecordId="1"  FIELD="ProcDissectionExtent" LookupCode="OpDissectionExtentRPLND" id="ProcDissectionExtent" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" />	</td>
	<td >
				<strong>Type of Incision</strong><br />
				<euc:EformRadioButtonList ShowOther="true" TABLE="RPLND_Proc" RecordId="1" ParentRecordId="1"  FIELD="ProcIncisionType" LookupCode="OpIncisionType" id="ProcIncisionType" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" />	</td>

  </tr>
   <tr >
	<td colspan="2">
				<strong style="margin-right: 15px;">Nerves Preserved</strong><euc:EformRadioButtonList TABLE="RPLND_Proc" RecordId="1" ParentRecordId="1"  FIELD="ProcNerveSparing" LookupCode="YesNoUnknown" id="ProcNerveSparing" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />	</td>
	</tr>
</table>
<br/><br/>