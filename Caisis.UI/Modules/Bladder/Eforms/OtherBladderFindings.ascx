<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.OtherBladderFindings" CodeFile="OtherBladderFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="OtherBladderFindings" id="OtherBladderFindings" />
<!--<a name="ClinicDate" id="ClinicDate" />--><span class="controlBoxTitle">Other Bladder Findings</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable" >
    
			<euc:EformCheckbox TABLE="NoTable" FIELD="Other_BladderFindings_Record1" Runat="server" ID="Other_BladderFindings_Record1" Value="Trabeculation" /> Trabeculation<br/>
			<euc:EformCheckbox TABLE="NoTable" FIELD="Other_BladderFindings_Record2" Runat="server" ID="Other_BladderFindings_Record2" Value="Diverticula" /> Diverticula<br/>
			Other (specify) <euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:160px;"  TABLE="NoTable" FIELD="Other_BladderFindings_Record3"  Runat="server" ID="Other_BladderFindings_Record3" ShowNumberPad="false"/>


    </td>
  </tr>
 
</table><br/><br/><br/>