<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Disposition_Survivorship" CodeFile="Disposition_Survivorship.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="Disposition_Survivorship" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Disposition"></asp:Label><br/>


<table width="650" border="0" cellspacing="0" cellpadding="0" class="eformLargePopulatedTable" style="background-position: 0 20;">
  <tr>
  <td><euc:EformCheckbox Runat="server" Value="Colonoscopy" Text="Colonoscopy"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="1" ID="DispositionAppointment_1" /></td>
  <td><euc:EformCheckbox Runat="server" Value="Dermatology Consult" Text="Dermatology Consult"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="6" ID="DispositionAppointment_6" /></td>
  <td><euc:EformCheckbox Runat="server" Value="Neuro-Urologist Consult" Text="Neuro-Urologist Consult"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="11" ID="DispositionAppointment_11" /></td>
  </tr>
  <tr>
  <td><euc:EformCheckbox Runat="server" Value="Smoking Cessation" Text="Smoking Cessation"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="2" ID="DispositionAppointment_2" /></td>
  <td><euc:EformCheckbox Runat="server" Value="Psych Consult" Text="Psych Consult"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="7" ID="DispositionAppointment_7" /></td>
  <td><euc:EformCheckbox Runat="server" Value="GU Medicine Consult" Text="GU Medicine Consult"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="12" ID="DispositionAppointment_12" /></td>
  </tr>
  <tr>
  <td><euc:EformCheckbox Runat="server" Value="Social Worker" Text="Social Worker"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="3" ID="DispositionAppointment_3" /></td>
  <td><euc:EformCheckbox Runat="server" Value="Nutrition Consult" Text="Nutrition Consult"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="8" ID="DispositionAppointment_8" /></td>
  <td><euc:EformCheckbox Runat="server" Value="Radiation Consult" Text="Radiation Consult"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="13" ID="DispositionAppointment_13" /></td>
  </tr>
  <tr>
  <td><euc:EformCheckbox Runat="server" Value="Integrative Medicine" Text="Integrative Medicine"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="4" ID="DispositionAppointment_4" /></td>
  <td><euc:EformCheckbox Runat="server" Value="Sexual Medicine Consult" Text="Sexual Medicine Consult"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="9" ID="DispositionAppointment_9" /></td>
  <td><euc:EformCheckbox Runat="server" Value="Treating Urologist" Text="Treating Urologist"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="14" ID="DispositionAppointment_14" /></td>
  </tr>
  <tr>
  <td><euc:EformCheckbox Runat="server" Value="Mammogram" Text="Mammogram"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="5" ID="DispositionAppointment_5" /></td>
  <td><euc:EformCheckbox Runat="server" Value="Pap Test" Text="Pap Test"  TABLE="Disposition" FIELD="DispositionAppointment" RecordId="10" ID="DispositionAppointment_10" /></td>
  <td style="padding-left: 20px;">Other: <euc:EformTextBox style="width:120px;" TABLE="Disposition" FIELD="DispositionAppointment" Runat="server" ID="DispositionAppointment_15"  RecordId="15"/></td>
  </tr>
</table>



<span class="controlBoxTitle" style="display: block; margin-top: 40px;">Counseling</span>
<table id="targetTable" width="650" border="0" cellspacing="0" cellpadding="0" class="eformLargePopulatedTable" style="background-position: 0 20;">
  <tr>
  <td>
<euc:EformCheckBoxList RepeatLayout="Table" RepeatDirection="Vertical" RepeatColumns="1" TABLE="NoTable" FIELD="CounselingDescription" id="CounselingDescription" runat="server" ShowOther="true">
		    <asp:ListItem  Value="Heart Healthy Diet">Heart Healthy Diet</asp:ListItem>
		    <asp:ListItem  Value="Avoid Sun - Use Sunscreen Regularly">Avoid Sun - Use Sunscreen Regularly</asp:ListItem>
		    <asp:ListItem  Value="Recommend Annual Mammogram">Recommend Annual Mammogram</asp:ListItem>
		    <asp:ListItem  Value="Recommend Gynecologic Visit with Pap Smear Every 1 to 2 Years">Recommend Gynecologic Visit with Pap Smear Every 1 to 2 Years</asp:ListItem>
		    <asp:ListItem  Value="Smoking Cessation">Smoking Cessation</asp:ListItem>
		    <asp:ListItem  Value="Discussed Cancer Treatment Summary and Care Plan">Discussed Cancer Treatment Summary and Care Plan</asp:ListItem>
		    <asp:ListItem  Value="Importance of Excercise">Importance of Exercise</asp:ListItem>
		    <asp:ListItem  Value="Recommend Colonoscopy Every 10 Years">Recommend Colonoscopy Every 10 Years</asp:ListItem>
		    <asp:ListItem  Value="Perform Regular Breast Self Exam">Perform Regular Breast Self Exam</asp:ListItem>
		    <asp:ListItem  Value="Home Safety">Home Safety</asp:ListItem>
		    <asp:ListItem  Value="Home Safety">Limit Alcohol to 1-2 Drinks Per Night</asp:ListItem>
</euc:EformCheckBoxList>
  </td>
  <td style="vertical-align: top;">
  <span style="font-weight: bold; display: block;">Notes:</span>
  <euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="CounselingNotes" style="width: 180px; height: 220px;" Runat="server" ID="CounselingNotes"/></td>
  </tr>
</table>












<table width="650" border="0" cellspacing="0" cellpadding="5" style="border: solid 1px #cccccc; margin-top: 40px;">
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
		</td>
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
