<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxProceduresSalvage" CodeFile="OropharynxProceduresSalvage.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
 <script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>

<script type="text/javascript" language="javascript">
   tableArray.AdditionalSalvageProcHtmlTable = "AdditionalSalvageProcHtmlTable";
</script>



<a name="OropharynxProceduresSalvage" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Surgeries"></asp:Label><br/>

<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Salvage Surgeries ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="SalvageProcRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="SalvageProcRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList>
            
            <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="60" ID="OpDateText_60" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
            <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="60" ID="OpDate_60" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
            <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="60" ID="OpQuality_60" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
            <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="60" ID="OpCaseSurgeon_60" TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" /> 

            </td>
    </tr>
</table>

<div id="SalvageProcAbsentDiv" runat="server" style="display: none;" >
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_13"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="13" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_13"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table></div>

<div id="SalvageProcDiv" runat="server" style="display: none;">

<table  width="450" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxProceduresSalvageHtmlTable" > 
 
          <tr>
            <td valign="top" style="white-space: nowrap;"><strong>Date</strong><br />
                <euc:EformTextBox  Width="80px" TABLE="NoTable" FIELD="ProcDateTextSalvage" ID="ProcDateText" Runat="server" TabIndex="1"  ShowCalendar="true"  />
                <euc:CaisisTextBox Width="1px" style="display: none; " ID="ProcDate" Runat="server"  /></td>
            
            <td valign="top" style="white-space: nowrap;"><strong>Approach</strong><br />
                <euc:EformRadioButtonList style="white-space: nowrap;" TABLE="NoTable" FIELD="ProcApproachSalvage" ID="ProcApproach" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                    <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                    <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                    <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
                </euc:EformRadioButtonList></td>
            
            <td align="left" style="white-space: nowrap; display: none;"><strong>Procedure Type</strong><br />
                
                <euc:EformRadioButtonList style="white-space: nowrap; display: none;" ID="ProcNamePrefix" 
                    Table="NoTable" Field="ProcNamePrefixSalvage" runat="server" 
                    RepeatDirection="Vertical" >
                    <asp:ListItem Value="Salvage" Text="Salvage" Selected="True"></asp:ListItem>
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
                <euc:EformExtendedRadioButtonList ID="ProcIndication" Table="NoTable" Field="ProcIndicationSalvage" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true" >
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
             <td style="white-space: nowrap;">
                <strong>Salvage Procedures</strong></td>
           </tr>   
  
           <tr>
               <td align="left" style="white-space: nowrap;">   
                <input type="checkbox" id="ProcName_60" value="Lip-Split" runat="server"   />Lip-Split
                <euc:EformTextBox Width="1px" style="display: none;"   ID="ProcName_60_Text" runat="server" RecordId="60"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="60"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_60" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="60"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_60"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="60"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_60" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="60"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_60" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">  
                <input type="checkbox" id="ProcName_61" value="Mandibulotomy"  runat="server"   />Mandibulotomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_61_Text" runat="server" RecordId="61"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="61"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_61" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="61"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_61"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="61"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_61" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="61"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_61" runat="server" /></td>
               
               <td align="left" style="white-space: nowrap;">   
                <input type="checkbox" id="ProcName_62" value="Visor" runat="server"   />Visor
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_62_Text" runat="server" RecordId="62"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="62"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_62" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="62"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_62"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="62"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_62" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="62"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_62" runat="server" /></td>
              </tr>
              
             <tr>
               <td align="left" style="white-space: nowrap;">   
                <input type="checkbox" id="ProcName_63" value="Lingual Drop" runat="server"   />Lingual Drop
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_63_Text" runat="server" RecordId="63"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="63"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_63" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="63"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_63"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="63"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_63" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="63"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_63" runat="server" /></td>

               <td align="left" style="white-space: nowrap;"> 
                <input type="checkbox" id="ProcName_64" value="Radical Tonsillectomy" runat="server"   />Radical Tonsillectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_64_Text" runat="server" RecordId="64"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="64"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_64" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="64"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_64"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="64"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_64" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="64"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_64" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">  
                <input type="checkbox" id="ProcName_65" value="Partial Pharyngectomy" runat="server"   />Partial Pharyngectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_65_Text" runat="server" RecordId="65"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="65"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_65" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="65"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_65"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="65"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_65" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="65"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_65" runat="server" /></td>
              </tr>  
              
              <tr>
               <td align="left" style="white-space: nowrap;"> 
                <input type="checkbox" id="ProcName_66" value="Circumferential Pharyngectomy"  runat="server"   />Circumferential Pharyngectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_66_Text" runat="server" RecordId="66"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="66"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_66" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="66"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_66"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="66"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_66" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="66"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_66" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">      
                <input type="checkbox" id="ProcName_67" value="Pharyngectomy-Espohagectomy"   runat="server"   />Pharyngectomy-Espohagectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_67_Text" runat="server" RecordId="67"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="67"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_67" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="67"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_67"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="67"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_67" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="67"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_67" runat="server" /></td>

               <td align="left" style="white-space: nowrap;"> 
                <input type="checkbox" id="ProcName_68" value="Soft Palate Resection"   runat="server"   />Soft Palate Resection
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_68_Text" runat="server" RecordId="68"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="68"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_68" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="68"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_68"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="68"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_68" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="68"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_68" runat="server" /></td>

              </tr>
 
              <tr>
               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_69" value="Laryngectomy"    runat="server"   />Laryngectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_69_Text" runat="server" RecordId="69"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="69"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_69" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="69"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_69"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="69"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_69" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="69"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_69" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_70" value="Laryngopharyngectomy"    runat="server"   />Laryngopharyngectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_70_Text" runat="server" RecordId="70"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="70"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_70" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="70"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_70"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="70"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_70" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="70"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_70" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_71" value="Nasopharyngectomy"    runat="server"   />Nasopharyngectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_71_Text" runat="server" RecordId="71"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="71"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_71" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="71"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_71"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="71"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_71" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="71"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_71" runat="server" /></td>
              </tr>
              
              <tr>
               <td align="left" style="white-space: nowrap;">                 
                <input type="checkbox" id="ProcName_72" value="Mandibulectomy"    runat="server"   />Mandibulectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_72_Text" runat="server" RecordId="72"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="72"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_72" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="72"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_72"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="72"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_72" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="72"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_72" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_73" value="Maxillectomy"    runat="server"   />Maxillectomy
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_73_Text" runat="server" RecordId="73"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="73"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_73" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="73"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_73"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="73"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_73" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="73"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_73" runat="server" /></td>

               <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_74" value="Resection of Anterior Tongue"    runat="server"   />Resection of Anterior Tongue
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_74_Text" runat="server" RecordId="74"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="74"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_74" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="74"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_74"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="74"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_74" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="74"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_74" runat="server" /></td>
              
              </tr>
 
              <tr>
               <td align="left" style="white-space: nowrap;" colspan="2">
                <strong>Other:&nbsp;</strong>
                <input type="text" id="ProcName_75"     runat="server"   />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_75_Text" runat="server" RecordId="75"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="75"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_75" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="75"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_75"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="75"  TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_75" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="75"  TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_75" runat="server" /></td>
            </tr>
</table>
<br /> 
<table>
    <tr id="SalvageProcAbsentRow">
        <td>
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="TableName" ID="TableName_13"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="FieldName" ID="FieldName_13"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_13"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_13"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="13" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_13"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>

<br /><br />
<strong>Additional Surgeries</strong>
<table width="450" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="AdditionalSalvageProcHtmlTable">
    <tr>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Approach</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Procedure</td>
         <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Indication</td>
       <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    </tr>
    <tr>
        <td>
            <euc:EformTextBox Width="100px"   RecordId="90"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_90" Runat="server" ShowCalendar="true" CalcDate="true" />
		    <euc:EformTextBox Width="1px"     RecordId="90"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_90"     Runat="server"/></td>
	    <td>
            <euc:EformRadioButtonList style="white-space: nowrap;" RecordId="90" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_90" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
            </euc:EformRadioButtonList></td>
        <td>
            <euc:EformComboBox Width="120px" RecordId="90" TABLE="Procedures" FIELD="ProcName" ID="ProcName_90" LookupCode="ProcName,Disease,HeadNeck" runat="server" DropDownWidth="250px"  /></td>
        <td>    
            <euc:EformComboBox Width="100px"   RecordId="90" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_90" LookupCode="Indication,Disease,HeadNeck" DropDownWidth="250px" runat="server" /></td>
       
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_90" runat="server" /></td>        
   </tr>
    <tr style="display: none;">
        <td>
            <euc:EformTextBox Width="100px"   RecordId="91"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_91" Runat="server" ShowCalendar="true" CalcDate="true" />
		    <euc:EformTextBox Width="1px"     RecordId="91"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_91"     Runat="server"/></td>
	    <td>
            <euc:EformRadioButtonList style="white-space: nowrap;" RecordId="91" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_91" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
            </euc:EformRadioButtonList></td>
        <td>
            <euc:EformComboBox Width="120px" RecordId="91" TABLE="Procedures" FIELD="ProcName" ID="ProcName_91" LookupCode="ProcName,Disease,HeadNeck" runat="server" DropDownWidth="250px"  /></td>
        <td>    
            <euc:EformComboBox Width="100px" RecordId="91" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_91" LookupCode="Indication,Disease,HeadNeck" DropDownWidth="250px" runat="server" /></td>
       
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_91" runat="server" /></td>        
   </tr>
    <tr style="display: none;">
        <td>
            <euc:EformTextBox Width="100px"   RecordId="92"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_92" Runat="server" ShowCalendar="true" CalcDate="true" />
		    <euc:EformTextBox Width="1px"     RecordId="92"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_92"     Runat="server"/></td>
	    <td>
            <euc:EformRadioButtonList style="white-space: nowrap;" RecordId="92" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_92" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
            </euc:EformRadioButtonList></td>
        <td>
            <euc:EformComboBox Width="120px" RecordId="92" TABLE="Procedures" FIELD="ProcName" ID="ProcName_92" LookupCode="ProcName,Disease,HeadNeck" runat="server" DropDownWidth="250px" /></td>
        <td>    
            <euc:EformComboBox Width="100px"   RecordId="92" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_92" LookupCode="Indication,Disease,HeadNeck" DropDownWidth="250px" runat="server" /></td>
       
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_92" runat="server" /></td>        
   </tr>
    <tr style="display: none;">
        <td>
            <euc:EformTextBox Width="100px"   RecordId="93"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_93" Runat="server" ShowCalendar="true" CalcDate="true" />
		    <euc:EformTextBox Width="1px"     RecordId="93"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_93"     Runat="server"/></td>
	    <td>
            <euc:EformRadioButtonList style="white-space: nowrap;" RecordId="93" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_93" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
            </euc:EformRadioButtonList></td>
        <td>
            <euc:EformComboBox Width="120px" RecordId="93" TABLE="Procedures" FIELD="ProcName" ID="ProcName_93" LookupCode="ProcName,Disease,HeadNeck" runat="server" DropDownWidth="250px"  /></td>
        <td>    
            <euc:EformComboBox Width="100px"   RecordId="93" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_93" LookupCode="Indication,Disease,HeadNeck" DropDownWidth="250px" runat="server" /></td>
       
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_93" runat="server" /></td>        
   </tr>
    <tr style="display: none;">
        <td>
            <euc:EformTextBox Width="100px"   RecordId="94"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_94" Runat="server" ShowCalendar="true" CalcDate="true" />
		    <euc:EformTextBox Width="1px"     RecordId="94"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_94"     Runat="server"/></td>
	    <td>
            <euc:EformRadioButtonList style="white-space: nowrap;" RecordId="94" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_94" runat="server" RepeatDirection="Vertical" RepeatColumns="2" ShowOther="true">
                <asp:ListItem Value="Endoscopic" Text="Endoscopic"></asp:ListItem>
                <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                <asp:ListItem Value="Transoral" Text="Transoral"></asp:ListItem>
            </euc:EformRadioButtonList></td>
        <td>
            <euc:EformComboBox Width="120px" RecordId="94" TABLE="Procedures" FIELD="ProcName" ID="ProcName_94" LookupCode="ProcName,Disease,HeadNeck" runat="server" DropDownWidth="200px"  /></td>
        
        <td>
            <euc:EformComboBox Width="100px"   RecordId="94" TABLE="Procedures" Field="ProcIndication" ID="ProcIndication_94" LookupCode="Indication,Disease,HeadNeck" DropDownWidth="250px" runat="server" /></td>
       
        <td><euc:EformDeleteIcon ID="EformDeleteIcon_94" runat="server" /></td>        
   </tr>
 </table>
<img alt="row" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'AdditionalSalvageProcHtmlTable');" />
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
    addAbsentEvent($('<%= SalvageProcRecorded.ClientID %>'),$('<%= SalvageProcDiv.ClientID %>'),$('<%= SalvageProcAbsentDiv.ClientID %>'));

    function addAbsentEvent(salvageProcRecordedID,salvageProcDivID,salvageProcAbsentDivID)
    {  
        $(salvageProcRecordedID).addEvent('click',curry(SalvageProcYesNo,salvageProcRecordedID,salvageProcDivID,salvageProcAbsentDivID));

        // check on load as well
        SalvageProcYesNo(salvageProcRecordedID,salvageProcDivID,salvageProcAbsentDivID);
    }
   
    /* ]]> */
   
    function SalvageProcYesNo(salvageProcRecordedID,salvageProcDivID,salvageProcAbsentDivID)
    {
       var salvageProcRecordedRef = salvageProcRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < salvageProcRecordedRef.length; i++) 
        if (salvageProcRecordedRef[i].checked) {  
            SalvageProcRadioClick(salvageProcRecordedRef[i].value,salvageProcDivID,salvageProcAbsentDivID);
            }
    }
    
    function SalvageProcRadioClick(SalvageProcoption_value,SalvageProchideDiv,SalvageProchideAbsentDiv)
    {
      if (SalvageProcoption_value == "Yes")
      { 
        SalvageProchideDiv.style.display='block';
        SalvageProchideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_13.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_13.ClientID %>').value='';
        document.getElementById('<%= TableName_13.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_13.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_13.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_13.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_13.ClientID %>').value = '';
        
      } 
      else if (SalvageProcoption_value == "No")
      {
        SalvageProchideDiv.style.display='none';
        SalvageProchideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_13.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_13.ClientID %>').value='';
        document.getElementById('<%= TableName_13.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_13.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_13.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_13.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_13.ClientID %>').value = '';

        document.getElementById('<%= ProcDateText.ClientID %>').value='';
        
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
        
        document.getElementById('<%= OpDateText_60.ClientID %>').value='';
        document.getElementById('<%= OpDate_60.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_60_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_60.ClientID %>').value='';
        document.getElementById('<%= ProcDate_60.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_60.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_60.ClientID %>').value='';

        document.getElementById('<%= ProcName_61_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_61.ClientID %>').value='';
        document.getElementById('<%= ProcDate_61.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_61.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_61.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_62_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_62.ClientID %>').value='';
        document.getElementById('<%= ProcDate_62.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_62.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_62.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_63_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_63.ClientID %>').value='';
        document.getElementById('<%= ProcDate_63.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_63.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_63.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_64_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_64.ClientID %>').value='';
        document.getElementById('<%= ProcDate_64.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_64.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_64.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_65_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_65.ClientID %>').value='';
        document.getElementById('<%= ProcDate_65.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_65.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_65.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_66_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_66.ClientID %>').value='';
        document.getElementById('<%= ProcDate_66.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_66.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_66.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_67_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_67.ClientID %>').value='';
        document.getElementById('<%= ProcDate_67.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_67.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_67.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_68_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_68.ClientID %>').value='';
        document.getElementById('<%= ProcDate_68.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_68.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_68.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_69_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_69.ClientID %>').value='';
        document.getElementById('<%= ProcDate_69.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_69.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_69.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_70_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_70.ClientID %>').value='';
        document.getElementById('<%= ProcDate_70.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_70.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_70.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_71_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_71.ClientID %>').value='';
        document.getElementById('<%= ProcDate_71.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_71.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_71.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_72_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_72.ClientID %>').value='';
        document.getElementById('<%= ProcDate_72.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_72.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_72.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_73_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_73.ClientID %>').value='';
        document.getElementById('<%= ProcDate_73.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_73.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_73.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_74_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_74.ClientID %>').value='';
        document.getElementById('<%= ProcDate_74.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_74.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_74.ClientID %>').value='';
 
        document.getElementById('<%= ProcName_75_Text.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_75.ClientID %>').value='';
        document.getElementById('<%= ProcDate_75.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_75.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_75.ClientID %>').value='';
        
        document.getElementById('<%= ProcName_90.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_90.ClientID %>').value='';
        document.getElementById('<%= ProcDate_90.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_90.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_90.ClientID %>').value='';
       
        document.getElementById('<%= ProcName_91.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_91.ClientID %>').value='';
        document.getElementById('<%= ProcDate_91.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_91.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_91.ClientID %>').value='';

        document.getElementById('<%= ProcName_92.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_92.ClientID %>').value='';
        document.getElementById('<%= ProcDate_92.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_92.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_92.ClientID %>').value='';
       
        document.getElementById('<%= ProcName_93.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_93.ClientID %>').value='';
        document.getElementById('<%= ProcDate_93.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_93.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_93.ClientID %>').value='';
       
        document.getElementById('<%= ProcName_94.ClientID %>').value='';
        document.getElementById('<%= ProcDateText_94.ClientID %>').value='';
        document.getElementById('<%= ProcDate_94.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_94.ClientID %>').value='';
        document.getElementById('<%= ProcIndication_94.ClientID %>').value='';
       
       

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

    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_60_Text.ClientID %>'),$('<%= ProcName_60.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_61_Text.ClientID %>'),$('<%= ProcName_61.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_62_Text.ClientID %>'),$('<%= ProcName_62.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_63_Text.ClientID %>'),$('<%= ProcName_63.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_64_Text.ClientID %>'),$('<%= ProcName_64.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_65_Text.ClientID %>'),$('<%= ProcName_65.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_66_Text.ClientID %>'),$('<%= ProcName_66.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_67_Text.ClientID %>'),$('<%= ProcName_67.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_68_Text.ClientID %>'),$('<%= ProcName_68.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_69_Text.ClientID %>'),$('<%= ProcName_69.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_70_Text.ClientID %>'),$('<%= ProcName_70.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_71_Text.ClientID %>'),$('<%= ProcName_71.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_72_Text.ClientID %>'),$('<%= ProcName_72.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_73_Text.ClientID %>'),$('<%= ProcName_73.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_74_Text.ClientID %>'),$('<%= ProcName_74.ClientID %>'));
    addEvents($('<%= ProcNamePrefix.ClientID %>'),$('<%= IndicationDIV.ClientID %>') ,$('<%= ProcIndication.ClientID %>'),$('<%= ProcName_75_Text.ClientID %>'),$('<%= ProcName_75.ClientID %>'));



    function ShowIndication(procNamePrefixID, indicationDIV, procIndicationID) {
  
        // if salvage is clicked, show the indication block on post back
         var prefixRef = procNamePrefixID.getElementsByTagName("input");
         var indicationRef = procIndicationID.getElementsByTagName("input");

         for (var i = 0; i < prefixRef.length; i++) 
         {
                if (prefixRef[i].checked && prefixRef[i].value == 'Salvage') 
                    indicationDIV.style.display = 'block';

                else if (prefixRef[i].checked && prefixRef[i].value == 'Salvage') 
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
            tempStr =  tempStr.replace("Salvage", "");
            tempStr =  tempStr.replace("Salvage", "");
            tempStr =  tempStr.replace(" ", "");
            procNameCBID.value = tempStr;
        }
     }
   }
   
//************************************************
//************************************************

    addProcEvents($('<%= ProcName_60_Text.ClientID %>'), $('<%= ProcName_60.ClientID %>'), $('<%= ProcDateText_60.ClientID %>') ,$('<%= ProcDate_60.ClientID %>'), $('<%= ProcApproach_60.ClientID %>'), $('<%= ProcIndication_60.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_61_Text.ClientID %>'), $('<%= ProcName_61.ClientID %>'), $('<%= ProcDateText_61.ClientID %>') ,$('<%= ProcDate_61.ClientID %>'), $('<%= ProcApproach_61.ClientID %>'), $('<%= ProcIndication_61.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_62_Text.ClientID %>'), $('<%= ProcName_62.ClientID %>'), $('<%= ProcDateText_62.ClientID %>') ,$('<%= ProcDate_62.ClientID %>'), $('<%= ProcApproach_62.ClientID %>'), $('<%= ProcIndication_62.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_63_Text.ClientID %>'), $('<%= ProcName_63.ClientID %>'), $('<%= ProcDateText_63.ClientID %>') ,$('<%= ProcDate_63.ClientID %>'), $('<%= ProcApproach_63.ClientID %>'), $('<%= ProcIndication_63.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_64_Text.ClientID %>'), $('<%= ProcName_64.ClientID %>'), $('<%= ProcDateText_64.ClientID %>') ,$('<%= ProcDate_64.ClientID %>'), $('<%= ProcApproach_64.ClientID %>'), $('<%= ProcIndication_64.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_65_Text.ClientID %>'), $('<%= ProcName_65.ClientID %>'), $('<%= ProcDateText_65.ClientID %>') ,$('<%= ProcDate_65.ClientID %>'), $('<%= ProcApproach_65.ClientID %>'), $('<%= ProcIndication_65.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_66_Text.ClientID %>'), $('<%= ProcName_66.ClientID %>'), $('<%= ProcDateText_66.ClientID %>') ,$('<%= ProcDate_66.ClientID %>'), $('<%= ProcApproach_66.ClientID %>'), $('<%= ProcIndication_66.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_67_Text.ClientID %>'), $('<%= ProcName_67.ClientID %>'), $('<%= ProcDateText_67.ClientID %>') ,$('<%= ProcDate_67.ClientID %>'), $('<%= ProcApproach_67.ClientID %>'), $('<%= ProcIndication_67.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_68_Text.ClientID %>'), $('<%= ProcName_68.ClientID %>'), $('<%= ProcDateText_68.ClientID %>') ,$('<%= ProcDate_68.ClientID %>'), $('<%= ProcApproach_68.ClientID %>'), $('<%= ProcIndication_68.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_69_Text.ClientID %>'), $('<%= ProcName_69.ClientID %>'), $('<%= ProcDateText_69.ClientID %>') ,$('<%= ProcDate_69.ClientID %>'), $('<%= ProcApproach_69.ClientID %>'), $('<%= ProcIndication_69.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_70_Text.ClientID %>'), $('<%= ProcName_70.ClientID %>'), $('<%= ProcDateText_70.ClientID %>') ,$('<%= ProcDate_70.ClientID %>'), $('<%= ProcApproach_70.ClientID %>'), $('<%= ProcIndication_70.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_71_Text.ClientID %>'), $('<%= ProcName_71.ClientID %>'), $('<%= ProcDateText_71.ClientID %>') ,$('<%= ProcDate_71.ClientID %>'), $('<%= ProcApproach_71.ClientID %>'), $('<%= ProcIndication_71.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_72_Text.ClientID %>'), $('<%= ProcName_72.ClientID %>'), $('<%= ProcDateText_72.ClientID %>') ,$('<%= ProcDate_72.ClientID %>'), $('<%= ProcApproach_72.ClientID %>'), $('<%= ProcIndication_72.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_73_Text.ClientID %>'), $('<%= ProcName_73.ClientID %>'), $('<%= ProcDateText_73.ClientID %>') ,$('<%= ProcDate_73.ClientID %>'), $('<%= ProcApproach_73.ClientID %>'), $('<%= ProcIndication_73.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_74_Text.ClientID %>'), $('<%= ProcName_74.ClientID %>'), $('<%= ProcDateText_74.ClientID %>') ,$('<%= ProcDate_74.ClientID %>'), $('<%= ProcApproach_74.ClientID %>'), $('<%= ProcIndication_74.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));
    addProcEvents($('<%= ProcName_75_Text.ClientID %>'), $('<%= ProcName_75.ClientID %>'), $('<%= ProcDateText_75.ClientID %>') ,$('<%= ProcDate_75.ClientID %>'), $('<%= ProcApproach_75.ClientID %>'), $('<%= ProcIndication_75.ClientID %>'), $('<%= ProcDateText.ClientID %>'), $('<%= ProcDate.ClientID %>'), $('<%= ProcApproach.ClientID %>'), $('<%= ProcIndication.ClientID %>'), $('<%= ProcNamePrefix.ClientID %>'));

    function addProcEvents(procNameID,procNameCBID, procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID)
    {   
        // update associated global date element
        $(dateTextID).addEvent('blur',curry(GlobalAssociatedDate,dateTextID, dateID));
        // also, calculate on page load
        GlobalAssociatedDate(dateTextID, dateID);
        
        if (procNameCBID.type == 'checkbox') {
            $(procNameCBID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID));
            $(dateTextID).addEvent('blur',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID));
            $(approachID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID));
            $(indicationID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID));
            $(procNamePrefixID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID));
        }
        else if (procNameCBID.type == 'text') {
            $(procNameCBID).addEvent('blur',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID));
            $(dateTextID).addEvent('blur',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID));
            $(approachID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID));
            $(indicationID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID));
            $(procNamePrefixID).addEvent('click',curry(onProcClick,procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID));
        }
    }
    
    function onProcClick(procNameID, procNameCBID,procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID) {
    
        var prefixList = procNamePrefixID.getElementsByTagName("input");
            
        for (var i = 0; i < prefixList.length; i++) {

            // determine if the prefix Salvage or Salvage is clicked
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
        SetProcedureFields (procNameID, procNameCBID, procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID); 
        
            
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

    
    function SetProcedureFields (procNameID, procNameCBID, procDateTextID, procDateID, procApproachID, procIndicationID, dateTextID, dateID, approachID, indicationID, procNamePrefixID) 
    {
        var procNamePrefixRef = procNamePrefixID.getElementsByTagName("input");
        var approachRef = approachID.getElementsByTagName("input");
        var indicationRef = indicationID.getElementsByTagName("input");
  
      // if user clicked a procedure name            
      if (procNameCBID.type == 'checkbox')
      {
        if (procNameCBID.checked)
        {                  
            // set hidden fields for procedure date and OR details
            procDateTextID.value = dateTextID.value;
            procDateID.value = dateID.value;
            document.getElementById('<%= OpDateText_60.ClientID %>').value = dateTextID.value;
            document.getElementById('<%= OpDate_60.ClientID %>').value = dateID.value;


            // set hidden fields for procedure approach 
             for (var i = 0; i < approachRef.length; i++) 
                if (approachRef[i].checked) {
                    procApproachID.value = approachRef[i].value;
                    }

            // set hidden fields for procedure indication, only if 'Salvage' prefix is selected 
             for (var i = 0; i < procNamePrefixRef.length; i++) 
                if (procNamePrefixRef[i].checked && procNamePrefixRef[i].value == 'Salvage') {                    
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
            document.getElementById('<%= OpDateText_60.ClientID %>').value = '';
            document.getElementById('<%= OpDate_60.ClientID %>').value = '';
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
            document.getElementById('<%= OpDateText_60.ClientID %>').value = dateTextID.value;
            document.getElementById('<%= OpDate_60.ClientID %>').value = dateID.value;

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
            document.getElementById('<%= OpDateText_60.ClientID %>').value = '';
            document.getElementById('<%= OpDate_60.ClientID %>').value = '';
        }
      }
    } 

</script>