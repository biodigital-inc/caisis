<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryProceduresProcFindings" CodeFile="LiverSurgeryProceduresProcFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.ProcedureFindingsHtmlTable = "ProcedureFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="LiverSurgeryProceduresProcFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Procedure Findings"></asp:Label><br/>
<table  width="350" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ProcedureFindingsHtmlTable" > 


          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Site</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Finding</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          

          <asp:Repeater ID="AncillaryProcs" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                <ItemTemplate> 
                    <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, 'ProcFindSide,ProcFindSite,ProcFindSubsite,ProcFindDissection,ProcFinding,ProcFindPrimaryDimension,ProcFindExtension,ProcFindEncapsulation,ProcFindDiseaseExtent,ProcFindStatus,ProcFindFrozen', 'ProcedureFindingsHtmlTable');"> 
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindSite")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFinding")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
                        <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
                    </tr>      
                </ItemTemplate>
            </asp:Repeater>
            
          <tr>
            <td>
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_1" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_1" LookupCode="Result"   Runat="server" TabIndex="5"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_2" LookupCode="RadTxTarget" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_2" LookupCode="Result"   Runat="server" TabIndex="5"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>

          <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_3" LookupCode="RadTxTarget" Runat="server" TabIndex="3"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_3" LookupCode="Result"   Runat="server" TabIndex="5"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_4" LookupCode="RadTxTarget" Runat="server" TabIndex="4"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_4" LookupCode="Result"   Runat="server" TabIndex="5"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
        
          <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_5" LookupCode="RadTxTarget" Runat="server" TabIndex="5"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_5" LookupCode="Result"   Runat="server" TabIndex="5"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_6" LookupCode="RadTxTarget" Runat="server" TabIndex="6"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_6" LookupCode="Result"   Runat="server" TabIndex="6"  /> </td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProcedureFindingsHtmlTable');" />

<br /><br /><br />


