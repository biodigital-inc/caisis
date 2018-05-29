<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OralCavityClinStage" CodeFile="OralCavityClinStage.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" language="javascript">
    tableArray.ClinStagesHtmlTable = "ClinStagesHtmlTable";
</script>

<a name="OralCavityClinStage" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Clinical Stages (Oral Cavity)"></asp:Label><br/>
<table width="500" cellpadding="10" cellspacing="0" class="ClinicalEformTable" id="ClinStagesHtmlTable">
   
   <tr>
    <td>
        <table cellpadding="5" id="ClinicalStageTable_1" >
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Date</td>	
				<td  class="controlBoxDataGridTitleColumn">Physician</td>
				<td  class="controlBoxDataGridTitleColumn">Data Quality</td>
				<td  class="controlBoxDataGridTitleColumn">Notes</td> 
		  </tr>
          <tr>
		    <td>				
			    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate_1" RecordId="1" />
			    <euc:EformTextBox Width="100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText_1" RecordId="1" EnableHiddenOnUIEvent="ClinStageDisease_1" /></td>
            <td>
                <euc:EformComboBox Width="100px" style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" LookupCode="Physician" Runat="server" ID="ClinStagePhysician_1" RecordId="1" EnableHiddenOnUIEvent="ClinStageDisease_1"/></td>
            <td>
                <euc:EformComboBox DropDownWidth="300px" Width="100px" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality_1" RecordId="1" LookupCode="DataQuality" EnableHiddenOnUIEvent="ClinStageDisease_1"/></td>
            <td>
                <euc:EformTextBox Width="100px" TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes_1" RecordId="1" ShowTextEditor="true" EnableHiddenOnUIEvent="ClinStageDisease_1"/></td>              
          </tr>  
          		  
		  <tr>		
				<td  class="controlBoxDataGridTitleColumn" align="center">System</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Distant Metastasis (M)</td>
          </tr>
          <tr>			
				<td align="center" >
					<euc:EformDropDownList Width="100px" LookupCode="StagingSystem" RecordId="1" TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_1" EnableHiddenOnUIEvent="ClinStageDisease_1"/></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_1,$ClinStageSystem_1" CascadeFormatString="StageClin_{0}_{n.1}_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_1" RecordId="1" /></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_1,$ClinStageSystem_1" CascadeFormatString="StageClin_{0}_{n.1}_N" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_1" RecordId="1"  /></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_1,$ClinStageSystem_1" CascadeFormatString="StageClin_{0}_{n.1}_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_1" RecordId="1"  />
				    <euc:EformHidden Enabled="false" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease_1" RecordId="1" Value="Oral"  />
			    </td>
        
		 </tr>
        
        </table>
    </td>
   </tr>
   <tr style="display: none; " >
    <td>
        <table cellpadding="5" id="ClinicalStageTable_2" >
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Date</td>	
				<td  class="controlBoxDataGridTitleColumn">Physician</td>
				<td  class="controlBoxDataGridTitleColumn">Data Quality</td>
				<td  class="controlBoxDataGridTitleColumn">Notes</td> 
		  </tr>
          <tr>
		    <td>				
			    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate_2" RecordId="2" />
			    <euc:EformTextBox Width="100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText_2" RecordId="2" EnableHiddenOnUIEvent="ClinStageDisease_2" /></td>
            <td>
                <euc:EformComboBox Width="100px" style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" LookupCode="Physician" Runat="server" ID="ClinStagePhysician_2" RecordId="2" EnableHiddenOnUIEvent="ClinStageDisease_2"/></td>
            <td>
                <euc:EformComboBox DropDownWidth="300px" Width="100px" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality_2" RecordId="2" LookupCode="DataQuality" EnableHiddenOnUIEvent="ClinStageDisease_2"/></td>
            <td>
                <euc:EformTextBox Width="100px" TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes_2" RecordId="2" ShowTextEditor="true" EnableHiddenOnUIEvent="ClinStageDisease_2"/></td>              
          </tr>  
          		  
		  <tr>		
				<td  class="controlBoxDataGridTitleColumn" align="center">System</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Distant Metastasis (M)</td>
          </tr>
          <tr>			
				<td align="center" >
					<euc:EformDropDownList Width="100px" LookupCode="StagingSystem" RecordId="2" TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_2" EnableHiddenOnUIEvent="ClinStageDisease_2"/></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_2,$ClinStageSystem_2" CascadeFormatString="StageClin_{0}_{n.1}_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_2" RecordId="2" /></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_2,$ClinStageSystem_2" CascadeFormatString="StageClin_{0}_{n.1}_N" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_2" RecordId="2"  /></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_2,$ClinStageSystem_2" CascadeFormatString="StageClin_{0}_{n.1}_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_2" RecordId="2"  />
				    <euc:EformHidden Enabled="false" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease_2" RecordId="2" Value="Oral"  />
			    </td>
        
		 </tr>
        
        </table>
    </td>
   </tr>
   <tr style="display: none; " >
    <td>
        <table cellpadding="5" id="ClinicalStageTable_3" >
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Date</td>	
				<td  class="controlBoxDataGridTitleColumn">Physician</td>
				<td  class="controlBoxDataGridTitleColumn">Data Quality</td>
				<td  class="controlBoxDataGridTitleColumn">Notes</td> 
		  </tr>
          <tr>
		    <td>				
			    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate_3" RecordId="3" />
			    <euc:EformTextBox Width="100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText_3" RecordId="3" EnableHiddenOnUIEvent="ClinStageDisease_3" /></td>
            <td>
                <euc:EformComboBox Width="100px" style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" LookupCode="Physician" Runat="server" ID="ClinStagePhysician_3" RecordId="3" EnableHiddenOnUIEvent="ClinStageDisease_3"/></td>
            <td>
                <euc:EformComboBox DropDownWidth="300px" Width="100px" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality_3" RecordId="3" LookupCode="DataQuality" EnableHiddenOnUIEvent="ClinStageDisease_3"/></td>
            <td>
                <euc:EformTextBox Width="100px" TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes_3" RecordId="3" ShowTextEditor="true" EnableHiddenOnUIEvent="ClinStageDisease_3"/></td>              
          </tr>  
          		  
		  <tr>		
				<td  class="controlBoxDataGridTitleColumn" align="center">System</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Distant Metastasis (M)</td>
          </tr>
          <tr>			
				<td align="center" >
					<euc:EformDropDownList Width="100px" LookupCode="StagingSystem" RecordId="3" TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_3" EnableHiddenOnUIEvent="ClinStageDisease_3"/></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_3,$ClinStageSystem_3" CascadeFormatString="StageClin_{0}_{n.1}_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_3" RecordId="3" /></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_3,$ClinStageSystem_3" CascadeFormatString="StageClin_{0}_{n.1}_N" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_3" RecordId="3"  /></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_3,$ClinStageSystem_3" CascadeFormatString="StageClin_{0}_{n.1}_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_3" RecordId="3"  />
				    <euc:EformHidden Enabled="false" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease_3" RecordId="3" Value="Oral"  />
			    </td>
        
		 </tr>
        
        </table>
    </td>
   </tr>
   <tr style="display: none; " >
    <td>
        <table cellpadding="5" id="ClinicalStageTable_4" >
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Date</td>	
				<td  class="controlBoxDataGridTitleColumn">Physician</td>
				<td  class="controlBoxDataGridTitleColumn">Data Quality</td>
				<td  class="controlBoxDataGridTitleColumn">Notes</td> 
		  </tr>
          <tr>
		    <td>				
			    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate_4" RecordId="4" />
			    <euc:EformTextBox Width="100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText_4" RecordId="4" EnableHiddenOnUIEvent="ClinStageDisease_4" /></td>
            <td>
                <euc:EformComboBox Width="100px" style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" LookupCode="Physician" Runat="server" ID="ClinStagePhysician_4" RecordId="4" EnableHiddenOnUIEvent="ClinStageDisease_4"/></td>
            <td>
                <euc:EformComboBox DropDownWidth="300px" Width="100px" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality_4" RecordId="4" LookupCode="DataQuality" EnableHiddenOnUIEvent="ClinStageDisease_4"/></td>
            <td>
                <euc:EformTextBox Width="100px" TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes_4" RecordId="4" ShowTextEditor="true" EnableHiddenOnUIEvent="ClinStageDisease_4"/></td>              
          </tr>  
          		  
		  <tr>		
				<td  class="controlBoxDataGridTitleColumn" align="center">System</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Distant Metastasis (M)</td>
          </tr>
          <tr>			
				<td align="center" >
					<euc:EformDropDownList Width="100px" LookupCode="StagingSystem" RecordId="4" TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_4" EnableHiddenOnUIEvent="ClinStageDisease_4"/></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_4,$ClinStageSystem_4" CascadeFormatString="StageClin_{0}_{n.1}_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_4" RecordId="4" /></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_4,$ClinStageSystem_4" CascadeFormatString="StageClin_{0}_{n.1}_N" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_4" RecordId="4"  /></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_4,$ClinStageSystem_4" CascadeFormatString="StageClin_{0}_{n.1}_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_4" RecordId="4"  />
				    <euc:EformHidden Enabled="false" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease_4" RecordId="4" Value="Oral"  />
			    </td>
        
		 </tr>
        
        </table>
    </td>
   </tr>
   <tr style="display: none; " >
    <td>
        <table cellpadding="5"  id="ClinicalStageTable_5" >
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Date</td>	
				<td  class="controlBoxDataGridTitleColumn">Physician</td>
				<td  class="controlBoxDataGridTitleColumn">Data Quality</td>
				<td  class="controlBoxDataGridTitleColumn">Notes</td> 
		  </tr>
          <tr>
		    <td>				
			    <euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate_5" RecordId="5" />
			    <euc:EformTextBox Width="100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText_5" RecordId="5" EnableHiddenOnUIEvent="ClinStageDisease_5" /></td>
            <td>
                <euc:EformComboBox Width="100px" style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" LookupCode="Physician" Runat="server" ID="ClinStagePhysician_5" RecordId="5" EnableHiddenOnUIEvent="ClinStageDisease_5"/></td>
            <td>
                <euc:EformComboBox DropDownWidth="300px" Width="100px" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality_5" RecordId="5" LookupCode="DataQuality" EnableHiddenOnUIEvent="ClinStageDisease_5"/></td>
            <td>
                <euc:EformTextBox Width="100px" TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes_5" RecordId="5" ShowTextEditor="true" EnableHiddenOnUIEvent="ClinStageDisease_5"/></td>              
          </tr>  
          		  
		  <tr>		
				<td  class="controlBoxDataGridTitleColumn" align="center">Staging System</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Distant Metastasis (M)</td>
          </tr>
          <tr>			
				<td align="center" >
					<euc:EformDropDownList Width="100px" LookupCode="StagingSystem" RecordId="5" TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_5" EnableHiddenOnUIEvent="ClinStageDisease_5"/></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_5,$ClinStageSystem_5" CascadeFormatString="StageClin_{0}_{n.1}_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_5" RecordId="5" /></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_5,$ClinStageSystem_5" CascadeFormatString="StageClin_{0}_{n.1}_N" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_5" RecordId="5"  /></td>
				<td align="center" >
					<euc:EformSelect Width="100px" CascadeValuesBasedOn="$ClinStageDisease_5,$ClinStageSystem_5" CascadeFormatString="StageClin_{0}_{n.1}_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_5" RecordId="5"  />
				    <euc:EformHidden Enabled="false" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease_5" RecordId="5" Value="Oral"  />
			    </td>
        
		 </tr>
        
        </table>
    </td>
   </tr>


</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ClinStagesHtmlTable');" />
<br/><br/><br/>

