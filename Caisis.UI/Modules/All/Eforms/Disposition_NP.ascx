<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Disposition_NP" CodeFile="Disposition_NP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Disposition_NP" /><span class="controlBoxTitle">Disposition</span><br>

<table width="650" border="0" cellspacing="0" cellpadding="5" style="border: solid 1px #cccccc;">
  <tr>
    <td colspan="3" class="ControlBoxRowAlternatingRowsA"><strong>Prescriptions:</strong></td>
  </tr>
  <tr>
    <td width="5%" class="ControlBoxRowAlternatingRowsA"><strong>1</strong></td>
    <td class="ControlBoxRowAlternatingRowsA"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:350px;" TABLE="Prescriptions" FIELD="PrescriptionType" Runat="server" ID="PrescriptionType_1"  RecordId="1"/></td>
    <td width="30%" class="ControlBoxRowAlternatingRowsA">
	
	<euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="Prescriptions" FIELD="PrescriptionNewRefill" id="PrescriptionNewRefill_1"  runat="server" RecordId="1" >
			<asp:ListItem Value="New">New&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem Value="Refill">Refill&nbsp;&nbsp;</asp:ListItem>
		</euc:EformRadioButtonList>	</td>
  </tr>
  <tr>
    <td class="ControlBoxRowAlternatingRowsA"><strong>2</strong></td>
    <td class="ControlBoxRowAlternatingRowsA"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:350px;" TABLE="Prescriptions" FIELD="PrescriptionType" Runat="server" ID="PrescriptionType_2"  RecordId="2"/></td>
    <td class="ControlBoxRowAlternatingRowsA"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="Prescriptions" FIELD="PrescriptionNewRefill" id="PrescriptionNewRefill_2"  runat="server" RecordId="2" >
        <asp:ListItem Value="New">New&nbsp;&nbsp;</asp:ListItem>
        <asp:ListItem Value="Refill">Refill&nbsp;&nbsp;</asp:ListItem>
      </euc:EformRadioButtonList>    </td>
  </tr>
  <tr>
    <td class="ControlBoxRowAlternatingRowsA">&nbsp;</td>
    <td class="ControlBoxRowAlternatingRowsA">&nbsp;</td>
    <td class="ControlBoxRowAlternatingRowsA">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" class="ControlBoxRowAlternatingRowsB"><strong><br />
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
		  
		  
		  
		  <table width="280" cellpadding="5" cellspacing="0" class="ClinicalEformTable" style="margin-top: 2px;">
  
  <asp:Repeater ID="hpiProtocols" runat="server" > 
       <ItemTemplate> 
				
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('PatientProtocols', <%# DataBinder.Eval(Container.DataItem, "PatientProtocolId") %>, 'PtProtocolStatus,PtProtocolNotes,PtProtocolDataSource,PtProtocolQuality', 'Disposition_FU');">  
			<td class="ClinicalEformPopulatedColumn">
				Protocol <%# DataBinder.Eval(Container.DataItem, "ProtocolNum") %> <%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus") %>&nbsp;&nbsp;&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProtocolNotes") %> 		
			</td>
	    </tr>      

      </ItemTemplate>
</asp:Repeater>

		<tr id="NoProtocolsMsgRow" runat="server"  >  
			<td class="ClinicalEformPopulatedRowNonClickable" align="center">
				No protocols are currently listed for this patient.
			</td>
	    </tr>      
  
</table>
            
			
			
			
			
			
			
			
		  </td>
        </tr>
      </table>
    <br />    </td>
  </tr>
  <tr>
    <td colspan="3" class="ControlBoxRowAlternatingRowsA">
	<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td valign="top">&nbsp;</td>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><euc:EformCheckbox TABLE="NoTable" FIELD="GreaterThan50PercentTimeInCounseling" Runat="server" ID="GreaterThan50PercentTimeInCounseling" Value="Yes"/>
      <strong>&gt; 50% of attending time was spent in counseling.</strong><br />
	<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If so, mark total attending time in minutes<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;and describe in the box on the right.<br />
	<br />
	
	<euc:EformRadioButtonGroup Table="NoTable" Field="TotalAttendingTime" id="TotalAttendingTime"  GroupName="TotalAttendingTimeGroup" runat="server">
	<table style="border: solid 1px #999999; margin-left: 20px;">
	<tr>
	    <td style="padding-right: 14px; border-right: solid 1px #999999;">
	        <span style="font-weight: bold; margin-left: 12px;">New Visit</span><br />
	        <euc:EformRadioButton Id="NewVisit1" Value="New Visit: 10-19" runat="server"/>10-19 (1)<br />
	        <euc:EformRadioButton Id="NewVisit2" Value="New Visit: 20-29" runat="server"/>20-29 (2)<br />
	        <euc:EformRadioButton Id="NewVisit3" Value="New Visit: 30-44" runat="server"/>30-44 (3)<br />
	        <euc:EformRadioButton Id="NewVisit4" Value="New Visit: 45-59" runat="server"/>45-59 (4)<br />
	        <euc:EformRadioButton Id="NewVisit5" Value="New Visit: 60+" runat="server"/>60+ (5)
	    </td>
	    <td style="padding-right: 14px;">
	        <span style="font-weight: bold; margin-left: 12px;">Office Consultation</span><br />
	        <euc:EformRadioButton Id="OfficeConsultation1" Value="Office Consultation: 15-29" runat="server"/>15-29 (1)<br />
	        <euc:EformRadioButton Id="OfficeConsultation2" Value="Office Consultation: 30-39" runat="server"/>30-39 (2)<br />
	        <euc:EformRadioButton Id="OfficeConsultation3" Value="Office Consultation: 40-59" runat="server"/>40-59 (3)<br />
	        <euc:EformRadioButton Id="OfficeConsultation4" Value="Office Consultation: 60-79" runat="server"/>60-79 (4)<br />
	        <euc:EformRadioButton Id="OfficeConsultation5" Value="Office Consultation: 80+" runat="server"/>80+ (5)
	    </td>
	</tr>
	</table>
	</euc:EformRadioButtonGroup>
</td>
    <td valign="top">		<strong>Describe Counseling or Dictate Note:</strong><br/>
		<euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="CounselingDescription" style="width: 277px; height: 180px;" Runat="server" ID="CounselingDescription"/></td>
  </tr>
</table>	</td>
  </tr>
  <tr>
    <td colspan="3" class="ControlBoxRowAlternatingRowsB"><strong><br />
    </strong>
      <table width="100%" border="0" cellspacing="0" cellpadding="2">
        <tr>
          <td width="70%" valign="top"><strong>Select Level of Service&nbsp;&nbsp; </strong>
	  
	  
	  <euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="LevelOfService" 
		id="LevelOfService"  runat="server" >
			<asp:ListItem Value="1">1&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem Value="2">2&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem Value="3">3&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem Value="4">4&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem Value="5">5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem Value="Post Op">Post Op&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem Value="Consent Only">Consent Only&nbsp;&nbsp;</asp:ListItem>
	  </euc:EformRadioButtonList>	
	  
	  <br />
	  
	  <img src="../../Images/shim.gif" width="1" height="28" /><br />
	  <strong>Dictated&nbsp;&nbsp; </strong>
      <euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="Dictated" 
		id="Dictated"  runat="server" >
        <asp:ListItem Value="Fellow / Resident">Fellow / Resident&nbsp;&nbsp;</asp:ListItem>
        <asp:ListItem Value="Attending">Attending&nbsp;&nbsp;</asp:ListItem>
        <asp:ListItem Value="None">None</asp:ListItem>
      </euc:EformRadioButtonList> &nbsp;</td>
        </tr>
      </table>
          <br /></td>
  </tr>
</table>
<br/>
<br/>
<br/>
