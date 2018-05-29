<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalAppointmentWithDiseaseExtent" CodeFile="ColorectalAppointmentWithDiseaseExtent.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
ComboMaxCharLength = 52;
</script>

<a name="ColorectalAppointmentWithDiseaseExtent" id="ColorectalAppointmentWithDiseaseExtent" /><span class="controlBoxTitle">Reason for Visit</span><br/>
<table border="0" cellspacing="0" cellpadding="10" width="510" class="eformLargePopulatedTable">

 <tr >
	<td valign="top" title="date of consult"><strong>Date</strong>&nbsp;&nbsp;
		<euc:EformTextBox id="EncDateText" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="100px"/>
		<euc:EformHidden id="EncDate" Table="Encounters" Field="EncDate" Runat="server"/>
	</td>
	<td valign="top" title="attending physician who saw patient"><strong>Attending</strong></td>
	<td>
		<euc:EformComboBox LookupDistinct="Appointments;ApptPhysician;ApptPhysician" id="EncPhysician" Table="Encounters" Field="EncPhysician" 
		    runat="server" Width="125px"/>
		<euc:EformHidden id="EncType" Table="Encounters" Field="EncType" runat="server"/>
	</td>	
  </tr>
  
  <tr>
    <td style="padding-top: 30px;" id="disExtentTd"><strong>Disease Extent</strong>&nbsp;&nbsp;
        <euc:EformRadioButtonList Table="NoTable" Field="DisExtent" id="DisExtent" RepeatLayout="Table" RepeatDirection="vertical" runat="server" 
        ShowOther="true">
            <asp:ListItem Text="Primary" Value="Primary" />
            <asp:ListItem Text="Locally Recurrent / Persistent" Value="Locally Recurrent / Persistent" />
            <asp:ListItem Text="Metastatic" Value="Metastatic" />
        </euc:EformRadioButtonList>
        
<img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('disExtentTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />    </td>
    <td valign="top" ><strong>Site of Disease</strong><br /><br />
        <strong>Type</strong></td>
    <td style="vertical-align:top;">
        <euc:EformComboBox width="125" LookupCode="DxTarget" ID="DisSite" TABLE="NoTable" FIELD="DisSite" runat="server"  /><br /><br />
        <euc:EformComboBox width="125" ID="ColoPathType" TABLE="NoTable" FIELD="ColoPathType" runat="server" LookupCode="ColorectalDiseaseType" />
        <euc:EformTextBox id="EncChiefComplaint" Table="Encounters" Field="EncChiefComplaint" runat="server" style="display:none;width:1px;" />
    </td>
  </tr>  
</table><br/><br/>