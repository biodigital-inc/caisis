<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OralCavityProcedurePrimary" CodeFile="OralCavityProcedurePrimary.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.OtherProceduresHtmlTable = "OtherProceduresHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="OralCavityProcedurePrimary" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>


    <table cellpadding="5" cellspacing="0" class="ClinicalEformTable" >
        <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Admit Date</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Discharge Date</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Case Surgeon</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" ></td>
        </tr>
        
      <tr>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="16" ID="OpDateText_16" TABLE="OperatingRoomDetails" FIELD="OpDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="16" ID="OpDate_16" TABLE="OperatingRoomDetails" FIELD="OpDate" />
                               	      
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ID="OpQuality_16" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcPrimary_16" TABLE="Procedures" FIELD="ProcPrimary" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcDateText_16" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcDate_16" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcSurgeon_16" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcQuality_16" TABLE="Procedures" FIELD="ProcQuality" />   		    
 		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="PathDateText_16" TABLE="Pathology" FIELD="PathDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="PathDate_16" TABLE="Pathology" FIELD="PathDate" />  		    
            	<euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="PathSite_16" TABLE="Pathology" FIELD="PathSite" />  		    
                <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="16" ParentRecordId="16" ID="PathSide_16" TABLE="Pathology" FIELD="PathSide" />
                <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="16" ParentRecordId="16" ID="PathSubsite_16" TABLE="Pathology" FIELD="PathSubsite" />
          	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="PathSpecimenType_16" TABLE="Pathology" FIELD="PathSpecimenType" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="16" ParentRecordId="16" ID="PathQuality_16" TABLE="Pathology" FIELD="PathQuality" />		    		    

                </td>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="16" ID="OpAdmitDateText_16" TABLE="OperatingRoomDetails" FIELD="OpAdmitDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="16" ID="OpAdmitDate_16" TABLE="OperatingRoomDetails" FIELD="OpAdmitDate" /></td>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="90px"  Runat="server" RecordId="16" ID="OpDischargeDateText_16" TABLE="OperatingRoomDetails" FIELD="OpDischargeDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="16" ID="OpDischargeDate_16" TABLE="OperatingRoomDetails" FIELD="OpDischargeDate" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="16" ID="OpCaseSurgeon_16" TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" LookupCode="Physician" /></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_16a"  runat="server"/></td>
        </tr>
        

        <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left" colspan="1">Procedure Name</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Side</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Subsite</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Approach</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" ></td>
        </tr>
        <tr>
             <td style="white-space: nowrap;" valign="top" colspan="1" >            
                
                <euc:EformDropDownList Width="150px" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcName_16" TABLE="Procedures" FIELD="ProcName" ShowEmptyListItem="true" >
                    <asp:ListItem Value="" Text="" />
                    <asp:ListItem Value="Partial Glossectomy" Text="Partial Glossectomy" />
                    <asp:ListItem Value="Hemiglossectomy" Text="Hemiglossectomy" />
                    <asp:ListItem Value="Total Glossectomy" Text="Total Glossectomy" />
                    <asp:ListItem Value="Wide Local Excision" Text="Wide Local Excision" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
               </euc:EformDropDownList></td>

             <td style="white-space: nowrap;" valign="top" >
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcSite_16" TABLE="Procedures" FIELD="ProcSite" />
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcSide_16" TABLE="Procedures" FIELD="ProcSide"  LookupCode="OpSide,Disease,HeadNeck"/></td>

             <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcSubsite_16" TABLE="Procedures" FIELD="ProcSubsite"  LookupCode="DxTarget,Disease,HeadNeck"/></td>
                
             <td style="white-space: nowrap;" colspan="1" >
                <euc:EformCheckBoxList DropDown="true" DropDownTextWidth="150px"  Width="200px" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcApproach_16" TABLE="Procedures" FIELD="ProcApproach" >
                    <asp:ListItem Value="Transoral" Text="Transoral" />
                    <asp:ListItem Value="Mandibulotomy" Text="Mandibulotomy" />
                    <asp:ListItem Value="Sublabial" Text="Sublabial" />
                    <asp:ListItem Value="Transpalatal" Text="Transpalatal" />
                    <asp:ListItem Value="Upper Lip Split" Text="Upper Lip Split" />
                    <asp:ListItem Value="Lower Lip Split" Text="Lower Lip Split" />
                    <asp:ListItem Value="Visor Flap" Text="Visor Flap" />
                    <asp:ListItem Value="Transcervical" Text="Transcervical" />
                    <asp:ListItem Value="Transpharyngeal" Text="Transpharyngeal" />
                    <asp:ListItem Value="Lateral Pharyngotomy" Text="Lateral Pharyngotomy" />
                    <asp:ListItem Value="Cheek Flap" Text="Cheek Flap" />
               </euc:EformCheckBoxList></td>
                
                          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_16b"  runat="server"/></td>
        
        </tr>

        
</table>

<br /><br />

<span class="controlBoxTitle">Type of Reconstruction</span>
<table cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" >

           <tr >
                <td>
                    <euc:EformDropDownList Width="200px" RecordId="16" ParentRecordId="16"  TABLE="HeadNeckProc" FIELD="ProcReconstruction" ID="ProcReconstruction_16" runat="server" LookupCode="HeadNeckReconstruction" ShowEmptyListItem="true" /></td>
           </tr>

</table>

<br /><br />
<span class="controlBoxTitle">Procedure Findings</span>
<table cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue" >

           <tr >
                <td>
                    <strong>Soft Tissue Resection Details: </strong></td>
                    
               <td align="left" style="white-space: nowrap;">                		    
			    
                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="1" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_1" Text="Lateral Tongue" Value="Lateral Tongue" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_1_Text" runat="server" RecordId="1" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_1" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_1"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_1"     Runat="server"/>
				<br /><br />
 
                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="2" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_2" Text="Ventral Tongue" Value="Ventral Tongue" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_2_Text" runat="server" RecordId="2" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_2" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_2"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_2"     Runat="server"/>
				<br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="3" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_3" Text="Dorsal Tongue" Value="Dorsal Tongue" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_3_Text" runat="server" RecordId="3" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_3" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_3"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_3"     Runat="server"/>
				<br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="4" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_4" Text="Tongue NOS" Value="Tongue NOS" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_4_Text" runat="server" RecordId="4" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_4" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_4"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_4"     Runat="server"/>
				<br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="5" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_5" Text="Floor of Mouth" Value="Floor of Mouth" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_5_Text" runat="server" RecordId="5" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="5" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_5" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="5" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_5"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="5" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_5"     Runat="server"/>
				<br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="6" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_6" Text="Upper Gum" Value="Upper Gum" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_6_Text" runat="server" RecordId="6" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="6" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_6" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="6" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_6"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="6" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_6"     Runat="server"/>
				<br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="7" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_7" Text="Lower Gum" Value="Lower Gum" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_7_Text" runat="server" RecordId="7" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="7" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_7" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="7" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_7"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="7" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_7"     Runat="server"/>
				<br /><br />


                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="8" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_8" Text="Hard Palate" Value="Hard Palate" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_8_Text" runat="server" RecordId="8" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="8" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_8" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="8" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_8"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="8" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_8"     Runat="server"/>
				<br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="9" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_9" Text="Retromoloar Trigone" Value="Retromoloar Trigone" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_9_Text" runat="server" RecordId="9" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="9" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_9" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="9" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_9"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="9" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_9"     Runat="server"/>
				<br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="10" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_10" Text="Buccal Mucosa" Value="Buccal Mucosa" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_10_Text" runat="server" RecordId="10" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="10" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_10" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="10" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_10"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="10" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_10"     Runat="server"/>
				<br /><br />

                <strong>Other:&nbsp;</strong>
                <euc:EformTextBox style="white-space: nowrap;"  RecordId="11" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_11" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_11_Text" runat="server" RecordId="11" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_11" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="11" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_11"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="11" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_11"     Runat="server"/></td>


           </tr>
           
           <tr><td colspan="2" class="controlBoxDataGridTitleColumn">&nbsp;</td></tr>
            
           <tr>
                <td>
                    <strong>Bone Resection Details: </strong></td>

                <td align="left" style="white-space: nowrap;">  

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="12" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_12" Text="Partial Maxillectomy" Value="Partial Maxillectomy" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_12_Text" runat="server" RecordId="12" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_12" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="12" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_12"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="12" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_12"     Runat="server"/>
				<br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="13" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_13" Text="Marginal Mandibulectomy" Value="Marginal Mandibulectomy" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_13_Text" runat="server" RecordId="13" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_13" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="13" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_13"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="13" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_13"     Runat="server"/><br /><br />
 
               <euc:EformCheckBox style="white-space: nowrap;"  RecordId="14" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_14" Text="Segmental Mandibulectomy" Value="Segmental Mandibulectomy" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_14_Text" runat="server" RecordId="14" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_14" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_14"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_14"     Runat="server"/>
				<br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="15" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_15" Text="Total Mandibulectomy" Value="Total Mandibulectomy" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_15_Text" runat="server" RecordId="15" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_15" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_15"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_15"     Runat="server"/>
				<br /><br />

                <strong>Other:&nbsp;</strong>
                <euc:EformTextBox style="white-space: nowrap;"  RecordId="16" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_16" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_16_Text" runat="server" RecordId="16" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="16" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_16" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="16" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_16"     Runat="server"/>
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="16" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_16"     Runat="server"/></td>
          
           </tr>
           
           <tr><td colspan="2" class="controlBoxDataGridTitleColumn">&nbsp;</td></tr>
           
            <tr>
                <td>
                    <strong>Surgical Margin ?</strong></td>
                <td height="28">
                    Primary Dimension of Margin: 
                    <euc:EformTextBox Width="50px" RecordId="17" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindPrimaryDimension"     ID="ProcFindPrimaryDimension_17"     Runat="server"/>
                    
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="17" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_17" Runat="server" />
				    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="17" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_17"     Runat="server"/>
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="17" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_17" Runat="server" />
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="17" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindDissection"     ID="ProcFindDissection_17"     Runat="server"/>
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="17" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"     ID="ProcFinding_17_Text"     Runat="server"/>
                   
                </td>
            </tr>
            <tr>
                <td>
                    <strong>&nbsp;</strong></td>
                 <td height="28">
                    Frozen Section: 
                    <euc:EformDropDownList Width="120px" RecordId="17" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindFrozen"     ID="ProcFindFrozen_17"     Runat="server" ShowEmptyListItem="true">
                        <asp:ListItem Value="" Text="" />
                        <asp:ListItem Value="Negative" Text="Negative" />
                        <asp:ListItem Value="Positive" Text="Positive" />
                        <asp:ListItem Value="Carcinoma In Situ" Text="Carcinoma In Situ" />
                        <asp:ListItem Value="Dysplasia" Text="Dysplasia" />
                        <asp:ListItem Value="Unknown" Text="Unknown" />
                    </euc:EformDropDownList>
                </td>
               
            </tr>
</table>

<br /><br />

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle">Reconstructive Procedures ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ReconProcRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="ReconProcRecorded">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>
        </td>
    </tr>
</table>
<br /><br />

<div id="ReconProcDiv" runat="server" style="display: none;">
<table cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" >

    <tr>
         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="17" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_17" Text="Skin Graft" Value="Skin Graft" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="16"  ID="ProcDateText_17" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="16"  ID="ProcDate_17" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="16"  ID="ProcSurgeon_17" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="16"  ID="ProcSite_17" TABLE="Procedures" FIELD="ProcSite" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="16"  ID="ProcQuality_17" TABLE="Procedures" FIELD="ProcQuality" /></td>		    		    

         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="18" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_18" Text="Local Pedical Flap" Value="Local Pedical Flap" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="18" ParentRecordId="16"  ID="ProcDateText_18" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="18" ParentRecordId="16"  ID="ProcDate_18" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="18" ParentRecordId="16"  ID="ProcSurgeon_18" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="18" ParentRecordId="16"  ID="ProcSite_18" TABLE="Procedures" FIELD="ProcSite" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="18" ParentRecordId="16"  ID="ProcQuality_18" TABLE="Procedures" FIELD="ProcQuality" /></td>		    		    

         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="19" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_19" Text="Regional Pedical Flap" Value="Regional Pedical Flap" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ParentRecordId="16"  ID="ProcDateText_19" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ParentRecordId="16"  ID="ProcDate_19" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ParentRecordId="16"  ID="ProcSurgeon_19" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ParentRecordId="16"  ID="ProcSite_19" TABLE="Procedures" FIELD="ProcSite" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="19" ParentRecordId="16"  ID="ProcQuality_19" TABLE="Procedures" FIELD="ProcQuality" /></td>		    		    

    </tr>
    <tr>
         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="20" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_20" Text="Radial Forearm Free Flap" Value="Radial Forearm Free Flap" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="20" ParentRecordId="16"  ID="ProcDateText_20" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="20" ParentRecordId="16"  ID="ProcDate_20" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="20" ParentRecordId="16"  ID="ProcSurgeon_20" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="20" ParentRecordId="16"  ID="ProcSite_20" TABLE="Procedures" FIELD="ProcSite" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="20" ParentRecordId="16"  ID="ProcQuality_20" TABLE="Procedures" FIELD="ProcQuality" /></td>		    		    

         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="21" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_21" Text="Rectus Abdominis Free Flap" Value="Rectus Abdominis Free Flap" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="21" ParentRecordId="16"  ID="ProcDateText_21" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="21" ParentRecordId="16"  ID="ProcDate_21" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="21" ParentRecordId="16"  ID="ProcSurgeon_21" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="21" ParentRecordId="16"  ID="ProcSite_21" TABLE="Procedures" FIELD="ProcSite" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="21" ParentRecordId="16"  ID="ProcQuality_21" TABLE="Procedures" FIELD="ProcQuality" /></td>		    		    

         <td align="left" style="white-space: nowrap;">  
                <strong>Other: </strong>           		    			    
                <euc:EformTextBox Width="100px" RecordId="22" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_22" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="22" ParentRecordId="16"  ID="ProcDateText_22" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="22" ParentRecordId="16"  ID="ProcDate_22" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="22" ParentRecordId="16"  ID="ProcSurgeon_22" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="22" ParentRecordId="16"  ID="ProcSite_22" TABLE="Procedures" FIELD="ProcSite" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="22" ParentRecordId="16"  ID="ProcQuality_22" TABLE="Procedures" FIELD="ProcQuality" /></td>		    		    
 
    </tr>
</table>

<br /><br />
</div>

<span class="controlBoxTitle">Other Procedures</span>
<table cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue" id="OtherProceduresHtmlTable" >
        <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Procedure</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Site</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Side</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Subsite</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" ></td>
        </tr>

    <tr>
         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="23" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_23" LookupCode="ProcName,Disease,HeadNeck" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="23" ParentRecordId="16"  ID="ProcDateText_23" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="23" ParentRecordId="16"  ID="ProcDate_23" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="23" ParentRecordId="16"  ID="ProcSurgeon_23" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="23" ParentRecordId="16"  ID="ProcQuality_23" TABLE="Procedures" FIELD="ProcQuality" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="23" ParentRecordId="16"  ID="ProcSite_23" TABLE="Procedures" FIELD="ProcSite" LookupCode="DxTarget,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="23" ParentRecordId="16"  ID="ProcSide_23" TABLE="Procedures" FIELD="ProcSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="23" ParentRecordId="16"  ID="ProcSubsite_23" TABLE="Procedures" FIELD="ProcSubsite" LookupCode="DxTarget,Disease,HeadNeck"/></td>
                 
    </tr>
    <tr style="display: none; ">
         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="24" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_24" LookupCode="ProcName,Disease,HeadNeck" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="24" ParentRecordId="16"  ID="ProcDateText_24" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="24" ParentRecordId="16"  ID="ProcDate_24" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="24" ParentRecordId="16"  ID="ProcSurgeon_24" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="24" ParentRecordId="16"  ID="ProcQuality_24" TABLE="Procedures" FIELD="ProcQuality" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="24" ParentRecordId="16"  ID="ProcSite_24" TABLE="Procedures" FIELD="ProcSite" LookupCode="DxTarget,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="24" ParentRecordId="16"  ID="ProcSide_24" TABLE="Procedures" FIELD="ProcSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="24" ParentRecordId="16"  ID="ProcSubsite_24" TABLE="Procedures" FIELD="ProcSubsite" LookupCode="DxTarget,Disease,HeadNeck"/></td>
                 
    </tr>
    <tr style="display: none; ">
         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="25" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_25" LookupCode="ProcName,Disease,HeadNeck" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="25" ParentRecordId="16"  ID="ProcDateText_25" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="25" ParentRecordId="16"  ID="ProcDate_25" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="25" ParentRecordId="16"  ID="ProcSurgeon_25" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="25" ParentRecordId="16"  ID="ProcQuality_25" TABLE="Procedures" FIELD="ProcQuality" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="25" ParentRecordId="16"  ID="ProcSite_25" TABLE="Procedures" FIELD="ProcSite" LookupCode="DxTarget,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="25" ParentRecordId="16"  ID="ProcSide_25" TABLE="Procedures" FIELD="ProcSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="25" ParentRecordId="16"  ID="ProcSubsite_25" TABLE="Procedures" FIELD="ProcSubsite" LookupCode="DxTarget,Disease,HeadNeck"/></td>
                 
    </tr>    
    <tr style="display: none; ">
         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="26" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_26" LookupCode="ProcName,Disease,HeadNeck" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="26" ParentRecordId="16"  ID="ProcDateText_26" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="26" ParentRecordId="16"  ID="ProcDate_26" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="26" ParentRecordId="16"  ID="ProcSurgeon_26" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="26" ParentRecordId="16"  ID="ProcQuality_26" TABLE="Procedures" FIELD="ProcQuality" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="26" ParentRecordId="16"  ID="ProcSite_26" TABLE="Procedures" FIELD="ProcSite" LookupCode="DxTarget,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="26" ParentRecordId="16"  ID="ProcSide_26" TABLE="Procedures" FIELD="ProcSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="26" ParentRecordId="16"  ID="ProcSubsite_26" TABLE="Procedures" FIELD="ProcSubsite" LookupCode="DxTarget,Disease,HeadNeck"/></td>
                 
    </tr>
    <tr style="display: none; ">
         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="27" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_27" LookupCode="ProcName,Disease,HeadNeck" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="27" ParentRecordId="16"  ID="ProcDateText_27" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="27" ParentRecordId="16"  ID="ProcDate_27" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="27" ParentRecordId="16"  ID="ProcSurgeon_27" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="27" ParentRecordId="16"  ID="ProcQuality_27" TABLE="Procedures" FIELD="ProcQuality" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="27" ParentRecordId="16"  ID="ProcSite_27" TABLE="Procedures" FIELD="ProcSite" LookupCode="DxTarget,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="27" ParentRecordId="16"  ID="ProcSide_27" TABLE="Procedures" FIELD="ProcSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="27" ParentRecordId="16"  ID="ProcSubsite_27" TABLE="Procedures" FIELD="ProcSubsite" LookupCode="DxTarget,Disease,HeadNeck"/></td>
                 
    </tr>
    <tr style="display: none; ">
         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="28" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_28" LookupCode="ProcName,Disease,HeadNeck" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="28" ParentRecordId="16"  ID="ProcDateText_28" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="28" ParentRecordId="16"  ID="ProcDate_28" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="28" ParentRecordId="16"  ID="ProcSurgeon_28" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="28" ParentRecordId="16"  ID="ProcQuality_28" TABLE="Procedures" FIELD="ProcQuality" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="28" ParentRecordId="16"  ID="ProcSite_28" TABLE="Procedures" FIELD="ProcSite" LookupCode="DxTarget,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="28" ParentRecordId="16"  ID="ProcSide_28" TABLE="Procedures" FIELD="ProcSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="28" ParentRecordId="16"  ID="ProcSubsite_28" TABLE="Procedures" FIELD="ProcSubsite" LookupCode="DxTarget,Disease,HeadNeck"/></td>
                 
    </tr>
    <tr style="display: none; ">
         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="29" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_29" LookupCode="ProcName,Disease,HeadNeck" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="29" ParentRecordId="16"  ID="ProcDateText_29" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="29" ParentRecordId="16"  ID="ProcDate_29" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="29" ParentRecordId="16"  ID="ProcSurgeon_29" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="29" ParentRecordId="16"  ID="ProcQuality_29" TABLE="Procedures" FIELD="ProcQuality" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="29" ParentRecordId="16"  ID="ProcSite_29" TABLE="Procedures" FIELD="ProcSite" LookupCode="DxTarget,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="29" ParentRecordId="16"  ID="ProcSide_29" TABLE="Procedures" FIELD="ProcSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="29" ParentRecordId="16"  ID="ProcSubsite_29" TABLE="Procedures" FIELD="ProcSubsite" LookupCode="DxTarget,Disease,HeadNeck"/></td>
                 
    </tr>
    <tr style="display: none; ">
         <td align="left" style="white-space: nowrap;">             		    			    
                <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="30" ParentRecordId="16"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_30" LookupCode="ProcName,Disease,HeadNeck" runat="server" />		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="30" ParentRecordId="16"  ID="ProcDateText_30" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="30" ParentRecordId="16"  ID="ProcDate_30" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="30" ParentRecordId="16"  ID="ProcSurgeon_30" TABLE="Procedures" FIELD="ProcSurgeon" />
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="30" ParentRecordId="16"  ID="ProcQuality_30" TABLE="Procedures" FIELD="ProcQuality" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="30" ParentRecordId="16"  ID="ProcSite_30" TABLE="Procedures" FIELD="ProcSite" LookupCode="DxTarget,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="30" ParentRecordId="16"  ID="ProcSide_30" TABLE="Procedures" FIELD="ProcSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
         <td align="left" style="white-space: nowrap;">   
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="30" ParentRecordId="16"  ID="ProcSubsite_30" TABLE="Procedures" FIELD="ProcSubsite" LookupCode="DxTarget,Disease,HeadNeck"/></td>
                 
    </tr>
 </table>  	    
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OtherProceduresHtmlTable');" />
           	    


<br/><br/><br/>

  <script type="text/javascript">

    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_1.ClientID %>'),$('<%= ProcFinding_1_Text.ClientID %>'),$('<%= ProcFindSide_1.ClientID %>'),$('<%= ProcFindSite_1.ClientID %>'),$('<%= ProcFindDissection_1.ClientID %>'),'Soft Tissue Resection Details');
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_2.ClientID %>'),$('<%= ProcFinding_2_Text.ClientID %>'),$('<%= ProcFindSide_2.ClientID %>'),$('<%= ProcFindSite_2.ClientID %>'),$('<%= ProcFindDissection_2.ClientID %>'),'Soft Tissue Resection Details');
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_3.ClientID %>'),$('<%= ProcFinding_3_Text.ClientID %>'),$('<%= ProcFindSide_3.ClientID %>'),$('<%= ProcFindSite_3.ClientID %>'),$('<%= ProcFindDissection_3.ClientID %>'),'Soft Tissue Resection Details');
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_4.ClientID %>'),$('<%= ProcFinding_4_Text.ClientID %>'),$('<%= ProcFindSide_4.ClientID %>'),$('<%= ProcFindSite_4.ClientID %>'),$('<%= ProcFindDissection_4.ClientID %>'),'Soft Tissue Resection Details');
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_5.ClientID %>'),$('<%= ProcFinding_5_Text.ClientID %>'),$('<%= ProcFindSide_5.ClientID %>'),$('<%= ProcFindSite_5.ClientID %>'),$('<%= ProcFindDissection_5.ClientID %>'),'Soft Tissue Resection Details');
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_6.ClientID %>'),$('<%= ProcFinding_6_Text.ClientID %>'),$('<%= ProcFindSide_6.ClientID %>'),$('<%= ProcFindSite_6.ClientID %>'),$('<%= ProcFindDissection_6.ClientID %>'),'Soft Tissue Resection Details');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_7.ClientID %>'),$('<%= ProcFinding_7_Text.ClientID %>'),$('<%= ProcFindSide_7.ClientID %>'),$('<%= ProcFindSite_7.ClientID %>'),$('<%= ProcFindDissection_7.ClientID %>'),'Soft Tissue Resection Details');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_8.ClientID %>'),$('<%= ProcFinding_8_Text.ClientID %>'),$('<%= ProcFindSide_8.ClientID %>'),$('<%= ProcFindSite_8.ClientID %>'),$('<%= ProcFindDissection_8.ClientID %>'),'Soft Tissue Resection Details');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_9.ClientID %>'),$('<%= ProcFinding_9_Text.ClientID %>'),$('<%= ProcFindSide_9.ClientID %>'),$('<%= ProcFindSite_9.ClientID %>'),$('<%= ProcFindDissection_9.ClientID %>'),'Soft Tissue Resection Details');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_10.ClientID %>'),$('<%= ProcFinding_10_Text.ClientID %>'),$('<%= ProcFindSide_10.ClientID %>'),$('<%= ProcFindSite_10.ClientID %>'),$('<%= ProcFindDissection_10.ClientID %>'),'Soft Tissue Resection Details');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_11.ClientID %>'),$('<%= ProcFinding_11_Text.ClientID %>'),$('<%= ProcFindSide_11.ClientID %>'),$('<%= ProcFindSite_11.ClientID %>'),$('<%= ProcFindDissection_11.ClientID %>'),'Soft Tissue Resection Details');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>',$('<%= ProcSubsite_16.ClientID %>')),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_12.ClientID %>'),$('<%= ProcFinding_12_Text.ClientID %>'),$('<%= ProcFindSide_12.ClientID %>'),$('<%= ProcFindSite_12.ClientID %>'),$('<%= ProcFindDissection_12.ClientID %>'),'Bone Resection Details');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_13.ClientID %>'),$('<%= ProcFinding_13_Text.ClientID %>'),$('<%= ProcFindSide_13.ClientID %>'),$('<%= ProcFindSite_13.ClientID %>'),$('<%= ProcFindDissection_13.ClientID %>'),'Bone Resection Details');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_14.ClientID %>'),$('<%= ProcFinding_14_Text.ClientID %>'),$('<%= ProcFindSide_14.ClientID %>'),$('<%= ProcFindSite_14.ClientID %>'),$('<%= ProcFindDissection_14.ClientID %>'),'Bone Resection Details');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_15.ClientID %>'),$('<%= ProcFinding_15_Text.ClientID %>'),$('<%= ProcFindSide_15.ClientID %>'),$('<%= ProcFindSite_15.ClientID %>'),$('<%= ProcFindDissection_15.ClientID %>'),'Bone Resection Details');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_16.ClientID %>'),$('<%= ProcFinding_16_Text.ClientID %>'),$('<%= ProcFindSide_16.ClientID %>'),$('<%= ProcFindSite_16.ClientID %>'),$('<%= ProcFindDissection_16.ClientID %>'),'Bone Resection Details');
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcApproach_16.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= ProcFindSubsite_17.ClientID %>'),$('<%= ProcFinding_17_Text.ClientID %>'),$('<%= ProcFindSide_17.ClientID %>'),$('<%= ProcFindSite_17.ClientID %>'),$('<%= ProcFindDissection_17.ClientID %>'),'Margin Details');  
    
    function addAbsentEvent(opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue)
    {  
        $(opDateText).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));
        $(admitDatText).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));
        $(dischargeDateText).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));
        $(opCaseSurgeon).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));
        $(procApproach).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));
        $(procName).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));
        $(procSide).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));
        $(procSubsite).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));
        $(procApproach).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));
        

        if (findingValue == 'Soft Tissue Resection Details' || findingValue == 'Bone Resection Details')
        {

            if (findingSubsite.type == 'checkbox')
                  $(findingSubsite).addEvent('click',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));
            else if (findingSubsite.type == 'text')
                  $(findingSubsite).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));

        } 
        else if (findingValue == 'Margin Details')
        {
            var findingPrimDim = document.getElementById('<%= ProcFindPrimaryDimension_17.ClientID %>');

            $(findingPrimDim).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue));
        } 
             

    }

     
	function SetHiddenFields(opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procApproach,procName,pathSpecimenType,procSite,procSide,procSubsite,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubsiteHidden,pathQualityHidden,findingSubsite,findingFind,findingSide,findingSite,findingDissection,findingValue)
    {      


        if (opDateText.value != '' || admitDatText.value != '' || dischargeDateText.value != '' || opCaseSurgeon.value != '' || procApproach.value != '' || procName.value != '' || procSite.value != '' || procSide.value != '' )
        { 
            procDateTextHidden.value = opDateText.value;
            procDateHidden.value = opDate.value;
            procSurgeonHidden.value = opCaseSurgeon.value;
            procPrimaryHidden.value = '1';
            procSite.value = 'Oral Cavity';
           
            pathDateTextHidden.value = opDateText.value;
            pathDateHidden.value = opDate.value;           
            pathSpecimenType.value = procName.value;
            pathSiteHidden.value = procSite.value;
            pathSideHidden.value = procSide.value;
            pathSubsiteHidden.value = procSubsite.value;
                                         
            opQualityHidden.value = 'STD';
            procQualityHidden.value = 'STD';
            pathQualityHidden.value = 'STD';
                                                                                                                                                
        }
        else
        { 
            procDateTextHidden.value ='';
            procDateHidden.value = '';
            procSurgeonHidden.value ='';
            procPrimaryHidden.value = '';
            
            pathDateTextHidden.value = '';
            pathDateHidden.value = '';            
            pathSpecimenType.value = '';
            pathSiteHidden.value = '';
            pathSideHidden.value = '';
                              
            opQualityHidden.value = '';
            procQualityHidden.value = '';
            pathQualityHidden.value = '';     
        }
        
        var temp = '';
        if (findingValue == 'Soft Tissue Resection Details' || findingValue == 'Bone Resection Details')
        {
            if (findingSubsite.type == 'checkbox' && findingSubsite.checked)
                temp = 'checked';
            else if (findingSubsite.type == 'text')
                temp = findingSubsite.value;
                
            if (temp != '')
            {
                findingSide.value = procSide.value;
                findingSite.value = procSite.value;
                findingFind.value = findingValue;
                findingDissection.value = 'Yes';
            }
            else
            {
                findingSide.value = '';
                findingSite.value = '';
                findingFind.value = '';
                findingDissection.value = '';
            }
        }
        else if (findingValue == 'Margin Details')
        {
            var findingPrimDim = document.getElementById('<%= ProcFindPrimaryDimension_17.ClientID %>');
            
            if (findingPrimDim.value != '')
            {
                findingSide.value = procSide.value;
                findingSite.value = procSite.value;
                findingFind.value = findingValue;
                findingSubsite.value = 'Surgical Margin';
            }            
            else
            {
                findingSide.value = '';
                findingSite.value = '';
                findingFind.value = '';
                findingSubsite.value = '';
            }            
        }
        
    }	
    
    
    /*************************************************/
    /*************************************************       RECONSTRUCTION PROCEDURES /
    /*************************************************/

    addAbsentEvent2($('<%= ReconProcRecorded.ClientID %>'), $('<%= ReconProcDiv.ClientID %>'),$('<%= OpDateText_16.ClientID %>'), $('<%= OpDate_16.ClientID %>'), $('<%= OpAdmitDateText_16.ClientID %>'), $('<%= OpAdmitDate_16.ClientID %>'), $('<%= OpDischargeDateText_16.ClientID %>'), $('<%= OpDischargeDate_16.ClientID %>'), $('<%= OpQuality_16.ClientID %>'), $('<%= OpCaseSurgeon_16.ClientID %>'), $('<%= ProcDateText_17.ClientID %>'), $('<%= ProcDate_17.ClientID %>'), $('<%= ProcSurgeon_17.ClientID %>'), $('<%= ProcSite_17.ClientID %>'), $('<%= ProcQuality_17.ClientID %>'), $('<%= ProcName_17.ClientID %>'), 'Skin Graft');
    addAbsentEvent2($('<%= ReconProcRecorded.ClientID %>'), $('<%= ReconProcDiv.ClientID %>'), $('<%= OpDateText_16.ClientID %>'), $('<%= OpDate_16.ClientID %>'), $('<%= OpAdmitDateText_16.ClientID %>'), $('<%= OpAdmitDate_16.ClientID %>'), $('<%= OpDischargeDateText_16.ClientID %>'), $('<%= OpDischargeDate_16.ClientID %>'), $('<%= OpQuality_16.ClientID %>'), $('<%= OpCaseSurgeon_16.ClientID %>'), $('<%= ProcDateText_18.ClientID %>'), $('<%= ProcDate_18.ClientID %>'), $('<%= ProcSurgeon_18.ClientID %>'), $('<%= ProcSite_18.ClientID %>'), $('<%= ProcQuality_18.ClientID %>'), $('<%= ProcName_18.ClientID %>'), 'Local Pedical Flap');
    addAbsentEvent2($('<%= ReconProcRecorded.ClientID %>'), $('<%= ReconProcDiv.ClientID %>'), $('<%= OpDateText_16.ClientID %>'), $('<%= OpDate_16.ClientID %>'), $('<%= OpAdmitDateText_16.ClientID %>'), $('<%= OpAdmitDate_16.ClientID %>'), $('<%= OpDischargeDateText_16.ClientID %>'), $('<%= OpDischargeDate_16.ClientID %>'), $('<%= OpQuality_16.ClientID %>'), $('<%= OpCaseSurgeon_16.ClientID %>'), $('<%= ProcDateText_19.ClientID %>'), $('<%= ProcDate_19.ClientID %>'), $('<%= ProcSurgeon_19.ClientID %>'), $('<%= ProcSite_19.ClientID %>'), $('<%= ProcQuality_19.ClientID %>'), $('<%= ProcName_19.ClientID %>'), 'Regional Pedical Flap');
    addAbsentEvent2($('<%= ReconProcRecorded.ClientID %>'), $('<%= ReconProcDiv.ClientID %>'), $('<%= OpDateText_16.ClientID %>'), $('<%= OpDate_16.ClientID %>'), $('<%= OpAdmitDateText_16.ClientID %>'), $('<%= OpAdmitDate_16.ClientID %>'), $('<%= OpDischargeDateText_16.ClientID %>'), $('<%= OpDischargeDate_16.ClientID %>'), $('<%= OpQuality_16.ClientID %>'), $('<%= OpCaseSurgeon_16.ClientID %>'), $('<%= ProcDateText_20.ClientID %>'), $('<%= ProcDate_20.ClientID %>'), $('<%= ProcSurgeon_20.ClientID %>'), $('<%= ProcSite_20.ClientID %>'), $('<%= ProcQuality_20.ClientID %>'), $('<%= ProcName_20.ClientID %>'), 'Radial Forearm Free Flap');
    addAbsentEvent2($('<%= ReconProcRecorded.ClientID %>'), $('<%= ReconProcDiv.ClientID %>'), $('<%= OpDateText_16.ClientID %>'), $('<%= OpDate_16.ClientID %>'), $('<%= OpAdmitDateText_16.ClientID %>'), $('<%= OpAdmitDate_16.ClientID %>'), $('<%= OpDischargeDateText_16.ClientID %>'), $('<%= OpDischargeDate_16.ClientID %>'), $('<%= OpQuality_16.ClientID %>'), $('<%= OpCaseSurgeon_16.ClientID %>'), $('<%= ProcDateText_21.ClientID %>'), $('<%= ProcDate_21.ClientID %>'), $('<%= ProcSurgeon_21.ClientID %>'), $('<%= ProcSite_21.ClientID %>'), $('<%= ProcQuality_21.ClientID %>'), $('<%= ProcName_21.ClientID %>'), 'Rectus Abdominis Free Flap');
    addAbsentEvent2($('<%= ReconProcRecorded.ClientID %>'), $('<%= ReconProcDiv.ClientID %>'), $('<%= OpDateText_16.ClientID %>'), $('<%= OpDate_16.ClientID %>'), $('<%= OpAdmitDateText_16.ClientID %>'), $('<%= OpAdmitDate_16.ClientID %>'), $('<%= OpDischargeDateText_16.ClientID %>'), $('<%= OpDischargeDate_16.ClientID %>'), $('<%= OpQuality_16.ClientID %>'), $('<%= OpCaseSurgeon_16.ClientID %>'), $('<%= ProcDateText_22.ClientID %>'), $('<%= ProcDate_22.ClientID %>'), $('<%= ProcSurgeon_22.ClientID %>'), $('<%= ProcSite_22.ClientID %>'), $('<%= ProcQuality_22.ClientID %>'), $('<%= ProcName_22.ClientID %>'), $('<%= ProcName_22.ClientID %>').value);

    function addAbsentEvent2(reconProcRecordedID,reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue)
    {
        $(reconProcRecordedID).addEvent('click', curry(ReconProcYesNo, reconProcRecordedID, reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue));
        $(opDateText).addEvent('blur', curry(ReconProcYesNo, reconProcRecordedID, reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue));
        $(admitDatText).addEvent('blur', curry(ReconProcYesNo, reconProcRecordedID, reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue));
        $(dischargeDateText).addEvent('blur', curry(ReconProcYesNo, reconProcRecordedID, reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue));
        $(opCaseSurgeon).addEvent('blur', curry(ReconProcYesNo, reconProcRecordedID, reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue));

        if (procName.type == 'checkbox')
            $(procName).addEvent('click', curry(ReconProcYesNo, reconProcRecordedID, reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue));
        else if (procName.type == 'text')
            $(procName).addEvent('blur', curry(ReconProcYesNo, reconProcRecordedID, reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue));
    
        ReconProcYesNo(reconProcRecordedID, reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue);
    }

    function ReconProcYesNo(reconProcRecordedID, reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue) {
        var ReconProcRecordedRef = reconProcRecordedID.getElementsByTagName('input');

        for (var i = 0; i < ReconProcRecordedRef.length; i++)
            if (ReconProcRecordedRef[i].checked) {
                ReconProcRadioClick(ReconProcRecordedRef[i].value, reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue);
        }
    }

    function ReconProcRadioClick(reconProcoption_value, reconProcDivID, opDateText, opDate, admitDatText, admitDate, dischargeDateText, dischargeDate, opQualityHidden, opCaseSurgeon, procDateTextHidden, procDateHidden, procSurgeonHidden, procSiteHidden, procQualityHidden, procName, procNameValue)
    {

        if (reconProcoption_value == "Yes") 
        {
            reconProcDivID.style.display = '';

            if (procName.type == 'checkbox') {
                if (procName.checked) {
                    procDateTextHidden.value = opDateText.value;
                    procDateHidden.value = opDate.value;
                    procSurgeonHidden.value = opCaseSurgeon.value;
                    procSiteHidden.value = 'Oral Cavity';
                    procQualityHidden.value = 'STD';

                }
                else {
                    procDateTextHidden.value = '';
                    procDateHidden.value = '';
                    procSurgeonHidden.value = '';
                    procSiteHidden.value = '';
                    procQualityHidden.value = '';
                }
            }
            else if (procName.type == 'text') {
                if (procName.value != '') {
                    procDateTextHidden.value = opDateText.value;
                    procDateHidden.value = opDate.value;
                    procSurgeonHidden.value = opCaseSurgeon.value;
                    procSiteHidden.value = 'Oral Cavity';
                    procQualityHidden.value = 'STD';
                }
                else {
                    procDateTextHidden.value = '';
                    procDateHidden.value = '';
                    procSurgeonHidden.value = '';
                    procSiteHidden.value = '';
                    procQualityHidden.value = '';
                }

            }
        }
        else if (reconProcoption_value == "No" ) 
        {
            reconProcDivID.style.display = 'none';

            if (procName.type == 'checkbox')
                procName.checked = false;
            else if (procName.type == 'text')  
                procName.value = '';  
                
                procDateTextHidden.value = '';
                procDateHidden.value = '';
                procSurgeonHidden.value = '';
                procSiteHidden.value = '';
                procQualityHidden.value = '';
        }                  
    }	

     /*************************************************/
    /*************************************************       OTHER PROCEDURES /
    /*************************************************/

    addAbsentEvent3($('<%= OpDateText_16.ClientID %>'), $('<%= OpDate_16.ClientID %>'), $('<%= OpAdmitDateText_16.ClientID %>'), $('<%= OpAdmitDate_16.ClientID %>'), $('<%= OpDischargeDateText_16.ClientID %>'), $('<%= OpDischargeDate_16.ClientID %>'), $('<%= OpQuality_16.ClientID %>'), $('<%= OpCaseSurgeon_16.ClientID %>'), $('<%= ProcDateText_23.ClientID %>'), $('<%= ProcDate_23.ClientID %>'), $('<%= ProcSurgeon_23.ClientID %>'), $('<%= ProcSite_23.ClientID %>'), $('<%= ProcSide_23.ClientID %>'), $('<%= ProcSubsite_23.ClientID %>'), $('<%= ProcQuality_23.ClientID %>'), $('<%= ProcName_23.ClientID %>'));
    addAbsentEvent3($('<%= OpDateText_16.ClientID %>'), $('<%= OpDate_16.ClientID %>'), $('<%= OpAdmitDateText_16.ClientID %>'), $('<%= OpAdmitDate_16.ClientID %>'), $('<%= OpDischargeDateText_16.ClientID %>'), $('<%= OpDischargeDate_16.ClientID %>'), $('<%= OpQuality_16.ClientID %>'), $('<%= OpCaseSurgeon_16.ClientID %>'), $('<%= ProcDateText_24.ClientID %>'), $('<%= ProcDate_24.ClientID %>'), $('<%= ProcSurgeon_24.ClientID %>'), $('<%= ProcSite_24.ClientID %>'), $('<%= ProcSide_24.ClientID %>'), $('<%= ProcSubsite_24.ClientID %>'), $('<%= ProcQuality_24.ClientID %>'), $('<%= ProcName_24.ClientID %>'));  
    addAbsentEvent3($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_25.ClientID %>'),$('<%= ProcDate_25.ClientID %>'),$('<%= ProcSurgeon_25.ClientID %>'),$('<%= ProcSite_25.ClientID %>'),$('<%= ProcSide_25.ClientID %>'),$('<%= ProcSubsite_25.ClientID %>'),$('<%= ProcQuality_25.ClientID %>'),$('<%= ProcName_25.ClientID %>'));  
    addAbsentEvent3($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_26.ClientID %>'),$('<%= ProcDate_26.ClientID %>'),$('<%= ProcSurgeon_26.ClientID %>'),$('<%= ProcSite_26.ClientID %>'),$('<%= ProcSide_26.ClientID %>'),$('<%= ProcSubsite_26.ClientID %>'),$('<%= ProcQuality_26.ClientID %>'),$('<%= ProcName_26.ClientID %>'));  
    addAbsentEvent3($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_27.ClientID %>'),$('<%= ProcDate_27.ClientID %>'),$('<%= ProcSurgeon_27.ClientID %>'),$('<%= ProcSite_27.ClientID %>'),$('<%= ProcSide_27.ClientID %>'),$('<%= ProcSubsite_27.ClientID %>'),$('<%= ProcQuality_27.ClientID %>'),$('<%= ProcName_27.ClientID %>'));  
    addAbsentEvent3($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_28.ClientID %>'),$('<%= ProcDate_28.ClientID %>'),$('<%= ProcSurgeon_28.ClientID %>'),$('<%= ProcSite_28.ClientID %>'),$('<%= ProcSide_28.ClientID %>'),$('<%= ProcSubsite_28.ClientID %>'),$('<%= ProcQuality_28.ClientID %>'),$('<%= ProcName_28.ClientID %>'));  
    addAbsentEvent3($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_29.ClientID %>'),$('<%= ProcDate_29.ClientID %>'),$('<%= ProcSurgeon_29.ClientID %>'),$('<%= ProcSite_29.ClientID %>'),$('<%= ProcSide_29.ClientID %>'),$('<%= ProcSubsite_29.ClientID %>'),$('<%= ProcQuality_29.ClientID %>'),$('<%= ProcName_29.ClientID %>'));  
    addAbsentEvent3($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_30.ClientID %>'),$('<%= ProcDate_30.ClientID %>'),$('<%= ProcSurgeon_30.ClientID %>'),$('<%= ProcSite_30.ClientID %>'),$('<%= ProcSide_30.ClientID %>'),$('<%= ProcSubsite_30.ClientID %>'),$('<%= ProcQuality_30.ClientID %>'),$('<%= ProcName_30.ClientID %>'));  

    function addAbsentEvent3(opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procSite,procSide,procSubsite,procQualityHidden,procName)
    {  
        $(opDateText).addEvent('blur',curry(SetHiddenFields3,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procSite,procSide,procSubsite,procQualityHidden,procName));
        $(admitDatText).addEvent('blur',curry(SetHiddenFields3,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procSite,procSide,procSubsite,procQualityHidden,procName));
        $(dischargeDateText).addEvent('blur',curry(SetHiddenFields3,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procSite,procSide,procSubsite,procQualityHidden,procName));
        $(opCaseSurgeon).addEvent('blur',curry(SetHiddenFields3,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procSite,procSide,procSubsite,procQualityHidden,procName));
        $(procName).addEvent('blur',curry(SetHiddenFields3,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procSite,procSide,procSubsite,procQualityHidden,procName));
        $(procSite).addEvent('blur',curry(SetHiddenFields3,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procSite,procSide,procSubsite,procQualityHidden,procName));
        $(procSide).addEvent('blur',curry(SetHiddenFields3,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procSite,procSide,procSubsite,procQualityHidden,procName));
        $(procSubsite).addEvent('blur',curry(SetHiddenFields3,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procSite,procSide,procSubsite,procQualityHidden,procName));
    }

    
 	function SetHiddenFields3(opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procSite,procSide,procSubsite,procQualityHidden,procName)
    {      

            if (procName.value != '' || procSite.value != '' || procSide.value != '' ||  procSubsite.value != '')
            { 
                procDateTextHidden.value = opDateText.value;
                procDateHidden.value = opDate.value;
                procSurgeonHidden.value = opCaseSurgeon.value;                                                                  
                procQualityHidden.value = 'STD';
                                                                                                                                                    
            }
            else
            { 
                procDateTextHidden.value ='';
                procDateHidden.value = '';
                procSurgeonHidden.value ='';
                procQualityHidden.value = '';
            }                      
    }	
    
</script>
