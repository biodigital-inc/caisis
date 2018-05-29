<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.RadiationTherapyWithAbsentRecord" CodeFile="RadiationTherapyWithAbsentRecord.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.RadiationTherapyWithAbsentRecordHtmlTable = "RadiationTherapyWithAbsentRecordHtmlTable";
    tableArray.RadiationTherapyWithAbsentRecordHtmlTable = "RadiationTherapyWithAbsentRecordHtmlTable";
</script>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />


<a name="RadiationTherapyWithAbsentRecord" /><br/>

<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiation Therapies"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="RadTxHxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="RadTxHxRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="RadTxHxAbsentDiv" runat="server" style="display: none;" >
<br /><br /> 
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_13"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="13" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_13"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table>

</div>
                 
<div id="RadTxHxDiv" runat="server" style="display: none;">
<br /><br /> 
<table  border="0" cellpadding="0" cellspacing="0" class="ClinicalEformTable" id="Table1">
          
    <asp:Repeater ID="RadiationTxRptr" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 
	<ItemTemplate> 
	    
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Target</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Total Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
      
        <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyiD") %>, 'RadTxDateText,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxSchedule,RadTxDisease,RadTxStopDateText,RadTxInstitution,RadTxNotes', 'RadiationTherapy');"> 
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText")%></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxTarget")%></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxTarget")%></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;"><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;"><%# DataBinder.Eval(Container.DataItem, "RadTxUnits") %></td>
            <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
        </tr>      
		
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Institution</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		

        <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyiD") %>, 'RadTxDateText,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxSchedule,RadTxDisease,RadTxStopDateText,RadTxInstitution,RadTxNotes', 'RadiationTherapy');"> 
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText")%></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxSchedule")%></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;"><%# DataBinder.Eval(Container.DataItem, "RadTxDisease")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap;"><%# DataBinder.Eval(Container.DataItem, "RadTxInstitution") %></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align: left; white-space:nowrap; "><%# DataBinder.Eval(Container.DataItem, "RadTxNotes")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="Img1" runat="server" title="This record has been locked."/>&nbsp;</td>
        </tr>      

    <tr>
        <td style="text-align: left;" colspan="3" >&nbsp;</td>

    </tr>
    
	</ItemTemplate>
  </asp:Repeater>
  

  <tr id="NoRadTxHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" style="display: none;" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No radiation therapies have been recorded for this patient.</td>
  </tr>  

</table>

<br /><br />

<table cellpadding="5" cellspacing="15" class="ClinicalEformTable" id="RadiationTherapyWithAbsentRecordHtmlTable">

    <tr style="padding-bottom: 50px; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_1">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Target</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Total Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_1"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_1"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_1"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_1"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_1"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_1"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_1a" runat="server"/></td>
              </tr>
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Institution</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_1" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_1"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_1"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_1"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_1"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_1"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_1b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_2">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Target</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Total Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_2"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_2"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_2"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_2"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_2"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_2"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_2a" runat="server"/></td>
              </tr>
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Institution</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_2" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_2"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_2"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_2"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_2"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_2"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_2b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_3">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Target</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Total Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_3"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_3"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_3"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_3"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_3"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_3"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_3a" runat="server"/></td>
              </tr>
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Institution</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_3" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_3"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_3"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_3"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_3"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_3"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_3b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_4">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Target</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Total Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_4"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_4"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_4"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_4"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_4"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_4"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_4a" runat="server"/></td>
              </tr>
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Institution</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_4" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_4"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_4"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_4"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_4"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_4"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_4b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_5">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Target</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Total Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_5"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_5"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_5"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_5"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_5"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_5"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_5a" runat="server"/></td>
              </tr>
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Institution</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_5" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_5"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_5"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_5"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_5"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_5"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_5b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_6">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Target</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Total Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_6"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_6"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_6"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_6"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_6"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_6"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_6a" runat="server"/></td>
              </tr>
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Institution</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_6" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_6"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_6"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_6"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_6"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_6"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_6b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_7">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Target</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Total Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_7"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_7"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_7"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_7"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_7"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_7"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_7a" runat="server"/></td>
              </tr>
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Institution</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_7" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_7"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_7"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_7"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_7"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_7"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_7b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_8">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Target</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Total Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_8"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_8"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_8"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_8"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_8"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_8"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_8a" runat="server"/></td>
              </tr>
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Institution</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_8" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_8"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_8"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_8"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_8"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_8"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_8b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_9">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">RadTxTarget</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Total Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_9"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_9"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_9"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_9"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_9"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_9"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_9a" runat="server"/></td>
              </tr>
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Institution</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_9" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_9"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_9"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_9"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_9"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_9"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_9b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_10">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Start Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Type</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">RadTxTarget</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Total Dose</td>
             <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Units</td>
            <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
              <tr >
                <td style="white-space:nowrap;" height="28" class="ClinicalEformGridColumnOne">
                                                <euc:EformTextBox  style="width:80px;" RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_10"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_10"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_10"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_10"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_10"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_10"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_10a" runat="server"/></td>
              </tr>
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Stop Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Schedule</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Disease</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Institution</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Notes</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>		
              <tr >
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_10" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_10"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_10"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_10"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_10"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_10"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_10b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'RadiationTherapyWithAbsentRecordHtmlTable');" />
</div>
<br/><br/><br/>
<table>
    <tr id="RadTxHxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="TableName" ID="TableName_13"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="FieldName" ID="FieldName_13"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_13"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_13"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_13"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= RadTxHxRecorded.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_1.ClientID %>'),$('<%= RadTxDate_1.ClientID %>'),$('<%= RadTxType_1.ClientID %>'),$('<%= RadTxTarget_1.ClientID %>'),$('<%= RadTxTotalDose_1.ClientID %>'),$('<%= RadTxUnits_1.ClientID %>'),$('<%= RadTxStopDateText_1.ClientID %>'),$('<%= RadTxStopDate_1.ClientID %>'),$('<%= RadTxSchedule_1.ClientID %>'),$('<%= RadTxDisease_1.ClientID %>'),$('<%= RadTxInstitution_1.ClientID %>'),$('<%= RadTxNotes_1.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_2.ClientID %>'),$('<%= RadTxDate_2.ClientID %>'),$('<%= RadTxType_2.ClientID %>'),$('<%= RadTxTarget_2.ClientID %>'),$('<%= RadTxTotalDose_2.ClientID %>'),$('<%= RadTxUnits_2.ClientID %>'),$('<%= RadTxStopDateText_2.ClientID %>'),$('<%= RadTxStopDate_2.ClientID %>'),$('<%= RadTxSchedule_2.ClientID %>'),$('<%= RadTxDisease_2.ClientID %>'),$('<%= RadTxInstitution_2.ClientID %>'),$('<%= RadTxNotes_2.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_3.ClientID %>'),$('<%= RadTxDate_3.ClientID %>'),$('<%= RadTxType_3.ClientID %>'),$('<%= RadTxTarget_3.ClientID %>'),$('<%= RadTxTotalDose_3.ClientID %>'),$('<%= RadTxUnits_3.ClientID %>'),$('<%= RadTxStopDateText_3.ClientID %>'),$('<%= RadTxStopDate_3.ClientID %>'),$('<%= RadTxSchedule_3.ClientID %>'),$('<%= RadTxDisease_3.ClientID %>'),$('<%= RadTxInstitution_3.ClientID %>'),$('<%= RadTxNotes_3.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_4.ClientID %>'),$('<%= RadTxDate_4.ClientID %>'),$('<%= RadTxType_4.ClientID %>'),$('<%= RadTxTarget_4.ClientID %>'),$('<%= RadTxTotalDose_4.ClientID %>'),$('<%= RadTxUnits_4.ClientID %>'),$('<%= RadTxStopDateText_4.ClientID %>'),$('<%= RadTxStopDate_4.ClientID %>'),$('<%= RadTxSchedule_4.ClientID %>'),$('<%= RadTxDisease_4.ClientID %>'),$('<%= RadTxInstitution_4.ClientID %>'),$('<%= RadTxNotes_4.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_5.ClientID %>'),$('<%= RadTxDate_5.ClientID %>'),$('<%= RadTxType_5.ClientID %>'),$('<%= RadTxTarget_5.ClientID %>'),$('<%= RadTxTotalDose_5.ClientID %>'),$('<%= RadTxUnits_5.ClientID %>'),$('<%= RadTxStopDateText_5.ClientID %>'),$('<%= RadTxStopDate_5.ClientID %>'),$('<%= RadTxSchedule_5.ClientID %>'),$('<%= RadTxDisease_5.ClientID %>'),$('<%= RadTxInstitution_5.ClientID %>'),$('<%= RadTxNotes_5.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_6.ClientID %>'),$('<%= RadTxDate_6.ClientID %>'),$('<%= RadTxType_6.ClientID %>'),$('<%= RadTxTarget_6.ClientID %>'),$('<%= RadTxTotalDose_6.ClientID %>'),$('<%= RadTxUnits_6.ClientID %>'),$('<%= RadTxStopDateText_6.ClientID %>'),$('<%= RadTxStopDate_6.ClientID %>'),$('<%= RadTxSchedule_6.ClientID %>'),$('<%= RadTxDisease_6.ClientID %>'),$('<%= RadTxInstitution_6.ClientID %>'),$('<%= RadTxNotes_6.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_7.ClientID %>'),$('<%= RadTxDate_7.ClientID %>'),$('<%= RadTxType_7.ClientID %>'),$('<%= RadTxTarget_7.ClientID %>'),$('<%= RadTxTotalDose_7.ClientID %>'),$('<%= RadTxUnits_7.ClientID %>'),$('<%= RadTxStopDateText_7.ClientID %>'),$('<%= RadTxStopDate_7.ClientID %>'),$('<%= RadTxSchedule_7.ClientID %>'),$('<%= RadTxDisease_7.ClientID %>'),$('<%= RadTxInstitution_7.ClientID %>'),$('<%= RadTxNotes_7.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_8.ClientID %>'),$('<%= RadTxDate_8.ClientID %>'),$('<%= RadTxType_8.ClientID %>'),$('<%= RadTxTarget_8.ClientID %>'),$('<%= RadTxTotalDose_8.ClientID %>'),$('<%= RadTxUnits_8.ClientID %>'),$('<%= RadTxStopDateText_8.ClientID %>'),$('<%= RadTxStopDate_8.ClientID %>'),$('<%= RadTxSchedule_8.ClientID %>'),$('<%= RadTxDisease_8.ClientID %>'),$('<%= RadTxInstitution_8.ClientID %>'),$('<%= RadTxNotes_8.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_9.ClientID %>'),$('<%= RadTxDate_9.ClientID %>'),$('<%= RadTxType_9.ClientID %>'),$('<%= RadTxTarget_9.ClientID %>'),$('<%= RadTxTotalDose_9.ClientID %>'),$('<%= RadTxUnits_9.ClientID %>'),$('<%= RadTxStopDateText_9.ClientID %>'),$('<%= RadTxStopDate_9.ClientID %>'),$('<%= RadTxSchedule_9.ClientID %>'),$('<%= RadTxDisease_9.ClientID %>'),$('<%= RadTxInstitution_9.ClientID %>'),$('<%= RadTxNotes_9.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_10.ClientID %>'),$('<%= RadTxDate_10.ClientID %>'),$('<%= RadTxType_10.ClientID %>'),$('<%= RadTxTarget_10.ClientID %>'),$('<%= RadTxTotalDose_10.ClientID %>'),$('<%= RadTxUnits_10.ClientID %>'),$('<%= RadTxStopDateText_10.ClientID %>'),$('<%= RadTxStopDate_10.ClientID %>'),$('<%= RadTxSchedule_10.ClientID %>'),$('<%= RadTxDisease_10.ClientID %>'),$('<%= RadTxInstitution_10.ClientID %>'),$('<%= RadTxNotes_10.ClientID %>'));

    function addAbsentEvent(RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes)
    {  
        $(RadTxHxRecordedID).addEvent('click',curry(RadTxHxYesNo,RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxType).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxTarget).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxTotalDose).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxUnits).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxStopDateText).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxSchedule).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxDisease).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxInstitution).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxNotes).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));

        // check on load as well
        RadTxHxYesNo(RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes);
    }
   
    /* ]]> */
   
    function RadTxHxYesNo(RadTxHxRecordedID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes)
    {
       var RadTxHxRecordedRef = RadTxHxRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < RadTxHxRecordedRef.length; i++) 
        if (RadTxHxRecordedRef[i].checked) {  
            RadTxHxRadioClick(RadTxHxRecordedRef[i].value,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes);
            }
    }
    
    function RadTxHxRadioClick(RadTxHxoption_value,RadTxHxhideDiv,RadTxHxhideAbsentDiv,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes)
    {
      if (RadTxHxoption_value == "Yes")
      { 
        RadTxHxhideDiv.style.display='block';
        RadTxHxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_13.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_13.ClientID %>').value='';
        document.getElementById('<%= TableName_13.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_13.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_13.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_13.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_13.ClientID %>').value = '';
        
      } 
      else if (RadTxHxoption_value == "No" || RadTxHxoption_value == "Unknown")
      {
        RadTxHxhideAbsentDiv.style.display='block';
        RadTxHxhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_13.ClientID %>').value = 'RadiationTherapy';        
        document.getElementById('<%= FieldName_13.ClientID %>').value = 'RadTxType';        
        document.getElementById('<%= FieldValue_13.ClientID %>').value = document.getElementById('<%= ComponentTitle.ClientID %>').innerHTML; 
        
        if (RadTxHxoption_value == "No")       
            document.getElementById('<%= AbsentReason_13.ClientID %>').value = 'None Recorded';        
        if (RadTxHxoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_13.ClientID %>').value = 'Unknown';        

        document.getElementById('<%= AbsentQuality_13.ClientID %>').value = 'OUT';        

        RadTxDateText.value = '';
        RadTxDate.value = '';
        RadTxType.value = '';
        RadTxTarget.value = '';   
        RadTxTotalDose.value = '';
        RadTxUnits.value = '';   
        RadTxStopDateText.value = '';
        RadTxStopDate.value = '';
        RadTxDisease.value = '';
        RadTxSchedule.value = '';   
        RadTxInstitution.value = '';
        RadTxNotes.value = '';   
     }
    }
    
</script>