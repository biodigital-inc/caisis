<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryStatusRecurrenceDate" CodeFile="PancreasSurgeryStatusRecurrenceDate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">

</script>


<a name="PancreasSurgeryStatusRecurrenceDate" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Recurrence Date"></asp:Label><br/>

<table width="400" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="OutcomesStatus_RecurrenceDate_PancreasHtmlTable">
  <tr>
    <td width="200px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
  </tr>
<tr id="Recurrence_Date_StatusRow_24" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Recurrence Date</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Recurrence_Date_DateLabel_24" Runat="server" />
	
		  <euc:EformTextBox Width="1px" style="display: none;" id="Recurrence_Date_Status_24" runat="server" RecordId="24" Table="Status" FIELD="Status"  />
		  <euc:EformHidden id="Recurrence_Date_StatusDate_24" runat="server" RecordId="24" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="24"  FIELD="StatusDateText" Runat="server" ID="Recurrence_Date_StatusDateText_24"  />	
          <euc:EformTextBox Width="1px" style="display: none;" RecordId="24" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_24" Runat="server" />&nbsp;</td>

</tr>
</table>
<table  width="400" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Table1" >

          <tr align="left"> 
 
             <td align="left" style="white-space: nowrap;" valign="top" >

                <strong>&nbsp;Sites of initial recurrence:&nbsp; <br />

		        </strong></td>
        	
        	<td align="left" style="white-space: nowrap;" >
        	      	 <euc:EformExtendedCheckBoxList RecordId="24" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes" CellSpacing="2" CellPadding="2" RepeatDirection="Vertical" RepeatLayout="flow" ShowOther="true" >
		                <asp:ListItem Value="Local" Text="Local"  />
		                <asp:ListItem Value="Liver" Text="Liver"  />
		                <asp:ListItem Value="Lung" Text="Lung"  />
		                <asp:ListItem Value="Peritoneum" Text="Peritoneum"  />
		                <asp:ListItem Value="Brain/CNS" Text="Brain/CNS"  />
		                <asp:ListItem Value="Bone/vertebrae" Text="Bone/vertebrae"  />
		            </euc:EformExtendedCheckBoxList>
        	</td>	
          </tr>
</table>
<br/><br/><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= Recurrence_Date_Status_24.ClientID %>'),$('<%= StatusDisease_24.ClientID %>'),$('<%= Recurrence_Date_StatusDateText_24.ClientID %>'),$('<%= StatusNotes.ClientID %>'));

    function addAbsentEvent(status,disease,statusDateText,statusNotes)
    {  
        $(statusDateText).addEvent('blur',curry(SetHiddenFields,status,disease,statusDateText,statusNotes));
        
        var cbl = statusNotes.getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++)
        {
            var cblRef = cbl[j];
            if (cblRef.type == 'checkbox')
                  $(cblRef).addEvent('click',curry(SetHiddenFields,status,disease,statusDateText,statusNotes));
            else if (cblRef.type == 'text')
                  $(cblRef).addEvent('blur',curry(SetHiddenFields,status,disease,statusDateText,statusNotes));
        } 
    }
   
    /* ]]> */
   
    function SetHiddenFields(status,disease,statusDateText,statusNotes)
    { 
        var recurrenceSites = RetrieveCheckBoxListSelectedValues(statusNotes,"FLOW");
        
        if (statusDateText.value != '' || recurrenceSites != '')
        {
            status.value = 'Recurrence Date';
            disease.value = 'Pancreas Cancer';
        }
        else
        {
            status.value = '';
            disease.value = '';
        }
    }
    
</script>