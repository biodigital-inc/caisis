<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxEncounters" CodeFile="OropharynxEncounters.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="OropharynxEncounters" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Assessment"></asp:Label><br/>

<table width="650" border="0" cellspacing="0" cellpadding="10" style="border: solid 1px #cccccc;">
  <tr>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>Date</strong></td>
    <td width="120" class="ClinicalEformGridColumnOne"><euc:EformTextBox id="EncDateText" RecordId="1" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="80px"/>
                                               		   <euc:EformHidden id="EncDate" RecordId="1" Table="Encounters" Field="EncDate" Runat="server"/></td>
	<td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>Attending</strong></td>
	<td width="100" class="ClinicalEformGridColumnTwo"><euc:EformComboBox Width="80px" LookupCode="Physician" id="EncPhysician" RecordId="1" Table="Encounters" Field="EncPhysician" runat="server"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>KPS</strong></td>
    <td width="100" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="KPS" ShowNumberPad="true"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
