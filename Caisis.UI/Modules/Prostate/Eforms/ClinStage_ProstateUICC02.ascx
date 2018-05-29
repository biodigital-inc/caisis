<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ClinStage_ProstateUICC02" CodeFile="ClinStage_ProstateUICC02.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<br>

<a name="ClinStage_ProstateUICC02" />
<table width="380" border="0" cellpadding="0" cellspacing="0" class="controlBox">
   
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="3" height="18" align="left" class="controlBoxTitle">Clinical Stage&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
          </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn"></td>
				<td  class="controlBoxDataGridTitleColumn">T Stage (UICC 02)</td>
				<td  class="controlBoxDataGridTitleColumn">Date</td>		
          </tr>
          <tr>
				<td ></td>
				<td>
					<euc:EformSelect style="width:100"  LookupCode="ProstateClinStageT_02" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT"/></td>
				<td>
					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease"/>
					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem"/>
					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality"/>
					
					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate"/>
					<euc:EformTextBox style="width:100" 
						TABLE="ClinicalStages" 
						FIELD="ClinStageDateText" Runat="server" 
						ShowCalendar="True"
						CalcDate="True"
						ID="ClinStageDateText"/></td>
		 </tr>
      </table>
       </td>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
</table>