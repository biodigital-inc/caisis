<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.HormoneTherapy_ProstateNP" CodeFile="HormoneTherapy_ProstateNP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
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

<a name="HormoneTherapy_ProstateNP" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Hormone Therapy"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicalTherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">&nbsp;Start Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="white-space:nowrap;">Stop Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Agent</td>
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
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDose") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxInstitution") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxDateText_1" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="1" Runat="server" ID="MedTxDate_1" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxStopDateText_1" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="1" Runat="server" ID="MedTxStopDate_1" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Hormone,True" style="width:140px;" Field="MedTxAgent" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxAgent_1"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_1"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_1"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:150px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_1"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxDateText_2" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="2" Runat="server" ID="MedTxDate_2" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxStopDateText_2" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="2" Runat="server" ID="MedTxStopDate_2" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Hormone,True"  style="width:140px;" Field="MedTxAgent" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxAgent_2"  /></td> 
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_2"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_2"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:150px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_2"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxDateText_3" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="3" Runat="server" ID="MedTxDate_3" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxStopDateText_3" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="3" Runat="server" ID="MedTxStopDate_3" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Hormone,True"  style="width:140px;" Field="MedTxAgent" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxAgent_3"  /></td>
    
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_3"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_3"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:150px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_3"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxDateText_4" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="4" Runat="server" ID="MedTxDate_4" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxStopDateText_4" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="4" Runat="server" ID="MedTxStopDate_4" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Hormone,True"  style="width:140px;" Field="MedTxAgent" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxAgent_4"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_4"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_4"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:150px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_4"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxDateText_5" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="5" Runat="server" ID="MedTxDate_5" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
	<td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxStopDateText_5" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="5" Runat="server" ID="MedTxStopDate_5" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
	<td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Hormone,True"  style="width:140px;" Field="MedTxAgent" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxAgent_5"  /></td>   
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_5"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_5"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:150px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_5"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="6"  ID="MedTxDateText_6" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="6" Runat="server" ID="MedTxDate_6" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="6"  ID="MedTxStopDateText_6" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="6" Runat="server" ID="MedTxStopDate_6" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Hormone,True"  style="width:140px;" Field="MedTxAgent" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxAgent_6"  /></td>
   
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_6"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_6"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:150px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_6"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="7"  ID="MedTxDateText_7" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="7" Runat="server" ID="MedTxDate_7" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="7"  ID="MedTxStopDateText_7" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="7" Runat="server" ID="MedTxStopDate_7" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Hormone,True"  style="width:140px;" Field="MedTxAgent" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxAgent_7"  /></td>
    
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_7"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_7"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:150px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_7"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="8"  ID="MedTxDateText_8" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="8" Runat="server" ID="MedTxDate_8" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="8"  ID="MedTxStopDateText_8" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="8" Runat="server" ID="MedTxStopDate_8" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Hormone,True"  style="width:140px;" Field="MedTxAgent" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxAgent_8"  /></td>
    
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_8"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_8"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:150px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_8"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="9"  ID="MedTxDateText_9" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="9" Runat="server" ID="MedTxDate_9" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="9"  ID="MedTxStopDateText_9" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="9" Runat="server" ID="MedTxStopDate_9" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Hormone,True"  style="width:140px;" Field="MedTxAgent" RecordId="9" Table="MedicalTherapy" Runat="server" id="MedTxAgent_9"  /></td>
	<td style="white-space:nowrap;"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_9"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="9" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_9"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:150px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_9"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="display: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="10"  ID="MedTxDateText_10" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="10" Runat="server" ID="MedTxDate_10" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="10"  ID="MedTxStopDateText_10" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="10" Runat="server" ID="MedTxStopDate_10" Table="MedicalTherapy" Field="MedTxStopDate" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent,EForm_Prostate_Hormone,True"  style="width:140px;" Field="MedTxAgent" RecordId="10" Table="MedicalTherapy" Runat="server" id="MedTxAgent_10"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_10"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="300"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="10" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_10"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:150px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" ShowTextEditor="true"  Runat="server" ID="MedTxNotes_10"/></td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicalTherapyHtmlTable');" />
<br/><br/>
<br/>
</div>

<asp:Literal ID="ShowDivScript" Runat="server" />