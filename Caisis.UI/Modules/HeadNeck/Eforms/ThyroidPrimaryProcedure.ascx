<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidPrimaryProcedure" CodeFile="ThyroidPrimaryProcedure.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.ProceduresPrimaryHtmlTable = "ProceduresPrimaryHtmlTable";
	
	function updateDates()
	 {	    
	    document.getElementById('<%= OpDateText_1.ClientID %>').value = document.getElementById('<%= ProcDateText_1.ClientID %>').value;
	    document.getElementById('<%= OpDate_1.ClientID %>').value = document.getElementById('<%= ProcDate_1.ClientID %>').value;
	    document.getElementById('<%= OpQuality_1.ClientID %>').value='STD';
	    
	    document.getElementById('<%= PathDateText.ClientID %>').value = document.getElementById('<%= ProcDateText_1.ClientID %>').value;
	    document.getElementById('<%= PathDate.ClientID %>').value = document.getElementById('<%= ProcDate_1.ClientID %>').value;
	    document.getElementById('<%= PathInstitution.ClientID %>').value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById('<%= PathSite.ClientID %>').value='Thyroid';
	    document.getElementById('<%= PathQuality.ClientID %>').value='STD';
	 }
	
	function updateOpSurgeon()
	{
	    document.getElementById('<%= OpCaseSurgeon_1.ClientID %>').value = document.getElementById('<%= ProcSurgeon_1.ClientID %>').value;
	}
	
    //Start of ProcFind Details
	function updateValuesOnCheck(ExtentchkboxId, grossChkBoxId, procFindSideId)
	{
	    if (ExtentchkboxId.checked == true || grossChkBoxId.checked == true)
	    {
	        document.getElementById(procFindSideId).value = document.getElementById('<%= ProcSide_1.ClientID %>').value;
	        //document.getElementById(procFindSiteId).value = 'Thyroid';
	        //document.getElementById(procFindExtId).value = document.getElementById('<%= ProcFindExtension_1.ClientID %>').value;
	        //document.getElementById(procFindStatusId).value = document.getElementById('<%= ProcFindStatus_1.ClientID %>').value;
	    }
	    else
	    {
	        document.getElementById(procFindSideId).value = '';
	    }
	}
	//End of ProcFind Details
	
	function updateProcDetails()
	{
	    //updates proc auto details and Path SpecimenType
	    document.getElementById('<%= ProcPrimary_1.ClientID %>').value='1';
	    document.getElementById('<%= ProcInstitution_1.ClientID %>').value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById('<%= ProcService_1.ClientID %>').value='Head and Neck';
	    document.getElementById('<%= ProcSite_1.ClientID %>').value='Thyroid';
	    document.getElementById('<%= ProcQuality_1.ClientID %>').value='STD';
	    document.getElementById('<%= PathSpecimenType.ClientID %>').value = document.getElementById('<%= ProcName_1.ClientID %>').value;
	}
	
	tableArray.CentralNeckDissectionHtmlTable = "CentralNeckDissectionHtmlTable";
	
	function CentralRadioClick(Cenoption_value,Cendiv_id, CendateTextFieldId, Cendate, CendateFieldId, Cendatevalue, CentableId, Cenvalue1, CenfieldId, Cenvalue2, CenfieldValue, Cenvalue3, CenreasonId, Cenvalue4, CenQltyId, Cenvalue5)
    {
      var CenhideDiv = document.getElementById(Cendiv_id);
      if (Cenoption_value == "Yes")
      {
        CenhideDiv.style.display='block';
        
        document.getElementById('<%= ProcDateText_2.ClientID %>').value=document.getElementById('<%= ProcDateText_1.ClientID %>').value;
        document.getElementById('<%= ProcDate_2.ClientID %>').value=document.getElementById('<%= ProcDate_1.ClientID %>').value;
        document.getElementById('<%= ProcName_2.ClientID %>').value='Central Neck Dissection';
        document.getElementById('<%= ProcSurgeon_2.ClientID %>').value = document.getElementById('<%= ProcSurgeon_1.ClientID %>').value;
        document.getElementById('<%= ProcInstitution_2.ClientID %>').value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById('<%= ProcService_2.ClientID %>').value='Head and Neck';
	    document.getElementById('<%= ProcSite_2.ClientID %>').value='Thyroid';
	    document.getElementById('<%= ProcQuality_2.ClientID %>').value='STD';
        
        //clears absent row data
        clearElementsInParentRow(document.getElementById('CentralNeckDissectionAbsentRow'));      
      } 
      else if (Cenoption_value == "No")
      {        
        CenhideDiv.style.display='none';
        document.getElementById('<%= AbsentDateText_1.ClientID %>').value=document.getElementById('<%= ProcDateText_1.ClientID %>').value;
        document.getElementById('<%= AbsentDate_1.ClientID %>').value=document.getElementById('<%= ProcDate_1.ClientID %>').value;        
        
        //clears first row data
        clearElementsInParentRow(document.getElementById('CentralNeckDissectionHtmlRow1'));       
        var SubSite2_RB = document.getElementById('<%= ProcSubsite_2.ClientID %>');
        var SubSite2_radio = SubSite2_RB.getElementsByTagName("input"); 
        for (var i=0;i<SubSite2_radio.length;i++) 
        { 
           if(SubSite2_radio[i].checked)
           {
                SubSite2_radio[i].checked = false;
           }
        }       
        //clears second row data
        clearElementsInParentRow(document.getElementById('CentralNeckDissectionHtmlRow2'));
        var SubSite3_RB = document.getElementById('<%= ProcSubsite_3.ClientID %>');
        var SubSite3_radio = SubSite3_RB.getElementsByTagName("input"); 
        for (var i=0;i<SubSite3_radio.length;i++) 
        { 
           if(SubSite3_radio[i].checked)
           {
                SubSite3_radio[i].checked = false;
           }
        }
        
        document.getElementById(CendateTextFieldId).value = Cendate;
        document.getElementById(CendateFieldId).value = Cendatevalue;
        document.getElementById(CentableId).value = Cenvalue1;        
        document.getElementById(CenfieldId).value = Cenvalue2;
        document.getElementById(CenfieldValue).value = Cenvalue3;
        document.getElementById(CenreasonId).value = Cenvalue4;
        document.getElementById(CenQltyId).value = Cenvalue5;
      }
    }
    
    function updateCenProcDetails()
    {
        document.getElementById('<%= ProcName_3.ClientID %>').value='Central Neck Dissection';
        document.getElementById('<%= ProcSurgeon_3.ClientID %>').value = document.getElementById('<%= ProcSurgeon_1.ClientID %>').value;
        document.getElementById('<%= ProcInstitution_3.ClientID %>').value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById('<%= ProcService_3.ClientID %>').value='Head and Neck';
	    document.getElementById('<%= ProcSite_3.ClientID %>').value='Thyroid';
	    document.getElementById('<%= ProcQuality_3.ClientID %>').value='STD';
    }
	
	tableArray.LateralNeckDissectionHtmlTable = "LateralNeckDissectionHtmlTable";
	
	function LateralRadioClick(Latoption_value,Latdiv_id, LatdateTextFieldId, Latdate, LatdateFieldId, Latdatevalue, LattableId, Latvalue1, LatfieldId, Latvalue2, LatfieldValue, Latvalue3, LatreasonId, Latvalue4,LatQltyId, Latvalue5)
    {
      var LathideDiv = document.getElementById(Latdiv_id);
      if (Latoption_value == "Yes")
      {
        LathideDiv.style.display='block';
        
        document.getElementById('<%= ProcDateText_4.ClientID %>').value=document.getElementById('<%= ProcDateText_1.ClientID %>').value;
        document.getElementById('<%= ProcDate_4.ClientID %>').value=document.getElementById('<%= ProcDate_1.ClientID %>').value;
        document.getElementById('<%= ProcName_4.ClientID %>').value='Lateral Neck Dissection';
        document.getElementById('<%= ProcSurgeon_4.ClientID %>').value = document.getElementById('<%= ProcSurgeon_1.ClientID %>').value;
        document.getElementById('<%= ProcInstitution_4.ClientID %>').value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById('<%= ProcService_4.ClientID %>').value='Head and Neck';
	    document.getElementById('<%= ProcSite_4.ClientID %>').value='Thyroid';
	    document.getElementById('<%= ProcQuality_4.ClientID %>').value='STD';

	   
        var DtTest5 = document.getElementById('<%= ProcDateText_5.ClientID %>').value;
        var Side5 = document.getElementById('<%= ProcSide_5.ClientID %>').value;        
        if (DtTest5 != "" || Side5 != "")
        {
            document.getElementById('LateralNeckDissectionHtmlRow2').style.display='block';
        }
        
        //clears absent row data
        clearElementsInParentRow(document.getElementById('LateralNeckDissectionAbsentRow'));
      } 
      else if (Latoption_value == "No")
      {
        LathideDiv.style.display='none';
        document.getElementById('<%= AbsentDateText_2.ClientID %>').value=document.getElementById('<%= ProcDateText_1.ClientID %>').value;
        document.getElementById('<%= AbsentDate_2.ClientID %>').value=document.getElementById('<%= ProcDate_1.ClientID %>').value;
        
        //clears data in rows
        clearElementsInParentRow(document.getElementById('LateralNeckDissectionHtmlRow1'));
        clearChkLists(document.getElementById('<%= Level_ProcSubsite_4.ClientID %>'));
        clearElementsInParentRow(document.getElementById('LateralNeckDissectionHtmlRow2'));
        clearChkLists(document.getElementById('<%= Level_ProcSubsite_5.ClientID %>'));  
        
        document.getElementById(LatdateTextFieldId).value = Latdate;
        document.getElementById(LatdateFieldId).value = Latdatevalue;
        document.getElementById(LattableId).value = Latvalue1;        
        document.getElementById(LatfieldId).value = Latvalue2;
        document.getElementById(LatfieldValue).value = Latvalue3;
        document.getElementById(LatreasonId).value = Latvalue4;
        document.getElementById(LatQltyId).value = Latvalue5;
      }
    }
    
    function updateLatProcDetails()
    {
        document.getElementById('<%= ProcName_5.ClientID %>').value='Lateral Neck Dissection';
        document.getElementById('<%= ProcSurgeon_5.ClientID %>').value = document.getElementById('<%= ProcSurgeon_1.ClientID %>').value;
        document.getElementById('<%= ProcInstitution_5.ClientID %>').value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById('<%= ProcService_5.ClientID %>').value='Head and Neck';
	    document.getElementById('<%= ProcSite_5.ClientID %>').value='Thyroid';
	    document.getElementById('<%= ProcQuality_5.ClientID %>').value = 'STD';
	   
    }

    //Set Level of Lateral Neck Dissection
    function SetLateralLevelToSubsite() {
        var temp = '';
        temp = RetrieveCheckBoxListSelectedValues(document.getElementById('<%= Level_ProcSubsite_4.ClientID %>'), "TABLE");
        if (temp != '') {
            document.getElementById('<%= ProcSubsite_4.ClientID %>').value = "Level " + temp;
        }
        else {
            document.getElementById('<%= ProcSubsite_4.ClientID %>').value = "";
        }

        //if (document.getElementById('LateralNeckDissectionHtmlRow2').style.display == 'block') {
            temp = RetrieveCheckBoxListSelectedValues(document.getElementById('<%= Level_ProcSubsite_5.ClientID %>'), "TABLE");
            if (temp != '') {
                document.getElementById('<%= ProcSubsite_5.ClientID %>').value = "Level " + temp;
            }
            else {
                document.getElementById('<%= ProcSubsite_5.ClientID %>').value = "";
            } 
        //}
    }


    //clears checkboxlists
    function clearChkLists(SubSite_CB)
    {
        var SubSite_check = SubSite_CB.getElementsByTagName("input"); 
        for (var i=0;i<SubSite_check.length;i++) 
        { 
            if(SubSite_check[i].checked)
            {
                SubSite_check[i].checked = false;
            }
        }
    }
    
    tableArray.RandomLymphNodeSamplingHtmlTable = "RandomLymphNodeSamplingHtmlTable";
	
	function RandomRadioClick(Rdmoption_value,Rdmdiv_id, RdmdateTextFieldId, Rdmdate, RdmdateFieldId, Rdmdatevalue, RdmtableId, Rdmvalue1, RdmfieldId, Rdmvalue2, RdmfieldValue, Rdmvalue3, RdmreasonId, Rdmvalue4,RdmQltyId, Rdmvalue5)
    {
      var RdmhideDiv = document.getElementById(Rdmdiv_id);
      if (Rdmoption_value == "Yes")
      {
        RdmhideDiv.style.display='block';
        
        document.getElementById('<%= ProcDateText_6.ClientID %>').value=document.getElementById('<%= ProcDateText_1.ClientID %>').value;
        document.getElementById('<%= ProcDate_6.ClientID %>').value=document.getElementById('<%= ProcDate_1.ClientID %>').value;
        document.getElementById('<%= ProcName_6.ClientID %>').value='Random Lymph Node Sampling';
        document.getElementById('<%= ProcSurgeon_6.ClientID %>').value = document.getElementById('<%= ProcSurgeon_1.ClientID %>').value;
        document.getElementById('<%= ProcInstitution_6.ClientID %>').value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById('<%= ProcService_6.ClientID %>').value='Head and Neck';
	    document.getElementById('<%= ProcSite_6.ClientID %>').value='Thyroid';
	    document.getElementById('<%= ProcQuality_6.ClientID %>').value='STD';
        
        var DtTest7 = document.getElementById('<%= ProcDateText_7.ClientID %>').value;
        var Side7 = document.getElementById('<%= ProcSide_7.ClientID %>').value;        
        if (DtTest7 != "" || Side7 != "")
        {
            document.getElementById('RandomLymphNodeSamplingHtmlRow2').style.display='block';
        }
                
        //clears absent row data
        clearElementsInParentRow(document.getElementById('RandomLymphNodeSamplingAbsentRow')); 
      } 
      else if (Rdmoption_value == "No")
      {
        RdmhideDiv.style.display='none';
        document.getElementById('<%= AbsentDateText_3.ClientID %>').value=document.getElementById('<%= ProcDateText_1.ClientID %>').value;
        document.getElementById('<%= AbsentDate_3.ClientID %>').value=document.getElementById('<%= ProcDate_1.ClientID %>').value;
        
        //clears data in rows
        clearElementsInParentRow(document.getElementById('RandomLymphNodeSamplingHtmlRow1'));
        clearChkLists(document.getElementById('<%= Level_ProcSubsite_6.ClientID %>'));
        clearElementsInParentRow(document.getElementById('RandomLymphNodeSamplingHtmlRow2'));
        clearChkLists(document.getElementById('<%= Level_ProcSubsite_7.ClientID %>'));
        
        document.getElementById(RdmdateTextFieldId).value = Rdmdate;
        document.getElementById(RdmdateFieldId).value = Rdmdatevalue;
        document.getElementById(RdmtableId).value = Rdmvalue1;        
        document.getElementById(RdmfieldId).value = Rdmvalue2;
        document.getElementById(RdmfieldValue).value = Rdmvalue3;
        document.getElementById(RdmreasonId).value = Rdmvalue4;
        document.getElementById(RdmQltyId).value = Rdmvalue5;
      }
    }
    
    function updateRanProcDetails()
    {
        document.getElementById('<%= ProcName_7.ClientID %>').value='Random Lymph Node Sampling';
        document.getElementById('<%= ProcSurgeon_7.ClientID %>').value = document.getElementById('<%= ProcSurgeon_1.ClientID %>').value;
        document.getElementById('<%= ProcInstitution_7.ClientID %>').value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById('<%= ProcService_7.ClientID %>').value='Head and Neck';
	    document.getElementById('<%= ProcSite_7.ClientID %>').value='Thyroid';
	    document.getElementById('<%= ProcQuality_7.ClientID %>').value = 'STD';
	}

	//set Level of Random Lymph Node Sampling
	function SetRandomLymphNodeLevelToSubsite() {
	    var temp = '';
	    temp = RetrieveCheckBoxListSelectedValues(document.getElementById('<%= Level_ProcSubsite_6.ClientID %>'), "TABLE");
	    if (temp != '') {
	        document.getElementById('<%= ProcSubsite_6.ClientID %>').value = "Level " + temp;
	    }
	    else {
	        document.getElementById('<%= ProcSubsite_6.ClientID %>').value = "";
	    }

	   // if (document.getElementById('RandomLymphNodeSamplingHtmlRow2').style.display == 'block') {
	        temp = RetrieveCheckBoxListSelectedValues(document.getElementById('<%= Level_ProcSubsite_7.ClientID %>'), "TABLE");
	        if (temp != '') {
	            document.getElementById('<%= ProcSubsite_7.ClientID %>').value = "Level " + temp;
	        }
	        else {
	            document.getElementById('<%= ProcSubsite_7.ClientID %>').value = "";
	        }
        //}
	}

</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
<script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>

<a name="ThyroidPrimaryProcedure" /><span class="controlBoxTitle">Primary Procedure</span><br/>
<table  width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable" > 
    
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Case Surgeon</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Procedure</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
  </tr>    

  <tr> 
    <td><euc:EformTextBox  Width="100px" RecordId="1"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_1" Runat="server" ShowCalendar="true" CalcDate="true"  AppendToOnChange="UpdateAssociatedDate(this); updateDates();" />
	<euc:EformHidden  RecordId="1"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_1"     Runat="server"/>
	<euc:EformTextBox id="ProcPrimary_1" RecordId="1" Table="Procedures" Field="ProcPrimary" runat="server" Width="1px" style="display:none"/>
	<euc:EformTextBox id="ProcInstitution_1" RecordId="1" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
	<euc:EformTextBox id="ProcService_1" RecordId="1" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
	<euc:EformTextBox id="ProcSite_1" RecordId="1" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
	<euc:EformTextBox id="ProcQuality_1" RecordId="1" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
	
	<euc:EformTextBox RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_1" Runat="server" style="display:none;width:1px;"/>
	<euc:EformHidden  RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_1" Runat="server" />
	<euc:EformTextBox id="OpQuality_1" RecordId="1" Table="OperatingRoomDetails" Field="OpQuality" runat="server" Width="1px" style="display:none"/>
	
	<euc:EformTextBox RecordId="1" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText" Runat="server" Width="1px" style="display:none" />
	<euc:EformHidden  RecordId="1" TABLE="Pathology" FIELD="PathDate" ID="PathDate" Runat="server" />
	<euc:EformTextBox id="PathInstitution" RecordId="1" Table="Pathology" Field="PathInstitution" runat="server" Width="1px" style="display:none"/>	
	<euc:EformTextBox id="PathSite" RecordId="1" Table="Pathology" Field="PathSite" runat="server" Width="1px" style="display:none"/>
	<euc:EformTextBox id="PathQuality" RecordId="1" Table="Pathology" Field="PathQuality" runat="server" Width="1px" style="display:none"/>
	</td>
  
  <td><euc:EformComboBox LookupCode="OpSurgeon" DropDownWidth="280" id="ProcSurgeon_1" RecordId="1" Table="Procedures" Field="ProcSurgeon" runat="server" onblur="updateOpSurgeon();" />
  <euc:EformTextBox id="OpCaseSurgeon_1" RecordId="1" Table="OperatingRoomDetails" Field="OpCaseSurgeon" runat="server" Width="1px" style="display:none"/>  
  </td>
  <td align="center"><euc:EformDropDownList Width="150px" RecordId="1"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_1" LookupCode="ThyroidPrimProc" Runat="server" onblur="updateProcDetails();" />
  <euc:EformTextBox  TABLE="Pathology" RecordId="1" FIELD="PathSpecimenType" ID="PathSpecimenType" Runat="server" Width="1px" style="display:none"/>
  </td> 
  <td align="center"><euc:EformDropDownList Width="100px" RecordId="1"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_1" LookupCode="NodeSide" Runat="server" /> </td>
  </tr>
</table><br />
  
<span class="controlBoxTitle">Procedure Findings</span><br/>
<table  width="500" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="ProcFindingsHtmlTable" >     
  <tr>  
    <td style="padding-top: 10px; text-align:left;"><strong>Structures Involved</strong></td>
    <td style="padding-top: 10px; text-align:center;"><strong>Extra Thyroid Extension</strong></td>
    <td style="padding-top: 10px; text-align:center;"><strong>Residual Disease</strong></td>
  </tr>
  
  <tr >
    <td align="left">
        <euc:EformHidden TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_1" RecordID="1"  Runat="server" 
            Value="Fibroadipose Tissue" >Fibroadipose Tissue</euc:EformHidden>
    </td>
    <td align="center">
        <euc:EformTextBox ID="ProcFindSide_1" Runat="server" RecordId='1' TABLE="ProcedureFinding" FIELD="ProcFindSide" Width="1px" 
            style="display:none;" />
        <euc:EformHidden ID="ProcFindSite_1" Runat="server" RecordId='1' TABLE="ProcedureFinding" FIELD="ProcFindSite" Value="Neck"/>
        <euc:EformCheckBox ID="ProcFindExtension_1" runat="server" RecordId='1' Table="ProcedureFinding" Field="ProcFindExtension" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_1,ProcFindSite_1"/>
    </td>
    <td align="center">
        <euc:EformCheckBox ID="ProcFindStatus_1" Runat="server" RecordId='1' TABLE="ProcedureFinding" FIELD="ProcFindStatus" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_1,ProcFindSite_1"/>
    </td>
   </tr>
   
   <tr >
    <td align="left">
        <euc:EformHidden TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_2" RecordID="2"  Runat="server" 
            Value="Strap Muscles">Strap Muscles</euc:EformHidden>
    </td>
    <td align="center">    
        <euc:EformTextBox ID="ProcFindSide_2" Runat="server" RecordId='2' TABLE="ProcedureFinding" FIELD="ProcFindSide" Width="1px" style="display:none;"/>
        <euc:EformHidden ID="ProcFindSite_2" Runat="server" RecordId='2' TABLE="ProcedureFinding" FIELD="ProcFindSite" Value="Neck"/>
        <euc:EformCheckBox ID="ProcFindExtension_2" runat="server" RecordId='2' Table="ProcedureFinding" Field="ProcFindExtension" Value="Yes"                   EnableHiddenOnUIEvent="ProcFindDiseaseExtent_2,ProcFindSite_2"/>
    </td>
    <td align="center">
        <euc:EformCheckBox ID="ProcFindStatus_2" Runat="server" RecordId='2' TABLE="ProcedureFinding" FIELD="ProcFindStatus" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_2,ProcFindSite_2"/>
    </td>
   </tr>
   
  <tr >
    <td align="left">
        <euc:EformHidden TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_3" RecordID="3"  Runat="server" 
            Value="Recurrent Laryngeal Nerve" >Recurrent Laryngeal Nerve</euc:EformHidden>
    </td>
    <td align="center">    
        <euc:EformTextBox ID="ProcFindSide_3" Runat="server" RecordId='3' TABLE="ProcedureFinding" FIELD="ProcFindSide" Width="1px" style="display:none;"/>
        <euc:EformHidden ID="ProcFindSite_3" Runat="server" RecordId='3' TABLE="ProcedureFinding" FIELD="ProcFindSite" Value="Neck"/>
        <euc:EformCheckBox ID="ProcFindExtension_3" runat="server" RecordId='3' Table="ProcedureFinding" Field="ProcFindExtension" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_3,ProcFindSite_3"/>
     </td>
    <td align="center">
        <euc:EformCheckBox ID="ProcFindStatus_3" Runat="server" RecordId='3' TABLE="ProcedureFinding" FIELD="ProcFindStatus" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_3,ProcFindSite_3"/>
    </td>
   </tr>
   
   <tr >
    <td align="left">
        <euc:EformHidden TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_4" RecordID="4"  Runat="server" 
            Value="Larynx">Larynx</euc:EformHidden>
    </td>
    <td align="center">    
        <euc:EformTextBox ID="ProcFindSide_4" Runat="server" RecordId='4' TABLE="ProcedureFinding" FIELD="ProcFindSide" Width="1px" style="display:none;"/>
        <euc:EformHidden ID="ProcFindSite_4" Runat="server" RecordId='4' TABLE="ProcedureFinding" FIELD="ProcFindSite" Value="Neck"/>
        <euc:EformCheckBox ID="ProcFindExtension_4" runat="server" RecordId='4' Table="ProcedureFinding" Field="ProcFindExtension" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_4,ProcFindSite_4"/>
    </td>
    <td align="center">
        <euc:EformCheckBox ID="ProcFindStatus_4" Runat="server" RecordId='4' TABLE="ProcedureFinding" FIELD="ProcFindStatus" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_4,ProcFindSite_4"/>
    </td>
   </tr>
   
   <tr >
    <td align="left">
        <euc:EformHidden TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_5" RecordID="5"  Runat="server" 
            Value="Trachea">Trachea</euc:EformHidden>
    </td>
    <td align="center">    
        <euc:EformTextBox ID="ProcFindSide_5" Runat="server" RecordId='5' TABLE="ProcedureFinding" FIELD="ProcFindSide" Width="1px" style="display:none;"/>
        <euc:EformHidden ID="ProcFindSite_5" Runat="server" RecordId='5' TABLE="ProcedureFinding" FIELD="ProcFindSite" Value="Neck"/>
        <euc:EformCheckBox ID="ProcFindExtension_5" runat="server" RecordId='5' Table="ProcedureFinding" Field="ProcFindExtension" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_5,ProcFindSite_5"/>
    </td>
    <td align="center">
        <euc:EformCheckBox ID="ProcFindStatus_5" Runat="server" RecordId='5' TABLE="ProcedureFinding" FIELD="ProcFindStatus" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_5,ProcFindSite_5"/>
    </td>
   </tr>
   
   <tr >
    <td align="left">
        <euc:EformHidden TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_6" RecordID="6"  Runat="server" 
            Value="Oesphagus">Oesphagus</euc:EformHidden>
    </td>
    <td align="center">    
        <euc:EformTextBox ID="ProcFindSide_6" Runat="server" RecordId='6' TABLE="ProcedureFinding" FIELD="ProcFindSide" Width="1px" style="display:none;"/>
        <euc:EformHidden ID="ProcFindSite_6" Runat="server" RecordId='6' TABLE="ProcedureFinding" FIELD="ProcFindSite" Value="Neck"/>
        <euc:EformCheckBox ID="ProcFindExtension_6" runat="server" RecordId='6' Table="ProcedureFinding" Field="ProcFindExtension" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_6,ProcFindSite_6"/>
    </td>
    <td align="center">
        <euc:EformCheckBox ID="ProcFindStatus_6" Runat="server" RecordId='6' TABLE="ProcedureFinding" FIELD="ProcFindStatus" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_6,ProcFindSite_6"/>
    </td>
   </tr>
   
   <tr >
    <td align="left">
        <euc:EformHidden TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_7" RecordID="7"  Runat="server" 
            Value="Carotid Artery">Carotid Artery</euc:EformHidden>
    </td>
    <td align="center">    
        <euc:EformTextBox ID="ProcFindSide_7" Runat="server" RecordId='7' TABLE="ProcedureFinding" FIELD="ProcFindSide" Width="1px" style="display:none;"/>
        <euc:EformHidden ID="ProcFindSite_7" Runat="server" RecordId='7' TABLE="ProcedureFinding" FIELD="ProcFindSite" Value="Neck"/>
        <euc:EformCheckBox ID="ProcFindExtension_7" runat="server" RecordId='7' Table="ProcedureFinding" Field="ProcFindExtension" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_7,ProcFindSite_7"/>
    </td>
    <td align="center">
        <euc:EformCheckBox ID="ProcFindStatus_7" Runat="server" RecordId='7' TABLE="ProcedureFinding" FIELD="ProcFindStatus" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_7,ProcFindSite_7"/>
    </td>
   </tr>
   
   <tr >
    <td align="left">
        <euc:EformHidden TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_8" RecordID="8"  Runat="server" 
            Value="Internal Jugular Vein">Internal Jugular Vein</euc:EformHidden>
    </td>
    <td align="center">    
        <euc:EformTextBox ID="ProcFindSide_8" Runat="server" RecordId='8' TABLE="ProcedureFinding" FIELD="ProcFindSide" Width="1px" style="display:none;"/>
        <euc:EformHidden ID="ProcFindSite_8" Runat="server" RecordId='8' TABLE="ProcedureFinding" FIELD="ProcFindSite" Value="Neck"/>
        <euc:EformCheckBox ID="ProcFindExtension_8" runat="server" RecordId='8' Table="ProcedureFinding" Field="ProcFindExtension" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_8,ProcFindSite_8"/>
    </td>
    <td align="center">
        <euc:EformCheckBox ID="ProcFindStatus_8" Runat="server" RecordId='8' TABLE="ProcedureFinding" FIELD="ProcFindStatus" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_8,ProcFindSite_8"/>
    </td>    
   </tr>
   
   <tr >
    <td align="left">
        <euc:EformHidden TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_9" RecordID="9"  Runat="server" 
            Value="Unknown">Unknown</euc:EformHidden>
    </td>
    <td align="center">  
        <euc:EformTextBox ID="ProcFindSide_9" Runat="server" RecordId='9' TABLE="ProcedureFinding" FIELD="ProcFindSide" Width="1px" style="display:none;"/>
        <euc:EformHidden ID="ProcFindSite_9" Runat="server" RecordId='9' TABLE="ProcedureFinding" FIELD="ProcFindSite" Value="Neck"/>
        <euc:EformCheckBox ID="ProcFindExtension_9" runat="server" RecordId='9' Table="ProcedureFinding" Field="ProcFindExtension" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_9,ProcFindSite_9"/>
    </td>
    <td align="center">  
        <euc:EformCheckBox ID="ProcFindStatus_9" Runat="server" RecordId='9' TABLE="ProcedureFinding" FIELD="ProcFindStatus" Value="Yes" 
            EnableHiddenOnUIEvent="ProcFindDiseaseExtent_9,ProcFindSite_9"/>
    </td>
   </tr>
</table><br />

<a name="CentralNeckDissection" />
<table>
    <tr>
        <td>
            <span class="controlBoxTitle">Central Neck Dissection Done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="CentralDissectDone" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="CentralDissectDone">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>
<div id="CentralDissectDiv" runat="server" style="display: none;">
    <table width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="CentralNeckDissectionHtmlTable">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">SubSite</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
        </tr>
        <tr id="CentralNeckDissectionHtmlRow1">
            <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Width="100px" RecordId="2" Table="Procedures" Field="ProcDateText" ID="ProcDateText_2" runat="server"  
                    ShowCalendar="true" CalcDate="true" />
                <euc:EformHidden RecordId="2" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_2" Runat="server" />
                <euc:EformTextBox RecordId="2" TABLE="Procedures" FIELD="ProcName" ID="ProcName_2" Runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcSurgeon_2" RecordId="2" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcInstitution_2" RecordId="2" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcService_2" RecordId="2" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcSite_2" RecordId="2" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcQuality_2" RecordId="2" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
            </td>
            <td align="center">
                <euc:EformDropDownList Width="100px" RecordId="2" Table="Procedures" Field="ProcSide"
                    ID="ProcSide_2" LookupCode="NodeSide" runat="server" />
            </td>
            <td align="center">
              <euc:EformRadioButtonList RecordId="2" Table="Procedures" Field="ProcSubsite"
                    ID="ProcSubsite_2" runat="server" RepeatDirection="Horizontal" RepeatLayout="table">
                    <asp:ListItem>Level 6</asp:ListItem>
                    <asp:ListItem>Level 7</asp:ListItem>
                    <asp:ListItem>Level 6 &amp; Level 7</asp:ListItem>
                    <asp:ListItem>Unknown</asp:ListItem>
                </euc:EformRadioButtonList></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" /></td>
        </tr>
        <tr id="CentralNeckDissectionHtmlRow2" style="display: none">
            <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Width="100px" RecordId="3" Table="Procedures" Field="ProcDateText" ID="ProcDateText_3" runat="server"  
                    ShowCalendar="true" CalcDate="true" AppendToOnChange="updateCenProcDetails();" /><euc:EformHidden RecordId="3" TABLE="Procedures"
                        FIELD="ProcDate" ID="ProcDate_3" Runat="server" />
                <euc:EformTextBox RecordId="3" TABLE="Procedures" FIELD="ProcName" ID="ProcName_3" Runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcSurgeon_3" RecordId="3" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcInstitution_3" RecordId="3" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcService_3" RecordId="3" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcSite_3" RecordId="3" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcQuality_3" RecordId="3" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
                </td>
            <td align="center">
                <euc:EformDropDownList Width="100px" RecordId="3" Table="Procedures" Field="ProcSide"
                    ID="ProcSide_3" LookupCode="NodeSide" runat="server" />
            </td>
            <td align="center">
                <euc:EformRadioButtonList RecordId="3" Table="Procedures" Field="ProcSubsite"
                    ID="ProcSubsite_3" runat="server" RepeatDirection="horizontal" RepeatLayout="table">
                    <asp:ListItem>Level 6</asp:ListItem>
                    <asp:ListItem>Level 7</asp:ListItem>
                    <asp:ListItem>Level 6 &amp; Level 7</asp:ListItem>
                    <asp:ListItem>Unknown</asp:ListItem>
                </euc:EformRadioButtonList></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" /></td>
        </tr>
    </table>
<img alt="row" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
    border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'CentralNeckDissectionHtmlTable');" />
</div>
<table>
    <tr id="CentralNeckDissectionAbsentRow">
        <td>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_1"
                Runat="server" Width="1px" Style="display: none;"/>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="TableName" ID="TableName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldName" ID="FieldName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_1"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br />

<a name="LateralNeckDissection" />
<table>
    <tr>
        <td>
            <span class="controlBoxTitle">Lateral Neck Dissection Done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="LateralDissectDone" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="LateralDissectDone">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>
<div id="LateralDissectDiv" runat="server" style="display: none;">
    <table width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="LateralNeckDissectionHtmlTable" onclick="SetLateralLevelToSubsite();">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                &nbsp;Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">
                Side</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" colspan="2">
                SubSite</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">
                &nbsp;</td>
        </tr>
        <tr id="LateralNeckDissectionHtmlRow1">
            <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Width="100px" RecordId="4" Table="Procedures" Field="ProcDateText" ID="ProcDateText_4" runat="server"  
                    ShowCalendar="true" CalcDate="true" />
                <euc:EformHidden RecordId="4" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_4" Runat="server" />
                <euc:EformTextBox RecordId="4" TABLE="Procedures" FIELD="ProcName" ID="ProcName_4" Runat="server" Width="1px" style="display:none;" />
                <euc:EformTextBox id="ProcSurgeon_4" RecordId="4" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcInstitution_4" RecordId="4" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcService_4" RecordId="4" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcSite_4" RecordId="4" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcQuality_4" RecordId="4" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
            </td>
            <td align="center">
                <euc:EformDropDownList Width="100px" RecordId="4" Table="Procedures" Field="ProcSide"
                    ID="ProcSide_4" LookupCode="NodeSide" runat="server" />
            </td>
            <td align="right"><asp:Label ID="chkLbl1" runat="server" Text="Level" /></td>
            <td align="left">
                <euc:EformExtendedCheckBoxList TABLE="NoTable" FIELD="LateralDissecSubsite1" ID="Level_ProcSubsite_4" runat="server" RepeatDirection="Horizontal" RepeatLayout="table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem>Unknown</asp:ListItem>
                </euc:EformExtendedCheckBoxList>
                
                <euc:EformTextBox RecordId="4" Runat="server" ID="ProcSubsite_4" Table="Procedures" Field="ProcSubsite"  Width="1px" style="display:none;"/>
            </td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" /></td>
        </tr>
        <tr id="LateralNeckDissectionHtmlRow2" style="display: none">
            <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Width="100px" RecordId="5" Table="Procedures" Field="ProcDateText" ID="ProcDateText_5" runat="server" 
                     ShowCalendar="true" CalcDate="true" AppendToOnChange="updateLatProcDetails();" />
                <euc:EformHidden RecordId="5" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_5" Runat="server" />
                <euc:EformTextBox RecordId="5" TABLE="Procedures" FIELD="ProcName" ID="ProcName_5" Runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcSurgeon_5" RecordId="5" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcInstitution_5" RecordId="5" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcService_5" RecordId="5" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcSite_5" RecordId="5" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcQuality_5" RecordId="5" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
                    </td>
            <td align="center">
                <euc:EformDropDownList Width="100px" RecordId="5" Table="Procedures" Field="ProcSide"
                    ID="ProcSide_5" LookupCode="NodeSide" runat="server" />
            </td>
            <td align="right"><asp:Label ID="chkLbl2" runat="server" Text="Level" /></td>
            <td align="left">
                <euc:EformExtendedCheckBoxList TABLE="NoTable" FIELD="LateralDissecSubsite2" ID="Level_ProcSubsite_5" runat="server" RepeatDirection="Horizontal" RepeatLayout="table" ShowOther="false" OtherFieldStyle="display:none"  >
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem>Unknown</asp:ListItem>
                </euc:EformExtendedCheckBoxList>
               
                <euc:EformTextBox RecordId="5" Runat="server" ID="ProcSubsite_5" Table="Procedures" Field="ProcSubsite" Width="1px" style="display:none;"/>
            </td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" /></td>
        </tr>
    </table>
    <img alt="row" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
        border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'LateralNeckDissectionHtmlTable');" />
</div>
<table>
    <tr id="LateralNeckDissectionAbsentRow">
        <td>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_2"
                Runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="TableName" ID="TableName_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldName" ID="FieldName_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_2"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br />

<a name="RandomLymphNodeSampling" />
<table>
    <tr>
        <td>
            <span class="controlBoxTitle">Random Lymph Node Sampling Done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="RandomSamplingDone" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="RandomSamplingDone">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>
<div id="RandomSamplingDiv" runat="server" style="display: none;">
    <table width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="RandomLymphNodeSamplingHtmlTable" onclick="SetRandomLymphNodeLevelToSubsite();">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" colspan="2">SubSite</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
        </tr>
        <tr id="RandomLymphNodeSamplingHtmlRow1">
            <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Width="100px" RecordId="6" Table="Procedures" Field="ProcDateText"
                    ID="ProcDateText_6" runat="server" ShowCalendar="true" CalcDate="true" />
                <euc:EformHidden RecordId="6" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_6" Runat="server" />
                <euc:EformTextBox RecordId="6" TABLE="Procedures" FIELD="ProcName" ID="ProcName_6" Runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcSurgeon_6" RecordId="6" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcInstitution_6" RecordId="6" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcService_6" RecordId="6" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcSite_6" RecordId="6" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcQuality_6" RecordId="6" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
            </td>
            <td align="center">
                <euc:EformDropDownList RecordId="6" Table="Procedures" Field="ProcSide" ID="ProcSide_6" LookupCode="NodeSide" runat="server" />
            </td>
            <td align="right"><asp:Label ID="Label1" runat="server" Text="Level" /></td>
            <td align="left"><euc:EformExtendedCheckBoxList TABLE="NoTable" FIELD="RandomLymphNodeSubsite1" ID="Level_ProcSubsite_6" runat="server" RepeatDirection="Horizontal" RepeatLayout="table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
                </euc:EformExtendedCheckBoxList>
                
                <euc:EformTextBox RecordId="6" Runat="server" ID="ProcSubsite_6" Table="Procedures" Field="ProcSubsite" Width="1px" style="display:none;"/>
            </td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" /></td>
        </tr>
        <tr id="RandomLymphNodeSamplingHtmlRow2" style="display: none">
            <td height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Width="100px" RecordId="7" Table="Procedures" Field="ProcDateText"
                    ID="ProcDateText_7" runat="server" ShowCalendar="true" CalcDate="true" AppendToOnChange="updateRanProcDetails();"/>
                <euc:EformHidden RecordId="7" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_7" Runat="server" />
                <euc:EformTextBox RecordId="7" TABLE="Procedures" FIELD="ProcName" ID="ProcName_7" Runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcSurgeon_7" RecordId="7" Table="Procedures" Field="ProcSurgeon" runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcInstitution_7" RecordId="7" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcService_7" RecordId="7" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcSite_7" RecordId="7" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcQuality_7" RecordId="7" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/>
            </td>
            <td align="center">
                <euc:EformDropDownList Width="100px" RecordId="7" Table="Procedures" Field="ProcSide"
                    ID="ProcSide_7" LookupCode="NodeSide" runat="server" />
            </td>
            <td align="right"><asp:Label ID="Label2" runat="server" Text="Level" /></td>
            <td align="left">
                <euc:EformExtendedCheckBoxList TABLE="NoTable" FIELD="RandomLymphNodeSubsite2" ID="Level_ProcSubsite_7" runat="server" RepeatDirection="Horizontal" RepeatLayout="table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                    <asp:ListItem>Unknown</asp:ListItem>
                </euc:EformExtendedCheckBoxList>
                
                <euc:EformTextBox RecordId="7" Runat="server" ID="ProcSubsite_7" Table="Procedures" Field="ProcSubsite" Width="1px" style="display:none;"/>
            </td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" /></td>
        </tr>
    </table>
    <img alt="row" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
        border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'RandomLymphNodeSamplingHtmlTable');" />
</div>
<table>
    <tr id="RandomLymphNodeSamplingAbsentRow">
        <td>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_3"
                Runat="server" Width="1px" Style="display: none;"/>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="TableName" ID="TableName_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldName" ID="FieldName_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_3"
            runat="server" Width="1px" Style="display: none;" />    
        </td>
    </tr>
</table>