<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.NephSurgicalDetails" CodeFile="NephSurgicalDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="NephSurgicalDetails" />

<span class="controlBoxTitle">Surgical Details</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Drains</strong>&nbsp;&nbsp;
				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcDrains" LookupCode="YesNoUnknown" id="ProcDrains" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				</euc:EformRadioButtonList>

	</td>
</tr>
<tr>
	
	<td style="padding-top: 12px;">
		<strong>Estimated time with CO2 pressure > 15mHg </strong>&nbsp;&nbsp;

		<euc:EformTextBox CssClass="InputText" style="width: 75px;" Table="NephrectomyProc" Field="ProcCO2_PressureDuration" id="ProcCO2_PressureDuration" runat="server" ShowNumberPad="true" /> minutes

	</td>	
  </tr>
    <tr>
    	
	    <td style="padding-top: 12px;">
		    <strong>Percent of kidney spared&nbsp;&nbsp;
		<euc:EformTextBox CssClass="InputText" style="width: 75px;" Table="NephrectomyProc" Field="ProcPercKidneySpared" id="ProcPercKidneySpared" runat="server" ShowNumberPad="true" /> %
       
       
        </td>	
    </tr>  
    <tr>
    	
	    <td style="padding-top: 12px;">
		    <strong>Intraoperative Complications</strong>&nbsp;&nbsp;


				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcComplication" LookupCode="YesNoUnknown" id="ProcComplication" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				</euc:EformRadioButtonList>
        </td>	
    </tr>
       
</table>
<br/><br/>








