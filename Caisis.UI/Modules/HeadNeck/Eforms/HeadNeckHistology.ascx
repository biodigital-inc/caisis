<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.HeadNeckHistology" CodeFile="HeadNeckHistology.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="HeadNeckHistology" id="HeadNeckHistology" /><span class="controlBoxTitle">Histology</span>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
	
	    <euc:EformComboBox  LookupCode="PathHistology" style="width:400px;" DropDownWidth="400" Field="ProcPathType" Table="HeadNeckProc" Runat="server" ID="ProcPathType" />
	
	</td>
</tr>   
</table>
<br/><br/><br/>
