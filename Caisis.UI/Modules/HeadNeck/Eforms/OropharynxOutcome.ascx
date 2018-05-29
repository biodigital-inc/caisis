<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxOutcome" CodeFile="OropharynxOutcome.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="OropharynxLastFollowUp" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Outcome"></asp:Label><br/>

<strong>Last Follow-up</strong><br />
<table width="500" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="OropharynxLastFollowUpHtmlTable">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left; white-space: nowrap;" >Patient Status </td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left; white-space: nowrap;" >Disease </td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left; white-space: nowrap;" >Data Quality </td>
  </tr>
<tr id="LastFollowup_StatusRow_30" runat="server" >
    <td style="white-space: nowrap;"  valign="top" ><asp:Label ID="LastFollowup_DateLabel_30" Runat="server" />
	
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="30"  FIELD="StatusDateText" Runat="server" ID="LastFollowup_StatusDateText_30" />	
		  <euc:EformHidden id="LastFollowup_StatusDate_30" runat="server" RecordId="30" Table="Status" Field="StatusDate"/> </td>
    
    <td align="left" style="white-space: nowrap;" valign="top">

  		            <euc:EformRadioButtonList  RecordId="30" TABLE="Status" FIELD="Status" Runat="server" ID="LastFollowup_Status_30" CellSpacing="2" CellPadding="2" RepeatDirection="Vertical" RepeatLayout="Flow" ShowOther="true" >
		                <asp:ListItem Value="No Evidence of Disease" Text="No Evidence of Disease"  />
		                <asp:ListItem Value="Alive with Disease" Text="Alive with Disease"  />
		                <asp:ListItem Value="Dead of Disease" Text="Dead of Disease"  />
		                <asp:ListItem Value="Dead of Other Causes" Text="Dead of Other Causes"  />
		                <asp:ListItem Value="Dead of Unknown Cause" Text="Dead of Unknown Cause"  />
		            </euc:EformRadioButtonList>
		            
		            <euc:EformTextBox Width="1px" style="display: none;" TABLE="NoTable"  FIELD="PatientStatus" Runat="server" ID="PatientStatus"  />	</td>

    <td align="left" style="white-space: nowrap;" valign="top">
    	             <euc:EformComboBox DropDownWidth="auto" style="width:150px;" RecordId="30" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_30" LookupCode="Disease"  Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" valign="top">
    	             <euc:EformComboBox DropDownWidth="300px" DropDownHeight="auto" style="width:100px;" RecordId="30" TABLE="Status"  FIELD="StatusQuality" ID="StatusQuality_30" LookupCode="DataQuality"  Runat="server" /></td>

</tr>
<tr>
    <td valign="top" style="white-space: nowrap;"><strong>Notes:&nbsp;</strong></td>
    <td valign="top" style="white-space: nowrap;"colspan="3">
        <euc:EformTextArea Width="490px" Rows="2" RecordId="30" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_30" ShowTextEditor="true"></euc:EformTextArea></td>
</tr>
</table>
<br />
<br />
<br />





<strong>Vital Status</strong><br />
<table width="500" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="OropharynxLastFollowUpHtmlTable2">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left; white-space: nowrap;" >Patient Status </td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left; white-space: nowrap;" >Disease </td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left; white-space: nowrap;" >Data Quality </td>
  </tr>
<tr id="LastFollowup_StatusRow_31" runat="server" >
    <td style="white-space: nowrap;"  valign="top" ><asp:Label ID="LastFollowup_DateLabel_31" Runat="server" />
	
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="31"  FIELD="StatusDateText" Runat="server" ID="LastFollowup_StatusDateText_31" />	
		  <euc:EformHidden id="LastFollowup_StatusDate_31" runat="server" RecordId="31" Table="Status" Field="StatusDate"/> </td>
    
    <td align="left" style="white-space: nowrap;" valign="top">

  		            <euc:EformRadioButtonList  RecordId="31" TABLE="Status" FIELD="Status" Runat="server" ID="LastFollowup_Status_31" CellSpacing="2" CellPadding="2" RepeatDirection="Vertical" RepeatLayout="Flow" ShowOther="true" >
		                <asp:ListItem Value="Alive" Text="Alive"  />
		                <asp:ListItem Value="Dead of Disease" Text="Dead of Disease"  />
		                <asp:ListItem Value="Dead of Other Cause" Text="Dead of Other Cause"  />
		                <asp:ListItem Value="Dead of Unknown Cause" Text="Dead of Unknown Cause"  />
		            </euc:EformRadioButtonList>
		            
		            <euc:EformTextBox Width="1px" style="display: none;" TABLE="NoTable"  FIELD="PatientStatus2" Runat="server" ID="PatientStatus2"  />	</td>

    <td align="left" style="white-space: nowrap;" valign="top">
    	             <euc:EformComboBox DropDownWidth="auto" style="width:150px;" RecordId="31" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_31" LookupCode="Disease"  Runat="server" /></td>
    <td align="left" style="white-space: nowrap;" valign="top">
    	             <euc:EformComboBox DropDownWidth="300px" DropDownHeight="auto" style="width:100px;" RecordId="31" TABLE="Status"  FIELD="StatusQuality" ID="StatusQuality_31" LookupCode="DataQuality"  Runat="server" /></td>

</tr>
<tr>
    <td valign="top" style="white-space: nowrap;"><strong>Notes:&nbsp;</strong></td>
    <td valign="top" style="white-space: nowrap;"colspan="3">
        <euc:EformTextArea Width="490px" Rows="2" RecordId="31" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_31" ShowTextEditor="true"></euc:EformTextArea></td>
</tr>
</table>
<br />




<%--<strong>Date of Death</strong>--%><br />
<%--<table width="400" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="OropharynxDeathDateHtmlTable">
  <tr>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" style="text-align:center;" >Cause of Death </td>
  </tr>
<tr id="DeathDate_StatusRow_31" runat="server" >
    <td class="ClinicalEformPopulatedColumn" valign="top"><asp:Label ID="DeathDate_DateLabel_31" Runat="server" />
    
		  <euc:EformHidden id="DeathDate_Status_31" runat="server" RecordId="31" Table="Status" FIELD="Status"  Value="Date of Death"/>	
		  <euc:EformHidden id="DeathDate_StatusDate_31" runat="server" RecordId="31" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="31"  FIELD="StatusDateText" Runat="server" ID="DeathDate_StatusDateText_31" EnableHiddenOnUIEvent="DeathDate_Status_31,StatusDisease_31" />	</td>

    <td align="left" style="white-space: nowrap;" valign="top">

  		            <euc:EformExtendedCheckBoxList RecordId="31" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_31" CellSpacing="2" CellPadding="2" RepeatDirection="Vertical" RepeatLayout="flow" ShowOther="true" EnableHiddenOnUIEvent="DeathDate_Status_31,StatusDisease_31">
		                <asp:ListItem Value="Cause of Death: Disease" Text="Disease"  />
		                <asp:ListItem Value="Cause of Death: NK" Text="NK"  />
		            </euc:EformExtendedCheckBoxList>
		            <euc:EformHidden style="width:80px;" RecordId="31" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_31" Value="Oropharyngeal Cancer" Runat="server" /></td>
	
</tr>
</table>--%>


<%--<br />--%>
<%--<strong>Lost to Regular Follow-up</strong>--%><%--<br />--%>
<%--<table width="400" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="OropharynxRegFollowUpHtmlTable">
  <tr>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" style="text-align:center;" >Lost to Regular Follow-up? </td>
  </tr>
<tr id="RegFollowUp_StatusRow_32" runat="server" >
    <td class="ClinicalEformPopulatedColumn" valign="top"><asp:Label ID="RegFollowUp_DateLabel_32" Runat="server" />
    
		  <euc:EformHidden id="RegFollowUp_Status_32" runat="server" RecordId="32" Table="Status" FIELD="Status"  Value="Lost to Regular Follow-up"/>	
		  <euc:EformHidden id="RegFollowUp_StatusDate_32" runat="server" RecordId="32" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="32"  FIELD="StatusDateText" Runat="server" ID="RegFollowUp_StatusDateText_32" EnableHiddenOnUIEvent="RegFollowUp_Status_32,StatusDisease_32" />	</td>

             <td align="left" style="white-space: nowrap;" valign="top">

  		            <euc:EformExtendedRadioButtonList RecordId="32" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_32" CellSpacing="2" CellPadding="2" RepeatDirection="Horizontal" RepeatLayout="flow" ShowOther="false" EnableHiddenOnUIEvent="RegFollowUp_Status_32,StatusDisease_32">
		                <asp:ListItem Value="Lost to Regular Follow-up: Yes" Text="Yes"  />
		                <asp:ListItem Value="Lost to Regular Follow-up: No" Text="No"  />
		            </euc:EformExtendedRadioButtonList>
		            <euc:EformHidden style="width:80px;" RecordId="32" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_32" Value="Oropharyngeal Cancer" Runat="server" /></td>
</tr>
</table>--%>
<br/><br/><br />

<script type="text/javascript">

    addEvents1($('<%= LastFollowup_Status_30.ClientID %>'), $('<%= PatientStatus.ClientID %>'), $('<%= LastFollowup_StatusDateText_30.ClientID %>'), $('<%= StatusDisease_30.ClientID %>'), $('<%= StatusNotes_30.ClientID %>'));
    addEvents1($('<%= LastFollowup_Status_31.ClientID %>'), $('<%= PatientStatus2.ClientID %>'), $('<%= LastFollowup_StatusDateText_31.ClientID %>'), $('<%= StatusDisease_31.ClientID %>'), $('<%= StatusNotes_31.ClientID %>'));

    function addEvents1(patientStatus,patientStatusHidden,date,disease,notes)
    { 

        $(date).addEvent('blur',curry(SetNotesField1,patientStatus,patientStatusHidden,date,disease,notes));
        $(notes).addEvent('blur',curry(SetNotesField1,patientStatus,patientStatusHidden,date,disease,notes));

        var rbl = patientStatus.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++)
        {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                  $(rblRef).addEvent('click',curry(SetNotesField1,patientStatus,patientStatusHidden,date,disease,notes));
            else if (rblRef.type == 'text')
                  $(rblRef).addEvent('blur',curry(SetNotesField1,patientStatus,patientStatusHidden,date,disease,notes));
        }  


        ShowOnLoad1(patientStatus,patientStatusHidden,date,disease,notes);        
    }

    function SetNotesField1 (patientStatus,patientStatusHidden,date,disease,notes)
    {
         var statusList = patientStatus.getElementsByTagName('input');
         
         var statusString = RetrieveRadioBtnListSelectedValues (patientStatus,"FLOW");
         
         if (statusString != '' || date.value != '' || notes.value != '')
         {
             patientStatusHidden.value = statusString;
             disease.value = 'Oropharyngeal Cancer';
         }
         else
         {
            patientStatusHidden.value = '';
         }
    }

   function  ShowOnLoad1(patientStatus,patientStatusHidden)
   {   

     // on postback, if 'other' was entered for status, re-click and populate stored value
     var statusList = patientStatus.getElementsByTagName('input');
     var found = 'false';
           
        if (patientStatusHidden.value != '')
        {            
            for (var i = 0; i < statusList.length; i++)
            {
                var statusListRef =  statusList[i];
                if (patientStatusHidden.value ==  statusListRef.value)
                    found = 'true';
            }
            
            if (found == 'false') 
            {                 
                for (var i = 0; i < statusList.length; i++)
                {  
                    var statusListRef =  statusList[i];    
                    if (statusListRef.type == 'text')
                    {
                        statusListRef.value =  patientStatusHidden.value; 
                        statusList[i-1].checked = true;
                     } 
                } 
            }
        }   
      
   }
</script>  		              