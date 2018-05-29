<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Drains" CodeFile="Drains.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

   <!-- BEGIN Drains -->
   <!--Kevin TODO: verify that only two drains and used and side and AP should be in the same row not separate fields-->

	<a name="Drains" />
  <span class="controlBoxTitle">&nbsp;&nbsp;Drains</span>
<br />
  <table width="260" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="130" height="25" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
      <td class="controlBoxDataGridHeader">Type</td>
      <td width="2" align="right" valign="top" class="controlBox"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr>
      <td class="controlBoxDataGridFirstColumn"><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridTitleColumn">Left Drain&nbsp;</td>
      <td colspan="2"  style="padding-left: 6px;"><euc:EFormSelect DropDownHeight="auto" DropDownWidth="120" LookupCode="OpDrain" runat="server" Table="ProstatectomyProc" FIELD="ProcL_Drain" ID="LeftDrain"/></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridTitleColumn">Right Drain&nbsp;</td>
      <td colspan="2"  style="padding-left: 6px;"><euc:EFormSelect DropDownHeight="auto" DropDownWidth="120" LookupCode="OpDrain" runat="server" Table="ProstatectomyProc" FIELD="ProcR_Drain" ID="RightDrain"/></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right"  class="controlBoxDataGridTitleColumn">Anterior Drain&nbsp; </td>
      <td colspan="2"  style="padding-left: 6px;"><euc:EFormSelect DropDownHeight="auto" DropDownWidth="120" LookupCode="OpDrain" runat="server" Table="ProstatectomyProc" FIELD="ProcAnteriorDrain" ID="AnteriorDrain"/></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="right" class="controlBoxDataGridTitleColumn">Posterior Drain&nbsp; </td>
      <td colspan="2"  style="padding-left: 6px;"><euc:EFormSelect DropDownHeight="auto" DropDownWidth="120" LookupCode="OpDrain" runat="server" ID="PosteriorDrain" Table="ProstatectomyProc" FIELD="ProcPosteriorDrain"/></td>
    </tr>
    <tr> 
      <td valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td align="right" valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
      <td colspan="2" ><img src="../Images/shim.gif" width="1" height="1" /></td>
    </tr>
  </table>  <br/><br/><br/>
  
  
    <!-- END Drains -->