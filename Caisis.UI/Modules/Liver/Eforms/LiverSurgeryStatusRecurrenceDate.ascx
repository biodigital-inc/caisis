<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryStatusRecurrenceDate" CodeFile="LiverSurgeryStatusRecurrenceDate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script src="../../../ClientScripts/EFormScripts.js" type="text/javascript"></script>

<a name="LiverSurgeryStatusRecurrenceDate" /><br/>
<table>
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Recurrence Status"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="RecurrenceRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="RecurrenceRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
   </tr>
</table>

<div id="RecurrenceAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox Table="NoTable" Field="NoRecurrence_Date_StatusDateText_22" ID="NoRecurrence_Date_StatusDateText_22" runat="server" Width="100px" ShowCalendar="true" /></td>
        </tr>
    </table>
</div>


<div id="RecurrenceDiv" runat="server" style="display: none;">
<table width="400" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="OutcomesStatus_RecurrenceDate_LiverHtmlTable" >

    <tr id="Recurrence_Date_StatusRow_22" runat="server" >
        <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" ><strong>Date of Recurrence: </strong></td>

        <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;"><asp:Label ID="Recurrence_Date_DateLabel_22" Runat="server" />
    	
		      <euc:EformTextBox Width="1px" style="display: none;" id="Recurrence_Date_Status_22" runat="server" RecordId="22" Table="Status" FIELD="Status"  Value="Recurrence Date"/>
		      <euc:EformTextBox Width="1px" style="display: none;" id="Recurrence_Date_StatusDate_22" runat="server" RecordId="22" Table="Status" Field="StatusDate"/>
              <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:100px;" TABLE="Status"  RecordId="22"  FIELD="StatusDateText" Runat="server" ID="Recurrence_Date_StatusDateText_22" />	
                                                                <euc:EformTextBox Width="1px" style="display: none; width:80px;" RecordId="22" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_22" Runat="server" />&nbsp;
                                                                <euc:EformTextBox Width="1px" style="display: none;" RecordId="22" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_22" /></td>

    </tr>
</table>
<table  width="400" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Table1" >

          <tr align="left"> 

             <td align="left" style="white-space: nowrap;" valign="top" >

                <strong>Recurrence detected by:</strong></td>
		         
             <td align="left" style="white-space: nowrap;" >

  		            <euc:EformExtendedCheckBoxList TABLE="NoTable" FIELD="Recurrence_Detection" Runat="server" ID="Recurrence_Detection" CellSpacing="2" CellPadding="2" RepeatDirection="Vertical" RepeatLayout="flow" ShowOther="true" >
		                <asp:ListItem Value="CT" Text="CT"  />
		                <asp:ListItem Value="MRI" Text="MRI"  />
		                <asp:ListItem Value="PET" Text="PET"  />
		                <asp:ListItem Value="Tumor Marker" Text="Tumor Marker"  />
		            </euc:EformExtendedCheckBoxList></td>
        		
          </tr>
</table>
<table  width="400" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Table1" >

          <tr align="left"> 

             <td align="left" style="white-space: nowrap;" valign="top" >

                <strong>Location of first recurrence:</strong></td>
		         
             <td align="left" style="white-space: nowrap;" >

  		            <euc:EformExtendedCheckBoxList TABLE="NoTable" FIELD="Recurrence_Location" Runat="server" ID="Recurrence_Location" CellSpacing="2" CellPadding="2" RepeatDirection="Vertical" RepeatLayout="flow" ShowOther="true" >
		                <asp:ListItem Value="Cut-surface of liver" Text="Cut-surface of liver"  />
		                <asp:ListItem Value="Other intrahepatic" Text="Other intrahepatic"  />
		                <asp:ListItem Value="Distant metastasis" Text="Distant metastasis"  />
		            </euc:EformExtendedCheckBoxList></td>
        		
          </tr>
</table>
</div>
<br/><br/><br />

<script type="text/javascript">
       
     //Adds events to controls 
    addEvents1($('<%= StatusNotes_22.ClientID %>'), $('<%= Recurrence_Date_StatusDateText_22.ClientID %>'), $('<%= Recurrence_Detection.ClientID %>'), $('<%= Recurrence_Location.ClientID %>'),$('<%= RecurrenceRecorded.ClientID %>'),$('<%= RecurrenceDiv.ClientID %>'),$('<%= RecurrenceAbsentDiv.ClientID %>'),$('<%= NoRecurrence_Date_StatusDateText_22.ClientID %>'));

    function addEvents1(statusNotesID,dateTextID,detectionID,locationID,recurrenceRecordedID,recurrenceDivID,recurrenceAbsentDivID,absentDateID)
    { 
        $(dateTextID).addEvent('blur',curry(SetNotesField, statusNotesID,detectionID,locationID));
        $(detectionID).addEvent('click',curry(SetNotesField, statusNotesID,detectionID,locationID));      
        $(locationID).addEvent('click',curry(SetNotesField, statusNotesID,detectionID,locationID));
 
        $(recurrenceRecordedID).addEvent('click',curry(RecurrenceYesNo,recurrenceRecordedID,recurrenceDivID,recurrenceAbsentDivID));
        $(absentDateID).addEvent('blur',curry(RecurrenceYesNo,recurrenceRecordedID,recurrenceDivID,recurrenceAbsentDivID));
      
        // check on load as well
        RecurrenceYesNo(recurrenceRecordedID,recurrenceDivID,recurrenceAbsentDivID);
   }

  
    function SetNotesField (statusNotesID,detectionID,locationID)
    {
        statusNotesID.value = '';

        var detectionValues = RetrieveCheckBoxListSelectedValues (detectionID);
        
        if (detectionValues != '')
            statusNotesID.value = statusNotesID.value + "Recurrence detected by: " + detectionValues + "  ||  ";

        var locationValues = RetrieveCheckBoxListSelectedValues (locationID);
        
        if (locationValues != '')
            statusNotesID.value = statusNotesID.value + "Location of first recurrence: " + locationValues + "  ||  ";

    }
    
    function RecurrenceYesNo(RecurrenceRecordedID,RecurrenceDivID,RecurrenceAbsentDivID)
    {
       var RecurrenceRecordedRef = RecurrenceRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < RecurrenceRecordedRef.length; i++) 
        if (RecurrenceRecordedRef[i].checked) {  
            RecurrenceRadioClick(RecurrenceRecordedRef[i].value,RecurrenceDivID,RecurrenceAbsentDivID);
            }
    }
    
    function RecurrenceRadioClick(Recurrenceoption_value,RecurrencehideDiv,RecurrencehideAbsentDiv)
    {
      if (Recurrenceoption_value == "Yes")
      { 
       RecurrencehideDiv.style.display='block';
       RecurrencehideAbsentDiv.style.display='none';

       document.getElementById('<%= NoRecurrence_Date_StatusDateText_22.ClientID %>').value = '';
 
        document.getElementById('<%= Recurrence_Date_Status_22.ClientID %>').value='Recurrence';
        document.getElementById('<%= StatusDisease_22.ClientID %>').value='Liver Cancer';

      } 
      else if (Recurrenceoption_value == "No")
      {
        RecurrencehideAbsentDiv.style.display='block';
        RecurrencehideDiv.style.display='none';
        
        document.getElementById('<%= Recurrence_Date_StatusDate_22.ClientID %>').value= document.getElementById('<%= NoRecurrence_Date_StatusDateText_22.ClientID %>').value;
        document.getElementById('<%= Recurrence_Date_StatusDateText_22.ClientID %>').value= document.getElementById('<%= NoRecurrence_Date_StatusDateText_22.ClientID %>').value;
        document.getElementById('<%= Recurrence_Date_Status_22.ClientID %>').value='No Recurrence';
        document.getElementById('<%= StatusDisease_22.ClientID %>').value='Liver Cancer';
         document.getElementById('<%= StatusNotes_22.ClientID %>').value='';
       
    
        var detectionID = document.getElementById('<%= Recurrence_Detection.ClientID %>');
        var locationID = document.getElementById('<%= Recurrence_Location.ClientID %>');
   
         var detectionRef = detectionID.getElementsByTagName('input');
        var locationRef = locationID.getElementsByTagName('input');
        
        for (var i = 0; i < detectionRef.length; i++)
            if (detectionRef[i].checked){
            detectionRef[i].checked = false;
            detectionRef[i].value = '';
         }
 
        for (var i = 0; i < locationRef.length; i++)
            if (locationRef[i].checked){ 
            locationRef[i].checked = false;
            locationRef[i].value = '';
            }
      }
    } 


//************************************************************
//************************************************************
//************************************************************

     //Adds events to controls 
    addEvents2($('<%= StatusNotes_22.ClientID %>'), $('<%= Recurrence_Detection.ClientID %>'), 'Recurrence detected by: ', $('<%= Recurrence_Location.ClientID %>'), 'Location of first recurrence: ');

    function addEvents2(statusNotesID,detectionID,detectionPrefix,locationID,locationPrefix)
    { 
        PopulateOnLoad(statusNotesID,detectionID,detectionPrefix,locationID,locationPrefix)
   }

   function  PopulateOnLoad(statusNotesID,detectionID,detectionPrefix,locationID,locationPrefix)
   {   
     var tempStr,intIndexOfMatch;
     var notesDetection, notesLocation;
     
     var detectionArray = detectionID.getElementsByTagName('input'); 
     var locationArray = locationID.getElementsByTagName('input'); 

     // on postback, if the hidden notes texbox has a value, verify if it is for detection and location
     if (statusNotesID.value.indexOf(detectionPrefix) != -1 && statusNotesID.value.indexOf(locationPrefix) != -1) 
     {
     
        notesDetection = statusNotesID.value.substring(0,statusNotesID.value.indexOf(locationPrefix));
        notesLocation  = statusNotesID.value.substring(statusNotesID.value.indexOf(locationPrefix));

        // check the corresponding detections, without the prefix
        notesDetection = notesDetection.replace(detectionPrefix, "");  
        notesDetection = notesDetection.replace("||", "");  
        notesDetection = TrimString(notesDetection);

        for (var i = 0; i < detectionArray.length; i++)
        {
            if (detectionArray[i].type == 'checkbox') 
            {
                var tempArray1 = detectionArray[i].parentNode.getElementsByTagName('label');
                
                if (notesDetection.indexOf(tempArray1[i].innerHTML) != -1 && tempArray1[i].innerHTML != 'Other') 
                {
                    detectionArray[i].checked = true;
                    notesDetection = notesDetection.replace(tempArray1[i].innerHTML, "");

                }
            }
            
            else if (detectionArray[i].type == 'text') 
            {
                while (notesDetection.indexOf(",") != -1) 
                    notesDetection = notesDetection.replace(",", ""); 

                notesDetection = TrimString(notesDetection);

                if (notesDetection != '')
                {
                    detectionArray[i-1].checked = true;
                    detectionArray[i].value = notesDetection;
                }
            }

        }

        // check the corresponding locations, without the prefix
        notesLocation = notesLocation.replace(locationPrefix, "");  
        notesLocation = notesLocation.replace("||", "");  
        notesLocation = TrimString(notesLocation);

        for (var i = 0; i < locationArray.length; i++)
        {
            if (locationArray[i].type == 'checkbox') 
            {
                var tempArray2 = locationArray[i].parentNode.getElementsByTagName('label');
                
                if (notesLocation.indexOf(tempArray2[i].innerHTML) != -1 && tempArray2[i].innerHTML != 'Other') 
                {
                    locationArray[i].checked = true;
                    notesLocation = notesLocation.replace(tempArray2[i].innerHTML, "");

                }
            }
            
            else if (locationArray[i].type == 'text') 
            {
                while (notesLocation.indexOf(",") != -1) 
                    notesLocation = notesLocation.replace(",", ""); 

                notesLocation = TrimString(notesLocation);

                if (notesLocation != '')
                {
                    locationArray[i-1].checked = true;
                    locationArray[i].value = notesLocation;
                }
            }
        }     
     }
     
     // on postback, if the hidden notes texbox has a value, verify if it is for detection only
     else if (statusNotesID.value.indexOf(detectionPrefix) != -1) 
     { 
        // check the corresponding detections, without the prefix
        tempStr = statusNotesID.value.replace(detectionPrefix, "");  
        tempStr = tempStr.replace("||", "");  
        tempStr = TrimString(tempStr);

        for (var i = 0; i < detectionArray.length; i++)
        {
            if (detectionArray[i].type == 'checkbox') 
            {
                var tempArray3 = detectionArray[i].parentNode.getElementsByTagName('label');
                
                if (tempStr.indexOf(tempArray3[i].innerHTML) != -1 && tempArray3[i].innerHTML != 'Other') 
                {
                    detectionArray[i].checked = true;
                    tempStr = tempStr.replace(tempArray3[i].innerHTML, "");

                }
            }
            
            else if (detectionArray[i].type == 'text') 
            {
                while (tempStr.indexOf(",") != -1) 
                    tempStr = tempStr.replace(",", ""); 

                tempStr = TrimString(tempStr);
                
                if (tempStr != '')
                {
                    detectionArray[i-1].checked = true;
                    detectionArray[i].value = tempStr;
                }
            }

        }
     }

     // on postback, if the hidden notes texbox has a value, verify if it is for location only
    else if (statusNotesID.value.indexOf(locationPrefix) != -1) 
     {      
        // check the corresponding detections, without the prefix
        tempStr = statusNotesID.value.replace(locationPrefix, "");  
        tempStr = tempStr.replace("||", "");  
        tempStr = TrimString(tempStr);

        for (var i = 0; i < locationArray.length; i++)
        {
            if (locationArray[i].type == 'checkbox') 
            {
                var tempArray4 = locationArray[i].parentNode.getElementsByTagName('label');
                
                if (tempStr.indexOf(tempArray3[i].innerHTML) != -1 && tempArray4[i].innerHTML != 'Other') 
                {
                    locationArray[i].checked = true;
                    tempStr = tempStr.replace(tempArray4[i].innerHTML, "");

                }
            }
            
            else if (locationArray[i].type == 'text') 
            {
                while (tempStr.indexOf(",") != -1) 
                    tempStr = tempStr.replace(",", ""); 

                tempStr = TrimString(tempStr);

                if (tempStr != '')
                {
                    locationArray[i-1].checked = true;
                    locationArray[i].value = tempStr;
                }
            }
        }     
    }
}
    
</script>