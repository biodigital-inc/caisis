<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusClinStageSiewart" CodeFile="EsophagusClinStageSiewart.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="EsophagusClinStageSiewart" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Clinical Staging (Esophagus, UICC_02)"></asp:Label><br/>

<br /><br />

<strong>(Esophagus, Siewert_AEGI)</strong>
<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
   
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Date</td>	
				<td height="10%" class="controlBoxDataGridTitleColumn">Physician</td>
				<td  class="controlBoxDataGridTitleColumn">Data Quality</td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
				
		  </tr>
          <tr>
			
				<td>				
					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate_1" RecordId="1" />
					<euc:EformTextBox style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText_1" RecordId="1" />
  			    </td>
              <td>
                    <euc:EformComboBox DropDownWidth="300px" style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" LookupCode="Physician,Disease,@DiseaseView" Runat="server" ID="ClinStagePhysician_1" RecordId="1" />
              </td>
             <td>
                  <euc:EformComboBox DropDownWidth="300px" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality_1" RecordId="1" LookupCode="DataQuality" /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon_1a" runat="server"/></td>
          </tr>  
          		  
		  <tr>		
				<td  class="controlBoxDataGridTitleColumn" align="left">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="left">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="left">Distant Metastasis (M)</td>
				<td  height="10%" class="controlBoxDataGridTitleColumn"></td> 
          </tr>
          <tr>			
				<td>
				    <euc:EformTextBox Width="1px" style="display: none; "  TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease_1" RecordId="1"   />
				    <euc:EformTextBox Width="1px" style="display: none; " TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_1" RecordId="1"   />

					<euc:EformSelect DropDownWidth="400px"  style="width:100px" LookupCode="StageClin_Esophagus_AEGI_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_1" RecordId="1" /></td>
				<td>
					<euc:EformSelect DropDownWidth="400px"  style="width:140px"  LookupCode="StageClin_Esophagus_AEGI_N" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_1" RecordId="1"  /></td>
				<td>
					<euc:EformSelect DropDownWidth="450px"  style="width:115px"  LookupCode="StageClin_Esophagus_AEGI_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_1" RecordId="1"  />
			    </td>
                 <td><euc:EformDeleteIcon ID="EformDeleteIcon_1b" runat="server"/></td>
		 </tr>
          <tr>
				<td colspan="3" class="controlBoxDataGridTitleColumn" >Notes</td>	
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
         <tr>
              <td colspan="3">
                    <euc:EformTextBox style="width:500px"  TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes_1" RecordId="1" ShowTextEditor="true" /></td>
               <td><euc:EformDeleteIcon ID="EformDeleteIcon_1c" runat="server"/></td>
         </tr>

</table>


<br /><br />

<strong>(Stomach, Siewert_AEGII-III)</strong>
<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
   
          <tr>
				<td  class="controlBoxDataGridTitleColumn" >Date</td>	
				<td height="10%" class="controlBoxDataGridTitleColumn">Physician</td>
				<td  class="controlBoxDataGridTitleColumn">Data Quality</td>
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
          <tr>
			
				<td>				
					<euc:EformHidden TABLE="ClinicalStages" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate_2" RecordId="2" />
					<euc:EformTextBox style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText_2" RecordId="2" />
  			    </td>
              <td>
                    <euc:EformComboBox DropDownWidth="300px" style="width:100px"  TABLE="ClinicalStages" FIELD="ClinStagePhysician" LookupCode="Physician,Disease,@DiseaseView" Runat="server" ID="ClinStagePhysician_2" RecordId="2" />
              </td>
             <td>
                  <euc:EformComboBox DropDownWidth="300px" TABLE="ClinicalStages" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality_2" RecordId="2" LookupCode="DataQuality" /></td>
              <td><euc:EformDeleteIcon ID="EformDeleteIcon_2a" runat="server"/></td>
          </tr>  
          		  
		  <tr>		
				<td  class="controlBoxDataGridTitleColumn" align="left">Primary Tumor (T)</td>
				<td  class="controlBoxDataGridTitleColumn" align="left">Regional Lymph Nodes (N) </td>
				<td  class="controlBoxDataGridTitleColumn" align="left">Distant Metastasis (M)</td>
				<td  height="10%" class="controlBoxDataGridTitleColumn"></td> 
          </tr>
          <tr>			
				<td>
				    <euc:EformTextBox Width="1px" style="display: none; "  TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease_2" RecordId="2"   />
				    <euc:EformTextBox Width="1px" style="display: none; " TABLE="ClinicalStages" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem_2" RecordId="2"   />

					<euc:EformSelect DropDownWidth="400px"  style="width:100px" LookupCode="StageClin_Stomach_AEGII-III_T" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" ID="ClinStageT_2" RecordId="2" /></td>
				<td>
					<euc:EformSelect DropDownWidth="400px"  style="width:140px"  LookupCode="StageClin_Stomach_AEGII-III_N" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" ID="ClinStageN_2" RecordId="2"  /></td>
				<td>
					<euc:EformSelect DropDownWidth="400px" style="width:115px"  LookupCode="StageClin_Stomach_AEGII-III_M" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" ID="ClinStageM_2" RecordId="2"  />
			    </td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon_2b" runat="server"/></td>
		 </tr>
          <tr>
				<td  colspan="3" class="controlBoxDataGridTitleColumn" >Notes</td>	
				<td height="10%" class="controlBoxDataGridTitleColumn"></td> 
		  </tr>
         <tr>
              <td colspan="3">
                    <euc:EformTextBox style="width:500px"  TABLE="ClinicalStages" FIELD="ClinStageNotes" Runat="server" ID="ClinStageNotes_2" ShowTextEditor="true" RecordId="2" /></td>
              <td><euc:EformDeleteIcon ID="EformDeleteIcon_2c" runat="server"/></td>
         </tr>

</table>


<br/><br/><br/>

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo
    addAbsentEvent($('<%= ClinStageDateText_1.ClientID %>'), $('<%= ClinStagePhysician_1.ClientID %>'), $('<%= ClinStageQuality_1.ClientID %>'), $('<%= ClinStageNotes_1.ClientID %>'), $('<%= ClinStageDisease_1.ClientID %>'), $('<%= ClinStageSystem_1.ClientID %>'), 'Esophagus', 'Siewert_AEGI');
    addAbsentEvent($('<%= ClinStageDateText_2.ClientID %>'), $('<%= ClinStagePhysician_2.ClientID %>'), $('<%= ClinStageQuality_2.ClientID %>'), $('<%= ClinStageNotes_2.ClientID %>'), $('<%= ClinStageDisease_2.ClientID %>'), $('<%= ClinStageSystem_2.ClientID %>'), 'Stomach', 'Siewert_AEGII-III');

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

