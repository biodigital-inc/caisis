<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.GUProstateHPI_v2" CodeFile="GUProstateHPI_v2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="treatment" TagName="AdvancedOptions" Src="~/Modules/All/Eforms/TreatmentOptions.ascx" %>



<script type="text/javascript">

function closeHpi(e) {
    blurAllHpiRows();
    sortPopAndNewHPIData();
}
$(document.body).addEvent('click', closeHpi);

var hpiArray = new Array();

function hpiRow(rowId, rowDateString) {
    this.RowId = rowId;
    this.RowDate = new Date(rowDateString);
}
function sortByDate(a, b) {
    var x = a.RowDate;
    var y = b.RowDate;

    if (x > y) return 1;
    if (x < y) return -1;
    return 0;
}

function addHpiRow(hpiTrId,dateString)
{
    hpiArray[hpiArray.length++] = new hpiRow(hpiTrId, dateString);
}

function sortHpiArray()
{
    hpiArray.sort(sortByDate);
}




function showArray()
{
    for (var i = 0; i < hpiArray.length; i++) {
        alert(i + ': ' + hpiArray[i].RowId + ': ' + hpiArray[i].RowDate); 
        }
}

function sortHpiTopTableByArray()
{
    for (var i = 0; i < hpiArray.length; i++)
    {
        var hpiRow = $(hpiArray[i].RowId);
        moveRow(hpiRow, i);
    }
}

function moveRow(hpiRow, targetIndex)
{
    var hpiTable = $('hpiTopTable');
    var hpiTbody = hpiTable.tBodies[0];
    hpiTbody.removeChild(hpiRow); // Remove the row before inserting it (dupliate id's etc.)
    var targetRow = hpiTbody.rows[targetIndex];
    hpiTbody.insertBefore(hpiRow, targetRow);
}

function getDateString(popDataTableRow)
{
    
}

function sortHpiTable()
{
    loadHTMLTableToArray();
}

function loadHTMLTableToArray()
{
    hpiArray.length = 0;

    var hpiTable = $('hpiTopTable');
    var hpiRows = hpiTable.rows;
    var rowDateString = '';
    
    for (i=0;i<hpiRows.length;i++)
    {   
        rowDateString = '';
        if (!(hpiRows[i].style.display && hpiRows[i].style.display == 'none') && hpiRows[i].id != 'hpiMenuTableContainer')
        {
            if (hpiRows[i].className.indexOf('hpiDBRecordRow') > -1)
            {
                rowDateString = getPopulatedRowDate(hpiRows[i]);
                
                addHpiRow(hpiRows[i].id,rowDateString);
            }
            else if (hpiRows[i].className == 'hpiNewRecordRow')
            {
                rowDateString = getNewRowDate(hpiRows[i]);
                addHpiRow(hpiRows[i].id,rowDateString);
            } 
        }
    }
}

function getPopulatedRowDate(hpiRow)
{
//    var contentString = hpiRow.cells[0].getElementsByTagName('table')[0].rows[0].cells[0].innerHTML;
//    var dateString = contentString.substring(0, contentString.indexOf(' '));
  
    var dateString = hpiRow.getElementsByTagName('input')[0].value;
    
    return dateString;
}
function getNewRowDate(hpiRow)
{
    var hpiRowInputs = hpiRow.getElementsByTagName('input');
    var dateString = '';
    
    
    if (hpiRowInputs[0].id.indexOf('DateText') > -1) dateString = hpiRowInputs[0].value;
    
    return dateString;
}


function clearParentHpiRow(element) {
	row = jQuery(element).closest('table').closest('tr').get(0);
	clearAllElementsContainedInNode(row);
//	alert(row.innerHTML);

    if (row.id && row.id.indexOf('MedicalTherapyRow_1') < 0) row.style.display = 'none';
}

function toggleHPIMenu(clickedMenuId)
{
    var clickedMenu = $(clickedMenuId);

    if (clickedMenu.className == 'hpiMenuOn') {clickedMenu.className = 'hpiMenuOff';}
    else
    {
//        $('MostCommonItems').className = 'hpiMenuOff';
//        $('HormoneTherapyItems').className = 'hpiMenuOff';
//        $('ChemotherapyItems').className = 'hpiMenuOff';
//        $('BiologicItems').className = 'hpiMenuOff';
//        $('RadiationTherapyItems').className = 'hpiMenuOff';
//        $('BiopsyItems').className = 'hpiMenuOff';
//        $('SurgeryItems').className = 'hpiMenuOff';
        clickedMenu.className = 'hpiMenuOn';
    }

}

var currentTreatmentTdId = '<asp:Literal ID="currentTx" runat="server" />';
var currentTreatmentDate = '<asp:Literal ID="currentTxDate" runat="server" />';


var hormoneTx = new Array('CASODEX','BICALUTAMIDE','FLUTAMIDE','DEGARELIX','KETOCONAZOLE','LUPRON','NILANDRON','NILUTAMIDE','ZOLADEX','GOSERELIN','ZOLADEX (GOSERELIN)');
var bisphosphonates = new Array('PAMIDRONATE','AREDIA','PAMIDRONATE (AREDIA)','ZOLEDRONIC ACID','ZOMETA','ZOLEDRONIC ACID (ZOMETA)');
var GnRHTx = new Array('LUPRON','ZOLADEX','GOSERELIN','ZOLADEX (GOSERELIN)');
var aaTx = new Array('CASODEX','BICALUTAMIDE','CASODEX (BICALUTAMIDE)','CASODEX WITHDRAWAL','FLUTAMIDE','FLUTAMIDE WITHDRAWAL','DEGARELIX','KETOCONAZOLE','NILANDRON','NILUTAMIDE','NILANDRON (NILUTAMIDE)','NILANDRON WITHDRAWAL');
var immunoTx = new Array('J591','PROVENGE','GM-CSF','IL2','ALDESLEUKIN','IL2 (ALDESLEUKIN)','LEUKINE','SARGRAMOSTIM','LEUKINE (SARGRAMOSTIM)');
var fiveAlphaTx = new Array('PROSCAR');
var steroidTx = new Array('HYDROCORTISONE','PREDNISONE');
var radioisotopeTx = new Array('SAMARIUM');

var medTxUnits_mg = new Array('LUPRON','ZOLEDRONIC ACID','ZOMETA','ZOLEDRONIC ACID (ZOMETA)','CASODEX','BICALUTAMIDE','CASODEX (BICALUTAMIDE)','CASODEX WITHDRAWAL','FLUTAMIDE','FLUTAMIDE WITHDRAWAL','DEGARELIX','KETOCONAZOLE','LUPRON','NILANDRON','NILUTAMIDE','NILANDRON (NILUTAMIDE)','NILANDRON WITHDRAWAL','ZOLADEX','GOSERELIN','ZOLADEX (GOSERELIN)','PROSCAR','CARBOPLATIN','HYDROCORTISONE','PAMIDRONATE','PREDNISONE');
var medTxUnits_mgM2 = new Array('DOCETAXEL','CISPLATIN','MITOMYCIN','MITOXANTRONE','PACLITAXEL','VINBLASTINE','GM-CSF');
var medTxUnits_mbqMl= new Array('SAMARIUM');
var medTxUnits_mgKg= new Array('IL2 (ALDESLEUKIN)','IL2','ALDESLEUKIN');
var medTxUnits_mcgM2= new Array('LEUKINE (SARGRAMOSTIM)','LEUKINE','SARGRAMOSTIM');

var medTxRoute_Intramuscular = new Array('LUPRON');
var medTxRoute_Intravenous = new Array('DOCETAXEL','ZOLEDRONIC ACID','ZOMETA','ZOLEDRONIC ACID (ZOMETA)','CARBOPLATIN','CISPLATIN','MITOMYCIN','MITOXANTRONE','PAMIDRONATE','SAMARIUM','PACLITAXEL','VINBLASTINE','J591','PROVENGE','GM-CSF','IL2','ALDESLEUKIN','IL2 (ALDESLEUKIN)','LEUKINE','SARGRAMOSTIM','LEUKINE (SARGRAMOSTIM)');
var medTxRoute_Orally = new Array('CASODEX','BICALUTAMIDE','CASODEX (BICALUTAMIDE)','FLUTAMIDE','KETOCONAZOLE','NILANDRON','NILUTAMIDE','NILANDRON (NILUTAMIDE)','HYDROCORTISONE','PREDNISONE');
var medTxRoute_Subcutaneous = new Array('DEGARELIX','ZOLADEX','GOSERELIN','ZOLADEX (GOSERELIN)');

var medTxSchedule_Every8Hours = new Array('FLUTAMIDE','KETOCONAZOLE','IL2 (ALDESLEUKIN)','IL2','ALDESLEUKIN');
var medTxSchedule_Daily = new Array('CASODEX','BICALUTAMIDE','CASODEX (BICALUTAMIDE)','NILANDRON','NILUTAMIDE','NILANDRON (NILUTAMIDE)','PREDNISONE','LEUKINE (SARGRAMOSTIM)','LEUKINE','SARGRAMOSTIM');
var medTxSchedule_Every21Days = new Array('LUPRON','ZOLADEX','GOSERELIN','ZOLADEX (GOSERELIN)','DOCETAXEL','MITOXANTRONE');
var medTxSchedule_Every28Days = new Array('DEGARELIX');
var medTxSchedule_Weekly = new Array('VINBLASTINE');
var medTxSchedule_Every2Weeks = new Array('PROVENGE','GM-CSF');
var medTxSchedule_Every3Weeks = new Array('PACLITAXEL');
var medTxSchedule_Every4Weeks = new Array('CARBOPLATIN','CISPLATIN');
var medTxSchedule_Every6Weeks = new Array('ZOLEDRONIC ACID','ZOMETA','ZOLEDRONIC ACID (ZOMETA)','MITOMYCIN');


function getLastGnRHAndBisphosphonate()
{
    var lastBisphosphonate = null;
    var lastBisphosphonateDate = null;
    var lastGnRH = null;
    var lastGnRHDate = null;
    
    var lastBisphosphonateField = $('<% = LastBisphosphonateAgent.ClientID %>');
    var lastBisphosphonateDateField = $('<% = LastBisphosphonateDateText.ClientID %>');
    var lastGnRHField = $('<% = LastGnRHAgent.ClientID %>');
    var lastGnRHDateField = $('<% = LastGnRHDateText.ClientID %>');
    
    var hpiTable = $('hpiTopTable');
    var hpiRows = hpiTable.rows;
    
    
    if (lastBisphosphonateField.value == '' || lastGnRHField.value == '')
    {
        loopHtmlRows:
        for (i=hpiRows.length-1;i>=0;i--)
        {
            if (hpiRows[i].className.indexOf('hpiDBRecordRow') > -1)
            {
            
                if (lastBisphosphonateField.value == '')
                {
                    loopBisphosphonates:
                    for (j=0;j<bisphosphonates.length;j++)
                    {   
                        if (lastBisphosphonate == null && hpiRows[i].innerHTML.toUpperCase().indexOf(bisphosphonates[j]) > -1)
                        {
                            lastBisphosphonate = bisphosphonates[j];
                            lastBisphosphonateDate = getPopulatedRowDate(hpiRows[i]);
                            break loopBisphosphonates;
                        }
                    }
                }
                
                if (lastGnRHField.value == '')
                {
                    loopGnRH:
                    for (k=0;k<GnRHTx.length;k++)
                    {   
                        if (lastGnRH == null && hpiRows[i].innerHTML.toUpperCase().indexOf(GnRHTx[k]) > -1)
                        {
                            lastGnRH = GnRHTx[k];
                            lastGnRHDate = getPopulatedRowDate(hpiRows[i]);
                            break loopGnRH;
                        }
                    }
                }
                
                
                
            }
        }
    
        if (lastBisphosphonate != null && lastBisphosphonateField.value.length < 1) {lastBisphosphonateField.value = lastBisphosphonate;}
        if (lastBisphosphonateDate != null && lastBisphosphonateDateField.value.length < 1) {lastBisphosphonateDateField.value = lastBisphosphonateDate;}
        if (lastGnRH != null && lastGnRHField.value.length < 1) {lastGnRHField.value = lastGnRH;}
        if (lastGnRHDate != null && lastGnRHDateField.value.length < 1) {lastGnRHDateField.value = lastGnRHDate;}
    }    

}


function toggleHpiOptions(layerId, adminLayerId, evt) {
    if(evt) stopBubble(evt);
    var button = $(layerId + '_Toggle');
    var hpiCell = $(layerId + '_HPIOptions');
    var textLayer = $(adminLayerId + '_TextLayer');
    var checkLayer = $(adminLayerId + '_CheckLayer');
    var optionsAreOpen = button.className.indexOf('ToggleOn') > -1;
    button.className = optionsAreOpen ? 'hpiOptionsToggle' : 'hpiOptionsToggleOn';
    textLayer.style.display = !optionsAreOpen ? 'block' : 'none';
 //   checkLayer.style.display = optionsAreOpen ? 'inline' : 'none';
}


function toggleAllProcedures()
{
    var ProstateProcToggle = $('ProstateProcToggle');
    var CystoProcToggle = $('CystoProcToggle');
    
    var NonProstateProcDisplay = ProstateProcToggle.checked ? 'none' : '';
    var OldCystoDisplay = CystoProcToggle.checked ? 'none' : '';
    
    jQuery('.nonProstateProc').css('display', NonProstateProcDisplay);
    jQuery('.oldCysto').css('display', OldCystoDisplay);
    
    
/*
    var hpiTable = $('hpiTopTable');
    var hpiRows = hpiTable.rows;
    for (var i=0;i<hpiRows.length;i++)
	{
	    if (hpiRows[i].className.indexOf("nonProstateProc") > -1) { hpiRows[i].style.display = ProstateProcToggle.checked ? 'none' : ''; }
	    else if (hpiRows[i].className.indexOf("oldCysto") > -1) { hpiRows[i].style.display = CystoProcToggle.checked ? 'none' : ''; }
	}
*/
}


function showHPIRecordData(tableName, primaryKey, show, recordDataHtmlCell) {

    var dataBubble = $('EFormInfoBubble');
    var dataBubbleContentContainer = $('EFormInfoBubbleContent');
    var bubbleContent = ($(('HPIRecordDetailsBubbleContent_' + tableName + '_' + primaryKey)) == null) ? null : $(('HPIRecordDetailsBubbleContent_' + tableName + '_' + primaryKey)).innerHTML;
    var PDFormDivVertAdjustment = ($('PDFormDiv') != null) ? (66 - $('PDFormDiv').scrollTop) : 30;
    var PDFormDivHorizAdjustment = ($('PDFormDiv') != null) ? (240) : 40;
     if (show && bubbleContent != null ) {
        dataBubbleContentContainer.innerHTML = bubbleContent;
        dataBubble.style.top = ((findPos(recordDataHtmlCell).y - PDFormDivVertAdjustment) + 'px');
        dataBubble.style.left = ((findPos(recordDataHtmlCell).x - PDFormDivHorizAdjustment) + 'px');
        dataBubble.style.display = 'block';
    }
    else {
        dataBubble.style.display = 'none';
    }
}
function populateExpectantObservationDate(cbox)
{
    var DateTextField = $('<% = StatusDateText_6.ClientID %>');
    var DateField = $('<% = StatusDate_6.ClientID %>');
    var currentDate = '<% = DateTime.Now.ToString("MM/dd/yyyy") %>';
    if (cbox.checked)
    {
        DateTextField.value = currentDate;
        DateField.value = currentDate;
    }
    else
    {
        DateTextField.value = '';
        DateField.value = '';
    }
    

}


function setMedTxCondition(medTxItem, medTxDate, lastAdminDate, triggerType, triggerCBoxID, index, isPopulatedRow, e)
{
    var MedTxConditionCBox = $(triggerCBoxID);
    
    jQuery('.' + triggerType).attr('checked', false);
    jQuery('.' + triggerType).removeClass(triggerType);
    

    switch (triggerType) {
       case 'CurrentTreatment':
            var currentTxDateText = $('<% = CurrentMedTx_DateText.ClientID %>');
            var currentTxDate = $('<% = CurrentMedTx_Date.ClientID %>');
            var currentTxAgent = $('<% = CurrentMedTx_Agent.ClientID %>');
            var CurrentTreatmentIndex = $('<% = CurrentTreatmentIndex.ClientID %>');
            var CurrentTreatmentDetailsRow = jQuery(MedTxConditionCBox).closest('tr').next();
          if (MedTxConditionCBox.checked)
          {
                currentTxDateText.value = medTxDate;
                currentTxDate.value = medTxDate;
                currentTxAgent.value = medTxItem;
                CurrentTreatmentIndex.value = index;
                jQuery(MedTxConditionCBox).addClass(triggerType);
                jQuery(MedTxConditionCBox).closest('td').addClass(triggerType);
                CurrentTreatmentDetailsRow.css('display', '');
          }
          else
          {
                currentTxDateText.value = '';
                currentTxDate.value = '';
                currentTxAgent.value = '';
                CurrentTreatmentIndex.value = 'none';
                CurrentTreatmentDetailsRow.css('display', 'none');
                clearCurrentTreatmentDetails();
          }
          break;
       case 'LastGnRH':
            var LastGnRHDateText = $('<% = LastGnRHDateText.ClientID %>');
            var LastGnRHDate = $('<% = LastGnRHDateText.ClientID %>');
            var LastGnRHAgent = $('<% = LastGnRHAgent.ClientID %>');
            var LastGnRHIndex = $('<% = LastGnRHIndex.ClientID %>');
          if (MedTxConditionCBox.checked)
          {
                LastGnRHDateText.value = lastAdminDate;
                LastGnRHDate.value = lastAdminDate;
                LastGnRHAgent.value = medTxItem;
                LastGnRHIndex.value = index;
                jQuery(MedTxConditionCBox).addClass(triggerType);
                jQuery(MedTxConditionCBox).closest('td').addClass(triggerType);
//                if (MedTxConditionCBox.parentNode.nodeName == 'TD') jQuery(MedTxConditionCBox.parentNode).addClass(triggerType);
          }
          else
          {
                LastGnRHDateText.value = '';
                LastGnRHDate.value = '';
                LastGnRHAgent.value = '';
                LastGnRHIndex.value = 'none';
          }
       
          break;
       case 'LastBisphosphonate':
            var LastBisphosphonateDateText = $('<% = LastBisphosphonateDateText.ClientID %>');
            var LastBisphosphonateDate = $('<% = LastBisphosphonateDate.ClientID %>');
            var LastBisphosphonateAgent = $('<% = LastBisphosphonateAgent.ClientID %>');
            var LastBisphosphonateIndex = $('<% = LastBisphosphonateIndex.ClientID %>');
          if (MedTxConditionCBox.checked)
          {
                LastBisphosphonateDateText.value = lastAdminDate;
                LastBisphosphonateDate.value = lastAdminDate;
                LastBisphosphonateAgent.value = medTxItem;
                LastBisphosphonateIndex.value = index;
                jQuery(MedTxConditionCBox).addClass(triggerType);
                jQuery(MedTxConditionCBox).closest('td').addClass(triggerType);
//                if (MedTxConditionCBox.parentNode.nodeName == 'TD') jQuery(MedTxConditionCBox.parentNode).addClass(triggerType);
          }
          else
          {
                LastBisphosphonateDateText.value = '';
                LastBisphosphonateDate.value = '';
                LastBisphosphonateAgent.value = '';
                LastBisphosphonateIndex.value = 'none';
          }
       
          break;
       default:
       
    }
//      alert(MedTxConditionCBox.className);
    stopBubble(e);
    e.returnValue = true;
}



function setMedTxConditionNewData(triggerCBox, index, isPopulatedRow, e)
{
    var triggerType = 'CurrentTreatment';
    
    var MedTxRow = $('MedicalTherapyRow_' + index.toString());
    var jMedTxRow = jQuery(MedTxRow);
    
    var medTxItem = jMedTxRow.find('.MedTxAgent').val();
    var medTxDate = jMedTxRow.find('.MedTxDateText').val();
    var lastAdminDate = jMedTxRow.find('.MedTxAdminStartDateText').val();
    
    var CurrentTreatmentDetailsRow = jMedTxRow.find('.CurrentTreatmentDetailsRow');
    
    var MedTxConditionCBox = triggerCBox;
    if (triggerCBox.className != null && triggerCBox.className.length > 0) triggerType = triggerCBox.className.toString();
    
    // uncheck all other things with same class    
    jQuery('.' + triggerType).each(function(index, value) { 
        if (this !== triggerCBox)
        {
            jQuery(this).attr('checked', false);
            jQuery(this).removeClass(triggerType);
        }
    });
    

    
    var medTxDose = jMedTxRow.find('.MedTxDose').val();
    var medTxUnits = jMedTxRow.find('.MedTxUnitsContainer input').val();
    var medTxSchedule = jMedTxRow.find('.MedTxSchedule').val();

    switch (triggerType) {
       case 'CurrentTreatment':
            var currentTxDateText = $('<% = CurrentMedTx_DateText.ClientID %>');
            var currentTxDate = $('<% = CurrentMedTx_Date.ClientID %>');
            var currentTxAgent = $('<% = CurrentMedTx_Agent.ClientID %>');
            var CurrentTreatmentIndex = $('<% = CurrentTreatmentIndex.ClientID %>');

          if (MedTxConditionCBox.checked)
          {
                currentTxDateText.value = medTxDate;
                currentTxDate.value = medTxDate;
                
                
                currentTxAgent.value = medTxItem + ' ' + medTxDose + medTxUnits + ' ' + medTxSchedule;
                CurrentTreatmentIndex.value = 'new_' + index;
                jQuery(MedTxConditionCBox).addClass(triggerType);
                jQuery(MedTxConditionCBox).closest('td').addClass(triggerType);
                CurrentTreatmentDetailsRow.css('display', '');
                
                
                var CurrentMedTx_CyclePerWeek = $('<% = CurrentMedTx_CyclePerWeek.ClientID %>');
                var CurrentMedTx_ProtocolNum = $('<% = CurrentMedTx_ProtocolNum.ClientID %>');

                CurrentMedTx_CyclePerWeek.value = jMedTxRow.find('.MedTxCyclesPerWeek').val();
                CurrentMedTx_ProtocolNum.value = jMedTxRow.find('.MedTxProtocolNum').val();

                
          }
          else
          {
                currentTxDateText.value = '';
                currentTxDate.value = '';
                currentTxAgent.value = '';
                CurrentTreatmentIndex.value = 'none';
                CurrentTreatmentDetailsRow.css('display', 'none');
                clearCurrentTreatmentDetails();
          }
          break;
       case 'LastGnRH':
            var LastGnRHDateText = $('<% = LastGnRHDateText.ClientID %>');
            var LastGnRHDate = $('<% = LastGnRHDateText.ClientID %>');
            var LastGnRHAgent = $('<% = LastGnRHAgent.ClientID %>');
            var LastGnRHIndex = $('<% = LastGnRHIndex.ClientID %>');
          if (MedTxConditionCBox.checked)
          {
                LastGnRHDateText.value = lastAdminDate;
                LastGnRHDate.value = lastAdminDate;
                LastGnRHAgent.value = medTxItem + ' ' + medTxDose + medTxUnits;
                LastGnRHIndex.value = index;
                jQuery(MedTxConditionCBox).addClass(triggerType);
                jQuery(MedTxConditionCBox).closest('td').addClass(triggerType);
          }
          else
          {
                LastGnRHDateText.value = '';
                LastGnRHDate.value = '';
                LastGnRHAgent.value = '';
                LastGnRHIndex.value = 'none';
          }
       
          break;
       case 'LastBisphosphonate':
            var LastBisphosphonateDateText = $('<% = LastBisphosphonateDateText.ClientID %>');
            var LastBisphosphonateDate = $('<% = LastBisphosphonateDate.ClientID %>');
            var LastBisphosphonateAgent = $('<% = LastBisphosphonateAgent.ClientID %>');
            var LastBisphosphonateIndex = $('<% = LastBisphosphonateIndex.ClientID %>');
          if (MedTxConditionCBox.checked)
          {
                LastBisphosphonateDateText.value = lastAdminDate;
                LastBisphosphonateDate.value = lastAdminDate;
                LastBisphosphonateAgent.value = medTxItem + ' ' + medTxDose + medTxUnits;
                LastBisphosphonateIndex.value = index;
                jQuery(MedTxConditionCBox).addClass(triggerType);
                jQuery(MedTxConditionCBox).closest('td').addClass(triggerType);
          }
          else
          {
                LastBisphosphonateDateText.value = '';
                LastBisphosphonateDate.value = '';
                LastBisphosphonateAgent.value = '';
                LastBisphosphonateIndex.value = 'none';
          }
       
       
          break;
       default:
       
    }
//      alert(MedTxConditionCBox.className);

    if (e)
    {
        stopBubble(e);
        e.returnValue = true;
    }
}


function showHpiMenu()
{
    var hpiMenuContainer = $('hpiMenuContainer');
    hpiMenuContainer.style.display = 'block';
    
}

function setCurrentTreatmentDetails(tBox, tBoxType)
{
    var CurrentMedTx_CyclePerWeek = $('<% = CurrentMedTx_CyclePerWeek.ClientID %>');
    var CurrentMedTx_ProtocolNum = $('<% = CurrentMedTx_ProtocolNum.ClientID %>');
    
//    alert(tBox.id + ', ' + tBoxType);
    
    switch (tBoxType)
    {
       case 'CyclesPerWeek':
            CurrentMedTx_CyclePerWeek.value = tBox.value;
          break;
       case 'ProtocolNum':
            CurrentMedTx_ProtocolNum.value = tBox.value;
          break;
       default:
       
          break;
    }
}

function clearCurrentTreatmentDetails()
{
    var CurrentMedTx_CyclePerWeek = $('<% = CurrentMedTx_CyclePerWeek.ClientID %>');
    var CurrentMedTx_ProtocolNum = $('<% = CurrentMedTx_ProtocolNum.ClientID %>');
    
    CurrentMedTx_CyclePerWeek.value = '';
    CurrentMedTx_ProtocolNum.value = '';
}


function SetMedTxDefaults(medTxInputContainer, e, recordId)
{
    var MedTxRow = $('MedicalTherapyRow_' + recordId.toString());
    var jMedTxRow = jQuery(MedTxRow);
    var medTxItem = jMedTxRow.find('.MedTxAgent').val();
    var medTxTypeField = jMedTxRow.find('.MedTxType');
    var triggerType = '';
    var medTxType = '';
    var MedTxSpecialStatusType = jMedTxRow.find('.MedTxSpecialStatusType')[0];
    var MedTxSpecialStatusYesNo = jMedTxRow.find('.MedTxSpecialStatusYesNo')[0];
    if (MedTxSpecialStatusYesNo != null && MedTxSpecialStatusYesNo.tagName != 'INPUT') 
    {   
        MedTxSpecialStatusYesNo = jMedTxRow.find('.MedTxSpecialStatusYesNo input')[0];
    }
    
    
    
/*    
    var medTxInput = (medTxInputContainer.tagName == 'INPUT') ?  medTxInputContainer.className : jQuery(medTxInputContainer).find('input')[0].className;
    var initiatedByAgent = false;
    if (medTxInput == 'MedTxAgent' || e.type == 'focus') initiatedByAgent = true;
*/    
    
    
    if (medTxItem.length > 0)
    {
    
        if (jQuery.inArray(medTxItem.toUpperCase(), GnRHTx) > -1)
        {
            if (MedTxSpecialStatusType.value != 'Last GnRH')
            {
                MedTxSpecialStatusType.value = 'Last GnRH';
                MedTxSpecialStatusYesNo.checked = false;
            }
                triggerType = 'LastGnRH';
        }
        else if (jQuery.inArray(medTxItem.toUpperCase(), bisphosphonates) > -1)
        {
            if (MedTxSpecialStatusType.value != 'Last Bisphosphonate')
            {
                MedTxSpecialStatusType.value = 'Last Bisphosphonate';
                MedTxSpecialStatusYesNo.checked = false;
            }
                triggerType = 'LastBisphosphonate';
        }
        else
        {
            if (MedTxSpecialStatusType.value != 'Current Treatment')
            {
                MedTxSpecialStatusType.value = 'Current Treatment';
                MedTxSpecialStatusYesNo.checked = false;
            }
                triggerType = 'CurrentTreatment';
        }
        
        jQuery(MedTxSpecialStatusYesNo).addClass(triggerType);
 //       jQuery(MedTxSpecialStatusYesNo).closest('td').addClass(triggerType);



        // set medTxType - not necessary to check if empty first
        medTxType = getMedTxDefault_Type(medTxItem);
        medTxTypeField.val(medTxType);
        
        // set units
       var medTxUnitsField = jMedTxRow.find('.MedTxUnitsContainer input');
        if (medTxUnitsField.val().length < 1) // initiatedByAgent || 
        {
           var medTxUnits = getMedTxDefault_Units(medTxItem);
           medTxUnitsField.val(medTxUnits);
        }
        
        // set route
       var medTxRouteField = jMedTxRow.find('.MedTxRouteContainer input');
        if (medTxRouteField.val().length < 1) // initiatedByAgent || 
        {
           var medTxRoute = getMedTxDefault_Route(medTxItem);
           medTxRouteField.val(medTxRoute);
        }
        
        
        // set schedule
       var medTxScheduleField = jMedTxRow.find('.MedTxSchedule');
        if (medTxScheduleField.val().length < 1) // initiatedByAgent || 
        {
           var medTxSchedule = getMedTxDefault_Schedule(medTxItem);
           medTxScheduleField.val(medTxSchedule);
        }
    
    }
    else
    {
        medTxTypeField.val('');
        MedTxSpecialStatusType.value = '';
        jQuery(MedTxSpecialStatusYesNo).removeClass();
        jQuery(MedTxSpecialStatusYesNo).closest('td').removeClass();

    }
    
    
    
    // copy to current tx fields if necessary
    if (MedTxSpecialStatusYesNo.checked) setMedTxConditionNewData(MedTxSpecialStatusYesNo, recordId, false, e);
    

}


function getMedTxDefault_Type(agent)
{
    var medTxType = '';
    
    if (agent.length > 0)
    {
        var agentUpper = agent.toUpperCase();
        if (jQuery.inArray(agentUpper, bisphosphonates) > -1)
        {
            medTxType = 'BISPHOSPHONATES';
        }
        else if (jQuery.inArray(agentUpper, GnRHTx) > -1)
        {
            medTxType = 'LHRH';
        }
        else if (jQuery.inArray(agentUpper, aaTx) > -1)
        {
            medTxType = 'AA';
        }
        else if (jQuery.inArray(agentUpper, immunoTx) > -1)
        {
            medTxType = 'IMMUNO';
        }
        else if (jQuery.inArray(agentUpper, fiveAlphaTx) > -1)
        {
            medTxType = '5_ALPHA';
        }
        else if (jQuery.inArray(agentUpper, steroidTx) > -1)
        {
            medTxType = 'STEROID';
        }
        else if (jQuery.inArray(agentUpper, radioisotopeTx) > -1)
        {
            medTxType = 'RADIOISOTOPE';
        }
        else
        {
            medTxType = 'CHEMO';
        }
    }
    
    return medTxType;

}


function getMedTxDefault_Units(agent)
{
    var medTxUnits = '';
        
    if (agent.length > 0)
    {
        var agentUpper = agent.toUpperCase();
        if (jQuery.inArray(agentUpper, medTxUnits_mg) > -1)
        {
            medTxUnits = 'mg';
        }
        else if (jQuery.inArray(agentUpper, medTxUnits_mgM2) > -1)
        {
            medTxUnits = 'mg/m2';
        }
        else if (jQuery.inArray(agentUpper, medTxUnits_mbqMl) > -1)
        {
            medTxUnits = 'MBq/ml';
        }
        else if (jQuery.inArray(agentUpper, medTxUnits_mgKg) > -1)
        {
            medTxUnits = 'mg/kg';
        }
        else if (jQuery.inArray(agentUpper, medTxUnits_mcgM2) > -1)
        {
            medTxUnits = 'mcg/m2';
        }
    }
    
    return medTxUnits;
    
}


function getMedTxDefault_Route(agent)
{
    var medTxRoute = '';
        
    if (agent.length > 0)
    {
        var agentUpper = agent.toUpperCase();
        if (jQuery.inArray(agentUpper, medTxRoute_Intramuscular) > -1)
        {
            medTxRoute = 'Intramuscular';
        }
        else if (jQuery.inArray(agentUpper, medTxRoute_Intravenous) > -1)
        {
            medTxRoute = 'Intravenous';
        }
        else if (jQuery.inArray(agentUpper, medTxRoute_Orally) > -1)
        {
            medTxRoute = 'Orally';
        }
        else if (jQuery.inArray(agentUpper, medTxRoute_Subcutaneous) > -1)
        {
            medTxRoute = 'Subcutaneous';
        }
    }
    
    return medTxRoute;
    
}


function getMedTxDefault_Schedule(agent)
{
    var medTxSchedule = '';
        
    if (agent.length > 0)
    {
        var agentUpper = agent.toUpperCase();
        if (jQuery.inArray(agentUpper, medTxSchedule_Every8Hours) > -1)
        {
            medTxSchedule = 'Every 8 Hours';
        }
        else if (jQuery.inArray(agentUpper, medTxSchedule_Daily) > -1)
        {
            medTxSchedule = 'Daily';
        }
        else if (jQuery.inArray(agentUpper, medTxSchedule_Every21Days) > -1)
        {
            medTxSchedule = 'Every 21 Days';
        }
        else if (jQuery.inArray(agentUpper, medTxSchedule_Every28Days) > -1)
        {
            medTxSchedule = 'Every 28 Days';
        }
        else if (jQuery.inArray(agentUpper, medTxSchedule_Weekly) > -1)
        {
            medTxSchedule = 'Weekly';
        }
        else if (jQuery.inArray(agentUpper, medTxSchedule_Every2Weeks) > -1)
        {
            medTxSchedule = 'Every 2 Weeks';
        }
        else if (jQuery.inArray(agentUpper, medTxSchedule_Every3Weeks) > -1)
        {
            medTxSchedule = 'Every 3 Weeks';
        }
        else if (jQuery.inArray(agentUpper, medTxSchedule_Every4Weeks) > -1)
        {
            medTxSchedule = 'Every 4 Weeks';
        }
        else if (jQuery.inArray(agentUpper, medTxSchedule_Every6Weeks) > -1)
        {
            medTxSchedule = 'Every 6 Weeks';
        }
    }
    
    return medTxSchedule;
    
}


function preSetCheckBoxStyleNewData()
{
    
    for (var i=1;i<=11;i++)
	{
        var MedTxRow = $('MedicalTherapyRow_' + i.toString());
        var jMedTxRow = jQuery(MedTxRow);
	
        var MedTxSpecialStatusYesNo = jMedTxRow.find('.MedTxSpecialStatusYesNo')[0];
        if (MedTxSpecialStatusYesNo != null && MedTxSpecialStatusYesNo.tagName != 'INPUT') 
        {   
 //           alert(MedTxSpecialStatusYesNo.tagName);
            MedTxSpecialStatusYesNo = jMedTxRow.find('.MedTxSpecialStatusYesNo input')[0];
        }
    
        if (MedTxSpecialStatusYesNo != null)
        {
            var MedTxSpecialStatusType = jMedTxRow.find('.MedTxSpecialStatusType')[0];
            var statusClass = jQuery(MedTxSpecialStatusType).val().replace(' ', '');
            jQuery(MedTxSpecialStatusYesNo).addClass(statusClass);
            
            if (MedTxSpecialStatusYesNo.checked)
            {
                jQuery(MedTxSpecialStatusYesNo).closest('td').addClass(statusClass);
                
                if (statusClass == 'CurrentTreatment')
                {
                    var CurrentTreatmentDetailsRow = jMedTxRow.find('.CurrentTreatmentDetailsRow');
                    CurrentTreatmentDetailsRow.css('display', '');
                }
            }
        }
    }
}

  function addNewAdmin(url, table, key, rowIndex, clientCallback, evt) {
  
          var isChecked = true;
          var dateInputID = rowIndex + '_AdminDateText';
          var lastAdminDisplayID = rowIndex + '_ExistingAdmin';
          var lastAdminContainerID = rowIndex + '_ExistingAdminContainer';

          // create request parms
          var params = new Param();
          params.add("table", table);
          params.add("key", key);
          params.add("checked", isChecked.toString());
          // set date param
          var dateField = document.getElementById(dateInputID);
          if (dateField && dateField.value != "") {
              params.add("date", dateField.value);
              
              var callback = curry(processNewAdminCallback, clientCallback, dateField.value, rowIndex);
              // make ajax callback to stop record
              AjaxManager.MakeRequest("POST", url, params, callback, true);
          }
          // prevent further event handling upwards
          stopBubble(evt);
          // set checkbox state
//          if (dateField) { dateField.style.backgroundColor = '#330000'; }
  }




  function processNewAdminCallback(clientCallback, dateVal, rowIndex, text, xml) {
      if (text && text != '') {
          
          var dateDisplay = document.getElementById(rowIndex + '_ExistingAdmin');
          var dateDisplayContainer = document.getElementById(rowIndex + '_ExistingAdminContainer');
          var LastAdminInput = document.getElementById('LastAdmin_' + rowIndex);
          var AddAdminButton = document.getElementById(rowIndex + '_AddAdminButton');
          var NewAdminContainer = document.getElementById(rowIndex + '_NewAdminContainer');
      
          dateDisplay.innerHTML = dateVal.toString();
          dateDisplayContainer.style.display = 'inline';
          NewAdminContainer.style.display = 'none';
          
          AddAdminButton.src = '<%= Page.ResolveUrl("~/Images/EFormHPIButton_AddNew.png")%>';
          LastAdminInput.value = dateVal.toString();
          
          var  medTxCheckboxTd = jQuery(AddAdminButton).closest('td').next().get(0);
          var medTxCheckbox = medTxCheckboxTd.getElementsByTagName('input')[0];
          
          if (medTxCheckbox.checked && medTxCheckbox.className != null && medTxCheckbox.className.length > 0)
          {
              var triggerType = medTxCheckbox.className;
                switch (triggerType) {
                   case 'LastGnRH':
                        var LastGnRHDateText = $('<% = LastGnRHDateText.ClientID %>');
                        var LastGnRHDate = $('<% = LastGnRHDateText.ClientID %>');
                            LastGnRHDateText.value = dateVal.toString();
                            LastGnRHDate.value = dateVal.toString();
                          break;
                   case 'LastBisphosphonate':
                        var LastBisphosphonateDateText = $('<% = LastBisphosphonateDateText.ClientID %>');
                        var LastBisphosphonateDate = $('<% = LastBisphosphonateDate.ClientID %>');
                            LastBisphosphonateDateText.value = dateVal.toString();
                            LastBisphosphonateDate.value = dateVal.toString();
                          break;
                   default:
                          break;
                }
          }
          

      }
  }

function toggleLastAdmin(ExistingAdminContainerID, NewAdminContainerID, evt)
{
    var ExistingAdminContainer = $(ExistingAdminContainerID);
    var NewAdminContainer = $(NewAdminContainerID);
    
    ExistingAdminContainer.style.display = 'none';
    NewAdminContainer.style.display = 'inline';
    
    stopBubble(evt);
}

</script>



<style type="text/css">




.hpiTopTable
{
	border: solid 1px #cccccc;
	border-bottom: none;
	width: 700px;
	z-index: 10;
<%--	border-collapse: collapse;--%>
}
.hpiRecordTable
{
	
}

.hpiDBRecordRow td
{	
	background: #F1F3F4; /* for non-css3 browsers */

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#E0E4E6', endColorstr='#F1F3F4'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #E0E4E6),
		color-stop(1, #F1F3F4)
	);
	background-image: -moz-linear-gradient(
		center top,
		#E0E4E6 0%,
		#F1F3F4 100%
	);

	border-bottom: solid 1px #cccccc;
	
	
}
.hpiDBRecordRow td:hover
{	
	background: #EED2D9; /* for non-css3 browsers */

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #D0C9D1),
		color-stop(0.47, #DBA5B2),
		color-stop(1, #EED2D9)
	);
	background-image: -moz-linear-gradient(
		center top,
		#D0C9D1 0%,
		#DBA5B2 47%,
		#EED2D9 100%
	);


	border-bottom: solid 1px #cccccc;
	
	cursor: pointer;
	
}
.hpiNewRecordRow>td
{
    border-left: solid 2px #3D556D;
}
.hpiNewRecordRow td
{	
	background: #F1F3F4; /* for non-css3 browsers */

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#E0E4E6', endColorstr='#F1F3F4'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #E0E4E6),
		color-stop(1, #F1F3F4)
	);
	background-image: -moz-linear-gradient(
		center top,
		#E0E4E6 0%,
		#F1F3F4 100%
	);

	border-bottom: solid 1px #cccccc;
	
	white-space: nowrap;
	

	
}
.hpiTopTable tr.hpiNewRecordRow td:hover
{	
	background: #dddddd;
	background-image: none;
	filter: none;


	border-bottom: solid 1px #cccccc;
	
	cursor: pointer;
	
}
.hpiTopTable input
{
	height: 14px;
}
.hpiTopTable tr.hpiNewRecordRow td input
{
/*
	background-color: transparent;
	border: solid 1px transparent;
*/
	background-color: #ffffff;
	border: solid 1px #999999;
	
	cursor: pointer;
}
.hpiTopTable tr.hpiNewRecordRow td:hover input
{
	background-color: #ffffff;
	border: solid 1px #999999;
	
	cursor: pointer;
}
.hpiTopTable tr.hpiNewRecordRow td img
{
/*    visibility: hidden;
*/
}
.hpiTopTable tr.hpiNewRecordRow td:hover img
{
    visibility: visible;
}
.hpiTopTable tr.hpiNewRecordRow td div.hpiNewRecordRowTitle
{
	display: none;
}
.hpiTopTable tr.hpiNewRecordRow td:hover div.hpiNewRecordRowTitle
{
	display: none;
/*	display: block;
	background-color: #8d2a2c; color: #ffffff;
	margin-top: -30px;
	z-index: 200;
*/
}
.hpiTopTable tr.hpiNewRecordRow td tr.hpiNewRecordRowHeader
{
	display: none;
}

.hpiTopTable tr.hpiNewRecordRow td:hover tr.hpiNewRecordRowHeader
{
	display: none;
/*
	display: table-row;
	*display: block;
	background-color: #dddddd;
*/
}
.hpiRecordTable td
{	

	background-color: transparent; /* for non-css3 browsers */

	filter: none;
	background-image: none;

	border-bottom: solid 1px transparent;
	
	padding: 4px 3px 4px 3px;
	
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 13px;
	font-weight: normal;
	
	color: #333333;
	
	vertical-align: top;
	
	min-width: 60px;
}
.hpiRecordTable td.hpiDateColumn
{	
	width: 100px;
	border-right: solid 1px #dddddd;
/*    background-image: url(../../Images/NewHpiItemDateWidget.png); */
    background-repeat: no-repeat;
    background-position: -1px center;
}
.hpiTopTable td:hover table.hpiRecordTable td
{	
	color: #000000;
}

.hpiTopTable td div.hpiRecordHeaderColumn
{
	
	display: none;
}

.hpiTopTable td:hover div.hpiRecordHeaderColumn
{
	display: none;
/*
	position: relative;
	
	width: 111%;
	
	z-index: 100;
	
	margin-top: -30px;
	margin-left: -7px;
	margin-bottom: 7px;
	*margin-bottom: 0px;
	height: 17px;
	padding-top: 4px;
	background-color: #bbbbbb; 
	color: #111111;
	
	text-align: center;
	vertical-align: middle;
	
	
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height: 10px;
	font-weight: bold;
	
	border: solid 1px #dddddd;
	
	display: block;
*/
}

.hpiTopTable tr.hpiNewRecordRowActive td
{	
	background: #dddddd;
	background-image: none;
	filter: none;

	white-space: nowrap;

	border-bottom: solid 1px #cccccc;
	
}

.hpiTopTable tr.hpiNewRecordRowActive td input
{
	background-color: #ffffff;
	border: solid 1px #999999;
	
}

.hpiTopTable tr.hpiNewRecordRowActive td img
{
    visibility: visible;
}

.hpiTopTable tr.hpiNewRecordRowActive td div.hpiNewRecordRowTitle
{
	display: block;
	background-color: #3D556D; color: #ffffff;
	margin-top: -30px;
	z-index: 200;
}

.hpiTopTable tr.hpiNewRecordRowActive td tr.hpiNewRecordRowHeader
{
	display: table-row;
	*display: block;
	background-color: #dddddd;
}

.hpiTopTable tr.hpiNewRecordRowActive td div.hpiRecordHeaderColumn
{

	position: relative;
	
	width: 111%;
	
	z-index: 100;
	
	margin-top: -30px;
	margin-left: -3px;
	margin-bottom: 7px;
	*margin-bottom: 0px;
	height: 17px;
	padding-top: 7px;
	background-color: #bbbbbb; 
	color: #111111;
	
	text-align: center;
	vertical-align: middle;
	
	
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height: normal;
	font-weight: bold;
	
	border: solid 1px #dddddd;
	
	display: block;
}
.hpiTopTable td div.hpiRecordTitleBar
{
	display: none;
}
.hpiTopTable td:hover div.hpiRecordTitleBar
{
	display: none;
}
.hpiTopTable tr.hpiNewRecordRowActive td div.hpiRecordTitleBar
{

	position: relative;
	
	width: 99%;
	
	z-index: 400;
	
	margin-top: -43px;
	margin-left: -1px;
	margin-bottom: 20px;
	*margin-bottom: 20px;
	height: 17px;
	padding-top: 4px;
	padding-left: 6px;
	background-color: #3D556D; 
	color: #ffffff;
	
	text-align: left;
	vertical-align: middle;
	
	
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	line-height: normal;
	font-weight: bold;
	
	border: solid 1px #dddddd;
	
	display: block;
}
.hpiMenuTable
{
    width: 100%;
}
.hpiMenuTable td
{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: normal;
	font-weight: normal;
	
	border: solid 1px #dddddd;
	vertical-align: top;
	padding: 0px;
}
.hpiMenuTable td h1
{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	line-height: normal;
	font-weight: bold;
	
	background-color: #00668d;
	color: #ffffff;
	margin-bottom: 5px;
	padding: 3px;

}
.hpiMenuTable td a
{
    display: compact; 
	padding: 3px;
	text-decoration: none;
	font-size: 11px;
}
.hpiMenuTable td a:hover
{
    display: compact; 
    background-color: #efefef;
    color: #8d2a2c;
	text-decoration: underline;
	font-size: 11px;
}

.HPIDeleteButton
{
    cursor: pointer;
    vertical-align: middle;
    margin-top: 1px;
}



td.hpiDBMultiRecordInnerCell
{	
	background: #F1F3F4; /* for non-css3 browsers */

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#E0E4E6', endColorstr='#F1F3F4'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #E0E4E6),
		color-stop(1, #F1F3F4)
	);
	background-image: -moz-linear-gradient(
		center top,
		#E0E4E6 0%,
		#F1F3F4 100%
	);

	border-right: solid 1px #d8d8d8;
	
	min-width: 50px;
	
}
td.hpiDBMultiRecordInnerCell:hover
{	
	background: #EED2D9; /* for non-css3 browsers */

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #D0C9D1),
		color-stop(0.47, #DBA5B2),
		color-stop(1, #EED2D9)
	);
	background-image: -moz-linear-gradient(
		center top,
		#D0C9D1 0%,
		#DBA5B2 47%,
		#EED2D9 100%
	);


	border-right: solid 1px #dddddd;
	
	cursor: pointer;
	
	min-width: 50px;
}

#hpiMenuContainer
{
    margin: 5px 100px 0px 0px;
    background-image: url(../../Images/AddHPIItemBG.png);
    background-repeat: no-repeat;
    padding-top: 9px;
    padding-left: 83px;
    min-height: 150px;
}
#hpiMenuInnerContainer
{
    border: solid 1px #3D556D;
    background-color: #ffffff;
}

div.hpiMenuOn div.hpiMenuTitle
{
    margin-top: 1px;
    background-color: #9BA8B5;
    background-image: url(../../Images/HPIMenuWidgetMinus.gif);
    background-position: left center;
    background-repeat: no-repeat;
    color: #ffffff;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: normal;
	font-weight: bold;
	padding: 3px 7px 3px 18px;
	cursor: pointer;
}
div.hpiMenuOn div.hpiMenuTitle:hover
{
    background-color: #81909E;
}


div.hpiMenuOn a
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
div.hpiMenuOn a:hover
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

div.hpiMenuOn a.HPISubLink
{
    display: inline;
    color: #333333;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height: normal;
	font-weight: normal;
	padding: 3px 3px 3px 3px;
	margin-left: 5px; margin-right: 5px;
	cursor: pointer;
	text-decoration: none;
}
div.hpiMenuOn a.HPISubLink:hover
{
    display: inline;
    background-color: #efefef;
    color: #8d2a2c;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height: normal;
	font-weight: normal;
	padding: 3px 3px 3px 3px;
	margin-left: 5px; margin-right: 5px;
	cursor: pointer;
	text-decoration: underline;
}
div.hpiMenuOn span
{
    display: block;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	line-height: normal;
	font-weight: bold;
	padding: 3px 7px 3px 14px;

}






div.hpiMenuOff div.hpiMenuTitle
{
    margin-top: 1px;
    background-color: #9BA8B5;
    background-image: url(../../Images/HPIMenuWidgetPlus.gif);
    background-position: left center;
    background-repeat: no-repeat;
    color: #ffffff;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: normal;
	font-weight: bold;
	padding: 3px 7px 3px 18px;
	cursor: pointer;
}
div.hpiMenuOff div.hpiMenuTitle:hover
{
    background-color: #81909E;
}
div.hpiMenuOff a
{
    display: none;
}
div.hpiMenuOff a.HPISubLink
{
    display: none;
}
div.hpiMenuOff span
{
    display: none;
}
td.HpiCurrentTreatment
{
    font-size: 12px;
    color: #8d2a2c;
    font-weight: bold;
}

td.hpiCheckboxTd
{
    padding-left: 20px;
    color: #444444;
    font-size: 11px;
    width: 120px;
}

.HPISaveAndSortButton
{
    cursor: pointer;
    float: right;
    background-image: url(../../Images/SaveAndSort.png);
    background-repeat: no-repeat;
    width: 72px;
    height: 18px;
    vertical-align: top;
}
.hpiTopTable tr.hpiDBRecordRow td.SpecialTreatmentOptions
{
    background-color: transparent;
    background-image: url(../../Images/EFormHPI_Treatment.png);
    background-position: left center;
    background-repeat: no-repeat;
    
    width: 265px;
    cursor: default;
    font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	line-height: normal;
	font-weight: normal;
	color: #333333;
	padding-left: 29px;
	
    border-bottom: none;
    
    filter: none;
    
}

.hpiTopTable tr.hpiDBRecordRow td.LastBisphosphonate
{
    border: solid 2px #8d2a2c;
}
.hpiTopTable tr.hpiDBRecordRow td.LastGnRH
{
    border: solid 2px #8d2a2c;
}
.hpiTopTable tr.hpiDBRecordRow td.CurrentTreatment
{
    border: solid 2px #8d2a2c;
}
.hpiTopTable tr.hpiDBRecordRow td.LastBisphosphonate td.SpecialTreatmentOptions
{
    background-image: url(../../Images/EFormHPI_LastBP.png);
    width: 265px;
	color: #333333;
	padding-left: 75px;
}
.hpiTopTable tr.hpiDBRecordRow td.LastGnRH td.SpecialTreatmentOptions
{
    background-image: url(../../Images/EFormHPI_LastGnRH.png);
    width: 265px;
	color: #333333;
	padding-left: 75px;
}
.hpiTopTable tr.hpiDBRecordRow td.CurrentTreatment td.SpecialTreatmentOptions
{
    background-image: url(../../Images/EFormHPI_CurrentTreatment.png);
    width: 265px;
	color: #333333;
	padding-left: 75px;
}


.hpiOptionsToggle
{
    float: right;
    width: 82px;
    height: 13px;
    cursor: pointer;
    background-image: url(../../Images/EFormHPIButton_MoreAdmins.png);
    background-position: right top;
    background-repeat: no-repeat;
}
.hpiOptionsToggleOn
{
    float: right;
    width: 13px;
    height: 12px;
    cursor: pointer;
    background-image: url(../../Images/EFormHPIButton_Close.png);
    background-position: right top;
    background-repeat: no-repeat;
}

.HPITreatmentCheckLayer input[type=text]
{
    display: none;
}


.nonProstateProc
{
    
}


span.HPIRecordDetailsBubbleContent
{
    display: none;
}




table#guHPITable
{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #333333;
	border: solid 1px #555555;
	border-collapse: collapse;
	border-bottom: none;
	width: 700px;
	border-spacing: 0px;
}

table#guHPITable td
{
/*	vertical-align: top; */
	height: 25px;
}

td.HPI_dbBRecord_rowContainer
{
	border-bottom: solid 1px #aaaaaa;
	padding: 0px 0px 0px 0px;
	
	
	

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#cccccc', endColorstr='#e8e8e8'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #cccccc),
		color-stop(1, #e8e8e8)
	);
	background-image: -moz-linear-gradient(
		center top,
		#cccccc 0%,
		#e8e8e8 100%
	);
	
	
	
}

tr.HPI_dbBRecord_Container_Simple:hover>td.HPI_dbBRecord_rowContainer
{
	border-bottom: solid 1px #aaaaaa;
	padding: 0px 0px 0px 0px;
	
	color: #000000;
	
	background: #EED2D9; /* for non-css3 browsers */

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #D0C9D1),
		color-stop(0.47, #DBA5B2),
		color-stop(1, #EED2D9)
	);
	background-image: -moz-linear-gradient(
		center top,
		#D0C9D1 0%,
		#DBA5B2 47%,
		#EED2D9 100%
	);


	
	cursor: pointer;	
	
	
}
table.HPI_dbBRecord_row_Compound td.HPI_Column
{
    padding-right: 14px;
}
table.HPI_dbBRecord_row_Compound td.HPI_Column:hover
{

	color: #000000;
	
	background: #EED2D9; /* for non-css3 browsers */

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #D0C9D1),
		color-stop(0.47, #DBA5B2),
		color-stop(1, #EED2D9)
	);
	background-image: -moz-linear-gradient(
		center top,
		#D0C9D1 0%,
		#DBA5B2 47%,
		#EED2D9 100%
	);


	
	cursor: pointer;	
	
	
}
tr.HPI_dbBRecord_Container_MedTx:hover>td.HPI_dbBRecord_rowContainer
{
	border-bottom: solid 1px #aaaaaa;
	padding: 0px 0px 0px 0px;
	
	color: #000000;
	
	background: #EED2D9; /* for non-css3 browsers */

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #D0C9D1),
		color-stop(0.47, #DBA5B2),
		color-stop(1, #EED2D9)
	);
	background-image: -moz-linear-gradient(
		center top,
		#D0C9D1 0%,
		#DBA5B2 47%,
		#EED2D9 100%
	);


	
	cursor: pointer;	
	
	
}




td.HPI_DateColumn
{
	width: 140px;
	padding-right: 16px;
	padding-left: 6px;
}



table.HPI_dbBRecord_row_Compound td.HPI_DateColumn:hover
{

	color: #000000;
	
	background: #EED2D9; /* for non-css3 browsers */

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#DBA5B2', endColorstr='#EED2D9'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #D0C9D1),
		color-stop(0.47, #DBA5B2),
		color-stop(1, #EED2D9)
	);
	background-image: -moz-linear-gradient(
		center top,
		#D0C9D1 0%,
		#DBA5B2 47%,
		#EED2D9 100%
	);

}


table.HPI_dbBRecord_row_Compound td.HPI_DateColumn span
{
	display: block;
}

table.HPI_dbBRecord_row_Compound td.HPI_DateColumn:hover span
{
	cursor: pointer;	
}


.HPI_MedTxOptionsTableContainer
{
	background-repeat: no-repeat;
	background-position: left center;
	padding-left: 12px;
	
}
table.HPI_dbBRecord_row_MedTx
{
	width: 100%;
	border-spacing: 0px;
}
table.CurrentTreatment
{
	border: solid 2px #8d2a2c;
	background-color: #EBE1E3;
	
	
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#CDBDBE', endColorstr='#E1D8D9'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #CDBDBE),
		color-stop(1, #E1D8D9)
	);
	background-image: -moz-linear-gradient(
		center top,
		#CDBDBE 0%,
		#E1D8D9 100%
	);
	
	
}
table.CurrentTreatment td.HPI_MedTxOptionsTableContainer
{
	background-image: url(../../HPI_bg_currentTreatment.png);
}
table.CurrentTreatment table.HPI_MedTxOptionsTable td
{
	background-color: #8D2A2C;
	color: #ffffff;
}
table.HPI_MedTxOptionsTable td
{
	padding-left: 10px;
}
table.CurrentTreatment td.HPI_DateColumn
{
	color: #8D2A2C;
	font-weight: bold;

}
table.CurrentTreatment td.HPI_MedTx_AgentColumn
{
	color: #8D2A2C;
	font-weight: bold;

}
table.CurrentTreatment td.HPI_MedTx_AdminColumn
{
	color: #8D2A2C;
	font-weight: normal;

}

table.HPI_dbBRecord_row_MedTx td.HPI_MedTx_CheckboxColumn
{
	padding-left: 16px;
}




table.LastGnRH
{
	border: solid 2px #8d2a2c;
	background-color: #ECE7E1;

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#CDCABD', endColorstr='#E2E0D7'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #CDCABD),
		color-stop(1, #E2E0D7)
	);
	background-image: -moz-linear-gradient(
		center top,
		#CDCABD 0%,
		#E2E0D7 100%
	);
	
	
	
}
table.LastGnRH td.HPI_MedTxOptionsTableContainer
{
	background-image: url(../../HPI_bg_lastGnRH.png);
}
table.LastGnRH table.HPI_MedTxOptionsTable td
{
	background-color: #986528;
	color: #ffffff;
}
table.LastGnRH td.HPI_DateColumn
{
	color: #986528;
	font-weight: bold;

}
table.LastGnRH td.HPI_MedTx_AgentColumn
{
	color: #986528;
	font-weight: bold;

}
table.LastGnRH td.HPI_MedTx_AdminColumn
{
	color: #986528;
	font-weight: normal;

}



table.LastBisphosphonate
{
	border: solid 2px #403D67;
	background-color: #E1E2EC;

	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#C4C4CA', endColorstr='#DDDCE0'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #C4C4CA),
		color-stop(1, #DDDCE0)
	);
	background-image: -moz-linear-gradient(
		center top,
		#C4C4CA 0%,
		#DDDCE0 100%
	);
	
}
table.LastBisphosphonate td.HPI_MedTxOptionsTableContainer
{
	background-image: url(../../HPI_bg_LastBisphosphonate.png);
}
table.LastBisphosphonate table.HPI_MedTxOptionsTable td
{
	background-color: #403D67;
	color: #ffffff;
}
table.LastBisphosphonate td.HPI_DateColumn
{
	color: #403D67;
	font-weight: bold;

}
table.LastBisphosphonate td.HPI_MedTx_AgentColumn
{
	color: #403D67;
	font-weight: bold;

}
table.LastBisphosphonate td.HPI_MedTx_AdminColumn
{
	color: #403D67;
	font-weight: normal;

}







table.HPI_MedTxOptionsTable
{
	width: 100%;
}
table.HPI_MedTxOptionsTable td
{
	height: 23px;
}

input.CyclesPerWeekInput
{
	width: 30px;
}
input.ProtocolNumInput
{
	width: 60px;
}




tr.HPI_dbBRecord_Container_Simple>td:hover
{
 /*   background-color: #8d2a2c;
    cursor: pointer; */
}
tr.HPI_dbBRecord_Container_Simple>td:hover td
{
/*    color: #ffffff;
    background-color: #8d2a2c;
    */
}
table.HPI_dbBRecord_row_Compound td.HPI_Column:hover
{
/*    color: #ffffff;
    background-color: #8d2a2c;
    cursor: pointer;*/
}



td.LastAdminColumn
{
    width: 220px;
}
td.MedTxCheckboxColumn
{
    width: 150px;
}
td.CurrentTreatment
{
    width: 150px;
    color: #8d2a2c;
    font-weight: bold;
}
td.CurrentTreatment input
{
    color: #8d2a2c;
    font-weight: bold;
}
td.LastGnRH
{
    width: 150px;
    color: #8d2a2c;
    font-weight: bold;
}
td.LastBisphosphonate
{
    width: 150px;
    color: #8d2a2c;
    font-weight: bold;
}


.hpiTopTable tr.hpiNewRecordRow td span.MedTxAdditionalHeaders
{
    display: inline;
    
    font-size: 10px;
    padding: 3px 4px 2px 4px;
    background-color: transparent;
    color: #ffffff;
}
.hpiTopTable tr.hpiNewRecordRow:hover td span.MedTxAdditionalHeaders
{
    display: inline;
    
    font-size: 10px;
    padding: 3px 4px 2px 4px;
    background-color: transparent;
    color: #dddddd;
}
.hpiTopTable tr.hpiNewRecordRowActive td span.MedTxAdditionalHeaders
{
    display: inline;
    
    font-size: 10px;
    padding: 3px 4px 2px 4px;
    background-color: #bbbbbb;
    color: #111111;
}

.hpiTopTable tr.hpiNewRecordRow td span.MedTxCurrentTxHeaders
{
    display: inline;
    
    font-size: 10px;
    padding: 3px 4px 2px 4px;
    background-color: transparent;
    color: #ffffff;
}
.hpiTopTable tr.hpiNewRecordRow:hover td span.MedTxCurrentTxHeaders
{
    display: inline;
    
    font-size: 10px;
    padding: 3px 4px 2px 4px;
    background-color: transparent;
    color: #dddddd;
}
.hpiTopTable tr.hpiNewRecordRowActive td span.MedTxCurrentTxHeaders
{
    display: inline;
    
    font-size: 10px;
    padding: 3px 4px 2px 4px;
    background-color: #bbbbbb;
    color: #111111;
}

span.ExistingAdminContainer:hover
{

}

</style>


<a name="GUProstateHPI_v2"></a><span class="controlBoxTitle" style="margin-right: 200px;">HPI</span>
<euc:EformTextBox style="display: none;" Table="Status" RecordId="6" Field="StatusDateText" ID="StatusDateText_6" Runat="server"  />
<euc:EformTextBox style="display: none;" Table="Status" RecordId="6" Field="StatusDate" ID="StatusDate_6" Runat="server"  />



<input id="ProstateProcToggle" type="checkbox" checked="checked" onclick="toggleAllProcedures();" style="margin-left: 15px;" /><span style="font-size: 11px; color: #333333;">Include Prostate Procedures Only</span>
<input id="CystoProcToggle" type="checkbox" checked="checked" onclick="toggleAllProcedures();" style="margin-left: 15px;" /><span style="font-size: 11px; color: #333333;">Include Last Cystoscopy Only</span>
<br/>



<euc:EformTextBox style="display: none;" TABLE="NoTable" FIELD="CurrentTreatmentIndex" Runat="server" ID="CurrentTreatmentIndex" />
<euc:EformTextBox style="display: none;" TABLE="NoTable" FIELD="LastGnRHIndex" Runat="server" ID="LastGnRHIndex" />
<euc:EformTextBox style="display: none;" TABLE="NoTable" FIELD="LastBisphosphonateIndex" Runat="server" ID="LastBisphosphonateIndex" />



<table id="guHPITable" cellspacing="0">


    <asp:Repeater ID="hpi_new" runat="server" OnItemDataBound="SetNewHpiItem">
        <%--OnItemDataBound="SetHpiItem" OnPreRender="SetCurrentTreatment"--%>
        <ItemTemplate>
            <tr id="RegularHPIRow" runat="server" class="HPI_dbBRecord_Container_Simple">
                <td class="HPI_dbBRecord_rowContainer" id="RegularHPICell" runat="server"><%--  onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "Table") %>', <%# DataBinder.Eval(Container.DataItem, "PriKey") %>, '', '');" --%>
                    <input type="hidden" id="PopulatedDate_<%# Container.ItemIndex  %>"  value="<%# DataBinder.Eval(Container.DataItem, "StartDate", "{0:MM/dd/yyyy}")%>" />
                    <input type="hidden" id="ProcType_<%# Container.ItemIndex  %>" value="<%# DataBinder.Eval(Container.DataItem, "Filters")%>" />
                    
                    <asp:Literal id="HPIRecordDetails" runat="server" />

                    <table class="HPI_dbBRecord_row_Simple" cellspacing="0" >
                        <tr>
                            <td class="HPI_DateColumn">
                                <%# DataBinder.Eval(Container.DataItem, "StartDateText")%><%# DataBinder.Eval(Container.DataItem, "EndDateText").ToString().Length > 0 ? "&nbsp;-&nbsp;" : ""%><%# DataBinder.Eval(Container.DataItem, "EndDateText")%>
                            </td>
                            <td class="HPI_Column">
                                <%# DataBinder.Eval(Container.DataItem, "Item")%>
                                &nbsp;
                                <%# DataBinder.Eval(Container.DataItem, "LastAdminDate").ToString().Length > 0 ? "Last Admin:" : ""%><%# DataBinder.Eval(Container.DataItem, "LastAdminDate")%>
                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="CompoundHPIRow" runat="server" visible="false" class="HPI_dbBRecord_Container_Compound">
                <td class="HPI_dbBRecord_rowContainer" id="CompoundHPICell" runat="server">
                    <input type="hidden" id="PopulatedDate_<%# Container.ItemIndex  %>"  value="<%# DataBinder.Eval(Container.DataItem, "StartDate", "{0:MM/dd/yyyy}")%>" />
                    <input type="hidden" id="ProcType_<%# Container.ItemIndex  %>" value="<%# DataBinder.Eval(Container.DataItem, "Filters")%>" />
                    
                    <asp:Literal id="HPIRecordDetails_Compound_DateCol" runat="server" />
                    
                    <table class="HPI_dbBRecord_row_Compound" cellspacing="0" >
                        <tr>
                            <td class="HPI_DateColumn"  >
                                <span  onmouseover="showHPIRecordData('<%# DataBinder.Eval(Container.DataItem, "Table") %>', <%# DataBinder.Eval(Container.DataItem, "PriKey") %>, true, this);" onmouseout="showHPIRecordData('<%# DataBinder.Eval(Container.DataItem, "Table") %>', <%# DataBinder.Eval(Container.DataItem, "PriKey") %>, false, this);" onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "Table") %>', <%# DataBinder.Eval(Container.DataItem, "PriKey") %>, '', '', '<%# DataBinder.Eval(Container.DataItem, "ChildTables") %>');" ><%# DataBinder.Eval(Container.DataItem, "StartDateText")%><%# DataBinder.Eval(Container.DataItem, "EndDateText").ToString().Length > 0 ? "&nbsp;-&nbsp;" : ""%><%# DataBinder.Eval(Container.DataItem, "EndDateText")%></span>
                            </td>
                            <asp:Repeater ID="hpi_CompoundRpt" runat="server" OnItemDataBound="SetCompoundHpiItem">
                            <ItemTemplate>
                            <td class="HPI_Column" onmouseover="showHPIRecordData('<%# DataBinder.Eval(Container.DataItem, "Table") %>', <%# DataBinder.Eval(Container.DataItem, "PriKey") %>, true, this);" onmouseout="showHPIRecordData('<%# DataBinder.Eval(Container.DataItem, "Table") %>', <%# DataBinder.Eval(Container.DataItem, "PriKey") %>, false, this);"  onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "Table") %>', <%# DataBinder.Eval(Container.DataItem, "PriKey") %>, '', '', '<%# DataBinder.Eval(Container.DataItem, "ChildTables") %>');"><asp:Literal id="HPIRecordDetails_Compound" runat="server" /><%# DataBinder.Eval(Container.DataItem, "Item")%>&nbsp;</td>
                            </ItemTemplate>
                            </asp:Repeater>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr id="MedTxHPIRow" runat="server" visible="false" class="HPI_dbBRecord_Container_MedTx">
                <td class="HPI_dbBRecord_rowContainer" id="MedTxHPICell" runat="server"><%--  onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "Table") %>', <%# DataBinder.Eval(Container.DataItem, "PriKey") %>, '', '');" --%>
                    <input type="hidden" id="PopulatedDate_<%# Container.ItemIndex  %>"  value="<%# DataBinder.Eval(Container.DataItem, "StartDate", "{0:MM/dd/yyyy}")%>" />
                    <input type="hidden" id="ProcType_<%# Container.ItemIndex  %>" value="<%# DataBinder.Eval(Container.DataItem, "Filters")%>" />
                    <input type="hidden" id="LastAdmin_<%# Container.ItemIndex  %>" value="<%# DataBinder.Eval(Container.DataItem, "LastAdminDate")%>" />
                    
                    <asp:Literal id="HPIRecordDetails_MedTx" runat="server" />

                    <table class="HPI_dbBRecord_row_MedTx" cellspacing="0" id="HPI_dbBRecord_row_MedTx_" >
                        <tr>
                            <td class="HPI_DateColumn">
                                <%# DataBinder.Eval(Container.DataItem, "StartDateText")%><%# DataBinder.Eval(Container.DataItem, "EndDate").ToString().Length > 0 ? "&nbsp;-&nbsp;" : ""%><%# DataBinder.Eval(Container.DataItem, "EndDateText")%>
                            </td>
                            <td class="HPI_Column">
                                <%# DataBinder.Eval(Container.DataItem, "Item")%>
                            </td>
                            <td class="HPI_Column LastAdminColumn">
                            
                                Last Admin:
                            
                                <span class="ExistingAdminContainer" id="<%# Container.ItemIndex  %>_ExistingAdminContainer"  ><span id="<%# Container.ItemIndex  %>_ExistingAdmin"  ><%# DataBinder.Eval(Container.DataItem, "LastAdminDate")%></span><img id="<%# Container.ItemIndex  %>_AddAdminButton" src="<%# DataBinder.Eval(Container.DataItem, "LastAdminDate").ToString().Length > 0 ? Page.ResolveUrl("~/Images/EFormHPIButton_AddNew.png") : Page.ResolveUrl("~/Images/EFormHPIButton_Add.png") %>" style="vertical-align: middle; margin-left: 3px; cursor: pointer;" onclick="toggleLastAdmin('<%# Container.ItemIndex  %>_ExistingAdminContainer','<%# Container.ItemIndex  %>_NewAdminContainer', event);" /></span>
                                
                                <span id="<%# Container.ItemIndex  %>_NewAdminContainer" onclick="stopBubble(event);"  style="display: none;" >
        
        <input type="text" id="<%# Container.ItemIndex  %>_AdminDateText" name="<%# Container.ItemIndex  %>_AdminDateText"
            value="<%= DateTime.Today.ToShortDateString() %>" style="width: 75px;" /><img style="border: none; margin-left: 0px;" src="../../Images/calendar/cal.png" onclick="showCal(this,document.getElementById('<%# Container.ItemIndex  %>_AdminDateText'));" class="CalendarWidget"  />
            <img src="<%= Page.ResolveUrl("~/Images/EFormHPIButton_Save.png") %>" style="vertical-align: middle; margin-left: 3px; cursor: pointer;" onclick="addNewAdmin('<%= Page.ResolveUrl("~/Modules/All/Eforms/CreateChildRecord.aspx") %>', '<%# DataBinder.Eval(Container.DataItem, "Table") %>', '<%# Caisis.Security.CustomCryptoHelper.Encrypt(DataBinder.Eval(Container.DataItem, "PriKey").ToString()) %>', '<%# Container.ItemIndex  %>', false, event);" />

                            </span>
                            
                            </td>
                            <td class="HPI_Column MedTxCheckboxColumn" id="MedTxCheckboxColumn" runat="server" >
                                <input type="checkbox" id="MedTxCheckbox" runat="server" visible="false" />
                                <asp:Label ID="MedTxCheckboxLabel" runat="server" />
                            </td>
                        </tr>
                        <tr class="CurrentTreatmentDetailsRow" id="CurrentTreatmentDetailsRow" runat="server" style="display: none;">
                            <td class="HPI_DateColumn">&nbsp;</td>
                            <td colspan="2" class="HPI_Column">
                                Cylcles/Week <input type="text" class="MedTxCyclesPerWeek" id="MedTxCyclesPerWeek_Populated_<%# Container.ItemIndex  %>" style="width: 30px; margin-right: 20px;"  onchange="setCurrentTreatmentDetails(this,'CyclesPerWeek')" onclick="stopBubble(event);" value="<%# (!string.IsNullOrEmpty(CurrentTreatmentIndex.Value) && (Container.ItemIndex.ToString() == CurrentTreatmentIndex.Value)) ? CurrentMedTx_CyclePerWeek.Value : "" %>" />
                                Protocol Number <input type="text" class="MedTxProtocolNum" id="MedTxProtocolNum_Populated_<%# Container.ItemIndex  %>" style="width: 80px;" onchange="setCurrentTreatmentDetails(this,'ProtocolNum')" onclick="stopBubble(event);" value="<%# (!string.IsNullOrEmpty(CurrentTreatmentIndex.Value) && (Container.ItemIndex.ToString() == CurrentTreatmentIndex.Value)) ? CurrentMedTx_ProtocolNum.Value : "" %>"  />
                            </td>
                            <td class="HPI_Column">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>

</table>



<table id="hpiTopTable" class="hpiTopTable" cellpadding="0" cellspacing="0"  > 
<tr ID="NoHPIMsg" Runat="server" Visible="False"><td style="background-color: #eeeeee; padding: 12px; font-size: 13px; font-weight: bold; color: #111111; border: solid 1px #aaaaaa;" >No history of present illness was previously recorded for this patient.</td></tr>

    <tr id="MedicalTherapyRow_1" class="hpiNewRecordRow"  onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar"><%-- <img onclick="closeHpi(event);" src="../../Images/shim.gif" class="HPISaveAndSortButton"  /> --%>Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox CssClass="MedTxDateText" Runat="server" RecordId="1"  ID="MedTxDateText_1" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                </td>
                <td onmouseout="SetMedTxDefaults(this,event,1);" onmouseover="SetMedTxDefaults(this,event,1);">
                <div class="hpiRecordHeaderColumn">Agent</div>
                	
               <euc:EFormComboBox CssClass="MedTxAgent" DropDownWidth="300"  LookupCode="MedTxAgent,EForm_GUProstate,True" style="width:100px;" Field="MedTxAgent" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxAgent_1" onclick="focusThisHpiRow('MedicalTherapyRow_1',event)"  /></td>
                <td onmouseout="SetMedTxDefaults(this,event,1);" onmouseover="SetMedTxDefaults(this,event,1);">
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox CssClass="MedTxDose" RecordId="1" ShowCalendar="False" CalcDate="False" style="width:21px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_1" onfocus="SetMedTxDefaults(this,event,1);" /></td>
                <td class="MedTxUnitsContainer" onmouseout="SetMedTxDefaults(this,event,1);" onmouseover="SetMedTxDefaults(this,event,1);">
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect CssClass="MedTxUnits" RecordId="1" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_1" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_1',event)" /></td>
                <td class="MedTxRouteContainer" onmouseout="SetMedTxDefaults(this,event,1);" onmouseover="SetMedTxDefaults(this,event,1);">
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect CssClass="MedTxRoute" DropDownWidth="90"  LookupCode="MedRoute" style="width:80px;" Field="MedTxRoute" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxRoute_1" onclick="focusThisHpiRow('MedicalTherapyRow_1',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox CssClass="MedTxSchedule" DropDownWidth="100"  LookupCode="MedSchedule" style="width:80px;" Field="MedTxSchedule" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_1" onclick="focusThisHpiRow('MedicalTherapyRow_1',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                <euc:EformCheckBox CssClass="MedTxSpecialStatusYesNo" ShowLabel="false" ID="MedTxSpecialStatusYesNo_1" RecordId="1"  TABLE="MedicalTherapyExtraData" FIELD="MedTxSpecialStatusYesNo" Runat="server" Value="Yes" onclick="setMedTxConditionNewData(this, 1, false, event);focusThisHpiRow('MedicalTherapyRow_1',event);" /><euc:EformTextBox CssClass="MedTxSpecialStatusType" RecordId="1"  TABLE="MedicalTherapyExtraData" FIELD="MedTxSpecialStatusType" Runat="server" ID="MedTxSpecialStatusType_1" style="border: none; background-color: transparent; color: #111111; width: 120px;" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            <tr>
                <td class="hpiDateColumn">&nbsp;</td>
                <td colspan="3" style="text-align: right;">
                <span class="MedTxAdditionalHeaders">Location</span><euc:EformSelect CssClass="MedTxLocation"  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_1" RecordId="1"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(1);"  onclick="focusThisHpiRow('MedicalTherapyRow_1',event)" />
                </td>
                <td colspan="2" style="text-align: right;">
                <span class="MedTxAdditionalHeaders">Last Admin</span><euc:EformTextBox CssClass="MedTxAdminStartDateText" Runat="server" RecordId="1"  ID="MedTxAdminStartDateText_1" TABLE="MedTxAdministration" FIELD="MedTxAdminStartDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"  onclick="focusThisHpiRow('MedicalTherapyRow_1',event)"  />
                <euc:EformHidden RecordId="1" Runat="server" ID="MedTxAdminStartDate_1" Table="MedTxAdministration" Field="MedTxAdminStartDate" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr class="CurrentTreatmentDetailsRow" id="CurrentTreatmentDetailsRow_1" style="display: none;" >
                <td class="hpiDateColumn">&nbsp;</td>
                <td colspan="3" style="text-align: right;">
                                <span class="MedTxCurrentTxHeaders">Cycle/Week</span><euc:EformTextBox CssClass="MedTxCyclesPerWeek" RecordId="1"  TABLE="MedicalTherapyExtraData" FIELD="MedTxCyclesPerWeek" Runat="server" ID="MedTxCyclesPerWeek_1"   style="width: 30px; margin-right: 20px;"  onchange="setCurrentTreatmentDetails(this,'CyclesPerWeek')" onclick="focusThisHpiRow('MedicalTherapyRow_1',event)" />
                </td>
                <td colspan="2" style="text-align: right;">
                                <span class="MedTxCurrentTxHeaders">Protocol Number</span><euc:EformTextBox CssClass="MedTxProtocolNum" RecordId="1"  TABLE="MedicalTherapyExtraData" FIELD="MedTxProtocolNum" Runat="server" ID="MedTxProtocolNum_1"   style="width: 80px;"  onchange="setCurrentTreatmentDetails(this,'ProtocolNum')" onclick="focusThisHpiRow('MedicalTherapyRow_1',event)" />
                </td>
                <td>&nbsp;</td>
            </tr>
            </table>
           <euc:EformTextBox CssClass="MedTxType" style="display: none;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_1" Runat="server"  />
           <euc:EformHidden CssClass="MedTxDate" RecordId="1" Runat="server" ID="MedTxDate_1" Table="MedicalTherapy" Field="MedTxDate" />
           <euc:EformTextBox CssClass="MedTxInstitution" style="display: none;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_1" Runat="server"  />
           <euc:EformTextBox CssClass="MedTxQuality" style="display: none;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_1" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_2" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar"><%-- <img onclick="closeHpi(event);" src="../../Images/shim.gif" class="HPISaveAndSortButton"  /> --%>Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox CssClass="MedTxDateText" Runat="server" RecordId="2"  ID="MedTxDateText_2" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                </td>
                <td onmouseout="SetMedTxDefaults(this,event,2);" onmouseover="SetMedTxDefaults(this,event,2);">
                <div class="hpiRecordHeaderColumn">Agent</div>
                	
               <euc:EFormComboBox CssClass="MedTxAgent" DropDownWidth="300"  LookupCode="MedTxAgent,EForm_GUProstate,True" style="width:100px;" Field="MedTxAgent" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxAgent_2" onclick="focusThisHpiRow('MedicalTherapyRow_2',event)"  /></td>
                <td onmouseout="SetMedTxDefaults(this,event,2);" onmouseover="SetMedTxDefaults(this,event,2);">
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox CssClass="MedTxDose" RecordId="2" ShowCalendar="False" CalcDate="False" style="width:21px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_2" onfocus="SetMedTxDefaults(this,event,2);" /></td>
                <td class="MedTxUnitsContainer" onmouseout="SetMedTxDefaults(this,event,2);" onmouseover="SetMedTxDefaults(this,event,2);">
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect CssClass="MedTxUnits" RecordId="2" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_2" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_2',event)" /></td>
                <td class="MedTxRouteContainer" onmouseout="SetMedTxDefaults(this,event,2);" onmouseover="SetMedTxDefaults(this,event,2);">
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect CssClass="MedTxRoute" DropDownWidth="90"  LookupCode="MedRoute" style="width:80px;" Field="MedTxRoute" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxRoute_2" onclick="focusThisHpiRow('MedicalTherapyRow_2',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox CssClass="MedTxSchedule" DropDownWidth="100"  LookupCode="MedSchedule" style="width:80px;" Field="MedTxSchedule" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_2" onclick="focusThisHpiRow('MedicalTherapyRow_2',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                <euc:EformCheckBox CssClass="MedTxSpecialStatusYesNo" ShowLabel="false" ID="MedTxSpecialStatusYesNo_2" RecordId="2"  TABLE="MedicalTherapyExtraData" FIELD="MedTxSpecialStatusYesNo" Runat="server" Value="Yes" onclick="setMedTxConditionNewData(this, 2, false, event);" /><euc:EformTextBox CssClass="MedTxSpecialStatusType" RecordId="2"  TABLE="MedicalTherapyExtraData" FIELD="MedTxSpecialStatusType" Runat="server" ID="MedTxSpecialStatusType_2" style="border: none; background-color: transparent; color: #111111; width: 120px;" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            <tr>
                <td class="hpiDateColumn">&nbsp;</td>
                <td colspan="3" style="text-align: right;">
                <span class="MedTxAdditionalHeaders">Location</span><euc:EformSelect CssClass="MedTxLocation"  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_2" RecordId="2"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(2);"  onclick="focusThisHpiRow('MedicalTherapyRow_2',event)" />
                </td>
                <td colspan="2" style="text-align: right;">
                <span class="MedTxAdditionalHeaders">Last Admin</span><euc:EformTextBox CssClass="MedTxAdminStartDateText" Runat="server" RecordId="2"  ID="MedTxAdminStartDateText_2" TABLE="MedTxAdministration" FIELD="MedTxAdminStartDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"  onclick="focusThisHpiRow('MedicalTherapyRow_2',event)"  />
                <euc:EformHidden RecordId="2" Runat="server" ID="MedTxAdminStartDate_2" Table="MedTxAdministration" Field="MedTxAdminStartDate" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr class="CurrentTreatmentDetailsRow" id="CurrentTreatmentDetailsRow_2" style="display: none;" >
                <td class="hpiDateColumn">&nbsp;</td>
                <td colspan="3" style="text-align: right;">
                                <span class="MedTxCurrentTxHeaders">Cycle/Week</span><euc:EformTextBox CssClass="MedTxCyclesPerWeek" RecordId="2"  TABLE="MedicalTherapyExtraData" FIELD="MedTxCyclesPerWeek" Runat="server" ID="MedTxCyclesPerWeek_2"   style="width: 30px; margin-right: 20px;"  onchange="setCurrentTreatmentDetails(this,'CyclesPerWeek')" onclick="focusThisHpiRow('MedicalTherapyRow_2',event)" />
                </td>
                <td colspan="2" style="text-align: right;">
                                <span class="MedTxCurrentTxHeaders">Protocol Number</span><euc:EformTextBox CssClass="MedTxProtocolNum" RecordId="2"  TABLE="MedicalTherapyExtraData" FIELD="MedTxProtocolNum" Runat="server" ID="MedTxProtocolNum_2"   style="width: 80px;"  onchange="setCurrentTreatmentDetails(this,'ProtocolNum')" onclick="focusThisHpiRow('MedicalTherapyRow_2',event)" />
                </td>
                <td>&nbsp;</td>
            </tr>
            </table>
           <euc:EformTextBox CssClass="MedTxType" style="display: none;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_2" Runat="server"  />
           <euc:EformHidden CssClass="MedTxDate" RecordId="2" Runat="server" ID="MedTxDate_2" Table="MedicalTherapy" Field="MedTxDate" />
           <euc:EformTextBox CssClass="MedTxInstitution" style="display: none;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_2" Runat="server"  />
           <euc:EformTextBox CssClass="MedTxQuality" style="display: none;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_2" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_3" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar"><%-- <img onclick="closeHpi(event);" src="../../Images/shim.gif" class="HPISaveAndSortButton"  /> --%>Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox CssClass="MedTxDateText" Runat="server" RecordId="3"  ID="MedTxDateText_3" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                </td>
                <td onmouseout="SetMedTxDefaults(this,event,3);" onmouseover="SetMedTxDefaults(this,event,3);">
                <div class="hpiRecordHeaderColumn">Agent</div>
                	
               <euc:EFormComboBox CssClass="MedTxAgent" DropDownWidth="300"  LookupCode="MedTxAgent,EForm_GUProstate,True" style="width:100px;" Field="MedTxAgent" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxAgent_3" onclick="focusThisHpiRow('MedicalTherapyRow_3',event)"  /></td>
                <td onmouseout="SetMedTxDefaults(this,event,3);" onmouseover="SetMedTxDefaults(this,event,3);">
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox CssClass="MedTxDose" RecordId="3" ShowCalendar="False" CalcDate="False" style="width:21px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_3" onfocus="SetMedTxDefaults(this,event,3);" /></td>
                <td class="MedTxUnitsContainer" onmouseout="SetMedTxDefaults(this,event,3);" onmouseover="SetMedTxDefaults(this,event,3);">
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect CssClass="MedTxUnits" RecordId="3" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_3" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_3',event)" /></td>
                <td class="MedTxRouteContainer" onmouseout="SetMedTxDefaults(this,event,3);" onmouseover="SetMedTxDefaults(this,event,3);">
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect CssClass="MedTxRoute" DropDownWidth="90"  LookupCode="MedRoute" style="width:80px;" Field="MedTxRoute" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxRoute_3" onclick="focusThisHpiRow('MedicalTherapyRow_3',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox CssClass="MedTxSchedule" DropDownWidth="100"  LookupCode="MedSchedule" style="width:80px;" Field="MedTxSchedule" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_3" onclick="focusThisHpiRow('MedicalTherapyRow_3',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                <euc:EformCheckBox CssClass="MedTxSpecialStatusYesNo" ShowLabel="false" ID="MedTxSpecialStatusYesNo_3" RecordId="3"  TABLE="MedicalTherapyExtraData" FIELD="MedTxSpecialStatusYesNo" Runat="server" Value="Yes" onclick="setMedTxConditionNewData(this, 3, false, event);" /><euc:EformTextBox CssClass="MedTxSpecialStatusType" RecordId="3"  TABLE="MedicalTherapyExtraData" FIELD="MedTxSpecialStatusType" Runat="server" ID="MedTxSpecialStatusType_3" style="border: none; background-color: transparent; color: #111111; width: 120px;" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            <tr>
                <td class="hpiDateColumn">&nbsp;</td>
                <td colspan="3" style="text-align: right;">
                <span class="MedTxAdditionalHeaders">Location</span><euc:EformSelect CssClass="MedTxLocation"  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_3" RecordId="3"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(3);"  onclick="focusThisHpiRow('MedicalTherapyRow_3',event)" />
                </td>
                <td colspan="2" style="text-align: right;">
                <span class="MedTxAdditionalHeaders">Last Admin</span><euc:EformTextBox CssClass="MedTxAdminStartDateText" Runat="server" RecordId="3"  ID="MedTxAdminStartDateText_3" TABLE="MedTxAdministration" FIELD="MedTxAdminStartDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"  onclick="focusThisHpiRow('MedicalTherapyRow_3',event)"  />
                <euc:EformHidden RecordId="3" Runat="server" ID="MedTxAdminStartDate_3" Table="MedTxAdministration" Field="MedTxAdminStartDate" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr class="CurrentTreatmentDetailsRow" id="CurrentTreatmentDetailsRow_3" style="display: none;" >
                <td class="hpiDateColumn">&nbsp;</td>
                <td colspan="3" style="text-align: right;">
                                <span class="MedTxCurrentTxHeaders">Cycle/Week</span><euc:EformTextBox CssClass="MedTxCyclesPerWeek" RecordId="3"  TABLE="MedicalTherapyExtraData" FIELD="MedTxCyclesPerWeek" Runat="server" ID="MedTxCyclesPerWeek_3"   style="width: 30px; margin-right: 20px;"  onchange="setCurrentTreatmentDetails(this,'CyclesPerWeek')" onclick="focusThisHpiRow('MedicalTherapyRow_3',event)" />
                </td>
                <td colspan="2" style="text-align: right;">
                                <span class="MedTxCurrentTxHeaders">Protocol Number</span><euc:EformTextBox CssClass="MedTxProtocolNum" RecordId="3"  TABLE="MedicalTherapyExtraData" FIELD="MedTxProtocolNum" Runat="server" ID="MedTxProtocolNum_3"   style="width: 80px;"  onchange="setCurrentTreatmentDetails(this,'ProtocolNum')" onclick="focusThisHpiRow('MedicalTherapyRow_3',event)" />
                </td>
                <td>&nbsp;</td>
            </tr>
            </table>
           <euc:EformTextBox CssClass="MedTxType" style="display: none;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_3" Runat="server"  />
           <euc:EformHidden CssClass="MedTxDate" RecordId="3" Runat="server" ID="MedTxDate_3" Table="MedicalTherapy" Field="MedTxDate" />
           <euc:EformTextBox CssClass="MedTxInstitution" style="display: none;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_3" Runat="server"  />
           <euc:EformTextBox CssClass="MedTxQuality" style="display: none;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_3" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_4" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar"><%-- <img onclick="closeHpi(event);" src="../../Images/shim.gif" class="HPISaveAndSortButton"  /> --%>Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox CssClass="MedTxDateText" Runat="server" RecordId="4"  ID="MedTxDateText_4" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                </td>
                <td onmouseout="SetMedTxDefaults(this,event,4);" onmouseover="SetMedTxDefaults(this,event,4);">
                <div class="hpiRecordHeaderColumn">Agent</div>
                	
               <euc:EFormComboBox CssClass="MedTxAgent" DropDownWidth="300"  LookupCode="MedTxAgent,EForm_GUProstate,True" style="width:100px;" Field="MedTxAgent" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxAgent_4" onclick="focusThisHpiRow('MedicalTherapyRow_4',event)"  /></td>
                <td onmouseout="SetMedTxDefaults(this,event,4);" onmouseover="SetMedTxDefaults(this,event,4);">
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox CssClass="MedTxDose" RecordId="4" ShowCalendar="False" CalcDate="False" style="width:21px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_4" onfocus="SetMedTxDefaults(this,event,4);" /></td>
                <td class="MedTxUnitsContainer" onmouseout="SetMedTxDefaults(this,event,4);" onmouseover="SetMedTxDefaults(this,event,4);">
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect CssClass="MedTxUnits" RecordId="4" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_4" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_4',event)" /></td>
                <td class="MedTxRouteContainer" onmouseout="SetMedTxDefaults(this,event,4);" onmouseover="SetMedTxDefaults(this,event,4);">
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect CssClass="MedTxRoute" DropDownWidth="90"  LookupCode="MedRoute" style="width:80px;" Field="MedTxRoute" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxRoute_4" onclick="focusThisHpiRow('MedicalTherapyRow_4',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox CssClass="MedTxSchedule" DropDownWidth="100"  LookupCode="MedSchedule" style="width:80px;" Field="MedTxSchedule" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_4" onclick="focusThisHpiRow('MedicalTherapyRow_4',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                <euc:EformCheckBox CssClass="MedTxSpecialStatusYesNo" ShowLabel="false" ID="MedTxSpecialStatusYesNo_4" RecordId="4"  TABLE="MedicalTherapyExtraData" FIELD="MedTxSpecialStatusYesNo" Runat="server" Value="Yes" onclick="setMedTxConditionNewData(this, 4, false, event);" /><euc:EformTextBox CssClass="MedTxSpecialStatusType" RecordId="4"  TABLE="MedicalTherapyExtraData" FIELD="MedTxSpecialStatusType" Runat="server" ID="MedTxSpecialStatusType_4" style="border: none; background-color: transparent; color: #111111; width: 120px;" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            <tr>
                <td class="hpiDateColumn">&nbsp;</td>
                <td colspan="3" style="text-align: right;">
                <span class="MedTxAdditionalHeaders">Location</span><euc:EformSelect CssClass="MedTxLocation"  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_4" RecordId="4"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(4);"  onclick="focusThisHpiRow('MedicalTherapyRow_4',event)" />
                </td>
                <td colspan="2" style="text-align: right;">
                <span class="MedTxAdditionalHeaders">Last Admin</span><euc:EformTextBox CssClass="MedTxAdminStartDateText" Runat="server" RecordId="4"  ID="MedTxAdminStartDateText_4" TABLE="MedTxAdministration" FIELD="MedTxAdminStartDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"  onclick="focusThisHpiRow('MedicalTherapyRow_4',event)"  />
                <euc:EformHidden RecordId="4" Runat="server" ID="MedTxAdminStartDate_4" Table="MedTxAdministration" Field="MedTxAdminStartDate" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr class="CurrentTreatmentDetailsRow" id="CurrentTreatmentDetailsRow_4" style="display: none;" >
                <td class="hpiDateColumn">&nbsp;</td>
                <td colspan="3" style="text-align: right;">
                                <span class="MedTxCurrentTxHeaders">Cycle/Week</span><euc:EformTextBox CssClass="MedTxCyclesPerWeek" RecordId="4"  TABLE="MedicalTherapyExtraData" FIELD="MedTxCyclesPerWeek" Runat="server" ID="MedTxCyclesPerWeek_4"   style="width: 30px; margin-right: 20px;"  onchange="setCurrentTreatmentDetails(this,'CyclesPerWeek')" onclick="focusThisHpiRow('MedicalTherapyRow_4',event)" />
                </td>
                <td colspan="2" style="text-align: right;">
                                <span class="MedTxCurrentTxHeaders">Protocol Number</span><euc:EformTextBox CssClass="MedTxProtocolNum" RecordId="4"  TABLE="MedicalTherapyExtraData" FIELD="MedTxProtocolNum" Runat="server" ID="MedTxProtocolNum_4"   style="width: 80px;"  onchange="setCurrentTreatmentDetails(this,'ProtocolNum')" onclick="focusThisHpiRow('MedicalTherapyRow_4',event)" />
                </td>
                <td>&nbsp;</td>
            </tr>
            </table>
           <euc:EformTextBox CssClass="MedTxType" style="display: none;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_4" Runat="server"  />
           <euc:EformHidden CssClass="MedTxDate" RecordId="4" Runat="server" ID="MedTxDate_4" Table="MedicalTherapy" Field="MedTxDate" />
           <euc:EformTextBox CssClass="MedTxInstitution" style="display: none;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_4" Runat="server"  />
           <euc:EformTextBox CssClass="MedTxQuality" style="display: none;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_4" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_5" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar"><%-- <img onclick="closeHpi(event);" src="../../Images/shim.gif" class="HPISaveAndSortButton"  /> --%>Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox CssClass="MedTxDateText" Runat="server" RecordId="5"  ID="MedTxDateText_5" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                </td>
                <td onmouseout="SetMedTxDefaults(this,event,5);" onmouseover="SetMedTxDefaults(this,event,5);">
                <div class="hpiRecordHeaderColumn">Agent</div>
                	
               <euc:EFormComboBox CssClass="MedTxAgent" DropDownWidth="300"  LookupCode="MedTxAgent,EForm_GUProstate,True" style="width:100px;" Field="MedTxAgent" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxAgent_5" onclick="focusThisHpiRow('MedicalTherapyRow_5',event)"  /></td>
                <td onmouseout="SetMedTxDefaults(this,event,5);" onmouseover="SetMedTxDefaults(this,event,5);">
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox CssClass="MedTxDose" RecordId="5" ShowCalendar="False" CalcDate="False" style="width:21px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_5" onfocus="SetMedTxDefaults(this,event,5);" /></td>
                <td class="MedTxUnitsContainer" onmouseout="SetMedTxDefaults(this,event,5);" onmouseover="SetMedTxDefaults(this,event,5);">
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect CssClass="MedTxUnits" RecordId="5" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_5" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_5',event)" /></td>
                <td class="MedTxRouteContainer" onmouseout="SetMedTxDefaults(this,event,5);" onmouseover="SetMedTxDefaults(this,event,5);">
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect CssClass="MedTxRoute" DropDownWidth="90"  LookupCode="MedRoute" style="width:80px;" Field="MedTxRoute" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxRoute_5" onclick="focusThisHpiRow('MedicalTherapyRow_5',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox CssClass="MedTxSchedule" DropDownWidth="100"  LookupCode="MedSchedule" style="width:80px;" Field="MedTxSchedule" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_5" onclick="focusThisHpiRow('MedicalTherapyRow_5',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                <euc:EformCheckBox CssClass="MedTxSpecialStatusYesNo" ShowLabel="false" ID="MedTxSpecialStatusYesNo_5" RecordId="5"  TABLE="MedicalTherapyExtraData" FIELD="MedTxSpecialStatusYesNo" Runat="server" Value="Yes" onclick="setMedTxConditionNewData(this, 5, false, event);" /><euc:EformTextBox CssClass="MedTxSpecialStatusType" RecordId="5"  TABLE="MedicalTherapyExtraData" FIELD="MedTxSpecialStatusType" Runat="server" ID="MedTxSpecialStatusType_5" style="border: none; background-color: transparent; color: #111111; width: 120px;" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            <tr>
                <td class="hpiDateColumn">&nbsp;</td>
                <td colspan="3" style="text-align: right;">
                <span class="MedTxAdditionalHeaders">Location</span><euc:EformSelect CssClass="MedTxLocation"  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_5" RecordId="5"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(5);"  onclick="focusThisHpiRow('MedicalTherapyRow_5',event)" />
                </td>
                <td colspan="2" style="text-align: right;">
                <span class="MedTxAdditionalHeaders">Last Admin</span><euc:EformTextBox CssClass="MedTxAdminStartDateText" Runat="server" RecordId="5"  ID="MedTxAdminStartDateText_5" TABLE="MedTxAdministration" FIELD="MedTxAdminStartDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"  onclick="focusThisHpiRow('MedicalTherapyRow_5',event)"  />
                <euc:EformHidden RecordId="5" Runat="server" ID="MedTxAdminStartDate_5" Table="MedTxAdministration" Field="MedTxAdminStartDate" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr class="CurrentTreatmentDetailsRow" id="CurrentTreatmentDetailsRow_5" style="display: none;" >
                <td class="hpiDateColumn">&nbsp;</td>
                <td colspan="3" style="text-align: right;">
                                <span class="MedTxCurrentTxHeaders">Cycle/Week</span><euc:EformTextBox CssClass="MedTxCyclesPerWeek" RecordId="5"  TABLE="MedicalTherapyExtraData" FIELD="MedTxCyclesPerWeek" Runat="server" ID="MedTxCyclesPerWeek_5"   style="width: 30px; margin-right: 20px;"  onchange="setCurrentTreatmentDetails(this,'CyclesPerWeek')" onclick="focusThisHpiRow('MedicalTherapyRow_5',event)" />
                </td>
                <td colspan="2" style="text-align: right;">
                                <span class="MedTxCurrentTxHeaders">Protocol Number</span><euc:EformTextBox CssClass="MedTxProtocolNum" RecordId="5"  TABLE="MedicalTherapyExtraData" FIELD="MedTxProtocolNum" Runat="server" ID="MedTxProtocolNum_5"   style="width: 80px;"  onchange="setCurrentTreatmentDetails(this,'ProtocolNum')" onclick="focusThisHpiRow('MedicalTherapyRow_5',event)" />
                </td>
                <td>&nbsp;</td>
            </tr>
            </table>
           <euc:EformTextBox CssClass="MedTxType" style="display: none;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_5" Runat="server"  />
           <euc:EformHidden CssClass="MedTxDate" RecordId="5" Runat="server" ID="MedTxDate_5" Table="MedicalTherapy" Field="MedTxDate" />
           <euc:EformTextBox CssClass="MedTxInstitution" style="display: none;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_5" Runat="server"  />
           <euc:EformTextBox CssClass="MedTxQuality" style="display: none;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_5" Runat="server"  />
        </td>
    </tr>
    
    
    
    
    
    
    <tr id="RadiationTherapyRow_1" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Radiation Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Start Date</div>
                <euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxDateText_1" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="1" Runat="server" ID="RadTxDate_1" Table="RadiationTherapy" Field="RadTxDate" /></td>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Stop Date</div>
                <euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxStopDateText_1" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="1" Runat="server" ID="RadTxStopDate_1" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Type</div>
                <euc:EformSelect RecordId="1" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_1" onclick="focusThisHpiRow('RadiationTherapyRow_1',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Target</div>
                <euc:EformComboBox  LookupCode="RadTxTarget"  style="width:80px;" Field="RadTxTarget" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxTarget_1"  onclick="focusThisHpiRow('RadiationTherapyRow_1',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Total Dose</div>
                <euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_1"  onclick="focusThisHpiRow('RadiationTherapyRow_1',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="1" LookupCode="RadTxUnits" style="width:60px;" DropDownHeight="auto" DropDownWidth="60" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_1" onclick="focusThisHpiRow('RadiationTherapyRow_1',event)" />
                </td>
                <td>
                <div class="hpiRecordHeaderColumn"># Fractions</div>
                <euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_1"  onclick="focusThisHpiRow('RadiationTherapyRow_1',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="RadiationTherapyExtraData"  FIELD="RadTxLocation" ID="RadTxLocation_1" RecordId="1"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setRadTxLocationFields(1);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxInstitution" ID="RadTxInstitution_1" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_1" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_1" Runat="server"  />
            
        </td>
    </tr>
    <tr id="RadiationTherapyRow_2" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Radiation Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Start Date</div>
                <euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxDateText_2" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="2" Runat="server" ID="RadTxDate_2" Table="RadiationTherapy" Field="RadTxDate" /></td>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Stop Date</div>
                <euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxStopDateText_2" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="2" Runat="server" ID="RadTxStopDate_2" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Type</div>
                <euc:EformSelect RecordId="2" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_2" onclick="focusThisHpiRow('RadiationTherapyRow_2',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Target</div>
                <euc:EformComboBox  LookupCode="RadTxTarget"  style="width:80px;" Field="RadTxTarget" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxTarget_2"  onclick="focusThisHpiRow('RadiationTherapyRow_2',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Total Dose</div>
                <euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_2"  onclick="focusThisHpiRow('RadiationTherapyRow_2',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="2" LookupCode="RadTxUnits" style="width:60px;" DropDownHeight="auto" DropDownWidth="60" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_2" onclick="focusThisHpiRow('RadiationTherapyRow_2',event)" />
                </td>
                <td>
                <div class="hpiRecordHeaderColumn"># Fractions</div>
                <euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_2"  onclick="focusThisHpiRow('RadiationTherapyRow_2',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="RadiationTherapyExtraData"  FIELD="RadTxLocation" ID="RadTxLocation_2" RecordId="2"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setRadTxLocationFields(2);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxInstitution" ID="RadTxInstitution_2" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_2" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_2" Runat="server"  />
            
        </td>
    </tr>
    <tr id="RadiationTherapyRow_3" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Radiation Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Start Date</div>
                <euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxDateText_3" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="3" Runat="server" ID="RadTxDate_3" Table="RadiationTherapy" Field="RadTxDate" /></td>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Stop Date</div>
                <euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxStopDateText_3" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="3" Runat="server" ID="RadTxStopDate_3" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Type</div>
                <euc:EformSelect RecordId="3" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_3" onclick="focusThisHpiRow('RadiationTherapyRow_3',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Target</div>
                <euc:EformComboBox  LookupCode="RadTxTarget"  style="width:80px;" Field="RadTxTarget" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxTarget_3"  onclick="focusThisHpiRow('RadiationTherapyRow_3',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Total Dose</div>
                <euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_3"  onclick="focusThisHpiRow('RadiationTherapyRow_3',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="3" LookupCode="RadTxUnits" style="width:60px;" DropDownHeight="auto" DropDownWidth="60" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_3" onclick="focusThisHpiRow('RadiationTherapyRow_3',event)" />
                </td>
                <td>
                <div class="hpiRecordHeaderColumn"># Fractions</div>
                <euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_3"  onclick="focusThisHpiRow('RadiationTherapyRow_3',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="RadiationTherapyExtraData"  FIELD="RadTxLocation" ID="RadTxLocation_3" RecordId="3"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setRadTxLocationFields(3);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxInstitution" ID="RadTxInstitution_3" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_3" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_3" Runat="server"  />
            
        </td>
    </tr>
    
    <tr id="BrachyTherapyRow_1" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">BrachyTherapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="1"  id="BrachyDateText_1" Table="BrachyTherapy" FIELD="BrachyDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="1" Runat="server" id="BrachyDate_1" Table="BrachyTherapy" FIELD="BrachyDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Prescribed Dose</div>
                <euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:100px;" Table="BrachyTherapy" FIELD="BrachyPrescribedDose" Runat="server" id="BrachyPrescribedDose_1"  onclick="focusThisHpiRow('BrachyTherapyRow_1',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Isotope</div>
                <euc:EformComboBox style="width:100px;"  RecordId="1" LookupCode="SeedIsotope" TABLE="BrachyTherapy" FIELD="BrachyIsotope" Runat="server" ID="BrachyIsotope_1" onclick="focusThisHpiRow('BrachyTherapyRow_1',event)"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="BrachyTherapyExtraData"  FIELD="BrachyLocation" id="BrachyLocation_1" RecordId="1"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setBrachyLocationFields();" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="1" Table="BrachyTherapy" FIELD="BrachyInstitution" id="BrachyInstitution_1" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="1" Table="BrachyTherapy" FIELD="BrachyQuality" id="BrachyQuality_1" Runat="server"  />
        </td>
    </tr>
    <tr id="ProstatectomyRow_1" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Prostatectomy</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="1"  ID="ProcDateText_1" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Type</div>
                  <euc:EformSelect  LookupCode="OpTypeProstatectomy"  DropDownWidth="50px" style="width:50px;" DropDownHeight="auto"   TABLE="Procedures" FIELD="ProcName" id="OpType_Prostatectomy"  runat="server" RecordId="1"  onclick="focusThisHpiRow('ProstatectomyRow_1',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology" RecordId="1" Table="Pathology" Runat="server" id="PathHistology_1"  onclick="focusThisHpiRow('ProstatectomyRow_1',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology 2</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology2" RecordId="1" Table="Pathology" Runat="server" id="PathHistology2_1"  onclick="focusThisHpiRow('ProstatectomyRow_1',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">GG1</div>
                  <euc:EformTextBox RecordId="1" style="width:30px;" TABLE="ProstatectomyPath" FIELD="PathGG1" Runat="server" ID="PathGG1_1"  onclick="focusThisHpiRow('ProstatectomyRow_1',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GG2</div>
                  <euc:EformTextBox RecordId="1" style="width:30px;" TABLE="ProstatectomyPath" FIELD="PathGG2" Runat="server" ID="PathGG2_1"  onclick="focusThisHpiRow('ProstatectomyRow_1',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GGS</div>
                  <euc:EformTextBox RecordId="1" style="width:30px;" TABLE="ProstatectomyPath" FIELD="PathGGS" Runat="server" ID="PathGGS_1"  onclick="focusThisHpiRow('ProstatectomyRow_1',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">SMS</div>
                  <euc:EformComboBox   LookupCode="MarginStatus"  style="width:60px;" DropDownHeight="auto" Field="PathMargin" RecordId="1" Table="ProstatectomyPath" Runat="server" id="PathMargin_1"  onclick="focusThisHpiRow('ProstatectomyRow_1',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">ECE</div>
                  <euc:EformComboBox   LookupCode="LocalExtensionProstate"  style="width:50px;" DropDownHeight="auto" DropDownWidth="190px" Field="PathExtension" RecordId="1" Table="ProstatectomyPath" Runat="server" id="PathExtension_1"  onclick="focusThisHpiRow('ProstatectomyRow_1',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">SVI</div>
                  <euc:EformComboBox   LookupCode="SVI"  style="width:40px;" DropDownHeight="auto" DropDownWidth="50px" Field="PathSV_Inv" RecordId="1" Table="ProstatectomyPath" Runat="server" id="PathSV_Inv_1"  onclick="focusThisHpiRow('ProstatectomyRow_1',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">LNI</div>
                  <euc:EformComboBox   LookupCode="BxResult" style="width:40px;" DropDownHeight="auto" DropDownWidth="70px" Field="PathResult" RecordId="1" Table="Pathology" Runat="server" id="PathResult_1"  onclick="focusThisHpiRow('ProstatectomyRow_1',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_1" RecordId="1" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(1);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="1" Runat="server" ID="ProcDate_1" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="1" Table="Procedures" Runat="server" id="ProstatectomyApproach"  />
            <euc:EformTextBox style="display: none;"  Field="ProcSite" RecordId="1" Table="Procedures" Runat="server" id="ProcSite_1"  />
            <euc:EformTextBox style="display: none;" RecordId="1" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_1" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="1" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_1" Runat="server"  />

        </td>
    </tr>
    <tr id="ProstateBiopsyRow_2" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Prostate Biopsy</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="2"  ID="ProcDateText_2" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Type</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_2"  runat="server" RecordId="2"  onclick="focusThisHpiRow('ProstateBiopsyRow_2',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology" RecordId="2" Table="Pathology" Runat="server" id="PathHistology_2"  onclick="focusThisHpiRow('ProstateBiopsyRow_2',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology 2</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology2" RecordId="2" Table="Pathology" Runat="server" id="PathHistology2_2"  onclick="focusThisHpiRow('ProstateBiopsyRow_2',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">GG1</div>
                  <euc:EformTextBox RecordId="2" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server" ID="PathGG1_2"  onclick="focusThisHpiRow('ProstateBiopsyRow_2',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GG2</div>
                  <euc:EformTextBox RecordId="2" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server" ID="PathGG2_2"  onclick="focusThisHpiRow('ProstateBiopsyRow_2',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GGS</div>
                  <euc:EformTextBox RecordId="2" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server" ID="PathGGS_2"  onclick="focusThisHpiRow('ProstateBiopsyRow_2',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">Pos Cores</div>
                  <euc:EformTextBox  style="width:50px;" Field="PathPosCores" RecordId="2" Table="ProstateBiopsyPath" Runat="server" id="PathPosCores_2"  onclick="focusThisHpiRow('ProstateBiopsyRow_2',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Total Cores</div>
                  <euc:EformTextBox  style="width:50px;" Field="PathNumCores" RecordId="2" Table="ProstateBiopsyPath" Runat="server" id="PathNumCores_2"  onclick="focusThisHpiRow('ProstateBiopsyRow_2',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_2" RecordId="2" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(2);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="2" Runat="server" ID="ProcDate_2" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="2" Table="Procedures" Runat="server" id="ProcApproach_2"  />
            <euc:EformTextBox style="display: none;"  Field="ProcSite" RecordId="2" Table="Procedures" Runat="server" id="ProcSite_2"  />
            <euc:EformTextBox style="display: none;" RecordId="2" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_2" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="2" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_2" Runat="server"  />

        </td>
    </tr>
    <tr id="ProstateBiopsyRow_3" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Prostate Biopsy</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="3"  ID="ProcDateText_3" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Type</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_3"  runat="server" RecordId="3"  onclick="focusThisHpiRow('ProstateBiopsyRow_3',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology" RecordId="3" Table="Pathology" Runat="server" id="PathHistology_3"  onclick="focusThisHpiRow('ProstateBiopsyRow_3',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology 2</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology2" RecordId="3" Table="Pathology" Runat="server" id="PathHistology2_3"  onclick="focusThisHpiRow('ProstateBiopsyRow_3',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">GG1</div>
                  <euc:EformTextBox RecordId="3" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server" ID="PathGG1_3"  onclick="focusThisHpiRow('ProstateBiopsyRow_3',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GG2</div>
                  <euc:EformTextBox RecordId="3" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server" ID="PathGG2_3"  onclick="focusThisHpiRow('ProstateBiopsyRow_3',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GGS</div>
                  <euc:EformTextBox RecordId="3" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server" ID="PathGGS_3"  onclick="focusThisHpiRow('ProstateBiopsyRow_3',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">Pos Cores</div>
                  <euc:EformTextBox  style="width:50px;" Field="PathPosCores" RecordId="3" Table="ProstateBiopsyPath" Runat="server" id="PathPosCores_3"  onclick="focusThisHpiRow('ProstateBiopsyRow_3',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Total Cores</div>
                  <euc:EformTextBox  style="width:50px;" Field="PathNumCores" RecordId="3" Table="ProstateBiopsyPath" Runat="server" id="PathNumCores_3"  onclick="focusThisHpiRow('ProstateBiopsyRow_3',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_3" RecordId="3" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(3);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="3" Runat="server" ID="ProcDate_3" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="3" Table="Procedures" Runat="server" id="EformTextBox1"  />
            <euc:EformTextBox style="display: none;"  Field="ProcSite" RecordId="3" Table="Procedures" Runat="server" id="ProcSite_3"  />
            <euc:EformTextBox style="display: none;" RecordId="3" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_3" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="3" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_3" Runat="server"  />

        </td>
    </tr>
    <tr id="ProstateBiopsyRow_4" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Prostate Biopsy</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="4"  ID="ProcDateText_4" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Type</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_4"  runat="server" RecordId="4"  onclick="focusThisHpiRow('ProstateBiopsyRow_4',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology" RecordId="4" Table="Pathology" Runat="server" id="PathHistology_4"  onclick="focusThisHpiRow('ProstateBiopsyRow_4',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology 2</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology2" RecordId="4" Table="Pathology" Runat="server" id="PathHistology2_4"  onclick="focusThisHpiRow('ProstateBiopsyRow_4',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">GG1</div>
                  <euc:EformTextBox RecordId="4" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server" ID="PathGG1_4"  onclick="focusThisHpiRow('ProstateBiopsyRow_4',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GG2</div>
                  <euc:EformTextBox RecordId="4" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server" ID="PathGG2_4"  onclick="focusThisHpiRow('ProstateBiopsyRow_4',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GGS</div>
                  <euc:EformTextBox RecordId="4" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server" ID="PathGGS_4"  onclick="focusThisHpiRow('ProstateBiopsyRow_4',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">Pos Cores</div>
                  <euc:EformTextBox  style="width:50px;" Field="PathPosCores" RecordId="4" Table="ProstateBiopsyPath" Runat="server" id="PathPosCores_4"  onclick="focusThisHpiRow('ProstateBiopsyRow_4',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Total Cores</div>
                  <euc:EformTextBox  style="width:50px;" Field="PathNumCores" RecordId="4" Table="ProstateBiopsyPath" Runat="server" id="PathNumCores_4"  onclick="focusThisHpiRow('ProstateBiopsyRow_4',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_4" RecordId="4" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(4);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="4" Runat="server" ID="ProcDate_4" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="4" Table="Procedures" Runat="server" id="EformTextBox2"  />
            <euc:EformTextBox style="display: none;"  Field="ProcSite" RecordId="4" Table="Procedures" Runat="server" id="ProcSite_4"  />
            <euc:EformTextBox style="display: none;" RecordId="4" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_4" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="4" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_4" Runat="server"  />

        </td>
    </tr>
    <tr id="ProstateBiopsyRow_5" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Prostate Biopsy</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="5"  ID="ProcDateText_5" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Type</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_5"  runat="server" RecordId="5"  onclick="focusThisHpiRow('ProstateBiopsyRow_5',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology" RecordId="5" Table="Pathology" Runat="server" id="PathHistology_5"  onclick="focusThisHpiRow('ProstateBiopsyRow_5',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology 2</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology2" RecordId="5" Table="Pathology" Runat="server" id="PathHistology2_5"  onclick="focusThisHpiRow('ProstateBiopsyRow_5',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">GG1</div>
                  <euc:EformTextBox RecordId="5" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server" ID="PathGG1_5"  onclick="focusThisHpiRow('ProstateBiopsyRow_5',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GG2</div>
                  <euc:EformTextBox RecordId="5" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server" ID="PathGG2_5"  onclick="focusThisHpiRow('ProstateBiopsyRow_5',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GGS</div>
                  <euc:EformTextBox RecordId="5" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server" ID="PathGGS_5"  onclick="focusThisHpiRow('ProstateBiopsyRow_5',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">Pos Cores</div>
                  <euc:EformTextBox  style="width:50px;" Field="PathPosCores" RecordId="5" Table="ProstateBiopsyPath" Runat="server" id="PathPosCores_5"  onclick="focusThisHpiRow('ProstateBiopsyRow_5',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Total Cores</div>
                  <euc:EformTextBox  style="width:50px;" Field="PathNumCores" RecordId="5" Table="ProstateBiopsyPath" Runat="server" id="PathNumCores_5"  onclick="focusThisHpiRow('ProstateBiopsyRow_5',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_5" RecordId="5" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(5);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="5" Runat="server" ID="ProcDate_5" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="5" Table="Procedures" Runat="server" id="EformTextBox3"  />
            <euc:EformTextBox style="display: none;"  Field="ProcSite" RecordId="5" Table="Procedures" Runat="server" id="ProcSite_5"  />
            <euc:EformTextBox style="display: none;" RecordId="5" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_5" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="5" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_5" Runat="server"  />

        </td>
    </tr>
    <tr id="ProstateBiopsyRow_6" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Prostate Biopsy</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="6"  ID="ProcDateText_6" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Type</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_6"  runat="server" RecordId="6"  onclick="focusThisHpiRow('ProstateBiopsyRow_6',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology" RecordId="6" Table="Pathology" Runat="server" id="PathHistology_6"  onclick="focusThisHpiRow('ProstateBiopsyRow_6',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology 2</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology2" RecordId="6" Table="Pathology" Runat="server" id="PathHistology2_6"  onclick="focusThisHpiRow('ProstateBiopsyRow_6',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">GG1</div>
                  <euc:EformTextBox RecordId="6" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server" ID="PathGG1_6"  onclick="focusThisHpiRow('ProstateBiopsyRow_6',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GG2</div>
                  <euc:EformTextBox RecordId="6" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server" ID="PathGG2_6"  onclick="focusThisHpiRow('ProstateBiopsyRow_6',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">GGS</div>
                  <euc:EformTextBox RecordId="6" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server" ID="PathGGS_6"  onclick="focusThisHpiRow('ProstateBiopsyRow_6',event)" /></td>
                <td><div class="hpiRecordHeaderColumn">Pos Cores</div>
                  <euc:EformTextBox  style="width:50px;" Field="PathPosCores" RecordId="6" Table="ProstateBiopsyPath" Runat="server" id="PathPosCores_6"  onclick="focusThisHpiRow('ProstateBiopsyRow_6',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Total Cores</div>
                  <euc:EformTextBox  style="width:50px;" Field="PathNumCores" RecordId="6" Table="ProstateBiopsyPath" Runat="server" id="PathNumCores_6"  onclick="focusThisHpiRow('ProstateBiopsyRow_6',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_6" RecordId="6" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(6);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="6" Runat="server" ID="ProcDate_6" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="6" Table="Procedures" Runat="server" id="EformTextBox4"  />
            <euc:EformTextBox style="display: none;"  Field="ProcSite" RecordId="6" Table="Procedures" Runat="server" id="ProcSite_6"  />
            <euc:EformTextBox style="display: none;" RecordId="6" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_6" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="6" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_6" Runat="server"  />

        </td>
    </tr>
    <tr id="OtherBiopsyRow_7" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Biopsy</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="7"  ID="ProcDateText_7" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Type</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_7"  runat="server" RecordId="7"  onclick="focusThisHpiRow('OtherBiopsyRow_7',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Site</div>
                  <euc:EformComboBox   LookupCode="BxSite"  style="width:90px;" Field="ProcSite" RecordId="7" Table="Procedures" Runat="server" id="ProcSite_7"  onclick="focusThisHpiRow('OtherBiopsyRow_7',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology" RecordId="7" Table="Pathology" Runat="server" id="PathHistology_7"  onclick="focusThisHpiRow('OtherBiopsyRow_7',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology 2</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology2" RecordId="7" Table="Pathology" Runat="server" id="PathHistology2_7"  onclick="focusThisHpiRow('OtherBiopsyRow_7',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_7" RecordId="7" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(7);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="7" Runat="server" ID="ProcDate_7" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="7" Table="Procedures" Runat="server" id="ProcApproach_7"  />
            <euc:EformTextBox style="display: none;" RecordId="7" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_7" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="7" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_7" Runat="server"  />

        </td>
    </tr>
    <tr id="OtherBiopsyRow_8" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Biopsy</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="8"  ID="ProcDateText_8" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Type</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_8"  runat="server" RecordId="8"  onclick="focusThisHpiRow('OtherBiopsyRow_8',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Site</div>
                  <euc:EformComboBox   LookupCode="BxSite"  style="width:90px;" Field="ProcSite" RecordId="8" Table="Procedures" Runat="server" id="ProcSite_8"  onclick="focusThisHpiRow('OtherBiopsyRow_8',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology" RecordId="8" Table="Pathology" Runat="server" id="PathHistology_8"  onclick="focusThisHpiRow('OtherBiopsyRow_8',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology 2</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology2" RecordId="8" Table="Pathology" Runat="server" id="PathHistology2_8"  onclick="focusThisHpiRow('OtherBiopsyRow_8',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_8" RecordId="8" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(8);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="8" Runat="server" ID="ProcDate_8" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="8" Table="Procedures" Runat="server" id="ProcApproach_8"  />
            <euc:EformTextBox style="display: none;" RecordId="8" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_8" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="8" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_8" Runat="server"  />

        </td>
    </tr>
    <tr id="OtherBiopsyRow_9" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Biopsy</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="9"  ID="ProcDateText_9" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Type</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_9"  runat="server" RecordId="9"  onclick="focusThisHpiRow('OtherBiopsyRow_9',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Site</div>
                  <euc:EformComboBox   LookupCode="BxSite"  style="width:90px;" Field="ProcSite" RecordId="9" Table="Procedures" Runat="server" id="ProcSite_9"  onclick="focusThisHpiRow('OtherBiopsyRow_9',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology" RecordId="9" Table="Pathology" Runat="server" id="PathHistology_9"  onclick="focusThisHpiRow('OtherBiopsyRow_9',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology 2</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology2" RecordId="9" Table="Pathology" Runat="server" id="PathHistology2_9"  onclick="focusThisHpiRow('OtherBiopsyRow_9',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_9" RecordId="9" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(9);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="9" Runat="server" ID="ProcDate_9" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="9" Table="Procedures" Runat="server" id="ProcApproach_9"  />
            <euc:EformTextBox style="display: none;" RecordId="9" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_9" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="9" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_9" Runat="server"  />

        </td>
    </tr>
    <tr id="OtherBiopsyRow_10" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Biopsy</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="10"  ID="ProcDateText_10" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Type</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_10"  runat="server" RecordId="10"  onclick="focusThisHpiRow('OtherBiopsyRow_10',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Site</div>
                  <euc:EformComboBox   LookupCode="BxSite"  style="width:90px;" Field="ProcSite" RecordId="10" Table="Procedures" Runat="server" id="ProcSite_10"  onclick="focusThisHpiRow('OtherBiopsyRow_10',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology" RecordId="10" Table="Pathology" Runat="server" id="PathHistology_10"  onclick="focusThisHpiRow('OtherBiopsyRow_10',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Histology 2</div>
                  <euc:EformComboBox   LookupCode="PathHistology"  style="width:90px;" Field="PathHistology2" RecordId="10" Table="Pathology" Runat="server" id="PathHistology2_10"  onclick="focusThisHpiRow('OtherBiopsyRow_10',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_10" RecordId="10" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(10);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="10" Runat="server" ID="ProcDate_10" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="10" Table="Procedures" Runat="server" id="ProcApproach_10"  />
            <euc:EformTextBox style="display: none;" RecordId="10" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_10" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="10" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_10" Runat="server"  />

        </td>
    </tr>
    <tr id="OtherProcRow_11" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Procedure</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="11"  ID="ProcDateText_11" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Procedure</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_11"  runat="server" RecordId="11"  onclick="focusThisHpiRow('OtherProcRow_11',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Side</div>
                  <euc:EformComboBox   LookupCode="OpSide"  style="width:90px;" Field="ProcSide" RecordId="11" Table="Procedures" Runat="server" id="ProcSide_11"  onclick="focusThisHpiRow('OtherProcRow_11',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Site</div>
                  <euc:EformComboBox   LookupCode="DxTarget"  style="width:90px;" Field="ProcSite" RecordId="11" Table="Procedures" Runat="server" id="ProcSite_11"  onclick="focusThisHpiRow('OtherProcRow_11',event)"  /></td>
                  
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_11" RecordId="11" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(11);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="11" Runat="server" ID="ProcDate_11" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="11" Table="Procedures" Runat="server" id="ProcApproach_11"  />
            <euc:EformTextBox style="display: none;" RecordId="11" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_11" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="11" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_11" Runat="server"  />

        </td>
    </tr>
    <tr id="OtherProcRow_12" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Procedure</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="12"  ID="ProcDateText_12" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Procedure</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_12"  runat="server" RecordId="12"  onclick="focusThisHpiRow('OtherProcRow_12',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Side</div>
                  <euc:EformComboBox   LookupCode="OpSide"  style="width:90px;" Field="ProcSide" RecordId="12" Table="Procedures" Runat="server" id="ProcSide_12"  onclick="focusThisHpiRow('OtherProcRow_12',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Site</div>
                  <euc:EformComboBox   LookupCode="DxTarget"  style="width:90px;" Field="ProcSite" RecordId="12" Table="Procedures" Runat="server" id="ProcSite_12"  onclick="focusThisHpiRow('OtherProcRow_12',event)"  /></td>
                  
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_12" RecordId="12" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(12);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="12" Runat="server" ID="ProcDate_12" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="12" Table="Procedures" Runat="server" id="ProcApproach_12"  />
            <euc:EformTextBox style="display: none;" RecordId="12" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_12" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="12" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_12" Runat="server"  />

        </td>
    </tr>
    <tr id="OtherProcRow_13" class="hpiNewRecordRow" style="display: none;" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Procedure</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="13"  ID="ProcDateText_13" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Procedure</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_13"  runat="server" RecordId="13"  onclick="focusThisHpiRow('OtherProcRow_13',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Side</div>
                  <euc:EformComboBox   LookupCode="OpSide"  style="width:90px;" Field="ProcSide" RecordId="13" Table="Procedures" Runat="server" id="ProcSide_13"  onclick="focusThisHpiRow('OtherProcRow_13',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Site</div>
                  <euc:EformComboBox   LookupCode="DxTarget"  style="width:90px;" Field="ProcSite" RecordId="13" Table="Procedures" Runat="server" id="ProcSite_13"  onclick="focusThisHpiRow('OtherProcRow_13',event)"  /></td>
                  
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_13" RecordId="13" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(13);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="13" Runat="server" ID="ProcDate_13" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="13" Table="Procedures" Runat="server" id="ProcApproach_13"  />
            <euc:EformTextBox style="display: none;" RecordId="13" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_13" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="13" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_13" Runat="server"  />

        </td>
    </tr>
    <tr id="hpiMenuTableContainer"  >
    	<td  >
    	<img alt="" src="../../Images/EFormAddMedicalTherapy.gif" hspace="0" width="176" height="16" border="0" class="ClickableImage"  style="cursor: pointer;"    onclick="addMedicalTherapy('', '', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');" />
    	<img alt="" src="../../Images/EFormAddOtherHPIItem.gif" hspace="0" width="176" height="16" border="0" class="ClickableImage"  style="cursor: pointer; margin-left: 15px;"  onclick="showHpiMenu();" />
        </td>
    </tr>
</table>



<div id="hpiMenuContainer" style="display: none;" >
    	        <div id="hpiMenuInnerContainer" >
    	            <div id="MostCommonItems" class="hpiMenuOff">
    	                <div class="hpiMenuTitle" onclick="toggleHPIMenu('MostCommonItems');" style="margin-top: 0px;">Most Common Items</div>
                        <span ><strong>Lupron</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Lupron', 'LHRH', '7.5', 'mg', 'Intramuscular', 'Monthly', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">7.5mg Monthly</a> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Lupron', 'LHRH', '22.5', 'mg', 'Intramuscular', 'Every 3 Months', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">22.5mg Every 3 Mo</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Lupron', 'LHRH', '30', 'mg', 'Intramuscular', 'Every 4 Months', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">30mg Every 4 Mo</a>
                        </span>
    	                <span><strong>Docetaxel</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Docetaxel', 'CHEMO', '75', 'mg/m2', 'Intravenous', 'Every 21 Days', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">75mg/m2 Every 21 Days</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Docetaxel', 'CHEMO', '100', 'mg/m2', 'Intravenous', 'Every 21 Days', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">100mg/m2 Every 21 Days</a>
                        </span>
                        <span><strong>Zoledronic Acid (Zometa)</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Zoledronic Acid (Zometa)', 'BISPHOSPHONATES', '5', 'mg', 'Intravenous', 'Every 6 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">5mg Every 6 Weeks</a>
                        </span>
                        <span><strong>Prostate Biopsy</strong> 
                        <a class="HPISubLink" href="javascript: addProstateBiopsy('Image-Guided Biopsy', 'Prostate', '', '', '', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Image-Guided</a>
                        <a class="HPISubLink" href="javascript: addProstateBiopsy('Needle Biopsy', 'Prostate', '', '', '', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Needle</a>
                        <a class="HPISubLink" href="javascript: addProstateBiopsy('TRUS Biopsy', 'Prostate', '', '', '', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">TRUS</a>
                        <a class="HPISubLink" href="javascript: addProstateBiopsy('TURP', 'Prostate', '', '', '', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">TURP</a>
                        </span>
    	                <span><strong>Prostatectomy</strong> 
    	                <a class="HPISubLink" href="javascript: addProstatectomy('RP','Open', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Radical</a>
    	                <a class="HPISubLink" href="javascript: addProstatectomy('LP','Laparoscopic', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Laparoscopic</a>
    	                <a class="HPISubLink" href="javascript: addProstatectomy('RALP','Robot Assisted Laparoscopic', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Robot Assisted Laparoscopic</a>
                        </span>
    	            </div>
    	            <div id="HormoneTherapyItems" class="hpiMenuOff">
    	                <div class="hpiMenuTitle" onclick="toggleHPIMenu('HormoneTherapyItems');">Hormone Therapy</div>
    	                <span><strong>Casodex</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Casodex (bicalutamide)', 'AA', '50', 'mg', 'Orally', 'Daily', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">50mg Daily</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Casodex (bicalutamide)', 'AA', '150', 'mg', 'Orally', 'Daily', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">150mg Daily</a>
                        </span>
                        <a href="javascript: addMedicalTherapy('Casodex Withdrawal', 'AA', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');" >Casodex Withdrawal</a>
                        <span><strong>Flutamide</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Flutamide', 'AA', '250', 'mg', 'Orally', 'Every 8 Hours', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">250mg Every 8 Hours</a>
                        </span>
                        <a href="javascript: addMedicalTherapy('Flutamide Withdrawal', 'AA', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');" >Flutamide Withdrawal</a>
                        <span><strong>Degarelix</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Degarelix', 'AA', '80', 'mg', 'Subcutaneous', 'Every 28 Days', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">80mg Every 28 Days</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Degarelix', 'AA', '120', 'mg', 'Subcutaneous', 'Every 28 Days', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">120mg Every 28 Days</a>
                        </span>
                        <span><strong>Ketoconazole</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Ketoconazole', 'AA', '200', 'mg', 'Orally', 'Every 8 Hours', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">200mg Every 8 Hours</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Ketoconazole', 'AA', '400', 'mg', 'Orally', 'Every 8 Hours', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">400mg Every 8 Hours</a>
                        </span>
                        <span><strong>Lupron</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Lupron', 'LHRH', '7.5', 'mg', 'Intramuscular', 'Monthly', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">7.5mg Monthly</a> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Lupron', 'LHRH', '22.5', 'mg', 'Intramuscular', 'Every 3 Months', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">22.5mg Every 3 Mo</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Lupron', 'LHRH', '30', 'mg', 'Intramuscular', 'Every 4 Months', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">30mg Every 4 Mo</a>
                        </span>
                        <span><strong>Nilandron</strong>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Nilandron (nilutamide)', 'AA', '150', 'mg', 'Orally', 'Daily', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">150mg Daily</a>
                        </span>
                        <a href="javascript: addMedicalTherapy('Nilandron Withdrawal', 'AA', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');" >Nilandron Withdrawal</a>
                        <span><strong>Zoladex (Goserelin)</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Zoladex (Goserelin)', 'LHRH', '10.8', 'mg', 'Subcutaneous', 'Monthly', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">10.8mg Monthly</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Zoladex (Goserelin)', 'LHRH', '3.6', 'mg', 'Subcutaneous', 'Every 3 Months', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">3.6mg Every 3 Mo</a></span>
    	                
                        <a href="javascript: addMedicalTherapy('', 'HORM', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');" >Other Hormone Therapy</a>
    	            
    	            </div>
    	            <div id="ChemotherapyItems" class="hpiMenuOff">
    	                <div class="hpiMenuTitle" onclick="toggleHPIMenu('ChemotherapyItems');">Chemotherapy</div>
    	                <span><strong>Docetaxel</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Docetaxel', 'CHEMO', '75', 'mg/m2', 'Intravenous', 'Every 21 Days', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">75mg/m2 Every 21 Days</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Docetaxel', 'CHEMO', '100', 'mg/m2', 'Intravenous', 'Every 21 Days', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">100mg/m2 Every 21 Days</a>
                        </span>
                        <span><strong>Zoledronic Acid (Zometa)</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Zoledronic Acid (Zometa)', 'BISPHOSPHONATES', '5', 'mg', 'Intravenous', 'Every 6 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">5mg Every 6 Weeks</a>
                        </span>
                        <span><strong>Proscar</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Proscar', '5_ALPHA', '5', 'mg', 'Orally', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">5mg</a>
                        </span>
                        <span><strong>Carboplatin</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Carboplatin', 'CHEMO', '50', 'mg', 'Intravenous', 'Every 4 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">50mg Every 4 Wks</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Carboplatin', 'CHEMO', '150', 'mg', 'Intravenous', 'Every 4 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">150mg Every 4 Wks</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Carboplatin', 'CHEMO', '450', 'mg', 'Intravenous', 'Every 4 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">450mg Every 4 Wks</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Carboplatin', 'CHEMO', '600', 'mg', 'Intravenous', 'Every 4 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">600mg Every 4 Wks</a>
                        </span>
    	                <span><strong>Cisplatin</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Cisplatin', 'CHEMO', '50', 'mg/m2', 'Intravenous', 'Every 4 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">75mg/m2 Every 4 Weeks</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Cisplatin', 'CHEMO', '150', 'mg/m2', 'Intravenous', 'Every 4 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">100mg/m2 Every 4 Weeks</a>
                        </span>
                        <span><strong>Hydrocortisone</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Hydrocortisone', 'STEROID', '10', 'mg', 'Orally', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">10mg</a>
                        </span>
    	                <span><strong>Mytomycin</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Mytomycin', 'CHEMO', '10', 'mg/m2', 'Intravenous', 'Every 6 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">10mg/m2 Every 6 Weeks</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Mytomycin', 'CHEMO', '20', 'mg/m2', 'Intravenous', 'Every 6 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">20mg/m2 Every 6 Weeks</a>
                        </span>
    	                <span><strong>Mitoxantrone</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Mitoxantrone', 'CHEMO', '12', 'mg/m2', 'Intravenous', 'Every 21 Days', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">12mg/m2 Every 21 Days</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Mitoxantrone', 'CHEMO', '14', 'mg/m2', 'Intravenous', 'Every 21 Days', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">14mg/m2 Every 21 Days</a>
                        </span>
                        <span><strong>Pamidronate</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Pamidronate', 'BISPHOSPHONATES', '90', 'mg', 'Intravenous', 'Every 3 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">90mg Every 3 Weeks</a>
                        </span>
                        <span><strong>Prednisone</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Prednisone', 'STEROID', '60', 'mg', 'Orally', 'Daily', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">60mg Daily</a>
                        </span>
                        <span><strong>Samarium</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Samarium', 'RADIOISOTOPE', '1850', 'MBq/ml', 'Intravenous', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">1850MBq/ml</a>
                        </span>
    	                <span><strong>Paclitaxel</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Paclitaxel', 'CHEMO', '135', 'mg/m2', 'Intravenous', 'Every 3 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">135mg/m2 Every 3 Weeks</a>
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Paclitaxel', 'CHEMO', '175', 'mg/m2', 'Intravenous', 'Every 3 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">175mg/m2 Every 3 Weeks</a>
                        </span>
    	                <span><strong>Vinblastine</strong> 
                        <a class="HPISubLink" href="javascript: addMedicalTherapy('Vinblastine', 'CHEMO', '18.5', 'mg/m2', 'Intravenous', 'Weekly', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">18.5mg/m2 Weekly</a>
                        </span>
    	                <a href="javascript: addMedicalTherapy('', 'CHEMO', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Other Chemotherapy</a>
    	            </div>
    	            <div id="BiologicItems" class="hpiMenuOff">
    	                <div class="hpiMenuTitle" onclick="toggleHPIMenu('BiologicItems');">Biologic/Immunotherapy</div>
    	                <a href="javascript: addMedicalTherapy('J591', 'IMMUNO', '', '', 'Intravenous', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">J591</a>
    	                <a href="javascript: addMedicalTherapy('Provenge', 'IMMUNO', '', '', 'Intravenous', 'Every 2 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Provenge Every 2 Weeks</a>
    	                <a href="javascript: addMedicalTherapy('GM-CSF', 'IMMUNO', '250', 'mg/m2', 'Intravenous', 'Every 2 Weeks', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">GM-CSF 250mg/m2 Every 2 Weeks</a>
    	                <a href="javascript: addMedicalTherapy('IL2 (aldesleukin)', 'IMMUNO', '0.037', 'mg/kg', 'Intravenous', 'Every 8 Hours', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">IL2 (aldesleukin) 0.037mg/kg Every 8 Hours</a>
    	                <a href="javascript: addMedicalTherapy('Leukine (sargramostim)', 'IMMUNO', '250', 'mcg/m2', 'Intravenous', 'Daily', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Leukine (sargramostim) 250mcg/m2 Daily</a>
    	                <a href="javascript: addMedicalTherapy('', 'IMMUNO', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Other Immunotherapy</a>
    	            </div>
    	            <div id="RadiationTherapyItems" class="hpiMenuOff">
    	                <div class="hpiMenuTitle" onclick="toggleHPIMenu('RadiationTherapyItems');">Radiation Therapy</div>
                        <span><strong>External Beam</strong> 
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam', 'Prostate', '8640', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">8640 cGy</a>
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam', 'Prostate', '8100', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">8100 cGy</a>
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam', 'Prostate', '7020', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">7020 cGy</a>
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam', 'Prostate', '7200', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">7200 cGy</a>
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam', 'Prostate', '', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Other Dose</a>
                        </span>
                        <span><strong>External Beam, IMRT</strong> 
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam, IMRT', 'Prostate', '8640', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">8640 cGy</a>
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam, IMRT', 'Prostate', '8100', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">8100 cGy</a>
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam, IMRT', 'Prostate', '7020', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">7020 cGy</a>
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam, IMRT', 'Prostate', '7200', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">7200 cGy</a>
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam, IMRT', 'Prostate', '', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Other Dose</a>
                        </span>
                        <span><strong>External Beam, 3D Conformal</strong> 
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam, 3D Conformal', 'Prostate', '8100', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">8100 cGy</a>
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam, 3D Conformal', 'Prostate', '7020', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">7020 cGy</a>
                        <a class="HPISubLink" href="javascript: addRadiationTherapy('External Beam, 3D Conformal', 'Prostate', '', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Other Dose</a>
                        </span>
    	                <a href="javascript: addRadiationTherapy('', 'Prostate', '', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Radiation Therapy, Unspecified</a>
    	                <a href="javascript: addRadiationTherapy('', '', '', 'cGy', '', 'Prostate Cancer', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">External Beam (other target)</a>
    	                <a href="javascript: addBrachyTherapy('', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">BrachyTherapy</a>
    	            </div>
    	            <div id="BiopsyItems" class="hpiMenuOff">
    	                <div class="hpiMenuTitle" onclick="toggleHPIMenu('BiopsyItems');">Biopsy</div>
                        <span><strong>Prostate</strong> 
                        <a class="HPISubLink" href="javascript: addProstateBiopsy('Image-Guided Biopsy', 'Prostate', '', '', '', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Image-Guided</a>
                        <a class="HPISubLink" href="javascript: addProstateBiopsy('Needle Biopsy', 'Prostate', '', '', '', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Needle</a>
                        <a class="HPISubLink" href="javascript: addProstateBiopsy('TRUS Biopsy', 'Prostate', '', '', '', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">TRUS</a>
                        <a class="HPISubLink" href="javascript: addProstateBiopsy('TURP', 'Prostate', '', '', '', '', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">TURP</a>
                        </span>
                        <span><strong>Non-Prostate</strong> 
                        <a class="HPISubLink" href="javascript: addOtherBiopsy('Bone Marrow Biopsy', 'Bone', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Bone Marrow</a>
                        <a class="HPISubLink" href="javascript: addOtherBiopsy('Fine Needle Aspirate', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Fine Needle Aspirate</a>
                        <a class="HPISubLink" href="javascript: addOtherBiopsy('PLND', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">PLND</a>
                        <a class="HPISubLink" href="javascript: addOtherBiopsy('Biopsy', '', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Other Biopsy</a>
                        </span>


    	            </div>
    	            <div id="SurgeryItems" class="hpiMenuOff">
    	                <div class="hpiMenuTitle" onclick="toggleHPIMenu('SurgeryItems');">Surgical Procedure</div>
    	                <span><strong>Prostatectomy</strong> 
    	                <a class="HPISubLink" href="javascript: addProstatectomy('RP','Open', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Radical</a>
    	                <a class="HPISubLink" href="javascript: addProstatectomy('LP','Laparoscopic', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Laparoscopic</a>
    	                <a class="HPISubLink" href="javascript: addProstatectomy('RALP','Robot Assisted Laparoscopic', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Robot Assisted Laparoscopic</a>
                        </span>
    	                
                        <a href="javascript: addOtherProc('', '', '', 'Done Here', 'Memorial Sloan Kettering Cancer Center', 'STD');">Other Procedure</a>
    	            </div>
    	        
    	        
    	        
    	        </div>
    	    </div>

<%--<a onclick="loadHTMLTableToArray()">loadHTMLTableToArray</a>
<br />
<a onclick="showArray()">show array</a>
<br />
<a onclick="sortHpiArray()">sort array</a>
<br />
<a onclick="sortHpiTopTableByArray()">sort html table</a>
<br /><br /><br /><br />
--%>

<script type="text/javascript">

var medTxInputArray = new Array();

function medTxInputRow(agent, type, dose, units, route, schedule, location, institution, quality) {
    this.Agent = agent;
    this.Type = type;
    this.Dose = dose;
    this.Units = units;
    this.Route = route;
    this.Schedule = schedule;
    this.Location = location;
    this.Institution = institution;
    this.Quality = quality;
}

function registerMedTxInputs()
{
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow('','','','','','','','',''); // filler because recordId's start with 1, not 0
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_1.ClientID %>'), $('<% = MedTxType_1.ClientID %>'), $('<% = MedTxDose_1.ClientID %>'), $('<% = MedTxUnits_1.ClientID %>'), $('<% = MedTxRoute_1.ClientID %>'), $('<% = MedTxSchedule_1.ClientID %>'), $('<% = MedTxLocation_1.ClientID %>'), $('<% = MedTxInstitution_1.ClientID %>'), $('<% = MedTxQuality_1.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_2.ClientID %>'), $('<% = MedTxType_2.ClientID %>'), $('<% = MedTxDose_2.ClientID %>'), $('<% = MedTxUnits_2.ClientID %>'), $('<% = MedTxRoute_2.ClientID %>'), $('<% = MedTxSchedule_2.ClientID %>'), $('<% = MedTxLocation_2.ClientID %>'), $('<% = MedTxInstitution_2.ClientID %>'), $('<% = MedTxQuality_2.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_3.ClientID %>'), $('<% = MedTxType_3.ClientID %>'), $('<% = MedTxDose_3.ClientID %>'), $('<% = MedTxUnits_3.ClientID %>'), $('<% = MedTxRoute_3.ClientID %>'), $('<% = MedTxSchedule_3.ClientID %>'), $('<% = MedTxLocation_3.ClientID %>'), $('<% = MedTxInstitution_3.ClientID %>'), $('<% = MedTxQuality_3.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_4.ClientID %>'), $('<% = MedTxType_4.ClientID %>'), $('<% = MedTxDose_4.ClientID %>'), $('<% = MedTxUnits_4.ClientID %>'), $('<% = MedTxRoute_4.ClientID %>'), $('<% = MedTxSchedule_4.ClientID %>'), $('<% = MedTxLocation_4.ClientID %>'), $('<% = MedTxInstitution_4.ClientID %>'), $('<% = MedTxQuality_4.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_5.ClientID %>'), $('<% = MedTxType_5.ClientID %>'), $('<% = MedTxDose_5.ClientID %>'), $('<% = MedTxUnits_5.ClientID %>'), $('<% = MedTxRoute_5.ClientID %>'), $('<% = MedTxSchedule_5.ClientID %>'), $('<% = MedTxLocation_5.ClientID %>'), $('<% = MedTxInstitution_5.ClientID %>'), $('<% = MedTxQuality_5.ClientID %>'));
}
registerMedTxInputs();


function addMedicalTherapy(agent, type, dose, units, route, schedule, location, institution, quality)
{
    var newMedTxRowIndex = nextAvailableMedTxRowIndex();
    if (newMedTxRowIndex != null)
    {
        var newMedTxRow = $('MedicalTherapyRow_' + newMedTxRowIndex.toString());
        var newMedTxRowInputs = medTxInputArray[newMedTxRowIndex];
        
        for (var i=1;i<6;i++)
	    {
		    $('MedicalTherapyRow_' + i.toString()).className = 'hpiNewRecordRow';
	    }

        newMedTxRow.style.display = '';
        focusHpiRow(newMedTxRow);
        
        (newMedTxRowInputs.Agent).value = agent;
        (newMedTxRowInputs.Type).value = type;
        (newMedTxRowInputs.Dose).value = dose;
        (newMedTxRowInputs.Units).value = units;
        (newMedTxRowInputs.Route).value = route;
        (newMedTxRowInputs.Schedule).value = schedule;
        (newMedTxRowInputs.Location).value = location;
        (newMedTxRowInputs.Institution).value = institution;
        (newMedTxRowInputs.Quality).value = quality;
    }
    else { alert('The maximum number of medical therapies has been added.'); }
}
function nextAvailableMedTxRowIndex()
{
    var nextRowIndex = null;
    
    for (var i=1;i<6;i++)
	{
		if ($('MedicalTherapyRow_' + i.toString()).style.display && $('MedicalTherapyRow_' + i.toString()).style.display == 'none')
		{
		    nextRowIndex = i;
		    break;
		}
		
	}
	
	return nextRowIndex;
}


var radTxInputArray = new Array();

function radTxInputRow(type, target, totalDose, units, numFractions, disease, location, institution, quality) {
    this.Type = type;
    this.Target = target;
    this.TotalDose = totalDose;
    this.Units = units;
    this.NumFractions = numFractions;
    this.Disease = disease;
    this.Location = location;
    this.Institution = institution;
    this.Quality = quality;
}

function registerRadTxInputs()
{
    radTxInputArray[radTxInputArray.length++] = new radTxInputRow('','','','','','','','',''); // filler because recordId's start with 1, not 0
    radTxInputArray[radTxInputArray.length++] = new radTxInputRow($('<% = RadTxType_1.ClientID %>'), $('<% = RadTxTarget_1.ClientID %>'), $('<% = RadTxTotalDose_1.ClientID %>'), $('<% = RadTxUnits_1.ClientID %>'), $('<% = RadTxNumFractions_1.ClientID %>'), $('<% = RadTxDisease_1.ClientID %>'), $('<% = RadTxLocation_1.ClientID %>'), $('<% = RadTxInstitution_1.ClientID %>'), $('<% = RadTxQuality_1.ClientID %>'));
    radTxInputArray[radTxInputArray.length++] = new radTxInputRow($('<% = RadTxType_2.ClientID %>'), $('<% = RadTxTarget_2.ClientID %>'), $('<% = RadTxTotalDose_2.ClientID %>'), $('<% = RadTxUnits_2.ClientID %>'), $('<% = RadTxNumFractions_2.ClientID %>'), $('<% = RadTxDisease_2.ClientID %>'), $('<% = RadTxLocation_2.ClientID %>'), $('<% = RadTxInstitution_2.ClientID %>'), $('<% = RadTxQuality_2.ClientID %>'));
    radTxInputArray[radTxInputArray.length++] = new radTxInputRow($('<% = RadTxType_3.ClientID %>'), $('<% = RadTxTarget_3.ClientID %>'), $('<% = RadTxTotalDose_3.ClientID %>'), $('<% = RadTxUnits_3.ClientID %>'), $('<% = RadTxNumFractions_3.ClientID %>'), $('<% = RadTxDisease_3.ClientID %>'), $('<% = RadTxLocation_3.ClientID %>'), $('<% = RadTxInstitution_3.ClientID %>'), $('<% = RadTxQuality_3.ClientID %>'));
}
registerRadTxInputs();


function addRadiationTherapy(type, target, totalDose, units, numFractions, disease, location, institution, quality)
{
    var newRadTxRowIndex = nextAvailableRadTxRowIndex();
    if (newRadTxRowIndex != null)
    {
        var newRadTxRow = $('RadiationTherapyRow_' + newRadTxRowIndex.toString());
        var newRadTxRowInputs = radTxInputArray[newRadTxRowIndex];

        for (var i=1;i<4;i++)
	    {
		    $('RadiationTherapyRow_' + i.toString()).className = 'hpiNewRecordRow';
	    }

        newRadTxRow.style.display = '';
        focusHpiRow(newRadTxRow);
        
        (newRadTxRowInputs.Type).value = type;
        (newRadTxRowInputs.Target).value = target;
        (newRadTxRowInputs.TotalDose).value = totalDose;
        (newRadTxRowInputs.Units).value = units;
        (newRadTxRowInputs.NumFractions).value = numFractions;
        (newRadTxRowInputs.Disease).value = disease;
        (newRadTxRowInputs.Location).value = location;
        (newRadTxRowInputs.Institution).value = institution;
        (newRadTxRowInputs.Quality).value = quality;
    }
    else { alert('The maximum number of radiation therapies has been added.'); }
}
function nextAvailableRadTxRowIndex()
{
    var nextRowIndex = null;
    
    for (var i=1;i<4;i++)
	{
		if ($('RadiationTherapyRow_' + i.toString()).style.display && $('RadiationTherapyRow_' + i.toString()).style.display == 'none')
		{
		    nextRowIndex = i;
		    break;
		}
		
	}
	
	return nextRowIndex;
}


function addProstatectomy(type, approach, location, institution, quality)
{
    var row = $('ProstatectomyRow_1');
    clearAllElementsContainedInNode(row);
    $('ProstatectomyRow_1').style.display = '';
    $('<% = OpType_Prostatectomy.ClientID %>').value = type;
    $('<% = ProstatectomyApproach.ClientID %>').value = approach;
    $('<% = ProcLocation_1.ClientID %>').value = location;
    $('<% = ProcInstitution_1.ClientID %>').value = institution;
    $('<% = ProcQuality_1.ClientID %>').value = quality;
    $('<% = ProcSite_1.ClientID %>').value = 'Prostate';
    
    focusHpiRow(row);
}


function addBrachyTherapy(prescribedDose, isotope, location, institution, quality)
{
    var row = $('BrachyTherapyRow_1');
    clearAllElementsContainedInNode(row);
    row.style.display = '';
    $('<% = BrachyPrescribedDose_1.ClientID %>').value = prescribedDose;
    $('<% = BrachyIsotope_1.ClientID %>').value = isotope;
    $('<% = BrachyLocation_1.ClientID %>').value = location;
    $('<% = BrachyInstitution_1.ClientID %>').value = institution;
    $('<% = BrachyQuality_1.ClientID %>').value = quality;
    focusHpiRow(row);
}



var prostateBiopsyInputArray = new Array();

function prostateBiopsyInputRow(procName, procSite, pathHistology, pathHistology2, pathGG1, pathGG2, pathGGS, posCores, numCores, location, institution, quality) {
    this.ProcName = procName;
    this.ProcSite = procSite;
    this.PathHistology = pathHistology;
    this.PathHistology2 = pathHistology2;
    this.PathGG1 = pathGG1;
    this.PathGG2 = pathGG2;
    this.PathGGS = pathGGS;
    this.PosCores = posCores;
    this.NumCores = numCores;
    this.Location = location;
    this.Institution = institution;
    this.Quality = quality;
}

function registerProstateBiopsyInputs()
{
    prostateBiopsyInputArray[prostateBiopsyInputArray.length++] = new prostateBiopsyInputRow('','','','','','','','',''); // filler because recordId's start with 2, not 0
    prostateBiopsyInputArray[prostateBiopsyInputArray.length++] = new prostateBiopsyInputRow('','','','','','','','',''); // filler because recordId's start with 2, not 0
    prostateBiopsyInputArray[prostateBiopsyInputArray.length++] = new prostateBiopsyInputRow($('<% = ProcName_2.ClientID %>'), $('<% = ProcSite_2.ClientID %>'), $('<% = PathHistology_2.ClientID %>'), $('<% = PathHistology2_2.ClientID %>'), $('<% = PathGG1_2.ClientID %>'), $('<% = PathGG2_2.ClientID %>'), $('<% = PathGGS_2.ClientID %>'), $('<% = PathPosCores_2.ClientID %>'), $('<% = PathNumCores_2.ClientID %>'), $('<% = ProcLocation_2.ClientID %>'), $('<% = ProcInstitution_2.ClientID %>'), $('<% = ProcQuality_2.ClientID %>'));
    prostateBiopsyInputArray[prostateBiopsyInputArray.length++] = new prostateBiopsyInputRow($('<% = ProcName_3.ClientID %>'), $('<% = ProcSite_3.ClientID %>'), $('<% = PathHistology_3.ClientID %>'), $('<% = PathHistology2_3.ClientID %>'), $('<% = PathGG1_3.ClientID %>'), $('<% = PathGG2_3.ClientID %>'), $('<% = PathGGS_3.ClientID %>'), $('<% = PathPosCores_3.ClientID %>'), $('<% = PathNumCores_3.ClientID %>'), $('<% = ProcLocation_3.ClientID %>'), $('<% = ProcInstitution_3.ClientID %>'), $('<% = ProcQuality_3.ClientID %>'));
    prostateBiopsyInputArray[prostateBiopsyInputArray.length++] = new prostateBiopsyInputRow($('<% = ProcName_4.ClientID %>'), $('<% = ProcSite_4.ClientID %>'), $('<% = PathHistology_4.ClientID %>'), $('<% = PathHistology2_4.ClientID %>'), $('<% = PathGG1_4.ClientID %>'), $('<% = PathGG2_4.ClientID %>'), $('<% = PathGGS_4.ClientID %>'), $('<% = PathPosCores_4.ClientID %>'), $('<% = PathNumCores_4.ClientID %>'), $('<% = ProcLocation_4.ClientID %>'), $('<% = ProcInstitution_4.ClientID %>'), $('<% = ProcQuality_4.ClientID %>'));
    prostateBiopsyInputArray[prostateBiopsyInputArray.length++] = new prostateBiopsyInputRow($('<% = ProcName_5.ClientID %>'), $('<% = ProcSite_5.ClientID %>'), $('<% = PathHistology_5.ClientID %>'), $('<% = PathHistology2_5.ClientID %>'), $('<% = PathGG1_5.ClientID %>'), $('<% = PathGG2_5.ClientID %>'), $('<% = PathGGS_5.ClientID %>'), $('<% = PathPosCores_5.ClientID %>'), $('<% = PathNumCores_5.ClientID %>'), $('<% = ProcLocation_5.ClientID %>'), $('<% = ProcInstitution_5.ClientID %>'), $('<% = ProcQuality_5.ClientID %>'));
    prostateBiopsyInputArray[prostateBiopsyInputArray.length++] = new prostateBiopsyInputRow($('<% = ProcName_6.ClientID %>'), $('<% = ProcSite_6.ClientID %>'), $('<% = PathHistology_6.ClientID %>'), $('<% = PathHistology2_6.ClientID %>'), $('<% = PathGG1_6.ClientID %>'), $('<% = PathGG2_6.ClientID %>'), $('<% = PathGGS_6.ClientID %>'), $('<% = PathPosCores_6.ClientID %>'), $('<% = PathNumCores_6.ClientID %>'), $('<% = ProcLocation_6.ClientID %>'), $('<% = ProcInstitution_6.ClientID %>'), $('<% = ProcQuality_6.ClientID %>'));
    
    
}
registerProstateBiopsyInputs();


function addProstateBiopsy(procName, procSite, pathHistology, pathHistology2, pathGG1, pathGG2, pathGGS, posCores, numCores, location, institution, quality)
{
    var newProstateBiopsyRowIndex = nextAvailableProstateBiopsyRowIndex();
    if (newProstateBiopsyRowIndex != null)
    {
        var newProstateBiopsyRow = $('ProstateBiopsyRow_' + newProstateBiopsyRowIndex.toString());
        var newProstateBiopsyRowInputs = prostateBiopsyInputArray[newProstateBiopsyRowIndex];

        for (var i=2;i<7;i++)
	    {
		    $('ProstateBiopsyRow_' + i.toString()).className = 'hpiNewRecordRow';
	    }

        newProstateBiopsyRow.style.display = '';
        focusHpiRow(newProstateBiopsyRow);
        
        (newProstateBiopsyRowInputs.ProcName).value = procName;
        (newProstateBiopsyRowInputs.ProcSite).value = procSite;
        (newProstateBiopsyRowInputs.PathHistology).value = pathHistology;
        (newProstateBiopsyRowInputs.PathHistology2).value = pathHistology2;
        (newProstateBiopsyRowInputs.PathGG1).value = pathGG1;
        (newProstateBiopsyRowInputs.PathGG2).value = pathGG2;
        (newProstateBiopsyRowInputs.PathGGS).value = pathGGS;
        (newProstateBiopsyRowInputs.PosCores).value = posCores;
        (newProstateBiopsyRowInputs.NumCores).value = numCores;
        (newProstateBiopsyRowInputs.Location).value = location;
        (newProstateBiopsyRowInputs.Institution).value = institution;
        (newProstateBiopsyRowInputs.Quality).value = quality;
    }
    else { alert('The maximum number of prostate biopsies has been added.'); }
}
function nextAvailableProstateBiopsyRowIndex()
{
    var nextRowIndex = null;
    
    for (var i=2;i<7;i++)
	{
		if ($('ProstateBiopsyRow_' + i.toString()).style.display && $('ProstateBiopsyRow_' + i.toString()).style.display == 'none')
		{
		    nextRowIndex = i;
		    break;
		}
		
	}
	
	return nextRowIndex;
}




var otherBiopsyInputArray = new Array();

function otherBiopsyInputRow(procName, procSite, pathHistology, pathHistology2, location, institution, quality) {
    this.ProcName = procName;
    this.ProcSite = procSite;
    this.PathHistology = pathHistology;
    this.PathHistology2 = pathHistology2;
    this.Location = location;
    this.Institution = institution;
    this.Quality = quality;
}

function registerOtherBiopsyInputs()
{
    otherBiopsyInputArray[otherBiopsyInputArray.length++] = new otherBiopsyInputRow('','','','','','',''); // filler because recordId's start with 2, not 0
    otherBiopsyInputArray[otherBiopsyInputArray.length++] = new otherBiopsyInputRow('','','','','','',''); // filler because recordId's start with 2, not 0
    otherBiopsyInputArray[otherBiopsyInputArray.length++] = new otherBiopsyInputRow('','','','','','',''); // filler because recordId's start with 2, not 0
    otherBiopsyInputArray[otherBiopsyInputArray.length++] = new otherBiopsyInputRow('','','','','','',''); // filler because recordId's start with 2, not 0
    otherBiopsyInputArray[otherBiopsyInputArray.length++] = new otherBiopsyInputRow('','','','','','',''); // filler because recordId's start with 2, not 0
    otherBiopsyInputArray[otherBiopsyInputArray.length++] = new otherBiopsyInputRow('','','','','','',''); // filler because recordId's start with 2, not 0
    otherBiopsyInputArray[otherBiopsyInputArray.length++] = new otherBiopsyInputRow('','','','','','',''); // filler because recordId's start with 2, not 0
    otherBiopsyInputArray[otherBiopsyInputArray.length++] = new otherBiopsyInputRow($('<% = ProcName_7.ClientID %>'), $('<% = ProcSite_7.ClientID %>'), $('<% = PathHistology_7.ClientID %>'), $('<% = PathHistology2_7.ClientID %>'), $('<% = ProcLocation_7.ClientID %>'), $('<% = ProcInstitution_7.ClientID %>'), $('<% = ProcQuality_7.ClientID %>'));
    otherBiopsyInputArray[otherBiopsyInputArray.length++] = new otherBiopsyInputRow($('<% = ProcName_8.ClientID %>'), $('<% = ProcSite_8.ClientID %>'), $('<% = PathHistology_8.ClientID %>'), $('<% = PathHistology2_8.ClientID %>'), $('<% = ProcLocation_8.ClientID %>'), $('<% = ProcInstitution_8.ClientID %>'), $('<% = ProcQuality_8.ClientID %>'));
    otherBiopsyInputArray[otherBiopsyInputArray.length++] = new otherBiopsyInputRow($('<% = ProcName_9.ClientID %>'), $('<% = ProcSite_9.ClientID %>'), $('<% = PathHistology_9.ClientID %>'), $('<% = PathHistology2_9.ClientID %>'), $('<% = ProcLocation_9.ClientID %>'), $('<% = ProcInstitution_9.ClientID %>'), $('<% = ProcQuality_9.ClientID %>'));
    otherBiopsyInputArray[otherBiopsyInputArray.length++] = new otherBiopsyInputRow($('<% = ProcName_10.ClientID %>'), $('<% = ProcSite_10.ClientID %>'), $('<% = PathHistology_10.ClientID %>'), $('<% = PathHistology2_10.ClientID %>'), $('<% = ProcLocation_10.ClientID %>'), $('<% = ProcInstitution_10.ClientID %>'), $('<% = ProcQuality_10.ClientID %>'));
    
}
registerOtherBiopsyInputs();


function addOtherBiopsy(procName, procSite, pathHistology, pathHistology2, location, institution, quality)
{
    var newOtherBiopsyRowIndex = nextAvailableOtherBiopsyRowIndex();
    if (newOtherBiopsyRowIndex != null)
    {
        var newOtherBiopsyRow = $('OtherBiopsyRow_' + newOtherBiopsyRowIndex.toString());
        var newOtherBiopsyRowInputs = otherBiopsyInputArray[newOtherBiopsyRowIndex];

        for (var i=7;i<11;i++)
	    {
		    $('OtherBiopsyRow_' + i.toString()).className = 'hpiNewRecordRow';
	    }

        newOtherBiopsyRow.style.display = '';
        focusHpiRow(newOtherBiopsyRow);
        
        (newOtherBiopsyRowInputs.ProcName).value = procName;
        (newOtherBiopsyRowInputs.ProcSite).value = procSite;
        (newOtherBiopsyRowInputs.PathHistology).value = pathHistology;
        (newOtherBiopsyRowInputs.PathHistology2).value = pathHistology2;
        (newOtherBiopsyRowInputs.Location).value = location;
        (newOtherBiopsyRowInputs.Institution).value = institution;
        (newOtherBiopsyRowInputs.Quality).value = quality;
    }
    else { alert('The maximum number of biopsies has been added.'); }
}
function nextAvailableOtherBiopsyRowIndex()
{
    var nextRowIndex = null;
    
    for (var i=7;i<11;i++)
	{
		if ($('OtherBiopsyRow_' + i.toString()).style.display && $('OtherBiopsyRow_' + i.toString()).style.display == 'none')
		{
		    nextRowIndex = i;
		    break;
		}
		
	}
	
	return nextRowIndex;
}



var otherProcInputArray = new Array();

function otherProcInputRow(procName, procSide, procSite, location, institution, quality) {
    this.ProcName = procName;
    this.ProcSide = procSide;
    this.ProcSite = procSite;
    this.Location = location;
    this.Institution = institution;
    this.Quality = quality;
}
function registerOtherProcInputs()
{
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow('','','','','',''); // filler because recordId's start with 11, not 0
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow('','','','','',''); // filler because recordId's start with 11, not 0
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow('','','','','',''); // filler because recordId's start with 11, not 0
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow('','','','','',''); // filler because recordId's start with 11, not 0
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow('','','','','',''); // filler because recordId's start with 11, not 0
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow('','','','','',''); // filler because recordId's start with 11, not 0
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow('','','','','',''); // filler because recordId's start with 11, not 0
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow('','','','','',''); // filler because recordId's start with 11, not 0
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow('','','','','',''); // filler because recordId's start with 11, not 0
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow('','','','','',''); // filler because recordId's start with 11, not 0
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow('','','','','',''); // filler because recordId's start with 11, not 0
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow($('<% = ProcName_11.ClientID %>'), $('<% = ProcSide_11.ClientID %>'), $('<% = ProcSite_11.ClientID %>'), $('<% = ProcLocation_11.ClientID %>'), $('<% = ProcInstitution_11.ClientID %>'), $('<% = ProcQuality_11.ClientID %>'));
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow($('<% = ProcName_12.ClientID %>'), $('<% = ProcSide_12.ClientID %>'), $('<% = ProcSite_12.ClientID %>'), $('<% = ProcLocation_12.ClientID %>'), $('<% = ProcInstitution_12.ClientID %>'), $('<% = ProcQuality_12.ClientID %>'));
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow($('<% = ProcName_13.ClientID %>'), $('<% = ProcSide_13.ClientID %>'), $('<% = ProcSite_13.ClientID %>'), $('<% = ProcLocation_13.ClientID %>'), $('<% = ProcInstitution_13.ClientID %>'), $('<% = ProcQuality_13.ClientID %>'));
}
registerOtherProcInputs();
function addOtherProc(procName, procSide, procSite, location, institution, quality)
{
    var newOtherProcRowIndex = nextAvailableOtherProcRowIndex();
    if (newOtherProcRowIndex != null)
    {
        var newOtherProcRow = $('OtherProcRow_' + newOtherProcRowIndex.toString());
        var newOtherProcRowInputs = otherProcInputArray[newOtherProcRowIndex];

        for (var i=11;i<14;i++)
	    {
		    $('OtherProcRow_' + i.toString()).className = 'hpiNewRecordRow';
	    }

        newOtherProcRow.style.display = '';
        focusHpiRow(newOtherProcRow);
        
        (newOtherProcRowInputs.ProcName).value = procName;
        (newOtherProcRowInputs.ProcSide).value = procSide;
        (newOtherProcRowInputs.ProcSite).value = procSite;
        (newOtherProcRowInputs.Location).value = location;
        (newOtherProcRowInputs.Institution).value = institution;
        (newOtherProcRowInputs.Quality).value = quality;
    }
    else { alert('The maximum number of procedures has been added.'); }
}
function nextAvailableOtherProcRowIndex()
{
    var nextRowIndex = null;
    
    for (var i=11;i<14;i++)
	{
		if ($('OtherProcRow_' + i.toString()).style.display && $('OtherProcRow_' + i.toString()).style.display == 'none')
		{
		    nextRowIndex = i;
		    break;
		}
		
	}
	
	return nextRowIndex;
}

function aControlInNodeHasFocus(node)
{
    var controlHasFocus = false;
    var inputs = node.getElementsByTagName('input');
	for (var i=0;i<inputs.length;i++)
	{
		if (inputs[i].focused) controlHasFocus =  true;
	}
	
	var selects = node.getElementsByTagName('select');
	for (var j=0;j<selects.length;j++)
	{
		if (selects[j].focused) controlHasFocus =  true;
	}
	
	var textareas = node.getElementsByTagName('textarea');
	for (var k=0;k<textareas.length;k++)
	{
		if (textareas[k].focused) controlHasFocus =  true;
	}
	
	return controlHasFocus;
	
}


function aControlInNodeHasData(node)
{
    var controlHasData = false;
    var inputs = node.getElementsByTagName('input');
	for (var i=0;i<inputs.length;i++)
	{
	    type = inputs[i].getAttribute('type');
		if (type == 'checkbox' || type == 'radio') {
			if (inputs[i].checked) controlHasData = true;
		} else if (type == 'hidden') {
			if (inputs[i].disabled == false && inputs[i].value != '') controlHasData = true;
		} else {
			if (inputs[i].value != '') controlHasData = true;
		}
	}
	
	var selects = node.getElementsByTagName('select');
	for (var j=0;j<selects.length;j++)
	{
		if (selects[j].selectedIndex > 0) controlHasData = true;
	}
	
	var textareas = node.getElementsByTagName('textarea');
	for (var k=0;k<textareas.length;k++)
	{
		if (textareas[k].value != '') controlHasData = true;
	}
	
	return controlHasData;
	
}

function blurHpiRow(rowId,evt)
{

    var hpiRow = $(rowId);
    
    if (isMouseLeave(hpiRow, evt))
    {
       if (!aControlInNodeHasFocus(hpiRow))
       {
            hpiRow.className = 'hpiNewRecordRow';
//            sortPopAndNewHPIData();
       }
    }
}

function blurAllHpiRows()
{
    var hpiTable = $('hpiTopTable');
    var hpiRows = hpiTable.rows;
    
    for (i=0;i<hpiRows.length;i++)
    {   
        if (hpiRows[i].className == 'hpiNewRecordRowActive')
        {
            hpiRows[i].className = 'hpiNewRecordRow';
        }
    }
}


function focusHpiRow(rowId)
{
    var hpiRow = $(rowId);
    hpiRow.className = 'hpiNewRecordRowActive';
    
    
    var hpiRowInputs = hpiRow.getElementsByTagName('input');
    
    if (hpiRowInputs.length > 0 && !aControlInNodeHasFocus(hpiRow)) hpiRowInputs[0].focus();
    
}
function focusThisHpiRow(rowId,evt)
{
    stopBubble(evt);
    evt.returnValue = true;
    var hpiRow = $(rowId);
    hpiRow.className = 'hpiNewRecordRowActive';
    
    
    var hpiRowInputs = hpiRow.getElementsByTagName('input');
    
//    if (hpiRowInputs.length > 0 && !aControlInNodeHasFocus(hpiRow)) hpiRowInputs[0].focus();
    
}

function setMedTxLocationFields(MedTxRecordId)
{
    var MedTxQualityField;
    var MedTxInstitutionField;
    var MedTxLocationField;
    switch (MedTxRecordId)
    {
        case 1:
            MedTxQualityField = $('<% = MedTxQuality_1.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_1.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_1.ClientID %>');
            break;
        case 2:
            MedTxQualityField = $('<% = MedTxQuality_2.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_2.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_2.ClientID %>');
            break;
        case 3:
            MedTxQualityField = $('<% = MedTxQuality_3.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_3.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_3.ClientID %>');
            break;
        case 4:
            MedTxQualityField = $('<% = MedTxQuality_4.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_4.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_4.ClientID %>');
            break;
        case 5:
            MedTxQualityField = $('<% = MedTxQuality_5.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_5.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_5.ClientID %>');
            break;
        default:
            MedTxQualityField = $('<% = MedTxQuality_1.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_1.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_1.ClientID %>');
    }
    
    setQualityAndInstitution(MedTxLocationField, MedTxQualityField, MedTxInstitutionField);
    
}


function setRadTxLocationFields(RadTxRecordId)
{
    var QualityField;
    var InstitutionField;
    var LocationField;
    switch (RadTxRecordId)
    {
        case 1:
            QualityField = $('<% = RadTxQuality_1.ClientID %>');
            InstitutionField = $('<% = RadTxInstitution_1.ClientID %>');
            LocationField = $('<% = RadTxLocation_1.ClientID %>');
            break;
        case 2:
            QualityField = $('<% = RadTxQuality_2.ClientID %>');
            InstitutionField = $('<% = RadTxInstitution_2.ClientID %>');
            LocationField = $('<% = RadTxLocation_2.ClientID %>');
            break;
        case 3:
            QualityField = $('<% = RadTxQuality_3.ClientID %>');
            InstitutionField = $('<% = RadTxInstitution_3.ClientID %>');
            LocationField = $('<% = RadTxLocation_3.ClientID %>');
            break;
        default:
            QualityField = $('<% = RadTxQuality_1.ClientID %>');
            InstitutionField = $('<% = RadTxInstitution_1.ClientID %>');
            LocationField = $('<% = RadTxLocation_1.ClientID %>');
    }
    
    setQualityAndInstitution(LocationField, QualityField, InstitutionField);
    
}


function setProcLocationFields(ProcRecordId)
{
    var QualityField;
    var InstitutionField;
    var LocationField;
    switch (ProcRecordId)
    {
        case 1:
            QualityField = $('<% = ProcQuality_1.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_1.ClientID %>');
            LocationField = $('<% = ProcLocation_1.ClientID %>');
            break;
        case 2:
            QualityField = $('<% = ProcQuality_2.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_2.ClientID %>');
            LocationField = $('<% = ProcLocation_2.ClientID %>');
            break;
        case 3:
            QualityField = $('<% = ProcQuality_3.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_3.ClientID %>');
            LocationField = $('<% = ProcLocation_3.ClientID %>');
            break;
        case 4:
            QualityField = $('<% = ProcQuality_4.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_4.ClientID %>');
            LocationField = $('<% = ProcLocation_4.ClientID %>');
            break;
        case 5:
            QualityField = $('<% = ProcQuality_5.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_5.ClientID %>');
            LocationField = $('<% = ProcLocation_5.ClientID %>');
            break;
        case 6:
            QualityField = $('<% = ProcQuality_6.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_6.ClientID %>');
            LocationField = $('<% = ProcLocation_6.ClientID %>');
            break;
        case 7:
            QualityField = $('<% = ProcQuality_7.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_7.ClientID %>');
            LocationField = $('<% = ProcLocation_7.ClientID %>');
            break;
        case 8:
            QualityField = $('<% = ProcQuality_8.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_8.ClientID %>');
            LocationField = $('<% = ProcLocation_8.ClientID %>');
            break;
        case 9:
            QualityField = $('<% = ProcQuality_9.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_9.ClientID %>');
            LocationField = $('<% = ProcLocation_9.ClientID %>');
            break;
        case 10:
            QualityField = $('<% = ProcQuality_10.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_10.ClientID %>');
            LocationField = $('<% = ProcLocation_10.ClientID %>');
            break;

        default:
            QualityField = $('<% = ProcQuality_1.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_1.ClientID %>');
            LocationField = $('<% = ProcLocation_1.ClientID %>');
    }
    
    setQualityAndInstitution(LocationField, QualityField, InstitutionField);
    
}
function setBrachyLocationFields()
{
    setQualityAndInstitution($('<% = BrachyLocation_1.ClientID %>'), $('<% = BrachyInstitution_1.ClientID %>'), $('<% = BrachyQuality_1.ClientID %>'));
}
function setQualityAndInstitution(locationField, qualityField, institutionField)
{
    if (locationField && locationField.value != '')
    {
        var location = locationField.value.toUpperCase();
        switch (location)
        {
            case 'DONE OUTSIDE':
              qualityField.value = 'OUT';
              institutionField.value = 'Outside';
              break;
            default:
              qualityField.value = 'STD';
              institutionField.value = 'Memorial Sloan-Kettering Cancer Center';
        }
    }
    else
    {
      qualityField.value = '';
      institutionField.value = '';
    }
}

function showHPIRowsWithData()
{
    var hpiTable = $('hpiTopTable');
    var hpiRows = hpiTable.rows;
    for (var i=0;i<hpiRows.length;i++)
	{
	    if (hpiRows[i].className.indexOf("hpiNewRecordRow") > -1 && aControlInNodeHasData(hpiRows[i])) hpiRows[i].style.display = '';
	}
}
showHPIRowsWithData();



function sortPopAndNewHPIData()
{
    loadHTMLTableToArray();
    sortHpiArray();
    sortHpiTopTableByArray();
}


//setTimeout("sortPopAndNewHPIData()",500);




   
function setInputFocused(container) {

    var inputs = container.getElementsByTagName('input');

    // helper function which toggles focused state
    var setFocusState = function(element, isFocused, event) {
        element.focused = isFocused;
    };
    
	for (var i=0;i<inputs.length;i++)
	{
        $(inputs[i]).addEvent('focus', curry(setFocusState, inputs[i], true));
        $(inputs[i]).addEvent('blur', curry(setFocusState, inputs[i], false));
	}
	
	var selects = container.getElementsByTagName('select');
	for (var j=0;j<selects.length;j++)
	{
        $(selects[j]).addEvent('focus', curry(setFocusState, selects[j], true));
        $(selects[j]).addEvent('blur', curry(setFocusState, selects[j], false));
	}
	
	var textareas = container.getElementsByTagName('textarea');
	for (var k=0;k<textareas.length;k++)
	{
        $(textareas[k]).addEvent('focus', curry(setFocusState, textareas[k], true));
        $(textareas[k]).addEvent('blur', curry(setFocusState, textareas[k], false));
	}
}

setInputFocused($('hpiTopTable'));


preSetCheckBoxStyleNewData();


</script>

<br/>
<br/>
<br/>
<div style="display: none;" >
<euc:EformCheckBox runat="server" ID="Status_6" Table="Status" RecordId="6" Field="Status" Value="Expectant Observation" onclick="populateExpectantObservationDate(this);" />
<euc:EformTextBox  style="width:90px;" TABLE="NoTable"  FIELD="LastGnRHDateText" Runat="server" ID="LastGnRHDateText" />
<euc:EformTextBox Runat="server" ID="LastGnRHDate" Table="NoTable" Field="LastGnRHDate" />
<euc:EformComboBox LookupCode="MedTxAgent_GnRH" style="width:140px;" DropDownWidth="160" DropDownHeight="auto" Field="LastGnRHAgent"  Table="NoTable" Runat="server" id="LastGnRHAgent"  />
<euc:EformTextBox  style="width:90px;" TABLE="NoTable"  FIELD="LastBisphosphonateDateText" Runat="server" ID="LastBisphosphonateDateText" />
<euc:EformTextBox Runat="server" ID="LastBisphosphonateDate" Table="NoTable" Field="LastBisphosphonateDate" />
<euc:EformComboBox LookupCode="MedTxAgent_Bisphosphonates" style="width:140px;" DropDownWidth="160" DropDownHeight="auto" Field="LastBisphosphonateAgent"  Table="NoTable" Runat="server" id="LastBisphosphonateAgent"  />
<euc:EformTextBox Runat="server" ID="CurrentMedTx_DateText" TABLE="NoTable" FIELD="CurrentMedTx_DateText" style="width:72px;"  />
    <euc:EformTextBox Runat="server" ID="CurrentMedTx_Date" Table="NoTable" Field="CurrentMedTx_Date" />
    <euc:EformComboBox LookupCode="MedTxAgent,EForm_GUProstate,True" style="width:140px;" DropDownWidth="200" Field="CurrentMedTx_Agent" Table="NoTable" Runat="server" id="CurrentMedTx_Agent"  /><euc:EformCheckBox runat="server" ID="NoCurrentTreatment" Table="NoTable" Field="NoCurrentTreatment" Value="True" onclick="clearCurrentTreatment(this);" /><span style="font-size: 11px; color: #333333;">
    <euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="NoTable" FIELD="CurrentMedTx_CyclePerWeek" Runat="server" ID="CurrentMedTx_CyclePerWeek" ShowNumberPad="true"/>
   <euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="NoTable" FIELD="CurrentMedTx_ProtocolNum" Runat="server" ID="CurrentMedTx_ProtocolNum" />
   </div>




<script type="text/javascript" >
function populateCurrentTxFields()
{
    if (typeof(currentTreatmentTdId) != "undefined" && currentTreatmentTdId != '' && $(currentTreatmentTdId) && typeof(currentTreatmentDate) != "undefined" && currentTreatmentDate != '')
    {
        var currentTxDateText = $('<% = CurrentMedTx_DateText.ClientID %>');
        var currentTxDate = $('<% = CurrentMedTx_Date.ClientID %>');
        var currentTxAgent = $('<% = CurrentMedTx_Agent.ClientID %>');
    
        if (currentTxDateText.value.length < 1)
        {
            currentTxDateText.value = currentTreatmentDate;
            currentTxDate.value = currentTreatmentDate;
        }
        if (currentTxAgent.value.length < 1)
        {
            currentTxAgent.value = $(currentTreatmentTdId).innerHTML.substr($(currentTreatmentTdId).innerHTML.indexOf(' ')+1);
        }
    }
}
//getLastGnRHAndBisphosphonate()
//populateCurrentTxFields();


function clearCurrentTreatment(cbox)
{
    if (cbox.checked)
    {
        var row = cbox.parentNode.parentNode.parentNode;
        var prevRow = row.previousSibling;
        
        clearAllElementsContainedInNode($('CurrentTxCycleTd'));
        clearAllElementsContainedInNode($('CurrentTxProtocolTd'));
        clearAllElementsContainedInNode(prevRow);
    }
}


</script>