<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.MRI" CodeFile="MRI.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- BEGIN MRI -->
<a name="MRI" />
<span class="controlBoxTitle">&nbsp;&nbsp;MRI</span><br />
  <table width="500" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="396">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="30" height="18" align="right" class="controlBoxFieldTitle">Veins&nbsp; 
            </td>
            <td>
				<euc:EformTextBox ID="MriVeins" TABLE="NoTable" FIELD="MriVeins"  class="InputText"  runat=server></euc:EFormTextBox>
            </td>
            <td align="right" class="controlBoxFieldTitle">Urethral Length&nbsp; 
            </td>
            <td>
				<euc:EformTextBox ID="MriUrethralLength" TABLE="NoTable" FIELD="MriUrethralLength"  class="InputText"  runat=server></euc:EFormTextBox>
            </td>
          </tr>
        </table></td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table><br/><br/><br/>
<!-- END MRI -->
