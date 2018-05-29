<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.BreastReconstruction" CodeFile="BreastReconstruction.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">
    function showHideBreastReconProc(BreastReconPerformed_value,BreastReconAEDtTxtId, BreastReconAEDtId, BreastReconAETableId, BreastReconAETableIdVal, BreastReconAEFieldId, BreastReconAEFieldIdVal, BreastReconAEFieldValueId, BreastReconAEFieldValueIdVal, BreastReconAEReasonId, BreastReconAEReasonIdVal, BreastReconAEQltyId, BreastReconAEQltyIdVal)
    {
      var BreastReconProcDetailsRow = $('BreastReconDetails');
      if (BreastReconPerformed_value == "Yes")
      {
        BreastReconProcDetailsRow.style.display='block';
        
         // adding this to auto populate the proc date based on value entered for the OR Date
        if (typeof ORDateTextField != 'undefined' && typeof ORDateField != 'undefined')
		{
			var ReconstructionProcDateTextField = $('<%= ProcDateText_15.ClientID %>');
			var ReconstructionProcDateField = $('<%= ProcDate_15.ClientID %>');
			if (ORDateTextField.value.length > 0 && ReconstructionProcDateTextField.value.length < 1)
			{
				ReconstructionProcDateTextField.value = ORDateTextField.value;
				ReconstructionProcDateField.disabled = false;
				ReconstructionProcDateField.value = ORDateField.value;
			}
        }
		
        //clears absent row data
        clearElementsInParentRow(document.getElementById('BreastReconAbsentRow'));      
      } 
      else if (BreastReconPerformed_value == "No")
      {        
        BreastReconProcDetailsRow.style.display='none';  
        
        //clears BreastRecon proc and path rows data
        clearElementsInParentRow(document.getElementById('BreastReconProcRow'));
        clearElementsInParentRow(document.getElementById('BreastReconProcNotesRow'));
        
        if (typeof ORDateTextField != 'undefined' && typeof ORDateField != 'undefined')
		{
			document.getElementById(BreastReconAEDtTxtId).value = ORDateTextField.value;
			document.getElementById(BreastReconAEDtId).value = ORDateField.value;
		}
        document.getElementById(BreastReconAETableId).value = BreastReconAETableIdVal;        
        document.getElementById(BreastReconAEFieldId).value = BreastReconAEFieldIdVal;
        document.getElementById(BreastReconAEFieldValueId).value = BreastReconAEFieldValueIdVal;
        document.getElementById(BreastReconAEReasonId).value = BreastReconAEReasonIdVal;
        document.getElementById(BreastReconAEQltyId).value = BreastReconAEQltyIdVal;
      }
    }
</script>


<a name="BreastReconstruction" id="BreastReconstruction" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Breast Reconstruction"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;"><strong>Breast Reconstruction Performed ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="BreastRecon_ProcName" id="ProcName_BreastRecon" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList>

    </td>
	<td style="width:40%"></td>
  </tr>
 <tr id="BreastReconDetails" style="display: none;">
     <td style="padding: 0px;" colspan="3">
        <table border="0" cellspacing="0" cellpadding="16" width="400">
            <tr >
                <td style="padding-top: 16px; vertical-align: top; "><euc:EformHidden id="ProcQuality_15" runat="server" RecordId="15" Table="Procedures" Field="ProcQuality" Value="STD" />
            <euc:EformHidden id="ProcSite_15" runat="server" RecordId="15" Table="Procedures" Field="ProcSite" Value="Breast" />
       <table  border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable"  style="margin-bottom: 0px; margin-left: 0px; margin-top: 0px; border: solid 1px #cccccc; background-color: #ffffff;">
           <tr>
             <td class="controlBoxDataGridHeader" style="font-size:10px;" align="center">Date</td>
             <td class="controlBoxDataGridHeader" style="font-size:10px;" align="center">Procedure</td>
             <td class="controlBoxDataGridHeader" style="font-size:10px;" align="center">Side</td>
             <td class="controlBoxDataGridHeader" style="font-size:10px;" align="center">Approach</td>
             <%--<td   height="18" class="controlBoxDataGridHeader" style="font-size:10px;">Indication</td>--%>
            </tr>
           <tr  id="BreastReconProcRow">
             <td style="height: 24px;" align="center"><euc:EformTextBox id="ProcDateText_15" Table="Procedures" Field="ProcDateText" RecordId="15" runat="server"   ShowCalendar="True" CalcDate="True" style="width: 80px;"  />
               <euc:EformHidden id="ProcDate_15" Table="Procedures" Field="ProcDate"  RecordId="15" runat="server"/></td>
             <td align="center"><euc:EformComboBox  MaxLength="50" style="width: 150px;" Table="Procedures" DropDownHeight="auto" DropDownWidth="200" LookupCode="BreastReconstructionProc" RecordId="15" Field="ProcName" id="ProcName_15" EnableHiddenOnUIEvent="ProcQuality_15,ProcSite_15"  runat="server" /></td>
             <td align="center"><euc:EFormSelect style="width:56px;" LookupCode="OpSide" DropDownHeight="auto" DropDownWidth="auto" runat="server"  Field="ProcSide" RecordId="15" Table="Procedures" id="ProcSide_15"  /></td>
             <td style="padding-left: 10px;" ><euc:EformComboBox  runat="server" LookupCode="OpApproach" DropDownWidth="300"  style="width:140px;" Field="ProcApproach" RecordId="15" Table="Procedures" id="ProcApproach_15" /></td>
             <%--<td style="padding-left: 10px;" ><euc:EformComboBox  runat="server" LookupCode="Indication" DropDownWidth="300"  style="width:140;" Field="ProcIndication" RecordId="15" Table="Procedures" id="ProcIndication_15" /></td>--%>
            </tr>
         </table></td>
            </tr>
            <tr id="BreastReconProcNotesRow">
       <td style="padding-top: 16px; vertical-align: top; ">
       <strong>Notes</strong><br />
           <euc:EformTextBox id="ProcNotes_15" Table="Procedures" Field="ProcNotes" RecordId="15" runat="server" Width="500px" Height="80px" 
                ShowTextEditor="true"/>
       </td>
     </tr>
    </table>
     </td>
 </tr>
 </table>
<table>
    <tr id="BreastReconAbsentRow">
        <td>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_3"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="3" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_3"
                Runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="TableName" ID="TableName_3"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldName" ID="FieldName_3"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_3"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_3"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_3"
                runat="server"  style="width:1px;display:none;"/>
        </td>
    </tr>
</table>