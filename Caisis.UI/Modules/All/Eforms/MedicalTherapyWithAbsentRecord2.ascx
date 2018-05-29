<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.MedicalTherapyWithAbsentRecord2" CodeFile="MedicalTherapyWithAbsentRecord2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.MedicalTherapyWithAbsentRecordHtmlTable = "MedicalTherapyWithAbsentRecordHtmlTable";
</script>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />


<a name="MedicalTherapyWithAbsentRecord2" /><br/>

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
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_14"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="14" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_14"
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
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_11">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_11"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_11"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_11"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_11"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_11"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_11"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_11a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_11" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_11"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_11"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_11"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_11"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="11" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_11"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_11b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_12">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_12"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_12"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_12"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_12"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_12"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_12"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_12a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_12" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_12"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_12"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_12"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_12"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="12" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_12"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_12b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_13">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_13"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_13"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_13"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_13"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_13"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_13"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_13a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_13" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_13"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_13"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_13"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_13"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="13" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_13"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_13b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_14">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_14"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_14"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_14"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_14"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_14"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_14"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_14a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_14" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_14"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_14"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_14"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_14"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="14" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_14"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_14b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_15">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_15"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_15"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_15"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_15"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_15"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_15"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_15a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_15" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_15"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_15"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_15"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_15"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="15" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_15"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_15b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_16">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_16"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_16"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_16"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_16"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_16"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_16"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_16a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_16" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_16"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_16"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_16"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_16"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="16" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_16"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_16b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_17">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_17"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_17"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_17"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_17"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_17"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_17"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_17a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_17" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_17"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_17"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_17"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_17"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="17" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_17"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_17b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_18">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_18"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_18"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_18"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_18"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_18"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_18"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_18a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_18" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_18"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_18"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_18"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_18"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="18" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_18"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_18b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_19">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_19"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_19"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_19"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_19"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_19"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_19"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_19a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_19" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_19"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_19"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_19"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_19"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="19" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_19"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_19b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="MedicalTherapyWithAbsentRecordHtmlTable_20">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxDateText"     ID="MedTxDateText_20"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxDate"         ID="MedTxDate_20"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxAgent"     ID="MedTxAgent_20"     Runat="server" LookupCode="MedTxAgent,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformSelect DropDownWidth="auto"   Width="100px" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxType"      ID="MedTxType_20"      Runat="server" LookupCode="MedTxType,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxDose"         ID="MedTxDose_20"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxUnits"        ID="MedTxUnits_20"        Runat="server" LookupCode="MedUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_20a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" ID="MedTxStopDateText_20" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxStopDate"     ID="MedTxStopDate_20"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxRoute"        ID="MedTxRoute_20"        Runat="server" LookupCode="MedRoute,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxSchedule"     ID="MedTxSchedule_20"     Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxDisease"     ID="MedTxDisease_20"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="20" TABLE="MedicalTherapy" FIELD="MedTxNotes"       ID="MedTxNotes_20"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_20b" runat="server"/></td>
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
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="TableName" ID="TableName_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="FieldName" ID="FieldName_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_14"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="14" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_14"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_11.ClientID %>'),$('<%= MedTxDate_11.ClientID %>'),$('<%= MedTxAgent_11.ClientID %>'),$('<%= MedTxType_11.ClientID %>'),$('<%= MedTxDose_11.ClientID %>'),$('<%= MedTxUnits_11.ClientID %>'),$('<%= MedTxStopDateText_11.ClientID %>'),$('<%= MedTxStopDate_11.ClientID %>'),$('<%= MedTxRoute_11.ClientID %>'),$('<%= MedTxSchedule_11.ClientID %>'),$('<%= MedTxDisease_11.ClientID %>'),$('<%= MedTxNotes_11.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_12.ClientID %>'),$('<%= MedTxDate_12.ClientID %>'),$('<%= MedTxAgent_12.ClientID %>'),$('<%= MedTxType_12.ClientID %>'),$('<%= MedTxDose_12.ClientID %>'),$('<%= MedTxUnits_12.ClientID %>'),$('<%= MedTxStopDateText_12.ClientID %>'),$('<%= MedTxStopDate_12.ClientID %>'),$('<%= MedTxRoute_12.ClientID %>'),$('<%= MedTxSchedule_12.ClientID %>'),$('<%= MedTxDisease_12.ClientID %>'),$('<%= MedTxNotes_12.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_13.ClientID %>'),$('<%= MedTxDate_13.ClientID %>'),$('<%= MedTxAgent_13.ClientID %>'),$('<%= MedTxType_13.ClientID %>'),$('<%= MedTxDose_13.ClientID %>'),$('<%= MedTxUnits_13.ClientID %>'),$('<%= MedTxStopDateText_13.ClientID %>'),$('<%= MedTxStopDate_13.ClientID %>'),$('<%= MedTxRoute_13.ClientID %>'),$('<%= MedTxSchedule_13.ClientID %>'),$('<%= MedTxDisease_13.ClientID %>'),$('<%= MedTxNotes_13.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_14.ClientID %>'),$('<%= MedTxDate_14.ClientID %>'),$('<%= MedTxAgent_14.ClientID %>'),$('<%= MedTxType_14.ClientID %>'),$('<%= MedTxDose_14.ClientID %>'),$('<%= MedTxUnits_14.ClientID %>'),$('<%= MedTxStopDateText_14.ClientID %>'),$('<%= MedTxStopDate_14.ClientID %>'),$('<%= MedTxRoute_14.ClientID %>'),$('<%= MedTxSchedule_14.ClientID %>'),$('<%= MedTxDisease_14.ClientID %>'),$('<%= MedTxNotes_14.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_15.ClientID %>'),$('<%= MedTxDate_15.ClientID %>'),$('<%= MedTxAgent_15.ClientID %>'),$('<%= MedTxType_15.ClientID %>'),$('<%= MedTxDose_15.ClientID %>'),$('<%= MedTxUnits_15.ClientID %>'),$('<%= MedTxStopDateText_15.ClientID %>'),$('<%= MedTxStopDate_15.ClientID %>'),$('<%= MedTxRoute_15.ClientID %>'),$('<%= MedTxSchedule_15.ClientID %>'),$('<%= MedTxDisease_15.ClientID %>'),$('<%= MedTxNotes_15.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_16.ClientID %>'),$('<%= MedTxDate_16.ClientID %>'),$('<%= MedTxAgent_16.ClientID %>'),$('<%= MedTxType_16.ClientID %>'),$('<%= MedTxDose_16.ClientID %>'),$('<%= MedTxUnits_16.ClientID %>'),$('<%= MedTxStopDateText_16.ClientID %>'),$('<%= MedTxStopDate_16.ClientID %>'),$('<%= MedTxRoute_16.ClientID %>'),$('<%= MedTxSchedule_16.ClientID %>'),$('<%= MedTxDisease_16.ClientID %>'),$('<%= MedTxNotes_16.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_17.ClientID %>'),$('<%= MedTxDate_17.ClientID %>'),$('<%= MedTxAgent_17.ClientID %>'),$('<%= MedTxType_17.ClientID %>'),$('<%= MedTxDose_17.ClientID %>'),$('<%= MedTxUnits_17.ClientID %>'),$('<%= MedTxStopDateText_17.ClientID %>'),$('<%= MedTxStopDate_17.ClientID %>'),$('<%= MedTxRoute_17.ClientID %>'),$('<%= MedTxSchedule_17.ClientID %>'),$('<%= MedTxDisease_17.ClientID %>'),$('<%= MedTxNotes_17.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_18.ClientID %>'),$('<%= MedTxDate_18.ClientID %>'),$('<%= MedTxAgent_18.ClientID %>'),$('<%= MedTxType_18.ClientID %>'),$('<%= MedTxDose_18.ClientID %>'),$('<%= MedTxUnits_18.ClientID %>'),$('<%= MedTxStopDateText_18.ClientID %>'),$('<%= MedTxStopDate_18.ClientID %>'),$('<%= MedTxRoute_18.ClientID %>'),$('<%= MedTxSchedule_18.ClientID %>'),$('<%= MedTxDisease_18.ClientID %>'),$('<%= MedTxNotes_18.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_19.ClientID %>'),$('<%= MedTxDate_19.ClientID %>'),$('<%= MedTxAgent_19.ClientID %>'),$('<%= MedTxType_19.ClientID %>'),$('<%= MedTxDose_19.ClientID %>'),$('<%= MedTxUnits_19.ClientID %>'),$('<%= MedTxStopDateText_19.ClientID %>'),$('<%= MedTxStopDate_19.ClientID %>'),$('<%= MedTxRoute_19.ClientID %>'),$('<%= MedTxSchedule_19.ClientID %>'),$('<%= MedTxDisease_19.ClientID %>'),$('<%= MedTxNotes_19.ClientID %>'));
    addAbsentEvent($('<%= MedTxHxRecorded.ClientID %>'),$('<%= MedTxHxDiv.ClientID %>'),$('<%= MedTxHxAbsentDiv.ClientID %>'),$('<%= MedTxDateText_20.ClientID %>'),$('<%= MedTxDate_20.ClientID %>'),$('<%= MedTxAgent_20.ClientID %>'),$('<%= MedTxType_20.ClientID %>'),$('<%= MedTxDose_20.ClientID %>'),$('<%= MedTxUnits_20.ClientID %>'),$('<%= MedTxStopDateText_20.ClientID %>'),$('<%= MedTxStopDate_20.ClientID %>'),$('<%= MedTxRoute_20.ClientID %>'),$('<%= MedTxSchedule_20.ClientID %>'),$('<%= MedTxDisease_20.ClientID %>'),$('<%= MedTxNotes_20.ClientID %>'));

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
       
        document.getElementById('<%= AbsentDateText_14.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_14.ClientID %>').value='';
        document.getElementById('<%= TableName_14.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_14.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_14.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_14.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_14.ClientID %>').value = '';
        
      } 
      else if (MedTxHxoption_value == "No" || MedTxHxoption_value == "Unknown")
      {
        MedTxHxhideAbsentDiv.style.display='block';
        MedTxHxhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_14.ClientID %>').value = 'MedicalTherapy';        
        document.getElementById('<%= FieldName_14.ClientID %>').value = 'MedTxAgent';        
        document.getElementById('<%= FieldValue_14.ClientID %>').value = document.getElementById('<%= ComponentTitle.ClientID %>').innerHTML; 
        
        if (MedTxHxoption_value == "No")       
            document.getElementById('<%= AbsentReason_14.ClientID %>').value = 'None Recorded';        
        if (MedTxHxoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_14.ClientID %>').value = 'Unknown';        

        document.getElementById('<%= AbsentQuality_14.ClientID %>').value = 'OUT';        

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