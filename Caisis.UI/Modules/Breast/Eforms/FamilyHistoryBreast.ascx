<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.FamilyHistoryBreast"
    CodeFile="FamilyHistoryBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.FamilyHistoryTable = "FamilyHistoryTable";
	tableArray.famMemDiag_1 = "famMemDiag_1";
	tableArray.famMemDiag_2 = "famMemDiag_2";
	tableArray.famMemDiag_3 = "famMemDiag_3";
	tableArray.famMemDiag_4 = "famMemDiag_4";
	tableArray.famMemDiag_5 = "famMemDiag_5";
	tableArray.famMemDiag_6 = "famMemDiag_6";
	tableArray.famMemDiag_7 = "famMemDiag_7";
	tableArray.famMemDiag_8 = "famMemDiag_8";
	tableArray.famMemDiag_9 = "famMemDiag_9";
	tableArray.famMemDiag_10 = "famMemDiag_10";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="FamilyHistoryBreast" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Family History"></asp:Label><br />
<br />
<table width="500" border="0" cellpadding="0" cellspacing="0" class="ClinicalEformTable"
    id="Table1">
    <asp:Repeater ID="FamilyMemHx" runat="server" OnItemDataBound="EFormRepeaterOnDataBound">
        <ItemTemplate>
            <tr class="controlBoxDataGridTitleColumn">
                <%--<td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                    &nbsp;Side of Family
                </td>--%>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                    Relation
                </td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" colspan="2">
                    Death Age
                </td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                    &nbsp;
                </td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                    &nbsp;
                </td>
            </tr>
            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';"
                onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('FamilyMembers',  <%# DataBinder.Eval(Container.DataItem, "FamilyMemberId") %>, 'FamMemSide,FamMemRelation,FamMemDeathAge', 'FamilyMembers');">
                <%--<td class="ClinicalEformPopulatedColumn">
                    &nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemSide")%>
                </td>--%>
                <td class="ClinicalEformPopulatedColumn">
                    &nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemRelation")%>
                </td>
                <td class="ClinicalEformPopulatedColumn" colspan="2">
                    &nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemDeathAge")%>
                </td>
                <td class="ClinicalEformPopulatedColumn">
                    &nbsp;
                </td>
                <td class="ClinicalEformPopulatedColumn">
                    <img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9"
                        height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;
                </td>
            </tr>
            <tr class="controlBoxDataGridTitleColumn">
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                    &nbsp;Diagnosis
                </td>
                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                    Notes
                </td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                    &nbsp;
                </td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                </td>
            </tr>
            <asp:Repeater ID="FamilyMemHx2" runat="server">
                <ItemTemplate>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';"
                        onmouseout="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('FamilyMemberDiagnosis', <%# DataBinder.Eval(Container.DataItem, "FamilyMemberDiagnosisId") %>, 'FamMemDiagnosis,FamMemDiagnosisAge,FamMemNotes', 'FamilyMemberDiagnosis');">
                        <td class="ClinicalEformPopulatedColumn">
                            &nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemDiagnosis")%>
                        </td>
                        <td colspan="2" class="ClinicalEformPopulatedColumn">
                            &nbsp;<%# DataBinder.Eval(Container.DataItem, "FamMemNotes")%>
                        </td>
                        <td align="center" class="ClinicalEformPopulatedColumn">
                            &nbsp;
                        </td>
                        <td class="ClinicalEformPopulatedColumn">
                            <img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9"
                                height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td style="text-align: left;" colspan="3">
                    &nbsp;
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <tr id="NoFamMemHxMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable">
        <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
            No family member history has been recorded for this patient.
        </td>
    </tr>
</table>
<br />
<strong>Add Family History</strong>
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="FamilyHistoryTable">
    <tr>
        <%--<td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
            &nbsp;Side of Family
        </td>--%>
        <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
            &nbsp;Relation
        </td>
        <td width="25%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
            &nbsp;Diagnosis
        </td>
        <td width="15%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
            Notes
        </td>
        <td width="13%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
            &nbsp;
        </td>
    </tr>
    <tr>
        <%--<td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemSide"
                ID="FamMemSide_1" RecordId="1" runat="server"  LookupCode="FamMemSide" />
        </td>--%>
        <td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemRelation"
                ID="FamMemRelation_1" RecordId="1" runat="server"  LookupCode="FamHxRelation" />
        </td>
        <td height="28" class="controlBoxDataGridValueColumn" colspan="3">
            <table id="famMemDiag_1" cellspacing="0">
                <tr>
                    <td height="28" width="49%" valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_1a" RecordId="1" runat="server"  LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%" valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_1a" RecordId="1" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_1b" style="display: none">
                    <td height="28" width="49%" valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_1b" RecordId="2" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_1b" RecordId="2" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_1c" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_1c" RecordId="3" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_1c" RecordId="3" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-top: 0px; border-top: solid 1px #cccccc;">
                        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
                            border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'famMemDiag_1');" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="ControlBoxLinedRows" align="center" valign="middle">
            <euc:EformDeleteIcon runat="server" />
        </td>
    </tr>
    <tr style="display: none">
        <%--<td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemSide"
                ID="FamMemSide_2" RecordId="2" runat="server" LookupCode="FamMemSide" />
        </td>--%>
        <td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemRelation"
                ID="FamMemRelation_2" RecordId="2" runat="server" LookupCode="FamHxRelation" />
        </td>
        <td height="28" class="controlBoxDataGridValueColumn" colspan="3">
            <table id="famMemDiag_2" cellspacing="0">
                <tr>
                    <td height="28" width="49%" valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_2a" RecordId="1" ParentRecordId="2" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_2a" RecordId="1" ParentRecordId="2" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_2b" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_2b" RecordId="2" ParentRecordId="2" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_2b" RecordId="2" ParentRecordId="2" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_2c" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_2c" RecordId="3" ParentRecordId="2" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_2c" RecordId="3" ParentRecordId="2" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-top: 0px; border-top: solid 1px #cccccc;">
                        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
                            border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'famMemDiag_2');" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="ControlBoxLinedRows" align="center" valign="middle">
            <euc:EformDeleteIcon runat="server" />
        </td>
    </tr>
    <tr style="display: none">
        <%--<td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemSide"
                ID="FamMemSide_3" RecordId="3" runat="server" LookupCode="FamMemSide" />
        </td>--%>
        <td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemRelation"
                ID="FamMemRelation_3" RecordId="3" runat="server" LookupCode="FamHxRelation" />
        </td>
        <td height="28" class="controlBoxDataGridValueColumn" colspan="3">
            <table id="famMemDiag_3" cellspacing="0">
                <tr>
                    <td height="28" width="49%" valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_3a" RecordId="1" ParentRecordId="3" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_3a" RecordId="1" ParentRecordId="3" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_3b" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_3b" RecordId="2" ParentRecordId="3" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_3b" RecordId="2" ParentRecordId="3" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_3c" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_3c" RecordId="3" ParentRecordId="3" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_3c" RecordId="3" ParentRecordId="3" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-top: 0px; border-top: solid 1px #cccccc;">
                        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
                            border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'famMemDiag_3');" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="ControlBoxLinedRows" align="center" valign="middle">
            <euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" />
        </td>
    </tr>
    
    <tr style="display: none">
        <%--<td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemSide"
                ID="FamMemSide_4" RecordId="4" runat="server" LookupCode="FamMemSide" />
        </td>--%>
        <td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemRelation"
                ID="FamMemRelation_4" RecordId="4" runat="server" LookupCode="FamHxRelation" />
        </td>
        <td height="28" class="controlBoxDataGridValueColumn" colspan="3">
            <table id="famMemDiag_4" cellspacing="0">
                <tr>
                    <td height="28" width="49%" valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_4a" RecordId="1" ParentRecordId="4" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_4a" RecordId="1" ParentRecordId="4" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_4b" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_4b" RecordId="2" ParentRecordId="4" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_4b" RecordId="2" ParentRecordId="4" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_4c" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_4c" RecordId="3" ParentRecordId="4" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_4c" RecordId="3" ParentRecordId="4" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-top: 0px; border-top: solid 1px #cccccc;">
                        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
                            border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'famMemDiag_4');" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="ControlBoxLinedRows" align="center" valign="middle">
            <euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" />
        </td>
    </tr>
    
    <tr style="display: none">
        <%--<td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemSide"
                ID="FamMemSide_5" RecordId="5" runat="server" LookupCode="FamMemSide" />
        </td>--%>
        <td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemRelation"
                ID="FamMemRelation_5" RecordId="5" runat="server" LookupCode="FamHxRelation" />
        </td>
        <td height="28" class="controlBoxDataGridValueColumn" colspan="3">
            <table id="famMemDiag_5" cellspacing="0">
                <tr>
                    <td height="28" width="49%" valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_5a" RecordId="1" ParentRecordId="5" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_5a" RecordId="1" ParentRecordId="5" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_5b" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_5b" RecordId="2" ParentRecordId="5" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_5b" RecordId="2" ParentRecordId="5" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_5c" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_5c" RecordId="3" ParentRecordId="5" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_5c" RecordId="3" ParentRecordId="5" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-top: 0px; border-top: solid 1px #cccccc;">
                        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
                            border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'famMemDiag_5');" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="ControlBoxLinedRows" align="center" valign="middle"><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" /></td>
    </tr>
    
    <tr style="display: none">
        <%--<td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemSide"
                ID="FamMemSide_6" RecordId="6" runat="server" LookupCode="FamMemSide" />
        </td>--%>
        <td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemRelation"
                ID="FamMemRelation_6" RecordId="6" runat="server" LookupCode="FamHxRelation" />
        </td>
        <td height="28" class="controlBoxDataGridValueColumn" colspan="3">
            <table id="famMemDiag_6" cellspacing="0">
                <tr>
                    <td height="28" width="49%" valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_6a" RecordId="1" ParentRecordId="6" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_6a" RecordId="1" ParentRecordId="6" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_6b" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_6b" RecordId="2" ParentRecordId="6" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_6b" RecordId="2" ParentRecordId="6" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_6c" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_6c" RecordId="3" ParentRecordId="6" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_6c" RecordId="3" ParentRecordId="6" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-top: 0px; border-top: solid 1px #cccccc;">
                        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
                            border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'famMemDiag_6');" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="ControlBoxLinedRows" align="center" valign="middle">
            <euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" />
        </td>
    </tr>
    
    <tr style="display: none">
        <%--<td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemSide"
                ID="FamMemSide_7" RecordId="7" runat="server" LookupCode="FamMemSide" />
        </td>--%>
        <td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemRelation"
                ID="FamMemRelation_7" RecordId="7" runat="server" LookupCode="FamHxRelation" />
        </td>
        <td height="28" class="controlBoxDataGridValueColumn" colspan="3">
            <table id="famMemDiag_7" cellspacing="0">
                <tr>
                    <td height="28" width="49%" valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_7a" RecordId="1" ParentRecordId="7" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_7a" RecordId="1" ParentRecordId="7" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_7b" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_7b" RecordId="2" ParentRecordId="7" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_7b" RecordId="2" ParentRecordId="7" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_7c" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_7c" RecordId="3" ParentRecordId="7" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_7c" RecordId="3" ParentRecordId="7" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-top: 0px; border-top: solid 1px #cccccc;">
                        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
                            border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'famMemDiag_7');" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="ControlBoxLinedRows" align="center" valign="middle">
            <euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" />
        </td>
    </tr>
    
    <tr style="display: none">
        <%--<td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemSide"
                ID="FamMemSide_8" RecordId="8" runat="server" LookupCode="FamMemSide" />
        </td>--%>
        <td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemRelation"
                ID="FamMemRelation_8" RecordId="8" runat="server" LookupCode="FamHxRelation" />
        </td>
        <td height="28" class="controlBoxDataGridValueColumn" colspan="3">
            <table id="famMemDiag_8" cellspacing="0">
                <tr>
                    <td height="28" width="49%" valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_8a" RecordId="1" ParentRecordId="8" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_8a" RecordId="1" ParentRecordId="8" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_8b" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_8b" RecordId="2" ParentRecordId="8" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_8b" RecordId="2" ParentRecordId="8" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_8c" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_8c" RecordId="3" ParentRecordId="8" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_8c" RecordId="3" ParentRecordId="8" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-top: 0px; border-top: solid 1px #cccccc;">
                        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
                            border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'famMemDiag_8');" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="ControlBoxLinedRows" align="center" valign="middle">
            <euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server" />
        </td>
    </tr>
    
    <tr style="display: none">
        <%--<td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemSide"
                ID="FamMemSide_9" RecordId="9" runat="server" LookupCode="FamMemSide" />
        </td>--%>
        <td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemRelation"
                ID="FamMemRelation_9" RecordId="9" runat="server" LookupCode="FamHxRelation" />
        </td>
        <td height="28" class="controlBoxDataGridValueColumn" colspan="3">
            <table id="famMemDiag_9" cellspacing="0">
                <tr>
                    <td height="28" width="49%" valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_9a" RecordId="1" ParentRecordId="9" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_9a" RecordId="1" ParentRecordId="9" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon25" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_9b" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_9b" RecordId="2" ParentRecordId="9" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_9b" RecordId="2" ParentRecordId="9" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon26" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_9c" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_9c" RecordId="3" ParentRecordId="9" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_9c" RecordId="3" ParentRecordId="9" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon27" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-top: 0px; border-top: solid 1px #cccccc;">
                        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
                            border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'famMemDiag_9');" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="ControlBoxLinedRows" align="center" valign="middle">
            <euc:EformDeleteIcon ID="EformDeleteIcon28" runat="server" />
        </td>
    </tr>
    
    <tr style="display: none">
        <%--<td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemSide"
                ID="FamMemSide_10" RecordId="10" runat="server" LookupCode="FamMemSide" />
        </td>--%>
        <td height="28" valign="top">
            <euc:EformComboBox Style="width: 80px;" Table="FamilyMembers" Field="FamMemRelation"
                ID="FamMemRelation_10" RecordId="10" runat="server" LookupCode="FamHxRelation" />
        </td>
        <td height="28" class="controlBoxDataGridValueColumn" colspan="3">
            <table id="famMemDiag_10" cellspacing="0">
                <tr>
                    <td height="28" width="49%" valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_10a" RecordId="1" ParentRecordId="10" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_10a" RecordId="1" ParentRecordId="10" runat="server" ShowTextEditor="true" />
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon29" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_10b" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_10b" RecordId="2" ParentRecordId="10" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_10b" RecordId="2" ParentRecordId="10" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon30" runat="server" />
                    </td>
                </tr>
                <tr id="famMemDiag_10c" style="display: none">
                    <td height="28" width="49%"  valign="top">
                        <euc:EformComboBox Style="width: 90px;" Table="FamilyMemberDiagnosis" Field="FamMemDiagnosis"
                            ID="FamMemDiagnosis_10c" RecordId="3" ParentRecordId="10" runat="server" LookupCode="FamMemDiagnosis" />
                    </td>
                    <td height="28" width="20%"  valign="top">
                        <euc:EformTextBox Style="width: 100px;" Table="FamilyMemberDiagnosis" Field="FamMemNotes"
                            ID="FamMemNotes_10c" RecordId="3" ParentRecordId="10" runat="server" ShowTextEditor="true"/>
                    </td>
                    <td class="controlBoxDataGridValueColumn" align="center">
                        <euc:EformDeleteIcon ID="EformDeleteIcon31" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="padding-top: 0px; border-top: solid 1px #cccccc;">
                        <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
                            border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'famMemDiag_10');" />
                    </td>
                </tr>
            </table>
        </td>
        <td class="ControlBoxLinedRows" align="center" valign="middle">
            <euc:EformDeleteIcon ID="EformDeleteIcon32" runat="server" />
        </td>
    </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
    border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'FamilyHistoryTable');" />
<br /><br /><br />