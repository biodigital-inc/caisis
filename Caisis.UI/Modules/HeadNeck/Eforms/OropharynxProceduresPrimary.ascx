<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxProceduresPrimary" CodeFile="OropharynxProceduresPrimary.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
 <script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>

<script type="text/javascript" language="javascript">
   tableArray.AdditionalPrimayProcHtmlTable = "AdditionalPrimayProcHtmlTable";
   tableArray.LateralNeckDissectionHtmlTable = "LateralNeckDissectionHtmlTable";
</script>



<a name="OropharynxProceduresPrimary" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Surgery"></asp:Label><br/>

<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Surgeries Performed ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="PrimaryProcRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="PrimaryProcRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="PrimaryProcAbsentDiv" runat="server" style="display: none;" >
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_12"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="12" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_12"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table></div>

<div id="PrimaryProcDiv" runat="server" style="display: none;" >

<table  width="450" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxProceduresPrimaryHtmlTable" > 
 
          <tr>
            <td valign="top" style="white-space: nowrap;"><strong>Date</strong><br />
                <euc:EformTextBox  Width="80px" TABLE="NoTable" FIELD="ProcDateText" ID="ProcDateText" Runat="server" TabIndex="1"  ShowCalendar="true"  />
               <euc:CaisisTextBox Width="1px" style="display: none; " ID="ProcDate" Runat="server"  />
                </td>
            
            <td valign="top" style="white-space: nowrap;"><strong>Approach</strong><br />
                <euc:EformRadioButtonList style="white-space: nowrap;" TABLE="NoTable" FIELD="ProcApproach" ID="ProcApproach" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                    <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                    <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                    <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
                </euc:EformRadioButtonList></td>
            
            <td align="left" style="white-space: nowrap; display: none;"><strong>Procedure Type</strong><br />
                
                <euc:EformRadioButtonList style="white-space: nowrap; display: none;" ID="ProcNamePrefix" 
                    Table="NoTable" Field="ProcNamePrefix" runat="server" 
                    RepeatDirection="Vertical" >
                    <asp:ListItem Value="Primary" Text="Primary" Selected="True"></asp:ListItem>
                </euc:EformRadioButtonList>
</td> 
           </tr> 
</table>
<br />

<div id="IndicationDIV" runat="server" style="display: none; ">
<table  width="450" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" runat="server" id="ProcedureIndicationTBLE" > 
           <tr>
             <td style="white-space: nowrap;">
                <strong>Indication</strong></td>
           </tr>
           <tr>     
               <td align="left" style="white-space: nowrap;">      
                <euc:EformExtendedRadioButtonList ID="ProcIndication" Table="NoTable" Field="ProcIndication" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true" >
                     <asp:ListItem Value="" Text="None"></asp:ListItem>
                     <asp:ListItem Value="Persistent Local Disease" Text="Persistent Local Disease"></asp:ListItem>
                     <asp:ListItem Value="Persistent Regional Disease" Text="Persistent Regional Disease"></asp:ListItem>
                     <asp:ListItem Value="Persistent Loco-Regional Disease" Text="Persistent Loco-Regional Disease"></asp:ListItem>
                     <asp:ListItem Value="Local Recurrence" Text="Local Recurrence"></asp:ListItem>
                     <asp:ListItem Value="Regional Recurrence" Text="Regional Recurrence"></asp:ListItem>
                     <asp:ListItem Value="Loco-Regional Recurrence" Text="Loco-Regional Recurrence"></asp:ListItem>
                     <asp:ListItem Value="Stomal Recurrence" Text="Stomal Recurrence"></asp:ListItem>
                     <asp:ListItem Value="NK" Text="NK"></asp:ListItem>
                </euc:EformExtendedRadioButtonList></td> 
           </tr>
</table>
<br />
</div>

<table  width="450" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTableBlue" id="PrimayProcHtmlTable" >
           <tr>
             <td style="white-space: nowrap;" colspan="2">
                <strong>Primary Procedure</strong>                
             </td>
           </tr>
           <tr>
             <td style="white-space: nowrap;"><strong>Procedure: </strong>  
                 <euc:EformComboBox DropDownWidth="300px" Width="200px" ID="ProcName_20_Text" runat="server" RecordId="20" ParentRecordId="20" TABLE="Procedures" FIELD="ProcName" LookupCode="ProcName,Disease,HeadNeck"/>   
                 
                <input type="hidden" id="ProcName_20" runat="server" style="display: none;"  />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="20" ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_20" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="20" ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_20"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="20" ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_20" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="20" ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_20" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="20" ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_20" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="20" ParentRecordId="20" TABLE="Procedures" Field="ProcPrimary" ID="ProcPrimary_20" runat="server" />
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="20" ParentRecordId="20"  TABLE="Pathology" FIELD="PathSpecimenType" ID="PathSpecimenType_20" Runat="server" />                
             </td>
             <td style="white-space: nowrap;"><strong>Side: </strong> 
                  <euc:EformComboBox DropDownWidth="auto" Width="100px" ID="ProcSide_20" runat="server" RecordId="20" ParentRecordId="20" TABLE="Procedures" FIELD="ProcSide" LookupCode="OpSide,Disease,HeadNeck"/>               
             </td>
           </tr>   

</table>

<br />
<table  width="450" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="AncillaryProcHtmlTable" > 
           <tr>
             <td style="white-space: nowrap;">
                <strong>Ancillary Procedures</strong>
                
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="20" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_20" Runat="server"  />
                <euc:EformTextBox  Width="1px" style="display: none" RecordId="20" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_20" Runat="server"  />
                <euc:EformTextBox  Width="1px" style="display: none" RecordId="20" TABLE="OperatingRoomDetails" FIELD="OpQuality" ID="OpQuality_20" Runat="server"  />
               
                </td>
           </tr>   
  
           <tr>
               <td align="left" style="white-space: nowrap;">   
                <input type="checkbox" id="ProcName_19" value="Lip-Split" runat="server"   />Lip-Split
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_19_Text" runat="server" RecordId="19"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="19"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_19" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="19"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_19"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="19"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_19" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="19"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_19" runat="server" />
                 <euc:EformTextBox Width="1px" style="display: none;"   RecordId="19"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_19" runat="server" />
              
                </td>

               <td align="left" style="white-space: nowrap;">  
                <input type="checkbox" id="ProcName_21" value="Mandibulotomy"  runat="server"   />Mandibulotomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_21_Text" runat="server" RecordId="21"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="21"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_21" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="21"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_21"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="21"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_21" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="21"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_21" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="21"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_21" runat="server" /></td>
               
               <td align="left" style="white-space: nowrap;">   
                <input type="checkbox" id="ProcName_22" value="Visor" runat="server"   />Visor
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_22_Text" runat="server" RecordId="22"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="22"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_22" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="22"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_22"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="22"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_22" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="22"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_22" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="22"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_22" runat="server" /></td>
              </tr>
              
             <tr>
               <td align="left" style="white-space: nowrap;">   
                <input type="checkbox" id="ProcName_23" value="Lingual Drop" runat="server"   />Lingual Drop
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_23_Text" runat="server" RecordId="23"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="23"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_23" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="23"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_23"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="23"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_23" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="23"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_23" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="23"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_23" runat="server" /></td>

               <td align="left" style="white-space: nowrap;"> 
                <input type="checkbox" id="ProcName_24" value="Radical Tonsillectomy" runat="server"   />Radical Tonsillectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_24_Text" runat="server" RecordId="24"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="24"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_24" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="24"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_24"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="24"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_24" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="24"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_24" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="24"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_24" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">  
                <input type="checkbox" id="ProcName_25" value="Partial Pharyngectomy" runat="server"   />Partial Pharyngectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_25_Text" runat="server" RecordId="25"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="25"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_25" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="25"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_25"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="25"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_25" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="25"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_25" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="25"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_25" runat="server" /></td>
              </tr>  
              
              <tr>
               <td align="left" style="white-space: nowrap;"> 
                <input type="checkbox" id="ProcName_26" value="Circumferential Pharyngectomy"  runat="server"   />Circumferential Pharyngectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_26_Text" runat="server" RecordId="26"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="26"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_26" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="26"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_26"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="26"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_26" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="26"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_26" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="26"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_26" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">      
                <input type="checkbox" id="ProcName_27" value="Pharyngectomy-Espohagectomy"   runat="server"   />Pharyngectomy-Espohagectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_27_Text" runat="server" RecordId="27"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="27"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_27" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="27"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_27"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="27"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_27" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="27"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_27" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="27"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_27" runat="server" /></td>

               <td align="left" style="white-space: nowrap;"> 
                <input type="checkbox" id="ProcName_28" value="Soft Palate Resection"   runat="server"   />Soft Palate Resection
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_28_Text" runat="server" RecordId="28"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="28"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_28" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="28"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_28"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="28"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_28" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="28"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_28" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="28"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_28" runat="server" /></td>

              </tr>
 
              <tr>
               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_29" value="Laryngectomy"    runat="server"   />Laryngectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_29_Text" runat="server" RecordId="29"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="29"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_29" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="29"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_29"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="29"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_29" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="29"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_29" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="29"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_29" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_30" value="Laryngopharyngectomy"    runat="server"   />Laryngopharyngectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_30_Text" runat="server" RecordId="30"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="30"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_30" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="30"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_30"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="30"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_30" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="30"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_30" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="30"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_30" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_31" value="Nasopharyngectomy"    runat="server"   />Nasopharyngectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_31_Text" runat="server" RecordId="31"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="31"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_31" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="31"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_31"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="31"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_31" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="31"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_31" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="31"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_31" runat="server" /></td>
              </tr>
              
              <tr>
               <td align="left" style="white-space: nowrap;">                 
                <input type="checkbox" id="ProcName_32" value="Mandibulectomy"    runat="server"   />Mandibulectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_32_Text" runat="server" RecordId="32"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="32"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_32" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="32"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_32"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="32"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_32" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="32"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_32" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="32"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_32" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_33" value="Maxillectomy"    runat="server"   />Maxillectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_33_Text" runat="server" RecordId="33"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="33"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_33" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="33"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_33"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="33"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_33" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="33"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_33" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="33"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_33" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_34" value="Resection of Anterior Tongue"    runat="server"   />Resection of Anterior Tongue
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_34_Text" runat="server" RecordId="34"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="34"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_34" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="34"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_34"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="34"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_34" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="34"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_34" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="34"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_34" runat="server" /></td>
              
              </tr>
 
              <tr>
               <td align="left" style="white-space: nowrap;" colspan="2">
                <strong>Other:&nbsp;</strong>
                <input type="text" id="ProcName_35"     runat="server"   />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_35_Text" runat="server" RecordId="35"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="35"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_35" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="35"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_35"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="35"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_35" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="35"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_35" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="35"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_35" runat="server" /></td>
            </tr>
</table>
<br /> 
<table>
    <tr id="PrimaryProcAbsentRow">
        <td>
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="TableName" ID="TableName_12"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="FieldName" ID="FieldName_12"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_12"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_12"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="12" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_12"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br />

<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Reconstruction Procedures Done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ReconProcDone" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="ReconProcDone">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="ReconProcAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_7"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="7" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_7"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
    </table>
</div>

<div id="ReconProcDiv" runat="server" style="display: none;">
<%--<strong>Reconstruction Procedures </strong>--%>
<table  width="450" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" runat="server" id="Table2" > 

           <tr>

               <td align="left" style="white-space: nowrap;">                 
                <input type="checkbox" id="ProcName_36" value="DP"    runat="server"   />DP
                <euc:EformTextBox Width="1px" ID="ProcName_36_Text" runat="server" RecordId="36"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="36"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_36" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="36"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_36"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="36"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_36" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="36"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_36" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"  RecordId="36"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_36" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_37" value="LD"    runat="server"   />LD
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_37_Text" runat="server" RecordId="37"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
               <euc:EformTextBox Width="1px" style="display: none;"   RecordId="37"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_37" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="37"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_37"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="37"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_37" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="37"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_37" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="37"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_37" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_38" value="PMMF"    runat="server"   />PMMF
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_38_Text" runat="server" RecordId="38"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="38"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_38" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="38"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_38"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="38"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_38" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="38"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_38" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="38"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_38" runat="server" /></td>

          </tr>
          <tr>              
               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_39" value="Gastric Pull-up"    runat="server"   />Gastric Pull-up
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_39_Text" runat="server" RecordId="39"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="39"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_39" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="39"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_39"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="39"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_39" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="39"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_39" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="39"  TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_39" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_40" value="Free Jejunum"    runat="server"   />Free Jejunum
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_40_Text" runat="server" RecordId="40"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="40"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_40" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="40"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_40"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="40"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_40" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="40"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_40" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="40"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_40" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_41" value="Radial Forearm"    runat="server"   />Radial Forearm
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_41_Text" runat="server" RecordId="41"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="41"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_41" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="41"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_41"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="41"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_41" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="41"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_41" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="41"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_41" runat="server" /></td>
 
           </tr>
          <tr>             
               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_42" value="Rectus Abdominis"    runat="server"   />Rectus Abdominis
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_42_Text" runat="server" RecordId="42"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="42"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_42" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="42"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_42"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="42"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_42" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="42"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_42" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="42"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_42" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_43" value="ALT"    runat="server"   />ALT
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_43_Text" runat="server" RecordId="43"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="43"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_43" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="43"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_43"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="43"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_43" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="43"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_43" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="43"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_43" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_44" value="Fibula"    runat="server"   />Fibula
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_44_Text" runat="server" RecordId="44"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="44"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_44" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="44"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_44"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="44"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_44" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="44"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_44" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="44"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_44" runat="server" /></td>
 
           </tr>
          <tr>              
               <td align="left" style="white-space: nowrap;" colspan="2">
                <strong>Other:&nbsp;</strong>
                <input type="text" id="ProcName_45"     runat="server"   />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_45_Text" runat="server" RecordId="45"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="45"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_45" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="45"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_45"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="45"  ParentRecordId="20" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_45" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="45"  ParentRecordId="20" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_45" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="45"  ParentRecordId="20" TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_45" runat="server" /></td>
         </tr>              
</table>
</div>
<table>
    <tr id="ReconstructionProceduresAbsentRow">
        <td>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="TableName" ID="TableName_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="FieldName" ID="FieldName_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_7"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>

<br /><br />

<a name="LateralNeckDissection" />
<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Neck Dissection Done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="LateralDissectDone" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23"  RecordId="17" ParentRecordId="20" TABLE="Procedures" FIELD="ProcName" >
                <asp:ListItem Value="Neck Dissection">Yes</asp:ListItem>
                <asp:ListItem Value="">No</asp:ListItem>
                <asp:ListItem Value="Salvage Neck Dissection">Salvage Neck Dissection</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="LateralDissectAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_2"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="2" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_2"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
    </table>
</div>

<div id="LateralDissectDiv" runat="server" style="display: none;">
    <%--<strong>Lateral Neck Dissection</strong>--%>
    <table border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="LateralNeckDissectionHtmlTable">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                &nbsp;Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                Surgeon</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >
                Data Quality</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">
                &nbsp;</td>
        </tr>
        <tr id="LateralNeckDissectionHtmlRow1" runat="server">
            <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Width="100px" RecordId="17" ParentRecordId="20" Table="Procedures" Field="ProcDateText" ID="ProcDateText_17" runat="server" TabIndex="24" 
                    ShowCalendar="true" CalcDate="true" />
                <euc:EformHidden RecordId="17" ParentRecordId="20" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_17" Runat="server" />



               <%-- <euc:EformTextBox RecordId="4" ParentRecordId="20"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_4" Runat="server" Width="1px" style="display:none;" /> --%>
                <euc:EformTextBox id="ProcInstitution_4" RecordId="17" ParentRecordId="20" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcService_4" RecordId="17" ParentRecordId="20" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcSite_4" RecordId="17" ParentRecordId="20" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
            </td>
            <td style="white-space: nowrap;">
              <euc:EformComboBox id="ProcSurgeon_4" RecordId="17" ParentRecordId="20" Table="Procedures" Field="ProcSurgeon" LookupCode="Physician" runat="server" Width="80px" DropDownWidth="300" /></td>

                
             <td style="white-space: nowrap;" align="right">
	            <euc:EformComboBox id="ProcQuality_4" RecordId="4" ParentRecordId="20" Table="Procedures" Field="ProcQuality" LookupCode="DataQuality" runat="server" Width="80px" DropDownWidth="300" DropDownHeight="auto" />
             </td>
           
            <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" /></td>
        </tr>
    </table>

<br />
    <table border="0" cellspacing="1" cellpadding="3" border="0" class="ClinicalEformTable" style="margin-bottom: 1.5em;">

        <tr>
            <td align="center" colspan="1" class="eformLargePopulatedTableBlue"></td>
            <td align="center" colspan="1" class="eformLargePopulatedTableBlue"><span class="controlBoxTitle">Levels Dissected</span></td>
            <td align="center" colspan="4" class="eformLargePopulatedTable"><span class="controlBoxTitle">Additional Structures </span></td>
        </tr>
        
        <tr>
            <td style="text-align: left; white-space: nowrap;"  >Right Levels </td>        
            <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
                <euc:EformExtendedCheckBoxList style="white-space: nowrap;" Table="NoTable" Field="LevelsDissRight" ID="LevelsDissRight" runat="server" RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="1" Text="1" />
                    <asp:ListItem Value="2" Text="2" />
                    <asp:ListItem Value="3" Text="3" />
                    <asp:ListItem Value="4" Text="4" />
                    <asp:ListItem Value="5" Text="5" />
                    <asp:ListItem Value="6" Text="6" />
                    <asp:ListItem Value="7" Text="7" />
                    <asp:ListItem Value="N/K: Lateral" Text="N/K: Lateral" />
                    <asp:ListItem Value="N/K: Central" Text="N/K: Central" />
                    <asp:ListItem Value="N/K" Text="N/K" />
                    <asp:ListItem Value="Not Done" Text="Not Done" />            
                </euc:EformExtendedCheckBoxList>
               
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="20"  ID="ProcSide_17" TABLE="Procedures" FIELD="ProcSide" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="20"  ID="ProcSite_17" TABLE="Procedures" FIELD="ProcSite" />
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="20"  ID="ProcSubsite_17" TABLE="Procedures" FIELD="ProcSubsite" />

               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ParentRecordId="20"  ID="ProcQuality_17" TABLE="Procedures" FIELD="ProcQuality" />
               
               <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="17" ID="OpQuality_17" TABLE="OperatingRoomDetails" FIELD="OpQuality" /> 
               
               </td>
        <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_1" value="Accessory Nerve"    runat="server"   />Accessory Nerve
                    <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_1_Text" runat="server" RecordId="1" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_1" Runat="server" />
				    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_1"     Runat="server"/>
			        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="1" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_1" runat="server" /></td>
              <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_2" value="Steromastoid"    runat="server"   />Steromastoid
                    <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_2_Text" runat="server" RecordId="2" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_2" Runat="server" />
				    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_2"     Runat="server"/>
			        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="2" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_2" runat="server" /></td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_3" value="Internal Jugular Vein"    runat="server"   />Internal Jugular Vein
                    <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_3_Text" runat="server" RecordId="3" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_3" Runat="server" />
				    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_3"     Runat="server"/>
			        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="3" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_3" runat="server" /></td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <strong>Other:&nbsp;</strong>
                    <input type="text" id="ProcFinding_4" runat="server"   />
                    <euc:EformTextBox Width="1px" style="display: none;" ID="ProcFinding_4_Text" runat="server" RecordId="4" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFinding"/>             
                    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSide" ID="ProcFindSide_4" Runat="server" />
				    <euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSite"     ID="ProcFindSite_4"     Runat="server"/>
			        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="17"  TABLE="ProcedureFinding" FIELD="ProcFindSubsite" ID="ProcFindSubsite_4" runat="server" /></td>


        </tr>
        <tr>
            <td style="text-align: left; white-space: nowrap;"  >Left Levels </td>       
            <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTableBlue" >
                <euc:EformExtendedCheckBoxList style="white-space: nowrap;" Table="NoTable" Field="LevelsDissLeft" ID="LevelsDissLeft" runat="server" RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="1" Text="1" />
                    <asp:ListItem Value="2" Text="2" />
                    <asp:ListItem Value="3" Text="3" />
                    <asp:ListItem Value="4" Text="4" />
                    <asp:ListItem Value="5" Text="5" />
                    <asp:ListItem Value="6" Text="6" />
                    <asp:ListItem Value="7" Text="7" />
                    <asp:ListItem Value="N/K: Lateral" Text="N/K: Lateral" />
                    <asp:ListItem Value="N/K: Central" Text="N/K: Central" />
                    <asp:ListItem Value="N/K" Text="N/K" />
                    <asp:ListItem Value="Not Done" Text="Not Done" />           
                </euc:EformExtendedCheckBoxList>          
               </td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_5" value="Accessory Nerve"    runat="server"   />Accessory Nerve</td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_6" value="Steromastoid"    runat="server"   />Steromastoid</td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <input type="checkbox" id="ProcFinding_7" value="Internal Jugular Vein"    runat="server"   />Internal Jugular Vein</td>
           <td style="text-align: center; white-space: nowrap;" class="eformLargePopulatedTable" >
                    <strong>Other:&nbsp;</strong>
                    <input type="text" id="ProcFinding_8" runat="server"   /></td>
        </tr>


    </table>



    
<div id="NeckDissecitonDiv" runat="server" style="display: none;">
</div>



    
<script type="text/javascript">

    /* <![CDATA[ */
    addEvents($('<%= LateralDissectDone.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= OpQuality_17.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcFinding_1.ClientID %>'),$('<%= ProcFinding_1_Text.ClientID %>'),$('<%= ProcFindSide_1.ClientID %>'),$('<%= ProcFindSite_1.ClientID %>'),$('<%= ProcFindSubsite_1.ClientID %>'),$('<%= ProcFinding_5.ClientID %>'));
    addEvents($('<%= LateralDissectDone.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= OpQuality_17.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcFinding_2.ClientID %>'),$('<%= ProcFinding_2_Text.ClientID %>'),$('<%= ProcFindSide_2.ClientID %>'),$('<%= ProcFindSite_2.ClientID %>'),$('<%= ProcFindSubsite_2.ClientID %>'),$('<%= ProcFinding_6.ClientID %>'));
    addEvents($('<%= LateralDissectDone.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= OpQuality_17.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcFinding_3.ClientID %>'),$('<%= ProcFinding_3_Text.ClientID %>'),$('<%= ProcFindSide_3.ClientID %>'),$('<%= ProcFindSite_3.ClientID %>'),$('<%= ProcFindSubsite_3.ClientID %>'),$('<%= ProcFinding_7.ClientID %>'));
    addEvents($('<%= LateralDissectDone.ClientID %>'),$('<%= NeckDissecitonDiv.ClientID %>'),$('<%= OpQuality_17.ClientID %>'),$('<%= LevelsDissRight.ClientID %>'),$('<%= LevelsDissLeft.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= ProcQuality_17.ClientID %>'),$('<%= ProcSide_17.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),$('<%= ProcSubsite_17.ClientID %>'),$('<%= ProcFinding_4.ClientID %>'),$('<%= ProcFinding_4_Text.ClientID %>'),$('<%= ProcFindSide_4.ClientID %>'),$('<%= ProcFindSite_4.ClientID %>'),$('<%= ProcFindSubsite_4.ClientID %>'),$('<%= ProcFinding_8.ClientID %>'));
   
    //Adds events to controls
    function addEvents(neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft)
    { 
        
        if (procFindCBRight.type == 'checkbox')
            $(procFindCBRight).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        else if (procFindCBRight.type = 'text')
            $(procFindCBRight).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        
        if (procFindCBLeft.type == 'checkbox')
            $(procFindCBLeft).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        else if (procFindCBLeft.type = 'text')
            $(procFindCBLeft).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
  
  
        var rbl = neckDissectionRecorded.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++)
        {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                  $(rblRef).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        } 
 
        var cbl = levelsRightCBL.getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++)
        {
            var cblRef = cbl[j];
            if (cblRef.type == 'checkbox')
                  $(cblRef).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
            else if (cblRef.type == 'text')
                  $(cblRef).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        } 
        
        var cbl2 = levelsLeftCBL.getElementsByTagName('input');
        for (var j = 0; j < cbl2.length; j++)
        {
            var cblRef2 = cbl2[j];
            if (cblRef2.type == 'checkbox')
                  $(cblRef2).addEvent('click',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
            else if (cblRef2.type == 'text')
                  $(cblRef2).addEvent('blur',curry(SetHiddenFields,neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft));
        } 
        
        // show on load
        ShowDissectionOnLoad(neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft);
   }
 
    /* ]]> */

function ShowDissectionOnLoad(neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft)
{
    //re-check any structures that where saved
    if (procFindHidden.value != '')
    {




        var temp = procFindHidden.value;
        temp = temp.replace("Removed ","");

        if (procFindSideHidden.value == 'Right')
        {
            if (procFindCBRight.type == 'checkbox' && temp == procFindCBRight.value)
                procFindCBRight.checked = true;
            else if (procFindCBRight.type == 'text' && temp != 'Accessory Nerve' && temp != 'Steromastoid ' && temp != 'Internal Jugular Vein' )
                procFindCBRight.value = temp;
        }
        else if (procFindSideHidden.value == 'Left')
        {
             if (procFindCBLeft.type == 'checkbox' && temp == procFindCBLeft.value)
                procFindCBLeft.checked = true;
            else if (procFindCBLeft.type == 'text' && temp != 'Accessory Nerve' && temp != 'Steromastoid ' && temp != 'Internal Jugular Vein' )
                procFindCBLeft.value = temp;

        }
        else if (procFindSideHidden.value == 'Bilateral')
        {
            if (procFindCBRight.type == 'checkbox' && temp == procFindCBRight.value)
                procFindCBRight.checked = true;
            else if (procFindCBRight.type == 'text' && temp != 'Accessory Nerve' && temp != 'Steromastoid ' && temp != 'Internal Jugular Vein' )
                procFindCBRight.value = temp;
 
              if (procFindCBLeft.type == 'checkbox' && temp == procFindCBLeft.value)
                procFindCBLeft.checked = true;
            else if (procFindCBLeft.type == 'text' && temp != 'Accessory Nerve' && temp != 'Steromastoid ' && temp != 'Internal Jugular Vein' )
                procFindCBLeft.value = temp;
       }     
    }       
       
    SetHiddenFields(neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft);
} 
    
function SetHiddenFields(neckDissectionRecorded,neckDissectionDiv,opQualityHidden,levelsRightCBL,levelsLeftCBL,procDateText,procDate,procQualityHidden,procSideHidden,procSiteHidden,procSubsiteHidden,procFindCBRight,procFindHidden,procFindSideHidden,procFindSiteHidden,procFindSubsiteHidden,procFindCBLeft)
{
        var levelsRightCBLRef = levelsRightCBL.getElementsByTagName('input');
        var levelsLeftCBLRef = levelsLeftCBL.getElementsByTagName('input');
        var neckDissectionRecordedRef = neckDissectionRecorded.getElementsByTagName('input');
               
        for (var i = 0; i < neckDissectionRecordedRef.length; i++) 
            if (neckDissectionRecordedRef[i].checked) 
            {                 
                  if (neckDissectionRecordedRef[i].value != 'No' ) {
                   neckDissectionDiv.style.display='block';

                   }
                  else
                  {
                  

                    neckDissectionDiv.style.display='none';
//                    opDateText.value = '';
//                    opDate.value = '';   
                    
                    for (var i = 0; i < levelsRightCBLRef.length; i++)
                        levelsRightCBLRef[i].checked = false;
                        
                    for (var i = 0; i < levelsLeftCBLRef.length; i++)
                        levelsLeftCBLRef[i].checked = false;
                    
                    if (procFindCBRight.type == 'checkbox')
                        procFindCBRight.checked = false;
                    else if (procFindCBRight.type == 'text') 
                        procFindCBRight.value = '';
 
                     if (procFindCBLeft.type == 'checkbox')
                        procFindCBLeft.checked = false;
                    else if (procFindCBLeft.type == 'text') 
                        procFindCBLeft.value = '';                 
                  }
            }
            
         var levelsRightString = RetrieveCheckBoxListSelectedValues (levelsRightCBL,"FLOW");
         var levelsLeftString = RetrieveCheckBoxListSelectedValues (levelsLeftCBL,"FLOW");
            
           
        if (procDateText.value != '' || levelsRightString != '' || levelsLeftString != '')
        {            
//            procSiteHidden.value = 'Neck';
//            procNameHidden.value = 'Neck Dissection';
//            procDateText.value = opDateText.value;
//            procDate.value = opDate.value;
//            procQualityHidden.value = 'STD';
//            opQualityHidden.value = 'STD';            
            
            if (levelsRightString != '' && levelsLeftString == '')
            {
                procSideHidden.value = "Right";
                
                var temp = levelsRightString;
                temp = temp.replace("N/K: Lateral","1,2,3,4,5");
                temp = temp.replace("N/K: Central"," 6,7");
                temp = temp.replace("N/K","1,2,3,4,5,6,7");
                procSubsiteHidden.value = "Level: " + temp;
            }
            else if (levelsRightString == '' && levelsLeftString != '')
            {
                procSideHidden.value = "Left";
 
                var temp = levelsLeftString;
                temp = temp.replace("N/K: Lateral","1,2,3,4,5");
                temp = temp.replace("N/K: Central"," 6,7");
                temp = temp.replace("N/K","1,2,3,4,5,6,7");
                procSubsiteHidden.value = "Level: " + temp;
               
            }
            else if (levelsRightString != '' && levelsLeftString != '')
            {
                procSideHidden.value = "Bilateral";
                
                //determine if left and right checkbox have the same items checked
                var HaveSameItems = 'true';
                for (var i = 0; i < levelsRightCBLRef.length; i++)
                        if (levelsRightCBLRef[i].checked != levelsLeftCBLRef[i].checked)
                            HaveSameItems = 'false';
                            
                // if the left and right levels have the same items checked
                if (HaveSameItems == 'true')
                {
                    // use on one to fill the subsite field
                    var temp = levelsRightString;
                    temp = temp.replace("N/K: Lateral","1,2,3,4,5");
                    temp = temp.replace("N/K: Central"," 6,7");
                    temp = temp.replace("N/K","1,2,3,4,5,6,7");
                    procSubsiteHidden.value = "Level: " + temp;
                    
                }
                // else, the left and right levels have different items checked
                else
                {
                    //enter both into subsite field
                    var temp = levelsRightString;
                    temp = temp.replace("N/K: Lateral","1,2,3,4,5");
                    temp = temp.replace("N/K: Central"," 6,7");
                    temp = temp.replace("N/K","1,2,3,4,5,6,7");
                    temp = "Right Level: " + temp;                   
                    
                    var temp2 = levelsLeftString;
                    temp2 = temp2.replace("N/K: Lateral","1,2,3,4,5");
                    temp2 = temp2.replace("N/K: Central"," 6,7");
                    temp2 = temp2.replace("N/K","1,2,3,4,5,6,7");
                    temp2 = "Left Level: " + temp2;
                    
                    procSubsiteHidden.value = temp + "; " + temp2;                               
                }            
            }
        }
        else
        {
//            procSiteHidden.value = '';
//            procNameHidden.value = '';
            procSideHidden.value = '';
            procSubsiteHidden.value = '';
        }

        if (procFindCBRight.type == 'checkbox' && procFindCBLeft.type == 'checkbox')
        {
            if (procFindCBRight.checked || procFindCBLeft.checked)
            {                
                procFindSiteHidden.value = 'Neck';
                procFindSideHidden.value = procSideHidden.value;
                procFindSubsiteHidden.value = procSubsiteHidden.value;
                
                if (procFindCBRight.checked)
                    procFindHidden.value = "Removed " + procFindCBRight.value;
                else (procFindCBRight.checked)
                    procFindHidden.value = "Removed " + procFindCBLeft.value;                
            }
            else
            {
                procFindSiteHidden.value = '';
                procFindHidden.value = '';
                procFindSideHidden.value = '';
                procFindSubsiteHidden.value = '';
            }
        }
        else if (procFindCBRight.type == 'text' && procFindCBLeft.type == 'text')
        {
            if (procFindCBRight.value != '' || procFindCBLeft.value != '')
            {                
                procFindSiteHidden.value = 'Neck';
                procFindSideHidden.value = procSideHidden.value;
                procFindSubsiteHidden.value = procSubsiteHidden.value;
                
                if (procFindCBRight.value != '')
                    procFindHidden.value = "Removed " + procFindCBRight.value; 
                else if (procFindCBLeft.value != '')
                    procFindHidden.value = "Removed " + procFindCBLeft.value;               
            }
            else
            {
                procFindSiteHidden.value = '';
                procFindHidden.value = '';
                procFindSideHidden.value = '';
                procFindSubsiteHidden.value = '';
            }
        }
}
</script>









</div>
<table>
    <tr id="LateralNeckDissectionAbsentRow">
        <td>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="TableName" ID="TableName_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldName" ID="FieldName_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_2"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>

<br /><br />
<strong>Additional Surgeries</strong>
<table width="450" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="AdditionalPrimayProcHtmlTable">
    <tr>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Approach</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Procedure</td>
        <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    </tr>
    <tr>
        <td>
            <euc:EformTextBox Width="100px"   RecordId="50"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_50" Runat="server" ShowCalendar="true" CalcDate="true" />
		    <euc:EformTextBox Width="1px" style="display: none;"    RecordId="50"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_50"     Runat="server"/></td>
	    <td>
            <euc:EformRadioButtonList style="white-space: nowrap;" RecordId="50" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_50" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
            </euc:EformRadioButtonList></td>
        <td>
            <euc:EformComboBox Width="120px" RecordId="50" TABLE="Procedures" FIELD="ProcName" ID="ProcName_50" LookupCode="ProcName,Disease,HeadNeck" runat="server" DropDownWidth="250px"  />
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="50" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_50" runat="server" /></td>
       
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_50" runat="server" /></td>        
   </tr>
    <tr style="display: none;">
        <td>
            <euc:EformTextBox Width="100px"   RecordId="51"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_51" Runat="server" ShowCalendar="true" CalcDate="true" />
		    <euc:EformTextBox Width="1px" style="display: none;"    RecordId="51"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_51"     Runat="server"/></td>
	    <td>
            <euc:EformRadioButtonList style="white-space: nowrap;" RecordId="51" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_51" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
            </euc:EformRadioButtonList></td>
        <td>
            <euc:EformComboBox Width="120px" RecordId="51" TABLE="Procedures" FIELD="ProcName" ID="ProcName_51" LookupCode="ProcName,Disease,HeadNeck" runat="server" DropDownWidth="200px"  />
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="51" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_51" runat="server" /></td>
       
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_51" runat="server" /></td>        
   </tr>
    <tr style="display: none;">
        <td>
            <euc:EformTextBox Width="100px"   RecordId="52"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_52" Runat="server" ShowCalendar="true" CalcDate="true" />
		    <euc:EformTextBox Width="1px" style="display: none;"    RecordId="52"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_52"     Runat="server"/></td>
	    <td>
            <euc:EformRadioButtonList style="white-space: nowrap;" RecordId="52" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_52" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
            </euc:EformRadioButtonList></td>
        <td>
            <euc:EformComboBox Width="120px" RecordId="52" TABLE="Procedures" FIELD="ProcName" ID="ProcName_52" LookupCode="ProcName,Disease,HeadNeck" runat="server" DropDownWidth="200px" />
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="52" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_52" runat="server" /></td>
       
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_52" runat="server" /></td>        
   </tr>
    <tr style="display: none;">
        <td>
            <euc:EformTextBox Width="100px"   RecordId="53"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_53" Runat="server" ShowCalendar="true" CalcDate="true" />
		    <euc:EformTextBox Width="1px" style="display: none;"    RecordId="53"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_53"     Runat="server"/></td>
	    <td>
            <euc:EformRadioButtonList style="white-space: nowrap;" RecordId="53" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_53" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
            </euc:EformRadioButtonList></td>
        <td>
            <euc:EformComboBox Width="120px" RecordId="53" TABLE="Procedures" FIELD="ProcName" ID="ProcName_53" LookupCode="ProcName,Disease,HeadNeck" runat="server" DropDownWidth="200px"  />
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="53" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_53" runat="server" /></td>
       
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_53" runat="server" /></td>        
   </tr>
    <tr style="display: none;">
        <td>
            <euc:EformTextBox Width="100px"   RecordId="54"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_54" Runat="server" ShowCalendar="true" CalcDate="true" />
		    <euc:EformTextBox Width="1px" style="display: none;"    RecordId="54"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_54"     Runat="server"/></td>
	    <td>
            <euc:EformRadioButtonList style="white-space: nowrap;" RecordId="54" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_54" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
            </euc:EformRadioButtonList></td>
        <td>
            <euc:EformComboBox Width="120px" RecordId="54" TABLE="Procedures" FIELD="ProcName" ID="ProcName_54" LookupCode="ProcName,Disease,HeadNeck" runat="server" DropDownWidth="200px"  />
            <euc:EformTextBox Width="1px" style="display: none;"  RecordId="54" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_54" runat="server" /></td>
       
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_54" runat="server" /></td>        
   </tr>
 </table>
<img alt="row" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'AdditionalPrimayProcHtmlTable');" />

</div>


<br /><br /><br />


<script type="text/javascript">

// DATETEXT - DATE HANDLING  -- 
function GlobalAssociatedDate(dateTextElement,dateElement)
{
    dateTextElementId = dateTextElement.id;
    dateDisplayId = dateTextElementId.replace('DateText','DateDisplay');
    dateDisplayElement = document.getElementById(dateDisplayId);
    fuzzyDate(dateTextElement, dateElement);
    if (dateElement && dateDisplayElement) { dateDisplayElement.innerHTML = dateElement.value; }
}

    //Adds blur event to combo   
    addAbsentEvent($('<%= PrimaryProcRecorded.ClientID %>'),$('<%= PrimaryProcDiv.ClientID %>'),$('<%= PrimaryProcAbsentDiv.ClientID %>'));

    function addAbsentEvent(primaryProcRecordedID,primaryProcDivID,primaryProcAbsentDivID)
    {  
        $(primaryProcRecordedID).addEvent('click',curry(PrimaryProcYesNo,primaryProcRecordedID,primaryProcDivID,primaryProcAbsentDivID));

        // check on load as well
        PrimaryProcYesNo(primaryProcRecordedID,primaryProcDivID,primaryProcAbsentDivID);
    }
   
    /* ]]> */
   
    function PrimaryProcYesNo(primaryProcRecordedID,primaryProcDivID,primaryProcAbsentDivID)
    {
       var primaryProcRecordedRef = primaryProcRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < primaryProcRecordedRef.length; i++) 
        if (primaryProcRecordedRef[i].checked) {  
            PrimaryProcRadioClick(primaryProcRecordedRef[i].value,primaryProcDivID,primaryProcAbsentDivID);
            }
    }
    
    function PrimaryProcRadioClick(PrimaryProcoption_value,PrimaryProchideDiv,PrimaryProchideAbsentDiv)
    {
      if (PrimaryProcoption_value == "Yes")
      { 
        PrimaryProchideDiv.style.display='block';
        PrimaryProchideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_12.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_12.ClientID %>').value='';
        document.getElementById('<%= TableName_12.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_12.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_12.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_12.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_12.ClientID %>').value = '';
        
      } 
      else if (PrimaryProcoption_value == "No")
      {
        PrimaryProchideDiv.style.display='none';
        PrimaryProchideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_12.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_12.ClientID %>').value='';
        document.getElementById('<%= TableName_12.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_12.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_12.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_12.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_12.ClientID %>').value = '';

        document.getElementById('<%= ProcDateText.ClientID %>').value='';
        document.getElementById('<%= ProcDate.ClientID %>').value='';
        
        var procApproachID = document.getElementById('<%= ProcApproach.ClientID %>');
        var procApproachRef = procApproachID.getElementsByTagName('input');
        for (var i = 0; i < procApproachRef.length; i++)
            if (procApproachRef[i].checked) { 
                procApproachRef[i].checked = false;
                procApproachRef[i].value = '';
            }

        var procNamePrefixID = document.getElementById('<%= ProcNamePrefix.ClientID %>');
        var procNamePrefixRef = procNamePrefixID.getElementsByTagName('input');
        for (var i = 0; i < procNamePrefixRef.length; i++)
            if (procNamePrefixRef[i].checked) { 
                procNamePrefixRef[i].checked = false;
                procNamePrefixRef[i].value = '';
            }
        
        var procIndicationID = document.getElementById('<%= ProcIndication.ClientID %>');
        var procIndicationRef = procIndicationID.getElementsByTagName('input');
        for (var i = 0; i < procIndicationRef.length; i++)
            if (procIndicationRef[i].checked) { 
                procIndicationRef[i].checked = false;
                procIndicationRef[i].value = '';
            }
        
        document.getElementById('<%= OpDateText_20.ClientID %>').value='';
        document.getElementById('<%= OpDate_20.ClientID %>').value='';
        document.getElementById('<%= OpQuality_20.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_19_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_19.ClientID %>').value='';
        document.getElementById('<%= ProcDate_19.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_19.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_19.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_19.ClientID %>').value='';

        document.getElementById('<%= ProcPrimary_20.ClientID %>').value='';
        document.getElementById('<%= ProcName_20_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_20.ClientID %>').value='';
        document.getElementById('<%= ProcDate_20.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_20.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_20.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_20.ClientID %>').value='';
        document.getElementById('<%= PathSpecimenType_20.ClientID %>').value='';

        document.getElementById('<%= ProcName_21_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_21.ClientID %>').value='';
        document.getElementById('<%= ProcDate_21.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_21.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_21.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_21.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_22_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_22.ClientID %>').value='';
        document.getElementById('<%= ProcDate_22.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_22.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_22.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_22.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_23_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_23.ClientID %>').value='';
        document.getElementById('<%= ProcDate_23.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_23.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_23.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_23.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_24_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_24.ClientID %>').value='';
        document.getElementById('<%= ProcDate_24.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_24.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_24.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_24.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_25_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_25.ClientID %>').value='';
        document.getElementById('<%= ProcDate_25.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_25.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_25.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_25.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_26_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_26.ClientID %>').value='';
        document.getElementById('<%= ProcDate_26.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_26.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_26.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_26.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_27_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_27.ClientID %>').value='';
        document.getElementById('<%= ProcDate_27.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_27.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_27.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_27.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_28_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_28.ClientID %>').value='';
        document.getElementById('<%= ProcDate_28.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_28.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_28.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_28.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_29_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_29.ClientID %>').value='';
        document.getElementById('<%= ProcDate_29.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_29.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_29.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_29.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_30_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_30.ClientID %>').value='';
        document.getElementById('<%= ProcDate_30.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_30.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_30.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_30.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_31_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_31.ClientID %>').value='';
        document.getElementById('<%= ProcDate_31.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_31.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_31.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_31.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_32_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_32.ClientID %>').value='';
        document.getElementById('<%= ProcDate_32.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_32.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_32.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_32.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_33_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_33.ClientID %>').value='';
        document.getElementById('<%= ProcDate_33.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_33.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_33.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_33.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_34_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_34.ClientID %>').value='';
        document.getElementById('<%= ProcDate_34.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_34.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_34.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_34.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_35_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_35.ClientID %>').value='';
        document.getElementById('<%= ProcDate_35.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_35.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_35.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_35.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_36_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_36.ClientID %>').value='';
        document.getElementById('<%= ProcDate_36.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_36.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_36.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_36.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_37_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_37.ClientID %>').value='';
        document.getElementById('<%= ProcDate_37.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_37.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_37.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_37.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_38_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_38.ClientID %>').value='';
        document.getElementById('<%= ProcDate_38.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_38.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_38.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_38.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_39_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_39.ClientID %>').value='';
        document.getElementById('<%= ProcDate_39.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_39.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_39.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_40.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_40_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_40.ClientID %>').value='';
        document.getElementById('<%= ProcDate_40.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_40.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_40.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_40.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_41_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_41.ClientID %>').value='';
        document.getElementById('<%= ProcDate_41.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_41.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_41.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_41.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_42_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_42.ClientID %>').value='';
        document.getElementById('<%= ProcDate_42.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_42.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_42.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_42.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_43_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_43.ClientID %>').value='';
        document.getElementById('<%= ProcDate_43.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_43.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_43.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_43.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_44_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_44.ClientID %>').value='';
        document.getElementById('<%= ProcDate_44.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_44.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_44.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_44.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_45_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_45.ClientID %>').value='';
        document.getElementById('<%= ProcDate_45.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_45.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_45.ClientID %>').value='';
        document.getElementById('<%= ProcQuality_45.ClientID %>').value='';
       
        document.getElementById('<%= ProcName_50.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_50.ClientID %>').value='';
        document.getElementById('<%= ProcDate_50.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_50.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_50.ClientID %>').value='';
       
        document.getElementById('<%= ProcName_51.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_51.ClientID %>').value='';
        document.getElementById('<%= ProcDate_51.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_51.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_51.ClientID %>').value='';

        document.getElementById('<%= ProcName_52.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_52.ClientID %>').value='';
        document.getElementById('<%= ProcDate_52.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_52.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_52.ClientID %>').value='';
       
        document.getElementById('<%= ProcName_53.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_53.ClientID %>').value='';
        document.getElementById('<%= ProcDate_53.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_53.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_53.ClientID %>').value='';
       
        document.getElementById('<%= ProcName_54.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_54.ClientID %>').value='';
        document.getElementById('<%= ProcDate_54.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_54.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_54.ClientID %>').value='';
       
       

        }
    }



//****************************************************************************
//****************************************************************************
//****************************************************************************
      
    //Adds events to controls
    function addEvents(procNamePrefixID,indicationDIV,procIndicationID,procNameID,procNameCBID)
    { 
//        $(procNamePrefixID).addEvent('click',curry(ShowIndication,procNamePrefixID,indicationDIV,procIndicationID));
          ShowIndication(procNamePrefixID,indicationDIV,procIndicationID);
          ShowOnLoad(indicationDIV,procNamePrefixID,procNameID,procNameCBID);
    }

    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_19_Text.ClientID %>'),$('<%= ProcName_19.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_20_Text.ClientID %>'),$('<%= ProcName_20.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_21_Text.ClientID %>'),$('<%= ProcName_21.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_22_Text.ClientID %>'),$('<%= ProcName_22.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_23_Text.ClientID %>'),$('<%= ProcName_23.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_24_Text.ClientID %>'),$('<%= ProcName_24.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_25_Text.ClientID %>'),$('<%= ProcName_25.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_26_Text.ClientID %>'),$('<%= ProcName_26.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_27_Text.ClientID %>'),$('<%= ProcName_27.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_28_Text.ClientID %>'),$('<%= ProcName_28.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_29_Text.ClientID %>'),$('<%= ProcName_29.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_30_Text.ClientID %>'),$('<%= ProcName_30.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_31_Text.ClientID %>'),$('<%= ProcName_31.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_32_Text.ClientID %>'),$('<%= ProcName_32.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_33_Text.ClientID %>'),$('<%= ProcName_33.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_34_Text.ClientID %>'),$('<%= ProcName_34.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_35_Text.ClientID %>'),$('<%= ProcName_35.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_36_Text.ClientID %>'),$('<%= ProcName_36.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_37_Text.ClientID %>'),$('<%= ProcName_37.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_38_Text.ClientID %>'),$('<%= ProcName_38.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_39_Text.ClientID %>'),$('<%= ProcName_39.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_40_Text.ClientID %>'),$('<%= ProcName_40.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_41_Text.ClientID %>'),$('<%= ProcName_41.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_42_Text.ClientID %>'),$('<%= ProcName_42.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_43_Text.ClientID %>'),$('<%= ProcName_43.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_44_Text.ClientID %>'),$('<%= ProcName_44.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_45_Text.ClientID %>'),$('<%= ProcName_45.ClientID %>'));


    function ShowIndication(procNamePrefixID, indicationDIV, procIndicationID) {
  
        // if salvage is clicked, show the indication block on post back
         var prefixRef = procNamePrefixID.getElementsByTagName("input");
         var indicationRef = procIndicationID.getElementsByTagName("input");

         for (var i = 0; i < prefixRef.length; i++) 
         {
                if (prefixRef[i].checked && prefixRef[i].value == 'Salvage') 
                    indicationDIV.style.display = 'block';

                else if (prefixRef[i].checked && prefixRef[i].value == 'Primary') 
                {
                    indicationDIV.style.display = 'none';                      
                    for (var i = 0; i < indicationRef.length; i++) 
                        if (indicationRef[i].checked) 
                            indicationRef[i].checked = false;
                }
         }
    }
    
   function  ShowOnLoad(indicationDIV,procNamePrefixID,procNameID,procNameCBID)
   {   
     // on postback, if salvage is clicked, show the indication block
     var radioList = procNamePrefixID.getElementsByTagName('input');

     for (var i = 0; i < radioList.length; i ++) {

        if (radioList[i].checked) 
        {          
          if (radioList[i].value == 'Salvage'){
                   
            indicationDIV.style.display = 'block';
          }
        }
     }
     
     // on postback, if the hidden procName texbox has a value
     if (procNameID.value != '') {
     
        // check the input checkbox
        if (procNameCBID.type == 'checkbox')
            procNameCBID.checked = true;
        
        // re-enter the new procedure name into the textbox, without the prefix
        else if (procNameCBID.type == 'text') {
        
            var tempStr = procNameID.value;
            tempStr =  tempStr.replace("Primary", "");
            tempStr =  tempStr.replace("Salvage", "");
            tempStr =  tempStr.replace(" ", "");
            procNameCBID.value = tempStr;
        }
     }
   }
   
//************************************************
//************************************************

    addProcEvents($('<%= ProcName_19_Text.ClientID %>'), $('<%= ProcName_19.ClientID %>'), $('<%= ProcDateText_19.ClientID %>') ,$('<%= ProcDate_19.ClientID %>'), $('<%= ProcApproach_19.ClientID %>'), $('<%= ProcIndication_19.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_19.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_20_Text.ClientID %>'), $('<%= ProcName_20.ClientID %>'), $('<%= ProcDateText_20.ClientID %>') ,$('<%= ProcDate_20.ClientID %>'), $('<%= ProcApproach_20.ClientID %>'), $('<%= ProcIndication_20.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_20.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_21_Text.ClientID %>'), $('<%= ProcName_21.ClientID %>'), $('<%= ProcDateText_21.ClientID %>') ,$('<%= ProcDate_21.ClientID %>'), $('<%= ProcApproach_21.ClientID %>'), $('<%= ProcIndication_21.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_21.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_22_Text.ClientID %>'), $('<%= ProcName_22.ClientID %>'), $('<%= ProcDateText_22.ClientID %>') ,$('<%= ProcDate_22.ClientID %>'), $('<%= ProcApproach_22.ClientID %>'), $('<%= ProcIndication_22.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_22.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_23_Text.ClientID %>'), $('<%= ProcName_23.ClientID %>'), $('<%= ProcDateText_23.ClientID %>') ,$('<%= ProcDate_23.ClientID %>'), $('<%= ProcApproach_23.ClientID %>'), $('<%= ProcIndication_23.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_23.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_24_Text.ClientID %>'), $('<%= ProcName_24.ClientID %>'), $('<%= ProcDateText_24.ClientID %>') ,$('<%= ProcDate_24.ClientID %>'), $('<%= ProcApproach_24.ClientID %>'), $('<%= ProcIndication_24.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_24.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_25_Text.ClientID %>'), $('<%= ProcName_25.ClientID %>'), $('<%= ProcDateText_25.ClientID %>') ,$('<%= ProcDate_25.ClientID %>'), $('<%= ProcApproach_25.ClientID %>'), $('<%= ProcIndication_25.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_25.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_26_Text.ClientID %>'), $('<%= ProcName_26.ClientID %>'), $('<%= ProcDateText_26.ClientID %>') ,$('<%= ProcDate_26.ClientID %>'), $('<%= ProcApproach_26.ClientID %>'), $('<%= ProcIndication_26.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_26.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_27_Text.ClientID %>'), $('<%= ProcName_27.ClientID %>'), $('<%= ProcDateText_27.ClientID %>') ,$('<%= ProcDate_27.ClientID %>'), $('<%= ProcApproach_27.ClientID %>'), $('<%= ProcIndication_27.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_27.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_28_Text.ClientID %>'), $('<%= ProcName_28.ClientID %>'), $('<%= ProcDateText_28.ClientID %>') ,$('<%= ProcDate_28.ClientID %>'), $('<%= ProcApproach_28.ClientID %>'), $('<%= ProcIndication_28.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_28.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_29_Text.ClientID %>'), $('<%= ProcName_29.ClientID %>'), $('<%= ProcDateText_29.ClientID %>') ,$('<%= ProcDate_29.ClientID %>'), $('<%= ProcApproach_29.ClientID %>'), $('<%= ProcIndication_29.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_29.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_30_Text.ClientID %>'), $('<%= ProcName_30.ClientID %>'), $('<%= ProcDateText_30.ClientID %>') ,$('<%= ProcDate_30.ClientID %>'), $('<%= ProcApproach_30.ClientID %>'), $('<%= ProcIndication_30.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_30.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_31_Text.ClientID %>'), $('<%= ProcName_31.ClientID %>'), $('<%= ProcDateText_31.ClientID %>') ,$('<%= ProcDate_31.ClientID %>'), $('<%= ProcApproach_31.ClientID %>'), $('<%= ProcIndication_31.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_31.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_32_Text.ClientID %>'), $('<%= ProcName_32.ClientID %>'), $('<%= ProcDateText_32.ClientID %>') ,$('<%= ProcDate_32.ClientID %>'), $('<%= ProcApproach_32.ClientID %>'), $('<%= ProcIndication_32.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_32.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_33_Text.ClientID %>'), $('<%= ProcName_33.ClientID %>'), $('<%= ProcDateText_33.ClientID %>') ,$('<%= ProcDate_33.ClientID %>'), $('<%= ProcApproach_33.ClientID %>'), $('<%= ProcIndication_33.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_33.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_34_Text.ClientID %>'), $('<%= ProcName_34.ClientID %>'), $('<%= ProcDateText_34.ClientID %>') ,$('<%= ProcDate_34.ClientID %>'), $('<%= ProcApproach_34.ClientID %>'), $('<%= ProcIndication_34.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_34.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_35_Text.ClientID %>'), $('<%= ProcName_35.ClientID %>'), $('<%= ProcDateText_35.ClientID %>') ,$('<%= ProcDate_35.ClientID %>'), $('<%= ProcApproach_35.ClientID %>'), $('<%= ProcIndication_35.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_35.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_36_Text.ClientID %>'), $('<%= ProcName_36.ClientID %>'), $('<%= ProcDateText_36.ClientID %>') ,$('<%= ProcDate_36.ClientID %>'), $('<%= ProcApproach_36.ClientID %>'), $('<%= ProcIndication_36.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_36.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_37_Text.ClientID %>'), $('<%= ProcName_37.ClientID %>'), $('<%= ProcDateText_37.ClientID %>') ,$('<%= ProcDate_37.ClientID %>'), $('<%= ProcApproach_37.ClientID %>'), $('<%= ProcIndication_37.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_37.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_38_Text.ClientID %>'), $('<%= ProcName_38.ClientID %>'), $('<%= ProcDateText_38.ClientID %>') ,$('<%= ProcDate_38.ClientID %>'), $('<%= ProcApproach_38.ClientID %>'), $('<%= ProcIndication_38.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_38.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_39_Text.ClientID %>'), $('<%= ProcName_39.ClientID %>'), $('<%= ProcDateText_39.ClientID %>') ,$('<%= ProcDate_39.ClientID %>'), $('<%= ProcApproach_39.ClientID %>'), $('<%= ProcIndication_39.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_39.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_40_Text.ClientID %>'), $('<%= ProcName_40.ClientID %>'), $('<%= ProcDateText_40.ClientID %>') ,$('<%= ProcDate_40.ClientID %>'), $('<%= ProcApproach_40.ClientID %>'), $('<%= ProcIndication_40.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_40.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_41_Text.ClientID %>'), $('<%= ProcName_41.ClientID %>'), $('<%= ProcDateText_41.ClientID %>') ,$('<%= ProcDate_41.ClientID %>'), $('<%= ProcApproach_41.ClientID %>'), $('<%= ProcIndication_41.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_41.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_42_Text.ClientID %>'), $('<%= ProcName_42.ClientID %>'), $('<%= ProcDateText_42.ClientID %>') ,$('<%= ProcDate_42.ClientID %>'), $('<%= ProcApproach_42.ClientID %>'), $('<%= ProcIndication_42.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_42.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_43_Text.ClientID %>'), $('<%= ProcName_43.ClientID %>'), $('<%= ProcDateText_43.ClientID %>') ,$('<%= ProcDate_43.ClientID %>'), $('<%= ProcApproach_43.ClientID %>'), $('<%= ProcIndication_43.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_43.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_44_Text.ClientID %>'), $('<%= ProcName_44.ClientID %>'), $('<%= ProcDateText_44.ClientID %>') ,$('<%= ProcDate_44.ClientID %>'), $('<%= ProcApproach_44.ClientID %>'), $('<%= ProcIndication_44.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_44.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));
    addProcEvents($('<%= ProcName_45_Text.ClientID %>'), $('<%= ProcName_45.ClientID %>'), $('<%= ProcDateText_45.ClientID %>') ,$('<%= ProcDate_45.ClientID %>'), $('<%= ProcApproach_45.ClientID %>'), $('<%= ProcIndication_45.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'), $('<%= ProcQuality_45.ClientID %>'), $('<%= OpDateText_20.ClientID %>'), $('<%= OpDate_20.ClientID %>'), $('<%= OpQuality_20.ClientID %>'));

    function addProcEvents(procNameID,procNameCBID, procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID, procQualityID, opRmDateTextID,opRmDateID,opRmQualityID)
    {            
        // update associated global date element
        $(dateTextID).addEvent('blur',curry(GlobalAssociatedDate,dateTextID, dateID));
        // also, calculate on page load
        GlobalAssociatedDate(dateTextID, dateID);
               
        if (procNameCBID.type == 'checkbox') {
            $(procNameCBID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID, procQualityID, opRmDateTextID,opRmDateID,opRmQualityID));
        }
        else if (procNameCBID.type == 'text') {
            $(procNameCBID).addEvent('blur',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID, procQualityID, opRmDateTextID,opRmDateID,opRmQualityID));
        }
        else if (procNameCBID.type == 'hidden') {
        
            $(procNameID).addEvent('blur',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID, procQualityID, opRmDateTextID,opRmDateID,opRmQualityID));        
        }
       
        $(dateTextID).addEvent('blur',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID, procQualityID, opRmDateTextID,opRmDateID,opRmQualityID));
        $(approachID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID, procQualityID, opRmDateTextID,opRmDateID,opRmQualityID));
        $(indicationID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID, procQualityID, opRmDateTextID,opRmDateID,opRmQualityID));
        $(procNamePrefixID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID, procQualityID, opRmDateTextID,opRmDateID,opRmQualityID));    

    }
    
    function onProcClick(procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID, procQualityID, opRmDateTextID,opRmDateID,opRmQualityID) {
    
        var prefixList = procNamePrefixID.getElementsByTagName("input");
            
        for (var i = 0; i < prefixList.length; i++) {

            // determine if the prefix Primary or Salvage is clicked
            if(prefixList[i].checked)
            { 
                setProcValues(prefixList[i].value,procNameCBID,procNameID);
                break;
            }
            
            // if no prefix selected, just used procedure name as is
            if (procNameCBID.type == 'checkbox')
                if (procNameCBID.checked)
                    procNameID.value = procNameCBID.value;
            else if (procNameCBID.type == 'text')
                if (procNameCBID.value != '')
                    procNameID.value = procNameCBID.value;                
            else if (procNameCBID.type == 'hidden')
                    procNameID.value = procNameID.value; 
         }
                       
        // set additional hidden fields for procedure
        SetProcedureFields (procNameID, procNameCBID, procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID, procQualityID, opRmDateTextID,opRmDateID,opRmQualityID); 
                  
    }   

    function setProcValues(prefix,procNameCBox,procNameTbox) {
              
            // appened the prefix to the procedure name
            if (procNameCBox.type == 'checkbox')
            {
                if (procNameCBox.checked) {
//                    procNameTbox.value = prefix + ' ' + procNameCBox.value;  
                      procNameTbox.value = procNameCBox.value;                   
                }
                else {
                    procNameTbox.value = '';
                }
            }
            else if (procNameCBox.type == 'text')
            {
                if (procNameCBox.value != '') {
//                    procNameTbox.value = prefix + ' ' + procNameCBox.value;   
                      procNameTbox.value = procNameCBox.value;                   
                }
                else {
                    procNameTbox.value = '';
                }            
            }
            else if (procNameCBox.type == 'hidden')
            {
                  procNameTbox.value = procNameTbox.value;         
            }            
  }       

    
    function SetProcedureFields (procNameID, procNameCBID, procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID, procQualityID, opRmDateTextID,opRmDateID,opRmQualityID) 
    {
        var procNamePrefixRef = procNamePrefixID.getElementsByTagName("input");
        var approachRef = approachID.getElementsByTagName("input");
        var indicationRef = indicationID.getElementsByTagName("input");
 
                 
      // if user clicked a procedure name            
      if (procNameCBID.type == 'checkbox')
      {
        if (procNameCBID.checked)
        {                  
            // set hidden fields for procedure date 
            procDateTextID.value = dateTextID.value;
            procDateID.value = dateID.value;
            procQualityID.value = 'STD';
            opRmDateTextID.value = dateTextID.value;
            opRmDateID.value = dateID.value;
            opRmQualityID.value = 'STD';
            
            // set hidden fields for procedure approach 
             for (var i = 0; i < approachRef.length; i++) 
                if (approachRef[i].checked) {
                    procApproachID.value = approachRef[i].value;
                    }

            // set hidden fields for procedure indication, only if 'Salvage' prefix is selected 
             for (var i = 0; i < procNamePrefixRef.length; i++) 
                if (procNamePrefixRef[i].checked && procNamePrefixRef[i].value != 'Primary') {                    
                     for (var i = 0; i < indicationRef.length; i++) 
                        if (indicationRef[i].checked) {
                            procIndicationID.value = indicationRef[i].value;
                            }
                    }
                    else    
                        procIndicationID.value = '';
            
        }
        else
        {
            procDateTextID.value = '';
            procDateID.value = '';
            procApproachID.value = '';
            procIndicationID.value = '';
            procQualityID.value = '';
        }        
      }
      
      // if user typed a new procedure name 
      else if (procNameCBID.type == 'text') 
      {
        if (procNameCBID.value != '')
        {
           // set hidden fields for procedure date 
            procDateTextID.value = dateTextID.value;
            procDateID.value = dateID.value;
            procQualityID.value = 'STD';
            opRmDateTextID.value = dateTextID.value;
            opRmDateID.value = dateID.value;
            opRmQualityID.value = 'STD';
            
            // set hidden fields for procedure approach 
             for (var i = 0; i < approachRef.length; i++) 
                if (approachRef[i].checked) {
                    procApproachID.value = approachRef[i].value;
                    }
            // set hidden fields for procedure indication 
             for (var i = 0; i < indicationRef.length; i++) 
                if (indicationRef[i].checked) {
                    procIndicationID.value = indicationRef[i].value;
                }
        }
        else
        {
            procDateTextID.value = '';
            procDateID.value = '';
            procApproachID.value = '';
            procIndicationID.value = '';
            procQualityID.value = '';        
        }
      }
      // if primary proc was entered 
      else if (procNameCBID.type == 'hidden') 
      {  
            if (procNameID.value != '')
            {
                // set as primay procedure
                document.getElementById('<%= ProcPrimary_20.ClientID %>').value = '1';
                document.getElementById('<%= PathSpecimenType_20.ClientID %>').value = procNameID.value;

               // set hidden fields for procedure date 
                procDateTextID.value = dateTextID.value;
                procDateID.value = dateID.value;
                procQualityID.value = 'STD';
                opRmDateTextID.value = dateTextID.value;
                opRmDateID.value = dateID.value;
                opRmQualityID.value = 'STD';
            
                // set hidden fields for procedure approach 
                 for (var i = 0; i < approachRef.length; i++) 
                    if (approachRef[i].checked) {
                        procApproachID.value = approachRef[i].value;
                        }
                // set hidden fields for procedure indication 
                 for (var i = 0; i < indicationRef.length; i++) 
                    if (indicationRef[i].checked) {
                        procIndicationID.value = indicationRef[i].value;
                    }
             }
             else
             {
                procDateTextID.value = '';
                procDateID.value = '';
                procApproachID.value = '';
                procIndicationID.value = '';
                procQualityID.value = '';          
                document.getElementById('<%= ProcPrimary_20.ClientID %>').value = '';
                document.getElementById('<%= PathSpecimenType_20.ClientID %>').value = '';
             }
        }        
    } 
    
    
//*******************************************************************************
//*******************************************************************************
//*******************************************************************************

    addAbsentEvent2($('<%= ReconProcDone.ClientID %>'),$('<%= ReconProcDiv.ClientID %>'),$('<%= ReconProcAbsentDiv.ClientID %>'),$('<%= LateralDissectDone.ClientID %>'),$('<%= LateralDissectDiv.ClientID %>'),$('<%= LateralDissectAbsentDiv.ClientID %>'));

    function addAbsentEvent2(reconProcRecordedID,reconProcDivID,reconProcAbsentDivID,lateralDissectRecordedID,lateralDissectDivID,lateralDissectAbsentDivID)
    {  
        $(reconProcRecordedID).addEvent('click',curry(ReconProcYesNo,reconProcRecordedID,reconProcDivID,reconProcAbsentDivID));
        $(lateralDissectRecordedID).addEvent('click',curry(LateralDissectYesNo,lateralDissectRecordedID,lateralDissectDivID,lateralDissectAbsentDivID));
       
        // check on load as well
       ReconProcYesNo(reconProcRecordedID,reconProcDivID,reconProcAbsentDivID);
       LateralDissectYesNo(lateralDissectRecordedID,lateralDissectDivID,lateralDissectAbsentDivID);

    }
   
    /* ]]> */
    
   
    function ReconProcYesNo(reconProcRecordedID,reconProcDivID,reconProcAbsentDivID)
    {
       var reconProcRecordedRef = reconProcRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < reconProcRecordedRef.length; i++) 
        if (reconProcRecordedRef[i].checked) {  
            ReconProcRadioClick(reconProcRecordedRef[i].value,reconProcDivID,reconProcAbsentDivID);
            }
    }

    function ReconProcRadioClick(ReconProcoption_value,ReconProchideDiv,ReconProchideAbsentDiv)
    {
      if (ReconProcoption_value == "Yes" )
      { 
       ReconProchideDiv.style.display='block';
       ReconProchideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_7.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_7.ClientID %>').value='';
        document.getElementById('<%= TableName_7.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_7.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_7.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_7.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_7.ClientID %>').value = '';
        
      } 
      else if (ReconProcoption_value == "No")
      {
       ReconProchideDiv.style.display='none';
       ReconProchideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_7.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_7.ClientID %>').value='';
        document.getElementById('<%= TableName_7.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_7.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_7.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_7.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_7.ClientID %>').value = '';
                
        document.getElementById('<%= ProcName_36.ClientID %>').checked=false;
        document.getElementById('<%= ProcName_36_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_36.ClientID %>').value='';
        document.getElementById('<%= ProcDate_36.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_36.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_36.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_37.ClientID %>').checked=false;
        document.getElementById('<%= ProcName_37_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_37.ClientID %>').value='';
        document.getElementById('<%= ProcDate_37.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_37.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_37.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_38.ClientID %>').checked=false;
        document.getElementById('<%= ProcName_38_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_38.ClientID %>').value='';
        document.getElementById('<%= ProcDate_38.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_38.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_38.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_39.ClientID %>').checked=false;
        document.getElementById('<%= ProcName_39_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_39.ClientID %>').value='';
        document.getElementById('<%= ProcDate_39.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_39.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_39.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_40.ClientID %>').checked=false;
        document.getElementById('<%= ProcName_40_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_40.ClientID %>').value='';
        document.getElementById('<%= ProcDate_40.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_40.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_40.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_41.ClientID %>').checked=false;
        document.getElementById('<%= ProcName_41_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_41.ClientID %>').value='';
        document.getElementById('<%= ProcDate_41.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_41.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_41.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_42.ClientID %>').checked=false;
        document.getElementById('<%= ProcName_42_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_42.ClientID %>').value='';
        document.getElementById('<%= ProcDate_42.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_42.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_42.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_43.ClientID %>').checked=false;
        document.getElementById('<%= ProcName_43_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_43.ClientID %>').value='';
        document.getElementById('<%= ProcDate_43.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_43.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_43.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_44.ClientID %>').checked=false;
        document.getElementById('<%= ProcName_44_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_44.ClientID %>').value='';
        document.getElementById('<%= ProcDate_44.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_44.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_44.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_45.ClientID %>').checked=false;
        document.getElementById('<%= ProcName_45_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_45.ClientID %>').value='';
        document.getElementById('<%= ProcDate_45.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_45.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_45.ClientID %>').value='';
    }
 }
 
    function LateralDissectYesNo(lateralDissectRecordedID,lateralDissectDivID,lateralDissectAbsentDivID)
    {
       var lateralDissectRecordedRef = lateralDissectRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < lateralDissectRecordedRef.length; i++) 
        if (lateralDissectRecordedRef[i].checked) {  
            LateralDissectRadioClick(lateralDissectRecordedRef[i].value,lateralDissectDivID,lateralDissectAbsentDivID);
            }
    }
    
    function LateralDissectRadioClick(LateralDissectoption_value,LateralDissecthideDiv,LateralDissecthideAbsentDiv)
    {


      if (LateralDissectoption_value.length > 0)
      { 
        LateralDissecthideDiv.style.display='block';
        LateralDissecthideAbsentDiv.style.display='none';

      } 
      else if (LateralDissectoption_value == '')
      {
        clearAllElementsContainedInNode(LateralDissecthideDiv);
        LateralDissecthideDiv.style.display='none';
        LateralDissecthideAbsentDiv.style.display='none';
        document.getElementById('<%= ProcDateText_17.ClientID %>').value='';
        document.getElementById('<%= ProcDate_17.ClientID %>').value = '';
	    document.getElementById('<%= ProcSurgeon_4.ClientID %>').value='';
	    

               
	    
	    
      }
    }
    

</script>