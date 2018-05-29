<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.EncountersSurveysChildPugh" CodeFile="EncountersSurveysChildPugh.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.EncountersSurveysChildPughHtmlTable = "EncountersSurveysChildPughHtmlTable";
	tableArray.EncountersSurveysChildPughHtmlTable = "EncountersSurveysChildPughHtmlTable2";
	

</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
    .PointsTextBox
    {
    	border-width: 0px;
    	background-color: Transparent;
    }
</style>

<a name="EncountersSurveysChildPugh" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Child-PUGH Score"></asp:Label><br/>
<table width="100" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="EncountersSurveysChildPughHtmlTable">
    
    <tr id="Tr1" runat="server"> 
    <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Date</td>
    </tr>
    
    <tr > 
    <td height="28"style="text-align: left; white-space: nowrap;"  class="ClinicalEformGridColumnOne">
                       <euc:EformTextBox  Runat="server" style="width:80px;"  RecordId="1"  TABLE="Surveys" FIELD="SurveyDateText" ID="SurveyDateText_ChildPughScore"   ShowCalendar="True" CalcDate="True" class="InputText" />
                       <euc:EformHidden   Runat="server"                      RecordId="1"  TABLE="Surveys" FIELD="SurveyDate" ID="SurveyDate_ChildPughScore"  />	</td> 
  
  </tr> 
</table>
<br />

<table width="300" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="EncountersSurveysChildPughHtmlTable2">
 
   <tr><td colspan="4"><strong>Check the assessment type.<br />Enter the corresponding result to generate the assessment points.</strong></td></tr> 

  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 40%;">&nbsp;Assessment Type</td>
    <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 25%;">&nbsp;Result</td>
    <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 25%;">&nbsp;Points</td>
    <td height="10%" class="controlBoxDataGridTitleColumn">&nbsp;</td>
   </tr>
 
   <tr > 
     <td style=" white-space: nowrap;" > 
                    <euc:EformCheckbox Runat="server" RecordId="1" ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItem"  ID="SurveyItem_Totalbilirubin" Value="Total bilirubin"  />Total bilirubin</td>
          <td class="ClinicalEformGridColumnOne"><euc:EformTextBox   Runat="server" style="width:65px;" RecordId="1"  ParentRecordId="1" TABLE="SurveyItems" FIELD="SurveyItemResult"  ID="SurveyItemResult_Totalbilirubin" /></td>
        <td class="ClinicalEformGridColumnOne"><euc:EformTextBox ReadOnly="true"   Runat="server" style="width:65px;" RecordId="1"  ParentRecordId="1" TABLE="SurveyItems" FIELD="SurveyItemTotal"  ID="SurveyItemTotal_Totalbilirubin" CssClass="PointsTextBox" /></td>
        <td class="ClinicalEformGridColumnOne"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
   <tr > 
      <td style=" white-space: nowrap;">              <euc:EformCheckbox Runat="server" RecordId="2" ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItem"  ID="SurveyItem_Albumin" Value="Albumin"  />Albumin</td>
          <td class="ClinicalEformGridColumnOne"><euc:EformTextBox   Runat="server" style="width:65px;" RecordId="2"  ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItemResult"  ID="SurveyItemResult_Albumin"/></td>
        <td class="ClinicalEformGridColumnOne"><euc:EformTextBox ReadOnly="true"  Runat="server" style="width:65px;" RecordId="2"  ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItemTotal"  ID="SurveyItemTotal_Albumin" CssClass="PointsTextBox"/></td>
        <td class="ClinicalEformGridColumnOne"><euc:EformDeleteIcon  runat="server"/></td>  </tr>
   <tr > 
      <td style="white-space: nowrap;">              <euc:EformCheckbox Runat="server" RecordId="3" ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItem"  ID="SurveyItem_INR" Value="INR"  />INR</td>
          <td class="ClinicalEformGridColumnOne"><euc:EformTextBox   Runat="server" style="width:65px;" RecordId="3"  ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItemResult"  ID="SurveyItemResult_INR"/></td>
        <td class="ClinicalEformGridColumnOne"><euc:EformTextBox  ReadOnly="true" Runat="server" style="width:65px;" RecordId="3"  ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItemTotal"  ID="SurveyItemTotal_INR" CssClass="PointsTextBox"/></td>
        <td class="ClinicalEformGridColumnOne"><euc:EformDeleteIcon runat="server"/></td>  </tr>  
   <tr > 
      <td style="white-space: nowrap;">              <euc:EformCheckbox Runat="server" RecordId="4" ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItem"  ID="SurveyItem_Encephalopathy" Value="Encephalopathy"  />Encephalopathy</td>
          <td class="ClinicalEformGridColumnOne"><euc:EformDropDownList   Runat="server" style="width:110px;" RecordId="4"  ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItemResult"  ID="SurveyItemResult_Encephalopathy"    >
                                                    <asp:ListItem Value="" Text=""  />
                                                    <asp:ListItem Value="None" Text="None"  />
                                                    <asp:ListItem Value="Medication Controlled" Text="Medication Controlled"  />
                                                    <asp:ListItem Value="Refractory" Text="Refractory"  /> 
                                                 </euc:EformDropDownList></td>
        <td class="ClinicalEformGridColumnOne"><euc:EformTextBox ReadOnly="true"  Runat="server" style="width:65px;" RecordId="4"  ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItemTotal"  ID="SurveyItemTotal_Encephalopathy" CssClass="PointsTextBox"/></td>
        <td class="ClinicalEformGridColumnOne"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
   <tr > 
      <td style=" white-space: nowrap;">              <euc:EformCheckbox Runat="server" RecordId="5" ParentRecordId="1"   TABLE="SurveyItems" FIELD="SurveyItem"  ID="SurveyItem_Ascites" Value="Ascites"  />Ascites</td>
          <td class="ClinicalEformGridColumnOne"><euc:EformDropDownList    Runat="server" style="width:110px;" RecordId="5"  ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItemResult"  ID="SurveyItemResult_Ascites" ShowEmptyListItem="True">
                                                    <asp:ListItem Value="" Text=""   />
                                                    <asp:ListItem Value="None" Text="None"  />
                                                    <asp:ListItem Value="Medication Controlled" Text="Medication Controlled"  />
                                                    <asp:ListItem Value="Refractory" Text="Refractory"  /> 
                                                 </euc:EformDropDownList></td>
        <td class="ClinicalEformGridColumnOne"><euc:EformTextBox  ReadOnly="true" Runat="server" style="width:65px;" RecordId="5"  ParentRecordId="1"  TABLE="SurveyItems" FIELD="SurveyItemTotal"  ID="SurveyItemTotal_Ascites" CssClass="PointsTextBox"/></td>
        <td class="ClinicalEformGridColumnOne"><euc:EformDeleteIcon runat="server"/></td>
  </tr>  
 
   <tr><td colspan="4"><strong>______________________________________________________________</strong><br /></td></tr>
   <tr><td colspan="4"><strong>After entering all assesmment results, click to populate score  <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1"  TABLE="Surveys" FIELD="SurveyType"  ID="SurveyType_ChildPughScore"  /></strong><br /></td></tr>
    <tr > 
        
        <td style="white-space: nowrap;"><%--<asp:ImageButton runat="server" ImageUrl="~/Images/CalculateChildPughScore.png" id="ChildPughScoreClick" OnClientClick="cpsClick();"  />--%><img src="../../Images/CalculateChildPughScore.png"  class="ClickableImage" align="left"  onclick="return cpsClick();" /></td>
        <td class="ClinicalEformGridColumnOne"><strong>Score&nbsp;<br /></strong><euc:EformTextBox  Runat="server" style="width:65px;" RecordId="1"  TABLE="Surveys" FIELD="SurveyTotal"  ID="SurveyTotal_ChildPughScore"/></td>
        <td class="ClinicalEformGridColumnOne"><strong>Total Points&nbsp;<br /></strong><euc:EformTextBox ReadOnly="true" Runat="server" style="width:65px;" RecordId="1"  TABLE="Surveys" FIELD="SurveyResult"  ID="SurveyResult_ChildPughScore" CssClass="PointsTextBox"/></td>
        <td class="ClinicalEformGridColumnOne"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<br />

<table width="300" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="Table1">
    
   
    <tr > 
    
    <td class="ClinicalEformGridColumnOne"><strong>Notes<br /></strong>
        <euc:EformTextArea  Runat="server" Rows="4" style="width:410px;" RecordId="1"  TABLE="Surveys" FIELD="SurveyNotes"  ID="SurveyNotes" ShowTextEditor="true"/></td>
  </tr> 
</table>
<br/><br/><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo
                                                                                   
    addEvents($('<%= SurveyType_ChildPughScore.ClientID %>'),$('<%= SurveyTotal_ChildPughScore.ClientID %>'),$('<%= SurveyResult_ChildPughScore.ClientID %>'),$('<%= SurveyItem_Totalbilirubin.ClientID %>'),$('<%= SurveyItemTotal_Totalbilirubin.ClientID %>'),$('<%= SurveyItemResult_Totalbilirubin.ClientID %>'),$('<%= SurveyItem_Albumin.ClientID %>'),$('<%= SurveyItemTotal_Albumin.ClientID %>'),$('<%= SurveyItemResult_Albumin.ClientID %>'),$('<%= SurveyItem_INR.ClientID %>'),$('<%= SurveyItemTotal_INR.ClientID %>'),$('<%= SurveyItemResult_INR.ClientID %>'),$('<%= SurveyItem_Encephalopathy.ClientID %>'),$('<%= SurveyItemTotal_Encephalopathy.ClientID %>'),$('<%= SurveyItemResult_Encephalopathy.ClientID %>'),$('<%= SurveyItem_Ascites.ClientID %>'),$('<%= SurveyItemTotal_Ascites.ClientID %>'),$('<%= SurveyItemResult_Ascites.ClientID %>'),$('<%= SurveyDateText_ChildPughScore.ClientID %>'),$('<%= SurveyNotes.ClientID %>'));

    function cpsClick()
    {
        
            SetChildPughScore($('<%= SurveyType_ChildPughScore.ClientID %>'),$('<%= SurveyTotal_ChildPughScore.ClientID %>'),$('<%= SurveyResult_ChildPughScore.ClientID %>'),$('<%= SurveyItemTotal_Totalbilirubin.ClientID %>'),$('<%= SurveyItemTotal_Albumin.ClientID %>'),$('<%= SurveyItemTotal_INR.ClientID %>'),$('<%= SurveyItemTotal_Encephalopathy.ClientID %>'),$('<%= SurveyItemTotal_Ascites.ClientID %>'),$('<%= SurveyItemResult_Ascites.ClientID %>'));

    }
    
    
    function addEvents(siCPS,stCPS,srCPS,siTB,stTB,srTB,siAL,stAL,srAL,siINR,stINR,srINR,siEN,stEN,srEN,siAS,stAS,srAS,dateID)
    {  
        
//         $(clickCPS).addEvent('click',curry(SetChildPughScore,siCPS,stCPS,srCPS,stTB,stAL,stINR,stEN,stAS));
      
//        $(siCPS).addEvent('click',curry(SetChildPughScore,siCPS,stCPS,srCPS,stTB,stAL,stINR,stEN,stAS));
        $(srTB).addEvent('blur',curry(SetChildPughScore,siCPS,stCPS,srCPS,stTB,stAL,stINR,stEN,stAS));
        $(srAL).addEvent('blur',curry(SetChildPughScore,siCPS,stCPS,srCPS,stTB,stAL,stINR,stEN,stAS));
        $(srINR).addEvent('blur',curry(SetChildPughScore,siCPS,stCPS,srCPS,stTB,stAL,stINR,stEN,stAS));
        $(srEN).addEvent('blur',curry(SetChildPughScore,siCPS,stCPS,srCPS,stTB,stAL,stINR,stEN,stAS));
        $(srAS).addEvent('blur',curry(SetChildPughScore,siCPS,stCPS,srCPS,stTB,stAL,stINR,stEN,stAS));


        $(siTB).addEvent('click',curry(SetTotalBilirubin,siTB,stTB,srTB));      
        $(siAL).addEvent('click',curry(SetAlbumin,siAL,stAL,srAL));      
        $(siINR).addEvent('click',curry(SetINR,siINR,stINR,srINR));      
        $(siEN).addEvent('click',curry(SetEncephalopathyAscites,siEN,stEN,srEN));      
        $(siAS).addEvent('click',curry(SetEncephalopathyAscites,siAS,stAS,srAS));      

        $(srTB).addEvent('blur',curry(SetTotalBilirubin,siTB,stTB,srTB));      
        $(srAL).addEvent('blur',curry(SetAlbumin,siAL,stAL,srAL));      
        $(srINR).addEvent('blur',curry(SetINR,siINR,stINR,srINR));      
        $(srEN).addEvent('blur',curry(SetEncephalopathyAscites,siEN,stEN,srEN));      
        $(srAS).addEvent('blur',curry(SetEncephalopathyAscites,siAS,stAS,srAS));      
        
   }
   
    /* ]]> */
    
   
    	function SetTotalBilirubin(surveySelected, surveyTotal, surveyResult)
        {

            if (surveyResult.value != '' && !surveySelected.checked)
                surveySelected.checked = true;

            if (surveySelected.checked == true && surveyResult.value != '')
	        {
	            
	            // if <2 = 1
	            if (surveyResult.value < 2){
		            surveyTotal.value = 1;
		        }
		        // if 2-3=2
		        else if (surveyResult.value >= 2 && surveyResult.value <= 3){
		            surveyTotal.value = 2;
		        }
		        // if >3=3
		        else if (surveyResult.value > 3){
		            surveyTotal.value = 3;
		        }
	        }
	        else{
		        surveyTotal.value = '';
		        surveyResult.value = ''; 
	        }        	
        }
        
        function SetAlbumin(surveySelected, surveyTotal, surveyResult)
        {

            if (surveyResult.value != '' && !surveySelected.checked)
                surveySelected.checked = true;

            if (surveySelected.checked == true && surveyResult.value != '')
	        {
	           
	            // if >3.5=1
	            if (surveyResult.value > 3.5){
		            surveyTotal.value = 1;
		        }
		        // if 2.8-3.5=2
		        else if (surveyResult.value >= 2.8 && surveyResult.value <= 3.5){
		            surveyTotal.value = 2;
		        }
		        // if <2.8=3
		        else if (surveyResult.value < 2.8){
		            surveyTotal.value = 3;
		        }
	        }
	        else{
		        surveyTotal.value = '';
		        surveyResult.value = '';
	        }        	
        }

        function SetINR(surveySelected, surveyTotal, surveyResult)
        {

            if (surveyResult.value != '' && !surveySelected.checked)
                surveySelected.checked = true;

            if (surveySelected.checked == true && surveyResult.value != '')
	        {
	            // if <1.7=1
	            if (surveyResult.value < 1.7){
		            surveyTotal.value = 1;
		        }
		        // if 1.7-2.2=2
		        else if (surveyResult.value >= 1.70 && surveyResult.value <= 2.2){
		            surveyTotal.value = 2;
		        }
		        // if >= 2.3
	            else{
		            surveyTotal.value = 3;
	            } 
	        }
	        else{
		        surveyTotal.value = '';
		        surveyResult.value = '';
	        }        	
        }
        
         function SetEncephalopathyAscites(surveySelected, surveyTotal, surveyResult)
        {
            if (surveyResult.value != '' && !surveySelected.checked)
                surveySelected.checked = true;
                
	        if (surveySelected.checked == true && surveyResult.value != '')
	        {

	            // if 'None'=1
	            if (surveyResult.value == 'None'){
		            surveyTotal.value = 1;
		        }
		        // if 'Suppressed with medicaiton'=2
		        else if (surveyResult.value == 'Medication Controlled'){
		            surveyTotal.value = 2;
		        }
		        // if 'Refractory'=3
		        else if (surveyResult.value == 'Refractory'){
		            surveyTotal.value = 3;
		        }
		        else {
		            surveyTotal.value = '';
		        }
	        }
	        else{
		        surveyTotal.value = '';
		        surveyResult.value = '';
	        }        	
        }
        
        function SetChildPughScore(childItem,childTotal,childResult,surveyTotal1,surveyTotal2,surveyTotal3,surveyTotal4,surveyTotal5)
        {    
            // surveyTotal1 = Totalbilirubin
            // srveyTotal2 Albumin
            // surveyTotal3 = INR
            // surveyTotal4 = Encephalopathy
            // surveyTotal5 = Ascites

	        if ((surveyTotal1.value != '' || surveyTotal2.value != '' || surveyTotal3.value != '' || surveyTotal4.value != '' || surveyTotal5.value != '') )
	        {
	            childItem.value = "Child-Pugh Score";
	            
	            childResult.value = surveyTotal1.value*1 + surveyTotal2.value*1 + 
	                                                          surveyTotal3.value*1 + surveyTotal4.value*1 + surveyTotal5.value*1; 
	           // <7=A
	           if (childResult.value < 7)
	           {
	                childTotal.value = 'A';
	           }
	           // 7-9=B
	           else if (childResult.value >= 7 && childResult.value <= 9)
	           {
	                childTotal.value = 'B';
	           }
	           // >9=C
	           else if (childResult.value > 9)
	           {
	                childTotal.value = 'C';
	           }
	           else
	           
	                childTotal.value = '';
	        }
	        else{
	            childItem.value = '';
		        childResult.value = '';
		        childTotal.value = '';
	        }
	    }
        
        
    
</script>