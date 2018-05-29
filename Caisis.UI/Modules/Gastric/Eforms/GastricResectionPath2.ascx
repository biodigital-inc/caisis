<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.GastricResectionPath2" CodeFile="GastricResectionPath2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<%-- javascript moved to end of this file - jf --%>

<style type="text/css">
#GastricLapSiteTd td
{
	padding: 0px 10px 0px 0px;
}
.gastricPathTable
{
    border: solid 1px #cccccc; 
    margin: 10px 0px 15px 16px;
    background-color: #efefef;
    width: 90%;

}
.gastricPathTable td
{
    padding: 5px 5px 5px 5px;
}
#resectionDetailsTable
{
    border-bottom: solid 1px #cccccc; 
    margin: 10px 0px 15px 16px;
    width: 100%;
}
#resectionGastricPathTable
{
    border-bottom: solid 1px #cccccc;
    margin-bottom: 15px;
    margin-top: 12px;
}
#resectionGastricPathTable td
{
    padding: 4px 4px 4px 16px;
}
#resectionPathNodeFindingsTable
{
    border-bottom: solid 1px #cccccc;
    margin-bottom: 15px;
    margin-top: 12px;
}
#resectionPathStagesTable
{
    border-bottom: solid 1px #cccccc;
    margin-bottom: 15px;
    margin-top: 12px;
}
#resectionPathStagesTable td
{
    padding: 4px 4px 4px 16px;
}
#resectionPathTestsTable
{
    margin-bottom: 15px;
}
#resectionPathTestsTable td
{

}

</style>


<a name="GastricResectionPath2" id="GastricResectionPath2" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology (Resection)"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;" id="GastricResectionPathYesNoContainer"><strong>Would you like to enter Pathology data for a resection?</strong><euc:EformRadioButtonList Table="NoTable" Field="ResectionPathEntered" id="ResectionPathEntered" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="GastricResectionPathDetails" style="display: none;">
 <td style="padding: 15px 0px 0px 0px; border-top: solid 1px #cccccc;"  >
 

<div id="ResectionPathologyTitleAndForeignKeys" style="text-align: right; width: 650px; margin-bottom: 20px;">
<span class="controlBoxTitle" style="float: left;margin-left: 16px; font-size: 13px;">Pathology Details</span>
<span style="font-size: 11px;"> For previously entered procedure (if applicable):
<euc:EformDropDownList  RecordId="14"  TABLE="Pathology" 
                                FIELD="ProcedureId" Runat="server" ID="ProcedureId_14" 
                                LookupDistinct="Procedures;ProcedureId;COALESCE(ProcDateText,'') + ' : ' + COALESCE(ProcName,'');PatientId = @PatientId;ProcedureId DESC" Width="240px" /> </span><br />
  <span style="font-size: 11px;"> For previously entered surgery (if applicable):
<euc:EformDropDownList  RecordId="14"  TABLE="Pathology" 
                                FIELD="OperatingRoomDetailId" Runat="server" ID="OperatingRoomDetailId_14" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="240px" /></span>
</div>
<span id="ResectPath_NewProcContainer">
<span class="PathHelpText">If a new procedure was entered in the "Resection" section above, Pathology records entered here will be linked to it.</span>
 <table border="0" cellspacing="0" cellpadding="16" width="100%" style="border-bottom: solid 1px #cccccc; margin-bottom: 15px;" > 
      <tr >
       <td style="vertical-align: top;">
       <strong>Path Report Date</strong>&nbsp;&nbsp;
       	 <euc:EformTextBox RecordId="14" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_14" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True"  />
	        <euc:EformHidden  RecordId="14" TABLE="Pathology" FIELD="PathDate" ID="PathDate_14" Runat="server" />	
	        
	            <strong style="margin-left: 50px;">Path Accession #</strong>&nbsp;&nbsp;
	           <euc:EformTextBox RecordId="14" TABLE="Pathology" FIELD="PathNum" ID="PathNum_14" Runat="server" Width="80px" ShowNumberPad="true" />

       </td>
     </tr>
     <%-- 
      <tr><td>
      	   	   <strong>Collection Method</strong>&nbsp;&nbsp;
                <euc:EformRadioButtonList Table="Pathology" Field="PathSpecimenCollection" id="PathSpecimenCollection_14" runat="server" 
	            RepeatLayout="Flow" ShowOther="false" RecordId="14" RepeatDirection="Horizontal" >
		            <asp:ListItem >Cytology</asp:ListItem>
		            <asp:ListItem >Biopsy</asp:ListItem>
		            <asp:ListItem >Brushing</asp:ListItem>
		        </euc:EformRadioButtonList>    
      </td></tr>
      --%>
     <tr >
       <td style="vertical-align: top;">
        <strong>Specimen Type</strong>
	    
	    
	                    <euc:EformRadioButtonList Table="Pathology" Field="PathSpecimenType" id="PathSpecimenType_14" runat="server" 
	            RepeatLayout="Table" ShowOther="true" RecordId="14"  RepeatDirection="Vertical" RepeatColumns="2" >


					<asp:ListItem >Laparoscopic Total Gastrectomy</asp:ListItem>
					<asp:ListItem >Laparoscopic Distal Gastrectomy</asp:ListItem>
					<asp:ListItem >Laparoscopic Proximal Gastrectomy</asp:ListItem>
					<asp:ListItem >Laparoscopic Wedge Resection</asp:ListItem>
					<asp:ListItem >Other/Bypass</asp:ListItem>
					<asp:ListItem >Laparoscopic Esophagogastrectomy Proximal</asp:ListItem>
					<asp:ListItem >Laparoscopic Esophagogastrectomy Total</asp:ListItem>
					<asp:ListItem >Other Resection</asp:ListItem>
					<asp:ListItem >Other surgery/Gastric Cancer</asp:ListItem>
					<asp:ListItem >Distal Gastrectomy</asp:ListItem>
					<asp:ListItem >Proximal Gastrectomy</asp:ListItem>
					<asp:ListItem >Total Gastrectomy</asp:ListItem>
					<asp:ListItem >Esophagogastrectomy Total</asp:ListItem>
					<asp:ListItem >Esophagogastrectomy Proximal</asp:ListItem>
					<asp:ListItem >Robotic Esophagogastrectomy Proximal</asp:ListItem>
					<asp:ListItem >Robotic Esophagogastrectomy Total</asp:ListItem>
					<asp:ListItem >Bypass/Gastrojejunostomy</asp:ListItem>
					<asp:ListItem >Exploratory Laparotomy</asp:ListItem>
					<asp:ListItem >Wedge Resection</asp:ListItem>
					<asp:ListItem >Completion Gastrectomy</asp:ListItem>

<%--
		            <asp:ListItem >Distal Sub Gastrectomy</asp:ListItem>
		            <asp:ListItem >Proximal Sub Gastrectomy</asp:ListItem>
		            <asp:ListItem >Total Gastrectomy</asp:ListItem>
		            <asp:ListItem >Esophago/Proxgastrectomy</asp:ListItem>
		            <asp:ListItem >Esophago/Total Gastrectomy</asp:ListItem>
		            <asp:ListItem >Wedge Resection</asp:ListItem>
		            <asp:ListItem >Exp Lap (+/-) Bx</asp:ListItem>
		            <asp:ListItem >Laparoscopic Dist Gastrectomy</asp:ListItem>
		            <asp:ListItem >Laparoscopic Prox Gastrectomy</asp:ListItem>
		            <asp:ListItem >Laparoscopic Total Gastrectomy</asp:ListItem>
		            <asp:ListItem >Laparoscopic Wedge Resection</asp:ListItem>
		            <asp:ListItem >Laparoscopy w/ LUS</asp:ListItem>
		            <asp:ListItem >Laparoscopy w/ No LUS</asp:ListItem>
		            <asp:ListItem >Other Resection</asp:ListItem>
		            <asp:ListItem >Bypass/Gastrojejunostomy</asp:ListItem>
		            <asp:ListItem >Other Bypass</asp:ListItem>
		            <asp:ListItem >Other Surgery/Gastric Ca</asp:ListItem>
		            <asp:ListItem >EMR (Endomucosal Resection)</asp:ListItem>
--%>        
		        </euc:EformRadioButtonList>
	    
	    
	    </td>
     </tr>
     
          <tr >
       <td style="vertical-align: top;" >


		<strong>Subsite</strong>
	   <euc:EformRadioButtonList Table="Pathology" Field="PathSubsite" id="PathSubsite_14" runat="server" 
	    RepeatLayout="Table" RecordId="14" RepeatDirection="Vertical" RepeatColumns="5">
		    <asp:ListItem >Antrum/Pylorus</asp:ListItem>
			<asp:ListItem >Body/Middle 1/3</asp:ListItem>
		    <asp:ListItem >Diffuse/Whole Stomach</asp:ListItem>
			<asp:ListItem >Proximal/Upper 1/3</asp:ListItem>
			<asp:ListItem >GE Junction</asp:ListItem>
			<asp:ListItem >Fundus/Upper 1/3</asp:ListItem>
			<asp:ListItem >Cardia</asp:ListItem>
			<asp:ListItem >Anastomosis</asp:ListItem>
			<asp:ListItem >Remnant</asp:ListItem>
		</euc:EformRadioButtonList>
     
      </td>
     </tr>
     <tr >
       <td style="vertical-align: top;">

		<strong>Approach</strong>
	   <euc:EformRadioButtonList Table="Procedures" Field="ProcApproach" id="ProcApproach_14" runat="server" 
	    RepeatLayout="Table" RecordId="14" RepeatDirection="Vertical" RepeatColumns="2" LookupCode="OpApproach,Disease,Gastric" >
		</euc:EformRadioButtonList>
     
      </td>
     </tr>
     <tr >
       <td style="vertical-align: top;" >
       <strong>Result</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="14" Table="Pathology" Field="PathResult" id="PathResult_14" runat="server" 
	    style="width: 170px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="BxResult,Disease,Gastric"/>
       </td>
     </tr>
     <tr>
	  	<td >
		<strong>Histology</strong>
	   <euc:EformRadioButtonList Table="Pathology" RecordId="14" Field="PathHistology" id="PathHistology_14" ShowOther="true" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Vertical" LookupCode="PathHistology,Disease,Gastric" RepeatColumns="3" />
		</td>
	  </tr>
	  <tr>
	  	<td >
		<strong>Secondary Histology</strong>
	   <euc:EformRadioButtonList Table="Pathology" RecordId="14" Field="PathHistology2" id="PathHistology2_14" ShowOther="true" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Vertical" LookupCode="PathHistology,Disease,Gastric" RepeatColumns="3" />
		</td>
	  </tr>
	  <tr >
       <td style="vertical-align: top;" onclick="setResectionPathQualityBasedOnInstitution();" onmouseout="setResectionPathQualityBasedOnInstitution();">
	            <strong >Institution</strong>&nbsp;&nbsp;
	  		<euc:EFormComboBox RecordId="14" Table="Pathology" Field="PathInstitution" id="PathInstitution_14" runat="server" 
	    Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True" />
       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;">
       <strong>Pathologist</strong>&nbsp;&nbsp;
       	 <euc:EFormComboBox LookupCode="Pathologist" RecordId="14" TABLE="Pathology" FIELD="Pathologist" ID="Pathologist_14" Runat="server" Width="100" DropDownWidth="400"  />
	        
	            <strong style="margin-left: 50px;">Data Quality</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="14" Table="Pathology" Field="PathQuality" id="PathQuality_14" runat="server" 
	    style="width: 80px;" DropDownWidth="300" DropDownHeight="auto" LookupCode="DataQuality" />
       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;">
       <strong>Pathology Notes</strong><br />
	  		<euc:EFormTextArea RecordId="14" Table="Pathology" Field="PathNotes" id="PathNotes_14" runat="server" Width="90%"  />
       </td>
     </tr>
     </table>
</span>


  <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Gastric Pathology</span>
 <table border="0" cellspacing="0" cellpadding="16" width="100%" id="resectionGastricPathTable" > 
 
     <tr >
       <td>
       <strong>Multifocal Tumor</strong>
       </td>
       <td><euc:EFormSelect TABLE="GastricPath" ParentRecordId="14" RecordId="14" FIELD="PathMultifocal" ID="PathMultifocal_14"  runat="server" 
	    style="width: 70px;" DropDownWidth="70" DropDownHeight="auto" LookupCode="YesNoUnknown"  /></td>
	    
       <td><strong >Lauren</strong></td>
       <td><euc:EFormSelect TABLE="GastricPath" ParentRecordId="14" RecordId="14" FIELD="PathLauren" ID="PathLauren_14"  runat="server" 
	    style="width: 70px;" DropDownWidth="70" DropDownHeight="auto" LookupCode="GastricPathLauren"  /></td>
	    
     </tr>
     <tr>
     <td><strong>WHO Type</strong></td>
     <td><euc:EFormSelect TABLE="GastricPath" ParentRecordId="14" RecordId="14" FIELD="PathWHO_Type" ID="PathWHO_Type_14"  runat="server" 
	    style="width: 70px;" DropDownWidth="70" DropDownHeight="auto" LookupCode="GastricWHO_Type"  /></td>
     <td><strong>Other Type</strong></td>
     <td><euc:EformTextBox TABLE="GastricPath" ParentRecordId="14" RecordId="14" FIELD="PathOtherType" ID="PathOtherType_14"  runat="server" 
	    style="width: 140px;" /></td>
     </tr>
     <tr>
     <td><strong>Secondary WHO Type</strong></td>
     <td><euc:EFormSelect TABLE="GastricPath" ParentRecordId="14" RecordId="14" FIELD="PathWHO_Type2" ID="PathWHO_Type2_14"  runat="server" 
	    style="width: 70px;" DropDownWidth="70" DropDownHeight="auto" LookupCode="GastricWHO_Type"  /></td>
     <td></td>
     <td></td>
     </tr>
     <tr>
     <td><strong>Final Margin Status</strong></td>
     <td><euc:EFormComboBox RecordId="14" TABLE="GastricPath" ParentRecordId="14" FIELD="PathMargin" ID="PathMargin_14" Runat="server" style="width: 150px;" DropDownWidth="350" DropDownHeight="auto" LookupCode="BxResult,Disease,Gastric"  />
     </td>
     <td><strong>Tumor Max Dim</strong></td>
     <td><euc:EformTextBox TABLE="GastricPath" ParentRecordId="14" RecordId="14" FIELD="PathTumorMaxDim" ID="PathTumorMaxDim_14"  runat="server" 
	    style="width: 70px;" /></td>
     </tr>
     <tr>
     <td><strong>Siewert Type</strong></td>
     <td><euc:EformRadioButtonList TABLE="GastricPath" ParentRecordId="14" Field="PathSiewert" id="PathSiewert_14" runat="server" 
	            RepeatLayout="Flow"  RecordId="14"  RepeatDirection="Horizontal" Uncheckable="true"  >
		            <asp:ListItem Value="I" Text="I&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		            <asp:ListItem Value="II" Text="II&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		            <asp:ListItem Value="III" Text="III&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		        </euc:EformRadioButtonList>
     </td>
     <td><strong>Treatment Effect %</strong></td>
     <td><euc:EformTextBox TABLE="GastricPath" ParentRecordId="14" FIELD="PathTreatmentEffect" ID="PathTreatmentEffect_14"  runat="server" 
	    style="width: 70px;"  RecordId="14"  /></td>
     </tr>
     <tr>
     <td><strong>Invasion Depth</strong></td>
     <td><euc:EFormSelect RecordId="14" TABLE="GastricPath" ParentRecordId="14" FIELD="PathInvasionDepth" ID="PathInvasionDepth_14" Runat="server" style="width: 150px;" DropDownWidth="180" DropDownHeight="auto" LookupCode="GastricInvasionDepth" AppendToOnChange="GastricInvasionDepthSet();"  />

     </td>
     <td><strong>Location</strong></td>
     <td><euc:EFormComboBox RecordId="14" TABLE="GastricPath" ParentRecordId="14" FIELD="PathLocation" ID="PathLocation_14" Runat="server" style="width: 120px;" DropDownWidth="120" DropDownHeight="auto" LookupCode="GastricPathLocation"  />
    </td>
     </tr>
     <tr>
     <td><strong>Vascular Invasion</strong></td>
     <td><euc:EFormSelect RecordId="14" TABLE="GastricPath" ParentRecordId="14" FIELD="PathVascularInv" ID="PathVascularInv_14" Runat="server" style="width: 80px;" DropDownWidth="80" DropDownHeight="auto" LookupCode="YesNoUnknown"  />

     </td>
     <td><strong>Perineural Invasion</strong></td>
     <td><euc:EFormSelect RecordId="14" TABLE="GastricPath" ParentRecordId="14" FIELD="PathPerineuralInv" ID="PathPerineuralInv_14" Runat="server" style="width: 80px;" DropDownWidth="80" DropDownHeight="auto" LookupCode="YesNoUnknown"  />
    </td>
     </tr>

</table>

  <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Pathology Node Findings</span>
 <table border="0" cellspacing="0" cellpadding="16" width="100%" id="resectionPathNodeFindingsTable" > 
     <tr >
       <td style="width: 105px;">
       <strong># Positive Nodes</strong>
       </td>
       <td><euc:EformTextBox TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_14"  runat="server" 
	    style="width: 70px;"  RecordId="14" ParentRecordId="14"  ShowNumberPad="true" /></td>
	    
       <td style="width: 115px;">
       <strong># Nodes Removed</strong>
       </td>
       <td><euc:EformTextBox TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_14"  runat="server" 
	    style="width: 70px;"  RecordId="14" ParentRecordId="14"  ShowNumberPad="true" /></td>
	    
     </tr>
</table>     



  <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Pathology Stages (UICC_2010)</span>
 <table border="0" cellspacing="0" width="100%" id="resectionPathStagesTable" > 
     <tr >
       <td style="width: 8%;"><strong>Disease</strong></td>
       <td id="resectionPathStagesYesNoContainer"><euc:EformRadioButtonList Table="NoTable" Field="ResectionPathStageDisease" id="ResectionPathStageDisease" runat="server" 
	     RepeatDirection="Horizontal" style="margin-left: 5px;" >
		    <asp:ListItem Value="Gastric" Text="Gastric&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="GE Junction" Text="GE Junction&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
     </tr>  
     <tr id="resectionPathStagesGastricRow">
       <td colspan="2">


            <strong>Grade</strong>&nbsp;&nbsp;&nbsp;&nbsp;
                    <euc:EFormSelect LookupCode="PathGrade,Disease,Gastric" Table="PathologyStageGrade" Field="PathGrade" id="PathGrade_1" runat="server"  RecordId="1" ParentRecordId="14" />
		        
		        <br /><br />


             <strong>T Stage</strong>&nbsp;&nbsp;
       	     <euc:EFormSelect  RecordId="1" ParentRecordId="14" Table="PathologyStageGrade" Field="PathStageT" id="PathStageT_1" runat="server" 
	        style="width: 40px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="StagePath_Gastric_10_T"  />
           
           <strong style="margin-left: 40px;">N Stage</strong>&nbsp;&nbsp;
       	     <euc:EFormSelect  RecordId="1" ParentRecordId="14" Table="PathologyStageGrade" Field="PathStageN" id="PathStageN_1" runat="server" 
	         style="width: 40px;" DropDownWidth="350" DropDownHeight="auto" LookupCode="StagePath_Gastric_10_N"  />
           
           <strong style="margin-left: 40px;">M Stage</strong>&nbsp;&nbsp;
       	     <euc:EFormSelect  RecordId="1" ParentRecordId="14" Table="PathologyStageGrade" Field="PathStageM" id="PathStageM_1" runat="server" 
	        style="width: 40px;" DropDownWidth="280" DropDownHeight="auto" LookupCode="StagePath_Gastric_10_M"  />
           
           <strong style="margin-left: 40px;">Stage Group</strong>&nbsp;&nbsp;
       	     <euc:EFormComboBox  RecordId="1" ParentRecordId="14" Table="PathologyStageGrade" Field="PathStageGroup" id="PathStageGroup_1" runat="server" 
	        style="width: 40px;" DropDownWidth="280" DropDownHeight="auto" LookupCode="StagePath_Gastric_10_Group"  />
			
			<br /><br />
			
			<strong style="">Data Quality</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="1" ParentRecordId="14" Table="PathologyStageGrade" Field="PathQuality" id="PathQuality_14_1" runat="server" 
	    style="width: 80px;" DropDownWidth="300" DropDownHeight="auto" LookupCode="DataQuality"  />
			
			
       </td>
     </tr>
     <tr id="resectionPathStagesGEJunctionRow">
       <td colspan="2">

                  <strong>Grade</strong>&nbsp;&nbsp;&nbsp;&nbsp;
                    <euc:EFormSelect LookupCode="PathGrade,Disease,Gastric" Table="PathologyStageGrade" Field="PathGrade" id="PathGrade_2" runat="server"  RecordId="2" ParentRecordId="14" />
		        
		        <br /><br />



             <strong>T Stage</strong>&nbsp;&nbsp;
       	     <euc:EFormSelect  RecordId="2" ParentRecordId="14" Table="PathologyStageGrade" Field="PathStageT" id="PathStageT_2" runat="server" 
	        style="width: 40px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="StagePath_GEJunction_10_T"  />
           
           <strong style="margin-left: 40px;">N Stage</strong>&nbsp;&nbsp;
       	     <euc:EFormSelect  RecordId="2" ParentRecordId="14" Table="PathologyStageGrade" Field="PathStageN" id="PathStageN_2" runat="server" 
	         style="width: 40px;" DropDownWidth="350" DropDownHeight="auto" LookupCode="StagePath_GEJunction_10_N"  />
           
           <strong style="margin-left: 40px;">M Stage</strong>&nbsp;&nbsp;
       	     <euc:EFormSelect  RecordId="2" ParentRecordId="14" Table="PathologyStageGrade" Field="PathStageM" id="PathStageM_2" runat="server" 
	        style="width: 40px;" DropDownWidth="280" DropDownHeight="auto" LookupCode="StagePath_GEJunction_10_M"  />
           
           <strong style="margin-left: 40px;">Stage Group</strong>&nbsp;&nbsp;
       	     <euc:EFormComboBox  RecordId="2" ParentRecordId="14" Table="PathologyStageGrade" Field="PathStageGroup" id="PathStageGroup_2" runat="server" 
	        style="width: 40px;" DropDownWidth="280" DropDownHeight="auto" LookupCode="StagePath_GEJunction_10_Group"  />
			
						<br /><br />
			
			<strong style="">Data Quality</strong>&nbsp;&nbsp;
			 <euc:EFormSelect RecordId="2" ParentRecordId="14" Table="PathologyStageGrade" Field="PathQuality" id="PathQuality_14_2" runat="server" 
			style="width: 80px;" DropDownWidth="300" DropDownHeight="auto" LookupCode="DataQuality"  />
       </td>
     </tr>
</table>     


 <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Pathology Tests</span>
 <table border="0" cellspacing="0" cellpadding="16" width="100%" id="resectionPathTestsTable" > 
     <tr >
       <td>

<script type="text/javascript" language="javascript">
	tableArray.PathTestsHtmlTable = "PathTestsHtmlTable";
</script>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PathTestsHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">&nbsp;Date</td>
    <td  class="controlBoxDataGridHeaderFirstCol">Test</td>
    <td  class="controlBoxDataGridHeaderFirstCol">Result</td>
    <td  class="controlBoxDataGridHeaderFirstCol">Units</td>
    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1" ParentRecordId="14"  ID="PathDateText_1" Table="PathTest" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="1" Runat="server" ID="PathDate_1" ParentRecordId="14" Table="PathTest" Field="PathDate" />    </td> 
    <td><euc:EFormComboBox RecordId="1" ParentRecordId="14" LookupCode="PathTest" Table="PathTest" FIELD="PathTest" Runat="server" ID="PathTest_1" style="width: 260px;"  DropDownWidth="260" DropDownHeight="100"  /></td>
    <td >
    <euc:EFormComboBox RecordId="1" ParentRecordId="14" LookupCode="PathTestResult" Table="PathTest" FIELD="PathResult" Runat="server" ID="PathResult_1" style="width: 60px;"  DropDownWidth="120" DropDownHeight="auto"  />
    </td><td>
    <euc:EFormComboBox RecordId="1" ParentRecordId="14" LookupCode="LabUnits" Table="PathTest" FIELD="PathUnits" Runat="server" ID="PathUnits_1"  style="width: 60px;"  DropDownWidth="60" DropDownHeight="auto"   />
    </td>
    <td ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2" ParentRecordId="14"  ID="PathDateText_2" Table="PathTest" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="2" Runat="server" ID="PathDate_2" ParentRecordId="14" Table="PathTest" Field="PathDate" />    </td> 
    <td><euc:EFormComboBox RecordId="2" ParentRecordId="14" LookupCode="PathTest" Table="PathTest" FIELD="PathTest" Runat="server" ID="PathTest_2" style="width: 260px;"  DropDownWidth="260" DropDownHeight="100"  /></td>
    <td >
    <euc:EFormComboBox RecordId="2" ParentRecordId="14" LookupCode="PathTestResult" Table="PathTest" FIELD="PathResult" Runat="server" ID="PathResult_2" style="width: 60px;"  DropDownWidth="120" DropDownHeight="auto"  />
    </td><td>
    <euc:EFormComboBox RecordId="2" ParentRecordId="14" LookupCode="LabUnits" Table="PathTest" FIELD="PathUnits" Runat="server" ID="PathUnits_2"  style="width: 60px;"  DropDownWidth="60" DropDownHeight="auto"   />
    </td>
    <td ><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
    <tr style="display: none;">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3" ParentRecordId="14"  ID="PathDateText_3" Table="PathTest" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="3" Runat="server" ID="PathDate_3" ParentRecordId="14" Table="PathTest" Field="PathDate" />    </td> 
    <td><euc:EFormComboBox RecordId="3" ParentRecordId="14" LookupCode="PathTest" Table="PathTest" FIELD="PathTest" Runat="server" ID="PathTest_3" style="width: 260px;"  DropDownWidth="260" DropDownHeight="100"  /></td>
    <td >
    <euc:EFormComboBox RecordId="3" ParentRecordId="14" LookupCode="PathTestResult" Table="PathTest" FIELD="PathResult" Runat="server" ID="PathResult_3" style="width: 60px;"  DropDownWidth="120" DropDownHeight="auto"  />
    </td><td>
    <euc:EFormComboBox RecordId="3" ParentRecordId="14" LookupCode="LabUnits" Table="PathTest" FIELD="PathUnits" Runat="server" ID="PathUnits_3"  style="width: 60px;"  DropDownWidth="60" DropDownHeight="auto"   />
    </td>
    <td ><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
    <tr style="display: none;">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4" ParentRecordId="14"  ID="PathDateText_4" Table="PathTest" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="4" Runat="server" ID="PathDate_4" ParentRecordId="14" Table="PathTest" Field="PathDate" />    </td> 
    <td><euc:EFormComboBox RecordId="4" ParentRecordId="14" LookupCode="PathTest" Table="PathTest" FIELD="PathTest" Runat="server" ID="PathTest_4" style="width: 260px;"  DropDownWidth="260" DropDownHeight="100"  /></td>
    <td >
    <euc:EFormComboBox RecordId="4" ParentRecordId="14" LookupCode="PathTestResult" Table="PathTest" FIELD="PathResult" Runat="server" ID="PathResult_4" style="width: 60px;"  DropDownWidth="120" DropDownHeight="auto"  />
    </td><td>
    <euc:EFormComboBox RecordId="4" ParentRecordId="14" LookupCode="LabUnits" Table="PathTest" FIELD="PathUnits" Runat="server" ID="PathUnits_4"  style="width: 60px;"  DropDownWidth="60" DropDownHeight="auto"   />
    </td>
    <td ><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathTestsHtmlTable');" />

       </td>
     </tr>
</table>     

     </td>
     </tr>
     </table>
<br/><br/>

<script type="text/javascript">
function GastricResectionPathAttachShowHideScriptsAndSetInitialDisplay()
{
	var yesNoContainer = $('GastricResectionPathYesNoContainer');
	var yesNoRadios = yesNoContainer.getElementsByTagName('input');
	var showOnload = false;
	
	for (var i=0;i<yesNoRadios.length;i++)
	{
		if (yesNoRadios[i].type == 'radio')
		{
			yesNoRadios[i].onclick = function() {showHideGastricResectionPath(this)};
			if (yesNoRadios[i].checked && yesNoRadios[i].value.toString().toUpperCase() == 'YES') showOnload = true;
		}
	}
	
	if (showOnload) GastricResectionPathDetails.style.display = 'block';
	
	
	// set initial view of path stages
	var PathStagesYesNoContainer = $('resectionPathStagesYesNoContainer');
	var PathStagesYesNoRadios = PathStagesYesNoContainer.getElementsByTagName('input');
	var resectionPathStagesGastricRow = document.getElementById('resectionPathStagesGastricRow');
	var resectionPathStagesGEJunctionRow = document.getElementById('resectionPathStagesGEJunctionRow');
	var PathStagesShowOnload = 'Gastric';
	
	for (var j=0;j<PathStagesYesNoRadios.length;j++)
	{
		if (PathStagesYesNoRadios[j].type == 'radio')
		{
			PathStagesYesNoRadios[j].onclick = function() {toggleResectionPathStageDisease(this)};
			if (PathStagesYesNoRadios[j].checked && PathStagesYesNoRadios[j].value.toString().toUpperCase() == 'GE JUNCTION') PathStagesShowOnload = 'GE Junction';
		}
	}
	
	if (PathStagesShowOnload == 'GE Junction')
	{
	    resectionPathStagesGastricRow.style.display = 'none';
	    resectionPathStagesGEJunctionRow.style.display = 'block';
	}
	else
	{
	    resectionPathStagesGastricRow.style.display = 'block';
	    resectionPathStagesGEJunctionRow.style.display = 'none';
	}
	
	
}
GastricResectionPathAttachShowHideScriptsAndSetInitialDisplay();

function showHideGastricResectionPath(theRadio)
{
	var GastricResectionPathDetails = document.getElementById('GastricResectionPathDetails');
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		GastricResectionPathDetails.style.display = 'block';
	}
	else
	{
		GastricResectionPathDetails.style.display = 'none';
		clearAllElementsContainedInNode(GastricResectionPathDetails);
	}
}

function toggleResectionPathStageDisease(theRadio)
{
	var resectionPathStagesGastricRow = document.getElementById('resectionPathStagesGastricRow');
	var resectionPathStagesGEJunctionRow = document.getElementById('resectionPathStagesGEJunctionRow');
	
	if (theRadio.value.toString().toUpperCase() == 'GE JUNCTION')
	{
		resectionPathStagesGEJunctionRow.style.display = 'block';
		resectionPathStagesGastricRow.style.display = 'none';
        clearAllElementsContainedInNode(resectionPathStagesGastricRow);
	}
	else
	{
		resectionPathStagesGEJunctionRow.style.display = 'none';
		resectionPathStagesGastricRow.style.display = 'block';
        clearAllElementsContainedInNode(resectionPathStagesGEJunctionRow);
	}
}


function getSelectedRadioButtonValGastricResection(container)
{
	var selectedVal = '';
	var containerInputs = container.getElementsByTagName('input');
	
	for (var j=0;j<containerInputs.length;j++)
	{
		if (containerInputs[j].type == 'radio' && containerInputs[j].checked == true)
		{
			if (containerInputs[j].value.length > 0)
			{ 
				selectedVal =  containerInputs[j].value;
				break;
			}
		}
		else if (containerInputs[j].type == 'text' && containerInputs[j].value.length > 0)
		{
			selectedVal =  containerInputs[j].value;
		}
	}
	
	return selectedVal;

}


function GastricInvasionDepthSet()
{
    var invasionDepth = $('<% = PathInvasionDepth_14.ClientID %>').value;
    	

	
    switch(invasionDepth)
    {
        case 'Lamina Propria':
            setResectionPathStageDisease('GASTRIC');
            $('<% = PathStageT_1.ClientID %>').value = 'T1a';
            break;
        case 'Mucosa':
            setResectionPathStageDisease('GASTRIC');
            $('<% = PathStageT_1.ClientID %>').value = 'T1a';
            break;
        case 'Submucosa':
            setResectionPathStageDisease('GASTRIC');
            $('<% = PathStageT_1.ClientID %>').value = 'T1b';
            break;
        case 'Muscularis Propria':
            setResectionPathStageDisease('GASTRIC');
            $('<% = PathStageT_1.ClientID %>').value = 'T2';
            break;
        case 'Subserosa':
            setResectionPathStageDisease('GASTRIC');
            $('<% = PathStageT_1.ClientID %>').value = 'T3';
            break;
        case 'Serosa Suspected':
            setResectionPathStageDisease('GASTRIC');
            $('<% = PathStageT_1.ClientID %>').value = '';
            break;
        case 'Serosa Definite':
            setResectionPathStageDisease('GASTRIC');
            break;
            $('<% = PathStageT_1.ClientID %>').value = 'T4a';
        case 'Adventitia':
            setResectionPathStageDisease('GE JUNCTION');
            $('<% = PathStageT_2.ClientID %>').value = 'T3';
            break;
        case 'Neighboring Organ Involved':
            setResectionPathStageDisease('GASTRIC');
            $('<% = PathStageT_1.ClientID %>').value = 'T4b';
            break;
        case 'None':
            setResectionPathStageDisease('GASTRIC');
            $('<% = PathStageT_1.ClientID %>').value = 'T0';
            break;
        case 'Unknown':
            setResectionPathStageDisease('GASTRIC');
            $('<% = PathStageT_1.ClientID %>').value = 'TX';
            break;


        default:
//          gastricDiseaseRadio.checked = false;
//          GEJDiseaseRadio.checked = false;
            break;
    }


}




function setResectionPathStageDisease(disease)
{
    var PathStagesYesNoContainer = $('resectionPathStagesYesNoContainer');
	var PathStagesYesNoRadios = PathStagesYesNoContainer.getElementsByTagName('input');
    var gastricDiseaseRadio;
    var GEJDiseaseRadio;
	
	for (var j=0;j<PathStagesYesNoRadios.length;j++)
	{
		if (PathStagesYesNoRadios[j].type == 'radio')
		{
		    if (PathStagesYesNoRadios[j].value.toString().toUpperCase() == 'GASTRIC')
			{
			    gastricDiseaseRadio = PathStagesYesNoRadios[j];
			}
			if (PathStagesYesNoRadios[j].value.toString().toUpperCase() == 'GE JUNCTION')
			{
			    GEJDiseaseRadio = PathStagesYesNoRadios[j];
			}
		}
	}
	
	if (disease == 'GASTRIC')
	{
        gastricDiseaseRadio.checked = true;
        GEJDiseaseRadio.checked = false;
        
        toggleResectionPathStageDisease(gastricDiseaseRadio);
        
	}
	else if (disease == 'GE JUNCTION')
	{
        gastricDiseaseRadio.checked = false;
        GEJDiseaseRadio.checked = true;
        
        toggleResectionPathStageDisease(GEJDiseaseRadio);
	}
	
}

function setResectionPathQualityBasedOnInstitution()
{
	if ($('<% = PathInstitution_14.ClientID %>').value.length > 0)
	{
	    if ($('<% = PathInstitution_14.ClientID %>').value == 'Memorial Sloan Kettering Cancer Center')
	    {
		    $('<% = PathQuality_14.ClientID %>').value = 'STD';
	    }
	    else
	    {
		    $('<% = PathQuality_14.ClientID %>').value = 'OUT';
	    }
	
	}
}

function setInitialResectionPathDisplay()
{
 //   SetPathLinkToExistingProcedure();

    if (typeof PastGastricResectsCount != 'undefined' && PastGastricResectsCount == 0)
    {
        $('ResectionPathologyTitleAndForeignKeys').style.display = 'none';
    }
    
    
}
setInitialResectionPathDisplay();
</script>