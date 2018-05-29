self.onerror = function() { return true; }
/* 
This file is called by includes/headerForms.cfm which is included at the top of the forms.
Code for loading populated forms when selecting a patient or a form from the DHTML menus. DHTML Javascript in slideDownMenus.js and should not be modified
-FS, 6/1/2003
*/

function popupAddPtWindow() {
	addPtWindow = window.open('../ListManager/AddClinicPatients.cfm?section=forms', 'addPtWindow', 'toolbars=no,width=550,height=420,location=0,directories=0,status=no,menuBar=no,scrollBars=no,resizable=yes');
}

//not currently used
function popupWindow(formName) {
	printWindow = window.open(formName, 'PrintableForm', 'toolbars=no,width=720,height=640,location=0,directories=0,status=no,menuBar=no,scrollBars=yes,resizable=yes');
}








function loadForm(pageName, patientId, patientFirstLast, patientMRN, apptId){

	var clinicDate = '';
	
	if(clinicListForm.apptClinicDate.value) clinicDate = clinicListForm.apptClinicDate.value;
	
	//update global javascript variables and header information
	if(patientId && patientFirstLast) {
	
		top.globalPatientId = patientId;
		top.globalPatientName = patientFirstLast; 
		top.globalPatientMRN = patientMRN;
	
		// if appt is defined set row id equal to it, otherwise use patientMRN
		if(apptId != '') {
			top.globalListRowId = apptId;
		} else {
			top.globalListRowId = patientMRN; 
		}
		
		top.PageHeader.displayPatientInfo(patientFirstLast, patientMRN);
	}

	//load form into window. if patient is clicked from left navigation pass patient id in url variable
	if(patientId){
		window.location.href = pageName+'?patientId='+patientId+'&clinicDate='+clinicDate+'&pageName='+pageName;
	} else {
		window.location.href = pageName+'?clinicDate='+clinicDate+'&pageName='+pageName;
	}
}
//patients are not in valhalla database and do not have Id's. Some may not have MRN's. prompt user to add to DB 
function loadFormAndAddToDB(pageName, patientFirst, patientLast, patientMRN, apptId){
	
	var clinicDate = '';
	
	if(clinicListForm.apptClinicDate.value) clinicDate = clinicListForm.apptClinicDate.value;
	
	var addPatient = confirm('This patient is not stored in the Valhalla System. Would you like to add them?');
	
	if(addPatient==true) {
		//load form into window. if patient is clicked from left navigation pass patient id in url variable
		window.location.href = pageName+'?clinicDate='+clinicDate+'&pageName='+pageName+'&apptId='+apptId+'&ptMRN='+patientMRN+'&addPatientToDB=yes';	
	}
}


function removeLoadingScreen() 
{
    document.getElementById('hidepage').style.visibility = 'hidden';
}




/* Page Breaking Scripts */


function findPosY(obj)
  {
    var curtop = 0;
    if(obj.offsetParent)
        while(1)
        {
          curtop += obj.offsetTop;
          if(!obj.offsetParent)
            break;
          obj = obj.offsetParent;
        }
    else if(obj.y)
        curtop += obj.y;
    return curtop;
  }



function CheckPageBreaks()
{
	var pageBody = document.getElementsByTagName('body')[0];

    var allDivsOnPage = pageBody.getElementsByTagName('div');
    var allPaperForms = new Array();
    
    // find all paper forms and add them to array
    for (var i = 0; i < allDivsOnPage.length; i++)
    {   
        if (allDivsOnPage[i].id && (allDivsOnPage[i].id.indexOf('PaperForm') > -1 || allDivsOnPage[i].id.indexOf('theNarrative') > -1) ) // each paper form or eform will pass this condition
        {allPaperForms.push(allDivsOnPage[i]);}
    }
    
    // check each paper form
    for (var j = 0; j < allPaperForms.length; j++)
    {
        scanFormForPageBreaks(allPaperForms[j]);
    }
}

function scanFormForPageBreaks(formDiv)
{
    var allPaperFormChilden = formDiv.childNodes
    var paperFormPages = new Array();  // array of pages in this form
    
    for (var i = 0; i < allPaperFormChilden.length; i++)
    {   
        if (allPaperFormChilden[i].tagName == 'DIV')
        {
            paperFormPages.push(allPaperFormChilden[i]);
        }
    }
    
    for (var j = 0; j < paperFormPages.length; j++)
    {
       scanPageForBreaks(formDiv, paperFormPages[j], paperFormPages[j].getElementsByTagName('table')[0], 0);
    }
    
    if (currentPaperFormNeedsToBeRenumbered) renumberForm(formDiv);
}


function scanPageForBreaks(PaperForm, pageDiv, pageTable, numTimesPageHasBeenBroken)
{
	if (PaperForm && pageDiv && pageTable)
	{
		currentPageTop = findPosY(pageTable.rows[0]);
		
		if (pageDiv.className.indexOf('NonBreakingPage') < 0 && pageTable.offsetHeight > pageMaxHeight)
		{
				var pageBreakHasBeenInserted = false;
				var currentRowIndex = 0;
				var pageBreakRowIndex = '';
				
				while (!pageBreakHasBeenInserted && currentRowIndex < (pageTable.rows.length-1))  // -1 because we don't want to check the footer row
				{
				
				        // if the bottom of the current row is beyond allowable limit
						if (pageTable.rows[currentRowIndex+1] && (findPosY(pageTable.rows[currentRowIndex+1])-currentPageTop) > pageMaxHeight)
						{
							// if height of current section > (total allowable height of page - height of the header) then break AFTER the long section - prevent infinite loop			
							if (pageTable.rows[currentRowIndex] && (findPosY(pageTable.rows[currentRowIndex+1])-findPosY(pageTable.rows[currentRowIndex])) > (pageMaxHeight - (findPosY(pageTable.rows[1])-currentPageTop)))
							{
								alert('Warning - One or more sections of this paper form is too long and will fail at scanning.\nAfter printing, please visually review the pages to determine the problem.');
								pageBreakHasBeenInserted = true;
								pageBreakRowIndex = currentRowIndex+1;
								currentPaperFormNeedsToBeRenumbered = true;
							}
							else
							{
								pageBreakHasBeenInserted = true;
								pageBreakRowIndex = currentRowIndex;
								currentPaperFormNeedsToBeRenumbered = true;
							}
						}
						currentRowIndex+=1;
				}

				BreakPage(PaperForm, pageDiv, pageTable, pageBreakRowIndex, numTimesPageHasBeenBroken);
		}
	}
}


function BreakPage(PaperForm, pageDiv, pageTable, breakBeforeRowIndex, numTimesPageHasBeenBroken)  // will need to receive the row index to start copying from
{
	if (pageDiv && pageTable && breakBeforeRowIndex && numTimesPageHasBeenBroken < 5)  // put a limit of TWO on number of times a page can be broken (eliminate infinite loops)
	{
		// clone the div
		var newPageDiv   = pageDiv.cloneNode(false);

		// clone the bar code if one is present
		if (pageDiv.getElementsByTagName('div')[0])
		{
		    var newBarCode = pageDiv.getElementsByTagName('div')[0].cloneNode(true);
		    newPageDiv.appendChild(newBarCode);
		}
		
		var newPageTable = pageTable.cloneNode(false);
		var newTableBody = document.createElement("tbody");
	
	    // add the disclaimer
	    var newDisclaimerRow = pageTable.rows[0].cloneNode(true);
		newTableBody.appendChild(newDisclaimerRow);
	
		// copy over the header
		var newHeaderRow = pageTable.rows[1].cloneNode(true);
		newTableBody.appendChild(newHeaderRow);
		
		// copy over the necessary table rows
		var newPageRow;
		for (var x = breakBeforeRowIndex; x < pageTable.rows.length; x++)
		{
				newPageRow = pageTable.rows[x].cloneNode(true);
				newTableBody.appendChild(newPageRow);
		}
	
		// delete rows on original page
		var numTableRows = pageTable.rows.length;
		for (var x = breakBeforeRowIndex; x < (numTableRows-1); x++)
		{
			pageTable.deleteRow(breakBeforeRowIndex);
		}
		
		newPageTable.appendChild(newTableBody);
		newPageDiv.appendChild(newPageTable);
		
		// always be sure there's a page break before the newly added page
        if (pageDiv.id && pageDiv.id.indexOf('LastPageInForm') > -1 )
        {
            pageDiv.style.pageBreakAfter = 'always';
        }

		pageDiv.parentNode.insertBefore(newPageDiv, pageDiv.nextSibling);
		
		// check if the new page is still too long and needs to be broken as well
		scanPageForBreaks(PaperForm, newPageDiv, newPageTable, (numTimesPageHasBeenBroken+1));

	}
}


function renumberForm(formDiv)
{
    var allPaperFormChilden = formDiv.childNodes
    var paperFormPages = new Array();  // array of pages in this form
    
    for (var i = 0; i < allPaperFormChilden.length; i++)
    {   
        if (allPaperFormChilden[i].tagName == 'DIV')
        {
            paperFormPages.push(allPaperFormChilden[i]);
        }
    }
    
    var totalNumPagesInThisForm = paperFormPages.length;
    
    for (var j = 0; j < totalNumPagesInThisForm; j++)
    {
	    var currentPageTable;
    	
	    if(paperFormPages[j].getElementsByTagName('table').length > 0)
	    {
		    currentPageTable = paperFormPages[j].getElementsByTagName('table')[0];
    		
		    if (currentPageTable.rows[currentPageTable.rows.length-1].cells[0].getElementsByTagName('span').length > 0)
		    {
			    if (currentPageTable.rows[currentPageTable.rows.length-1].cells[0].getElementsByTagName('span')[0].id && currentPageTable.rows[currentPageTable.rows.length-1].cells[0].getElementsByTagName('span')[0].id.indexOf('PageNumber') > -1)
			    {
				    currentPageTable.rows[currentPageTable.rows.length-1].cells[0].getElementsByTagName('span')[0].innerHTML = j+1;
			    }
			    if (currentPageTable.rows[currentPageTable.rows.length-1].cells[0].getElementsByTagName('span')[1] && currentPageTable.rows[currentPageTable.rows.length-1].cells[0].getElementsByTagName('span')[1].id && currentPageTable.rows[currentPageTable.rows.length-1].cells[0].getElementsByTagName('span')[1].id.indexOf('TotalPages') > -1)
			    {
				    currentPageTable.rows[currentPageTable.rows.length-1].cells[0].getElementsByTagName('span')[1].innerHTML = totalNumPagesInThisForm;
			    }
		    }
	    }	
    }
}





