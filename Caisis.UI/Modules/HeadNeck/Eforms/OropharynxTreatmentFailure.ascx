<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxTreatmentFailure" CodeFile="OropharynxTreatmentFailure.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript" type="text/javascript">
    tableArray.OropharynxTreatmentFailureHtmlTable = "OropharynxTreatmentFailureHtmlTable";
    tableArray.OropharynxTreatmentFailureHtmlTable = "OropharynxLocalRecurrenceHtmlTable";
    tableArray.OropharynxTreatmentFailureHtmlTable = "OropharynxNeckRecurrenceHtmlTable";
    tableArray.OropharynxTreatmentFailureHtmlTable = "OropharynxDistantFailureHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="OropharynxTreatmentFailure" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Treatment Failure"></asp:Label><br/>
<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Treatment Failure ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="TreatmentRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="TreatmentRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

 <div id="TreatmentAbsentDiv" runat="server" style="display: none; ">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox Table="NoTable" Field="NoTreatment_Date" ID="NoTreatment_Date" runat="server" Width="100px" ShowCalendar="true" /></td>
        </tr>
    </table>
</div>

<div id="TreatmentDiv" runat="server" style="display: none; ">
<%--<strong>Treatment Failure</strong>--%><br />
<table style="display:none;"      width="650" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxTreatmentFailureHtmlTable" >

    <tr>
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="10" TABLE="Status" FIELD="Status" ID="Status_10" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="10" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_10" Runat="server"    />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="10" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_10" Runat="server"   />
               
                <euc:EformTextBox  Width="100px" RecordId="10" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_10" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;"  RecordId="10" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_10"     Runat="server"/></td>
        
    </tr>
</table>
<%--<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxTreatmentFailureHtmlTable');" />--%>

<br />

<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Local Recurrence ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="LocalRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="LocalRecorded" >
                <asp:ListItem>None</asp:ListItem>
                <asp:ListItem>Present</asp:ListItem>
                <asp:ListItem>Not Assessable</asp:ListItem>
            </euc:EformRadioButtonList></td>
</tr>
</table>

 <div id="LocalAbsentDiv" runat="server" style="display: none; ">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox Table="NoTable" Field="NoLocal_Date" ID="NoLocal_Date" runat="server" Width="100px" ShowCalendar="true" /></td>
        </tr>
    </table>
</div>



<div id="LocalDiv" runat="server" style="display: none; ">
<%--<strong>Local Recurrence</strong><br />--%>
<table width="650" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxLocalRecurrenceHtmlTable">

    <tr>
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="15" TABLE="Status" FIELD="Status" ID="Status_15" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="15" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_15" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="15" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_15" Runat="server"   />
               
                <euc:EformTextBox  Width="100px" RecordId="15" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_15" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;" RecordId="15" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_15"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap; "> <strong>Site of Local Recurrence</strong><br />  

            <input type="checkbox" id="Status_LocalRecurrence_15a" value="Tonsillar Bed" runat="server"   />Tonsillar Bed<br />
            <input type="checkbox" id="Status_LocalRecurrence_15b" value="Base of Tongue" runat="server"   />Base of Tongue<br />
            <input type="checkbox" id="Status_LocalRecurrence_15c" value="Anterior Tongue" runat="server"   />Anterior Tongue<br />
            <input type="checkbox" id="Status_LocalRecurrence_15d" value="Pharynx" runat="server"   />Pharynx<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_LocalRecurrence_15other"     runat="server"   />
            
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="15" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_15" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap; "> <strong>Rx of Local Recurrence</strong><br />  

            <input type="checkbox" id="Status_LocalRecurrenceRx_15a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_15b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_15c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_15d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_15e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_LocalRecurrenceRx_15other"     runat="server"   />
            
            </td>       
    </tr>
    <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="16" TABLE="Status" FIELD="Status" ID="Status_16" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="16" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_16" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="16" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_16" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="16" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_16" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;" RecordId="16" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_16"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Local Recurrence</strong><br />  
 
             <input type="checkbox" id="Status_LocalRecurrence_16a" value="Tonsillar Bed" runat="server"   />Tonsillar Bed<br />
            <input type="checkbox" id="Status_LocalRecurrence_16b" value="Base of Tongue" runat="server"   />Base of Tongue<br />
            <input type="checkbox" id="Status_LocalRecurrence_16c" value="Anterior Tongue" runat="server"   />Anterior Tongue<br />
            <input type="checkbox" id="Status_LocalRecurrence_16d" value="Pharynx" runat="server"   />Pharynx<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_LocalRecurrence_16other"     runat="server"   />
        
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="16" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_16" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Local Recurrence</strong><br />  
              
             <input type="checkbox" id="Status_LocalRecurrenceRx_16a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_16b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_16c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_16d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_16e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_LocalRecurrenceRx_16other"     runat="server"   />
           
            </td>       
    </tr>
    <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="17" TABLE="Status" FIELD="Status" ID="Status_17" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="17" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_17" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="17" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_17" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="17" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_17" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;" RecordId="17" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_17"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Local Recurrence</strong><br />  
 
             <input type="checkbox" id="Status_LocalRecurrence_17a" value="Tonsillar Bed" runat="server"   />Tonsillar Bed<br />
            <input type="checkbox" id="Status_LocalRecurrence_17b" value="Base of Tongue" runat="server"   />Base of Tongue<br />
            <input type="checkbox" id="Status_LocalRecurrence_17c" value="Anterior Tongue" runat="server"   />Anterior Tongue<br />
            <input type="checkbox" id="Status_LocalRecurrence_17d" value="Pharynx" runat="server"   />Pharynx<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_LocalRecurrence_17other"     runat="server"   />
           
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="17" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_17" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Local Recurrence</strong><br />  
 
             <input type="checkbox" id="Status_LocalRecurrenceRx_17a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_17b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_17c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_17d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_17e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_LocalRecurrenceRx_17other"     runat="server"   />
           
            </td>       
    </tr>
     <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="18" TABLE="Status" FIELD="Status" ID="Status_18" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="18" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_18" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="18" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_18" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="18" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_18" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;" RecordId="18" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_18"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Local Recurrence</strong><br />  
 
             <input type="checkbox" id="Status_LocalRecurrence_18a" value="Tonsillar Bed" runat="server"   />Tonsillar Bed<br />
            <input type="checkbox" id="Status_LocalRecurrence_18b" value="Base of Tongue" runat="server"   />Base of Tongue<br />
            <input type="checkbox" id="Status_LocalRecurrence_18c" value="Anterior Tongue" runat="server"   />Anterior Tongue<br />
            <input type="checkbox" id="Status_LocalRecurrence_18d" value="Pharynx" runat="server"   />Pharynx<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_LocalRecurrence_18other"     runat="server"   />
           
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="18" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_18" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Local Recurrence</strong><br />  

            <input type="checkbox" id="Status_LocalRecurrenceRx_18a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_18b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_18c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_18d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_18e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_LocalRecurrenceRx_18other"     runat="server"   />
            
            </td>       
    </tr>
     <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="19" TABLE="Status" FIELD="Status" ID="Status_19" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="19" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_19" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="19" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_19" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="19" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_19" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;" RecordId="19" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_19"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Local Recurrence</strong><br />  
 
             <input type="checkbox" id="Status_LocalRecurrence_19a" value="Tonsillar Bed" runat="server"   />Tonsillar Bed<br />
            <input type="checkbox" id="Status_LocalRecurrence_19b" value="Base of Tongue" runat="server"   />Base of Tongue<br />
            <input type="checkbox" id="Status_LocalRecurrence_19c" value="Anterior Tongue" runat="server"   />Anterior Tongue<br />
            <input type="checkbox" id="Status_LocalRecurrence_19d" value="Pharynx" runat="server"   />Pharynx<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_LocalRecurrence_19other"     runat="server"   />
           
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="19" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_19" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Local Recurrence</strong><br />  
 
             <input type="checkbox" id="Status_LocalRecurrenceRx_19a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_19b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_19c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_19d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_LocalRecurrenceRx_19e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_LocalRecurrenceRx_19other"     runat="server"   />
           
            </td>       
    </tr>     
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxLocalRecurrenceHtmlTable');" />
</div>
<br /><br />

<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Neck Recurrence ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="NeckRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="NeckRecorded" EnableHiddenOnUIEvent="Status_12,StatusDisease_12">
                <asp:ListItem>None</asp:ListItem>
                <asp:ListItem>Present</asp:ListItem>
                <asp:ListItem>Not Assessable</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

 <div id="NeckAbsentDiv" runat="server" style="display: none; ">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox Table="NoTable" Field="NoNeck_Date" ID="NoNeck_Date" runat="server" Width="100px" ShowCalendar="true" /></td>
        </tr>
    </table>
</div>


<div id="NeckDiv" runat="server" style="display: none; ">
<%--<strong>Neck Recurrence</strong><br />--%>
<table width="650" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxNeckRecurrenceHtmlTable">

    <tr>
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="20" TABLE="Status" FIELD="Status" ID="Status_20" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="20" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_20" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="20" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_20" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="20" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_20" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;" RecordId="20" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_20"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Neck Recurrence</strong><br />  
 
              <input type="checkbox" id="Status_NeckRecurrence_20a" value="Ipsilateral Neck" runat="server"   />Ipsilateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_20b" value="Contralateral Neck" runat="server"   />Contralateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_20c" value="Bilateral Neck" runat="server"   />Bilateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_20d" value="Central Compartment" runat="server"   />Central Compartment<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_NeckRecurrence_20other"     runat="server"   />

           
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="20" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_20" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Local Recurrence</strong><br />  
 
              <input type="checkbox" id="Status_NeckRecurrenceRx_20a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_20b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_20c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_20d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_20e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_NeckRecurrenceRx_20other"     runat="server"   />

           
            </td>       
    </tr>
    <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="21" TABLE="Status" FIELD="Status" ID="Status_21" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="21" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_21" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="21" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_21" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="21" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_21" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;" RecordId="21" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_21"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Neck Recurrence</strong><br />  
 
            <input type="checkbox" id="Status_NeckRecurrence_21a" value="Ipsilateral Neck" runat="server"   />Ipsilateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_21b" value="Contralateral Neck" runat="server"   />Contralateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_21c" value="Bilateral Neck" runat="server"   />Bilateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_21d" value="Central Compartment" runat="server"   />Central Compartment<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_NeckRecurrence_21other"     runat="server"   />
           
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="21" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_21" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Local Recurrence</strong><br />  

              <input type="checkbox" id="Status_NeckRecurrenceRx_21a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_21b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_21c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_21d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_21e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_NeckRecurrenceRx_21other"     runat="server"   />
            
            </td>       
    </tr>
    <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="22" TABLE="Status" FIELD="Status" ID="Status_22" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="22" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_22" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="22" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_22" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="22" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_22" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;" RecordId="22" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_22"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Neck Recurrence</strong><br />  

              <input type="checkbox" id="Status_NeckRecurrence_22a" value="Ipsilateral Neck" runat="server"   />Ipsilateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_22b" value="Contralateral Neck" runat="server"   />Contralateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_22c" value="Bilateral Neck" runat="server"   />Bilateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_22d" value="Central Compartment" runat="server"   />Central Compartment<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_NeckRecurrence_22other"     runat="server"   />
            
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="22" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_22" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Local Recurrence</strong><br />  
 
               <input type="checkbox" id="Status_NeckRecurrenceRx_22a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_22b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_22c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_22d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_22e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_NeckRecurrenceRx_22other"     runat="server"   />
           
            </td>       
    </tr> 
    <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="23" TABLE="Status" FIELD="Status" ID="Status_23" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="23" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_23" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="23" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_23" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="23" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_23" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;" RecordId="23" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_23"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Neck Recurrence</strong><br />  

              <input type="checkbox" id="Status_NeckRecurrence_23a" value="Ipsilateral Neck" runat="server"   />Ipsilateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_23b" value="Contralateral Neck" runat="server"   />Contralateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_23c" value="Bilateral Neck" runat="server"   />Bilateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_23d" value="Central Compartment" runat="server"   />Central Compartment<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_NeckRecurrence_23other"     runat="server"   />
            
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="23" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_23" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Local Recurrence</strong><br />  
 
               <input type="checkbox" id="Status_NeckRecurrenceRx_23a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_23b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_23c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_23d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_23e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_NeckRecurrenceRx_23other"     runat="server"   />
           
            </td>       
    </tr>  
    <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="24" TABLE="Status" FIELD="Status" ID="Status_24" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="24" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_24" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="24" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_24" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="24" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_24" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;" RecordId="24" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_24"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Neck Recurrence</strong><br />  

              <input type="checkbox" id="Status_NeckRecurrence_24a" value="Ipsilateral Neck" runat="server"   />Ipsilateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_24b" value="Contralateral Neck" runat="server"   />Contralateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_24c" value="Bilateral Neck" runat="server"   />Bilateral Neck<br />
            <input type="checkbox" id="Status_NeckRecurrence_24d" value="Central Compartment" runat="server"   />Central Compartment<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_NeckRecurrence_24other"     runat="server"   />

            
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="24" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_24" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Local Recurrence</strong><br />  
 
               <input type="checkbox" id="Status_NeckRecurrenceRx_24a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_24b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_24c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_24d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_NeckRecurrenceRx_24e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_NeckRecurrenceRx_24other"     runat="server"   />
           
            </td>       
    </tr>   
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxNeckRecurrenceHtmlTable');" />
</div>
<br /><br />

<table></table>
<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Distant Failure ?&nbsp;&nbsp;&nbsp;</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="DistantRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="DistantRecorded" EnableHiddenOnUIEvent="Status_13,StatusDisease_13">
                <asp:ListItem>None</asp:ListItem>
                <asp:ListItem>Present</asp:ListItem>
                <asp:ListItem>Not Assessable</asp:ListItem>
            </euc:EformRadioButtonList></td>
  </tr>
</table>

 <div id="DistantAbsentDiv" runat="server" style="display: none; ">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox Table="NoTable" Field="NoDistant_Date" ID="NoDistant_Date" runat="server" Width="100px" ShowCalendar="true"   /></td>
        </tr>
    </table>
</div>


<div id="DistantDiv" runat="server" style="display: none; ">
<%--<strong>Distant Failure</strong><br />--%>
<table width="650" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxDistantFailureHtmlTable">

    <tr>
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="25" TABLE="Status" FIELD="Status" ID="Status_25" Value="Distant Failure" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="25" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_25" Value="Oropharyngeal Cancer" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="25" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_25" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="25" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_25" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformTextBox Width="1px" Style="display: none;"                 RecordId="25" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_25"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Distant Failure</strong><br />  

               <input type="checkbox" id="Status_DistantFailure_25a" value="Lung" runat="server"   />Lung<br />
            <input type="checkbox" id="Status_DistantFailure_25b" value="Brain" runat="server"   />Brain<br />
            <input type="checkbox" id="Status_DistantFailure_25c" value="Bone" runat="server"   />Bone<br />
            <input style="display:none;" type="checkbox" id="Status_DistantFailure_25d" value="" runat="server"   /><br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_DistantFailure_25other"     runat="server"   />
           
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="25" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_25" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Distant Failure</strong><br />  
 
                <input type="checkbox" id="Status_DistantFailureRx_25a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_DistantFailureRx_25b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_DistantFailureRx_25c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_DistantFailureRx_25d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_DistantFailureRx_25e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_DistantFailureRx_25other"     runat="server"   />
           
            </td>       
    </tr>
    <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="26" TABLE="Status" FIELD="Status" ID="Status_26" Value="Distant Failure" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="26" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_26" Value="Oropharyngeal Cancer" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="26" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_26" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="26" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_26" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;"                 RecordId="26" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_26"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Distant Failure</strong><br />  

               <input type="checkbox" id="Status_DistantFailure_26a" value="Lung" runat="server"   />Lung<br />
            <input type="checkbox" id="Status_DistantFailure_26b" value="Brain" runat="server"   />Brain<br />
            <input type="checkbox" id="Status_DistantFailure_26c" value="Bone" runat="server"   />Bone<br />
            <input style="display:none;" type="checkbox" id="Status_DistantFailure_26d" value="" runat="server"   /><br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_DistantFailure_26other"     runat="server"   />
            
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="26" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_26" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Distant Failure</strong><br />  

                <input type="checkbox" id="Status_DistantFailureRx_26a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_DistantFailureRx_26b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_DistantFailureRx_26c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_DistantFailureRx_26d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_DistantFailureRx_26e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_DistantFailureRx_26other"     runat="server"   />
            
            </td>       
    </tr>
    <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="27" TABLE="Status" FIELD="Status" ID="Status_27" Value="Distant Failure" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="27" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_27" Value="Oropharyngeal Cancer" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="27" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_27" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="27" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_27" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;"                 RecordId="27" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_27"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Distant Failure</strong><br />  
 
            <input type="checkbox" id="Status_DistantFailure_27a" value="Lung" runat="server"   />Lung<br />
            <input type="checkbox" id="Status_DistantFailure_27b" value="Brain" runat="server"   />Brain<br />
            <input type="checkbox" id="Status_DistantFailure_27c" value="Bone" runat="server"   />Bone<br />
            <input style="display:none;" type="checkbox" id="Status_DistantFailure_27d" value="" runat="server"   /><br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_DistantFailure_27other"     runat="server"   />
           
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="27" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_27" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Distant Failure</strong><br />  

                <input type="checkbox" id="Status_DistantFailureRx_27a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_DistantFailureRx_27b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_DistantFailureRx_27c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_DistantFailureRx_27d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_DistantFailureRx_27e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_DistantFailureRx_27other"     runat="server"   />
            
            </td>       
    </tr>     
    <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="28" TABLE="Status" FIELD="Status" ID="Status_28" Value="Distant Failure" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="28" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_28" Value="Oropharyngeal Cancer" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="28" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_28" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="28" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_28" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;"                 RecordId="28" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_28"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Distant Failure</strong><br />  

             <input type="checkbox" id="Status_DistantFailure_28a" value="Lung" runat="server"   />Lung<br />
            <input type="checkbox" id="Status_DistantFailure_28b" value="Brain" runat="server"   />Brain<br />
            <input type="checkbox" id="Status_DistantFailure_28c" value="Bone" runat="server"   />Bone<br />
            <input style="display:none;" type="checkbox" id="Status_DistantFailure_28d" value="" runat="server"   /><br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_DistantFailure_28other"     runat="server"   />
            
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="28" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_28" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Distant Failure</strong><br />  

                <input type="checkbox" id="Status_DistantFailureRx_28a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_DistantFailureRx_28b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_DistantFailureRx_28c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_DistantFailureRx_28d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_DistantFailureRx_28e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_DistantFailureRx_28other"     runat="server"   />
            
            </td>       
    </tr> 
    <tr style="display: none;">
     <td align="left" valign="top" style="white-space: nowrap"> <strong>Date</strong><br />    
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="29" TABLE="Status" FIELD="Status" ID="Status_29" Value="Distant Failure" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="29" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_29" Value="Oropharyngeal Cancer" Runat="server"  TabIndex="2"  />
               <euc:EformTextBox Width="1px" Style="display: none;" RecordId="29" TABLE="Status" FIELD="StatusQuality" ID="StatusQuality_29" Runat="server"   />

                <euc:EformTextBox  Width="100px" RecordId="29" TABLE="Status"   FIELD="StatusDateText" ID="StatusDateText_29" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformTextBox Width="1px" Style="display: none;"                 RecordId="29" TABLE="Status" FIELD="StatusDate"     ID="StatusDate_29"     Runat="server"/></td>

          <td align="left" valign="top" style="white-space: nowrap"> <strong>Site of Distant Failure</strong><br />  

               <input type="checkbox" id="Status_DistantFailure_29a" value="Lung" runat="server"   />Lung<br />
            <input type="checkbox" id="Status_DistantFailure_29b" value="Brain" runat="server"   />Brain<br />
            <input type="checkbox" id="Status_DistantFailure_29c" value="Bone" runat="server"   />Bone<br />
            <input style="display:none;" type="checkbox" id="Status_DistantFailure_29d" value="" runat="server"   /><br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_DistantFailure_29other"     runat="server"   />
            
                <euc:EformTextBox Width="1px" Style="display: none;" RecordId="29" TABLE="Status" FIELD="StatusNotes" ID="StatusNotes_29" Runat="server"  TabIndex="2"  />
            </td>
 
           <td align="left" valign="top" style="white-space: nowrap"> <strong>Rx of Distant Failure</strong><br />  
            
                  <input type="checkbox" id="Status_DistantFailureRx_29a" value="None" runat="server"   />None<br />
            <input type="checkbox" id="Status_DistantFailureRx_29b" value="Surgery" runat="server"   />Surgery<br />
            <input type="checkbox" id="Status_DistantFailureRx_29c" value="RT" runat="server"   />RT<br />
            <input type="checkbox" id="Status_DistantFailureRx_29d" value="Chemo" runat="server"   />Chemo<br />
            <input type="checkbox" id="Status_DistantFailureRx_29e" value="NK" runat="server"   />NK<br />
            <strong>Other:&nbsp;</strong>
                <input type="text" id="Status_DistantFailureRx_29other"     runat="server"   />

            
            </td>       
    </tr> 
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxDistantFailureHtmlTable');" />
</div>
</div>
<br/><br/><br/>

<script type="text/javascript">

   function  ShowDivOnClick(OutcomeRecordedID,OutcomeDivID,OutcomeAbsentDivID,OutcomeAbsentDateID,OutcomeStatusDateTextID,OutcomeStatusDateID)
   {   
       var OutcomeRecordedRef = OutcomeRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < OutcomeRecordedRef.length; i++) 
        if (OutcomeRecordedRef[i].checked) 
        {  
            OutcomeStatusDateTextID.value = '';
            OutcomeStatusDateID.value = '';
            OutcomeAbsentDateID.value = '';
            
              if (OutcomeRecordedRef[i].value == "Yes" || OutcomeRecordedRef[i].value == "Present")
              { 
               OutcomeDivID.style.display='block';
               OutcomeAbsentDivID.style.display='none';
              } 
              else if (OutcomeRecordedRef[i].value == "No" || OutcomeRecordedRef[i].value == "None" || OutcomeRecordedRef[i].value == "Not Assessable")
              {
                OutcomeAbsentDivID.style.display='block';
                OutcomeDivID.style.display='none';
              }
        }
   }

   function  ShowDivOnLoad(OutcomeRecordedID,OutcomeDivID,OutcomeAbsentDivID,OutcomeAbsentDateID,OutcomeStatusDateTextID,OutcomeStatusDateID)
   {   
       var OutcomeRecordedRef = OutcomeRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < OutcomeRecordedRef.length; i++) 
        if (OutcomeRecordedRef[i].checked) 
        {           
              if (OutcomeRecordedRef[i].value == "Yes" || OutcomeRecordedRef[i].value == "Present")
              { 
               OutcomeDivID.style.display='block';
               OutcomeAbsentDivID.style.display='none';
              } 
              else if (OutcomeRecordedRef[i].value == "No" || OutcomeRecordedRef[i].value == "None" || OutcomeRecordedRef[i].value == "Not Assessable")
              {
                OutcomeAbsentDivID.style.display='block';
                OutcomeDivID.style.display='none';
              }
        }
   }
     

//********************************************************************************
//********************************************************************************
//********************************************************************************

    addEvent2b($('<%= StatusNotes_15.ClientID %>'),$('<%= Status_LocalRecurrence_15a.ClientID %>'),$('<%= Status_LocalRecurrence_15b.ClientID %>'),$('<%= Status_LocalRecurrence_15c.ClientID %>'),$('<%= Status_LocalRecurrence_15d.ClientID %>'),$('<%= Status_LocalRecurrence_15other.ClientID %>'), 'Site of Local Recurrence: ',$('<%= Status_LocalRecurrenceRx_15a.ClientID %>'),$('<%= Status_LocalRecurrenceRx_15b.ClientID %>'),$('<%= Status_LocalRecurrenceRx_15c.ClientID %>'),$('<%= Status_LocalRecurrenceRx_15d.ClientID %>'),$('<%= Status_LocalRecurrenceRx_15e.ClientID %>'),$('<%= Status_LocalRecurrenceRx_15other.ClientID %>'), 'Rx of Local Recurrence: ');
    addEvent2b($('<%= StatusNotes_16.ClientID %>'),$('<%= Status_LocalRecurrence_16a.ClientID %>'),$('<%= Status_LocalRecurrence_16b.ClientID %>'),$('<%= Status_LocalRecurrence_16c.ClientID %>'),$('<%= Status_LocalRecurrence_16d.ClientID %>'),$('<%= Status_LocalRecurrence_16other.ClientID %>'), 'Site of Local Recurrence: ',$('<%= Status_LocalRecurrenceRx_16a.ClientID %>'),$('<%= Status_LocalRecurrenceRx_16b.ClientID %>'),$('<%= Status_LocalRecurrenceRx_16c.ClientID %>'),$('<%= Status_LocalRecurrenceRx_16d.ClientID %>'),$('<%= Status_LocalRecurrenceRx_16e.ClientID %>'),$('<%= Status_LocalRecurrenceRx_16other.ClientID %>'), 'Rx of Local Recurrence: ');
    addEvent2b($('<%= StatusNotes_17.ClientID %>'),$('<%= Status_LocalRecurrence_17a.ClientID %>'),$('<%= Status_LocalRecurrence_17b.ClientID %>'),$('<%= Status_LocalRecurrence_17c.ClientID %>'),$('<%= Status_LocalRecurrence_17d.ClientID %>'),$('<%= Status_LocalRecurrence_17other.ClientID %>'), 'Site of Local Recurrence: ',$('<%= Status_LocalRecurrenceRx_17a.ClientID %>'),$('<%= Status_LocalRecurrenceRx_17b.ClientID %>'),$('<%= Status_LocalRecurrenceRx_17c.ClientID %>'),$('<%= Status_LocalRecurrenceRx_17d.ClientID %>'),$('<%= Status_LocalRecurrenceRx_17e.ClientID %>'),$('<%= Status_LocalRecurrenceRx_17other.ClientID %>'), 'Rx of Local Recurrence: ');
    addEvent2b($('<%= StatusNotes_18.ClientID %>'),$('<%= Status_LocalRecurrence_18a.ClientID %>'),$('<%= Status_LocalRecurrence_18b.ClientID %>'),$('<%= Status_LocalRecurrence_18c.ClientID %>'),$('<%= Status_LocalRecurrence_18d.ClientID %>'),$('<%= Status_LocalRecurrence_18other.ClientID %>'), 'Site of Local Recurrence: ',$('<%= Status_LocalRecurrenceRx_18a.ClientID %>'),$('<%= Status_LocalRecurrenceRx_18b.ClientID %>'),$('<%= Status_LocalRecurrenceRx_18c.ClientID %>'),$('<%= Status_LocalRecurrenceRx_18d.ClientID %>'),$('<%= Status_LocalRecurrenceRx_18e.ClientID %>'),$('<%= Status_LocalRecurrenceRx_18other.ClientID %>'), 'Rx of Local Recurrence: ');
    addEvent2b($('<%= StatusNotes_19.ClientID %>'),$('<%= Status_LocalRecurrence_19a.ClientID %>'),$('<%= Status_LocalRecurrence_19b.ClientID %>'),$('<%= Status_LocalRecurrence_19c.ClientID %>'),$('<%= Status_LocalRecurrence_19d.ClientID %>'),$('<%= Status_LocalRecurrence_19other.ClientID %>'), 'Site of Local Recurrence: ',$('<%= Status_LocalRecurrenceRx_19a.ClientID %>'),$('<%= Status_LocalRecurrenceRx_19b.ClientID %>'),$('<%= Status_LocalRecurrenceRx_19c.ClientID %>'),$('<%= Status_LocalRecurrenceRx_19d.ClientID %>'),$('<%= Status_LocalRecurrenceRx_19e.ClientID %>'),$('<%= Status_LocalRecurrenceRx_19other.ClientID %>'), 'Rx of Local Recurrence: ');

    addEvent2b($('<%= StatusNotes_20.ClientID %>'),$('<%= Status_NeckRecurrence_20a.ClientID %>'),$('<%= Status_NeckRecurrence_20b.ClientID %>'),$('<%= Status_NeckRecurrence_20c.ClientID %>'),$('<%= Status_NeckRecurrence_20d.ClientID %>'),$('<%= Status_NeckRecurrence_20other.ClientID %>'), 'Site of Neck Recurrence: ',$('<%= Status_NeckRecurrenceRx_20a.ClientID %>'),$('<%= Status_NeckRecurrenceRx_20b.ClientID %>'),$('<%= Status_NeckRecurrenceRx_20c.ClientID %>'),$('<%= Status_NeckRecurrenceRx_20d.ClientID %>'),$('<%= Status_NeckRecurrenceRx_20e.ClientID %>'),$('<%= Status_NeckRecurrenceRx_20other.ClientID %>'), 'Rx of Neck Recurrence: ');
    addEvent2b($('<%= StatusNotes_21.ClientID %>'),$('<%= Status_NeckRecurrence_21a.ClientID %>'),$('<%= Status_NeckRecurrence_21b.ClientID %>'),$('<%= Status_NeckRecurrence_21c.ClientID %>'),$('<%= Status_NeckRecurrence_21d.ClientID %>'),$('<%= Status_NeckRecurrence_21other.ClientID %>'), 'Site of Neck Recurrence: ',$('<%= Status_NeckRecurrenceRx_21a.ClientID %>'),$('<%= Status_NeckRecurrenceRx_21b.ClientID %>'),$('<%= Status_NeckRecurrenceRx_21c.ClientID %>'),$('<%= Status_NeckRecurrenceRx_21d.ClientID %>'),$('<%= Status_NeckRecurrenceRx_21e.ClientID %>'),$('<%= Status_NeckRecurrenceRx_21other.ClientID %>'), 'Rx of Neck Recurrence: ');
    addEvent2b($('<%= StatusNotes_22.ClientID %>'),$('<%= Status_NeckRecurrence_22a.ClientID %>'),$('<%= Status_NeckRecurrence_22b.ClientID %>'),$('<%= Status_NeckRecurrence_22c.ClientID %>'),$('<%= Status_NeckRecurrence_22d.ClientID %>'),$('<%= Status_NeckRecurrence_22other.ClientID %>'), 'Site of Neck Recurrence: ',$('<%= Status_NeckRecurrenceRx_22a.ClientID %>'),$('<%= Status_NeckRecurrenceRx_22b.ClientID %>'),$('<%= Status_NeckRecurrenceRx_22c.ClientID %>'),$('<%= Status_NeckRecurrenceRx_22d.ClientID %>'),$('<%= Status_NeckRecurrenceRx_22e.ClientID %>'),$('<%= Status_NeckRecurrenceRx_22other.ClientID %>'), 'Rx of Neck Recurrence: ');
    addEvent2b($('<%= StatusNotes_23.ClientID %>'),$('<%= Status_NeckRecurrence_23a.ClientID %>'),$('<%= Status_NeckRecurrence_23b.ClientID %>'),$('<%= Status_NeckRecurrence_23c.ClientID %>'),$('<%= Status_NeckRecurrence_23d.ClientID %>'),$('<%= Status_NeckRecurrence_23other.ClientID %>'), 'Site of Neck Recurrence: ',$('<%= Status_NeckRecurrenceRx_23a.ClientID %>'),$('<%= Status_NeckRecurrenceRx_23b.ClientID %>'),$('<%= Status_NeckRecurrenceRx_23c.ClientID %>'),$('<%= Status_NeckRecurrenceRx_23d.ClientID %>'),$('<%= Status_NeckRecurrenceRx_23e.ClientID %>'),$('<%= Status_NeckRecurrenceRx_23other.ClientID %>'), 'Rx of Neck Recurrence: ');
    addEvent2b($('<%= StatusNotes_24.ClientID %>'),$('<%= Status_NeckRecurrence_24a.ClientID %>'),$('<%= Status_NeckRecurrence_24b.ClientID %>'),$('<%= Status_NeckRecurrence_24c.ClientID %>'),$('<%= Status_NeckRecurrence_24d.ClientID %>'),$('<%= Status_NeckRecurrence_24other.ClientID %>'), 'Site of Neck Recurrence: ',$('<%= Status_NeckRecurrenceRx_24a.ClientID %>'),$('<%= Status_NeckRecurrenceRx_24b.ClientID %>'),$('<%= Status_NeckRecurrenceRx_24c.ClientID %>'),$('<%= Status_NeckRecurrenceRx_24d.ClientID %>'),$('<%= Status_NeckRecurrenceRx_24e.ClientID %>'),$('<%= Status_NeckRecurrenceRx_24other.ClientID %>'), 'Rx of Neck Recurrence: ');

    addEvent2b($('<%= StatusNotes_25.ClientID %>'),$('<%= Status_DistantFailure_25a.ClientID %>'),$('<%= Status_DistantFailure_25b.ClientID %>'),$('<%= Status_DistantFailure_25c.ClientID %>'),$('<%= Status_DistantFailure_25d.ClientID %>'),$('<%= Status_DistantFailure_25other.ClientID %>'), 'Site of Distant Failure: ',$('<%= Status_DistantFailureRx_25a.ClientID %>'),$('<%= Status_DistantFailureRx_25b.ClientID %>'),$('<%= Status_DistantFailureRx_25c.ClientID %>'),$('<%= Status_DistantFailureRx_25d.ClientID %>'),$('<%= Status_DistantFailureRx_25e.ClientID %>'),$('<%= Status_DistantFailureRx_25other.ClientID %>'), 'Rx of Distant Failure: ');
    addEvent2b($('<%= StatusNotes_26.ClientID %>'),$('<%= Status_DistantFailure_26a.ClientID %>'),$('<%= Status_DistantFailure_26b.ClientID %>'),$('<%= Status_DistantFailure_26c.ClientID %>'),$('<%= Status_DistantFailure_26d.ClientID %>'),$('<%= Status_DistantFailure_26other.ClientID %>'), 'Site of Distant Failure: ',$('<%= Status_DistantFailureRx_26a.ClientID %>'),$('<%= Status_DistantFailureRx_26b.ClientID %>'),$('<%= Status_DistantFailureRx_26c.ClientID %>'),$('<%= Status_DistantFailureRx_26d.ClientID %>'),$('<%= Status_DistantFailureRx_26e.ClientID %>'),$('<%= Status_DistantFailureRx_26other.ClientID %>'), 'Rx of Distant Failure: ');
    addEvent2b($('<%= StatusNotes_27.ClientID %>'),$('<%= Status_DistantFailure_27a.ClientID %>'),$('<%= Status_DistantFailure_27b.ClientID %>'),$('<%= Status_DistantFailure_27c.ClientID %>'),$('<%= Status_DistantFailure_27d.ClientID %>'),$('<%= Status_DistantFailure_27other.ClientID %>'), 'Site of Distant Failure: ',$('<%= Status_DistantFailureRx_27a.ClientID %>'),$('<%= Status_DistantFailureRx_27b.ClientID %>'),$('<%= Status_DistantFailureRx_27c.ClientID %>'),$('<%= Status_DistantFailureRx_27d.ClientID %>'),$('<%= Status_DistantFailureRx_27e.ClientID %>'),$('<%= Status_DistantFailureRx_27other.ClientID %>'), 'Rx of Distant Failure: ');
    addEvent2b($('<%= StatusNotes_28.ClientID %>'),$('<%= Status_DistantFailure_28a.ClientID %>'),$('<%= Status_DistantFailure_28b.ClientID %>'),$('<%= Status_DistantFailure_28c.ClientID %>'),$('<%= Status_DistantFailure_28d.ClientID %>'),$('<%= Status_DistantFailure_28other.ClientID %>'), 'Site of Distant Failure: ',$('<%= Status_DistantFailureRx_28a.ClientID %>'),$('<%= Status_DistantFailureRx_28b.ClientID %>'),$('<%= Status_DistantFailureRx_28c.ClientID %>'),$('<%= Status_DistantFailureRx_28d.ClientID %>'),$('<%= Status_DistantFailureRx_28e.ClientID %>'),$('<%= Status_DistantFailureRx_28other.ClientID %>'), 'Rx of Distant Failure: ');
    addEvent2b($('<%= StatusNotes_29.ClientID %>'),$('<%= Status_DistantFailure_29a.ClientID %>'),$('<%= Status_DistantFailure_29b.ClientID %>'),$('<%= Status_DistantFailure_29c.ClientID %>'),$('<%= Status_DistantFailure_29d.ClientID %>'),$('<%= Status_DistantFailure_29other.ClientID %>'), 'Site of Distant Failure: ',$('<%= Status_DistantFailureRx_29a.ClientID %>'),$('<%= Status_DistantFailureRx_29b.ClientID %>'),$('<%= Status_DistantFailureRx_29c.ClientID %>'),$('<%= Status_DistantFailureRx_29d.ClientID %>'),$('<%= Status_DistantFailureRx_29e.ClientID %>'),$('<%= Status_DistantFailureRx_29other.ClientID %>'), 'Rx of Distant Failure: ');

    function addEvent2b(notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother,rxPrefix)
    { 
        $(siteIDa).addEvent('click',curry(SetNotesField2b,notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix));
        $(siteIDb).addEvent('click',curry(SetNotesField2b,notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix));
        $(siteIDc).addEvent('click',curry(SetNotesField2b,notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix));
        $(siteIDd).addEvent('click',curry(SetNotesField2b,notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix));
        $(siteIDother).addEvent('blur',curry(SetNotesField2b,notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix));
        $(rxIDa).addEvent('click',curry(SetNotesField2b,notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix));
        $(rxIDb).addEvent('click',curry(SetNotesField2b,notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix));
        $(rxIDc).addEvent('click',curry(SetNotesField2b,notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix));
        $(rxIDd).addEvent('click',curry(SetNotesField2b,notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix));
        $(rxIDe).addEvent('click',curry(SetNotesField2b,notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix));
        $(rxIDother).addEvent('blur',curry(SetNotesField2b,notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix));
 
        ShowOnLoad2b(notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix);
    }

    function SetNotesField2b (notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother, rxPrefix)
    {
        notesID.value = '';

    if (siteIDa.checked)
        notesID.value =  notesID.value + siteIDa.value + ",  ";
    if (siteIDb.checked)
        notesID.value =  notesID.value + siteIDb.value + ",  ";
    if (siteIDc.checked)
        notesID.value =  notesID.value + siteIDc.value + ",  ";
    if (siteIDd.checked)
        notesID.value =  notesID.value + siteIDd.value + ",  ";
    if (siteIDother.type == 'text' && siteIDother.value != '')
        notesID.value =  notesID.value + siteIDother.value + ",  ";
        
    if (TrimString(notesID.value) != '')
        notesID.value = sitePrefix + notesID.value;
              
    if (rxIDa.checked || rxIDb.checked || rxIDc.checked || rxIDd.checked || rxIDe.checked || rxIDother.value != '' )  
        notesID.value = notesID.value + "||   " + rxPrefix ;

    if (rxIDa.checked)
        notesID.value =  notesID.value + rxIDa.value + ",  ";
    if (rxIDb.checked)
        notesID.value =  notesID.value + rxIDb.value + ",  ";
    if (rxIDc.checked)
        notesID.value =  notesID.value + rxIDc.value + ",  ";
    if (rxIDd.checked)
        notesID.value =  notesID.value + rxIDd.value + ",  ";
    if (rxIDe.checked)
        notesID.value =  notesID.value + rxIDe.value + ",  ";
    if (rxIDother.type == 'text' && rxIDother.value != '')
        notesID.value =  notesID.value + rxIDother.value + ",  ";
        
    }

   function  ShowOnLoad2b(notesID,siteIDa,siteIDb,siteIDc,siteIDd,siteIDother,sitePrefix,rxIDa,rxIDb,rxIDc,rxIDd,rxIDe,rxIDother,rxPrefix)
   {   
     var tempStr,intIndexOfMatch;
     var notesSite, notesRx;

     // on postback, if the hidden notes texbox has a value, verify if it is for Rx and site
     if (notesID.value.indexOf(rxPrefix) != -1 && notesID.value.indexOf(sitePrefix) != -1) 
     {
     
        notesSite = notesID.value.substring(0,notesID.value.indexOf(rxPrefix));
        notesRx  = notesID.value.substring(notesID.value.indexOf(rxPrefix));
        
        // re-enter the new site of recurrence name into the textbox, without the prefix
        notesSite = notesSite.replace(sitePrefix, "");  
        notesSite = notesSite.replace("||", "");  
        notesSite = TrimString(notesSite);

                   
        if (notesSite.indexOf(siteIDa.value) != -1) 
            siteIDa.checked = true;

        if (notesSite.indexOf(siteIDb.value) != -1) 
            siteIDb.checked = true;

        if (notesSite.indexOf(siteIDc.value) != -1) 
            siteIDc.checked = true;

        if (notesSite.indexOf(siteIDd.value) != -1) 
            siteIDd.checked = true;

        var otherText = notesSite;
        otherText = otherText.replace(siteIDa.value, "");  
        otherText = otherText.replace(siteIDb.value, "");  
        otherText = otherText.replace(siteIDc.value, "");  
        otherText = otherText.replace(siteIDd.value, ""); 
        
        while (otherText.indexOf(",") != -1) 
            otherText = otherText.replace(",", ""); 

        otherText = TrimString(otherText);
        
        if (otherText != '')
            siteIDother.checked = true;
            siteIDother.value = otherText;



        notesRx =  notesRx.replace(rxPrefix, "");  
        notesRx =  notesRx.replace("||", "");  
        notesRx = TrimString(notesRx);
 
        if (notesRx.indexOf(rxIDa.value) != -1) 
            rxIDa.checked = true;

        if (notesRx.indexOf(rxIDb.value) != -1) 
            rxIDb.checked = true;

        if (notesRx.indexOf(rxIDc.value) != -1) 
            rxIDc.checked = true;

        if (notesRx.indexOf(rxIDd.value) != -1) 
            rxIDd.checked = true;

        if (notesRx.indexOf(rxIDe.value) != -1) 
            rxIDe.checked = true;

        var otherTextRx = notesRx;
        otherTextRx = otherTextRx.replace(rxIDa.value, "");  
        otherTextRx = otherTextRx.replace(rxIDb.value, "");  
        otherTextRx = otherTextRx.replace(rxIDc.value, "");  
        otherTextRx = otherTextRx.replace(rxIDd.value, ""); 
        otherTextRx = otherTextRx.replace(rxIDe.value, ""); 
       
        while (otherTextRx.indexOf(",") != -1) 
            otherTextRx = otherTextRx.replace(",", ""); 

        otherTextRx = TrimString(otherTextRx);
        
        if (otherTextRx != '')
            rxIDother.checked = true;
            rxIDother.value = otherTextRx;
     }
     
     // on postback, if the hidden notes texbox has a value, verify if it is for site only
     else if (notesID.value.indexOf(sitePrefix) != -1) 
     { 
        // re-enter the new site of recurrence name into the textbox, without the prefix
        tempStr = notesID.value.replace(sitePrefix, "");  
        tempStr = tempStr.replace("||", "");  
        tempStr = TrimString(tempStr);
            
        if (tempStr.indexOf(siteIDa.value) != -1) 
            siteIDa.checked = true;

        if (tempStr.indexOf(siteIDb.value) != -1) 
            siteIDb.checked = true;

        if (tempStr.indexOf(siteIDc.value) != -1) 
            siteIDc.checked = true;

        if (tempStr.indexOf(siteIDd.value) != -1) 
            siteIDd.checked = true;

        var otherText = tempStr;
        otherText = otherText.replace(siteIDa.value, "");  
        otherText = otherText.replace(siteIDb.value, "");  
        otherText = otherText.replace(siteIDc.value, "");  
        otherText = otherText.replace(siteIDd.value, "");  

        while (otherText.indexOf(",") != -1) 
            otherText = otherText.replace(",", ""); 

        otherText = TrimString(otherText);
        
        if (otherText != '')
            siteIDother.checked = true;
            siteIDother.value = otherText;
     }

     // on postback, if the hidden notes texbox has a value, verify if it is for Rx only
    else if (notesID.value.indexOf(rxPrefix) != -1) 
     {      
        // re-enter the new site of recurrence name into the textbox, without the prefix
        tempStr = notesID.value.replace(sitePrefix, "");  
        tempStr = tempStr.replace("||", "");  
        tempStr = TrimString(tempStr);
 
    
        if (tempStr.indexOf(rxIDa.value) != -1) 
            rxIDa.checked = true;

        if (tempStr.indexOf(rxIDb.value) != -1) 
            rxIDb.checked = true;

        if (tempStr.indexOf(rxIDc.value) != -1) 
            rxIDc.checked = true;

        if (tempStr.indexOf(rxIDd.value) != -1) 
            rxIDd.checked = true;

        if (tempStr.indexOf(rxIDe.value) != -1) 
            rxIDe.checked = true;

        var otherText = tempStr;
        otherText = otherText.replace(rxIDa.value, "");  
        otherText = otherText.replace(rxIDb.value, "");  
        otherText = otherText.replace(rxIDc.value, "");  
        otherText = otherText.replace(rxIDd.value, "");  
        otherText = otherText.replace(rxIDe.value, "");  

        while (otherText.indexOf(",") != -1) 
            otherText = otherText.replace(",", ""); 

        otherText = TrimString(otherText);
        
        if (otherText != '')
            rxIDother.checked = true;
            rxIDother.value = otherText;
     }
   }



   
function TrimString(string) { 
	return string.replace(/^\s+|\s+$/g,""); }
//********************************************************************************
//********************************************************************************
//********************************************************************************

     //Adds events to controls 
    addEvent3($('<%= TreatmentRecorded.ClientID %>'),$('<%= TreatmentDiv.ClientID %>'),$('<%= TreatmentAbsentDiv.ClientID %>'),$('<%= NoTreatment_Date.ClientID %>'),$('<%= Status_10.ClientID %>'),$('<%= StatusDisease_10.ClientID %>'),$('<%= StatusDateText_10.ClientID %>'),$('<%= StatusDate_10.ClientID %>'),$('<%= StatusQuality_10.ClientID %>'));

    function addEvent3(treatmentRecordedID,treatmentDivID,treatmentAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusQualityID)
    { 
        $(statusDateTextID).addEvent('blur',curry(TreatmentYesNo,treatmentRecordedID,treatmentDivID,treatmentAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusQualityID));
        $(absentDateID).addEvent('blur',curry(TreatmentYesNo,treatmentRecordedID,treatmentDivID,treatmentAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusQualityID));
        $(treatmentRecordedID).addEvent('click',curry(TreatmentYesNo,treatmentRecordedID,treatmentDivID,treatmentAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusQualityID));
      
        // check on load as well
        $(treatmentRecordedID).addEvent('click',curry(ShowDivOnClick,treatmentRecordedID,treatmentDivID,treatmentAbsentDivID,absentDateID,statusDateTextID,statusDateID,statusQualityID));
        ShowDivOnLoad(treatmentRecordedID,treatmentDivID,treatmentAbsentDivID,absentDateID,statusDateTextID,statusDateID,statusQualityID);
   }
    
    function TreatmentYesNo(TreatmentRecordedID,TreatmentDivID,TreatmentAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusQualityID)
    {
       var TreatmentRecordedRef = TreatmentRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < TreatmentRecordedRef.length; i++) 
        if (TreatmentRecordedRef[i].checked) {  
            TreatmentRadioClick(TreatmentRecordedRef[i].value,TreatmentDivID,TreatmentAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusQualityID);
            }
    }
    
    function TreatmentRadioClick(Treatmentoption_value,TreatmenthideDiv,TreatmenthideAbsentDiv,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusQualityID)
    {
      if (Treatmentoption_value == "Yes")
      { 
       TreatmenthideDiv.style.display='block';
       TreatmenthideAbsentDiv.style.display='none';

        statusDateTextID.value= '';
        statusDateID.value= '';
        absentDateID.value = ''; 
        statusID.value='';
        statusDiseaseID.value='';
                
      } 
      else if (Treatmentoption_value == "No")
      {
        // No Status needs to be generated for “No Treatment Failure”
        TreatmenthideAbsentDiv.style.display='none';
//        TreatmenthideAbsentDiv.style.display='block';
        TreatmenthideDiv.style.display='none';
        
//        document.getElementById('<%= Status_10.ClientID %>').value='No Treatment Failure';
//        document.getElementById('<%= StatusDisease_10.ClientID %>').value='Oropharyngeal Cancer';
//        document.getElementById('<%= StatusDateText_10.ClientID %>').value= absentDateID.value;
//        document.getElementById('<%= StatusDate_10.ClientID %>').value= absentDateID.value;
 
        // No Status needs to be generated for “No Treatment Failure”
        document.getElementById('<%= Status_10.ClientID %>').value='';
        document.getElementById('<%= StatusDisease_10.ClientID %>').value='';
        document.getElementById('<%= StatusDateText_10.ClientID %>').value= '';
        document.getElementById('<%= StatusDate_10.ClientID %>').value= '';  
        document.getElementById('<%= StatusQuality_10.ClientID %>').value= '';      
      }
    } 
    
//********************************************************************************
//********************************************************************************
//********************************************************************************

     //Adds events to controls 
    addEvent4($('<%= LocalRecorded.ClientID %>'),$('<%= LocalDiv.ClientID %>'),$('<%= LocalAbsentDiv.ClientID %>'),$('<%= NoLocal_Date.ClientID %>'),$('<%= Status_15.ClientID %>'),$('<%= StatusDisease_15.ClientID %>'),$('<%= StatusDateText_15.ClientID %>'),$('<%= StatusDate_15.ClientID %>'),$('<%= Status_LocalRecurrence_15a.ClientID %>'),$('<%= Status_LocalRecurrence_15b.ClientID %>'),$('<%= Status_LocalRecurrence_15c.ClientID %>'),$('<%= Status_LocalRecurrence_15d.ClientID %>'),$('<%= Status_LocalRecurrence_15other.ClientID %>'),$('<%= Status_LocalRecurrenceRx_15a.ClientID %>'),$('<%= Status_LocalRecurrenceRx_15b.ClientID %>'),$('<%= Status_LocalRecurrenceRx_15c.ClientID %>'),$('<%= Status_LocalRecurrenceRx_15d.ClientID %>'),$('<%= Status_LocalRecurrenceRx_15e.ClientID %>'),$('<%= Status_LocalRecurrenceRx_15other.ClientID %>'),$('<%= StatusNotes_15.ClientID %>'),$('<%= StatusQuality_15.ClientID %>'));
    addEvent4($('<%= LocalRecorded.ClientID %>'),$('<%= LocalDiv.ClientID %>'),$('<%= LocalAbsentDiv.ClientID %>'),$('<%= NoLocal_Date.ClientID %>'),$('<%= Status_16.ClientID %>'),$('<%= StatusDisease_16.ClientID %>'),$('<%= StatusDateText_16.ClientID %>'),$('<%= StatusDate_16.ClientID %>'),$('<%= Status_LocalRecurrence_16a.ClientID %>'),$('<%= Status_LocalRecurrence_16b.ClientID %>'),$('<%= Status_LocalRecurrence_16c.ClientID %>'),$('<%= Status_LocalRecurrence_16d.ClientID %>'),$('<%= Status_LocalRecurrence_16other.ClientID %>'),$('<%= Status_LocalRecurrenceRx_16a.ClientID %>'),$('<%= Status_LocalRecurrenceRx_16b.ClientID %>'),$('<%= Status_LocalRecurrenceRx_16c.ClientID %>'),$('<%= Status_LocalRecurrenceRx_16d.ClientID %>'),$('<%= Status_LocalRecurrenceRx_16e.ClientID %>'),$('<%= Status_LocalRecurrenceRx_16other.ClientID %>'),$('<%= StatusNotes_16.ClientID %>'),$('<%= StatusQuality_16.ClientID %>'));
    addEvent4($('<%= LocalRecorded.ClientID %>'),$('<%= LocalDiv.ClientID %>'),$('<%= LocalAbsentDiv.ClientID %>'),$('<%= NoLocal_Date.ClientID %>'),$('<%= Status_17.ClientID %>'),$('<%= StatusDisease_17.ClientID %>'),$('<%= StatusDateText_17.ClientID %>'),$('<%= StatusDate_17.ClientID %>'),$('<%= Status_LocalRecurrence_17a.ClientID %>'),$('<%= Status_LocalRecurrence_17b.ClientID %>'),$('<%= Status_LocalRecurrence_17c.ClientID %>'),$('<%= Status_LocalRecurrence_17d.ClientID %>'),$('<%= Status_LocalRecurrence_17other.ClientID %>'),$('<%= Status_LocalRecurrenceRx_17a.ClientID %>'),$('<%= Status_LocalRecurrenceRx_17b.ClientID %>'),$('<%= Status_LocalRecurrenceRx_17c.ClientID %>'),$('<%= Status_LocalRecurrenceRx_17d.ClientID %>'),$('<%= Status_LocalRecurrenceRx_17e.ClientID %>'),$('<%= Status_LocalRecurrenceRx_17other.ClientID %>'),$('<%= StatusNotes_17.ClientID %>'),$('<%= StatusQuality_17.ClientID %>'));
    addEvent4($('<%= LocalRecorded.ClientID %>'),$('<%= LocalDiv.ClientID %>'),$('<%= LocalAbsentDiv.ClientID %>'),$('<%= NoLocal_Date.ClientID %>'),$('<%= Status_18.ClientID %>'),$('<%= StatusDisease_18.ClientID %>'),$('<%= StatusDateText_18.ClientID %>'),$('<%= StatusDate_18.ClientID %>'),$('<%= Status_LocalRecurrence_18a.ClientID %>'),$('<%= Status_LocalRecurrence_18b.ClientID %>'),$('<%= Status_LocalRecurrence_18c.ClientID %>'),$('<%= Status_LocalRecurrence_18d.ClientID %>'),$('<%= Status_LocalRecurrence_18other.ClientID %>'),$('<%= Status_LocalRecurrenceRx_18a.ClientID %>'),$('<%= Status_LocalRecurrenceRx_18b.ClientID %>'),$('<%= Status_LocalRecurrenceRx_18c.ClientID %>'),$('<%= Status_LocalRecurrenceRx_18d.ClientID %>'),$('<%= Status_LocalRecurrenceRx_18e.ClientID %>'),$('<%= Status_LocalRecurrenceRx_18other.ClientID %>'),$('<%= StatusNotes_18.ClientID %>'),$('<%= StatusQuality_18.ClientID %>'));
    addEvent4($('<%= LocalRecorded.ClientID %>'),$('<%= LocalDiv.ClientID %>'),$('<%= LocalAbsentDiv.ClientID %>'),$('<%= NoLocal_Date.ClientID %>'),$('<%= Status_19.ClientID %>'),$('<%= StatusDisease_19.ClientID %>'),$('<%= StatusDateText_19.ClientID %>'),$('<%= StatusDate_19.ClientID %>'),$('<%= Status_LocalRecurrence_19a.ClientID %>'),$('<%= Status_LocalRecurrence_19b.ClientID %>'),$('<%= Status_LocalRecurrence_19c.ClientID %>'),$('<%= Status_LocalRecurrence_19d.ClientID %>'),$('<%= Status_LocalRecurrence_19other.ClientID %>'),$('<%= Status_LocalRecurrenceRx_19a.ClientID %>'),$('<%= Status_LocalRecurrenceRx_19b.ClientID %>'),$('<%= Status_LocalRecurrenceRx_19c.ClientID %>'),$('<%= Status_LocalRecurrenceRx_19d.ClientID %>'),$('<%= Status_LocalRecurrenceRx_19e.ClientID %>'),$('<%= Status_LocalRecurrenceRx_19other.ClientID %>'),$('<%= StatusNotes_19.ClientID %>'),$('<%= StatusQuality_19.ClientID %>'));

    function addEvent4(localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID)
    { 
        $(statusDateTextID).addEvent('blur',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceIDa).addEvent('click',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceIDb).addEvent('click',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceIDc).addEvent('click',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceIDd).addEvent('click',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceIDother).addEvent('blur',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDa).addEvent('click',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDb).addEvent('click',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDc).addEvent('click',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDd).addEvent('click',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDe).addEvent('click',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDother).addEvent('blur',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(absentDateID).addEvent('blur',curry(LocalYesNo,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
      
        // check on load as well
        $(localRecordedID).addEvent('click',curry(ShowDivOnClick,localRecordedID,localDivID,localAbsentDivID,absentDateID,statusDateTextID,statusDateID));
        ShowDivOnLoad(localRecordedID,localDivID,localAbsentDivID,absentDateID,statusDateTextID,statusDateID);
   }
    
    function LocalYesNo(LocalRecordedID,LocalDivID,LocalAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID)
    {
       var LocalRecordedRef = LocalRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < LocalRecordedRef.length; i++) 
        if (LocalRecordedRef[i].checked) {  
            LocalRadioClick(LocalRecordedRef[i].value,LocalDivID,LocalAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID);
            }
    }
    
    function LocalRadioClick(Localoption_value,LocalhideDiv,LocalhideAbsentDiv,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID)
    {
      if (Localoption_value == "Present")
      { 
       LocalhideDiv.style.display='block';
       LocalhideAbsentDiv.style.display='none';

        absentDateID.value = ''; 
        statusID.value='Local Recurrence';
        statusDiseaseID.value='Oropharyngeal Cancer';
        statusQualityID.value = 'STD';
      } 
      else if (Localoption_value == "None" || Localoption_value == "Not Assessable")
      {
        LocalhideAbsentDiv.style.display='block';
        LocalhideDiv.style.display='none';
        
        // clear any data entered
        statusID.value = '';
        statusDiseaseID.value = '';
        statusDateTextID.value = '';
        statusDateID.value = '';
        statusQualityID.value = '';
        
        statusRecurrenceIDa.checked = false;
        statusRecurrenceIDb.checked = false;
        statusRecurrenceIDc.checked = false;
        statusRecurrenceIDd.checked = false;
        statusRecurrenceIDother.value = '';
 
        statusRecurrenceRxIDa.checked = false;       
        statusRecurrenceRxIDb.checked = false;       
        statusRecurrenceRxIDc.checked = false;       
        statusRecurrenceRxIDd.checked = false;       
        statusRecurrenceRxIDe.checked = false;       
        statusRecurrenceRxIDother.value = '';  
        
        statusNotesID.value = '';
        
        // set first record as None or Not Assessable record
        
        if (Localoption_value == "None")
            document.getElementById('<%= Status_15.ClientID %>').value='No Local Recurrence';
        else if (Localoption_value == "Not Assessable")
            document.getElementById('<%= Status_15.ClientID %>').value='Local Recurrence Not Assessable';

       document.getElementById('<%= StatusDisease_15.ClientID %>').value='Oropharyngeal Cancer';
        document.getElementById('<%= StatusDateText_15.ClientID %>').value= absentDateID.value;
        document.getElementById('<%= StatusDate_15.ClientID %>').value= absentDateID.value;

        document.getElementById('<%= StatusNotes_15.ClientID %>').value='';
        document.getElementById('<%= StatusQuality_15.ClientID %>').value='STD';
      }
    } 
//********************************************************************************
//********************************************************************************
//********************************************************************************

     //Adds events to controls 
    addEvent5($('<%= NeckRecorded.ClientID %>'),$('<%= NeckDiv.ClientID %>'),$('<%= NeckAbsentDiv.ClientID %>'),$('<%= NoNeck_Date.ClientID %>'),$('<%= Status_20.ClientID %>'),$('<%= StatusDisease_20.ClientID %>'),$('<%= StatusDateText_20.ClientID %>'),$('<%= StatusDate_20.ClientID %>'),$('<%= Status_NeckRecurrence_20a.ClientID %>'),$('<%= Status_NeckRecurrence_20b.ClientID %>'),$('<%= Status_NeckRecurrence_20c.ClientID %>'),$('<%= Status_NeckRecurrence_20d.ClientID %>'),$('<%= Status_NeckRecurrence_20other.ClientID %>'),$('<%= Status_NeckRecurrenceRx_20a.ClientID %>'),$('<%= Status_NeckRecurrenceRx_20b.ClientID %>'),$('<%= Status_NeckRecurrenceRx_20c.ClientID %>'),$('<%= Status_NeckRecurrenceRx_20d.ClientID %>'),$('<%= Status_NeckRecurrenceRx_20e.ClientID %>'),$('<%= Status_NeckRecurrenceRx_20other.ClientID %>'),$('<%= StatusNotes_20.ClientID %>'),$('<%= StatusQuality_20.ClientID %>'));
    addEvent5($('<%= NeckRecorded.ClientID %>'),$('<%= NeckDiv.ClientID %>'),$('<%= NeckAbsentDiv.ClientID %>'),$('<%= NoNeck_Date.ClientID %>'),$('<%= Status_21.ClientID %>'),$('<%= StatusDisease_21.ClientID %>'),$('<%= StatusDateText_21.ClientID %>'),$('<%= StatusDate_21.ClientID %>'),$('<%= Status_NeckRecurrence_21a.ClientID %>'),$('<%= Status_NeckRecurrence_21b.ClientID %>'),$('<%= Status_NeckRecurrence_21c.ClientID %>'),$('<%= Status_NeckRecurrence_21d.ClientID %>'),$('<%= Status_NeckRecurrence_21other.ClientID %>'),$('<%= Status_NeckRecurrenceRx_21a.ClientID %>'),$('<%= Status_NeckRecurrenceRx_21b.ClientID %>'),$('<%= Status_NeckRecurrenceRx_21c.ClientID %>'),$('<%= Status_NeckRecurrenceRx_21d.ClientID %>'),$('<%= Status_NeckRecurrenceRx_21e.ClientID %>'),$('<%= Status_NeckRecurrenceRx_21other.ClientID %>'),$('<%= StatusNotes_21.ClientID %>'),$('<%= StatusQuality_21.ClientID %>'));
    addEvent5($('<%= NeckRecorded.ClientID %>'),$('<%= NeckDiv.ClientID %>'),$('<%= NeckAbsentDiv.ClientID %>'),$('<%= NoNeck_Date.ClientID %>'),$('<%= Status_22.ClientID %>'),$('<%= StatusDisease_22.ClientID %>'),$('<%= StatusDateText_22.ClientID %>'),$('<%= StatusDate_22.ClientID %>'),$('<%= Status_NeckRecurrence_22a.ClientID %>'),$('<%= Status_NeckRecurrence_22b.ClientID %>'),$('<%= Status_NeckRecurrence_22c.ClientID %>'),$('<%= Status_NeckRecurrence_22d.ClientID %>'),$('<%= Status_NeckRecurrence_22other.ClientID %>'),$('<%= Status_NeckRecurrenceRx_22a.ClientID %>'),$('<%= Status_NeckRecurrenceRx_22b.ClientID %>'),$('<%= Status_NeckRecurrenceRx_22c.ClientID %>'),$('<%= Status_NeckRecurrenceRx_22d.ClientID %>'),$('<%= Status_NeckRecurrenceRx_22e.ClientID %>'),$('<%= Status_NeckRecurrenceRx_22other.ClientID %>'),$('<%= StatusNotes_22.ClientID %>'),$('<%= StatusQuality_22.ClientID %>'));
    addEvent5($('<%= NeckRecorded.ClientID %>'),$('<%= NeckDiv.ClientID %>'),$('<%= NeckAbsentDiv.ClientID %>'),$('<%= NoNeck_Date.ClientID %>'),$('<%= Status_23.ClientID %>'),$('<%= StatusDisease_23.ClientID %>'),$('<%= StatusDateText_23.ClientID %>'),$('<%= StatusDate_23.ClientID %>'),$('<%= Status_NeckRecurrence_23a.ClientID %>'),$('<%= Status_NeckRecurrence_23b.ClientID %>'),$('<%= Status_NeckRecurrence_23c.ClientID %>'),$('<%= Status_NeckRecurrence_23d.ClientID %>'),$('<%= Status_NeckRecurrence_23other.ClientID %>'),$('<%= Status_NeckRecurrenceRx_23a.ClientID %>'),$('<%= Status_NeckRecurrenceRx_23b.ClientID %>'),$('<%= Status_NeckRecurrenceRx_23c.ClientID %>'),$('<%= Status_NeckRecurrenceRx_23d.ClientID %>'),$('<%= Status_NeckRecurrenceRx_23e.ClientID %>'),$('<%= Status_NeckRecurrenceRx_23other.ClientID %>'),$('<%= StatusNotes_23.ClientID %>'),$('<%= StatusQuality_23.ClientID %>'));
    addEvent5($('<%= NeckRecorded.ClientID %>'),$('<%= NeckDiv.ClientID %>'),$('<%= NeckAbsentDiv.ClientID %>'),$('<%= NoNeck_Date.ClientID %>'),$('<%= Status_24.ClientID %>'),$('<%= StatusDisease_24.ClientID %>'),$('<%= StatusDateText_24.ClientID %>'),$('<%= StatusDate_24.ClientID %>'),$('<%= Status_NeckRecurrence_24a.ClientID %>'),$('<%= Status_NeckRecurrence_24b.ClientID %>'),$('<%= Status_NeckRecurrence_24c.ClientID %>'),$('<%= Status_NeckRecurrence_24d.ClientID %>'),$('<%= Status_NeckRecurrence_24other.ClientID %>'),$('<%= Status_NeckRecurrenceRx_24a.ClientID %>'),$('<%= Status_NeckRecurrenceRx_24b.ClientID %>'),$('<%= Status_NeckRecurrenceRx_24c.ClientID %>'),$('<%= Status_NeckRecurrenceRx_24d.ClientID %>'),$('<%= Status_NeckRecurrenceRx_24e.ClientID %>'),$('<%= Status_NeckRecurrenceRx_24other.ClientID %>'),$('<%= StatusNotes_24.ClientID %>'),$('<%= StatusQuality_24.ClientID %>'));

    function addEvent5(neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID)
    { 
       $(statusDateTextID).addEvent('blur',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceIDa).addEvent('click',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceIDb).addEvent('click',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceIDc).addEvent('click',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceIDd).addEvent('click',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceIDother).addEvent('blur',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceRxIDa).addEvent('click',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceRxIDb).addEvent('click',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceRxIDc).addEvent('click',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceRxIDd).addEvent('click',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceRxIDe).addEvent('click',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceRxIDother).addEvent('blur',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(absentDateID).addEvent('blur',curry(NeckYesNo,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
      
        // check on load as well
        $(neckRecordedID).addEvent('click',curry(ShowDivOnClick,neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusDateTextID,statusDateID));
        ShowDivOnLoad(neckRecordedID,neckDivID,neckAbsentDivID,absentDateID,statusDateTextID,statusDateID);
   }
    
    function NeckYesNo(NeckRecordedID,NeckDivID,NeckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID)
    {
       var NeckRecordedRef = NeckRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < NeckRecordedRef.length; i++) 
        if (NeckRecordedRef[i].checked) {  
            NeckRadioClick(NeckRecordedRef[i].value,NeckDivID,NeckAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID);
            }
    }
    
    function NeckRadioClick(Neckoption_value,NeckhideDiv,NeckhideAbsentDiv,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID)
    {
      if (Neckoption_value == "Present")
      { 
       NeckhideDiv.style.display='block';
       NeckhideAbsentDiv.style.display='none';

        absentDateID.value = ''; 
        statusID.value='Neck Recurrence';
        statusDiseaseID.value='Oropharyngeal Cancer';
        statusQualityID.value = 'STD';
      } 
      else if (Neckoption_value == "None" || Neckoption_value == "Not Assessable")
      {
        NeckhideAbsentDiv.style.display='block';
        NeckhideDiv.style.display='none';
 
         // clear any data entered
        statusID.value = '';
        statusDiseaseID.value = '';
        statusDateTextID.value = '';
        statusDateID.value = '';
        
        statusRecurrenceIDa.checked = false;
        statusRecurrenceIDb.checked = false;
        statusRecurrenceIDc.checked = false;
        statusRecurrenceIDd.checked = false;
        statusRecurrenceIDother.value = '';
 
        statusRecurrenceRxIDa.checked = false;       
        statusRecurrenceRxIDb.checked = false;       
        statusRecurrenceRxIDc.checked = false;       
        statusRecurrenceRxIDd.checked = false;       
        statusRecurrenceRxIDe.checked = false;       
        statusRecurrenceRxIDother.value = '';  
        
        statusNotesID.value = '';
        
        // set first record as None or Not Assessable record       
        if (Neckoption_value == "None")
            document.getElementById('<%= Status_20.ClientID %>').value='No Neck Recurrence';
        else if (Neckoption_value == "Not Assessable")
            document.getElementById('<%= Status_20.ClientID %>').value='Neck Recurrence Not Assessable';

        document.getElementById('<%= StatusDisease_20.ClientID %>').value='Oropharyngeal Cancer';
        document.getElementById('<%= StatusDateText_20.ClientID %>').value= absentDateID.value;
        document.getElementById('<%= StatusDate_20.ClientID %>').value= absentDateID.value;
                           
        document.getElementById('<%= StatusNotes_20.ClientID %>').value='';
        document.getElementById('<%= StatusQuality_20.ClientID %>').value='STD';
      }
    } 

//********************************************************************************
//********************************************************************************
//********************************************************************************

     //Adds events to controls 
    addEvent6($('<%= DistantRecorded.ClientID %>'),$('<%= DistantDiv.ClientID %>'),$('<%= DistantAbsentDiv.ClientID %>'),$('<%= NoDistant_Date.ClientID %>'),$('<%= Status_25.ClientID %>'),$('<%= StatusDisease_25.ClientID %>'),$('<%= StatusDateText_25.ClientID %>'),$('<%= StatusDate_25.ClientID %>'),$('<%= Status_DistantFailure_25a.ClientID %>'),$('<%= Status_DistantFailure_25b.ClientID %>'),$('<%= Status_DistantFailure_25c.ClientID %>'),$('<%= Status_DistantFailure_25d.ClientID %>'),$('<%= Status_DistantFailure_25other.ClientID %>'),$('<%= Status_DistantFailureRx_25a.ClientID %>'),$('<%= Status_DistantFailureRx_25b.ClientID %>'),$('<%= Status_DistantFailureRx_25c.ClientID %>'),$('<%= Status_DistantFailureRx_25d.ClientID %>'),$('<%= Status_DistantFailureRx_25e.ClientID %>'),$('<%= Status_DistantFailureRx_25other.ClientID %>'),$('<%= StatusNotes_25.ClientID %>'),$('<%= StatusQuality_25.ClientID %>'));
    addEvent6($('<%= DistantRecorded.ClientID %>'),$('<%= DistantDiv.ClientID %>'),$('<%= DistantAbsentDiv.ClientID %>'),$('<%= NoDistant_Date.ClientID %>'),$('<%= Status_26.ClientID %>'),$('<%= StatusDisease_26.ClientID %>'),$('<%= StatusDateText_26.ClientID %>'),$('<%= StatusDate_26.ClientID %>'),$('<%= Status_DistantFailure_26a.ClientID %>'),$('<%= Status_DistantFailure_26b.ClientID %>'),$('<%= Status_DistantFailure_26c.ClientID %>'),$('<%= Status_DistantFailure_26d.ClientID %>'),$('<%= Status_DistantFailure_26other.ClientID %>'),$('<%= Status_DistantFailureRx_26a.ClientID %>'),$('<%= Status_DistantFailureRx_26b.ClientID %>'),$('<%= Status_DistantFailureRx_26c.ClientID %>'),$('<%= Status_DistantFailureRx_26d.ClientID %>'),$('<%= Status_DistantFailureRx_26e.ClientID %>'),$('<%= Status_DistantFailureRx_26other.ClientID %>'),$('<%= StatusNotes_26.ClientID %>'),$('<%= StatusQuality_26.ClientID %>'));
    addEvent6($('<%= DistantRecorded.ClientID %>'),$('<%= DistantDiv.ClientID %>'),$('<%= DistantAbsentDiv.ClientID %>'),$('<%= NoDistant_Date.ClientID %>'),$('<%= Status_27.ClientID %>'),$('<%= StatusDisease_27.ClientID %>'),$('<%= StatusDateText_27.ClientID %>'),$('<%= StatusDate_27.ClientID %>'),$('<%= Status_DistantFailure_27a.ClientID %>'),$('<%= Status_DistantFailure_27b.ClientID %>'),$('<%= Status_DistantFailure_27c.ClientID %>'),$('<%= Status_DistantFailure_27d.ClientID %>'),$('<%= Status_DistantFailure_27other.ClientID %>'),$('<%= Status_DistantFailureRx_27a.ClientID %>'),$('<%= Status_DistantFailureRx_27b.ClientID %>'),$('<%= Status_DistantFailureRx_27c.ClientID %>'),$('<%= Status_DistantFailureRx_27d.ClientID %>'),$('<%= Status_DistantFailureRx_27e.ClientID %>'),$('<%= Status_DistantFailureRx_27other.ClientID %>'),$('<%= StatusNotes_27.ClientID %>'),$('<%= StatusQuality_27.ClientID %>'));
    addEvent6($('<%= DistantRecorded.ClientID %>'),$('<%= DistantDiv.ClientID %>'),$('<%= DistantAbsentDiv.ClientID %>'),$('<%= NoDistant_Date.ClientID %>'),$('<%= Status_28.ClientID %>'),$('<%= StatusDisease_28.ClientID %>'),$('<%= StatusDateText_28.ClientID %>'),$('<%= StatusDate_28.ClientID %>'),$('<%= Status_DistantFailure_28a.ClientID %>'),$('<%= Status_DistantFailure_28b.ClientID %>'),$('<%= Status_DistantFailure_28c.ClientID %>'),$('<%= Status_DistantFailure_28d.ClientID %>'),$('<%= Status_DistantFailure_28other.ClientID %>'),$('<%= Status_DistantFailureRx_28a.ClientID %>'),$('<%= Status_DistantFailureRx_28b.ClientID %>'),$('<%= Status_DistantFailureRx_28c.ClientID %>'),$('<%= Status_DistantFailureRx_28d.ClientID %>'),$('<%= Status_DistantFailureRx_28e.ClientID %>'),$('<%= Status_DistantFailureRx_28other.ClientID %>'),$('<%= StatusNotes_28.ClientID %>'),$('<%= StatusQuality_28.ClientID %>'));
    addEvent6($('<%= DistantRecorded.ClientID %>'),$('<%= DistantDiv.ClientID %>'),$('<%= DistantAbsentDiv.ClientID %>'),$('<%= NoDistant_Date.ClientID %>'),$('<%= Status_29.ClientID %>'),$('<%= StatusDisease_29.ClientID %>'),$('<%= StatusDateText_29.ClientID %>'),$('<%= StatusDate_29.ClientID %>'),$('<%= Status_DistantFailure_29a.ClientID %>'),$('<%= Status_DistantFailure_29b.ClientID %>'),$('<%= Status_DistantFailure_29c.ClientID %>'),$('<%= Status_DistantFailure_29d.ClientID %>'),$('<%= Status_DistantFailure_29other.ClientID %>'),$('<%= Status_DistantFailureRx_29a.ClientID %>'),$('<%= Status_DistantFailureRx_29b.ClientID %>'),$('<%= Status_DistantFailureRx_29c.ClientID %>'),$('<%= Status_DistantFailureRx_29d.ClientID %>'),$('<%= Status_DistantFailureRx_29e.ClientID %>'),$('<%= Status_DistantFailureRx_29other.ClientID %>'),$('<%= StatusNotes_29.ClientID %>'),$('<%= StatusQuality_29.ClientID %>'));

    function addEvent6(distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID)
    { 
        $(statusDateTextID).addEvent('blur',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
         $(statusRecurrenceIDa).addEvent('click',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceIDb).addEvent('click',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceIDc).addEvent('click',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceIDd).addEvent('click',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
       $(statusRecurrenceIDother).addEvent('blur',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDa).addEvent('click',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDb).addEvent('click',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDc).addEvent('click',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDd).addEvent('click',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDe).addEvent('click',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(statusRecurrenceRxIDother).addEvent('blur',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
        $(absentDateID).addEvent('blur',curry(DistantYesNo,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID));
      
        // check on load as well
        $(distantRecordedID).addEvent('click',curry(ShowDivOnClick,distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusDateTextID,statusDateID));
        ShowDivOnLoad(distantRecordedID,distantDivID,distantAbsentDivID,absentDateID,statusDateTextID,statusDateID);
   }
    
    function DistantYesNo(DistantRecordedID,DistantDivID,DistantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID)
    {
       var DistantRecordedRef = DistantRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < DistantRecordedRef.length; i++) 
        if (DistantRecordedRef[i].checked) {  
            DistantRadioClick(DistantRecordedRef[i].value,DistantDivID,DistantAbsentDivID,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID);
            }
    }
    
    function DistantRadioClick(Distantoption_value,DistanthideDiv,DistanthideAbsentDiv,absentDateID,statusID,statusDiseaseID,statusDateTextID,statusDateID,statusRecurrenceIDa,statusRecurrenceIDb,statusRecurrenceIDc,statusRecurrenceIDd,statusRecurrenceIDother,statusRecurrenceRxIDa,statusRecurrenceRxIDb,statusRecurrenceRxIDc,statusRecurrenceRxIDd,statusRecurrenceRxIDe,statusRecurrenceRxIDother,statusNotesID,statusQualityID)
    {
      if (Distantoption_value == "Present")
      { 
       DistanthideDiv.style.display='block';
       DistanthideAbsentDiv.style.display='none';

        absentDateID.value = ''; 
        statusID.value='Distant Failure';
        statusDiseaseID.value='Oropharyngeal Cancer';
        statusQualityID.value = 'STD';
      } 
      else if (Distantoption_value == "None" || Distantoption_value == "Not Assessable")
      {
        DistanthideAbsentDiv.style.display='block';
        DistanthideDiv.style.display='none';
 
          // clear any data entered
        statusID.value = '';
        statusDiseaseID.value = '';
        statusDateTextID.value = '';
        statusDateID.value = '';
        
        statusRecurrenceIDa.checked = false;
        statusRecurrenceIDb.checked = false;
        statusRecurrenceIDc.checked = false;
        statusRecurrenceIDd.checked = false;
        statusRecurrenceIDother.value = '';
 
        statusRecurrenceRxIDa.checked = false;       
        statusRecurrenceRxIDb.checked = false;       
        statusRecurrenceRxIDc.checked = false;       
        statusRecurrenceRxIDd.checked = false;       
        statusRecurrenceRxIDe.checked = false;       
        statusRecurrenceRxIDother.value = '';  
        
        statusNotesID.value = '';
        
        // set first record as None or Not Assessable record              
        if (Distantoption_value == "None")
            document.getElementById('<%= Status_25.ClientID %>').value='No Distant Failure';
        else if (Distantoption_value == "Not Assessable")
            document.getElementById('<%= Status_25.ClientID %>').value='Distant Failure Not Assessable';
        
        document.getElementById('<%= StatusDisease_25.ClientID %>').value='Oropharyngeal Cancer';
        document.getElementById('<%= StatusDateText_25.ClientID %>').value= absentDateID.value;
        document.getElementById('<%= StatusDate_25.ClientID %>').value= absentDateID.value;
                   
        document.getElementById('<%= StatusNotes_25.ClientID %>').value='';
        document.getElementById('<%= StatusQuality_25.ClientID %>').value='STD';
      }
    } 

</script>