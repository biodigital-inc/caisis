<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PatientItemEntry.ascx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientItemEntry" EnableViewState="true" %>
<%@ Register TagPrefix="uc1" TagName="helpToolTip" Src="../../Core/Help/helpToolTip.ascx" %>

<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
<script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
<script src="../../ClientScripts/Help.js" type="text/javascript"></script>
<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
<script language="javascript">

    function fuzzyDate(dateText, dateVal) {

		if (!dateVal)
			return;
			
		var fullDateFormat = getDateFormat();

		dateVal.value = '';
		var dText = dateText.value;
		var origDText = dText;
		var wordCount = origDText.split(' ').length;
		var validateDateText = dText.length > 0;
		dText = dText.replace(/[ \.\\-]+/g, '/');
		var pattern = /(\d+)(\/*)(\d*)(\/*)(\d*)/;
		/* comment */

		// MONTH_NAMES array will be registerd at runtime by Header
		var arrMonths = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
		var startMonth = false;
		for (i = 0; i < arrMonths.length; i++) {
			sMnth = new String(arrMonths[i]);
			sLngRegEx = sMnth;
			sShtRegEx = sMnth.substr(0, 3);
			if (validateDateText) {
				if (origDText.substr(0, 4) == sShtRegEx + ' ' || origDText.substr(0, sLngRegEx.length + 1) == sLngRegEx + ' ') {
					startMonth = true;
				}
			}
			dText = dText.replace(sLngRegEx, i + 1);
			dText = dText.replace(sShtRegEx, i + 1);
		}




		// if first letter is a character and not a month, don't parse
		if (validateDateText) {
			var firstChart = origDText.charAt(0);
			if (validateLetters(firstChart) && !startMonth) {
				dateVal.value = '';
				return;
			}
		}
		// validate word length
		if (wordCount > 3) {
			dateVal.value = '';
			return;
		}

		var result = dText.match(pattern);

		if (result != null) {
			var day;
			var month;
			var year;
			var format = "";

			if (result[5] != "") {

				//globalization
				//if(dateCulture == "en-AU" || dateCulture == "en-GB")
				if (isUSDate() == true) {
					month = result[1];
					day = result[3];
				}
				else {
					month = result[3];
					day = result[1];
				}
				year = result[5];
				format = fullDateFormat;
			}
			else if (result[3] != "") {
				month = result[1];
				year = result[3];
				day = 15;
				format = "mmyyyy";
			}
			else if (result[0] != "" && result[0].length == 4) {
				year = result[0];
				month = 7;
				day = 1;
				format = "yyyy";
			}
			else {
				return;
			}

			//if(month > 12 || day < 1 || day > 31)
			//return;

			var oldYear = year;
			if (year.length <= 2) {
				year = parseInt(year, 10) + 2000;
			}
			var today = new Date();
			var oneYearFromNow = new Date(today.getFullYear() + 1, today.getMonth(), today.getDate());
			var theDate = new Date(year, parseInt(month, 10) - 1, day);

			if (theDate.valueOf() > oneYearFromNow.valueOf() && oldYear.length <= 2) {
				theDate.setFullYear(year - 100);
			}
			/*	else if(theDate.valueOf() > today.valueOf()) {
			var todayString = today.getMonth()+1 + "/" + today.getDate() + "/" + today.getFullYear();
			alert("Please enter a date on or before " + todayString + "."); 
			return;
			}
			*/
			else if (year.length > 4) {
				alert("Please enter a valid year of less than four digits.");
				return;
			}
			else if (theDate.valueOf() < minDate.valueOf()) {
				var minDateStr = minDate.getMonth() + 1 + "/" + minDate.getDate() + "/" + minDate.getFullYear();
				alert("Please enter a date on or after " + minDateStr + ".");
				return;
			}
			if (theDate.getDate() != day || theDate.getMonth() + 1 != month) {
				//debug: alert("day:" + day + " month:" + month);
				alert("This date may be incorrect. Please check and re-enter if necessary.");
				return;
			}

			var dispMonth = String(theDate.getMonth() + 1);
			var dispDay = String(theDate.getDate());

			if (dispMonth.length == 1) {
				dispMonth = '0' + dispMonth;
			}
			if (dispDay.length == 1) {
				dispDay = '0' + dispDay;
			}

			if (format == "mmddyyyy") {
				dateText.value = dispMonth + '/' + dispDay + '/' + theDate.getFullYear();
			}
			//European/Australian date format
			else if (format == "ddmmyyyy") {
				dateText.value = dispDay + '/' + dispMonth + '/' + theDate.getFullYear();
			}
			else if (format == "mmyyyy") {
				dateText.value = dispMonth + '/' + theDate.getFullYear();
			}
			else if (format == "yyyy") {
				dateText.value = theDate.getFullYear();
			}
			//display interpreted date

			if (isUSDate()) {
				// US date format
				dateVal.value = dispMonth + '/' + dispDay + '/' + theDate.getFullYear();
			}
			else //dateCulture == "en-AU" || dateCulture == "en-GB")
			{
				// Euro/AU date format
				dateVal.value = dispDay + '/' + dispMonth + '/' + theDate.getFullYear();
			}
		}
}
</script>
<style type="text/css">
th.compliance,
td.compliance
{
    text-align: center;
    font-weight: bold;
}
</style>
<div id="PDFormDiv" style="padding-bottom: 20px; position: relative;">
	<uc1:helpToolTip id="HelpToolTipLayer" runat="server" />	
	<asp:Panel ID="container" runat="server"/>
</div>