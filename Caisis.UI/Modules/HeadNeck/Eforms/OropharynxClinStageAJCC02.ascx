<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxClinStageAJCC02" CodeFile="OropharynxClinStageAJCC02.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
           
     function setClinStageHiddenFields(ClinStageTID,ClinStageNID,ClinStageMID,ClinStageQualityID){

           
     } 


</script>

<br/>

<a name="OropharynxClinStageAJCC02" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Clinical Stage (Oropharyngeal)"></asp:Label><br/>
<table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
   
          <tr>
				<td colspan="2" class="controlBoxDataGridTitleColumn">Date</td>	
				<td  class="controlBoxDataGridTitleColumn">Physician</td>
				<td  class="controlBoxDataGridTitleColumn">Data Quality</td>
				<td  class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
          <tr>
			
				<td colspan="2">				
					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate" RecordId="1" />
					<euc:EformTextBox style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText" RecordId="1" />
  			    </td>
              <td>
                    <euc:EformComboBox style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" LookupCode="Physician" Runat="server" ID="ClinStagePhysician" RecordId="1"/>
              </td>
             <td>
                  <euc:EformComboBox DropDownWidth="300px" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality" RecordId="1" LookupCode="DataQuality" /></td>
              
          </tr>  
          		  
		  <tr>
				<td  class="controlBoxDataGridTitleColumn" align="center">Staging System</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="center">Distant Metastasis (M)</td>
				<td   class="controlBoxDataGridTitleColumn"></td> 
          </tr>
          <tr>
                <td>
                
					<euc:EformDropDownList style="width:100px" LookupDistinct="ClinicalStages;ClinStageSystem;ClinStageSystem" TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem" RecordId="1"/>
                </td>
				<td>
					<euc:EformDropDownList style="width:100px"  LookupCode="StageClin_Oropharynx_02_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT" RecordId="1"></euc:EformDropDownList></td>
				<td>
					<euc:EformDropDownList style="width:140px" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN" RecordId="1">
                    <asp:ListItem Text=" " Value=""/>
                    <asp:ListItem Text="N0" Value="N0"/>
                    <asp:ListItem Text="N1" Value="N1"/>
                    <asp:ListItem Text="N2a" Value="N2a"/>
                    <asp:ListItem Text="N2b" Value="N2b"/>
                    <asp:ListItem Text="N2c" Value="N2c"/>
                    <asp:ListItem Text="N3" Value="N3"/>
                    </euc:EformDropDownList></td>
				<td>
					<euc:EformDropDownList style="width:115px"  LookupCode="StageClin_Oropharynx_02_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM" RecordId="1" />
			    </td>
        
		 </tr>
          <tr>
				<td colspan="5"  class="controlBoxDataGridTitleColumn" >Notes</td>	
		  </tr>
         <tr>
              <td colspan="5">
                    <euc:EformTextBox style="width:400px"  TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes" RecordId="1" ShowTextEditor="true"/></td>
         </tr>

</table>
<br/><br/><br/>

