<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.Disposition_SexualFU" CodeFile="Disposition_SexualFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="Disposition_SexualFU" /><span class="controlBoxTitle">Disposition</span><br />

<table width="650" border="0" cellspacing="0" cellpadding="5" style="border: solid 1px #cccccc;"> 
  <tr>
    <td colspan="3" class="ControlBoxRowAlternatingRowsA">
	<table width="100%" border="0" cellspacing="0" cellpadding="2">
      <tr>
        <td valign="top"><euc:EformCheckbox TABLE="NoTable" FIELD="GreaterThan50PercentTimeInCounseling" Runat="server" ID="GreaterThan50PercentTimeInCounseling" Value="Yes"/>
          <strong>&ge; 50% of attending time was spent in counseling</strong>(If so, mark total attending time in minutes):
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="TotalAttendingTime" 
		    id="TotalAttendingTime"  runat="server" >
			    <asp:ListItem Value="3">15-24 min&nbsp;&nbsp;</asp:ListItem>
			    <asp:ListItem Value="4">25-39 min&nbsp;&nbsp;</asp:ListItem>
			    <asp:ListItem Value="5">40+ min</asp:ListItem>
		    </euc:EformRadioButtonList><br /><br />
	    <strong>Describe Counseling or Dictate Note:</strong><br/>
		    <euc:EformExtendedCheckBoxList TABLE="NoTable" FIELD="CounselingDescription" Runat="server" ID="CounselingDescription" RepeatDirection="horizontal" RepeatColumns="2" >
		        <asp:ListItem Text="Oral Erectogenic Therapy" Value="Oral Erectogenic Therapy" />
		        <asp:ListItem Text="Intracavernosal Injections" Value="Intracavernosal Injections" />
		        <asp:ListItem Text="Intraurethral Agents" Value="Intraurethral Agents" />
		        <asp:ListItem Text="Duplex Doppler US" Value="Duplex Doppler US" />
		        <asp:ListItem Text="Premature Ejaculation" Value="Premature Ejaculation" />
		        <asp:ListItem Text="Orgasm Associated Incontinence" Value="Orgasm Associated Incontinence" />
		        <asp:ListItem Text="Peyronie's Disease Medical Therapy" Value="Peyronie's Disease Medical Therapy" />
		        <asp:ListItem Text="Peyronie's Disease Surgery" Value="Peyronie's Disease Surgery" />
		        <asp:ListItem Text="Varicocele" Value="Varicocele" />
		        <asp:ListItem Text="Low Testosterone" Value="Low Testosterone" />
		        <asp:ListItem Text="Penile Rehabilitation" Value="Penile Rehabilitation" />
		        <asp:ListItem Text="Vacuum Device Therapy" Value="Vacuum Device Therapy" />
		        <asp:ListItem Text="Penile Implant Surgery" Value="Penile Implant Surgery" />
		        <asp:ListItem Text="DICC" Value="DICC" />
		        <asp:ListItem Text="Retarded Orgasm" Value="Retarded Orgasm" />
		        <asp:ListItem Text="Intralesional Injection Therapy" Value="Intralesional Injection Therapy" />
		        <asp:ListItem Text="Bone Density" Value="Bone Density" />
		        <asp:ListItem Text="Testosterone Supplementation" Value="Testosterone Supplementation" />
		    </euc:EformExtendedCheckBoxList></td>
      </tr>
</table></td>
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
			        <asp:ListItem Value="5">5</asp:ListItem>
	          </euc:EformRadioButtonList><br />
	  
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
</table><br/><br/><br/>