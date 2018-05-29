<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ProceduresPathTests" CodeFile="ProceduresPathTests.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
   tableArray.ProceduresPathTestsHtmlTable = "ProceduresPathTestsHtmlTable";
	}
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="ProceduresPathTests" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Tests"></asp:Label><br/>
<table  width="550" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ProceduresPathTestsHtmlTable" > 

      <tr>
	        <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date </td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Test Type</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Results</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Units</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
      </tr>
    <tr>
        <td align="left">
                <euc:EformTextBox  Width="100px" RecordId="1" ParentRecordId="1"   TABLE="PathTest" FIELD="PathDateText" ID="PathTestDateText_1" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="1" ParentRecordId="1"  TABLE="PathTest" FIELD="PathDate"     ID="PathTestDate_1"     Runat="server"/></td>
        
        <td align="left">
            <euc:EformComboBox style="width: 80px;" RecordId="1" ParentRecordId="1"  TABLE="PathTest" FIELD="PathTest" ID="PathTest_1" LookupCode="PathTest" Runat="server"  TabIndex="2"  /></td>

        <td align="left">
            <euc:EformTextBox style="width: 80px;" RecordId="1" ParentRecordId="1"  TABLE="PathTest" FIELD="PathResult" ID="PathResult_1" Runat="server"  TabIndex="2"/></td>

        <td align="left">
            <euc:EformComboBox style="width: 80px;" RecordId="1" ParentRecordId="1"  TABLE="PathTest" FIELD="PathUnits" ID="PathUnits_1" LookupCode="LabUnits" Runat="server"  TabIndex="2"  /></td>

        <td >
            <euc:EformDeleteIcon Runat="server"/></td>
    </tr>
    <tr>
        <td align="left">
                <euc:EformTextBox  Width="100px" RecordId="2" ParentRecordId="1"   TABLE="PathTest" FIELD="PathDateText" ID="PathTestDateText_2" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="2" ParentRecordId="1"  TABLE="PathTest" FIELD="PathDate"     ID="PathTestDate_2"     Runat="server"/></td>
        
        <td align="left">
            <euc:EformComboBox style="width: 80px;" RecordId="2" ParentRecordId="1"  TABLE="PathTest" FIELD="PathTest" ID="PathTest_2" LookupCode="PathTest" Runat="server"  TabIndex="2"  /></td>

        <td align="left">
            <euc:EformTextBox style="width: 80px;" RecordId="2" ParentRecordId="1"  TABLE="PathTest" FIELD="PathResult" ID="PathResult_2" Runat="server"  TabIndex="2"/></td>

        <td align="left">
            <euc:EformComboBox style="width: 80px;" RecordId="2" ParentRecordId="1"  TABLE="PathTest" FIELD="PathUnits" ID="PathUnits_2" LookupCode="LabUnits" Runat="server"  TabIndex="2"  /></td>

        <td >
            <euc:EformDeleteIcon Runat="server"/></td>
   </tr>
   <tr style="display: none;">       
        <td align="left">
                <euc:EformTextBox  Width="100px" RecordId="3" ParentRecordId="1"   TABLE="PathTest" FIELD="PathDateText" ID="PathTestDateText_3" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="3" ParentRecordId="1"  TABLE="PathTest" FIELD="PathDate"     ID="PathTestDate_3"     Runat="server"/></td>
        
        <td align="left">
            <euc:EformComboBox style="width: 80px;" RecordId="3" ParentRecordId="1"  TABLE="PathTest" FIELD="PathTest" ID="PathTest_3" LookupCode="PathTest" Runat="server"  TabIndex="2"  /></td>

        <td align="left">
            <euc:EformTextBox style="width: 80px;" RecordId="3" ParentRecordId="1"  TABLE="PathTest" FIELD="PathResult" ID="PathResult_3" Runat="server"  TabIndex="2"/></td>

        <td align="left">
            <euc:EformComboBox style="width: 80px;" RecordId="3" ParentRecordId="1"  TABLE="PathTest" FIELD="PathUnits" ID="PathUnits_3" LookupCode="LabUnits" Runat="server"  TabIndex="2"  /></td>

        <td >
            <euc:EformDeleteIcon Runat="server"/></td>
                
    </tr>
   <tr style="display: none;">       
        <td align="left">
                <euc:EformTextBox  Width="100px" RecordId="4" ParentRecordId="1"   TABLE="PathTest" FIELD="PathDateText" ID="PathTestDateText_4" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="4" ParentRecordId="1"  TABLE="PathTest" FIELD="PathDate"     ID="PathTestDate_4"     Runat="server"/></td>
        
        <td align="left">
            <euc:EformComboBox style="width: 80px;" RecordId="4" ParentRecordId="1"  TABLE="PathTest" FIELD="PathTest" ID="PathTest_4" LookupCode="PathTest" Runat="server"  TabIndex="2"  /></td>

        <td align="left">
            <euc:EformTextBox style="width: 80px;" RecordId="4" ParentRecordId="1"  TABLE="PathTest" FIELD="PathResult" ID="PathResult_4" Runat="server"  TabIndex="2"/></td>

        <td align="left">
            <euc:EformComboBox style="width: 80px;" RecordId="4" ParentRecordId="1"  TABLE="PathTest" FIELD="PathUnits" ID="PathUnits_4" LookupCode="LabUnits" Runat="server"  TabIndex="2"  /></td>

        <td >
            <euc:EformDeleteIcon Runat="server"/></td>
                
    </tr>
   <tr style="display: none;">       
        <td align="left">
                <euc:EformTextBox  Width="100px" RecordId="5" ParentRecordId="1"   TABLE="PathTest" FIELD="PathDateText" ID="PathTestDateText_5" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="5" ParentRecordId="1"  TABLE="PathTest" FIELD="PathDate"     ID="PathTestDate_5"     Runat="server"/></td>
        
        <td align="left">
            <euc:EformComboBox style="width: 80px;" RecordId="5" ParentRecordId="1"  TABLE="PathTest" FIELD="PathTest" ID="PathTest_5" LookupCode="PathTest" Runat="server"  TabIndex="2"  /></td>

        <td align="left">
            <euc:EformTextBox style="width: 80px;" RecordId="5" ParentRecordId="1"  TABLE="PathTest" FIELD="PathResult" ID="PathResult_5" Runat="server"  TabIndex="2"/></td>

        <td align="left">
            <euc:EformComboBox style="width: 80px;" RecordId="5" ParentRecordId="1"  TABLE="PathTest" FIELD="PathUnits" ID="PathUnits_5" LookupCode="LabUnits" Runat="server"  TabIndex="2"  /></td>

        <td >
            <euc:EformDeleteIcon Runat="server"/></td>
                
    </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresPathTestsHtmlTable');" />

<br />

<br /><br /><br />


