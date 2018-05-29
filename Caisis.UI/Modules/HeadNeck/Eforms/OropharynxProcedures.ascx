<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxProcedures" CodeFile="OropharynxProcedures.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
 <script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>
 
<script type="text/javascript" language="javascript">

   tableArray.LateralNeckDissectionHtmlTable = "LateralNeckDissectionHtmlTable";
</script>



<a name="OropharynxProcedures" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Surgery"></asp:Label><br/>
<table  width="450" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxProceduresHtmlTable" > 
 
          <tr>
            <td valign="top" style="white-space: nowrap;"><strong>Date</strong><br />
                <euc:EformTextBox  Width="80px" TABLE="NoTable" FIELD="ProcDateText" ID="ProcDateText" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  /></td>
            
            <td valign="top" style="white-space: nowrap;"><strong>Approach</strong><br />
                <euc:EformRadioButtonList style="white-space: nowrap;" TABLE="NoTable" FIELD="ProcApproach" ID="ProcApproach" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                    <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                    <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                    <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
                </euc:EformRadioButtonList></td>
            
            <td align="left" style="white-space: nowrap;"><strong>Procedure Type</strong><br />
                
                <euc:EformRadioButtonList style="white-space: nowrap;" ID="ProcNamePrefix" 
                    Table="NoTable" Field="ProcNamePrefix" runat="server" 
                    RepeatDirection="Vertical" EnableHiddenOnUIEvent="ProcName_1" >
                    <asp:ListItem Value="Primary" Text="Primary"></asp:ListItem>
                    <asp:ListItem Value="Salvage" Text="Salvage"></asp:ListItem>                    
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
                <euc:EformExtendedRadioButtonList ID="ProcIndication" Table="NoTable" Field="ProcIndication" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true" EnableHiddenOnUIEvent="ProcName_1" >
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

<table  width="450" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="Table1" > 
           <tr>
             <td style="white-space: nowrap;">
                <strong>Procedure</strong></td>
           </tr>   
  
           <tr>
               <td align="left" style="white-space: nowrap;">   
                <input type="checkbox" id="ProcName_20" value="Lip-Split" runat="server"   />Lip-Split
                <euc:EformTextBox Width="1px" ID="ProcName_20_Text" runat="server" RecordId="20"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="20"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_20" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="20"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_20"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="20"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_20" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="20"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_20" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">  
                <input type="checkbox" id="ProcName_21" value="Mandibulotomy"  runat="server"   />Mandibulotomy
                <euc:EformTextBox Width="1px" ID="ProcName_21_Text" runat="server" RecordId="21"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="21"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_21" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="21"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_21"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="21"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_21" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="21"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_21" runat="server" /></td>
               
               <td align="left" style="white-space: nowrap;">   
                <input type="checkbox" id="ProcName_22" value="Visor" runat="server"   />Visor
                <euc:EformTextBox Width="1px" ID="ProcName_22_Text" runat="server" RecordId="22"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="22"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_22" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="22"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_22"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="22"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_22" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="22"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_22" runat="server" /></td>
              </tr>
              
             <tr>
               <td align="left" style="white-space: nowrap;">   
                <input type="checkbox" id="ProcName_23" value="Lingual Drop" runat="server"   />Lingual Drop
                <euc:EformTextBox Width="1px" ID="ProcName_23_Text" runat="server" RecordId="23"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="23"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_23" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="23"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_23"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="23"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_23" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="23"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_23" runat="server" /></td>

               <td align="left" style="white-space: nowrap;"> 
                <input type="checkbox" id="ProcName_24" value="Radical Tonsillectomy" runat="server"   />Radical Tonsillectomy
                <euc:EformTextBox Width="1px" ID="ProcName_24_Text" runat="server" RecordId="24"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="24"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_24" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="24"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_24"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="24"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_24" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="24"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_24" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">  
                <input type="checkbox" id="ProcName_25" value="Partial Pharyngectomy" runat="server"   />Partial Pharyngectomy
                <euc:EformTextBox Width="1px" ID="ProcName_25_Text" runat="server" RecordId="25"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="25"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_25" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="25"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_25"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="25"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_25" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="25"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_25" runat="server" /></td>
              </tr>  
              
              <tr>
               <td align="left" style="white-space: nowrap;"> 
                <input type="checkbox" id="ProcName_26" value="Circumferential Pharyngectomy"  runat="server"   />Circumferential Pharyngectomy
                <euc:EformTextBox Width="1px" ID="ProcName_26_Text" runat="server" RecordId="26"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="26"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_26" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="26"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_26"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="26"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_26" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="26"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_26" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">      
                <input type="checkbox" id="ProcName_27" value="Pharyngectomy-Espohagectomy"   runat="server"   />Pharyngectomy-Espohagectomy
                <euc:EformTextBox Width="1px" ID="ProcName_27_Text" runat="server" RecordId="27"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="27"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_27" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="27"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_27"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="27"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_27" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="27"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_27" runat="server" /></td>

               <td align="left" style="white-space: nowrap;"> 
                <input type="checkbox" id="ProcName_28" value="Soft Palate Resection"   runat="server"   />Soft Palate Resection
                <euc:EformTextBox Width="1px" ID="ProcName_28_Text" runat="server" RecordId="28"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="28"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_28" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="28"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_28"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="28"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_28" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="28"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_28" runat="server" /></td>

              </tr>
 
              <tr>
               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_29" value="Laryngectomy"    runat="server"   />Laryngectomy
                <euc:EformTextBox Width="1px" ID="ProcName_29_Text" runat="server" RecordId="29"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="29"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_29" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="29"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_29"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="29"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_29" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="29"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_29" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_30" value="Laryngopharyngectomy"    runat="server"   />Laryngopharyngectomy
                <euc:EformTextBox Width="1px" ID="ProcName_30_Text" runat="server" RecordId="30"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="30"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_30" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="30"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_30"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="30"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_30" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="30"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_30" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_31" value="Nasopharyngectomy"    runat="server"   />Nasopharyngectomy
                <euc:EformTextBox Width="1px" ID="ProcName_31_Text" runat="server" RecordId="31"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="31"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_31" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="31"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_31"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="31"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_31" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="31"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_31" runat="server" /></td>
              </tr>
              
              <tr>
               <td align="left" style="white-space: nowrap;">                 
                <input type="checkbox" id="ProcName_32" value="Mandibulectomy"    runat="server"   />Mandibulectomy
                <euc:EformTextBox Width="1px" ID="ProcName_32_Text" runat="server" RecordId="32"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="32"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_32" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="32"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_32"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="32"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_32" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="32"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_32" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_33" value="Maxillectomy"    runat="server"   />Maxillectomy
                <euc:EformTextBox Width="1px" ID="ProcName_33_Text" runat="server" RecordId="33"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="33"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_33" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="33"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_33"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="33"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_33" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="33"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_33" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_34" value="Resection of Anterior Tongue"    runat="server"   />Resection of Anterior Tongue
                <euc:EformTextBox Width="1px" ID="ProcName_34_Text" runat="server" RecordId="34"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="34"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_34" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="34"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_34"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="34"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_34" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="34"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_34" runat="server" /></td>
              
              </tr>
 
              <tr>
               <td align="left" style="white-space: nowrap;" colspan="2">
                <strong>Other:&nbsp;</strong>
                <input type="text" id="ProcName_35"     runat="server"   />
                <euc:EformTextBox Width="1px" ID="ProcName_35_Text" runat="server" RecordId="35"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="35"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_35" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="35"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_35"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="35"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_35" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="35"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_35" runat="server" /></td>
            </tr>
</table>
<br />

<table>
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
<table  width="450" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" runat="server" id="Table2" > 

           <tr>

               <td align="left" style="white-space: nowrap;">                 
                <input type="checkbox" id="ProcName_36" value="DP"    runat="server"   />DP
                <euc:EformTextBox Width="1px" ID="ProcName_36_Text" runat="server" RecordId="36"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="36"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_36" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="36"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_36"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="36"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_36" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="36"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_36" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_37" value="LD"    runat="server"   />LD
                <euc:EformTextBox Width="1px" ID="ProcName_37_Text" runat="server" RecordId="37"  TABLE="Procedures" FIELD="ProcName"/>             
               <euc:EformTextBox Width="1px"   RecordId="37"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_37" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="37"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_37"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="37"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_37" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="37"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_37" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_38" value="PMMF"    runat="server"   />PMMF
                <euc:EformTextBox Width="1px" ID="ProcName_38_Text" runat="server" RecordId="38"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="38"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_38" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="38"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_38"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="38"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_38" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="38"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_38" runat="server" /></td>

          </tr>
          <tr>              
               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_39" value="Gastric Pull-up"    runat="server"   />Gastric Pull-up
                <euc:EformTextBox Width="1px" ID="ProcName_39_Text" runat="server" RecordId="39"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="39"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_39" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="39"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_39"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="39"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_39" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="39"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_39" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_40" value="Free Jejunum"    runat="server"   />Free Jejunum
                <euc:EformTextBox Width="1px" ID="ProcName_40_Text" runat="server" RecordId="40"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="40"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_40" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="40"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_40"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="40"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_40" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="40"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_40" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_41" value="Radial Forearm"    runat="server"   />Radial Forearm
                <euc:EformTextBox Width="1px" ID="ProcName_41_Text" runat="server" RecordId="41"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="41"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_41" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="41"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_41"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="41"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_41" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="41"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_41" runat="server" /></td>
 
           </tr>
          <tr>             
               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_42" value="Rectus Abdominis"    runat="server"   />Rectus Abdominis
                <euc:EformTextBox Width="1px" ID="ProcName_42_Text" runat="server" RecordId="42"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="42"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_42" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="42"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_42"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="42"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_42" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="42"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_42" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_43" value="ALT"    runat="server"   />ALT
                <euc:EformTextBox Width="1px" ID="ProcName_43_Text" runat="server" RecordId="43"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="43"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_43" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="43"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_43"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="43"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_43" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="43"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_43" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_44" value="Fibula"    runat="server"   />Fibula
                <euc:EformTextBox Width="1px" ID="ProcName_44_Text" runat="server" RecordId="44"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="44"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_44" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="44"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_44"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="44"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_44" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="44"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_44" runat="server" /></td>
 
           </tr>
          <tr>              
               <td align="left" style="white-space: nowrap;" colspan="2">
                <strong>Other:&nbsp;</strong>
                <input type="text" id="ProcName_45"     runat="server"   />
                <euc:EformTextBox Width="1px" ID="ProcName_45_Text" runat="server" RecordId="45"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px"   RecordId="45"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_45" Runat="server" />
				<euc:EformTextBox Width="1px"   RecordId="45"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_45"     Runat="server"/>
			    <euc:EformTextBox Width="1px"   RecordId="45"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_45" runat="server" />
                <euc:EformTextBox Width="1px"   RecordId="45"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_45" runat="server" /></td>
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
<br />

<a name="LateralNeckDissection" />
<table>
    <tr>
        <td>
            <span class="controlBoxTitle">Lateral Neck Dissection Done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="LateralDissectDone" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="LateralDissectDone">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
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
    <table width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="LateralNeckDissectionHtmlTable">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                &nbsp;Date</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                Surgeon</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                Side</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                Level</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >
                Data Quality</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">
                &nbsp;</td>
        </tr>
        <tr id="LateralNeckDissectionHtmlRow1">
            <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Width="100px" RecordId="4" Table="Procedures" Field="ProcDateText" ID="ProcDateText_4" runat="server" TabIndex="24" 
                    ShowCalendar="true" CalcDate="true" />
                <euc:EformHidden RecordId="4" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_4" Runat="server" />
                <euc:EformTextBox RecordId="4" TABLE="Procedures" FIELD="ProcName" ID="ProcName_4" Runat="server" Width="1px" style="display:none;" />
                <euc:EformTextBox id="ProcInstitution_4" RecordId="4" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcService_4" RecordId="4" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcSite_4" RecordId="4" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
            </td>
            <td style="white-space: nowrap;">
              <euc:EformComboBox id="ProcSurgeon_4" RecordId="4" Table="Procedures" Field="ProcSurgeon" LookupCode="Physician" runat="server" Width="80px" /></td>
            <td style="white-space: nowrap;" align="center">
                <euc:EformDropDownList Width="100px" RecordId="4" Table="Procedures" Field="ProcSide"
                    ID="ProcSide_4" LookupCode="NodeSide" runat="server" TabIndex="25" />
            </td>
            <td style="white-space: nowrap;" align="left">
                <euc:EformExtendedCheckBoxList style="white-space: nowrap;" RecordId="4" Table="Procedures" Field="ProcSubsite" ID="ProcSubsite_4" runat="server" TabIndex="26" RepeatDirection="Vertical" RepeatColumns="4" RepeatLayout="table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>
                
             <td style="white-space: nowrap;" align="right">
	            <euc:EformComboBox id="ProcQuality_4" RecordId="4" Table="Procedures" Field="ProcQuality" LookupCode="DataQuality" runat="server" Width="80px"/>
             </td>
           
            <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" /></td>
        </tr>
        <tr id="LateralNeckDissectionHtmlRow2" style="display: none">
            <td style="white-space: nowrap;" height="28" class="ClinicalEformGridColumnOne">
                <euc:EformTextBox Width="100px" RecordId="5" Table="Procedures" Field="ProcDateText" ID="ProcDateText_5" runat="server" TabIndex="27"
                     ShowCalendar="true" CalcDate="true" AppendToOnChange="updateLatProcDetails();" />
                <euc:EformHidden RecordId="5" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_5" Runat="server" />
                <euc:EformTextBox RecordId="5" TABLE="Procedures" FIELD="ProcName" ID="ProcName_5" Runat="server" Width="1px" style="display:none;"/>
                <euc:EformTextBox id="ProcInstitution_5" RecordId="5" Table="Procedures" Field="ProcInstitution" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcService_5" RecordId="5" Table="Procedures" Field="ProcService" runat="server" Width="1px" style="display:none"/>
	            <euc:EformTextBox id="ProcSite_5" RecordId="5" Table="Procedures" Field="ProcSite" runat="server" Width="1px" style="display:none"/>
                    </td>
            <td style="white-space: nowrap;">
              <euc:EformComboBox id="ProcSurgeon_5" RecordId="5" Table="Procedures" Field="ProcSurgeon" LookupCode="Physician" runat="server" Width="80px" /></td>
            <td style="white-space: nowrap;" align="center">
                <euc:EformDropDownList Width="100px" RecordId="5" Table="Procedures" Field="ProcSide"
                    ID="ProcSide_5" LookupCode="NodeSide" runat="server" TabIndex="28" />
            </td>
            <td style="white-space: nowrap;" align="left">
                <euc:EformExtendedCheckBoxList RecordId="5" Table="Procedures" Field="ProcSubsite" ID="ProcSubsite_5" runat="server" TabIndex="29" RepeatDirection="Vertical" RepeatColumns="4" RepeatLayout="table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>

            <td style="white-space: nowrap;" align="right">
	            <euc:EformComboBox id="ProcQuality_5" RecordId="5" Table="Procedures" Field="ProcQuality" LookupCode="DataQuality" runat="server" Width="80px" />
            </td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" /></td>

        </tr>
    </table>
    <img alt="row" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16"
        border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'LateralNeckDissectionHtmlTable');" />
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
<br /><br /><br />


<script type="text/javascript">
      
    //Adds events to controls
    function addEvents(procNamePrefixID,indicationDIV,procIndicationID,procNameID,procNameCBID)
    { 
        $(procNamePrefixID).addEvent('click',curry(ShowIndication,procNamePrefixID,indicationDIV,procIndicationID));
          ShowOnLoad(indicationDIV,procNamePrefixID,procNameID,procNameCBID);
    }

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

    addProcEvents($('<%= ProcName_20_Text.ClientID %>'), $('<%= ProcName_20.ClientID %>'), $('<%= ProcDateText_20.ClientID %>') ,$('<%= ProcDate_20.ClientID %>'), $('<%= ProcApproach_20.ClientID %>'), $('<%= ProcIndication_20.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_21_Text.ClientID %>'), $('<%= ProcName_21.ClientID %>'), $('<%= ProcDateText_21.ClientID %>') ,$('<%= ProcDate_21.ClientID %>'), $('<%= ProcApproach_21.ClientID %>'), $('<%= ProcIndication_21.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_22_Text.ClientID %>'), $('<%= ProcName_22.ClientID %>'), $('<%= ProcDateText_22.ClientID %>') ,$('<%= ProcDate_22.ClientID %>'), $('<%= ProcApproach_22.ClientID %>'), $('<%= ProcIndication_22.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_23_Text.ClientID %>'), $('<%= ProcName_23.ClientID %>'), $('<%= ProcDateText_23.ClientID %>') ,$('<%= ProcDate_23.ClientID %>'), $('<%= ProcApproach_23.ClientID %>'), $('<%= ProcIndication_23.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_24_Text.ClientID %>'), $('<%= ProcName_24.ClientID %>'), $('<%= ProcDateText_24.ClientID %>') ,$('<%= ProcDate_24.ClientID %>'), $('<%= ProcApproach_24.ClientID %>'), $('<%= ProcIndication_24.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_25_Text.ClientID %>'), $('<%= ProcName_25.ClientID %>'), $('<%= ProcDateText_25.ClientID %>') ,$('<%= ProcDate_25.ClientID %>'), $('<%= ProcApproach_25.ClientID %>'), $('<%= ProcIndication_25.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_26_Text.ClientID %>'), $('<%= ProcName_26.ClientID %>'), $('<%= ProcDateText_26.ClientID %>') ,$('<%= ProcDate_26.ClientID %>'), $('<%= ProcApproach_26.ClientID %>'), $('<%= ProcIndication_26.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_27_Text.ClientID %>'), $('<%= ProcName_27.ClientID %>'), $('<%= ProcDateText_27.ClientID %>') ,$('<%= ProcDate_27.ClientID %>'), $('<%= ProcApproach_27.ClientID %>'), $('<%= ProcIndication_27.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_28_Text.ClientID %>'), $('<%= ProcName_28.ClientID %>'), $('<%= ProcDateText_28.ClientID %>') ,$('<%= ProcDate_28.ClientID %>'), $('<%= ProcApproach_28.ClientID %>'), $('<%= ProcIndication_28.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_29_Text.ClientID %>'), $('<%= ProcName_29.ClientID %>'), $('<%= ProcDateText_29.ClientID %>') ,$('<%= ProcDate_29.ClientID %>'), $('<%= ProcApproach_29.ClientID %>'), $('<%= ProcIndication_29.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_30_Text.ClientID %>'), $('<%= ProcName_30.ClientID %>'), $('<%= ProcDateText_30.ClientID %>') ,$('<%= ProcDate_30.ClientID %>'), $('<%= ProcApproach_30.ClientID %>'), $('<%= ProcIndication_30.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_31_Text.ClientID %>'), $('<%= ProcName_31.ClientID %>'), $('<%= ProcDateText_31.ClientID %>') ,$('<%= ProcDate_31.ClientID %>'), $('<%= ProcApproach_31.ClientID %>'), $('<%= ProcIndication_31.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_32_Text.ClientID %>'), $('<%= ProcName_32.ClientID %>'), $('<%= ProcDateText_32.ClientID %>') ,$('<%= ProcDate_32.ClientID %>'), $('<%= ProcApproach_32.ClientID %>'), $('<%= ProcIndication_32.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_33_Text.ClientID %>'), $('<%= ProcName_33.ClientID %>'), $('<%= ProcDateText_33.ClientID %>') ,$('<%= ProcDate_33.ClientID %>'), $('<%= ProcApproach_33.ClientID %>'), $('<%= ProcIndication_33.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_34_Text.ClientID %>'), $('<%= ProcName_34.ClientID %>'), $('<%= ProcDateText_34.ClientID %>') ,$('<%= ProcDate_34.ClientID %>'), $('<%= ProcApproach_34.ClientID %>'), $('<%= ProcIndication_34.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_35_Text.ClientID %>'), $('<%= ProcName_35.ClientID %>'), $('<%= ProcDateText_35.ClientID %>') ,$('<%= ProcDate_35.ClientID %>'), $('<%= ProcApproach_35.ClientID %>'), $('<%= ProcIndication_35.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_36_Text.ClientID %>'), $('<%= ProcName_36.ClientID %>'), $('<%= ProcDateText_36.ClientID %>') ,$('<%= ProcDate_36.ClientID %>'), $('<%= ProcApproach_36.ClientID %>'), $('<%= ProcIndication_36.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_37_Text.ClientID %>'), $('<%= ProcName_37.ClientID %>'), $('<%= ProcDateText_37.ClientID %>') ,$('<%= ProcDate_37.ClientID %>'), $('<%= ProcApproach_37.ClientID %>'), $('<%= ProcIndication_37.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_38_Text.ClientID %>'), $('<%= ProcName_38.ClientID %>'), $('<%= ProcDateText_38.ClientID %>') ,$('<%= ProcDate_38.ClientID %>'), $('<%= ProcApproach_38.ClientID %>'), $('<%= ProcIndication_38.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_39_Text.ClientID %>'), $('<%= ProcName_39.ClientID %>'), $('<%= ProcDateText_39.ClientID %>') ,$('<%= ProcDate_39.ClientID %>'), $('<%= ProcApproach_39.ClientID %>'), $('<%= ProcIndication_39.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_40_Text.ClientID %>'), $('<%= ProcName_40.ClientID %>'), $('<%= ProcDateText_40.ClientID %>') ,$('<%= ProcDate_40.ClientID %>'), $('<%= ProcApproach_40.ClientID %>'), $('<%= ProcIndication_40.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_41_Text.ClientID %>'), $('<%= ProcName_41.ClientID %>'), $('<%= ProcDateText_41.ClientID %>') ,$('<%= ProcDate_41.ClientID %>'), $('<%= ProcApproach_41.ClientID %>'), $('<%= ProcIndication_41.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_42_Text.ClientID %>'), $('<%= ProcName_42.ClientID %>'), $('<%= ProcDateText_42.ClientID %>') ,$('<%= ProcDate_42.ClientID %>'), $('<%= ProcApproach_42.ClientID %>'), $('<%= ProcIndication_42.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_43_Text.ClientID %>'), $('<%= ProcName_43.ClientID %>'), $('<%= ProcDateText_43.ClientID %>') ,$('<%= ProcDate_43.ClientID %>'), $('<%= ProcApproach_43.ClientID %>'), $('<%= ProcIndication_43.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_44_Text.ClientID %>'), $('<%= ProcName_44.ClientID %>'), $('<%= ProcDateText_44.ClientID %>') ,$('<%= ProcDate_44.ClientID %>'), $('<%= ProcApproach_44.ClientID %>'), $('<%= ProcIndication_44.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_45_Text.ClientID %>'), $('<%= ProcName_45.ClientID %>'), $('<%= ProcDateText_45.ClientID %>') ,$('<%= ProcDate_45.ClientID %>'), $('<%= ProcApproach_45.ClientID %>'), $('<%= ProcIndication_45.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));

    function addProcEvents(procNameID,procNameCBID, procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID)
    {   
        if (procNameCBID.type == 'checkbox') {
            $(procNameCBID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID));
            $(dateTextID).addEvent('blur',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID));
            $(approachID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID));
            $(indicationID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID));
            $(procNamePrefixID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID));
        }
        else if (procNameCBID.type == 'text') {
            $(procNameCBID).addEvent('blur',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID));
            $(dateTextID).addEvent('blur',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID));
            $(approachID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID));
            $(indicationID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID));
            $(procNamePrefixID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID));
        }
    }
    
    function onProcClick(procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID) {
    
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
        }
        
        // set additional hidden fields for procedure
        SetProcedureFields (procNameID, procNameCBID, procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID); 
        
            
    }   

    function setProcValues(prefix,procNameCBox,procNameTbox) {
    
            // appened the prefix to the procedure name
            if (procNameCBox.type == 'checkbox')
            {
                if (procNameCBox.checked) {
                    procNameTbox.value = prefix + ' ' + procNameCBox.value;                    
                }
                else {
                    procNameTbox.value = '';
                }
            }
            
            else if (procNameCBox.type == 'text')
            {
                if (procNameCBox.value != '') {
                    procNameTbox.value = prefix + ' ' + procNameCBox.value;                    
                }
                else {
                    procNameTbox.value = '';
                }            
            }
    }       

    
    function SetProcedureFields (procNameID, procNameCBID, procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, approachID, indicationID, procNamePrefixID) 
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
            procDateID.value = dateTextID.value;

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
        }        
      }
      
      // if user typed a new procedure name 
      else if (procNameCBID.type == 'text') 
      {
        if (procNameCBID.value != '')
        {
            // set hidden fields for procedure date
             procDateTextID.value = dateTextID.value;
             procDateID.value = dateTextID.value;

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
        }
      }
    } 
    
    
//*******************************************************************************
//*******************************************************************************
//*******************************************************************************

    addAbsentEvent($('<%= ReconProcDone.ClientID %>'),$('<%= ReconProcDiv.ClientID %>'),$('<%= ReconProcAbsentDiv.ClientID %>'),$('<%= LateralDissectDone.ClientID %>'),$('<%= LateralDissectDiv.ClientID %>'),$('<%= LateralDissectAbsentDiv.ClientID %>'));

    function addAbsentEvent(reconProcRecordedID,reconProcDivID,reconProcAbsentDivID,lateralDissectRecordedID,lateralDissectDivID,lateralDissectAbsentDivID)
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
        ReconProchideAbsentDiv.style.display='block';
        ReconProchideDiv.style.display='none';
      
        document.getElementById('<%= TableName_7.ClientID %>').value = 'Procedures';        
        document.getElementById('<%= FieldName_7.ClientID %>').value = 'ProcName';        
        document.getElementById('<%= FieldValue_7.ClientID %>').value = 'Reconstruction Procedures';        
        document.getElementById('<%= AbsentReason_7.ClientID %>').value = 'None Recorded';        
        document.getElementById('<%= AbsentQuality_7.ClientID %>').value = 'STD';        
                
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
      if (LateralDissectoption_value == "Yes")
      { 
       LateralDissecthideDiv.style.display='block';
       LateralDissecthideAbsentDiv.style.display='none';

        document.getElementById('<%= ProcName_4.ClientID %>').value='Lateral Neck Dissection';
        document.getElementById('<%= ProcInstitution_4.ClientID %>').value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById('<%= ProcService_4.ClientID %>').value='Head and Neck';
	    document.getElementById('<%= ProcSite_4.ClientID %>').value='Oropharynx';
        
        var DtTest5 = document.getElementById('<%= ProcDateText_5.ClientID %>').value;
        var Side5 = document.getElementById('<%= ProcSide_5.ClientID %>').value;   
        var Surgeon5 = document.getElementById('<%= ProcSurgeon_5.ClientID %>').value;
     
        if (DtTest5 != "" || Side5 != "" || Surgeon5 != "")
        {
            document.getElementById('LateralNeckDissectionHtmlRow').style.display='block';
        }
       
        document.getElementById('<%= AbsentDateText_2.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_2.ClientID %>').value='';
        document.getElementById('<%= TableName_2.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_2.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_2.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_2.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_2.ClientID %>').value = '';
               
      } 
      else if (LateralDissectoption_value == "No")
      {
        LateralDissecthideAbsentDiv.style.display='block';
        LateralDissecthideDiv.style.display='none';
      
        document.getElementById('<%= TableName_2.ClientID %>').value = 'Procedures';        
        document.getElementById('<%= FieldName_2.ClientID %>').value = 'ProcName';        
        document.getElementById('<%= FieldValue_2.ClientID %>').value = 'Lateral Neck Dissection';        
        document.getElementById('<%= AbsentReason_2.ClientID %>').value = 'Not Performed';        
        document.getElementById('<%= AbsentQuality_2.ClientID %>').value = 'STD';        
        
        document.getElementById('<%= ProcDateText_4.ClientID %>').value='';
        document.getElementById('<%= ProcDate_4.ClientID %>').value='';
        document.getElementById('<%= ProcName_4.ClientID %>').value='';
        document.getElementById('<%= ProcInstitution_4.ClientID %>').value='';
	    document.getElementById('<%= ProcService_4.ClientID %>').value='';
	    document.getElementById('<%= ProcSite_4.ClientID %>').value='';
	    document.getElementById('<%= ProcQuality_4.ClientID %>').value='';
	    document.getElementById('<%= ProcSurgeon_4.ClientID %>').value='';
	    
	    var subsite4ID = document.getElementById('<%= ProcSubsite_4.ClientID %>');
	    var subsite4Ref = subsite4ID.getElementsByTagName("input");
         for (var i = 0; i < subsite4Ref.length; i++) {
             if (subsite4Ref[i].checked){
               subsite4Ref[i].checked = false;
               subsite4Ref[i].value = '';
             }
         }
               
	    document.getElementById('<%= ProcSide_4.ClientID %>').value='';
	    
	    document.getElementById('<%= ProcDateText_5.ClientID %>').value='';
        document.getElementById('<%= ProcDate_5.ClientID %>').value='';
        document.getElementById('<%= ProcName_5.ClientID %>').value='';
        document.getElementById('<%= ProcInstitution_5.ClientID %>').value='';
	    document.getElementById('<%= ProcService_5.ClientID %>').value='';
	    document.getElementById('<%= ProcSite_5.ClientID %>').value='';
	    document.getElementById('<%= ProcQuality_5.ClientID %>').value='';
	    document.getElementById('<%= ProcSurgeon_5.ClientID %>').value='';
	    
	    var subsite5ID = document.getElementById('<%= ProcSubsite_5.ClientID %>');
	    var subsite5Ref = subsite5ID.getElementsByTagName("input");
         for (var i = 0; i < subsite5Ref.length; i++) {
            if (subsite5Ref[i].checked){
               subsite5Ref[i].checked = false;
               subsite5Ref[i].value = '';
            }
          }
               
	    document.getElementById('<%= ProcSide_5.ClientID %>').value='';
	    
      }
    }
    
    function updateLatProcDetails()
    {
        document.getElementById('<%= ProcName_5.ClientID %>').value='Lateral Neck Dissection';
        document.getElementById('<%= ProcInstitution_5.ClientID %>').value='Memorial Sloan Kettering Cancer Center';
	    document.getElementById('<%= ProcService_5.ClientID %>').value='Head and Neck';
	    document.getElementById('<%= ProcSite_5.ClientID %>').value='Oropharynx';
    }
</script>