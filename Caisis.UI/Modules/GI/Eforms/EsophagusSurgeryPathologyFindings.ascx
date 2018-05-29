<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgeryPathologyFindings" CodeFile="EsophagusSurgeryPathologyFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.PathologyFindingsHtmlTable = "PathologyFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="EsophagusSurgeryPathologyFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Findings"></asp:Label><br/>
<table  width="400" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="PathologyFindingsHtmlTable" > 

          <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Site</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Subsite</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Side</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left">&nbsp;Size (cm)</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Result</td>
            <%--<td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Grade</td>--%>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Histology</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          
          <tr>
            <td>
                <euc:EformComboBox Width="100px" RecordId="1" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_1" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="1" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSubsite"  ID="PathFindSubsite_1" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="1" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSide"  ID="PathFindSide_1" LookupCode="FindSide,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformTextBox  Width="50px" RecordId="1" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_1"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="1" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindResult"  ID="PathFindResult_1" LookupCode="Result,Disease,@DiseaseView" Runat="server"   /></td>
             <%--<td>
                <euc:EformDropDownList Width="150px" RecordId="1" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_1" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server"   /> </td>--%>
            <td>
                <euc:EformComboBox Width="100px" RecordId="1" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindHistology"  ID="PathFindHistology_1" LookupCode="PathHistology,Disease,@DiseaseView" Runat="server"   /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td>
         </tr>
          <tr style="display: none; ">
            <td>
                <euc:EformComboBox Width="100px" RecordId="2" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_2" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="2" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSubsite"  ID="PathFindSubsite_2" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="2" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSide"  ID="PathFindSide_2" LookupCode="FindSide,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformTextBox  Width="50px" RecordId="2" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_2"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="2" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindResult"  ID="PathFindResult_2" LookupCode="Result,Disease,@DiseaseView" Runat="server"   /></td>
             <%--<td>
                <euc:EformDropDownList Width="150px" RecordId="2" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_2" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server"   /> </td>--%>
            <td>
                <euc:EformComboBox Width="100px" RecordId="2" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindHistology"  ID="PathFindHistology_2" LookupCode="PathHistology,Disease,@DiseaseView" Runat="server"   /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server"/></td>
         </tr>
          <tr style="display: none; ">
            <td>
                <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_3" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSubsite"  ID="PathFindSubsite_3" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSide"  ID="PathFindSide_3" LookupCode="FindSide,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformTextBox  Width="50px" RecordId="3" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_3"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindResult"  ID="PathFindResult_3" LookupCode="Result,Disease,@DiseaseView" Runat="server"   /></td>
             <%--<td>
                <euc:EformDropDownList Width="150px" RecordId="3" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_3" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server"   /> </td>--%>
            <td>
                <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindHistology"  ID="PathFindHistology_3" LookupCode="PathHistology,Disease,@DiseaseView" Runat="server"   /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_3" runat="server"/></td>
         </tr>
          <tr style="display: none; ">
            <td>
                <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_4" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSubsite"  ID="PathFindSubsite_4" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSide"  ID="PathFindSide_4" LookupCode="FindSide,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformTextBox  Width="50px" RecordId="4" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_4"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindResult"  ID="PathFindResult_4" LookupCode="Result,Disease,@DiseaseView" Runat="server"   /></td>
             <%--<td>
                <euc:EformDropDownList Width="150px" RecordId="4" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_4" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server"   /> </td>--%>
            <td>
                <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindHistology"  ID="PathFindHistology_4" LookupCode="PathHistology,Disease,@DiseaseView" Runat="server"   /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server"/></td>
         </tr>
          <tr style="display: none; ">
            <td>
                <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite5" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSubsite"  ID="PathFindSubsite5" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSide"  ID="PathFindSide5" LookupCode="FindSide,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformTextBox  Width="50px" RecordId="5" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth5"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindResult"  ID="PathFindResult5" LookupCode="Result,Disease,@DiseaseView" Runat="server"   /></td>
             <%--<td>
                <euc:EformDropDownList Width="150px" RecordId="5" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade5" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server"   /> </td>--%>
            <td>
                <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindHistology"  ID="PathFindHistology5" LookupCode="PathHistology,Disease,@DiseaseView" Runat="server"   /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
         </tr>
          <tr style="display: none; ">
            <td>
                <euc:EformComboBox Width="100px" RecordId="6" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_5" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="6" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSubsite"  ID="PathFindSubsite_5" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="6" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSide"  ID="PathFindSide_5" LookupCode="FindSide,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformTextBox  Width="50px" RecordId="6" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_5"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="6" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindResult"  ID="PathFindResult_5" LookupCode="Result,Disease,@DiseaseView" Runat="server"   /></td>
             <%--<td>
                <euc:EformDropDownList Width="150px" RecordId="6" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_5" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server"   /> </td>--%>
            <td>
                <euc:EformComboBox Width="100px" RecordId="6" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindHistology"  ID="PathFindHistology_5" LookupCode="PathHistology,Disease,@DiseaseView" Runat="server"   /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/></td>
         </tr>
          <tr style="display: none; ">
            <td>
                <euc:EformComboBox Width="100px" RecordId="7" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_7" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="7" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSubsite"  ID="PathFindSubsite_7" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="7" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSide"  ID="PathFindSide_7" LookupCode="FindSide,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformTextBox  Width="50px" RecordId="7" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_7"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="7" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindResult"  ID="PathFindResult_7" LookupCode="Result,Disease,@DiseaseView" Runat="server"   /></td>
             <%--<td>
                <euc:EformDropDownList Width="150px" RecordId="7" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_7" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server"   /> </td>--%>
            <td>
                <euc:EformComboBox Width="100px" RecordId="7" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindHistology"  ID="PathFindHistology_7" LookupCode="PathHistology,Disease,@DiseaseView" Runat="server"   /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/></td>
         </tr>
          <tr style="display: none; ">
            <td>
                <euc:EformComboBox Width="100px" RecordId="8" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_8" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="8" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSubsite"  ID="PathFindSubsite_8" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="8" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSide"  ID="PathFindSide_8" LookupCode="FindSide,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformTextBox  Width="50px" RecordId="8" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_8"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="8" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindResult"  ID="PathFindResult_8" LookupCode="Result,Disease,@DiseaseView" Runat="server"   /></td>
             <%--<td>
                <euc:EformDropDownList Width="150px" RecordId="8" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_8" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server"   /> </td>--%>
            <td>
                <euc:EformComboBox Width="100px" RecordId="8" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindHistology"  ID="PathFindHistology_8" LookupCode="PathHistology,Disease,@DiseaseView" Runat="server"   /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/></td>
         </tr>
          <tr style="display: none; ">
            <td>
                <euc:EformComboBox Width="100px" RecordId="9" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_9" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="9" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSubsite"  ID="PathFindSubsite_9" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="9" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSide"  ID="PathFindSide_9" LookupCode="FindSide,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformTextBox  Width="50px" RecordId="9" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_9"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="9" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindResult"  ID="PathFindResult_9" LookupCode="Result,Disease,@DiseaseView" Runat="server"   /></td>
             <%--<td>
                <euc:EformDropDownList Width="150px" RecordId="9" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_9" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server"   /> </td>--%>
            <td>
                <euc:EformComboBox Width="100px" RecordId="9" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindHistology"  ID="PathFindHistology_9" LookupCode="PathHistology,Disease,@DiseaseView" Runat="server"   /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_9" runat="server"/></td>
         </tr>
          <tr style="display: none; ">
            <td>
                <euc:EformComboBox Width="100px" RecordId="10" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_10" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="10" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSubsite"  ID="PathFindSubsite_10" LookupCode="DxTarget,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="10" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindSide"  ID="PathFindSide_10" LookupCode="FindSide,Disease,@DiseaseView" Runat="server"   /></td>
            <td>
                <euc:EformTextBox  Width="50px" RecordId="10" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_10"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="10" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindResult"  ID="PathFindResult_10" LookupCode="Result,Disease,@DiseaseView" Runat="server"   /></td>
             <%--<td>
                <euc:EformDropDownList Width="150px" RecordId="10" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_10" LookupCode="PathGrade,Disease,@DiseaseView" Runat="server"   /> </td>--%>
            <td>
                <euc:EformComboBox Width="100px" RecordId="10" ParentRecordId="11" TABLE="PathologyFinding" FIELD="PathFindHistology"  ID="PathFindHistology_10" LookupCode="PathHistology,Disease,@DiseaseView" Runat="server"   /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_10" runat="server"/></td>
         </tr>

</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathologyFindingsHtmlTable');" />

<br /><br /><br />


