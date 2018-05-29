<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ProceduresPathFindings" CodeFile="ProceduresPathFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.PathologyFindingsHtmlTable = "PathologyFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="ProceduresPathFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Findings"></asp:Label><br/>
<table  width="1300" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="PathologyFindingsHtmlTable" > 


          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Side</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Site</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Subsite</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Histology</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Height (cm)</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left">&nbsp;Width (cm)</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Length (cm) </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Grade</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Result</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          

          <asp:Repeater ID="AncillaryProcs" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                <ItemTemplate> 
                    <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, 'ProcFindSide,ProcFindSite,ProcFindSubsite,Histology,Height,Width,Length,Grade,Result', 'PathologyFindingsHtmlTable');"> 
                        <td align="center" class="ClinicalEformPopulatedColumn" >&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindSide")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindSite")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindSubsite")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindHistology")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindHeight")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindWidth")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindLength")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindGrade")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindResult")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
                        <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
                    </tr>      
                </ItemTemplate>
            </asp:Repeater>
            
          <tr>
            <td>
                <euc:EformSelect  Width="80px" RecordId="1"  ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSide" ID="ProcFindSide_1" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_1" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSubsite" ID="ProcFindSubsite_1"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_1" LookupCode="PathHistology"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="1" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_1"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="1" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_1"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="1" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindLength"    ID="PathFindLength_1"    Runat="server" TabIndex="7" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="1" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_1" LookupCode="PathGrade" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformSelect Width="80px" RecordId="1" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_1" LookupCode="Result" Runat="server" TabIndex="9"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
         <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="2"  ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSide" ID="ProcFindSide_2" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_2" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSubsite" ID="ProcFindSubsite_2"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_2" LookupCode="PathHistology"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="2" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_2"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="2" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_2"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="2" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindLength"    ID="PathFindLength_2"    Runat="server" TabIndex="7" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="2" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_2" LookupCode="PathGrade" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformSelect Width="80px" RecordId="2" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_2" LookupCode="Result" Runat="server" TabIndex="9"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
         <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="3"  ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSide" ID="ProcFindSide_3" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_3" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSubsite" ID="ProcFindSubsite_3"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_3" LookupCode="PathHistology"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="3" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_3"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="3" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_3"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="3" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindLength"    ID="PathFindLength_3"    Runat="server" TabIndex="7" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="3" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_3" LookupCode="PathGrade" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformSelect Width="80px" RecordId="3" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_3" LookupCode="Result" Runat="server" TabIndex="9"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
         <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="4"  ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSide" ID="ProcFindSide_4" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_4" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSubsite" ID="ProcFindSubsite_4"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_4" LookupCode="PathHistology"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="4" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_4"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="4" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_4"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="4" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindLength"    ID="PathFindLength_4"    Runat="server" TabIndex="7" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="4" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_4" LookupCode="PathGrade" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformSelect Width="80px" RecordId="4" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_4" LookupCode="Result" Runat="server" TabIndex="9"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
 
         <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="5"  ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSide" ID="ProcFindSide_5" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_5" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSubsite" ID="ProcFindSubsite_5"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_5" LookupCode="PathHistology"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="5" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_5"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="5" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_5"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="5" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindLength"    ID="PathFindLength_5"    Runat="server" TabIndex="7" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="5" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_5" LookupCode="PathGrade" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformSelect Width="80px" RecordId="5" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_5" LookupCode="Result" Runat="server" TabIndex="9"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
         <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="6"  ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSide" ID="ProcFindSide_6" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_6" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSubsite" ID="ProcFindSubsite_6"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_6" LookupCode="PathHistology"   Runat="server" TabIndex="6"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="6" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_6"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="6" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_6"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="6" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindLength"    ID="PathFindLength_6"    Runat="server" TabIndex="7" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="6" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_6" LookupCode="PathGrade" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformSelect Width="80px" RecordId="6" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_6" LookupCode="Result" Runat="server" TabIndex="9"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr> 
          <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="7"  ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSide" ID="ProcFindSide_7" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="7" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_7" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="7" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSubsite" ID="ProcFindSubsite_7"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="7" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_7" LookupCode="PathHistology"   Runat="server" TabIndex="7"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="7" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_7"    Runat="server" TabIndex="7" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="7" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_7"    Runat="server" TabIndex="7" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="7" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindLength"    ID="PathFindLength_7"    Runat="server" TabIndex="7" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="7" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_7" LookupCode="PathGrade" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformSelect Width="80px" RecordId="7" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_7" LookupCode="Result" Runat="server" TabIndex="9"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="8"  ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSide" ID="ProcFindSide_8" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="8" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_8" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="8" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSubsite" ID="ProcFindSubsite_8"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="8" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_8" LookupCode="PathHistology"   Runat="server" TabIndex="8"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="8" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_8"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="8" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_8"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="8" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindLength"    ID="PathFindLength_8"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="8" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_8" LookupCode="PathGrade" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformSelect Width="80px" RecordId="8" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_8" LookupCode="Result" Runat="server" TabIndex="9"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="9"  ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSide" ID="ProcFindSide_9" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="9" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_9" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="9" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSubsite" ID="ProcFindSubsite_9"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="9" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_9" LookupCode="PathHistology"   Runat="server" TabIndex="8"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="9" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_9"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="9" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_9"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="9" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindLength"    ID="PathFindLength_9"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="9" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_9" LookupCode="PathGrade" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformSelect Width="80px" RecordId="9" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_9" LookupCode="Result" Runat="server" TabIndex="9"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="10"  ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSide" ID="ProcFindSide_10" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="10" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="ProcFindSite_10" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="10" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindSubsite" ID="ProcFindSubsite_10"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="10" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_10" LookupCode="PathHistology"   Runat="server" TabIndex="8"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="10" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_10"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="10" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindWidth"    ID="PathFindWidth_10"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="10" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindLength"    ID="PathFindLength_10"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="10" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindGrade" ID="PathFindGrade_10" LookupCode="PathGrade" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformSelect Width="80px" RecordId="10" ParentRecordId="1" TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_10" LookupCode="Result" Runat="server" TabIndex="9"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathologyFindingsHtmlTable');" />

<br /><br /><br />


