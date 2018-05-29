<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusClinStageSiewart2" CodeFile="EsophagusClinStageSiewart2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="EsophagusClinStageSiewart2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Clinical Staging (Esophagus, Siewart_02)"></asp:Label><br/>

<br /><br />

<strong>(Esophagus, Siewart_AEGI)</strong>
<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
   
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Date</td>	
				<td height="10%" class="controlBoxDataGridTitleColumn">Physician</td>
				<td  class="controlBoxDataGridTitleColumn">Data Quality</td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
          <tr>
			
				<td>				
					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate_3" RecordId="3" />
					<euc:EformTextBox style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText_3" RecordId="3" />
  			    </td>
              <td>
                    <euc:EformComboBox DropDownWidth="300px" style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" LookupCode="Physician,Disease,@DiseaseView" Runat="server" ID="ClinStagePhysician_3" RecordId="3" />
              </td>
             <td>
                  <euc:EformComboBox DropDownWidth="300px" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality_3" RecordId="3" LookupCode="DataQuality" /></td>
              
          </tr>  
          		  
		  <tr>		
				<td  class="controlBoxDataGridTitleColumn" align="left">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="left">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="left">Distant Metastasis (M)</td>
				<td  height="10%" class="controlBoxDataGridTitleColumn"></td> 
          </tr>
          <tr>			
				<td>
				    <euc:EformTextBox Width="1px" style="display: none; "  TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease_3" RecordId="3"   />
				    <euc:EformTextBox Width="1px" style="display: none; " TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_3" RecordId="3"   />

					<euc:EformSelect DropDownWidth="400px"  style="width:100px" LookupCode="StageClin_Esophagus_AEGI_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_3" RecordId="3" /></td>
				<td>
					<euc:EformSelect DropDownWidth="400px"  style="width:140px"  LookupCode="StageClin_Esophagus_AEGI_N" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_3" RecordId="3"  /></td>
				<td>
					<euc:EformSelect DropDownWidth="450px"  style="width:115px"  LookupCode="StageClin_Esophagus_AEGI_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_3" RecordId="3"  />
			    </td>
        
		 </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Notes</td>	
				<td height="10%" class="controlBoxDataGridTitleColumn"></td>
				<td  class="controlBoxDataGridTitleColumn"></td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
         <tr>
              <td colspan="3">
                    <euc:EformTextBox style="width:500px"  TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes_3" RecordId="3" ShowTextEditor="true" /></td>
         </tr>

</table>


<br /><br />

<strong>(Stomach, Siewart_AEGII-III)</strong>
<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
   
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Date</td>	
				<td height="10%" class="controlBoxDataGridTitleColumn">Physician</td>
				<td  class="controlBoxDataGridTitleColumn">Data Quality</td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
          <tr>
			
				<td>				
					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate_4" RecordId="4" />
					<euc:EformTextBox style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText_4" RecordId="4" />
  			    </td>
              <td>
                    <euc:EformComboBox DropDownWidth="300px" style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" LookupCode="Physician,Disease,@DiseaseView" Runat="server" ID="ClinStagePhysician_4" RecordId="4" />
              </td>
             <td>
                  <euc:EformComboBox DropDownWidth="300px" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality_4" RecordId="4" LookupCode="DataQuality" /></td>
              
          </tr>  
          		  
		  <tr>		
				<td  class="controlBoxDataGridTitleColumn" align="left">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="left">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="left">Distant Metastasis (M)</td>
				<td  height="10%" class="controlBoxDataGridTitleColumn"></td> 
          </tr>
          <tr>			
				<td>
				    <euc:EformTextBox Width="1px" style="display: none; "  TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease_4" RecordId="4"   />
				    <euc:EformTextBox Width="1px" style="display: none; " TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_4" RecordId="4"   />

					<euc:EformSelect DropDownWidth="400px"  style="width:100px" LookupCode="StageClin_Stomach_AEGII-III_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_4" RecordId="4" /></td>
				<td>
					<euc:EformSelect DropDownWidth="400px"  style="width:140px"  LookupCode="StageClin_Stomach_AEGII-III_N" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_4" RecordId="4"  /></td>
				<td>
					<euc:EformSelect DropDownWidth="400px" style="width:115px"  LookupCode="StageClin_Stomach_AEGII-III_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_4" RecordId="4"  />
			    </td>
        
		 </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Notes</td>	
				<td height="10%" class="controlBoxDataGridTitleColumn"></td>
				<td  class="controlBoxDataGridTitleColumn"></td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
         <tr>
              <td colspan="3">
                    <euc:EformTextBox style="width:500px"  TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes_4" ShowTextEditor="true" RecordId="4" /></td>
         </tr>

</table>


<br/><br/><br/>

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo
    addAbsentEvent($('<%= ClinStageDateText_3.ClientID %>'), $('<%= ClinStagePhysician_3.ClientID %>'), $('<%= ClinStageQuality_3.ClientID %>'), $('<%= ClinStageNotes_3.ClientID %>'), $('<%= ClinStageDisease_3.ClientID %>'), $('<%= ClinStageSystem_3.ClientID %>'), 'Esophagus', 'Siewart_AEGI');
    addAbsentEvent($('<%= ClinStageDateText_4.ClientID %>'), $('<%= ClinStagePhysician_4.ClientID %>'), $('<%= ClinStageQuality_4.ClientID %>'), $('<%= ClinStageNotes_4.ClientID %>'), $('<%= ClinStageDisease_4.ClientID %>'), $('<%= ClinStageSystem_4.ClientID %>'), 'Stomach', 'Siewart_AEGII-III');

    function addAbsentEvent(dateText,physician,quality,notes,disease,system,diseaseValue,systemValue)
    {  
        $(dateText).addEvent('blur',curry(SetHiddenFields,dateText,physician,quality,notes,disease,system,diseaseValue,systemValue));
        $(physician).addEvent('blur',curry(SetHiddenFields,dateText,physician,quality,notes,disease,system,diseaseValue,systemValue));
        $(quality).addEvent('blur',curry(SetHiddenFields,dateText,physician,quality,notes,disease,system,diseaseValue,systemValue));
        $(notes).addEvent('blur',curry(SetHiddenFields,dateText,physician,quality,notes,disease,system,diseaseValue,systemValue));
    }
   
    /* ]]> */
   
    function SetHiddenFields(dateText,physician,quality,notes,disease,system,diseaseValue,systemValue)
    {
        if (dateText.value != '' || physician.value != '' || quality.value != '' || notes.value != '')
        {
            disease.value = diseaseValue;
            system.value = systemValue;
        }
        else
        {
            disease.value = '';
            system.value = '';
        }
    }
    

</script>

