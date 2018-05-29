<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.UroSexualEnc" CodeFile="UroSexualEnc.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="UroSexualEnc" />
<span class="controlBoxTitle">Appointment</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td ><strong>Date</strong><br>
		<euc:EformTextBox id="EncDateText" Table="Encounters" RecordId="1" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server"/>
		<euc:EformHidden id="EncDate" Table="Encounters" RecordId="1" Field="EncDate" Runat="server"/>
	</td>
	<td ><strong>Attending</strong><br>
		<euc:EformComboBox LookupCode="ApptPhysician" id="EncPhysician" Table="Encounters" RecordId="1" Field="EncPhysician" runat="server"/>
	</td>
  </tr>
</table>
<br/><br/>
<span class="controlBoxTitle">Chief Complaint</span><br />
<table width="600" border="0" cellspacing="0" cellpadding="5" style="border: solid 1px #cccccc;"> 
  <tr>
    <td>
        <euc:EformExtendedCheckBoxList TABLE="Encounters" RecordId="1" FIELD="EncChiefComplaint" Runat="server" ID="EncChiefComplaint" 
            RepeatDirection="horizontal" RepeatColumns="3" ShowOther="true" >
		        <asp:ListItem Text="Erectile Dysfunction" Value="Erectile Dysfunction" />
		        <asp:ListItem Text="Penile Curvature" Value="Penile Curvature" />
		        <asp:ListItem Text="Ejaculation Problems" Value="Ejaculation Problems" />
		        <asp:ListItem Text="Orgasm Problems" Value="Orgasm Problems" />
		        <asp:ListItem Text="Hypogonadism" Value="Hypogonadism" />
	    </euc:EformExtendedCheckBoxList>
    </td>
  </tr>
</table><br /><br /><br />
