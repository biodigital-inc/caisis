<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.RectalExamHistory" CodeFile="RectalExamHistory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">
<!--
/********* Prostate DRE Diagram functions **********/

// client side array is set server side
// [0]=Side [1]=Level [2]=Cancer [3]=ECE [4]=CancerSelectClientId [5]=ECESelectClientId

var DiagramPaintColor = 'red';
var activeSide = "";
var activeLevel = ""
var dre_result_field = '<asp:Literal  ID="DreResultFieldId" runat="server" />';

// use data in array to set diagram images
function setDiagramOnPageLoad()
{
	
	for(var i=0; i<dreArray.length; i++)
	{
		var side = dreArray[i][0];
		var level = dreArray[i][1];
		var cancer = dreArray[i][2];
		var ece = dreArray[i][3];
	
		var ImageId = 'Diagram' + side + level;
		var opacity = convertProbabilityToNumber(cancer) * 25;
		setOpacity(ImageId, opacity);
		
		SetECEImage(ece, side, level);
		
	}
}

// return index of array given the side and level
function getArrayIndex(side, level)
{
	if(side == 'Left')
	{
		if(level == 'SV')
			return 0;
		else if(level == 'Base')
			return 1;
		else if(level == 'Mid')
			return 2;
		else if(level == 'Apex')
			return 3;
	}
	else if(side == 'Right')
	{
		if(level == 'SV')
			return 4;
		else if(level == 'Base')
			return 5;
		else if(level == 'Mid')
			return 6;
		else if(level == 'Apex')
			return 7;
	}
}

function updateCancerOnDiagram(side, level, cancerValue)
{
	// get the index of the array element with data on this side and level
	
	var arrayIndex = getArrayIndex(side, level);
	
	// set the find result (cancer) value in the array
	dreArray[arrayIndex][2] = cancerValue;	
		
	// set the image opacity
	var ImageId = 'Diagram' + side + level;
	var opacity = convertProbabilityToNumber(cancerValue) * 25;
		
	setOpacity(ImageId, opacity);
	
	enterTempValueIntoRectalExamTable();
}

function updateECEOnDiagram(side,level, eceValue)
{
	SetECEImage(eceValue, side, level);

	enterTempValueIntoRectalExamTable();

	// get the index of the array element with data on this side and level
	/*	var arrayIndex = getArrayIndex(side, level);



	// set the find result (cancer) value in the array
	dreArray[arrayIndex][3] = eceValue;	
	
	// set the image opacity
	var ImageId = 'Diagram' + side + level;
	var opacity = convertProbabilityToNumber(eceValue) * 20;
	*/
}
function updateCancer()
{
	// get selected value from pop up layer
	var cancerValue = document.forms[0].cancerSelect.options[document.forms[0].cancerSelect.selectedIndex].text;	
	
	// get the index of the array element with data on this side and level
	var arrayIndex = getArrayIndex(activeSide, activeLevel);
	
	// set the find result (cancer) value in the array
	dreArray[arrayIndex][2] = cancerValue;	
	
	// get the client id of the find result box from the array
	var selectBoxId = dreArray[arrayIndex][4]; 	
	
	// set the select box with the find result value
	document.getElementById(selectBoxId).value = cancerValue;
	
	// TODO: enable appropriate hiddens
	enableHidden(dreArray[arrayIndex][6]);
	enableHidden(dreArray[arrayIndex][7]);
	
	var ImageId = 'Diagram' + activeSide + activeLevel;
	
	var opacity = convertProbabilityToNumber(cancerValue) * 25;
		
	setOpacity(ImageId, opacity);
	
	
	enterTempValueIntoRectalExamTable();
}

function convertProbabilityToNumber(probString)
{
	var probNumber=0;
	
	if (probString == 'Definitely No') probNumber=0
	else if (probString == 'Probably No') probNumber=1
	else if (probString == 'Possible') probNumber=2
	else if (probString == 'Probably') probNumber=3
	else if (probString == 'Definitely') probNumber=4;
	
	return probNumber;

}

function updateECE()
{
	var eceValue = document.forms[0].eceSelect.options[document.forms[0].eceSelect.selectedIndex].text;	
	var arrayIndex = getArrayIndex(activeSide, activeLevel);
	dreArray[arrayIndex][3] = eceValue;	
	var selectBoxId = dreArray[arrayIndex][5]; 	
	document.getElementById(selectBoxId).value = eceValue;
	
	// TODO: enable appropriate hiddens
	enableHidden(dreArray[arrayIndex][6]);
	enableHidden(dreArray[arrayIndex][7]);
	
	SetECEImage(eceValue, activeSide, activeLevel);

	enterTempValueIntoRectalExamTable();
}

function SetECEImage(probability, side, level)
{
	var ImageId = 'Diagram' + side + level;
	var ECEImageId = 'ECE' + side + level;
	var probabilityLevel = convertProbabilityToNumber(probability);
	
	if (probabilityLevel > 0)
	{
		document.getElementById(ImageId).src = '../../Images/DREDiagram/ProstateDiagram_' + side + level + '_ECEProbability' + convertProbabilityToNumber(probability) + '.gif';
		
		if (level != 'SV')
		{
			document.getElementById(ECEImageId).src = '../../Images/DREDiagram/ECEDiagram_' + side + level + '_Probability' + convertProbabilityToNumber(probability) + '.gif';
		}
	}
	else
	{
		document.getElementById(ImageId).src = '../../Images/DREDiagram/ProstateDiagram_' + side + level + '.gif';
		if (level != 'SV')
		{
			document.getElementById(ECEImageId).src = '../../Images/DREDiagram/ECEDiagram_' + side + level + '_Probability0.gif';
		}
	}
	
	
	
	
}

// onclick of diagram box show pop up layer
function showOptions(side, level, imageId)
{
	activeLevel = level;
	activeSide = side;
	
	document.getElementById('dreLayerTitle').innerHTML = activeSide + ' ' + activeLevel;
	
	currentImage = document.getElementById(imageId);
	
	document.getElementById('dreSelectOptions').style.visibility = 'visible';		
	
	// highlight options in pop up
	showCancerValueInPopUp(activeSide, activeLevel);
	showECEValueInPopUp(activeSide, activeLevel);
	
	
}

function showCancerValueInPopUp(activeSide, activeLevel)
{
	// reset to blank
	document.getElementById('cancerSelect').value = '';
	
	// highlight option based on diagram
	var arrayIndex = getArrayIndex(activeSide, activeLevel);
	var cancerValue = dreArray[arrayIndex][2];	
	
	for (var i=0; i < document.getElementById('cancerSelect').options.length; i++)
	{
		if(cancerValue != '' && document.getElementById('cancerSelect').options[i].text == cancerValue)
		{
			document.getElementById('cancerSelect').options[i].selected = true;
		}
	}
}

function showECEValueInPopUp(activeSide, activeLevel)
{
	// reset to blank
	document.getElementById('eceSelect').value = '';
	
	// highlight option based on diagram
	var arrayIndex = getArrayIndex(activeSide, activeLevel);
	var eceValue = dreArray[arrayIndex][3];	
	
	for (var i=0; i < document.getElementById('eceSelect').options.length; i++)
	{
		if(eceValue != '' && document.getElementById('eceSelect').options[i].text == eceValue)
		{
			document.getElementById('eceSelect').options[i].selected = true;
		}
	}
}

// close the layer
function closeBox()
{
	document.getElementById('dreSelectOptions').style.visibility = 'hidden';
}


function setOpacity(id, opacity) {

	obj = document.getElementById(id);

	opacity = (opacity == 100)?99.999:opacity;
	// IE/Win
	obj.style.filter = "alpha(opacity:"+opacity+")";
	// Safari<1.2, Konqueror
	obj.style.KHTMLOpacity = opacity/100;
	// Older Mozilla and Firefox
	obj.style.MozOpacity = opacity/100;
	// Safari 1.2, newer Firefox and Mozilla, CSS3
	obj.style.opacity = opacity/100;
}

function enableHidden(id) {
	var el = document.getElementById(id);
	el.removeAttribute('disabled');
}


function enterTempValueIntoRectalExamTable()
{
	if (document.getElementById(dre_result_field).value.length < 1)
	{
		document.getElementById(dre_result_field).value = 'Unknown';
	}
}

function setDRE_Result(DRE_ResultVale)
{
    if (DRE_ResultVale == 'Normal')
    {
        alert('test');
    }
}


function loadEncRectalExamRecord(EncounterId, hasFindings) {
    if (EncounterId.toString().length > 0) {
        LoadDataEntryForm('EncRectalExams', EncounterId, '', 'RectalExamHistory', 'EncRectalExamFindings');
//       if (hasFindings) { LoadDataEntryForm('EncRectalExams', EncounterId, '', 'RectalExamHistory', 'EncRectalExamFindings'); }
//       else { LoadDataEntryForm('Encounters', EncounterId, 'EncDateText,EncDate,EncChiefComplaint,EncType,EncPhysician,EncNotes', 'RectalExamHistory', 'EncRectalExams'); }
    }
}

function loadEncRectalExamFindingRecord(EncounterId) {
    if (EncounterId.toString().length > 0) {
        LoadDataEntryForm('EncRectalExams', EncounterId, '', 'RectalExamHistory', 'EncRectalExamFindings');  //EncDateText,EncDate,EncChiefComplaint,EncType,EncPhysician,EncNotes
        stopBubble();
    }
}

//-->
</script>

<style type="text/css">

table.DREHistoryTable
{
    border: solid 1px #cccccc;
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
}
table.DREHistoryTable td
{
    border: solid 1px #cccccc;
    padding: 10px 3px;
    text-align: center;
}

table.PageBreakable
{
    table-layout: fixed;
}
table.DREHistoryTable tr:last-child td
{
    border-bottom: none;
}



table.DREHistoryTable tr.populated>td
{
    background: linear-gradient(#E0E4E6, #FEFEFE);
    cursor: pointer;
}
table.DREHistoryTable tr.populated:hover>td
{
    background: linear-gradient(#D0C9D1, #DBA5B2, #EED2D9);
    border: solid 1px #D0C9D1;
    color: #000000;
}

</style>



<a name="RectalExamHistory" /><span class="controlBoxTitle" style="display: block;">Rectal Exams</span>



    
        <table class="DREHistoryTable" cellspacing="0" id="DREHistoryTable" >
        <tr id="DREHistoryTableHeader" runat="server" visible="false">
        <th style="width: 15%; color: #000000; font-size: 12px;">Date</th>
        <th style="width: 25%; color: #000000; font-size: 12px;">2002 Clinical Stage</th>
        <th style="color: #000000; font-size: 12px;">Findings</th>
        </tr>
        <tr id="NoDREHistoryTableMessage" runat="server"><th style=" color: #000000; font-size: 12px;">No Prior Rectal Exams</th></tr>
    <asp:Repeater ID="DREHistory" runat="server" OnItemDataBound="DREHistoryItemDataBound">
    <ItemTemplate> 
        <tr class="populated" onclick="loadEncRectalExamRecord(<%# DataBinder.Eval(Container.DataItem, "EncounterId")%>, <asp:Literal ID="RectalExamJSLinkModifier" runat="server" Text="false" />);" > 
        <td ><%# DataBinder.Eval(Container.DataItem, "EncDateText")%>&nbsp;</td>
        <td ><asp:Literal ID="ClinicalStageVals" runat="server" />&nbsp;</td>
        <td style="padding: 0px;" >
        
                <asp:Repeater ID="DREFindings" runat="server">
                <%---  ---%>
                <HeaderTemplate>
                    <table class="DREHistoryTable" cellspacing="0" style=" table-layout: fixed;" >
                    <tr>
                    <th style="width: 20%; color: #000000; font-size: 12px;" >Side</th>
                    <th style="width: 20%; color: #000000; font-size: 12px;" >Laterality</th>
                    <th style="width: 20%; color: #000000; font-size: 12px;" >Level</th>
                    <th style="width: 20%; color: #000000; font-size: 12px;" >Result</th>
                    <th style="width: 20%; color: #000000; font-size: 12px;" >ECE</th>
                    </tr>
                </HeaderTemplate>
                <ItemTemplate> 
                    <tr >    
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindSide")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindLaterality")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindLevel")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindResult")%>&nbsp;</td>
                    <td ><%# DataBinder.Eval(Container.DataItem, "DRE_FindExtension")%>&nbsp;</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
                </asp:Repeater>
        </td>
        </tr>
    </ItemTemplate>
    </asp:Repeater>
    </table>


    















<table width="650" border="0" cellspacing="0" cellpadding="4"  class="eformLargePopulatedTable">
  <tr>
    <td colspan="2" align="center" ><table width="600" border="0" cellspacing="0" cellpadding="4" style="border: solid 1px #cccccc;">
      <tr>
        <td height="40" align="center" class="ControlBoxRowAlternatingRowsB" style="font-weight: bold;">DRE Result&nbsp;&nbsp;<euc:EformSelect LookupCode="RectalExamResult" DropDownHeight="auto" style="width:70px;" Field="DRE_Result" Table="EncRectalExams" Runat="server" id="DRE_Result"  />        </td>
        <td width="70%" align="center" class="ControlBoxRowAlternatingRowsB"><strong>2002 Clinical Stage</strong>
            <euc:EformHidden id="ClinStageDate" runat="server" Table="ClinicalStages" Field="ClinStageDate" />
            <euc:EformHidden id="ClinStageDateText" runat="server" Table="ClinicalStages" Field="ClinStageDateText" />
            <euc:EformHidden id="ClinStageDisease" runat="server" Table="ClinicalStages" Field="ClinStageDisease"  Value="Prostate"/>
            <euc:EformHidden id="ClinStageSystem" runat="server" Table="ClinicalStages" Field="ClinStageSystem"  Value="UICC_02"/>
            <euc:EformHidden id="ClinStageQuality" runat="server" Table="ClinicalStages" Field="ClinStageQuality" Value="STD"/>
            <span style="font-weight: bold;">T</span> <euc:EformSelect LookupCode="StageClin_Prostate_02_T" DropDownWidth="230" TABLE="ClinicalStages" FIELD="ClinStageT" Runat="server" style="width:30px;"  ID="ClinStageT" EnableHiddenOnUIEvent="ClinStageDate,ClinStageDateText,ClinStageDisease,ClinStageSystem,ClinStageQuality"/>
            <span style="font-weight: bold; margin-left: 16px;">N</span> <euc:EformSelect LookupCode="StageClin_Prostate_02_N" DropDownWidth="230" TABLE="ClinicalStages" FIELD="ClinStageN" Runat="server" style="width:30px;"  ID="ClinStageN" EnableHiddenOnUIEvent="ClinStageDate,ClinStageDateText,ClinStageDisease,ClinStageSystem,ClinStageQuality"/>
            <span style="font-weight: bold; margin-left: 16px;">M</span> <euc:EformSelect LookupCode="StageClin_Prostate_02_M" DropDownWidth="230" TABLE="ClinicalStages" FIELD="ClinStageM" Runat="server" style="width:30px;"  ID="ClinStageM" EnableHiddenOnUIEvent="ClinStageDate,ClinStageDateText,ClinStageDisease,ClinStageSystem,ClinStageQuality"/>
            </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2" align="left" >
	

	<img src="../../Images/DREDiagram/DRE_ViewKey.gif" name="DREKey" width="68" height="196" border="0" align="left" usemap="#DREMap" id="DREKey" style="margin-top: 2px; margin-right: 8px;" onmouseleave="MM_swapImage('DREKey','','../../Images/DREDiagram/DRE_ViewKey.gif',1);" />

	
	<table width="556" border="0" cellpadding="0" cellspacing="0" class="ProstateDiagramBGTable">
  <tr>
    <td><img src="../../Images/shim.gif" width="35" height="14" /></td>
    <td><img src="../../Images/shim.gif" width="211" height="1" /></td>
    <td><img src="../../Images/shim.gif" width="64" height="1" /></td>
    <td><img src="../../Images/shim.gif" width="211" height="1" /></td>
    <td><img src="../../Images/shim.gif" width="37" height="1" /></td>
  </tr>
  <tr>
    <td><img src="../../Images/shim.gif" width="1" height="194" /></td>
    <td valign="top"><table width="210" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="../../Images/shim.gif" width="18" height="51" /></td>
        <td><img src="../../Images/DREDiagram/ProstateDiagram_LeftSV.gif" name="DiagramLeftSV" width="89" height="51" id="DiagramLeftSV" onclick="showOptions('Left','SV', this.id);" style="cursor: pointer;"  class="InvisibleImage"/></td>
        <td><img src="../../Images/DREDiagram/ProstateDiagram_RightSV.gif" name="DiagramRightSV" width="85" height="51" id="DiagramRightSV" onclick="showOptions('Right','SV', this.id);"  style="cursor: pointer;"  class="InvisibleImage"/></td>
        <td><img src="../../Images/shim.gif" width="18" height="1" /></td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td><img src="../../Images/DREDiagram/ProstateDiagram_LeftBase.gif" name="DiagramLeftBase" width="89" height="43" id="DiagramLeftBase" onclick="showOptions('Left','Base', this.id);" style="cursor: pointer;"  class="InvisibleImage"/></td>
        <td><img src="../../Images/DREDiagram/ProstateDiagram_RightBase.gif" name="DiagramRightBase" width="85" height="43" id="DiagramRightBase" onclick="showOptions('Right','Base', this.id);" style="cursor: pointer;"  class="InvisibleImage"/></td>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td><img src="../../Images/DREDiagram/ProstateDiagram_LeftMid.gif" name="DiagramLeftMid" width="89" height="43" id="DiagramLeftMid"   onclick="showOptions('Left','Mid', this.id);" style="cursor: pointer;" class="InvisibleImage"/></td>
        <td><img src="../../Images/DREDiagram/ProstateDiagram_RightMid.gif" name="DiagramRightMid" width="85" height="43" id="DiagramRightMid"  onclick="showOptions('Right','Mid', this.id);" style="cursor: pointer;"  class="InvisibleImage"/></td>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td><img src="../../Images/DREDiagram/ProstateDiagram_LeftApex.gif" name="DiagramLeftApex" width="89" height="43" id="DiagramLeftApex"   onclick="showOptions('Left','Apex', this.id);" style="cursor: pointer;"  class="InvisibleImage"/></td>
        <td><img src="../../Images/DREDiagram/ProstateDiagram_RightApex.gif" name="DiagramRightApex" width="85" height="43" id="DiagramRightApex"  onclick="showOptions('Right','Apex', this.id);" style="cursor: pointer;"  class="InvisibleImage"/></td>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        </tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        </tr>
    </table></td>
    <td valign="top">&nbsp;
	
	<div id="dreSelectOptions" style="z-index:10; VISIBILITY: hidden; POSITION: absolute; BACKGROUND-COLOR: white; ">
	<table onmouseleave="closeBox()" cellpadding="2" cellspacing="0" style="border: solid 2px #8d2a2c;" width="230">
		<tr>
			<td colspan="2" bgcolor="#8d2a2c" ><img src="../../Images/CloseSmall.gif" width="38" height="8" vspace="3" align="right" style="cursor: pointer;" onclick="closeBox()" />&nbsp;<span style="color: #ffffff; font-weight: bold;" id="dreLayerTitle"></span></td>
		</tr>
		
		<tr>
			<td height="30" valign="bottom">&nbsp;&nbsp;<strong>Cancer</strong></td>
			<td valign="bottom"><strong>ECE</strong></td>
		</tr>
		<tr>
			<td height="30" valign="top">
			  <select size=6 id="cancerSelect" onChange="updateCancer()"  >
			    <option>Definitely No</option>
			    <option>Probably No</option>
			    <option>Possible</option>
			    <option>Probably</option>
			    <option>Definitely</option>
			    <option></option>
		      </select></td><td valign="top" >
		      <select size=6 id="eceSelect" onChange="updateECE()">
				<option>Definitely No</option>
			    <option>Probably No</option>
			    <option>Possible</option>
			    <option>Probably</option>
			    <option>Definitely</option>
			    <option></option>
			</select></td>
		</tr>
		<tr><td colspan="2" height="1">&nbsp;</td></tr>
	</table>
</div>	</td>
    <td valign="top"><table width="210" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="../../Images/shim.gif"  width="107" height="12" /></td>
        <td><img src="../../Images/shim.gif"  width="103" height="1" /></td>
      </tr>
      <tr>
        <td align="right"><img src="../../Images/DREDiagram/ECEDiagram_LeftBase_Probability0.gif" name="ECELeftBase" width="107" height="50" id="ECELeftBase" onclick="showOptions('Left','Base', this.id);" style="cursor: pointer;"  /></td>
        <td><img src="../../Images/DREDiagram/ECEDiagram_RightBase_Probability0.gif" name="ECERightBase" width="103" height="50" id="ECERightBase" onclick="showOptions('Right','Base', this.id);" style="cursor: pointer;"  /></td>
      </tr>
      <tr>
        <td colspan="2"><img src="../../Images/shim.gif"  width="1" height="11" /></td>
        </tr>
      <tr>
        <td align="right"><img src="../../Images/DREDiagram/ECEDiagram_LeftMid_Probability0.gif" name="ECELeftMid" width="107" height="49" id="ECELeftMid"   onclick="showOptions('Left','Mid', this.id);" style="cursor: pointer;" /></td>
        <td><img src="../../Images/DREDiagram/ECEDiagram_RightMid_Probability0.gif" name="ECERightMid" width="103" height="49" id="ECERightMid"  onclick="showOptions('Right','Mid', this.id);" style="cursor: pointer;"  /></td>
      </tr>
      <tr>
        <td colspan="2"><img src="../../Images/shim.gif"  width="1" height="14" /></td>
      </tr>
      <tr>
        <td align="right"><img src="../../Images/DREDiagram/ECEDiagram_LeftApex_Probability0.gif" name="ECELeftApex" width="107" height="46" id="ECELeftApex"   onclick="showOptions('Left','Apex', this.id);" style="cursor: pointer;"  /></td>
        <td><img src="../../Images/DREDiagram/ECEDiagram_RightApex_Probability0.gif" name="ECERightApex" width="103" height="46" id="ECERightApex"  onclick="showOptions('Right','Apex', this.id);" style="cursor: pointer;"  /></td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table></td>
  </tr>
  <tr>
    <td align="center"><table width="300" border="0" cellspacing="0" cellpadding="1" >
      <tr>
        <td class="controlBoxDataGridHeaderFirstCol">Side</td>
        <td class="controlBoxDataGridHeaderFirstCol">Level</td>
        <td class="controlBoxDataGridHeaderFirstCol">Cancer</td>
        <td class="controlBoxDataGridHeaderFirstCol">ECE</td>
      </tr>
      

      <tr>
        <td align="center" class="FormInsideTableLeftCell style1">Left<euc:EformHidden id="DRE_FindSide_1" runat="server" RecordId="1" Table="EncRectalExamFindings" Field="DRE_FindSide" Value="Left"/></td>
        <td align="center" class="FormInsideTableRegCell style1">SV<euc:EformHidden id="DRE_FindLevel_1" runat="server" RecordId="1" Table="EncRectalExamFindings" Field="DRE_FindLevel" Value="SV"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateCancerOnDiagram('Left','SV', this.value);" RecordId="1" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindResult" Runat="server" ID="DRE_FindResult_1" EnableHiddenOnUIEvent="DRE_FindSide_1,DRE_FindLevel_1"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateECEOnDiagram('Left','SV', this.value);" RecordId="1" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindExtension" Runat="server" ID="DRE_FindExtension_1" EnableHiddenOnUIEvent="DRE_FindSide_1,DRE_FindLevel_1"/></td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell style1">Left<euc:EformHidden id="DRE_FindSide_2" runat="server" RecordId="2" Table="EncRectalExamFindings" Field="DRE_FindSide" Value="Left"/></td>
        <td align="center" class="FormInsideTableRegCell style1">B<euc:EformHidden id="DRE_FindLevel_2" runat="server" RecordId="2" Table="EncRectalExamFindings" Field="DRE_FindLevel" Value="Base"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateCancerOnDiagram('Left','Base', this.value);" RecordId="2" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindResult" Runat="server" ID="DRE_FindResult_2" EnableHiddenOnUIEvent="DRE_FindSide_2,DRE_FindLevel_2"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateECEOnDiagram('Left','Base', this.value);" RecordId="2" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindExtension" Runat="server" ID="DRE_FindExtension_2" EnableHiddenOnUIEvent="DRE_FindSide_2,DRE_FindLevel_2"/></td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell style1">Left<euc:EformHidden id="DRE_FindSide_3" runat="server" RecordId="3" Table="EncRectalExamFindings" Field="DRE_FindSide" Value="Left"/></td>
        <td align="center" class="FormInsideTableRegCell style1">M<euc:EformHidden id="DRE_FindLevel_3" runat="server" RecordId="3" Table="EncRectalExamFindings" Field="DRE_FindLevel" Value="Mid"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateCancerOnDiagram('Left','Mid', this.value);" RecordId="3" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindResult" Runat="server" ID="DRE_FindResult_3" EnableHiddenOnUIEvent="DRE_FindSide_3,DRE_FindLevel_3"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateECEOnDiagram('Left','Mid', this.value);" RecordId="3" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindExtension" Runat="server" ID="DRE_FindExtension_3" EnableHiddenOnUIEvent="DRE_FindSide_3,DRE_FindLevel_3"/></td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell style1">Left<euc:EformHidden id="DRE_FindSide_4" runat="server" RecordId="4" Table="EncRectalExamFindings" Field="DRE_FindSide" Value="Left"/></td>
        <td align="center" class="FormInsideTableRegCell style1">A<euc:EformHidden id="DRE_FindLevel_4" runat="server" RecordId="4" Table="EncRectalExamFindings" Field="DRE_FindLevel" Value="Apex"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateCancerOnDiagram('Left','Apex', this.value);" RecordId="4" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindResult" Runat="server" ID="DRE_FindResult_4" EnableHiddenOnUIEvent="DRE_FindSide_4,DRE_FindLevel_4"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateECEOnDiagram('Left','Apex', this.value);" RecordId="4" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindExtension" Runat="server" ID="DRE_FindExtension_4" EnableHiddenOnUIEvent="DRE_FindSide_4,DRE_FindLevel_4"/></td>
      </tr>
    </table></td>
    <td align="right" valign="middle"><table width="300" border="0" cellspacing="0" cellpadding="1" >
      <tr>
        <td class="controlBoxDataGridHeaderFirstCol">Side</td>
        <td class="controlBoxDataGridHeaderFirstCol">Level</td>
        <td class="controlBoxDataGridHeaderFirstCol">Cancer</td>
        <td class="controlBoxDataGridHeaderFirstCol">ECE</td>
      </tr>
     

      <tr>
        <td align="center" class="FormInsideTableLeftCell style1">Right
            <euc:EformHidden id="DRE_FindSide_5" runat="server" RecordId="5" Table="EncRectalExamFindings" Field="DRE_FindSide" Value="Left"/></td>
        <td align="center" class="FormInsideTableRegCell style1">SV
            <euc:EformHidden id="DRE_FindLevel_5" runat="server" RecordId="5" Table="EncRectalExamFindings" Field="DRE_FindLevel" Value="SV"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateCancerOnDiagram('Right','SV', this.value);" RecordId="5" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindResult" Runat="server" ID="DRE_FindResult_5" EnableHiddenOnUIEvent="DRE_FindSide_5,DRE_FindLevel_5"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateECEOnDiagram('Right','SV', this.value);" RecordId="5" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindExtension" Runat="server" ID="DRE_FindExtension_5" EnableHiddenOnUIEvent="DRE_FindSide_5,DRE_FindLevel_5"/></td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell style1">Right
            <euc:EformHidden id="DRE_FindSide_6" runat="server" RecordId="6" Table="EncRectalExamFindings" Field="DRE_FindSide" Value="Right"/></td>
        <td align="center" class="FormInsideTableRegCell style1">B
            <euc:EformHidden id="DRE_FindLevel_6" runat="server" RecordId="6" Table="EncRectalExamFindings" Field="DRE_FindLevel" Value="Base"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateCancerOnDiagram('Right','Base', this.value);" RecordId="6" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindResult" Runat="server" ID="DRE_FindResult_6" EnableHiddenOnUIEvent="DRE_FindSide_6,DRE_FindLevel_6"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateECEOnDiagram('Right','Base', this.value);" RecordId="6" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindExtension" Runat="server" ID="DRE_FindExtension_6" EnableHiddenOnUIEvent="DRE_FindSide_6,DRE_FindLevel_6"/></td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell style1">Right
            <euc:EformHidden id="DRE_FindSide_7" runat="server" RecordId="7" Table="EncRectalExamFindings" Field="DRE_FindSide" Value="Right"/></td>
        <td align="center" class="FormInsideTableRegCell style1">M
            <euc:EformHidden id="DRE_FindLevel_7" runat="server" RecordId="7" Table="EncRectalExamFindings" Field="DRE_FindLevel" Value="Mid"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateCancerOnDiagram('Right','Mid', this.value);" RecordId="7" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindResult" Runat="server" ID="DRE_FindResult_7" EnableHiddenOnUIEvent="DRE_FindSide_7,DRE_FindLevel_7"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateECEOnDiagram('Right','Mid', this.value);" RecordId="7" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindExtension" Runat="server" ID="DRE_FindExtension_7" EnableHiddenOnUIEvent="DRE_FindSide_7,DRE_FindLevel_7"/></td>
      </tr>
      <tr>
        <td align="center" class="FormInsideTableLeftCell style1">Right
            <euc:EformHidden id="DRE_FindSide_8" runat="server" RecordId="8" Table="EncRectalExamFindings" Field="DRE_FindSide" Value="Right"/></td>
        <td align="center" class="FormInsideTableRegCell style1">A
            <euc:EformHidden id="DRE_FindLevel_8" runat="server" RecordId="8" Table="EncRectalExamFindings" Field="DRE_FindLevel" Value="Apex"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateCancerOnDiagram('Right','Apex', this.value);" RecordId="8" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindResult" Runat="server" ID="DRE_FindResult_8" EnableHiddenOnUIEvent="DRE_FindSide_8,DRE_FindLevel_8"/></td>
        <td class="FormInsideTableRegCell" style="white-space:nowrap;"><euc:EformSelect AppendToOnChange="updateECEOnDiagram('Right','Apex', this.value);" RecordId="8" LookupCode="Probability"  TABLE="EncRectalExamFindings"  DropDownWidth="100" DropDownHeight="auto" FIELD="DRE_FindExtension" Runat="server" ID="DRE_FindExtension_8" EnableHiddenOnUIEvent="DRE_FindSide_8,DRE_FindLevel_8"/></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="80" colspan="2" align="center"><table width="500" border="0" cellspacing="0" cellpadding="4" style="border: solid 1px #cccccc;">
      <tr>
        <td height="50" width="50%" colspan="4" class="ControlBoxRowAlternatingRowsA"><strong>&nbsp;&nbsp;Prostate Weight </strong>&nbsp;&nbsp;&nbsp;
          <euc:EformTextBox ShowCalendar="False" ShowNumberPad="true" CalcDate="False" style="width:70px;" TABLE="EncRectalExams" FIELD="DRE_ProstateWeight" Runat="server" ID="DRE_ProsWeight"/></td>

        <td width="50%" align="left" class="ControlBoxRowAlternatingRowsA"><strong>&nbsp;&nbsp;&nbsp;Largest Induration </strong>(in cm)
			<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-top: 5px;" >
			  <tr>
				<td align="right" class="ControlBoxRowAlternatingRowsA">Length</td>
				<td class="ControlBoxRowAlternatingRowsA"><euc:EformTextBox ShowCalendar="False" CalcDate="False" ShowNumberPad="true" style="width:40px;" TABLE="EncRectalExams" FIELD="DRE_IndLength" Runat="server" ID="DRE_IndLength"/></td>
				<td align="right" class="ControlBoxRowAlternatingRowsA">Width</td>
				<td class="ControlBoxRowAlternatingRowsA"><euc:EformTextBox ShowCalendar="False" CalcDate="False" ShowNumberPad="true" style="width:40px;" TABLE="EncRectalExams" FIELD="DRE_IndWidth" Runat="server" ID="DRE_IndWidth"/></td>
			  </tr>
		  </table>
		
		</td>
        </tr>



    </table></td>
  </tr>
</table>

<asp:Literal  ID="SetImageScript" runat="server" />

<script language=javascript>
setDiagramOnPageLoad();
</script>
<br/>
<br/>
<br/>

<map name="DREMap" id="DREMap"><area shape="rect" coords="0,0,64,14" href="javascript:;" onmouseover="MM_swapImage('DREKey','','../../Images/DREDiagram/DRE_Key.gif',1);"  />
</map>