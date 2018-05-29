<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.ReasonPartialPlanned" CodeFile="ReasonPartialPlanned.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="ReasonPartialPlanned" />
<span class="controlBoxTitle">Reason PN Planned</span><br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >


				<euc:EformExtendedRadioButtonList ShowOther="true" TABLE="NephrectomyProc" FIELD="ProcPartialReason" LookupCode="OpPartialReason" id="ProcPartialReason" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
				</euc:EformExtendedRadioButtonList>



        
	</td>

  </tr>
</table>
<br/>

<span class="controlBoxTitle">Reason for Conversion</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		<euc:EformTextBox CssClass="InputText" style="width: 550px;" Table="NephrectomyProc" Field="ProcConversionReason" id="ProcConversionReason" runat="server" />
	</td>

  </tr>
</table>
<br/><br/><br/>

