<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.SVFirstDissection" CodeFile="SVFirstDissection.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<!-- BEGIN Seminal Vessicles -->
<a name="SVFirstDissection" />
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
            <td width="250" height="18" align="right" class="controlBoxFieldTitle">First 
              Dissection of Seminal Vessicles&nbsp; </td>
            <td class="controlBoxFieldOption"> 
              
              	<euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProstatectomyProc" FIELD="ProcSV_DissectFirst" LookupCode="YesNoUnknown" id="OpSV_DissectionFirst" runat="server">
				</euc:EformRadioButtonList>
              
            </td>
          </tr>
   <%--       <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Approach&nbsp; 
            </td>
            <td class="controlBoxFieldTitle">
				<euc:EformSelect LookupCode="DissectionApproach" TABLE="NoTable" FIELD="OpApproach" name="Approach" size="1" id="OpApproach" runat=server/>
			</td>
          </tr>
   --%> 
        </table> </td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table>
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
            <td width="250" height="18" align="right" class="controlBoxFieldTitle">Bull 
              Dog Clamps</td>
            <td class="controlBoxFieldOption"> <label> 
				<euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProstatectomyProc" FIELD="ProcBulldogClamps" LookupCode="YesNoUnknown" id="OpBulldogClamps" runat="server">
				</euc:EformRadioButtonList>

              </td>
          </tr>
          <%-- 
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Periprostatic 
              Veins &nbsp; </td>
            <td class="controlBoxFieldTitle">
				<euc:EformDropDownList TABLE="NoTable" FIELD="OpPeriprostaticVeins" name="PeriprostaticVeins" size="1" id="OpPeriprostaticVeins" runat=server>
					<asp:ListItem value=""></asp:ListItem>
					<asp:ListItem value="0">0</asp:ListItem>
					<asp:ListItem value="1">1</asp:ListItem>
					<asp:ListItem value="2">2</asp:ListItem>
					<asp:ListItem value="3">3</asp:ListItem>
					<asp:ListItem value="4">4</asp:ListItem>
					<asp:ListItem value="4+">4+</asp:ListItem>     
              </euc:EformDropDownList></td>
          </tr>--%>
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
