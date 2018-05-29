<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.NVB_Bladder" CodeFile="NVB_Bladder.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="NVB_Bladder" />

  <!-- BEGIN Neurovascular Bundles -->

<span class="controlBoxTitle">Neurovascular Bundles</span><br />
   <table width="600" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable">
    <tr> 
      <td  width="60" rowspan="2" class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px; font-weight: bold;">Side</td>
      <td rowspan="2" class="controlBoxDataGridHeader"  style="font-size: 10px; font-weight: bold;">Visual Status</td>
      <td rowspan="2" class="controlBoxDataGridHeader"  style="font-size: 10px; font-weight: bold;">Graft</td>
      <td rowspan="2" class="controlBoxDataGridHeader"  style="font-size: 10px; font-weight: bold; ">Donor Site</td>
      <td rowspan="2" class="controlBoxDataGridHeader"  style="font-size: 10px; font-weight: bold; ">Graft<br/>Quality</td>
      <td height="25" class="controlBoxDataGridHeader"  colspan="2" style="font-size: 10px; font-weight: bold; border: solid 1px #cccccc;">Cavermap</td>
     </tr>
    <tr>
      <td height="25"  style="font-size: 10px; font-weight: bold; border: solid 1px #cccccc;" class="controlBoxDataGridHeader">Max Response</td>
      <td class="controlBoxDataGridHeader"  style="font-size: 10px; font-weight: bold; border: solid 1px #cccccc;">mA</td>
    </tr>
    
    <tr> 
      <td height="35" align="center" class="controlBoxDataGridFirstColumn" style="font-size: 11px;"><strong>Right</strong></td>
      <td style="padding-left:2px;">
      <euc:EFormSelect DropDownHeight="auto" DropDownWidth="290"  LookupCode="OpNVB_Status" runat="server" ID="ProcR_NVB_Status" Table="CystectomyProc" FIELD="ProcR_NVB_Status"/>      </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto"     LookupCode="OpNVB_Graft" DropDownWidth="90" runat="server" ID="ProcR_NVB_Graft" Table="CystectomyProc" FIELD="ProcR_NVB_Graft" style="width: 60px;"/>      </td>
      <td>
      &nbsp;<euc:EFormSelect DropDownHeight="auto" DropDownWidth="200"   LookupCode="DonorSite" runat="server" ID="OpR_NVB_Donor" Table="CystectomyProc" FIELD="ProcR_NVB_Donor" size="1" style="width: 70px;"/>      </td>
      <td>
		&nbsp;<euc:EFormSelect DropDownHeight="auto"     LookupCode="OpQuality"  DropDownWidth="40" runat="server" ID="OpR_NVB_Quality" Table="CystectomyProc" FIELD="ProcR_NVB_Quality" style="width: 22px;"/>      </td>
      <td style="padding-left: 8px;"><euc:EformTextBox style="width:60px" ID="ProcR_DopplerStatus"  TABLE="CystectomyProc" FIELD="ProcR_DopplerStatus"  class="InputText"  ShowNumberPad="true"  runat="server"/></td>
      <td style="padding-left: 8px;"><euc:EformTextBox style="width:60px" ID="ProcR_DopplerVA"  TABLE="CystectomyProc" FIELD="ProcR_DopplerVA"  class="InputText"  ShowNumberPad="true"  runat="server"/></td>
     </tr>
    <tr> 
      <td height="35" align="center" class="controlBoxDataGridFirstColumn" style="font-size: 11px;"><strong>Left</strong>      </td>
      <td style="padding-left:2px;"> 
        <euc:EFormSelect DropDownHeight="auto"   DropDownWidth="290"   LookupCode="OpNVB_Status" runat="server" ID="ProcL_NVB_Status" Table="CystectomyProc" FIELD="ProcL_NVB_Status"/>      </td>
      <td> 
       <euc:EFormSelect DropDownHeight="auto"     LookupCode="OpNVB_Graft" DropDownWidth="90" runat="server" ID="OpL_NVB_Graft" Table="CystectomyProc" FIELD="ProcL_NVB_Graft" style="width: 60px;"/>      </td>
      <td>
      &nbsp;<euc:EFormSelect DropDownHeight="auto"  DropDownWidth="200" LookupCode="DonorSite" runat="server" ID="OpL_NVB_Donor" Table="CystectomyProc" FIELD="ProcL_NVB_Donor" size="1" style="width: 70px;"/>      </td>
      <td>
      &nbsp;<euc:EFormSelect DropDownHeight="auto"     LookupCode="OpQuality" DropDownWidth="40" runat="server" ID="OpL_NVB_Quality" Table="CystectomyProc" FIELD="ProcL_NVB_Quality" style="width: 22px;"/>      </td>
      <td style="padding-left: 8px;"><euc:EformTextBox style="width:60px" ID="ProcL_DopplerStatus"  TABLE="CystectomyProc" FIELD="ProcL_DopplerStatus"  class="InputText"  ShowNumberPad="true"  runat="server"/></td>
      <td style="padding-left: 8px;"><euc:EformTextBox style="width:60px" ID="ProcL_DopplerVA"  TABLE="CystectomyProc" FIELD="ProcL_DopplerVA"  class="InputText"  ShowNumberPad="true"  runat="server"/></td>
     </tr>
    <tr> 
      <td align="right" valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>

      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
     </tr>
</table>  
   <br/><br/><br/>
  
  <!-- END Neurovascular Bundles -->
