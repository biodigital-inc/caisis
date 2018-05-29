<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ChemoAndImmunoTherapy" CodeFile="ChemoAndImmunoTherapy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.MedicalTherapyHtmlTable = "MedicalTherapyHtmlTable";
</script>
<script type="text/javascript">
	// this function is called onclick of the combo box; if implement it requires an outermost if clause so other combos on this page do not trigger it.
	function executePageEventOnComboClick(comboValue, comboClientId)
	{
		// only trigger event if its a Med Agent Combo
		
	/*	this needs to be redone for new combobox - jf
	
	
		if(comboClientId.indexOf('MedTxAgent') > -1)
		{
			var medTxTypeClientId = comboClientId.replace('MedTxAgent', 'MedTxType');
			var medTxType = "";
			
			// go to array and get description based on value
			for(var i=0; i< MedTxAgentOptionsArray.length; i++)
			{
				var myArray = MedTxAgentOptionsArray[i];
				if(myArray[0] == comboValue)
				{
					medTxType = myArray[1];
				}
			}
			document.getElementById(medTxTypeClientId).value = medTxType;
		}
		
	*/
	}
</script>


<div id="MedTxDiv" style="display: <asp:Literal ID="DivDisplay" Runat="server" >block</asp:Literal>;">

<a name="ChemoAndImmunoTherapy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Chemo/Immunotherapy"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicalTherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">&nbsp;Start Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="white-space:nowrap;">Stop Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Agent</td>
     <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Type</td>
     <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Dose</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxType,MedTxAgent,MedTxDose,MedTxUnits,MedTxInstitution,MedTxNotes', 'MedicalTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDose") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxInstitution") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="11"  ID="MedTxDateText_11" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="11" Runat="server" ID="MedTxDate_11" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="11"  ID="MedTxStopDateText_11" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="11" Runat="server" ID="MedTxStopDate_11" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Chemo,True" style="width:140px;" Field="MedTxAgent" RecordId="11" Table="MedicalTherapy" Runat="server" id="MedTxAgent_11"  /></td>
    <td style="white-space:nowrap;"><euc:EformDropDownList  Width="100px" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_11" Runat="server" LookupCode="MedTxType,EForm_Prostate_Chemo,True"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_11"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="11" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_11"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:75px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_11"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="12"  ID="MedTxDateText_12" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="12" Runat="server" ID="MedTxDate_12" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="12"  ID="MedTxStopDateText_12" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="12" Runat="server" ID="MedTxStopDate_12" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Chemo,True"  style="width:140px;" Field="MedTxAgent" RecordId="12" Table="MedicalTherapy" Runat="server" id="MedTxAgent_12"  /></td> 
    <td style="white-space:nowrap;"><euc:EformDropDownList  Width="100px" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_12" Runat="server" LookupCode="MedTxType,EForm_Prostate_Chemo,True"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_12"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="12" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_12"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:75px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_12"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="13"  ID="MedTxDateText_13" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="13" Runat="server" ID="MedTxDate_13" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="13"  ID="MedTxStopDateText_13" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="13" Runat="server" ID="MedTxStopDate_13" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Chemo,True"  style="width:140px;" Field="MedTxAgent" RecordId="13" Table="MedicalTherapy" Runat="server" id="MedTxAgent_13"  /></td>
    <td style="white-space:nowrap;"><euc:EformDropDownList  Width="100px" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_13" Runat="server" LookupCode="MedTxType,EForm_Prostate_Chemo,True"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_13"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="13" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_13"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:75px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_13"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="14"  ID="MedTxDateText_14" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="14" Runat="server" ID="MedTxDate_14" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="14"  ID="MedTxStopDateText_14" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="14" Runat="server" ID="MedTxStopDate_14" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Chemo,True"  style="width:140px;" Field="MedTxAgent" RecordId="14" Table="MedicalTherapy" Runat="server" id="MedTxAgent_14"  /></td>
    <td style="white-space:nowrap;"><euc:EformDropDownList  Width="100px" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_14" Runat="server" LookupCode="MedTxType,EForm_Prostate_Chemo,True"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_14"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="14" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_14"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:75px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_14"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="15"  ID="MedTxDateText_15" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="15" Runat="server" ID="MedTxDate_15" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
	<td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="15"  ID="MedTxStopDateText_15" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="15" Runat="server" ID="MedTxStopDate_15" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
	<td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Chemo,True"  style="width:140px;" Field="MedTxAgent" RecordId="15" Table="MedicalTherapy" Runat="server" id="MedTxAgent_15"  /></td>   
    <td style="white-space:nowrap;"><euc:EformDropDownList  Width="100px" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_15" Runat="server" LookupCode="MedTxType,EForm_Prostate_Chemo,True"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_15"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="15" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_15"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:75px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_15"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="16"  ID="MedTxDateText_16" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="16" Runat="server" ID="MedTxDate_16" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="16"  ID="MedTxStopDateText_16" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="16" Runat="server" ID="MedTxStopDate_16" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Chemo,True"  style="width:140px;" Field="MedTxAgent" RecordId="16" Table="MedicalTherapy" Runat="server" id="MedTxAgent_16"  /></td>
    <td style="white-space:nowrap;"><euc:EformDropDownList  Width="100px" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_16" Runat="server" LookupCode="MedTxType,EForm_Prostate_Chemo,True"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_16"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="16" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_16"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:75px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_16"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="17"  ID="MedTxDateText_17" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="17" Runat="server" ID="MedTxDate_17" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="17"  ID="MedTxStopDateText_17" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="17" Runat="server" ID="MedTxStopDate_17" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Chemo,True"  style="width:140px;" Field="MedTxAgent" RecordId="17" Table="MedicalTherapy" Runat="server" id="MedTxAgent_17"  /></td>
    <td style="white-space:nowrap;"><euc:EformDropDownList  Width="100px" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_17" Runat="server" LookupCode="MedTxType,EForm_Prostate_Chemo,True"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_17"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="17" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_17"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:75px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_17"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="18"  ID="MedTxDateText_18" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="18" Runat="server" ID="MedTxDate_18" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="18"  ID="MedTxStopDateText_18" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="18" Runat="server" ID="MedTxStopDate_18" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Chemo,True"  style="width:140px;" Field="MedTxAgent" RecordId="18" Table="MedicalTherapy" Runat="server" id="MedTxAgent_18"  /></td>
    <td style="white-space:nowrap;"><euc:EformDropDownList  Width="100px" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_18" Runat="server" LookupCode="MedTxType,EForm_Prostate_Chemo,True"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_18"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="18" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_18"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:75px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_18"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="19"  ID="MedTxDateText_19" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="19" Runat="server" ID="MedTxDate_19" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="19"  ID="MedTxStopDateText_19" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="19" Runat="server" ID="MedTxStopDate_19" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Chemo,True"  style="width:140px;" Field="MedTxAgent" RecordId="19" Table="MedicalTherapy" Runat="server" id="MedTxAgent_19"  /></td>
    <td style="white-space:nowrap;"><euc:EformDropDownList  Width="100px" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_19" Runat="server" LookupCode="MedTxType,EForm_Prostate_Chemo,True"  /></td>
	<td style="white-space:nowrap;"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_19"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="19" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_19"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:75px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_19"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="20"  ID="MedTxDateText_20" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="20" Runat="server" ID="MedTxDate_20" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="20"  ID="MedTxStopDateText_20" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="20" Runat="server" ID="MedTxStopDate_20" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Chemo,True"  style="width:140px;" Field="MedTxAgent" RecordId="20" Table="MedicalTherapy" Runat="server" id="MedTxAgent_20"  /></td>
    <td style="white-space:nowrap;"><euc:EformDropDownList  Width="100px" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxType" ID="MedTxType_20" Runat="server" LookupCode="MedTxType,EForm_Prostate_Chemo,True"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_20"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="20" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_20"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:75px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_20"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicalTherapyHtmlTable');" />
<br/><br/>
<br/>
</div>

<asp:Literal ID="ShowDivScript" Runat="server" />