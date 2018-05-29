<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasPathStages" CodeFile="PancreasPathStages.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.PathStagesHtmlTable = "PathStagesHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">

</script>

<br/>

<a name="PancreasPathStages" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Stages (Pancreas)"></asp:Label><br/>
<table width="575" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PathStagesHtmlTable">
   
          <tr>
				<td style="width:120px" class="controlBoxDataGridTitleColumn" style="text-align: left;" >Staging System</td>	
				<td style="width:120px" class="controlBoxDataGridTitleColumn" style="text-align: left;">Primary Tumor (T)</td>
				<td style="width:120px" class="controlBoxDataGridTitleColumn" style="text-align: left;">Regional Lymph Nodes (N) </td>
				<td style="width:120px" class="controlBoxDataGridTitleColumn" style="text-align: left;">Distant Metastasis (M)</td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
          <tr>
			
			<td>	
				<euc:EformHidden RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_1" Runat="server" Value="Pancreas"/>			    
                <euc:EformSelect style="width:100px" RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_1" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1" /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_1" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1"  /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_1" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1"/></td>
	        <td>
				<euc:EformComboBox style="width:100px" RecordId="1" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_1" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_1"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>  
          <tr>
			
			<td>	
				<euc:EformHidden RecordId="2" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_2" Runat="server" Value="Pancreas"/>			    
                <euc:EformSelect style="width:100px" RecordId="2" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_2" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2" /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="2" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_2" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2"  /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="2" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_2" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2"/></td>
	        <td>
				<euc:EformComboBox style="width:100px" RecordId="2" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_2" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_2"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>  
          <tr>
			
			<td>	
				<euc:EformHidden RecordId="3" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_3" Runat="server" Value="Pancreas"/>			    
                <euc:EformSelect style="width:100px" RecordId="3" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_3" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3" /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="3" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_3" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3"  /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="3" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_3" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3"/></td>
	        <td>
				<euc:EformComboBox style="width:100px" RecordId="3" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_3" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_3"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="4" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_4" Runat="server" Value="Pancreas"/>			    
                <euc:EformSelect style="width:100px" RecordId="4" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_4" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4" /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="4" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_4" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4"  /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="4" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_4" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
	        <td>
				<euc:EformComboBox style="width:100px" RecordId="4" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_4" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
         
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="5" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_5" Runat="server" Value="Pancreas"/>			    
                <euc:EformSelect style="width:100px" RecordId="5" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_5" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5" /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="5" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_5" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5"  /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="5" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_5" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
	        <td>
				<euc:EformComboBox style="width:100px" RecordId="5" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_5" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="6" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_6" Runat="server" Value="Pancreas"/>			    
                <euc:EformSelect style="width:100px" RecordId="6" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_6" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6" /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="6" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_6" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6"  /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="6" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_6" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
	        <td>
				<euc:EformComboBox style="width:100px" RecordId="6" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_6" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
         
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="7" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_7" Runat="server" Value="Pancreas"/>			    
                <euc:EformSelect style="width:100px" RecordId="7" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_7" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7" /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="7" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_7" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7"  /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="7" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_7" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
	        <td>
				<euc:EformComboBox style="width:100px" RecordId="7" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_7" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>    
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="8" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_8" Runat="server" Value="Pancreas"/>			    
                <euc:EformSelect style="width:100px" RecordId="8" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_8" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8" /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="8" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_8" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8"  /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="8" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_8" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
	        <td>
				<euc:EformComboBox style="width:100px" RecordId="8" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_8" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>      		
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="9" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_9" Runat="server" Value="Pancreas"/>			    
                <euc:EformSelect style="width:100px" RecordId="9" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_9" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9" /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="9" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_9" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9"  /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="9" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_9" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
	        <td>
				<euc:EformComboBox style="width:100px" RecordId="9" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_9" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>     
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="10" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_10" Runat="server" Value="Pancreas"/>			    
                <euc:EformSelect style="width:100px" RecordId="10" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_10" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10" /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="10" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_10" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10"  /></td>
		    <td>
				<euc:EformComboBox style="width:100px" RecordId="10" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_10" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
	        <td>
				<euc:EformComboBox style="width:100px" RecordId="10" ParentRecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_10" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathStagesHtmlTable');" />
<br/><br/><br/>

