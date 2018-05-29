<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.GUProstateHPI" CodeFile="GUProstateHPI.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="treatment" TagName="AdvancedOptions" Src="~/Modules/All/Eforms/TreatmentOptions.ascx" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



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
	// probably a better way to do this.  
	row = element.parentElement.parentElement.parentElement.parentElement.parentElement.parentElement;
	
	
	clearAllElementsContainedInNode(row);
//	alert(row.innerHTML);
	row.style.display = 'none';
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


var bisphosphonates = new Array('PAMIDRONATE','ZOLEDRONIC ACID','ZOMETA');
var hormoneTx = new Array('CASODEX','BICALUTAMIDE','FLUTAMIDE','DEGARELIX','KETOCONAZOLE','LUPRON','NILANDRON','NILUTAMIDE','ZOLADEX','GOSERELIN');
var GnRHTx = new Array('LUPRON','ZOLADEX','GOSERELIN');

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

    var hpiTable = $('hpiTopTable');
    var hpiRows = hpiTable.rows;
    for (var i=0;i<hpiRows.length;i++)
	{
	    if (hpiRows[i].className.indexOf("nonProstateProc") > -1) { hpiRows[i].style.display = ProstateProcToggle.checked ? 'none' : ''; }
	    else if (hpiRows[i].className.indexOf("oldCysto") > -1) { hpiRows[i].style.display = CystoProcToggle.checked ? 'none' : ''; }
	}

}


function showHPIRecordData(tableName, primaryKey, show, recordDataHtmlCell) {

    var dataBubble = $('EFormInfoBubble');
    var dataBubbleContentContainer = $('EFormInfoBubbleContent');
    var bubbleContent = ($(('HPIRecordDetailsBubbleContent_' + tableName + '_' + primaryKey)) == null) ? null : $(('HPIRecordDetailsBubbleContent_' + tableName + '_' + primaryKey)).innerHTML;
    if (show && bubbleContent != null ) {
        dataBubbleContentContainer.innerHTML = bubbleContent;
        dataBubble.style.top = ((findPos(recordDataHtmlCell).y - 66 - $('PDFormDiv').scrollTop) + 'px');
        dataBubble.style.left = ((findPos(recordDataHtmlCell).x - 240) + 'px');
        dataBubble.style.display = 'block';
    }
    else {
        dataBubble.style.display = 'none';
    }
}
function showHPIBubbleMsg(msg, show, recordDataHtmlCell) {

    var dataBubble = $('EFormInfoBubble');
    var dataBubbleContentContainer = $('EFormInfoBubbleContent');
    if (show) {
        dataBubbleContentContainer.innerHTML = msg;
        dataBubble.style.top = ((findPos(recordDataHtmlCell).y - 66 - $('PDFormDiv').scrollTop) + 'px');
        dataBubble.style.left = ((findPos(recordDataHtmlCell).x - 240) + 'px');
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
	
}
.hpiTopTable input
{
	height: 14px;
}
.hpiTopTable tr.hpiNewRecordRow td input
{
	background-color: transparent;
	border: solid 1px transparent;
}
.hpiTopTable tr.hpiNewRecordRow td:hover input
{
	background-color: #ffffff;
	border: solid 1px #999999;
}
.hpiTopTable tr.hpiNewRecordRow td img
{
    visibility: hidden;
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
    background-image: url(../../Images/HPIMenuWidgetDown.png);
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
    background-image: url(../../Images/HPIMenuWidgetRight.png);
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



/* 
td#<% =CurrentTreatmentTdId %>
{
    font-size: 12px;
    color: #8d2a2c;
    border: solid 2px #8d2a2c;
    border-left: solid 2px #8d2a2c;
    border-right: solid 2px #8d2a2c;
    
    
    background-image: url(../../Images/HPICurrentTreatmentBG.png);
    background-position: left center;
    background-repeat: no-repeat;
    padding-left: 8px;
}
*/


</style>




<a name="GUProstateHPI"></a><span class="controlBoxTitle" style="margin-right: 200px;">HPI</span>
<euc:EformTextBox style="display: none;" Table="Status" RecordId="6" Field="StatusDateText" ID="StatusDateText_6" Runat="server"  />
<euc:EformTextBox style="display: none;" Table="Status" RecordId="6" Field="StatusDate" ID="StatusDate_6" Runat="server"  />




<input id="ProstateProcToggle" type="checkbox" checked="checked" onclick="toggleAllProcedures();" style="margin-left: 15px;" /><span style="font-size: 11px; color: #333333;">Include Prostate Procedures Only</span>
<input id="CystoProcToggle" type="checkbox" checked="checked" onclick="toggleAllProcedures();" style="margin-left: 15px;" /><span style="font-size: 11px; color: #333333;">Include Last Cystoscopy Only</span>
<br/>

<!--
<div style="z-index: 5; position: absolute; left: 0px; height: 1000px; width: 1000px; background-color: #333333;">&nbsp;</div>
-->
<table cellspacing="8">
<asp:Repeater ID="hpiTest" runat="server" >
<ItemTemplate>
<tr><td><%# DataBinder.Eval(Container.DataItem, "patientHPI") %> </td>
<td><%# DataBinder.Eval(Container.DataItem, "PatientHPIDelimited")%></td></tr>
</ItemTemplate>
</asp:Repeater>
</table>
<table id="hpiTopTable" class="hpiTopTable" cellpadding="0" cellspacing="0"  > 
<tr ID="NoHPIMsg" Runat="server" Visible="False"><td style="background-color: #eeeeee; padding: 12px; font-size: 13px; font-weight: bold; color: #111111; border: solid 1px #aaaaaa;" >No history of present illness was previously recorded for this patient.</td></tr>
    <asp:Repeater ID="hpi"  runat="server" OnItemDataBound="SetHpiItem">   <%--OnPreRender="SetCurrentTreatment"--%>
       <ItemTemplate> 
       
		<tr class="hpiDBRecordRow"  id="HpiRow" runat="server"  >
    	<td id="HpiCell" runat="server" ><input type="hidden" id="PopulatedDate" runat="server" /><input type="hidden" id="ProcType" runat="server" />
    	    <treatment:AdvancedOptions runat="server" ID="SpecialTreatmentOptions" Visible="false" />
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr >
                <asp:Literal id="HpiRowItems" runat="server"/>
            </tr>
            </table>
        </td>
<%--    	<td id="HpiCell_MedTx" runat="server" visible="false"><input type="hidden" id="PopulatedDate_MedTx" runat="server" />
    	    <treatment:AdvancedOptions runat="server" ID="SpecialTreatmentOptions" Visible="false" />
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr >
                <asp:Literal id="HpiRowItems_MedTx" runat="server"/>
            </tr>
            </table>
        </td>
--%>    </tr>
      </ItemTemplate>
  </asp:Repeater>
  <%-- 
	<tr class="hpiDBRecordRow"  onclick="addHpiRow('LocalizedRow','03/05/2011')" >
    	<td>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">01/08/2003</td>
                <td>Localized</td>
            </tr>
            </table>
        </td>
    </tr>
	<tr class="hpiDBRecordRow" onclick="addHpiRow('NeedleBiopsyRow','02/07/2010')" >
    	<td>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">01/09/2003</td>
                <td>Needle Biopsy</td>
                <td>POS (OUT)</td>
            </tr>
            </table>
        </td>
    </tr>
    <tr class="hpiDBRecordRow" onclick="addHpiRow('ProtocolRow','01/16/2009')" >
    	<td>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">01/09/2003</td>
                <td>Protocol 03-193</td>
                <td>Approached and Consented</td>
            </tr>
            </table>
        </td>
    </tr>
    --%>
    <tr id="MedicalTherapyRow_1" class="hpiNewRecordRow" style="display: none;"  onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar"><%-- <img onclick="closeHpi(event);" src="../../Images/shim.gif" class="HPISaveAndSortButton"  /> --%>Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxDateText_1" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                </td>
                <td>
                <div class="hpiRecordHeaderColumn">Agent</div>
                	
               <euc:EFormComboBox DropDownWidth="auto"  LookupCode="MedTxAgent" style="width:100px;" Field="MedTxAgent" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxAgent_1" onclick="focusThisHpiRow('MedicalTherapyRow_1',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:26px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_1"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="1" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_1" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_1',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect DropDownWidth="90"  LookupCode="MedRoute" style="width:90px;" Field="MedTxRoute" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxRoute_1" onclick="focusThisHpiRow('MedicalTherapyRow_1',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox DropDownWidth="100"  LookupCode="MedSchedule" style="width:100px;" Field="MedTxSchedule" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_1" onclick="focusThisHpiRow('MedicalTherapyRow_1',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_1" RecordId="1"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(1);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
           <euc:EformTextBox style="display: none;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_1" Runat="server"  />
           <euc:EformHidden RecordId="1" Runat="server" ID="MedTxDate_1" Table="MedicalTherapy" Field="MedTxDate" />
           <euc:EformTextBox style="display: none;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_1" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_1" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_2" class="hpiNewRecordRow" style="display: none;"  onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxDateText_2" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="2" Runat="server" ID="MedTxDate_2" Table="MedicalTherapy" Field="MedTxDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Agent</div>
               <euc:EFormComboBox DropDownWidth="auto"  LookupCode="MedTxAgent" style="width:100px;" Field="MedTxAgent" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxAgent_2"  onclick="focusThisHpiRow('MedicalTherapyRow_2',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:26px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_2"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="2" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_2" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_2',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect DropDownWidth="90"  LookupCode="MedRoute" style="width:90px;" Field="MedTxRoute" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxRoute_2" onclick="focusThisHpiRow('MedicalTherapyRow_2',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox DropDownWidth="100"  LookupCode="MedSchedule" style="width:100px;" Field="MedTxSchedule" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_2" onclick="focusThisHpiRow('MedicalTherapyRow_2',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_2" RecordId="2"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(2);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_2" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_2" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_2" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_3" class="hpiNewRecordRow" style="display: none;"  onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxDateText_3" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="3" Runat="server" ID="MedTxDate_3" Table="MedicalTherapy" Field="MedTxDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Agent</div>
               <euc:EFormComboBox DropDownWidth="auto"  LookupCode="MedTxAgent" style="width:100px;" Field="MedTxAgent" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxAgent_3"  onclick="focusThisHpiRow('MedicalTherapyRow_3',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:26px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_3"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="3" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_3" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_3',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect DropDownWidth="90"  LookupCode="MedRoute" style="width:90px;" Field="MedTxRoute" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxRoute_3" onclick="focusThisHpiRow('MedicalTherapyRow_3',event)"   /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox DropDownWidth="100"  LookupCode="MedSchedule" style="width:100px;" Field="MedTxSchedule" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_3" onclick="focusThisHpiRow('MedicalTherapyRow_3',event)"   /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_3" RecordId="3"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(3);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_3" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_3" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_3" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_4" class="hpiNewRecordRow" style="display: none;"  onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxDateText_4" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="4" Runat="server" ID="MedTxDate_4" Table="MedicalTherapy" Field="MedTxDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Agent</div>
               <euc:EFormComboBox DropDownWidth="auto"  LookupCode="MedTxAgent" style="width:100px;" Field="MedTxAgent" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxAgent_4"  onclick="focusThisHpiRow('MedicalTherapyRow_4',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:26px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_4"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="4" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_4" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_4',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect DropDownWidth="90"  LookupCode="MedRoute" style="width:90px;" Field="MedTxRoute" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxRoute_4" onclick="focusThisHpiRow('MedicalTherapyRow_4',event)"   /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox DropDownWidth="100"  LookupCode="MedSchedule" style="width:100px;" Field="MedTxSchedule" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_4" onclick="focusThisHpiRow('MedicalTherapyRow_4',event)"   /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_4" RecordId="4"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(4);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_4" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_4" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_4" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_5" class="hpiNewRecordRow" style="display: none;"  onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxDateText_5" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="5" Runat="server" ID="MedTxDate_5" Table="MedicalTherapy" Field="MedTxDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Agent</div>
               <euc:EFormComboBox DropDownWidth="auto"  LookupCode="MedTxAgent" style="width:100px;" Field="MedTxAgent" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxAgent_5"  onclick="focusThisHpiRow('MedicalTherapyRow_5',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:26px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_5"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="5" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_5" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_5',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect DropDownWidth="90"  LookupCode="MedRoute" style="width:90px;" Field="MedTxRoute" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxRoute_5"  onclick="focusThisHpiRow('MedicalTherapyRow_5',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox DropDownWidth="100"  LookupCode="MedSchedule" style="width:100px;" Field="MedTxSchedule" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_5"  onclick="focusThisHpiRow('MedicalTherapyRow_5',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_5" RecordId="5"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(5);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_5" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_5" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_5" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_6" class="hpiNewRecordRow" style="display: none;"  onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="6"  ID="MedTxDateText_6" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="6" Runat="server" ID="MedTxDate_6" Table="MedicalTherapy" Field="MedTxDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Agent</div>
               <euc:EFormComboBox DropDownWidth="auto"  LookupCode="MedTxAgent" style="width:100px;" Field="MedTxAgent" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxAgent_6"  onclick="focusThisHpiRow('MedicalTherapyRow_6',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:26px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_6"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="6" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_6" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_6',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect DropDownWidth="90"  LookupCode="MedRoute" style="width:90px;" Field="MedTxRoute" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxRoute_6" onclick="focusThisHpiRow('MedicalTherapyRow_6',event)"   /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox DropDownWidth="100"  LookupCode="MedSchedule" style="width:100px;" Field="MedTxSchedule" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_6"  onclick="focusThisHpiRow('MedicalTherapyRow_6',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_6" RecordId="6"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(6);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_6" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_6" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_6" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_7" class="hpiNewRecordRow" style="display: none;"  onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="7"  ID="MedTxDateText_7" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="7" Runat="server" ID="MedTxDate_7" Table="MedicalTherapy" Field="MedTxDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Agent</div>
               <euc:EFormComboBox DropDownWidth="auto"  LookupCode="MedTxAgent" style="width:100px;" Field="MedTxAgent" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxAgent_7"  onclick="focusThisHpiRow('MedicalTherapyRow_7',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:26px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_7"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="7" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_7" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_7',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect DropDownWidth="90"  LookupCode="MedRoute" style="width:90px;" Field="MedTxRoute" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxRoute_7"  onclick="focusThisHpiRow('MedicalTherapyRow_7',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox DropDownWidth="100"  LookupCode="MedSchedule" style="width:100px;" Field="MedTxSchedule" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_7"  onclick="focusThisHpiRow('MedicalTherapyRow_7',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_7" RecordId="7"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(7);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_7" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_7" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_7" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_8" class="hpiNewRecordRow" style="display: none;"  onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="8"  ID="MedTxDateText_8" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="8" Runat="server" ID="MedTxDate_8" Table="MedicalTherapy" Field="MedTxDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Agent</div>
               <euc:EFormComboBox DropDownWidth="auto"  LookupCode="MedTxAgent" style="width:100px;" Field="MedTxAgent" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxAgent_8"  onclick="focusThisHpiRow('MedicalTherapyRow_8',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:26px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_8"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="8" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_8" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_8',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect DropDownWidth="90"  LookupCode="MedRoute" style="width:90px;" Field="MedTxRoute" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxRoute_8"  onclick="focusThisHpiRow('MedicalTherapyRow_8',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox DropDownWidth="100"  LookupCode="MedSchedule" style="width:100px;" Field="MedTxSchedule" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_8"  onclick="focusThisHpiRow('MedicalTherapyRow_8',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_8" RecordId="8"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(8);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_8" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_8" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_8" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_9" class="hpiNewRecordRow" style="display: none;"  onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="9"  ID="MedTxDateText_9" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="9" Runat="server" ID="MedTxDate_9" Table="MedicalTherapy" Field="MedTxDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Agent</div>
               <euc:EFormComboBox DropDownWidth="auto"  LookupCode="MedTxAgent" style="width:100px;" Field="MedTxAgent" RecordId="9" Table="MedicalTherapy" Runat="server" id="MedTxAgent_9"  onclick="focusThisHpiRow('MedicalTherapyRow_9',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:26px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_9"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="9" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_9" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_9',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect DropDownWidth="90"  LookupCode="MedRoute" style="width:90px;" Field="MedTxRoute" RecordId="9" Table="MedicalTherapy" Runat="server" id="MedTxRoute_9"  onclick="focusThisHpiRow('MedicalTherapyRow_9',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox DropDownWidth="100"  LookupCode="MedSchedule" style="width:100px;" Field="MedTxSchedule" RecordId="9" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_9"  onclick="focusThisHpiRow('MedicalTherapyRow_9',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_9" RecordId="9"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(9);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_9" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_9" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_9" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_10" class="hpiNewRecordRow" style="display: none;"  onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="10"  ID="MedTxDateText_10" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="10" Runat="server" ID="MedTxDate_10" Table="MedicalTherapy" Field="MedTxDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Agent</div>
               <euc:EFormComboBox DropDownWidth="auto"  LookupCode="MedTxAgent" style="width:100px;" Field="MedTxAgent" RecordId="10" Table="MedicalTherapy" Runat="server" id="MedTxAgent_10"  onclick="focusThisHpiRow('MedicalTherapyRow_10',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:26px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_10"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="10" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_10" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_10',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect DropDownWidth="90"  LookupCode="MedRoute" style="width:90px;" Field="MedTxRoute" RecordId="10" Table="MedicalTherapy" Runat="server" id="MedTxRoute_10"  onclick="focusThisHpiRow('MedicalTherapyRow_10',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox DropDownWidth="100"  LookupCode="MedSchedule" style="width:100px;" Field="MedTxSchedule" RecordId="10" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_10"  onclick="focusThisHpiRow('MedicalTherapyRow_10',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_10" RecordId="10"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(10);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_10" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_10" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_10" Runat="server"  />
        </td>
    </tr>
    <tr id="MedicalTherapyRow_11" class="hpiNewRecordRow" style="display: none;"  onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Medical Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Date</div>
                <euc:EformTextBox Runat="server" RecordId="11"  ID="MedTxDateText_11" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="11" Runat="server" ID="MedTxDate_11" Table="MedicalTherapy" Field="MedTxDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Agent</div>
               <euc:EFormComboBox DropDownWidth="auto"  LookupCode="MedTxAgent" style="width:100px;" Field="MedTxAgent" RecordId="11" Table="MedicalTherapy" Runat="server" id="MedTxAgent_11"  onclick="focusThisHpiRow('MedicalTherapyRow_11',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Dose</div>
                <euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:26px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_11"/></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="11" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_11" style="width: 35px;" onclick="focusThisHpiRow('MedicalTherapyRow_11',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Route</div>
               <euc:EformSelect DropDownWidth="90"  LookupCode="MedRoute" style="width:90px;" Field="MedTxRoute" RecordId="11" Table="MedicalTherapy" Runat="server" id="MedTxRoute_11"  onclick="focusThisHpiRow('MedicalTherapyRow_11',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Schedule</div>
               <euc:EFormComboBox DropDownWidth="100"  LookupCode="MedSchedule" style="width:100px;" Field="MedTxSchedule" RecordId="11" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_11"  onclick="focusThisHpiRow('MedicalTherapyRow_11',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="MedicalTherapyExtraData"  FIELD="MedTxLocation" ID="MedTxLocation_11" RecordId="11"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setMedTxLocationFields(11);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_11" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxInstitution" ID="MedTxInstitution_11" Runat="server"  />
           <euc:EformTextBox style="display: none;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxQuality" ID="MedTxQuality_11" Runat="server"  />
        </td>
    </tr>
    <tr id="RadiationTherapyRow_1" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="RadiationTherapyRow_2" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="RadiationTherapyRow_3" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="RadiationTherapyRow_4" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Radiation Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Start Date</div>
                <euc:EformTextBox Runat="server" RecordId="4"  ID="RadTxDateText_4" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="4" Runat="server" ID="RadTxDate_4" Table="RadiationTherapy" Field="RadTxDate" /></td>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Stop Date</div>
                <euc:EformTextBox Runat="server" RecordId="4"  ID="RadTxStopDateText_4" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="4" Runat="server" ID="RadTxStopDate_4" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Type</div>
                <euc:EformSelect RecordId="4" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_4" onclick="focusThisHpiRow('RadiationTherapyRow_4',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Target</div>
                <euc:EformComboBox  LookupCode="RadTxTarget"  style="width:80px;" Field="RadTxTarget" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxTarget_4"  onclick="focusThisHpiRow('RadiationTherapyRow_4',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Total Dose</div>
                <euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_4"  onclick="focusThisHpiRow('RadiationTherapyRow_4',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="4" LookupCode="RadTxUnits" style="width:60px;" DropDownHeight="auto" DropDownWidth="60" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_4" onclick="focusThisHpiRow('RadiationTherapyRow_4',event)" />
                </td>
                <td>
                <div class="hpiRecordHeaderColumn"># Fractions</div>
                <euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_4"  onclick="focusThisHpiRow('RadiationTherapyRow_4',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="RadiationTherapyExtraData"  FIELD="RadTxLocation" ID="RadTxLocation_4" RecordId="4"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setRadTxLocationFields(4);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxInstitution" ID="RadTxInstitution_4" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_4" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_4" Runat="server"  />
            
        </td>
    </tr>
    <tr id="RadiationTherapyRow_5" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Radiation Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Start Date</div>
                <euc:EformTextBox Runat="server" RecordId="5"  ID="RadTxDateText_5" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="5" Runat="server" ID="RadTxDate_5" Table="RadiationTherapy" Field="RadTxDate" /></td>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Stop Date</div>
                <euc:EformTextBox Runat="server" RecordId="5"  ID="RadTxStopDateText_5" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="5" Runat="server" ID="RadTxStopDate_5" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Type</div>
                <euc:EformSelect RecordId="5" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_5" onclick="focusThisHpiRow('RadiationTherapyRow_5',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Target</div>
                <euc:EformComboBox  LookupCode="RadTxTarget"  style="width:80px;" Field="RadTxTarget" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxTarget_5"  onclick="focusThisHpiRow('RadiationTherapyRow_5',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Total Dose</div>
                <euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_5"  onclick="focusThisHpiRow('RadiationTherapyRow_5',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="5" LookupCode="RadTxUnits" style="width:60px;" DropDownHeight="auto" DropDownWidth="60" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_5" onclick="focusThisHpiRow('RadiationTherapyRow_5',event)" />
                </td>
                <td>
                <div class="hpiRecordHeaderColumn"># Fractions</div>
                <euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_5"  onclick="focusThisHpiRow('RadiationTherapyRow_5',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="RadiationTherapyExtraData"  FIELD="RadTxLocation" ID="RadTxLocation_5" RecordId="5"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setRadTxLocationFields(5);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxInstitution" ID="RadTxInstitution_5" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_5" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_5" Runat="server"  />
            
        </td>
    </tr>
    <tr id="RadiationTherapyRow_6" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Radiation Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Start Date</div>
                <euc:EformTextBox Runat="server" RecordId="6"  ID="RadTxDateText_6" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="6" Runat="server" ID="RadTxDate_6" Table="RadiationTherapy" Field="RadTxDate" /></td>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Stop Date</div>
                <euc:EformTextBox Runat="server" RecordId="6"  ID="RadTxStopDateText_6" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="6" Runat="server" ID="RadTxStopDate_6" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Type</div>
                <euc:EformSelect RecordId="6" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_6" onclick="focusThisHpiRow('RadiationTherapyRow_6',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Target</div>
                <euc:EformComboBox  LookupCode="RadTxTarget"  style="width:80px;" Field="RadTxTarget" RecordId="6" Table="RadiationTherapy" Runat="server" id="RadTxTarget_6"  onclick="focusThisHpiRow('RadiationTherapyRow_6',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Total Dose</div>
                <euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_6"  onclick="focusThisHpiRow('RadiationTherapyRow_6',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="6" LookupCode="RadTxUnits" style="width:60px;" DropDownHeight="auto" DropDownWidth="60" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_6" onclick="focusThisHpiRow('RadiationTherapyRow_6',event)" />
                </td>
                <td>
                <div class="hpiRecordHeaderColumn"># Fractions</div>
                <euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_6"  onclick="focusThisHpiRow('RadiationTherapyRow_6',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="RadiationTherapyExtraData"  FIELD="RadTxLocation" ID="RadTxLocation_6" RecordId="6"   Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setRadTxLocationFields(6);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxInstitution" ID="RadTxInstitution_6" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_6" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_6" Runat="server"  />
            
        </td>
    </tr>
    <tr id="RadiationTherapyRow_7" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Radiation Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Start Date</div>
                <euc:EformTextBox Runat="server" RecordId="7" ID="RadTxDateText_7" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="7" Runat="server" ID="RadTxDate_7" Table="RadiationTherapy" Field="RadTxDate" /></td>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Stop Date</div>
                <euc:EformTextBox Runat="server" RecordId="7"  ID="RadTxStopDateText_7" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="7" Runat="server" ID="RadTxStopDate_7" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Type</div>
                <euc:EformSelect RecordId="7" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_7" onclick="focusThisHpiRow('RadiationTherapyRow_7',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Target</div>
                <euc:EformComboBox  LookupCode="RadTxTarget"  style="width:80px;" Field="RadTxTarget" RecordId="7" Table="RadiationTherapy" Runat="server" id="RadTxTarget_7"  onclick="focusThisHpiRow('RadiationTherapyRow_7',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Total Dose</div>
                <euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_7"  onclick="focusThisHpiRow('RadiationTherapyRow_7',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="7" LookupCode="RadTxUnits" style="width:60px;" DropDownHeight="auto" DropDownWidth="60" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_7" onclick="focusThisHpiRow('RadiationTherapyRow_7',event)" />
                </td>
                <td>
                <div class="hpiRecordHeaderColumn"># Fractions</div>
                <euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_7"  onclick="focusThisHpiRow('RadiationTherapyRow_7',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="RadiationTherapyExtraData"  FIELD="RadTxLocation" ID="RadTxLocation_7" RecordId="7" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setRadTxLocationFields(7);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxInstitution" ID="RadTxInstitution_7" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_7" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_7" Runat="server"  />
            
        </td>
    </tr>
    <tr id="RadiationTherapyRow_8" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Radiation Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Start Date</div>
                <euc:EformTextBox Runat="server" RecordId="8" ID="RadTxDateText_8" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="8" Runat="server" ID="RadTxDate_8" Table="RadiationTherapy" Field="RadTxDate" /></td>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Stop Date</div>
                <euc:EformTextBox Runat="server" RecordId="8"  ID="RadTxStopDateText_8" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="8" Runat="server" ID="RadTxStopDate_8" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Type</div>
                <euc:EformSelect RecordId="8" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_8" onclick="focusThisHpiRow('RadiationTherapyRow_8',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Target</div>
                <euc:EformComboBox  LookupCode="RadTxTarget"  style="width:80px;" Field="RadTxTarget" RecordId="8" Table="RadiationTherapy" Runat="server" id="RadTxTarget_8"  onclick="focusThisHpiRow('RadiationTherapyRow_8',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Total Dose</div>
                <euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_8"  onclick="focusThisHpiRow('RadiationTherapyRow_8',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="8" LookupCode="RadTxUnits" style="width:60px;" DropDownHeight="auto" DropDownWidth="60" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_8" onclick="focusThisHpiRow('RadiationTherapyRow_8',event)" />
                </td>
                <td>
                <div class="hpiRecordHeaderColumn"># Fractions</div>
                <euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_8"  onclick="focusThisHpiRow('RadiationTherapyRow_8',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="RadiationTherapyExtraData"  FIELD="RadTxLocation" ID="RadTxLocation_8" RecordId="8" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setRadTxLocationFields(8);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxInstitution" ID="RadTxInstitution_8" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_8" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_8" Runat="server"  />
            
        </td>
    </tr>
    <tr id="RadiationTherapyRow_9" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Radiation Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Start Date</div>
                <euc:EformTextBox Runat="server" RecordId="9" ID="RadTxDateText_9" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="9" Runat="server" ID="RadTxDate_9" Table="RadiationTherapy" Field="RadTxDate" /></td>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Stop Date</div>
                <euc:EformTextBox Runat="server" RecordId="9"  ID="RadTxStopDateText_9" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="9" Runat="server" ID="RadTxStopDate_9" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Type</div>
                <euc:EformSelect RecordId="9" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_9" onclick="focusThisHpiRow('RadiationTherapyRow_9',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Target</div>
                <euc:EformComboBox  LookupCode="RadTxTarget"  style="width:80px;" Field="RadTxTarget" RecordId="9" Table="RadiationTherapy" Runat="server" id="RadTxTarget_9"  onclick="focusThisHpiRow('RadiationTherapyRow_9',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Total Dose</div>
                <euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_9"  onclick="focusThisHpiRow('RadiationTherapyRow_9',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="9" LookupCode="RadTxUnits" style="width:60px;" DropDownHeight="auto" DropDownWidth="60" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_9" onclick="focusThisHpiRow('RadiationTherapyRow_9',event)" />
                </td>
                <td>
                <div class="hpiRecordHeaderColumn"># Fractions</div>
                <euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_9"  onclick="focusThisHpiRow('RadiationTherapyRow_9',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="RadiationTherapyExtraData"  FIELD="RadTxLocation" ID="RadTxLocation_9" RecordId="9" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setRadTxLocationFields(9);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxInstitution" ID="RadTxInstitution_9" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_9" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_9" Runat="server"  />
            
        </td>
    </tr>
    <tr id="RadiationTherapyRow_10" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Radiation Therapy</div>
        	<table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
            <tr>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Start Date</div>
                <euc:EformTextBox Runat="server" RecordId="10" ID="RadTxDateText_10" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="10" Runat="server" ID="RadTxDate_10" Table="RadiationTherapy" Field="RadTxDate" /></td>
                <td class="hpiDateColumn">
                <div class="hpiRecordHeaderColumn">Stop Date</div>
                <euc:EformTextBox Runat="server" RecordId="10"  ID="RadTxStopDateText_10" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="10" Runat="server" ID="RadTxStopDate_10" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Type</div>
                <euc:EformSelect RecordId="10" LookupCode="RadTxType" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_10" onclick="focusThisHpiRow('RadiationTherapyRow_10',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Target</div>
                <euc:EformComboBox  LookupCode="RadTxTarget"  style="width:80px;" Field="RadTxTarget" RecordId="10" Table="RadiationTherapy" Runat="server" id="RadTxTarget_10"  onclick="focusThisHpiRow('RadiationTherapyRow_10',event)"  /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Total Dose</div>
                <euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" ID="RadTxTotalDose_10"  onclick="focusThisHpiRow('RadiationTherapyRow_10',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Units</div>
                <euc:EformSelect RecordId="10" LookupCode="RadTxUnits" style="width:60px;" DropDownHeight="auto" DropDownWidth="60" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_10" onclick="focusThisHpiRow('RadiationTherapyRow_10',event)" />
                </td>
                <td>
                <div class="hpiRecordHeaderColumn"># Fractions</div>
                <euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_10"  onclick="focusThisHpiRow('RadiationTherapyRow_10',event)" /></td>
                <td>
                <div class="hpiRecordHeaderColumn">Location</div>
                <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="RadiationTherapyExtraData"  FIELD="RadTxLocation" ID="RadTxLocation_10" RecordId="10" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setRadTxLocationFields(10);" />
                </td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
            </tr>
            </table>
                <euc:EformTextBox style="display: none;" RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxInstitution" ID="RadTxInstitution_10" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxQuality" ID="RadTxQuality_10" Runat="server"  />
                <euc:EformTextBox style="display: none;" RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxDisease" ID="RadTxDisease_10" Runat="server"  />
            
        </td>
    </tr>
    <tr id="BrachyTherapyRow_1" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="ProstatectomyRow_1" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="ProstateBiopsyRow_2" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="ProstateBiopsyRow_3" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="ProstateBiopsyRow_4" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="ProstateBiopsyRow_5" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="ProstateBiopsyRow_6" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="OtherBiopsyRow_7" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="OtherBiopsyRow_8" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="OtherBiopsyRow_9" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="OtherBiopsyRow_10" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="OtherProcRow_11" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="OtherProcRow_12" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="OtherProcRow_13" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
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
    <tr id="OtherProcRow_14" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Procedure</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="14"  ID="ProcDateText_14" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Procedure</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_14"  runat="server" RecordId="14"  onclick="focusThisHpiRow('OtherProcRow_14',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Side</div>
                  <euc:EformComboBox   LookupCode="OpSide"  style="width:90px;" Field="ProcSide" RecordId="14" Table="Procedures" Runat="server" id="ProcSide_14"  onclick="focusThisHpiRow('OtherProcRow_14',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Site</div>
                  <euc:EformComboBox   LookupCode="DxTarget"  style="width:90px;" Field="ProcSite" RecordId="14" Table="Procedures" Runat="server" id="ProcSite_14"  onclick="focusThisHpiRow('OtherProcRow_14',event)"  /></td>
                  
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_14" RecordId="14" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(14);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="14" Runat="server" ID="ProcDate_14" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="14" Table="Procedures" Runat="server" id="ProcApproach_14"  />
            <euc:EformTextBox style="display: none;" RecordId="14" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_14" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="14" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_14" Runat="server"  />

        </td>
    </tr>
    <tr id="OtherProcRow_15" class="hpiNewRecordRow" style="display: none;" onmouseout="blurHpiRow(this.id, event);" onclick="focusThisHpiRow(this.id,event)" >
    	<td>
           <div class="hpiRecordTitleBar">Procedure</div>
           
            <table class="hpiRecordTable" cellpadding="0" cellspacing="0" >
              <tr>
                <td class="hpiDateColumn"><div class="hpiRecordHeaderColumn">Date</div>
                  <euc:EformTextBox Runat="server" RecordId="15"  ID="ProcDateText_15" TABLE="Procedures" FIELD="ProcDateText" style="width:72px;"  ShowCalendar="True" CalcDate="True" class="InputText"  /></td>
                <td><div class="hpiRecordHeaderColumn">Procedure</div>
                  <euc:EformComboBox  LookupCode="ProcName,Disease,Prostate"  DropDownWidth="200px" style="width:80px;"   TABLE="Procedures" FIELD="ProcName" id="ProcName_15"  runat="server" RecordId="15"  onclick="focusThisHpiRow('OtherProcRow_15',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Side</div>
                  <euc:EformComboBox   LookupCode="OpSide"  style="width:90px;" Field="ProcSide" RecordId="15" Table="Procedures" Runat="server" id="ProcSide_15"  onclick="focusThisHpiRow('OtherProcRow_15',event)"  /></td>
                <td><div class="hpiRecordHeaderColumn">Site</div>
                  <euc:EformComboBox   LookupCode="DxTarget"  style="width:90px;" Field="ProcSite" RecordId="15" Table="Procedures" Runat="server" id="ProcSite_15"  onclick="focusThisHpiRow('OtherProcRow_15',event)"  /></td>
                  
                <td><div class="hpiRecordHeaderColumn">Location</div>
                  <euc:EformSelect  style="width:76px;" DropDownHeight="auto" DropDownWidth="70" TABLE="ProceduresExtraData"  FIELD="ProcLocation" ID="ProcLocation_15" RecordId="15" Runat="server"  LookupCode="PerformedLocation" AppendToOnChange="setProcLocationFields(15);" /></td>
                <td><img onclick="clearParentHpiRow(this);" src="../../Images/EFormDeleteRow.png" class="HPIDeleteButton"  /></td>
              </tr>
            </table>
            <euc:EformHidden RecordId="15" Runat="server" ID="ProcDate_15" Table="Procedures" Field="ProcDate" />
            <euc:EformTextBox style="display: none;"  Field="ProcApproach" RecordId="15" Table="Procedures" Runat="server" id="ProcApproach_15"  />
            <euc:EformTextBox style="display: none;" RecordId="15" TABLE="Procedures" FIELD="ProcInstitution" ID="ProcInstitution_15" Runat="server"  />
            <euc:EformTextBox style="display: none;" RecordId="15" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_15" Runat="server"  />

        </td>
    </tr>
    <tr id="hpiMenuTableContainer"  >
    	<td  >
    	    <img onclick="closeHpi(event);" src="../../Images/SortHPITab.png" style="float: right; cursor: pointer;"  />
        </td>
    </tr>
</table>

<div id="hpiMenuContainer" >
    	        <div id="hpiMenuInnerContainer" >
    	            <div id="MostCommonItems" class="hpiMenuOn">
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
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_6.ClientID %>'), $('<% = MedTxType_6.ClientID %>'), $('<% = MedTxDose_6.ClientID %>'), $('<% = MedTxUnits_6.ClientID %>'), $('<% = MedTxRoute_6.ClientID %>'), $('<% = MedTxSchedule_6.ClientID %>'), $('<% = MedTxLocation_6.ClientID %>'), $('<% = MedTxInstitution_6.ClientID %>'), $('<% = MedTxQuality_6.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_7.ClientID %>'), $('<% = MedTxType_7.ClientID %>'), $('<% = MedTxDose_7.ClientID %>'), $('<% = MedTxUnits_7.ClientID %>'), $('<% = MedTxRoute_7.ClientID %>'), $('<% = MedTxSchedule_7.ClientID %>'), $('<% = MedTxLocation_7.ClientID %>'), $('<% = MedTxInstitution_7.ClientID %>'), $('<% = MedTxQuality_7.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_8.ClientID %>'), $('<% = MedTxType_8.ClientID %>'), $('<% = MedTxDose_8.ClientID %>'), $('<% = MedTxUnits_8.ClientID %>'), $('<% = MedTxRoute_8.ClientID %>'), $('<% = MedTxSchedule_8.ClientID %>'), $('<% = MedTxLocation_8.ClientID %>'), $('<% = MedTxInstitution_8.ClientID %>'), $('<% = MedTxQuality_8.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_9.ClientID %>'), $('<% = MedTxType_9.ClientID %>'), $('<% = MedTxDose_9.ClientID %>'), $('<% = MedTxUnits_9.ClientID %>'), $('<% = MedTxRoute_9.ClientID %>'), $('<% = MedTxSchedule_9.ClientID %>'), $('<% = MedTxLocation_9.ClientID %>'), $('<% = MedTxInstitution_9.ClientID %>'), $('<% = MedTxQuality_9.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_10.ClientID %>'), $('<% = MedTxType_10.ClientID %>'), $('<% = MedTxDose_10.ClientID %>'), $('<% = MedTxUnits_10.ClientID %>'), $('<% = MedTxRoute_10.ClientID %>'), $('<% = MedTxSchedule_10.ClientID %>'), $('<% = MedTxLocation_10.ClientID %>'), $('<% = MedTxInstitution_10.ClientID %>'), $('<% = MedTxQuality_10.ClientID %>'));
    medTxInputArray[medTxInputArray.length++] = new medTxInputRow($('<% = MedTxAgent_11.ClientID %>'), $('<% = MedTxType_11.ClientID %>'), $('<% = MedTxDose_11.ClientID %>'), $('<% = MedTxUnits_11.ClientID %>'), $('<% = MedTxRoute_11.ClientID %>'), $('<% = MedTxSchedule_11.ClientID %>'), $('<% = MedTxLocation_11.ClientID %>'), $('<% = MedTxInstitution_11.ClientID %>'), $('<% = MedTxQuality_11.ClientID %>'));
}
registerMedTxInputs();


function addMedicalTherapy(agent, type, dose, units, route, schedule, location, institution, quality)
{
    var newMedTxRowIndex = nextAvailableMedTxRowIndex();
    var newMedTxRow = $('MedicalTherapyRow_' + newMedTxRowIndex.toString());
    var newMedTxRowInputs = medTxInputArray[newMedTxRowIndex];
    
    for (var i=1;i<12;i++)
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
function nextAvailableMedTxRowIndex()
{
    var nextRowIndex = null;
    
    for (var i=1;i<12;i++)
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
    radTxInputArray[radTxInputArray.length++] = new radTxInputRow($('<% = RadTxType_4.ClientID %>'), $('<% = RadTxTarget_4.ClientID %>'), $('<% = RadTxTotalDose_4.ClientID %>'), $('<% = RadTxUnits_4.ClientID %>'), $('<% = RadTxNumFractions_4.ClientID %>'), $('<% = RadTxDisease_4.ClientID %>'), $('<% = RadTxLocation_4.ClientID %>'), $('<% = RadTxInstitution_4.ClientID %>'), $('<% = RadTxQuality_4.ClientID %>'));
    radTxInputArray[radTxInputArray.length++] = new radTxInputRow($('<% = RadTxType_5.ClientID %>'), $('<% = RadTxTarget_5.ClientID %>'), $('<% = RadTxTotalDose_5.ClientID %>'), $('<% = RadTxUnits_5.ClientID %>'), $('<% = RadTxNumFractions_5.ClientID %>'), $('<% = RadTxDisease_5.ClientID %>'), $('<% = RadTxLocation_5.ClientID %>'), $('<% = RadTxInstitution_5.ClientID %>'), $('<% = RadTxQuality_5.ClientID %>'));
    radTxInputArray[radTxInputArray.length++] = new radTxInputRow($('<% = RadTxType_6.ClientID %>'), $('<% = RadTxTarget_6.ClientID %>'), $('<% = RadTxTotalDose_6.ClientID %>'), $('<% = RadTxUnits_6.ClientID %>'), $('<% = RadTxNumFractions_6.ClientID %>'), $('<% = RadTxDisease_6.ClientID %>'), $('<% = RadTxLocation_6.ClientID %>'), $('<% = RadTxInstitution_6.ClientID %>'), $('<% = RadTxQuality_6.ClientID %>'));
    radTxInputArray[radTxInputArray.length++] = new radTxInputRow($('<% = RadTxType_7.ClientID %>'), $('<% = RadTxTarget_7.ClientID %>'), $('<% = RadTxTotalDose_7.ClientID %>'), $('<% = RadTxUnits_7.ClientID %>'), $('<% = RadTxNumFractions_7.ClientID %>'), $('<% = RadTxDisease_7.ClientID %>'), $('<% = RadTxLocation_7.ClientID %>'), $('<% = RadTxInstitution_7.ClientID %>'), $('<% = RadTxQuality_7.ClientID %>'));
    radTxInputArray[radTxInputArray.length++] = new radTxInputRow($('<% = RadTxType_8.ClientID %>'), $('<% = RadTxTarget_8.ClientID %>'), $('<% = RadTxTotalDose_8.ClientID %>'), $('<% = RadTxUnits_8.ClientID %>'), $('<% = RadTxNumFractions_8.ClientID %>'), $('<% = RadTxDisease_8.ClientID %>'), $('<% = RadTxLocation_8.ClientID %>'), $('<% = RadTxInstitution_8.ClientID %>'), $('<% = RadTxQuality_8.ClientID %>'));
    radTxInputArray[radTxInputArray.length++] = new radTxInputRow($('<% = RadTxType_9.ClientID %>'), $('<% = RadTxTarget_9.ClientID %>'), $('<% = RadTxTotalDose_9.ClientID %>'), $('<% = RadTxUnits_9.ClientID %>'), $('<% = RadTxNumFractions_9.ClientID %>'), $('<% = RadTxDisease_9.ClientID %>'), $('<% = RadTxLocation_9.ClientID %>'), $('<% = RadTxInstitution_9.ClientID %>'), $('<% = RadTxQuality_9.ClientID %>'));
    radTxInputArray[radTxInputArray.length++] = new radTxInputRow($('<% = RadTxType_10.ClientID %>'), $('<% = RadTxTarget_10.ClientID %>'), $('<% = RadTxTotalDose_10.ClientID %>'), $('<% = RadTxUnits_10.ClientID %>'), $('<% = RadTxNumFractions_10.ClientID %>'), $('<% = RadTxDisease_10.ClientID %>'), $('<% = RadTxLocation_10.ClientID %>'), $('<% = RadTxInstitution_10.ClientID %>'), $('<% = RadTxQuality_10.ClientID %>'));
}
registerRadTxInputs();


function addRadiationTherapy(type, target, totalDose, units, numFractions, disease, location, institution, quality)
{
    var newRadTxRowIndex = nextAvailableRadTxRowIndex();
    var newRadTxRow = $('RadiationTherapyRow_' + newRadTxRowIndex.toString());
    var newRadTxRowInputs = radTxInputArray[newRadTxRowIndex];

    for (var i=1;i<11;i++)
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
function nextAvailableRadTxRowIndex()
{
    var nextRowIndex = null;
    
    for (var i=1;i<11;i++)
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
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow($('<% = ProcName_14.ClientID %>'), $('<% = ProcSide_14.ClientID %>'), $('<% = ProcSite_14.ClientID %>'), $('<% = ProcLocation_14.ClientID %>'), $('<% = ProcInstitution_14.ClientID %>'), $('<% = ProcQuality_14.ClientID %>'));
    otherProcInputArray[otherProcInputArray.length++] = new otherProcInputRow($('<% = ProcName_15.ClientID %>'), $('<% = ProcSide_15.ClientID %>'), $('<% = ProcSite_15.ClientID %>'), $('<% = ProcLocation_15.ClientID %>'), $('<% = ProcInstitution_15.ClientID %>'), $('<% = ProcQuality_15.ClientID %>'));
    
}
registerOtherProcInputs();
function addOtherProc(procName, procSide, procSite, location, institution, quality)
{
    var newOtherProcRowIndex = nextAvailableOtherProcRowIndex();
    var newOtherProcRow = $('OtherProcRow_' + newOtherProcRowIndex.toString());
    var newOtherProcRowInputs = otherProcInputArray[newOtherProcRowIndex];

    for (var i=11;i<16;i++)
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
function nextAvailableOtherProcRowIndex()
{
    var nextRowIndex = null;
    
    for (var i=11;i<16;i++)
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
        case 6:
            MedTxQualityField = $('<% = MedTxQuality_6.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_6.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_6.ClientID %>');
            break;
        case 7:
            MedTxQualityField = $('<% = MedTxQuality_7.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_7.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_7.ClientID %>');
            break;
        case 8:
            MedTxQualityField = $('<% = MedTxQuality_8.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_8.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_8.ClientID %>');
            break;
        case 9:
            MedTxQualityField = $('<% = MedTxQuality_9.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_9.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_9.ClientID %>');
            break;
        case 10:
            MedTxQualityField = $('<% = MedTxQuality_10.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_10.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_10.ClientID %>');
            break;
        case 11:
            MedTxQualityField = $('<% = MedTxQuality_11.ClientID %>');
            MedTxInstitutionField = $('<% = MedTxInstitution_11.ClientID %>');
            MedTxLocationField = $('<% = MedTxLocation_11.ClientID %>');
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
        case 4:
            QualityField = $('<% = RadTxQuality_4.ClientID %>');
            InstitutionField = $('<% = RadTxInstitution_4.ClientID %>');
            LocationField = $('<% = RadTxLocation_4.ClientID %>');
            break;
        case 5:
            QualityField = $('<% = RadTxQuality_5.ClientID %>');
            InstitutionField = $('<% = RadTxInstitution_5.ClientID %>');
            LocationField = $('<% = RadTxLocation_5.ClientID %>');
            break;
        case 6:
            QualityField = $('<% = RadTxQuality_6.ClientID %>');
            InstitutionField = $('<% = RadTxInstitution_6.ClientID %>');
            LocationField = $('<% = RadTxLocation_6.ClientID %>');
            break;
        case 7:
            QualityField = $('<% = RadTxQuality_7.ClientID %>');
            InstitutionField = $('<% = RadTxInstitution_7.ClientID %>');
            LocationField = $('<% = RadTxLocation_7.ClientID %>');
            break;
        case 8:
            QualityField = $('<% = RadTxQuality_8.ClientID %>');
            InstitutionField = $('<% = RadTxInstitution_8.ClientID %>');
            LocationField = $('<% = RadTxLocation_8.ClientID %>');
            break;
        case 9:
            QualityField = $('<% = RadTxQuality_9.ClientID %>');
            InstitutionField = $('<% = RadTxInstitution_9.ClientID %>');
            LocationField = $('<% = RadTxLocation_9.ClientID %>');
            break;
        case 10:
            QualityField = $('<% = RadTxQuality_10.ClientID %>');
            InstitutionField = $('<% = RadTxInstitution_10.ClientID %>');
            LocationField = $('<% = RadTxLocation_10.ClientID %>');
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
        case 11:
            QualityField = $('<% = ProcQuality_11.ClientID %>');
            InstitutionField = $('<% = ProcInstitution_11.ClientID %>');
            LocationField = $('<% = ProcLocation_11.ClientID %>');
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

</script>

<br/>
<br/>
<br/>








<style type="text/css">
#CurrentMedicalTherapy_GU_Table td
{
	border-bottom: solid 1px #cccccc;
	font-weight: normal;
}
#CurrentMedicalTherapy_GU_Table tr.ClinicalEformPopulatedRow img
{
    display: none;
}
#CurrentMedicalTherapy_GU_Table tr.ClinicalEformHighlightedRow img
{
    display: none;
}
</style>
<div >
<a name="CurrentMedicalTherapy_GU" /><span class="controlBoxTitle">Current Treatment</span><br/>
<span style="font-size: 11px; line-height: 12px;display: block;">Reprinted below is the treatment identified as current, as well as the last bisphosphonate and GnRH administrations.<br />If needed, you may update/correct this data here.</span>

<table id="CurrentMedicalTherapy_GU_Table" width="700" border="0" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable">
  <tr>
    <td colspan="5" class="previewText" height="24" style="font-weight: bold; font-size: 11px;"><euc:EformCheckBox runat="server" ID="Status_6" Table="Status" RecordId="6" Field="Status" Value="Expectant Observation" onclick="populateExpectantObservationDate(this);" />Expectant Observation</td>
  </tr>
  <tr>
    <td class="previewText" style="font-weight: bold; font-size: 11px;">Last GnRH</td>
    <td class="previewText" style=" font-weight: normal;" > Date:</td>
    <td height="24" class="previewText" ><euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="NoTable"  FIELD="LastGnRHDateText" Runat="server" ID="LastGnRHDateText" /><euc:EformHidden Runat="server" ID="LastGnRHDate" Table="NoTable" Field="LastGnRHDate" /></td>
    <td height="24" class="previewText"  style=" font-weight: normal;">Agent</td>
    <td height="24" class="previewText" ><euc:EformComboBox LookupCode="MedTxAgent_GnRH" style="width:140px;" DropDownWidth="160" DropDownHeight="auto" Field="LastGnRHAgent"  Table="NoTable" Runat="server" id="LastGnRHAgent"  /></td>
  </tr>
  <tr>
    <td class="previewText" style="font-weight: bold; font-size: 11px;">Last Bisphosphonate</td>
    <td class="previewText" style=" font-weight: normal;" > Date:</td>
    <td height="24" class="previewText" ><euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="NoTable"  FIELD="LastBisphosphonateDateText" Runat="server" ID="LastBisphosphonateDateText" /><euc:EformHidden Runat="server" ID="LastBisphosphonateDate" Table="NoTable" Field="LastBisphosphonateDate" /></td>
    <td height="24" class="previewText"  style=" font-weight: normal;">Agent</td>
    <td height="24" class="previewText" ><euc:EformComboBox LookupCode="MedTxAgent_Bisphosphonates" style="width:140px;" DropDownWidth="160" DropDownHeight="auto" Field="LastBisphosphonateAgent"  Table="NoTable" Runat="server" id="LastBisphosphonateAgent"  /></td>
  </tr>
  <tr id="CurrentTXRow" runat="server" >
    <td class="previewText" style="border-bottom: none;font-weight: bold; font-size: 11px;">Current TX</td>
	<td class="previewText" style="font-weight: normal; border-bottom: none;" >Start Date:</td>
    <td class="previewText" style="font-weight: normal; border-bottom: none;"><euc:EformTextBox Runat="server" ID="CurrentMedTx_DateText" TABLE="NoTable" FIELD="CurrentMedTx_DateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
    <euc:EformHidden Runat="server" ID="CurrentMedTx_Date" Table="NoTable" Field="CurrentMedTx_Date" /></td>
    <td class="previewText"   style="font-weight: normal; border-bottom: none;" >Tx</td>
    <td height="24" class="previewText"  style="font-weight: normal; border-bottom: none;" >   
      <euc:EformComboBox LookupCode="MedTxAgent" style="width:140px;" DropDownWidth="200" Field="CurrentMedTx_Agent" Table="NoTable" Runat="server" id="CurrentMedTx_Agent"  /></td>
  </tr>
  <tr>
    <td class="previewText" style="padding-top: 0px; vertical-align: top;" >
    <euc:EformCheckBox runat="server" ID="NoCurrentTreatment" Table="NoTable" Field="NoCurrentTreatment" Value="True" onclick="clearCurrentTreatment(this);" /><span style="font-size: 11px; color: #333333;">No Current Tx</span>
    
    
    </td>
    <td class="previewText" style="font-weight: normal;" >Cycle / Week</td>
    <td id="CurrentTxCycleTd" height="24" class="previewText" ><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="NoTable" FIELD="CurrentMedTx_CyclePerWeek" Runat="server" ID="CurrentMedTx_CyclePerWeek" ShowNumberPad="true"/></td>
    <td class="previewText" style="font-weight: normal;">Protocol #</td>
    <td id="CurrentTxProtocolTd" class="previewText" ><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="NoTable" FIELD="CurrentMedTx_ProtocolNum" Runat="server" ID="CurrentMedTx_ProtocolNum" /></td>
  </tr>
</table>
<br/><br/>
<br/></div>




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