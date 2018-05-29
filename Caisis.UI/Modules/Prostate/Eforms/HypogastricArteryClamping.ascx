<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.HypogastricArteryClamping" CodeFile="HypogastricArteryClamping.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<!-- BEGIN Seminal Vessicles -->
<a name="HypogastricArteryClamping" />

  <table width="520" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="516">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td><table width="516" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="250" height="18" align="right" class="controlBoxFieldTitle">Hypogastric Artery Clamping </td>
            <td class="controlBoxFieldOption">
				<euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProstatectomyProc" FIELD="ProcBulldogClamps" LookupCode="YesNoUnknown" id="OpBulldogClamps" runat="server">
				</euc:EformRadioButtonList>              </td>
          </tr>
          
        </table></td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table>  <br/><br/><br/>

<!-- END Seminal Vessicles -->
