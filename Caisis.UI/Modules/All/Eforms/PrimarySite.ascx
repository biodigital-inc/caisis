<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PrimarySite" CodeFile="PrimarySite.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="PrimarySite" id="PrimarySite" />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<span class="controlBoxTitle">Primary Site</span>&nbsp;&nbsp;&nbsp;<euc:EformComboBox  LookupCode="DxTarget"  style="width:200px;" DropDownWidth="460" Field="ProcSite" Table="Procedures" Runat="server" ID="ProcSite"  />

</tr>   
</table>
<br/><br/><br/>
