<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateIndicateAbnormal" CodeFile="BiopsyOfProstateIndicateAbnormal.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="PostProcedureInstructions" id="PostProcedureInstructions" />
<table border="0" cellspacing="0" cellpadding="2" width="650" class="eformLargePopulatedTable">

 <tr >
	<td width="70%" style="padding-top: 20px;padding-bottom: 20px;"><span class="controlBoxTitle" style="font-size: 13px;">Post procedure instructions were reviewed with patient</span><br/>
	</td>
	<td style="padding-top: 20px;padding-bottom: 20px;">
			<euc:EformRadioButtonList Table="NoTable" Field="PostProcedureInstruction" id="PostProcedureInstruction" RepeatLayout="Table" RepeatDirection="Horizontal" runat="server">		
			<asp:ListItem  >Yes</asp:ListItem>
			<asp:ListItem  >No</asp:ListItem>
	        </euc:EformRadioButtonList>
	</td>

  </tr>

  
 </table>
<br/><br/>

<a name="Comments" />
<table width="650" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td >&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td height="18" align="left" class="controlBoxTitle">Comments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
          </tr>
          <tr>
			 <td>
				<euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="AbnormalComments" Rows="12" style="width: 630px;" Runat="server" ID="AbnormalComments"/></td>
          </tr>
        </table>
       </td>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
</table>
<br/><br/>