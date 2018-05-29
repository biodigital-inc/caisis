<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.MedicalTherapyWithSchedule" CodeFile="MedicalTherapyWithSchedule.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.MedicalTherapyWithScheduleHtmlTable = "MedicalTherapyWithScheduleHtmlTable";
</script>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />


<a name="MedicalTherapyWithSchedule" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medical Therapies"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="MedicalTherapyWithScheduleHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">&nbsp;Start Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Agent</td>
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
                                    <euc:EformTextBox  style="width:80px;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_1"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_1"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_1"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_1"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_1"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:65px;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_1"        Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:80px;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_1"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_1"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_1" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_1"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
   <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_2"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_2"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_2"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_2"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_2"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:65px;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_2"        Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:80px;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_2"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_2"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_2" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_2"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr> 
   <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_3"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_3"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_3"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_3"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_3"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:65px;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_3"        Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:80px;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_3"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_3"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_3" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_3"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_4"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_4"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_4"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="4" TABLE="MedialTherapy" FIELD="MedTxType"      ID="MedTxType_4"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_4"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:65px;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_4"        Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:80px;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_4"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_4"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_4" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_4"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_5"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_5"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_5"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_5"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_5"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:65px;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_5"        Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:80px;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_5"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_5"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_5" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_5"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_6"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_6"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_6"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_6"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_6"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:65px;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_6"        Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:80px;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_6"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_6"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_6" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_6"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_7"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_7"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_7"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_7"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_7"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:65px;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_7"        Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:80px;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_7"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_7"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_7" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_7"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_8"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_8"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_8"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_8"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_8"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:65px;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_8"        Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:80px;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_8"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_8"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_8" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_8"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_9"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_9"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_9"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_9"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_9"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:65px;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_9"        Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:80px;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_9"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_9"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_9" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_9"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none;" >
    <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                    <euc:EformTextBox  style="width:80px;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_10"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_10"         Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:100px;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_10"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:120px;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_10"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_10"         Runat="server" /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:65px;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_10"        Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect   style="width:80px;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_10"        Runat="server" LookupCode="MedTxRoute,Disease,@DiseaseView"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox style="width:80px;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_10"     Runat="server" LookupCode="MedTxSchedule,Disease,@DiseaseView" /></td>
    <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_10" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                    <euc:EformHidden                       RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_10"     Runat="server" />    </td> 
    <td style="white-space:nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>  

</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicalTherapyWithScheduleHtmlTable');" />
<br/><br/>
<br/>