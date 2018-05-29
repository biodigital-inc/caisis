<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateDisposition" CodeFile="BiopsyOfProstateDisposition.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<span class="controlBoxTitle">&nbsp;Disposition</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="650" class="eformLargePopulatedTable">

 <tr >
	<td  style="padding-bottom: 0px;">
		
		<euc:EformExtendedRadioButtonList Table="NoTable" Field="Disposition" id="Disposition" ShowOther="true" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
			
				<asp:ListItem >Discharge Home</asp:ListItem>
				<asp:ListItem >Transfer to UCC</asp:ListItem>
				
		</euc:EformExtendedRadioButtonList>
		
	
	</td>

  </tr> 
</table>
<br/><br/>