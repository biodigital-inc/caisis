<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PCCTCAdditionalBiopsies" CodeFile="PCCTCAdditionalBiopsies.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.BiopsiesHtmlTable = "BiopsiesHtmlTable";
</script>
<script type="text/javascript">
	function calculateBxResult(primaryGleasonId, secondaryGleasonId, gleasonSumId)
	{
		var ggs = 0;
		var g1 = parseInt(document.getElementById(primaryGleasonId).value);
		var g2 = parseInt(document.getElementById(secondaryGleasonId).value);
	
	
		if (!isNaN(g1) && !isNaN(g2)) {
			ggs = g1 + g2;
		document.getElementById(gleasonSumId).value = ggs;
			
		/*
			if(ggs <2) {
				return;
			} else if(ggs <= 4) {
				resBox.value = "Well"; //should match lookup code values
			} else if(ggs <= 7) {
				resBox.value = "Mod";
			} else if(ggs <= 10) {
				resBox.value = "Poor";
			}
			
		*/
		}
	}
	
	
	var OptionalDiagnosticBxFieldsVisible = false;
	
	function showHideOptionalDiagnosticBxFields()
	{
	    var BiopsiesHtmlTable = $('BiopsiesHtmlTable');
	    var BiopsyTdList = BiopsiesHtmlTable.getElementsByTagName("td");
//	    var showHideOptionalDiagnosticBxFieldsLink = $('showHideOptionalDiagnosticBxFieldsLink');
	    var showHideOptionalDiagnosticBxFieldsImg = $('DxBiopsyMoreLessImg');
	    var newImgSrc = '../../Images/Button_LessFields.png';
	    var newDisplayVal = 'block';
//	    var newLinkText = 'hide optional fields';
	    
	    
	    if(OptionalDiagnosticBxFieldsVisible)
	    {
	        newDisplayVal = 'none';
//	        newLinkText = 'show optional fields';
	        newImgSrc = '../../Images/Button_MoreFields.png';
        }
        
        
	    for (i=0;i<BiopsyTdList.length;i++)
	    {
	        if (BiopsyTdList[i].className != null && BiopsyTdList[i].className.indexOf("optionalDiagnosticBxTd") > -1) BiopsyTdList[i].style.display = newDisplayVal;
	    }
	    
//	    showHideOptionalDiagnosticBxFieldsLink.innerHTML = newLinkText;
	    showHideOptionalDiagnosticBxFieldsImg.src = newImgSrc;
	    OptionalDiagnosticBxFieldsVisible = !OptionalDiagnosticBxFieldsVisible;
	}
	
</script>
<style type="text/css">
.optionalDiagnosticBxTd
{
    display: none;
}
#showHideOptionalDiagnosticBxFieldsLink
{
    margin-left: 300px;
    font-size: 11px;
    margin-bottom: 3px;
    color: #444444;
    text-decoration: underline;
    cursor: pointer;
}
#showHideOptionalDiagnosticBxFieldsLink:hover
{
    color: #8d2a2c;
}
</style>
<a name="PCCTCAdditionalBiopsies" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Additional Biopsies"></asp:Label>
<br/>
<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BiopsiesHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">Histology</td>
    <td class="controlBoxDataGridHeaderFirstCol">G1</td>
	<td class="controlBoxDataGridHeaderFirstCol">G2</td>
    <td class="controlBoxDataGridHeaderFirstCol">G3</td>
	<td class="controlBoxDataGridHeaderFirstCol">G Sum</td>
	<td class="controlBoxDataGridHeaderFirstCol optionalDiagnosticBxTd" style="font-size: 10px;">+ Cores</td>
	<td class="controlBoxDataGridHeaderFirstCol optionalDiagnosticBxTd" style="font-size: 10px;">Total Cores</td>
	<td class="controlBoxDataGridHeaderFirstCol optionalDiagnosticBxTd" style="font-size: 10px;">% Cancer</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="position: relative; overflow: visible;">
        <img id="DxBiopsyMoreLessImg" onclick="showHideOptionalDiagnosticBxFields();" src="../../Images/Button_MoreFields.png" style="cursor: pointer; position: absolute; z-index: 2000; top: -13px; left: -55px;" />
    </td>
  </tr>
  
  
    <asp:Repeater ID="Biopsies" runat="server"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, 'ProcDateText,ProcDate,ProcName,ProcSite,ProcSubsite,PathDateText,PathDate,PathSpecimenType,PathIndication,PathSite,PathSubsite,PathSide,PathResult', 'BiopsiesProstate');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcDateText") %></td>
			 <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcName") %></td>
			 <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
		  <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathGG1") %></td>
		  <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathGG2") %></td>
          <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathGG3") %></td>
		  <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		  <td class="ClinicalEformPopulatedColumn optionalDiagnosticBxTd">&nbsp;</td>
		  <td class="ClinicalEformPopulatedColumn optionalDiagnosticBxTd">&nbsp;</td>
		  <td class="ClinicalEformPopulatedColumn optionalDiagnosticBxTd">&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">
    
    <euc:EformTextBox RecordId="13" Table="Procedures" Field="ProcDateText" ID="ProcDateText_13" runat="server" style="display:none;" />
    <euc:EformTextBox RecordId="13" Table="Procedures" Field="ProcDate" ID="ProcDate_13" Runat="server" style="display:none;" />
    <euc:EformTextBox RecordId="13" Table="Procedures" Field="ProcName" ID="ProcName_13" Runat="server" style="display:none;" />
    
    <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" Table="Pathology" RecordId="13" Field="PathDateText" Runat="server" ID="Path_13_DateText"  AppendToOnChange="setTimeout('copyValuesToProc_13()',500)"  />
    <euc:EformHidden Runat="server" ID="Path_13_Date" Table="Pathology" RecordId="13" Field="PathDate" />
    
    </td>
    <td valign="baseline" style="white-space:nowrap;">
    <euc:EformSelect style="width:140px" DropDownWidth="200" DropDownHeight="auto" LookupCode="BxType" Table="Pathology" Field="PathSpecimenType" Runat="server" ID="PathSpecimenType_13"  RecordId="13" AppendToOnChange="copyValuesToProc_13();" />
    </td>
	<td valign="baseline"><euc:EformComboBox LookupCode="PathHistology" RecordId="13" ID="PathHistology_13" style="width:240px" DropDownWidth="240" Table="Pathology" Field="PathHistology" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="13" ID="PathGG1_13" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="13" ID="PathGG2_13" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG2" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="13" ID="PathGG3_13" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG3" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="13" ID="PathGGS_13" style="width:30px" Table="ProstateBiopsyPath" Field="PathGGS" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="13" ID="PathPosCores_13" style="width:30px" Table="ProstateBiopsyPath" Field="PathPosCores" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="13" ID="PathNumCores_13" style="width:30px" Table="ProstateBiopsyPath" Field="PathNumCores" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="13" ID="PathPercCancer_13" style="width:30px" Table="ProstateBiopsyPath" Field="PathPercCancer" Runat="server"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <!-- Blank Rows -->
  <tr style="display: none;" > 
    <td height="28" class="ClinicalEformGridColumnOne">
    
    <euc:EformTextBox RecordId="14" Table="Procedures" Field="ProcDateText" ID="ProcDateText_14" runat="server" style="display:none;" />
    <euc:EformTextBox RecordId="14" Table="Procedures" Field="ProcDate" ID="ProcDate_14" Runat="server" style="display:none;" />
    <euc:EformTextBox RecordId="14" Table="Procedures" Field="ProcName" ID="ProcName_14" Runat="server" style="display:none;" />
    
    <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" Table="Pathology" RecordId="14" Field="PathDateText" Runat="server" ID="Path_14_DateText"  AppendToOnChange="setTimeout('copyValuesToProc_14()',500)"  />
    <euc:EformHidden Runat="server" ID="Path_14_Date" Table="Pathology" RecordId="14" Field="PathDate" />
    
    </td>
    <td valign="baseline" style="white-space:nowrap;">
    <euc:EformSelect style="width:140px" DropDownWidth="200" DropDownHeight="auto" LookupCode="BxType" Table="Pathology" Field="PathSpecimenType" Runat="server" ID="PathSpecimenType_14"  RecordId="14" AppendToOnChange="copyValuesToProc_14();" />
    </td>
	<td valign="baseline"><euc:EformComboBox LookupCode="PathHistology" RecordId="14" ID="PathHistology_14" style="width:240px" DropDownWidth="240" Table="Pathology" Field="PathHistology" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="14" ID="PathGG1_14" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="14" ID="PathGG2_14" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG2" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="14" ID="PathGG3_14" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG3" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="14" ID="PathGGS_14" style="width:30px" Table="ProstateBiopsyPath" Field="PathGGS" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="14" ID="PathPosCores_14" style="width:30px" Table="ProstateBiopsyPath" Field="PathPosCores" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="14" ID="PathNumCores_14" style="width:30px" Table="ProstateBiopsyPath" Field="PathNumCores" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="14" ID="PathPercCancer_14" style="width:30px" Table="ProstateBiopsyPath" Field="PathPercCancer" Runat="server"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;" > 
    <td height="28" class="ClinicalEformGridColumnOne">
    
    <euc:EformTextBox RecordId="15" Table="Procedures" Field="ProcDateText" ID="ProcDateText_15" runat="server" style="display:none;" />
    <euc:EformTextBox RecordId="15" Table="Procedures" Field="ProcDate" ID="ProcDate_15" Runat="server" style="display:none;" />
    <euc:EformTextBox RecordId="15" Table="Procedures" Field="ProcName" ID="ProcName_15" Runat="server" style="display:none;" />
    
    <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" Table="Pathology" RecordId="15" Field="PathDateText" Runat="server" ID="Path_15_DateText"  AppendToOnChange="setTimeout('copyValuesToProc_15()',500)"  />
    <euc:EformHidden Runat="server" ID="Path_15_Date" Table="Pathology" RecordId="15" Field="PathDate" />
    
    </td>
    <td valign="baseline" style="white-space:nowrap;">
    <euc:EformSelect style="width:140px" DropDownWidth="200" DropDownHeight="auto" LookupCode="BxType" Table="Pathology" Field="PathSpecimenType" Runat="server" ID="PathSpecimenType_15"  RecordId="15" AppendToOnChange="copyValuesToProc_15();" />
    </td>
	<td valign="baseline"><euc:EformComboBox LookupCode="PathHistology" RecordId="15" ID="PathHistology_15" style="width:240px" DropDownWidth="240" Table="Pathology" Field="PathHistology" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="15" ID="PathGG1_15" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="15" ID="PathGG2_15" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG2" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="15" ID="PathGG3_15" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG3" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="15" ID="PathGGS_15" style="width:30px" Table="ProstateBiopsyPath" Field="PathGGS" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="15" ID="PathPosCores_15" style="width:30px" Table="ProstateBiopsyPath" Field="PathPosCores" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="15" ID="PathNumCores_15" style="width:30px" Table="ProstateBiopsyPath" Field="PathNumCores" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="15" ID="PathPercCancer_15" style="width:30px" Table="ProstateBiopsyPath" Field="PathPercCancer" Runat="server"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
    
    <euc:EformTextBox RecordId="16" Table="Procedures" Field="ProcDateText" ID="ProcDateText_16" runat="server" style="display:none;" />
    <euc:EformTextBox RecordId="16" Table="Procedures" Field="ProcDate" ID="ProcDate_16" Runat="server" style="display:none;" />
    <euc:EformTextBox RecordId="16" Table="Procedures" Field="ProcName" ID="ProcName_16" Runat="server" style="display:none;" />
    
    <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" Table="Pathology" RecordId="16" Field="PathDateText" Runat="server" ID="Path_16_DateText"  AppendToOnChange="setTimeout('copyValuesToProc_16()',500)"  />
    <euc:EformHidden Runat="server" ID="Path_16_Date" Table="Pathology" RecordId="16" Field="PathDate" />
    
    </td>
    <td valign="baseline" style="white-space:nowrap;">
    <euc:EformSelect style="width:140px" DropDownWidth="200" DropDownHeight="auto" LookupCode="BxType" Table="Pathology" Field="PathSpecimenType" Runat="server" ID="PathSpecimenType_16"  RecordId="16" AppendToOnChange="copyValuesToProc_16();" />
    </td>
	<td valign="baseline"><euc:EformComboBox LookupCode="PathHistology" RecordId="16" ID="PathHistology_16" style="width:240px" DropDownWidth="240" Table="Pathology" Field="PathHistology" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="16" ID="PathGG1_16" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="16" ID="PathGG2_16" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG2" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="16" ID="PathGG3_16" style="width:30px" Table="ProstateBiopsyPath" Field="PathGG3" Runat="server"/></td>
    <td valign="baseline"><euc:EformTextBox RecordId="16" ID="PathGGS_16" style="width:30px" Table="ProstateBiopsyPath" Field="PathGGS" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="16" ID="PathPosCores_16" style="width:30px" Table="ProstateBiopsyPath" Field="PathPosCores" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="16" ID="PathNumCores_16" style="width:30px" Table="ProstateBiopsyPath" Field="PathNumCores" Runat="server"/></td>
	<td valign="baseline" class="optionalDiagnosticBxTd"><euc:EformTextBox RecordId="16" ID="PathPercCancer_16" style="width:30px" Table="ProstateBiopsyPath" Field="PathPercCancer" Runat="server"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'BiopsiesHtmlTable');" />
<br />
<script type="text/javascript" language="javascript">
	 /* DYNAMIC SCRIPTS */
	
    // add calc events
    (function() {
        var PCCTCAdditionalBiopsiesGleason = [
            ['<%= PathGG1_13.ClientID %>', '<%= PathGG2_13.ClientID %>','<%= PathGGS_13.ClientID %>'],
            ['<%= PathGG1_14.ClientID %>', '<%= PathGG2_14.ClientID %>','<%= PathGGS_14.ClientID %>'],
            ['<%= PathGG1_15.ClientID %>', '<%= PathGG2_15.ClientID %>','<%= PathGGS_15.ClientID %>'],
            ['<%= PathGG1_16.ClientID %>', '<%= PathGG2_16.ClientID %>','<%= PathGGS_16.ClientID %>']
        ];
        for(var i=0;i<PCCTCAdditionalBiopsiesGleason.length;i++) {
            var fieldIds = PCCTCAdditionalBiopsiesGleason[i];
            var gg1 = fieldIds[0];
            var gg2 = fieldIds[1];
            var ggs = fieldIds[2];
            var ab_calc_gleason = function(gg1, gg2, ggs) { calculateBxResult(gg1, gg2, ggs); };
            var calcOnPress = curry(ab_calc_gleason, gg1,gg2,ggs);
            document.getElementById(gg1).onkeyup = calcOnPress;
            document.getElementById(gg2).onkeyup = calcOnPress;
         }
    })();

    // add global copy values script
    (function() {
        var proc = [
            ['<% =PathSpecimenType_13.ClientID %>', '<% =Path_13_DateText.ClientID %>', '<% =Path_13_Date.ClientID %>', '<% =ProcName_13.ClientID %>', '<% =ProcDateText_13.ClientID %>', '<% =ProcDate_13.ClientID %>'],
            ['<% =PathSpecimenType_14.ClientID %>', '<% =Path_14_DateText.ClientID %>', '<% =Path_14_Date.ClientID %>', '<% =ProcName_14.ClientID %>', '<% =ProcDateText_14.ClientID %>', '<% =ProcDate_14.ClientID %>'],
            ['<% =PathSpecimenType_15.ClientID %>', '<% =Path_15_DateText.ClientID %>', '<% =Path_15_Date.ClientID %>', '<% =ProcName_15.ClientID %>', '<% =ProcDateText_15.ClientID %>', '<% =ProcDate_15.ClientID %>'],
            ['<% =PathSpecimenType_16.ClientID %>', '<% =Path_16_DateText.ClientID %>', '<% =Path_16_Date.ClientID %>', '<% =ProcName_16.ClientID %>', '<% =ProcDateText_16.ClientID %>', '<% =ProcDate_16.ClientID %>']
        ];

        for(var i=0, funcIndex = 13;i<proc.length;i++, funcIndex++) {
            var fields = proc[i];
            var pathType = fields[0];
            var pathDateText = fields[1];
            var pathDate = fields[2];
            var procName = fields[3];
            var procDateText = fields[4];
            var procDate = fields[5];
            // dynamically create copy proc function for each row, i.e., copyValuesToProc_13, copyValuesToProc_14, etc...
            var func = curry(copyValuesToProc_Dynaimc, pathType, pathDateText, pathDate, procName, procDateText, procDate);
            var funcName = "copyValuesToProc_" + funcIndex;
            window[funcName] = func;
        }
    })();
	
    function copyValuesToProc_Dynaimc(pathType, pathDateText, pathDate, procName, procDateText, procDate)
	{	    
	    if ($(pathType).value != '')
	    {
	        $(procName).value = $(pathType).value;
	        $(procDateText).value = $(pathDateText).value;
	        $(procDate).value = $(pathDate).value;
	    }
	    else
	    {
	        $(procName).value = '';
	        $(procDateText).value = '';
	        $(procDate).value = '';
	    }
	}
 	
	function setInitialViewOfOptionalDiagnosticBxFields()
    {
        if ($('<% =PathPosCores_13.ClientID %>').value != '' || $('<% =PathNumCores_13.ClientID %>').value != '' || $('<% =PathPercCancer_13.ClientID %>').value != '')
        {
            showHideOptionalDiagnosticBxFields();
        }
    }
	setInitialViewOfOptionalDiagnosticBxFields();
	
</script>
