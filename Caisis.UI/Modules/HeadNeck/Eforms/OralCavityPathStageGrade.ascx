<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OralCavityPathStageGrade" CodeFile="OralCavityPathStageGrade.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
    tableArray.PathStagesHtmlTable = "PathStagesHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">

</script>

<br/>

<a name="OralCavityPathStageGrade" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Stages (Oropharynx)"></asp:Label><br/>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PathStagesHtmlTable">
   
          <tr>
				<td class="controlBoxDataGridTitleColumn" style="text-align: left; width:120px;" >Staging System</td>	
				<td class="controlBoxDataGridTitleColumn" style="text-align: left;  width:120px;">Primary Tumor (T)</td>
				<td class="controlBoxDataGridTitleColumn" style="text-align: left;  width:120px;">Regional Lymph Nodes (N) </td>
				<td class="controlBoxDataGridTitleColumn" style="text-align: left;  width:120px;">Distant Metastasis (M)</td>
				<td height="10%" class="controlBoxDataGridTitleColumn">&nbsp;</td> 
		  </tr>
          <tr>
			
			<td>	
				<euc:EformHidden RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_1"    Runat="server" Value="Oral"  />			    
				<euc:EformHidden RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathQuality" ID="PathQuality_1"    Runat="server" Value="STD"  />			    
                <euc:EformDropDownList style="width:80px" RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_1" LookupCode="StagingSystem"    Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1,PathQuality_1" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_1" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" CascadeFormatString="StagePath_{0}_{n.1}_T" Runat="server" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_1" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server"  /></td>
	        <td>
				<euc:EformSelect style="width:80px" RecordId="1" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_1" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"   /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td>
          </tr>  
          <tr style="display: none;" >
			
			<td>	
				<euc:EformHidden RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_2" Runat="server" Value="Oral"/>			    
                <euc:EformHidden RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathQuality" ID="PathQuality_2" Runat="server" Value="STD"/>		
                <euc:EformDropDownList style="width:80px" RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_2" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2,PathQuality_2" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_2" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" CascadeFormatString="StagePath_{0}_{n.1}_T" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2,PathQuality_2" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_2" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2,PathQuality_2" /></td>
	        <td>
				<euc:EformSelect style="width:80px" RecordId="2" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_2" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_2,PathQuality_2" /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server"/></td>
          </tr>  
          <tr style="display: none;" >
			
			<td>	
				<euc:EformHidden RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_3" Runat="server" Value="Oral"/>			    
                <euc:EformHidden RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathQuality" ID="PathQuality_3" Runat="server" Value="STD"/>		
                <euc:EformDropDownList style="width:80px" RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_3" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3,PathQuality_3" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_3" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" CascadeFormatString="StagePath_{0}_{n.1}_T" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3,PathQuality_3" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_3" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3,PathQuality_3" /></td>
	        <td>
				<euc:EformSelect style="width:80px" RecordId="3" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_3" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_3,PathQuality_3" /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_3" runat="server"/></td>
          </tr>  
          <tr style="display: none;" >
			
			<td>	
				<euc:EformHidden  RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_4" Runat="server" Value="Oral"/>			    
                <euc:EformHidden  RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathQuality" ID="PathQuality_4" Runat="server" Value="STD"/>		
                <euc:EformDropDownList style="width:80px" RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_4" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4,PathQuality_4" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_4" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" CascadeFormatString="StagePath_{0}_{n.1}_T" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4,PathQuality_4" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_4" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4,PathQuality_4" /></td>
	        <td>
				<euc:EformSelect style="width:80px" RecordId="4" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_4" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_4,PathQuality_4" /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server"/></td>
          </tr>  
          <tr style="display: none;" >
			
			<td>	
				<euc:EformHidden  RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_5" Runat="server" Value="Oral"/>			    
                <euc:EformHidden  RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathQuality" ID="PathQuality_5" Runat="server" Value="STD"/>		
                <euc:EformDropDownList style="width:80px" RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_5" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5,PathQuality_5" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_5" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" CascadeFormatString="StagePath_{0}_{n.1}_T" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5,PathQuality_5" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_5" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5,PathQuality_5" /></td>
	        <td>
				<euc:EformSelect style="width:80px" RecordId="5" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_5" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_5,PathQuality_5" /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/></td>
          </tr>  
          <tr style="display: none;" >
			
			<td>	
				<euc:EformHidden  RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_6" Runat="server" Value="Oral"/>			    
                <euc:EformHidden  RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathQuality" ID="PathQuality_6" Runat="server" Value="STD"/>		
                <euc:EformDropDownList style="width:80px" RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_6" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6,PathQuality_6" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_6" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" CascadeFormatString="StagePath_{0}_{n.1}_T" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6,PathQuality_6" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_6" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6,PathQuality_6" /></td>
	        <td>
				<euc:EformSelect style="width:80px" RecordId="6" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_6" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_6,PathQuality_6" /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_6" runat="server"/></td>
          </tr>  
          <tr style="display: none;" >
			
			<td>	
				<euc:EformHidden  RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_7" Runat="server" Value="Oral"/>			    
                <euc:EformHidden  RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathQuality" ID="PathQuality_7" Runat="server" Value="STD"/>		
                <euc:EformDropDownList style="width:80px" RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_7" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7,PathQuality_7" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_7" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" CascadeFormatString="StagePath_{0}_{n.1}_T" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7,PathQuality_7" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_7" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7,PathQuality_7" /></td>
	        <td>
				<euc:EformSelect style="width:80px" RecordId="7" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_7" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_7,PathQuality_7" /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/></td>
          </tr>  
          <tr style="display: none;" >
			
			<td>	
				<euc:EformHidden  RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_8" Runat="server" Value="Oral"/>			    
                <euc:EformHidden  RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathQuality" ID="PathQuality_8" Runat="server" Value="STD"/>		
                <euc:EformDropDownList style="width:80px" RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_8" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8,PathQuality_8" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_8" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" CascadeFormatString="StagePath_{0}_{n.1}_T" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8,PathQuality_8" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_8" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8,PathQuality_8" /></td>
	        <td>
				<euc:EformSelect style="width:80px" RecordId="8" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_8" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_8,PathQuality_8" /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/></td>
          </tr>  
          <tr style="display: none;" >
			
			<td>	
				<euc:EformHidden  RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_9" Runat="server" Value="Oral"/>			    
                <euc:EformHidden  RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathQuality" ID="PathQuality_9" Runat="server" Value="STD"/>		
                <euc:EformDropDownList style="width:80px" RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_9" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9,PathQuality_9" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_9" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" CascadeFormatString="StagePath_{0}_{n.1}_T" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9,PathQuality_9" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_9" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9,PathQuality_9" /></td>
	        <td>
				<euc:EformSelect style="width:80px" RecordId="9" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_9" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_9,PathQuality_9" /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_9" runat="server"/></td>
          </tr>  
          <tr style="display: none;" >
			
			<td>	
				<euc:EformHidden  RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_10" Runat="server" Value="Oral"/>			    
                <euc:EformHidden  RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathQuality" ID="PathQuality_10" Runat="server" Value="STD"/>		
                <euc:EformDropDownList style="width:80px" RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_10" LookupCode="StagingSystem"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10,PathQuality_10" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_10" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" CascadeFormatString="StagePath_{0}_{n.1}_T" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10,PathQuality_10" /></td>
		    <td>
				<euc:EformSelect style="width:80px" RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_10" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" CascadeFormatString="StagePath_{0}_{n.1}_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10,PathQuality_10" /></td>
	        <td>
				<euc:EformSelect style="width:80px" RecordId="10" ParentRecordId="16" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_10" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" CascadeFormatString="StagePath_{0}_{n.1}_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_10,PathQuality_10" /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_10" runat="server"/></td>
          </tr>  
          
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathStagesHtmlTable');" />
<br/><br/><br/>