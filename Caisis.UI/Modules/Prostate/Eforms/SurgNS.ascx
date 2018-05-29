<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.SurgNS" CodeFile="SurgNS.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<br/>
<a name="SurgNS" />
<strong>Cavermap Notes:</strong><br/>
<euc:EformTextArea TextMode="MultiLine" TABLE="Surgeries" FIELD="SurgNS_Notes" Rows="4" Cols="70" Runat="server" ID="SurgNS_Notes"/> 

<euc:EFormSelect runat=server ID="SurgNS_ProbeType" TABLE="Surgeries" FIELD="SurgNS_ProbeType">
	<option value="Apical">Apical</option>
	<option value="Lateral">Lateral</option>
</euc:EFormSelect>