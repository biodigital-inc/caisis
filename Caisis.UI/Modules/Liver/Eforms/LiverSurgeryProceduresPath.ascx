<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryProceduresPath" CodeFile="LiverSurgeryProceduresPath.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="LiverSurgeryProceduresPath" /><br/>

<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Report"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="PathReportRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="PathReportRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="PathReportAbsentDiv" runat="server" style="display: none;" >
<br /><br /> 
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="AbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_5"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="5" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_5"
                Runat="server" Width="1px" Style="display: none;" /></td>
           <td>(Optional)</td>
        </tr>
</table>

</div>
                 
<div id="PathReportDiv" runat="server" style="display: none;">
<br /><br />
<table  width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Pathology" > 


          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Path Report Date</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Path #</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;Tumor Histology</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Vascular Inv </td>
         </tr>
          <tr>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="40" ParentRecordId="40"   TABLE="Pathology" FIELD="PathDateText" ID="PathDateText" Runat="server" ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="40"  ParentRecordId="40"  TABLE="Pathology" FIELD="PathDate"     ID="PathDate"     Runat="server"/></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="40" ParentRecordId="40"   TABLE="Pathology" FIELD="PathNum" ID="PathNum" Runat="server" ShowCalendar="false" CalcDate="false"  /></td>

             <td align="left" style="white-space: nowrap;" >
  		            <euc:EformComboBox DropDownWidth="auto" style="width: 150px;" RecordId="40" ParentRecordId="40" TABLE="Pathology" FIELD="PathHistology" Runat="server" ID="PathHistology" LookupCode="PathHistology,Disease,Liver" /></td>

             <td>

                <euc:EformDropDownList  Width="100px" RecordId="1"  ParentRecordId="40" TABLE="LiverPath" FIELD="PathVascularInv" ID="PathVascularInv" Runat="server" ShowEmptyListItem="true" LookupCode="PathVascularInv,Disease,Liver"  /></td>
         </tr>
 
           <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Margin </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Closest Margin(mm)</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left; ">Size of Largest Tumor (cm)</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left; white-space: nowrap;" >&nbsp;# of Tumors </td>
         </tr>
          <tr>

            <td>
                <euc:EformDropDownList  Width="170px" RecordId="1"  ParentRecordId="40" TABLE="LiverPath" FIELD="PathMargin" ID="PathMargin" Runat="server" ShowEmptyListItem="true" LookupCode="PathMargin,Disease,Liver" /></td>
 
            <td>
                <euc:EformTextBox  Width="100px" RecordId="1"  ParentRecordId="40" TABLE="LiverPath" FIELD="PathClosestMarginDistance" ID="PathClosestMarginDistance" Runat="server"  /></td>

            <td>
                <euc:EformTextBox  Width="100px" RecordId="1"  ParentRecordId="40" TABLE="LiverPath" FIELD="PathTumorMaxDim" ID="PathTumorMaxDim" Runat="server"  /></td>

            <td>
                <euc:EformTextBox  Width="100px" RecordId="1"  ParentRecordId="40" TABLE="LiverPath" FIELD="PathNumTotalTumors" ID="PathNumTotalTumors" Runat="server" /></td>
        </tr>

         
</table>
<br />

<table  width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Table1" >

           <tr align="left"> 
 
             <td align="left" style="white-space: nowrap;" valign="top" >
                <strong>&nbsp;Path Report Notes:&nbsp;</strong></td>       		
 
             <td align="left" style="white-space: nowrap;" >
  		            <euc:EformTextArea Rows="7" Width="480px" RecordId="40"  ParentRecordId="40" TABLE="Pathology" FIELD="PathNotes" Runat="server" ID="PathNotes" ShowTextEditor="true" /></td>
        		
          </tr>      
</table>
</div>
<br/><br/><br/>
<table>
    <tr id="PathReportAbsentRow">
        <td>
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="TableName" ID="TableName_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldName" ID="FieldName_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_5"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_5"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<script type="text/javascript">
        
    //Adds events to controls 
    addEvents1($('<%= PathReportRecorded.ClientID %>'),$('<%= PathReportDiv.ClientID %>'),$('<%= PathReportAbsentDiv.ClientID %>'),$('<%= PathNotes.ClientID %>'),$('<%= PathDateText.ClientID %>'), $('<%= PathNum.ClientID %>'), $('<%= PathHistology.ClientID %>'),$('<%= PathVascularInv.ClientID %>'),$('<%= PathMargin.ClientID %>'),$('<%= PathClosestMarginDistance.ClientID %>'),$('<%= PathTumorMaxDim.ClientID %>'),$('<%= PathNumTotalTumors.ClientID %>'));

    function addEvents1(PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors)
    { 
        $(PathReportRecordedID).addEvent('click',curry(SetHiddenFields,PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors));
        $(dateTextID).addEvent('blur',curry(SetHiddenFields,PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors));
        $(pathNumID).addEvent('blur',curry(SetHiddenFields, PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors));
        $(pathHistologyID).addEvent('blur',curry(SetHiddenFields, PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors));
        $(pathVasID).addEvent('blur',curry(SetHiddenFields, PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors));
        $(pathMarginID).addEvent('blur',curry(SetHiddenFields, PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors));
        $(pathCMarginID).addEvent('blur',curry(SetHiddenFields, PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors));
        $(pathTumorMaxDim).addEvent('blur',curry(SetHiddenFields, PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors));
        $(numOfTumors).addEvent('blur',curry(SetHiddenFields, PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors));

        // show on load
        SetHiddenFields(PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors);
    }

    function SetHiddenFields (PathReportRecordedID,PathReportDivID,PathReportAbsentDivID,pathNotesID,dateTextID,pathNumID,pathHistologyID,pathVasID,pathMarginID,pathCMarginID,pathTumorMaxDim,numOfTumors)
    {

	    var PathReportoption_value = RetrieveRadioBtnListSelectedValues (PathReportRecordedID,"TABLE");

          if (PathReportoption_value == "Yes")
          { 
            PathReportDivID.style.display='block';
            PathReportAbsentDivID.style.display='none';
           
            document.getElementById('<%= AbsentDateText_5.ClientID %>').value='';
            document.getElementById('<%= AbsentDate_5.ClientID %>').value='';
            document.getElementById('<%= TableName_5.ClientID %>').value = '';        
            document.getElementById('<%= FieldName_5.ClientID %>').value = '';        
            document.getElementById('<%= FieldValue_5.ClientID %>').value = '';        
            document.getElementById('<%= AbsentReason_5.ClientID %>').value = '';        
            document.getElementById('<%= AbsentQuality_5.ClientID %>').value = '';

        }
        else if (PathReportoption_value == "No" || PathReportoption_value == "Unknown" || PathReportoption_value == "N/A")
          {
            PathReportAbsentDivID.style.display='block';
            PathReportDivID.style.display='none';
          
            document.getElementById('<%= TableName_5.ClientID %>').value = 'Pathology';        
            document.getElementById('<%= FieldName_5.ClientID %>').value = 'PathHistology';        
            document.getElementById('<%= FieldValue_5.ClientID %>').value = 'Pathology Report'; 
            
            if (PathReportoption_value == "No")       
                document.getElementById('<%= AbsentReason_5.ClientID %>').value = 'None Recorded';        
            else if (PathReportoption_value == "Unknown")       
                document.getElementById('<%= AbsentReason_5.ClientID %>').value = 'Unknown';
            else if (PathReportoption_value == "N/A")
                document.getElementById('<%= AbsentReason_5.ClientID %>').value = 'Not Applicable';

            document.getElementById('<%= AbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_5.ClientID %>').value + ' as of ';

            document.getElementById('<%= AbsentQuality_5.ClientID %>').value = 'OUT';        


            pathNotesID.value = '';
            dateTextID.value = '';
            document.getElementById('<%= PathDate.ClientID %>').value = '';
            pathNumID.value = '';
            pathHistologyID.value = '';
            pathVasID.value = '';
            pathMarginID.value = '';   
            pathCMarginID.value = '';
            pathTumorMaxDim.value = '';   
            numOfTumors.value = '';
        }
  }
</script>
