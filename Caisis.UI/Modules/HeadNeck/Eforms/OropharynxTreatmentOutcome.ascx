<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxTreatmentOutcome" CodeFile="OropharynxTreatmentOutcome.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="OropharynxTreatmentOutcome" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Treatment Outcome"></asp:Label><br/>
<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Feeding Tube ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="FeedingRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="FeedingRecorded">
                <asp:ListItem>NGT</asp:ListItem>
                <asp:ListItem>PEG</asp:ListItem>
                <asp:ListItem>PEJ</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="FeedingAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_8"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="8" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_8"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
    </table>
</div>

<div id="FeedingDiv" runat="server" style="display: none;">
<%--<br /><strong>Feeding Tube</strong><br />--%>
<table width="450" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxTreatmentOutcomeHtmlTable">

    <tr>
        <td align="left" valign="top" style="white-space: nowrap"> <strong>Date of Insertion</strong><br />    
               <euc:EformTextBox Width="80px" RecordId="46" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_46" CalcDate="true" ShowCalendar="true" Runat="server"  TabIndex="2" EnableHiddenOnUIEvent="ProcName_46,ProcApproach_46"  />
               <euc:EformHidden RecordId="46" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_46" Runat="server"  TabIndex="2"  />

    		   <euc:EformHidden  RecordId="46" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_46" Value="Feeding Tube (Insertion)"     Runat="server"/>
  			   <euc:EformHidden  RecordId="46" TABLE="Procedures" FIELD="ProcApproach"     ID="ProcApproach_46"     Runat="server"/></td>

        <td align="left" valign="top" style="white-space: nowrap"> <strong>Timing of Use</strong><br />  
            <euc:EformExtendedRadioButtonList  RecordId="46" TABLE="Procedures" FIELD="ProcNotes" ID="ProcNotes_46" Runat="server"  
                TabIndex="2" RepeatDirection="Horizontal" style="white-space: nowrap;" EnableHiddenOnUIEvent="ProcName_46,ProcApproach_46"  >
                <asp:ListItem Value="Timing of Use: Pre-Tx  " Text="Pre-Tx"></asp:ListItem>
                <asp:ListItem Value="Timing of Use: During-Tx  " Text="During-Tx"></asp:ListItem> 
                <asp:ListItem Value="Timing of Use: Post-Tx  " Text="Post-Tx"></asp:ListItem>
            </euc:EformExtendedRadioButtonList></td>
              

        <td align="left" valign="top" style="white-space: nowrap"> <strong>Dependence</strong><br />  
            <euc:EformExtendedRadioButtonList  RecordId="46" TABLE="Procedures" FIELD="ProcIndication" ID="ProcIndication_46" Runat="server"  
                TabIndex="2" RepeatDirection="Horizontal" style="white-space: nowrap;" EnableHiddenOnUIEvent="ProcName_46,ProcApproach_46"  >
                <asp:ListItem Value="Dependence" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No Dependence" Text="No"></asp:ListItem>           
            </euc:EformExtendedRadioButtonList></td>
      
    </tr>
    
</table>
<br />
<table width="100" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxTreatmentOutcomeHtmlTable">

    <tr>
        
        <td align="left" valign="top" style="white-space: nowrap"> <strong>Date of Removal</strong><br />    
                <euc:EformTextBox Width="80px" RecordId="47" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_47" CalcDate="true" ShowCalendar="true" Runat="server"  TabIndex="2"  EnableHiddenOnUIEvent="ProcName_47,ProcApproach_47,ProcNotes_47,ProcIndication_47" />
               <euc:EformHidden RecordId="47" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_47" Runat="server"  TabIndex="2"  />

    		   <euc:EformHidden RecordId="47" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_47" Value="Feeding Tube (Removal)"     Runat="server"/>
  				<euc:EformHidden RecordId="47" TABLE="Procedures" FIELD="ProcApproach"     ID="ProcApproach_47"     Runat="server"/>
  				<euc:EformHidden RecordId="47" TABLE="Procedures" FIELD="ProcNotes"     ID="ProcNotes_47"     Runat="server"/>
  				<euc:EformHidden RecordId="47" TABLE="Procedures" FIELD="ProcIndication"     ID="ProcIndication_47"     Runat="server"/></td>

        
    </tr>
    
</table>
</div>
<table>
    <tr id="FeedingAbsentRow">
        <td>
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="TableName" ID="TableName_8"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="FieldName" ID="FieldName_8"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_8"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_8"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_8"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br />

<table >
    <tr>
        <td>
            <span class="controlBoxTitle">Tracheotomy ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="TracRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="TracRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="TracAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_9"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="9" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_9"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
    </table>
</div>

<div id="TracDiv" runat="server" style="display: none;">
<%--<strong>Tracheotomy</strong><br />--%>
<table width="450" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxTreatmentOutcomeHtmlTable3">

    <tr>
        <td align="left" valign="top" style="white-space: nowrap"> <strong>Date of Insertion</strong><br />    
               <euc:EformTextBox Width="80px" RecordId="48" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_48" CalcDate="true" ShowCalendar="true" Runat="server"  TabIndex="2" EnableHiddenOnUIEvent="ProcName_48" />
               <euc:EformHidden               RecordId="48" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_48" Runat="server"  TabIndex="2"  />

    		   <euc:EformHidden              RecordId="48" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_48" Value="Tracheotomy (Insertion)"     Runat="server"/></td>
             

        <td align="left" valign="top" style="white-space: nowrap"> <strong>Dependence</strong><br />  
            <euc:EformExtendedRadioButtonList  RecordId="48" TABLE="Procedures" FIELD="ProcIndication" ID="ProcIndication_48" Runat="server"  
                TabIndex="2" RepeatDirection="Horizontal" style="white-space: nowrap;" EnableHiddenOnUIEvent="ProcName_48" >
                <asp:ListItem Value="Dependence" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No Dependence" Text="No"></asp:ListItem>           
            </euc:EformExtendedRadioButtonList></td>
                    
    </tr>
    
</table>
<br />
<table width="100" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxTreatmentOutcomeHtmlTable2">
    <tr>       
        <td align="left" valign="top" style="white-space: nowrap"> <strong>Date of Decannulation</strong><br />    
               <euc:EformTextBox Width="80px" RecordId="49" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_49" CalcDate="true" ShowCalendar="true" Runat="server"  TabIndex="2"  EnableHiddenOnUIEvent="ProcName_49,ProcIndication_49" />
               <euc:EformHidden               RecordId="49" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_49" Runat="server"  TabIndex="2"  />

    		   <euc:EformHidden               RecordId="49" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_49" Value="Tracheotomy (Decannulation)"     Runat="server"/>
  			<euc:EformHidden              RecordId="49" TABLE="Procedures" FIELD="ProcIndication"     ID="ProcIndication_49"     Runat="server"/></td>

        
    </tr>
    
</table>
</div>
<table>
    <tr id="TracAbsentRow">
        <td>
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="TableName" ID="TableName_9"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="FieldName" ID="FieldName_9"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_9"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_9"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="9" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_9"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br/><br/><br/>

<script type="text/javascript">
        
    //Adds events to controls 
    addEvents1($('<%= ProcDateText_46.ClientID %>'), $('<%= ProcApproach_46.ClientID %>'), $('<%= ProcIndication_46.ClientID %>'), $('<%= ProcNotes_46.ClientID %>'), $('<%= ProcDateText_47.ClientID %>'), $('<%= ProcApproach_47.ClientID %>'), $('<%= ProcIndication_47.ClientID %>'), $('<%= ProcNotes_47.ClientID %>'));

    function addEvents1(procDateTextIn, procApproachIn, procIndicationIn, procNotesIn, procDateTextOut, procApproachOut, procIndicationOut, procNotesOut,absentDateID)
    { 
        $(procDateTextOut).addEvent('blur',curry(SetRemovalFields, procDateTextOut, procApproachIn, procIndicationIn, procNotesIn, procApproachOut, procIndicationOut, procNotesOut));
    }

    function SetRemovalFields (procDateTextOut, procApproachIn, procIndicationIn, procNotesIn, procApproachOut, procIndicationOut, procNotesOut)
    {
        
        if (procDateTextOut.value != '')
        {
            procApproachOut.value = procApproachIn.value;

            var procIndicationList = procIndicationIn.getElementsByTagName('input');
            for (var i = 0; i < procIndicationList.length; i ++) 
                if (procIndicationList[i].checked)     
                    procIndicationOut.value = procIndicationList[i].value;

            var procNotesList = procNotesIn.getElementsByTagName('input');
            for (var i = 0; i < procNotesList.length; i ++) 
                if (procNotesList[i].checked)     
                    procNotesOut.value = procNotesList[i].value;                                           
        }
        else
        {
            procApproachOut.value = '';
            procIndicationOut.value = '';                    
            procNotesOut.value = '';        
        }              
    }



//*******************************************************************************
//*******************************************************************************
//*******************************************************************************

    //Adds events to controls 
    addEvents2($('<%= ProcDateText_48.ClientID %>'), $('<%= ProcIndication_48.ClientID %>'), $('<%= ProcDateText_49.ClientID %>'), $('<%= ProcIndication_49.ClientID %>'));

    function addEvents2(procDateTextIn, procIndicationIn, procDateTextOut, procIndicationOut)
    { 
        $(procDateTextOut).addEvent('blur',curry(SetRemovalFields2, procDateTextIn, procIndicationIn, procDateTextOut, procIndicationOut));
    }

    function SetRemovalFields2 (procDateTextIn, procIndicationIn, procDateTextOut, procIndicationOut)
    {
        
        if (procDateTextOut.value != '')
        {
            var procIndicationList = procIndicationIn.getElementsByTagName('input');
            for (var i = 0; i < procIndicationList.length; i ++) 
                if (procIndicationList[i].checked)    
                    procIndicationOut.value = procIndicationList[i].value;
        }
        else
        {
            procIndicationOut.value = '';                    
        }              
    } 


//*******************************************************************************
//*******************************************************************************
//*******************************************************************************

    addAbsentEvent($('<%= FeedingRecorded.ClientID %>'),$('<%= FeedingDiv.ClientID %>'),$('<%= FeedingAbsentDiv.ClientID %>'),$('<%= TracRecorded.ClientID %>'),$('<%= TracDiv.ClientID %>'),$('<%= TracAbsentDiv.ClientID %>'));

    function addAbsentEvent(feedingRecordedID,feedingDivID,feedingAbsentDivID,tracRecordedID,tracDivID,tracAbsentDivID)
    {  
        $(feedingRecordedID).addEvent('click',curry(FeedingYesNo,feedingRecordedID,feedingDivID,feedingAbsentDivID));
        $(tracRecordedID).addEvent('click',curry(TracYesNo,tracRecordedID,tracDivID,tracAbsentDivID));
       
        // check on load as well
       FeedingYesNo(feedingRecordedID,feedingDivID,feedingAbsentDivID);
       TracYesNo(tracRecordedID,tracDivID,tracAbsentDivID);

    }
   
    /* ]]> */
    
   
    function FeedingYesNo(feedingRecordedID,feedingDivID,feedingAbsentDivID)
    {
       var feedingRecordedRef = feedingRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < feedingRecordedRef.length; i++) 
        if (feedingRecordedRef[i].checked) {  
            FeedingRadioClick(feedingRecordedRef[i].value,feedingDivID,feedingAbsentDivID);
            }
    }

    function FeedingRadioClick(Feedingoption_value,FeedinghideDiv,FeedinghideAbsentDiv)
    {
      if (Feedingoption_value == "NGT" || Feedingoption_value == "PEG" || Feedingoption_value == "PEJ")
      { 
       FeedinghideDiv.style.display='block';
       FeedinghideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_8.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_8.ClientID %>').value='';
        document.getElementById('<%= TableName_8.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_8.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_8.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_8.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_8.ClientID %>').value = '';
        
      } 
      else if (Feedingoption_value == "No")
      {
       FeedinghideDiv.style.display='none';
       FeedinghideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_8.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_8.ClientID %>').value='';
        document.getElementById('<%= TableName_8.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_8.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_8.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_8.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_8.ClientID %>').value = '';
        
        document.getElementById('<%= ProcDateText_46.ClientID %>').value='';
        document.getElementById('<%= ProcName_46.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_46.ClientID %>').value='';
        
        var procIndicationID = document.getElementById('<%= ProcIndication_46.ClientID %>');
        var procIndicationRef = procIndicationID.getElementsByTagName('input');

        for (var i = 0; i < procIndicationRef.length; i++)
            if (procIndicationRef[i].checked) { 
                procIndicationRef[i].checked = false;
                procIndicationRef[i].value = '';
            }

        var procNotesID = document.getElementById('<%= ProcNotes_46.ClientID %>');
        var procNotesRef = procNotesID.getElementsByTagName('input');

        for (var i = 0; i < procNotesRef.length; i++)
            if (procNotesRef[i].checked) { 
                procNotesRef[i].checked = false;
                procNotesRef[i].value = '';
            }


        document.getElementById('<%= ProcDateText_47.ClientID %>').value='';
        document.getElementById('<%= ProcName_47.ClientID %>').value='';
        document.getElementById('<%= ProcApproach_47.ClientID %>').value='';
        
        var procIndicationID2 = document.getElementById('<%= ProcIndication_47.ClientID %>');
        var procIndicationRef2 = procIndicationID2.getElementsByTagName('input');

        for (var i = 0; i < procIndicationRef2.length; i++)
            if (procIndicationRef2[i].checked) { 
                procIndicationRef2[i].checked = false;
                procIndicationRef2[i].value = '';
            }

        var procNotesID2 = document.getElementById('<%= ProcNotes_47.ClientID %>');
        var procNotesRef2 = procNotesID2.getElementsByTagName('input');

        for (var i = 0; i < procNotesRef2.length; i++)
            if (procNotesRef2[i].checked) { 
                procNotesRef2[i].checked = false;
                procNotesRef2[i].value = '';
            }
      }
    }


    function TracYesNo(tracRecordedID,tracDivID,tracAbsentDivID)
    {
       var tracRecordedRef = tracRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < tracRecordedRef.length; i++) 
        if (tracRecordedRef[i].checked) {  
            TracRadioClick(tracRecordedRef[i].value,tracDivID,tracAbsentDivID);
            }
    }
    
    function TracRadioClick(Tracoption_value,TrachideDiv,TrachideAbsentDiv)
    {
      if (Tracoption_value == "Yes")
      { 
       TrachideDiv.style.display='block';
       TrachideAbsentDiv.style.display='none';

        document.getElementById('<%= AbsentDateText_9.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_9.ClientID %>').value='';
        document.getElementById('<%= TableName_9.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_9.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_9.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_9.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_9.ClientID %>').value = '';
               
      } 
      else if (Tracoption_value == "No")
      {
       TrachideDiv.style.display='none';
       TrachideAbsentDiv.style.display='none';

        document.getElementById('<%= AbsentDateText_9.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_9.ClientID %>').value='';
        document.getElementById('<%= TableName_9.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_9.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_9.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_9.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_9.ClientID %>').value = '';


    addEvents2($('<%= ProcDateText_48.ClientID %>'), $('<%= ProcIndication_48.ClientID %>'), $('<%= ProcDateText_49.ClientID %>'), $('<%= ProcIndication_49.ClientID %>'));


        document.getElementById('<%= ProcDateText_48.ClientID %>').value='';
        document.getElementById('<%= ProcName_48.ClientID %>').value='';
        
        var procIndicationID = document.getElementById('<%= ProcIndication_48.ClientID %>');
        var procIndicationRef = procIndicationID.getElementsByTagName('input');

        for (var i = 0; i < procIndicationRef.length; i++)
            if (procIndicationRef[i].checked) { 
                procIndicationRef[i].checked = false;
                procIndicationRef[i].value = '';
            }

        document.getElementById('<%= ProcDateText_49.ClientID %>').value='';
        document.getElementById('<%= ProcName_49.ClientID %>').value='';
        
        var procIndicationID2 = document.getElementById('<%= ProcIndication_49.ClientID %>');
        var procIndicationRef2 = procIndicationID2.getElementsByTagName('input');

        for (var i = 0; i < procIndicationRef2.length; i++)
            if (procIndicationRef2[i].checked) { 
                procIndicationRef2[i].checked = false;
                procIndicationRef2[i].value = '';
            }

      }
    }
    
      
</script>

