<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateTStage" CodeFile="ProstateTStage.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

    <!-- BEGIN ProstateTStage -->

<a name="ProstateTStage" />

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
			<td width="100" height="18" align="right" class="controlBoxTitle">T Stage</td>
			<td>
				<euc:EformHidden id="OpClinStageSystem" Table="ProstatectomyProc" Field="ProcStageSystem" Value="UICC_02" runat="server"/>
			 	<euc:EformSelect DropDownWidth="250" id="OpClinStageT" EnableHiddenOnUIEvent="OpClinStageSystem" Table="ProstatectomyProc" Field="ProcStageT" LookupCode="StageClin_Prostate_02_T" runat="server"/>
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
  </table>  <br/><br/><br/>
  
  
  
      <!-- END ProstateTStage -->
      
      