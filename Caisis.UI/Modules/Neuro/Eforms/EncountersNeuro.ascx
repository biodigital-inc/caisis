<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.EncountersNeuro" CodeFile="EncountersNeuro.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.NeuroEncountersTable = "NeuroEncountersTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="EncountersNeuro" /><span class="controlBoxTitle">Encounters</span> <br/>
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevNeuroEncountersTable">
                <tr id="NoNeuroEncMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="10" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Encounters were recorded for this patient.
                    </td>
                </tr>
            </table>
            
            <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 150px; width:780; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="770" cellpadding="1" cellspacing="0" class="ClinicalEformTable" id="NeuroEncRptTable">
              <asp:Repeater ID="NeuroEncountersRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                <HeaderTemplate>
                  <tr runat="server" id="PrevNeuroEncRptHdr">
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">KPS</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Height</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Weight</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">BSA</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">BMI</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data<br />Qlty</td>
		            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                 </tr>
                </HeaderTemplate>
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Encounters', <%# DataBinder.Eval(Container.DataItem, "EncounterId") %>, 'EncPending,EncDateText,EncDate,EncType,EncPhysician,EncKPS,EncHeight,EncWeight,EncBSA,EncBMI,EncQuality', 'Encounters');"> 
		                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncPending").ToString() == "1" ? "Yes" : "No" %></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncDateText")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncType")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncPhysician")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncKPS")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncHeight")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncWeight")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncBSA")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncBMI")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("EncQuality")%>&nbsp;</td>
			            <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
              </table></div><br /><br />
              
  <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="NeuroEncountersTable">
    <tr runat="server" id="NeuroEncHdr">
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">KPS</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Height</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Weight</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">BSA</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">BMI</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data<br />Qlty</td>
        <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><euc:EformCheckBox RecordId="1" TABLE="Encounters" FIELD="EncPending" Runat="server" 
        ID="EncPending_1" Value="1" /></td>
	 <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" 
	    FIELD="EncDateText" Runat="server" ID="EncDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_1"/>
	    </td>
    <td align="center"><euc:EformDropDownList RecordId="1" Width="50px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_1" 
        LookupCode="EncType,Disease,Neuro"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" TABLE="Encounters" FIELD="EncPhysician" Runat="server" 
        ID="EncPhysician_1" Width="90px" LookupCode="ApptPhysician, Disease, Neuro"/></td>
	<td align="center"><euc:EformTextBox RecordId="1" Width="50px" ShowNumberPad="True" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="EncKPS_1"/></td>
	<td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="1" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height_1" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="1" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight_1" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="1" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA_1" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="1" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI_1" ReadOnly="true"/></td>
	<td align="center"><euc:EformDropDownList RecordId="1" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_1" 
	    LookupCode="DataQuality"/></td>
	<td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="DISPLAY: none">
     <td align="center"><euc:EformCheckBox RecordId="2" TABLE="Encounters" FIELD="EncPending" Runat="server" 
        ID="EncPending_2" Value="1" /></td>
	 <td><euc:EformTextBox RecordId="2" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" FIELD="EncDateText" 
	    Runat="server" ID="EncDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_2"/>
	    </td>
    <td><euc:EformDropDownList RecordId="2" Width="50px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_2" 
        LookupCode="EncType,Disease,Neuro"/></td>
    <td><euc:EformComboBox RecordId="2" TABLE="Encounters" FIELD="EncPhysician" Runat="server" ID="EncPhysician_2" 
        Width="90px" LookupCode="ApptPhysician, Disease, Neuro"/></td>
	<td align="center"><euc:EformTextBox RecordId="2" Width="50px" ShowNumberPad="True" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="EncKPS_2"/></td>
	<td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="2" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height_2" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="2" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight_2" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="2" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA_2" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="2" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI_2" ReadOnly="true"/></td>
	<td align="center"><euc:EformDropDownList RecordId="2" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_2" 
	    LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="3" TABLE="Encounters" FIELD="EncPending" Runat="server" 
        ID="EncPending_3" Value="1" /></td>
	 <td><euc:EformTextBox RecordId="3" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" FIELD="EncDateText" 
	    Runat="server" ID="EncDateText_3"/>
		    <euc:EformHidden RecordId="3" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_3"/>
	    </td>
    <td><euc:EformDropDownList RecordId="3" Width="50px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_3" 
        LookupCode="EncType,Disease,Neuro"/></td>
    <td><euc:EformComboBox RecordId="3" TABLE="Encounters" FIELD="EncPhysician" Runat="server" ID="EncPhysician_3" 
        Width="90px" LookupCode="ApptPhysician, Disease, Neuro"/></td>
	<td align="center"><euc:EformTextBox RecordId="3" Width="50px" ShowNumberPad="True" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="EncKPS_3"/></td>
	<td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="3" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height_3" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="3" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight_3" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="3" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA_3" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="3" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI_3" ReadOnly="true"/></td>
	<td align="center"><euc:EformDropDownList RecordId="3" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_3" 
	    LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="4" TABLE="Encounters" FIELD="EncPending" Runat="server" 
        ID="EncPending_4" Value="1" /></td>
	 <td><euc:EformTextBox RecordId="4" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" 
	    FIELD="EncDateText" Runat="server" ID="EncDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_4"/>
	    </td>
    <td><euc:EformDropDownList RecordId="4" Width="50px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_4" 
        LookupCode="EncType,Disease,Neuro"/></td>
    <td><euc:EformComboBox RecordId="4" TABLE="Encounters" FIELD="EncPhysician" Runat="server" ID="EncPhysician_4" 
        Width="90px"
         LookupCode="ApptPhysician, Disease, Neuro"/></td>
	<td align="center"><euc:EformTextBox RecordId="4" Width="50px" ShowNumberPad="True" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="EncKPS_4"/></td>
	<td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="4" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height_4" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="4" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight_4" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="4" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA_4" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="4" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI_4" ReadOnly="true"/></td>
	<td align="center"><euc:EformDropDownList RecordId="4" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_4" 
	    LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="5" TABLE="Encounters" FIELD="EncPending" Runat="server" 
        ID="EncPending_5" Value="1" /></td>
	 <td><euc:EformTextBox RecordId="5" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" FIELD="EncDateText" 
	    Runat="server" ID="EncDateText_5"/>
		    <euc:EformHidden RecordId="5" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_5"/>
	    </td>
    <td><euc:EformDropDownList RecordId="5" Width="50px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_5" 
        LookupCode="EncType,Disease,Neuro"/></td>
    <td><euc:EformComboBox RecordId="5" TABLE="Encounters" FIELD="EncPhysician" Runat="server" ID="EncPhysician_5" 
        Width="90px" LookupCode="ApptPhysician, Disease, Neuro"/></td>
	<td align="center"><euc:EformTextBox RecordId="5" Width="50px" ShowNumberPad="True" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="EncKPS_5"/></td>
	<td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="5" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height_5" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="5" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight_5" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="5" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA_5" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="5" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI_5" ReadOnly="true"/></td>
	<td align="center"><euc:EformDropDownList RecordId="5" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_5" 
	    LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="6" TABLE="Encounters" FIELD="EncPending" Runat="server" 
        ID="EncPending_6" Value="1" /></td>
	 <td><euc:EformTextBox RecordId="6" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" FIELD="EncDateText" 
	    Runat="server" ID="EncDateText_6"/>
		    <euc:EformHidden RecordId="6" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_6"/>
	    </td>
    <td><euc:EformDropDownList RecordId="6" Width="50px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_6" 
        LookupCode="EncType,Disease,Neuro"/></td>
    <td><euc:EformComboBox RecordId="6" TABLE="Encounters" FIELD="EncPhysician" Runat="server" ID="EncPhysician_6" 
        Width="90px" LookupCode="ApptPhysician, Disease, Neuro"/></td>
	<td align="center"><euc:EformTextBox RecordId="6" Width="50px" ShowNumberPad="True" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="EncKPS_6"/></td>
	<td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="6" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height_6" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="6" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight_6" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="6" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA_6" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="6" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI_6" ReadOnly="true"/></td>
	<td align="center"><euc:EformDropDownList RecordId="6" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_6" 
	    LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="7" TABLE="Encounters" FIELD="EncPending" Runat="server" 
        ID="EncPending_7" Value="1" /></td>
	 <td><euc:EformTextBox RecordId="7" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" FIELD="EncDateText" 
	    Runat="server" ID="EncDateText_7"/>
		    <euc:EformHidden RecordId="7" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_7"/>
	    </td>
    <td><euc:EformDropDownList RecordId="7" Width="50px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_7" 
        LookupCode="EncType,Disease,Neuro"/></td>
    <td><euc:EformComboBox RecordId="7" TABLE="Encounters" FIELD="EncPhysician" Runat="server" ID="EncPhysician_7" 
        Width="90px" LookupCode="ApptPhysician, Disease, Neuro"/></td>
	<td align="center"><euc:EformTextBox RecordId="7" Width="50px" ShowNumberPad="True" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="EncKPS_7"/></td>
	<td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="7" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height_7" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="7" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight_7" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="7" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA_7" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="7" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI_7" ReadOnly="true"/></td>
	<td align="center"><euc:EformDropDownList RecordId="7" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_7" 
	    LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="8" TABLE="Encounters" FIELD="EncPending" Runat="server" 
        ID="EncPending_8" Value="1" /></td>
	 <td><euc:EformTextBox RecordId="8" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" FIELD="EncDateText" 
	    Runat="server" ID="EncDateText_8"/>
		    <euc:EformHidden RecordId="8" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_8"/>
	    </td>
    <td><euc:EformDropDownList RecordId="8" Width="50px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_8" 
        LookupCode="EncType,Disease,Neuro"/></td>
    <td><euc:EformComboBox RecordId="8" TABLE="Encounters" FIELD="EncPhysician" Runat="server" ID="EncPhysician_8" 
        Width="90px" LookupCode="ApptPhysician, Disease, Neuro"/></td>
	<td align="center"><euc:EformTextBox RecordId="8" Width="50px" ShowNumberPad="True" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="EncKPS_8"/></td>
	<td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="8" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height_8" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="8" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight_8" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="8" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA_8" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="8" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI_8" ReadOnly="true"/></td>
	<td align="center"><euc:EformDropDownList RecordId="8" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_8" 
	    LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="9" TABLE="Encounters" FIELD="EncPending" Runat="server" 
        ID="EncPending_9" Value="1" /></td>
	 <td><euc:EformTextBox RecordId="9" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" FIELD="EncDateText" 
	    Runat="server" ID="EncDateText_9"/>
		    <euc:EformHidden RecordId="9" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_9"/>
	    </td>
    <td><euc:EformDropDownList RecordId="9" Width="50px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_9" 
        LookupCode="EncType,Disease,Neuro"/></td>
    <td><euc:EformComboBox RecordId="9" TABLE="Encounters" FIELD="EncPhysician" Runat="server" ID="EncPhysician_9" 
        Width="90px" LookupCode="ApptPhysician, Disease, Neuro"/></td>
	<td align="center"><euc:EformTextBox RecordId="9" Width="50px" ShowNumberPad="True" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="EncKPS_9"/></td>
	<td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="9" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height_9" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="9" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight_9" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="9" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA_9" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="9" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI_9" ReadOnly="true"/></td>
	<td align="center"><euc:EformDropDownList RecordId="9" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_9" 
	    LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="10" TABLE="Encounters" FIELD="EncPending" Runat="server" 
        ID="EncPending_10" Value="1" /></td>
	 <td><euc:EformTextBox RecordId="10" ShowCalendar="True" CalcDate="True" Width="80px" TABLE="Encounters" FIELD="EncDateText" 
	    Runat="server" ID="EncDateText_10"/>
		    <euc:EformHidden RecordId="10" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_10"/>
	    </td>
    <td><euc:EformDropDownList RecordId="10" Width="50px" TABLE="Encounters" FIELD="EncType" Runat="server" ID="EncType_10" 
        LookupCode="EncType,Disease,Neuro"/></td>
    <td><euc:EformComboBox RecordId="10" TABLE="Encounters" FIELD="EncPhysician" Runat="server" ID="EncPhysician_10" 
        Width="90px" LookupCode="ApptPhysician, Disease, Neuro"/></td>
	<td align="center"><euc:EformTextBox RecordId="10" Width="50px" ShowNumberPad="True" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="EncKPS_10"/></td>
	<td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="10" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height_10" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="10" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight_10" ShowNumberPad="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="10" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA_10" ReadOnly="true"/></td>
    <td align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:50px;" RecordId="10" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI_10" ReadOnly="true"/></td>
	<td align="center"><euc:EformDropDownList RecordId="10" TABLE="Encounters" FIELD="EncQuality" Runat="server" ID="EncQuality_10" 
	    LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'NeuroEncountersTable');" /><br />
        </td>
    </tr>
 </table><br /><br />