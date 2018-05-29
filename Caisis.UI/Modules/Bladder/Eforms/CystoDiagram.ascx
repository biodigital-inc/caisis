<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.CystoDiagram" CodeFile="CystoDiagram.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>




<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="CystoDiagram" id="CystoDiagram" />
<!--<a name="ClinicDate" id="ClinicDate" />--><span class="controlBoxTitle">Diagram</span><br/>
<table cellpadding="0" cellspacing="0" width="600" style="background-image: url(../../Images/FormImages/Bladder6_small.gif); border: solid 1px #666666;">
<tr>
<td height="451" valign="top" style="padding-left: 170px; font-size: 11px;" nowrap>
<strong>Comments:</strong><br/><euc:EformTextArea TextMode="MultiLine" Table="Procedures" Field="ProcNotes" RecordId="1" Id="CystoNotes" Runat="server" style="width: 427px; height: 95px; border: solid 1px #666666;"></euc:EformTextArea>
</td>
</tr>
</table>

<br/><br/><br/>