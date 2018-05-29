<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateUSClinicalStages" CodeFile="BiopsyOfProstateUSClinicalStages.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="USClinicalStageT" />
<span class="controlBoxTitle">&nbsp;&nbsp;Ultrasound Clinical Stage</span>
<table border="0" cellspacing="0" cellpadding="2" width="650" class="eformLargePopulatedTable">
   <tr >
	<td width="80%" style="padding-top: 20px;padding-bottom: 20px;">	
		<euc:EformRadioButtonList Table="DxImageProstate" Field="ImgClinStageT" id="ImgClinStageT" RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="7" runat="server" >	
		    <asp:ListItem  >T1c</asp:ListItem>
			<asp:ListItem  >T2a</asp:ListItem>
		    <asp:ListItem  >T2b</asp:ListItem>
			<asp:ListItem  >T2c</asp:ListItem>
			<asp:ListItem  >T3a</asp:ListItem>
			<asp:ListItem  >T3b</asp:ListItem>
			<asp:ListItem  >T3c</asp:ListItem>		
		</euc:EformRadioButtonList> 	
	</td>
  </tr>
 </table>
<br/><br/>