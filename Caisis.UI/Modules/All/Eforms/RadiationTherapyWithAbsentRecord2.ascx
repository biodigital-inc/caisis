<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.RadiationTherapyWithAbsentRecord2" CodeFile="RadiationTherapyWithAbsentRecord2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.RadiationTherapyWithAbsentRecordHtmlTable = "RadiationTherapyWithAbsentRecordHtmlTable";
</script>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />


<a name="RadiationTherapyWithAbsentRecord2" /><br/>

<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiation Therapies"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="RadTxHxRecorded2" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="RadTxHxRecorded2">
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
            <euc:EformTextBox RecordId="15" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_15"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="15" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_15"
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_11"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_11"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_11"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_11"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_11"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_11"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_11a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_11" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_11"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_11"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_11"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_11"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="11" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_11"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_11b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_12">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_12"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_12"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_12"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_12"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_12"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_12"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_12a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_12" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_12"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_12"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_12"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_12"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="12" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_12"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_12b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_13">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_13"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_13"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_13"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_13"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_13"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_13"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_13a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_13" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_13"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_13"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_13"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_13"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="13" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_13"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_13b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_14">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_14"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_14"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_14"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_14"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_14"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_14"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_14a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_14" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_14"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_14"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_14"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_14"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="14" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_14"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_14b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_15">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_15"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_15"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_15"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_15"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_15"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_15"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_15a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_15" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_15"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_15"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_15"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_15"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="15" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_15"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_15b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_16">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_16"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_16"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_16"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_16"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_16"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_16"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_16a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_16" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_16"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_16"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_16"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_16"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="16" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_16"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_16b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_17">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_17"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_17"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_17"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_17"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_17"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_17"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_17a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_17" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_17"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_17"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_17"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_17"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="17" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_17"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_17b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_18">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_18"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_18"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_18"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_18"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_18"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_18"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_18a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_18" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_18"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_18"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_18"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_18"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="18" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_18"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_18b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_19">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_19"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_19"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_19"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_19"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_19"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_19"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_19a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_19" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_19"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_19"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_19"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_19"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="19" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_19"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_19b" runat="server"/></td>
              </tr>
            
            </table>
        </td>
    </tr>

    <tr style="display: none; ">
        <td>
            <table cellpadding="5" cellspacing="0" border="0" id="RadiationTherapyWithAbsentRecordHtmlTable_20">
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
                                                <euc:EformTextBox  style="width:80px;" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxDateText"     ID="RadTxDateText_20"     Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxDate"         ID="RadTxDate_20"         Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxType"     ID="RadTxType_20"     Runat="server" LookupCode="RadTxType,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxTarget"      ID="RadTxTarget_20"      Runat="server" LookupCode="RadTxTarget,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:65px;"  RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxTotalDose"         ID="RadTxTotalDose_20"         Runat="server" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxUnits"        ID="RadTxUnits_20"        Runat="server" LookupCode="RadTxUnits,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_20a" runat="server"/></td>
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
                <td style="white-space:nowrap;"><euc:EformTextBox  style="width:80px;" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" ID="RadTxStopDateText_20" Runat="server" ShowCalendar="True" CalcDate="True"  />
                                                <euc:EformHidden                       RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxStopDate"     ID="RadTxStopDate_20"     Runat="server" />    </td> 
                <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"   Width="100px" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxSchedule"        ID="RadTxSchedule_20"        Runat="server" LookupCode="MedSchedule,Disease,@DiseaseView"  /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxDisease"     ID="RadTxDisease_20"     Runat="server" LookupCode="Disease,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformComboBox Width="100px" RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxInstitution"     ID="RadTxInstitution_20"     Runat="server" LookupCode="Institution,Disease,@DiseaseView" /></td>
                <td style="white-space:nowrap;"><euc:EformTextBox  Width="100px"  RecordId="20" TABLE="RadiationTherapy" FIELD="RadTxNotes"       ID="RadTxNotes_20"  Runat="server" ShowTextEditor="true" /></td>
                <td style="white-space:nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_20b" runat="server"/></td>
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
            <euc:EformTextBox RecordId="15" Table="AbsentEvents" Field="TableName" ID="TableName_15"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="15" Table="AbsentEvents" Field="FieldName" ID="FieldName_15"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="15" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_15"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="15" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_15"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="15" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_15"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= RadTxHxRecorded2.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_11.ClientID %>'),$('<%= RadTxDate_11.ClientID %>'),$('<%= RadTxType_11.ClientID %>'),$('<%= RadTxTarget_11.ClientID %>'),$('<%= RadTxTotalDose_11.ClientID %>'),$('<%= RadTxUnits_11.ClientID %>'),$('<%= RadTxStopDateText_11.ClientID %>'),$('<%= RadTxStopDate_11.ClientID %>'),$('<%= RadTxSchedule_11.ClientID %>'),$('<%= RadTxDisease_11.ClientID %>'),$('<%= RadTxInstitution_11.ClientID %>'),$('<%= RadTxNotes_11.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded2.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_12.ClientID %>'),$('<%= RadTxDate_12.ClientID %>'),$('<%= RadTxType_12.ClientID %>'),$('<%= RadTxTarget_12.ClientID %>'),$('<%= RadTxTotalDose_12.ClientID %>'),$('<%= RadTxUnits_12.ClientID %>'),$('<%= RadTxStopDateText_12.ClientID %>'),$('<%= RadTxStopDate_12.ClientID %>'),$('<%= RadTxSchedule_12.ClientID %>'),$('<%= RadTxDisease_12.ClientID %>'),$('<%= RadTxInstitution_12.ClientID %>'),$('<%= RadTxNotes_12.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded2.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_13.ClientID %>'),$('<%= RadTxDate_13.ClientID %>'),$('<%= RadTxType_13.ClientID %>'),$('<%= RadTxTarget_13.ClientID %>'),$('<%= RadTxTotalDose_13.ClientID %>'),$('<%= RadTxUnits_13.ClientID %>'),$('<%= RadTxStopDateText_13.ClientID %>'),$('<%= RadTxStopDate_13.ClientID %>'),$('<%= RadTxSchedule_13.ClientID %>'),$('<%= RadTxDisease_13.ClientID %>'),$('<%= RadTxInstitution_13.ClientID %>'),$('<%= RadTxNotes_13.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded2.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_14.ClientID %>'),$('<%= RadTxDate_14.ClientID %>'),$('<%= RadTxType_14.ClientID %>'),$('<%= RadTxTarget_14.ClientID %>'),$('<%= RadTxTotalDose_14.ClientID %>'),$('<%= RadTxUnits_14.ClientID %>'),$('<%= RadTxStopDateText_14.ClientID %>'),$('<%= RadTxStopDate_14.ClientID %>'),$('<%= RadTxSchedule_14.ClientID %>'),$('<%= RadTxDisease_14.ClientID %>'),$('<%= RadTxInstitution_14.ClientID %>'),$('<%= RadTxNotes_14.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded2.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_15.ClientID %>'),$('<%= RadTxDate_15.ClientID %>'),$('<%= RadTxType_15.ClientID %>'),$('<%= RadTxTarget_15.ClientID %>'),$('<%= RadTxTotalDose_15.ClientID %>'),$('<%= RadTxUnits_15.ClientID %>'),$('<%= RadTxStopDateText_15.ClientID %>'),$('<%= RadTxStopDate_15.ClientID %>'),$('<%= RadTxSchedule_15.ClientID %>'),$('<%= RadTxDisease_15.ClientID %>'),$('<%= RadTxInstitution_15.ClientID %>'),$('<%= RadTxNotes_15.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded2.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_16.ClientID %>'),$('<%= RadTxDate_16.ClientID %>'),$('<%= RadTxType_16.ClientID %>'),$('<%= RadTxTarget_16.ClientID %>'),$('<%= RadTxTotalDose_16.ClientID %>'),$('<%= RadTxUnits_16.ClientID %>'),$('<%= RadTxStopDateText_16.ClientID %>'),$('<%= RadTxStopDate_16.ClientID %>'),$('<%= RadTxSchedule_16.ClientID %>'),$('<%= RadTxDisease_16.ClientID %>'),$('<%= RadTxInstitution_16.ClientID %>'),$('<%= RadTxNotes_16.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded2.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_17.ClientID %>'),$('<%= RadTxDate_17.ClientID %>'),$('<%= RadTxType_17.ClientID %>'),$('<%= RadTxTarget_17.ClientID %>'),$('<%= RadTxTotalDose_17.ClientID %>'),$('<%= RadTxUnits_17.ClientID %>'),$('<%= RadTxStopDateText_17.ClientID %>'),$('<%= RadTxStopDate_17.ClientID %>'),$('<%= RadTxSchedule_17.ClientID %>'),$('<%= RadTxDisease_17.ClientID %>'),$('<%= RadTxInstitution_17.ClientID %>'),$('<%= RadTxNotes_17.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded2.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_18.ClientID %>'),$('<%= RadTxDate_18.ClientID %>'),$('<%= RadTxType_18.ClientID %>'),$('<%= RadTxTarget_18.ClientID %>'),$('<%= RadTxTotalDose_18.ClientID %>'),$('<%= RadTxUnits_18.ClientID %>'),$('<%= RadTxStopDateText_18.ClientID %>'),$('<%= RadTxStopDate_18.ClientID %>'),$('<%= RadTxSchedule_18.ClientID %>'),$('<%= RadTxDisease_18.ClientID %>'),$('<%= RadTxInstitution_18.ClientID %>'),$('<%= RadTxNotes_18.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded2.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_19.ClientID %>'),$('<%= RadTxDate_19.ClientID %>'),$('<%= RadTxType_19.ClientID %>'),$('<%= RadTxTarget_19.ClientID %>'),$('<%= RadTxTotalDose_19.ClientID %>'),$('<%= RadTxUnits_19.ClientID %>'),$('<%= RadTxStopDateText_19.ClientID %>'),$('<%= RadTxStopDate_19.ClientID %>'),$('<%= RadTxSchedule_19.ClientID %>'),$('<%= RadTxDisease_19.ClientID %>'),$('<%= RadTxInstitution_19.ClientID %>'),$('<%= RadTxNotes_19.ClientID %>'));
    addAbsentEvent($('<%= RadTxHxRecorded2.ClientID %>'),$('<%= RadTxHxDiv.ClientID %>'),$('<%= RadTxHxAbsentDiv.ClientID %>'),$('<%= RadTxDateText_20.ClientID %>'),$('<%= RadTxDate_20.ClientID %>'),$('<%= RadTxType_20.ClientID %>'),$('<%= RadTxTarget_20.ClientID %>'),$('<%= RadTxTotalDose_20.ClientID %>'),$('<%= RadTxUnits_20.ClientID %>'),$('<%= RadTxStopDateText_20.ClientID %>'),$('<%= RadTxStopDate_20.ClientID %>'),$('<%= RadTxSchedule_20.ClientID %>'),$('<%= RadTxDisease_20.ClientID %>'),$('<%= RadTxInstitution_20.ClientID %>'),$('<%= RadTxNotes_20.ClientID %>'));

    function addAbsentEvent(RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes)
    {  
        $(RadTxHxRecorded2ID).addEvent('click',curry(RadTxHxYesNo,RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxType).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxTarget).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxTotalDose).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxUnits).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxStopDateText).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxSchedule).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxDisease).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxInstitution).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));
        $(RadTxNotes).addEvent('blur',curry(RadTxHxYesNo,RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes));

        // check on load as well
        RadTxHxYesNo(RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes);
    }
   
    /* ]]> */
   
    function RadTxHxYesNo(RadTxHxRecorded2ID,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes)
    {
       var RadTxHxRecorded2Ref = RadTxHxRecorded2ID.getElementsByTagName('input');
       
       for (var i = 0; i < RadTxHxRecorded2Ref.length; i++) 
        if (RadTxHxRecorded2Ref[i].checked) {  
            RadTxHxRadioClick(RadTxHxRecorded2Ref[i].value,RadTxHxDivID,RadTxHxAbsentDivID,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes);
            }
    }
    
    function RadTxHxRadioClick(RadTxHxoption_value,RadTxHxhideDiv,RadTxHxhideAbsentDiv,RadTxDateText,RadTxDate,RadTxType,RadTxTarget,RadTxTotalDose,RadTxUnits,RadTxStopDateText,RadTxStopDate,RadTxSchedule,RadTxDisease,RadTxInstitution,RadTxNotes)
    {
      if (RadTxHxoption_value == "Yes")
      { 
        RadTxHxhideDiv.style.display='block';
        RadTxHxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_15.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_15.ClientID %>').value='';
        document.getElementById('<%= TableName_15.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_15.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_15.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_15.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_15.ClientID %>').value = '';
        
      } 
      else if (RadTxHxoption_value == "No" || RadTxHxoption_value == "Unknown")
      {
        RadTxHxhideAbsentDiv.style.display='block';
        RadTxHxhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_15.ClientID %>').value = 'RadiationTherapy';        
        document.getElementById('<%= FieldName_15.ClientID %>').value = 'RadTxType';        
        document.getElementById('<%= FieldValue_15.ClientID %>').value = document.getElementById('<%= ComponentTitle.ClientID %>').innerHTML; 
        
        if (RadTxHxoption_value == "No")       
            document.getElementById('<%= AbsentReason_15.ClientID %>').value = 'None Recorded';        
        if (RadTxHxoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_15.ClientID %>').value = 'Unknown';        

        document.getElementById('<%= AbsentQuality_15.ClientID %>').value = 'OUT';        

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