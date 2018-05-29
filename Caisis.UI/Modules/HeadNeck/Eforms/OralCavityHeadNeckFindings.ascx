<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OralCavityHeadNeckFindings" CodeFile="OralCavityHeadNeckFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.OralCavityHeadNeckFindingsHtmlTable = "OralCavityHeadNeckFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="OropharynxHeadNeckFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Head and Neck Findings"></asp:Label><br/>
<table  border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="OralCavityHeadNeckFindingsHtmlTable" > 


           
    <tr>
        <td>
            <table border="0" cellpadding="5" cellspacing="0" id="FindingsTable_1">
                 <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Side</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Subsite</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Morphology</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Local Invasion</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                </tr>

                <tr>
                <td style="white-space: nowrap;" valign="top" >
                    <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide"  ID="EncFindSide_1" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  />
                    
                    <euc:EformTextBox Width="1px" style="display: none;" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_1" Runat="server" /></td>
                    
                <td style="white-space: nowrap;" valign="top">
                    <euc:EformDropDownList Width="150px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite"  ID="EncFindSubsite_1" Runat="server" ShowEmptyListItem="true"  >
                        <asp:ListItem Value="" Text="" />
                        <asp:ListItem Value="Lateral Tongue" Text="Lateral Tongue" />
                        <asp:ListItem Value="Ventral Tongue" Text="Ventral Tongue" />
                        <asp:ListItem Value="Dorsal Tongue" Text="Dorsal Tongue" />
                        <asp:ListItem Value="Tongue NOS" Text="Tongue NOS" />
                        <asp:ListItem Value="Floor of Mouth" Text="Floor of Mouth" />
                        <asp:ListItem Value="Upper Gum" Text="Upper Gum" />
                        <asp:ListItem Value="Lower Gum" Text="Lower Gum" />
                        <asp:ListItem Value="Hard Palate" Text="Hard Palate" />
                        <asp:ListItem Value="Retromolar Trigone" Text="Retromolar Trigone" />
                        <asp:ListItem Value="Buccal Mucosa" Text="Buccal Mucosa" />
                    </euc:EformDropDownList></td>                
                    
                <td style="white-space: nowrap;" valign="top">
                    <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="150px" style="white-space: nowrap;"  RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindMorphology" ID="EncFindMorphology_1" Runat="server" ShowOther="true" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
                       <asp:ListItem Value="Endophytic" Text="Endophytic" />
                        <asp:ListItem Value="Exophytic" Text="Exophytic" />
                        <asp:ListItem Value="Ulcerative" Text="Ulcerative" />
                        <asp:ListItem Value="Unknown" Text="Unknown" />
                        </euc:EformExtendedCheckBoxList>  
                </td>

                <td style="white-space: nowrap;" valign="top">
                   <euc:EformDropDownList DropDownWidth="auto" Width="100px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv"    ID="EncFindInv_1" LookupCode="YesNoUnknown"    Runat="server" /></td>

                <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_1a"  runat="server"/></td>
                
                </tr>   
                
                <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Primary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Secondary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Tertiary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" ><div id="EncFindInvSiteTitleDIV_1" runat="server" style="display: none;">Site of Invasion  </div></td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                </tr>
      
                <tr>

                  <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" ID="EncFindPrimaryDim_1" Runat="server"  /> </td>
                  <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSecondaryDim" ID="EncFindSecondaryDim_1" Runat="server"  /> </td>
                   <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindTertiaryDim" ID="EncFindTertiaryDim_1" Runat="server"  /> </td>
                   <td style="white-space: nowrap;" valign="top">
                        <div id="EncFindInvSiteDIV_1" runat="server" style="display: none;">
                            <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="150px" style="white-space: nowrap;"  RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite" ID="EncFindInvSite_1" Runat="server" ShowOther="true" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
                           <asp:ListItem Value="Lateral Tongue" Text="Lateral Tongue" />
                            <asp:ListItem Value="Ventral Tongue" Text="Ventral Tongue" />
                            <asp:ListItem Value="Dorsal Tongue" Text="Dorsal Tongue" />
                            <asp:ListItem Value="Tongue NOS" Text="Tongue NOS" />
                            <asp:ListItem Value="Floor of Mouth" Text="Floor of Mouth" />
                            <asp:ListItem Value="Upper Gum" Text="Upper Gum" />
                            <asp:ListItem Value="Lower Gum" Text="Lower Gum" />
                            <asp:ListItem Value="Hard Palate" Text="Hard Palate" />
                            <asp:ListItem Value="Retromolar Trigone" Text="Retromolar Trigone" />
                            <asp:ListItem Value="Buccal Mucosa" Text="Buccal Mucosa" />
                            </euc:EformExtendedCheckBoxList>                            
                       
                        </div>               
                   </td>
                 <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_1b"  runat="server"/></td>
               </tr>
           
            </table>
        </td>
    </tr>   

   <tr style="display: none; ">
        <td>
            <table border="0" cellpadding="5" cellspacing="0" id="FindingsTable_2">
                 <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Side</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Subsite</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Morphology</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Local Invasion</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                </tr>

                <tr>
                <td style="white-space: nowrap;" valign="top" >
                    <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide"  ID="EncFindSide_2" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  />
                    
                    <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_2" Runat="server" /></td>
                    
                <td style="white-space: nowrap;" valign="top">
                    <euc:EformDropDownList Width="150px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite"  ID="EncFindSubsite_2" Runat="server" ShowEmptyListItem="true"  >
                        <asp:ListItem Value="" Text="" />
                        <asp:ListItem Value="Lateral Tongue" Text="Lateral Tongue" />
                        <asp:ListItem Value="Ventral Tongue" Text="Ventral Tongue" />
                        <asp:ListItem Value="Dorsal Tongue" Text="Dorsal Tongue" />
                        <asp:ListItem Value="Tongue NOS" Text="Tongue NOS" />
                        <asp:ListItem Value="Floor of Mouth" Text="Floor of Mouth" />
                        <asp:ListItem Value="Upper Gum" Text="Upper Gum" />
                        <asp:ListItem Value="Lower Gum" Text="Lower Gum" />
                        <asp:ListItem Value="Hard Palate" Text="Hard Palate" />
                        <asp:ListItem Value="Retromolar Trigone" Text="Retromolar Trigone" />
                        <asp:ListItem Value="Buccal Mucosa" Text="Buccal Mucosa" />
                    </euc:EformDropDownList></td>                
                    
                <td style="white-space: nowrap;" valign="top">
                    <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="150px" style="white-space: nowrap;"  RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindMorphology" ID="EncFindMorphology_2" Runat="server" ShowOther="true" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
                       <asp:ListItem Value="Endophytic" Text="Endophytic" />
                        <asp:ListItem Value="Exophytic" Text="Exophytic" />
                        <asp:ListItem Value="Ulcerative" Text="Ulcerative" />
                        <asp:ListItem Value="Unknown" Text="Unknown" />
                        </euc:EformExtendedCheckBoxList>  
                </td>

                <td style="white-space: nowrap;" valign="top">
                   <euc:EformDropDownList DropDownWidth="auto" Width="100px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv"    ID="EncFindInv_2" LookupCode="YesNoUnknown"    Runat="server" /></td>

                <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_2a"  runat="server"/></td>
                
                </tr>   
                
                <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Primary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Secondary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Tertiary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" ><div id="EncFindInvSiteTitleDIV_2" runat="server" style="display: none;">Site of Invasion  </div></td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                </tr>
      
                <tr>

                  <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" ID="EncFindPrimaryDim_2" Runat="server"  /> </td>
                  <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSecondaryDim" ID="EncFindSecondaryDim_2" Runat="server"  /> </td>
                   <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindTertiaryDim" ID="EncFindTertiaryDim_2" Runat="server"  /> </td>
                   <td style="white-space: nowrap;" valign="top">
                        <div id="EncFindInvSiteDIV_2" runat="server" style="display: none;">
                            <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="150px" style="white-space: nowrap;"  RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite" ID="EncFindInvSite_2" Runat="server" ShowOther="true" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
                           <asp:ListItem Value="Lateral Tongue" Text="Lateral Tongue" />
                            <asp:ListItem Value="Ventral Tongue" Text="Ventral Tongue" />
                            <asp:ListItem Value="Dorsal Tongue" Text="Dorsal Tongue" />
                            <asp:ListItem Value="Tongue NOS" Text="Tongue NOS" />
                            <asp:ListItem Value="Floor of Mouth" Text="Floor of Mouth" />
                            <asp:ListItem Value="Upper Gum" Text="Upper Gum" />
                            <asp:ListItem Value="Lower Gum" Text="Lower Gum" />
                            <asp:ListItem Value="Hard Palate" Text="Hard Palate" />
                            <asp:ListItem Value="Retromolar Trigone" Text="Retromolar Trigone" />
                            <asp:ListItem Value="Buccal Mucosa" Text="Buccal Mucosa" />
                            </euc:EformExtendedCheckBoxList>                            
                       
                        </div>               
                   </td>
                 <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_2b"  runat="server"/></td>
               </tr>
           
            </table>
        </td>
    </tr>   

    <tr style="display: none; ">
        <td>
            <table border="0" cellpadding="5" cellspacing="0" id="FindingsTable_3">
                 <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Side</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Subsite</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Morphology</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Local Invasion</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                </tr>

                <tr>
                <td style="white-space: nowrap;" valign="top" >
                    <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide"  ID="EncFindSide_3" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  />
                    
                    <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_3" Runat="server" /></td>
                    
                <td style="white-space: nowrap;" valign="top">
                    <euc:EformDropDownList Width="150px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite"  ID="EncFindSubsite_3" Runat="server" ShowEmptyListItem="true"  >
                        <asp:ListItem Value="" Text="" />
                        <asp:ListItem Value="Lateral Tongue" Text="Lateral Tongue" />
                        <asp:ListItem Value="Ventral Tongue" Text="Ventral Tongue" />
                        <asp:ListItem Value="Dorsal Tongue" Text="Dorsal Tongue" />
                        <asp:ListItem Value="Tongue NOS" Text="Tongue NOS" />
                        <asp:ListItem Value="Floor of Mouth" Text="Floor of Mouth" />
                        <asp:ListItem Value="Upper Gum" Text="Upper Gum" />
                        <asp:ListItem Value="Lower Gum" Text="Lower Gum" />
                        <asp:ListItem Value="Hard Palate" Text="Hard Palate" />
                        <asp:ListItem Value="Retromolar Trigone" Text="Retromolar Trigone" />
                        <asp:ListItem Value="Buccal Mucosa" Text="Buccal Mucosa" />
                    </euc:EformDropDownList></td>                
                    
                <td style="white-space: nowrap;" valign="top">
                    <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="150px" style="white-space: nowrap;"  RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindMorphology" ID="EncFindMorphology_3" Runat="server" ShowOther="true" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
                       <asp:ListItem Value="Endophytic" Text="Endophytic" />
                        <asp:ListItem Value="Exophytic" Text="Exophytic" />
                        <asp:ListItem Value="Ulcerative" Text="Ulcerative" />
                        <asp:ListItem Value="Unknown" Text="Unknown" />
                        </euc:EformExtendedCheckBoxList>  
                </td>

                <td style="white-space: nowrap;" valign="top">
                   <euc:EformDropDownList DropDownWidth="auto" Width="100px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv"    ID="EncFindInv_3" LookupCode="YesNoUnknown"    Runat="server" /></td>

                <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_3a"  runat="server"/></td>
                
                </tr>   
                
                <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Primary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Secondary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Tertiary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" ><div id="EncFindInvSiteTitleDIV_3" runat="server" style="display: none;">Site of Invasion  </div></td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                </tr>
      
                <tr>

                  <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" ID="EncFindPrimaryDim_3" Runat="server"  /> </td>
                  <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSecondaryDim" ID="EncFindSecondaryDim_3" Runat="server"  /> </td>
                   <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindTertiaryDim" ID="EncFindTertiaryDim_3" Runat="server"  /> </td>
                   <td style="white-space: nowrap;" valign="top">
                        <div id="EncFindInvSiteDIV_3" runat="server" style="display: none;">
                            <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="150px" style="white-space: nowrap;"  RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite" ID="EncFindInvSite_3" Runat="server" ShowOther="true" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
                           <asp:ListItem Value="Lateral Tongue" Text="Lateral Tongue" />
                            <asp:ListItem Value="Ventral Tongue" Text="Ventral Tongue" />
                            <asp:ListItem Value="Dorsal Tongue" Text="Dorsal Tongue" />
                            <asp:ListItem Value="Tongue NOS" Text="Tongue NOS" />
                            <asp:ListItem Value="Floor of Mouth" Text="Floor of Mouth" />
                            <asp:ListItem Value="Upper Gum" Text="Upper Gum" />
                            <asp:ListItem Value="Lower Gum" Text="Lower Gum" />
                            <asp:ListItem Value="Hard Palate" Text="Hard Palate" />
                            <asp:ListItem Value="Retromolar Trigone" Text="Retromolar Trigone" />
                            <asp:ListItem Value="Buccal Mucosa" Text="Buccal Mucosa" />
                            </euc:EformExtendedCheckBoxList>                            
                       
                        </div>               
                   </td>
                 <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_3b"  runat="server"/></td>
               </tr>
           
            </table>
        </td>
    </tr>   

    <tr style="display: none; ">
        <td>
            <table border="0" cellpadding="5" cellspacing="0" id="FindingsTable_4">
                 <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Side</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Subsite</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Morphology</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Local Invasion</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                </tr>

                <tr>
                <td style="white-space: nowrap;" valign="top" >
                    <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide"  ID="EncFindSide_4" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  />
                    
                    <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_4" Runat="server" /></td>
                    
                <td style="white-space: nowrap;" valign="top">
                    <euc:EformDropDownList Width="150px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite"  ID="EncFindSubsite_4" Runat="server" ShowEmptyListItem="true"  >
                        <asp:ListItem Value="" Text="" />
                        <asp:ListItem Value="Lateral Tongue" Text="Lateral Tongue" />
                        <asp:ListItem Value="Ventral Tongue" Text="Ventral Tongue" />
                        <asp:ListItem Value="Dorsal Tongue" Text="Dorsal Tongue" />
                        <asp:ListItem Value="Tongue NOS" Text="Tongue NOS" />
                        <asp:ListItem Value="Floor of Mouth" Text="Floor of Mouth" />
                        <asp:ListItem Value="Upper Gum" Text="Upper Gum" />
                        <asp:ListItem Value="Lower Gum" Text="Lower Gum" />
                        <asp:ListItem Value="Hard Palate" Text="Hard Palate" />
                        <asp:ListItem Value="Retromolar Trigone" Text="Retromolar Trigone" />
                        <asp:ListItem Value="Buccal Mucosa" Text="Buccal Mucosa" />
                    </euc:EformDropDownList></td>                
                    
                <td style="white-space: nowrap;" valign="top">
                    <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="150px" style="white-space: nowrap;"  RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindMorphology" ID="EncFindMorphology_4" Runat="server" ShowOther="true" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
                       <asp:ListItem Value="Endophytic" Text="Endophytic" />
                        <asp:ListItem Value="Exophytic" Text="Exophytic" />
                        <asp:ListItem Value="Ulcerative" Text="Ulcerative" />
                        <asp:ListItem Value="Unknown" Text="Unknown" />
                        </euc:EformExtendedCheckBoxList>  
                </td>

                <td style="white-space: nowrap;" valign="top">
                   <euc:EformDropDownList DropDownWidth="auto" Width="100px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv"    ID="EncFindInv_4" LookupCode="YesNoUnknown"    Runat="server" /></td>

                <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_4a"  runat="server"/></td>
                
                </tr>   
                
                <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Primary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Secondary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Tertiary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" ><div id="EncFindInvSiteTitleDIV_4" runat="server" style="display: none;">Site of Invasion  </div></td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                </tr>
      
                <tr>

                  <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" ID="EncFindPrimaryDim_4" Runat="server"  /> </td>
                  <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSecondaryDim" ID="EncFindSecondaryDim_4" Runat="server"  /> </td>
                   <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindTertiaryDim" ID="EncFindTertiaryDim_4" Runat="server"  /> </td>
                   <td style="white-space: nowrap;" valign="top">
                        <div id="EncFindInvSiteDIV_4" runat="server" style="display: none;">
                            <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="150px" style="white-space: nowrap;"  RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite" ID="EncFindInvSite_4" Runat="server" ShowOther="true" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
                           <asp:ListItem Value="Lateral Tongue" Text="Lateral Tongue" />
                            <asp:ListItem Value="Ventral Tongue" Text="Ventral Tongue" />
                            <asp:ListItem Value="Dorsal Tongue" Text="Dorsal Tongue" />
                            <asp:ListItem Value="Tongue NOS" Text="Tongue NOS" />
                            <asp:ListItem Value="Floor of Mouth" Text="Floor of Mouth" />
                            <asp:ListItem Value="Upper Gum" Text="Upper Gum" />
                            <asp:ListItem Value="Lower Gum" Text="Lower Gum" />
                            <asp:ListItem Value="Hard Palate" Text="Hard Palate" />
                            <asp:ListItem Value="Retromolar Trigone" Text="Retromolar Trigone" />
                            <asp:ListItem Value="Buccal Mucosa" Text="Buccal Mucosa" />
                            </euc:EformExtendedCheckBoxList>                            
                       
                        </div>               
                   </td>
                 <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_4b"  runat="server"/></td>
               </tr>
           
            </table>
        </td>
    </tr>   

    <tr style="display: none; ">
        <td>
            <table border="0" cellpadding="5" cellspacing="0" id="FindingsTable_5">
                 <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Side</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Subsite</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;Morphology</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Local Invasion</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                </tr>

                <tr>
                <td style="white-space: nowrap;" valign="top" >
                    <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide"  ID="EncFindSide_5" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  />
                    
                    <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_5" Runat="server" /></td>
                    
                <td style="white-space: nowrap;" valign="top">
                    <euc:EformDropDownList Width="150px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite"  ID="EncFindSubsite_5" Runat="server" ShowEmptyListItem="true"  >
                        <asp:ListItem Value="" Text="" />
                        <asp:ListItem Value="Lateral Tongue" Text="Lateral Tongue" />
                        <asp:ListItem Value="Ventral Tongue" Text="Ventral Tongue" />
                        <asp:ListItem Value="Dorsal Tongue" Text="Dorsal Tongue" />
                        <asp:ListItem Value="Tongue NOS" Text="Tongue NOS" />
                        <asp:ListItem Value="Floor of Mouth" Text="Floor of Mouth" />
                        <asp:ListItem Value="Upper Gum" Text="Upper Gum" />
                        <asp:ListItem Value="Lower Gum" Text="Lower Gum" />
                        <asp:ListItem Value="Hard Palate" Text="Hard Palate" />
                        <asp:ListItem Value="Retromolar Trigone" Text="Retromolar Trigone" />
                        <asp:ListItem Value="Buccal Mucosa" Text="Buccal Mucosa" />
                    </euc:EformDropDownList></td>                
                    
                <td style="white-space: nowrap;" valign="top">
                    <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="150px" style="white-space: nowrap;"  RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindMorphology" ID="EncFindMorphology_5" Runat="server" ShowOther="true" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
                       <asp:ListItem Value="Endophytic" Text="Endophytic" />
                        <asp:ListItem Value="Exophytic" Text="Exophytic" />
                        <asp:ListItem Value="Ulcerative" Text="Ulcerative" />
                        <asp:ListItem Value="Unknown" Text="Unknown" />
                        </euc:EformExtendedCheckBoxList>  
                </td>

                <td style="white-space: nowrap;" valign="top">
                   <euc:EformDropDownList DropDownWidth="auto" Width="100px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv"    ID="EncFindInv_5" LookupCode="YesNoUnknown"    Runat="server" /></td>

                <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_5a"  runat="server"/></td>
                
                </tr>   
                
                <tr>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Primary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Secondary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;">&nbsp;Tertiary Dim (cm)</td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" ><div id="EncFindInvSiteTitleDIV_5" runat="server" style="display: none;">Site of Invasion  </div></td>
                    <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                </tr>
      
                <tr>

                  <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" ID="EncFindPrimaryDim_5" Runat="server"  /> </td>
                  <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSecondaryDim" ID="EncFindSecondaryDim_5" Runat="server"  /> </td>
                   <td style="white-space: nowrap;" valign="top" align="center" >
                    <euc:EformTextBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindTertiaryDim" ID="EncFindTertiaryDim_5" Runat="server"  /> </td>
                   <td style="white-space: nowrap;" valign="top">
                        <div id="EncFindInvSiteDIV_5" runat="server" style="display: none;">
                            <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="150px" style="white-space: nowrap;"  RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite" ID="EncFindInvSite_5" Runat="server" ShowOther="true" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table">
                           <asp:ListItem Value="Lateral Tongue" Text="Lateral Tongue" />
                            <asp:ListItem Value="Ventral Tongue" Text="Ventral Tongue" />
                            <asp:ListItem Value="Dorsal Tongue" Text="Dorsal Tongue" />
                            <asp:ListItem Value="Tongue NOS" Text="Tongue NOS" />
                            <asp:ListItem Value="Floor of Mouth" Text="Floor of Mouth" />
                            <asp:ListItem Value="Upper Gum" Text="Upper Gum" />
                            <asp:ListItem Value="Lower Gum" Text="Lower Gum" />
                            <asp:ListItem Value="Hard Palate" Text="Hard Palate" />
                            <asp:ListItem Value="Retromolar Trigone" Text="Retromolar Trigone" />
                            <asp:ListItem Value="Buccal Mucosa" Text="Buccal Mucosa" />
                            </euc:EformExtendedCheckBoxList>                            
                       
                        </div>               
                   </td>
                 <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_5b"  runat="server"/></td>
               </tr>
           
            </table>
        </td>
    </tr>   
 
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OralCavityHeadNeckFindingsHtmlTable');" />

<br /><br /><br />

<script type="text/javascript">

    /* <![CDATA[ */
    addEvents($('<%= EncFindSide_1.ClientID %>'),$('<%= EncFindSite_1.ClientID %>'),$('<%= EncFindSubsite_1.ClientID %>'),$('<%= EncFindInv_1.ClientID %>'),$('<%= EncFindInvSiteDIV_1.ClientID %>'),$('<%= EncFindInvSiteTitleDIV_1.ClientID %>'),$('<%= EncFindInvSite_1.ClientID %>'),$('<%= EncFindPrimaryDim_1.ClientID %>'),$('<%= EncFindSecondaryDim_1.ClientID %>'),$('<%= EncFindTertiaryDim_1.ClientID %>'));
    addEvents($('<%= EncFindSide_2.ClientID %>'),$('<%= EncFindSite_2.ClientID %>'),$('<%= EncFindSubsite_2.ClientID %>'),$('<%= EncFindInv_2.ClientID %>'),$('<%= EncFindInvSiteDIV_2.ClientID %>'),$('<%= EncFindInvSiteTitleDIV_2.ClientID %>'),$('<%= EncFindInvSite_2.ClientID %>'),$('<%= EncFindPrimaryDim_2.ClientID %>'),$('<%= EncFindSecondaryDim_2.ClientID %>'),$('<%= EncFindTertiaryDim_2.ClientID %>'));
    addEvents($('<%= EncFindSide_3.ClientID %>'),$('<%= EncFindSite_3.ClientID %>'),$('<%= EncFindSubsite_3.ClientID %>'),$('<%= EncFindInv_3.ClientID %>'),$('<%= EncFindInvSiteDIV_3.ClientID %>'),$('<%= EncFindInvSiteTitleDIV_3.ClientID %>'),$('<%= EncFindInvSite_3.ClientID %>'),$('<%= EncFindPrimaryDim_3.ClientID %>'),$('<%= EncFindSecondaryDim_3.ClientID %>'),$('<%= EncFindTertiaryDim_3.ClientID %>'));
    addEvents($('<%= EncFindSide_4.ClientID %>'),$('<%= EncFindSite_4.ClientID %>'),$('<%= EncFindSubsite_4.ClientID %>'),$('<%= EncFindInv_4.ClientID %>'),$('<%= EncFindInvSiteDIV_4.ClientID %>'),$('<%= EncFindInvSiteTitleDIV_4.ClientID %>'),$('<%= EncFindInvSite_4.ClientID %>'),$('<%= EncFindPrimaryDim_4.ClientID %>'),$('<%= EncFindSecondaryDim_4.ClientID %>'),$('<%= EncFindTertiaryDim_4.ClientID %>'));
    addEvents($('<%= EncFindSide_5.ClientID %>'),$('<%= EncFindSite_5.ClientID %>'),$('<%= EncFindSubsite_5.ClientID %>'),$('<%= EncFindInv_5.ClientID %>'),$('<%= EncFindInvSiteDIV_5.ClientID %>'),$('<%= EncFindInvSiteTitleDIV_5.ClientID %>'),$('<%= EncFindInvSite_5.ClientID %>'),$('<%= EncFindPrimaryDim_5.ClientID %>'),$('<%= EncFindSecondaryDim_5.ClientID %>'),$('<%= EncFindTertiaryDim_5.ClientID %>'));

    //Adds events to controls
    function addEvents(side,site,subsite,inv,invSiteDIV,invSiteTitleDIV,invSite,primaryDim,secondaryDim,tertiaryDim)
    { 
        $(side).addEvent('blur',curry(SetHiddenFields,side,site,subsite,inv,invSiteDIV,invSiteTitleDIV,invSite,primaryDim,secondaryDim,tertiaryDim));
        $(subsite).addEvent('blur',curry(SetHiddenFields,side,site,subsite,inv,invSiteDIV,invSiteTitleDIV,invSite,primaryDim,secondaryDim,tertiaryDim));
        $(inv).addEvent('blur',curry(SetHiddenFields,side,site,subsite,inv,invSiteDIV,invSiteTitleDIV,invSite,primaryDim,secondaryDim,tertiaryDim));
        $(primaryDim).addEvent('blur',curry(SetHiddenFields,side,site,subsite,inv,invSiteDIV,invSiteTitleDIV,invSite,primaryDim,secondaryDim,tertiaryDim));
        $(secondaryDim).addEvent('blur',curry(SetHiddenFields,side,site,subsite,inv,invSiteDIV,invSiteTitleDIV,invSite,primaryDim,secondaryDim,tertiaryDim));
        $(tertiaryDim).addEvent('blur',curry(SetHiddenFields,side,site,subsite,inv,invSiteDIV,invSiteTitleDIV,invSite,primaryDim,secondaryDim,tertiaryDim));
   
        var cbl = invSite.getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++)
        {
            var cblRef = cbl[j];
            if (cblRef.type == 'checkbox')
                  $(cblRef).addEvent('click',curry(SetHiddenFields,side,site,subsite,inv,invSiteDIV,invSiteTitleDIV,invSite,primaryDim,secondaryDim,tertiaryDim));
            else if (cblRef.type == 'text')
                  $(cblRef).addEvent('blur',curry(SetHiddenFields,side,site,subsite,inv,invSiteDIV,invSiteTitleDIV,invSite,primaryDim,secondaryDim,tertiaryDim));
        }     
        
            
        // show on load
        SetHiddenFields(side,site,subsite,inv,invSiteDIV,invSiteTitleDIV,invSite,primaryDim,secondaryDim,tertiaryDim);
   }

 
    /* ]]> */
    
function SetHiddenFields(side,site,subsite,inv,invSiteDIV,invSiteTitleDIV,invSite,primaryDim,secondaryDim,tertiaryDim)
{
    // if invasion is set to 'Yes", re-check the invasionSite rbl with the values stored in xml for the invasionSite field
    var invSiteString = RetrieveCheckBoxListSelectedValues (invSite,"TABLE");
    if (inv.value == 'Yes' )    
    {
        invSiteDIV.style.display = '';   
        invSiteTitleDIV.style.display = '';    

    }
    // else,
    else     
    {
        invSiteDIV.style.display = 'none';
        invSiteTitleDIV.style.display = 'none';    
       
        var cbl = invSite.getElementsByTagName('input');
         for (var i = 0; i < cbl.length; i++)
         {
            var cblRef = cbl[i];
            
            if (cblRef.type == 'checkbox')
                cblRef.checked = false;
            else if (cblRef.type == 'text')
                cblRef.value = ''; 
         }
    }    
    
    
    if (invSiteString != '' || side.value != '' || subsite.value != '' || inv.value != '' || primaryDim.value != '' || secondaryDim.value != '' || tertiaryDim.value != '')
    {
        site.value = 'Oral Cavity';
    }
    else
    {
        site.value = '';
    }

}
</script>
