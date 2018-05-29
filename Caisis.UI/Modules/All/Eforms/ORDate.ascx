<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ORDate" CodeFile="ORDate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="ORDate" />
<table width="400" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/shim.gif" width="2" height="2" /></td>
      <td  width="396">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/shim.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td height="18" align="left" class="controlBoxTitle" width="120">Surgery Date 
            </td>
            <td width="*">
				<!-- SURGERIES : OR DATE -->
				<euc:EformTextBox Runat="server" 
						ID="SurgDateText" 
						TABLE="OperatingRoomDetails" 
						FIELD="OpDateText" 
						ShowCalendar="True"
						CalcDate="True"
						class="InputText" />
				<euc:EformHidden Runat="server" ID="SurgDate" Table="OperatingRoomDetails" Field="OpDate"></euc:EformHidden>		
				<br/>
				</td>
          </tr>
        </table></td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/shim.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/shim.gif" width="2" height="2" /></td>
    </tr>
  </table>  <br/>