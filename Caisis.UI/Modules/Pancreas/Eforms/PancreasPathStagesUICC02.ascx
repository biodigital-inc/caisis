<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasPathStagesUICC02" CodeFile="PancreasPathStagesUICC02.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<%--<script type="text/javascript" language="javascript">
	tableArray.PathStagesHtmlTable = "PathStagesHtmlTable";
</script>--%>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
           
</script>

<br/>

<a name="PancreasPathStagesUICC02" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Stages (Pancreas,UICC02)"></asp:Label><br/>
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PathStagesHtmlTable">
   
          <tr>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn">Primary Tumor (T)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn">Regional Lymph Nodes (N) </td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn">Distant Metastasis (M)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn">Residual Tumor (R)</td>
				<td style="width:120px; text-align: left;" class="controlBoxDataGridTitleColumn">Notes</td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
          <tr>
			
			<td>	
				<euc:EformHidden RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_1" Runat="server" Value="Pancreas"/>			    
                <euc:EformHidden RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_1" Runat="server" Value="UICC_02"/>
		    
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_1" LookupCode="StagePath_Pancreas_02_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"  /></td>
		    <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_1" LookupCode="StagePath_Pancreas_02_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_1" LookupCode="StagePath_Pancreas_02_M"  Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_1" LookupCode="StagePath_Pancreas_02_R"   Runat="server" EnableHiddenOnUIEvent="PathStageDisease_1,PathStageSystem_1"  /></td>
			<td>	
				<euc:EformTextBox style="width:100px" RecordId="1" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_1" Runat="server" ShowTextEditor="true"/></td>			    

            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>  
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_2" Runat="server" Value="Pancreas"/>			    
                <euc:EformHidden RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_2" Runat="server" Value="UICC_02" />
		    
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_2" LookupCode="StagePath_Pancreas_02_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"  /></td>
		    <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_2" LookupCode="StagePath_Pancreas_02_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_2" LookupCode="StagePath_Pancreas_02_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"/></td>
			<td>	 
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_2" LookupCode="StagePath_Pancreas_02_R"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_2,PathStageSystem_2"  /></td>
			<td>	
				<euc:EformTextBox style="width:100px" RecordId="2" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_2" Runat="server" ShowTextEditor="true"/></td>			    

            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>  
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_3" Runat="server" Value="Pancreas"/>			    
                <euc:EformHidden RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_3" Runat="server" Value="UICC_02"/>
		    
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_3" LookupCode="StagePath_Pancreas_02_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3,PathStageSystem_3"  /></td>
		    <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_3" LookupCode="StagePath_Pancreas_02_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3,PathStageSystem_3"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_3" LookupCode="StagePath_Pancreas_02_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_3,PathStageSystem_3"/></td>
			<td>	
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_3" LookupCode="StagePath_Pancreas_02_R"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_3,PathStageSystem_3"  /></td>
			<td>	
				<euc:EformTextBox style="width:100px" RecordId="3" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_3" Runat="server" ShowTextEditor="true"/></td>			    
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_4" Runat="server" Value="Pancreas"/>			    
                <euc:EformHidden RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_4" Runat="server" Value="UICC_02"/>
		    
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_4" LookupCode="StagePath_Pancreas_02_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4,PathStageSystem_4"   /></td>
		    <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_4" LookupCode="StagePath_Pancreas_02_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4,PathStageSystem_4"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_4" LookupCode="StagePath_Pancreas_02_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_4,PathStageSystem_4"/></td>
			<td>	
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_4" LookupCode="StagePath_Pancreas_02_R"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_4,PathStageSystem_4"  /></td>
			<td>	
				<euc:EformTextBox style="width:100px" RecordId="4" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_4" Runat="server" ShowTextEditor="true"/></td>			    
            <td><euc:EformDeleteIcon  runat="server"/></td>
         
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_5" Runat="server" Value="Pancreas"/>			    
                <euc:EformHidden RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_5" Runat="server" Value="UICC_02"/>
		    
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_5" LookupCode="StagePath_Pancreas_02_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5,PathStageSystem_5"  /></td>
		    <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_5" LookupCode="StagePath_Pancreas_02_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5,PathStageSystem_5"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_5" LookupCode="StagePath_Pancreas_02_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_5,PathStageSystem_5"/></td>
			<td>	
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_5" LookupCode="StagePath_Pancreas_02_R"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_5,PathStageSystem_5"  /></td>
			<td>	
				<euc:EformTextBox style="width:100px" RecordId="5" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_5" Runat="server" ShowTextEditor="true"/></td>			    
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_6" Runat="server" Value="Pancreas"/>			    
                <euc:EformHidden RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_6" Runat="server" Value="UICC_02"/>
		    
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_6" LookupCode="StagePath_Pancreas_02_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6,PathStageSystem_6"  /></td>
		    <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_6" LookupCode="StagePath_Pancreas_02_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6,PathStageSystem_6"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_6" LookupCode="StagePath_Pancreas_02_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_6,PathStageSystem_6"/></td>
			<td>	
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_6" LookupCode="StagePath_Pancreas_02_R"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_6,PathStageSystem_6"  /></td>
 			<td>	
				<euc:EformTextBox style="width:100px" RecordId="6" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_6" Runat="server" ShowTextEditor="true"/></td>			            
             <td><euc:EformDeleteIcon runat="server"/></td>
          </tr> 
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_7" Runat="server" Value="Pancreas"/>			    
                <euc:EformHidden RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_7" Runat="server" Value="UICC_02"/>
		    
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_7" LookupCode="StagePath_Pancreas_02_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7,PathStageSystem_7"  /></td>
		    <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_7" LookupCode="StagePath_Pancreas_02_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7,PathStageSystem_7"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_7" LookupCode="StagePath_Pancreas_02_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_7,PathStageSystem_7"/></td>
			<td>	
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_7" LookupCode="StagePath_Pancreas_02_R"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_7,PathStageSystem_7"  /></td>
 			<td>	
				<euc:EformTextBox style="width:100px" RecordId="7" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_7" Runat="server" ShowTextEditor="true"/></td>			            
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>    
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_8" Runat="server" Value="Pancreas"/>			    
                <euc:EformHidden RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_8" Runat="server" Value="UICC_02"/>
		    
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_8" LookupCode="StagePath_Pancreas_02_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8,PathStageSystem_8"  /></td>
		    <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_8" LookupCode="StagePath_Pancreas_02_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8,PathStageSystem_8"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_8" LookupCode="StagePath_Pancreas_02_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_8,PathStageSystem_8"/></td>
			<td>	
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_8" LookupCode="StagePath_Pancreas_02_R"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_8,PathStageSystem_8"  /></td>
 			<td>	
				<euc:EformTextBox style="width:100px" RecordId="8" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_8" Runat="server" ShowTextEditor="true"/></td>			            
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>      		
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_9" Runat="server" Value="Pancreas"/>			    
                <euc:EformHidden RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_9" Runat="server" Value="UICC_02"/>
		    
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_9" LookupCode="StagePath_Pancreas_02_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9,PathStageSystem_9"  /></td>
		    <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_9" LookupCode="StagePath_Pancreas_02_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9,PathStageSystem_9"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_9" LookupCode="StagePath_Pancreas_02_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_9,PathStageSystem_9"/></td>
			<td>	
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_9" LookupCode="StagePath_Pancreas_02_R"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_9,PathStageSystem_9"  /></td>
 			<td>	
				<euc:EformTextBox style="width:100px" RecordId="9" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_9" Runat="server" ShowTextEditor="true"/></td>			            
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>     
          <tr style="display: none;">
			
			<td>	
				<euc:EformHidden RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageDisease" ID="PathStageDisease_10" Runat="server" Value="Pancreas"/>			    
                <euc:EformHidden RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageSystem" ID="PathStageSystem_10" Runat="server" Value="UICC_02"/>
		    
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageT" ID="PathStageT_10" LookupCode="StagePath_Pancreas_02_T"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10,PathStageSystem_10"  /></td>
		    <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageN" ID="PathStageN_10" LookupCode="StagePath_Pancreas_02_N" Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10,PathStageSystem_10"/></td>
	        <td>
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageM" ID="PathStageM_10" LookupCode="StagePath_Pancreas_02_M" Runat="server"  EnableHiddenOnUIEvent="PathStageDisease_10,PathStageSystem_10"/></td>
			<td>	
				<euc:EformComboBox DropDownWidth="400px"   style="width:100px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathStageR" ID="PathStageR_10" LookupCode="StagePath_Pancreas_02_R"  Runat="server" EnableHiddenOnUIEvent="PathStageDisease_10,PathStageSystem_10"  /></td>
 			<td>	
				<euc:EformTextBox style="width:100px" RecordId="10" ParentRecordId="11" TABLE="PathologyStageGrade" FIELD="PathNotes" ID="PathNotes_10" Runat="server" ShowTextEditor="true"/></td>			            
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>  
</table>
<%--<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathStagesHtmlTable');" />--%>
<br/><br/><br/>

