<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandProcedurePrimary" CodeFile="SalivaryGlandProcedurePrimary.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="SalivaryGlandProcedurePrimary" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>


    <table cellpadding="5" cellspacing="0" class="ClinicalEformTable" >
        <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Admit Date</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Discharge Date</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Case Surgeon</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left">Indication</td>
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
          	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="16" ParentRecordId="16"  ID="PathSpecimenType_16" TABLE="Pathology" FIELD="PathSpecimenType" />
                <euc:EformTextBox Width="1px" style="display: none;"  Runat="server" RecordId="16" ParentRecordId="16" ID="PathSubsite_16" TABLE="Pathology" FIELD="PathSubsite"  />  		    
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
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="150px" Runat="server" RecordId="16" ParentRecordId="16" ID="ProcIndication_16" TABLE="Procedures" FIELD="ProcIndication" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
           	        <asp:ListItem Value="Primary Treatment" Text="Primary Treatment" />
           	        <asp:ListItem Value="Revision Surgery" Text="Revision Surgery" />                    
                </euc:EformDropDownList></td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_16a"  runat="server"/></td>
        </tr>
        

        <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Site</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Side</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" colspan="2">Subsite</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left" >Procedure Name</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" ></td>
        </tr>
        <tr>
             <td style="white-space: nowrap;" valign="top" >
           	    <euc:EformDropDownList Width="120px" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcSite_16" TABLE="Procedures" FIELD="ProcSite" ShowEmptyListItem="true" >
           	        <asp:ListItem></asp:ListItem>
           	        <asp:ListItem Value="Major Salivary Gland" Text="Major Salivary Gland" />
           	        <asp:ListItem Value="Minor Salivary Gland" Text="Minor Salivary Gland" />
           	    </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" valign="top">
                <euc:EformComboBox DropDownWidth="auto" Width="100px" Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcSide_16" TABLE="Procedures" FIELD="ProcSide"  LookupCode="OpSide,Disease,SalivaryCancer"/></td>
             <td style="white-space: nowrap;" colspan="2" >
                <euc:EformRadioButtonList Runat="server" RecordId="16" ParentRecordId="16"  ID="ProcSubsite_16" TABLE="Procedures" FIELD="ProcSubsite" RepeatLayout="Table" RepeatDirection="Vertical" RepeatColumns="1" ShowOther="true" >
                    <asp:ListItem Value="Parotid" Text="Parotid" />
                    <asp:ListItem Value="Submandibular" Text="Submandibular" />
                    <asp:ListItem Value="Sublingual" Text="Sublingual" />
                </euc:EformRadioButtonList></td>
             <td style="white-space: nowrap;" valign="top">            
                
                <div id="procNameHiddenOtherDIV_16" runat="server">
                    <euc:CaisisComboBox DropDownWidth="auto" Width="150px" ID="procNameHiddenOther_16"   LookupCode="ProcName,Disease,SalivaryCancer"   Runat="server" />                
                </div>
                <div id="procNameHiddenSubmandibularDIV_16" runat="server" style="display: none;">
                    <euc:CaisisSelect Width="170px" ID="procNameHiddenSubmandibular_16"   Runat="server" >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="Excision Submandibualr Gland" Text="Excision Submandibular Gland" ></asp:ListItem>
                        <asp:ListItem Value="Excision Submandibular Triangle" Text="Excision Submandibular Triangle" ></asp:ListItem>
                        <asp:ListItem Value="Extended Submandibular Excision" Text="Extended Submandibular Excision" ></asp:ListItem>                        
                    </euc:CaisisSelect>                
                </div>
                <div id="procNameHiddenParotidDIV_16" runat="server" style="display: none;">
                    <euc:CaisisSelect Width="150px" ID="procNameHiddenParotid_16"   Runat="server" >
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem Value="Superficial Parotidectomy" Text="Superficial Parotidectomy" ></asp:ListItem>
                        <asp:ListItem Value="Deep Lobe Parotidectomy" Text="Deep Lobe Parotidectomy" ></asp:ListItem>
                        <asp:ListItem Value="Total Parotidectomy" Text="Total Parotidectomy" ></asp:ListItem>                        
                        <asp:ListItem Value="Extended Parotidectomy" Text="Extended Parotidectomy" ></asp:ListItem>  
                    </euc:CaisisSelect>                
                </div>
                
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="16" ParentRecordId="16"   ID="procNameHidden_16" TABLE="Procedures" FIELD="ProcName" Runat="server"  />           
            </td>
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_16b"  runat="server"/></td>
        
        </tr>

        
</table>

<br /><br />

<span class="controlBoxTitle">Procedure Findings</span>
<table cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue" >

           <tr>
                <td>
                    <strong>Additional Structures Removed: </strong></td>
                    
               <td align="left" style="white-space: nowrap;">                		    
			    
                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="1" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_1" Text="Facial Nerve Main Trunk" Value="Facial Nerve Main Trunk" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_1_Text" runat="server" RecordId="1" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_1" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_1"     Runat="server"/><br /><br />
 
                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="2" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_2" Text="Facial Nerve Temporal Branch" Value="Facial Nerve Temporal Branch" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_2_Text" runat="server" RecordId="2" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_2" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_2"     Runat="server"/><br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="3" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_3" Text="Facial Nerve Zygomatic Branch" Value="Facial Nerve Zygomatic Branch" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_3_Text" runat="server" RecordId="3" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_3" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_3"     Runat="server"/><br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="4" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_4" Text="Facial Nerve Buccal Branch" Value="Facial Nerve Buccal Branch" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_4_Text" runat="server" RecordId="4" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_4" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_4"     Runat="server"/><br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="5" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_5" Text="Facial Nerve Marginal Mandibular Branch" Value="Facial Nerve Marginal Mandibular Branch" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_5_Text" runat="server" RecordId="5" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="5" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_5" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="5" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_5"     Runat="server"/><br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="6" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_6" Text="Facial Nerve Cervical" Value="Facial Nerve Cervical" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_6_Text" runat="server" RecordId="6" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="6" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_6" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="6" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_6"     Runat="server"/><br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="7" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_7" Text="Lingual Nerve" Value="Lingual Nerve" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_7_Text" runat="server" RecordId="7" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="7" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_7" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="7" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_7"     Runat="server"/><br /><br />


                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="8" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_8" Text="Skin" Value="Skin" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_8_Text" runat="server" RecordId="8" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="8" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_8" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="8" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_8"     Runat="server"/><br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="9" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_9" Text="Muscle" Value="Muscle" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_9_Text" runat="server" RecordId="9" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="9" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_9" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="9" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_9"     Runat="server"/><br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="10" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_10" Text="Cartilagenous Ear Canal" Value="Cartilagenous Ear Canal" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_10_Text" runat="server" RecordId="10" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="10" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_10" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="10" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_10"     Runat="server"/><br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="11" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_11" Text="Hypoglossal" Value="Hypoglossal" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_11_Text" runat="server" RecordId="11" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="11" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_11" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="11" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_11"     Runat="server"/><br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="12" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_12" Text="Mastoid" Value="Mastoid" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_12_Text" runat="server" RecordId="12" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="12" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_12" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="12" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_12"     Runat="server"/><br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="13" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_13" Text="Mandible" Value="Mandible" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_13_Text" runat="server" RecordId="13" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="13" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_13" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="13" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_13"     Runat="server"/><br /><br />

                <euc:EformCheckBox style="white-space: nowrap;"  RecordId="14" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_14" Text="Temporal Bone" Value="Temporal Bone" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_14_Text" runat="server" RecordId="14" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_14" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="14" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_14"     Runat="server"/><br /><br />

                <strong>Other:&nbsp;</strong>
                <euc:EformTextBox style="white-space: nowrap;"  RecordId="15" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_15" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_15_Text" runat="server" RecordId="15" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_15" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="15" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_15"     Runat="server"/></td>
          
           </tr>
           
            <tr>
                <td>
                    <strong>Facial Nerve Graft ?</strong></td>
                <td height="28">
                    <euc:EformRadioButtonList ID="ProcFinding_16_Text" runat="server" RecordId="16" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFinding" 
                        RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15" >
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </euc:EformRadioButtonList>
                    
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="16" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_16" Runat="server" />
				    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="16" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_16"     Runat="server"/>
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="16" ParentRecordId="16"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_16" Runat="server" />
                   
                </td>
            </tr>
</table>

<br/><br/><br/>

  <script type="text/javascript">

    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_1.ClientID %>'),$('<%= ProcFinding_1_Text.ClientID %>'),$('<%= ProcFindSide_1.ClientID %>'),$('<%= ProcFindSite_1.ClientID %>'),'Additional Structures Removed');
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_2.ClientID %>'),$('<%= ProcFinding_2_Text.ClientID %>'),$('<%= ProcFindSide_2.ClientID %>'),$('<%= ProcFindSite_2.ClientID %>'),'Additional Structures Removed');
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_3.ClientID %>'),$('<%= ProcFinding_3_Text.ClientID %>'),$('<%= ProcFindSide_3.ClientID %>'),$('<%= ProcFindSite_3.ClientID %>'),'Additional Structures Removed');
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_4.ClientID %>'),$('<%= ProcFinding_4_Text.ClientID %>'),$('<%= ProcFindSide_4.ClientID %>'),$('<%= ProcFindSite_4.ClientID %>'),'Additional Structures Removed');
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_5.ClientID %>'),$('<%= ProcFinding_5_Text.ClientID %>'),$('<%= ProcFindSide_5.ClientID %>'),$('<%= ProcFindSite_5.ClientID %>'),'Additional Structures Removed');
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_6.ClientID %>'),$('<%= ProcFinding_6_Text.ClientID %>'),$('<%= ProcFindSide_6.ClientID %>'),$('<%= ProcFindSite_6.ClientID %>'),'Additional Structures Removed');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_7.ClientID %>'),$('<%= ProcFinding_7_Text.ClientID %>'),$('<%= ProcFindSide_7.ClientID %>'),$('<%= ProcFindSite_7.ClientID %>'),'Additional Structures Removed');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_8.ClientID %>'),$('<%= ProcFinding_8_Text.ClientID %>'),$('<%= ProcFindSide_8.ClientID %>'),$('<%= ProcFindSite_8.ClientID %>'),'Additional Structures Removed');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_9.ClientID %>'),$('<%= ProcFinding_9_Text.ClientID %>'),$('<%= ProcFindSide_9.ClientID %>'),$('<%= ProcFindSite_9.ClientID %>'),'Additional Structures Removed');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_10.ClientID %>'),$('<%= ProcFinding_10_Text.ClientID %>'),$('<%= ProcFindSide_10.ClientID %>'),$('<%= ProcFindSite_10.ClientID %>'),'Additional Structures Removed');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_11.ClientID %>'),$('<%= ProcFinding_11_Text.ClientID %>'),$('<%= ProcFindSide_11.ClientID %>'),$('<%= ProcFindSite_11.ClientID %>'),'Additional Structures Removed');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_12.ClientID %>'),$('<%= ProcFinding_12_Text.ClientID %>'),$('<%= ProcFindSide_12.ClientID %>'),$('<%= ProcFindSite_12.ClientID %>'),'Additional Structures Removed');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_13.ClientID %>'),$('<%= ProcFinding_13_Text.ClientID %>'),$('<%= ProcFindSide_13.ClientID %>'),$('<%= ProcFindSite_13.ClientID %>'),'Additional Structures Removed');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_14.ClientID %>'),$('<%= ProcFinding_14_Text.ClientID %>'),$('<%= ProcFindSide_14.ClientID %>'),$('<%= ProcFindSite_14.ClientID %>'),'Additional Structures Removed');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_15.ClientID %>'),$('<%= ProcFinding_15_Text.ClientID %>'),$('<%= ProcFindSide_15.ClientID %>'),$('<%= ProcFindSite_15.ClientID %>'),'Additional Structures Removed');    
    addAbsentEvent($('<%= OpDateText_16.ClientID %>'),$('<%= OpDate_16.ClientID %>'),$('<%= OpAdmitDateText_16.ClientID %>'),$('<%= OpAdmitDate_16.ClientID %>'),$('<%= OpDischargeDateText_16.ClientID %>'),$('<%= OpDischargeDate_16.ClientID %>'),$('<%= OpQuality_16.ClientID %>'),$('<%= OpCaseSurgeon_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= ProcPrimary_16.ClientID %>'),$('<%= ProcQuality_16.ClientID %>'),$('<%= ProcIndication_16.ClientID %>'),$('<%= procNameHiddenOther_16.ClientID %>'),$('<%= procNameHiddenSubmandibular_16.ClientID %>'),$('<%= procNameHiddenParotid_16.ClientID %>'),$('<%= procNameHidden_16.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),$('<%= ProcSide_16.ClientID %>'),$('<%= ProcSubsite_16.ClientID %>'),$('<%= PathSpecimenType_16.ClientID %>'),$('<%= PathSite_16.ClientID %>'),$('<%= PathDateText_16.ClientID %>'),$('<%= PathDate_16.ClientID %>'),$('<%= PathSide_16.ClientID %>'),$('<%= PathSubsite_16.ClientID %>'),$('<%= PathQuality_16.ClientID %>'),$('<%= procNameHiddenOtherDIV_16.ClientID %>'),$('<%= procNameHiddenSubmandibularDIV_16.ClientID %>'),$('<%= procNameHiddenParotidDIV_16.ClientID %>'),$('<%= ProcFindSubsite_16.ClientID %>'),$('<%= ProcFinding_16_Text.ClientID %>'),$('<%= ProcFindSide_16.ClientID %>'),$('<%= ProcFindSite_16.ClientID %>'),'Facial Nerve Graft');
   
        function addAbsentEvent(opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue)
    {  
        $(opDateText).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
        $(admitDatText).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
        $(dischargeDateText).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
        $(opCaseSurgeon).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
        $(procIndication).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
        $(procNameOther).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
        $(procNameSubmandibular).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
        $(procNameParotid).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
        $(procSite).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
        $(procSide).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
        
        var rbl = procSubsite.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++)
        {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                  $(rblRef).addEvent('click',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
            else if (rblRef.type == 'text')
                  $(rblRef).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
        }  

        if (findingValue == 'Additional Structures Removed')
        {

            if (findingSubsite.type == 'checkbox')
                  $(findingSubsite).addEvent('click',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
            else if (findingSubsite.type == 'text')
                  $(findingSubsite).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));

        } 
        else
        {
            var rbl3 = findingFind.getElementsByTagName('input');
            for (var j = 0; j < rbl3.length; j++)
            {
                var rblRef3 = rbl3[j];
                if (rblRef3.type == 'radio')
                      $(rblRef3).addEvent('click',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
                else if (rblRef3.type == 'text')
                      $(rblRef3).addEvent('blur',curry(SetHiddenFields,opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue));
            } 
        } 
             
        //show on load
        ShowOnLoad(procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSubsite,pathSubSiteHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue);
    }

	function ShowOnLoad(procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSubsite,pathSubSiteHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue)
    {      
        var subsiteRbl = procSubsite.getElementsByTagName('input');
        var found = 'false';
        
        // if the subsite saved was in 'Other' field, use pathsubsite to re-populate
        if (pathSubSiteHidden.value != '')
        {
            for (var i = 0; i < subsiteRbl.length; i++)
                if (pathSubSiteHidden.value ==  subsiteRbl[i].value)
                    found = 'true';
            
            if (found == 'false')
                for (var i = 0; i < subsiteRbl.length; i++)
                    if (subsiteRbl[i].value == 'Other')
                        subsiteRbl[i+1].value = pathSubSiteHidden.value;
        }    
                      
        // show the associated drop down options depending on what subsite was selected.  add the hidden proc name value to it
        for (var i = 0; i < subsiteRbl.length; i++)
        {
            var subsiteRef = subsiteRbl[i];
            found = 'false';
            
            if (subsiteRef.type == 'radio')
            {
                if (subsiteRef.checked)
                {
                    if (subsiteRef.value == "Parotid" )
                    {
                        procNameHiddenOtherDiv.style.display='none';
                        procNameHiddenSubmandibularDiv.style.display='none';
                        procNameHiddenParotidDiv.style.display='block';
                        
                        procNameParotid.value = procNameHidden.value;    
                        found = 'true';       
                        break;
                    }
                    else if (subsiteRef.value == "Submandibular")
                    {
                        procNameHiddenOtherDiv.style.display='none';
                        procNameHiddenSubmandibularDiv.style.display='block';
                        procNameHiddenParotidDiv.style.display='none';
                        
                        procNameSubmandibular.value = procNameHidden.value; 
                        found = 'true';    
                        break; 
                    }
                }
            }
        }
        
        if (found  == 'false')
        {
            procNameHiddenOtherDiv.style.display='block';
            procNameHiddenSubmandibularDiv.style.display='none';
            procNameHiddenParotidDiv.style.display='none';
            
           procNameOther.value =  procNameHidden.value; 
        }
     }	
     
	function SetHiddenFields(opDateText,opDate,admitDatText,admitDate,dischargeDateText,dischargeDate,opQualityHidden,opCaseSurgeon,procDateTextHidden,procDateHidden,procSurgeonHidden,procPrimaryHidden,procQualityHidden,procIndication,procNameOther,procNameSubmandibular,procNameParotid,procNameHidden,procSite,procSide,procSubsite,pathSpecimenHidden,pathSiteHidden,pathDateTextHidden,pathDateHidden,pathSideHidden,pathSubSiteHidden,pathQualityHidden,procNameHiddenOtherDiv,procNameHiddenSubmandibularDiv,procNameHiddenParotidDiv,findingSubsite,findingFind,findingSide,findingSite,findingValue)
    {      
        var subsiteRbl = procSubsite.getElementsByTagName('input');
        var found = 'false';
              
        procNameHidden.value = '';
        // show the associated drop down options depending on what subsite was selected.  add the hidden proc name value to it
        for (var i = 0; i < subsiteRbl.length; i++)
        {
            var subsiteRef = subsiteRbl[i];
            found = 'false';
            
            if (subsiteRef.type == 'radio')
            {
                if (subsiteRef.checked)
                {
                    if (subsiteRef.value == "Parotid" )
                    {
                        procNameHiddenOtherDiv.style.display='none';
                        procNameHiddenSubmandibularDiv.style.display='none';
                        procNameHiddenParotidDiv.style.display='block';
                        
                        procNameHidden.value = procNameParotid.value;    
                        found = 'true';       
                        break;
                    }
                    else if (subsiteRef.value == "Submandibular")
                    {
                        procNameHiddenOtherDiv.style.display='none';
                        procNameHiddenSubmandibularDiv.style.display='block';
                        procNameHiddenParotidDiv.style.display='none';
                        
                        procNameHidden.value = procNameSubmandibular.value; 
                        found = 'true';    
                        break; 
                    }
                }
            }
        }
        
        if (found  == 'false')
        {
            procNameHiddenOtherDiv.style.display='block';
            procNameHiddenSubmandibularDiv.style.display='none';
            procNameHiddenParotidDiv.style.display='none';
            
           procNameHidden.value = procNameOther.value; 
        }
        
        var subsiteString = RetrieveRadioBtnListSelectedValues (procSubsite,"TABLE");

        if (opDateText.value != '' || admitDatText.value != '' || dischargeDateText.value != '' || opCaseSurgeon.value != '' || procIndication.value != '' || procNameHidden.value != '' || procSite.value != '' || procSide.value != '' || subsiteString != '' )
        { 
            procDateTextHidden.value = opDateText.value;
            procDateHidden.value = opDate.value;
            procSurgeonHidden.value = opCaseSurgeon.value;
            procPrimaryHidden.value = '1';
            
            pathDateTextHidden.value = opDateText.value;
            pathDateHidden.value = opDate.value;            
            pathSpecimenHidden.value = procNameHidden.value;
            pathSiteHidden.value = procSite.value;
            pathSideHidden.value = procSide.value;
            
            for (var i = 0; i < subsiteRbl.length; i++)
                if (subsiteRbl[i].checked)
                    if (subsiteRbl[i].value == 'Other')
                        pathSubSiteHidden.value = subsiteRbl[i+1].value;
                    else
                        pathSubSiteHidden.value = subsiteRbl[i].value;
                              
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
            pathSpecimenHidden.value = '';
            pathSiteHidden.value = '';
            pathSideHidden.value = '';
            pathSubSiteHidden.value = '';
                              
            opQualityHidden.value = '';
            procQualityHidden.value = '';
            pathQualityHidden.value = '';     
        }
        
        var temp = '';
        if (findingValue == 'Additional Structures Removed')
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
            }
            else
            {
                findingSide.value = '';
                findingSite.value = '';
                findingFind.value = '';
            }
        }
        else if (findingValue == 'Facial Nerve Graft')
        {
            temp = RetrieveRadioBtnListSelectedValues (findingFind,"TABLE");
            if (temp == 'Yes')
            {
                findingSide.value = procSide.value;
                findingSite.value = procSite.value;
                findingSubsite.value = findingValue;
            }            
            else
            {
                findingSide.value = '';
                findingSite.value = '';
                findingSubsite.value = '';
            }            
        }
    }	
      
</script>
