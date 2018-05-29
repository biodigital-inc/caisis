<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusPathStages" CodeFile="EsophagusPathStages.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.PathStagesEsophagusHtmlTable = "PathStagesEsophagusHtmlTable";
	tableArray.PathStagesStomachHtmlTable = "PathStagesStomachHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">

</script>

<br/>

<a name="EsophagusPathStages" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathologic Staging"></asp:Label><br/>
<br />
<strong>Esophagus</strong>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PathStagesEsophagusHtmlTable">
   
          <tr>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Staging System</td>	
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Primary Tumor (T)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Regional Lymph Nodes (N) </td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Distant Metastasis (M)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Residual Tumor (R)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Staging Group</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Grade</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Notes</td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
          <tr>
			
			<td>	
				<euc:EformHidden RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_1" Runat="server" Value="Esophagus"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_1" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_1" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_1" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_1" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_1"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_1" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_1"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:100px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_1" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_1"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_1" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_1"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_1" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_1"/></td>
           <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>  
          <tr style="display: none; " >
			
			<td>	
				<euc:EformHidden RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_2" Runat="server" Value="Esophagus"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_2" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_2" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_2" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_2" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_2"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_2" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_2"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_2" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_2"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_2" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_2"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_2" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_2"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_3" Runat="server" Value="Esophagus"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_3" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_3" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_3" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_3" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_3"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_3" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_3"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:100px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_3" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_3"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_3" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_3"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_3" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_3"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_4" Runat="server" Value="Esophagus"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_4" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_4" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_4" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_4" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_4" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_4" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_4" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_4" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_4"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_5" Runat="server" Value="Esophagus"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_5" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_5" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_5" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_5" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_5" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_5" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_5" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_5" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_5"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_6" Runat="server" Value="Esophagus"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_6" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_6" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_6" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_6" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_6" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_6" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_6" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_6" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_6"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_7" Runat="server" Value="Esophagus"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_7" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_7" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_7" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_7" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_7" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_7" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_7" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_7" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_7"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_8" Runat="server" Value="Esophagus"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_8" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_8" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_8" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_8" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_8" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_8" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_8" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_8" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_8"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_9" Runat="server" Value="Esophagus"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_9" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_9" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_9" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_9" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_9" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_9" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_9" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_9" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_9"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_10" Runat="server" Value="Esophagus"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_10" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_10" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_10" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_10" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_10" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_10" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_10" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_10" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_10"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
          </tr>  

</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathStagesEsophagusHtmlTable');" />

<br /><br />

<strong>Stomach</strong>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PathStagesStomachHtmlTable">
   
          <tr>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn"  >Staging System</td>	
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Primary Tumor (T)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Regional Lymph Nodes (N) </td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Distant Metastasis (M)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Residual Tumor (R)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Staging Group</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Grade</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn" >Notes</td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
          <tr>
			
			<td>	
				<euc:EformHidden RecordId="11" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_11" Runat="server" Value="Stomach"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="11" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_11" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_11" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="11" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_11" CascadeValuesBasedOn="$PathStageDisease_11,$PathStageSystem_11" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_11"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="11" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_11" CascadeValuesBasedOn="$PathStageDisease_11,$PathStageSystem_11" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_11"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="11" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_11" CascadeValuesBasedOn="$PathStageDisease_11,$PathStageSystem_11" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_11"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="11" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_11" CascadeValuesBasedOn="$PathStageDisease_11,$PathStageSystem_11" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_11"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="11" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_11" CascadeValuesBasedOn="$PathStageDisease_11,$PathStageSystem_11" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_11"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="11" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_11" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_11"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="11" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_11" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_11"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="12" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_12" Runat="server" Value="Stomach"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="12" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_12" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_12" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="12" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_12" CascadeValuesBasedOn="$PathStageDisease_12,$PathStageSystem_12" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_12"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="12" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_12" CascadeValuesBasedOn="$PathStageDisease_12,$PathStageSystem_12" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_12"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="12" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_12" CascadeValuesBasedOn="$PathStageDisease_12,$PathStageSystem_12" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_12"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="12" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_12" CascadeValuesBasedOn="$PathStageDisease_12,$PathStageSystem_12" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_12"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="12" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_12" CascadeValuesBasedOn="$PathStageDisease_12,$PathStageSystem_12" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_12"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="12" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_12" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_12"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="12" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_12" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_12"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="13" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_13" Runat="server" Value="Stomach"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="13" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_13" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_13" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="13" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_13" CascadeValuesBasedOn="$PathStageDisease_13,$PathStageSystem_13" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_13"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="13" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_13" CascadeValuesBasedOn="$PathStageDisease_13,$PathStageSystem_13" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_13"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="13" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_13" CascadeValuesBasedOn="$PathStageDisease_13,$PathStageSystem_13" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_13"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="13" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_13" CascadeValuesBasedOn="$PathStageDisease_13,$PathStageSystem_13" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_13"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="13" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_13" CascadeValuesBasedOn="$PathStageDisease_13,$PathStageSystem_13" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_13"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="13" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_13" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_13"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="13" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_13" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_13"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="14" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_14" Runat="server" Value="Stomach"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="14" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_14" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_14" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="14" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_14" CascadeValuesBasedOn="$PathStageDisease_14,$PathStageSystem_14" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_14"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="14" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_14" CascadeValuesBasedOn="$PathStageDisease_14,$PathStageSystem_14" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_14"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="14" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_14" CascadeValuesBasedOn="$PathStageDisease_14,$PathStageSystem_14" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_14"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="14" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_14" CascadeValuesBasedOn="$PathStageDisease_14,$PathStageSystem_14" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_14"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="14" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_14" CascadeValuesBasedOn="$PathStageDisease_14,$PathStageSystem_14" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_14"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="14" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_14" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_14"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="14" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_14" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_14"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="15" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_15" Runat="server" Value="Stomach"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="15" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_15" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_15" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="15" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_15" CascadeValuesBasedOn="$PathStageDisease_15,$PathStageSystem_15" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_15"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="15" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_15" CascadeValuesBasedOn="$PathStageDisease_15,$PathStageSystem_15" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_15"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="15" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_15" CascadeValuesBasedOn="$PathStageDisease_15,$PathStageSystem_15" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_15"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="15" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_15" CascadeValuesBasedOn="$PathStageDisease_15,$PathStageSystem_15" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_15"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="15" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_15" CascadeValuesBasedOn="$PathStageDisease_15,$PathStageSystem_15" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_15"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="15" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_15" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_15"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="16" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_15" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_15"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="16" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_16" Runat="server" Value="Stomach"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="16" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_16" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_16" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="16" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_16" CascadeValuesBasedOn="$PathStageDisease_16,$PathStageSystem_16" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_16"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="16" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_16" CascadeValuesBasedOn="$PathStageDisease_16,$PathStageSystem_16" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_16"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="16" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_16" CascadeValuesBasedOn="$PathStageDisease_16,$PathStageSystem_16" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_16"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="16" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_16" CascadeValuesBasedOn="$PathStageDisease_16,$PathStageSystem_16" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_16"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="16" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_16" CascadeValuesBasedOn="$PathStageDisease_16,$PathStageSystem_16" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_16"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="16" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_16" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_16"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="16" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_16" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_16"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="17" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_17" Runat="server" Value="Stomach"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="17" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_17" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_17" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="17" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_17" CascadeValuesBasedOn="$PathStageDisease_17,$PathStageSystem_17" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_17"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="17" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_17" CascadeValuesBasedOn="$PathStageDisease_17,$PathStageSystem_17" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_17"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="17" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_17" CascadeValuesBasedOn="$PathStageDisease_17,$PathStageSystem_17" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_17"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="17" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_17" CascadeValuesBasedOn="$PathStageDisease_17,$PathStageSystem_17" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_17"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="17" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_17" CascadeValuesBasedOn="$PathStageDisease_17,$PathStageSystem_17" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_17"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="17" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_17" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_17"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="17" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_17" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_17"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="18" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_18" Runat="server" Value="Stomach"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="18" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_18" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_18" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="18" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_18" CascadeValuesBasedOn="$PathStageDisease_18,$PathStageSystem_18" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_18"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="18" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_18" CascadeValuesBasedOn="$PathStageDisease_18,$PathStageSystem_18" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_18"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="18" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_18" CascadeValuesBasedOn="$PathStageDisease_18,$PathStageSystem_18" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_18"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="18" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR18" CascadeValuesBasedOn="$PathStageDisease18,$PathStageSystem18" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_18"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="18" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_18" CascadeValuesBasedOn="$PathStageDisease_18,$PathStageSystem_18" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_18"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="18" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_18" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_18"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="18" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_18" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_18"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="19" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_19" Runat="server" Value="Stomach"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="19" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_19" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_19" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="19" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_19" CascadeValuesBasedOn="$PathStageDisease_19,$PathStageSystem_19" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_19"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="19" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_19" CascadeValuesBasedOn="$PathStageDisease_19,$PathStageSystem_19" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_19"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="19" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_19" CascadeValuesBasedOn="$PathStageDisease_19,$PathStageSystem_19" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_19"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="19" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_19" CascadeValuesBasedOn="$PathStageDisease_19,$PathStageSystem_19" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_19"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="19" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_19" CascadeValuesBasedOn="$PathStageDisease_19,$PathStageSystem_19" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_19"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="19" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_19" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_19"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="19" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_19" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_19"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server"/></td>
          </tr>  
          <tr style="display: none; ">
			
			<td>	
				<euc:EformHidden RecordId="20" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_20" Runat="server" Value="Stomach"/>			    
                <euc:EformDropDownList DropDownWidth="400px" style="width:120px" RecordId="20" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_20" LookupCode="StagingSystem,Disease,@DiseaseView"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_20" /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="20" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_20" CascadeValuesBasedOn="$PathStageDisease_20,$PathStageSystem_20" CascadeFormatString="StagePath_{0}_{n.1.extract10}_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_20"  /></td>
		    <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="20" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_20" CascadeValuesBasedOn="$PathStageDisease_20,$PathStageSystem_20" CascadeFormatString="StagePath_{0}_{n.1.extract10}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_20"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="20" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_20" CascadeValuesBasedOn="$PathStageDisease_20,$PathStageSystem_20" CascadeFormatString="StagePath_{0}_{n.1.extract10}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_20"/></td>
	        <td>
				<euc:EformSelect DropDownWidth="300px" style="width:50px" RecordId="20" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_20" CascadeValuesBasedOn="$PathStageDisease_20,$PathStageSystem_20" CascadeFormatString="StagePath_{0}_{n.1.extract10}_R" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_20"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="20" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_20" CascadeValuesBasedOn="$PathStageDisease_20,$PathStageSystem_20" CascadeFormatString="StagePath_{0}_{n.1.extract10}_Group"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_20"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="300px" style="width:100px" RecordId="20" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathGrade" ID="PathGrade_20" LookupCode="PathGrade,Disease,@DiseaseView"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_20"/></td>
 	        <td>
				<euc:EformTextBox style="width:100px" RecordId="20" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_20" ShowTextEditor="true"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_20"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server"/></td>
          </tr>  

</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathStagesStomachHtmlTable');" />
<br/><br/><br/>

