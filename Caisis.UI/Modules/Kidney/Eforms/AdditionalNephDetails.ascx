<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.AdditionalNephDetails" CodeFile="AdditionalNephDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="AdditionalNephDetails" />

<span class="controlBoxTitle">Additional Nephrectomy Details</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Ureteral Stent</strong>&nbsp;&nbsp;
				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcUreteralStent" LookupCode="YesNoUnknown" id="ProcUreteralStent" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				</euc:EformRadioButtonList>

	</td>
</tr>
<tr>
	
	<td style="padding-top: 12px;">
		<strong>Collecting System Entry</strong>&nbsp;&nbsp;

				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcCollectingSystemEntry" LookupCode="YesNoUnknown" id="ProcCollectingSystemEntry" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				</euc:EformRadioButtonList>

	</td>	
  </tr>
    <tr>
    	
	    <td style="padding-top: 12px;">
		    <strong>Collecting System Repair</strong>&nbsp;&nbsp;


				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcCollectingSystemRepair" LookupCode="YesNoUnknown" id="ProcCollectingSystemRepair" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				</euc:EformRadioButtonList>

        </td>	
    </tr>  
    <tr>
    	
	    <td style="padding-top: 12px;">
		    <strong>Renal Vein Clamping</strong>&nbsp;&nbsp;


				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcRenalVeinClamping" LookupCode="YesNoUnknown" id="ProcRenalVeinClamping" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				</euc:EformRadioButtonList>
        </td>	
    </tr>
        <tr>
    	
	    <td style="padding-top: 12px;">
		    <strong>Number of Renal Arteries</strong>&nbsp;&nbsp;

				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcNumRenalArteries" id="ProcNumRenalArteries" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				    <asp:ListItem >1</asp:ListItem>
				    <asp:ListItem >2</asp:ListItem>
				    <asp:ListItem >3</asp:ListItem>
				    <asp:ListItem >4</asp:ListItem>
				</euc:EformRadioButtonList>

        </td>	
    </tr>
        <tr>
    	
	    <td style="padding-top: 12px;">
		    <strong>Number of Renal Arteries Clamped</strong>&nbsp;&nbsp;


				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcNumRenalArteriesOccluded" id="ProcNumRenalArteriesOccluded" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				    <asp:ListItem >1</asp:ListItem>
				    <asp:ListItem >2</asp:ListItem>
				    <asp:ListItem >3</asp:ListItem>
				    <asp:ListItem >4</asp:ListItem>
				</euc:EformRadioButtonList>

        </td>	
    </tr>
        <tr>
    	
	    <td style="padding-top: 12px;">
		    <strong>Sinus Fat Extension</strong>&nbsp;&nbsp;

				<euc:EformRadioButtonList TABLE="NephrectomyProc" FIELD="ProcSinusFatExtension" LookupCode="YesNoUnknown" id="ProcSinusFatExtension" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server">
				</euc:EformRadioButtonList>


        </td>	
    </tr>
  
</table>
<br/><br/>








