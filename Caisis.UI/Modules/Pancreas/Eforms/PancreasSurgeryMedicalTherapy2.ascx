<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryMedicalTherapy2" CodeFile="PancreasSurgeryMedicalTherapy2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.MedicalTherapyHtmlTable = "MedicalTherapyHtmlTable";
</script>




<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PancreasSurgeryMedicalTherapy2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>



<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle">Adjuvant Therapies ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="AdjuvantTxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="AdjuvantTxRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="AdjuvantTxAbsentDiv" runat="server" style="display: none;" >
    <br /><br />
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="AbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_7"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="7" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_7"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table></div>
            
<div id="AdjuvantTxDiv" runat="server" style="display: none;">
    <br /><br />
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicalTherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">&nbsp;Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridTitleColumn">Agent</td>
     <td style="white-space:nowrap;" class="controlBoxDataGridTitleColumn">Type</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridTitleColumn">Dose</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridTitleColumn">Institution</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridTitleColumn">Notes</td>
    <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridTitleColumn">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxType,MedTxAgent,MedTxDose,MedTxUnits,MedTxInstitution,MedTxNotes', 'PancreasSurgeryMedicalTherapy2');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDose") %>&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxUnits") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxInstitution") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="11"  ID="MedTxDateText_11" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="11" Runat="server" ID="MedTxDate_11" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="MedTxAgent,Disease,@DiseaseView" style="width:140;" Field="MedTxAgent" RecordId="11" Table="MedicalTherapy" Runat="server" id="MedTxAgent_11"  /></td>
    <td style="white-space:nowrap;"><euc:EformDropDownList RecordId="11" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_11" style="width: 65px;"/></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_11"/>&nbsp;<euc:EformComboBox RecordId="11" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_11" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="11" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_11"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" ID="MedTxNotes_11"/>
</td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="12"  ID="MedTxDateText_12" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="12" Runat="server" ID="MedTxDate_12" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="MedTxAgent,Disease,@DiseaseView"  style="width:140;" Field="MedTxAgent" RecordId="12" Table="MedicalTherapy" Runat="server" id="MedTxAgent_12"  /></td> 
    <td style="white-space:nowrap;"><euc:EformDropDownList RecordId="12" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_12" style="width: 65px;"/></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_12"/>&nbsp;<euc:EformComboBox RecordId="12" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_12" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="12" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_12"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" ID="MedTxNotes_12"/>
</td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="13"  ID="MedTxDateText_13" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="13" Runat="server" ID="MedTxDate_13" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="MedTxAgent,Disease,@DiseaseView"  style="width:140;" Field="MedTxAgent" RecordId="13" Table="MedicalTherapy" Runat="server" id="MedTxAgent_13"  /></td>
    
    <td style="white-space:nowrap;"><euc:EformDropDownList RecordId="13" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_13" style="width: 65px;"/></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_13"/>&nbsp;<euc:EformComboBox RecordId="13" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_13" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="13" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_13"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" ID="MedTxNotes_13"/>
</td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="14"  ID="MedTxDateText_14" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="14" Runat="server" ID="MedTxDate_14" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="MedTxAgent,Disease,@DiseaseView"  style="width:140;" Field="MedTxAgent" RecordId="14" Table="MedicalTherapy" Runat="server" id="MedTxAgent_14"  /></td>
    <td style="white-space:nowrap;"><euc:EformDropDownList RecordId="14" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_14" style="width: 65px;"/></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_14"/>&nbsp;<euc:EformComboBox RecordId="14" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_14" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="14" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_14"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" ID="MedTxNotes_14"/>
</td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="15"  ID="MedTxDateText_15" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="15" Runat="server" ID="MedTxDate_15" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
	<td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="MedTxAgent,Disease,@DiseaseView"  style="width:140;" Field="MedTxAgent" RecordId="15" Table="MedicalTherapy" Runat="server" id="MedTxAgent_15"  /></td>   
    <td style="white-space:nowrap;"><euc:EformDropDownList RecordId="15" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_15" style="width: 65px;"/></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_15"/>&nbsp;<euc:EformComboBox RecordId="15" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_15" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="15" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_15"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" ID="MedTxNotes_15"/>
</td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="16"  ID="MedTxDateText_16" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="16" Runat="server" ID="MedTxDate_16" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="MedTxAgent,Disease,@DiseaseView"  style="width:140;" Field="MedTxAgent" RecordId="16" Table="MedicalTherapy" Runat="server" id="MedTxAgent_16"  /></td>
   
    <td style="white-space:nowrap;"><euc:EformDropDownList RecordId="16" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_16" style="width: 65px;"/></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_16"/>&nbsp;<euc:EformComboBox RecordId="16" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_16" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="16" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_16"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" ID="MedTxNotes_16"/>
</td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="17"  ID="MedTxDateText_17" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="17" Runat="server" ID="MedTxDate_17" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="MedTxAgent,Disease,@DiseaseView"  style="width:140;" Field="MedTxAgent" RecordId="17" Table="MedicalTherapy" Runat="server" id="MedTxAgent_17"  /></td>
    
    <td style="white-space:nowrap;"><euc:EformDropDownList RecordId="17" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_17" style="width: 65px;"/></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_17"/>&nbsp;<euc:EformComboBox RecordId="17" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_17" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="17" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_17"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" ID="MedTxNotes_17"/>
</td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="18"  ID="MedTxDateText_18" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="18" Runat="server" ID="MedTxDate_18" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="MedTxAgent,Disease,@DiseaseView"  style="width:140;" Field="MedTxAgent" RecordId="18" Table="MedicalTherapy" Runat="server" id="MedTxAgent_18"  /></td>
    
    <td style="white-space:nowrap;"><euc:EformDropDownList RecordId="18" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_18" style="width: 65px;"/></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_18"/>&nbsp;<euc:EformComboBox RecordId="18" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_18" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Institution,PercentUsage,Top180"  style="width:80px;" Field="MedTxInstitution" RecordId="18" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_18"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" ID="MedTxNotes_18"/>
</td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="19"  ID="MedTxDateText_19" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="19" Runat="server" ID="MedTxDate_19" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="MedTxAgent,Disease,@DiseaseView"  style="width:140;" Field="MedTxAgent" RecordId="19" Table="MedicalTherapy" Runat="server" id="MedTxAgent_19"  /></td>
	<td style="white-space:nowrap;"><euc:EformDropDownList RecordId="19" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_19" style="width: 65px;"/></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_19"/>&nbsp;<euc:EformComboBox RecordId="19" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_19" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="19" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_19"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" ID="MedTxNotes_19"/>
</td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="20"  ID="MedTxDateText_20" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="20" Runat="server" ID="MedTxDate_20" Table="MedicalTherapy" Field="MedTxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="MedTxAgent,Disease,@DiseaseView"  style="width:140;" Field="MedTxAgent" RecordId="20" Table="MedicalTherapy" Runat="server" id="MedTxAgent_20"  /></td>
    <td style="white-space:nowrap;"><euc:EformDropDownList RecordId="20" LookupCode="MedTxType" TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_20" style="width: 65px;"/></td>
    <td style="white-space:nowrap;"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_20"/>&nbsp;<euc:EformComboBox RecordId="20" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_20" style="width: 55px;"/></td>
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="Institution,PercentUsage,Top80"  style="width:80px;" Field="MedTxInstitution" RecordId="20" Table="MedicalTherapy" Runat="server" id="MedTxInstitution_20"  /></td>
    <td style="white-space:nowrap;" align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="MedicalTherapy" FIELD="MedTxNotes" Runat="server" ID="MedTxNotes_20"/>
</td>
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicalTherapyHtmlTable');" />

</div>
<br/><br/><br/>
<table>
    <tr id="AdjuvantTxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="TableName" ID="TableName_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="FieldName" ID="FieldName_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_7"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>





<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= AdjuvantTxRecorded.ClientID %>'),$('<%= AdjuvantTxDiv.ClientID %>'),$('<%= AdjuvantTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_11.ClientID %>'),$('<%= MedTxDate_11.ClientID %>'),$('<%= MedTxAgent_11.ClientID %>'),$('<%= MedTxType_11.ClientID %>'),$('<%= MedTxDose_11.ClientID %>'),$('<%= MedTxUnits_11.ClientID %>'),$('<%= MedTxInstitution_11.ClientID %>'),$('<%= MedTxNotes_11.ClientID %>'));
    addAbsentEvent($('<%= AdjuvantTxRecorded.ClientID %>'),$('<%= AdjuvantTxDiv.ClientID %>'),$('<%= AdjuvantTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_12.ClientID %>'),$('<%= MedTxDate_12.ClientID %>'),$('<%= MedTxAgent_12.ClientID %>'),$('<%= MedTxType_12.ClientID %>'),$('<%= MedTxDose_12.ClientID %>'),$('<%= MedTxUnits_12.ClientID %>'),$('<%= MedTxInstitution_12.ClientID %>'),$('<%= MedTxNotes_12.ClientID %>'));
    addAbsentEvent($('<%= AdjuvantTxRecorded.ClientID %>'),$('<%= AdjuvantTxDiv.ClientID %>'),$('<%= AdjuvantTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_13.ClientID %>'),$('<%= MedTxDate_13.ClientID %>'),$('<%= MedTxAgent_13.ClientID %>'),$('<%= MedTxType_13.ClientID %>'),$('<%= MedTxDose_13.ClientID %>'),$('<%= MedTxUnits_13.ClientID %>'),$('<%= MedTxInstitution_13.ClientID %>'),$('<%= MedTxNotes_13.ClientID %>'));
    addAbsentEvent($('<%= AdjuvantTxRecorded.ClientID %>'),$('<%= AdjuvantTxDiv.ClientID %>'),$('<%= AdjuvantTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_14.ClientID %>'),$('<%= MedTxDate_14.ClientID %>'),$('<%= MedTxAgent_14.ClientID %>'),$('<%= MedTxType_14.ClientID %>'),$('<%= MedTxDose_14.ClientID %>'),$('<%= MedTxUnits_14.ClientID %>'),$('<%= MedTxInstitution_14.ClientID %>'),$('<%= MedTxNotes_14.ClientID %>'));
    addAbsentEvent($('<%= AdjuvantTxRecorded.ClientID %>'),$('<%= AdjuvantTxDiv.ClientID %>'),$('<%= AdjuvantTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_15.ClientID %>'),$('<%= MedTxDate_15.ClientID %>'),$('<%= MedTxAgent_15.ClientID %>'),$('<%= MedTxType_15.ClientID %>'),$('<%= MedTxDose_15.ClientID %>'),$('<%= MedTxUnits_15.ClientID %>'),$('<%= MedTxInstitution_15.ClientID %>'),$('<%= MedTxNotes_15.ClientID %>'));
    addAbsentEvent($('<%= AdjuvantTxRecorded.ClientID %>'),$('<%= AdjuvantTxDiv.ClientID %>'),$('<%= AdjuvantTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_16.ClientID %>'),$('<%= MedTxDate_16.ClientID %>'),$('<%= MedTxAgent_16.ClientID %>'),$('<%= MedTxType_16.ClientID %>'),$('<%= MedTxDose_16.ClientID %>'),$('<%= MedTxUnits_16.ClientID %>'),$('<%= MedTxInstitution_16.ClientID %>'),$('<%= MedTxNotes_16.ClientID %>'));
    addAbsentEvent($('<%= AdjuvantTxRecorded.ClientID %>'),$('<%= AdjuvantTxDiv.ClientID %>'),$('<%= AdjuvantTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_17.ClientID %>'),$('<%= MedTxDate_17.ClientID %>'),$('<%= MedTxAgent_17.ClientID %>'),$('<%= MedTxType_17.ClientID %>'),$('<%= MedTxDose_17.ClientID %>'),$('<%= MedTxUnits_17.ClientID %>'),$('<%= MedTxInstitution_17.ClientID %>'),$('<%= MedTxNotes_17.ClientID %>'));
    addAbsentEvent($('<%= AdjuvantTxRecorded.ClientID %>'),$('<%= AdjuvantTxDiv.ClientID %>'),$('<%= AdjuvantTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_18.ClientID %>'),$('<%= MedTxDate_18.ClientID %>'),$('<%= MedTxAgent_18.ClientID %>'),$('<%= MedTxType_18.ClientID %>'),$('<%= MedTxDose_18.ClientID %>'),$('<%= MedTxUnits_18.ClientID %>'),$('<%= MedTxInstitution_18.ClientID %>'),$('<%= MedTxNotes_18.ClientID %>'));
    addAbsentEvent($('<%= AdjuvantTxRecorded.ClientID %>'),$('<%= AdjuvantTxDiv.ClientID %>'),$('<%= AdjuvantTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_19.ClientID %>'),$('<%= MedTxDate_19.ClientID %>'),$('<%= MedTxAgent_19.ClientID %>'),$('<%= MedTxType_19.ClientID %>'),$('<%= MedTxDose_19.ClientID %>'),$('<%= MedTxUnits_19.ClientID %>'),$('<%= MedTxInstitution_19.ClientID %>'),$('<%= MedTxNotes_19.ClientID %>'));
    addAbsentEvent($('<%= AdjuvantTxRecorded.ClientID %>'),$('<%= AdjuvantTxDiv.ClientID %>'),$('<%= AdjuvantTxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_20.ClientID %>'),$('<%= MedTxDate_20.ClientID %>'),$('<%= MedTxAgent_20.ClientID %>'),$('<%= MedTxType_20.ClientID %>'),$('<%= MedTxDose_20.ClientID %>'),$('<%= MedTxUnits_20.ClientID %>'),$('<%= MedTxInstitution_20.ClientID %>'),$('<%= MedTxNotes_20.ClientID %>'));

    function addAbsentEvent(adjuvantTxRecordedID,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID)
    {  
        $(adjuvantTxRecordedID).addEvent('click',curry(adjuvantTxYesNo,adjuvantTxRecordedID,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID));
        $(medTxDateTextID).addEvent('blur',curry(adjuvantTxYesNo,adjuvantTxRecordedID,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID));
        $(medTxAgentID).addEvent('blur',curry(adjuvantTxYesNo,adjuvantTxRecordedID,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID));
        $(medTxTypeID).addEvent('blur',curry(adjuvantTxYesNo,adjuvantTxRecordedID,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID));
        $(medTxDoseID).addEvent('blur',curry(adjuvantTxYesNo,adjuvantTxRecordedID,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID));
        $(medTxUnitsID).addEvent('blur',curry(adjuvantTxYesNo,adjuvantTxRecordedID,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID));
        $(medTxInstitutionID).addEvent('blur',curry(adjuvantTxYesNo,adjuvantTxRecordedID,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID));
        $(medTxNotesID).addEvent('blur',curry(adjuvantTxYesNo,adjuvantTxRecordedID,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID));

        // check on load as well
        adjuvantTxYesNo(adjuvantTxRecordedID,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID);
    }
   
    /* ]]> */
   
    function adjuvantTxYesNo(adjuvantTxRecordedID,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID)
    {
       var adjuvantTxRecordedRef = adjuvantTxRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < adjuvantTxRecordedRef.length; i++) 
        if (adjuvantTxRecordedRef[i].checked) {  
            adjuvantTxRadioClick(adjuvantTxRecordedRef[i].value,adjuvantTxDivID,adjuvantTxAbsentDivID,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID);
            }
    }
    
    function adjuvantTxRadioClick(adjuvantTxoption_value,adjuvantTxhideDiv,adjuvantTxhideAbsentDiv,medTxDateTextID,medTxDateID,medTxAgentID,medTxTypeID,medTxDoseID,medTxUnitsID,medTxInstitutionID,medTxNotesID)
    {
      if (adjuvantTxoption_value == "Yes")
      { 
        adjuvantTxhideDiv.style.display='block';
        adjuvantTxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_7.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_7.ClientID %>').value='';
        document.getElementById('<%= TableName_7.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_7.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_7.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_7.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_7.ClientID %>').value = '';
        
      }
      else if (adjuvantTxoption_value == "No" || adjuvantTxoption_value == "Unknown" || adjuvantTxoption_value == "N/A")
      {
        adjuvantTxhideAbsentDiv.style.display='block';
        adjuvantTxhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_7.ClientID %>').value = 'MedicalTherapy';        
        document.getElementById('<%= FieldName_7.ClientID %>').value = 'MedTxAgent';        
        document.getElementById('<%= FieldValue_7.ClientID %>').value = 'Adjuvant Therapies'; 
        
        if (adjuvantTxoption_value == "No")       
            document.getElementById('<%= AbsentReason_7.ClientID %>').value = 'None Recorded';        
        else if (adjuvantTxoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_7.ClientID %>').value = 'Unknown';
        else if (adjuvantTxoption_value == "N/A")
            document.getElementById('<%= AbsentReason_7.ClientID %>').value = 'Not Applicable';

        document.getElementById('<%= AbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_7.ClientID %>').value + ' as of ';

        document.getElementById('<%= AbsentQuality_7.ClientID %>').value = 'OUT';        

        medTxDateTextID.value = '';
        medTxDateID.value = '';
        medTxAgentID.value = '';
        medTxTypeID.value = '';
        medTxDoseID.value = '';
        medTxUnitsID.value = '';   
        medTxInstitutionID.value = '';   
        medTxNotesID.value = '';   
     }
    }

</script>
