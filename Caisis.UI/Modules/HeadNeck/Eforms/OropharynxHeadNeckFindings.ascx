<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxHeadNeckFindings" CodeFile="OropharynxHeadNeckFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.OropharynxHeadNeckFindingsHtmlTable = "OropharynxHeadNeckFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="OropharynxHeadNeckFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Head and Neck Findings"></asp:Label><br/>
<table  width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="OropharynxHeadNeckFindingsHtmlTable" > 


          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Side</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Subsite</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Primary Dimension (cm)</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Morphology</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left">&nbsp;Invasion</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left">&nbsp;Invasion Site</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          

<%--          <asp:Repeater ID="AncillaryProcs" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                <ItemTemplate> 
                    <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, 'ProcFindSide,ProcFindSite,ProcFindSubsite,Histology,Height,Width,Length,Grade,Result', 'EncHeadNeckFindingsHtmlTable');"> 
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
            </asp:Repeater>--%>
            
          <tr>
            <td style="white-space: nowrap;" >
                <euc:EformHidden   Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_1" Value="Oropharynx" Runat="server" TabIndex="1"    />            
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide" MaxLength="50" ID="EncFindSide_1" LookupCode="OpSide,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="EncFindSite_1"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite" MaxLength="50" ID="EncFindSubsite_1"   LookupCode="BxSubSite,Disease,HeadNeck"   Runat="server" TabIndex="3"  EnableHiddenOnUIEvent="EncFindSite_1"/> </td>

            <td style="white-space: nowrap;">
                <euc:EformTextBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" MaxLength="50" ID="EncFindPrimaryDim_1" Runat="server" TabIndex="4"  EnableHiddenOnUIEvent="EncFindSite_1"/> </td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindMorphology" MaxLength="50"    ID="EncFindMorphology_1" LookupCode="Morphology,Disease,HeadNeck"    Runat="server" TabIndex="5" EnableHiddenOnUIEvent="EncFindSite_1"/></td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv" MaxLength="50"    ID="EncFindInv_1" LookupCode="EncFindInv,Disease,HeadNeck"    Runat="server" TabIndex="6" EnableHiddenOnUIEvent="EncFindSite_1"/></td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite" MaxLength="50"  ID="EncFindInvSite_1" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="7" EnableHiddenOnUIEvent="EncFindSite_1"/></td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformHidden   Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_2" Value="Oropharynx" Runat="server" TabIndex="1"    />            
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide" MaxLength="50"  ID="EncFindSide_2" LookupCode="OpSide,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="EncFindSite_2"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite" MaxLength="50" ID="EncFindSubsite_2"   LookupCode="BxSubSite,Disease,HeadNeck"   Runat="server" TabIndex="3"  EnableHiddenOnUIEvent="EncFindSite_2"/> </td>

            <td style="white-space: nowrap;">
                <euc:EformTextBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" MaxLength="50" ID="EncFindPrimaryDim_2" Runat="server" TabIndex="4"  EnableHiddenOnUIEvent="EncFindSite_2"/> </td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindMorphology" MaxLength="50"    ID="EncFindMorphology_2" LookupCode="Morphology,Disease,HeadNeck"    Runat="server" TabIndex="5" EnableHiddenOnUIEvent="EncFindSite_2"/></td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv" MaxLength="50"    ID="EncFindInv_2" LookupCode="EncFindInv,Disease,HeadNeck"    Runat="server" TabIndex="6" EnableHiddenOnUIEvent="EncFindSite_2"/></td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite" MaxLength="50"    ID="EncFindInvSite_2" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="7" EnableHiddenOnUIEvent="EncFindSite_2"/></td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon  runat="server"/></td>
         </tr> 
          <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformHidden   Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_3" Value="Oropharynx" Runat="server" TabIndex="1"    />            
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide" MaxLength="50"  ID="EncFindSide_3" LookupCode="OpSide,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="EncFindSite_3"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite" MaxLength="50" ID="EncFindSubsite_3"   LookupCode="BxSubSite,Disease,HeadNeck"   Runat="server" TabIndex="3"  EnableHiddenOnUIEvent="EncFindSite_3"/> </td>

            <td style="white-space: nowrap;">
                <euc:EformTextBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" MaxLength="50" ID="EncFindPrimaryDim_3" Runat="server" TabIndex="4"  EnableHiddenOnUIEvent="EncFindSite_3"/> </td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindMorphology" MaxLength="50"    ID="EncFindMorphology_3" LookupCode="Morphology,Disease,HeadNeck"    Runat="server" TabIndex="5" EnableHiddenOnUIEvent="EncFindSite_3"/></td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv" MaxLength="50"    ID="EncFindInv_3" LookupCode="EncFindInv,Disease,HeadNeck"    Runat="server" TabIndex="6" EnableHiddenOnUIEvent="EncFindSite_3"/></td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite" MaxLength="50"    ID="EncFindInvSite_3" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="7" EnableHiddenOnUIEvent="EncFindSite_3"/></td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
         </tr>  
          <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformHidden   Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_4" Value="Oropharynx" Runat="server" TabIndex="1"    />            
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide" MaxLength="50"  ID="EncFindSide_4" LookupCode="OpSide,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="EncFindSite_4"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite" MaxLength="50" ID="EncFindSubsite_4"   LookupCode="BxSubSite,Disease,HeadNeck"   Runat="server" TabIndex="3"  EnableHiddenOnUIEvent="EncFindSite_4"/> </td>

            <td style="white-space: nowrap;">
                <euc:EformTextBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" MaxLength="50" ID="EncFindPrimaryDim_4" Runat="server" TabIndex="4"  EnableHiddenOnUIEvent="EncFindSite_4"/> </td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindMorphology" MaxLength="50"    ID="EncFindMorphology_4" LookupCode="Morphology,Disease,HeadNeck"    Runat="server" TabIndex="5" EnableHiddenOnUIEvent="EncFindSite_4"/></td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv" MaxLength="50"    ID="EncFindInv_4" LookupCode="EncFindInv,Disease,HeadNeck"    Runat="server" TabIndex="6" EnableHiddenOnUIEvent="EncFindSite_4"/></td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite" MaxLength="50"    ID="EncFindInvSite_4" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="7" EnableHiddenOnUIEvent="EncFindSite_4"/></td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
         </tr> 
          <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformHidden   Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_5" Value="Oropharynx" Runat="server" TabIndex="1"    />            
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide" MaxLength="50"  ID="EncFindSide_5" LookupCode="OpSide,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="EncFindSite_5"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite" MaxLength="50" ID="EncFindSubsite_5"   LookupCode="BxSubSite,Disease,HeadNeck"   Runat="server" TabIndex="3"  EnableHiddenOnUIEvent="EncFindSite_5"/> </td>

            <td style="white-space: nowrap;">
                <euc:EformTextBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" MaxLength="50" ID="EncFindPrimaryDim_5" Runat="server" TabIndex="4"  EnableHiddenOnUIEvent="EncFindSite_5"/> </td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindMorphology" MaxLength="50"    ID="EncFindMorphology_5" LookupCode="Morphology,Disease,HeadNeck"    Runat="server" TabIndex="5" EnableHiddenOnUIEvent="EncFindSite_5"/></td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv" MaxLength="50"    ID="EncFindInv_5" LookupCode="EncFindInv,Disease,HeadNeck"    Runat="server" TabIndex="6" EnableHiddenOnUIEvent="EncFindSite_5"/></td>

            <td style="white-space: nowrap;">
                <euc:EformComboBox  Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite" MaxLength="50"    ID="EncFindInvSite_5" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="7" EnableHiddenOnUIEvent="EncFindSite_5"/></td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
         </tr> 
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxHeadNeckFindingsHtmlTable');" />

<br /><br /><br />


