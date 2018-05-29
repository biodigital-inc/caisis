<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.OverallSurgeryDifficulty" CodeFile="OverallSurgeryDifficulty.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="OverallSurgeryDifficulty" />
<table width="400" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="396">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td> <table width="396" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="220" height="18" align="right" class="controlBoxTitle">Overall Surgery Difficulty</td>
            <td><euc:EFormSelect  DropDownHeight="auto" DropDownWidth="100" LookupCode="SurgDifficulty" style="width: 86px;" runat="server" ID="OverallSurgeryDifficultyField" TABLE="OperatingRoomDetails" FIELD="OpDifficulty"/></td>
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