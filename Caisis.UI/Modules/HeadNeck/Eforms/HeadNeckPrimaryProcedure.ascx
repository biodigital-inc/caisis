<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeadNeckPrimaryProcedure.ascx.cs" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.HeadNeckPrimaryProcedure" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
    tableArray.ProceduresAcnillaryHtmlTable = "ProceduresAcnillaryHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />

<a name="HeadNeckPrimaryProcedure" id="HeadNeckPrimaryProcedure" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Procedures"></asp:Label> 


<%--Procedures--%>
<%--Primary Procedure    onclick="populateHiddenFields();"--%>
<table id="tblProcedures"   border="0" cellspacing="1" cellpadding="3" class="ClinicalEformTable">    
    <tr>         
        <td class="controlBoxDataGridTitleColumn" style="text-align: left; width:82px"  >&nbsp;Side</td>
        <td class="controlBoxDataGridTitleColumn" style="text-align: left; width:118px" >&nbsp;Site</td>
        <td class="controlBoxDataGridTitleColumn" style="text-align: left; width:150px">&nbsp;Subsite</td>
        <td class="controlBoxDataGridTitleColumn" style="text-align: left; width:165px" >&nbsp;Procedure</td>
        <td class="controlBoxDataGridTitleColumn" style="text-align: left; width:165px">&nbsp;Approach</td>
        <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;Primary</td>
    </tr>
    <tr>
        <td colspan="6">
            <table id ="tblProcSite" onclick="SetHiddenToProcAndSubsite();">                
                <tr>
                    <td style="width:80px">
                        <euc:EformDropDownList Width="80px" Runat="server" ID="ProcSide_1" TABLE="Procedures" FIELD="ProcSide" ShowEmptyListItem="true"  RecordId="1" >           	    
           	                <asp:ListItem></asp:ListItem>
           	                <asp:ListItem Value="Left" Text="Left" />
           	                <asp:ListItem Value="Right" Text="Right" />
                            <asp:ListItem Value="Bilateral" Text="Bilateral" />
                            <asp:ListItem Value="Midline" Text="Midline" />
                        </euc:EformDropDownList></td>
                    <td style="width:120px">
                        <euc:EformDropDownList Width="120px" Runat="server" ID="ProcSite_1" TABLE="Procedures" FIELD="ProcSite" ShowEmptyListItem="true" RecordId="1">
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
           	            </euc:EformDropDownList></td>
                    <td style="width:150px" nowrap="nowrap">
                        <div id="ProcSubsiteDIV_1" runat="server">
                            <euc:EformComboBox DropDownWidth="150px" DropDownHeight="150px" Width="120px" Runat="server" ID="ProcSubsite_1" TABLE="NoTable" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_1" CascadeFormatString="HeadNeckSite" />
                        </div>
                        <div id="ProcSubsiteOtherDIV_1" runat="server" style="display: none;">
                            <euc:EformTextBox Width="145px" ID="ProcSubsiteOther_1" Runat="server" TABLE="NoTable" FIELD="ProcSubsite" MaxLength="50"/>
                        </div>
                        <euc:EformTextBox Width="1px" style="display: none;" ID="ProcSubsiteHidden_1" Runat="server" RecordId="1" TABLE="Procedures" FIELD="ProcSubsite" />
                    </td>
                    <td style="width:165px" nowrap="nowrap">
                        <table id="tblProcedure" onclick="SetHiddenToProcAndSubsite();" >
                            <tr>
                                <td><div id="ProcNameDiv_1" runat="server">
                                    <euc:EformComboBox  runat="server" LookupCode="ProcName" CascadeValuesBasedOn="$ProcSite_1" CascadeFormatString="HeadNeckSite" style="width:150px;"  id="ProcName_1" DropDownWidth="280px" DropDownHeight="150px" Table="NoTable" Field="ProcName"/>
                                    </div>
                                    <div id="ProcNameOtherDiv_1" runat="server" style="display: none;">
                                        <euc:EformTextBox Width="165px" ID="ProcNameOther_1" Runat="server" Table="NoTable" Field="ProcName" MaxLength="50" />
                                    </div>
                                    <euc:EformTextBox Width="1px" style="display: none;" ID="ProcNameHidden_1" Runat="server" RecordId="1" Table="Procedures" Field="ProcName"/>
                                </td>
                            </tr>
                        </table>
        
            
                        <euc:EformHidden id="ProcInstitution_1" runat="server" RecordId="1" Table="Procedures" Field="ProcInstitution"  />
                        <euc:EformHidden id="ProcQuality_1" runat="server" RecordId="1" Table="Procedures" Field="ProcQuality" Value="STD" />
                        <euc:EformHidden id="ProcDateText_1" Table="Procedures" Field="ProcDateText" RecordId="1" runat="server"/>
                        <euc:EformHidden id="ProcDate_1" Table="Procedures" Field="ProcDate"  RecordId="1" runat="server"/>                        
                        <euc:EformTextBox id="ProcService_1" RecordId="1" Table="Procedures" Field="ProcService" runat="server" Width="1px" Value="Head and Heck" style="display:none"/>   
                        <euc:EformHidden Runat="server" ID="ProcSurgeon_1" TABLE="Procedures" FIELD="ProcSurgeon" RecordId="1"  />
                    </td>
                    <td style="width:170px; " nowrap="nowrap">          
                        <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px" Width="150px" Runat="server" RecordId="1" LookupCode="HeadNeckApproach"
                            ID="ProcApproach_1" TABLE="Procedures" FIELD="ProcApproach" ShowOther="true">                    
                        </euc:EformCheckBoxList>
                    </td>
                    <td><euc:EformHidden ID="ProcPrimary_1" RecordId="1"  TABLE="Procedures" FIELD="ProcPrimary" Runat="server" Value="1" /> 
                        <euc:EformCheckBox Runat="server" Checked="true" Enabled="false" Table="NoTable" Field="PrimaryRecorded" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="6">

      
   <%-- Ancillary Procedures--%>
    <table border="0" id="ProceduresAcnillaryHtmlTable">        
        <tr style="display: none;">
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
            <td style="width:152px" nowrap="nowrap">
                <euc:EformComboBox DropDownWidth="150px" DropDownHeight="150px" Width="120px" Runat="server" RecordId="2" ID="ProcSubsite_2" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_2" CascadeFormatString="HeadNeckSite" TabIndex="5"/>
            </td>
            <td style="width:170px" nowrap="nowrap">               
                <euc:EformComboBox  runat="server" LookupCode="ProcName" CascadeValuesBasedOn="$ProcSite_2" CascadeFormatString="HeadNeckSite" style="width:150px;" Field="ProcName" id="ProcName_2" RecordId="2" Table="Procedures" MaxLength="50" TabIndex="6" DropDownWidth="280px" DropDownHeight="150px"/>
            </td>
            <td style="width:170px" nowrap="nowrap">                
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
                <euc:EformComboBox DropDownWidth="150px" DropDownHeight="150px" Width="120px" Runat="server" ID="ProcSubsite_3" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_3" CascadeFormatString="HeadNeckSite" RecordId="3" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" DropDownHeight="150px" Field="ProcName" RecordId="3" Table="Procedures" MaxLength="50" id="ProcName_3" CascadeValuesBasedOn="$ProcSite_3" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
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
                <euc:EformComboBox DropDownWidth="150px" DropDownHeight="150px" Width="120px" Runat="server" ID="ProcSubsite_4" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_4" CascadeFormatString="HeadNeckSite"  RecordId="4" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" DropDownHeight="150px" Field="ProcName" RecordId="4" Table="Procedures" MaxLength="50" id="ProcName_4" CascadeValuesBasedOn="$ProcSite_4" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
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
                <euc:EformComboBox DropDownWidth="150px" DropDownHeight="150px" Width="120px" Runat="server" ID="ProcSubsite_5" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_5" CascadeFormatString="HeadNeckSite"  RecordId="5" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" DropDownHeight="150px" Field="ProcName" RecordId="5" Table="Procedures" MaxLength="50" id="ProcName_5" CascadeValuesBasedOn="$ProcSite_5" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
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
                <euc:EformComboBox DropDownWidth="150px" DropDownHeight="150px" Width="120px" Runat="server" ID="ProcSubsite_6" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_6" CascadeFormatString="HeadNeckSite"  RecordId="6" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" DropDownHeight="150px" Field="ProcName" RecordId="6" Table="Procedures" MaxLength="50" id="ProcName_6" CascadeValuesBasedOn="$ProcSite_6" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
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
                <euc:EformComboBox DropDownWidth="150px" DropDownHeight="150px" Width="120px" Runat="server" ID="ProcSubsite_7" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_7" CascadeFormatString="HeadNeckSite"  RecordId="7" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" DropDownHeight="150px" Field="ProcName" RecordId="7" Table="Procedures" MaxLength="50" id="ProcName_7" CascadeValuesBasedOn="$ProcSite_7" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
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
                <euc:EformComboBox DropDownWidth="150px" DropDownHeight="150px" Width="120px" Runat="server" ID="ProcSubsite_8" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_8" CascadeFormatString="HeadNeckSite"  RecordId="8" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" DropDownHeight="150px" Field="ProcName" RecordId="8" Table="Procedures" MaxLength="50" id="ProcName_8" CascadeValuesBasedOn="$ProcSite_8" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
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
                <euc:EformComboBox DropDownWidth="150px" DropDownHeight="150px" Width="120px" Runat="server" ID="ProcSubsite_9" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_9" CascadeFormatString="HeadNeckSite" RecordId="9" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" DropDownHeight="150px" Field="ProcName" RecordId="9" Table="Procedures" MaxLength="50" id="ProcName_9" CascadeValuesBasedOn="$ProcSite_9" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
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
                <euc:EformComboBox DropDownWidth="150px" DropDownHeight="150px" Width="120px" Runat="server" ID="ProcSubsite_10" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="HeadNeckSubSite" CascadeValuesBasedOn="$ProcSite_10" CascadeFormatString="HeadNeckSite"  RecordId="10" TabIndex="5"/>
            </td>
            <td>                
                <euc:EformComboBox  runat="server" LookupCode="ProcName" style="width:150px;" DropDownWidth="280px" DropDownHeight="150px" Field="ProcName" RecordId="10" Table="Procedures" MaxLength="50" id="ProcName_10" CascadeValuesBasedOn="$ProcSite_10" CascadeFormatString="HeadNeckSite" TabIndex="6"/>
            </td>
            <td>
                <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px"  Width="150px" Runat="server" RecordId="10" LookupCode="HeadNeckApproach"
                    ID="ProcApproach_10" TABLE="Procedures" FIELD="ProcApproach" ShowOther="true" TabIndex="7">                    
                </euc:EformCheckBoxList>
            </td>          
              
            <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>
        </tr>
    </table>
    </td>
    </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresAcnillaryHtmlTable');" />
     
    <br /><br />
    <br />
    <%--Surgical Margin--%>
    <table width="200"  cellspacing="0" class="eformLargePopulatedTableBlue" id="tblSurgicalMargin" onclick="SetHideSurgicalMargin();">
        <tr>
            <td style="white-space: nowrap;">
                <span class="controlBoxTitle"><asp:Label ID="Label2" runat="server" CssClass="controlBoxTitle" Text="Surgical Margins"></asp:Label> ?</span></td>
            <td height="28">
                <euc:EformRadioButtonList ID="SurgicalMarginRecorded" runat="server" RepeatLayout="Table"
                    RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="SurgicalMarginRecorded">
                    <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                    <asp:ListItem Value="No" Text="No"></asp:ListItem>
                </euc:EformRadioButtonList>
            </td>
        </tr>
    </table>
    <br />
    <div id="SurgicalMarginDiv" runat="server"  style="display: none; width:600px" class="eformLargePopulatedTable"> 
        <table cellspacing="0" cellpadding="16" width="600px" onclick="SetSurgicalMargin();">            
            <tr>                    
                <td height="28">
                    Primary Dimension of Margin: 
                    <euc:EformTextBox Width="50px" RecordId="3" ParentRecordId="1"  TABLE="ProcedureFinding" FIELD="ProcFindPrimaryDimension" ID="ProcFindPrimaryDimension_3" Runat="server"/>
                    
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="1"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_3" Runat="server" />
			        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="1"  TABLE="ProcedureFinding" FIELD="ProcFindSite"  ID="ProcFindSite_3"  Runat="server"/>
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="1"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_3" Runat="server" />
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="1"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"  ID="ProcFindDissection_3"  Runat="server"/>
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="1"  TABLE="ProcedureFinding" FIELD="ProcFinding"  ID="ProcFinding_3_Text"  Runat="server"/>
                   
                </td>
            </tr>
            <tr><td valign="top" style="width:200px">Comments:<euc:EformTextArea TextMode="MultiLine" TABLE="ProcedureFinding" RecordId="3" ParentRecordId="1" FIELD="ProcFindNotes" Rows="12" style="width: 550px;" Runat="server" ID="ProcFindNotes_3" onblur="SetSurgicalMargin();"/></td></tr>            
        </table>
       
    </div><br />
    <%--Frozen Section--%>
    <table width="200"  cellspacing="0" class="eformLargePopulatedTableBlue" id="tblFrozenSection" onclick="SetHideFrozenSection();">
        <tr>
            <td style="white-space: nowrap;">
                <span class="controlBoxTitle"><asp:Label ID="Label3" runat="server" CssClass="controlBoxTitle" Text="Frozen Section"></asp:Label> ?</span></td>
            <td height="28">
                <euc:EformRadioButtonList ID="FrozenSectionRecorded" runat="server" RepeatLayout="Table"
                    RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="FrozenSectionRecorded">
                    <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                    <asp:ListItem Value="No" Text="No"></asp:ListItem>
                </euc:EformRadioButtonList>
            </td>
        </tr>
    </table>
    <br />
    <div id="FrozenSectionDiv" runat="server"  style="display: none; width:600px" class="eformLargePopulatedTable">
        <table cellspacing="0" cellpadding="16" width ="600px" onclick="SetSurgicalMargin();"><tr>
            <td  height="28">
            Frozen Section:
            <euc:EformDropDownList Width="130px" RecordId="3" ParentRecordId="1"  TABLE="ProcedureFinding" FIELD="ProcFindFrozen" ID="ProcFindFrozen_3" Runat="server" ShowEmptyListItem="true">
                <asp:ListItem Value="" Text="" />
                <asp:ListItem Value="Atypical" Text="Atypical" />
                <asp:ListItem Value="Negative" Text="Negative" />
                <asp:ListItem Value="Positive" Text="Positive" />
                <asp:ListItem Value="Carcinoma In Situ" Text="Carcinoma In Situ" />
                <asp:ListItem Value="Dysplasia" Text="Dysplasia" />
                <asp:ListItem Value="Not Done" Text="Not Done" />
            </euc:EformDropDownList></td></tr></table>
    </div>
    <br />

    <%--Additional Structures Removed--%>
<table>
    <tr>
        <td colspan="2" >
            <table>
            <tr><td>
                <div id="AdditionalStructuresDIV_1" runat="server" class="eformLargePopulatedTable" style= "width:600px; height:70px">
                    <br />&nbsp;&nbsp;
                    <strong>Additional Structures Removed</strong>&nbsp;&nbsp;
                    <!-- Additional Structures Removed: RecordId = 1; 4-30 -->
                    <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="250px"  Width="270px" Runat="server" LookupCode="HeadNeckInvasionSite" CascadeValuesBasedOn="$ProcSite_1" CascadeFormatString="HeadNeckSite"
                        ID="ProcFindSubsite_1" Table="NoTable" Field="ProcFindSubsiteRecorded" ShowOther="true"  RepeatLayout="Table">                    
                    </euc:EformCheckBoxList>
                    
                </div>
                <div id="AdditionalStructuresNeckDIV_1" runat="server" style="display: none;">
                    <table border="0" cellspacing="1" cellpadding="3" class="ClinicalEformTable" id="tblNeckDissection" >
                        <tr>
                            <td align="center" colspan="1" class="eformLargePopulatedTableBlue"></td>
                            <td align="center" colspan="1" class="eformLargePopulatedTableBlue"><span class="controlBoxTitle">Levels Dissected</span></td>
                            <td align="center" colspan="4" class="eformLargePopulatedTable"><span class="controlBoxTitle">Additional Structures Removed</span></td>
                        </tr>
                        <tr>
                            <td style="text-align: left; white-space: nowrap;"  >Right Levels </td>        
                            <td valign="middle" style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
                                <euc:EformExtendedCheckBoxList style="white-space: nowrap;" Table="NoTable" Field="LevelsDissRightPrimary" ID="LevelsDissRight_1" runat="server" RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="1" Text="1" />
                                    <asp:ListItem Value="2" Text="2" />
                                    <asp:ListItem Value="3" Text="3" />
                                    <asp:ListItem Value="4" Text="4" />
                                    <asp:ListItem Value="5" Text="5" />
                                    <asp:ListItem Value="6" Text="6" />
                                    <asp:ListItem Value="7" Text="7" />                           
                                </euc:EformExtendedCheckBoxList>
                            </td>                            
                            <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
                                <table class="CheckBoxListLayer">
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ProcFinding_1" value="Accessory Nerve" runat="server"/> 
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" AssociatedControlID="ProcFinding_1">Accessory Nerve</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ProcFinding_2" value="Sternomastoid" runat="server"/>                          
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" AssociatedControlID="ProcFinding_2">Sternomastoid</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ProcFinding_3" value="Internal Jugular Vein" runat="server"/>                            
                                        </td>
                                        <td>
                                             <asp:Label ID="Label6" runat="server" AssociatedControlID="ProcFinding_3">Internal Jugular Vein</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" AssociatedControlID="ProcFinding_4" CssClass="boldText">Other:&nbsp;</asp:Label>
                                        </td>
                                        <td>
                                            <input type="text" id="ProcFinding_4" runat="server"/>                            
                                        </td>
                                    </tr>
                                </table>
                            </td>
                         </tr>
                        <tr>
                            <td style="text-align: left; white-space: nowrap;"  >Left Levels </td>       
                            <td valign="middle" style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
                                <euc:EformExtendedCheckBoxList style="white-space: nowrap;" Table="NoTable" Field="LevelsDissLeftPrimary" ID="LevelsDissLeft_1" runat="server" RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                    <asp:ListItem Value="1" Text="1" />
                                    <asp:ListItem Value="2" Text="2" />
                                    <asp:ListItem Value="3" Text="3" />
                                    <asp:ListItem Value="4" Text="4" />
                                    <asp:ListItem Value="5" Text="5" />
                                    <asp:ListItem Value="6" Text="6" />
                                    <asp:ListItem Value="7" Text="7" />                             
                                </euc:EformExtendedCheckBoxList>          
                            </td>                            
                            <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable">
                                <table class="CheckBoxListLayer">
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ProcFinding_5" value="Accessory Nerve" runat="server"/>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" AssociatedControlID="ProcFinding_5">Accessory Nerve</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ProcFinding_6" value="Sternomastoid" runat="server"/>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" AssociatedControlID="ProcFinding_6">Sternomastoid</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" id="ProcFinding_7" value="Internal Jugular Vein" runat="server"/>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" AssociatedControlID="ProcFinding_7">Internal Jugular Vein</asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label10" runat="server" AssociatedControlID="ProcFinding_8" CssClass="boldText">
                                            Other:&nbsp;</asp:Label>
                                        </td>
                                        <td>
                                            <input type="text" id="ProcFinding_8" runat="server"   />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                </div>
             </td></tr>
            </table>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="1" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_1_Text" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_1_Text" runat="server" RecordId="1" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_1" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_1" Runat="server"/><br /><br />

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_4" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_4_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_4" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="4" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_4" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_5" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_5_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_5" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="5" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_5" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="6" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_6" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="6" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_6_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="6" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_6" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="6" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_6" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="7" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_7" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="7" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_7_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="7" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_7" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="7" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_7" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="8" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_8" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="8" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_8_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="8" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_8" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="8" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_8" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="9" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_9" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="9" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_9_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="9" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_9" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="9" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_9" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="10" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_10" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="10" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_10_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="10" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_10" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="10" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_10" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="11" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_11" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="11" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_11_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="11" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_11" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="11" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_11" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="12" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_12" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="12" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_12_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="12" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_12" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="12" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_12" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="13" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_13" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="13" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_13_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="13" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_13" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="13" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_13" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="14" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_14" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="14" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_14_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="14" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_14" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="14" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_14" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="15" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_15" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="15" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_15_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="15" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_15" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="15" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_15" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="16" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_16" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="16" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_16_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="16" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_16" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="16" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_16" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="17" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_17" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="17" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_17_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="17" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_17" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="17" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_17" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="18" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_18" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="18" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_18_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="18" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_18" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="18" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_18" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="19" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_19" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="19" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_19_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="19" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_19" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="19" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_19" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="20" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_20" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="20" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_20_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="20" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_20" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="20" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_20" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="21" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_21" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="21" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_21_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="21" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_21" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="21" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_21" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="22" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_22" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="22" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_22_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="22" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_22" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="22" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_22" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="23" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_23" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="23" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_23_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="23" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_23" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="23" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_23" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="24" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_24" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="24" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_24_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="24" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_24" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="24" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_24" Runat="server"/>
            
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="25" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_25" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="25" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_25_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="25" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_25" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="25" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_25" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="26" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_26" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="26" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_26_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="26" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_26" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="26" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_26" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="27" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_27" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="27" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_27_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="27" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_27" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="27" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_27" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="28" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_28" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="28" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_28_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="28" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_28" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="28" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_28" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="29" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_29" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="29" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_29_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="29" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_29" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="29" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_29" Runat="server"/>

            <euc:EformTextBox Width="1px" style="display: none;" RecordId="30" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_30" runat="server" />
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="30" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" ID="ProcFinding_30_Text"  runat="server" />             
            <euc:EformTextBox Width="1px" style="display: none;" RecordId="30" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_30" Runat="server" />
			<euc:EformTextBox Width="1px" style="display: none;" RecordId="30" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_30" Runat="server"/>
        </td>
    </tr>
       
</table>


<%--Additional Management: Nerve Graft--%>
<div id="AdditionalManageDiv" runat="server" style="display: none;">
    
    <asp:Label ID="Label_1" runat="server" CssClass="controlBoxTitle" Text="Additional Management"></asp:Label>
</div>
<div id="NerveGraftDiv" runat="server" style="display: none; width:600px"  class="eformLargePopulatedTable" >
    <table border="0" cellspacing="0" cellpadding="16" width="600px"  id="tblNerve" onclick="SetHideNerveGraftNotes();">        
        <tr >	    
            <td style="width:120px" >
                <strong>Nerve Graft</strong></td>
            <td >
                <euc:EformRadioButtonList ID="ProcFinding_2_Text" runat="server" RecordId="2" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" 
                    RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15" >
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </euc:EformRadioButtonList>
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_2" Runat="server" />
			    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_2" Runat="server"/>
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_2" Runat="server" />
                   
            </td>
        </tr>            
        
    </table>
    <div id="NerveGraftNotesDiv" runat="server" style="display: none;">
        <table border="0" cellspacing="0" cellpadding="16" width="600" >
            <tr>
                <td  style="padding-bottom:0px;padding-top:0px"><strong>Notes</strong>&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td >
                <euc:EformTextArea TextMode="MultiLine" TABLE="ProcedureFinding" RecordId="2" ParentRecordId="1" FIELD="ProcFindNotes" Rows="12" style="width: 550px;" Runat="server" ID="ProcFindNotes_2"/></td>
            </tr>
        </table>
    </div>
</div>
<br />
<%--Nerve Monitor--%>
<div id="NerveMonitorDiv" runat="server" style="display: none; width:600px" class="eformLargePopulatedTable">
    <table border="0" cellspacing="0" cellpadding="16" width="600px"  id="tblNerveMonitor" onclick="SetHideNerveMonitorNotes();">        
        <tr >	    
            <td style="width:120px" >
                <strong>Nerve Monitor</strong></td>
            <td >
                <euc:EformRadioButtonList ID="ProcFinding_40_Text" runat="server" RecordId="40" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFinding" 
                    RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15" >
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </euc:EformRadioButtonList>
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="40" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_40" Runat="server" />
			    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="40" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSite" ID="ProcFindSite_40" Runat="server"/>
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="40" ParentRecordId="1" TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_40" Runat="server" />
                   
            </td>
        </tr>
    </table>

    <div id="NerveMonitorNotesDiv" runat="server" style="display: none;" width="600px">
        <table border="0" cellspacing="0" cellpadding="16" width="600px" >
            <tr>
                <td  style="padding-bottom:0px;padding-top:0px"><strong>Notes</strong>&nbsp;&nbsp;</td>
            </tr>
            <tr>
                <td >
                <euc:EformTextArea TextMode="MultiLine" TABLE="ProcedureFinding" RecordId="40" ParentRecordId="1" FIELD="ProcFindNotes" Rows="12" style="width: 550px;" Runat="server" ID="ProcFindNotes_40"/></td>
            </tr>
        </table>
    </div>
</div>




<script type="text/javascript">
    addEvents($('<%= ProcSide_1.ClientID %>'), $('<%= ProcSite_1.ClientID %>'), $('<%= ProcSubsite_1.ClientID %>'), $('<%= ProcName_1.ClientID %>'), $('<%= ProcFinding_1_Text.ClientID %>'), $('<%= ProcFindSide_1.ClientID %>'), $('<%= ProcFindSite_1.ClientID %>'), $('<%= ProcFindSubsite_1.ClientID %>'), 'Additional Structures Removed', $('<%= ProcFindPrimaryDimension_3.ClientID %>'), $('<%= ProcSubsiteOther_1.ClientID %>'), $('<%= ProcNameOther_1.ClientID %>'), $('<%= LevelsDissRight_1.ClientID %>'), $('<%= LevelsDissLeft_1.ClientID %>'), $('<%= ProcFinding_1.ClientID %>'), $('<%= ProcFinding_5.ClientID %>'));
    addEvents($('<%= ProcSide_1.ClientID %>'), $('<%= ProcSite_1.ClientID %>'), $('<%= ProcSubsite_1.ClientID %>'), $('<%= ProcName_1.ClientID %>'), $('<%= ProcFinding_2_Text.ClientID %>'), $('<%= ProcFindSide_2.ClientID %>'), $('<%= ProcFindSite_2.ClientID %>'), $('<%= ProcFindSubsite_2.ClientID %>'), 'Nerve Graft', $('<%= ProcFindPrimaryDimension_3.ClientID %>'), $('<%= ProcSubsiteOther_1.ClientID %>'), $('<%= ProcNameOther_1.ClientID %>'), $('<%= LevelsDissRight_1.ClientID %>'), $('<%= LevelsDissLeft_1.ClientID %>'), $('<%= ProcFinding_1.ClientID %>'), $('<%= ProcFinding_5.ClientID %>'));
    addEvents($('<%= ProcSide_1.ClientID %>'), $('<%= ProcSite_1.ClientID %>'), $('<%= ProcSubsite_1.ClientID %>'), $('<%= ProcName_1.ClientID %>'), $('<%= ProcFinding_3_Text.ClientID %>'), $('<%= ProcFindSide_3.ClientID %>'), $('<%= ProcFindSite_3.ClientID %>'), $('<%= ProcFindSubsite_3.ClientID %>'), 'Margin Details', $('<%= ProcFindPrimaryDimension_3.ClientID %>'), $('<%= ProcSubsiteOther_1.ClientID %>'), $('<%= ProcNameOther_1.ClientID %>'), $('<%= LevelsDissRight_1.ClientID %>'), $('<%= LevelsDissLeft_1.ClientID %>'), $('<%= ProcFinding_1.ClientID %>'), $('<%= ProcFinding_5.ClientID %>'));

    addEvents($('<%= ProcSide_1.ClientID %>'), $('<%= ProcSite_1.ClientID %>'), $('<%= ProcSubsite_1.ClientID %>'), $('<%= ProcName_1.ClientID %>'), $('<%= ProcFinding_4_Text.ClientID %>'), $('<%= ProcFindSide_4.ClientID %>'), $('<%= ProcFindSite_4.ClientID %>'), $('<%= ProcFindSubsite_4.ClientID %>'), 'Neck Dissection', $('<%= ProcFindPrimaryDimension_3.ClientID %>'), $('<%= ProcSubsiteOther_1.ClientID %>'), $('<%= ProcNameOther_1.ClientID %>'), $('<%= LevelsDissRight_1.ClientID %>'), $('<%= LevelsDissLeft_1.ClientID %>'), $('<%= ProcFinding_1.ClientID %>'), $('<%= ProcFinding_5.ClientID %>'));
    addEvents($('<%= ProcSide_1.ClientID %>'), $('<%= ProcSite_1.ClientID %>'), $('<%= ProcSubsite_1.ClientID %>'), $('<%= ProcName_1.ClientID %>'), $('<%= ProcFinding_5_Text.ClientID %>'), $('<%= ProcFindSide_5.ClientID %>'), $('<%= ProcFindSite_5.ClientID %>'), $('<%= ProcFindSubsite_5.ClientID %>'), 'Neck Dissection', $('<%= ProcFindPrimaryDimension_3.ClientID %>'), $('<%= ProcSubsiteOther_1.ClientID %>'), $('<%= ProcNameOther_1.ClientID %>'), $('<%= LevelsDissRight_1.ClientID %>'), $('<%= LevelsDissLeft_1.ClientID %>'), $('<%= ProcFinding_2.ClientID %>'), $('<%= ProcFinding_6.ClientID %>'));
    addEvents($('<%= ProcSide_1.ClientID %>'), $('<%= ProcSite_1.ClientID %>'), $('<%= ProcSubsite_1.ClientID %>'), $('<%= ProcName_1.ClientID %>'), $('<%= ProcFinding_6_Text.ClientID %>'), $('<%= ProcFindSide_6.ClientID %>'), $('<%= ProcFindSite_6.ClientID %>'), $('<%= ProcFindSubsite_6.ClientID %>'), 'Neck Dissection', $('<%= ProcFindPrimaryDimension_3.ClientID %>'), $('<%= ProcSubsiteOther_1.ClientID %>'), $('<%= ProcNameOther_1.ClientID %>'), $('<%= LevelsDissRight_1.ClientID %>'), $('<%= LevelsDissLeft_1.ClientID %>'), $('<%= ProcFinding_3.ClientID %>'), $('<%= ProcFinding_7.ClientID %>'));
    addEvents($('<%= ProcSide_1.ClientID %>'), $('<%= ProcSite_1.ClientID %>'), $('<%= ProcSubsite_1.ClientID %>'), $('<%= ProcName_1.ClientID %>'), $('<%= ProcFinding_7_Text.ClientID %>'), $('<%= ProcFindSide_7.ClientID %>'), $('<%= ProcFindSite_7.ClientID %>'), $('<%= ProcFindSubsite_7.ClientID %>'), 'Neck Dissection', $('<%= ProcFindPrimaryDimension_3.ClientID %>'), $('<%= ProcSubsiteOther_1.ClientID %>'), $('<%= ProcNameOther_1.ClientID %>'), $('<%= LevelsDissRight_1.ClientID %>'), $('<%= LevelsDissLeft_1.ClientID %>'), $('<%= ProcFinding_4.ClientID %>'), $('<%= ProcFinding_8.ClientID %>'));
    //Nerve Monitor
    addEvents($('<%= ProcSide_1.ClientID %>'), $('<%= ProcSite_1.ClientID %>'), $('<%= ProcSubsite_1.ClientID %>'), $('<%= ProcName_1.ClientID %>'), $('<%= ProcFinding_40_Text.ClientID %>'), $('<%= ProcFindSide_40.ClientID %>'), $('<%= ProcFindSite_40.ClientID %>'), $('<%= ProcFindSubsite_40.ClientID %>'), 'Nerve Monitor', $('<%= ProcFindPrimaryDimension_3.ClientID %>'), $('<%= ProcSubsiteOther_1.ClientID %>'), $('<%= ProcNameOther_1.ClientID %>'), $('<%= LevelsDissRight_1.ClientID %>'), $('<%= LevelsDissLeft_1.ClientID %>'), $('<%= ProcFinding_1.ClientID %>'), $('<%= ProcFinding_5.ClientID %>'));

    function addEvents(ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft) {
        $(ProcSide).addEvent('blur', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
        $(ProcSite).addEvent('click', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
        $(ProcSubsite).addEvent('click', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
        $(ProcFindSubsite).addEvent('click', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
        $(findingPrimDim).addEvent('blur', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
        $(ProcName).addEvent('mousedown', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
        $(ProcNameOther).addEvent('blur', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
        $(ProcSubsiteOther).addEvent('blur', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
        
        if (findingValue == 'Additional Structures Removed') {
            var obj = ProcFindSubsite.getElementsByTagName('input');
            
            for (var i = 0; i < obj.length; i++) {
                var objRef = obj[i];

                if (objRef.type == 'checkbox')
                    $(objRef).addEvent('click', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
                else if (objRef.type == 'text')
                    $(objRef).addEvent('blur', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
            }
        }
        else if (findingValue == 'Nerve Graft' || findingValue == 'Nerve Monitor') {
            var rbl = ProcFinding.getElementsByTagName('input');
            for (var i = 0; i < rbl.length; i++) {
                var rblRef = rbl[i];
                if (rblRef.type == 'radio')
                    $(rblRef).addEvent('click', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
            }
        }
        else if (findingValue == 'Neck Dissection') {            
            //Neck Dissection Finding
            if (procFindCBRight.type == 'checkbox')
                $(procFindCBRight).addEvent('click', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
            else if (procFindCBRight.type = 'text')
                $(procFindCBRight).addEvent('blur', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));

            if (procFindCBLeft.type == 'checkbox')
                $(procFindCBLeft).addEvent('click', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
            else if (procFindCBLeft.type = 'text')
                $(procFindCBLeft).addEvent('blur', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));


            //Level Dissection
            var cbl = levelsRightCBL.getElementsByTagName('input');
            for (var j = 0; j < cbl.length; j++) {
                var cblRef = cbl[j];
                if (cblRef.type == 'checkbox')
                    $(cblRef).addEvent('click', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
                else if (cblRef.type == 'text')
                    $(cblRef).addEvent('blur', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
            }

            var cbl2 = levelsLeftCBL.getElementsByTagName('input');
            for (var j = 0; j < cbl2.length; j++) {
                var cblRef2 = cbl2[j];
                if (cblRef2.type == 'checkbox')
                    $(cblRef2).addEvent('click', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
                else if (cblRef2.type == 'text')
                    $(cblRef2).addEvent('blur', curry(SetHiddenFields, ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft));
            }
        }
        //=========================================


        ShowOnLoad(ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft);
        
        
    }


    function ShowOnLoad(ProcSide, site, subsite, procname, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft) {
        //subsite 
        var subsiteDiv = document.getElementById('<%= ProcSubsiteDIV_1.ClientID %>');
        var subsiteOtherDiv = document.getElementById('<%= ProcSubsiteOtherDIV_1.ClientID %>');
        var subsiteOther = document.getElementById('<%= ProcSubsiteOther_1.ClientID %>');
        var subsiteHidden = document.getElementById('<%= ProcSubsiteHidden_1.ClientID %>');

        //procedure name
        var procnameDiv = document.getElementById('<%= ProcNameDiv_1.ClientID %>');
        var procnameOtherDiv = document.getElementById('<%= ProcNameOtherDiv_1.ClientID %>');
        
        var procnameOther = document.getElementById('<%= ProcNameOther_1.ClientID %>');
        var procnameHidden = document.getElementById('<%= ProcNameHidden_1.ClientID %>');

        //Nerve Monitor
        var NerveMonitorDiv = document.getElementById('<%= NerveMonitorDiv.ClientID %>');

        if (site.value == 'Neck' || site.value == 'Thyroid' || site.value == 'Parotid') {
            NerveMonitorDiv.style.display = 'block';
        }
        else {
            NerveMonitorDiv.style.display = 'none';

        }
        //=============================================

        //Additional Structures Removed
        var AdSR_Div = document.getElementById('<%= AdditionalStructuresDIV_1.ClientID %>');
        var AdSR_Neck_Div = document.getElementById('<%= AdditionalStructuresNeckDIV_1.ClientID %>');

        if (site.value == 'Neck' && procname.value == 'Neck Dissection') {
            AdSR_Neck_Div.style.display = 'block';
            AdSR_Div.style.display = 'none';                              
        }
        else {
            AdSR_Div.style.display = 'block';
            AdSR_Neck_Div.style.display = 'none';            
        }
        
        //=============================================
        if (site.value == 'Other' || site.value == 'Neck' || site.value == 'Parotid' || site.value == 'Submandibular' || site.value == 'Sublingual' || site.value == 'Thyroid') {
            subsiteOtherDiv.style.display = 'block';
            subsiteDiv.style.display = 'none';

            if (site.value == 'Thyroid') {
                subsiteOther.value = '';
                subsiteOther.disabled = true;
            }
            else {
                if (!subsiteHidden.value == '')
                    subsiteOther.value = subsiteHidden.value;

                subsiteOther.disabled = false;
            }
            //site.value == 'Neck'
            if (site.value == 'Other' ){
                procnameOtherDiv.style.display = 'block';
                procnameDiv.style.display = 'none';
                if (!procnameHidden.value == '')
                    procnameOther.value = procnameHidden.value;
            }
            else {
                 procnameOtherDiv.style.display = 'none';
                procnameDiv.style.display = 'block';
                if (!procnameHidden.value == '')
                    procname.value = procnameHidden.value;
            }
        }
        // else, show combo box with lookup code
        else {
            subsiteOtherDiv.style.display = 'none';
            subsiteDiv.style.display = 'block';                                                 
            if (!subsiteHidden.value == '')
                subsite.value = subsiteHidden.value;

            procnameOtherDiv.style.display = 'none';
            procnameDiv.style.display = 'block';
            if (!procnameHidden.value == '')
                procname.value = procnameHidden.value;

        }

        if (findingValue == 'Neck Dissection') {
            //re-check any structures that where saved
            if (ProcFinding.value != '') {
                var temp = ProcFinding.value;
                temp = temp.replace("Removed ", "");

                if (ProcFindSide.value == 'Right') {
                    if (procFindCBRight.type == 'checkbox' && temp == procFindCBRight.value)
                        procFindCBRight.checked = true;
                    else if (procFindCBRight.type == 'text' && temp != 'Accessory Nerve' && temp != 'Sternomastoid ' && temp != 'Internal Jugular Vein')
                        procFindCBRight.value = temp;
                }
                else if (ProcFindSide.value == 'Left') {
                    if (procFindCBLeft.type == 'checkbox' && temp == procFindCBLeft.value)
                        procFindCBLeft.checked = true;
                    else if (procFindCBLeft.type == 'text' && temp != 'Accessory Nerve' && temp != 'Sternomastoid ' && temp != 'Internal Jugular Vein')
                        procFindCBLeft.value = temp;

                }
                else if (ProcFindSide.value == 'Bilateral') {
                    if (procFindCBRight.type == 'checkbox' && temp == procFindCBRight.value)
                        procFindCBRight.checked = true;
                    else if (procFindCBRight.type == 'text' && temp != 'Accessory Nerve' && temp != 'Sternomastoid ' && temp != 'Internal Jugular Vein')
                        procFindCBRight.value = temp;

                    if (procFindCBLeft.type == 'checkbox' && temp == procFindCBLeft.value)
                        procFindCBLeft.checked = true;
                    else if (procFindCBLeft.type == 'text' && temp != 'Accessory Nerve' && temp != 'Sternomastoid ' && temp != 'Internal Jugular Vein')
                        procFindCBLeft.value = temp;
                }
            }
        }
        
        SetHiddenNeckDissection(ProcSide, site, subsite, procname, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft);

       /* //Surgical Margin
        if (findingValue == 'Margin Details') {
            if (findingPrimDim.value != '') {
                ProcFindSide.value = ProcSide.value;
                ProcFindSite.value = site.value;
                ProcFinding.value = findingValue;
                ProcFindSubsite.value = 'Surgical Margin';
            } 
        }
 
        var temp = '';
        */

        var tempMargin = '';
        var tempFrozen = '';

        //Surgical Margin
        var SurgicalMarginDiv = document.getElementById('<%= SurgicalMarginDiv.ClientID %>');
        var SurgicalMarginRecorded = document.getElementById('<%= SurgicalMarginRecorded.ClientID %>');
        var ProcFindNotes = document.getElementById('<%= ProcFindNotes_3.ClientID %>');

        if (findingValue == 'Margin Details') {
            tempMargin = RetrieveRadioBtnListSelectedValues(SurgicalMarginRecorded, "TABLE");
            if (tempMargin == 'Yes') {
                SurgicalMarginDiv.style.display = 'block';
                if (findingPrimDim.value != '' || ProcFindNotes.value != '') {
                    ProcFindSide.value = ProcSide.value;
                    ProcFindSite.value = site.value;
                    ProcFinding.value = findingValue;
                    ProcFindSubsite.value = 'Surgical Margin';
                }
            }
            else {
                SurgicalMarginDiv.style.display = 'none';
                findingPrimDim.value = '';
                ProcFindNotes.value = '';
            }

            //Frozen Section
            var FrozenSectionDiv = document.getElementById('<%= FrozenSectionDiv.ClientID %>');
            var ProcFindFrozen = document.getElementById('<%= ProcFindFrozen_3.ClientID %>');
            var FrozenSectionRecorded = document.getElementById('<%= FrozenSectionRecorded.ClientID %>');
            tempFrozen = RetrieveRadioBtnListSelectedValues(FrozenSectionRecorded, "TABLE");

            if (tempFrozen == 'Yes') {
                FrozenSectionDiv.style.display = 'block';
                if (ProcFindFrozen.value != '') {
                    ProcFindSide.value = ProcSide.value;
                    ProcFindSite.value = site.value;
                    ProcFinding.value = findingValue;
                    ProcFindSubsite.value = 'Surgical Margin';
                }
            }
            else  {
                FrozenSectionDiv.style.display = 'none';
                ProcFindFrozen.value = '';
            }

            if (tempMargin != 'Yes' && tempFrozen != 'Yes') {
                ProcFindSide.value = '';
                ProcFindSite.value = '';
                ProcFinding.value = '';
                ProcFindSubsite.value = '';
            }

        } // End findingValue = 'Margin Details'

        //show Nerve Monitor
        var NerveMonitorDiv = document.getElementById('<%= NerveMonitorDiv.ClientID %>');
        var NerveMonitorNotesDiv = document.getElementById('<%= NerveMonitorNotesDiv.ClientID %>'); 

        if (findingValue == 'Nerve Monitor') {
            temp = RetrieveRadioBtnListSelectedValues(ProcFinding, "TABLE");
            if (temp == 'Yes') {
                ProcFindSide.value = ProcSide.value;
                ProcFindSite.value = site.value;
                ProcFindSubsite.value = findingValue;
                NerveMonitorNotesDiv.style.display = 'block';
            }
            else {
                NerveMonitorNotesDiv.style.display = 'none';
                NerveMonitorNotesDiv.value = '';
            }
        }
        //show Additional Management
        var NerveGraftDiv = document.getElementById('<%= NerveGraftDiv.ClientID %>');
        var NerveGraftNotesDiv = document.getElementById('<%= NerveGraftNotesDiv.ClientID %>');              

        if (findingValue == 'Nerve Graft') {
            temp = RetrieveRadioBtnListSelectedValues(ProcFinding, "TABLE");
            if (temp == 'Yes' || temp == 'No') {
                ProcFindSide.value = ProcSide.value;
                ProcFindSite.value = site.value;
                ProcFindSubsite.value = findingValue;
                NerveGraftNotesDiv.style.display = 'block';
            }
            //else if (temp == 'No')               
            //    NerveGraftNotesDiv.style.display = 'block';
            else
                NerveGraftNotesDiv.style.display = 'none';           
          
        }
   
        if (findingValue == 'Additional Structures Removed') {
            temp = RetrieveCheckBoxListSelectedValues(ProcFindSubsite, "TABLE");
            if (temp != '') {
                //Nerve Graft
                if (temp.toLowerCase().indexOf('nerve') > -1) {
                    NerveGraftDiv.style.display = 'block';

                }               

                var AdditionalManageDiv = document.getElementById('<%= AdditionalManageDiv.ClientID %>');
                //|| ThyroidDiv.style.display == 'block' || LarynxDiv.style.display == 'block' || TracheaDiv.style.display == 'block' || EsophagusPharynxDiv.style.display == 'block'
                if (NerveGraftDiv.style.display == 'block' ) {
                    AdditionalManageDiv.style.display = 'block';
                }

            }
        }
         
    }

    function SetHiddenToProcAndSubsite() {
        var ProcSite = document.getElementById('<%= ProcSite_1.ClientID %>');
        var ProcSubsite = document.getElementById('<%= ProcSubsite_1.ClientID %>');
        //subsite 
        var subsiteDiv = document.getElementById('<%= ProcSubsiteDIV_1.ClientID %>');
        var subsiteOtherDiv = document.getElementById('<%= ProcSubsiteOtherDIV_1.ClientID %>');
        var subsiteOther = document.getElementById('<%= ProcSubsiteOther_1.ClientID %>');
        var subsiteHidden = document.getElementById('<%= ProcSubsiteHidden_1.ClientID %>');
        
        //procedure name
        var procnameDiv = document.getElementById('<%= ProcNameDiv_1.ClientID %>');
        var procnameOtherDiv = document.getElementById('<%= ProcNameOtherDiv_1.ClientID %>');
        var ProcName = document.getElementById('<%= ProcName_1.ClientID %>');
        var procnameOther = document.getElementById('<%= ProcNameOther_1.ClientID %>');
        var procnameHidden = document.getElementById('<%= ProcNameHidden_1.ClientID %>');

        //Disable Neck Dissection component (HeadNeckDissection) if ProcSite = 'Neck' 
        // 3 - section order (starts from 0) in HeadNeckSurgeryEform.xml
        var neckDissectionRecorded = getNeckDissecitonRecorded();
        if (neckDissectionRecorded) {
            if (ProcSite.value == 'Neck' && ProcName.value == 'Neck Dissection') {
                var neckDissectionRecordedRef = neckDissectionRecorded.getElementsByTagName('input');
                var blnYes = false;
                for (var i = 0; i < neckDissectionRecordedRef.length; i++)
                    if (neckDissectionRecordedRef[i].checked && neckDissectionRecordedRef[i].value == "Yes") {
                        neckDissectionRecordedRef[i].checked = false;
                        blnYes = true;
                    }
                    else if (neckDissectionRecordedRef[i].value == "No" && blnYes == true) {
                        neckDissectionRecordedRef[i].checked = true;
                        neckDissectionRecordedRef[i].click();
                    }
                neckDissectionRecorded.disabled = true;                  
            }
            else
                neckDissectionRecorded.disabled = false;
        }

        // hide Neck Dissection component (HeadNeckDissection) if ProcSite = 'Neck' and ProcName = 'Neck Dissection'
        var neckDissDiv = getTopNeckDissecitonDiv();
        //alert(neckDissDiv);
        if (neckDissDiv) {
            if (ProcSite.value == 'Neck' && ProcName.value == 'Neck Dissection') {
                neckDissDiv.style.display = 'none';
            }
            else
                neckDissDiv.style.display = 'inline';
        
        }
        //=================================
        //Additional Structures Removed
        var AdSR_Div = document.getElementById('<%= AdditionalStructuresDIV_1.ClientID %>');
        //Neck Dissection
        var AdSR_Neck_Div = document.getElementById('<%= AdditionalStructuresNeckDIV_1.ClientID %>');

        //var ProcSide = document.getElementById('<%= ProcSide_1.ClientID %>');
        if (ProcSite.value == 'Neck' && ProcName.value == 'Neck Dissection') {
            AdSR_Neck_Div.style.display = 'block';
            AdSR_Div.style.display = 'none';
            subsiteOther.disabled = true;
            subsiteOther.value = '';
           // ProcSide.disabled = true; - if disabled, ProcSide value is not picked up when click 'next'

            //if 'Neck Dissection' - clear 'Additional Structures Removed'
            var ProcFindSubsite = document.getElementById('<%= ProcFindSubsite_1.ClientID %>')
            ResetCheckBoxList(ProcFindSubsite);
        }
        else {
            //  not 'Neck Dissection' - show 'Additional Structures Removed'
            AdSR_Div.style.display = 'block';
            AdSR_Neck_Div.style.display = 'none';
            subsiteOther.disabled = false;
            // ProcSide.disabled = false; 

            //clear Neck Dissection levels and findings (added because ProcName.click event does not work)
            var levelsRightCBL = document.getElementById('<%= LevelsDissRight_1.ClientID %>');
            var levelsLeftCBL = document.getElementById('<%= LevelsDissLeft_1.ClientID %>');
            ResetCheckBoxList(levelsRightCBL);
            ResetCheckBoxList(levelsLeftCBL);
            //right findings
            var ProcFinding_1 = document.getElementById('<%= ProcFinding_1.ClientID %>'); //Accessory Nerve
            ProcFinding_1.checked = false;
            
            var ProcFinding_2 = document.getElementById('<%= ProcFinding_2.ClientID %>'); //Sternomastoid
            ProcFinding_2.checked = false;
            
            var ProcFinding_3 = document.getElementById('<%= ProcFinding_3.ClientID %>'); //Internal Jugular Vein
            ProcFinding_3.checked = false;
            
            var ProcFinding_4 = document.getElementById('<%= ProcFinding_4.ClientID %>'); //Other
            ProcFinding_4.checked = false;
            ProcFinding_4.value = '';
            //left findings
            var ProcFinding_5 = document.getElementById('<%= ProcFinding_5.ClientID %>'); //Accessory Nerve
            ProcFinding_5.checked = false;
            
            var ProcFinding_6 = document.getElementById('<%= ProcFinding_6.ClientID %>'); //Sternomastoid
            ProcFinding_6.checked = false;
            
            var ProcFinding_7 = document.getElementById('<%= ProcFinding_7.ClientID %>'); //Internal Jugular Vein
            ProcFinding_7.checked = false;
            
            var ProcFinding_8 = document.getElementById('<%= ProcFinding_8.ClientID %>'); //Other
            ProcFinding_8.checked = false;
            ProcFinding_8.value = '';
            //Proc finding name
            var ProcFinding_4_Text = document.getElementById('<%= ProcFinding_4_Text.ClientID %>');
            ProcFinding_4_Text.value = '';
            var ProcFinding_5_Text = document.getElementById('<%= ProcFinding_5_Text.ClientID %>');
            ProcFinding_5_Text.value = '';
            var ProcFinding_6_Text = document.getElementById('<%= ProcFinding_6_Text.ClientID %>');
            ProcFinding_6_Text.value = '';
            var ProcFinding_7_Text = document.getElementById('<%= ProcFinding_7_Text.ClientID %>');
            ProcFinding_7_Text.value = '';
        }
        //=================================


        if (ProcSite.value == 'Other' || ProcSite.value == 'Neck' || ProcSite.value == 'Parotid' || ProcSite.value == 'Submandibular' || ProcSite.value == 'Sublingual' || ProcSite.value == 'Thyroid') {
            subsiteOtherDiv.style.display = 'block';
            subsiteDiv.style.display = 'none';
            if (ProcSite.value == 'Thyroid') {
                subsiteOther.value = '';
                subsiteOther.disabled = true;
               
            }
            else {
                subsiteOther.disabled = false;
            }
            subsiteHidden.value = subsiteOther.value;
            // ProcSite.value == 'Neck'
            if (ProcSite.value == 'Other' ) {
                procnameOtherDiv.style.display = 'block';
                procnameDiv.style.display = 'none';
                procnameHidden.value = procnameOther.value;
            }
            else {
                procnameOtherDiv.style.display = 'none';
                procnameDiv.style.display = 'block';
                procnameHidden.value = ProcName.value;
            }
        }
        // else, show combo box with lookup code
        else {
            subsiteOtherDiv.style.display = 'none';
            subsiteDiv.style.display = 'block';
            subsiteHidden.value = ProcSubsite.value;

            procnameOtherDiv.style.display = 'none';
            procnameDiv.style.display = 'block';
            procnameHidden.value = ProcName.value;
        }


    }

    function getNeckDissecitonRecorded() {
        var ndr = null;
        var tables = document.getElementsByTagName('table');
        for (var i = 0; i < tables.length; i++) {
            var table = tables[i];
            if (table.id.indexOf('NeckDissecitonRecorded') > -1) {
                ndr = table;
                break;
            }
        }
        return ndr;
    }

    function getTopNeckDissecitonDiv() {
        var ndr = null;
        var tables = document.getElementsByTagName('div');
        for (var i = 0; i < tables.length; i++) {
            var table = tables[i];
            if (table.id.indexOf('TopNeckDissecitonDiv') > -1) {
                ndr = table;
                break;
            }
        }
        return ndr;
    }      

    function SetHiddenFields(ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft) {
        //subsite 
        var subsiteDiv = document.getElementById('<%= ProcSubsiteDIV_1.ClientID %>');
        var subsiteOtherDiv = document.getElementById('<%= ProcSubsiteOtherDIV_1.ClientID %>');
        var subsiteOther = document.getElementById('<%= ProcSubsiteOther_1.ClientID %>');
        var subsiteHidden = document.getElementById('<%= ProcSubsiteHidden_1.ClientID %>');

        //procedure name
        var procnameDiv = document.getElementById('<%= ProcNameDiv_1.ClientID %>');
        var procnameOtherDiv = document.getElementById('<%= ProcNameOtherDiv_1.ClientID %>');
        
        var procnameOther = document.getElementById('<%= ProcNameOther_1.ClientID %>');
        var procnameHidden = document.getElementById('<%= ProcNameHidden_1.ClientID %>');

        //Nerve Monitor
        var NerveMonitorDiv = document.getElementById('<%= NerveMonitorDiv.ClientID %>');
        if (ProcSite.value == 'Neck' || ProcSite.value == 'Thyroid' || ProcSite.value == 'Parotid') {
            NerveMonitorDiv.style.display = 'block';
        }
        else {
            NerveMonitorDiv.style.display = 'none';
            var objRbtLst = document.getElementById('<%= ProcFinding_40_Text.ClientID %>');
            ResetRadioBtnList(objRbtLst);
        }

        //Additional Structures Removed
        var AdSR_Div = document.getElementById('<%= AdditionalStructuresDIV_1.ClientID %>');
        var AdSR_Neck_Div = document.getElementById('<%= AdditionalStructuresNeckDIV_1.ClientID %>');

        if (ProcSite.value == 'Neck' && ProcName.value == 'Neck Dissection') {
            AdSR_Neck_Div.style.display = 'block';
            AdSR_Div.style.display = 'none';
            //procnameOther.value = 'Neck Dissection';            
            
            if (findingValue == 'Additional Structures Removed') {                
                ResetCheckBoxList(ProcFindSubsite);
            }     
        }

        else {
            AdSR_Div.style.display = 'block';
            AdSR_Neck_Div.style.display = 'none';            
        }
       
        //==================================
        //for sites have no subsites: Parotid; Submandibular; Sublingual; Thyroid - show freetext subsite
        //for site: Neck - show freetext subsite; for site: Other - show freetext subsite and ProcName
        if (ProcSite.value == 'Other' || ProcSite.value == 'Neck' || ProcSite.value == 'Parotid' || ProcSite.value == 'Submandibular' || ProcSite.value == 'Sublingual' || ProcSite.value == 'Thyroid') {
            ProcSubsite.value = '';
            
            //alert(ProcSite.value);
            subsiteOtherDiv.style.display = 'block';
            subsiteDiv.style.display = 'none';
            if (ProcSite.value == 'Thyroid') {
                subsiteOther.value = '';
                subsiteOther.disabled = true;
            }
            else {
                subsiteOther.disabled = false;
            }
            subsiteHidden.value = subsiteOther.value;
            //ProcSite.value == 'Neck'
            if (ProcSite.value == 'Other' ) {
                ProcName.value = '';
                procnameOtherDiv.style.display = 'block';
                procnameDiv.style.display = 'none';
                procnameHidden.value = procnameOther.value;
            }
            else {
                procnameOther.value = '';
                procnameOtherDiv.style.display = 'none';
                procnameDiv.style.display = 'block';
                procnameHidden.value = ProcName.value;
            }
            
        }
        // else, show combo box with lookup code
        else {
            subsiteOther.value = '';
            procnameOther.value = '';

            subsiteOtherDiv.style.display = 'none';
            subsiteDiv.style.display = 'block';
            subsiteHidden.value = ProcSubsite.value;

            procnameOtherDiv.style.display = 'none';
            procnameDiv.style.display = 'block';
            procnameHidden.value = ProcName.value;
        }
     
        SetHiddenNeckDissection(ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft);
        
        //-------------------------

        //Additional Structures Removed
        var NerveGraftDiv = document.getElementById('<%= NerveGraftDiv.ClientID %>');
        var NerveGraftNotesDiv = document.getElementById('<%= NerveGraftNotesDiv.ClientID %>');
        var temp = '';
        if (findingValue == 'Additional Structures Removed')
        {            
            temp = RetrieveCheckBoxListSelectedValues(ProcFindSubsite, "TABLE");
            var ProcFindSubsite = document.getElementById('<%= ProcFindSubsite_1_Text.ClientID %>');
            if (temp != '')
            {
                //first record (row)
                ProcFindSide.value = ProcSide.value;
                ProcFindSite.value = ProcSite.value;
                ProcFinding.value = findingValue;
                ProcFindSubsite.value = temp;

                //-----------------------------
                //save each Additional Structures Removed in a new separate rows                
                var arrVal = temp.split(',');
               
                if (arrVal.length > 1) { 
                    ProcFindSubsite.value = arrVal[0];               
                    var obj;
                    var ProcFindSide_id = '<%= ProcFindSide_4.ClientID %>';
                    var ProcFindSite_id = '<%= ProcFindSite_4.ClientID %>';
                    var ProcFindSubsite_id = '<%= ProcFindSubsite_4.ClientID %>';
                    var ProcFinding_id = '<%= ProcFinding_4_Text.ClientID %>';
                    var j = 0;
                    for (var i = 1; i < arrVal.length; i++) {                        

                        ProcFindSide_id = ProcFindSide_id.substr(0, ProcFindSide_id.length - 1) + (4 + j).toString();
                        ProcFindSite_id = ProcFindSite_id.substr(0, ProcFindSite_id.length - 1) + (4 + j).toString();
                        ProcFindSubsite_id = ProcFindSubsite_id.substr(0, ProcFindSubsite_id.length - 1) + (4 + j).toString();
                        ProcFinding_id = ProcFinding_id.substr(0, ProcFinding_id.length - 6) + (4 + j).toString() + '_Text';
                                                
                        obj = document.getElementById(ProcFindSide_id);                        
                        obj.value = ProcSide.value;
                        
                        obj = document.getElementById(ProcFindSite_id);   
                        obj.value = ProcSite.value;
                        
                        obj = document.getElementById(ProcFindSubsite_id);
                        obj.value = arrVal[i];
                        
                        obj = document.getElementById(ProcFinding_id);
                        obj.value = findingValue;
                        j = j + 1; 
                    }
                }
                //--------------------------
            }
            else
            {
                ProcFindSubsite.value = '';
                ProcFindSide.value = '';
                ProcFindSite.value = '';
                ProcFinding.value = '';
            }
            
            //Additional Management
           
            //Nerve Graft
            if (temp.toLowerCase().indexOf('nerve') > -1) {            
                NerveGraftDiv.style.display = 'block';               
            }
            else {
               var objRbtLst = document.getElementById('<%= ProcFinding_2_Text.ClientID %>');
                ResetRadioBtnList(objRbtLst);                

                obj = document.getElementById('<%= ProcFindSide_2.ClientID %>');
                obj.value = '';
                obj = document.getElementById('<%= ProcFindSite_2.ClientID %>');
                obj.value = '';
                obj = document.getElementById('<%= ProcFindSubsite_2.ClientID %>');
                obj.value = '';
             
                NerveGraftDiv.style.display = 'none';
                NerveGraftNotesDiv.style.display = 'none';
            }


            var AdditionalManageDiv = document.getElementById('<%= AdditionalManageDiv.ClientID %>');
            //|| ThyroidDiv.style.display == 'block' || LarynxDiv.style.display == 'block' || TracheaDiv.style.display == 'block' || EsophagusPharynxDiv.style.display == 'block'
            if (NerveGraftDiv.style.display == 'block' ) {                
                AdditionalManageDiv.style.display = 'block';
            }
            else
                AdditionalManageDiv.style.display = 'none';

        }
        else if (findingValue == 'Nerve Graft') { 
               
           temp = RetrieveRadioBtnListSelectedValues(ProcFinding, "TABLE");

           if (temp == 'Yes' || temp == 'No') {
                ProcFindSide.value = ProcSide.value;
                ProcFindSite.value = ProcSite.value;
                ProcFindSubsite.value = findingValue;                

            }
            else {
                ProcFindSide.value = '';
                ProcFindSite.value = '';
                ProcFindSubsite.value = '';
            }
        }
        else if (findingValue == 'Margin Details') {
            var ProcFindNotes = document.getElementById('<%= ProcFindNotes_3.ClientID %>');
            var ProcFindFrozen = document.getElementById('<%= ProcFindFrozen_3.ClientID %>');
            if (findingPrimDim.value != '' || ProcFindNotes.value != '' || ProcFindFrozen.value != '') {
                ProcFindSide.value = ProcSide.value;
                ProcFindSite.value = ProcSite.value;
                ProcFinding.value = findingValue;
                ProcFindSubsite.value = 'Surgical Margin';
            }
            else {
                ProcFindSide.value = '';
                ProcFindSite.value = '';
                ProcFinding.value = '';
                ProcFindSubsite.value = '';
            }

        }
        else if (findingValue == 'Nerve Monitor') {

            temp = RetrieveRadioBtnListSelectedValues(ProcFinding, "TABLE");

            if (temp == 'Yes') {
                ProcFindSide.value = ProcSide.value;
                ProcFindSite.value = ProcSite.value;
                ProcFindSubsite.value = findingValue;

            }
            else {
                ProcFindSide.value = '';
                ProcFindSite.value = '';
                ProcFindSubsite.value = '';
            }
        }
    }    

    

    function SetHiddenNeckDissection(ProcSide, ProcSite, ProcSubsite, ProcName, ProcFinding, ProcFindSide, ProcFindSite, ProcFindSubsite, findingValue, findingPrimDim, ProcSubsiteOther, ProcNameOther, levelsRightCBL, levelsLeftCBL, procFindCBRight, procFindCBLeft) {
      
        var procSubsiteHidden = document.getElementById('<%= ProcSubsiteHidden_1.ClientID %>');
        var levelsRightCBLRef= levelsRightCBL.getElementsByTagName('input');
        var levelsLeftCBLRef = levelsLeftCBL.getElementsByTagName('input');

        if (ProcSite.value == 'Neck' && ProcName.value == 'Neck Dissection')
        {
            var levelsRightString = RetrieveCheckBoxListSelectedValues(levelsRightCBL, "FLOW"); 
            var levelsLeftString = RetrieveCheckBoxListSelectedValues(levelsLeftCBL, "FLOW");
            
            if (levelsRightString != '' || levelsLeftString != '') {                     

                if (levelsRightString != '' && levelsLeftString == '') {
                    ProcSide.value = "Right";
                    var temp = levelsRightString;

                    ProcSubsiteOther.value = "Level " + temp;
                    procSubsiteHidden.value = "Level " + temp;
                }
                else if (levelsRightString == '' && levelsLeftString != '') {
                    ProcSide.value = "Left";
                    var temp = levelsLeftString;

                    ProcSubsiteOther.value = "Level " + temp;
                    procSubsiteHidden.value = "Level " + temp;          
                }
                else if (levelsRightString != '' && levelsLeftString != '') {                    
                    ProcSide.value = "Bilateral";
                    //determine if left and right checkbox have the same items checked
                    var HaveSameItems = 'true';
                    for (var i = 0; i < levelsRightCBLRef.length; i++)
                        if (levelsRightCBLRef[i].checked != levelsLeftCBLRef[i].checked)
                            HaveSameItems = 'false';

                    // if the left and right levels have the same items checked
                    if (HaveSameItems == 'true') {
                        // use on one to fill the subsite field
                        var temp = levelsRightString;

                        ProcSubsiteOther.value = "Level " + temp;
                        procSubsiteHidden.value = "Level " + temp;
                    }
                     //else, the left and right levels have different items checked
                    else {
                        //enter both into subsite field
                        var temp = levelsRightString;

                        temp = "Right Level " + temp;

                        var temp2 = levelsLeftString;

                        temp2 = "Left Level " + temp2;
                        ProcSubsiteOther.value = temp + "; " + temp2;
                        procSubsiteHidden.value = temp + "; " + temp2;                         
                    }
                }
            }
            else {
                ProcFindSide.value = '';
                ProcFindSite.value = '';
                ProcFindSubsite.value = '';               
            }
        
        }
        else
        {
            
            for (var i = 0; i < levelsRightCBLRef.length; i++)
                levelsRightCBLRef[i].checked = false;

            for (var i = 0; i < levelsLeftCBLRef.length; i++)
                levelsLeftCBLRef[i].checked = false;
            
            procFindCBRight.checked = false;
            procFindCBLeft.checked = false;

            if (findingValue == 'Neck Dissection') {                
                ProcFindSide.value = '';
                ProcFindSite.value = '';
                ProcFindSubsite.value = '';
                ProcFinding.value = '';
                //clear 'Other'               
                if (procFindCBRight.value != 'Accessory Nerve' && procFindCBRight.value != 'Sternomastoid' && procFindCBRight.value != 'Internal Jugular Vein')
                    procFindCBRight.value = '';
                if (procFindCBLeft.value != 'Accessory Nerve' && procFindCBLeft.value != 'Sternomastoid' && procFindCBLeft.value != 'Internal Jugular Vein')
                    procFindCBLeft.value = '';
            }
        }
        
        if (procFindCBRight.type == 'checkbox' && procFindCBLeft.type == 'checkbox') {
            if (procFindCBRight.checked || procFindCBLeft.checked) {

                ProcFindSubsite.value = ProcSubsiteOther.value;
                ProcFindSide.value = ProcSide.value;
                ProcFindSite.value = 'Neck';

                if (procFindCBRight.checked)
                    ProcFinding.value = "Removed " + procFindCBRight.value;
                else (procFindCBRight.checked)
                    ProcFinding.value = "Removed " + procFindCBLeft.value;

            }
            else {

                ProcFindSide.value = '';
                ProcFindSite.value = '';
                ProcFindSubsite.value = '';
            }
        }
        else if (procFindCBRight.type == 'text' && procFindCBLeft.type == 'text') {
            if (procFindCBRight.value != '' || procFindCBLeft.value != '') {

                ProcFindSubsite.value = ProcSubsiteOther.value;
                ProcFindSide.value = ProcSide.value;
                ProcFindSite.value = 'Neck';

                if (procFindCBRight.value != '') {
                    ProcFinding.value = "Removed " + procFindCBRight.value;

                }
                else if (procFindCBLeft.value != '') {
                    ProcFinding.value = "Removed " + procFindCBLeft.value;

                }
            }
            else {
                ProcFindSide.value = '';
                ProcFindSite.value = '';
                ProcFindSubsite.value = '';
            }
        }

    }

    function SetHideNerveGraftNotes() {
        
        var NerveGraftNotesDiv = document.getElementById('<%= NerveGraftNotesDiv.ClientID %>');
        var ProcFindNotes = document.getElementById('<%= ProcFindNotes_2.ClientID %>');
        var ProcFindSide = document.getElementById('<%= ProcFindSide_2.ClientID %>');
        var ProcFindSite = document.getElementById('<%= ProcFindSite_2.ClientID %>');
        var ProcFindSubsite = document.getElementById('<%= ProcFindSubsite_2.ClientID %>');

        var ProcFinding = document.getElementById('<%= ProcFinding_2_Text.ClientID %>');
        temp = RetrieveRadioBtnListSelectedValues(ProcFinding, "TABLE");
        if (temp == 'Yes' || temp == 'No') {
            NerveGraftNotesDiv.style.display = 'block';
        }
        //else if (temp == 'No')            
        //        NerveGraftNotesDiv.style.display = 'block';
        else {
            NerveGraftNotesDiv.style.display = 'none';
            ProcFindNotes.value = '';
            ProcFindSide.value = '';
            ProcFindSite.value = '';
            ProcFindSubsite.value = '';
        }
    }

    function SetHideNerveMonitorNotes() {
        var NerveMonitorNotesDiv = document.getElementById('<%= NerveMonitorNotesDiv.ClientID %>');
        var ProcFindNotes = document.getElementById('<%= ProcFindNotes_40.ClientID %>');
        var ProcFindSide = document.getElementById('<%= ProcFindSide_40.ClientID %>');
        var ProcFindSite = document.getElementById('<%= ProcFindSite_40.ClientID %>');
        var ProcFindSubsite = document.getElementById('<%= ProcFindSubsite_40.ClientID %>');

        var ProcFinding = document.getElementById('<%= ProcFinding_40_Text.ClientID %>');
        temp = RetrieveRadioBtnListSelectedValues(ProcFinding, "TABLE");
        if (temp == 'Yes') {
            NerveMonitorNotesDiv.style.display = 'block';
        }
        else {
            NerveMonitorNotesDiv.style.display = 'none';
            ProcFindNotes.value = '';
            ProcFindSide.value = '';
            ProcFindSite.value = '';
            ProcFindSubsite.value = '';
        }
    }

    function SetHideSurgicalMargin() {
        var SurgicalMarginDiv = document.getElementById('<%= SurgicalMarginDiv.ClientID %>');
        var ProcFindNotes = document.getElementById('<%= ProcFindNotes_3.ClientID %>');
        var ProcFindSide = document.getElementById('<%= ProcFindSide_3.ClientID %>');
        var ProcFindSite = document.getElementById('<%= ProcFindSite_3.ClientID %>');
        var ProcFindSubsite = document.getElementById('<%= ProcFindSubsite_3.ClientID %>');
        var findingPrimDim = document.getElementById('<%= ProcFindPrimaryDimension_3.ClientID %>');
        var ProcFinding = document.getElementById('<%= ProcFinding_3_Text.ClientID %>');

        var SurgicalMarginRecorded = document.getElementById('<%= SurgicalMarginRecorded.ClientID %>');
        temp = RetrieveRadioBtnListSelectedValues(SurgicalMarginRecorded, "TABLE");
        if (temp == 'Yes') {
            SurgicalMarginDiv.style.display = 'block';
        }
        else {
            SurgicalMarginDiv.style.display = 'none';
            findingPrimDim.value = '';
            ProcFindNotes.value = '';

            var FrozenSectionRecorded = document.getElementById('<%= FrozenSectionRecorded.ClientID %>');
            tempFrozen = RetrieveRadioBtnListSelectedValues(FrozenSectionRecorded, "TABLE");
            if (tempFrozen != 'Yes') {
                ProcFindSide.value = '';
                ProcFindSite.value = '';
                ProcFinding.value = '';
                ProcFindSubsite.value = '';
            }
        }
    }

    function SetHideFrozenSection(){
        var FrozenSectionDiv = document.getElementById('<%= FrozenSectionDiv.ClientID %>');

        var FrozenSectionRecorded = document.getElementById('<%= FrozenSectionRecorded.ClientID %>');
        var ProcFindFrozen = document.getElementById('<%= ProcFindFrozen_3.ClientID %>');

        temp = RetrieveRadioBtnListSelectedValues(FrozenSectionRecorded, "TABLE");
        if (temp == 'Yes') {
            FrozenSectionDiv.style.display = 'block';
        }
        else {
            FrozenSectionDiv.style.display = 'none';
            ProcFindFrozen.value = '';

            //clear record if surgical margin is empty
            var SurgicalMarginRecorded = document.getElementById('<%= SurgicalMarginRecorded.ClientID %>');
            tempMargin = RetrieveRadioBtnListSelectedValues(SurgicalMarginRecorded, "TABLE");
            if (tempMargin != 'Yes') {
                var ProcFindSide = document.getElementById('<%= ProcFindSide_3.ClientID %>');
                var ProcFindSite = document.getElementById('<%= ProcFindSite_3.ClientID %>');
                var ProcFindSubsite = document.getElementById('<%= ProcFindSubsite_3.ClientID %>');
                var ProcFinding = document.getElementById('<%= ProcFinding_3_Text.ClientID %>');

                ProcFindSide.value = '';
                ProcFindSite.value = '';
                ProcFinding.value = '';
                ProcFindSubsite.value = '';
            }
        }
    }

    function SetSurgicalMargin() {
        var ProcFindSide = document.getElementById('<%= ProcFindSide_3.ClientID %>');
        var ProcFindSite = document.getElementById('<%= ProcFindSite_3.ClientID %>');
        var ProcFindSubsite = document.getElementById('<%= ProcFindSubsite_3.ClientID %>');
        var ProcFinding = document.getElementById('<%= ProcFinding_3_Text.ClientID %>');
        var ProcSite = document.getElementById('<%= ProcSite_1.ClientID %>');
        var ProcSide = document.getElementById('<%= ProcSide_1.ClientID %>');

        var ProcFindNotes = document.getElementById('<%= ProcFindNotes_3.ClientID %>');
        var ProcFindFrozen = document.getElementById('<%= ProcFindFrozen_3.ClientID %>');
        
        if (ProcFindFrozen.value != '' || ProcFindNotes.value != '') {
            ProcFindSide.value = ProcSide.value;
            ProcFindSite.value = ProcSite.value;
            ProcFinding.value = 'Margin Details';
            ProcFindSubsite.value = 'Surgical Margin';
        }
    }


</script>