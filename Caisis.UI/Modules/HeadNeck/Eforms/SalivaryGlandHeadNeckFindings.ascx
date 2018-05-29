<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandHeadNeckFindings" CodeFile="SalivaryGlandHeadNeckFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.SalivaryGlandHeadNeckFindingsHtmlTable = "SalivaryGlandHeadNeckFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="OropharynxHeadNeckFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Head and Neck Findings"></asp:Label><br/>
<table  border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="SalivaryGlandHeadNeckFindingsHtmlTable" > 


          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Side</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Site</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Subsite</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Prim. Dim (cm)</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left">&nbsp;Structures Involved</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          
            
          <tr>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide"  ID="EncFindSide_1" LookupCode="OpSide,Disease,SalivaryCancer" Runat="server" TabIndex="2" /></td>
          <td style="white-space: nowrap;" valign="top">
               <euc:EformDropDownList   Width="140px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_1" Runat="server" TabIndex="1" ShowEmptyListItem="true"  >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Major Salivary Gland" Text="Major Salivary Gland" ></asp:ListItem>
                    <asp:ListItem Value="Minor Salivary Gland" Text="Minor Salivary Gland" ></asp:ListItem>
                </euc:EformDropDownList></td>
            <td style="white-space: nowrap;" valign="top">
                <div id="EncFindSubsiteMinorDIV_1" runat="server">
                    <euc:CaisisComboBox DropDownWidth="auto" Width="140px" ID="EncFindSubsiteMinor_1"   LookupCode="BxSubSite,Disease,SalivaryCancer"   Runat="server" TabIndex="3"  />                
                </div>
                <div id="EncFindSubsiteMajorDIV_1" runat="server" style="display: none;">
                    <euc:CaisisSelect Width="140px" ID="EncFindSubsiteMajor_1"   Runat="server" TabIndex="3"  >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="Parotid" Text="Parotid" ></asp:ListItem>
                        <asp:ListItem Value="Submandibular" Text="Submandibular" ></asp:ListItem>
                        <asp:ListItem Value="Sublingual" Text="Sublingual" ></asp:ListItem>                        
                    </euc:CaisisSelect>                
                </div>
                
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite"  ID="EncFindSubsiteHidden_1" Runat="server"  /></td>                
                
            <td style="white-space: nowrap;" valign="top">
                <euc:EformTextBox Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" ID="EncFindPrimaryDim_1" Runat="server" TabIndex="4"  /> </td>

            <td style="white-space: nowrap;" valign="top">
                <euc:EformComboBox DropDownWidth="auto"  Width="80px" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv"    ID="EncFindInv_1" LookupCode="YesNoUnknown"    Runat="server" TabIndex="6" />
                
                <div id="EncFindInvSiteDIV_1" runat="server" style="display: none;">
                    <euc:CaisisCheckBoxList style="white-space: nowrap;"  ID="EncFindInvSite_1" Runat="server" TabIndex="7" ShowOther="true" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table">
                        <asp:ListItem Value="Skin " Text="Skin"></asp:ListItem>
                        <asp:ListItem Value="SCM" Text="Sternocleidomastoid"></asp:ListItem>
                        <asp:ListItem Value="Mastoid" Text="Mastoid Bone"></asp:ListItem>
                        <asp:ListItem Value="ExAC" Text="External Auditory Canal"></asp:ListItem>
                        <asp:ListItem Value="CN7" Text="Facial Nerve"></asp:ListItem>
                        <asp:ListItem Value="Carotid" Text="Carotid Artery"></asp:ListItem>
                        <asp:ListItem Value="Skull Base" Text="Skull Base"></asp:ListItem>
                        <asp:ListItem Value="CN12" Text="Hypoglossal Nerve"></asp:ListItem>
                        <asp:ListItem Value="Soft Tissue" Text="Soft Tissue"></asp:ListItem>
                    </euc:CaisisCheckBoxList>
                    
                 <euc:EformTextBox Width="1px" style="display: none;" RecordId="1" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite"  ID="EncFindInvSiteHidden_1" Runat="server"  />              
                   
                </div></td>

            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_1"  runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide"  ID="EncFindSide_2" LookupCode="OpSide,Disease,SalivaryCancer" Runat="server" TabIndex="2" /></td>
          <td style="white-space: nowrap;" valign="top">
               <euc:EformDropDownList   Width="140px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_2" Runat="server" TabIndex="1" ShowEmptyListItem="true"  >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Major Salivary Gland" Text="Major Salivary Gland" ></asp:ListItem>
                    <asp:ListItem Value="Minor Salivary Gland" Text="Minor Salivary Gland" ></asp:ListItem>
                </euc:EformDropDownList></td>
            <td style="white-space: nowrap;" valign="top">
                <div id="EncFindSubsiteMinorDIV_2" runat="server">
                    <euc:CaisisComboBox DropDownWidth="auto" Width="140px" ID="EncFindSubsiteMinor_2"   LookupCode="BxSubSite,Disease,SalivaryCancer"   Runat="server" TabIndex="3"  />                
                </div>
                <div id="EncFindSubsiteMajorDIV_2" runat="server" style="display: none;">
                    <euc:CaisisSelect Width="140px" ID="EncFindSubsiteMajor_2"   Runat="server" TabIndex="3"  >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="Parotid" Text="Parotid" ></asp:ListItem>
                        <asp:ListItem Value="Submandibular" Text="Submandibular" ></asp:ListItem>
                        <asp:ListItem Value="Sublingual" Text="Sublingual" ></asp:ListItem>                        
                    </euc:CaisisSelect>                
                </div>
                
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite"  ID="EncFindSubsiteHidden_2" Runat="server"  /></td>                
                
            <td style="white-space: nowrap;" valign="top">
                <euc:EformTextBox Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" ID="EncFindPrimaryDim_2" Runat="server" TabIndex="4"  /> </td>

            <td style="white-space: nowrap;" valign="top">
                <euc:EformComboBox DropDownWidth="auto"  Width="80px" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv"    ID="EncFindInv_2" LookupCode="YesNoUnknown"    Runat="server" TabIndex="6" />
                
                <div id="EncFindInvSiteDIV_2" runat="server" style="display: none;">
                    <euc:CaisisCheckBoxList style="white-space: nowrap;"  ID="EncFindInvSite_2" Runat="server" TabIndex="7" ShowOther="true" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table">
                        <asp:ListItem Value="Skin " Text="Skin"></asp:ListItem>
                        <asp:ListItem Value="SCM" Text="Sternocleidomastoid"></asp:ListItem>
                        <asp:ListItem Value="Mastoid" Text="Mastoid Bone"></asp:ListItem>
                        <asp:ListItem Value="ExAC" Text="External Auditory Canal"></asp:ListItem>
                        <asp:ListItem Value="CN7" Text="Facial Nerve"></asp:ListItem>
                        <asp:ListItem Value="Carotid" Text="Carotid Artery"></asp:ListItem>
                        <asp:ListItem Value="Skull Base" Text="Skull Base"></asp:ListItem>
                        <asp:ListItem Value="CN12" Text="Hypoglossal Nerve"></asp:ListItem>
                        <asp:ListItem Value="Soft Tissue" Text="Soft Tissue"></asp:ListItem>
                    </euc:CaisisCheckBoxList>
                    
                 <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite"  ID="EncFindInvSiteHidden_2" Runat="server"  />              
                   
                </div></td>

            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_2"  runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide"  ID="EncFindSide_3" LookupCode="OpSide,Disease,SalivaryCancer" Runat="server" TabIndex="2" /></td>
          <td style="white-space: nowrap;" valign="top">
               <euc:EformDropDownList   Width="140px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_3" Runat="server" TabIndex="1" ShowEmptyListItem="true"  >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Major Salivary Gland" Text="Major Salivary Gland" ></asp:ListItem>
                    <asp:ListItem Value="Minor Salivary Gland" Text="Minor Salivary Gland" ></asp:ListItem>
                </euc:EformDropDownList></td>
            <td style="white-space: nowrap;" valign="top">
                <div id="EncFindSubsiteMinorDIV_3" runat="server">
                    <euc:CaisisComboBox DropDownWidth="auto" Width="140px" ID="EncFindSubsiteMinor_3"   LookupCode="BxSubSite,Disease,SalivaryCancer"   Runat="server" TabIndex="3"  />                
                </div>
                <div id="EncFindSubsiteMajorDIV_3" runat="server" style="display: none;">
                    <euc:CaisisSelect Width="140px" ID="EncFindSubsiteMajor_3"   Runat="server" TabIndex="3"  >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="Parotid" Text="Parotid" ></asp:ListItem>
                        <asp:ListItem Value="Submandibular" Text="Submandibular" ></asp:ListItem>
                        <asp:ListItem Value="Sublingual" Text="Sublingual" ></asp:ListItem>                        
                    </euc:CaisisSelect>                
                </div>
                
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite"  ID="EncFindSubsiteHidden_3" Runat="server"  /></td>                
                
            <td style="white-space: nowrap;" valign="top">
                <euc:EformTextBox Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" ID="EncFindPrimaryDim_3" Runat="server" TabIndex="4"  /> </td>

            <td style="white-space: nowrap;" valign="top">
                <euc:EformComboBox DropDownWidth="auto"  Width="80px" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv"    ID="EncFindInv_3" LookupCode="YesNoUnknown"    Runat="server" TabIndex="6" />
                
                <div id="EncFindInvSiteDIV_3" runat="server" style="display: none;">
                    <euc:CaisisCheckBoxList style="white-space: nowrap;"  ID="EncFindInvSite_3" Runat="server" TabIndex="7" ShowOther="true" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table">
                        <asp:ListItem Value="Skin " Text="Skin"></asp:ListItem>
                        <asp:ListItem Value="SCM" Text="Sternocleidomastoid"></asp:ListItem>
                        <asp:ListItem Value="Mastoid" Text="Mastoid Bone"></asp:ListItem>
                        <asp:ListItem Value="ExAC" Text="External Auditory Canal"></asp:ListItem>
                        <asp:ListItem Value="CN7" Text="Facial Nerve"></asp:ListItem>
                        <asp:ListItem Value="Carotid" Text="Carotid Artery"></asp:ListItem>
                        <asp:ListItem Value="Skull Base" Text="Skull Base"></asp:ListItem>
                        <asp:ListItem Value="CN12" Text="Hypoglossal Nerve"></asp:ListItem>
                        <asp:ListItem Value="Soft Tissue" Text="Soft Tissue"></asp:ListItem>
                    </euc:CaisisCheckBoxList>
                    
                 <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite"  ID="EncFindInvSiteHidden_3" Runat="server"  />              
                   
                </div></td>

            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_3"  runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide"  ID="EncFindSide_4" LookupCode="OpSide,Disease,SalivaryCancer" Runat="server" TabIndex="2" /></td>
          <td style="white-space: nowrap;" valign="top">
               <euc:EformDropDownList   Width="140px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_4" Runat="server" TabIndex="1" ShowEmptyListItem="true"  >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Major Salivary Gland" Text="Major Salivary Gland" ></asp:ListItem>
                    <asp:ListItem Value="Minor Salivary Gland" Text="Minor Salivary Gland" ></asp:ListItem>
                </euc:EformDropDownList></td>
            <td style="white-space: nowrap;" valign="top">
                <div id="EncFindSubsiteMinorDIV_4" runat="server">
                    <euc:CaisisComboBox DropDownWidth="auto" Width="140px" ID="EncFindSubsiteMinor_4"   LookupCode="BxSubSite,Disease,SalivaryCancer"   Runat="server" TabIndex="3"  />                
                </div>
                <div id="EncFindSubsiteMajorDIV_4" runat="server" style="display: none;">
                    <euc:CaisisSelect Width="140px" ID="EncFindSubsiteMajor_4"   Runat="server" TabIndex="3"  >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="Parotid" Text="Parotid" ></asp:ListItem>
                        <asp:ListItem Value="Submandibular" Text="Submandibular" ></asp:ListItem>
                        <asp:ListItem Value="Sublingual" Text="Sublingual" ></asp:ListItem>                        
                    </euc:CaisisSelect>                
                </div>
                
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite"  ID="EncFindSubsiteHidden_4" Runat="server"  /></td>                
                
            <td style="white-space: nowrap;" valign="top">
                <euc:EformTextBox Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" ID="EncFindPrimaryDim_4" Runat="server" TabIndex="4"  /> </td>

            <td style="white-space: nowrap;" valign="top">
                <euc:EformComboBox DropDownWidth="auto"  Width="80px" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv"    ID="EncFindInv_4" LookupCode="YesNoUnknown"    Runat="server" TabIndex="6" />
                
                <div id="EncFindInvSiteDIV_4" runat="server" style="display: none;">
                    <euc:CaisisCheckBoxList style="white-space: nowrap;"  ID="EncFindInvSite_4" Runat="server" TabIndex="7" ShowOther="true" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table">
                        <asp:ListItem Value="Skin " Text="Skin"></asp:ListItem>
                        <asp:ListItem Value="SCM" Text="Sternocleidomastoid"></asp:ListItem>
                        <asp:ListItem Value="Mastoid" Text="Mastoid Bone"></asp:ListItem>
                        <asp:ListItem Value="ExAC" Text="External Auditory Canal"></asp:ListItem>
                        <asp:ListItem Value="CN7" Text="Facial Nerve"></asp:ListItem>
                        <asp:ListItem Value="Carotid" Text="Carotid Artery"></asp:ListItem>
                        <asp:ListItem Value="Skull Base" Text="Skull Base"></asp:ListItem>
                        <asp:ListItem Value="CN12" Text="Hypoglossal Nerve"></asp:ListItem>
                         <asp:ListItem Value="Soft Tissue" Text="Soft Tissue"></asp:ListItem>
                   </euc:CaisisCheckBoxList>
                    
                 <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite"  ID="EncFindInvSiteHidden_4" Runat="server"  />              
                   
                </div></td>

            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_4"  runat="server"/></td>
         </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSide"  ID="EncFindSide_5" LookupCode="OpSide,Disease,SalivaryCancer" Runat="server" TabIndex="2" /></td>
          <td style="white-space: nowrap;" valign="top">
               <euc:EformDropDownList   Width="140px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSite" ID="EncFindSite_5" Runat="server" TabIndex="1" ShowEmptyListItem="true"  >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Major Salivary Gland" Text="Major Salivary Gland" ></asp:ListItem>
                    <asp:ListItem Value="Minor Salivary Gland" Text="Minor Salivary Gland" ></asp:ListItem>
                </euc:EformDropDownList></td>
            <td style="white-space: nowrap;" valign="top">
                <div id="EncFindSubsiteMinorDIV_5" runat="server">
                    <euc:CaisisComboBox DropDownWidth="auto" Width="140px" ID="EncFindSubsiteMinor_5"   LookupCode="BxSubSite,Disease,SalivaryCancer"   Runat="server" TabIndex="3"  />                
                </div>
                <div id="EncFindSubsiteMajorDIV_5" runat="server" style="display: none;">
                    <euc:CaisisSelect Width="140px" ID="EncFindSubsiteMajor_5"   Runat="server" TabIndex="3"  >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="Parotid" Text="Parotid" ></asp:ListItem>
                        <asp:ListItem Value="Submandibular" Text="Submandibular" ></asp:ListItem>
                        <asp:ListItem Value="Sublingual" Text="Sublingual" ></asp:ListItem>                        
                    </euc:CaisisSelect>                
                </div>
                
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindSubsite"  ID="EncFindSubsiteHidden_5" Runat="server"  /></td>                
                
            <td style="white-space: nowrap;" valign="top">
                <euc:EformTextBox Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindPrimaryDim" ID="EncFindPrimaryDim_5" Runat="server" TabIndex="4"  /> </td>

            <td style="white-space: nowrap;" valign="top">
                <euc:EformComboBox DropDownWidth="auto"  Width="80px" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInv"    ID="EncFindInv_5" LookupCode="YesNoUnknown"    Runat="server" TabIndex="6" />
                
                <div id="EncFindInvSiteDIV_5" runat="server" style="display: none;">
                    <euc:CaisisCheckBoxList style="white-space: nowrap;"  ID="EncFindInvSite_5" Runat="server" TabIndex="7" ShowOther="true" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table">
                        <asp:ListItem Value="Skin " Text="Skin"></asp:ListItem>
                        <asp:ListItem Value="SCM" Text="Sternocleidomastoid"></asp:ListItem>
                        <asp:ListItem Value="Mastoid" Text="Mastoid Bone"></asp:ListItem>
                        <asp:ListItem Value="ExAC" Text="External Auditory Canal"></asp:ListItem>
                        <asp:ListItem Value="CN7" Text="Facial Nerve"></asp:ListItem>
                        <asp:ListItem Value="Carotid" Text="Carotid Artery"></asp:ListItem>
                        <asp:ListItem Value="Skull Base" Text="Skull Base"></asp:ListItem>
                        <asp:ListItem Value="CN12" Text="Hypoglossal Nerve"></asp:ListItem>
                        <asp:ListItem Value="Soft Tissue" Text="Soft Tissue"></asp:ListItem>
                    </euc:CaisisCheckBoxList>
                    
                 <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" ParentRecordId="1" TABLE="EncHeadNeckFinding" FIELD="EncFindInvSite"  ID="EncFindInvSiteHidden_5" Runat="server"  />              
                   
                </div></td>

            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_5"  runat="server"/></td>
         </tr>
 
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SalivaryGlandHeadNeckFindingsHtmlTable');" />

<br /><br /><br />

<script type="text/javascript">

    /* <![CDATA[ */
    addEvents($('<%= EncFindSide_1.ClientID %>'),$('<%= EncFindSite_1.ClientID %>'),$('<%= EncFindSubsiteHidden_1.ClientID %>'),$('<%= EncFindSubsiteMinorDIV_1.ClientID %>'),$('<%= EncFindSubsiteMinor_1.ClientID %>'),$('<%= EncFindSubsiteMajorDIV_1.ClientID %>'),$('<%= EncFindSubsiteMajor_1.ClientID %>'),$('<%= EncFindPrimaryDim_1.ClientID %>'),$('<%= EncFindInv_1.ClientID %>'),$('<%= EncFindInvSiteDIV_1.ClientID %>'),$('<%= EncFindInvSite_1.ClientID %>'),$('<%= EncFindInvSiteHidden_1.ClientID %>'));
    addEvents($('<%= EncFindSide_2.ClientID %>'),$('<%= EncFindSite_2.ClientID %>'),$('<%= EncFindSubsiteHidden_2.ClientID %>'),$('<%= EncFindSubsiteMinorDIV_2.ClientID %>'),$('<%= EncFindSubsiteMinor_2.ClientID %>'),$('<%= EncFindSubsiteMajorDIV_2.ClientID %>'),$('<%= EncFindSubsiteMajor_2.ClientID %>'),$('<%= EncFindPrimaryDim_2.ClientID %>'),$('<%= EncFindInv_2.ClientID %>'),$('<%= EncFindInvSiteDIV_2.ClientID %>'),$('<%= EncFindInvSite_2.ClientID %>'),$('<%= EncFindInvSiteHidden_2.ClientID %>'));
    addEvents($('<%= EncFindSide_3.ClientID %>'),$('<%= EncFindSite_3.ClientID %>'),$('<%= EncFindSubsiteHidden_3.ClientID %>'),$('<%= EncFindSubsiteMinorDIV_3.ClientID %>'),$('<%= EncFindSubsiteMinor_3.ClientID %>'),$('<%= EncFindSubsiteMajorDIV_3.ClientID %>'),$('<%= EncFindSubsiteMajor_3.ClientID %>'),$('<%= EncFindPrimaryDim_3.ClientID %>'),$('<%= EncFindInv_3.ClientID %>'),$('<%= EncFindInvSiteDIV_3.ClientID %>'),$('<%= EncFindInvSite_3.ClientID %>'),$('<%= EncFindInvSiteHidden_3.ClientID %>'));
    addEvents($('<%= EncFindSide_4.ClientID %>'),$('<%= EncFindSite_4.ClientID %>'),$('<%= EncFindSubsiteHidden_4.ClientID %>'),$('<%= EncFindSubsiteMinorDIV_4.ClientID %>'),$('<%= EncFindSubsiteMinor_4.ClientID %>'),$('<%= EncFindSubsiteMajorDIV_4.ClientID %>'),$('<%= EncFindSubsiteMajor_4.ClientID %>'),$('<%= EncFindPrimaryDim_4.ClientID %>'),$('<%= EncFindInv_4.ClientID %>'),$('<%= EncFindInvSiteDIV_4.ClientID %>'),$('<%= EncFindInvSite_4.ClientID %>'),$('<%= EncFindInvSiteHidden_4.ClientID %>'));
    addEvents($('<%= EncFindSide_5.ClientID %>'),$('<%= EncFindSite_5.ClientID %>'),$('<%= EncFindSubsiteHidden_5.ClientID %>'),$('<%= EncFindSubsiteMinorDIV_5.ClientID %>'),$('<%= EncFindSubsiteMinor_5.ClientID %>'),$('<%= EncFindSubsiteMajorDIV_5.ClientID %>'),$('<%= EncFindSubsiteMajor_5.ClientID %>'),$('<%= EncFindPrimaryDim_5.ClientID %>'),$('<%= EncFindInv_5.ClientID %>'),$('<%= EncFindInvSiteDIV_5.ClientID %>'),$('<%= EncFindInvSite_5.ClientID %>'),$('<%= EncFindInvSiteHidden_5.ClientID %>'));

    //Adds events to controls
    function addEvents(side,site,subsiteHidden,subsiteMinorDiv,subsiteMinor,subsiteMajorDiv,subsiteMajor,primaryDim,invasion,invaionSiteDiv,invasionSite,invasionSiteHidden)
    { 
        $(side).addEvent('blur',curry(SetHiddenFields,side,site,subsiteHidden,subsiteMinorDiv,subsiteMinor,subsiteMajorDiv,subsiteMajor,primaryDim,invasion,invaionSiteDiv,invasionSite,invasionSiteHidden));
        $(site).addEvent('blur',curry(SetHiddenFields,side,site,subsiteHidden,subsiteMinorDiv,subsiteMinor,subsiteMajorDiv,subsiteMajor,primaryDim,invasion,invaionSiteDiv,invasionSite,invasionSiteHidden));
        $(subsiteMinor).addEvent('blur',curry(SetHiddenFields,side,site,subsiteHidden,subsiteMinorDiv,subsiteMinor,subsiteMajorDiv,subsiteMajor,primaryDim,invasion,invaionSiteDiv,invasionSite,invasionSiteHidden));
        $(subsiteMajor).addEvent('blur',curry(SetHiddenFields,side,site,subsiteHidden,subsiteMinorDiv,subsiteMinor,subsiteMajorDiv,subsiteMajor,primaryDim,invasion,invaionSiteDiv,invasionSite,invasionSiteHidden));
        $(invasion).addEvent('blur',curry(SetHiddenFields,side,site,subsiteHidden,subsiteMinorDiv,subsiteMinor,subsiteMajorDiv,subsiteMajor,primaryDim,invasion,invaionSiteDiv,invasionSite,invasionSiteHidden));
   
        var rbl = invasionSite.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++)
        {
            var rblRef = rbl[j];
            if (rblRef.type == 'checkbox')
                  $(rblRef).addEvent('click',curry(SetHiddenFields,side,site,subsiteHidden,subsiteMinorDiv,subsiteMinor,subsiteMajorDiv,subsiteMajor,primaryDim,invasion,invaionSiteDiv,invasionSite,invasionSiteHidden));
            else if (rblRef.type == 'text')
                  $(rblRef).addEvent('blur',curry(SetHiddenFields,side,site,subsiteHidden,subsiteMinorDiv,subsiteMinor,subsiteMajorDiv,subsiteMajor,primaryDim,invasion,invaionSiteDiv,invasionSite,invasionSiteHidden));
        }     
        
            
        // show on load
        ShowOnLoad(side,site,subsiteHidden,subsiteMinorDiv,subsiteMinor,subsiteMajorDiv,subsiteMajor,primaryDim,invasion,invaionSiteDiv,invasionSite,invasionSiteHidden);
   }

 
    /* ]]> */
    
function ShowOnLoad(side,site,subsiteHidden,subsiteMinorDiv,subsiteMinor,subsiteMajorDiv,subsiteMajor,primaryDim,invasion,invaionSiteDiv,invasionSite,invasionSiteHidden)
{
    // if 'Major Salivary Gland' is chosen as site, show hard-coded drop down options
    if (site.value == 'Major Salivary Gland' )    
    {
        subsiteMajorDiv.style.display = 'block';
        subsiteMinorDiv.style.display = 'none'; 
        subsiteMajor.value = subsiteHidden.value;       
    }
    // else, show combo box will lookup code
    else     
    {
        subsiteMajorDiv.style.display = 'none';
        subsiteMinorDiv.style.display = 'block';
        subsiteMinor.value = subsiteHidden.value;   
    }
    
    var rbl = invasionSite.getElementsByTagName('input');
    
    // if invasion is set to 'Yes", re-check the invasionSite rbl with the values stored in xml for the invasionSite field
    if (invasion.value == 'Yes')    
    {
        invaionSiteDiv.style.display = 'block'; 
        
        if (invasionSiteHidden.value != '')
        {
            var invasionSiteString =   invasionSiteHidden.value;
            var invasionArray =  invasionSiteString.split(",");
            
            for (var i = 0; i < invasionArray.length; i++)
            {
                var found = 'false';
                for (var j = 0; j < rbl.length; j++)
                {
                    // for each value in xml invasionSite field, find corresponding value in rbl, and check as true
                    var rblRef = rbl[j];
                    var rblLabel = rblRef.parentNode.getElementsByTagName('label');
                    if (invasionArray[i] == rblLabel[0].innerHTML)   
                    {
                        rblRef.checked = true;
                        found = 'true';
                        break;
                    } 
                }
                
                // if value is not found in a check box, it must be entered into 'Other' textbox
                if (found == 'false')
                {
                    var rblRef2 = rbl[rbl.length - 1];
                    var rblRef3 = rbl[rbl.length - 2];
                    rblRef2.value = invasionArray[i];
                    rblRef3.checked = true;                               
                }
            }
        }
    }
    else     
    {
        invaionSiteDiv.style.display = 'none';    
        
         for (var i = 0; i < rbl.length; i++)
         {
            var rblRef = rbl[i];
            
            if (rblRef.type == 'checkbox')
                rblRef.checked = false;
            else if (rblRef.type == 'text')
                rblRef.value = ''; 
         }          
        
    } 
}

function SetHiddenFields(side,site,subsiteHidden,subsiteMinorDiv,subsiteMinor,subsiteMajorDiv,subsiteMajor,primaryDim,invasion,invaionSiteDiv,invasionSite,invasionSiteHidden)
{
    // if invasion is set to 'Yes", re-check the invasionSite rbl with the values stored in xml for the invasionSite field
    if (site.value == 'Major Salivary Gland' )    
    {
        subsiteMajorDiv.style.display = 'block';
        subsiteMinorDiv.style.display = 'none'; 
        subsiteHidden.value = subsiteMajor.value;       
    }
    // else, show combo box will lookup code
    else     
    {
        subsiteMajorDiv.style.display = 'none';
        subsiteMinorDiv.style.display = 'block';
        subsiteHidden.value = subsiteMinor.value;   
    }
    
    var rbl = invasionSite.getElementsByTagName('input');
    
    // if invasion is set to 'Yes", store the selected items from rbl in invasionSite field as comma-delimited string
    if (invasion.value == 'Yes' )    
    {
        invaionSiteDiv.style.display = 'block';
        invasionSiteHidden.value = RetrieveCheckBoxListSelectedValues (invasionSite,"TABLE");
    }
    else     
    {
        invaionSiteDiv.style.display = 'none';        
        
         for (var i = 0; i < rbl.length; i++)
         {
            var rblRef = rbl[i];
            
            if (rblRef.type == 'checkbox')
                rblRef.checked = false;
            else if (rblRef.type == 'text')
                rblRef.value = ''; 
         }
            
        invasionSiteHidden.value = '';
    }    
}
</script>
