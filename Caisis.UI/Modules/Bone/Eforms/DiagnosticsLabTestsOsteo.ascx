<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bone.Eforms.DiagnosticsLabTestsOsteo" CodeFile="DiagnosticsLabTestsOsteo.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
	tableArray.DiagnosticsLabTestsOsteoTable = "DiagnosticsLabTestsOsteoTable";
	
	function SetHiddenDate(cbox, dateFieldId, dateId)
    {
       var checkbox = document.getElementById(cbox);
       var date = document.getElementById(dateId);
	    if (checkbox.checked == true)
	    {
		    document.getElementById(dateFieldId).value = date.value;
	    }
	    else
	    {
		    document.getElementById(dateFieldId).value = '';
	    }

    }
    
    function fillAllDatesInColumn(globalDateTextID)
    {
        var globalDate = document.getElementById(globalDateTextID);

        if (globalDate.value != null && globalDate.value != '')
        {
            fillAllWidgetsInColumn('DiagnosticsLabTestsOsteoTable', 1,6, 'textbox', globalDate.value);
            fillAllWidgetsInColumn('DiagnosticsLabTestsOsteoTable', 2,6, 'checkbox', globalDate.value);
        }
    }
    
    function fillAllWidgetsInColumn(tableId, columnNumber, maxNumberOfCellsInRow, control, date) {
     
    if (control == 'checkbox'){
    
        return enterAllDatesInColumn(tableId, columnNumber, maxNumberOfCellsInRow, control, true);
     }   
    else if (control == 'textbox'){
  
        return enterAllDatesInColumn(tableId, columnNumber, maxNumberOfCellsInRow, control, date);
	}
}

function enterAllDatesInColumn(tableId, columnNumber, maxNumberOfCellsInRow, control, dateOrTrue) {

	var range = maxNumberOfCellsInRow - 1 - columnNumber; // what if column # is 0? :)
	var tbl = document.getElementById(tableId);
	for (i = 0; i < tbl.rows.length; i++) {
		var row = tbl.rows[i];
		var offset = row.cells.length - 1 - range; // we are counting from the end
		var cell = row.cells[offset];
		if (cell != null) {

			enterDateInTableCell(cell, control, dateOrTrue);
		}
	}
	return false;
}

function enterDateInTableCell(tableCell, control, dateOrTrue) {
	for (j = 0; j < tableCell.childNodes.length; j++) {
		var node = tableCell.childNodes[j];  

		if (node.nodeName == 'INPUT') {
			var type = node.getAttribute('type');
           
			if ((type == 'radio' || type == 'checkbox') && control == 'checkbox')
			{
				toggleWidget(node, dateOrTrue);
			}
            if (type == 'text' && control == 'textbox'){
            	    insertDate(node, dateOrTrue);
            	     
            }
		}
		 else if (node.nodeName == 'LABEL' || node.nodeName == 'SPAN') {
			for (k = 0; k < node.childNodes.length; k++) {
				var nodek = node.childNodes[k];
				 
		        if (nodek.nodeName == 'INPUT')
		        {
			        var typek = nodek.getAttribute('type');
			        if ((typek == 'radio' || typek == 'checkbox') && control == 'checkbox')
			        {
				        toggleWidget(nodek, dateOrTrue);
			        }
                    if (typek == 'text' && control == 'textbox'){
                    	    insertDate(nodek, dateOrTrue);
                    }
				} else if ((nodek.nodeName == 'LABEL' || nodek.nodeName == 'SPAN') && nodek.getAttribute('style')) {
					for (l = 0; l < nodek.childNodes.length; l++) {
						var nodel = nodek.childNodes[l];
						if (nodel.nodeName == 'INPUT' && nodel.id.indexOf('Other') < 0)
						{
							var typel = nodel.getAttribute('type');
							if ((typel == 'radio' || typel == 'checkbox') && control == 'checkbox')
							{
								toggleWidget(nodel, dateOrTrue);
							}
                            if (typel == 'text'&& control == 'textbox'){
                    	            insertDate(nodel, dateOrTrue);
                            }
						}
					}
				}
			}
		}
	}
}

function toggleWidget(widget, docheck) {
	if (docheck) {
	
	    if (widget.checked == false)
	        widget.checked = true;
	    else
	        widget.checked = false;
	} else {
		widget.checked = false;
	}
}
function insertDate(widget, date) {
	if (widget.value == '')
		widget.value = date;
	else
	    widget.value = '';
}


    
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<a name="DiagnosticsLabTestsOsteo" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Lab Tests"></asp:Label><br/>
<table width="250" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsLabTestsOsteoTable">
	<tr> 
		<td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
		<td width="23%" class="controlBoxDataGridHeaderFirstCol">Test</td>
		<td width="20%" class="controlBoxDataGridHeaderFirstCol">Result</td>
		<td width="8%" class="controlBoxDataGridHeaderFirstCol">Units</td>
		<td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
		<td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	</tr>
	<asp:Repeater ID="OtherLabTests" runat="server" OnItemDataBound="EFormRepeaterOnDataBoundForOther"> 
		<ItemTemplate> 
			<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('LabTests', <%# DataBinder.Eval(Container.DataItem, "LabTestId") %>, 'LabDateText,LabDate,LabTest,LabResult,LabUnits,LabQuality', 'LabTests');"> 
				<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabDateText") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabTest") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabResult") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabUnits") %>&nbsp;</td>
				<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "LabQuality") %>&nbsp;</td>
				<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="OtherLockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
			</tr>      
		</ItemTemplate>
	</asp:Repeater>
	
		<tr> 
		<td width="25%"  style="text-align: left; white-space: nowrap;" ><strong>Global</strong><br />
			    <euc:CaisisTextBox  style="width:80px;"  ID="LabDateText_Global" Runat="server"  ShowCalendar="True" class="InputText"  />
               <img style="display: none;" id="img_fillDates" runat="server" src="../../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" alt=""  />
		</td>
        <td width="10%"  ></td>
		<td width="23%" ></td>
		<td width="20%" ></td>
		<td width="8%" ></td>
		<td width="15%" >&nbsp;</td>
 	</tr>
 
	    
	<tr style="display: none;"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="1"  ID="LabDateText_1" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="1"  ID="LabDate_1"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_1" Value="WBC" RecordId="1" /> WBC: White Blood Count </td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="1"  ID="LabResult_1"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="1"  ID="LabUnits_1"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
   </tr>
   <tr> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="2"  ID="LabDateText_2" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="2"  ID="LabDate_2"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_2" Value="HGB" RecordId="2" /> HGB: Hemoglobin</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="2"  ID="LabResult_2"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="2"  ID="LabUnits_2"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
<tr> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="3"  ID="LabDateText_3" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="3"  ID="LabDate_3"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
       <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_3" Value="PLT" RecordId="3" /> PLT: Platelet count</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="3"  ID="LabResult_3"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="3"  ID="LabUnits_3"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  	<tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="4"  ID="LabDateText_4" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="4"  ID="LabDate_4"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_4" Value="SPEP" RecordId="4" /> SPEP</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="4"  ID="LabResult_4"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="4"  ID="LabUnits_4"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  	<tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="5"  ID="LabDateText_5" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="5"  ID="LabDate_5"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
      <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_5" Value="Total Calcium" RecordId="5" /> Total Calcium </td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="5"  ID="LabResult_5"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="5"  ID="LabUnits_5"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="6"  ID="LabDateText_6" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="6"  ID="LabDate_6"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_6" Value="Ionized Calcium" RecordId="6" /> Ionized Calcium </td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="6"  ID="LabResult_6"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="6"  ID="LabUnits_6"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="7"  ID="LabDateText_7" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="7"  ID="LabDate_7"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_7" Value="Phosphorus" RecordId="7" /> Phosphorus</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="7"  ID="LabResult_7"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="7"  ID="LabUnits_7"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="8"  ID="LabDateText_8" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="8"  ID="LabDate_8"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_8" Value="Mg" RecordId="8" /> Magnesium</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="8"  ID="LabResult_8"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="8"  ID="LabUnits_8"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="9"  ID="LabDateText_9" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="9"  ID="LabDate_9"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_9" Value="PTH" RecordId="9" /> PTH </td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="9"  ID="LabResult_9"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="9"  ID="LabUnits_9"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="10"  ID="LabDateText_10" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="10"  ID="LabDate_10"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_10" Value="TSH" RecordId="10" /> TSH</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="10"  ID="LabResult_10"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="10"  ID="LabUnits_10"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
    <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="11"  ID="LabDateText_11" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="11"  ID="LabDate_11"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_11" Value="25-Hyd Vit D" RecordId="11" /> 25-Hyd Vit D</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="11"  ID="LabResult_11"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="11"  ID="LabUnits_11"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="12"  ID="LabDateText_12" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="12"  ID="LabDate_12"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_12" Value="Urine Calcium" RecordId="12" /> Urine Calcium </td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="12"  ID="LabResult_12"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="12"  ID="LabUnits_12"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="13"  ID="LabDateText_13" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="13"  ID="LabDate_13"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_13" Value="CREAT" RecordId="13" /> Creatinine</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="13"  ID="LabResult_13"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="13"  ID="LabUnits_13"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="14"  ID="LabDateText_14" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="14"  ID="LabDate_14"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_14" Value="BUN" RecordId="14" /> BUN: Blood Urea Nitrogen</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="14"  ID="LabResult_14"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="14"  ID="LabUnits_14"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="15"  ID="LabDateText_15" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="15"  ID="LabDate_15"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_15" Value="TP" RecordId="15" /> Total Protein</td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="15"  ID="LabResult_15"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="15"  ID="LabUnits_15"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="16"  ID="LabDateText_16" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="16"  ID="LabDate_16"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_16" Value="Albumin" RecordId="16" /> Albumin </td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="16"  ID="LabResult_16"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="16"  ID="LabUnits_16"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="17"  ID="LabDateText_17" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="17"  ID="LabDate_17"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_17" Value="Osteocalcin" RecordId="17" /> Osteocalcin </td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="17"  ID="LabResult_17"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="17"  ID="LabUnits_17"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="18"  ID="LabDateText_18" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="18"  ID="LabDate_18"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_18" Value="C-Telopeptide" RecordId="18" /> C-Telopeptide </td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="18"  ID="LabResult_18"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="18"  ID="LabUnits_18"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
  <tr> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="19"  ID="LabDateText_19" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="19"  ID="LabDate_19"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformCheckbox TABLE="LabTests" FIELD="LabTest" Runat="server" ID="LabTest_19" Value="P1NP" RecordId="19" /> P1NP </td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="19"  ID="LabResult_19"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="19"  ID="LabUnits_19"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon  runat="server" /></td>
  </tr>
</table>

<table width="250" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsLabTestsOsteoOtherTable">
	<tr> 
		<td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Other</td>
        <td width="10%" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" ></td>
		<td width="23%" class="controlBoxDataGridHeaderFirstCol"></td>
		<td width="20%" class="controlBoxDataGridHeaderFirstCol"></td>
		<td width="8%" class="controlBoxDataGridHeaderFirstCol"></td>
		<td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
	</tr>
  <tr > 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="20"  ID="LabDateText_20" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="20"  ID="LabDate_20"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="20"  ID="LabTest_20"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="20"  ID="LabResult_20"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="20"  ID="LabUnits_20"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon1"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="21"  ID="LabDateText_21" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="21"  ID="LabDate_21"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="21"  ID="LabTest_21"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="21"  ID="LabResult_21"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="21"  ID="LabUnits_21"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon2"  runat="server" /></td>
  </tr>
   <tr style="DISPLAY: none"> 
        <td height="28" class="ClinicalEformGridColumnOne">
			    <euc:EformTextBox  style="width:80px;"  RecordId="22"  ID="LabDateText_22" TABLE="LabTests" FIELD="LabDateText" Runat="server"   ShowCalendar="True" CalcDate="True" class="InputText"  />
			    <euc:EformTextBox  Width="1px" style="display: none; width:80px;"  RecordId="22"  ID="LabDate_22"     TABLE="LabTests" Field="LabDate"     Runat="server" ></euc:EformTextBox>			</td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox style="width:80px;"  RecordId="22"  ID="LabTest_22"     TABLE="LabTests" Field="LabTest"     LookupCode="LabTest" Runat="server" /></td>
        <td align="center">
                <euc:EformTextBox  style="width:80px;"  RecordId="22"  ID="LabResult_22"   TABLE="LabTests" FIELD="LabResult"   Runat="server" ShowCalendar="False" CalcDate="False" /></td>
        <td style="white-space: nowrap;">
                <euc:EformComboBox   style="width:80px;"  RecordId="22"  ID="LabUnits_22"    TABLE="LabTests" Field="LabUnits"    LookupCode="LabUnits" Runat="server"    /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon3"  runat="server" /></td>
  </tr>
</table>

<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DiagnosticsLabTestsOsteoOtherTable');" />
<br/><br/><br />

<script type="text/javascript">
    //Adds events to controls
    function addEvents(labDateTextGlobal,labDateText,labDate,labTest,labResult,labUnits)
    { 
        $(labTest).addEvent('click',curry(SetHiddenFields1,labDateTextGlobal,labDateText,labDate,labTest,labResult,labUnits));
        $(labTest).addEvent('blur',curry(SetHiddenFields1,labDateTextGlobal,labDateText,labDate,labTest,labResult,labUnits));
        $(labResult).addEvent('blur',curry(SetHiddenFields1,labDateTextGlobal,labDateText,labDate,labTest,labResult,labUnits));
        $(labUnits).addEvent('blur',curry(SetHiddenFields1,labDateTextGlobal,labDateText,labDate,labTest,labResult,labUnits));
    }
 
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_1.ClientID %>'),$('<%= LabDate_1.ClientID %>'),$('<%= LabTest_1.ClientID %>'),$('<%= LabResult_1.ClientID %>'),$('<%= LabUnits_1.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_2.ClientID %>'),$('<%= LabDate_2.ClientID %>'),$('<%= LabTest_2.ClientID %>'),$('<%= LabResult_2.ClientID %>'),$('<%= LabUnits_2.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_3.ClientID %>'),$('<%= LabDate_3.ClientID %>'),$('<%= LabTest_3.ClientID %>'),$('<%= LabResult_3.ClientID %>'),$('<%= LabUnits_3.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_4.ClientID %>'),$('<%= LabDate_4.ClientID %>'),$('<%= LabTest_4.ClientID %>'),$('<%= LabResult_4.ClientID %>'),$('<%= LabUnits_4.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_5.ClientID %>'),$('<%= LabDate_5.ClientID %>'),$('<%= LabTest_5.ClientID %>'),$('<%= LabResult_5.ClientID %>'),$('<%= LabUnits_5.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_6.ClientID %>'),$('<%= LabDate_6.ClientID %>'),$('<%= LabTest_6.ClientID %>'),$('<%= LabResult_6.ClientID %>'),$('<%= LabUnits_6.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_7.ClientID %>'),$('<%= LabDate_7.ClientID %>'),$('<%= LabTest_7.ClientID %>'),$('<%= LabResult_7.ClientID %>'),$('<%= LabUnits_7.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_8.ClientID %>'),$('<%= LabDate_8.ClientID %>'),$('<%= LabTest_8.ClientID %>'),$('<%= LabResult_8.ClientID %>'),$('<%= LabUnits_8.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_9.ClientID %>'),$('<%= LabDate_9.ClientID %>'),$('<%= LabTest_9.ClientID %>'),$('<%= LabResult_9.ClientID %>'),$('<%= LabUnits_9.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_10.ClientID %>'),$('<%= LabDate_10.ClientID %>'),$('<%= LabTest_10.ClientID %>'),$('<%= LabResult_10.ClientID %>'),$('<%= LabUnits_10.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_11.ClientID %>'),$('<%= LabDate_11.ClientID %>'),$('<%= LabTest_11.ClientID %>'),$('<%= LabResult_11.ClientID %>'),$('<%= LabUnits_11.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_12.ClientID %>'),$('<%= LabDate_12.ClientID %>'),$('<%= LabTest_12.ClientID %>'),$('<%= LabResult_12.ClientID %>'),$('<%= LabUnits_12.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_13.ClientID %>'),$('<%= LabDate_13.ClientID %>'),$('<%= LabTest_13.ClientID %>'),$('<%= LabResult_13.ClientID %>'),$('<%= LabUnits_13.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_14.ClientID %>'),$('<%= LabDate_14.ClientID %>'),$('<%= LabTest_14.ClientID %>'),$('<%= LabResult_14.ClientID %>'),$('<%= LabUnits_14.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_15.ClientID %>'),$('<%= LabDate_15.ClientID %>'),$('<%= LabTest_15.ClientID %>'),$('<%= LabResult_15.ClientID %>'),$('<%= LabUnits_15.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_16.ClientID %>'),$('<%= LabDate_16.ClientID %>'),$('<%= LabTest_16.ClientID %>'),$('<%= LabResult_16.ClientID %>'),$('<%= LabUnits_16.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_17.ClientID %>'),$('<%= LabDate_17.ClientID %>'),$('<%= LabTest_17.ClientID %>'),$('<%= LabResult_17.ClientID %>'),$('<%= LabUnits_17.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_18.ClientID %>'),$('<%= LabDate_18.ClientID %>'),$('<%= LabTest_18.ClientID %>'),$('<%= LabResult_18.ClientID %>'),$('<%= LabUnits_18.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_19.ClientID %>'),$('<%= LabDate_19.ClientID %>'),$('<%= LabTest_19.ClientID %>'),$('<%= LabResult_19.ClientID %>'),$('<%= LabUnits_19.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_20.ClientID %>'),$('<%= LabDate_20.ClientID %>'),$('<%= LabTest_20.ClientID %>'),$('<%= LabResult_20.ClientID %>'),$('<%= LabUnits_20.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_21.ClientID %>'),$('<%= LabDate_21.ClientID %>'),$('<%= LabTest_21.ClientID %>'),$('<%= LabResult_21.ClientID %>'),$('<%= LabUnits_21.ClientID %>'));
    addEvents($('<%= LabDateText_Global.ClientID %>'),$('<%= LabDateText_22.ClientID %>'),$('<%= LabDate_22.ClientID %>'),$('<%= LabTest_22.ClientID %>'),$('<%= LabResult_22.ClientID %>'),$('<%= LabUnits_22.ClientID %>'));


    function SetHiddenFields1(labDateTextGlobal,labDateText,labDate,labTest,labResult,labUnits)
    {
         var labTestCheck = labTest.getElementsByTagName('input');

       if (labTest.type == 'checkbox')
       {  
           if (labDateTextGlobal.value != '' && (labTest.checked || labResult.value != '' || labUnits.value != '') )
            {
               labDateText.value = labDateTextGlobal.value;
               labDate.value = labDateTextGlobal.value;
               labTest.checked = true;
            }
        }
        else if (labTest.type = 'text')
        {
            if (labDateTextGlobal.value != '' && (labTest.value != '' || labResult.value != '' || labUnits.value != '') )
            {
               labDateText.value = labDateTextGlobal.value;
               labDate.value = labDateTextGlobal.value;
            }
       
        }
    }


</script>
