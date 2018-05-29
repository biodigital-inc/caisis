<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Disposition_Urodynamics" CodeFile="Disposition_Urodynamics.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Disposition_Urodynamics" /><span class="controlBoxTitle">Disposition</span><br>

<table width="650" border="0" cellspacing="0" cellpadding="5" style="border: solid 1px #cccccc;">
<tr>
    <td colspan="3" class="ControlBoxRowAlternatingRowsB"><euc:EformExtendedCheckBoxList RepeatLayout="Table" RepeatDirection="Horizontal" CellPadding="6" ShowOther="true" id="Disposition" runat="server" Table="NoTable" Field="Disposition" >
			<asp:ListItem >Discharge Home</asp:ListItem>
			<asp:ListItem >Transfer to UCC</asp:ListItem>
     </euc:EformExtendedCheckBoxList>
</td>
  </tr>
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
    <td colspan="3" class="ControlBoxRowAlternatingRowsA"><strong>Chemo Orders:</strong></td>
  </tr>
  <tr>
    <td class="ControlBoxRowAlternatingRowsA">&nbsp;</td>
    <td class="ControlBoxRowAlternatingRowsA"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:350px;" TABLE="Prescriptions" FIELD="PrescriptionType" Runat="server" ID="PrescriptionType_3"  RecordId="3"/></td>
    <td class="ControlBoxRowAlternatingRowsA"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="Prescriptions" FIELD="PrescriptionNewRefill" id="PrescriptionNewRefill_3"  runat="server" RecordId="3" >
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
            <table width="350" border="0" cellspacing="0" cellpadding="2" style="border: solid 1px #cccccc;">
              <tr>
                <td width="35%" class="ControlBoxRowAlternatingRowsA">Protocol Number </td>
                <td  class="ControlBoxRowAlternatingRowsA"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="NoTable" FIELD="ProtocolNumber" Runat="server" ID="ProtocolNumber" /></td>
              </tr>
              <tr>
                <td class="ControlBoxRowAlternatingRowsA">Considered</td>
                <td  class="ControlBoxRowAlternatingRowsA"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="ProtocolConsidered" id="ProtocolConsidered"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
              </tr>
              <tr>
                <td>Consent Obtained </td>
                <td><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="ProtocolConsentObtained" id="ProtocolConsentObtained"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
              </tr>
              <tr>
                <td  class="ControlBoxRowAlternatingRowsA">Registered</td>
                <td  class="ControlBoxRowAlternatingRowsA"><euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="ProtocolRegistered" id="ProtocolRegistered"  runat="server" >
                    <asp:ListItem Value="Yes">Yes&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="No">No&nbsp;&nbsp;</asp:ListItem>
                </euc:EformRadioButtonList></td>
              </tr>
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
	
	&nbsp;&nbsp;&nbsp;&nbsp;<euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="TotalAttendingTime" 
		id="TotalAttendingTime"  runat="server" >
			<asp:ListItem Value="3">15-24 min&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem Value="4">25-39 min&nbsp;&nbsp;</asp:ListItem>
			<asp:ListItem Value="5">40+ min</asp:ListItem>
		</euc:EformRadioButtonList>		</td>
    <td valign="top">		<strong>Describe Counseling or Dictate Note:</strong><br/>
		<euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="CounselingDescription" Rows="7"  style="width: 277px;" Runat="server" ID="CounselingDescription"/></td>
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
