<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeadNeckAncillaryProcedure.ascx.cs" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.HeadNeckAncillaryProcedure" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
    tableArray.ProceduresAcnillaryHtmlTable = "ProceduresAcnillaryHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="HeadNeckAncillaryProcedure" /><br/>

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Ancillary Procedures"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="AncillaryProcedureRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="AncillaryProcedureRecorded">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>
        </td>
    </tr>
</table>
<br />
<div id="AncillaryProcedureDiv" runat="server" style="display: none;">
    <table border="0" cellspacing="1" cellpadding="3" class="ClinicalEformTable" id="ProceduresAcnillaryHtmlTable">
         <tr>         
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Side</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Site</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Subsite</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Procedure</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Approach</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
        </tr> 
        
        <tr >
            <td>
                
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_2" />
                
            
                <euc:EformDropDownList Width="80px" Runat="server" ID="ProcSide_2" TABLE="Procedures" FIELD="ProcSide" ShowEmptyListItem="true"  RecordId="2" TabIndex="3">           	        
           	        <asp:ListItem></asp:ListItem>
           	        <asp:ListItem Value="Left" Text="Left" />
           	        <asp:ListItem Value="Right" Text="Right" />
                    <asp:ListItem Value="Bilateral" Text="Bilateral" />
                    <asp:ListItem Value="Midline" Text="Midline" />
                </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformDropDownList Width="120px" Runat="server" ID="ProcSite_2" RecordId="2" TABLE="Procedures" FIELD="ProcSite" ShowEmptyListItem="true" TabIndex="4">           	        
           	        <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Eyes and Orbit" Text="Eyes and Orbit" />
                    <asp:ListItem Value="Hypopharynx" Text="Hypopharynx" />
                    <asp:ListItem Value="Larynx" Text="Larynx" />
                    <asp:ListItem Value="Lips" Text="Lips" />
                    <asp:ListItem Value="Nasal Cavity" Text="Nasal Cavity" />
                    <asp:ListItem Value="Nasopharynx" Text="Nasopharynx" />
                    <asp:ListItem Value="Neck" Text="Neck" />
                    <asp:ListItem Value="Oral Cavity" Text="Oral Cavity" /> 
                    <asp:ListItem Value="Oropharynx" Text="Oropharynx" />                              
                    <asp:ListItem Value="Paranasal Sinus" Text="Paranasal Sinus" />    
                    <asp:ListItem Value="Parathyroid" Text="Parathyroid" />
                    <asp:ListItem Value="Parotid" Text="Parotid" />
                    <asp:ListItem Value="Scalp and Skin" Text="Scalp and Skin" />
                    <asp:ListItem Value="Skull Base" Text="Skull Base" />
                    <asp:ListItem Value="Sublingual" Text="Sublingual" />
                    <asp:ListItem Value="Submandibular" Text="Submandibular" />
                    <asp:ListItem Value="Thyroid" Text="Thyroid" />     
                    <asp:ListItem Value="Trachea" Text="Trachea" />
                    <asp:ListItem Value="Other" Text="Other" />
                </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformComboBox DropDownWidth="150px" Width="100px" Runat="server" RecordId="2" ID="ProcSubsite_2" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_2" CascadeFormatString="HeadNeckSite" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" CascadeValuesBasedOn="$ProcSite_2" CascadeFormatString="HeadNeckSite" style="width:150px;" Field="ProcName" id="ProcName_2" RecordId="2" Table="Procedures" MaxLength="50" TabIndex="6" DropDownWidth="280px"/>
            </td>
            <td>                
                <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px"  Width="150px" Runat="server" RecordId="2" LookupCode="HeadNeckApproach"
                    ID="ProcApproach_2" TABLE="Procedures" FIELD="ProcApproach" ShowOther="true" TabIndex="7">                    
                </euc:EformCheckBoxList>
            </td>          

            <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
          </tr>

          <tr style="display: none;">
            <td>
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_3" /> 

           
                <euc:EformDropDownList Width="80px" Runat="server" ID="ProcSide_3" TABLE="Procedures" FIELD="ProcSide" ShowEmptyListItem="true"  RecordId="3" TabIndex="3">
           	        <asp:ListItem></asp:ListItem>
           	        <asp:ListItem Value="Left" Text="Left" />
           	        <asp:ListItem Value="Right" Text="Right" />
                    <asp:ListItem Value="Bilateral" Text="Bilateral" />
                    <asp:ListItem Value="Midline" Text="Midline" />
           	    </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformDropDownList Width="120px" Runat="server" ID="ProcSite_3" TABLE="Procedures" FIELD="ProcSite" ShowEmptyListItem="true"  RecordId="3" TabIndex="4">           	        
           	        <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Eyes and Orbit" Text="Eyes and Orbit" />
                    <asp:ListItem Value="Hypopharynx" Text="Hypopharynx" />
                    <asp:ListItem Value="Larynx" Text="Larynx" />
                    <asp:ListItem Value="Lips" Text="Lips" />
                    <asp:ListItem Value="Nasal Cavity" Text="Nasal Cavity" />
                    <asp:ListItem Value="Nasopharynx" Text="Nasopharynx" />
                    <asp:ListItem Value="Neck" Text="Neck" />
                    <asp:ListItem Value="Oral Cavity" Text="Oral Cavity" /> 
                    <asp:ListItem Value="Oropharynx" Text="Oropharynx" />                              
                    <asp:ListItem Value="Paranasal Sinus" Text="Paranasal Sinus" />    
                    <asp:ListItem Value="Parathyroid" Text="Parathyroid" />
                    <asp:ListItem Value="Parotid" Text="Parotid" />
                    <asp:ListItem Value="Scalp and Skin" Text="Scalp and Skin" />
                    <asp:ListItem Value="Skull Base" Text="Skull Base" />
                    <asp:ListItem Value="Sublingual" Text="Sublingual" />
                    <asp:ListItem Value="Submandibular" Text="Submandibular" />
                    <asp:ListItem Value="Thyroid" Text="Thyroid" />     
                    <asp:ListItem Value="Trachea" Text="Trachea" />                            
                    <asp:ListItem Value="Other" Text="Other" />
                </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformComboBox DropDownWidth="150px" Width="100px" Runat="server" ID="ProcSubsite_3" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_3" CascadeFormatString="HeadNeckSite" RecordId="3" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" Field="ProcName" RecordId="3" Table="Procedures" MaxLength="50" id="ProcName_3" CascadeValuesBasedOn="$ProcSite_3" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
            </td>
            <td>
                 <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px"  Width="150px" Runat="server" RecordId="3" LookupCode="HeadNeckApproach"
                    ID="ProcApproach_3" TABLE="Procedures" FIELD="ProcApproach" ShowOther="true" TabIndex="7">                    
                </euc:EformCheckBoxList>
            </td>          

            <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
         </tr>

         <tr style="display: none;">
            <td>
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_4" />  
          
            
                <euc:EformDropDownList Width="80px" Runat="server" ID="ProcSide_4" TABLE="Procedures" FIELD="ProcSide" ShowEmptyListItem="true"  RecordId="4" TabIndex="3">
           	        <asp:ListItem></asp:ListItem>
           	        <asp:ListItem Value="Left" Text="Left" />
           	        <asp:ListItem Value="Right" Text="Right" />
                    <asp:ListItem Value="Bilateral" Text="Bilateral" />
                    <asp:ListItem Value="Midline" Text="Midline" />
           	    </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformDropDownList Width="120px" Runat="server" ID="ProcSite_4" TABLE="Procedures" FIELD="ProcSite" ShowEmptyListItem="true"  RecordId="4" TabIndex="4">           	       
           	        <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Eyes and Orbit" Text="Eyes and Orbit" />
                    <asp:ListItem Value="Hypopharynx" Text="Hypopharynx" />
                    <asp:ListItem Value="Larynx" Text="Larynx" />
                    <asp:ListItem Value="Lips" Text="Lips" />
                    <asp:ListItem Value="Nasal Cavity" Text="Nasal Cavity" />
                    <asp:ListItem Value="Nasopharynx" Text="Nasopharynx" />
                    <asp:ListItem Value="Neck" Text="Neck" />
                    <asp:ListItem Value="Oral Cavity" Text="Oral Cavity" /> 
                    <asp:ListItem Value="Oropharynx" Text="Oropharynx" />                              
                    <asp:ListItem Value="Paranasal Sinus" Text="Paranasal Sinus" />    
                    <asp:ListItem Value="Parathyroid" Text="Parathyroid" />
                    <asp:ListItem Value="Parotid" Text="Parotid" />
                    <asp:ListItem Value="Scalp and Skin" Text="Scalp and Skin" />
                    <asp:ListItem Value="Skull Base" Text="Skull Base" />
                    <asp:ListItem Value="Sublingual" Text="Sublingual" />
                    <asp:ListItem Value="Submandibular" Text="Submandibular" />
                    <asp:ListItem Value="Thyroid" Text="Thyroid" />     
                    <asp:ListItem Value="Trachea" Text="Trachea" />      
                    <asp:ListItem Value="Other" Text="Other" />
                </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformComboBox DropDownWidth="150px" Width="100px" Runat="server" ID="ProcSubsite_4" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_4" CascadeFormatString="HeadNeckSite"  RecordId="4" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" Field="ProcName" RecordId="4" Table="Procedures" MaxLength="50" id="ProcName_4" CascadeValuesBasedOn="$ProcSite_4" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
            </td>
            <td>
                <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px"  Width="150px" Runat="server" RecordId="4" LookupCode="HeadNeckApproach"
                    ID="ProcApproach_4" TABLE="Procedures" FIELD="ProcApproach" ShowOther="true" TabIndex="7">                    
                </euc:EformCheckBoxList>
            </td>          

            <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
         </tr>

         <tr style="display: none;">
            <td>
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_5" /> 

                <euc:EformDropDownList Width="80px" Runat="server" ID="ProcSide_5" TABLE="Procedures" FIELD="ProcSide" ShowEmptyListItem="true"  RecordId="5" TabIndex="3">
           	        <asp:ListItem></asp:ListItem>
           	        <asp:ListItem Value="Left" Text="Left" />
           	        <asp:ListItem Value="Right" Text="Right" />
                    <asp:ListItem Value="Bilateral" Text="Bilateral" />
                    <asp:ListItem Value="Midline" Text="Midline" />
           	    </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformDropDownList Width="120px" Runat="server" ID="ProcSite_5" TABLE="Procedures" FIELD="ProcSite" ShowEmptyListItem="true"  RecordId="5" TabIndex="4">           	        
           	        <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Eyes and Orbit" Text="Eyes and Orbit" />
                    <asp:ListItem Value="Hypopharynx" Text="Hypopharynx" />
                    <asp:ListItem Value="Larynx" Text="Larynx" />
                    <asp:ListItem Value="Lips" Text="Lips" />
                    <asp:ListItem Value="Nasal Cavity" Text="Nasal Cavity" />
                    <asp:ListItem Value="Nasopharynx" Text="Nasopharynx" />
                    <asp:ListItem Value="Neck" Text="Neck" />
                    <asp:ListItem Value="Oral Cavity" Text="Oral Cavity" /> 
                    <asp:ListItem Value="Oropharynx" Text="Oropharynx" />                              
                    <asp:ListItem Value="Paranasal Sinus" Text="Paranasal Sinus" />    
                    <asp:ListItem Value="Parathyroid" Text="Parathyroid" />
                    <asp:ListItem Value="Parotid" Text="Parotid" />
                    <asp:ListItem Value="Scalp and Skin" Text="Scalp and Skin" />
                    <asp:ListItem Value="Skull Base" Text="Skull Base" />
                    <asp:ListItem Value="Sublingual" Text="Sublingual" />
                    <asp:ListItem Value="Submandibular" Text="Submandibular" />
                    <asp:ListItem Value="Thyroid" Text="Thyroid" />     
                    <asp:ListItem Value="Trachea" Text="Trachea" />      
                    <asp:ListItem Value="Other" Text="Other" />
                </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformComboBox DropDownWidth="150px" Width="100px" Runat="server" ID="ProcSubsite_5" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_5" CascadeFormatString="HeadNeckSite"  RecordId="5" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" Field="ProcName" RecordId="5" Table="Procedures" MaxLength="50" id="ProcName_5" CascadeValuesBasedOn="$ProcSite_5" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
            </td>
            <td>
                <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px"  Width="150px" Runat="server" RecordId="5" LookupCode="HeadNeckApproach"
                    ID="ProcApproach_5" TABLE="Procedures" FIELD="ProcApproach" ShowOther="true" TabIndex="7">                    
                </euc:EformCheckBoxList>
            </td>          

            <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
         </tr>

         <tr style="display: none;">
            <td>
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_6" />

                <euc:EformDropDownList Width="80px" Runat="server" ID="ProcSide_6" TABLE="Procedures" FIELD="ProcSide" ShowEmptyListItem="true"  RecordId="6" TabIndex="3">
           	        <asp:ListItem></asp:ListItem>
           	        <asp:ListItem Value="Left" Text="Left" />
           	        <asp:ListItem Value="Right" Text="Right" />
                    <asp:ListItem Value="Bilateral" Text="Bilateral" />
                    <asp:ListItem Value="Midline" Text="Midline" />
           	    </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformDropDownList Width="120px" Runat="server" ID="ProcSite_6" TABLE="Procedures" FIELD="ProcSite" ShowEmptyListItem="true"  RecordId="6" TabIndex="4">           	       
           	        <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Eyes and Orbit" Text="Eyes and Orbit" />
                    <asp:ListItem Value="Hypopharynx" Text="Hypopharynx" />
                    <asp:ListItem Value="Larynx" Text="Larynx" />
                    <asp:ListItem Value="Lips" Text="Lips" />
                    <asp:ListItem Value="Nasal Cavity" Text="Nasal Cavity" />
                    <asp:ListItem Value="Nasopharynx" Text="Nasopharynx" />
                    <asp:ListItem Value="Neck" Text="Neck" />
                    <asp:ListItem Value="Oral Cavity" Text="Oral Cavity" /> 
                    <asp:ListItem Value="Oropharynx" Text="Oropharynx" />                              
                    <asp:ListItem Value="Paranasal Sinus" Text="Paranasal Sinus" />    
                    <asp:ListItem Value="Parathyroid" Text="Parathyroid" />
                    <asp:ListItem Value="Parotid" Text="Parotid" />
                    <asp:ListItem Value="Scalp and Skin" Text="Scalp and Skin" />
                    <asp:ListItem Value="Skull Base" Text="Skull Base" />
                    <asp:ListItem Value="Sublingual" Text="Sublingual" />
                    <asp:ListItem Value="Submandibular" Text="Submandibular" />
                    <asp:ListItem Value="Thyroid" Text="Thyroid" />     
                    <asp:ListItem Value="Trachea" Text="Trachea" />      
                    <asp:ListItem Value="Other" Text="Other" />
                </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformComboBox DropDownWidth="150px" Width="100px" Runat="server" ID="ProcSubsite_6" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_6" CascadeFormatString="HeadNeckSite"  RecordId="6" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" Field="ProcName" RecordId="6" Table="Procedures" MaxLength="50" id="ProcName_6" CascadeValuesBasedOn="$ProcSite_6" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
            </td>
            <td>
                <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px"  Width="150px" Runat="server" RecordId="6" LookupCode="HeadNeckApproach"
                    ID="ProcApproach_6" TABLE="Procedures" FIELD="ProcApproach" ShowOther="true" TabIndex="7">                    
                </euc:EformCheckBoxList>
            </td>          

            <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
         </tr>

         <tr style="display: none;">
            <td>
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_7" />

                <euc:EformDropDownList Width="80px" Runat="server" ID="ProcSide_7" TABLE="Procedures" FIELD="ProcSide" ShowEmptyListItem="true"  RecordId="7" TabIndex="3">
           	        <asp:ListItem></asp:ListItem>
           	        <asp:ListItem Value="Left" Text="Left" />
           	        <asp:ListItem Value="Right" Text="Right" />
                    <asp:ListItem Value="Bilateral" Text="Bilateral" />
                    <asp:ListItem Value="Midline" Text="Midline" />
           	    </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformDropDownList Width="120px" Runat="server" ID="ProcSite_7" TABLE="Procedures" FIELD="ProcSite" ShowEmptyListItem="true"  RecordId="7" TabIndex="4">           	        
           	        <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Eyes and Orbit" Text="Eyes and Orbit" />
                    <asp:ListItem Value="Hypopharynx" Text="Hypopharynx" />
                    <asp:ListItem Value="Larynx" Text="Larynx" />
                    <asp:ListItem Value="Lips" Text="Lips" />
                    <asp:ListItem Value="Nasal Cavity" Text="Nasal Cavity" />
                    <asp:ListItem Value="Nasopharynx" Text="Nasopharynx" />
                    <asp:ListItem Value="Neck" Text="Neck" />
                    <asp:ListItem Value="Oral Cavity" Text="Oral Cavity" /> 
                    <asp:ListItem Value="Oropharynx" Text="Oropharynx" />                              
                    <asp:ListItem Value="Paranasal Sinus" Text="Paranasal Sinus" />    
                    <asp:ListItem Value="Parathyroid" Text="Parathyroid" />
                    <asp:ListItem Value="Parotid" Text="Parotid" />
                    <asp:ListItem Value="Scalp and Skin" Text="Scalp and Skin" />
                    <asp:ListItem Value="Skull Base" Text="Skull Base" />
                    <asp:ListItem Value="Sublingual" Text="Sublingual" />
                    <asp:ListItem Value="Submandibular" Text="Submandibular" />
                    <asp:ListItem Value="Thyroid" Text="Thyroid" />     
                    <asp:ListItem Value="Trachea" Text="Trachea" />      
                    <asp:ListItem Value="Other" Text="Other" />
                </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformComboBox DropDownWidth="150px" Width="100px" Runat="server" ID="ProcSubsite_7" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_7" CascadeFormatString="HeadNeckSite"  RecordId="7" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" Field="ProcName" RecordId="7" Table="Procedures" MaxLength="50" id="ProcName_7" CascadeValuesBasedOn="$ProcSite_7" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
            </td>
            <td>
                <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px"  Width="150px" Runat="server" RecordId="7" LookupCode="HeadNeckApproach"
                    ID="ProcApproach_7" TABLE="Procedures" FIELD="ProcApproach" ShowOther="true" TabIndex="7">                    
                </euc:EformCheckBoxList>
            </td>          

            <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
         </tr>

         <tr style="display: none;">
            <td>
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_8" />

                <euc:EformDropDownList Width="80px" Runat="server" ID="ProcSide_8" TABLE="Procedures" FIELD="ProcSide" ShowEmptyListItem="true"  RecordId="8" TabIndex="3">
           	        <asp:ListItem></asp:ListItem>
           	        <asp:ListItem Value="Left" Text="Left" />
           	        <asp:ListItem Value="Right" Text="Right" />
                    <asp:ListItem Value="Bilateral" Text="Bilateral" />
                    <asp:ListItem Value="Midline" Text="Midline" />
           	    </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformDropDownList Width="120px" Runat="server" ID="ProcSite_8" TABLE="Procedures" FIELD="ProcSite" ShowEmptyListItem="true"  RecordId="8" TabIndex="4">           	      
           	        <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Eyes and Orbit" Text="Eyes and Orbit" />
                    <asp:ListItem Value="Hypopharynx" Text="Hypopharynx" />
                    <asp:ListItem Value="Larynx" Text="Larynx" />
                    <asp:ListItem Value="Lips" Text="Lips" />
                    <asp:ListItem Value="Nasal Cavity" Text="Nasal Cavity" />
                    <asp:ListItem Value="Nasopharynx" Text="Nasopharynx" />
                    <asp:ListItem Value="Neck" Text="Neck" />
                    <asp:ListItem Value="Oral Cavity" Text="Oral Cavity" /> 
                    <asp:ListItem Value="Oropharynx" Text="Oropharynx" />                              
                    <asp:ListItem Value="Paranasal Sinus" Text="Paranasal Sinus" />    
                    <asp:ListItem Value="Parathyroid" Text="Parathyroid" />
                    <asp:ListItem Value="Parotid" Text="Parotid" />
                    <asp:ListItem Value="Scalp and Skin" Text="Scalp and Skin" />
                    <asp:ListItem Value="Skull Base" Text="Skull Base" />
                    <asp:ListItem Value="Sublingual" Text="Sublingual" />
                    <asp:ListItem Value="Submandibular" Text="Submandibular" />
                    <asp:ListItem Value="Thyroid" Text="Thyroid" />     
                    <asp:ListItem Value="Trachea" Text="Trachea" />      
                    <asp:ListItem Value="Other" Text="Other" />
                </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformComboBox DropDownWidth="150px" Width="100px" Runat="server" ID="ProcSubsite_8" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_8" CascadeFormatString="HeadNeckSite"  RecordId="8" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" Field="ProcName" RecordId="8" Table="Procedures" MaxLength="50" id="ProcName_8" CascadeValuesBasedOn="$ProcSite_8" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
            </td>
            <td>
                <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px"  Width="150px" Runat="server" RecordId="8" LookupCode="HeadNeckApproach"
                    ID="ProcApproach_8" TABLE="Procedures" FIELD="ProcApproach" ShowOther="true" TabIndex="7">                    
                </euc:EformCheckBoxList>
            </td>          

            <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
         </tr>            
         <tr style="display: none;">
            <td>
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_9" />

                <euc:EformDropDownList Width="80px" Runat="server" ID="ProcSide_9" TABLE="Procedures" FIELD="ProcSide" ShowEmptyListItem="true"  RecordId="9" TabIndex="3">
           	        <asp:ListItem></asp:ListItem>
           	        <asp:ListItem Value="Left" Text="Left" />
           	        <asp:ListItem Value="Right" Text="Right" />
                    <asp:ListItem Value="Bilateral" Text="Bilateral" />
                    <asp:ListItem Value="Midline" Text="Midline" />
           	    </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformDropDownList Width="120px" Runat="server" ID="ProcSite_9" TABLE="Procedures" FIELD="ProcSite" ShowEmptyListItem="true"  RecordId="9" TabIndex="4">           	      
           	        <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Eyes and Orbit" Text="Eyes and Orbit" />
                    <asp:ListItem Value="Hypopharynx" Text="Hypopharynx" />
                    <asp:ListItem Value="Larynx" Text="Larynx" />
                    <asp:ListItem Value="Lips" Text="Lips" />
                    <asp:ListItem Value="Nasal Cavity" Text="Nasal Cavity" />
                    <asp:ListItem Value="Nasopharynx" Text="Nasopharynx" />
                    <asp:ListItem Value="Neck" Text="Neck" />
                    <asp:ListItem Value="Oral Cavity" Text="Oral Cavity" /> 
                    <asp:ListItem Value="Oropharynx" Text="Oropharynx" />                              
                    <asp:ListItem Value="Paranasal Sinus" Text="Paranasal Sinus" />    
                    <asp:ListItem Value="Parathyroid" Text="Parathyroid" />
                    <asp:ListItem Value="Parotid" Text="Parotid" />
                    <asp:ListItem Value="Scalp and Skin" Text="Scalp and Skin" />
                    <asp:ListItem Value="Skull Base" Text="Skull Base" />
                    <asp:ListItem Value="Sublingual" Text="Sublingual" />
                    <asp:ListItem Value="Submandibular" Text="Submandibular" />
                    <asp:ListItem Value="Thyroid" Text="Thyroid" />     
                    <asp:ListItem Value="Trachea" Text="Trachea" />      
                    <asp:ListItem Value="Other" Text="Other" />
                </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformComboBox DropDownWidth="150px" Width="100px" Runat="server" ID="ProcSubsite_9" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_9" CascadeFormatString="HeadNeckSite" RecordId="9" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" Field="ProcName" RecordId="9" Table="Procedures" MaxLength="50" id="ProcName_9" CascadeValuesBasedOn="$ProcSite_9" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
            </td>
            <td>
                <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px"  Width="150px" Runat="server" RecordId="9" LookupCode="HeadNeckApproach"
                    ID="ProcApproach_9" TABLE="Procedures" FIELD="ProcApproach" ShowOther="true" TabIndex="7">                    
                </euc:EformCheckBoxList>
            </td>          

            <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
         </tr>
         <tr style="display: none;">
            <td>
                <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_10" />

                <euc:EformDropDownList Width="80px" Runat="server" ID="ProcSide_10" TABLE="Procedures" FIELD="ProcSide" ShowEmptyListItem="true"  RecordId="10" TabIndex="3">
           	        <asp:ListItem></asp:ListItem>
           	        <asp:ListItem Value="Left" Text="Left" />
           	        <asp:ListItem Value="Right" Text="Right" />
                    <asp:ListItem Value="Bilateral" Text="Bilateral" />
                    <asp:ListItem Value="Midline" Text="Midline" />
           	    </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformDropDownList Width="120px" Runat="server" ID="ProcSite_10" TABLE="Procedures" FIELD="ProcSite" ShowEmptyListItem="true"  RecordId="10" TabIndex="4">           	        
           	        <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Eyes and Orbit" Text="Eyes and Orbit" />
                    <asp:ListItem Value="Hypopharynx" Text="Hypopharynx" />
                    <asp:ListItem Value="Larynx" Text="Larynx" />
                    <asp:ListItem Value="Lips" Text="Lips" />
                    <asp:ListItem Value="Nasal Cavity" Text="Nasal Cavity" />
                    <asp:ListItem Value="Nasopharynx" Text="Nasopharynx" />
                    <asp:ListItem Value="Neck" Text="Neck" />
                    <asp:ListItem Value="Oral Cavity" Text="Oral Cavity" /> 
                    <asp:ListItem Value="Oropharynx" Text="Oropharynx" />                              
                    <asp:ListItem Value="Paranasal Sinus" Text="Paranasal Sinus" />    
                    <asp:ListItem Value="Parathyroid" Text="Parathyroid" />
                    <asp:ListItem Value="Parotid" Text="Parotid" />
                    <asp:ListItem Value="Scalp and Skin" Text="Scalp and Skin" />
                    <asp:ListItem Value="Skull Base" Text="Skull Base" />
                    <asp:ListItem Value="Sublingual" Text="Sublingual" />
                    <asp:ListItem Value="Submandibular" Text="Submandibular" />
                    <asp:ListItem Value="Thyroid" Text="Thyroid" />     
                    <asp:ListItem Value="Trachea" Text="Trachea" />      
                    <asp:ListItem Value="Other" Text="Other" />
                </euc:EformDropDownList>
            </td>
            <td>
                <euc:EformComboBox DropDownWidth="150px" Width="100px" Runat="server" ID="ProcSubsite_10" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_10" CascadeFormatString="HeadNeckSite"  RecordId="10" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" Field="ProcName" RecordId="10" Table="Procedures" MaxLength="50" id="ProcName_10" CascadeValuesBasedOn="$ProcSite_10" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
            </td>
            <td>
                <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px"  Width="150px" Runat="server" RecordId="10" LookupCode="HeadNeckApproach"
                    ID="ProcApproach_10" TABLE="Procedures" FIELD="ProcApproach" ShowOther="true" TabIndex="7">                    
                </euc:EformCheckBoxList>
            </td>          
              
            <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>
          </tr>
    </table>
    <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRowLocal(this,'ProceduresAcnillaryHtmlTable');" />
    <br /><br />
</div>

<br /><br />

<script type="text/javascript">

    addEvents($('<%= AncillaryProcedureRecorded.ClientID %>'), $('<%= AncillaryProcedureDiv.ClientID %>'), $('<%= ProcSurgeon_2.ClientID %>'), $('<%= ProcSide_2.ClientID %>'), $('<%= ProcSite_2.ClientID %>'), $('<%= ProcSubsite_2.ClientID %>'), $('<%= ProcName_2.ClientID %>'), $('<%= ProcApproach_2.ClientID %>'));
    addEvents($('<%= AncillaryProcedureRecorded.ClientID %>'), $('<%= AncillaryProcedureDiv.ClientID %>'), $('<%= ProcSurgeon_3.ClientID %>'), $('<%= ProcSide_3.ClientID %>'), $('<%= ProcSite_3.ClientID %>'), $('<%= ProcSubsite_3.ClientID %>'), $('<%= ProcName_3.ClientID %>'), $('<%= ProcApproach_3.ClientID %>'));
    addEvents($('<%= AncillaryProcedureRecorded.ClientID %>'), $('<%= AncillaryProcedureDiv.ClientID %>'), $('<%= ProcSurgeon_4.ClientID %>'), $('<%= ProcSide_4.ClientID %>'), $('<%= ProcSite_4.ClientID %>'), $('<%= ProcSubsite_4.ClientID %>'), $('<%= ProcName_4.ClientID %>'), $('<%= ProcApproach_4.ClientID %>'));
    addEvents($('<%= AncillaryProcedureRecorded.ClientID %>'), $('<%= AncillaryProcedureDiv.ClientID %>'), $('<%= ProcSurgeon_5.ClientID %>'), $('<%= ProcSide_5.ClientID %>'), $('<%= ProcSite_5.ClientID %>'), $('<%= ProcSubsite_5.ClientID %>'), $('<%= ProcName_5.ClientID %>'), $('<%= ProcApproach_5.ClientID %>'));
    addEvents($('<%= AncillaryProcedureRecorded.ClientID %>'), $('<%= AncillaryProcedureDiv.ClientID %>'), $('<%= ProcSurgeon_6.ClientID %>'), $('<%= ProcSide_6.ClientID %>'), $('<%= ProcSite_6.ClientID %>'), $('<%= ProcSubsite_6.ClientID %>'), $('<%= ProcName_6.ClientID %>'), $('<%= ProcApproach_6.ClientID %>'));
    addEvents($('<%= AncillaryProcedureRecorded.ClientID %>'), $('<%= AncillaryProcedureDiv.ClientID %>'), $('<%= ProcSurgeon_7.ClientID %>'), $('<%= ProcSide_7.ClientID %>'), $('<%= ProcSite_7.ClientID %>'), $('<%= ProcSubsite_7.ClientID %>'), $('<%= ProcName_7.ClientID %>'), $('<%= ProcApproach_7.ClientID %>'));
    addEvents($('<%= AncillaryProcedureRecorded.ClientID %>'), $('<%= AncillaryProcedureDiv.ClientID %>'), $('<%= ProcSurgeon_8.ClientID %>'), $('<%= ProcSide_8.ClientID %>'), $('<%= ProcSite_8.ClientID %>'), $('<%= ProcSubsite_8.ClientID %>'), $('<%= ProcName_8.ClientID %>'), $('<%= ProcApproach_8.ClientID %>'));
    addEvents($('<%= AncillaryProcedureRecorded.ClientID %>'), $('<%= AncillaryProcedureDiv.ClientID %>'), $('<%= ProcSurgeon_9.ClientID %>'), $('<%= ProcSide_9.ClientID %>'), $('<%= ProcSite_9.ClientID %>'), $('<%= ProcSubsite_9.ClientID %>'), $('<%= ProcName_9.ClientID %>'), $('<%= ProcApproach_9.ClientID %>'));
    addEvents($('<%= AncillaryProcedureRecorded.ClientID %>'), $('<%= AncillaryProcedureDiv.ClientID %>'), $('<%= ProcSurgeon_10.ClientID %>'), $('<%= ProcSide_10.ClientID %>'), $('<%= ProcSite_10.ClientID %>'), $('<%= ProcSubsite_10.ClientID %>'), $('<%= ProcName_10.ClientID %>'), $('<%= ProcApproach_10.ClientID %>'));

    function addEvents(AncillaryProcedureRecorded, AncillaryProcedureDiv, ProcSurgeon, ProcSide, ProcSite, ProcSubsite, ProcName, ProcApproach) {
        
        $(AncillaryProcedureRecorded).addEvent('click', curry(SetHideSection, AncillaryProcedureRecorded, AncillaryProcedureDiv, ProcSurgeon, ProcSide, ProcSite, ProcSubsite, ProcName, ProcApproach));
        $(ProcSurgeon).addEvent('blur', curry(SetHideSection, AncillaryProcedureRecorded, AncillaryProcedureDiv, ProcSurgeon, ProcSide, ProcSite, ProcSubsite, ProcName, ProcApproach));        
        $(ProcSide).addEvent('blur', curry(SetHideSection, AncillaryProcedureRecorded, AncillaryProcedureDiv, ProcSurgeon, ProcSide, ProcSite, ProcSubsite, ProcName, ProcApproach));
        $(ProcSite).addEvent('blur', curry(SetHideSection, AncillaryProcedureRecorded, AncillaryProcedureDiv, ProcSurgeon, ProcSide, ProcSite, ProcSubsite, ProcName, ProcApproach));
        $(ProcSubsite).addEvent('blur', curry(SetHideSection, AncillaryProcedureRecorded, AncillaryProcedureDiv, ProcSurgeon, ProcSide, ProcSite, ProcSubsite, ProcName, ProcApproach));
        $(ProcName).addEvent('blur', curry(SetHideSection, AncillaryProcedureRecorded, AncillaryProcedureDiv, ProcSurgeon, ProcSide, ProcSite, ProcSubsite, ProcName, ProcApproach));
        $(ProcApproach).addEvent('blur', curry(SetHideSection, AncillaryProcedureRecorded, AncillaryProcedureDiv, ProcSurgeon, ProcSide, ProcSite, ProcSubsite, ProcName, ProcApproach));


        SetHideSection(AncillaryProcedureRecorded, AncillaryProcedureDiv, ProcSurgeon, ProcSide, ProcSite, ProcSubsite, ProcName, ProcApproach);
    }

    function SetHideSection(AncillaryProcedureRecorded, AncillaryProcedureDiv, ProcSurgeon, ProcSide, ProcSite, ProcSubsite, ProcName, ProcApproach) {

        var AncillaryProcedureRecordedRef = AncillaryProcedureRecorded.getElementsByTagName('input');
        for (var i = 0; i < AncillaryProcedureRecordedRef.length; i++)
            if (AncillaryProcedureRecordedRef[i].checked) {
                if (AncillaryProcedureRecordedRef[i].value == "Yes") {
                    AncillaryProcedureDiv.style.display = 'block';

                    if (ProcName.value != '')
                        ProcSurgeon.value = '<%=Surgeon %>';
                    
                }
                else if (AncillaryProcedureRecordedRef[i].value == "No") {
                    AncillaryProcedureDiv.style.display = 'none';
                    ProcSurgeon.value = '';                    
                    ProcSide.value = '';
                    ProcSite.value = '';
                    ProcSubsite.value = '';
                    ProcName.value = '';
                    ProcApproach.value = '';
                }
            }
           
        }

        function showFirstAdditionalRowLocal(linkReference, tableId) { 
            var rowShown = false;
            var hideWidget = true;
            var table = document.getElementById(tableId);
            for (i = 0; i < table.rows.length; i++) {
                var row = table.rows[i];
                if (rowShown == false && row.style['display'] == 'none') {
                    row.style['display'] = '';
                    rowShown = true;
                    
                } else if (rowShown == true && row.style['display'] == 'none') {
                    hideWidget = false;
                }
            }

            if (hideWidget) {
                linkReference.style['display'] = 'none';
            }
            return false;
        }

</script>