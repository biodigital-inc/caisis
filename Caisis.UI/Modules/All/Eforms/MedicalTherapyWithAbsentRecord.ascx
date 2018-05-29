<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.MedicalTherapyWithAbsentRecord" CodeFile="MedicalTherapyWithAbsentRecord.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.MedicalTherapyWithAbsentRecordHtmlTable = "MedicalTherapyWithAbsentRecordHtmlTable";
    tableArray.MedicalTherapyWithAbsentRecordHtmlTable = "MedicalTherapyWithAbsentRecordHtmlTable";
</script>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />


<a name="MedicalTherapyWithAbsentRecord" /><br/>

<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Medical Therapies"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="MedTxHxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="MedTxHxRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="MedTxHxAbsentDiv" runat="server" style="display: none;" >
<br /><br /> 
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_12"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="12" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_12"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table>

</div>
                 
<div id="MedTxHxDiv" runat="server" style="display: none;">
<br /><br /> 
<table  border="0" cellpadding="0" cellspacing="0" class="ClinicalEformTable" id="Table1">
          
    <asp:Repeater ID="MedicalTxRptr" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 
	<ItemTemplate> 
	    
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Agent</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
      
        <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxAgent,MedTxType,MedTxDose,MedTxUnits,MedTxRoute,MedTxSchedule,MedTxStopDateText,MedTxDisease,MedTxNotes', 'MedicalTherapy');"> 
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText")%></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxAgent")%></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxType")%></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;"><%# DataBinder.Eval(Container.DataItem, "MedTxDose")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;"><%# DataBinder.Eval(Container.DataItem, "MedTxUnits") %></td>
            <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
        </tr>      
		
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Route</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		

        <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxAgent,MedTxType,MedTxDose,MedTxUnits,MedTxRoute,MedTxSchedule,MedTxStopDateText,MedTxDisease,MedTxNotes', 'MedicalTherapy');"> 
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText")%></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxRoute")%></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;"><%# DataBinder.Eval(Container.DataItem, "MedTxSchedule")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;"><%# DataBinder.Eval(Container.DataItem, "MedTxDisease") %></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap; "><%# DataBinder.Eval(Container.DataItem, "MedTxNotes")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="Img1" runat="server" title="This record has been locked."/>&nbsp;</td>
        </tr>      

    <tr>
        <td style="text-align: left;" colspan="3" >&nbsp;</td>

    </tr>
    
	</ItemTemplate>
  </asp:Repeater>
  

  <tr id="NoMedTxHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" style="display: none;" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No medical therapies have been recorded for this patient.</td>
  </tr>  

</table>

<br /><br />

<table cellpadding="5" cellspacing="15" class="ClinicalEformTable" id="MedicalTherapyWithAbsentRecordHtmlTable">

    <tr style="padding-bottom: 50px; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_1">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Agent</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Dose</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_1"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_1"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_1"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_1"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_1"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_1"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_1a" runat="server"/></td>
              </tr>
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Route</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_1" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_1"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_1"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_1"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_1"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="1" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_1"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_1b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_2">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Agent</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Dose</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_2"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_2"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_2"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_2"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_2"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_2"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_2a" runat="server"/></td>
              </tr>
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Route</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_2" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_2"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_2"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_2"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_2"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="2" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_2"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_2b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_3">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Agent</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Dose</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_3"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_3"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_3"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_3"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_3"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_3"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_3a" runat="server"/></td>
              </tr>
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Route</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_3" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_3"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_3"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_3"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_3"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="3" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_3"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_3b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_4">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Agent</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Dose</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_4"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_4"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_4"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_4"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_4"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_4"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_4a" runat="server"/></td>
              </tr>
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Route</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_4" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_4"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_4"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_4"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_4"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="4" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_4"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_4b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_5">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Agent</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Dose</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_5"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_5"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_5"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_5"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_5"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_5"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_5a" runat="server"/></td>
              </tr>
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Route</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_5" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_5"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_5"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_5"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_5"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="5" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_5"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_5b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_6">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Agent</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Dose</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_6"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_6"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_6"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_6"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_6"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_6"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_6a" runat="server"/></td>
              </tr>
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Route</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_6" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_6"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_6"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_6"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_6"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="6" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_6"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_6b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_7">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Agent</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Dose</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_7"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_7"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_7"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_7"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_7"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_7"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_7a" runat="server"/></td>
              </tr>
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Route</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_7" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_7"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_7"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_7"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_7"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="7" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_7"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_7b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_8">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Agent</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Dose</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_8"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_8"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_8"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_8"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_8"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_8"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_8a" runat="server"/></td>
              </tr>
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Route</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_8" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_8"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_8"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_8"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_8"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="8" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_8"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_8b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_9">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Agent</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Dose</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_9"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_9"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_9"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_9"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_9"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_9"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_9a" runat="server"/></td>
              </tr>
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Route</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_9" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_9"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_9"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_9"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_9"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="9" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_9"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_9b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_10">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Agent</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Dose</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_10"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_10"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_10"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_10"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_10"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_10"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_10a" runat="server"/></td>
              </tr>
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Route</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_10" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_10"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_10"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_10"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_10"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="10" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_10"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_10b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicalTherapyWithAbsentRecordHtmlTable');" />
</div>
<br/><br/><br/>
<table>
    <tr id="MedTxHxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="TableName" ID="TableName_12"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="FieldName" ID="FieldName_12"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_12"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_12"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_12"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_1.ClientID %>'),$('<%= MedTxDate_1.ClientID %>'),$('<%= MedTxAgent_1.ClientID %>'),$('<%= MedTxType_1.ClientID %>'),$('<%= MedTxDose_1.ClientID %>'),$('<%= MedTxUnits_1.ClientID %>'),$('<%= MedTxStopDateText_1.ClientID %>'),$('<%= MedTxStopDate_1.ClientID %>'),$('<%= MedTxRoute_1.ClientID %>'),$('<%= MedTxSchedule_1.ClientID %>'),$('<%= MedTxDisease_1.ClientID %>'),$('<%= MedTxNotes_1.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_2.ClientID %>'),$('<%= MedTxDate_2.ClientID %>'),$('<%= MedTxAgent_2.ClientID %>'),$('<%= MedTxType_2.ClientID %>'),$('<%= MedTxDose_2.ClientID %>'),$('<%= MedTxUnits_2.ClientID %>'),$('<%= MedTxStopDateText_2.ClientID %>'),$('<%= MedTxStopDate_2.ClientID %>'),$('<%= MedTxRoute_2.ClientID %>'),$('<%= MedTxSchedule_2.ClientID %>'),$('<%= MedTxDisease_2.ClientID %>'),$('<%= MedTxNotes_2.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_3.ClientID %>'),$('<%= MedTxDate_3.ClientID %>'),$('<%= MedTxAgent_3.ClientID %>'),$('<%= MedTxType_3.ClientID %>'),$('<%= MedTxDose_3.ClientID %>'),$('<%= MedTxUnits_3.ClientID %>'),$('<%= MedTxStopDateText_3.ClientID %>'),$('<%= MedTxStopDate_3.ClientID %>'),$('<%= MedTxRoute_3.ClientID %>'),$('<%= MedTxSchedule_3.ClientID %>'),$('<%= MedTxDisease_3.ClientID %>'),$('<%= MedTxNotes_3.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_4.ClientID %>'),$('<%= MedTxDate_4.ClientID %>'),$('<%= MedTxAgent_4.ClientID %>'),$('<%= MedTxType_4.ClientID %>'),$('<%= MedTxDose_4.ClientID %>'),$('<%= MedTxUnits_4.ClientID %>'),$('<%= MedTxStopDateText_4.ClientID %>'),$('<%= MedTxStopDate_4.ClientID %>'),$('<%= MedTxRoute_4.ClientID %>'),$('<%= MedTxSchedule_4.ClientID %>'),$('<%= MedTxDisease_4.ClientID %>'),$('<%= MedTxNotes_4.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_5.ClientID %>'),$('<%= MedTxDate_5.ClientID %>'),$('<%= MedTxAgent_5.ClientID %>'),$('<%= MedTxType_5.ClientID %>'),$('<%= MedTxDose_5.ClientID %>'),$('<%= MedTxUnits_5.ClientID %>'),$('<%= MedTxStopDateText_5.ClientID %>'),$('<%= MedTxStopDate_5.ClientID %>'),$('<%= MedTxRoute_5.ClientID %>'),$('<%= MedTxSchedule_5.ClientID %>'),$('<%= MedTxDisease_5.ClientID %>'),$('<%= MedTxNotes_5.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_6.ClientID %>'),$('<%= MedTxDate_6.ClientID %>'),$('<%= MedTxAgent_6.ClientID %>'),$('<%= MedTxType_6.ClientID %>'),$('<%= MedTxDose_6.ClientID %>'),$('<%= MedTxUnits_6.ClientID %>'),$('<%= MedTxStopDateText_6.ClientID %>'),$('<%= MedTxStopDate_6.ClientID %>'),$('<%= MedTxRoute_6.ClientID %>'),$('<%= MedTxSchedule_6.ClientID %>'),$('<%= MedTxDisease_6.ClientID %>'),$('<%= MedTxNotes_6.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_7.ClientID %>'),$('<%= MedTxDate_7.ClientID %>'),$('<%= MedTxAgent_7.ClientID %>'),$('<%= MedTxType_7.ClientID %>'),$('<%= MedTxDose_7.ClientID %>'),$('<%= MedTxUnits_7.ClientID %>'),$('<%= MedTxStopDateText_7.ClientID %>'),$('<%= MedTxStopDate_7.ClientID %>'),$('<%= MedTxRoute_7.ClientID %>'),$('<%= MedTxSchedule_7.ClientID %>'),$('<%= MedTxDisease_7.ClientID %>'),$('<%= MedTxNotes_7.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_8.ClientID %>'),$('<%= MedTxDate_8.ClientID %>'),$('<%= MedTxAgent_8.ClientID %>'),$('<%= MedTxType_8.ClientID %>'),$('<%= MedTxDose_8.ClientID %>'),$('<%= MedTxUnits_8.ClientID %>'),$('<%= MedTxStopDateText_8.ClientID %>'),$('<%= MedTxStopDate_8.ClientID %>'),$('<%= MedTxRoute_8.ClientID %>'),$('<%= MedTxSchedule_8.ClientID %>'),$('<%= MedTxDisease_8.ClientID %>'),$('<%= MedTxNotes_8.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_9.ClientID %>'),$('<%= MedTxDate_9.ClientID %>'),$('<%= MedTxAgent_9.ClientID %>'),$('<%= MedTxType_9.ClientID %>'),$('<%= MedTxDose_9.ClientID %>'),$('<%= MedTxUnits_9.ClientID %>'),$('<%= MedTxStopDateText_9.ClientID %>'),$('<%= MedTxStopDate_9.ClientID %>'),$('<%= MedTxRoute_9.ClientID %>'),$('<%= MedTxSchedule_9.ClientID %>'),$('<%= MedTxDisease_9.ClientID %>'),$('<%= MedTxNotes_9.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_10.ClientID %>'),$('<%= MedTxDate_10.ClientID %>'),$('<%= MedTxAgent_10.ClientID %>'),$('<%= MedTxType_10.ClientID %>'),$('<%= MedTxDose_10.ClientID %>'),$('<%= MedTxUnits_10.ClientID %>'),$('<%= MedTxStopDateText_10.ClientID %>'),$('<%= MedTxStopDate_10.ClientID %>'),$('<%= MedTxRoute_10.ClientID %>'),$('<%= MedTxSchedule_10.ClientID %>'),$('<%= MedTxDisease_10.ClientID %>'),$('<%= MedTxNotes_10.ClientID %>'));

    function addAbsentEvent(MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes)
    {  
        $(MedTxHxRecordedID).addEvent('click',curry(MedTxHxYesNo,MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes));
        $(medTxAgent).addEvent('blur',curry(MedTxHxYesNo,MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes));
        $(medTxType).addEvent('blur',curry(MedTxHxYesNo,MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes));
        $(medTxDose).addEvent('blur',curry(MedTxHxYesNo,MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes));
        $(medTxUnits).addEvent('blur',curry(MedTxHxYesNo,MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes));
        $(medTxStopDateText).addEvent('blur',curry(MedTxHxYesNo,MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes));
        $(medTxRoute).addEvent('blur',curry(MedTxHxYesNo,MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes));
        $(medTxSchedule).addEvent('blur',curry(MedTxHxYesNo,MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes));
        $(medTxDisease).addEvent('blur',curry(MedTxHxYesNo,MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes));
        $(medTxNotes).addEvent('blur',curry(MedTxHxYesNo,MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes));

        // check on load as well
        MedTxHxYesNo(MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes);
    }
   
    /* ]]> */
   
    function MedTxHxYesNo(MedTxHxRecordedID,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes)
    {
       var MedTxHxRecordedRef = MedTxHxRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < MedTxHxRecordedRef.length; i++) 
        if (MedTxHxRecordedRef[i].checked) {  
            MedTxHxRadioClick(MedTxHxRecordedRef[i].value,MedTxHxDivID,MedTxHxAbsentDivID,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes);
            }
    }
    
    function MedTxHxRadioClick(MedTxHxoption_value,MedTxHxhideDiv,MedTxHxhideAbsentDiv,medTxDateText,medTxDate,medTxAgent,medTxType,medTxDose,medTxUnits,medTxStopDateText,medTxStopDate,medTxRoute,medTxSchedule,medTxDisease,medTxNotes)
    {
      if (MedTxHxoption_value == "Yes")
      { 
        MedTxHxhideDiv.style.display='block';
        MedTxHxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_12.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_12.ClientID %>').value='';
        document.getElementById('<%= TableName_12.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_12.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_12.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_12.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_12.ClientID %>').value = '';
        
      } 
      else if (MedTxHxoption_value == "No" || MedTxHxoption_value == "Unknown")
      {
        MedTxHxhideAbsentDiv.style.display='block';
        MedTxHxhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_12.ClientID %>').value = 'MedicalTherapy';        
        document.getElementById('<%= FieldName_12.ClientID %>').value = 'MedTxAgent';        
        document.getElementById('<%= FieldValue_12.ClientID %>').value = document.getElementById('<%= ComponentTitle.ClientID %>').innerHTML; 
        
        if (MedTxHxoption_value == "No")       
            document.getElementById('<%= AbsentReason_12.ClientID %>').value = 'None Recorded';        
        if (MedTxHxoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_12.ClientID %>').value = 'Unknown';        

        document.getElementById('<%= AbsentQuality_12.ClientID %>').value = 'OUT';        

        medTxDateText.value = '';
        medTxDate.value = '';
        medTxAgent.value = '';
        medTxType.value = '';   
        medTxDose.value = '';
        medTxUnits.value = '';   
        medTxStopDateText.value = '';
        medTxStopDate.value = '';
        medTxSchedule.value = '';
        medTxRoute.value = '';   
        medTxDisease.value = '';
        medTxNotes.value = '';   
     }
    }
    
</script>