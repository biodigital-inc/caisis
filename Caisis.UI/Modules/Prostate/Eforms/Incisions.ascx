<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.Incisions" CodeFile="Incisions.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="Incisions" />


<span class="controlBoxTitle">&nbsp;&nbsp;Incisions</span><br />
  <table width="420" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="516">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td>
      
      <table width="416" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td  width="210" height="18" align="right" class="controlBoxFieldTitle">Length of Skin Incisions</td>
            <td>
              <euc:EformTextBox TABLE="ProstatectomyProc" FIELD="ProcSkinIncisionLength" ShowNumberPad="true" class="InputText" id="SkinIncisionLength" size="6" runat="server"/>
              &nbsp;cm
			</td>
          </tr>
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Length of Fascial Incisions</td>
            <td>
				<euc:EformTextBox TABLE="ProstatectomyProc" FIELD="ProcFascialIncisionLength"  ShowNumberPad="true" class="InputText" id="FascialIncisionLength" size="6" runat="server" />
              &nbsp;cm</td>
          </tr>
        </table>
        
        </td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table>  <br/><br/><br/>