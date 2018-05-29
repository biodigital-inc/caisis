<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxPathStageGrade" CodeFile="OropharynxPathStageGrade.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
    tableArray.PathStagesHtmlTable = "PathStagesHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">

    function setPathStageHiddenFields(PathStageT, PathStageN, PathStageM, PathStageDisease, PathStageSystem) {

        var disease = "Oropharyngeal";

        if (PathStageSystem.value != '' || PathStageT.value != '' || PathStageN.value != '' || PathStageM.value != '') {
            PathStageDisease.value = disease;
        } else {
            PathStageDisease.value = '';
        }
    } 


</script>

<br/>

<a name="OropharynxPathStageGrade" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Stages (Oropharynx)"></asp:Label><br/>
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PathStagesHtmlTable">
   
          <tr>
				<td style="width:120px" class="controlBoxDataGridTitleColumn" style="text-align: left;" >Staging System</td>	
				<td style="width:120px" class="controlBoxDataGridTitleColumn" style="text-align: left;">Primary Tumor (T)</td>
				<td style="width:120px" class="controlBoxDataGridTitleColumn" style="text-align: left;">Regional Lymph Nodes (N) </td>
				<td style="width:120px" class="controlBoxDataGridTitleColumn" style="text-align: left;">Distant Metastasis (M)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn">Residual Tumor (R)</td>
				<td style="width:120px" class="controlBoxDataGridTitleColumn" style="text-align: left;">Grade</td>
				<td height="10%" class="controlBoxDataGridTitleColumn">&nbsp;</td> 
		  </tr>
          <tr>
			
			<td>	
				<euc:EformHidden Enabled="false" RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_1" Runat="server" Value="Oropharyngeal"/>			    
                <euc:EformComboBox style="width:80px" RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_1" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1" /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_1" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1"  /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_1" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_1" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_1"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_1" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_1"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_1" LookupCode="PathGrade" Runat="server"   EnableHiddenOnUIEvent="PathStageDisease_1"/></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
          </tr>  
          <tr>
			
			<td>	
				<euc:EformHidden Enabled="false" RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_2" Runat="server" Value="Oropharyngeal"/>			    
                <euc:EformComboBox style="width:80px" RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_2" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2" /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_2" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2"  /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_2" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_2" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_2"/></td>
 	        <td>
				<euc:EformComboBox style="width:80px" RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_2" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_2"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_2" LookupCode="PathGrade" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_2"/></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
          </tr>  
          <tr>
			
			<td>	
				<euc:EformHidden Enabled="false" RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_3" Runat="server" Value="Oropharyngeal"/>			    
                <euc:EformComboBox style="width:80px" RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_3" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3" /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_3" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3"  /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_3" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_3" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_3"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_3" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_3"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_3" LookupCode="PathGrade" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_3"/></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden Enabled="false" RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_4" Runat="server" Value="Oropharyngeal"/>			    
                <euc:EformComboBox style="width:80px" RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_4" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4" /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_4" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4"  /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_4" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_4" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
 	        <td>
				<euc:EformComboBox style="width:80px" RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_4" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_4" LookupCode="PathGrade" Runat="server"   EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>        
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden Enabled="false" RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_5" Runat="server" Value="Oropharyngeal"/>			    
                <euc:EformComboBox style="width:80px" RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_5" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5" /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_5" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5"  /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_5" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_5" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
 	        <td>
				<euc:EformComboBox style="width:80px" RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_5" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_5" LookupCode="PathGrade" Runat="server"   EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden Enabled="false" RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_6" Runat="server" Value="Oropharyngeal"/>			    
                <euc:EformComboBox style="width:80px" RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_6" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6" /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_6" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6"  /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_6" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_6" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
  	        <td>
				<euc:EformComboBox style="width:80px" RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_6" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_6" LookupCode="PathGrade" Runat="server"   EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>     
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden Enabled="false" RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_7" Runat="server" Value="Oropharyngeal"/>			    
                <euc:EformComboBox style="width:80px" RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_7" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7" /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_7" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7"  /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_7" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_7" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
  	        <td>
				<euc:EformComboBox style="width:80px" RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_7" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_7" LookupCode="PathGrade" Runat="server"   EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
          </tr>    
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden Enabled="false" RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_8" Runat="server" Value="Oropharyngeal"/>			    
                <euc:EformComboBox style="width:80px" RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_8" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8" /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_8" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8"  /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_8" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_8" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
  	        <td>
				<euc:EformComboBox style="width:80px" RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_8" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_8" LookupCode="PathGrade" Runat="server"   EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
          </tr>      		
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden Enabled="false" RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_9" Runat="server" Value="Oropharyngeal"/>			    
                <euc:EformComboBox style="width:80px" RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_9" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9" /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_9" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9"  /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_9" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_9" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
  	        <td>
				<euc:EformComboBox style="width:80px" RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_9" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_9" LookupCode="PathGrade" Runat="server"   EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
          </tr>     
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden Enabled="false" RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_10" Runat="server" Value="Oropharyngeal"/>			    
                <euc:EformComboBox style="width:80px" RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_10" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10" /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_10" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10"  /></td>
		    <td>
				<euc:EformComboBox style="width:80px" RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_10" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_10" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
  	        <td>
				<euc:EformComboBox style="width:80px" RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_10" CascadeValuesBasedOn="PathStageDisease,PathStageSystem" CascadeFormatString="StagePath_{0}_{n.1}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
	        <td>
				<euc:EformComboBox style="width:80px" RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_10" LookupCode="PathGrade" Runat="server"   EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
          </tr>  
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathStagesHtmlTable');" />
<br/><br/><br/>