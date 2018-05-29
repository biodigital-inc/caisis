<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.UrinaryDiversionDrains" CodeFile="UrinaryDiversionDrains.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="UrinaryDiversionDrains" id="UrinaryDiversionDrains" />
<span class="controlBoxTitle">Drains</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px; vertical-align: top; width: 130px;">
		
		<strong>Drain Type</strong>
		
	
	</td>
	
	<td style="padding-top: 20px; vertical-align: top; width: 470px;">

        <euc:EformCheckBox Table="UrinaryDiversionProc" Field="ProcJP_Drain" id="ProcJP_Drain" runat="server" Value="True" Text="Pelvic (JP)" /><br />
        <euc:EformCheckBox Table="UrinaryDiversionProc" Field="ProcPenroseDrain" id="ProcPenroseDrain" runat="server" Value="True" Text="Penrose" /><br />

        <euc:EformCheckBox Table="UrinaryDiversionProc" Field="ProcSuprapubicDrain" id="ProcSuprapubicDrain" runat="server" Value="True" Text="Suprapubic Tube" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Size:
        <euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcSuprapubicDrain" id="ProcSuprapubicDrainLength" runat="server" ShowNumberPad="true" /><br />
        
        
        
        <euc:EformCheckBox Table="UrinaryDiversionProc" Field="ProcStomalDrain" id="ProcStomalDrain" runat="server" Value="True" Text="Stomal Tube" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Size:
        <euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcStomalDrain" id="ProcStomalDrainLength" runat="server" ShowNumberPad="true" /><br />
        
        
        
        <euc:EformCheckBox Table="UrinaryDiversionProc" Field="ProcUrethraDrain" id="ProcUrethraDrain" runat="server" Value="True" Text="Urethral Tube" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Size:
        <euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="UrinaryDiversionProc" Field="ProcUrethraDrain" id="ProcUrethraDrainLength" runat="server" ShowNumberPad="true" /><br />
        
        
        
	</td>
</tr>





</table>
<br/><br/><br/>
