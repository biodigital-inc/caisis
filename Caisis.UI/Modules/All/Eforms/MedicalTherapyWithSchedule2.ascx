<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.MedicalTherapyWithSchedule2" CodeFile="MedicalTherapyWithSchedule2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.MedicalTherapyWithSchedule2HtmlTable = "MedicalTherapyWithSchedule2HtmlTable";
</script>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />


<a name="MedicalTherapyWithSchedule2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medical Therapies"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicalTherapyWithSchedule2HtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">&nbsp;Start Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Dose</td>
     <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Unit</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Route</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Schedule</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Stop Date</td>
    <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxType,MedTxDose,MedTxUnits,MedTxRoute,MedTxSchedule,MedTxStopDateText', 'MedicalTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxType")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDose")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxUnits") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxRoute")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxSchedule")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_11"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_11"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_11"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_11"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_11"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:65px;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_11"        Runat="server" LookupCode="MedTxUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:80px;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_11"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_11"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_11" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_11"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
   <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_12"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_12"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_12"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_12"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_12"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:65px;" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_12"        Runat="server" LookupCode="MedTxUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:80px;" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_12"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_12"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_12" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_12"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr> 
   <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_13"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_13"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_13"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_13"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_13"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:65px;" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_13"        Runat="server" LookupCode="MedTxUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:80px;" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_13"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_13"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_13" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_13"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_14"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_14"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_14"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_14"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_14"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:65px;" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_14"        Runat="server" LookupCode="MedTxUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:80px;" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_14"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_14"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_14" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_14"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_15"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_15"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_15"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_15"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_15"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:65px;" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_15"        Runat="server" LookupCode="MedTxUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:80px;" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_15"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_15"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_15" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_15"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_16"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_16"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_16"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_16"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_16"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:65px;" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_16"        Runat="server" LookupCode="MedTxUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:80px;" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_16"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_16"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_16" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_16"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_17"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_17"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_17"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_17"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_17"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:65px;" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_17"        Runat="server" LookupCode="MedTxUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:80px;" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_17"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_17"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_17" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_17"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_18"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_18"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_18"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_18"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_18"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:65px;" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_18"        Runat="server" LookupCode="MedTxUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:80px;" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_18"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_18"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_18" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_18"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_19"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_19"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_9"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_19"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_19"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:65px;" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_19"        Runat="server" LookupCode="MedTxUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:80px;" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_19"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_19"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_19" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_19"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_20"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_20"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_20"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_20"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_20"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:65px;" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_20"        Runat="server" LookupCode="MedTxUnits,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox   style="width:80px;" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_20"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_20"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_20" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_20"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>  

</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicalTherapyWithSchedule2HtmlTable');" />
<br/><br/>
<br/>