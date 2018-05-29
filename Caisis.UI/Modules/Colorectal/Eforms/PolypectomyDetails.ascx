<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.PolypectomyDetails" CodeFile="PolypectomyDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function copyDates(sourceInput)
{
    var targetDateTextControl = document.getElementById('<% =PathDateText_Polypectomy.ClientID %>');
    var targetDateControl = document.getElementById('<% =PathDate_Polypectomy.ClientID %>');
    
    targetDateTextControl.value = sourceInput.value;
    fuzzyDate(targetDateTextControl, targetDateControl);
}

function clearStageT()
{
    clearInputFields($('PathStageTTd'));
    $('<% =PathStageDisease_2.ClientID %>').disabled = true;
}

</script>


<a name="PolypectomyDetails" id="PolypectomyDetails" />
<span class="controlBoxTitle">Polypectomy / Local Excision</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Date of Procedure</strong>
		<euc:EformTextBox Runat="server" ID="ProcDateText" Table="Procedures" RecordId="2" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  EnableHiddenOnUIEvent="PathDateText_Polypectomy,PathDate_Polypectomy"  AppendToOnChange="copyDates(this);"  />
		<euc:EformHidden  Runat="server" ID="ProcDate" Table="Procedures" RecordId="2" Field="ProcDate"></euc:EformHidden>
		
		<euc:EformHidden  Runat="server" ID="PathDateText_Polypectomy" Table="Pathology"  RecordId="2" Field="PathDateText"></euc:EformHidden>
		<euc:EformHidden  Runat="server" ID="PathDate_Polypectomy" Table="Pathology"  RecordId="2" Field="PathDate"></euc:EformHidden>

	</td>
</tr>
<tr>
	
	<td style="padding-top: 12px; height: 111px;">
	<table>
	<tr>
	<td style="width: 35%; vertical-align: top;" id="ProcNameTd">
	<strong>Procedure (Specimen)</strong>

        <euc:EformRadioButtonList Table="Procedures" RecordId="2" Field="ProcName" id="ProcName" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
            <asp:ListItem  >Excisional Biopsy/Polypectomy</asp:ListItem>
            <asp:ListItem  >Transanal Excision (TAE)</asp:ListItem>
            <asp:ListItem  >Transanal Endoscopic Microsurgery</asp:ListItem>
          </euc:EformRadioButtonList>
            <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('ProcNameTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
	</td>
	<td style="width: 35%; vertical-align: top;" id="ProcSiteTd">
	<strong>Biopsy Site</strong><br />

        <euc:EformRadioButtonGroup Table="Procedures" Field="ProcSite" id="ProcSite" RecordId="2" GroupName="ProcSite" runat="server" >
                    <euc:EformRadioButton Id="Appendix" Value="Appendix" runat="server" Text="Appendix"/><br />
                    <euc:EformRadioButton Id="ColonNOS" Value="Colon NOS" runat="server" Text="Colon NOS"/><br />
                    <euc:EformRadioButton Id="RightColon" Value="Right Colon" runat="server" Text="Right Colon"/><br />
                    <euc:EformRadioButton Id="LeftColon" Value="Left Colon" runat="server" Text="Left Colon"/><br />
                    <euc:EformRadioButton Id="Rectosigmoid" Value="Rectosigmoid" runat="server" Text="Rectosigmoid"/><br />
                    <euc:EformRadioButton Id="Rectum" Value="Rectum" runat="server" Text="Rectum"/><br />
                    <euc:EformRadioButton Id="Anus" Value="Anus" runat="server" Text="Anus"/><br />
                    <euc:EformRadioButton Id="SmallIntestine" Value="Small Intestine" runat="server" Text="Small Intestine"/><br />
                    <euc:EformRadioButton Id="TransverseColon" Value="Transverse Colon" runat="server" Text="Transverse Colon"/><br />
        </euc:EformRadioButtonGroup> 
        <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('ProcSiteTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
	</td>
	</tr>
	</table>
	</td>	
  </tr>
  <tr>
	<td style="padding-top: 22px;"  id="ProcQualityTd">
		<strong>Procedure performed at</strong>
		
		   <euc:EformRadioButtonList Table="Procedures" RecordId="2" Field="ProcQuality" id="ProcQuality" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server" >
                <asp:ListItem Value="STD" Text="MSKCC"></asp:ListItem>
                <asp:ListItem Value="OUT" Text="Outside"></asp:ListItem>
          </euc:EformRadioButtonList>
		<img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ProcQualityTd'));"  style="cursor: pointer; margin-left: 20px; vertical-align: middle;" />

	</td>	
  </tr>
  <tr>
	<td style="padding-top: 12px;" id="PathQualityTd">
  		<strong>Biopsy Pathology Reviewed at</strong>
		   <euc:EformRadioButtonList Table="Pathology" RecordId="2" Field="PathQuality" id="PathQuality" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server" >
                <asp:ListItem Value="STD" Text="MSKCC"></asp:ListItem>
                <asp:ListItem Value="OUT" Text="Outside"></asp:ListItem>
          </euc:EformRadioButtonList>
<img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PathQualityTd'));"  style="cursor: pointer; margin-left: 20px; vertical-align: middle;" />	</td>	
  </tr>  
  <tr>
	<td style="padding-top: 12px;">
  		<strong>Accession Number</strong>
		<euc:EformTextBox Runat="server" ID="PathNum_2" Table="Pathology" RecordId="2" FIELD="PathNum" style="width:200px;"  ShowCalendar="False" CalcDate="False" class="InputText"  />

	</td>	
  </tr>
  <tr>
	<td style="padding-top: 12px;" id="ConfigurationTd">
  		<strong>Configuration</strong> 
		   <euc:EformRadioButtonList Table="PolypectomyPath"  Field="PathConfiguration" id="Configuration" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
            <asp:ListItem  >Unknown</asp:ListItem>
            <asp:ListItem  >Pedunculated</asp:ListItem>
            <asp:ListItem  >Sessile</asp:ListItem>
          </euc:EformRadioButtonList>
        <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('ConfigurationTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
	</td>	
  </tr>
  <tr>
	<td style="padding-top: 12px;">
  		<strong>Polyp Max Dimension</strong> 
		<euc:EformTextBox Runat="server" ID="PathPolypMaxDim" Table="PolypectomyPath" FIELD="PathPolypMaxDim" style="width:80px;"   ShowNumberPad="true" class="InputText"  /> cm  

	</td>	
  </tr>  <tr>
	<td style="padding-top: 12px;">
  		<strong>Biopsy Pathology (Histology)</strong>&nbsp;&nbsp;
  		
  		<euc:EformDropDownList Field="PathHistology" Table="Pathology" RecordId="2" id="PathHistology_2"  runat="server">

            <asp:ListItem Value="" Text=""  />
            <asp:ListItem Value="Tubular Adenoma" Text="Tubular Adenoma"  />
            <asp:ListItem Value="Tubulovillous Adenoma" Text="Tubulovillous Adenoma"  />
            <asp:ListItem Value="Villous Adenoma" Text="Villous Adenoma"  />
            <asp:ListItem Value="Adenocarcinoma" Text="Adenocarcinoma"  />
            <asp:ListItem Value="Adenocarcinoma, NOS" Text="Adenocarcinoma, NOS"  />
            <asp:ListItem Value="Adenocarcinoma, Focal Mucinous (<50%)" Text="Adenocarcinoma, Focal Mucinous (<50%)"  />
            <asp:ListItem Value="Adenocarcinoma, Mucinous (>50%)" Text="Adenocarcinoma, Mucinous (>50%)"  />
            <asp:ListItem Value="Adenocarcinoma, Signet Ring" Text="Adenocarcinoma, Signet Ring"  />
            <asp:ListItem Value="Carcinoid" Text="Carcinoid"  />
            <asp:ListItem Value="Squamous Carcinoma" Text="Squamous Carcinoma"  />
            <asp:ListItem Value="Pagets" Text="Pagets"  />
            <asp:ListItem Value="Gastro-Intestinal Stromal Tumor" Text="GIST"  />
        </euc:EformDropDownList>
	</td>	
  </tr> 
  <tr>
	<td style="padding-top: 12px;">
	<table>
	<tr>
	<td style="width: 30%; vertical-align: top;" id="PathStageTTd">
	<strong>T Stage</strong> 

  		<euc:EformHidden  Runat="server" ID="PathStageDisease_2" Table="PathologyStageGrade"  RecordId="2"  Field="PathStageDisease" Value="Colorectal"></euc:EformHidden>
        <euc:EformRadioButtonList Table="PathologyStageGrade"  RecordId="2" Field="PathStageT" id="PathStageT" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" EnableHiddenOnUIEvent="PathStageDisease_2" >
            <asp:ListItem  >T0 (No Dysplasia)</asp:ListItem>
            <asp:ListItem  >TIS</asp:ListItem>
            <asp:ListItem  >T1</asp:ListItem>
            <asp:ListItem  >T2</asp:ListItem>
            <asp:ListItem  >T3</asp:ListItem>
            <asp:ListItem  >TX</asp:ListItem>
          </euc:EformRadioButtonList>
        <img src="../../Images/Button_X_Clear.png" onclick="clearStageT();" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
	</td>
	<td style="width: 40%; vertical-align: top;" id="PathFindGradePolyTd">
	<strong>Grade / Differentiation</strong> 

        <euc:EformRadioButtonList Table="ColorectalPathFinding" RecordId="2"  Field="PathFindGrade" LookupCode="ColorectalGrade" id="PathFindGrade_poly" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >       
          </euc:EformRadioButtonList>
          
          <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('PathFindGradePolyTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
	</td>
	</tr>
	</table>
</td>	
  </tr>    
  <tr>
  <td style="padding-top: 12px;">
  <table>
  <tr>
  <td style="width: 37%; vertical-align: top;" id="PathVascularInvTd">
	<strong>Lymphovascular Invasion</strong>

        <euc:EformRadioButtonList Table="PolypectomyPath" Field="PathVascularInv" LookupCode="PolypInvasion" id="PathVascularInv_1" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >
          </euc:EformRadioButtonList>
          <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('PathVascularInvTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
	</td>
  <td style="width: 35%; vertical-align: top;" id="PathPerineuralInvTd">
  <strong>Perineural Invasion</strong> 

        <euc:EformRadioButtonList Table="PolypectomyPath" Field="PathPerineuralInv" LookupCode="PolypInvasion"  id="EformRadioButtonList2" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >
       </euc:EformRadioButtonList>
          <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('PathPerineuralInvTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
  </td>
  <td style="width: 35%; vertical-align: top;" id="PathStalkMarginTd">
  <strong>Stalk (Polypectomy)</strong>

        <euc:EformRadioButtonList Table="PolypectomyPath" Field="PathStalkMargin" LookupCode="PolypStalkMargin" id="PathStalkMargin" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >
       </euc:EformRadioButtonList>
          <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('PathStalkMarginTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
  </td>
  </tr>
  </table>
  </td>
  </tr>      
  <tr>
	<td style="padding-top: 12px;">
	<table>
	<tr>
	<td style="width: 40%; vertical-align: top;" id="PathLateralMarginTd">
	    <strong>Lateral Margin</strong>
        <euc:EformRadioButtonList Table="PolypectomyPath" Field="PathLateralMargin" LookupCode="PolypMarginStatus" id="PathLateralMargin" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >
       </euc:EformRadioButtonList>
          <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('PathLateralMarginTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
	</td>
	<td style="width: 35%; vertical-align: top;" id="PathDeepMarginTd">
	<strong>Deep Margin</strong>

        <euc:EformRadioButtonList Table="PolypectomyPath" Field="PathDeepMargin" LookupCode="PolypMarginStatus"  id="PathDeepMargin" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >
       </euc:EformRadioButtonList>
          <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('PathDeepMarginTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
	</td>
	</tr>
	</table>
 	</td>	
  </tr>   
  <tr>
	<td style="padding-top: 12px;">
  		<strong>Notes for this Polypectomy / Local Excision</strong><br />

  		<euc:EformTextArea TextMode="MultiLine" TABLE="Procedures" RecordId="2" FIELD="ProcNotes" Rows="12" style="width: 550px;" Runat="server" ID="ProcNotes"/>
	</td>	
  </tr>     
</table>
<br/><br/><br/>
