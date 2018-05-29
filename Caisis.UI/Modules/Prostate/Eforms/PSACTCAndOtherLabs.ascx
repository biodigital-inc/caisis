<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PSACTCAndOtherLabs" CodeFile="PSACTCAndOtherLabs.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.PSALabTestsHtmlTable = "PSALabTestsHtmlTable";
	tableArray.OtherLabTestsHtmlTable = "OtherLabTestsHtmlTable";
	
	
function SetGULabView(selectedView,selectedLink)
{
    var GULabViewSelectorLinks = $('GULabViewSelector').getElementsByTagName('a');
    
    for (i = 0; i < GULabViewSelectorLinks.length; i++) {
        GULabViewSelectorLinks[i].className = '';
	}
	selectedLink.className = 'selected';

    $('fishbones').style.display = 'none';
    $('PSA_CTC').style.display = 'none';
    $('TrendView').style.display = 'none';
    $(selectedView).style.display = 'block';
}



var CBCFishboneArray = new Array();

function CBCFishboneRecord(wbc, hgb, hct, plt, na, k, cl, hco3, bun, cr, glu) {
    this.WBC = wbc;
    this.HGB = hgb;
    this.HCT = hct;
    this.PLT = plt;
    this.NA = na;
    this.K = k;
    this.CL = cl;
    this.HCO3 = hco3;
    this.BUN = bun;
    this.CR = cr;
    this.GLU = glu;
}

function registerCBCFishboneRecords()
{
  <asp:Repeater ID="fishboneRpt" runat="server" > 
	<ItemTemplate>
	    CBCFishboneArray[CBCFishboneArray.length++] = new CBCFishboneRecord('<%# DataBinder.Eval(Container.DataItem, "WBC") %>','<%# DataBinder.Eval(Container.DataItem, "HGB") %>','<%# DataBinder.Eval(Container.DataItem, "HCT") %>','<%# DataBinder.Eval(Container.DataItem, "UNVPLT") %>','<%# DataBinder.Eval(Container.DataItem, "NA") %>','<%# DataBinder.Eval(Container.DataItem, "K") %>','<%# DataBinder.Eval(Container.DataItem, "CL") %>','<%# DataBinder.Eval(Container.DataItem, "CO2") %>','<%# DataBinder.Eval(Container.DataItem, "BUN") %>','<%# DataBinder.Eval(Container.DataItem, "CREAT") %>','<%# DataBinder.Eval(Container.DataItem, "GLU") %>');
	</ItemTemplate>
  </asp:Repeater>
}
registerCBCFishboneRecords();


function setFishboneDate(dateSelector)
{
    var arrayIndex = dateSelector.selectedIndex-1;
    
    if (arrayIndex > -1)
    {
        Fishbones_WBC.innerHTML = CBCFishboneArray[arrayIndex].WBC;
        Fishbones_HGB.innerHTML = CBCFishboneArray[arrayIndex].HGB;
        Fishbones_HCT.innerHTML = CBCFishboneArray[arrayIndex].HCT;
        Fishbones_PLT.innerHTML = CBCFishboneArray[arrayIndex].PLT;
        Fishbones_NA.innerHTML = CBCFishboneArray[arrayIndex].NA;
        Fishbones_K.innerHTML = CBCFishboneArray[arrayIndex].K;
        Fishbones_CL.innerHTML = CBCFishboneArray[arrayIndex].CL;
        Fishbones_HCO3.innerHTML = CBCFishboneArray[arrayIndex].HCO3;
        Fishbones_BUN.innerHTML = CBCFishboneArray[arrayIndex].BUN;
        Fishbones_CR.innerHTML = CBCFishboneArray[arrayIndex].CR;
        Fishbones_GLU.innerHTML = CBCFishboneArray[arrayIndex].GLU;
    }
    else
    {
        Fishbones_WBC.innerHTML = '';
        Fishbones_HGB.innerHTML = '';
        Fishbones_HCT.innerHTML = '';
        Fishbones_PLT.innerHTML = '';
        Fishbones_NA.innerHTML = '';
        Fishbones_K.innerHTML = '';
        Fishbones_CL.innerHTML = '';
        Fishbones_HCO3.innerHTML = '';
        Fishbones_BUN.innerHTML = '';
        Fishbones_CR.innerHTML = '';
        Fishbones_GLU.innerHTML = '';
    }
}

function initializeFishbone()
{
    var selector = $('<% = FishboneDateSelector.ClientID %>');
    var lastIndex = selector.options.length - 1
    selector.selectedIndex = lastIndex;
    setFishboneDate(selector);
}


function toggleRecentOnly(labTestTableId, cbox)
{
    var labTestTable = $(labTestTableId);
    
    if (cbox.checked)
    {
        labTestTable.className = 'GULabsEformTable'
    }
    else
    {
        labTestTable.className = 'GULabsEformTableShowAll'
    }

}

function addTrendViewToggleStyles()
{
    var TrendViewTables = $('TrendViewContainer').getElementsByTagName('table');
    var TrendViewTable;
    
    if (TrendViewTables.length > 0)
    {
        TrendViewTable = TrendViewTables[0];
        
        if (TrendViewTable.rows.length > 0)  // check may not be necessary
        {
            var numRows = TrendViewTable.rows.length;
            var numCols = TrendViewTable.rows[0].cells.length;
            
            if (numCols > 11)
            {
                var startOfLastTenCols = numCols - 10;
                
                for (i=0; i < numRows; i++)
                {
                    for (j=1; j < startOfLastTenCols; j++)
                    {
                        TrendViewTable.rows[i].cells[j].className = 'notLastTen';
	                }
	            }
	            
	            TrendViewLastTenToggleContainer.style.display = 'block';
            }
        }
    }
}

function toggleTrendViewLastTen(cbox)
{
    var TrendViewContainer = $('TrendViewContainer');

    if (cbox.checked) { TrendViewContainer.className = ''; }
    else {TrendViewContainer.className = 'showAll';}
}

</script>

<style type="text/css">

#GULabContainer
{
    border: solid 1px #dddddd;
    padding: 14px;
    margin: 0px 0px 40px 0px;
}

.labFishbones
{
    position: relative;
    width: 600px;
    height: 151px;
    background-image: url(../../Images/LabsFishbones_1.gif);
    background-repeat: no-repeat;
    margin: 10px 0px 0px 0px;
}
.labFishboneValue
{
    position: absolute;
    width: 40px;
    font-size: 14px;
    font-weight: bold;
    color: #333333;
    text-align: center;
}
#Fishbones_WBC { top: 62px; left: 2px; }
#Fishbones_HGB { top: 11px; left: 101px; }
#Fishbones_HCT { top: 125px; left: 101px; }
#Fishbones_PLT { top: 62px; left: 186px; }
#Fishbones_NA { top: 25px; left: 286px; }
#Fishbones_K { top: 114px; left: 286px; }
#Fishbones_CL { top: 25px; left: 370px; }
#Fishbones_HCO3 { top: 114px; left: 370px; }
#Fishbones_BUN { top: 25px; left: 449px; }
#Fishbones_CR { top: 114px; left: 449px; }
#Fishbones_GLU { top: 62px; left: 558px; }

#GULabViewSelector
{
    display: inline;

}

#GULabViewSelector a.selected
{
    border: solid 1px #bbbbbb;
    background-color: #e4e4e4;
    color: #111111;
    filter: none; /* for IE */
	background-image: none;
}
#GULabViewSelector a
{
    font-weight: bold;
    font-size: 10px;
    text-decoration: none;
    display: inline-block;
    padding: 2px 7px;
    cursor: pointer;
    background-color: #eeeeee;
    
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f8f8f8', endColorstr='#e2e2e2'); /* for IE */
	background-image: -webkit-gradient(
		linear,
		left top,
		left bottom,
		color-stop(0, #f8f8f8),
		color-stop(1, #e2e2e2)
	);
	background-image: -moz-linear-gradient(
		center top,
		#f8f8f8 0%,
		#e2e2e2 100%
	);
    color: #444444;
    border: 1px solid #cccccc;
    border-radius: 4px;
    text-align: center;
    
    
}
#GULabViewSelector a:hover
{
    color: #111111;
    border: 1px solid #999999;
    border-radius: 4px;
}
.GULabsCheckboxText
{
    font-size: 11px;
    font-weight: normal;
    color: #333333;
}
.GULabsEformTable {
	border: 1px solid #cdd4da;
}
.GULabsEformTableShowAll {
	border: 1px solid #cdd4da;
}
tr.GULabsEformTableRow
{
    display: table-row;
	background-image: url(../../Images/EformPopulatedRowBG.gif);
	background-repeat: repeat-x;
	height: 28px;
	cursor: pointer;
}

tr.GULabsEformTableRow:hover
{
	background-color: #ffffff;
	background-image: url(../../Images/EformHighlightedRowBG.gif);
	background-repeat: repeat-x;
	height: 28px;
	cursor: pointer;
}
table.GULabsEformTable tr.GULabsEformTableRow_NotLastX {
    display: none;
}
table.GULabsEformTable>tr.GULabsEformTableRow_NotLastX>td {
    display: none;
}
table.GULabsEformTableShowAll tr.GULabsEformTableRow_NotLastX {
    display: table-row;
	background-image: url(../../Images/EformPopulatedRowBG.gif);
	background-repeat: repeat-x;
	height: 28px;
	cursor: pointer;
}

table.GULabsEformTableShowAll tr.GULabsEformTableRow_NotLastX:hover
{
	background-color: #ffffff;
	background-image: url(../../Images/EformHighlightedRowBG.gif);
	background-repeat: repeat-x;
	height: 28px;
	cursor: pointer;
}

#TrendView
{
    position: relative;
}

.GULabTestTrendViewTable
{
    border-collapse: collapse;
}
.GULabTestTrendViewTable tbody
{
}
.GULabTestTrendViewTable td,th
{
    border: solid 1px #cccccc;
    padding: 2px;
    font-size: 10px;
    text-align: center;
}
.GULabTestTrendViewHeader
{
    font-size: 12px;
    font-weight: bold;
    color: #111111;
    background-color: #dddddd;
}
.GULabTestTrendViewHeader td,th
{
    font-size: 10px;
    font-weight: bold;
    color: #111111;
    background-color: #dddddd;
}
#TrendViewContainer
{
    margin-top: 10px;
}

#TrendViewContainer td.notLastTen
{
    display: none;
}
#TrendViewContainer th.notLastTen
{
    display: none;
}

#TrendViewContainer.showAll td.notLastTen
{
    display: table-cell;
}
#TrendViewContainer.showAll th.notLastTen
{
    display: table-cell;
}

</style>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="PSACTCAndOtherLabs" />


<span class="controlBoxTitle">Lab Tests</span>

<span style="margin-left: 40px; font-size: 13px; font-weight: bold;">View:</span>
<div id="GULabViewSelector">
    <a onclick="SetGULabView('fishbones',this);" class="selected" >Fishbones</a>
    <a onclick="SetGULabView('TrendView',this);" >Chart &amp; Trend View</a>
    <a onclick="SetGULabView('PSA_CTC',this);" >Enter Lab Results</a>
</div>
<div id="GULabContainer">


<div id="TrendView" style="display: none;">
<iframe runat="server" id="LabChartFrame" src="../../Plugins/PSAGraph/PatientChart.aspx?showHeader=false&height=300&width=590" width="700" height="320" style="border: solid 1px #e8e8e8;" scrolling="no" marginheight="0" marginwidth="0" frameborder="0"></iframe>
<div id="TrendViewContainer">
<span id="TrendViewLastTenToggleContainer" style="font-size: 11px; font-weight: bold; display: none;"><input type="checkbox" checked="checked" value="1" id="TrendViewLastTenToggle" onclick="toggleTrendViewLastTen(this);" />Only show last ten lab test dates in the table below</span>
<asp:GridView ID="TrendViewGridView" runat="server"  CssClass="GULabTestTrendViewTable" HeaderStyle-CssClass="GULabTestTrendViewHeader" ></asp:GridView>
<script type="text/javascript">addTrendViewToggleStyles();</script>
</div>

<div id="TrendViewNoRecordsMsg" runat="server" visible="false" style="font-size: 14px; font-weight: bold; text-align: center; padding: 30px;">No lab tests have been recorded for this patient.</div>
</div>
<div id="fishbones" >
<div id="labFishbonesContainer" runat="server">
<strong>Date:</strong> <euc:CaisisSelect ID="FishboneDateSelector" runat="server" />
    <div id="labFishbones" class="labFishbones">
        <div class="labFishboneValue" id="Fishbones_WBC" ></div>
        <div class="labFishboneValue" id="Fishbones_HGB"  ></div>
        <div class="labFishboneValue" id="Fishbones_HCT" ></div>
        <div class="labFishboneValue" id="Fishbones_PLT" ></div>
        <div class="labFishboneValue" id="Fishbones_NA" ></div>
        <div class="labFishboneValue" id="Fishbones_K"  ></div>
        <div class="labFishboneValue" id="Fishbones_CL"  ></div>
        <div class="labFishboneValue" id="Fishbones_HCO3"  ></div>
        <div class="labFishboneValue" id="Fishbones_BUN"  ></div>
        <div class="labFishboneValue" id="Fishbones_CR" ></div>
        <div class="labFishboneValue" id="Fishbones_GLU"  ></div>
    </div>
    <script type="text/javascript">initializeFishbone();</script>
</div>
<div id="labFishbonesMessage" runat="server" visible="false" style="font-size: 14px; font-weight: bold; text-align: center; padding: 30px;">No lab tests applicable to this view have been recorded for this patient.</div>
</div>

<div id="PSA_CTC" style="display: none;">
<table width="650" cellpadding="0" cellspacing="0">
<tr>
<td valign="top">  
<a name="PSAsAnchor" /><span class="controlBoxTitle" style="font-size: 12px; margin-right: 70px;">PSAs &amp; CTCs</span>
<!-- <euc:CaisisCheckBox ID="PSACTC_RecentOnly" runat="server" Checked="true" Value="true" Text="Only show last 10" CssClass="GULabsCheckboxText" onclick="toggleRecentOnly('PSALabTestsHtmlTable', this);" /> -->
<br/>
<table width="250" cellpadding="3" cellspacing="0" class="GULabsEformTable" id="PSALabTestsHtmlTable">
  <tr> 
    <td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="23%" class="controlBoxDataGridHeaderFirstCol">Marker</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol">Value</td>
    <td width="17%" class="controlBoxDataGridHeaderFirstCol">Quality</td>
    <%--<td width="28%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>--%>
    <td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="PSAs" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="<%# (Container.ItemIndex > (((System.Data.DataView)PSAs.DataSource).Count - 11)) ? "GULabsEformTableRow": "GULabsEformTableRow_NotLastX" %>" onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabTest,LabResult,LabQuality', 'BiochemicalMarkers');"> 
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
	    </tr>
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	
			<euc:EformTextBox Runat="server" RecordId="1"  ID="LabDateText_1" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_1"  />
			<euc:EformHidden RecordId="1" Runat="server" ID="LabDate_1" Table="LabTests" Field="LabDate"/>			</td>
    <td align="center">PSA<euc:EformHidden Value="PSA" Field="LabTest" RecordId="1" Table="LabTests" Runat="server" id="LabTest_1"  /></td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_1" EnableHiddenOnUIEvent="LabTest_1"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="1" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_1" style="width: 40px;" EnableHiddenOnUIEvent="LabTest_1" /></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1" NAME="Eformdeleteicon1"/></td>
  </tr>
    <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	
			<euc:EformTextBox Runat="server" RecordId="2"  ID="LabDateText_2" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_2"/>
			<euc:EformHidden RecordId="2" Runat="server" ID="LabDate_2" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA<euc:EformHidden Value="PSA" Field="LabTest" RecordId="2" Table="LabTests" Runat="server" id="LabTest_2"  /></td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_2" EnableHiddenOnUIEvent="LabTest_2"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="2" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_2" style="width: 40px;" EnableHiddenOnUIEvent="LabTest_2"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon2" NAME="Eformdeleteicon2"/></td>
  </tr>
    <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
	
	
			<euc:EformTextBox Runat="server" RecordId="3"  ID="LabDateText_3" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_3"/>
			<euc:EformHidden RecordId="3" Runat="server" ID="LabDate_3" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA<euc:EformHidden Value="PSA" Field="LabTest" RecordId="3" Table="LabTests" Runat="server" id="LabTest_3"  /></td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_3" EnableHiddenOnUIEvent="LabTest_3"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="3" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_3" style="width: 40px;" EnableHiddenOnUIEvent="LabTest_3"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon3" NAME="Eformdeleteicon3"/></td>
   </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="4"  ID="LabDateText_4" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_4" />
			<euc:EformHidden RecordId="4" Runat="server" ID="LabDate_4" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA<euc:EformHidden Value="PSA" Field="LabTest" RecordId="4" Table="LabTests" Runat="server" id="LabTest_4"  /></td>
    <td align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_4" EnableHiddenOnUIEvent="LabTest_4"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="4" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_4" style="width: 40px;" EnableHiddenOnUIEvent="LabTest_4"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon4" NAME="Eformdeleteicon4"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="5"  ID="LabDateText_5" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_5"  />
			<euc:EformHidden RecordId="5" Runat="server" ID="LabDate_5" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA<euc:EformHidden Value="PSA" Field="LabTest" RecordId="5" Table="LabTests" Runat="server" id="LabTest_5"  /></td>
    <td align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_5" EnableHiddenOnUIEvent="LabTest_5"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="5" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_5" style="width: 40px;" EnableHiddenOnUIEvent="LabTest_5"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon5" NAME="Eformdeleteicon5"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="6"  ID="LabDateText_6" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_6"/>
			<euc:EformHidden RecordId="6" Runat="server" ID="LabDate_6" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA<euc:EformHidden Value="PSA" Field="LabTest" RecordId="6" Table="LabTests" Runat="server" id="LabTest_6"  /></td>
    <td align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_6" EnableHiddenOnUIEvent="LabTest_6"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="6" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_6" style="width: 40px;" EnableHiddenOnUIEvent="LabTest_6"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon6" NAME="Eformdeleteicon6"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="7"  ID="LabDateText_7" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_7" />
			<euc:EformHidden RecordId="7" Runat="server" ID="LabDate_7" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA<euc:EformHidden Value="PSA" Field="LabTest" RecordId="7" Table="LabTests" Runat="server" id="LabTest_7"  /></td>
    <td align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_7" EnableHiddenOnUIEvent="LabTest_7"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="7" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_7" style="width: 40px;" EnableHiddenOnUIEvent="LabTest_7"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon7" NAME="Eformdeleteicon7"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="8"  ID="LabDateText_8" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_8" />
			<euc:EformHidden RecordId="8" Runat="server" ID="LabDate_8" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA<euc:EformHidden Value="PSA" Field="LabTest" RecordId="8" Table="LabTests" Runat="server" id="LabTest_8"  /></td>
    <td align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_8" EnableHiddenOnUIEvent="LabTest_8"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="8" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_8" style="width: 40px;" EnableHiddenOnUIEvent="LabTest_8"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon8" NAME="Eformdeleteicon8"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="9"  ID="LabDateText_9" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_9" />
			<euc:EformHidden RecordId="9" Runat="server" ID="LabDate_9" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA<euc:EformHidden Value="PSA" Field="LabTest" RecordId="9" Table="LabTests" Runat="server" id="LabTest_9"  /></td>
    <td align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_9" EnableHiddenOnUIEvent="LabTest_9"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="9" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_9" style="width: 40px;" EnableHiddenOnUIEvent="LabTest_9"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon9" NAME="Eformdeleteicon9"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="10"  ID="LabDateText_10" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="LabTest_10" />
			<euc:EformHidden RecordId="10" Runat="server" ID="LabDate_10" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td align="center">PSA<euc:EformHidden Value="PSA" Field="LabTest" RecordId="10" Table="LabTests" Runat="server" id="LabTest_10"  /></td>
    <td align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_10" EnableHiddenOnUIEvent="LabTest_10"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="10" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_10" style="width: 40px;" EnableHiddenOnUIEvent="LabTest_10"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon10" NAME="Eformdeleteicon10"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PSALabTestsHtmlTable');" />

</td>
<td width="50">&nbsp;</td>
<td valign="top">
<span class="controlBoxTitle" style="font-size: 12px; margin-right: 70px;">Other Lab Tests</span>
<!-- <euc:CaisisCheckBox ID="OtherLabs_RecentOnly" runat="server" Checked="true" Value="true" Text="Only show last 10" CssClass="GULabsCheckboxText" onclick="toggleRecentOnly('OtherLabTestsHtmlTable', this);" /> -->


<br/>
<table width="250" cellpadding="3" cellspacing="0" class="GULabsEformTable" id="OtherLabTestsHtmlTable">
	<tr> 
		<td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		<td width="23%" class="controlBoxDataGridHeaderFirstCol">Marker</td>
		<td width="20%" class="controlBoxDataGridHeaderFirstCol">Value</td>
		<td width="17%" class="controlBoxDataGridHeaderFirstCol">Quality</td>
		<td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	</tr>
	<asp:Repeater ID="OtherLabTests" runat="server" OnItemDataBound="EFormRepeaterOnDataBoundForOther"> 
		<ItemTemplate> 
			<tr class="<%# (Container.ItemIndex > (((System.Data.DataView)OtherLabTests.DataSource).Count - 11)) ? "GULabsEformTableRow": "GULabsEformTableRow_NotLastX" %>" onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabTest,LabResult,LabQuality', 'BiochemicalMarkers');"> 
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="OtherLockImage" runat="server" title="This record has been locked.">&nbsp;</td>
			</tr>      
		</ItemTemplate>
	</asp:Repeater>
	<tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="11"  ID="LabDateText_11" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="11" Runat="server" ID="LabDate_11" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td style="white-space: nowrap;"><euc:EformComboBox LookupCode="LabTest"   style="width:50px;" Field="LabTest" RecordId="11" Table="LabTests" Runat="server" id="LabTest_11"  /></td>
    <td align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_11"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="11" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_11" style="width: 40px;"/></td>
    <%--<td>&nbsp;</td>--%>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon11" NAME="Eformdeleteicon11"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="12"  ID="LabDateText_12" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="12" Runat="server" ID="LabDate_12" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:50px;" Field="LabTest" RecordId="12" Table="LabTests" Runat="server" id="LabTest_12"  /></td>
    <td align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_12"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="12" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_12" style="width: 40px;"/></td>
    <%--<td>&nbsp;</td>--%>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon12" NAME="Eformdeleteicon12"/></td>
  </tr>
  <tr> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="13"  ID="LabDateText_13" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="13" Runat="server" ID="LabDate_13" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:50px;" Field="LabTest" RecordId="13" Table="LabTests" Runat="server" id="LabTest_13"  /></td>
    <td align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_13"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="13" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_13" style="width: 40px;"/></td>
    <%--<td>&nbsp;</td>--%>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon13" NAME="Eformdeleteicon13"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="14"  ID="LabDateText_14" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="14" Runat="server" ID="LabDate_14" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:50px;" Field="LabTest" RecordId="14" Table="LabTests" Runat="server" id="LabTest_14"  /></td>
    <td align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_14"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="14" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_14" style="width: 40px;"/></td>
    <%--<td>&nbsp;</td>--%>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon14" NAME="Eformdeleteicon14"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="15"  ID="LabDateText_15" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="15" Runat="server" ID="LabDate_15" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:50px;" Field="LabTest" RecordId="15" Table="LabTests" Runat="server" id="LabTest_15"  /></td>
    <td align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_15"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="15" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_15" style="width: 40px;"/></td>
    <%--<td>&nbsp;</td>--%>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon15" NAME="Eformdeleteicon15"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="16"  ID="LabDateText_16" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="16" Runat="server" ID="LabDate_16" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:50px;" Field="LabTest" RecordId="16" Table="LabTests" Runat="server" id="LabTest_16"  /></td>
    <td align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_16"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="16" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_16" style="width: 40px;"/></td>
    <%--<td>&nbsp;</td>--%>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon16" NAME="Eformdeleteicon16"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="17"  ID="LabDateText_17" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="17" Runat="server" ID="LabDate_17" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:50px;" Field="LabTest" RecordId="17" Table="LabTests" Runat="server" id="LabTest_17"  /></td>
    <td align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_17"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="17" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_17" style="width: 40px;"/></td>
    <%--<td>&nbsp;</td>--%>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon17" NAME="Eformdeleteicon17"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="18"  ID="LabDateText_18" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="18" Runat="server" ID="LabDate_18" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:50px;" Field="LabTest" RecordId="18" Table="LabTests" Runat="server" id="LabTest_18"  /></td>
    <td align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_18"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="18" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_18" style="width: 40px;"/></td>
    <%--<td>&nbsp;</td>--%>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon18" NAME="Eformdeleteicon18"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="19"  ID="LabDateText_19" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="19" Runat="server" ID="LabDate_19" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:50px;" Field="LabTest" RecordId="19" Table="LabTests" Runat="server" id="LabTest_19"  /></td>
    <td align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_19"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="19" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_19" style="width: 40px;"/></td>
    <%--<td>&nbsp;</td>--%>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon19" NAME="Eformdeleteicon19"/></td>
  </tr>
  <tr style="display: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">
			<euc:EformTextBox Runat="server" RecordId="20"  ID="LabDateText_20" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
			<euc:EformHidden RecordId="20" Runat="server" ID="LabDate_20" Table="LabTests" Field="LabDate"></euc:EformHidden>			</td>
    <td style="white-space: nowrap;" valign="baseline"><euc:EformComboBox LookupCode="LabTest"    style="width:50px;" Field="LabTest" RecordId="20" Table="LabTests" Runat="server" id="LabTest_20"  /></td>
    <td align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_20"/></td>
    <td style="white-space: nowrap;"><euc:EformSelect RecordId="20" LookupCode="DataQuality" TABLE="LabTests" FIELD="LabQuality" Runat="server" ID="LabQuality_20" style="width: 40px;"/></td>
    <%--<td>&nbsp;</td>--%>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon20" NAME="Eformdeleteicon20"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OtherLabTestsHtmlTable');" />
</td>
</tr>
</table>
</div>


</div>
