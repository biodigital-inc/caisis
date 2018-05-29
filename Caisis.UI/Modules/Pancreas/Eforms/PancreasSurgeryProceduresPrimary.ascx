<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryProceduresPrimary" CodeFile="PancreasSurgeryProceduresPrimary.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.AdditionalProceduresHTMLTable = "AdditionalProceduresHTMLTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="PancreasSurgeryProceduresPrimary" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Surgery Detail"></asp:Label><br/>

<br />

<table  width="575" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable" > 


    <tr>
        <td valign="top">
            
            <strong>Operative Detail</strong>
            <table  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="OperativeDetailHTMLTable">
              <tr>
			        <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Date of Operation</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Surgeon</td>
                     <td class="controlBoxDataGridTitleColumn" style="text-align: left;  white-space:nowrap; " >Op Duration (min) </td>
             </tr>
         
             <tr>
             
                <td style="white-space: nowrap;">
                    <euc:EformTextBox Width="100px"  RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText" Runat="server" ShowCalendar="true" CalcDate="true"/>
				    <euc:EformHidden  RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpDate"     ID="OpDate"     Runat="server"/></td>

                <td style="white-space: nowrap;">
                    <euc:EformComboBox DropDownWidth="auto"  Width="115px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon" LookupCode="Physician" Runat="server" /></td>
                <td style="white-space: nowrap;">
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false" /></td>

              </tr>
                <tr>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op In Time</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Op Out Time </td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Urine Output</td>
              </tr>
              <tr>
                 <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpInTime" ID="OpInTime" Runat="server"  /></td>

                 <td >
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpOutTime" ID="OpOutTime" Runat="server"  /> </td>
                <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpUrineOutput" ID="OpUrineOutput" Runat="server"   /> </td>

              </tr> 
              <tr>
                   <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Est Blood Loss (cc)</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;RBC Transfused (units) </td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space:nowrap;" >&nbsp;Crystalloid</td>
              </tr>
              <tr>
                 <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpEstBloodLoss" ID="OpEstBloodLoss" Runat="server" TabIndex="8"  ShowCalendar="false" CalcDate="false"  /></td>

                 <td >
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpRBC_Transfused" ID="EformTextBox1" Runat="server" TabIndex="10" /> </td>
                <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpCrystalloid" ID="OpCrystalloid" Runat="server" TabIndex="10"  /> </td>

              </tr> 
              <tr>
                     <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >&nbsp;Colloid</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;</td>
                    <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;</td>             
              </tr>
              <tr>
                <td>
                    <euc:EformTextBox  Width="130px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpColloid" ID="OpColloid" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false"  /></td>
                <td></td>
                <td></td>
              </tr>  
            
            </table>
            
        </td>
        
        <td valign="top" >
        
             <strong style="white-space: nowrap;" >Primary Procedure</strong>
            <table  width="150"  border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PrimaryProcedureHTMLTable" >
                      <tr>
                            <td colspan="2" class="controlBoxDataGridTitleColumn" align="center" >Type</td>
                      </tr>
                      <tr >
                         <td colspan="2" style="white-space: nowrap;" align="left">
                         <euc:EformDropDownList Width="245px" RecordId="11" ParentRecordId="11" TABLE="Procedures" FIELD="ProcName" ID="ProcName_11" Runat="server" LookupCode="PancreatectomyProcName"  />
                          <euc:EformTextBox  Width="1px" style="display: none;" RecordId="11"   ParentRecordId="11" TABLE="Procedures" FIELD="ProcPrimary" ID="ProcPrimary_11" Runat="server" />
                         </td>
                      </tr>
                      
                      
                      <tr>
                            <td class="controlBoxDataGridTitleColumn" align="center" style="white-space: nowrap;">Feeding Tube</td>                        
                             <td class="controlBoxDataGridTitleColumn" align="center" >Technique</td>                     
                      </tr>
                      <tr>
                         <td style="white-space: nowrap;" align="left">
                            <euc:EformDropDownList  Width="80px" RecordId="11"  TABLE="OperatingRoomDetails" FIELD="OpNotes" ID="OpNotes" Runat="server" TabIndex="7"  ShowCalendar="false" CalcDate="false" ShowEmptyListItem="true"  >
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem Value="Feeding tube: None  ||  " Text="None"></asp:ListItem>
                                <asp:ListItem Value="Feeding tube: G tube  ||  " Text="G tube"></asp:ListItem>
                                <asp:ListItem Value="Feeding tube: J tube  ||  " Text="J tube"></asp:ListItem>
                            </euc:EformDropDownList></td>                      

                       <td style="white-space: nowrap;" align="left">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="11"   ParentRecordId="11" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_11" Runat="server" />
				             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="11"   ParentRecordId="11" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_11"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="11"   ParentRecordId="11" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_11"   Runat="server" />                
                             
                             
                        <euc:EformDropDownList Width="150px" RecordId="11" ParentRecordId="11" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_11"  Runat="server" ShowEmptyListItem="true" >
                            <asp:ListItem ></asp:ListItem>
                            <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                            <asp:ListItem Value="Laparoscopic" Text="Laparoscopic"></asp:ListItem> 
                            <asp:ListItem Value="Converted" Text="Converted"></asp:ListItem>
                        </euc:EformDropDownList></td>                       
                      </tr>
                      
                      
                      <tr>
                            <td colspan="2" class="controlBoxDataGridTitleColumn" align="center" >Notes</td>                      
                      </tr>
                      <tr>
                       <td colspan="2" style="white-space: nowrap;" align="left">
                            <euc:EformTextBox  Width="220px" RecordId="11"  ParentRecordId="11" TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_11"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      
                      </tr>
            </table>  
                       
        </td>
        

        

    </tr>
    
    <tr>
            <td valign="top" colspan="2" align="center">
        
            <center><strong>Supplementary Procedures</strong></center>
            <table  width="200" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="AdditionalProceduresHTMLTable" >


                      <tr >
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="12"   ParentRecordId="11" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_12" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="12"  ParentRecordId="11"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_12"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="12"  ParentRecordId="11"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_12"   Runat="server" />   
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="12"  ParentRecordId="11" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_12"     Runat="server" />
                             Splenectomy Performed?  
                             <euc:EformRadioButtonList ID="SplenectomyRecorded" runat="server" RepeatLayout="Flow"
                                RepeatDirection="Horizontal" CellSpacing="0" Table="NoTable" Field="SplenectomyRecorded">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                                <asp:ListItem>Unknown</asp:ListItem>
                            </euc:EformRadioButtonList>               
                             
                            </td> 

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="12"  ParentRecordId="11" TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_12"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                      <tr >
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="13"  ParentRecordId="11"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_13" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="13" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_13"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="13"  ParentRecordId="11"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_13"   Runat="server" />                        
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="13" ParentRecordId="11"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_13"     Runat="server"   />
                             PV resection Performed? 
                             <euc:EformRadioButtonList ID="PVresectionRecorded" runat="server" RepeatLayout="Flow"
                                RepeatDirection="Horizontal" CellSpacing="0" Table="NoTable" Field="PVresectionRecorded">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                                <asp:ListItem>Unknown</asp:ListItem>
                            </euc:EformRadioButtonList>                                  
                            </td> 

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="13" ParentRecordId="11"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_13"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>

                      <tr>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Other Types</td>
                            <td class="controlBoxDataGridTitleColumn" style="text-align: left; " >Notes</td>
                      </tr>                      <tr >
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_16" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_16"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_16"   Runat="server" />
                             

                            <euc:EformComboBox Width="245px"   RecordId="16" ParentRecordId="11"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_16"     LookupCode="ProcName" DropDownWidth="auto" Runat="server" TabIndex="2" /></td> 

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="16" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_16"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="17"  ParentRecordId="11"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_17" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="17" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_17"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="17"  ParentRecordId="11"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_17"   Runat="server" />
                             

                            <euc:EformComboBox Width="245px" RecordId="17" ParentRecordId="11"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_17"     LookupCode="ProcName" DropDownWidth="auto" Runat="server" TabIndex="2" /></td> 

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="17" ParentRecordId="11"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_17"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                       <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="18" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_18" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="18" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_18"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="18"  ParentRecordId="11"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_18"   Runat="server" />
                             

                            <euc:EformComboBox Width="245px" RecordId="18" ParentRecordId="11"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_18"     LookupCode="ProcName" DropDownWidth="auto" Runat="server" TabIndex="2" /></td> 

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="18" ParentRecordId="11"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_18"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>
                      <tr style="display: none;">
                        <td style="white-space: nowrap;">
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="19" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_19" Runat="server" />
                             <euc:EformTextBox  Width="1px" style="display: none;" RecordId="19" ParentRecordId="11"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_19"     Runat="server"/>
                             <euc:EformTextBox Width="1px" style="display: none;" RecordId="19"  ParentRecordId="11"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_19"   Runat="server" />
                             
                            <euc:EformComboBox Width="245px" RecordId="19" ParentRecordId="11"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_19"     LookupCode="ProcName" DropDownWidth="auto" Runat="server" TabIndex="2" /></td> 

                       <td style="white-space: nowrap;">
                            <euc:EformTextBox  Width="100px" RecordId="19" ParentRecordId="11"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_19"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true" /></td>
                      </tr>

            </table>
            <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="middle"  onclick="return showFirstAdditionalRow(this,'AdditionalProceduresHTMLTable');" />
        
        </td>
    </tr>


</table>
<br />


<div id="PancDetailsDiv" runat="server" style="display: none;">
<strong>Primary Procedure Details</strong>
<table width="700" border="0" cellspacing="0" cellpadding="6" class="ClinicalEformTable"  >
          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Pancreatic Stent </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Margin Frozen Result </td>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Reconstruction  </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Pancreas  </td>
          </tr>
          <tr>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcStent" ID="ProcStent"   LookupCode="YesNoUnknown" Runat="server" TabIndex="6"  /> </td>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcMarginFrozen" ID="ProcMarginFrozen" LookupCode="YesNoUnknown" Runat="server" TabIndex="8" /></td>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcReconstruction" ID="ProcReconstruction" LookupCode="GastricReconstruction"  Runat="server" TabIndex="9"  /></td>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcPancreas" ID="ProcPancreas"   LookupCode="PancreasHardSoft" Runat="server" TabIndex="10"  /> </td>

          </tr>

          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Pancreatic Duct Size (mm) </td> 
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Biliary Bypass </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Biliary Bypass Origin </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Gastric Bypass </td>
          </tr>
          <tr>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcPancreaticDuctSize" ID="ProcPancreaticDuctSize" LookupCode="PancreasDuctSize" Runat="server" TabIndex="11" /> </td>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcBiliaryBypass" ID="ProcBiliaryBypass" LookupCode="YesNoUnknown"  Runat="server" TabIndex="13"  /></td>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcBiliaryBypassOrigin" ID="ProcBiliaryBypassOrigin"   LookupCode="PancreasOrigin" Runat="server" TabIndex="14"  /> </td>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcGastricBypass" ID="ProcGastricBypass" LookupCode="YesNoUnknown" Runat="server" TabIndex="15" /> </td>

          </tr>
          
          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Plexus Block   </td> 
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Drains </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Skin Closure </td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >Pancreatic Anastamosis</td>
          </tr>
          <tr>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcPlexusBlock" ID="ProcPlexusBlock" LookupCode="YesNoUnknown" Runat="server" TabIndex="16" /></td>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcDrains" ID="ProcDrains" LookupCode="YesNoUnknown"  Runat="server" TabIndex="17"  /></td>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcSkinClosure" ID="ProcSkinClosure"   LookupCode="PancreasClosure" Runat="server" TabIndex="18"  /> </td>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcPancreaticAnast" ID="ProcPancreaticAnast" LookupCode="ProcPancreaticAnastamosis"   Runat="server"   /> </td>
                <%--<euc:EformComboBox  Width="100px" TABLE="NoTable" FIELD="ProcPancreaticAnast" ID="ProcPancreaticAnast" LookupCode="ProcPancreaticAnastamosis"   Runat="server"   /> </td>--%>

          </tr>
          <tr>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >Additional Organs Resected</td> 
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          <tr>
            <td>
                <euc:EformComboBox  Width="100px" RecordId="1" ParentRecordId="11" TABLE="PancreasProc" FIELD="ProcAddOrgansResected" ID="ProcAddOrgansResected" LookupCode="YesNoUnknown"   Runat="server"   /> </td>
                <%--<euc:EformComboBox  Width="100px" TABLE="NoTable" FIELD="ProcAddOrgansResected" ID="ProcAddOrgansResected" LookupCode="YesNoUnknown"   Runat="server"   /> </td>--%>
     
         </tr>
</table>
</div>
<table style="display: none;">
    <tr id="AbsentRow1">
        <td>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_3"
                runat="server" Width="1px" Style="display: none;" CalcDate="true" />
            <euc:EformTextBox RecordId="3" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_3"
                Runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="TableName" ID="TableName_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldName" ID="FieldName_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_3"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<table style="display: none;">
    <tr id="AbsentRow2">
        <td>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_4"
                runat="server" Width="1px" Style="display: none;" CalcDate="true" />
            <euc:EformTextBox RecordId="4" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_4"
                Runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="TableName" ID="TableName_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldName" ID="FieldName_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_4"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo
    addAbsentEvent($('<%= OpDateText.ClientID %>'),$('<%= OpCaseSurgeon.ClientID %>'),$('<%= ProcDateText_11.ClientID %>'),$('<%= ProcDate_11.ClientID %>'),$('<%= ProcSurgeon_11.ClientID %>'),$('<%= OpNotes.ClientID %>'),$('<%= ProcName_11.ClientID %>'),$('<%= ProcNotes_11.ClientID %>'));
    addAbsentEvent($('<%= OpDateText.ClientID %>'),$('<%= OpCaseSurgeon.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= ProcSurgeon_16.ClientID %>'),$('<%= OpNotes.ClientID %>'),$('<%= ProcName_16.ClientID %>'),$('<%= ProcNotes_16.ClientID %>'));
    addAbsentEvent($('<%= OpDateText.ClientID %>'),$('<%= OpCaseSurgeon.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcSurgeon_17.ClientID %>'),$('<%= OpNotes.ClientID %>'),$('<%= ProcName_17.ClientID %>'),$('<%= ProcNotes_17.ClientID %>'));
    addAbsentEvent($('<%= OpDateText.ClientID %>'),$('<%= OpCaseSurgeon.ClientID %>'),$('<%= ProcDateText_18.ClientID %>'),$('<%= ProcDate_18.ClientID %>'),$('<%= ProcSurgeon_18.ClientID %>'),$('<%= OpNotes.ClientID %>'),$('<%= ProcName_18.ClientID %>'),$('<%= ProcNotes_18.ClientID %>'));
    addAbsentEvent($('<%= OpDateText.ClientID %>'),$('<%= OpCaseSurgeon.ClientID %>'),$('<%= ProcDateText_19.ClientID %>'),$('<%= ProcDate_19.ClientID %>'),$('<%= ProcSurgeon_19.ClientID %>'),$('<%= OpNotes.ClientID %>'),$('<%= ProcName_19.ClientID %>'),$('<%= ProcNotes_19.ClientID %>'));

    function addAbsentEvent(opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes)
    {  
        $(opDateTextID).addEvent('blur',curry(SetProcedureFields,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes));
        $(opSurgeonID).addEvent('blur',curry(SetProcedureFields,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes));
        $(procName).addEvent('blur',curry(SetProcedureFields,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes));
        $(procNotes).addEvent('blur',curry(SetProcedureFields,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes));
   }
      
    /* ]]> */
    
 	function SetProcedureFields(opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes)
	{ 
	    if (procName.value != '' || procNotes.value != '')
	    {
            procDateTextID.value = opDateTextID.value;
            procDateID.value = opDateTextID.value;
            procSurgeonID.value = opSurgeonID.value;
            
            // if primary procedure is set
            if (procName.id.indexOf('_11') > -1)
                document.getElementById('<%= ProcPrimary_11.ClientID %>').value = '1';

	    }
	    else
	    {
            procDateTextID.value = '';
            procDateID.value = '';
            procSurgeonID.value = '';
            
            // if primary procedure is cleared
            if (procName.id.indexOf('_11') > -1)
                document.getElementById('<%= ProcPrimary_11.ClientID %>').value = '';

	    }
	}  
// ******************************************************************************************************
// ******************************************************************************************************
// ******************************************************************************************************
    //Adds blur event to combo
    addAbsentEventCB($('<%= OpDateText.ClientID %>'),$('<%= OpCaseSurgeon.ClientID %>'),$('<%= ProcDateText_12.ClientID %>'),$('<%= ProcDate_12.ClientID %>'),$('<%= ProcSurgeon_12.ClientID %>'),$('<%= OpNotes.ClientID %>'),$('<%= ProcName_12.ClientID %>'),$('<%= ProcNotes_12.ClientID %>'),$('<%= SplenectomyRecorded.ClientID %>'),'Splenectomy');
    addAbsentEventCB($('<%= OpDateText.ClientID %>'),$('<%= OpCaseSurgeon.ClientID %>'),$('<%= ProcDateText_13.ClientID %>'),$('<%= ProcDate_13.ClientID %>'),$('<%= ProcSurgeon_13.ClientID %>'),$('<%= OpNotes.ClientID %>'),$('<%= ProcName_13.ClientID %>'),$('<%= ProcNotes_13.ClientID %>'),$('<%= PVresectionRecorded.ClientID %>'),'PV resection');

    function addAbsentEventCB(opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procRecordedID,procNameValue)
    {  
        $(opDateTextID).addEvent('click',curry(SetProcedureFields2,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procRecordedID,procNameValue));
        $(opSurgeonID).addEvent('blur',curry(SetProcedureFields2,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procRecordedID,procNameValue));
        $(procRecordedID).addEvent('click',curry(SetProcedureFields2,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procRecordedID,procNameValue));
        $(procNotes).addEvent('blur',curry(SetProcedureFields2,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procRecordedID,procNameValue));
   }
      
    /* ]]> */
    
 	function SetProcedureFields2(opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procRecordedID,procNameValue)
	{ 
	    var procRecorded_value = RetrieveRadioBtnListSelectedValues (procRecordedID,'FLOW');

      if (procRecorded_value == "Yes")
      { 
        procName.value = procNameValue;
        
        if (procNameValue == 'Splenectomy')
        {
            document.getElementById('<%= AbsentDateText_3.ClientID %>').value='';
            document.getElementById('<%= AbsentDate_3.ClientID %>').value='';
            document.getElementById('<%= TableName_3.ClientID %>').value = '';        
            document.getElementById('<%= FieldName_3.ClientID %>').value = '';        
            document.getElementById('<%= FieldValue_3.ClientID %>').value = '';        
            document.getElementById('<%= AbsentReason_3.ClientID %>').value = '';        
            document.getElementById('<%= AbsentQuality_3.ClientID %>').value = '';        
        }

        if (procNameValue == 'PV resection')
        {            
            document.getElementById('<%= AbsentDateText_4.ClientID %>').value='';
            document.getElementById('<%= AbsentDate_4.ClientID %>').value='';
            document.getElementById('<%= TableName_4.ClientID %>').value = '';        
            document.getElementById('<%= FieldName_4.ClientID %>').value = '';        
            document.getElementById('<%= FieldValue_4.ClientID %>').value = '';        
            document.getElementById('<%= AbsentReason_4.ClientID %>').value = '';        
            document.getElementById('<%= AbsentQuality_4.ClientID %>').value = '';          
        }        
      } 
      else if (procRecorded_value == "No" || procRecorded_value == "Unknown")
      {
                
        if (procNameValue == 'Splenectomy')
        {
            if (procNotes.value != '')
                alert('A Splenectomy must be performed in order to enter notes');
            
            document.getElementById('<%= AbsentDateText_3.ClientID %>').value=opDateTextID.value;
            document.getElementById('<%= AbsentDate_3.ClientID %>').value=opDateTextID.value;
            document.getElementById('<%= TableName_3.ClientID %>').value = 'Procedures';        
            document.getElementById('<%= FieldName_3.ClientID %>').value = 'ProcName';        
            document.getElementById('<%= FieldValue_3.ClientID %>').value = 'Splenectomy'; 
            
            if (procRecorded_value == "No")       
                document.getElementById('<%= AbsentReason_3.ClientID %>').value = 'Not Performed';        
            if (procRecorded_value == "Unknown")       
                document.getElementById('<%= AbsentReason_3.ClientID %>').value = 'Unknown if Performed';        

            document.getElementById('<%= AbsentQuality_3.ClientID %>').value = 'OUT';         
        }
      
        if (procNameValue == 'PV resection')
        {            
            if (procNotes.value != '')
                alert('A PV resection must be performed in order to enter notes');

            document.getElementById('<%= AbsentDateText_4.ClientID %>').value=opDateTextID.value;
            document.getElementById('<%= AbsentDate_4.ClientID %>').value=opDateTextID.value;
            document.getElementById('<%= TableName_4.ClientID %>').value = 'Procedures';        
            document.getElementById('<%= FieldName_4.ClientID %>').value = 'ProcName';        
            document.getElementById('<%= FieldValue_4.ClientID %>').value = 'PV resection'; 
            
            if (procRecorded_value == "No")       
                document.getElementById('<%= AbsentReason_4.ClientID %>').value = 'Not Performed';        
            if (procRecorded_value == "Unknown")       
                document.getElementById('<%= AbsentReason_4.ClientID %>').value = 'Unknown if Performed';        

            document.getElementById('<%= AbsentQuality_4.ClientID %>').value = 'OUT';    
        }   

        procName.value = '';
        procNotes.value = '';
        procDateTextID.value = '';
        procDateID.value = '';
   
     }
     	
	
    if (procName.value || procNotes.value != '')
    {
        procDateTextID.value = opDateTextID.value;
        procDateID.value = opDateTextID.value;
        procSurgeonID.value = opSurgeonID.value;
    }
    else
    {
        procDateTextID.value = '';
        procDateID.value = '';
        procSurgeonID.value = '';
    }
	}  


// ******************************************************************************************************
// ******************************************************************************************************
// ******************************************************************************************************

    //Adds blur event to combo
    addAbsentEvent2($('<%= PancDetailsDiv.ClientID %>'),$('<%= OpDateText.ClientID %>'),$('<%= OpCaseSurgeon.ClientID %>'),$('<%= ProcDateText_11.ClientID %>'),$('<%= ProcDate_11.ClientID %>'),$('<%= ProcSurgeon_11.ClientID %>'),$('<%= OpNotes.ClientID %>'),$('<%= ProcName_11.ClientID %>'),$('<%= ProcNotes_11.ClientID %>'),$('<%= ProcApproach_11.ClientID %>'));

    function addAbsentEvent2(pancDetailsDiv,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procApproach)
    {  
        $(opDateTextID).addEvent('blur',curry(SetPancreatectomyProcedure,pancDetailsDiv,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procApproach));
        $(opSurgeonID).addEvent('blur',curry(SetPancreatectomyProcedure,pancDetailsDiv,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procApproach));
        $(procName).addEvent('blur',curry(SetPancreatectomyProcedure,pancDetailsDiv,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procApproach));
        $(procNotes).addEvent('blur',curry(SetPancreatectomyProcedure,pancDetailsDiv,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procApproach));
        $(opNotesID).addEvent('blur',curry(SetPancreatectomyProcedure,pancDetailsDiv,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procApproach));
        $(procApproach).addEvent('blur',curry(SetPancreatectomyProcedure,pancDetailsDiv,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procApproach));
   
        SetPancreatectomyProcedure(pancDetailsDiv,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procApproach);
   }
	
	function SetPancreatectomyProcedure(pancDetailsDiv,opDateTextID,opSurgeonID,procDateTextID,procDateID,procSurgeonID,opNotesID,procName,procNotes,procApproach)
    {
        if (opNotesID.value != '' || procApproach.value != '' || procNotes.value != '' || procName.value != '')
	    {
             pancDetailsDiv.style.display='block';

            procDateTextID.value = opDateTextID.value;
            procDateID.value = opDateTextID.value;
            procSurgeonID.value = opSurgeonID.value;
//            procName.value = 'Pancreatectomy';
                        

	    }
	    else
	    {
            pancDetailsDiv.style.display='none';
            
            procDateTextID.value = '';
            procDateID.value = '';
            procSurgeonID.value = '';
//            procName.value = '';

	    }
    }	
</script>
