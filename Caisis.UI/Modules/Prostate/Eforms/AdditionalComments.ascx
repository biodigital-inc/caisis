<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.AdditionalComments" CodeFile="AdditionalComments.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="AdditionalComments" />
<table width="400" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="396">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td height="18" align="left" class="controlBoxTitle">Surgery Notes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
          </tr>
          <tr>
			 <td>
				<!-- ADDITIONAL COMMENTS -->
				<euc:EformTextArea TextMode="MultiLine" TABLE="OperatingRoomDetails" FIELD="OpNotes" Rows="12" style="width: 550px;" Runat="server" ID="SurgNotes"/></td>
          </tr>
        </table>
       </td>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
</table>