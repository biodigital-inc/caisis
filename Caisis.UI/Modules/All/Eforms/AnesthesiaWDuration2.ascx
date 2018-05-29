<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.AnesthesiaWDuration2" CodeFile="AnesthesiaWDuration2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="AnesthesiaWDuration2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Anesthesia"></asp:Label><br/>
  
  
  <table border="0" cellspacing="0" cellpadding="4" width="600" class="eformLargePopulatedTable">

 <tr >
    <td style="width: 140px; text-align: right; height: 40px;">
        ASA Score
    </td>
	<td >


				<euc:EFormSelect LookupCode="ASA_Score" style="width:35px;" runat="server" RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpASA" ID="ASA" DropDownWidth="420" DropDownHeight="auto"/>

        
	</td>
  </tr>
 <tr >
    <td style="text-align: right; height: 30px;">
        Anesthesia Duration
    </td>
    <td>
                <euc:EformTextBox style="width: 80px;" RecordId="1"  Table="OperatingRoomDetails" Field="OpAnesthesiaDuration" id="OpAnesthesiaDuration" runat="server" ShowNumberPad="true" /> minutes
    </td>
 </tr>
 <tr >
    <td style="text-align: right; height: 40px;">
        Anesthesia Type
    </td>
	<td >


				<euc:EformRadioButtonList TABLE="OperatingRoomDetails" FIELD="OpAnesthesiaType" id="AnesthesiaFld" CellSpacing="6" RepeatLayout="Table" RepeatDirection="Horizontal" runat="server">
				<asp:ListItem >General</asp:ListItem><asp:ListItem>Epidural</asp:ListItem><asp:ListItem>Combined</asp:ListItem>
				</euc:EformRadioButtonList>
        
	</td>
  </tr>
  
  
  
</table>
<br/><br/><br/>
