<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.IntraOpProstateExamWithDiagram" CodeFile="IntraOpProstateExamWithDiagram.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">
var HighlightedCellId = '';
var VarsToRecordForEachRecord = 9;
var NumPossibleRecords = 14;
var MaxPossibleRecords = 14;

var TableColumnNumbers = new Array(1,2,3,4,5,6,7,8,9);	// array values: side, level, laterality, AP, Cancer, ECE, SM, FSResult, AddTissue
 //  shows what column # in the table is holding the inputs for teh fields above.  this seems silly but will help if we have to change the table layout. - jf



CurrentIntraOpAnteriorRecordNumber = 0;
CurrentIntraOpPosteriorRecordNumber = 0;
CurrentIntraOpAnteriorRecord = new Array(VarsToRecordForEachRecord);	// array values: side, level, laterality, AP, Cancer, ECE, SM, FSResult, AddTissue
CurrentIntraOpPosteriorRecord = new Array(VarsToRecordForEachRecord);	// array values: side, level, laterality, AP, Cancer, ECE, SM, FSResult, AddTissue

function SetCurrentCell(Side, Level, Laterality, cell)
{
	document.getElementById('IntraOpSelectionTable').style.visibility = 'visible';
	
	
	if (HighlightedCellId.length > 0)
	{
		document.getElementById(HighlightedCellId).style.border = 'none';
	}
	cell.style.border = 'solid 4px #8d2a2c';
	HighlightedCellId = cell.id;
	
	
	
	
	DetermineTargetRecord(Side, Level, Laterality);    // sets values of CurrentIntraOpAnteriorRecordNumber & CurrentIntraOpPosteriorRecordNumber
	
	if (CurrentIntraOpPosteriorRecordNumber > CurrentNumberOfRecords())
	{
		// record is new
		// clear out js array
		CurrentIntraOpAnteriorRecord = [Side, Level, Laterality, 'Anterior', '', '', '', '', ''];
		CurrentIntraOpPosteriorRecord = [Side, Level, Laterality, 'Posterior', '', '', '', '', ''];
		
		// clear out selectors
		document.getElementById('AnteriorCancer').value = '';
		document.getElementById('AnteriorECE').value = '';
		document.getElementById('AnteriorSM').value = '';
		document.getElementById('AnteriorFSResult').value = '';
		document.getElementById('AnteriorAddTissue').value = '';
		document.getElementById('PosteriorCancer').value = '';
		document.getElementById('PosteriorECE').value = '';
		document.getElementById('PosteriorSM').value = '';
		document.getElementById('PosteriorFSResult').value = '';
		document.getElementById('PosteriorAddTissue').value = '';


		
	}
	else
	{
		// record already exists, and we are updating it
		// copy in values from data table
		CopyValuesToArray(CurrentIntraOpAnteriorRecordNumber, 'Anterior');
		CopyValuesToArray(CurrentIntraOpPosteriorRecordNumber, 'Posterior');
		RectifyArrays();
		

		CopyValueToSelector('AnteriorCancer', CurrentIntraOpAnteriorRecordNumber, TableColumnNumbers[4]);
		CopyValueToSelector('AnteriorECE', CurrentIntraOpAnteriorRecordNumber, TableColumnNumbers[5]);
		CopyValueToSelector('AnteriorSM', CurrentIntraOpAnteriorRecordNumber, TableColumnNumbers[6]);
		CopyValueToSelector('AnteriorFSResult', CurrentIntraOpAnteriorRecordNumber, TableColumnNumbers[7]);
		CopyValueToSelector('AnteriorAddTissue', CurrentIntraOpAnteriorRecordNumber, TableColumnNumbers[8]);
		CopyValueToSelector('PosteriorCancer', CurrentIntraOpPosteriorRecordNumber, TableColumnNumbers[4]);
		CopyValueToSelector('PosteriorECE', CurrentIntraOpPosteriorRecordNumber, TableColumnNumbers[5]);
		CopyValueToSelector('PosteriorSM', CurrentIntraOpPosteriorRecordNumber, TableColumnNumbers[6]);
		CopyValueToSelector('PosteriorFSResult', CurrentIntraOpPosteriorRecordNumber, TableColumnNumbers[7]);
		CopyValueToSelector('PosteriorAddTissue', CurrentIntraOpPosteriorRecordNumber, TableColumnNumbers[8]);
		
	}

}

function AddPlaceholderToRecord(Row)
{
	dataTable = document.getElementById('IntraOpDataTable');
	cell = dataTable.rows[Row].cells[0];
	
	if (cell.hasChildNodes()) {
		for (t = 0; t < cell.childNodes.length; t++) {
			node = cell.childNodes[t];
			if (node.nodeName == 'INPUT') {
				type = node.getAttribute('type');
				if (type == 'text' || type == 'hidden') 
				{
					node.value = 'true';
//					alert(Row);
				}
			}
		}
	}	
}

function CopyValueToSelector(SelectorId, Row, ColumnNumber)
{
	dataTable = document.getElementById('IntraOpDataTable');
	
	row = dataTable.rows[Row];
	cell = row.cells[ColumnNumber];
	if (cell.hasChildNodes()) {
		for (j = 0; j < cell.childNodes.length; j++) {
			node = cell.childNodes[j];
			if (node.nodeName == 'INPUT') {
				type = node.getAttribute('type');
				if (type == 'text' || type == 'hidden') 
				{
					document.getElementById(SelectorId).value = node.value;
				}
			}
		}
	}
}

function CopyValuesToArray(SourceRow, AP)
{
	var CurrentTableColumn;

	dataTable = document.getElementById('IntraOpDataTable');
	row = dataTable.rows[SourceRow];

	for (i = 0; i < VarsToRecordForEachRecord; i++) // iterate through array
	{
		
		CurrentTableColumn = TableColumnNumbers[i];

		cell = row.cells[CurrentTableColumn];
		if (cell.hasChildNodes()) {
			for (j = 0; j < cell.childNodes.length; j++) {
				node = cell.childNodes[j];
				if (node.nodeName == 'INPUT') {
					type = node.getAttribute('type');
					if (type == 'text' || type == 'hidden') 
					{
						if (AP == 'Anterior') CurrentIntraOpAnteriorRecord[i] = node.value
						else CurrentIntraOpPosteriorRecord[i] = node.value;
					}
				}
			}
		}
		
	}	
}


function RectifyArrays()
{
    for (i = 0; i < 3; i++) // iterate through array
	{
	    if (CurrentIntraOpAnteriorRecord[i] != CurrentIntraOpPosteriorRecord[i])
	    {
	        if (CurrentIntraOpAnteriorRecord[i].length > CurrentIntraOpPosteriorRecord[i])
	        {
	            CurrentIntraOpPosteriorRecord[i] = CurrentIntraOpAnteriorRecord[i];
	        }
	        else
	        {
	            CurrentIntraOpAnteriorRecord[i] = CurrentIntraOpPosteriorRecord[i];
	        }
	    }
	
	}
	
	if (CurrentIntraOpAnteriorRecord[3].length < 1) CurrentIntraOpAnteriorRecord[3] = 'Anterior';
	if (CurrentIntraOpPosteriorRecord[3].length < 1) CurrentIntraOpPosteriorRecord[3] = 'Posterior';
}




function DumpArrayToDataInputs(TargetRow, AP)
{


	var CurrentTableColumn;

	dataTable = document.getElementById('IntraOpDataTable');
	row = dataTable.rows[TargetRow];

	for (i = 0; i < VarsToRecordForEachRecord; i++) // iterate through array
	{
		
		CurrentTableColumn = TableColumnNumbers[i];

		cell = row.cells[CurrentTableColumn];
		if (cell.hasChildNodes()) {
			for (j = 0; j < cell.childNodes.length; j++) {
				node = cell.childNodes[j];
				if (node.nodeName == 'INPUT') {
					type = node.getAttribute('type');
					if (type == 'text' || type == 'hidden') 
					{
						if (AP == 'Anterior')
						{
							node.value =  CurrentIntraOpAnteriorRecord[i];
						}
						else
						{
							node.value = CurrentIntraOpPosteriorRecord[i];
						}
					}
				}
				else if (node.nodeName == 'SPAN' && node.id.indexOf('_Span') > -1 ) {
				
					node.innerHTML = CurrentIntraOpAnteriorRecord[i];
				
				}
			}
		}
	}

}




function CurrentNumberOfRecords()
{
	dataTable = document.getElementById('IntraOpDataTable');
	numPossibleRecords = dataTable.rows.length-1;  //  -1 because the top row is for column titles;
	
	var NumRecords = 0;
	
	for (k = 1; k < dataTable.rows.length; k++)  //  start at 2nd row because the top row (0) is for column titles;
	{
		row = dataTable.rows[k];
		if (row.hasChildNodes())
		{
			for (i = 0; i < row.cells.length; i++) {
				cell = row.cells[i];
				if (cell.hasChildNodes()) {
					for (j = 0; j < cell.childNodes.length; j++) {
						node = cell.childNodes[j];
						if (node.nodeName == 'INPUT') {
							type = node.getAttribute('type');
							if (type == 'text' || type == 'hidden') 
							{
								
								//check if node has a value
								if (node.value.length > 0)
								{
									NumRecords = k;
								}
								
								
							}
						}
					}
				}
			}
		
		}
		
	}
	
	return NumRecords;
	
}

function SetRecordValue(Parameter, AP, Value)
{



	var targetArrayIndex;
	var diagramSegmentId;

	if (Parameter == 'Cancer') targetArrayIndex = 4
	else if (Parameter == 'ECE') targetArrayIndex = 5
	else if (Parameter == 'SM') targetArrayIndex = 6
	else if (Parameter == 'FSResult') targetArrayIndex = 7
	else if (Parameter == 'AddTissue') targetArrayIndex = 8;
	
	if (AP == 'Anterior')
	{
		CurrentIntraOpAnteriorRecord[targetArrayIndex] = Value;
		diagramSegmentId = CurrentIntraOpAnteriorRecord[0].toString() + CurrentIntraOpAnteriorRecord[1].toString() + CurrentIntraOpAnteriorRecord[2].toString();
		DumpArrayToDataInputs(CurrentIntraOpAnteriorRecordNumber, 'Anterior');
	}
	else
	{
		CurrentIntraOpPosteriorRecord[targetArrayIndex] = Value;
		diagramSegmentId = CurrentIntraOpPosteriorRecord[0].toString() + CurrentIntraOpPosteriorRecord[1].toString() + CurrentIntraOpPosteriorRecord[2].toString();
		DumpArrayToDataInputs(CurrentIntraOpPosteriorRecordNumber, 'Posterior');
	}
	AddPlaceholderToRecord(CurrentIntraOpAnteriorRecordNumber);
	AddPlaceholderToRecord(CurrentIntraOpPosteriorRecordNumber);

//	DumpArrayToDataInputs(CurrentIntraOpAnteriorRecordNumber, 'Anterior');  //trying not to dump both sides 
//	DumpArrayToDataInputs(CurrentIntraOpPosteriorRecordNumber, 'Posterior');
	
	
	
	
	SetOpacityBasedOnGreaterProb(diagramSegmentId, CurrentIntraOpAnteriorRecord[4], CurrentIntraOpPosteriorRecord[4]);
	
}



function SetOpacityBasedOnGreaterProb(objectId, AnteriorProbability, PosteriorProbability)
{

	var opacity = 0;
	var anteriorOpacity = 0;
	var posteriorOpacity = 0;
	
		
	if (AnteriorProbability.length > 0) anteriorOpacity = convertProbabilityToOpacityValue(AnteriorProbability);
	if (PosteriorProbability.length > 0) posteriorOpacity = convertProbabilityToOpacityValue(PosteriorProbability);
	
	if (anteriorOpacity > posteriorOpacity)
	{
		opacity = anteriorOpacity;
	}
	else
	{
		opacity = posteriorOpacity;
	}
	

    if (document.getElementById(objectId))
    {
	    object = document.getElementById(objectId);
    	
    	
	    if (opacity > 0)
	    {
		    object.style.backgroundColor = '#8d2a2c';
		    object.style.filter = 'alpha(opacity=' + opacity + ')';
		    object.style.opacity = '.' + opacity;
	    }
	    else
	    {
		    object.style.backgroundColor = '#46892F';
		    object.style.filter = 'alpha(opacity=20)';
		    object.style.opacity = '.20';
	    }
    }

	
}

function convertProbabilityToOpacityValue(Value)
{
	var opacity = 0;

	if (Value == 'Definitely No') opacity = 0
	else if (Value == 'Probably No') opacity = 20
	else if (Value == 'Possible') opacity = 40
	else if (Value == 'Probably') opacity = 60
	else if (Value == 'Definitely') opacity = 80;
	
	return opacity;

}



function DetermineTargetRecord(Side, Level, Laterality)
{
	var NumCurrentRecords = CurrentNumberOfRecords();
	var LastTableRowWithData = NumCurrentRecords;  // index for last table row w/ data; just using this for simpler debugging	

	var SameSideFound = false;
	var SameLevelFound = false;
	var SameLateralityFound = false;
	
	dataTable = document.getElementById('IntraOpDataTable');
	
	
	var SameLocationFound = false;
	k = 1;
	while (k <= LastTableRowWithData && !SameLocationFound)
	{
		SameSideFound = false;
		SameLevelFound = false;
		SameLateralityFound = false;
		
		
		row = dataTable.rows[k];

			// check if row has correct side
			cell = row.cells[TableColumnNumbers[0]];
			if (cell.hasChildNodes())
			{
				for (j = 0; j < cell.childNodes.length; j++)
				{
					node = cell.childNodes[j];
					if (node.nodeName == 'INPUT' && node.id.indexOf('OpExamSide') > -1)
					{
							//check if node has  correct value
							if ((node.value == Side) || (node.value.length == 0 && Side.length == 0))
							{
								SameSideFound = true;
							}
						
					}
				}
			}
			
			if (SameSideFound)
			{
			
				// check if row has correct Level
				cell = row.cells[TableColumnNumbers[1]];
				if (cell.hasChildNodes())
				{
					for (j = 0; j < cell.childNodes.length; j++)
					{
						node = cell.childNodes[j];
						if (node.nodeName == 'INPUT' && node.id.indexOf('OpExamLevel') > -1)
						{
								//check if node has  correct value
								if (node.value.length > 0 && node.value == Level)
								{
									SameLevelFound = true;
								}
							
						}
					}
				}			
			}
			
			
			if (SameSideFound && SameLevelFound)
			{
			
				// check if row has correct Laterality
				cell = row.cells[TableColumnNumbers[2]];
				if (cell.hasChildNodes())
				{
					for (j = 0; j < cell.childNodes.length; j++)
					{
						node = cell.childNodes[j];
						if (node.nodeName == 'INPUT' && node.id.indexOf('OpExamLat') > -1)
						{
								//check if node has correct value
								if ((node.value == Laterality) || (node.value.length == 0 && Laterality.length == 0))
								{
									SameLateralityFound = true;
								}
							
						}
					}
				}			
			}
			
			if (SameSideFound && SameLevelFound && SameLateralityFound)
			{
				if (isEven(k))									// if k is even, it's a posterior record that you've found.
				{
					CurrentIntraOpAnteriorRecordNumber=k-1;
					CurrentIntraOpPosteriorRecordNumber=k;
				}
				else
				{
					CurrentIntraOpAnteriorRecordNumber=k;
					CurrentIntraOpPosteriorRecordNumber=k+1;
				}

				SameLocationFound = true;
			}


			
						
		k++
		
	}
	
	if (!SameLocationFound)
	{
		CurrentIntraOpAnteriorRecordNumber = NumCurrentRecords + 1;
		CurrentIntraOpPosteriorRecordNumber = NumCurrentRecords + 2;
		
		if (CurrentIntraOpPosteriorRecordNumber > MaxPossibleRecords)
		{
			CurrentIntraOpAnteriorRecordNumber = 0;
			CurrentIntraOpPosteriorRecordNumber = 0;
			alert('error: You are attempting to enter more IntraOp Exam records than the system currently allows.\nPlease contact the Caisis Administrator for assistance.');
		}
	}
	
}



function HighlightTableCell(cell)
{
	if (cell.className != 'IntraOpDiagramSelected')
	{
		cell.className = 'IntraOpDiagramHighlight';
	}

//	if (cell.style.opacity && cell.style.opacity.indexOf('.') > -1) showToolTipMessage(cell.id);

}

function RemoveHighlightTableCell(cell)
{
	if (cell.className != 'IntraOpDiagramSelected')
	{
		cell.className = 'IntraOpDiagram';
	}
//	hideToolTip();

}


function LoadDisplayData()
{


	dataTable = document.getElementById('IntraOpDataTable');
	numRows = dataTable.rows.length;
	var diagramSegmentId;
	
	
	for (q = 1; q < numRows; q++)  // iterate through table rows, start at row 1 since row 0 is for header
	{
		if (isEven(q))
		{
			CopyValuesToArray(q, 'Posterior');

			
			
			// after posterior array is filled, set diagram display
			var side = '';
			var level = '';
			var laterality = '';
			
			if (CurrentIntraOpPosteriorRecord[0].toString().length > 0)
			{
				side = CurrentIntraOpPosteriorRecord[0].toString();
				level = CurrentIntraOpPosteriorRecord[1].toString();
				laterality = CurrentIntraOpPosteriorRecord[2].toString();
			}
			else
			{
				side = CurrentIntraOpAnteriorRecord[0].toString();
				level = CurrentIntraOpAnteriorRecord[1].toString();
				laterality = CurrentIntraOpAnteriorRecord[2].toString();
			}
			
//			alert(side + level + laterality);
		
			if (level.length > 0)
			{
				var diagramSegmentId = side + level + laterality;
				SetOpacityBasedOnGreaterProb(diagramSegmentId, CurrentIntraOpAnteriorRecord[4], CurrentIntraOpPosteriorRecord[4]);
			}

			

			
			
		}
		else
		{
			CopyValuesToArray(q, 'Anterior');
			
		}
	}
	

	var numRowsToCheckOff = CurrentNumberOfRecords();
	if (!isEven(numRowsToCheckOff)) numRowsToCheckOff += 1;
	
	for (r = 1; r <= numRowsToCheckOff; r++)  // iterate through table rows, start at row 1 since row 0 is for header
	{
//		checkCell = dataTable.rows[r].cells[0];
//		alert(numRowsToCheckOff);
		AddPlaceholderToRecord(r);
	}
	

}


function isEven(value){
	if (value%2 == 0)
		return true;
	else
		return false;
}

</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="IntraOpProstateExam" />
<span class="controlBoxTitle">&nbsp;&nbsp;Intraoperative Prostate Exam</span><br />



<table width="705" border="0" cellspacing="0" cellpadding="0" id="tableTest" style="border: solid 1px #666666;">
  
  
   <tr>
      <td colspan="2" style="background-color: #CDD4DA; color: #333333; padding-left: 10px; font-size: 11px; height: 30px;">Select the location below. The  diagram specifies Side, Level, and Laterality.</td>
  </tr>
   
  <tr>
      <td width="260" valign="top" class="IntraOpDiagramBGTable" style="height: 329px;"><table width="335" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="../../Images/shim.gif"  width="57" height="28" /></td>
          <td><img src="../../Images/shim.gif"  width="40" height="1" /></td>
          <td><img src="../../Images/shim.gif"  width="49" height="1" /></td>
          <td><img src="../../Images/shim.gif"  width="49" height="1" /></td>
          <td><img src="../../Images/shim.gif"  width="49" height="1" /></td>
          <td><img src="../../Images/shim.gif"  width="50" height="1" /></td>
          <td><img src="../../Images/shim.gif"  width="41" height="1" /></td>
          <td><img src="../../Images/shim.gif"  width="6" height="1" /></td>
        </tr>
        <tr>
          <td><img src="../../Images/shim.gif"  width="1" height="80" /></td>
          <td >&nbsp;</td>
          <td id="LeftBNLateral" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Left', 'BN', 'Lateral', this);">&nbsp;</td>
          <td id="LeftBNMedial" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Left', 'BN', 'Medial', this);">&nbsp;</td>
          <td id="RightBNMedial" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Right', 'BN', 'Medial', this);">&nbsp;</td>
          <td id="RightBNLateral" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Right', 'BN', 'Lateral', this);">&nbsp;</td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
        </tr>
        <tr>
          <td><img src="../../Images/shim.gif"  width="1" height="60" /></td>
          <td rowspan="4" class="IntraOpDiagram"  id="LeftNVB" onclick="SetCurrentCell('Left', 'NVB', '', this);" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);">&nbsp;</td>
          <td  id="LeftSVLateral" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Left', 'SV', 'Lateral', this);">&nbsp;</td>
          <td  id="LeftSVMedial" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Left', 'SV', 'Medial', this);">&nbsp;</td>
          <td  id="RightSVMedial" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Right', 'SV', 'Medial', this);">&nbsp;</td>
          <td  id="RightSVLateral" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Right', 'SV', 'Lateral', this);">&nbsp;</td>
          <td rowspan="4" class="IntraOpDiagram"  id="RightNVB" onclick="SetCurrentCell('Right', 'NVB', '', this);" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><img src="../../Images/shim.gif"  width="1" height="49" /></td>
          <td id="LeftBaseLateral" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Left', 'Base', 'Lateral', this);">&nbsp;</td>
          <td id="LeftBaseMedial" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Left', 'Base', 'Medial', this);">&nbsp;</td>
          <td id="RightBaseMedial" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Right', 'Base', 'Medial', this);">&nbsp;</td>
          <td id="RightBaseLateral" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Right', 'Base', 'Lateral', this);">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><img src="../../Images/shim.gif"  width="1" height="50" /></td>
          <td id="LeftMidLateral" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Left', 'Mid', 'Lateral', this);" >&nbsp;</td>
          <td id="LeftMidMedial" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Left', 'Mid', 'Medial', this);" >&nbsp;</td>
          <td id="RightMidMedial" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Right', 'Mid', 'Medial', this);" >&nbsp;</td>
          <td id="RightMidLateral" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Right', 'Mid', 'Lateral', this);" >&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><img src="../../Images/shim.gif"  width="1" height="51" /></td>
          <td  id="LeftApexLateral" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Left', 'Apex', 'Lateral', this);">&nbsp;</td>
          <td  id="LeftApexMedial" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Left', 'Apex', 'Medial', this);">&nbsp;</td>
          <td  id="RightApexMedial" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Right', 'Apex', 'Medial', this);">&nbsp;</td>
          <td  id="RightApexLateral" class="IntraOpDiagram" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);" onclick="SetCurrentCell('Right', 'Apex', 'Lateral', this);">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="39">&nbsp;</td>
          <td class="IntraOpDiagram"  id="LeftNVBLateral" onclick="SetCurrentCell('Left', 'NVB', 'Lateral', this);" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);">&nbsp;</td>
          <td colspan="3" class="IntraOpDiagram"  id="Urethra" onclick="SetCurrentCell('', 'Urethra', '', this);" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);">&nbsp;</td>
          <td colspan="2" class="IntraOpDiagram"  id="DVC" onclick="SetCurrentCell('', 'DVC', '', this);" onmouseover="HighlightTableCell(this);" onmouseout="RemoveHighlightTableCell(this);">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>

      </table>
	  
	      
		
		<a href="javascript:;" style="margin-left:100px;" onclick="document.getElementById('IntraOpResultsSummaryDiv').style.visibility='visible'"><img src="../../Images/ShowSummary.gif" height="18" width="90" border="0" style="margin-top:20px; margin-bottom:10px;" /></a>

	  
	  </td>
    <td align="center" valign="top" >
        <table id="IntraOpSelectionTable" border="0" cellspacing="0" cellpadding="6" style="visibility:hidden; width: 200px;">
          <tr>
            <td align="right" style="font-size:11px; font-weight: bold;">&nbsp;</td>
            <td align="center" valign="bottom" style="font-size:11px; font-weight: bold; padding-bottom: 0px;">Anterior</td>
            <td align="center" valign="bottom" style="font-size:11px; font-weight: bold; padding-bottom: 0px;">Posterior</td>
          </tr>
          <tr>
            <td height="47" align="right" style="font-size:11px; font-weight: bold;">Cancer</td>
            <td><select id="AnteriorCancer" name="AnteriorCancer" onchange="SetRecordValue('Cancer', 'Anterior', this.value);" style="width: 138px;">
              <option value=""></option>
              <option value="Definitely No">Definitely No</option>
              <option value="Probably No">Probably No</option>
              <option value="Possible">Possible</option>
              <option value="Probably">Probably</option>
              <option value="Definitely">Definitely</option>
            </select></td>
            <td><select  id="PosteriorCancer" name="PosteriorCancer"  onchange="SetRecordValue('Cancer', 'Posterior', this.value);" style="width: 138px;">
			<option value=""></option>
              <option value="Definitely No">Definitely No</option>
			  <option value="Probably No">Probably No</option>
              <option value="Possible">Possible</option>
              <option value="Probably">Probably</option>
              <option value="Definitely">Definitely</option>

            </select></td>
          </tr>
          <tr>
            <td height="47" align="right" style="font-size:11px; font-weight: bold;">ECE</td>
            <td><select  id="AnteriorECE" name="AnteriorECE"  onchange="SetRecordValue('ECE', 'Anterior', this.value);" style="width: 138px;">
                <option value=""></option>
                <option value="Definitely No">Definitely No</option>
                <option value="Probably No">Probably No</option>
                <option value="Possible">Possible</option>
                <option value="Probably">Probably</option>
                <option value="Definitely">Definitely</option>
            </select></td>
            <td><select  id="PosteriorECE" name="PosteriorECE" onchange="SetRecordValue('ECE', 'Posterior', this.value);" style="width: 138px;">
                <option value=""></option>
                <option value="Definitely No">Definitely No</option>
                <option value="Probably No">Probably No</option>
                <option value="Possible">Possible</option>
                <option value="Probably">Probably</option>
                <option value="Definitely">Definitely</option>
            </select></td>
          </tr>
          <tr>
            <td height="47" align="right" style="font-size:11px; font-weight: bold;">+SM</td>
            <td><select   id="AnteriorSM" name="AnteriorSM"  onchange="SetRecordValue('SM', 'Anterior', this.value);" style="width: 138px;">
                <option value=""></option>
                <option value="Definitely No">Definitely No</option>
                <option value="Probably No">Probably No</option>
                <option value="Possible">Possible</option>
                <option value="Probably">Probably</option>
                <option value="Definitely">Definitely</option>
            </select></td>
            <td><select id="PosteriorSM" name="PosteriorSM"  onchange="SetRecordValue('SM', 'Posterior', this.value);" style="width: 138px;">
                <option value=""></option>
                <option value="Definitely No">Definitely No</option>
                <option value="Probably No">Probably No</option>
                <option value="Possible">Possible</option>
                <option value="Probably">Probably</option>
                <option value="Definitely">Definitely</option>
            </select></td>
          </tr>
          <tr>
            <td height="47" align="right" style="font-size:11px; font-weight: bold;">FS Result </td>
            <td><select   id="AnteriorFSResult" name="AnteriorFSResult"  onchange="SetRecordValue('FSResult', 'Anterior', this.value);" style="width: 138px;">
                <option value=""></option>
				<option value="Positive">Positive</option>
				<option value="Negative">Negative</option>
                <option value="Benign Prostatic Tissue">Benign Prostatic Tissue</option>
                
            </select></td>
            <td><select  id="PosteriorFSResult" name="PosteriorFSResult"  onchange="SetRecordValue('FSResult', 'Posterior', this.value);" style="width: 138px" >
                <option value=""></option>
				<option value="Positive">Positive</option>
				<option value="Negative">Negative</option>
                <option value="Benign Prostatic Tissue">Benign Prostatic Tissue</option>
            </select></td>
          </tr>
          <tr>
            <td height="47" align="right" style="font-size:11px; font-weight: bold;" >Additional Tissue<br />
            Resected </td>
            <td><select  id="AnteriorAddTissue" name="AnteriorAddTissue"  onchange="SetRecordValue('AddTissue', 'Anterior', this.value);" style="width: 138px;" >
                <option value=""></option>
                <option value="Yes">Yes</option>
                <option value="No">No</option>
            </select></td>
            <td><select  id="PosteriorAddTissue" name="PosteriorAddTissue"  onchange="SetRecordValue('AddTissue', 'Posterior', this.value);" style="width: 138px;" >
                <option value=""></option>
                <option value="Yes">Yes</option>
                <option value="No">No</option>
            </select></td>
          </tr>

      </table>
	</td>
  </tr>
</table>

  <div style="visibility: hidden;" id="IntraOpResultsSummaryDiv">
  <table width="700" border="0" cellpadding="0" cellspacing="0" style="margin: 0px; margin-top: 20px;">
    <tr>
      <td height="25" colspan="11" valign="middle" style="background-color: #8d2a2c; color: #ffffff; padding-left: 20px;"><img src="../../Images/CloseSmall.gif" width="38" height="8" hspace="10" vspace="3" class="ClickableImage" title="Click here to close." onclick="document.getElementById('IntraOpResultsSummaryDiv').style.visibility='hidden'" align="right" />Data Recorded for IntraOp Exam </td>
    </tr>
  </table>
  <table width="700" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" id="IntraOpDataTable" style="border: solid 2px #8d2a2c; margin: 0px;">
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><br />
      <img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="80" height="29" class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">Side</td>
      <td class="controlBoxDataGridHeader" style="font-size: 10px;">Level</td>
      <td class="controlBoxDataGridHeader" style="font-size: 10px;">Laterality</td>
      <td class="controlBoxDataGridHeader" style="font-size: 10px;">AP</td>
      <td class="controlBoxDataGridHeader" style="font-size: 10px;">Cancer</td>
      <td class="controlBoxDataGridHeader" style="font-size: 10px;">ECE</td>
      <td class="controlBoxDataGridHeader" style="font-size: 10px;">+SM</td>
      <td class="controlBoxDataGridHeader" style="font-size: 10px;">FS Result</td>
      <td class="controlBoxDataGridHeader" style="font-size: 8px; line-height:8px;">Additional<br />
        Tissue<br/>Resected</td>
      <td width="2" align="right" valign="top" class="controlBox"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /><input type="hidden" id="hasData_1" /></td>
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center">
	  <euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="1" Table="ProstatectomyProcFinding" id="OpExamSide_1" />	  </td>
      <td style="padding-left:2px;">
	  <%--<span id="OpExamLevel_1_Span"  class="IntraOpDataDisplay"></span> --%>
	  <%--<euc:EformHidden id="OpExamLevel_1" runat="server" RecordId="1" Table="ProstatectomyProcFinding" Field="ProcFindLevel"  />--%>
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="1" Table="ProstatectomyProcFinding" id="OpExamLevel_1" EnableHiddenOnUIEvent="OpExamSide_1"/> </td>
      <td><euc:EformSelect style="width: 60;" CssClass="IntraOpInputField" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="1" Table="ProstatectomyProcFinding" id="OpExamLat_1" />      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="1" Table="ProstatectomyProcFinding" id="OpExamAP_1" EnableHiddenOnUIEvent="OpExamSide_1"/>	  </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="1" Table="ProstatectomyProcFinding" id="OpExamCancer_1"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="1" Table="ProstatectomyProcFinding" id="OpExamExtension_1"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="1" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_1"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" LookupCode="FrozenSectionResults" runat="server" Field="ProcFindFrozen" RecordId="1" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_1">      </euc:EformSelect>      </td>
      
      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="1" Table="ProstatectomyProcFinding" id="OpExamAddTissue_1"/></td>
      <td>&nbsp;</td>
    </tr>

    <tr>
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
          <input type="hidden" id="hasData_2" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="2" Table="ProstatectomyProcFinding" id="OpExamSide_2" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="2" Table="ProstatectomyProcFinding" id="OpExamLevel_2" EnableHiddenOnUIEvent="OpExamSide_2"/>      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="2" Table="ProstatectomyProcFinding" id="OpExamLat_2"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="2" Table="ProstatectomyProcFinding" id="OpExamAP_2" EnableHiddenOnUIEvent="OpExamSide_2"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="2" Table="ProstatectomyProcFinding" id="OpExamCancer_2"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="2" Table="ProstatectomyProcFinding" id="OpExamExtension_2"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="2" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_2"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" LookupCode="FrozenSectionResults" runat="server" Field="ProcFindFrozen" RecordId="2" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_2">      </euc:EformSelect>      </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="2" Table="ProstatectomyProcFinding" id="OpExamAddTissue_2"/></td>

      <td>&nbsp;</td>
    </tr>

    <tr>
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
          <input type="hidden" id="hasData_3" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="3" Table="ProstatectomyProcFinding" id="OpExamSide_3" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="3" Table="ProstatectomyProcFinding" id="OpExamLevel_3"  EnableHiddenOnUIEvent="OpExamSide_3"/>      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="3" Table="ProstatectomyProcFinding" id="OpExamLat_3"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="3" Table="ProstatectomyProcFinding" id="OpExamAP_3"  EnableHiddenOnUIEvent="OpExamSide_3"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="3" Table="ProstatectomyProcFinding" id="OpExamCancer_3"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="3" Table="ProstatectomyProcFinding" id="OpExamExtension_3"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="3" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_3"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" LookupCode="FrozenSectionResults" runat="server" Field="ProcFindFrozen" RecordId="3" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_3">      </euc:EformSelect>      </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="3" Table="ProstatectomyProcFinding" id="OpExamAddTissue_3"/></td>

      <td>&nbsp;</td>
    </tr>

    <tr>
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
          <input type="hidden" id="hasData_4" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="4" Table="ProstatectomyProcFinding" id="OpExamSide_4" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="4" Table="ProstatectomyProcFinding" id="OpExamLevel_4" EnableHiddenOnUIEvent="OpExamSide_3"/>      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="4" Table="ProstatectomyProcFinding" id="OpExamLat_4"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="4" Table="ProstatectomyProcFinding" id="OpExamAP_4" EnableHiddenOnUIEvent="OpExamSide_3"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="4" Table="ProstatectomyProcFinding" id="OpExamCancer_4"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="4" Table="ProstatectomyProcFinding" id="OpExamExtension_4"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="4" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_4"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" runat="server"  LookupCode="FrozenSectionResults" Field="ProcFindFrozen" RecordId="4" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_4">      </euc:EformSelect>      </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="4" Table="ProstatectomyProcFinding" id="OpExamAddTissue_4"/></td>
      <td>&nbsp;</td>
    </tr>
	

<tr>
  <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
      <input type="hidden" id="hasData_5" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="5" Table="ProstatectomyProcFinding" id="OpExamSide_5" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="5" Table="ProstatectomyProcFinding" id="OpExamLevel_5" />      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="5" Table="ProstatectomyProcFinding" id="OpExamLat_5"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="5" Table="ProstatectomyProcFinding" id="OpExamAP_5" />      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="5" Table="ProstatectomyProcFinding" id="OpExamCancer_5"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="5" Table="ProstatectomyProcFinding" id="OpExamExtension_5"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="5" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_5"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" runat="server"  LookupCode="FrozenSectionResults" Field="ProcFindFrozen" RecordId="5" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_5">	  </euc:EformSelect>	  </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="5" Table="ProstatectomyProcFinding" id="OpExamAddTissue_5"/></td>
      <td>&nbsp;</td>
    </tr>
	

<tr>
  <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
      <input type="hidden" id="hasData_6" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="6" Table="ProstatectomyProcFinding" id="OpExamSide_6" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="6" Table="ProstatectomyProcFinding" id="OpExamLevel_6" />      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="6" Table="ProstatectomyProcFinding" id="OpExamLat_6"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="6" Table="ProstatectomyProcFinding" id="OpExamAP_6" />      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="6" Table="ProstatectomyProcFinding" id="OpExamCancer_6"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="6" Table="ProstatectomyProcFinding" id="OpExamExtension_6"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="6" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_6"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" runat="server"  LookupCode="FrozenSectionResults" Field="ProcFindFrozen" RecordId="6" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_6">	  </euc:EformSelect>	  </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="6" Table="ProstatectomyProcFinding" id="OpExamAddTissue_6"/></td>
      <td>&nbsp;</td>
    </tr>
	

<tr>
  <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
      <input type="hidden" id="hasData_7" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="7" Table="ProstatectomyProcFinding" id="OpExamSide_7" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="7" Table="ProstatectomyProcFinding" id="OpExamLevel_7" />      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="7" Table="ProstatectomyProcFinding" id="OpExamLat_7"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="7" Table="ProstatectomyProcFinding" id="OpExamAP_7" />      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="7" Table="ProstatectomyProcFinding" id="OpExamCancer_7"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="7" Table="ProstatectomyProcFinding" id="OpExamExtension_7"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="7" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_7"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" runat="server"  LookupCode="FrozenSectionResults" Field="ProcFindFrozen" RecordId="7" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_7">	  </euc:EformSelect>	  </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="7" Table="ProstatectomyProcFinding" id="OpExamAddTissue_7"/></td>
      <td>&nbsp;</td>
    </tr>
	

<tr>
  <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
      <input type="hidden" id="hasData_8" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="8" Table="ProstatectomyProcFinding" id="OpExamSide_8" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="8" Table="ProstatectomyProcFinding" id="OpExamLevel_8" />      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="8" Table="ProstatectomyProcFinding" id="OpExamLat_8"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="8" Table="ProstatectomyProcFinding" id="OpExamAP_8" />      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="8" Table="ProstatectomyProcFinding" id="OpExamCancer_8"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="8" Table="ProstatectomyProcFinding" id="OpExamExtension_8"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="8" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_8"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" runat="server"  LookupCode="FrozenSectionResults" Field="ProcFindFrozen" RecordId="8" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_8">	  </euc:EformSelect>	  </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="8" Table="ProstatectomyProcFinding" id="OpExamAddTissue_8"/></td>
      <td>&nbsp;</td>
    </tr>
	

<tr>
  <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
      <input type="hidden" id="hasData_9" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="9" Table="ProstatectomyProcFinding" id="OpExamSide_9" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="9" Table="ProstatectomyProcFinding" id="OpExamLevel_9" />      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="9" Table="ProstatectomyProcFinding" id="OpExamLat_9"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="9" Table="ProstatectomyProcFinding" id="OpExamAP_9" />      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="9" Table="ProstatectomyProcFinding" id="OpExamCancer_9"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="9" Table="ProstatectomyProcFinding" id="OpExamExtension_9"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="9" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_9"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" runat="server"  LookupCode="FrozenSectionResults" Field="ProcFindFrozen" RecordId="9" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_9">	  </euc:EformSelect>	  </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="9" Table="ProstatectomyProcFinding" id="OpExamAddTissue_9"/></td>
      <td>&nbsp;</td>
    </tr>
	

<tr>
  <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
      <input type="hidden" id="hasData_10" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="10" Table="ProstatectomyProcFinding" id="OpExamSide_10" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="10" Table="ProstatectomyProcFinding" id="OpExamLevel_10" />      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="10" Table="ProstatectomyProcFinding" id="OpExamLat_10"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="10" Table="ProstatectomyProcFinding" id="OpExamAP_10" />      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="10" Table="ProstatectomyProcFinding" id="OpExamCancer_10"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="10" Table="ProstatectomyProcFinding" id="OpExamExtension_10"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="10" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_10"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" runat="server"  LookupCode="FrozenSectionResults" Field="ProcFindFrozen" RecordId="10" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_10">	  </euc:EformSelect>	  </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="10" Table="ProstatectomyProcFinding" id="OpExamAddTissue_10"/></td>
      <td>&nbsp;</td>
    </tr>
	

<tr>
  <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
      <input type="hidden" id="hasData_11" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="11" Table="ProstatectomyProcFinding" id="OpExamSide_11" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="11" Table="ProstatectomyProcFinding" id="OpExamLevel_11" />      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="11" Table="ProstatectomyProcFinding" id="OpExamLat_11"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="11" Table="ProstatectomyProcFinding" id="OpExamAP_11" />      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="11" Table="ProstatectomyProcFinding" id="OpExamCancer_11"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="11" Table="ProstatectomyProcFinding" id="OpExamExtension_11"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="11" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_11"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" runat="server"  LookupCode="FrozenSectionResults" Field="ProcFindFrozen" RecordId="11" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_11">	  </euc:EformSelect>	  </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="11" Table="ProstatectomyProcFinding" id="OpExamAddTissue_11"/></td>
      <td>&nbsp;</td>
    </tr>
	

<tr>
  <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
      <input type="hidden" id="hasData_12" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="12" Table="ProstatectomyProcFinding" id="OpExamSide_12" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="12" Table="ProstatectomyProcFinding" id="OpExamLevel_12" />      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="12" Table="ProstatectomyProcFinding" id="OpExamLat_12"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="12" Table="ProstatectomyProcFinding" id="OpExamAP_12" />      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="12" Table="ProstatectomyProcFinding" id="OpExamCancer_12"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="12" Table="ProstatectomyProcFinding" id="OpExamExtension_12"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="12" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_12"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" runat="server"  LookupCode="FrozenSectionResults" Field="ProcFindFrozen" RecordId="12" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_12">	  </euc:EformSelect>	  </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="12" Table="ProstatectomyProcFinding" id="OpExamAddTissue_12"/></td>
      <td>&nbsp;</td>
    </tr>
	

<tr>
  <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
      <input type="hidden" id="hasData_13" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="13" Table="ProstatectomyProcFinding" id="OpExamSide_13" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="13" Table="ProstatectomyProcFinding" id="OpExamLevel_13" />      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="13" Table="ProstatectomyProcFinding" id="OpExamLat_13"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="13" Table="ProstatectomyProcFinding" id="OpExamAP_13" />      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="13" Table="ProstatectomyProcFinding" id="OpExamCancer_13"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="13" Table="ProstatectomyProcFinding" id="OpExamExtension_13"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="13" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_13"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" runat="server"  LookupCode="FrozenSectionResults" Field="ProcFindFrozen" RecordId="13" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_13">	  </euc:EformSelect>	  </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="13" Table="ProstatectomyProcFinding" id="OpExamAddTissue_13"/></td>
      <td>&nbsp;</td>
    </tr>
	

<tr>
  <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" />
      <input type="hidden" id="hasData_14" /></td> 
      <td height="35" class="controlBoxDataGridFirstColumn" style="padding-left:2px;" align="center"><euc:EformSelect style="width: 40;" LookupCode="OpSide" runat="server" Field="ProcFindSide" RecordId="14" Table="ProstatectomyProcFinding" id="OpExamSide_14" />      </td>
      <td style="padding-left:2px;">
      <euc:EformSelect style="width: 50;" LookupCode="ProstateLevel" runat="server" Field="ProcFindLevel" RecordId="14" Table="ProstatectomyProcFinding" id="OpExamLevel_14" />      </td>
      <td><euc:EformSelect style="width: 60;" LookupCode="Laterality" runat="server" Field="ProcFindLaterality" RecordId="14" Table="ProstatectomyProcFinding" id="OpExamLat_14"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="AP" runat="server" Field="ProcFindAP" RecordId="14" Table="ProstatectomyProcFinding" id="OpExamAP_14" />      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindCancer" RecordId="14" Table="ProstatectomyProcFinding" id="OpExamCancer_14"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindExtension" RecordId="14" Table="ProstatectomyProcFinding" id="OpExamExtension_14"/>      </td>
      <td>
      <euc:EformSelect style="width: 60;" LookupCode="Probability" runat="server" Field="ProcFindMargin" RecordId="14" Table="ProstatectomyProcFinding" id="OpExamMarginStatus_14"/>      </td>
      <td> 
      <euc:EformSelect style="width: 60;" runat="server"  LookupCode="FrozenSectionResults" Field="ProcFindFrozen" RecordId="14" Table="ProstatectomyProcFinding" id="OpExamFrozenSection_14">	  </euc:EformSelect>	  </td>

      <td><euc:EformSelect style="width: 50;" LookupCode="YesNoUnknown" runat="server" Field="ProcFindAddTissue" RecordId="14" Table="ProstatectomyProcFinding" id="OpExamAddTissue_14"/></td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td align="right" valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
</table> 
  </div>
<script type="text/javascript">LoadDisplayData();</script>
  <br/><br/><br/>