<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreatitisStatusSubsequentMetastases" CodeFile="PancreatitisStatusSubsequentMetastases.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">

function SetDiseaseStateDate(cbox, dateTextFieldId, date, dateFieldId, comboBox)
{
	if (cbox.checked == true)
	{
		document.getElementById(dateTextFieldId).value = date;
		document.getElementById(dateFieldId).value = date;
		
	}
	else
	{
		document.getElementById(dateTextFieldId).value = '';
		document.getElementById(dateFieldId).value = '';
		if (comboBox != null)
		{
		    document.getElementById(comboBox).value = '';
		}
	}
	
}
</script>


<a name="PancreatitisStatusSubsequentMetastases" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Subsequent Metastases"></asp:Label><br/>

<table width="400" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="OutcomesStatus_SubsequentMetastases_PancreasHtmlTable">
  <tr>
    <td width="200px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td width="150px" class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    <td width="100px" class="controlBoxDataGridHeaderFirstCol" >Check if New Today </td>
  </tr>
<tr id="Subsequent_metastases_StatusRow_23" runat="server" >
    <td height="32" class="ClinicalEformPopulatedColumn" >Subsequent metastases</td>
    <td class="ClinicalEformPopulatedColumn" ><asp:Label ID="Subsequent_metastases_DateLabel_23" Runat="server" />
	
		  <euc:EformTextBox Width="1px" style="display: none;" id="Subsequent_metastases_Status_23" runat="server" RecordId="23" Table="Status" FIELD="Status" />
		  <euc:EformHidden id="Subsequent_metastases_StatusDate_23" runat="server" RecordId="23" Table="Status" Field="StatusDate"/>
          <euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="Status"  RecordId="23"  FIELD="StatusDateText" Runat="server" ID="Subsequent_metastases_StatusDateText_23"  />	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformCheckBox TABLE="NoTable"  FIELD="CurrentStatus_Subsequent_metastases_23" Runat="server" ID="CurrentStatus_Subsequent_metastases_23" Value="True"  />&nbsp;
                                                            <euc:EformTextBox Width="1px" style="display: none;" RecordId="23" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_23" Runat="server" />&nbsp;</td>

</tr>
</table>
<table  width="400" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Table1" >

          <tr align="left"> 
 
  
             <td align="left" style="white-space: nowrap;" valign="top" >

                <strong>&nbsp;Sites of metastases:&nbsp; <br />

		        </strong></td>
		        
             <td align="left" style="white-space: nowrap;" >

  		            <euc:EformExtendedCheckBoxList RecordId="23" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes" CellSpacing="2" CellPadding="2" RepeatDirection="Vertical" RepeatLayout="flow" ShowOther="true" >
		                <asp:ListItem Value="Local" Text="Local"  />
		                <asp:ListItem Value="Liver" Text="Liver"  />
		                <asp:ListItem Value="Lung" Text="Lung"  />
		                <asp:ListItem Value="Peritoneum" Text="Peritoneum"  />
		                <asp:ListItem Value="Brain/CNS" Text="Brain/CNS"  />
		                <asp:ListItem Value="Bone/vertebrae" Text="Bone/vertebrae"  />
		            </euc:EformExtendedCheckBoxList></td>
        		
          </tr>
</table>
<br/><br/><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= Subsequent_metastases_Status_23.ClientID %>'),$('<%= StatusDisease_23.ClientID %>'),$('<%= CurrentStatus_Subsequent_metastases_23.ClientID %>'),$('<%= Subsequent_metastases_StatusDateText_23.ClientID %>'),$('<%= StatusNotes.ClientID %>'));

    function addAbsentEvent(status,disease,todaysDateCB,statusDateText,statusNotes)
    {  
        $(statusDateText).addEvent('blur',curry(SetHiddenFields,status,disease,todaysDateCB,statusDateText,statusNotes));
        $(todaysDateCB).addEvent('click',curry(SetHiddenFields,status,disease,todaysDateCB,statusDateText,statusNotes));
        
        var cbl = statusNotes.getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++)
        {
            var cblRef = cbl[j];
            if (cblRef.type == 'checkbox')
                  $(cblRef).addEvent('click',curry(SetHiddenFields,status,disease,todaysDateCB,statusDateText,statusNotes));
            else if (cblRef.type == 'text')
                  $(cblRef).addEvent('blur',curry(SetHiddenFields,status,disease,todaysDateCB,statusDateText,statusNotes));
        } 
    }
   
    /* ]]> */
   
    function SetHiddenFields(status,disease,todaysDateCB,statusDateText,statusNotes)
    { 
        var recurrenceSites = RetrieveCheckBoxListSelectedValues(statusNotes,"FLOW");
        
        if (todaysDateCB.checked || statusDateText.value != '' || recurrenceSites != '')
        {
            status.value = 'Subsequent metastases';
            disease.value = 'Pancreatitis';
        }
        else
        {
            status.value = '';
            disease.value = '';
        }
    }
    
</script>
