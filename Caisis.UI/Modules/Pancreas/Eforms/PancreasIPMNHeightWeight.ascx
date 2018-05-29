<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasIPMNHeightWeight" CodeFile="PancreasIPMNHeightWeight.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PancreasIPMNHeightWeight" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Height and Weight"></asp:Label><br/>

<table width="650" border="0" cellspacing="0" cellpadding="6" style="border: solid 1px #cccccc;">
  <tr>
    <td width="75" align="left" class="ClinicalEformGridColumnOne"><strong>Height<br />(cm)</strong></td>
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height" ShowNumberPad="true"/></td>
    <td width="75" align="left" class="ClinicalEformGridColumnTwo"><strong>Weight<br />(kg)</strong></td>
    <td class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" RecordId="1" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight" ShowNumberPad="true"/></td>
    <td width="75" align="left" class="ClinicalEformGridColumnOne"><strong>Date</strong></td>
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" ID="EncDateText" RecordId="1" TABLE="Encounters" FIELD="EncDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	        <euc:EformHidden Runat="server" ID="EncDate" RecordId="1" Table="Encounters" Field="EncDate" />
	</td>	         
   </tr>
</table>
<br/>
<br/>
<br/>