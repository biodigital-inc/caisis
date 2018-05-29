<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Testis.Eforms.OrchiectomyDetails" CodeFile="OrchiectomyDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<style type="text/css">
#TestisInvasionTable 
{
    border: solid 1px #cccccc;
    background-color: #ffffff;
}
#TestisInvasionTable td
{
    border-bottom: solid 1px #e8e8e8;
}
</style>

<a name="OrchiectomyDetails" />
<span class="controlBoxTitle">Orchiectomy Details</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="650" class="eformXLargePopulatedTable">
<tr><td colspan="2">
<strong>Max Dimension Cancer</strong>&nbsp;&nbsp;&nbsp;<euc:EformTextbox   runat="server" style="width:60px;" TABLE="OrchiectomyPath" FIELD="PathCancerMaxDim"  RecordId="1" ParentRecordId="2" id="PathCancerMaxDim" />
</td>
  </tr>
<tr><td colspan="2">
<strong>Other Testis</strong>&nbsp;&nbsp;&nbsp;<euc:EformTextarea runat="server" style="width:500px; height: 50px; vertical-align: text-top;" TABLE="OrchiectomyPath" FIELD="PathOtherTestis"  RecordId="1" ParentRecordId="2" id="PathOtherTestis" />
</td>
  </tr>
<tr>
<td style="width: 50%; vertical-align: top;">
<strong>Invasion</strong>
<table id="TestisInvasionTable" border="0" cellspacing="0" cellpadding="4">
	<tr >
	  <td style="width: 130px;"><strong >Vascular Invasion</strong></td>
	<td>
				<euc:EformRadioButtonList TABLE="OrchiectomyPath" RecordId="1" ParentRecordId="2" FIELD="PathVascularInv" LookupCode="YesNoUnknown" id="PathVascularInv" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />	</td>
	</tr>
<tr >
  <td><strong >Sperm Cord</strong></td>
	<td>
				<euc:EformRadioButtonList TABLE="OrchiectomyPath" RecordId="1" ParentRecordId="2" FIELD="PathSpermaticCordInv" LookupCode="YesNoUnknown" id="PathSpermaticCordInv" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />	</td>
	</tr>
<tr >
  <td><strong >Scrotal</strong></td>
	<td>
				<euc:EformRadioButtonList TABLE="OrchiectomyPath" RecordId="1" ParentRecordId="2" FIELD="PathScrotalInv" LookupCode="YesNoUnknown" id="PathScrotalInv" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />	</td>
	</tr>
	<tr >
	  <td><strong >Epididymis</strong></td>
	<td>
				<euc:EformRadioButtonList TABLE="OrchiectomyPath" RecordId="1" ParentRecordId="2" FIELD="PathEpididymisInv" LookupCode="YesNoUnknown" id="PathEpididymisInv" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />	</td>
	</tr>
<tr >
  <td><strong >Rete Testis</strong></td>
	<td>
				<euc:EformRadioButtonList TABLE="OrchiectomyPath" RecordId="1" ParentRecordId="2" FIELD="PathReteTestisInv" LookupCode="YesNoUnknown" id="PathReteTestisInv" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />	</td>
	</tr>
<tr >
  <td><strong >Tunica Albuginea</strong></td>
	<td>
				<euc:EformRadioButtonList TABLE="OrchiectomyPath" RecordId="1" ParentRecordId="2" FIELD="PathTunicaAlbugineaInv" LookupCode="YesNoUnknown" id="PathTunicaAlbugineaInv" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" />	</td>
	</tr></table></td>
<td style="width: 50%; vertical-align: top;"><strong>Histology</strong><br />
 <div style="border: solid 1px #999999; padding: 4px; background-color: #f8f8f8;">
 <euc:EformRadioButtonList TABLE="Pathology" RecordId="2" ParentRecordId="3"  FIELD="PathHistology" id="PathHistology" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" >
	 <asp:ListItem Value="Leydig Cell">Leydig Cell</asp:ListItem>
	 <asp:ListItem Value="Sertoli Cell">Sertoli Cell</asp:ListItem>
 </euc:EformRadioButtonList>
 </div>
</td>
</tr>
</table>
<br/><br/>