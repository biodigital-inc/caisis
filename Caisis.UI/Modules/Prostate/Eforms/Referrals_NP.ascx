<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.Referrals_NP" CodeFile="Referrals_NP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<style type="text/css">
.ReferralsContainer td
{
    padding: 0px 20px 0px 0px;
}
</style>

<a name="Referrals_NP"  />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Referrals" /><br/>
<table border="0" cellspacing="0"  width="650"  class="eformLargePopulatedTable" >
  <tr>
    <td class="ReferralsContainer" >
    
    <euc:EformCheckBoxList RepeatLayout="Table"  RepeatDirection="Horizontal" RepeatColumns="4" TABLE="NoTable"  FIELD="Referrals" id="Referrals" runat="server" ShowOther="false">
		    <asp:ListItem>Repeat Biopsy</asp:ListItem>
		    <asp:ListItem>Sexual Med Consult</asp:ListItem>
		    <asp:ListItem>Rad Tx Consult</asp:ListItem>
		    <asp:ListItem>Med Oncology Consult</asp:ListItem>
		    <asp:ListItem>Med / Cardiology</asp:ListItem>
		    <asp:ListItem>eMRI</asp:ListItem>
		    <asp:ListItem>Sperm Banking</asp:ListItem>
    </euc:EformCheckBoxList>
    
    
	</td>
  </tr>
</table>
<br/><br/><br/>