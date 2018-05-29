<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.HPI_Bladder" CodeFile="HPI_Bladder.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="HPI_Bladder" /><span class="controlBoxTitle">HPI</span><br/>
<asp:Literal ID="NoHPIMsg" Runat="server" Visible="False">No history of present illness found for this patient.</asp:Literal>
<table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable">

        <asp:Repeater ID="hpi" runat="server" >
		<ItemTemplate>
				<tr class="ClinicalEformPopulatedRow" > 
	                <td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "patientHPI") %></td>
                </tr>  
		</ItemTemplate>
	  </asp:Repeater>
      <tr ID="NoHPIMsgTr" Runat="server" Visible="True"><td ID="NoHPIMsgTd" Runat="server">No history of present illness found for this patient.</td></tr>

</table>
<br/>
<br/>
<br/>