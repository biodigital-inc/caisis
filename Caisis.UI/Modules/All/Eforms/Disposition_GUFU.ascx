<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Disposition_GUFU" CodeFile="Disposition_GUFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">

#ProtocolStatementRow td
{
    color: #8d2a2c;
    font-size: 12px;
    padding: 3px;
    text-align: left;
    font-weight: bold;
}
</style>

<%--<script type="text/javascript">
function setProtocolRiskStatement()
{
    var ProtocolConsentRow = $('ProtocolConsentRow');
    var ProtocolStatementRow = $('ProtocolStatementRow');
    var ProtocolRisksDiscussedField = $('<% = ProtocolRisksDiscussed.ClientID %>');
    var includeProtocolStatement = false;
    
    var inputs = ProtocolConsentRow.getElementsByTagName('input');
	for (var i=0;i<inputs.length;i++)
	{
	    type = inputs[i].getAttribute('type');
		if (type == 'checkbox' || type == 'radio') {
            if (inputs[i].checked && inputs[i].value.toUpperCase() == 'YES') {includeProtocolStatement = true;}
		}
		
	}
	
	if (includeProtocolStatement)
	{
	    ProtocolStatementRow.style.display = '';
	    ProtocolRisksDiscussedField.value = 'The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.';
	}
	else
    {
	    ProtocolStatementRow.style.display = 'none';
	    ProtocolRisksDiscussedField.value = '';
	}
	
}
</script>
--%>
<a name="Disposition_GUFU" /><span class="controlBoxTitle">Disposition</span><br/>

<table width="650" border="0" cellspacing="0" cellpadding="5" style="border: solid 1px #cccccc;">
  <%--<tr>
    <td  class="ControlBoxRowAlternatingRowsA">
		<table cellpadding="0" cellspacing="0" style="width: 100%;">
		<tr>
		<td style="width: 50%;"><strong style="margin-right: 10px;">Dictation for today's visit?</strong>
		
		<euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="Dictated" 
		id="Dictated"  runat="server" >
        <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
        <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
      </euc:EformRadioButtonList>		</td>
		 <td><strong style="margin-right: 10px;">See dispo for orders?</strong>
		
		<euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="SeeDispoForOrders" 
		id="SeeDispoForOrders"  runat="server" >
        <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
        <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
      </euc:EformRadioButtonList></td>
		</tr>
		
		<tr>
		<td colspan="2" style="padding-top: 12px;"><strong style="margin-right: 20px;">Return</strong>
		<euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="NoTable" FIELD="ReturnWeeks" Runat="server" ID="ReturnWeeks"   /> Weeks
		<euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;margin-left: 20px;" TABLE="NoTable" FIELD="ReturnMonths" Runat="server" ID="ReturnMonths" /> Months		</td>
		</tr> 
		</table></td>
  </tr>--%>

  <tr>
	<td class="ControlBoxRowAlternatingRowsB" align="left" style="padding-left: 25px; padding-top:10px; border-bottom: solid 1px #999999;"><strong>Comments / Notes</strong><br/><euc:EformTextArea TextMode="MultiLine" Table="Encounters" Field="EncNotes" Rows="4" style="width: 600px;" Id="AdditionalProblemPlanNotes" Runat="server"></euc:EformTextArea><br/><br/></td>
  </tr>
  <tr>
    <td class="ControlBoxRowAlternatingRowsB"><strong><br />
      </strong>
      <table width="640" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td valign="top"><strong>Protocol</strong><br />
            <table width="430" border="0" cellspacing="0" cellpadding="2" style="border: solid 1px #cccccc;">
              <tr>
                <td class="ControlBoxRowAlternatingRowsA" style="border-right: solid 1px #cccccc; width: 25%;">Protocol Number </td>
                <td  class="ControlBoxRowAlternatingRowsA" style="border-right: solid 1px #cccccc;"><euc:EformComboBox DropDownWidth="500" LookupDistinct="Protocols;ProtocolNum;': ' + ProtocolTitle" style="width:80px;" TABLE="ProtocolTemp" RecordId="1" FIELD="ProtocolNumber" Runat="server" ID="ProtocolNumber" /></td>
                <td  class="ControlBoxRowAlternatingRowsA" style="border-right: solid 1px #cccccc;"><euc:EformComboBox DropDownWidth="400" LookupDistinct="Protocols;ProtocolNum;': ' + ProtocolTitle" style="width:80px;" TABLE="ProtocolTemp" RecordId="2" FIELD="ProtocolNumber" Runat="server" ID="ProtocolNumber_2" /></td>
                <td  class="ControlBoxRowAlternatingRowsA"><euc:EformComboBox DropDownWidth="300" LookupDistinct="Protocols;ProtocolNum;': ' + ProtocolTitle" style="width:80px;" TABLE="ProtocolTemp" RecordId="3" FIELD="ProtocolNumber" Runat="server" ID="ProtocolNumber_3" /></td>
              </tr>
              <tr>
                <td title="Informed Consent Given to patient for home Review" class="ControlBoxRowAlternatingRowsB" style="border-right: solid 1px #cccccc;">Considered</td>
                <td title="Informed Consent Given to patient for home Review"  class="ControlBoxRowAlternatingRowsB" style="border-right: solid 1px #cccccc;"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProtocolTemp" RecordId="1" FIELD="ProtocolConsidered" id="ProtocolConsidered"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
                <td title="Informed Consent Given to patient for home Review"  class="ControlBoxRowAlternatingRowsB" style="border-right: solid 1px #cccccc;"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProtocolTemp" RecordId="2" FIELD="ProtocolConsidered" id="ProtocolConsidered_2"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
                <td  title="Informed Consent Given to patient for home Review" class="ControlBoxRowAlternatingRowsB"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProtocolTemp" RecordId="3" FIELD="ProtocolConsidered" id="ProtocolConsidered_3"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
              </tr>
              <tr id="ProtocolConsentRow" ><%--onclick="setProtocolRiskStatement()"--%>
                <td class="ControlBoxRowAlternatingRowsA" title="Risks, benefits and rationale of the clinical trial, as well as alternative treatment options, were discussed in great detail. All questions were answered to the patient's satisfaction. The patient elected to review and sign informed consent in my presence and a signed copy was given to the patient for his personal records. All additional tests for protocol purposes were ordered after signature was obtained." style="border-right: solid 1px #cccccc;">Consent Obtained </td>
                <td class="ControlBoxRowAlternatingRowsA" title="Risks, benefits and rationale of the clinical trial, as well as alternative treatment options, were discussed in great detail. All questions were answered to the patient's satisfaction. The patient elected to review and sign informed consent in my presence and a signed copy was given to the patient for his personal records. All additional tests for protocol purposes were ordered after signature was obtained." style="border-right: solid 1px #cccccc;"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProtocolTemp" RecordId="1" FIELD="ProtocolConsentObtained" id="ProtocolConsentObtained"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
                <td class="ControlBoxRowAlternatingRowsA" title="Risks, benefits and rationale of the clinical trial, as well as alternative treatment options, were discussed in great detail. All questions were answered to the patient's satisfaction. The patient elected to review and sign informed consent in my presence and a signed copy was given to the patient for his personal records. All additional tests for protocol purposes were ordered after signature was obtained." style="border-right: solid 1px #cccccc;"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProtocolTemp" RecordId="2" FIELD="ProtocolConsentObtained" id="ProtocolConsentObtained_2"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
                <td class="ControlBoxRowAlternatingRowsA" title="Risks, benefits and rationale of the clinical trial, as well as alternative treatment options, were discussed in great detail. All questions were answered to the patient's satisfaction. The patient elected to review and sign informed consent in my presence and a signed copy was given to the patient for his personal records. All additional tests for protocol purposes were ordered after signature was obtained."><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProtocolTemp" RecordId="3" FIELD="ProtocolConsentObtained" id="ProtocolConsentObtained_3"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
              </tr>
              <tr>
                <td  class="ControlBoxRowAlternatingRowsB" style="border-right: solid 1px #cccccc;">Registered</td>
                <td  class="ControlBoxRowAlternatingRowsB" style="border-right: solid 1px #cccccc;"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProtocolTemp" RecordId="1" FIELD="ProtocolRegistered" id="ProtocolRegistered"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
                <td  class="ControlBoxRowAlternatingRowsB" style="border-right: solid 1px #cccccc;"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProtocolTemp" RecordId="2" FIELD="ProtocolRegistered" id="ProtocolRegistered_2"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
                <td  class="ControlBoxRowAlternatingRowsB"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProtocolTemp" RecordId="3" FIELD="ProtocolRegistered" id="ProtocolRegistered_3"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
              </tr>
              <%--<tr id="ProtocolStatementRow"><td colspan="4" class="ControlBoxRowAlternatingRowsA">The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.</td></tr>--%>
            </table></td>
          <td valign="top" style="padding-left: 10px;"><span class="controlBoxFieldTitle">Current Protocols</span><br/>
		  
		  
		  
		  <table width="200" cellpadding="5" cellspacing="0" class="ClinicalEformTable" style="margin-top: 2px;">
  
  <asp:Repeater ID="hpiProtocols" runat="server" > 
       <ItemTemplate> 
				
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('PatientProtocols', <%# DataBinder.Eval(Container.DataItem, "PatientProtocolId") %>, 'PtProtocolStatus,PtProtocolNotes,PtProtocolDataSource,PtProtocolQuality', 'Disposition_FU');">  
			<td class="ClinicalEformPopulatedColumn">
				Protocol <%# DataBinder.Eval(Container.DataItem, "ProtocolNum") %> <%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus") %>&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProtocolNotes") %>			</td>
	    </tr>      
      </ItemTemplate>
</asp:Repeater>

		<tr id="NoProtocolsMsgRow" runat="server"  >  
			<td class="ClinicalEformPopulatedRowNonClickable" align="center">
				No protocols are currently listed for this patient.			</td>
	    </tr>      
</table>		  </td>
        </tr>
      </table>
    <br />    </td>
  </tr>
  <tr>
    <td class="ControlBoxRowAlternatingRowsA">
	<table width="100%" border="0" cellspacing="0" cellpadding="2">

  <tr>
    <td valign="top" ><euc:EformCheckbox TABLE="NoTable" FIELD="GreaterThan50PercentTimeInCounseling" Runat="server" ID="GreaterThan50PercentTimeInCounseling" Value="Yes"/>
      <strong>&gt; 50% of attending time was spent in counseling.</strong>&nbsp;&nbsp;(If so, mark total attending time in minutes)</td></tr><tr><td style="text-align: center;">
<euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="TotalAttendingTime" 
		id="TotalAttendingTime"  runat="server" >
			<asp:ListItem Value="15-24 (3)">15-24 (3)&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem Value="25-39 (4)">25-39 (4)&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem Value="40+ (5)">40+ (5)</asp:ListItem>
		</euc:EformRadioButtonList>		</td>
<%--    <td valign="top">		<strong>Describe Counseling or Dictate Note:</strong><br/>
		<euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="CounselingDescription" Rows="7"  style="width: 277px;" Runat="server" ID="CounselingDescription"/></td>
--%>  </tr>
</table>
<%--<euc:EformTextBox style="display: none;" TABLE="NoTable" FIELD="ProtocolRisksDiscussed" ID="ProtocolRisksDiscussed" Runat="server"  />--%>
</td>
  </tr>
</table>
<br/>
<br/>
<%--<script type="text/javascript">
setProtocolRiskStatement();
</script>--%>