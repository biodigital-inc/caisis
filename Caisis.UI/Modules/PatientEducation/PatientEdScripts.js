// Contains all javascript functionality for the Patient Education Module

// An array appended dynamically by server code, containging PriKeys for SubTopics
var SubTopicKeyList = new Array();
// A Simple hash used for retrieveing a SubTopic checkbox node using PriKey
var SubTopicHash = new Object();

var requestWait = false;
var PopulateQueue = new Array();

function wireEventsOnLoad(e)
{
    // A temp array used for capturing checkboxes
    var subTopicCheckBoxes = new Array();
    
    // Locate all checkboxes in tree and add to temp array
    var treeContainer = $(document.body);
    var checks = treeContainer.getElementsByTagName('input');
    for(var i=0;i<checks.length;i++)
    {
        if(checks[i].type == 'checkbox') { subTopicCheckBoxes.push(checks[i]); }
    }
    
    for(var i=0;i<subTopicCheckBoxes.length;i++)
    {
        var check = subTopicCheckBoxes[i];
        check.value = SubTopicKeyList[i];
        check.order = i;

        var onclick = function(node)
        {
            return function(e)
            {
                
            
                var isChecked = node.checked;
                if(!isChecked)
                {
                    var mySubTopic = SubTopicHash[node.value];
                    mySubTopic.hide();

                    // After sections,etc.. are removed, rescan pages
                    var innerFrame = window.frames['ContentDetail'];
                    //innerFrame.ScanPagesForPageBreaks();                           
                } 
                else
                {
                    var priKey = node.value;
                    //why is this undefined on postback after printing for No Patient
                    //alert(priKey);
                    
                    var callbackpath = 'SubTopicCallBack.aspx';
                    var callback = function(text,xml)
                    {
                        var contentArray = eval(text);
                        
                        var subTopicId = node.value;
                        var subTopicName = contentArray[0];
                        var subTopicContent = contentArray[1];
                        var topicId = contentArray[2]; 
                        var topicName = contentArray[3].toUpperCase(); 
                        var topicContent = contentArray[4]; 
                        var sectionId = contentArray[5];
                        var sectionName = contentArray[6].toUpperCase();
                        var sectionContent = contentArray[7];
                                                
                        if(SubTopicHash[subTopicId])
                        {
                            mySubTopic = SubTopicHash[subTopicId];
                            mySubTopic.show();
                        }
                        else
                        {
                            var innerFrame = window.frames['ContentDetail'];
                            var holder = $('PrintingContainer',innerFrame);
                            mySubTopic = getSubTopicNode(subTopicId)
                            mySubTopic.show();
                            mySubTopic.setTitle(subTopicName);
                            mySubTopic.setContent(subTopicContent);
                            mySubTopic.order = node.order;
                            appendContentInOrder(holder,mySubTopic);

                            SubTopicHash[subTopicId] = mySubTopic;
                        }
                        SubTopicHash[subTopicId] = mySubTopic;

                        // Signal OK to do next callback
                        requestWait = false;
                        
                        // After sections,etc.. are populate, rescan pages
                        var innerFrame = window.frames['ContentDetail'];
                        //innerFrame.ScanPagesForPageBreaks();
                    }
                    var params = new Param();
                    params.add('SubTopicId', priKey);
                    
                    // Lock request to not make multiple request at a time
                    requestWait = true;
                    AjaxManager.MakeRequest('POST',callbackpath,params,callback,true);
                }
                
                
            }
        }
        
        //Event.Register('click',check,onclick(check),false);
        
        // Get Function Reference
        var fp = onclick(check);
        // Register to click event
        Event.Register('click',check,fp,false);
        // Retain function ref as an checkbox property
        check.doPopulateCallback = fp;
        // If box is checked, need to populate when page loads
        if(check.checked) { PopulateQueue.push(check); }
    }
    // Call server to populate document
    setInterval(populateNodeContent,100);
}

function appendContentInOrder(parent,child)
{
    var nodeInserted = false;
    for(var i=0;i<parent.childNodes.length;i++)
    {
        var sibling = parent.childNodes[i];
        // If any siblings have higher order, insert before
        if(sibling.order > child.order)
        {
            parent.insertBefore(child,sibling);
            nodeInserted = true;
            break;
        }
    }
    // If node was not inserted before another, insert at end
    if(!nodeInserted) { parent.appendChild(child); }
}

// Polls items in the queue to build document when page loads
function populateNodeContent()
{
    // If our server has returned, we can make request
    if(!requestWait && PopulateQueue.length>0)
    {
        // Remove items from queue and make request
        var checkedBox = PopulateQueue.pop();
        checkedBox.doPopulateCallback();
    }
 }


function getSubTopicNode(key)
{
    var innerFrame = window.frames['ContentDetail'];
    /* NEW CODE - construct DOM dynamically */
    
    // Here we will construct a new SubTopic node to insert into DOM
    // This node is constructed in the context of the printing frame
    var node = $(innerFrame.document.createElement('DIV'),innerFrame);
    var title = $(innerFrame.document.createElement('SPAN'),innerFrame);
    var content = $(innerFrame.document.createElement('SPAN'),innerFrame);
    
    // Append title and content into out base node,
    // which is the container for a Section, Topic, SubTopic
    node.appendChild(title);
    node.appendChild(content);
    
    // Set css class names based to type of node we're constructing
    // i.e. 'SectionDiv','SectionTitle','SectionContent'
    node.className = 'SubTopicDiv';
    title.className = 'SubTopicTitle';
    content.className = 'SubTopicContent';
       
    // Set object helpers
    node.id = 'SubTopic' + key;
    node.setTitle = function(txt) { title.innerHTML = txt; }
    node.setContent = function(txt) { content.innerHTML = txt; }
    return node;
}
       

function handleRowOver(row,e) { rowHelper(row,e,'ListManDataTableRowOver'); }       
function handleRowOut(row,e) { rowHelper(row,e,'ListManDataTableRow'); }
function rowHelper(row,e,className) { if(row.className!='ListManDataTableRowSelected') { row.className = className; } }


function doNodeCheckboxClick(spanObject)
{
    var cb = spanObject.parentNode.previousSibling;   // <td><input/><a><span></span</a></td>
    cb.click();
}

function setCallBackType(s) { $('_callbackType').value = s; }


 function hideElement(id) { $(id).style.display = 'none'; $(id).style.visibility = 'hidden'; }
 function showElement(id) { $(id).style.display = 'inline'; $(id).style.visibility = 'visible'; }
 
 
 
 
 
 
/* page breaking scripts below  */

var currentPageStartY = 0;


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
  
  

function ScanPagesForPageBreaks()
{
		
	
	var pageBody = document.getElementsByTagName('body')[0];
	var DocumentStart = document.getElementById('DocumentStart');
	
	var PrintingContainer = document.getElementById('PrintingContainer');
	var DocumentPage = DocumentStart.getElementsByTagName('div')[0];
	var PageHeaderDiv;
	var PageFooterDiv;
	
	var PageHeaderFooterDiv; // combined Header/Footer
						
    // insert divs after <p> tags
    processPTagsForPageBreaking(DocumentPage);
	
	var numberOfDivsInDocument = DocumentPage.getElementsByTagName('div').length;
	
	
	if (numberOfDivsInDocument > 2)
	{
	    PageHeaderFooterDiv = DocumentPage.getElementsByTagName('div')[0];
	    PageFooterDiv = DocumentPage.getElementsByTagName('div')[1];
	    
	    // add headers to seperate sections
	    BreakApartSections(DocumentPage, PageHeaderFooterDiv, 'SUBTOPIC');
	    
	    // insert page breaks to long pages
	    BreakApartLongPages(DocumentPage, PageFooterDiv, 'SUBTOPIC');
    }
	
	
	
//    renumber();  // use this renumber if you want the numbering to be for the whole document.  otherwise use the other one


        renumberPagesBySection('SUBTOPIC');
 //           renumberSpansForSection(0,20);
	
}

function processPTagsForPageBreaking(DocumentPage)
{
    var NumParagraphs = DocumentPage.getElementsByTagName('p').length;
    var currentP;
    if (NumParagraphs > 0)
    {
        for (i=0;i<NumParagraphs;i++) // 
	    {
	        currentP = DocumentPage.getElementsByTagName('p')[i];
	        
	        // only insert a div if it's not before a UL or OL or TABLE
	        if (currentP.nextSibling && currentP.nextSibling.nextSibling && (currentP.nextSibling.nodeName != 'UL') && !(currentP.nextSibling.nodeName == 'BR' && currentP.nextSibling.nextSibling.nodeName == 'UL') && (currentP.nextSibling.nodeName != 'OL') && !(currentP.nextSibling.nodeName == 'BR' && currentP.nextSibling.nextSibling.nodeName == 'OL') && (currentP.nextSibling.nodeName != 'TABLE') && !(currentP.nextSibling.nodeName == 'BR' && currentP.nextSibling.nextSibling.nodeName == 'TABLE') )
	        {
	            var spacerDiv = document.createElement('div');
                spacerDiv.style.height = '0px';
	            currentP.parentNode.insertBefore(spacerDiv, currentP.nextSibling);
	        }
	    }
	}
	
	// add them after lists
    var NumLists = DocumentPage.getElementsByTagName('ul').length;
    var currentList;
    if (NumLists > 0)
    {
        for (j=0;j<NumLists;j++) // 
	    {
	        currentList = DocumentPage.getElementsByTagName('ul')[j];
	        
	        if (currentList.parentNode.nodeName != 'UL' && currentList.parentNode.nodeName != 'LI') // don't break within nested UL's
	        {
	            var listSpacerDiv = document.createElement('div');
                listSpacerDiv.style.height = '0px';
	            currentList.parentNode.insertBefore(listSpacerDiv, currentList.nextSibling);
	            currentList.style.border = 'solid 1px #D4E1E7';
	        }
/*	        else // remove styling from nested UL's.  this is not necessary if we remove the background image from the style.
	        {
	            currentList.style.backgroundColor = 'transparent';
	            currentList.style.backgroundImage = 'none';
	        }
*/	        
	        
	    }
	}	
	
	
	
	
	
	
}

function BreakApartSections(DocumentPage, PageHeaderFooterDiv, SectionTypeToBreak) // SectionTypeToBreak value should be all CAPS
{
	var numberOfDivsInDocument = DocumentPage.getElementsByTagName('div').length;
	var firstSectionPassed = false;
	var currentDiv;
	
	for (i=0;i<numberOfDivsInDocument;i++)
	{
	
	    currentDiv = DocumentPage.getElementsByTagName('div')[i];
	
	    if (currentDiv.id.toUpperCase().indexOf(SectionTypeToBreak) > -1 && currentDiv.style.display != 'none')  // if div is for a new section put it on a new page
		{
		    if (firstSectionPassed) // no need to insert header before 1st section
		    {
                // copy over the header/footer. 
                var newHeaderFooter = document.createElement('div');  // for some reason cloneNode was crashing browser, so copying innerHTML instead
                newHeaderFooter.innerHTML = PageHeaderFooterDiv.innerHTML;
                newHeaderFooter.className = 'Header';
                newHeaderFooter.style.pageBreakBefore = 'always';
                currentDiv.parentNode.insertBefore(newHeaderFooter, currentDiv);
                i++;numberOfDivsInDocument++;i++;numberOfDivsInDocument++; // adding 2 of each since header/footer has 2 divs
            }
            else {firstSectionPassed = true;}
		}
	    
	    
	}

}

function BreakApartLongPages(DocumentPage, FooterDiv, SectionTypeToBreak) // SectionTypeToBreak value shoule be all CAPS
{
    var numChildren = DocumentPage.childNodes.length;
    var currentNode;
    var previousDiv;
    
    if (numChildren > 0)
    {
        for (i=0;i<numChildren;i++)
	    {   
	        if (DocumentPage.childNodes[i].nodeName == 'DIV' && DocumentPage.childNodes[i].id.indexOf('Header') < 0)
	        {
	            processPrintingContainerForLengthBreaks(DocumentPage.childNodes[i], FooterDiv, SectionTypeToBreak);
            }
        }
    }
    

}

function processPrintingContainerForLengthBreaks(currentObj, FooterDiv, SectionTypeToBreak) // SectionTypeToBreak value shoule be all CAPS
{
    var numSections = currentObj.childNodes.length;
    
    if (numSections > 0)
    {
        for (j=0;j<numSections;j++) // go through all the sections
	    {
	        if (currentObj.childNodes[j].nodeName == 'DIV' && currentObj.childNodes[j].id.toUpperCase().indexOf(SectionTypeToBreak) > -1)
	        {   
	            currentPageStartY = findPosY(currentObj.childNodes[j]);
	            processSectionForLengthBreaks(currentObj.childNodes[j], FooterDiv);
	        }
	    }
    }

}

function processSectionForLengthBreaks(currentSection, FooterDiv)
{
    

    var numDivs = currentSection.getElementsByTagName('div').length;
    
    
    var thisDiv;
	var previousDiv;
	var thisDivY;
	var previousDivY;
    
    if (currentSection.style.display != 'none')
    {
    
        for (k=0;k<numDivs;k++) // go through all the each div in the currentSection
	    {
    /*
	        if (thisDiv && thisDiv.id && (thisDiv.id.indexOf('Header') > -1 || thisDiv.id.indexOf('Footer') > -1))
	        {
	            alert (thisDiv.id)
	        }

    */	

            previousDiv = thisDiv;

	        thisDiv = currentSection.getElementsByTagName('div')[k];
	        thisDivY = findPosY(thisDiv);
	        if (previousDiv)
	        {
	            previousDivY = findPosY(previousDiv);
	        }
	        else {previousDivY = 0;}
    	    
    	    
	        if (previousDiv && previousDiv.className && previousDiv.className.indexOf('BreakerDiv') > -1) // these divs FORCE page breaks
            {
	            previousDiv.style.pageBreakAfter = 'always';
    	    
    	    
	            // copy over the footer
		        var newFooterDiv = FooterDiv.cloneNode(true);
		        thisDiv.previousSibling.parentNode.insertBefore(newFooterDiv, thisDiv.previousSibling);
	            k++; numDivs++;
    	    
	            thisDiv.previousSibling.style.paddingTop = '20px';
	            thisDiv.previousSibling.previousSibling.style.borderTop = 'solid 1px #0083BE';
	            thisDiv.previousSibling.previousSibling.style.marginTop = '0px';
    	    
	            currentPageStartY = thisDivY;            
                	    
	        }
	        else if (  (thisDivY - currentPageStartY) > pageMaxHeight  )
	        {
    	    
	            var breakerDiv = document.createElement('div');
	            breakerDiv.style.pageBreakAfter = 'always';
	            previousDiv.parentNode.insertBefore(breakerDiv, previousDiv);
	            k++; numDivs++;
    	    
    	    
	            // copy over the footer
		        var newFooterDiv = FooterDiv.cloneNode(true);
		        previousDiv.parentNode.insertBefore(newFooterDiv, previousDiv);
	            k++; numDivs++;
    	    
	            previousDiv.style.paddingTop = '20px';
	            previousDiv.previousSibling.style.borderTop = 'solid 1px #0083BE';
    	    
	            currentPageStartY = previousDivY;
	        }
    /*	    else if (k == (numDivs-1))  // this is last div
	        {
	            alert('this is the last div in this section!')
	            alert(thisDivY.innerHTML);
	        }
    */	    
    	    
    	    
	    }
        
        
        
    }
    
     
}



function renumber(divToRenumber)
{
    var Container = document;
    
    if (divToRenumber) Container = divToRenumber;


	var CurrentPage = 0;
	var TotalPages = 0;

	var numSpans = Container.getElementsByTagName('span').length;
	
	
	for (i=0;i<(numSpans);i++) // go through all the span tags in the Container
	{
		if (Container.getElementsByTagName('span')[i] && Container.getElementsByTagName('span')[i].id && Container.getElementsByTagName('span')[i].id.indexOf('PageNumber') > -1)
		{
			CurrentPage++;TotalPages++;
			Container.getElementsByTagName('span')[i].innerHTML = CurrentPage;
		}
	}
	
	for (j=0;j<=(numSpans);j++) // go through all the span tags in the Container
	{
		if (Container.getElementsByTagName('span')[j] && Container.getElementsByTagName('span')[j].id && Container.getElementsByTagName('span')[j].id.indexOf('TotalPages') > -1)
		{
			Container.getElementsByTagName('span')[j].innerHTML = TotalPages;
		}
	}

}



function renumberPagesBySection(SectionTypeToRenumber)
{
    // determine start and stop indexes and send to other function
    var Container = document;
	var numSpans = Container.getElementsByTagName('span').length;
	var firstIndexOfSection = 0;
	var lastIndexOfSection = 0;
    var sectionTypeTitle = SectionTypeToRenumber + "TITLE";
    var sectionEndReached = false;
    var firstHeaderPassed = false;
    
	
	for (i=0;i<numSpans;i++) // go through all the span tags in the Container
	{
        if (Container.getElementsByTagName('span')[i] && Container.getElementsByTagName('span')[i].id && Container.getElementsByTagName('span')[i].id.indexOf('HeaderMarker') > -1)
		{
            if (firstHeaderPassed)
            {
                sectionEndReached = true;
                lastIndexOfSection = i-1;
            }
            else { firstHeaderPassed = true; }
		}

        if (i == (numSpans-1))
        {
            sectionEndReached = true;
            lastIndexOfSection = i;
        }
        
        if (sectionEndReached)
        {
            renumberSpansForSection(firstIndexOfSection,lastIndexOfSection);
            
//            alert('section start: ' + firstIndexOfSection + '; section end: ' + lastIndexOfSection);
            
            
            sectionEndReached = false;
            firstIndexOfSection = lastIndexOfSection + 1;
            lastIndexOfSection  = lastIndexOfSection + 1;

            
        }
	}
	
}


function renumberSpansForSection(StartIndex,EndIndex)
{
    var Container = document;
    
	var CurrentPage = 0;
	var TotalPages = 0;
	
	
	for (i=StartIndex;i<=EndIndex;i++) // go through the span tags
	{

		if (Container.getElementsByTagName('span')[i] && Container.getElementsByTagName('span')[i].id && Container.getElementsByTagName('span')[i].id.indexOf('PageNumber') > -1)
		{
			CurrentPage++;TotalPages++;
			Container.getElementsByTagName('span')[i].innerHTML = CurrentPage;
		}
	}
	
	for (j=StartIndex;j<=EndIndex;j++) // go through all the span tags in the Container
	{
		if (Container.getElementsByTagName('span')[j] && Container.getElementsByTagName('span')[j].id && Container.getElementsByTagName('span')[j].id.indexOf('TotalPages') > -1)
		{
			Container.getElementsByTagName('span')[j].innerHTML = TotalPages;
		}
	}


}













function renumberBySection(SectionTypeToRenumber)
{
    var Container = document;




	var CurrentPage = 0;
	var TotalPages = 0;
	var previousCurrentPageSpanIndex = 0;
	var previousTotalPagesSpanIndex = 0;
    var sectionTypeTitle = SectionTypeToRenumber + "TITLE";

var x = $(document);
x.tag('SPAN.' + 'SubTopicTitle').foreach(function(s) { alert(s.innerHTML); } );



	var numSpans = Container.getElementsByTagName('span').length;
	
	
	for (i=0;i<(numSpans);i++) // go through all the span tags in the Container
	{
		if (Container.getElementsByTagName('span')[i] && Container.getElementsByTagName('span')[i].id && Container.getElementsByTagName('span')[i].id.indexOf('PageNumber') > -1)
		{
			CurrentPage++;TotalPages++;
			Container.getElementsByTagName('span')[i].innerHTML = CurrentPage;
			previousCurrentPageSpanIndex = i;
			alert('page number!')
		}
		else if (Container.getElementsByTagName('span')[i] && Container.getElementsByTagName('span')[i].className && Container.getElementsByTagName('span')[i].className.toUpperCase().indexOf(sectionTypeTitle) > -1)
        {
            alert('new section!')
            CurrentPage = 1;
            TotalPages = 1;
            Container.getElementsByTagName('span')[previousCurrentPageSpanIndex].innerHTML = CurrentPage;
        }
	}
	
	for (j=0;j<=(numSpans);j++) // go through all the span tags in the Container
	{
		if (Container.getElementsByTagName('span')[j] && Container.getElementsByTagName('span')[j].id && Container.getElementsByTagName('span')[j].id.indexOf('TotalPages') > -1)
		{
			Container.getElementsByTagName('span')[j].innerHTML = TotalPages;
		}
	}

}


