<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ClinStageT" CodeFile="ClinStageT.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- START CLIN STAGE T -->
<a name="ClinStageT" />
<span class="controlBoxTitle">&nbsp;&nbsp;UICC 2002 Stage</span>
<br />
  <table width="350" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">T Stage&nbsp;&nbsp;&nbsp; 
            </td>
            <td>
           
				<euc:EformHidden  ID="OpClinStageSystem" Value="UICC_2002" runat=server></euc:EFormHidden>
				<euc:EformTextBox ID="OpClinStageT" runat="server"  class="InputText" ></euc:EFormTextBox>
				
              <img src="../../Images/TStaging.gif" width="62" height="14" /></td>
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
 <!-- END CLINS STAGE T -->