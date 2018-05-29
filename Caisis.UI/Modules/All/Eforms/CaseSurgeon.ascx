<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.CaseSurgeon" CodeFile="CaseSurgeon.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
  
  <a name="CaseSurgeon" />
	<table width="400" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/shim.gif" width="2" height="2" /></td>
      <td  width="396">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/shim.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td> 
      
      <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td height="18" align="left" class="controlBoxTitle" width="120">Case Surgeon</td>
            <td width="*">
<%--            <euc:EformDropDownList ID="CaseSurgeonField" TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" runat="server"/> 
            <euc:EformComboBox LookupDistinct="Appointments;ApptPhysician;ApptPhysician" DropDownWidth="300" id="CaseSurgeonField" Table="OperatingRoomDetails" Field="OpCaseSurgeon" runat="server" />--%>
            <euc:EformComboBox LookupCode="OpSurgeon" DropDownWidth="300" id="CaseSurgeonField" Table="OperatingRoomDetails" Field="OpCaseSurgeon" runat="server"  class="InputText" />
            </td>
          </tr>
        </table>
      </td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/shim.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/shim.gif" width="2" height="2" /></td>
    </tr>
  </table>
  <br/><br/><br/>
  