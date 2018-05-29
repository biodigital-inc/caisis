<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Testis.Eforms.RPLNDAndAncillaryProcedures" CodeFile="RPLNDAndAncillaryProcedures.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">
#RPLNDAndAncillaryProceduresTable
{
	width: auto;
	border: solid 1px #cccccc;
	border-right: none;
	border-bottom: none;
	background-color: #ffffff;
}
#RPLNDAndAncillaryProceduresTable td
{
	border-right:  solid 1px #cccccc;
	border-bottom:  solid 1px #cccccc;
	padding-left: 8px;
	padding-right: 8px;
}
.headerRow td
{
	background-color: #efefef;
	text-align: center;
	font-size: 11px;
	font-weight: bold;
}
td.LeftCell
{
	background-color: #ffffff;
	font-size: 13px;
}
td.disabledCell
{
	background-color: #f4f4f4;
	font-size: 11px;
	color: #cccccc;
	text-align: center;
}

</style>


<euc:EformHidden id="ProcDate_1" Table="Procedures" Field="ProcDate"  RecordId="1" runat="server"/>
<euc:EformHidden id="ProcDate_2" Table="Procedures" Field="ProcDate"  RecordId="2" runat="server"/>
<euc:EformHidden id="ProcDate_3" Table="Procedures" Field="ProcDate"  RecordId="3" runat="server"/>
<euc:EformHidden id="ProcDate_4" Table="Procedures" Field="ProcDate"  RecordId="4" runat="server"/>
<euc:EformHidden id="ProcDate_5" Table="Procedures" Field="ProcDate"  RecordId="5" runat="server"/>
<euc:EformHidden id="ProcDate_6" Table="Procedures" Field="ProcDate"  RecordId="6" runat="server"/>
<euc:EformHidden id="ProcDate_7" Table="Procedures" Field="ProcDate"  RecordId="7" runat="server"/>
<euc:EformHidden id="ProcDate_8" Table="Procedures" Field="ProcDate"  RecordId="8" runat="server"/>

<euc:EformHidden id="ProcSite_1" Table="Procedures" Field="ProcSite"  RecordId="1" runat="server" Value="Testis" />
<euc:EformHidden id="ProcSite_2" Table="Procedures" Field="ProcSite"  RecordId="2" runat="server" Value="Testis" />
<euc:EformHidden id="ProcSite_3" Table="Procedures" Field="ProcSite"  RecordId="3" runat="server" Value="Testis" />
<euc:EformHidden id="ProcSite_4" Table="Procedures" Field="ProcSite"  RecordId="4" runat="server" Value="Testis" />
<euc:EformHidden id="ProcSite_5" Table="Procedures" Field="ProcSite"  RecordId="5" runat="server" Value="Testis" />
<euc:EformHidden id="ProcSite_6" Table="Procedures" Field="ProcSite"  RecordId="6" runat="server" Value="Testis" />
<euc:EformHidden id="ProcSite_7" Table="Procedures" Field="ProcSite"  RecordId="7" runat="server" Value="Testis" />
<euc:EformHidden id="ProcSite_8" Table="Procedures" Field="ProcSite"  RecordId="8" runat="server" Value="Testis" />

<a name="RPLNDAndAncillaryProcedures" id="RPLNDAndAncillaryProcedures" />
<span class="controlBoxTitle" style="font-size: 12px;">RPLND &amp; Ancillary Procedures</span><br/>
<table id="RPLNDAndAncillaryProceduresTable" cellspacing="0">
<tr class="headerRow">
  <td style="width: 115px;">&nbsp;</td>
  <td style="font-size: 11px;">Date</td>
  <td style="font-size: 11px;">Side</td>
  </tr>
<tr>
<td class="LeftCell">
	<euc:EformCheckBox RecordId="1" Table="Procedures" Field="ProcName" id="ProcName_1" Value="RPLND" runat="server"  EnableHiddenOnUIEvent="ProcSite_1" /> RPLND</td>
<td><euc:EformTextBox RecordId="1" id="ProcDateText_1" Table="Procedures" Field="ProcDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="76px"/></td>
<td class="disabledCell">n/a</td>
</tr>
<tr>
  <td class="LeftCell">
	<euc:EformCheckBox RecordId="2" Table="Procedures" Field="ProcName" id="ProcName_2" Value="PLND" runat="server"  EnableHiddenOnUIEvent="ProcSite_2" /> PLND</td>
  <td><euc:EformTextBox RecordId="2" id="ProcDateText_2" Table="Procedures" Field="ProcDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="76px"/></td>
  <td class="disabledCell">n/a</td>
  </tr>
<tr>
  <td class="LeftCell">
	<euc:EformCheckBox RecordId="3" Table="Procedures" Field="ProcName" id="ProcName_3" Value="Orchiectomy" runat="server"  EnableHiddenOnUIEvent="ProcSite_3" /> Orchiectomy</td>
  <td><euc:EformTextBox RecordId="3" id="ProcDateText_3" Table="Procedures" Field="ProcDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="76px"/></td>
  <td><euc:EFormSelect DropDownHeight="auto" style="width:56px;" LookupCode="OpSide" runat="server"  Field="ProcSide" RecordId="3" Table="Procedures" id="ProcSide_3" DropDownWidth="60" /></td>
  </tr>
<tr>
  <td class="LeftCell">
	<euc:EformCheckBox RecordId="4" Table="Procedures" Field="ProcName" id="ProcName_4" Value="Thoracotomy" runat="server"  EnableHiddenOnUIEvent="ProcSite_4" /> Thoracotomy</td>
  <td><euc:EformTextBox RecordId="4" id="ProcDateText_4" Table="Procedures" Field="ProcDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="76px"/></td>
  <td><euc:EFormSelect DropDownHeight="auto" style="width:56px;" LookupCode="OpSide" runat="server"  Field="ProcSide" RecordId="4" Table="Procedures" id="ProcSide_4" DropDownWidth="60" /></td>
  </tr>
<tr>
  <td class="LeftCell">
	<euc:EformCheckBox RecordId="5" Table="Procedures" Field="ProcName" id="ProcName_5" Value="Mediastinal Mass Resection" runat="server"  EnableHiddenOnUIEvent="ProcSite_5" /> Mediastinal Mass Resection</td>
  <td><euc:EformTextBox RecordId="5" id="ProcDateText_5" Table="Procedures" Field="ProcDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="76px"/></td>
  <td class="disabledCell">n/a</td>
  </tr>
<tr>
  <td class="LeftCell">
	<euc:EformCheckBox RecordId="6" Table="Procedures" Field="ProcName" id="ProcName_6" Value="Neck Dissection" runat="server"  EnableHiddenOnUIEvent="ProcSite_6" /> Neck Dissection</td>
  <td><euc:EformTextBox RecordId="6" id="ProcDateText_6" Table="Procedures" Field="ProcDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="76px"/></td>
  <td class="disabledCell">n/a</td>
  </tr>
<tr>
  <td class="LeftCell">
	<euc:EformCheckBox RecordId="7" Table="Procedures" Field="ProcName" id="ProcName_7" Value="Hepatic Resection" runat="server"  EnableHiddenOnUIEvent="ProcSite_7" /> Hepatic Resection</td>
  <td><euc:EformTextBox RecordId="7" id="ProcDateText_7" Table="Procedures" Field="ProcDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="76px"/></td>
  <td class="disabledCell">n/a</td>
  </tr>
<tr>
  <td class="LeftCell">
	<euc:EformCheckBox RecordId="8" Table="Procedures" Field="ProcName" id="ProcName_8" Value="Nephrectomy" runat="server"  EnableHiddenOnUIEvent="ProcSite_8" /> Nephrectomy</td>
  <td><euc:EformTextBox RecordId="8" id="ProcDateText_8" Table="Procedures" Field="ProcDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="76px"/></td>
  <td class="disabledCell">n/a</td>
  </tr>
</table>
<br/><br/>