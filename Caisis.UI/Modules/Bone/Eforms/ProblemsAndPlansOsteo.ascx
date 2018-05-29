<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bone.Eforms.ProblemsAndPlansOsteo" CodeFile="ProblemsAndPlansOsteo.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<script language="javascript">
	tableArray.ProblemPlanHtmlTable_1 = "ProblemPlanHtmlTable_1";
	tableArray.ProblemPlanHtmlTable_2 = "ProblemPlanHtmlTable_2";
	tableArray.ProblemPlanHtmlTable_3 = "ProblemPlanHtmlTable_3";
	tableArray.ProblemPlanHtmlTable_4 = "ProblemPlanHtmlTable_4";
	tableArray.ProblemPlanHtmlTable_5 = "ProblemPlanHtmlTable_5";
	tableArray.ProblemPlanHtmlTable_6 = "ProblemPlanHtmlTable_6";
</script>
<script type="text/javascript" language="javascript">

var commonProblemsTarget = 0;
var maxPlansPerProblem = 5;

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
									var textValue = document.getElementById(node.value).innerHTML;
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
		
		CommonProblemsPlansDiv.style.top = scrollNum + 20;
	}
	MM_showHideLayers('CommonProblemsPlansDiv','','show', 'PastProblemsPlansDiv','','hide', 'PastProblemsPlansScrollingDiv','','hide');

	commonProblemsTarget = problemNumber;
}

function copyCommonValues()
{
	var CommonProblemValue = document.getElementById('CommonProblemsSelect').value;
	setProblemValue(commonProblemsTarget, CommonProblemValue);
	
	sourceTable = document.getElementById('CommonPlansTable');
	var currentTargetPlan = 0;
	var currentSourcePlan = 0;
	var tooManyPlans = false;
	
				
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
									var textValue = node.value;
									
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
					}
				}
			}
			
			
		
		
		}
		
	}	
	
	
	if (tooManyPlans)
	{
		alert('A maximum of 5 plans may be selected for each problem.\nPlease reduce the number of selected plans.');
	}
	else
	{
		hideCommonProblems();
	}
}


function clearCommonProblemPlanInputValues()
{
	document.getElementById('CommonProblemsSelect').value = '';
	sourceTable = document.getElementById('CommonPlansTable');
	
	
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
								node.checked = false;
							}
						}
					}
				}
			}
		}
		
	}	
	
	
}




</script>




<div id="PastProblemsPlansDiv" style="position:absolute; width:670px; height:280px; overflow:auto; z-index:7; visibility: visible; border: solid 2px #8d2a2c; background-color: #ffffff;"> 
  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="tableTest">
  <tr>
      <td style="background-color: #8d2a2c; color: #ffffff; padding-left: 10px;" height="22" valign="middle"><img src="../../Images/CloseSmall.gif" width="38" height="8" hspace="10" vspace="3" class="ClickableImage" title="Click here to close." onClick="hidePreviousProblems();" align="right" />Previous Problems & Plans for <asp:Literal ID="PatientNameDisplay" Runat="server" /></td>
  </tr>
  
   <tr>
      <td style="background-color: #CDD4DA; color: #333333; padding-left: 10px; font-size: 11px; height: 30px;" valign="bottom">
	  Listed 
	  below are problems and plans entered for this patient's previous visit. Please check off any that you wish to reuse for the current visit. </td>
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
      <td height="180" valign="top">
	  
	  
	  <div id="PastProblemsPlansScrollingDiv" style="position:absolute; width:666px; height:170px; overflow:auto; z-index:8; visibility: visible;">
	  
	  
	  
	  <table id="PastProblemsPlansTable" width="100%" border="0" cellspacing="0" cellpadding="5" class="eformLargePopulatedTable" >
        

        
         <asp:Repeater ID="PastProblemsRpt" Runat="server" OnItemDataBound="ProblemPlansItemDataBound" >
			<ItemTemplate>
				<tr>
				<td id="ProblemNumberTd" runat="server" width="3%" valign="top" class="ControlBoxBottomBorder" style="border-bottom: solid 1px #cccccc;"><strong><%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %></strong>&nbsp;</td>
				<td id="ProblemCheckboxTd" runat="server"  width="5%" valign="top" class="ControlBoxBottomBorder"><input name="pastProblemCheckbox_<%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %>" type="checkbox" id="pastProblemCheckbox_<%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %>" value="PastProblem_<%# DataBinder.Eval(Container.DataItem, "ProblemNumber") %>" /></td>
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



<a name="ProblemsAndPlansOsteo" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Problems and Plans"></asp:Label><br/>

<br />
<table id="Table1" width="650" border="0" cellspacing="0" cellpadding="0" class="eformLargePopulatedTable" >
    <tr>
	<td colspan="3" align="left" style="padding-left: 25px; padding-top:10px;"><strong>Summary</strong><br/><euc:EformTextArea TextMode="MultiLine" Table="Encounters" Field="EncNotes" Rows="4" style="width: 600px;" Id="AdditionalProblemPlanNotes" Runat="server"></euc:EformTextArea><br/><br/></td>
  </tr>

</table>

<br />
<%--<img src="../../Images/ViewCopyFromPreviousVisit_small.gif" width="176" height="17" hspace="10" class="ClickableImage" style="margin-left: 330px;" title="Click here to view past problems and plans." onclick="showPreviousProblems();" />--%><br />

<table id="targetTable" width="650" border="0" cellspacing="0" cellpadding="0" class="eformLargePopulatedTable" style="background-position: 0 20;">
 
  <tr>
    <td width="6%" height="26" class="controlBoxDataGridHeaderFirstCol">&nbsp;
	
	    <div id="CommonProblemsPlansDiv" style="position:absolute; width:500px; height:340px; top:10px; z-index:5; visibility: hidden; border: solid 2px #8d2a2c; background-color: #ffffff;"> 
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td height="22" colspan="2" valign="middle" style="background-color: #8d2a2c; color: #ffffff; padding-left: 10px;"><img src="../../Images/CloseSmall.gif" width="38" height="8" hspace="10" vspace="3" class="ClickableImage" title="Click here to close." onClick="hideCommonProblems();" align="right" />Common Problems & Plans</td>
              </tr>
	          <tr>
	            <td width="18%" style="padding-left: 10px; font-size: 10px; font-weight: bold;">Problem</td>
	            <td height="60">  		
		            <select id="CommonProblemsSelect">
			            <option value="">------------ Select Problem ------------</option>
            			
			            <asp:Repeater ID="CommonProblems" runat="server"  > 
				            <ItemTemplate> 
					            <option value="<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>"><%# DataBinder.Eval(Container.DataItem, "LkpCode") %></option>
				            </ItemTemplate>
			            </asp:Repeater>
		            </select>		
		        </td>
	          </tr>
	          <tr>
	            <td colspan="2" style="background-color: #cccccc;"><img src="../../Images/shim.gif" width="1" height="1"  /></td>
	          </tr>
	          <tr>
	            <td  colspan="2">&nbsp;</td>
	          </tr>
	          <tr>
	            <td colspan="2"  style="padding-left: 10px; font-size: 10px;" valign="top" height="190"><strong>Associated Plans</strong> - select up to 5<br />
	              <br />  		  
        		  
		          <div id="CommonProblemsPlansScrollingDiv" style="position:absolute; width: 480px; height:170px; z-index:6; overflow: auto; "> 
	              <!-- common plans checkboxes -->
        		  
		              <table width="98%" border="0" cellspacing="0" cellpadding="3" style="font-size: 10px;" id="CommonPlansTable">

                        <tr>                   
                        
                            <asp:Repeater ID="CommonPlans" runat="server" > 
				                <ItemTemplate> 
					                <td valign="top" class="EFormPickerOptions"><input type="checkbox" id="Plan_<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>" value="<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>" /><%# DataBinder.Eval(Container.DataItem, "LkpCode") %></td>
				                </ItemTemplate>
				                <AlternatingItemTemplate>
					                <td valign="top" class="EFormPickerOptions"><input type="checkbox" id="Plan_<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>" value="<%# DataBinder.Eval(Container.DataItem, "LkpCode") %>" /><%# DataBinder.Eval(Container.DataItem, "LkpCode") %></td>			               
					                <tr></tr>
				                </AlternatingItemTemplate>
			                </asp:Repeater>		
                        
                        </tr>
					    <tr></tr>
                      </table>
		          </div>		  
		        </td>
		      </tr>
	          <tr>
		        <td  colspan="2" align="center" valign="bottom" height="40">
    			
		          <img src="../../Images/CancelOnWhite_small.gif" width="68" height="19" hspace="15" style="cursor:pointer;"  title="Click here to close."  onclick="hideCommonProblems();" /><img  hspace="15" src="../../Images/CopyCheckedProblemsAndPlans_Small.gif" width="209" height="19" class="ClickableImage" onClick="copyCommonValues();"  />			</td>
	          </tr>
    		  
	        </table>
	    </div>	
	    
	</td>
    <td width="47%" class="controlBoxDataGridHeaderFirstCol">Diagnoses / Problem List </td>
    <td width="47%" class="controlBoxDataGridHeaderFirstCol">Plan</td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>1</strong></td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><img src="../../Images/OpenPicker_red.gif" width="14" height="20"  align="right" class="ClickableImage" style="margin-right: 6px;" onclick="showCommonProblems(1, this);" /><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2"  style="width: 277px;"  Runat="server" RecordId="1" ID="ProblemName_1"/>
	
	
	<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_1');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18" border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;"></a>	</td>
    <td valign="top" class="ControlBoxLinedRows">
		<table align="left" cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_1">
		
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="1" ParentRecordId="1" ID="PlanName_1_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="2" ParentRecordId="1" ID="PlanName_1_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="3" ParentRecordId="1" ID="PlanName_1_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="4" ParentRecordId="1" ID="PlanName_1_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="5" ParentRecordId="1" ID="PlanName_1_5"/></td></tr>
		</table>		</td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>2</strong></td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><img src="../../Images/OpenPicker_red.gif" width="14" height="20" hspace="1" align="right" class="ClickableImage" style="margin-right: 6px;"  onclick="showCommonProblems(2, this);" /><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 277px;" Runat="server" RecordId="2" ID="ProblemName_2"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_2');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_2">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="1" ParentRecordId="2" ID="PlanName_2_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="2" ParentRecordId="2" ID="PlanName_2_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="3" ParentRecordId="2" ID="PlanName_2_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="4" ParentRecordId="2" ID="PlanName_2_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="5" ParentRecordId="2" ID="PlanName_2_5"/></td></tr>
		</table>		</td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>3</strong></td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><img src="../../Images/OpenPicker_red.gif" width="14" height="20" hspace="1" align="right" class="ClickableImage" style="margin-right: 6px;"  onclick="showCommonProblems(3, this);" /><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 277px;" Runat="server" RecordId="3" ID="ProblemName_3"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_3');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_3">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="1" ParentRecordId="3" ID="PlanName_3_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="2" ParentRecordId="3" ID="PlanName_3_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="3" ParentRecordId="3" ID="PlanName_3_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="4" ParentRecordId="3" ID="PlanName_3_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="5" ParentRecordId="3" ID="PlanName_3_5"/></td></tr>
		</table>		</td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>4</strong></td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><img src="../../Images/OpenPicker_red.gif" width="14" height="20" hspace="1" align="right" class="ClickableImage"  style="margin-right: 6px;" onclick="showCommonProblems(4, this);" /><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 277px;" Runat="server" RecordId="4" ID="ProblemName_4"/>      <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_4');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_4">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="1" ParentRecordId="4" ID="PlanName_4_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="2" ParentRecordId="4" ID="PlanName_4_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="3" ParentRecordId="4" ID="PlanName_4_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="4" ParentRecordId="4" ID="PlanName_4_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="5" ParentRecordId="4" ID="PlanName_4_5"/></td></tr>
		</table>		</td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>5</strong></td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><img src="../../Images/OpenPicker_red.gif" width="14" height="20" hspace="1" align="right" class="ClickableImage"  style="margin-right: 6px;" onclick="showCommonProblems(5, this);" /><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 277px;" Runat="server" RecordId="5" ID="ProblemName_5"/>
    <span style="padding-top: 6px;"><a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_5');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></span></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_5">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="1" ParentRecordId="5" ID="PlanName_5_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="2" ParentRecordId="5" ID="PlanName_5_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="3" ParentRecordId="5" ID="PlanName_5_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="4" ParentRecordId="5" ID="PlanName_5_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="5" ParentRecordId="5" ID="PlanName_5_5"/></td></tr>
		</table>		</td>
  </tr>
  <tr>
    <td height="80" align="center" valign="top" style="border-bottom: solid 1px #cccccc; padding-top: 6px;"><strong>6</strong></td>
    <td valign="top" class="ControlBoxLinedRows" style="padding-top: 6px;"><img src="../../Images/OpenPicker_red.gif" width="14" height="20" hspace="1" align="right" class="ClickableImage"  style="margin-right: 6px;" onclick="showCommonProblems(6, this);" /><euc:EformTextArea TextMode="MultiLine" TABLE="PatientProblems" FIELD="ProblemName" Rows="2" style="width: 277px;" Runat="server" RecordId="6" ID="ProblemName_6"/>	
	  <a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ProblemPlanHtmlTable_6');"><img src="../../Images/AddAPlanForThisProblem.gif" width="155" height="18"  border="0" style="margin-left:115px; margin-top: 10px; margin-bottom: 15px;" /></a></td>
    <td valign="top" class="ControlBoxLinedRows">
		
		<table align="left"  cellpadding="0" cellspacing="6" border="0" width="100%" id="ProblemPlanHtmlTable_6">
		<tr><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="1" ParentRecordId="6" ID="PlanName_6_1"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="2" ParentRecordId="6" ID="PlanName_6_2"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="3" ParentRecordId="6" ID="PlanName_6_3"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="4" ParentRecordId="6" ID="PlanName_6_4"/></td></tr>
		<tr style="display: none;"><td><euc:EformTextArea TextMode="MultiLine" TABLE="ProblemPlans" FIELD="PlanName" Rows="2" style="width: 277px;" Runat="server" RecordId="5" ParentRecordId="6" ID="PlanName_6_5"/></td></tr>
		</table>	</td>
  </tr>

</table>
<span class="ControlBoxLinedRows" style="padding-top: 6px;"></span>
<asp:Literal ID="hidePastProblemsScript" runat="server" Visible="true"><script language="javascript">hidePreviousProblems();</script></asp:Literal>

<br/><br/><br/>