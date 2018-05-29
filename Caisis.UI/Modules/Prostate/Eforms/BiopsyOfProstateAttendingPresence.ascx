<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateAttendingPresence" CodeFile="BiopsyOfProstateAttendingPresence.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<span class="controlBoxTitle">&nbsp;Verification of Attending Presence</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="650" class="eformLargePopulatedTable">

 <tr >
	<td  style="padding-bottom: 0px;">		
		<euc:EformRadioButtonList Table="Procedures" Field="ProcNotes" id="AttendingPresence" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">			
				<asp:ListItem >I was present for the entire procedure</asp:ListItem>
				<asp:ListItem >I was present for all key portions of the procedure, including but not limited to radiologic interpretation on ultra-sonographic findings and needle guided biopsy</asp:ListItem>
		</euc:EformRadioButtonList>	
	</td>

  </tr>
  
</table>
<br/><br/>
