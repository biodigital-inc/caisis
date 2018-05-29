<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsiesProstateWithCores_ASurveillance" CodeFile="BiopsiesProstateWithCores_ASurveillance.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script  type="text/javascript">
	tableArray.BiopsiesHtmlTable = "BiopsiesHtmlTable";
</script>
<script  type="text/javascript">
	function calculateBxResult(primaryGleasonId, secondaryGleasonId, gleasonSumId, resultId)
	{
		var ggs = 0;
		var g1 = parseInt(document.getElementById(primaryGleasonId).value);
		var g2 = parseInt(document.getElementById(secondaryGleasonId).value);
		
		if (!isNaN(g1) && !isNaN(g2)) {
			var sumBox = document.getElementById(gleasonSumId);
			
			ggs = g1 + g2;
			sumBox.value = ggs;
			
			if (resultId != null)
			{
				var resBox = document.getElementById(resultId);
			
				if(ggs <2) {
					return;
				} else if(ggs <= 4) {
					resBox.value = 'Well'; //should match lookup code values
				} else if(ggs <= 7) {
					resBox.value = 'Mod';
				} else if(ggs <= 10) {
					resBox.value = 'Poor';
				}
			}
		}
		else
		{var sumBox = document.getElementById(gleasonSumId);
			sumBox.value = '';
			if (resultId != null)
			{
				var resBox = document.getElementById(resultId);
				resBox.value = '';
			}

			
		}
	}
	
	

function processLevelLabels()
{
	var LevelLabels = jQuery('span[id*="PathCoreLevel"]');
	var num = LevelLabels.size();
	
	
	LevelLabels.each(function(index) {
	jQuery(this).text(function(index, text) {
		    var levelDisplayName = '';
			switch(text)
			{
			case 'Apex':
			  levelDisplayName = 'A';
			  break;
			case 'Mid':
			  levelDisplayName = 'M';
			  break;
			case 'Base':
			  levelDisplayName = 'B';
			  break;
			default:
			  levelDisplayName = text;
			}
			return levelDisplayName;
		});
	});
	
}

</script>



<style type="text/css">
table#DiagnosticBiopsy_ProstateHtmlTable
{
	border: solid 1px #cccccc;
	border-collapse: collapse;
}
table#DiagnosticBiopsy_ProstateHtmlTable th
{
	padding: 1px 0px 1px 0px;
	border: solid 1px #cccccc;
	background-color: #e1e1e1;
	color: #000000;
	font-size: 10px;
	font-weight: bold;
	text-align: center;
}
table#DiagnosticBiopsy_ProstateHtmlTable td
{
	padding: 1px 0px 1px 0px;
	border: solid 1px #cccccc;
	color: #222222;
	font-size: 11px;
	font-weight: normal;
	text-align: center;
}

table#DiagnosticBiopsy_ProstateTopHtmlTable
{
	border: solid 1px #cccccc;
	border-collapse: collapse;}
table#DiagnosticBiopsy_ProstateTopHtmlTable td
{
	padding: 5px 10px 5px 10px;
	border: solid 1px #cccccc;
	color: #222222;
	font-size: 13px;
	font-weight: bold;
	text-align: left;
}

		table.BiopsyCoresPopDataTable
		{
		    width: 100%;
		    border-collapse: collapse;
		}
		table.BiopsyCoresPopDataTable td
		{
		    text-align: center;
		    border: solid 1px #999999;
		    padding: 1px;
		}
		table.BiopsyCoresPopDataTable th
		{
		    text-align: center;
		    border: solid 1px #999999;
		    padding: 1px;
		    font-weight: bold;
		    font-size: 11px;
		    color: #000000;
		    background-color: #dddddd;
		}
		tr.ProstateBiopsyTableRow td
		{
		    border-top: solid 1px #666666;
		}
</style>


<a name="BiopsiesProstateWithCores_ASurveillance" />

<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Biopsy History" ></asp:Label>
<euc:EformCheckBox runat="server" Table="NoTable" Field="BiopsiesNone" id="BiopsiesNone" Value="true" style="margin-left: 50px;" />Check if None <euc:EformCheckBox runat="server" Table="NoTable" Field="BiopsiesNoPrior" id="BiopsiesNoPrior" Value="true" style="margin-left: 50px;" />No Prior Biopsy
<br/>


<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BiopsiesHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">G1</td>
	<td class="controlBoxDataGridHeaderFirstCol">G2</td>
    <td class="controlBoxDataGridHeaderFirstCol">GS</td>
    <td class="controlBoxDataGridHeaderFirstCol">Result</td>
    <td class="controlBoxDataGridHeaderFirstCol">Data Source </td>
    <td class="controlBoxDataGridHeaderFirstCol">Comments</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
    <asp:Repeater ID="Biopsies" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow ProstateBiopsyTableRow"> 
			<td class="ClinicalEformPopulatedColumn" style="height: 28px;"  onmouseover="this.className='ClinicalEformPopulatedColumn ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedColumn';"  onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, 'ProcDateText,ProcDate,ProcName,ProcSite,ProcSurgeon', 'BiopsiesProstate');">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcDateText") %></td>
			 <td align="center" class="ClinicalEformPopulatedColumn"  onmouseover="this.className='ClinicalEformPopulatedColumn ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedColumn';"  onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, 'ProcDateText,ProcDate,ProcName,ProcSite,ProcSurgeon', 'BiopsiesProstate');">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcName") %> </td>
		  <td class="ClinicalEformPopulatedColumn" style="text-align: center;" <%# (DataBinder.Eval(Container.DataItem, "PathologyId").ToString().Length > 0) ? "onmouseover=\"this.className='ClinicalEformPopulatedColumn ClinicalEformHighlightedRow';\" onmouseout=\"this.className='ClinicalEformPopulatedColumn';\"  onclick=\"LoadDataEntryForm('Pathology', " + DataBinder.Eval(Container.DataItem, "PathologyId") + ", 'PathDateText,PathDate,PathResult,PathQuality,PathNotes', 'BiopsiesProstate','ProstateBiopsyPath,ProstateBiopsyCorePath');\"" : "" %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathGG1") %></td>
		  <td class="ClinicalEformPopulatedColumn" style="text-align: center;" <%# (DataBinder.Eval(Container.DataItem, "PathologyId").ToString().Length > 0) ? "onmouseover=\"this.className='ClinicalEformPopulatedColumn ClinicalEformHighlightedRow';\" onmouseout=\"this.className='ClinicalEformPopulatedColumn';\"  onclick=\"LoadDataEntryForm('Pathology', " + DataBinder.Eval(Container.DataItem, "PathologyId") + ", 'PathDateText,PathDate,PathResult,PathQuality,PathNotes', 'BiopsiesProstate','ProstateBiopsyPath,ProstateBiopsyCorePath');\"" : "" %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathGG2") %></td>
		  <td class="ClinicalEformPopulatedColumn" style="text-align: center;" <%# (DataBinder.Eval(Container.DataItem, "PathologyId").ToString().Length > 0) ? "onmouseover=\"this.className='ClinicalEformPopulatedColumn ClinicalEformHighlightedRow';\" onmouseout=\"this.className='ClinicalEformPopulatedColumn';\"  onclick=\"LoadDataEntryForm('Pathology', " + DataBinder.Eval(Container.DataItem, "PathologyId") + ", 'PathDateText,PathDate,PathResult,PathQuality,PathNotes', 'BiopsiesProstate','ProstateBiopsyPath,ProstateBiopsyCorePath');\"" : "" %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathGGS") %></td>
		  <td align="center" class="ClinicalEformPopulatedColumn" <%# (DataBinder.Eval(Container.DataItem, "PathologyId").ToString().Length > 0) ? "onmouseover=\"this.className='ClinicalEformPopulatedColumn ClinicalEformHighlightedRow';\" onmouseout=\"this.className='ClinicalEformPopulatedColumn';\"  onclick=\"LoadDataEntryForm('Pathology', " + DataBinder.Eval(Container.DataItem, "PathologyId") + ", 'PathDateText,PathDate,PathResult,PathQuality,PathNotes', 'BiopsiesProstate','ProstateBiopsyPath,ProstateBiopsyCorePath');\"" : "" %> >&nbsp;<asp:Literal ID="ResultField" Runat="server" /></td>
			<td align="center" class="ClinicalEformPopulatedColumn" <%# (DataBinder.Eval(Container.DataItem, "PathologyId").ToString().Length > 0) ? "onmouseover=\"this.className='ClinicalEformPopulatedColumn ClinicalEformHighlightedRow';\" onmouseout=\"this.className='ClinicalEformPopulatedColumn';\"  onclick=\"LoadDataEntryForm('Pathology', " + DataBinder.Eval(Container.DataItem, "PathologyId") + ", 'PathDateText,PathDate,PathResult,PathQuality,PathNotes', 'BiopsiesProstate','ProstateBiopsyPath,ProstateBiopsyCorePath');\"" : "" %> >&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathQuality") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn" <%# (DataBinder.Eval(Container.DataItem, "PathologyId").ToString().Length > 0) ? "onmouseover=\"this.className='ClinicalEformPopulatedColumn ClinicalEformHighlightedRow';\" onmouseout=\"this.className='ClinicalEformPopulatedColumn';\"  onclick=\"LoadDataEntryForm('Pathology', " + DataBinder.Eval(Container.DataItem, "PathologyId") + ", 'PathDateText,PathDate,PathResult,PathQuality,PathNotes', 'BiopsiesProstate','ProstateBiopsyPath,ProstateBiopsyCorePath');\"" : "" %> >&nbsp;<asp:Literal ID="CommentsField" Runat="server" /></td>
			<td class="ClinicalEformPopulatedColumn" ><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>
		
		
		
		
		
		
		
<tr id="CoresContainer" runat="server" visible="false">
					  <td class="FormInsideTableRegCell" style="padding: 0px 0px 0px 0px; border-bottom: none;">&nbsp;</td>
            <td colspan="7" style="padding: 0px 0px 0px 0px; border: none; ">
                <table align="center" border="0" width="100%" cellpadding="0" cellspacing="0" style="">
                          <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Pathology', <%# DataBinder.Eval(Container.DataItem, "PathologyId") %>, 'PathDateText,PathDate,PathResult,PathQuality,PathNotes', 'BiopsiesProstate','ProstateBiopsyPath,ProstateBiopsyCorePath');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;</td>
			<td colspan="3" align="center" class="ClinicalEformPopulatedColumn">
			<strong>Gleason Grade</strong> 
               &nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathGG1") %>
              &nbsp;<strong>+</strong>&nbsp; <%# DataBinder.Eval(Container.DataItem, "PathGG2") %>
              &nbsp;<strong>=</strong>&nbsp; <%# DataBinder.Eval(Container.DataItem, "PathGGS") %></td>
		  <td colspan="4" class="ClinicalEformPopulatedColumn">
		  <strong>Cores</strong> &nbsp;&nbsp;Positive: 
              <%# DataBinder.Eval(Container.DataItem, "PathPosCores") %>
              &nbsp;&nbsp;&nbsp;&nbsp;Total: 
              <%# DataBinder.Eval(Container.DataItem, "PathNumCores") %>
              </td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		</tr>
                          </table>
          <table class="BiopsyCoresPopDataTable" cellspacing="0" style="width: 100%; border-collapse: collapse;" >
                            <tr> 
                              <th align="center">Side</th>
                              <th align="center">Laterality</th>
                              <th align="center">Level</th>
                              <th width="7%" align="center">Pos Cores</th>
                              <th width="7%" align="center">Total Cores </th>
                              <th width="7%" align="center">GG1</th>
                              <th width="7%" align="center">GG2</th>
                              <th width="7%" align="center">GGS</th>
                              <th width="7%" align="center">%Ca</th>
                              <th width="7%" align="center">mmCa</th>
                              <th width="8%" align="center">mmCore</th>
                              <th width="6%" align="center">PNI</th>
                              <th width="7%" align="center">ASAP</th>
                              <th width="7%" align="center">HG PIN </th>
                              </tr>
					        <asp:Repeater ID="Cores" runat="server"  > 
				            <ItemTemplate> 
                            <tr> 
                              <td style="height: 18px; text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreSide")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreLaterality")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreLevel")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreNumCores")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreNumTotalCores")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreGG1")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreGG2")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreGGS")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCorePercCancer")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreMaxCancerLength")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreLength")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCorePNI_Diam")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreASAP")%>&nbsp;</td>
                              <td style="text-align: center;"><%# DataBinder.Eval(Container.DataItem, "PathCoreHG_PIN")%>&nbsp;</td>
                              </tr>
				            </ItemTemplate>
			              </asp:Repeater>
					    </table>
				        </td>
					  </tr>		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</ItemTemplate>
  </asp:Repeater>
  

  
  <tr id="ProstateBiopsyCoreHeader2" runat="server" visible="false"> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">G1</td>
	<td class="controlBoxDataGridHeaderFirstCol">G2</td>
    <td class="controlBoxDataGridHeaderFirstCol">GS</td>
    <td class="controlBoxDataGridHeaderFirstCol">Result</td>
    <td class="controlBoxDataGridHeaderFirstCol">Data Source </td>
    <td class="controlBoxDataGridHeaderFirstCol">Comments</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne ProstateBiopsyTableRow">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:70px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="Path_1DateText" RecordId="1"/>
														<euc:EformHidden RecordId="1" Runat="server" ID="Path_1Date" TABLE="Pathology" FIELD="PathDate" />	</td>
    <td valign="baseline" style="white-space:nowrap;">
    <euc:EformSelect style="width:120px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_1"  RecordId="1" /></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="1" ID="PathGG1_1" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="1" ID="PathGG2_1" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="1" ID="PathGGS_1" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_1"  RecordId="1"/>    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformDropDownList LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" Runat="server" ID="PathQuality_1"  RecordId="1" />    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:120px;" TABLE="Pathology" FIELD="PathNotes" ShowTextEditor="true"  Runat="server" ID="PathNotes_1" RecordId="1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr > 
    <td  class="ClinicalEformGridColumnOne">&nbsp;</td>
    <td colspan="7">
<table cellpadding="2" cellspacing="0" style="background-color: #dddddd; width: 100%; border: solid 1px #cccccc;">
                          <tr > 
		  <td  style="text-align: center;">
		  <strong>Cores</strong> &nbsp;&nbsp;Positive: 
              <euc:EformTextBox RecordId="1" ParentRecordId="1" ID="PathPosCores_1" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathPosCores" Runat="server"  />
              &nbsp;&nbsp;&nbsp;&nbsp;Total: 
              <euc:EformTextBox RecordId="1" ParentRecordId="1" ID="PathNumCores_1" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathNumCores" Runat="server"  />
              </td>
			<td id="DiagnosticBiopsyCoresToggleContainer" style="text-align: center;">
<euc:EformCheckBox ID="BiopsiesEnterCoreData" Table="NoTable" Field="BiopsiesEnterCoreData" runat="server" Value="true" /> Add Detailed Core Data</td>
		</tr>    
 </table>

<table width="700"  cellspacing="0" class="ClinicalEformTable" id="DiagnosticBiopsy_ProstateHtmlTable">
  <tr> 
    <th >Side</th>
    <th>Laterality</th>
    <th>Level</th>
    <th>Pos<br />Cores </th>
    <th>Total<br />Cores </th>
    <th>GG1</th>
    <th>GG2</th>
    <th>GGS</th>
    <th>%Ca</th>
    <th>mm Ca</th>
    <th>mm Core</th>
    <th>PNI</th>
    <th>ASAP</th>
    <th>HG PIN</th>
    <th>&nbsp;</th>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_1" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,1" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_1" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,1" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_1" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,1" /></td>
    <td><euc:EformTextBox RecordId="1" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_1"/></td>
    <td><euc:EformTextBox RecordId="1" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_1"/></td>
    <td><euc:EformTextBox RecordId="1" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_1"/></td>
    <td><euc:EformTextBox RecordId="1" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_1"/></td>
    <td><euc:EformTextBox RecordId="1" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_1"/></td>
    <td><euc:EformTextBox RecordId="1" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_1"/></td>
    <td><euc:EformTextBox RecordId="1" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_1"/></td>
    <td><euc:EformTextBox RecordId="1" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_1"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="1" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_1"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="1" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_1"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="1" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_2" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,2" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_2" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,2" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_2" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,2" /></td>
    <td><euc:EformTextBox RecordId="2" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_2"/></td>
    <td><euc:EformTextBox RecordId="2" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_2"/></td>
    <td><euc:EformTextBox RecordId="2" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_2"/></td>
    <td><euc:EformTextBox RecordId="2" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_2"/></td>
    <td><euc:EformTextBox RecordId="2" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_2"/></td>
    <td><euc:EformTextBox RecordId="2" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_2"/></td>
    <td><euc:EformTextBox RecordId="2" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_2"/></td>
    <td><euc:EformTextBox RecordId="2" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_2"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="2" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_2"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="2" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_2"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="2" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_3" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,3" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_3" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,3" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_3" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,3" /></td>
    <td><euc:EformTextBox RecordId="3" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_3"/></td>
    <td><euc:EformTextBox RecordId="3" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_3"/></td>
    <td><euc:EformTextBox RecordId="3" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_3"/></td>
    <td><euc:EformTextBox RecordId="3" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_3"/></td>
    <td><euc:EformTextBox RecordId="3" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_3"/></td>
    <td><euc:EformTextBox RecordId="3" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_3"/></td>
    <td><euc:EformTextBox RecordId="3" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_3"/></td>
    <td><euc:EformTextBox RecordId="3" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_3"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="3" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_3"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="3" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_3"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="3" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_4" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,4" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_4" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,4" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_4" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,4" /></td>
    <td><euc:EformTextBox RecordId="4" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_4"/></td>
    <td><euc:EformTextBox RecordId="4" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_4"/></td>
    <td><euc:EformTextBox RecordId="4" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_4"/></td>
    <td><euc:EformTextBox RecordId="4" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_4"/></td>
    <td><euc:EformTextBox RecordId="4" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_4"/></td>
    <td><euc:EformTextBox RecordId="4" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_4"/></td>
    <td><euc:EformTextBox RecordId="4" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_4"/></td>
    <td><euc:EformTextBox RecordId="4" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_4"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="4" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_4"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="4" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_4"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="4" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_5" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,5" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_5" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,5" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_5" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,5" /></td>
    <td><euc:EformTextBox RecordId="5" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_5"/></td>
    <td><euc:EformTextBox RecordId="5" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_5"/></td>
    <td><euc:EformTextBox RecordId="5" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_5"/></td>
    <td><euc:EformTextBox RecordId="5" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_5"/></td>
    <td><euc:EformTextBox RecordId="5" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_5"/></td>
    <td><euc:EformTextBox RecordId="5" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_5"/></td>
    <td><euc:EformTextBox RecordId="5" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_5"/></td>
    <td><euc:EformTextBox RecordId="5" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_5"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="5" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_5"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="5" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_5"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="5" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_6" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,6" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_6" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,6" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_6" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,6" /></td>
    <td><euc:EformTextBox RecordId="6" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_6"/></td>
    <td><euc:EformTextBox RecordId="6" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_6"/></td>
    <td><euc:EformTextBox RecordId="6" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_6"/></td>
    <td><euc:EformTextBox RecordId="6" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_6"/></td>
    <td><euc:EformTextBox RecordId="6" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_6"/></td>
    <td><euc:EformTextBox RecordId="6" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_6"/></td>
    <td><euc:EformTextBox RecordId="6" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_6"/></td>
    <td><euc:EformTextBox RecordId="6" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_6"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="6" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_6"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="6" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_6"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="6" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_7" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,7" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_7" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,7" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreZone_7" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreZone,7" /></td>
    <td><euc:EformTextBox RecordId="7" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_7"/></td>
    <td><euc:EformTextBox RecordId="7" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_7"/></td>
    <td><euc:EformTextBox RecordId="7" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_7"/></td>
    <td><euc:EformTextBox RecordId="7" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_7"/></td>
    <td><euc:EformTextBox RecordId="7" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_7"/></td>
    <td><euc:EformTextBox RecordId="7" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_7"/></td>
    <td><euc:EformTextBox RecordId="7" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_7"/></td>
    <td><euc:EformTextBox RecordId="7" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_7"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="7" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_7"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="7" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_7"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="7" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_8" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,8" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_8" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,8" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_8" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,8" /></td>
    <td><euc:EformTextBox RecordId="8" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_8"/></td>
    <td><euc:EformTextBox RecordId="8" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_8"/></td>
    <td><euc:EformTextBox RecordId="8" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_8"/></td>
    <td><euc:EformTextBox RecordId="8" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_8"/></td>
    <td><euc:EformTextBox RecordId="8" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_8"/></td>
    <td><euc:EformTextBox RecordId="8" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_8"/></td>
    <td><euc:EformTextBox RecordId="8" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_8"/></td>
    <td><euc:EformTextBox RecordId="8" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_8"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="8" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_8"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="8" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_8"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="8" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_9" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,9" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_9" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,9" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_9" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,9" /></td>
    <td><euc:EformTextBox RecordId="9" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_9"/></td>
    <td><euc:EformTextBox RecordId="9" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_9"/></td>
    <td><euc:EformTextBox RecordId="9" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_9"/></td>
    <td><euc:EformTextBox RecordId="9" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_9"/></td>
    <td><euc:EformTextBox RecordId="9" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_9"/></td>
    <td><euc:EformTextBox RecordId="9" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_9"/></td>
    <td><euc:EformTextBox RecordId="9" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_9"/></td>
    <td><euc:EformTextBox RecordId="9" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_9"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="9" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_9"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="9" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_9"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="9" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_10" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,10" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_10" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,10" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_10" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,10" /></td>
    <td><euc:EformTextBox RecordId="10" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_10"/></td>
    <td><euc:EformTextBox RecordId="10" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_10"/></td>
    <td><euc:EformTextBox RecordId="10" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_10"/></td>
    <td><euc:EformTextBox RecordId="10" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_10"/></td>
    <td><euc:EformTextBox RecordId="10" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_10"/></td>
    <td><euc:EformTextBox RecordId="10" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_10"/></td>
    <td><euc:EformTextBox RecordId="10" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_10"/></td>
    <td><euc:EformTextBox RecordId="10" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_10"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="10" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_10"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="10" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_10"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="10" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_10"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_11" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,11" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_11" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,11" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_11" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,11" /></td>
    <td><euc:EformTextBox RecordId="11" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_11"/></td>
    <td><euc:EformTextBox RecordId="11" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_11"/></td>
    <td><euc:EformTextBox RecordId="11" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_11"/></td>
    <td><euc:EformTextBox RecordId="11" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_11"/></td>
    <td><euc:EformTextBox RecordId="11" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_11"/></td>
    <td><euc:EformTextBox RecordId="11" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_11"/></td>
    <td><euc:EformTextBox RecordId="11" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_11"/></td>
    <td><euc:EformTextBox RecordId="11" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_11"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="11" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_11"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="11" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_11"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="11" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_11"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_12" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,12" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_12" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,12" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_12" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,12" /></td>
    <td><euc:EformTextBox RecordId="12" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_12"/></td>
    <td><euc:EformTextBox RecordId="12" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_12"/></td>
    <td><euc:EformTextBox RecordId="12" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_12"/></td>
    <td><euc:EformTextBox RecordId="12" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_12"/></td>
    <td><euc:EformTextBox RecordId="12" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_12"/></td>
    <td><euc:EformTextBox RecordId="12" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_12"/></td>
    <td><euc:EformTextBox RecordId="12" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_12"/></td>
    <td><euc:EformTextBox RecordId="12" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_12"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="12" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_12"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="12" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_12"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="12" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_12"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_13" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,13" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_13" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,13" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_13" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,13" /></td>
    <td><euc:EformTextBox RecordId="13" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_13"/></td>
    <td><euc:EformTextBox RecordId="13" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_13"/></td>
    <td><euc:EformTextBox RecordId="13" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_13"/></td>
    <td><euc:EformTextBox RecordId="13" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_13"/></td>
    <td><euc:EformTextBox RecordId="13" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_13"/></td>
    <td><euc:EformTextBox RecordId="13" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_13"/></td>
    <td><euc:EformTextBox RecordId="13" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_13"/></td>
    <td><euc:EformTextBox RecordId="13" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_13"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="13" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_13"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="13" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_13"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="13" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_13"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_14" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,14" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_14" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,14" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_14" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,14" /></td>
    <td><euc:EformTextBox RecordId="14" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_14"/></td>
    <td><euc:EformTextBox RecordId="14" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_14"/></td>
    <td><euc:EformTextBox RecordId="14" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_14"/></td>
    <td><euc:EformTextBox RecordId="14" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_14"/></td>
    <td><euc:EformTextBox RecordId="14" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_14"/></td>
    <td><euc:EformTextBox RecordId="14" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_14"/></td>
    <td><euc:EformTextBox RecordId="14" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_14"/></td>
    <td><euc:EformTextBox RecordId="14" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_14"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="14" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_14"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="14" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_14"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="14" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_14"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_15" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,15" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_15" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,15" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreZone_15" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreZone,15" /></td>
    <td><euc:EformTextBox RecordId="15" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_15"/></td>
    <td><euc:EformTextBox RecordId="15" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_15"/></td>
    <td><euc:EformTextBox RecordId="15" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_15"/></td>
    <td><euc:EformTextBox RecordId="15" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_15"/></td>
    <td><euc:EformTextBox RecordId="15" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_15"/></td>
    <td><euc:EformTextBox RecordId="15" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_15"/></td>
    <td><euc:EformTextBox RecordId="15" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_15"/></td>
    <td><euc:EformTextBox RecordId="15" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_15"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="15" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_15"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="15" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_15"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="15" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_15"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr> 
    <td ><euc:EformDefaultLabel ID="PathCoreSide_16" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreSide,16" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLaterality_16" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLaterality,16" /></td>
    <td><euc:EformDefaultLabel ID="PathCoreLevel_16" runat="server" DefaultField="ProstateBiopsyCorePath.PathCoreLevel,16" /></td>
    <td><euc:EformTextBox RecordId="16" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumCores" Runat="server" ID="PathCoreNumCores_16"/></td>
    <td><euc:EformTextBox RecordId="16" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreNumTotalCores" Runat="server" ID="PathCoreNumTotalCores_16"/></td>
    <td><euc:EformTextBox RecordId="16" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG1" Runat="server" ID="PathCoreGG1_16"/></td>
    <td><euc:EformTextBox RecordId="16" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGG2" Runat="server" ID="PathCoreGG2_16"/></td>
    <td><euc:EformTextBox RecordId="16" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreGGS" Runat="server" ID="PathCoreGGS_16"/></td>
    <td><euc:EformTextBox RecordId="16" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCorePercCancer" Runat="server" ID="PathCorePercCancer_16"/></td>
    <td><euc:EformTextBox RecordId="16" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreMaxCancerLength" Runat="server" ID="PathCoreMaxCancerLength_16"/></td>
    <td><euc:EformTextBox RecordId="16" style="width:30px;"  Table="ProstateBiopsyCorePath" Field="PathCoreLength" Runat="server" ID="PathCoreLength_16"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="16" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCorePerineuralInv" Runat="server" ID="PathCorePerineuralInv_16"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="16" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreASAP" Runat="server" ID="PathCoreASAP_16"/></td>
    <td><euc:EformDropDownList style="width: 70px;" RecordId="16" LookupCode="PNI"  Table="ProstateBiopsyCorePath" Field="PathCoreHG_PIN" Runat="server" ID="PathCoreHG_PIN_16"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>    </td>
    <td style="vertical-align: top;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none" class="ProstateBiopsyTableRow"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:70px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_2" RecordId="2"/>
														<euc:EformHidden RecordId="2" Runat="server" ID="PathDate_2" TABLE="Pathology" FIELD="PathDate" />	</td>
   <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:120px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_2"  RecordId="2" /></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="2" ID="PathGG1_2" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="2" ID="PathGG2_2" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="2" ID="PathGGS_2" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_2"  RecordId="2"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformDropDownList LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" Runat="server" ID="PathQuality_2"  RecordId="2"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:120px;" TABLE="Pathology" FIELD="PathNotes" ShowTextEditor="true"  Runat="server" ID="PathNotes_2" RecordId="2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none" class="ProstateBiopsyTableRow"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:70px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_3" RecordId="3"/>
														<euc:EformHidden RecordId="3" Runat="server" ID="PathDate_3" TABLE="Pathology" FIELD="PathDate" />	</td>
   <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:120px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_3"  RecordId="3" /></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="3" ID="PathGG1_3" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="3" ID="PathGG2_3" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="3" ID="PathGGS_3" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_3"  RecordId="3"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformDropDownList LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" Runat="server" ID="PathQuality_3"  RecordId="3" />    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:120px;" TABLE="Pathology" FIELD="PathNotes" ShowTextEditor="true"  Runat="server" ID="PathNotes_3" RecordId="3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none" class="ProstateBiopsyTableRow"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:70px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_4" RecordId="4"/>
	<euc:EformHidden RecordId="4" Runat="server" ID="PathDate_4" TABLE="Pathology" FIELD="PathDate" />	</td>
     <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:120px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_4"  RecordId="4" /></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="4" ID="PathGG1_4" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="4" ID="PathGG2_4" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="4" ID="PathGGS_4" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_4"  RecordId="4"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformDropDownList LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" Runat="server" ID="PathQuality_4"  RecordId="4"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:120px;" TABLE="Pathology" FIELD="PathNotes" ShowTextEditor="true"  Runat="server" ID="PathNotes_4" RecordId="4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" class="ProstateBiopsyTableRow"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:70px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_5" RecordId="5"/>
	<euc:EformHidden RecordId="5" Runat="server" ID="PathDate_5" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:120px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_5"  RecordId="5" /></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="5" ID="PathGG1_5" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="5" ID="PathGG2_5" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="5" ID="PathGGS_5" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_5"  RecordId="5"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformDropDownList LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" Runat="server" ID="PathQuality_5"  RecordId="5"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:120px;" TABLE="Pathology" FIELD="PathNotes" ShowTextEditor="true"  Runat="server" ID="PathNotes_5" RecordId="5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" class="ProstateBiopsyTableRow"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:70px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_6" RecordId="6"/>
	<euc:EformHidden RecordId="6" Runat="server" ID="PathDate_6" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:120px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_6"  RecordId="6" /></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="6" ID="PathGG1_6" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="6" ID="PathGG2_6" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="6" ID="PathGGS_6" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_6"  RecordId="6"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformDropDownList LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" Runat="server" ID="PathQuality_6"  RecordId="6" />    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:120px;" TABLE="Pathology" FIELD="PathNotes" ShowTextEditor="true"  Runat="server" ID="PathNotes_6" RecordId="6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" class="ProstateBiopsyTableRow"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:70px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_7" RecordId="7"/>
	<euc:EformHidden RecordId="7" Runat="server" ID="PathDate_7" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:120px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_7"  RecordId="7" /></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="7" ID="PathGG1_7" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="7" ID="PathGG2_7" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="7" ID="PathGGS_7" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_7"  RecordId="7"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformDropDownList LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" Runat="server" ID="PathQuality_7"  RecordId="7"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:120px;" TABLE="Pathology" FIELD="PathNotes" ShowTextEditor="true"  Runat="server" ID="PathNotes_7" RecordId="7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" class="ProstateBiopsyTableRow"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:70px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_8" RecordId="8"/>
	<euc:EformHidden RecordId="8" Runat="server" ID="PathDate_8" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:120px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_8"  RecordId="8" /></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="8" ID="PathGG1_8" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="8" ID="PathGG2_8" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="8" ID="PathGGS_8" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_8"  RecordId="8"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformDropDownList LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" Runat="server" ID="PathQuality_8"  RecordId="8" />    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:120px;" TABLE="Pathology" FIELD="PathNotes" ShowTextEditor="true"  Runat="server" ID="PathNotes_8" RecordId="8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" class="ProstateBiopsyTableRow"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:70px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_9" RecordId="9"/>
	<euc:EformHidden RecordId="9" Runat="server" ID="PathDate_9" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:120px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_9"  RecordId="9" /></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="9" ID="PathGG1_9" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="9" ID="PathGG2_9" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="9" ID="PathGGS_9" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_9"  RecordId="9"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformDropDownList LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" Runat="server" ID="PathQuality_9"  RecordId="9"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:120px;" TABLE="Pathology" FIELD="PathNotes" ShowTextEditor="true"  Runat="server" ID="PathNotes_9" RecordId="9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" class="ProstateBiopsyTableRow"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:70px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_10" RecordId="10"/>
	<euc:EformHidden RecordId="10" Runat="server" ID="PathDate_10" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:120px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_10"  RecordId="10" /></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="10" ID="PathGG1_10" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="10" ID="PathGG2_10" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="10" ID="PathGGS_10" style="width:30px;" TABLE="ProstateBiopsyPath" FIELD="PathGGS" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_10"  RecordId="10"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformDropDownList LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" Runat="server" ID="PathQuality_10"  RecordId="10" />    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:120px;" TABLE="Pathology" FIELD="PathNotes" ShowTextEditor="true"  Runat="server" ID="PathNotes_10" RecordId="10"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'BiopsiesHtmlTable');" />
<br/><br/>
<br/>
<script type="text/javascript" language="javascript">
	// loading script for gleason calculations
	var calc_1 = function() { calculateBxResult('<%= PathGG1_1.ClientID %>','<%= PathGG2_1.ClientID %>','<%= PathGGS_1.ClientID %>','<%= PathResult_1.ClientID %>'); };
	var calc_2 = function() { calculateBxResult('<%= PathGG1_2.ClientID %>','<%= PathGG2_2.ClientID %>','<%= PathGGS_2.ClientID %>','<%= PathResult_2.ClientID %>'); };
	var calc_3 = function() { calculateBxResult('<%= PathGG1_3.ClientID %>','<%= PathGG2_3.ClientID %>','<%= PathGGS_3.ClientID %>','<%= PathResult_3.ClientID %>'); };
	var calc_4 = function() { calculateBxResult('<%= PathGG1_4.ClientID %>','<%= PathGG2_4.ClientID %>','<%= PathGGS_4.ClientID %>','<%= PathResult_4.ClientID %>'); };
	var calc_5 = function() { calculateBxResult('<%= PathGG1_5.ClientID %>','<%= PathGG2_5.ClientID %>','<%= PathGGS_5.ClientID %>','<%= PathResult_5.ClientID %>'); };
	var calc_6 = function() { calculateBxResult('<%= PathGG1_6.ClientID %>','<%= PathGG2_6.ClientID %>','<%= PathGGS_6.ClientID %>','<%= PathResult_6.ClientID %>'); };
	var calc_7 = function() { calculateBxResult('<%= PathGG1_7.ClientID %>','<%= PathGG2_7.ClientID %>','<%= PathGGS_7.ClientID %>','<%= PathResult_7.ClientID %>'); };
	var calc_8 = function() { calculateBxResult('<%= PathGG1_8.ClientID %>','<%= PathGG2_8.ClientID %>','<%= PathGGS_8.ClientID %>','<%= PathResult_8.ClientID %>'); };
	var calc_9 = function() { calculateBxResult('<%= PathGG1_9.ClientID %>','<%= PathGG2_9.ClientID %>','<%= PathGGS_9.ClientID %>','<%= PathResult_9.ClientID %>'); };
	var calc_10 = function() { calculateBxResult('<%= PathGG1_10.ClientID %>','<%= PathGG2_10.ClientID %>','<%= PathGGS_10.ClientID %>','<%= PathResult_10.ClientID %>'); };
	
	
	var calcCore_1 = function() { calculateBxResult('<%= PathCoreGG1_1.ClientID %>','<%= PathCoreGG2_1.ClientID %>','<%= PathCoreGGS_1.ClientID %>'); };
	var calcCore_2 = function() { calculateBxResult('<%= PathCoreGG1_2.ClientID %>','<%= PathCoreGG2_2.ClientID %>','<%= PathCoreGGS_2.ClientID %>'); };
	var calcCore_3 = function() { calculateBxResult('<%= PathCoreGG1_3.ClientID %>','<%= PathCoreGG2_3.ClientID %>','<%= PathCoreGGS_3.ClientID %>'); };
	var calcCore_4 = function() { calculateBxResult('<%= PathCoreGG1_4.ClientID %>','<%= PathCoreGG2_4.ClientID %>','<%= PathCoreGGS_4.ClientID %>'); };
	var calcCore_5 = function() { calculateBxResult('<%= PathCoreGG1_5.ClientID %>','<%= PathCoreGG2_5.ClientID %>','<%= PathCoreGGS_5.ClientID %>'); };
	var calcCore_6 = function() { calculateBxResult('<%= PathCoreGG1_6.ClientID %>','<%= PathCoreGG2_6.ClientID %>','<%= PathCoreGGS_6.ClientID %>'); };
	var calcCore_7 = function() { calculateBxResult('<%= PathCoreGG1_7.ClientID %>','<%= PathCoreGG2_7.ClientID %>','<%= PathCoreGGS_7.ClientID %>'); };
	var calcCore_8 = function() { calculateBxResult('<%= PathCoreGG1_8.ClientID %>','<%= PathCoreGG2_8.ClientID %>','<%= PathCoreGGS_8.ClientID %>'); };
	var calcCore_9 = function() { calculateBxResult('<%= PathCoreGG1_9.ClientID %>','<%= PathCoreGG2_9.ClientID %>','<%= PathCoreGGS_9.ClientID %>'); };
	var calcCore_10 = function() { calculateBxResult('<%= PathCoreGG1_10.ClientID %>','<%= PathCoreGG2_10.ClientID %>','<%= PathCoreGGS_10.ClientID %>'); };
	var calcCore_11 = function() { calculateBxResult('<%= PathCoreGG1_11.ClientID %>','<%= PathCoreGG2_11.ClientID %>','<%= PathCoreGGS_11.ClientID %>'); };
	var calcCore_12 = function() { calculateBxResult('<%= PathCoreGG1_12.ClientID %>','<%= PathCoreGG2_12.ClientID %>','<%= PathCoreGGS_12.ClientID %>'); };
	var calcCore_13 = function() { calculateBxResult('<%= PathCoreGG1_13.ClientID %>','<%= PathCoreGG2_13.ClientID %>','<%= PathCoreGGS_13.ClientID %>'); };
	var calcCore_14 = function() { calculateBxResult('<%= PathCoreGG1_14.ClientID %>','<%= PathCoreGG2_14.ClientID %>','<%= PathCoreGGS_14.ClientID %>'); };
	var calcCore_15 = function() { calculateBxResult('<%= PathCoreGG1_15.ClientID %>','<%= PathCoreGG2_15.ClientID %>','<%= PathCoreGGS_15.ClientID %>'); };
	var calcCore_16 = function() { calculateBxResult('<%= PathCoreGG1_16.ClientID %>','<%= PathCoreGG2_16.ClientID %>','<%= PathCoreGGS_16.ClientID %>'); };
	
	document.getElementById('<%= PathGG1_1.ClientID %>').onkeyup = calc_1;
	document.getElementById('<%= PathGG2_1.ClientID %>').onkeyup = calc_1;
	document.getElementById('<%= PathGG1_2.ClientID %>').onkeyup = calc_2;
	document.getElementById('<%= PathGG2_2.ClientID %>').onkeyup = calc_2;
	document.getElementById('<%= PathGG1_3.ClientID %>').onkeyup = calc_3;
	document.getElementById('<%= PathGG2_3.ClientID %>').onkeyup = calc_3;
	document.getElementById('<%= PathGG1_4.ClientID %>').onkeyup = calc_4;
	document.getElementById('<%= PathGG2_4.ClientID %>').onkeyup = calc_4;
	document.getElementById('<%= PathGG1_5.ClientID %>').onkeyup = calc_5;
	document.getElementById('<%= PathGG2_5.ClientID %>').onkeyup = calc_5;
	document.getElementById('<%= PathGG1_6.ClientID %>').onkeyup = calc_6;
	document.getElementById('<%= PathGG2_6.ClientID %>').onkeyup = calc_6;
	document.getElementById('<%= PathGG1_7.ClientID %>').onkeyup = calc_7;
	document.getElementById('<%= PathGG2_7.ClientID %>').onkeyup = calc_7;
	document.getElementById('<%= PathGG1_8.ClientID %>').onkeyup = calc_8;
	document.getElementById('<%= PathGG2_8.ClientID %>').onkeyup = calc_8;
	document.getElementById('<%= PathGG1_9.ClientID %>').onkeyup = calc_9;
	document.getElementById('<%= PathGG2_9.ClientID %>').onkeyup = calc_9;
	document.getElementById('<%= PathGG1_10.ClientID %>').onkeyup = calc_10;
	document.getElementById('<%= PathGG2_10.ClientID %>').onkeyup = calc_10;
	document.getElementById('<%= PathCoreGG1_1.ClientID %>').onkeyup = calcCore_1;
	document.getElementById('<%= PathCoreGG2_1.ClientID %>').onkeyup = calcCore_1;
	document.getElementById('<%= PathCoreGG1_2.ClientID %>').onkeyup = calcCore_2;
	document.getElementById('<%= PathCoreGG2_2.ClientID %>').onkeyup = calcCore_2;
	document.getElementById('<%= PathCoreGG1_3.ClientID %>').onkeyup = calcCore_3;
	document.getElementById('<%= PathCoreGG2_3.ClientID %>').onkeyup = calcCore_3;
	document.getElementById('<%= PathCoreGG1_4.ClientID %>').onkeyup = calcCore_4;
	document.getElementById('<%= PathCoreGG2_4.ClientID %>').onkeyup = calcCore_4;
	document.getElementById('<%= PathCoreGG1_5.ClientID %>').onkeyup = calcCore_5;
	document.getElementById('<%= PathCoreGG2_5.ClientID %>').onkeyup = calcCore_5;
	document.getElementById('<%= PathCoreGG1_6.ClientID %>').onkeyup = calcCore_6;
	document.getElementById('<%= PathCoreGG2_6.ClientID %>').onkeyup = calcCore_6;
	document.getElementById('<%= PathCoreGG1_7.ClientID %>').onkeyup = calcCore_7;
	document.getElementById('<%= PathCoreGG2_7.ClientID %>').onkeyup = calcCore_7;
	document.getElementById('<%= PathCoreGG1_8.ClientID %>').onkeyup = calcCore_8;
	document.getElementById('<%= PathCoreGG2_8.ClientID %>').onkeyup = calcCore_8;
	document.getElementById('<%= PathCoreGG1_9.ClientID %>').onkeyup = calcCore_9;
	document.getElementById('<%= PathCoreGG2_9.ClientID %>').onkeyup = calcCore_9;
	document.getElementById('<%= PathCoreGG1_10.ClientID %>').onkeyup = calcCore_10;
	document.getElementById('<%= PathCoreGG2_10.ClientID %>').onkeyup = calcCore_10;
	document.getElementById('<%= PathCoreGG1_11.ClientID %>').onkeyup = calcCore_11;
	document.getElementById('<%= PathCoreGG2_11.ClientID %>').onkeyup = calcCore_11;
	document.getElementById('<%= PathCoreGG1_12.ClientID %>').onkeyup = calcCore_12;
	document.getElementById('<%= PathCoreGG2_12.ClientID %>').onkeyup = calcCore_12;
	document.getElementById('<%= PathCoreGG1_13.ClientID %>').onkeyup = calcCore_13;
	document.getElementById('<%= PathCoreGG2_13.ClientID %>').onkeyup = calcCore_13;
	document.getElementById('<%= PathCoreGG1_14.ClientID %>').onkeyup = calcCore_14;
	document.getElementById('<%= PathCoreGG2_14.ClientID %>').onkeyup = calcCore_14;
	document.getElementById('<%= PathCoreGG1_15.ClientID %>').onkeyup = calcCore_15;
	document.getElementById('<%= PathCoreGG2_15.ClientID %>').onkeyup = calcCore_15;
	document.getElementById('<%= PathCoreGG1_16.ClientID %>').onkeyup = calcCore_16;
	document.getElementById('<%= PathCoreGG2_16.ClientID %>').onkeyup = calcCore_16;

	showHideBasedOnCheckboxToggle($('DiagnosticBiopsyCoresToggleContainer'), $('DiagnosticBiopsy_ProstateHtmlTable'));

</script>