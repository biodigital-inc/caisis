<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.EncountersSurveysMobility" CodeFile="EncountersSurveysMobility.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.EncountersSurveysMobilityHtmlTable = "EncountersSurveysMobilityHtmlTable";
	
	function SetDate(cbox, dateTextFieldId, date, cbox2)
    {
	    if (cbox.checked == true)
	    {
		    document.getElementById(dateTextFieldId).value = date;
	    }
	    else
	    {
		    document.getElementById(dateTextFieldId).value = '';
		    cbox2.checked = false;
	    }
	    document.getElementById(cbox2).checked = cbox.checked;
	    document.getElementById(dateTextFieldId).focus();
	    document.getElementById(dateTextFieldId).blur();
    	
    }

</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="EncountersSurveysMobility" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Mobility Assessment"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="EncountersSurveysMobilityHtmlTable">
 
  <tr id="ComorbiditiesPopulatedColumnHeadingsRow" runat="server"> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="5%" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" >Check if New Today </td>
    <td width="30%" class="controlBoxDataGridTitleColumn">Assessment Type&nbsp;</td>
    <td width="15%" class="controlBoxDataGridTitleColumn">Result</td>
    <td width="30%" class="controlBoxDataGridTitleColumn">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
                       <euc:EformTextBox  Runat="server" style="width:80px;"  RecordId="1"  TABLE="Surveys" FIELD="SurveyDateText" ID="SurveyDateText_OccWall"   ShowCalendar="True" CalcDate="True" class="InputText"  />
                       <euc:EformHidden   Runat="server"                      RecordId="1"  TABLE="Surveys" FIELD="SurveyDate" ID="SurveyDate_OccWall"  />	</td> 
     <td style="text-align: center;" class="ClinicalEformGridColumnOne"> <euc:CaisisCheckBox Runat="server" ID="TodaysDate_OccWall" /></td>
    <td  style="white-space: nowrap;">              <euc:EformCheckbox Runat="server" RecordId="1"  TABLE="Surveys" FIELD="SurveyType"  ID="SurveyType_OccWall" Value="Occ-Wall"  />Occ-Wall</td>
    <td><euc:EformTextBox   Runat="server" style="width:65px;" RecordId="1"  TABLE="Surveys" FIELD="SurveyResult"  ID="SurveyResult_OccWall"/></td>

    <td><euc:EformTextBox  Runat="server" style="width:150px;" RecordId="1"  TABLE="Surveys" FIELD="SurveyNotes"  ID="SurveyNotes_OccWall" ShowTextEditor="true"/></td>
    
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
                       <euc:EformTextBox  Runat="server" style="width:80px;"  RecordId="2"  TABLE="Surveys" FIELD="SurveyDateText" ID="SurveyDateText_LEFS"   ShowCalendar="True" CalcDate="True" class="InputText"  />
                       <euc:EformHidden   Runat="server"                      RecordId="2"  TABLE="Surveys" FIELD="SurveyDate" ID="SurveyDate_LEFS"  />	</td> 
     <td style="text-align: center;"  class="ClinicalEformGridColumnOne"> <euc:CaisisCheckBox Runat="server" ID="TodaysDate_LEFS" /></td>
    <td style="white-space: nowrap;">              <euc:EformCheckbox Runat="server"  RecordId="2"  TABLE="Surveys" FIELD="SurveyType"  ID="SurveyType_LEFS" Value="LEFS"  />LEFS</td>
    <td><euc:EformTextBox   Runat="server" style="width:65px;" RecordId="2"  TABLE="Surveys" FIELD="SurveyResult"  ID="SurveyResult_LEFS"/></td>

    <td><euc:EformTextBox  Runat="server" style="width:150px;" RecordId="2"  TABLE="Surveys" FIELD="SurveyNotes"  ID="SurveyNotes_LEFS" ShowTextEditor="true"/></td>
    
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
                       <euc:EformTextBox  Runat="server" style="width:80px;"  RecordId="3"  TABLE="Surveys" FIELD="SurveyDateText" ID="SurveyDateText_Bartel"   ShowCalendar="True" CalcDate="True" class="InputText"  />
                       <euc:EformHidden   Runat="server"                      RecordId="3"  TABLE="Surveys" FIELD="SurveyDate" ID="SurveyDate_Bartel"  />	</td> 
     <td style="text-align: center;"  class="ClinicalEformGridColumnOne"> <euc:CaisisCheckBox Runat="server" ID="TodaysDate_Bartel" /></td>
    <td style="white-space: nowrap;">              <euc:EformCheckbox Runat="server"  RecordId="3"  TABLE="Surveys" FIELD="SurveyType"  ID="SurveyType_Bartel" Value="Bartel"  />Bartel</td>
    <td><euc:EformTextBox   Runat="server" style="width:65px;" RecordId="3"  TABLE="Surveys" FIELD="SurveyResult"  ID="SurveyResult_Bartel"/></td>

    <td><euc:EformTextBox  Runat="server" style="width:150px;" RecordId="3"  TABLE="Surveys" FIELD="SurveyNotes"  ID="SurveyNotes_Bartel" ShowTextEditor="true"/></td>
    
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
                       <euc:EformTextBox  Runat="server" style="width:80px;"  RecordId="4"  TABLE="Surveys" FIELD="SurveyDateText" ID="SurveyDateText_TUG"   ShowCalendar="True" CalcDate="True" class="InputText"  />
                       <euc:EformHidden   Runat="server"                      RecordId="4"  TABLE="Surveys" FIELD="SurveyDate" ID="SurveyDate_TUG"  />	</td> 
     <td style="text-align: center;"  class="ClinicalEformGridColumnOne"> <euc:CaisisCheckBox Runat="server" ID="TodaysDate_TUG" /></td> 
    <td style="white-space: nowrap;">              <euc:EformCheckbox Runat="server"  RecordId="4"  TABLE="Surveys" FIELD="SurveyType"  ID="SurveyType_TUG" Value="TUG"  />TUG</td>
    <td><euc:EformTextBox   Runat="server" style="width:65px;" RecordId="4"  TABLE="Surveys" FIELD="SurveyResult"  ID="SurveyResult_TUG"/></td>

    <td><euc:EformTextBox  Runat="server" style="width:150px;" RecordId="4"  TABLE="Surveys" FIELD="SurveyNotes"  ID="SurveyNotes_TUG" ShowTextEditor="true"/></td>
    
    <td><euc:EformDeleteIcon  runat="server"/></td>
  </tr>

 </table>
<br/><br/>
<br/>
