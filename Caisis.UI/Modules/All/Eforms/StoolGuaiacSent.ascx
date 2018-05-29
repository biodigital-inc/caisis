<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.StoolGuaiacSent" CodeFile="StoolGuaiacSent.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="StoolGuaiacSent"  />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td class="controlBoxTitle">
		Stool Guaiac Sent?&nbsp;&nbsp;&nbsp;
        <euc:EformExtendedRadioButtonList ID="StoolGuaiac" runat="server" Table="NoTable" Field="StoolGuaiacSent" RepeatLayout="Flow" RepeatDirection="Horizontal" >
            <asp:ListItem Value="Yes" >Yes&nbsp;&nbsp;</asp:ListItem>
            <asp:ListItem Value="No" >No</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
	</td>

  </tr>

</table>
<br/><br/>
