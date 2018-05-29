<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.GTDMedicalTherapy" CodeFile="GTDMedicalTherapy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">

tableArray.MedicalTherapyHtmlTable = "MedicalTherapyHtmlTable";
	
function toggleQuickEntryMenu(clickedMenuId)
{
    var clickedMenu = $(clickedMenuId);

    if (clickedMenu.className == 'QuickEntryMenuOn') {clickedMenu.className = 'QuickEntryMenuOff';}
    else
    {
        clickedMenu.className = 'QuickEntryMenuOn';
    }

}	

var medTxInputArray = new Array();

function medTxInputRow(agent, type, dose, units, route, totalCycles, schedule, institution, quality) {
    this.Agent = agent;
    this.Type = type;
    this.Dose = dose;
    this.Units = units;
    this.Route = route;
    this.TotalCycles = totalCycles;
    this.Schedule = schedule;
    this.Institution = institution;
    this.Quality = quality;
}
 
function registerMedTxInputs()
{
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow('','','','','','','','',''); // filler because recordId's start with 1, not 0
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_1.ClientID %>'), $('<% = MedTxType_1.ClientID %>'), $('<% = MedTxDose_1.ClientID %>'), $('<% = MedTxUnits_1.ClientID %>'), $('<% = MedTxRoute_1.ClientID %>'), $('<% = MedTxCycle_1.ClientID %>'), $('<% = MedTxSchedule_1.ClientID %>'), $('<% = MedTxInstitution_1.ClientID %>'), $('<% = MedTxQuality_1.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_2.ClientID %>'), $('<% = MedTxType_2.ClientID %>'), $('<% = MedTxDose_2.ClientID %>'), $('<% = MedTxUnits_2.ClientID %>'), $('<% = MedTxRoute_2.ClientID %>'), $('<% = MedTxCycle_2.ClientID %>'), $('<% = MedTxSchedule_2.ClientID %>'), $('<% = MedTxInstitution_2.ClientID %>'), $('<% = MedTxQuality_2.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_3.ClientID %>'), $('<% = MedTxType_3.ClientID %>'), $('<% = MedTxDose_3.ClientID %>'), $('<% = MedTxUnits_3.ClientID %>'), $('<% = MedTxRoute_3.ClientID %>'), $('<% = MedTxCycle_3.ClientID %>'), $('<% = MedTxSchedule_3.ClientID %>'), $('<% = MedTxInstitution_3.ClientID %>'), $('<% = MedTxQuality_3.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_4.ClientID %>'), $('<% = MedTxType_4.ClientID %>'), $('<% = MedTxDose_4.ClientID %>'), $('<% = MedTxUnits_4.ClientID %>'), $('<% = MedTxRoute_4.ClientID %>'), $('<% = MedTxCycle_4.ClientID %>'), $('<% = MedTxSchedule_4.ClientID %>'), $('<% = MedTxInstitution_4.ClientID %>'), $('<% = MedTxQuality_4.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_5.ClientID %>'), $('<% = MedTxType_5.ClientID %>'), $('<% = MedTxDose_5.ClientID %>'), $('<% = MedTxUnits_5.ClientID %>'), $('<% = MedTxRoute_5.ClientID %>'), $('<% = MedTxCycle_5.ClientID %>'), $('<% = MedTxSchedule_5.ClientID %>'), $('<% = MedTxInstitution_5.ClientID %>'), $('<% = MedTxQuality_5.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_6.ClientID %>'), $('<% = MedTxType_6.ClientID %>'), $('<% = MedTxDose_6.ClientID %>'), $('<% = MedTxUnits_6.ClientID %>'), $('<% = MedTxRoute_6.ClientID %>'), $('<% = MedTxCycle_6.ClientID %>'), $('<% = MedTxSchedule_6.ClientID %>'), $('<% = MedTxInstitution_6.ClientID %>'), $('<% = MedTxQuality_6.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_7.ClientID %>'), $('<% = MedTxType_7.ClientID %>'), $('<% = MedTxDose_7.ClientID %>'), $('<% = MedTxUnits_7.ClientID %>'), $('<% = MedTxRoute_7.ClientID %>'), $('<% = MedTxCycle_7.ClientID %>'), $('<% = MedTxSchedule_7.ClientID %>'), $('<% = MedTxInstitution_7.ClientID %>'), $('<% = MedTxQuality_7.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_8.ClientID %>'), $('<% = MedTxType_8.ClientID %>'), $('<% = MedTxDose_8.ClientID %>'), $('<% = MedTxUnits_8.ClientID %>'), $('<% = MedTxRoute_8.ClientID %>'), $('<% = MedTxCycle_8.ClientID %>'), $('<% = MedTxSchedule_8.ClientID %>'), $('<% = MedTxInstitution_8.ClientID %>'), $('<% = MedTxQuality_8.ClientID %>'));
<%--   medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_9.ClientID %>'), $('<% = MedTxType_9.ClientID %>'), $('<% = MedTxDose_9.ClientID %>'), $('<% = MedTxUnits_9.ClientID %>'), $('<% = MedTxRoute_9.ClientID %>'), $('<% = MedTxCycle_9.ClientID %>'), $('<% = MedTxSchedule_9.ClientID %>'), $('<% = MedTxInstitution_9.ClientID %>'), $('<% = MedTxQuality_9.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_10.ClientID %>'), $('<% = MedTxType_10.ClientID %>'), $('<% = MedTxDose_10.ClientID %>'), $('<% = MedTxUnits_10.ClientID %>'), $('<% = MedTxRoute_10.ClientID %>'), $('<% = MedTxCycle_10.ClientID %>'), $('<% = MedTxSchedule_10.ClientID %>'), $('<% = MedTxInstitution_10.ClientID %>'), $('<% = MedTxQuality_10.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_11.ClientID %>'), $('<% = MedTxType_11.ClientID %>'), $('<% = MedTxDose_11.ClientID %>'), $('<% = MedTxUnits_11.ClientID %>'), $('<% = MedTxRoute_11.ClientID %>'), $('<% = MedTxCycle_11.ClientID %>'), $('<% = MedTxSchedule_11.ClientID %>'), $('<% = MedTxInstitution_11.ClientID %>'), $('<% = MedTxQuality_11.ClientID %>'));
--%>
}



function addMedicalTherapy(agent, type, dose, units, route, totalCycles, schedule, institution, quality)
{
    var newMedTxRowIndex = nextAvailableMedTxRowIndex();
    
    if (newMedTxRowIndex != null)
    {
        var newMedTxRow = $('MedicalTherapyHtmlTable').rows[newMedTxRowIndex];
        var newMedTxRowInputs = medTxInputArray[newMedTxRowIndex];

        newMedTxRow.style.display = '';
        
        (newMedTxRowInputs.Agent).value = agent;
        (newMedTxRowInputs.Type).value = type;
        (newMedTxRowInputs.Dose).value = dose;
        (newMedTxRowInputs.Units).value = units;
        (newMedTxRowInputs.Route).value = route;
        (newMedTxRowInputs.TotalCycles).value = totalCycles;
        (newMedTxRowInputs.Schedule).value = schedule;
        (newMedTxRowInputs.Institution).value = institution;
        (newMedTxRowInputs.Quality).value = quality;
    }
    else { alert('The maximum number of records have already been added.'); }
}
function nextAvailableMedTxRowIndex()
{
    var nextRowIndex = null;
    var numHTMLRows = $('MedicalTherapyHtmlTable').rows.length;
    
    for (var i=1;i<numHTMLRows;i++)
	{
		if (!InputInNodeHasData($('MedicalTherapyHtmlTable').rows[i]))
		{
		    nextRowIndex = i;
		    break;
		}
		
	}
	
	return nextRowIndex;
}


	
function InputInNodeHasData(node) {


	var inputs = node.getElementsByTagName('input');
	for (var i=0;i<inputs.length;i++)
	{
		type = inputs[i].getAttribute('type');
		if ((type == 'checkbox' || type == 'radio') && inputs[i].checked) { return true; }
		else if (type == 'hidden' && !inputs[i].disabled && inputs[i].value != '') { return true; }
		else if (inputs[i].value != '') { return true; }
	}
		
	var selects = node.getElementsByTagName('select');
	for (var j=0;j<selects.length;j++)
	{
		if (selects[j].selectedIndex > 0) { return true; }
	}
	
	var textareas = node.getElementsByTagName('textarea');
	for (var k=0;k<textareas.length;k++)
	{
		if (textareas[k].value != '') { return true; }
	}

	
	return false;
}	
</script>

<style type="text/css">

#QuickEntryMenuContainer
{
    width: 650px;
    margin: 20px 0px 0px 0px;
    background-image: url(../../Images/QuickEntryMenuBG.png);
    background-repeat: no-repeat;
    padding-top: 9px;
    padding-left: 83px;
    min-height: 150px;
}
#QuickEntryMenuInnerContainer
{
    border: solid 1px #3D556D;
    background-color: #ffffff;
}

div.QuickEntryMenuOn div.QuickEntryMenuTitle
{
    margin-top: 1px;
    background-color: #9BA8B5;
    background-image: url(../../Images/QuickEntryMenuWidgetDown.png);
    background-position: right center;
    background-repeat: no-repeat;
    color: #ffffff;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: normal;
	font-weight: bold;
	padding: 3px 7px 3px 7px;
	cursor: pointer;
}
div.QuickEntryMenuOn div.QuickEntryMenuTitle:hover
{
    background-color: #81909E;
}


div.QuickEntryMenuOn a
{
    display: block;
    color: #333333;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height: normal;
	font-weight: bold;
	padding: 3px 7px 3px 14px;
	cursor: pointer;
	text-decoration: none;
}
div.QuickEntryMenuOn a:hover
{
    display: block;
    background-color: #efefef;
    color: #8d2a2c;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height: normal;
	font-weight: bold;
	padding: 3px 7px 3px 14px;
	cursor: pointer;
	text-decoration: underline;
}

div.QuickEntryMenuOn a.HPISubLink
{
    display: inline;
    color: #333333;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height: normal;
	font-weight: normal;
	padding: 3px 3px 3px 3px;
	margin-left: 10px; margin-right: 10px;
	cursor: pointer;
	text-decoration: none;
}
div.QuickEntryMenuOn a.HPISubLink:hover
{
    display: inline;
    background-color: #efefef;
    color: #8d2a2c;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height: normal;
	font-weight: normal;
	padding: 3px 3px 3px 3px;
	margin-left: 10px; margin-right: 10px;
	cursor: pointer;
	text-decoration: underline;
}
div.QuickEntryMenuOn span
{
    display: block;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height: normal;
	font-weight: bold;
	padding: 3px 7px 3px 14px;

}
div.QuickEntryMenuOn strong
{
    display: block;
    margin-bottom: 2px;
}
div.QuickEntryMenuOff div.QuickEntryMenuTitle
{
    margin-top: 1px;
    background-color: #9BA8B5;
    background-image: url(../../Images/QuickEntryMenuWidgetRight.png);
    background-position: right center;
    background-repeat: no-repeat;
    color: #ffffff;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: normal;
	font-weight: bold;
	padding: 3px 7px 3px 7px;
	cursor: pointer;
}
div.QuickEntryMenuOff div.QuickEntryMenuTitle:hover
{
    background-color: #81909E;
}
div.QuickEntryMenuOff a
{
    display: none;
}
div.QuickEntryMenuOff a.HPISubLink
{
    display: none;
}
div.QuickEntryMenuOff span
{
    display: none;
}
</style>


<a name="GTDMedicalTherapy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medical Therapy"></asp:Label><br/>
<table width="700" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="MedicalTherapyHtmlTable" style="background-color: #ffffff;">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">Start Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Stop Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Agent</td>
     <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Dose</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Units&nbsp;&nbsp;</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Route</td>
    <td style="white-space:nowrap; font-size: 10px;" class="controlBoxDataGridHeaderFirstCol">Total<br />
      Cycles</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Schedule</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol" >Institution</td>
    <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxStopDateText,MedTxStopDate,MedTxType,MedTxAgent,MedTxCycle,MedTxDose,MedTxUnits,MedTxSchedule', 'MedicalTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText")%></td>
			<td  class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText")%>&nbsp;</td>

			<td  class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxAgent")%></td>
						<td  class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxType")%></td>
						
			<td  class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDose")%>&nbsp;</td>
			<td><%# DataBinder.Eval(Container.DataItem, "MedTxUnits")%>&nbsp;</td>
			<td><%# DataBinder.Eval(Container.DataItem, "MedTxRoute")%>&nbsp;</td>
			<td  class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxCycle")%></td>
			<td  class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxSchedule")%>&nbsp;</td>
			<td  class="ClinicalEformPopulatedColumn" style="white-space: normal; width: 100px; max-width: 150px;" ><%# DataBinder.Eval(Container.DataItem, "MedTxInstitution")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>



  <tr >
    <td style="white-space:nowrap;" height="28"><euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxDateText_1" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="1" Runat="server" ID="MedTxDate_1" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space:nowrap;" ><euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxStopDateText_1" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden RecordId="1" Runat="server" ID="MedTxStopDate_1" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,Disease,GTD" style="width:90px;" Field="MedTxAgent" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxAgent_1"  /></td>
     <td style="white-space:nowrap;"><euc:EformTextBox RecordId="1"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_1" style="width:50px;"/></td>
   
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:32px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_1"/>&nbsp;</td>
    <td><euc:EformSelect RecordId="1" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_1" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedRoute"  style="width:65px;" Field="MedTxRoute" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxRoute_1"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_1"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_1"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="MedTxInstitution" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_1"  /><euc:EformTextBox style="display: none;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_1" Runat="server"  /></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
<tr style="display: none;" >
    <td style="white-space:nowrap;" height="28"><euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxDateText_2" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="2" Runat="server" ID="MedTxDate_2" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space:nowrap;" ><euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxStopDateText_2" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden RecordId="2" Runat="server" ID="MedTxStopDate_2" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
     <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,Disease,GTD" style="width:90px;" Field="MedTxAgent" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxAgent_2"  /></td>
    <td><euc:EformTextBox RecordId="2"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_2" style="width:50px;" /></td>
   
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:32px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_2"/>&nbsp;</td>
    <td><euc:EformSelect RecordId="2" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_2" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedRoute"  style="width:65px;" Field="MedTxRoute" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxRoute_2"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_2"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_2"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="MedTxInstitution" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_2"  /><euc:EformTextBox style="display: none;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_2" Runat="server"  /></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
</tr>
<tr style="display: none;">
    <td style="white-space:nowrap;" height="28"><euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxDateText_3" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   /><euc:EformHidden RecordId="3" Runat="server" ID="MedTxDate_3" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space:nowrap;" ><euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxStopDateText_3" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
        <euc:EformHidden RecordId="3" Runat="server" ID="MedTxStopDate_3" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
     <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,Disease,GTD" style="width:90px;" Field="MedTxAgent" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxAgent_3"  /></td>
    <td><euc:EformTextBox RecordId="3"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_3" style="width:50px;" /></td>   
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:32px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_3"/>&nbsp;</td>
    <td><euc:EformSelect RecordId="3" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_3" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedRoute"  style="width:65px;" Field="MedTxRoute" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxRoute_3"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_3"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_3"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="MedTxInstitution" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_3"  /><euc:EformTextBox style="display: none;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_3" Runat="server"  /></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
</tr>
<tr style="display: none;">
    <td style="white-space:nowrap;" height="28"><euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxDateText_4" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="4" Runat="server" ID="MedTxDate_4" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space:nowrap;" ><euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxStopDateText_4" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden RecordId="4" Runat="server" ID="MedTxStopDate_4" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,Disease,GTD" style="width:90px;" Field="MedTxAgent" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxAgent_4"  /></td>
    <td><euc:EformTextBox RecordId="4"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_4" style="width:50px;"/></td>   
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:32px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_4"/>&nbsp;</td>
    <td><euc:EformSelect RecordId="4" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_4" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedRoute"  style="width:65px;" Field="MedTxRoute" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxRoute_4"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_4"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_4"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="MedTxInstitution" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_4"  /><euc:EformTextBox style="display: none;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_4" Runat="server"  /></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
</tr>
<tr style="display: none;">
    <td style="white-space:nowrap;" height="28"><euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxDateText_5" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="5" Runat="server" ID="MedTxDate_5" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space:nowrap;" ><euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxStopDateText_5" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden RecordId="5" Runat="server" ID="MedTxStopDate_5" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,Disease,GTD" style="width:90px;" Field="MedTxAgent" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxAgent_5"  /></td>
    <td><euc:EformTextBox RecordId="5"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_5" style="width:50px;"/></td>   
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:32px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_5"/>&nbsp;</td>
    <td><euc:EformSelect RecordId="5" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_5" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedRoute"  style="width:65px;" Field="MedTxRoute" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxRoute_5"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_5"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_5"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="MedTxInstitution" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_5"  /><euc:EformTextBox style="display: none;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_5" Runat="server"  /></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td style="white-space:nowrap;" height="28"><euc:EformTextBox Runat="server" RecordId="6"  ID="MedTxDateText_6" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="6" Runat="server" ID="MedTxDate_6" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space:nowrap;" ><euc:EformTextBox Runat="server" RecordId="6"  ID="MedTxStopDateText_6" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden RecordId="6" Runat="server" ID="MedTxStopDate_6" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,Disease,GTD" style="width:90px;" Field="MedTxAgent" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxAgent_6"  /></td>
    <td><euc:EformTextBox RecordId="6"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_6" style="width:50px;"/></td>   
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:32px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_6"/>&nbsp;</td>
    <td><euc:EformSelect RecordId="6" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_6" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedRoute"  style="width:65px;" Field="MedTxRoute" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxRoute_6"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_6"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_6"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="MedTxInstitution" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_6"  /><euc:EformTextBox style="display: none;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_6" Runat="server"  /></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td style="white-space:nowrap;" height="28"><euc:EformTextBox Runat="server" RecordId="7"  ID="MedTxDateText_7" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="7" Runat="server" ID="MedTxDate_7" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space:nowrap;" ><euc:EformTextBox Runat="server" RecordId="7"  ID="MedTxStopDateText_7" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden RecordId="7" Runat="server" ID="MedTxStopDate_7" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,Disease,GTD" style="width:90px;" Field="MedTxAgent" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxAgent_7"  /></td>
    <td><euc:EformTextBox RecordId="7"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_7" style="width:50px;"/></td>   
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:32px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_7"/>&nbsp;</td>
    <td><euc:EformSelect RecordId="7" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_7" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedRoute"  style="width:65px;" Field="MedTxRoute" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxRoute_7"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_7"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_7"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="MedTxInstitution" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_7"  /><euc:EformTextBox style="display: none;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_7" Runat="server"  /></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td style="white-space:nowrap;" height="28"><euc:EformTextBox Runat="server" RecordId="8"  ID="MedTxDateText_8" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" /><euc:EformHidden RecordId="8" Runat="server" ID="MedTxDate_8" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td style="white-space:nowrap;" ><euc:EformTextBox Runat="server" RecordId="8"  ID="MedTxStopDateText_8" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden RecordId="8" Runat="server" ID="MedTxStopDate_8" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,Disease,GTD" style="width:90px;" Field="MedTxAgent" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxAgent_8"  /></td>
    <td><euc:EformTextBox RecordId="8"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_8" style="width:50px;"/></td>   
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:32px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_8"/>&nbsp;</td>
    <td><euc:EformSelect RecordId="8" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_8" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedRoute"  style="width:65px;" Field="MedTxRoute" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxRoute_8"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_8"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_8"  /></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="MedTxInstitution" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_8"  /><euc:EformTextBox style="display: none;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_8" Runat="server"  /></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
</tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicalTherapyHtmlTable');" />
<br/>

<div id="QuickEntryMenuContainer" >
    	        <div id="QuickEntryMenuInnerContainer" >
    	            <div id="ChemotherapyItems" class="QuickEntryMenuOn">
    	                <div class="QuickEntryMenuTitle" onclick="toggleQuickEntryMenu('ChemotherapyItems');" style="margin-top: 0px;">Chemotherapy</div>
    	                <span><strong>Methotrexate</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Methotrexate', 'CHEMO', '30', 'mg/m2', 'Intramuscular', '', 'Weekly', 'Memorial Sloan Kettering Cancer Center', 'STD');">30 mg/m2 IM Weekly</a>
                        <a class="HPISubLink" style="margin-left: 28px;" href="javascript: addMedicalTherapy('Methotrexate', 'CHEMO', '50', 'mg/m2', 'Intramuscular', '', 'Weekly', 'Memorial Sloan Kettering Cancer Center', 'STD');">50 mg/m2 IM Weekly</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Methotrexate', 'CHEMO', '1', 'mg/kg', 'Intramuscular', '', 'Days 1,3,5,7', 'Memorial Sloan Kettering Cancer Center', 'STD');">1 mg/kg IM Days 1,3,5,7</a><br />
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Methotrexate', 'CHEMO', '0.4', 'mg/kg', 'Intravenous/Intramuscular', '', 'Days 1-5', 'Memorial Sloan Kettering Cancer Center', 'STD');">0.4 mg/kg IV/IM Days 1-5</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Methotrexate', 'CHEMO', '0.4', 'mg/kg', 'Intravenous', '', 'Days 1-8', 'Memorial Sloan Kettering Cancer Center', 'STD');">0.4 mg/kg IV  Days 1-8</a>
                        </span>
    	                <span><strong>Dactinomycin</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Dactinomycin', 'CHEMO', '0.5', 'mg', 'IV Push', '', 'Days 1-5', 'Memorial Sloan Kettering Cancer Center', 'STD');">0.5 mg Flat Dose IVP Days 1-5</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Dactinomycin', 'CHEMO', '1.25', 'mg', 'IV Push', '', 'Day 1 and Day 14', 'Memorial Sloan Kettering Cancer Center', 'STD');">1.25 mg Flat Dose IVP Day 1 and Day 14</a>
                        </span>
    	                <span><strong>EMA/CO</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('EMA/CO', 'CHEMO', '', '', '', '', '12 hour MTX', 'Memorial Sloan Kettering Cancer Center', 'STD');">12 hour MTX</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('EMA/CO', 'CHEMO', '', '', '', '', '24 hour MTX', 'Memorial Sloan Kettering Cancer Center', 'STD');">24 hour MTX</a>
                        </span>
    	                <span><strong>EMA/EP</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('EMA/EP', 'CHEMO', '', '', '', '', '12 hour MTX', 'Memorial Sloan Kettering Cancer Center', 'STD');">12 hour MTX</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('EMA/EP', 'CHEMO', '', '', '', '', '24 hour MTX', 'Memorial Sloan Kettering Cancer Center', 'STD');">24 hour MTX</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('EMA/EP', 'CHEMO', '', '', '', '', 'Induction EP', 'Memorial Sloan Kettering Cancer Center', 'STD');">Induction EP</a>
                        </span>
    	                <span><strong>Carbo/Taxol</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Taxol', 'CHEMO', '135', 'mg/m2', 'Intravenous', '', 'Every 3 Weeks', 'Memorial Sloan Kettering Cancer Center', 'STD');">Taxol 135 mg/m2 IV Q3 weeks</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Taxol', 'CHEMO', '175', 'mg/m2', 'Intravenous', '', 'Every 3 Weeks', 'Memorial Sloan Kettering Cancer Center', 'STD');">Taxol 175 mg/m2 IV Q3 weeks</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Taxol', 'CHEMO', '60-80', 'mg/m2', 'Intravenous', '', 'Day 1, Day 8, Day 15', 'Memorial Sloan Kettering Cancer Center', 'STD');">Taxol 60-80mg/m2 IV D1,D8,D15</a><br />
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Carboplatin', 'CHEMO', 'AUC 4', '', 'Intravenous', '', 'Day 1', 'Memorial Sloan Kettering Cancer Center', 'STD');">Carboplatin AUC 4 IV D1</a>
                        <a class="HPISubLink" style="margin-left: 37px;" href="javascript: addMedicalTherapy('Carboplatin', 'CHEMO', 'AUC 5', '', 'Intravenous', '', 'Day 1', 'Memorial Sloan Kettering Cancer Center', 'STD');">Carboplatin AUC 5 IV D1</a>
                        <a class="HPISubLink" style="margin-left: 37px;" href="javascript: addMedicalTherapy('Carboplatin', 'CHEMO', 'AUC 6', '', 'Intravenous', '', 'Day 1', 'Memorial Sloan Kettering Cancer Center', 'STD');">Carboplatin AUC 6 IV D1</a>
                        </span>
    	                <span><strong>Bevacizumab</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Bevacizumab', 'CHEMO', '10', 'mg/kg', 'IV Push', '', 'Day 1 and Day 15', 'Memorial Sloan Kettering Cancer Center', 'STD');">10 mg/kg IVP Day 1 and Day 15</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Bevacizumab', 'CHEMO', '15', 'mg/kg', 'IV Push', '', 'Every 3 Weeks', 'Memorial Sloan Kettering Cancer Center', 'STD');">15 mg/kg IVP Q3 weeks</a>
                        </span>
    	                <a href="javascript: addMedicalTherapy('TE/TP', 'CHEMO', '', '', '', '', '', 'Memorial Sloan Kettering Cancer Center', 'STD');">TE/TP</a>
    	                <a href="javascript: addMedicalTherapy('Mitomycin C/Adriamycin/Cyclophosphamide', 'CHEMO', '', '', '', '', '', 'Memorial Sloan Kettering Cancer Center', 'STD');">MAC</a>
    	                <a href="javascript: addMedicalTherapy('Vindesine/Ifosfamide/Cysplatin', 'CHEMO', '', '', '', '', '', 'Memorial Sloan Kettering Cancer Center', 'STD');">VIP</a>
    	                <a href="javascript: addMedicalTherapy('Ifosfamide', 'CHEMO', '1200', 'mg/m2', 'Large Volume Parenteral', '', '', 'Memorial Sloan Kettering Cancer Center', 'STD');">Ifosfamide 1200 mg/m2 LVP</a>
    	                <a href="javascript: addMedicalTherapy('Bleomycin/Etoposide', 'CHEMO', '', '', '', '', '', 'Memorial Sloan Kettering Cancer Center', 'STD');">BEP</a>
    	                <a href="javascript: addMedicalTherapy('', 'CHEMO', '', '', '', '', '', 'Memorial Sloan Kettering Cancer Center', 'STD');">Other Chemotherapy</a>
    	            </div>
    	        
    	        </div>
    	    </div>








<br/><br/><br/>
<script type="text/javascript">
    registerMedTxInputs();
</script>