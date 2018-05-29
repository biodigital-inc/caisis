<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsiesProstate" CodeFile="BiopsiesProstate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.BiopsiesHtmlTable = "BiopsiesHtmlTable";
</script>
<script>
	function calculateBxResult(primaryGleasonId, secondaryGleasonId, resultId)
	{
		var ggs = 0;
		var g1 = parseInt(document.getElementById(primaryGleasonId).value);
		var g2 = parseInt(document.getElementById(secondaryGleasonId).value);
		
		if (!isNaN(g1) && !isNaN(g2)) {
			var resBox = document.getElementById(resultId);
			
			ggs = g1 + g2;
			
			if(ggs <2) {
				return;
			} else if(ggs <= 4) {
				resBox.value = "Well"; //should match lookup code values
			} else if(ggs <= 7) {
				resBox.value = "Mod";
			} else if(ggs <= 10) {
				resBox.value = "Poor";
			}
		}
	}
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="BiopsiesProstate" /><span class="controlBoxTitle">Biopsies</span> <strong>for Watchful Waiting Patients </strong><br/>
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BiopsiesHtmlTable">
  <tr> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="26%" class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td width="7%" class="controlBoxDataGridHeaderFirstCol">G1</td>
	<td width="7%" class="controlBoxDataGridHeaderFirstCol">G2</td>
    <td width="15%" class="controlBoxDataGridHeaderFirstCol">Result</td>
    <td width="24%" class="controlBoxDataGridHeaderFirstCol">PIN</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">ASAP</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Comments</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
    <asp:Repeater ID="Biopsies" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, 'PathDateText,PathDate,PathSpecimentType,PathIndication,PathSite,PathSubsite,PathSide,PathResult', 'BiopsiesProstate');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcDateText") %></td>
			 <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcName") %></td>
		  <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathGG1") %></td>
		  <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathGG2") %></td>
		  <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<asp:Literal ID="ResultField" Runat="server" /></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathHG_PIN") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathASAP") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr > 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="Path_1DateText" RecordId="1"/>
														<euc:EformHidden RecordId="1" Runat="server" ID="Path_1Date" TABLE="Pathology" FIELD="PathDate" />	</td>
    <td valign="baseline" style="white-space:nowrap;">
    <euc:EformSelect style="width:90px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_1"  RecordId="1" EnableHiddenOnUIEvent="PathInstitution_1,PathQuality_1"/>
    <euc:EformHidden RecordId="1" Runat="server" ID="PathInstitution_1" TABLE="Pathology" FIELD="PathInstitution" Value="Memorial Sloan Kettering Cancer Center" />
    <euc:EformHidden RecordId="1" Runat="server" ID="PathQuality_1" TABLE="Pathology" FIELD="PathQuality" Value="STD" />
    </td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="1" ID="PathGG1_1" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="1" ID="PathGG2_1" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_1"  RecordId="1"/>    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="PIN" TABLE="ProstateBiopsyPath" FIELD="PathHG_PIN" Runat="server" ID="PathHG_PIN_1"  RecordId="1" ParentRecordId="1"/>    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="ASAP" TABLE="ProstateBiopsyPath" FIELD="PathASAP" Runat="server" ID="PathASAP_1"  RecordId="1" ParentRecordId="1"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:80px;" TABLE="Pathology" FIELD="PathNotes" Runat="server" ID="PathNotes_1" RecordId="1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_2" RecordId="2"/>
														<euc:EformHidden RecordId="2" Runat="server" ID="PathDate_2" TABLE="Pathology" FIELD="PathDate" />	</td>
   <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:90px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_2"  RecordId="2" EnableHiddenOnUIEvent="PathInstitution_2,PathQuality_2"/>
    <euc:EformHidden RecordId="2" Runat="server" ID="PathInstitution_2" TABLE="Pathology" FIELD="PathInstitution" Value="Memorial Sloan Kettering Cancer Center" />
    <euc:EformHidden RecordId="2" Runat="server" ID="PathQuality_2" TABLE="Pathology" FIELD="PathQuality" Value="STD" />
    </td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="2" ID="PathGG1_2" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="2" ID="PathGG2_2" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_2"  RecordId="2"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="PIN" TABLE="ProstateBiopsyPath" FIELD="PathHG_PIN" Runat="server" ID="PathHG_PIN_2"  RecordId="1" ParentRecordId="2"/>    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="ASAP" TABLE="ProstateBiopsyPath" FIELD="PathASAP" Runat="server" ID="PathASAP_2"  RecordId="1" ParentRecordId="2"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:80px;" TABLE="Pathology" FIELD="PathNotes" Runat="server" ID="PathNotes_2" RecordId="2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_3" RecordId="3"/>
														<euc:EformHidden RecordId="3" Runat="server" ID="PathDate_3" TABLE="Pathology" FIELD="PathDate" />	</td>
   <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:90px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_3"  RecordId="3" EnableHiddenOnUIEvent="PathInstitution_3,PathQuality_3"/>
    <euc:EformHidden RecordId="3" Runat="server" ID="PathInstitution_3" TABLE="Pathology" FIELD="PathInstitution" Value="Memorial Sloan Kettering Cancer Center" />
    <euc:EformHidden RecordId="3" Runat="server" ID="PathQuality_3" TABLE="Pathology" FIELD="PathQuality" Value="STD" />
    </td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="3" ID="PathGG1_3" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="3" ID="PathGG2_3" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_3"  RecordId="3"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="PIN" TABLE="ProstateBiopsyPath" FIELD="PathHG_PIN" Runat="server" ID="PathHG_PIN_3"  RecordId="1" ParentRecordId="3"/>    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="ASAP" TABLE="ProstateBiopsyPath" FIELD="PathASAP" Runat="server" ID="PathASAP_3"  RecordId="1" ParentRecordId="3"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:80px;" TABLE="Pathology" FIELD="PathNotes" Runat="server" ID="PathNotes_3" RecordId="3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_4" RecordId="4"/>
	<euc:EformHidden RecordId="4" Runat="server" ID="PathDate_4" TABLE="Pathology" FIELD="PathDate" />	</td>
     <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:90px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_4"  RecordId="4" EnableHiddenOnUIEvent="PathInstitution_4,PathQuality_4"/>
    <euc:EformHidden RecordId="4" Runat="server" ID="PathInstitution_4" TABLE="Pathology" FIELD="PathInstitution" Value="Memorial Sloan Kettering Cancer Center" />
    <euc:EformHidden RecordId="4" Runat="server" ID="PathQuality_4" TABLE="Pathology" FIELD="PathQuality" Value="STD" />
    </td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="4" ID="PathGG1_4" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="4" ID="PathGG2_4" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_4"  RecordId="4"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="PIN" TABLE="ProstateBiopsyPath" FIELD="PathHG_PIN" Runat="server" ID="PathHG_PIN_4"  RecordId="1" ParentRecordId="4"/>    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="ASAP" TABLE="ProstateBiopsyPath" FIELD="PathASAP" Runat="server" ID="PathASAP_4"  RecordId="1" ParentRecordId="4"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:80px;" TABLE="Pathology" FIELD="PathNotes" Runat="server" ID="PathNotes_4" RecordId="4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_5" RecordId="5"/>
	<euc:EformHidden RecordId="5" Runat="server" ID="PathDate_5" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:90px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_5"  RecordId="5" EnableHiddenOnUIEvent="PathInstitution_5,PathQuality_5"/>
    <euc:EformHidden RecordId="5" Runat="server" ID="PathInstitution_5" TABLE="Pathology" FIELD="PathInstitution" Value="Memorial Sloan Kettering Cancer Center" />
    <euc:EformHidden RecordId="5" Runat="server" ID="PathQuality_5" TABLE="Pathology" FIELD="PathQuality" Value="STD" />
    </td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="5" ID="PathGG1_5" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="5" ID="PathGG2_5" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_5"  RecordId="5"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="PIN" TABLE="ProstateBiopsyPath" FIELD="PathHG_PIN" Runat="server" ID="PathHG_PIN_5"  RecordId="1" ParentRecordId="5"/>    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="ASAP" TABLE="ProstateBiopsyPath" FIELD="PathASAP" Runat="server" ID="PathASAP_5"  RecordId="1" ParentRecordId="5"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:80px;" TABLE="Pathology" FIELD="PathNotes" Runat="server" ID="PathNotes_5" RecordId="5"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_6" RecordId="6"/>
	<euc:EformHidden RecordId="6" Runat="server" ID="PathDate_6" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:90px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_6"  RecordId="6" EnableHiddenOnUIEvent="PathInstitution_6,PathQuality_6"/>
    <euc:EformHidden RecordId="6" Runat="server" ID="PathInstitution_6" TABLE="Pathology" FIELD="PathInstitution" Value="Memorial Sloan Kettering Cancer Center" />
    <euc:EformHidden RecordId="6" Runat="server" ID="PathQuality_6" TABLE="Pathology" FIELD="PathQuality" Value="STD" />
     </td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="6" ID="PathGG1_6" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="6" ID="PathGG2_6" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_6"  RecordId="6"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="PIN" TABLE="ProstateBiopsyPath" FIELD="PathHG_PIN" Runat="server" ID="PathHG_PIN_6"  RecordId="1" ParentRecordId="6"/>    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="ASAP" TABLE="ProstateBiopsyPath" FIELD="PathASAP" Runat="server" ID="PathASAP_6"  RecordId="1" ParentRecordId="6"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:80px;" TABLE="Pathology" FIELD="PathNotes" Runat="server" ID="PathNotes_6" RecordId="6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_7" RecordId="7"/>
	<euc:EformHidden RecordId="7" Runat="server" ID="PathDate_7" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:90px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_7"  RecordId="7" EnableHiddenOnUIEvent="PathInstitution_7,PathQuality_7"/>
    <euc:EformHidden RecordId="7" Runat="server" ID="PathInstitution_7" TABLE="Pathology" FIELD="PathInstitution" Value="Memorial Sloan Kettering Cancer Center" />
    <euc:EformHidden RecordId="7" Runat="server" ID="PathQuality_7" TABLE="Pathology" FIELD="PathQuality" Value="STD" />
    </td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="7" ID="PathGG1_7" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="7" ID="PathGG2_7" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_7"  RecordId="7"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="PIN" TABLE="ProstateBiopsyPath" FIELD="PathHG_PIN" Runat="server" ID="PathHG_PIN_7"  RecordId="1" ParentRecordId="7"/>    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="ASAP" TABLE="ProstateBiopsyPath" FIELD="PathASAP" Runat="server" ID="PathASAP_7"  RecordId="1" ParentRecordId="7"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:80px;" TABLE="Pathology" FIELD="PathNotes" Runat="server" ID="PathNotes_7" RecordId="7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_8" RecordId="8"/>
	<euc:EformHidden RecordId="8" Runat="server" ID="PathDate_8" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:90px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_8"  RecordId="8" EnableHiddenOnUIEvent="PathInstitution_8,PathQuality_8"/>
    <euc:EformHidden RecordId="8" Runat="server" ID="PathInstitution_8" TABLE="Pathology" FIELD="PathInstitution" Value="Memorial Sloan Kettering Cancer Center" />
    <euc:EformHidden RecordId="8" Runat="server" ID="PathQuality_8" TABLE="Pathology" FIELD="PathQuality" Value="STD" />
    </td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="8" ID="PathGG1_8" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="8" ID="PathGG2_8" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_8"  RecordId="8"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="PIN" TABLE="ProstateBiopsyPath" FIELD="PathHG_PIN" Runat="server" ID="PathHG_PIN_8"  RecordId="1" ParentRecordId="8"/>    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="ASAP" TABLE="ProstateBiopsyPath" FIELD="PathASAP" Runat="server" ID="PathASAP_8"  RecordId="1" ParentRecordId="8"/>    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:80px;" TABLE="Pathology" FIELD="PathNotes" Runat="server" ID="PathNotes_8" RecordId="8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_9" RecordId="9"/>
	<euc:EformHidden RecordId="9" Runat="server" ID="PathDate_9" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:90px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_9"  RecordId="9" EnableHiddenOnUIEvent="PathInstitution_9,PathQuality_9"/>
    <euc:EformHidden RecordId="9" Runat="server" ID="PathInstitution_9" TABLE="Pathology" FIELD="PathInstitution" Value="Memorial Sloan Kettering Cancer Center" />
    <euc:EformHidden RecordId="9" Runat="server" ID="PathQuality_9" TABLE="Pathology" FIELD="PathQuality" Value="STD" />
      </td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="9" ID="PathGG1_9" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="9" ID="PathGG2_9" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_9"  RecordId="9"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="PIN" TABLE="ProstateBiopsyPath" FIELD="PathHG_PIN" Runat="server" ID="PathHG_PIN_9"  RecordId="1" ParentRecordId="9"/>
    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="ASAP" TABLE="ProstateBiopsyPath" FIELD="PathASAP" Runat="server" ID="PathASAP_9"  RecordId="1" ParentRecordId="9"/>
    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:80px;" TABLE="Pathology" FIELD="PathNotes" Runat="server" ID="PathNotes_9" RecordId="9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none"> 
    <td height="28" class="ClinicalEformGridColumnOne">	<euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:80px;" TABLE="Pathology" FIELD="PathDateText" Runat="server" ID="PathDateText_10" RecordId="10"/>
	<euc:EformHidden RecordId="10" Runat="server" ID="PathDate_10" TABLE="Pathology" FIELD="PathDate" />	</td>
	 <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:90px" LookupCode="BxType" TABLE="Pathology" FIELD="PathSpecimenType" Runat="server" ID="PathSpecimenType_10"  RecordId="10" EnableHiddenOnUIEvent="PathInstitution_10,PathQuality_10"/>
    <euc:EformHidden RecordId="10" Runat="server" ID="PathInstitution_10" TABLE="Pathology" FIELD="PathInstitution" Value="Memorial Sloan Kettering Cancer Center" />
    <euc:EformHidden RecordId="10" Runat="server" ID="PathQuality_10" TABLE="Pathology" FIELD="PathQuality" Value="STD" />
    </td>
    <td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="10" ID="PathGG1_10" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG1" Runat="server"/></td>
	<td valign="baseline"><euc:EformTextBox RecordId="1" ParentRecordId="10" ID="PathGG2_10" style="width:30" TABLE="ProstateBiopsyPath" FIELD="PathGG2" Runat="server"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:60px;" LookupCode="ResultProstate" TABLE="Pathology" FIELD="PathResult" Runat="server" ID="PathResult_10"  RecordId="10"/></td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="PIN" TABLE="ProstateBiopsyPath" FIELD="PathHG_PIN" Runat="server" ID="PathHG_PIN_10"  RecordId="1" ParentRecordId="10"/>
    </td>
    <td style="white-space:nowrap;" valign="baseline"><euc:EformSelect style="width:70" LookupCode="ASAP" TABLE="ProstateBiopsyPath" FIELD="PathASAP" Runat="server" ID="PathASAP_10"  RecordId="1" ParentRecordId="10"/>
    </td>
    <td align="center" valign="baseline"><euc:EformTextBox ShowCalendar="false" CalcDate="false" style="width:80px;" TABLE="Pathology" FIELD="PathNotes" Runat="server" ID="PathNotes_10" RecordId="10"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'BiopsiesHtmlTable');" />
<br/><br/>
<br/>
<script type="text/javascript" language="javascript">
	// loading script for gleason calculations
	var calc_1 = function() { calculateBxResult('<%= PathGG1_1.ClientID %>','<%= PathGG2_1.ClientID %>','<%= PathResult_1.ClientID %>'); };
	var calc_2 = function() { calculateBxResult('<%= PathGG1_2.ClientID %>','<%= PathGG2_2.ClientID %>','<%= PathResult_2.ClientID %>'); };
	var calc_3 = function() { calculateBxResult('<%= PathGG1_3.ClientID %>','<%= PathGG2_3.ClientID %>','<%= PathResult_3.ClientID %>'); };
	var calc_4 = function() { calculateBxResult('<%= PathGG1_4.ClientID %>','<%= PathGG2_4.ClientID %>','<%= PathResult_4.ClientID %>'); };
	var calc_5 = function() { calculateBxResult('<%= PathGG1_5.ClientID %>','<%= PathGG2_5.ClientID %>','<%= PathResult_5.ClientID %>'); };
	var calc_6 = function() { calculateBxResult('<%= PathGG1_6.ClientID %>','<%= PathGG2_6.ClientID %>','<%= PathResult_6.ClientID %>'); };
	var calc_7 = function() { calculateBxResult('<%= PathGG1_7.ClientID %>','<%= PathGG2_7.ClientID %>','<%= PathResult_7.ClientID %>'); };
	var calc_8 = function() { calculateBxResult('<%= PathGG1_8.ClientID %>','<%= PathGG2_8.ClientID %>','<%= PathResult_8.ClientID %>'); };
	var calc_9 = function() { calculateBxResult('<%= PathGG1_9.ClientID %>','<%= PathGG2_9.ClientID %>','<%= PathResult_9.ClientID %>'); };
	var calc_10 = function() { calculateBxResult('<%= PathGG1_10.ClientID %>','<%= PathGG2_10.ClientID %>','<%= PathResult_10.ClientID %>'); };
	
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
</script>
