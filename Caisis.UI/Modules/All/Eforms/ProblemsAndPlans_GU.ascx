<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ProblemsAndPlans_GU" CodeFile="ProblemsAndPlans_GU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<script language="javascript">
	tableArray.ProblemPlanHtmlTable_1 = "ProblemPlanHtmlTable_1";
	tableArray.ProblemPlanHtmlTable_2 = "ProblemPlanHtmlTable_2";
	tableArray.ProblemPlanHtmlTable_3 = "ProblemPlanHtmlTable_3";
	tableArray.ProblemPlanHtmlTable_4 = "ProblemPlanHtmlTable_4";
	tableArray.ProblemPlanHtmlTable_5 = "ProblemPlanHtmlTable_5";
	tableArray.ProblemPlanHtmlTable_6 = "ProblemPlanHtmlTable_6";
	tableArray.ProblemPlanHtmlTable_7 = "ProblemPlanHtmlTable_7";
	tableArray.ProblemPlanHtmlTable_8 = "ProblemPlanHtmlTable_8";
	tableArray.ProblemPlanHtmlTable_9 = "ProblemPlanHtmlTable_9";
	tableArray.ProblemPlanHtmlTable_10 = "ProblemPlanHtmlTable_10";
	tableArray.ProblemPlanHtmlTable_10 = "ProblemPlanHtmlTable_11";
	tableArray.ProblemPlanHtmlTable_10 = "ProblemPlanHtmlTable_12";
	tableArray.targetTable = "targetTable";
</script>
<script language="javascript">

var commonProblemsTarget = 0;
var maxPlansPerProblem = 8;

function getTextContent(target)
{
    var content = '';
    
    if(document.all)
    {
        content = target.innerText;
    }
    else
    {
        content = target.textContent;
    }
    
    return content;
    
}


function copyPastValues()
{

	sourceTable = document.getElementById('PastProblemsPlansTable');
	var currentTargetProblem = 0;
	var currentTargetPlan = 0;
	var currentSourceProblem = 0;
	var currentSourcePlan = 0;
	var planWillNotBeCopied = false;
	
				
	for (k = 0; k < sourceTable.rows.length; k++)
	{
		row = sourceTable.rows[k];
		if (row.hasChildNodes())
		{
			for (i = 0; i < row.cells.length; i++) {
				cell = row.cells[i];
				if (cell.hasChildNodes()) {
					for (j = 0; j < cell.childNodes.length; j++) {
						node = cell.childNodes[j];
						if (node.nodeName == 'INPUT') {
							type = node.getAttribute('type');
							if (type == 'checkbox' || type == 'radio') 
							{
							
															
								if (node.checked == true)
								{
									var textValue = getTextContent(document.getElementById(node.value));
									if (node.value.indexOf('PastProblem') > -1)
									{
										//var problemArray = new Array();
										//problemArray = node.value.split('_');
										
										currentTargetProblem += 1;
										currentTargetPlan = 0;
										
										setProblemValue(currentTargetProblem, textValue);
										
										
																				
									}
									else if (node.value.indexOf('PastPlan') > -1)
									{
									
										// check to make sure the problem is also checked
										var planArray = new Array();
										planArray = node.value.split('_');
										var currentProblem = planArray[1]
										var problemCheckbox = document.getElementById('pastProblemCheckbox_' + currentProblem)
										
										if (problemCheckbox.checked == true)
										{
											setPlanValue(currentTargetProblem, currentTargetPlan, textValue);
										}
										else
										{
											planWillNotBeCopied = true;
										}
										currentTargetPlan += 1;
										
									}
									
									
								}
								
								
							}
						}
					}
				}
			}
			
			
		
		
		}
		
	}
	
	
	hidePreviousProblems();	
	
	if (planWillNotBeCopied) alert('One or more PLANS were not copied because the\ncorresponding problem(s) were not checked.');
}



function setProblemValue(targetProblemNumber, textValue)
{
	var cell = document.getElementById('targetTable').rows[targetProblemNumber].cells[1];
	
	
	if (cell.hasChildNodes())
	{
		for (j = 0; j < cell.childNodes.length; j++)
		{
			node = cell.childNodes[j];
			
			if (node.nodeName == 'TEXTAREA')
			{
				node.value = textValue;
			}
		}
	}
	
	
}



function setPlanValue(targetProblemNumber, targetPlanNumber, textValue)
{
	var cell = document.getElementById('targetTable').rows[targetProblemNumber].cells[2];
	if (cell.hasChildNodes())
	{
		for (j = 0; j < cell.childNodes.length; j++)
		{
			node = cell.childNodes[j];
			
			if (node.nodeName == 'TABLE')
			{
				var targetPlanCell = node.rows[targetPlanNumber].cells[0];
				
				if (targetPlanCell.hasChildNodes())
				{
					for (j = 0; j < targetPlanCell.childNodes.length; j++)
					{
						currentNode = targetPlanCell.childNodes[j];
						
						if (currentNode.nodeName == 'TEXTAREA')
						{
							currentNode.value = textValue;
							
							node.rows[targetPlanNumber].style.display = 'block';
						}
					}
				}
			}
		}
	}
}


function togglePlansDisabledState(ProblemCheckbox)
{
	var currentTableRow = ProblemCheckbox.parentElement.parentElement;
	var problemArray = new Array();
	problemArray = ProblemCheckbox.value.split('_');
	var currentProblem = problemArray[1];

	if (ProblemCheckbox.checked == true)
	{
		
		
	}
}



function showPreviousProblems()
{
    var popupScrollingDiv = $('PastProblemsPlansScrollingDiv');
    setPastProblemPlanPopupHeight(popupScrollingDiv);
	MM_showHideLayers('PastProblemsPlansDiv','','show', 'PastProblemsPlansScrollingDiv','','show', 'CommonProblemsPlansDiv','','hide');
}

function hidePreviousProblems()
{
	MM_showHideLayers('PastProblemsPlansDiv','','hide', 'PastProblemsPlansScrollingDiv','','hide');
}

function hideCommonProblems()
{
	MM_showHideLayers('CommonProblemsPlansDiv','','hide');
}

function showCommonProblems(problemNumber, imageObj)
{
	clearCommonProblemPlanInputValues();

	if (document.getElementById('PDFormDiv'))
	{
		var scrollNum = document.getElementById('PDFormDiv').scrollTop;
//		alert(scrollNum);
		
		CommonProblemsPlansDiv.style.top = scrollNum + 5 + 'px';
	}
    var popupScrollingDiv = $('plansContainer');
    setCommonProblemPlanPopupHeight(popupScrollingDiv);
	MM_showHideLayers('CommonProblemsPlansDiv','','show', 'PastProblemsPlansDiv','','hide', 'PastProblemsPlansScrollingDiv','','hide');

	commonProblemsTarget = problemNumber;
}

function showCommonProblemsForNextOpenProblem()
{
    var problemFields = [$('<%= ProblemName_1.ClientID %>'), $('<%= ProblemName_2.ClientID %>'), $('<%= ProblemName_3.ClientID %>'), $('<%= ProblemName_4.ClientID %>'), $('<%= ProblemName_5.ClientID %>'), $('<%= ProblemName_6.ClientID %>'), $('<%= ProblemName_7.ClientID %>'), $('<%= ProblemName_8.ClientID %>'), $('<%= ProblemName_9.ClientID %>'), $('<%= ProblemName_10.ClientID %>'), $('<%= ProblemName_11.ClientID %>'), $('<%= ProblemName_12.ClientID %>')];
    var nextOpenProblem = 0;
    
    for (i = 0; i < problemFields.length; i++)
    {
        if (problemFields[i].value == '') {nextOpenProblem = i+1; break; }
    }

    if (nextOpenProblem > 0) {
        showCommonProblems(nextOpenProblem, '');
        if(problemFields[nextOpenProblem-1].parentNode.parentNode.tagName.toUpperCase() == 'TR') problemFields[nextOpenProblem-1].parentNode.parentNode.style.display = '';
    }
    else {alert('The maximum number of plans has been reached.')}

}


function copyCommonValues(addAnother)
{
    setConcatProblemValue();
    setConcatPlanValues();
	var CommonProblemValue = document.getElementById('ProblemAndManagementField').value;
	setProblemValue(commonProblemsTarget, CommonProblemValue);
	
	sourceTable = document.getElementById('commonPlansLayoutTable');
	var currentTargetPlan = 0;
	var currentSourcePlan = 0;
	var tooManyPlans = false;
	
				
	for (k = 0; k < sourceTable.rows.length; k++)
	{
		row = sourceTable.rows[k];
		var rowInputs = row.getElementsByTagName('input');
		
		for (l = 0; l < rowInputs.length; l++)
		{
		    var rowInputType = rowInputs[l].getAttribute('type');
		    if (rowInputType == 'hidden' && rowInputs[l].value.length > 0)
		    {
			    var textValue = rowInputs[l].value;
    			
			    if (currentTargetPlan < maxPlansPerProblem)
			    {
				    setPlanValue(commonProblemsTarget, currentTargetPlan, textValue);
			    }
			    else
			    {
				    tooManyPlans = true;
			    }

			    currentTargetPlan += 1;
    				
		    }
		}
		

	}	
	
	
	if (tooManyPlans)
	{
		alert('A maximum of ' + maxPlansPerProblem + ' plans may be selected for each problem.\nPlease reduce the number of selected plans.');
	}
	else
	{
		if (!addAnother)
		{
		    hideCommonProblems();
		}
		else
		{
		    showCommonProblemsForNextOpenProblem();
		}
	}
}


function clearCommonProblemPlanInputValues()
{
//	
	clearAllElementsContainedInNode($('commonProblemsPlansInnerContainer'));
	document.getElementById('CommonProblemsSelect').value = '';
	
}


function setConcatProblemValue()
{
    var CommonProblemsSelect = $('CommonProblemsSelect');
    var problemManagedByContainer = $('problemManagedByContainer');
    var problemManagedByInputs = problemManagedByContainer.getElementsByTagName('input');
    var ProblemAndManagementField = $('ProblemAndManagementField');
    
    var concatProblem = CommonProblemsSelect.value;
    
    for (i = 0; i < problemManagedByInputs.length; i++)
    {
        if (problemManagedByInputs[i].type == 'radio' && problemManagedByInputs[i].checked == true) concatProblem = concatProblem + ' (' + problemManagedByInputs[i].value + ')';
    }
    
     ProblemAndManagementField.value = concatProblem;
}
function setConcatPlanValues()
{
    var commonPlansTable = $('commonPlansLayoutTable');
    
    for (i = 0; i < commonPlansTable.rows.length; i++)
    {
        var rowInputs = commonPlansTable.rows[i].getElementsByTagName('input');
        var rowPlan;
        var rowPlanNote;
        var rowPlanCombined;
        
        for (j = 0; j < rowInputs.length; j++)
        {
            if (rowInputs[j].id.indexOf('Plan_') > -1) { rowPlan = rowInputs[j]; }
            else if (rowInputs[j].id.indexOf('PlanNote_') > -1) { rowPlanNote = rowInputs[j]; }
            else if (rowInputs[j].id.indexOf('PlanCombined_') > -1) { rowPlanCombined = rowInputs[j]; }
        }
        
        try
        {
            if (rowPlan.type == 'checkbox' && rowPlan.checked == true)
            {
                rowPlanCombined.value = rowPlan.value + ' ' + rowPlanNote.value;
  //              if (rowPlanCombined.value.length > 0) alert(rowPlanCombined.value);
            }
            else {rowPlanCombined.value = '';}
        }
        catch(err){}
        
        
    }
}

function showRelevantPlans(problemSelect)
{
    var selectedProblem = problemSelect.value;
    var selectedProblemNoSpaces = selectedProblem.split(' ').join('');
    if (selectedProblemNoSpaces.length > 0)
    {
         var commonPlansTbodies = commonPlansLayoutTable.getElementsByTagName('tbody');
         for (i = 0; i < commonPlansTbodies.length; i++)
         {
            clearAllElementsContainedInNode(commonPlansTbodies[i]);
            commonPlansTbodies[i].style.display = 'none';
         }
         
         try
         {
            $('CommonPlans_' + selectedProblemNoSpaces).style.display = '';
         }
        catch(err){$('CommonPlans_Default').style.display = '';}
    
    
    }
    
}
function checkAllRelatedPlans(cb)
{
    var cbTd = cb.parentNode;
    var container = cbTd.parentNode;
    var numPlansForProblem = 1;
    
    if (cbTd.getAttribute('rowspan') != null && cbTd.getAttribute('rowspan') > 0) numPlansForProblem = cbTd.getAttribute('rowspan');
    
    for (var j=0;j<numPlansForProblem;j++)
    {
        var inputs = container.getElementsByTagName('input');
	    for (var i=0;i<inputs.length;i++)
	    {
	        type = inputs[i].getAttribute('type');
		    if (type == 'checkbox' || type == 'radio') {
			    inputs[i].checked = cb.checked;
		    } 
    		
	    }
	    if (container.nextSibling != null) container = container.nextSibling;
	}
}
function checkAllPastProblemsAndPlans(cb)
{
    var container = $('PastProblemsPlansScrollingDiv');

    var inputs = container.getElementsByTagName('input');
	for (var i=0;i<inputs.length;i++)
	{
	    type = inputs[i].getAttribute('type');
		if (type == 'checkbox' || type == 'radio') {
			inputs[i].checked = cb.checked;
		} 
		
	}
}

function setPastProblemPlanPopupHeight(popupDiv)
{
    var windowHeight = getHeight();

    popupDiv.style.height = (windowHeight - 230) + 'px';

}
function setCommonProblemPlanPopupHeight(popupDiv)
{
    var windowHeight = getHeight();

    popupDiv.style.height = (windowHeight - 265) + 'px';

}

</script>
<style type="text/css">
div#commonProblemsPlans
{
	border: solid 1px #8d2a2c;
}

div#commonProblemsPlansInnerContainer
{
	margin: 10px;
}

#commonProblemsPlansLayoutTable
{
	width: 100%;
	border-spacing: 0px;
	
}
#commonProblemsPlansLayoutTable th
{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	font-weight: bold;
	color: #000000;
	background-color: #E8E8E8;
	text-align: left;
	padding: 4px 0px 3px 13px;
}
#commonProblemsPlansLayoutTable>td
{
	border-right: solid 1px #ffffff;
}
#commonProblemsPlansLayoutTable td
{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #333333;
	text-align: left;
	padding-left: 13px;
	vertical-align: top;
}
.problemPlanHelpText
{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: normal;
	color: #666666;
}
.commonProblemLabel
{
	width: 80px;
}
#commonProblemsLayoutTable
{
	border-spacing: 0px;
}
#commonProblemsLayoutTable td
{
	padding-left: 0px;
}
#plansContainer
{
	border: solid 1px #DDDDDD;
	overflow: auto;
	overflow-x: hidden;
	padding-right: 20px;
}
#commonPlansLayoutTable
{
	width: 100%;
}
#commonPlansLayoutTable td
{
	padding: 1px 1px 1px 1px;
	border-right: none;
}
#commonPlansLayoutTable td.labelCol
{
	width: 175px;
}
tr.commonPlansRowA
{
	background-color: #E8E8E8;
}
tr.commonPlansRowB
{
	background-color: #ffffff;
}
#commonPlansLayoutTable input[type=text]
{
	width: 97%;
}
#RisksDiscussedTable
{
    margin-top: 50px;
    background-position: left center;
    width: 650px;
}
#RisksDiscussedTable td
{
    font-weight: bold;
    padding: 8px 3px 8px 3px;
    vertical-align: top;
}
</style>

<div style=" ">

<div id="PastProblemsPlansDiv" style="position:absolute; top: 0px; left: 0px; right: 5px; z-index:7; visibility: visible; border: solid 2px #8d2a2c; background-color: #ffffff;"> 
  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tableTest">
  <tr>
      <td style="background-color: #8d2a2c; color: #ffffff; padding-left: 10px;" height="22" valign="middle"><img src="../../Images/CloseSmall.gif" width="38" height="8" hspace="10" vspace="3" class="ClickableImage" title="Click here to close." onClick="hidePreviousProblems();" align="right" />Previous Problems & Plans for <asp:Literal ID="PatientNameDisplay" Runat="server" /></td>
  </tr>
  
   <tr>
      <td style="background-color: #CDD4DA; color: #333333; padding: 5px 5px 5px 10px; font-size: 11px;" >
	  Listed 
	  below are problems and plans entered for this patient's previous visit. Please check off any that you wish to reuse for the current visit.<br />
	  <input type="checkbox" onclick="checkAllPastProblemsAndPlans(this);" /> <span style="font-size: 12px; font-weight: bold;">Check all past problems &amp; plans</span>
	  </td>
  </tr>
   <tr>
     <td ><table width="100%" border="0" cellspacing="0" cellpadding="5" >
       <tr>
         <td width="4%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
         <td width="5%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
         <td width="43%" class="controlBoxDataGridHeaderFirstCol">Problems</td>
         <td width="5%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
         <td width="43%" class="controlBoxDataGridHeaderFirstCol">Plans</td>
       </tr>

     </table></td>
   </tr>
  <tr>
      <td valign="top">
	  
	  
	  <div id="PastProblemsPlansScrollingDiv" style="height:170px; overflow:auto; visibility: visible; overflow-x: hidden;">
	  
	  
	  
	  <table id="PastProblemsPlansTable" width="100%" border="0" cellspacing="0" cellpadding="5" class="eformLargePopulatedTable" >
        

        
         <asp:Repeater ID="PastProblemsRpt" Runat="server" OnItemDataBound="ProblemPlansItemDataBound" >
			<ItemTemplate>
				<tr>
				<td id="ProblemNumberTd" runat="server" width="3%" valign="top" class="ControlBoxBottomBorder" style="border-bottom: solid 1px #cccccc;"><strong><%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %></strong>&nbsp;</td>
				<td id="ProblemCheckboxTd" runat="server"  width="5%" valign="top" class="ControlBoxBottomBorder"><input onclick="checkAllRelatedPlans(this)" name="pastProblemCheckbox_<%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %>" type="checkbox" id="pastProblemCheckbox_<%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %>" value="PastProblem_<%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %>" /></td>
				<td id="ProblemNameTd" runat="server"  valign="top" class="ControlBoxLinedRows"><span id="PastProblem_<%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %>" ><%# DataBinder.Eval(Container.DataItem, "ProblemName") %></span></td>
				<td width="5%" valign="top" class="ControlBoxBottomBorder"><input name="pastPlanCheckbox<%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %>_<%# DataBinder.Eval(Container.DataItem, "PlanNumber") %>" type="checkbox" id="pastPlanCheckbox<%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %>_<%# DataBinder.Eval(Container.DataItem, "PlanNumber") %>" value="PastPlan_<%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %>_<%# DataBinder.Eval(Container.DataItem, "PlanNumber") %>" /></td>
				<td valign="top" class="ControlBoxLinedRows"><span id="PastPlan_<%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %>_<%# DataBinder.Eval(Container.DataItem, "PlanNumber") %>" ><%# DataBinder.Eval(Container.DataItem, "PlanName") %></span></td>
				</tr>
			</ItemTemplate>
        </asp:Repeater>


		<tr id="NoPastProblemsMsgRow" runat="server">
				<td class="ControlBoxBottomBorder" colspan="5" align="center" height="160"><strong>This patient has no previous problems and plans listed.</strong></td>
		</tr>

        </table>
	  </div>	  </td>
  </tr>
  <tr><td align="center"><img src="../../Images/CancelOnWhite_small.gif" width="68" height="19" hspace="15" style="cursor:pointer;"   onclick="hidePreviousProblems();" /><img  hspace="15" src="../../Images/CopyCheckedProblemsAndPlans_Small.gif" width="209" height="19" class="ClickableImage" title="Click here to close." onClick="copyPastValues();"  /></td></tr>
</table>
</div>

<div id="CommonProblemsPlansDiv" style="position:absolute; height: auto; top:0px; z-index:5; visibility: hidden; border: solid 2px #8d2a2c; left: 5px; background-color: #ffffff;"> 
	    
          
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="22" valign="middle" style="background-color: #8d2a2c; color: #ffffff; padding-left: 10px;"><img src="../../Images/CloseSmall.gif" width="38" height="8" hspace="10" vspace="3" class="ClickableImage" title="Click here to close." onClick="hideCommonProblems();" align="right" />Common Problems & Plans</td>
      </tr>
      <tr><td >
      
      

<div id="commonProblemsPlansInnerContainer">

<table id="commonProblemsPlansLayoutTable" cellspacing="0">
<tr>
	<th style="width: 260px;border-right: solid 1px #ffffff;">Problem / Comorbidity</th>
    <th style="width: 175px;">Plans <span class="problemPlanHelpText">(select up to eight)</span></th>
    <th style="font-size: 11px; color: #333333; ">Plan Notes</th>
</tr>
<tr>
	<td style="border-right: solid 1px #E9E9E9; padding: 5px 5px 5px 3px;">
    <!-- problems -->
    	<table id="commonProblemsLayoutTable" cellspacing="0">
        <tr>
            <td colspan="2" style="padding-top: 10px;">
            <input type="hidden" id="ProblemAndManagementField" />
            <select id="CommonProblemsSelect" name="CommonProblemsSelect" onchange="showRelevantPlans(this);" style="font-size: 13px; max-width: 300px; font-weight: bold;">
            <option value="">-- Select Problem --</option>
        <asp:Repeater ID="CommonProblems" runat="server"  > 
				<ItemTemplate> 
					<option value="<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>"><%# DataBinder.Eval(Container.DataItem, "LkpCode") %></option>
				</ItemTemplate>
			</asp:Repeater>
			<optgroup label="Comorbidities" id="ComorbiditiesOptGroup" >
			<asp:Repeater ID="comorbidities" runat="server">
	            <ItemTemplate><option value="<%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>"><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %></option></ItemTemplate>
              </asp:Repeater>
              </optgroup>
        </select></td>
        </tr>
        <tr>
            <td class="commonProblemLabel" style="padding-top: 15px; font-weight: bold; width: 80px;">Management</td>
            <td style="padding-top: 15px;" id="problemManagedByContainer" ><input type="radio" name="problemManagedBy" value="Managed by Local MD" /> Managed by Local MD<br />
		<input type="radio" name="problemManagedBy" value="Managed at MSKCC" /> Managed at MSKCC<br />
		<input type="radio" name="problemManagedBy" value="Managed by Me" /> Managed by Me</td>
        </tr>
        </table>
        
    
    </td>
	<td colspan="2" style="padding: 15px 15px 15px 13px;">
    <!-- plans -->
    <div id="plansContainer">
    	<table id="commonPlansLayoutTable" cellspacing="0">
    	     <tbody id="CommonPlans_Default" >
    	     <tr class="commonPlansRowB">
            	<td class="labelCol" colspan="2" style="font-size: 12px; padding: 10px 10px 10px 10px;">
            	    Listed in the drop down menu on the left are commom problems along with any comorbidities entered for this patient.<br /><br />Select a problem, and if applicable select a management option and any plans that might be listed here; then click "Use Selected Problem / Plan" below to use your selection.
            	</td>
            </tr>
    	     </tbody>
    	     <tbody id="CommonPlans_Default_old" style="display: none;"  >
    	<asp:Repeater ID="CommonPlans" runat="server" > 
				<ItemTemplate> 
        	<tr class="commonPlansRow<%# Container.ItemIndex % 2==0 ? "A": "B" %>">
            	<td class="labelCol"><input type="checkbox" id="Plan_<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>" value="<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>" /><%# DataBinder.Eval(Container.DataItem, "LkpCode") %></td>
            	<td><input id="PlanNote_<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>" type="text"  /><input id="PlanCombined_<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>" type="hidden"  /></td>
            </tr>
            </ItemTemplate>
            </asp:Repeater>
            </tbody>		
            <tbody id="CommonPlans_ProstateCancer" style="display: none;" >
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_Continueanti-androgentherapy" value="Continue anti-androgen therapy" />Continue anti-androgen therapy</td>
            	    <td><input id="PlanNote_Continueanti-androgentherapy" type="text"  /><input id="PlanCombined_Continueanti-androgentherapy" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_Continuecurrenttreatment" value="Continue current treatment" />Continue current treatment</td>
            	    <td><input id="PlanNote_Continuecurrenttreatment" type="text"  /><input id="PlanCombined_Continuecurrenttreatment" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_CTScan" value="CT Scan" />CT Scan</td>
            	    <td><input id="PlanNote_CTScan" type="text"  /><input id="PlanCombined_CTScan" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_PETScan" value="PET Scan" />PET Scan</td>
            	    <td><input id="PlanNote_PETScan" type="text"  /><input id="PlanCombined_PETScan" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_BoneScan" value="Bone Scan" />Bone Scan</td>
            	    <td><input id="PlanNote_BoneScan" type="text"  /><input id="PlanCombined_BoneScan" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_MRI" value="MRI" />MRI</td>
            	    <td><input id="PlanNote_MRI" type="text"  /><input id="PlanCombined_MRI" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_EndorectalCoilMRI" value="Endorectal Coil MRI" />Endorectal Coil MRI</td>
            	    <td><input id="PlanNote_EndorectalCoilMRI" type="text"  /><input id="PlanCombined_EndorectalCoilMRI" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_X-Ray" value="X-Ray" />X-Ray</td>
            	    <td><input id="PlanNote_X-Ray" type="text"  /><input id="PlanCombined_X-Ray" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_PSAtoday" value="PSA today" />PSA today</td>
            	    <td><input id="PlanNote_PSAtoday" type="text"  /><input id="PlanCombined_PSAtoday" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_PSAatnextvisit" value="PSA at next visit" />PSA at next visit</td>
            	    <td><input id="PlanNote_PSAatnextvisit" type="text"  /><input id="PlanCombined_PSAatnextvisit" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_Returntoclinic" value="Return to clinic" />Return to clinic</td>
            	    <td><input id="PlanNote_Returntoclinic" type="text"  /><input id="PlanCombined_Returntoclinic" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_Patientonbestsupportivecare" value="Patient on best supportive care" />Patient on best supportive care</td>
            	    <td><input id="PlanNote_Patientonbestsupportivecare" type="text"  /><input id="PlanCombined_Patientonbestsupportivecare" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_PalliativetherapySurgery" value="Palliative therapy: Surgery" />Palliative therapy: Surgery</td>
            	    <td><input id="PlanNote_PalliativetherapySurgery" type="text"  /><input id="PlanCombined_PalliativetherapySurgery" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_PalliativetherapyRadiation" value="Palliative therapy: Radiation" />Palliative therapy: Radiation</td>
            	    <td><input id="PlanNote_PalliativetherapyRadiation" type="text"  /><input id="PlanCombined_PalliativetherapyRadiation" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_Treatmentchangetoday" value="Treatment change today" />Treatment change today</td>
            	    <td><input id="PlanNote_Treatmentchangetoday" type="text"  /><input id="PlanCombined_Treatmentchangetoday" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" value="Recommended primary treatment of surgery with Dr. " />Recommended primary treatment of surgery with Dr. </td>
            	    <td><input  type="text"  /><input  type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" value="Recommended primary treatment of radiation with Dr." />Recommended primary treatment of radiation with Dr.</td>
            	    <td><input  type="text"  /><input  type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" value="Patient not a candidate for primary treatment at this time" />Patient not a candidate for primary treatment at this time</td>
            	    <td><input  type="text"  /><input  type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" value="Recommended active surveillance" />Recommended active surveillance</td>
            	    <td><input  type="text"  /><input  type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" value="Prostate Biopsy" />Prostate Biopsy</td>
            	    <td><input  type="text"  /><input  type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" value="Lymph node Biopsy" />Lymph node Biopsy</td>
            	    <td><input  type="text"  /><input  type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" value="Biopsy: Rule out new evidence of metastatic disease" />Biopsy: Rule out new evidence of metastatic disease</td>
            	    <td><input  type="text"  /><input  type="hidden"  /></td>
                </tr>
            </tbody>
            
            
            
            
            <tbody id="CommonPlans_BoneMetastasis" style="display: none;" >
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_" value="Continue location of lesion(s)" />Continue location of lesion(s)</td>
            	    <td><input id="PlanNote_" type="text"  /><input id="PlanCombined_" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_" value="Palliative Radiation" />Palliative Radiation</td>
            	    <td><input id="PlanNote_" type="text"  /><input id="PlanCombined_" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_" value="Bone Protection: Continue Zometa" />Bone Protection: Continue Zometa</td>
            	    <td><input id="PlanNote_" type="text"  /><input id="PlanCombined_" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_" value="Bone Protection: Continue Calcium with Vitamin D" />Bone Protection: Continue Calcium with Vitamin D</td>
            	    <td><input id="PlanNote_" type="text"  /><input id="PlanCombined_" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_" value="Bone Protection: Continue Pamidronate" />Bone Protection: Continue Pamidronate</td>
            	    <td><input id="PlanNote_" type="text"  /><input id="PlanCombined_" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_" value="Bone Protection: Advised patient to Exercise as much as possible" />Bone Protection: Advised patient to Exercise as much as possible</td>
            	    <td><input id="PlanNote_" type="text"  /><input id="PlanCombined_" type="hidden"  /></td>
                </tr>
             </tbody>
            
            
            
            <tbody id="CommonPlans_UrinaryIssues" style="display: none;" >
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_1" value="Urinary Retention" />Urinary Retention</td>
            	    <td><input id="PlanNote_1" type="text"  /><input id="PlanCombined_1" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_2" value="Urinary Frequency" />Urinary Frequency</td>
            	    <td><input id="PlanNote_2" type="text"  /><input id="PlanCombined_2" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_3" value="Hematuria" />Hematuria</td>
            	    <td><input id="PlanNote_3" type="text"  /><input id="PlanCombined_3" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_4" value="Follow-up with Urology" />Follow-up with Urology</td>
            	    <td><input id="PlanNote_4" type="text"  /><input id="PlanCombined_4" type="hidden"  /></td>
                </tr>
            </tbody>
            
            
            <tbody id="CommonPlans_ErectileFunction" style="display: none;" >
            
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_5" value="Prescribed Viagra" />Prescribed Viagra</td>
            	    <td><input id="PlanNote_5" type="text"  /><input id="PlanCombined_5" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_6" value="Referred to Dr. Mulhall in Urology" />Referred to Dr. Mulhall in Urology</td>
            	    <td><input id="PlanNote_6" type="text"  /><input id="PlanCombined_6" type="hidden"  /></td>
                </tr>
            </tbody>
            <tbody id="CommonPlans_HistoryofArthritis" style="display: none;" >
            
            </tbody>
            <tbody id="CommonPlans_Ophthalmology" style="display: none;" >
            
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_7" value="Cataracts status post surgery" />Cataracts status post surgery</td>
            	    <td><input id="PlanNote_7" type="text"  /><input id="PlanCombined_7" type="hidden"  /></td>
                </tr>
            </tbody>
            <tbody id="CommonPlans_DiabetesMellitus" style="display: none;" >
            
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_8" value="Follow-up with Endocrinology" />Follow-up with Endocrinology</td>
            	    <td><input id="PlanNote_8" type="text"  /><input id="PlanCombined_8" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_9" value="Last Glucose result" />Last Glucose result</td>
            	    <td><input id="PlanNote_9" type="text"  /><input id="PlanCombined_9" type="hidden"  /></td>
                </tr>
            </tbody>
            <tbody id="CommonPlans_Pain" style="display: none;" >
            
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_10" value="Prescription provided" />Prescription provided</td>
            	    <td><input id="PlanNote_10" type="text"  /><input id="PlanCombined_10" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_11" value="Refer to pain management service" />Refer to pain management service</td>
            	    <td><input id="PlanNote_11" type="text"  /><input id="PlanCombined_11" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_12" value="Resolved" />Resolved</td>
            	    <td><input id="PlanNote_12" type="text"  /><input id="PlanCombined_12" type="hidden"  /></td>
                </tr>
            </tbody>
            <tbody id="CommonPlans_Cardiovascular" style="display: none;" >
            
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_13" value="History of non-specific T-wave changes" />History of non-specific T-wave changes</td>
            	    <td><input id="PlanNote_13" type="text"  /><input id="PlanCombined_13" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_14" value="History of bradycardia" />History of bradycardia</td>
            	    <td><input id="PlanNote_14" type="text"  /><input id="PlanCombined_14" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_15" value="History of Tachycardia" />History of Tachycardia</td>
            	    <td><input id="PlanNote_15" type="text"  /><input id="PlanCombined_15" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_16" value="Being followed by Local Cardiologist" />Being followed by Local Cardiologist</td>
            	    <td><input id="PlanNote_16" type="text"  /><input id="PlanCombined_16" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_17" value="History of Atrial Fibulation followed by local cardiologist" />History of Atrial Fibulation followed by local cardiologist</td>
            	    <td><input id="PlanNote_17" type="text"  /><input id="PlanCombined_17" type="hidden"  /></td>
                </tr>
            </tbody>
            <tbody id="CommonPlans_AdvancedDirectives" style="display: none;" >
            
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_18" value="Patient DNR signed" />Patient DNR signed</td>
            	    <td><input id="PlanNote_18" type="text"  /><input id="PlanCombined_18" type="hidden"  /></td>
                </tr>
                <tr class="commonPlansRowB">
            	    <td class="labelCol"><input type="checkbox" id="Plan_19" value="Patient currently DNR" />Patient currently DNR</td>
            	    <td><input id="PlanNote_19" type="text"  /><input id="PlanCombined_19" type="hidden"  /></td>
                </tr>
                
                <tr class="commonPlansRowA">
            	    <td class="labelCol"><input type="checkbox" id="Plan_20" value="Patient referred to patient representation" />Patient referred to patient representation</td>
            	    <td><input id="PlanNote_20" type="text"  /><input id="PlanCombined_20" type="hidden"  /></td>
                </tr>
            </tbody>
            
            
            
            
            
            
            
        </table>
    </div>
    
    </td>
</tr>
<tr><td colspan="3" style="text-align: center; padding-top: 15px;"><img src="../../Images/CancelOnWhite_small.gif" width="68" height="19" hspace="15" style="cursor:pointer;"  title="Click here to close."  onclick="hideCommonProblems();" /><img  hspace="15" src="../../Images/AddAnotherProblemPlan_Small.gif"class="ClickableImage" onClick="copyCommonValues(true);"  /><img  hspace="15" src="../../Images/UseSelectedProblemPlan_Small.gif"class="ClickableImage" onClick="copyCommonValues(false);"  />	</td></tr>
</table>
</div>
      
      
      
      
      
      
      
		  </td>
		</tr>
	</table>
  </div>


<a name="ProblemsAndPlans_GU" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Problems and Plans"></asp:Label><img src="../../Images/ViewCopyFromPreviousVisit_small.gif" width="176" height="17" hspace="10" class="ClickableImage" style="margin-left: 310px;" title="Click here to view past problems and plans." onclick="showPreviousProblems();" /><br />

<table id="targetTable" width="96%" border="0" cellspacing="0" cellpadding="0" class="eformLargePopulatedTable" style="background-position: 0px 20px;">
  <tr>
    <td width="6%" height="26" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td width="46%" class="controlBoxDataGridHeaderFirstCol">Diagnoses / Problem List </td>
    <td width="45%" class="controlBoxDataGridHeaderFirstCol">Plan</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>1</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(1, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2"  style="width: 95%;"  Runat="server" RecordId="1" ID="ProblemName_1"/>
	
	
	<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_1');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18" border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;"></a>	</td>
    <td valign="top" class="ControlBoxLinedRows">
		<table align="left" cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_1">
		
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="1" ID="PlanName_1_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="1" ID="PlanName_1_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="1" ID="PlanName_1_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="1" ID="PlanName_1_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="1" ID="PlanName_1_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="1" ID="PlanName_1_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="1" ID="PlanName_1_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="1" ID="PlanName_1_8"/></td></tr>
		</table>		</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>2</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(2, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ID="ProblemName_2"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_2');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_2">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="2" ID="PlanName_2_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="2" ID="PlanName_2_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="2" ID="PlanName_2_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="2" ID="PlanName_2_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="2" ID="PlanName_2_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="2" ID="PlanName_2_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="2" ID="PlanName_2_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="2" ID="PlanName_2_8"/></td></tr>
		</table>		</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>3</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(3, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ID="ProblemName_3"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_3');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_3">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="3" ID="PlanName_3_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="3" ID="PlanName_3_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="3" ID="PlanName_3_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="3" ID="PlanName_3_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="3" ID="PlanName_3_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="3" ID="PlanName_3_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="3" ID="PlanName_3_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="3" ID="PlanName_3_8"/></td></tr>
		</table>		</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>4</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(4, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ID="ProblemName_4"/>      <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_4');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_4">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="4" ID="PlanName_4_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="4" ID="PlanName_4_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="4" ID="PlanName_4_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="4" ID="PlanName_4_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="4" ID="PlanName_4_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="4" ID="PlanName_4_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="4" ID="PlanName_4_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="4" ID="PlanName_4_8"/></td></tr>
		</table>		</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>5</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(5, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ID="ProblemName_5"/>
    <span style="padding-top: 6px;"><a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_5');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></span></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_5">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="5" ID="PlanName_5_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="5" ID="PlanName_5_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="5" ID="PlanName_5_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="5" ID="PlanName_5_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="5" ID="PlanName_5_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="5" ID="PlanName_5_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="5" ID="PlanName_5_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="5" ID="PlanName_5_8"/></td></tr>
		</table>		</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>6</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(6, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ID="ProblemName_6"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_6');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_6">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="6" ID="PlanName_6_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="6" ID="PlanName_6_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="6" ID="PlanName_6_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="6" ID="PlanName_6_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="6" ID="PlanName_6_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="6" ID="PlanName_6_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="6" ID="PlanName_6_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="6" ID="PlanName_6_8"/></td></tr>
		</table>	</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>7</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(7, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ID="ProblemName_7"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_7');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_7">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="7" ID="PlanName_7_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="7" ID="PlanName_7_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="7" ID="PlanName_7_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="7" ID="PlanName_7_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="7" ID="PlanName_7_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="7" ID="PlanName_7_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="7" ID="PlanName_7_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="7" ID="PlanName_7_8"/></td></tr>
		</table>	</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>8</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(8, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ID="ProblemName_8"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_8');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_8">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="8" ID="PlanName_8_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="8" ID="PlanName_8_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="8" ID="PlanName_8_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="8" ID="PlanName_8_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="8" ID="PlanName_8_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="8" ID="PlanName_8_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="8" ID="PlanName_8_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="8" ID="PlanName_8_8"/></td></tr>
		</table>	</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>9</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(9, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 95%;" Runat="server" RecordId="9" ID="ProblemName_9"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_9');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_9">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="9" ID="PlanName_9_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="9" ID="PlanName_9_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="9" ID="PlanName_9_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="9" ID="PlanName_9_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="9" ID="PlanName_9_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="9" ID="PlanName_9_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="9" ID="PlanName_9_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="9" ID="PlanName_9_8"/></td></tr>
		</table>	</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>10</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(10, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 95%;" Runat="server" RecordId="10" ID="ProblemName_10"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_10');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_10">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="10" ID="PlanName_10_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="10" ID="PlanName_10_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="10" ID="PlanName_10_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="10" ID="PlanName_10_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="10" ID="PlanName_10_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="10" ID="PlanName_10_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="10" ID="PlanName_10_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="10" ID="PlanName_10_8"/></td></tr>
		</table>	</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;">
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>11</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(11, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 95%;" Runat="server" RecordId="11" ID="ProblemName_11"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_11');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_11">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="11" ID="PlanName_11_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="11" ID="PlanName_11_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="11" ID="PlanName_11_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="11" ID="PlanName_11_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="11" ID="PlanName_11_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="11" ID="PlanName_11_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="11" ID="PlanName_11_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="11" ID="PlanName_11_8"/></td></tr>
		</table>	</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;">
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>12</strong>
    <img src="../../Images/icon_List.png" class="ClickableImage" style="margin-right: 6px; clear: both; display: block; margin: 8px auto 0px auto;" onclick="showCommonProblems(12, this);" />    </td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 95%;" Runat="server" RecordId="12" ID="ProblemName_12"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_12');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_12">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="1" ParentRecordId="12" ID="PlanName_12_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="2" ParentRecordId="12" ID="PlanName_12_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="3" ParentRecordId="12" ID="PlanName_12_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="4" ParentRecordId="12" ID="PlanName_12_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="5" ParentRecordId="12" ID="PlanName_12_5"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="6" ParentRecordId="12" ID="PlanName_12_6"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="7" ParentRecordId="12" ID="PlanName_12_7"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 95%;" Runat="server" RecordId="8" ParentRecordId="12" ID="PlanName_12_8"/></td></tr>
		</table>	</td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 28px;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
<%-- 
  <tr>
	<td colspan="3" align="left" style="padding-left: 25px; padding-top:10px;"><strong>Notes</strong><br/><euc:EformTextArea TextMode="MultiLine" Table="Encounters" Field="EncNotes" Rows="4" style="width: 600px;" Id="AdditionalProblemPlanNotes" Runat="server"></euc:EformTextArea><br/><br/></td>
  </tr>
--%>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'targetTable');" />
<!-- <span class="ControlBoxLinedRows" style="padding-top: 6px;"></span> -->






<table id="RisksDiscussedTable" class="eformLargePopulatedTable" cellspacing="0" >
<tr>
<td>
<euc:EformCheckBox ID="TreatmentRisksDiscussed" Table="NoTable" Field="TreatmentRisksDiscussed" runat="server" Value="Risks, benefits and rationale of treatment plan discussed in detail. All questions answered."/>
</td>
<td>Risks, benefits and rationale of treatment plan discussed in detail. All questions answered.</td>
</tr>
<tr>
<td>
<euc:EformCheckBox ID="ProtocolRisksDiscussed" Table="NoTable" Field="ProtocolRisksDiscussed" runat="server" Value="The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent."  />
</td>
<td>The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.</td>
</tr>

</table>
</div>

<asp:Literal ID="hidePastProblemsScript" runat="server" Visible="true"><script language="javascript">hidePreviousProblems();</script></asp:Literal>
<br/><br/>


<div id="comorbiditiesContainer" style="display: none;">
<%--<asp:Repeater ID="comorbidities" runat="server"> 
	<ItemTemplate><input type="text" style="display: none;" value="<%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>" /></ItemTemplate>
  </asp:Repeater>--%>
    <euc:EformTextBox style="display: none;"  RecordId="1" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_1"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="2" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_2"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="3" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_3"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="4" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_4"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="5" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_5"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="6" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_6"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="7" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_7"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="8" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_8"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="9" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_9"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="10" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_10"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="11" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_11"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="12" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_12"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="13" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_13"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="14" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_14"   Runat="server" />
    <euc:EformTextBox style="display: none;"  RecordId="15" TABLE="Comorbidities" FIELD="Comorbidity"  ID="Comorbidity_15"   Runat="server" />
</div>
    <euc:EformTextBox style="display: none;" TABLE="NoTable" FIELD="ComorbiditiesCopiedToProblemPlan"  ID="ComorbiditiesCopiedToProblemPlan"   Runat="server" />

<script type="text/javascript">
setPastProblemPlanPopupHeight($('PastProblemsPlansScrollingDiv'));

function loadComorbidities()
{
    var comorbidityFields = $('comorbiditiesContainer').getElementsByTagName('input');
 
    var CommonProblemsSelect = $('CommonProblemsSelect');
    var ComorbiditiesOptGroup = $('ComorbiditiesOptGroup');
    
    for (i = 0; i < comorbidityFields.length; i++)
    {
        if (comorbidityFields[i].value.length > 0)
        {
              var newCommonProblemsSelectOption = document.createElement('option');
              newCommonProblemsSelectOption.text = comorbidityFields[i].value;
              newCommonProblemsSelectOption.value = comorbidityFields[i].value;

              try {
                CommonProblemsSelect.add(newCommonProblemsSelectOption, null); // standards compliant; doesn't work in IE
              }
              catch(ex) {
                CommonProblemsSelect.add(newCommonProblemsSelectOption); // IE only
              }
        }
    }
    
    
    var ComorbiditiesOptions = ComorbiditiesOptGroup.getElementsByTagName('option');
    
    if (ComorbiditiesOptions.length < 1)
    {
              var newCommonProblemsSelectOption = document.createElement('option');
              newCommonProblemsSelectOption.text = 'None';
              newCommonProblemsSelectOption.value = '';

              try {
                CommonProblemsSelect.add(newCommonProblemsSelectOption, null); // standards compliant; doesn't work in IE
              }
              catch(ex) {
                CommonProblemsSelect.add(newCommonProblemsSelectOption); // IE only
              }
    }
    
    
    
}
loadComorbidities();

//function loadComorbidities()
//{
//    var comorbidityFields = $('comorbiditiesContainer').getElementsByTagName('input');
//    var problemFields = [$('<%= ProblemName_1.ClientID %>'),$('<%= ProblemName_2.ClientID %>'),$('<%= ProblemName_3.ClientID %>'),$('<%= ProblemName_4.ClientID %>'),$('<%= ProblemName_5.ClientID %>'),$('<%= ProblemName_6.ClientID %>'),$('<%= ProblemName_7.ClientID %>'),$('<%= ProblemName_8.ClientID %>'),$('<%= ProblemName_9.ClientID %>'),$('<%= ProblemName_10.ClientID %>'),$('<%= ProblemName_11.ClientID %>'),$('<%= ProblemName_12.ClientID %>')];
//    var comorbArray = new Array();

//    if ($('<%= ComorbiditiesCopiedToProblemPlan.ClientID %>').value.length < 1) // only run if comorbidities have not been copied already - jf
//    {
// 
//        for (i = 0; i < comorbidityFields.length; i++)
//        {
//            if (comorbidityFields[i].value.length > 0) comorbArray.push(comorbidityFields[i].value);
//        }
//        
//        var k = problemFields.length-1;
//        for (j = 0; j < comorbArray.length; j++)
//        {
//            if (k>=0)
//            {
//                problemFields[k].value = comorbArray[j];
//                k--;
//            }
//        }
//        
//        $('<%= ComorbiditiesCopiedToProblemPlan.ClientID %>').value = 'true';
//    
//    }
//    
//}
//loadComorbidities();
</script>