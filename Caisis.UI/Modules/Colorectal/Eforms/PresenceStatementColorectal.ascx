<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.PresenceStatementColorectal" CodeFile="PresenceStatementColorectal.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="PresenceStatementColorectal" id="PresenceStatementColorectal" />
<span class="controlBoxTitle">Presence Statement</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td  style="padding-bottom: 0px;">
		
		<euc:EformRadioButtonList Table="OperatingRoomDetails" Field="OpPresenceStatement" id="OpPresenceStatement" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" CellSpacing="16">
			
				<asp:ListItem Value="I personally performed or was physically present during the entire procedure today" Text="I personally performed or was physically present during <strong>the entire procedure</strong> today" />
				<asp:ListItem Value="I personally performed or was physically present for key portions of the procedure today" Text="I personally performed or was physically present for <strong>key portions</strong> of the procedure today" ></asp:ListItem>
		</euc:EformRadioButtonList>
		
	
	</td>

  </tr>
  <tr><td style="padding-top: 0px; padding-left: 55px;">
        	Specify Key Portions:<br />
        	
        	<euc:EformExtendedCheckboxList ShowOther="true" TABLE="OperatingRoomDetails" FIELD="OpPresenceKeyPortions" id="OpPresenceKeyPortions" CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server">
                <asp:ListItem  >Exploration</asp:ListItem>
                <asp:ListItem  >Tumor Resection</asp:ListItem>
                <asp:ListItem  >Restoration of Intestinal Continuity</asp:ListItem>
			</euc:EformExtendedCheckboxList>
        	
        	
        
  </td></tr>
</table>
<br/><br/><br/>
