<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.NumberKidneyTumors" CodeFile="NumberKidneyTumors.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="NumberKidneyTumors" />
<span class="controlBoxTitle">Number of Tumors</span><br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
        <euc:EformExtendedRadioButtonList ShowOther="true" Table="NephrectomyProc"  Field="ProcNumTumors" id="ProcNumTumors" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
            <asp:ListItem  >1</asp:ListItem>
            <asp:ListItem  >2</asp:ListItem>
            <asp:ListItem  >3</asp:ListItem>
            <asp:ListItem  >4</asp:ListItem>
          </euc:EformExtendedRadioButtonList>

	</td>

  </tr>
</table>
<br/><br/><br/>
