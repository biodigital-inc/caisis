<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryProceduresPathNodeFindings" CodeFile="PancreasSurgeryProceduresPathNodeFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.PathologyNodeFindingsHtmlTable = "PathologyNodeFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="PancreasSurgeryProceduresPathNodeFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Node Findings"></asp:Label><br/>
<table  width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="PathologyNodeFindingsHtmlTable" > 


          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Site</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Max Dim (cm)</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;# Positive Nodes</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left">&nbsp;Total # Nodes</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Histology </td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          

<%--          <asp:Repeater ID="AncillaryProcs" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                <ItemTemplate> 
                    <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, 'ProcFindSide,ProcFindSite,ProcFindSubsite,Histology,Height,Width,Length,Grade,Result', 'PathologyFindingsHtmlTable');"> 
                        <td align="center" class="ClinicalEformPopulatedColumn" >&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindSide")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindSite")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcFindSubsite")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindPosNodes")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindNumNodes")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindHistology")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindLength")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindGrade")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathFindResult")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
                        <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
                    </tr>      
                </ItemTemplate>
            </asp:Repeater>--%>
            
          <tr>
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="1" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_1" LookupCode="NodeSite" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="ProcFindSubsite_1"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="1" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_1" Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="1" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_1"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="1" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_1"    Runat="server" TabIndex="6"   LookupCode="PathHistology"  /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="2" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_2" LookupCode="NodeSite" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="ProcFindSubsite_2"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="2" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_2" Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="2" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_2"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="2" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_2"    Runat="server" TabIndex="6"  LookupCode="PathHistology"  /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>         
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="3" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_3" LookupCode="NodeSite" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="ProcFindSubsite_3"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="3" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_3" Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="3" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_3"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="3" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_3"    Runat="server" TabIndex="6" LookupCode="PathHistology"  /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>         
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="4" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_4" LookupCode="NodeSite" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="ProcFindSubsite_4"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="4" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_4" Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="4" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_4"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="4" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_4"    Runat="server" TabIndex="6" LookupCode="PathHistology"  /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr> 
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="5" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_5" LookupCode="NodeSite" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="ProcFindSubsite_5"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="5" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_5" Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="5" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_5"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="5" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_5"    Runat="server" TabIndex="6" LookupCode="PathHistology"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>          
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="6" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_6" LookupCode="NodeSite" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="ProcFindSubsite_6"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="6" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_6" Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="6" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_6"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="6" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_6"    Runat="server" TabIndex="6" LookupCode="PathHistology"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>           
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="7" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_7" LookupCode="NodeSite" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="7" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="ProcFindSubsite_7"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="7" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_7" Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="7" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_7"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="7" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_7"    Runat="server" TabIndex="6" LookupCode="PathHistology"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>           
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="8" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_8" LookupCode="NodeSite" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="8" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="ProcFindSubsite_8"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="8" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_8" Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="8" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_8"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="8" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_8"    Runat="server" TabIndex="6" LookupCode="PathHistology"  /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>                 
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="9" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_9" LookupCode="NodeSite" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="9" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="ProcFindSubsite_9"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="9" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_9" Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="9" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_9"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="9" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_9"    Runat="server" TabIndex="6" LookupCode="PathHistology"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>    
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="10" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_10" LookupCode="NodeSite" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="10" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="ProcFindSubsite_10"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformTextBox Width="80px" RecordId="10" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_10" Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformTextBox  Width="80px" RecordId="10" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_10"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="10" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_10"    Runat="server" TabIndex="6" LookupCode="PathHistology"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>   
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathologyNodeFindingsHtmlTable');" />

<br /><br /><br />


