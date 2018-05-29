<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenPSALabs" CodeFile="ProstateSpecimenPSALabs.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="ProstateSpecimenPSALabs" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

<table width="250" cellpadding="3" cellspacing="0" class="eformLargePopulatedTable" id="Table1">
  <tr > 
    <td align="left" style="white-space:nowrap;">
            <strong>Date: </strong>	
	        <euc:EformTextBox Runat="server" RecordId="1"  ID="LabDateText_1" TABLE="LabTests" FIELD="LabDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" EnableHiddenOnUIEvent="LabTest_1,LabUnits_1"  />
	        <euc:EformHidden RecordId="1" Runat="server" ID="LabDate_1" Table="LabTests" Field="LabDate"/>			</td>
        <td align="left" style="white-space:nowrap;">
            <euc:EformHidden Value="PSA" Field="LabTest" RecordId="1" Table="LabTests" Runat="server" id="LabTest_1"  />
            <euc:EformHidden Value="ng/mL" Field="LabUnits" RecordId="1" Table="LabTests" Runat="server" id="LabUnits_1"  />

            <strong>Value: </strong>	        
            <euc:EformTextBox RecordId="1" Width="40px" TABLE="LabTests" FIELD="LabResult" Runat="server" ID="LabResult_1" EnableHiddenOnUIEvent="LabTest_1,LabUnits_1"/>&nbsp;ng/mL
        </td>
  </tr>        
</table> 
<br/><br/><br />
