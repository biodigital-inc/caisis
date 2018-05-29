<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateInstructionsFactCards" CodeFile="BiopsyOfProstateInstructionsFactCards.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="InstructionsFactCards" id="InstructionsFactCards" />
<span class="controlBoxTitle">Instructions and Fact Cards</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="650" class="eformLargePopulatedTable">

 <tr >
	<td  style="vertical-align: top; width: 35px; padding-right: 0px;">
		
		<euc:EformCheckBox Table="Encounters" Field="EncNotes" id="EncNotes" runat="server" Value ="Pre and Post instructions reviewed. Fact Cards Prior to Your Prostate Biopsy and After Your Prostate Biopsy provided to patient">
		</euc:EformCheckBox>
		
	
	</td>
	<td style="vertical-align: top; width: 565px; padding-left: 0px;">Pre and Post instructions reviewed. Fact Cards "Prior to Your Prostate Biopsy" and "After Your Prostate Biopsy" provided to patient<br /><br />
	</td>

  </tr>
  </table>
<br/><br/><br/>
