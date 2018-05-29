<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryAnesthesia" CodeFile="PancreasSurgeryAnesthesia.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="PancreasSurgeryAnesthesia" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Anesthesia"></asp:Label><br/>
  <table width="650" border="0" cellpadding="8" cellspacing="0" class="eformLargePopulatedTable">

          <tr> 
            <td  style="width: 30%; white-space: nowrap; padding-left: 15px; vertical-align: top; padding-top: 10px;">
				<!-- SURGERIES: ASA --><strong>ASA Score</strong> 
				<euc:EFormSelect DropDownHeight="auto"  LookupCode="ASA_Score" style="width:35;" DropDownWidth="430" runat="server" TABLE="OperatingRoomDetails" FIELD="OpASA" RecordId="11" ID="ASA"/>
            </td>
            <td style="white-space:nowrap; font-weight: bold; text-align: right; vertical-align: top; padding-top: 10px;">Anesthesia Type</td>
			  <td  style="width: 50%; white-space: nowrap;"> 
				<euc:EformExtendedCheckBoxList TABLE="OperatingRoomDetails" FIELD="OpAnesthesiaType" id="AnesthesiaFld" RecordId="11"  CellSpacing="0" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" ShowOther="true">
				<asp:ListItem Value="General - Standard" Text="General - Standard" ></asp:ListItem>
				<asp:ListItem Value="General - Low Volume" Text="General - Low Volume" ></asp:ListItem>
				<asp:ListItem Value="Epidural" Text="Epidural"></asp:ListItem>
				<asp:ListItem Value="Combined" Text="Combined"></asp:ListItem>
				</euc:EformExtendedCheckBoxList>
              </td>
          </tr>
       
  </table>
  <br/><br/><br/>