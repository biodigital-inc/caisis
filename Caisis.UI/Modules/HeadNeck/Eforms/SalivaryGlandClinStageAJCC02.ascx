<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandClinStageAJCC02" CodeFile="SalivaryGlandClinStageAJCC02.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SalivaryGlandClinStageAJCC02" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Clinical Stage (Salivary Gland)"></asp:Label><br/>
<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
   
          <tr>
				<td class="controlBoxDataGridTitleColumn" >Date</td>	
				<td class="controlBoxDataGridTitleColumn">Physician</td>
				<td class="controlBoxDataGridTitleColumn">Data Quality</td>
				<td class="controlBoxDataGridTitleColumn">Notes</td>
		</tr>
          <tr>
            <td>				
	            <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate" RecordId="1" />
	            <euc:EformTextBox Width="100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText" RecordId="1"  />
            </td>
            <td>
                <euc:EformComboBox Width="100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" LookupCode="Physician" Runat="server" ID="ClinStagePhysician" RecordId="1" />
            </td>
            <td>
               <euc:EformComboBox  Width="100px" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality" RecordId="1" LookupCode="DataQuality" /></td>
            
            <td >
                    <euc:EformTextBox Width="100px"  TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes" RecordId="1" ShowTextEditor="true" /></td>
              
          </tr>  
          		  
		  <tr>		
				<td  class="controlBoxDataGridTitleColumn" align="left">Staging System</td>
				<td  class="controlBoxDataGridTitleColumn" align="left">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="left">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="left">Distant Metastasis (M)</td>
          </tr>
          <tr>			
 			<td>	
				<euc:EformHidden RecordId="1" TABLE="ClinicalStages" FIELD="ClinStageDisease" ID="ClinStageDisease_1" Runat="server" Value="Salivary Glands"  />			    		    
                <euc:EformDropDownList Width="100px" RecordId="1" TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_1" LookupCode="StagingSystem"    Runat="server" EnableHiddenOnUIEvent="ClinStageDisease_1" /></td>
		    <td>
				<euc:EformSelect Width="100px" RecordId="1" TABLE="ClinicalStages" FIELD="ClinStageT" ID="ClinStageT_1" CascadeValuesBasedOn="$ClinStageDisease_1,$ClinStageSystem_1" CascadeFormatString="StageClin_{0}_{n.1}_T" Runat="server" /></td>
		    <td>
				<euc:EformSelect Width="120px" RecordId="1" TABLE="ClinicalStages" FIELD="ClinStageN" ID="ClinStageN_1" CascadeValuesBasedOn="$ClinStageDisease_1,$ClinStageSystem_1" CascadeFormatString="StageClin_{0}_{n.1}_N" Runat="server"  /></td>
	        <td>
				<euc:EformSelect Width="100px" RecordId="1" TABLE="ClinicalStages" FIELD="ClinStageM" ID="ClinStageM_1" CascadeValuesBasedOn="$ClinStageDisease_1,$ClinStageSystem_1" CascadeFormatString="StageClin_{0}_{n.1}_M" Runat="server"   /></td>
       
		 </tr>

</table>
<br/><br/><br/>

