<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgeryPathologyNodeFindings" CodeFile="EsophagusSurgeryPathologyNodeFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.PathologyNodeFindingsHtmlTable = "PathologyNodeFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="EsophagusSurgeryPathologyNodeFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Node Findings"></asp:Label><br/>
<table  width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="PathologyNodeFindingsHtmlTable" > 


          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Site</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Max Dim (cm)</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;# Positive Nodes</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left">&nbsp;Total # Nodes</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Histology </td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          
            
          <tr>
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="1" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_1" LookupCode="NodeSite,Disease,@DiseaseView" Runat="server"    /></td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="1" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_1"   Runat="server"   /> </td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="1" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_1" Runat="server"   /> </td>

            <td>
                <euc:EformTextBox  Width="50px" RecordId="1" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_1"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="1" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_1"    Runat="server"    LookupCode="PathHistology,Disease,@DiseaseView"  /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr>
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="2" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_2" LookupCode="NodeSite,Disease,@DiseaseView" Runat="server"    /></td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="2" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_2"   Runat="server"   /> </td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="2" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_2" Runat="server"   /> </td>

            <td>
                <euc:EformTextBox  Width="50px" RecordId="2" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_2"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="2" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_2"    Runat="server"   LookupCode="PathHistology,Disease,@DiseaseView"  /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>         
          <tr>
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="3" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_3" LookupCode="NodeSite,Disease,@DiseaseView" Runat="server"    /></td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="3" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_3"   Runat="server"   /> </td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="3" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_3" Runat="server"   /> </td>

            <td>
                <euc:EformTextBox  Width="50px" RecordId="3" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_3"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="3" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_3"    Runat="server"  LookupCode="PathHistology,Disease,@DiseaseView"  /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>         
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="4" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_4" LookupCode="NodeSite,Disease,@DiseaseView" Runat="server"    /></td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="4" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_4"   Runat="server"   /> </td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="4" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_4" Runat="server"   /> </td>

            <td>
                <euc:EformTextBox  Width="50px" RecordId="4" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_4"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="4" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_4"    Runat="server"  LookupCode="PathHistology,Disease,@DiseaseView"  /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr> 
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="5" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_5" LookupCode="NodeSite,Disease,@DiseaseView" Runat="server"    /></td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="5" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_5"   Runat="server"   /> </td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="5" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_5" Runat="server"   /> </td>

            <td>
                <euc:EformTextBox  Width="50px" RecordId="5" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_5"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="5" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_5"    Runat="server"  LookupCode="PathHistology,Disease,@DiseaseView"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>          
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="6" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_6" LookupCode="NodeSite,Disease,@DiseaseView" Runat="server"    /></td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="6" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_6"   Runat="server"   /> </td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="6" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_6" Runat="server"   /> </td>

            <td>
                <euc:EformTextBox  Width="50px" RecordId="6" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_6"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="6" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_6"    Runat="server"  LookupCode="PathHistology,Disease,@DiseaseView"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>           
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="7" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_7" LookupCode="NodeSite,Disease,@DiseaseView" Runat="server"    /></td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="7" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_7"   Runat="server"   /> </td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="7" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_7" Runat="server"   /> </td>

            <td>
                <euc:EformTextBox  Width="50px" RecordId="7" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_7"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="7" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_7"    Runat="server"  LookupCode="PathHistology,Disease,@DiseaseView"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>           
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="8" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_8" LookupCode="NodeSite,Disease,@DiseaseView" Runat="server"    /></td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="8" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_8"   Runat="server"   /> </td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="8" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_8" Runat="server"   /> </td>

            <td>
                <euc:EformTextBox  Width="50px" RecordId="8" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_8"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="8" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_8"    Runat="server"  LookupCode="PathHistology,Disease,@DiseaseView"  /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>                 
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="9" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_9" LookupCode="NodeSite,Disease,@DiseaseView" Runat="server"    /></td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="9" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_9"   Runat="server"   /> </td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="9" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_9" Runat="server"   /> </td>

            <td>
                <euc:EformTextBox  Width="50px" RecordId="9" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_9"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="9" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_9"    Runat="server"  LookupCode="PathHistology,Disease,@DiseaseView"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>    
          <tr style="display: none;">
            <td>
                <euc:EformComboBox DropDownWidth="400px"   Width="80px" RecordId="10" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindSite"  ID="ProcFindSite_10" LookupCode="NodeSite,Disease,@DiseaseView" Runat="server"    /></td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="10" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_10"   Runat="server"   /> </td>
            <td>
                <euc:EformTextBox Width="50px" RecordId="10" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_10" Runat="server"   /> </td>

            <td>
                <euc:EformTextBox  Width="50px" RecordId="10" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindNumNodes"    ID="PathFindNumNodes_10"    Runat="server"  ShowCalendar="false" CalcDate="false"   /></td>

            <td>
                <euc:EformComboBox DropDownWidth="400px"    Width="80px" RecordId="10" ParentRecordId="11" TABLE="NodePathFinding" FIELD="PathFindHistology"    ID="PathFindHistology_10"    Runat="server"  LookupCode="PathHistology,Disease,@DiseaseView"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
         </tr>   
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathologyNodeFindingsHtmlTable');" />

<br /><br /><br />


