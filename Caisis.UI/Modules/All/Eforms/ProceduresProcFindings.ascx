<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ProceduresProcFindings" CodeFile="ProceduresProcFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.ProcedureFindingsHtmlTable = "ProcedureFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="ProceduresProcFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Procedure Findings"></asp:Label><br/>
<table  width="1300" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ProcedureFindingsHtmlTable" > 


          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Side</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Site</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Subsite</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Dissection</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Finding</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left">&nbsp;Max Dim</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Extension </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Encapsulation</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Disease Extent</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Gross Status</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Frozen Section</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          

          <asp:Repeater ID="AncillaryProcs" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                <ItemTemplate> 
                    <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, 'ProcFindSide,ProcFindSite,ProcFindSubsite,ProcFindDissection,ProcFinding,ProcFindPrimaryDimension,ProcFindExtension,ProcFindEncapsulation,ProcFindDiseaseExtent,ProcFindStatus,ProcFindFrozen', 'ProcedureFindingsHtmlTable');"> 
                        <td align="center" class="ClinicalEformPopulatedColumn" >&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindSide")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindSite")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindSubsite")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindDissection")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFinding")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindPrimaryDimension")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindExtension")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindEncapsulation")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindDiseaseExtent")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindStatus")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindFrozen")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
                        <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
                    </tr>      
                </ItemTemplate>
            </asp:Repeater>
            
          <tr>
            <td>
                <euc:EformSelect  Width="80px" RecordId="1"  ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_1" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_1" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_1"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDissection" ID="ProcFindDissection_1" LookupCode="ProcedureDissectionType"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_1" LookupCode="Result"   Runat="server" TabIndex="5"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindPrimaryDimension"    ID="ProcFindMaxDim_1"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindExtension" ID="ProcFindExtension_1" LookupCode="ProcedureExtension"   Runat="server" TabIndex="7"  /> </td>

            <td>
                <euc:EformSelect Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindEncapsulation" ID="ProcFindEncapsulation_1" LookupCode="YesNoUnknown" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_1" Runat="server" TabIndex="9" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_1" LookupCode="NodeFindGrossStatus" Runat="server" TabIndex="10"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindFrozen" ID="ProcFindFrozen_1" LookupCode="FrozenSection" Runat="server" TabIndex="11"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="2"  ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_2" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_2" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_2"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDissection" ID="ProcFindDissection_2" LookupCode="ProcedureDissectionType"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_2" LookupCode="Result"   Runat="server" TabIndex="5"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindPrimaryDimension"    ID="ProcFindMaxDim_2"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindExtension" ID="ProcFindExtension_2" LookupCode="ProcedureExtension"   Runat="server" TabIndex="7"  /> </td>

            <td>
                <euc:EformSelect Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindEncapsulation" ID="ProcFindEncapsulation_2" LookupCode="YesNoUnknown" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_2" Runat="server" TabIndex="9" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_2" LookupCode="NodeFindGrossStatus" Runat="server" TabIndex="20"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindFrozen" ID="ProcFindFrozen_2" LookupCode="FrozenSection" Runat="server" TabIndex="22"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>

          <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="3"  ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_3" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_3" LookupCode="RadTxTarget" Runat="server" TabIndex="3"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_3"   LookupCode="RadTxTarget"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDissection" ID="ProcFindDissection_3" LookupCode="ProcedureDissectionType"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_3" LookupCode="Result"   Runat="server" TabIndex="5"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindPrimaryDimension"    ID="ProcFindMaxDim_3"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindExtension" ID="ProcFindExtension_3" LookupCode="ProcedureExtension"   Runat="server" TabIndex="7"  /> </td>

            <td>
                <euc:EformSelect Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindEncapsulation" ID="ProcFindEncapsulation_3" LookupCode="YesNoUnknown" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_3" Runat="server" TabIndex="9" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_3" LookupCode="NodeFindGrossStatus" Runat="server" TabIndex="30"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindFrozen" ID="ProcFindFrozen_3" LookupCode="FrozenSection" Runat="server" TabIndex="23"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="4"  ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_4" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_4" LookupCode="RadTxTarget" Runat="server" TabIndex="4"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_4"   LookupCode="RadTxTarget"   Runat="server" TabIndex="4"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDissection" ID="ProcFindDissection_4" LookupCode="ProcedureDissectionType"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_4" LookupCode="Result"   Runat="server" TabIndex="5"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindPrimaryDimension"    ID="ProcFindMaxDim_4"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindExtension" ID="ProcFindExtension_4" LookupCode="ProcedureExtension"   Runat="server" TabIndex="7"  /> </td>

            <td>
                <euc:EformSelect Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindEncapsulation" ID="ProcFindEncapsulation_4" LookupCode="YesNoUnknown" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_4" Runat="server" TabIndex="9" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_4" LookupCode="NodeFindGrossStatus" Runat="server" TabIndex="40"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindFrozen" ID="ProcFindFrozen_4" LookupCode="FrozenSection" Runat="server" TabIndex="23"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
        
          <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="5"  ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_5" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_5" LookupCode="RadTxTarget" Runat="server" TabIndex="5"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_5"   LookupCode="RadTxTarget"   Runat="server" TabIndex="5"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDissection" ID="ProcFindDissection_5" LookupCode="ProcedureDissectionType"   Runat="server" TabIndex="5"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_5" LookupCode="Result"   Runat="server" TabIndex="5"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindPrimaryDimension"    ID="ProcFindMaxDim_5"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindExtension" ID="ProcFindExtension_5" LookupCode="ProcedureExtension"   Runat="server" TabIndex="7"  /> </td>

            <td>
                <euc:EformSelect Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindEncapsulation" ID="ProcFindEncapsulation_5" LookupCode="YesNoUnknown" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_5" Runat="server" TabIndex="9" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_5" LookupCode="NodeFindGrossStatus" Runat="server" TabIndex="50"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindFrozen" ID="ProcFindFrozen_5" LookupCode="FrozenSection" Runat="server" TabIndex="23"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformSelect  Width="80px" RecordId="6"  ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_6" LookupCode="NodeSide" Runat="server" TabIndex="1"    /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_6" LookupCode="RadTxTarget" Runat="server" TabIndex="6"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_6"   LookupCode="RadTxTarget"   Runat="server" TabIndex="6"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDissection" ID="ProcFindDissection_6" LookupCode="ProcedureDissectionType"   Runat="server" TabIndex="6"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_6" LookupCode="Result"   Runat="server" TabIndex="6"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindPrimaryDimension"    ID="ProcFindMaxDim_6"    Runat="server" TabIndex="6" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindExtension" ID="ProcFindExtension_6" LookupCode="ProcedureExtension"   Runat="server" TabIndex="7"  /> </td>

            <td>
                <euc:EformSelect Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindEncapsulation" ID="ProcFindEncapsulation_6" LookupCode="YesNoUnknown" Runat="server" TabIndex="8"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindDiseaseExtent" ID="ProcFindDiseaseExtent_6" Runat="server" TabIndex="9" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformSelect Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindStatus" ID="ProcFindStatus_6" LookupCode="NodeFindGrossStatus" Runat="server" TabIndex="60"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindFrozen" ID="ProcFindFrozen_6" LookupCode="FrozenSection" Runat="server" TabIndex="23"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProcedureFindingsHtmlTable');" />

<br /><br /><br />


