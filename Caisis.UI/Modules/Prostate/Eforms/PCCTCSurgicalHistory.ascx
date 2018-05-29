<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PCCTCSurgicalHistory" CodeFile="PCCTCSurgicalHistory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ProceduresHtmlTable = "ProceduresHtmlTable";
</script>

<script type="text/javascript">
	var OptionalProstatectomyFieldsVisible = false;
	
	function showHideOptionalProstatectomyFields()
	{
	    var ProstatectomyHtmlTable = $('ProstatectomyHtmlTable');
	    var ProstatectomyTdList = ProstatectomyHtmlTable.getElementsByTagName("td");
//	    var showHideOptionaProstatectomyFieldsLink = $('showHideOptionaProstatectomyFieldsLink');
   	    var showHideOptionalProstatectomyFieldsImg = $('ProstatectomyMoreLessImg');

	    var newDisplayVal = 'block';
//	    var newLinkText = 'hide optional fields';
	    var newImgSrc = '../../Images/Button_LessFields.png';
	    
	    if(OptionalProstatectomyFieldsVisible)
	    {
	        newDisplayVal = 'none';
//	        newLinkText = 'show optional fields';
	        newImgSrc = '../../Images/Button_MoreFields.png';
        }
        
        
	    for (i=0;i<ProstatectomyTdList.length;i++)
	    {
	        if (ProstatectomyTdList[i].className != null && ProstatectomyTdList[i].className.indexOf("optionalProstatectomyTd") > -1) ProstatectomyTdList[i].style.display = newDisplayVal;
	    }
	    
//	    showHideOptionaProstatectomyFieldsLink.innerHTML = newLinkText;
	    OptionalProstatectomyFieldsVisible = !OptionalProstatectomyFieldsVisible;
	    showHideOptionalProstatectomyFieldsImg.src = newImgSrc;

	}
	
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<style type="text/css">
.optionalProstatectomyTd
{
    display: none;
}
#showHideOptionaProstatectomyFieldsLink
{
    margin-left: 500px;
    font-size: 11px;
    margin-bottom: 3px;
    color: #444444;
    text-decoration: underline;
    cursor: pointer;
}
#showHideOptionaProstatectomyFieldsLink:hover
{
    color: #8d2a2c;
}
</style>



<a name="PCCTCSurgicalHistory" /><span class="controlBoxTitle">Surgical History </span><br>
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SurgeriesHtmlTable">
  <tr> 
    <td width="18%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Surgery Type </td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="rptSurgicalHistory" runat="server" OnItemDataBound="ChronListItemDataBound"> 
	<ItemTemplate> 
		<tr id="SurgicalHistoryRow" runat="server" class="ClinicalEformPopulatedRowNonClickable" > 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<asp:Literal ID="ChronListDateField" Runat="server" /></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "varName") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "varValue") %>&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr id="NoSurgicalHistoryMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="4" class="ClinicalEformPopulatedColumn" align="center" height="40"> No prior surgical procedures have been recorded for this patient.</td>
  </tr> 
  
  
</table>
<div id="AddProstatectomyDiv" runat="server" >
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;" id="AddProstatectomyYesNoContainer"><strong>Has the subject had prior prostatectomy?</strong><euc:EformRadioButtonList Table="NoTable" Field="ProstatectomyYesNo" id="ProstatectomyYesNo" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="ProstatectomyDetails" style="display: none;">
<td style="white-space:nowrap; padding-top: 0px;">
	<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProstatectomyHtmlTable" style="background-color: #ffffff;" onclick="copyProstatectomyValuesToPath();">
	  <tr> 
		<td class="controlBoxDataGridHeaderFirstCol" >Date</td>
		<td class="controlBoxDataGridHeaderFirstCol" >Prostatectomy Type</td>
		<td class="controlBoxDataGridHeaderFirstCol" >Approach</td>
		<td class="controlBoxDataGridHeaderFirstCol" >Histology</td>
		<td class="controlBoxDataGridHeaderFirstCol" >G1</td>
		<td class="controlBoxDataGridHeaderFirstCol" >G2</td>
        <td class="controlBoxDataGridHeaderFirstCol" >G3</td>
		<td class="controlBoxDataGridHeaderFirstCol" >GSum</td>
		<td class="controlBoxDataGridHeaderFirstCol optionalProstatectomyTd" style="font-size: 10px;">ECE</td>
		<td class="controlBoxDataGridHeaderFirstCol optionalProstatectomyTd" style="font-size: 10px;">Margin Status</td>
		<td class="controlBoxDataGridHeaderFirstCol optionalProstatectomyTd" style="font-size: 10px;">SV Inv</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="position: relative; overflow: visible;">
            <img id="ProstatectomyMoreLessImg" onclick="showHideOptionalProstatectomyFields();" src="../../Images/Button_MoreFields.png" style="cursor: pointer; position: absolute; z-index: 2000; top: -13px; left: -55px;" />
        </td>
	  </tr>
	  <tr > 
		<td height="28"  style="white-space: nowrap;">
		
		
		<euc:EformTextBox Runat="server" RecordId="1"  ID="ProcDateText_1" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  AppendToOnChange="setTimeout('copyProstatectomyValuesToPath()',500);"  /><euc:EformHidden RecordId="1" Runat="server" ID="ProcDate_1" Table="Procedures" Field="ProcDate" /><euc:EformTextBox Runat="server" RecordId="1"  ID="PathDateText_1" TABLE="Pathology" FIELD="PathDateText" style="display: none;"   /><euc:EformTextBox Runat="server" RecordId="1"  ID="PathDate_1" TABLE="Pathology" FIELD="PathDate" style="display: none;"   /></td>
		<td ><euc:EformComboBox  LookupCode="OpTypeProstatectomy"  DropDownWidth="140" DropDownHeight="auto"   TABLE="Procedures" FIELD="ProcName" id="OpType_Prostatectomy"  runat="server" RecordId="1"  /><euc:EformTextBox Runat="server" RecordId="1"  ID="PathSpecimenType_1" TABLE="Pathology" FIELD="PathSpecimenType" style="display: none;"   /></td>
		<td  style="white-space: nowrap;"><euc:EformComboBox   LookupCode="OpApproach"  style="width:150px;" DropDownWidth="300" Field="ProcApproach" RecordId="1" Table="Procedures" Runat="server" id="ProcApproach"  /></td>
        <td valign="baseline"><euc:EformComboBox LookupCode="PathHistology" RecordId="1" ID="PathHistology_1" style="width:240px" DropDownWidth="320" TABLE="Pathology" FIELD="PathHistology" Runat="server"  /></td>
		<td valign="baseline"><euc:EformTextBox RecordId="1" ID="PathGG1_1" style="width:30px" TABLE="ProstatectomyPath" FIELD="PathGG1" Runat="server"/></td>        
        <td valign="baseline"><euc:EformTextBox RecordId="1" ID="PathGG2_1" style="width:30px" TABLE="ProstatectomyPath" FIELD="PathGG2" Runat="server"/></td>
        <td valign="baseline"><euc:EformTextBox RecordId="1" ID="PathGG3_1" style="width:30px" TABLE="ProstatectomyPath" FIELD="PathGG3" Runat="server"/></td>
	    <td valign="baseline"><euc:EformTextBox RecordId="1" ID="PathGGS_1" style="width:30px" TABLE="ProstatectomyPath" FIELD="PathGGS" Runat="server"/></td>
   		<td valign="baseline" class="optionalProstatectomyTd"><euc:EformSelect LookupCode="LocalExtensionProstate" RecordId="1" ID="PathExtension_1"   style="width:90px;" DropDownHeight="auto" DropDownWidth="250"   TABLE="ProstatectomyPath" FIELD="PathExtension" Runat="server"/></td>
	    <td valign="baseline" class="optionalProstatectomyTd"><euc:EformComboBox LookupCode="MarginStatus" RecordId="1" ID="PathMargin_1"  style="width:62px;" DropDownHeight="auto" DropDownWidth="180"  TABLE="ProstatectomyPath" FIELD="PathMargin" Runat="server"/></td>
	    <td valign="baseline" class="optionalProstatectomyTd"><euc:EformSelect LookupCode="SVI" RecordId="1" ID="PathSV_Inv_1" style="width:62px;" DropDownHeight="auto" DropDownWidth="72" TABLE="ProstatectomyPath" FIELD="PathSV_Inv" Runat="server"/></td>

		<td><euc:EformDeleteIcon runat="server"/></td>
	  </tr>
	</table>
</td>
  </tr>

</table>
</div>

<div id="AddOtherProcsDiv" >
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;" id="AddOtherProcsYesNoContainer"><strong>Has the subject had other prior cancer surgeries?</strong><euc:EformRadioButtonList Table="NoTable" Field="OtherProceduresYesNo" id="OtherProceduresYesNo" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="OtherProcsDetails" style="display: none;">
<td style="white-space:nowrap; padding-top: 0px;">
<table width="650" cellpadding="1" cellspacing="0" class="ClinicalEformTable" id="ProceduresHtmlTable" style="background-color: #ffffff;">
  <tr> 
    <td width="18%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Procedure Type </td>
    <td width="42%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr> 
    <td height="28"  >&nbsp;<euc:EformTextBox Runat="server" RecordId="2"  ID="ProcDateText_2" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="2" Runat="server" ID="ProcDate_2" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="400"    LookupCode="ProcName" style="width:250;" Field="ProcName" RecordId="2" Table="Procedures" MaxLength="50"  Runat="server" id="ProcName_2"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="2" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr > 
    <td height="28"  >&nbsp;<euc:EformTextBox Runat="server" RecordId="3"  ID="ProcDateText_3" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="3" Runat="server" ID="ProcDate_3" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="400"    LookupCode="ProcName" style="width:250;" Field="ProcName" RecordId="3" Table="Procedures" MaxLength="50"  Runat="server" id="ProcName_3"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="3" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28"  >&nbsp;<euc:EformTextBox Runat="server" RecordId="4"  ID="ProcDateText_4" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="4" Runat="server" ID="ProcDate_4" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="400"    LookupCode="ProcName" style="width:250;" Field="ProcName" RecordId="4" Table="Procedures" MaxLength="50"  Runat="server" id="ProcName_4"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="4" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28"  >&nbsp;<euc:EformTextBox Runat="server" RecordId="5"  ID="ProcDateText_5" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="5" Runat="server" ID="ProcDate_5" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="400"    LookupCode="ProcName" style="width:250;" Field="ProcName" RecordId="5" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_5"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="5" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28"  >&nbsp;<euc:EformTextBox Runat="server" RecordId="6"  ID="ProcDateText_6" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="6" Runat="server" ID="ProcDate_6" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="400"    LookupCode="ProcName" style="width:250;" Field="ProcName" RecordId="6" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_6"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="6" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28"  >&nbsp;<euc:EformTextBox Runat="server" RecordId="7"  ID="ProcDateText_7" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="7" Runat="server" ID="ProcDate_7" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="400"    LookupCode="ProcName" style="width:250;" Field="ProcName" RecordId="7" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_7"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="7" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28"  >&nbsp;<euc:EformTextBox Runat="server" RecordId="8"  ID="ProcDateText_8" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="8" Runat="server" ID="ProcDate_8" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="400"    LookupCode="ProcName" style="width:250;" Field="ProcName" RecordId="8" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_8"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="8" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28"  >&nbsp;<euc:EformTextBox Runat="server" RecordId="9"  ID="ProcDateText_9" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="9" Runat="server" ID="ProcDate_9" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="400"    LookupCode="ProcName" style="width:250;" Field="ProcName" RecordId="9" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_9"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="9" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28"  >&nbsp;<euc:EformTextBox Runat="server" RecordId="10"  ID="ProcDateText_10" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="10" Runat="server" ID="ProcDate_10" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="400"    LookupCode="ProcName" style="width:250;" Field="ProcName" RecordId="10" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_10"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="10" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_10"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
   <tr style="DISPLAY: none"> 
    <td height="28"  >&nbsp;<euc:EformTextBox Runat="server" RecordId="11"  ID="ProcDateText_11" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
		<euc:EformHidden RecordId="11" Runat="server" ID="ProcDate_11" Table="Procedures" Field="ProcDate" />	  </td>
    <td align="center"  style="white-space: nowrap;">&nbsp;
	<euc:EformComboBox DropDownWidth="400"    LookupCode="ProcName" style="width:250;" Field="ProcName" RecordId="11" Table="Procedures" MaxLength="50" Runat="server" id="ProcName_11"  />	</td>
    <td  style="white-space: nowrap;">&nbsp;<euc:EformTextBox  RecordId="11" ShowCalendar="False" CalcDate="False" style="width:200px;" TABLE="Procedures" FIELD="ProcNotes"  ShowTextEditor="true" Runat="server" ID="ProcNotes_11"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProceduresHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
</td></tr></table>
</div>

<div id="ProstatectomyAbsentEvent" style="display: none;">
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_4"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="4" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_4"
                Runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="TableName" ID="TableName_4"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldName" ID="FieldName_4"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_4"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_4"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_4"
                runat="server"  style="display:none;" />
</div>
<br/><br/>

<script type="text/javascript">
function attachShowHideScriptsAndSetInitialDisplay()
{

    if ($('AddProstatectomyYesNoContainer'))
    {
	var ProstatectomyYesNoContainer = $('AddProstatectomyYesNoContainer');
	var ProstatectomyYesNoRadios = ProstatectomyYesNoContainer.getElementsByTagName('input');
	var showProstatectomyOnload = false;
	var ProstatectomyDetails = document.getElementById('ProstatectomyDetails');
	
	for (var i=0;i<ProstatectomyYesNoRadios.length;i++)
	{
		if (ProstatectomyYesNoRadios[i].type == 'radio')
		{
			ProstatectomyYesNoRadios[i].onclick = function() {showHideProstatectomy(this)};
			if (ProstatectomyYesNoRadios[i].checked && ProstatectomyYesNoRadios[i].value.toString().toUpperCase() == 'YES') showProstatectomyOnload = true;
		}
	}
	
	if (showProstatectomyOnload) ProstatectomyDetails.style.display = 'block';
	}
	
	
	var AddOtherProcsYesNoContainer = $('AddOtherProcsYesNoContainer');
	var OtherProcsYesNoRadios = AddOtherProcsYesNoContainer.getElementsByTagName('input');
	var showOtherProcsOnload = false;
	var OtherProcsDetails = document.getElementById('OtherProcsDetails');
	
	for (var i=0;i<OtherProcsYesNoRadios.length;i++)
	{
		if (OtherProcsYesNoRadios[i].type == 'radio')
		{
			OtherProcsYesNoRadios[i].onclick = function() {showHideOtherProcs(this)};
			if (OtherProcsYesNoRadios[i].checked && OtherProcsYesNoRadios[i].value.toString().toUpperCase() == 'YES') showOtherProcsOnload = true;
		}
	}
	
	if (showOtherProcsOnload) OtherProcsDetails.style.display = 'block';
	
}
attachShowHideScriptsAndSetInitialDisplay();

function showHideProstatectomy(theRadio)
{
	var ProstatectomyDetails = document.getElementById('ProstatectomyDetails');
	var ProstatectomyAbsentEvent = document.getElementById('ProstatectomyAbsentEvent');
	
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		ProstatectomyDetails.style.display = 'block';
		clearAllElementsContainedInNode(ProstatectomyAbsentEvent);
	}
	else
	{
		ProstatectomyDetails.style.display = 'none';
		clearAllElementsContainedInNode(ProstatectomyDetails);
		$('<% =TableName_4.ClientID %>').value = 'Procedures';
		$('<% =FieldName_4.ClientID %>').value = 'ProcName';
		$('<% =FieldValue_4.ClientID %>').value = 'Prostatectomy';
	}

}

function showHideOtherProcs(theRadio)
{
	var OtherProcsDetails = document.getElementById('OtherProcsDetails');
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		OtherProcsDetails.style.display = 'block';
	}
	else
	{
		OtherProcsDetails.style.display = 'none';
		clearAllElementsContainedInNode(OtherProcsDetails);
	}

}

	// loading script for gleason calculations
	var calc_prostatectomy = function() { calculateProstatectomyBxResult('<%= PathGG1_1.ClientID %>','<%= PathGG2_1.ClientID %>','<%= PathGGS_1.ClientID %>'); };
	
	if ($('<%= PathGG1_1.ClientID %>')) $('<%= PathGG1_1.ClientID %>').onkeyup = calc_prostatectomy;
	if ($('<%= PathGG2_1.ClientID %>')) $('<%= PathGG2_1.ClientID %>').onkeyup = calc_prostatectomy;
	
	
	function calculateProstatectomyBxResult(primaryGleasonId, secondaryGleasonId, gleasonSumId)
	{
		var ggs = 0;
		var g1 = parseInt(document.getElementById(primaryGleasonId).value);
		var g2 = parseInt(document.getElementById(secondaryGleasonId).value);
	
	
		if (!isNaN(g1) && !isNaN(g2)) {
			ggs = g1 + g2;
		document.getElementById(gleasonSumId).value = ggs;

		}
	}
	
	function copyProstatectomyValuesToPath()
	{
	    if ($('<% =PathGG1_1.ClientID %>').value != '' || $('<% =PathGG2_1.ClientID %>').value != '' || $('<% =PathGG3_1.ClientID %>').value != '' || $('<% =PathGGS_1.ClientID %>').value != '')
	    {
	        setProstatectomyPathDateVars();
	        setProstatectomyPathSpecimenType();
	    }
	    else
	    {
            $('<% =PathDateText_1.ClientID %>').value = '';
            $('<% =PathDate_1.ClientID %>').value = '';
            $('<% =PathSpecimenType_1.ClientID %>').value = '';
	    }
	}
	
	function setProstatectomyPathDateVars()
    {
        $('<% =PathDateText_1.ClientID %>').value = $('<% =ProcDateText_1.ClientID %>').value;
        $('<% =PathDate_1.ClientID %>').value = $('<% =ProcDate_1.ClientID %>').value;
    }
    function setProstatectomyPathSpecimenType()
    {
        $('<% =PathSpecimenType_1.ClientID %>').value = $('<% =OpType_Prostatectomy.ClientID %>').value;
    }

	function setInitialViewOfOptionalProstatectomyFields()
    {
        if ($('<% =PathExtension_1.ClientID %>') != null && ($('<% =PathExtension_1.ClientID %>').value != '' || $('<% =PathMargin_1.ClientID %>').value != '' || $('<% =PathSV_Inv_1.ClientID %>').value != ''))
        {
            showHideOptionalProstatectomyFields();
        }
    }
	setInitialViewOfOptionalProstatectomyFields();

</script>