<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasClinStageUICC02" CodeFile="PancreasClinStageUICC02.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">          

</script>

<br/>

<a name="PancreasClinStageUICC02" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Clinical Stage (Pancreas, UICC_02)"></asp:Label><br/>
<table width="400" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
   
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Date of Diagnosis</td>	
				<td  class="controlBoxDataGridTitleColumn" align="center">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Distant Metastasis (M)</td>
		  </tr>
          <tr>
			
				<td style="white-space: nowrap;">				
					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate" RecordId="1" />
					<euc:EformTextBox style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText" RecordId="1" />
  			    </td>
 				<td style="white-space: nowrap;">
					<euc:EformComboBox style="width:100px"  LookupCode="StageClin_Pancreas_02_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT" RecordId="1" DropDownWidth="auto" EnableHiddenOnUIEvent="ClinStageDisease,ClinStageSystem,ClinStageQuality"/></td>
				<td style="white-space: nowrap;">
					<euc:EformComboBox style="width:140px"  LookupCode="StageClin_Pancreas_02_N" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN" RecordId="1" DropDownWidth="auto" EnableHiddenOnUIEvent="ClinStageDisease,ClinStageSystem,ClinStageQuality"/></td>
				<td style="white-space: nowrap;">
					<euc:EformComboBox style="width:115px"  LookupCode="StageClin_Pancreas_02_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM" RecordId="1" DropDownWidth="auto" EnableHiddenOnUIEvent="ClinStageDisease,ClinStageSystem,ClinStageQuality"/>
					
				    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease" RecordId="1" Value="Pancreas"  />
				    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem" RecordId="1" Value="UICC_02"  />
				    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality" RecordId="1" Value="Rev"  />
			    </td>
              
          </tr>  
          		  
		  <tr>		
				<td  class="controlBoxDataGridTitleColumn">Notes</td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
				<td  height="10%" class="controlBoxDataGridTitleColumn"></td> 
          </tr>
          <tr>
             <td colspan="4" style="white-space: nowrap;">
                    <euc:EformTextBox style="width:550px"  TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes" RecordId="1" ShowTextEditor="true"/>
              </td>

		 </tr>


			    
	

</table>
<br/><br/>
<br/>

