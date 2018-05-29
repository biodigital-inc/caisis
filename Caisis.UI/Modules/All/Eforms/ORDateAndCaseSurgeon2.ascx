<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ORDateAndCaseSurgeon2" CodeFile="ORDateAndCaseSurgeon2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="ORDateAndCaseSurgeon2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

<table width="600" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable">

    <tr> 
      <td width="50%" height="50">
      <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td height="18" align="left" class="controlBoxTitle" width="105">Surgery Date 
            </td>
            <td width="*">
				<!-- SURGERIES : OR DATE -->
				<euc:EformTextBox Runat="server" 
						ID="SurgDateText" RecordId="1"
						TABLE="OperatingRoomDetails" 
						FIELD="OpDateText" 
						ShowCalendar="True"
						CalcDate="True"
						class="InputText" />
				<euc:EformHidden Runat="server" ID="SurgDate" Table="OperatingRoomDetails" Field="OpDate"></euc:EformHidden>		
				</td>
          </tr>
        </table>
        </td>
        <td width="50%">
        <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td height="18" align="left" class="controlBoxTitle" width="115">Case Surgeon</td>
            <td width="*">
                <euc:EformComboBox LookupCode="OpSurgeon" DropDownWidth="280" id="CaseSurgeonField" RecordId="1" Table="OperatingRoomDetails" Field="OpCaseSurgeon" runat="server"  class="InputText" />
            </td>
          </tr>
        </table>
        </td>
        
    </tr>
  </table>  <br/><br/>