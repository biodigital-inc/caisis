<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryProceduresPathFindings" CodeFile="PancreasSurgeryProceduresPathFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.PathologyFindingsHtmlTable = "PathologyFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="PancreasSurgeryProceduresPathFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Findings"></asp:Label><br/>
<table  width="400" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="PathologyFindingsHtmlTable" > 


          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Location</td>
                 <td class="controlBoxDataGridTitleColumn" style="text-align: left">&nbsp;Size (cm)</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Grade</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          


            
          <tr>
            <td>
                 <euc:EformComboBox Width="100px" RecordId="1" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_1" LookupCode="NYUPancFindSite" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_1"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

             <td>
                <euc:EformDropDownList Width="150px" RecordId="1" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_1" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server" TabIndex="8"  /> </td>

            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
         <tr >
            <td>
                <euc:EformComboBox Width="100px" RecordId="2" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_2" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="2" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_2"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformDropDownList Width="150px" RecordId="2" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_2" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server" TabIndex="8"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
         <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_3" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="3" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_3"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformDropDownList Width="150px" RecordId="3" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_3" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server" TabIndex="8"  /> </td>

            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
         <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_4" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="4" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_4"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformDropDownList Width="150px" RecordId="4" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_4" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server" TabIndex="8"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
 
         <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_5" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="5" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_5"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformDropDownList Width="150px" RecordId="5" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_5" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server" TabIndex="8"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
         <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="100px" RecordId="6" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_6" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="6" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_6"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformDropDownList Width="150px" RecordId="6" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_6" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server" TabIndex="8"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr> 
          <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="100px" RecordId="7" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_7" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="7" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_7"    Runat="server" TabIndex="7" ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformDropDownList Width="150px" RecordId="7" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_7" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server" TabIndex="8"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="100px" RecordId="8" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_8" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="8" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_8"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformDropDownList Width="150px" RecordId="8" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_8" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server" TabIndex="8"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="100px" RecordId="9" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_9" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="9" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_9"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformDropDownList Width="150px" RecordId="9" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_9" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server" TabIndex="8"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="100px" RecordId="10" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_10" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="10" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_10"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformDropDownList Width="150px" RecordId="10" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_10" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server" TabIndex="8"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathologyFindingsHtmlTable');" />

<br /><br /><br />


