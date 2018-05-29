<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.NeuroVascularBundles" CodeFile="NeuroVascularBundles.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="NeuroVascularBundles" />

  <!-- BEGIN Neurovascular Bundles -->

<span class="controlBoxTitle">&nbsp;&nbsp;Neurovascular Bundles</span><br />
   <table width="600" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable">
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="60" height="25" class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">Side</td>
      <td class="controlBoxDataGridHeader" style="padding-right:10px; font-size: 10px;">Dissection Type</td>
      <td class="controlBoxDataGridHeader" style="font-size: 10px;">Visual Status</td>
      <td class="controlBoxDataGridHeader"  style="padding-right:10px; font-size: 10px;">Graft</td>
      <td class="controlBoxDataGridHeader" style="padding-right:10px; font-size: 10px;">Donor Site</td>
      <td class="controlBoxDataGridHeader" style="padding-right:10px; font-size: 10px;">Graft Quality</td>
      <td width="2" align="right" valign="top" class="controlBox"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn" style="font-size: 11px;"><strong>Right</strong></td>
      <td>&nbsp;<euc:EFormSelect DropDownHeight="auto" DropDownWidth="90"  LookupCode="OpNVB_DissectionType" runat="server" ID="OpR_NVB_DissectionType" Table="ProstatectomyProc" FIELD="ProcR_NVB_DissectionType" style="width: 70px;"/>      </td>
      <td style="padding-left:2px;">
      <euc:EFormSelect DropDownHeight="auto" DropDownWidth="260"  LookupCode="OpNVB_Status" runat="server" ID="OpR_NVB_Status" Table="ProstatectomyProc" FIELD="ProcR_NVB_Status"/>      </td>
      <td>
      <euc:EFormSelect DropDownHeight="auto" DropDownWidth="90"  LookupCode="OpNVB_Graft" runat="server" ID="OpR_NVB_Graft" Table="ProstatectomyProc" FIELD="ProcR_NVB_Graft" style="width: 60px;"/>      </td>
      <td>
      &nbsp;<euc:EFormSelect DropDownHeight="auto" DropDownWidth="190"  LookupCode="DonorSite" runat="server" ID="OpR_NVB_Donor" Table="ProstatectomyProc" FIELD="ProcR_NVB_Donor" size="1" style="width: 70px;"/>      </td>
      <td>
		&nbsp;<euc:EFormSelect DropDownHeight="auto" DropDownWidth="40"  LookupCode="OpQuality" runat="server" ID="OpR_NVB_Quality" Table="ProstatectomyProc" FIELD="ProcR_NVB_Quality" style="width: 22px;"/>      </td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn" style="font-size: 11px;"><strong>Left</strong>      </td>
      <td>&nbsp;<euc:EFormSelect DropDownHeight="auto" DropDownWidth="90"  LookupCode="OpNVB_DissectionType" runat="server" ID="OpL_NVB_DissectionType" Table="ProstatectomyProc" FIELD="ProcL_NVB_DissectionType" style="width: 70px;"/>      </td>
      <td style="padding-left:2px;"> 
        <euc:EFormSelect DropDownHeight="auto" DropDownWidth="260"  LookupCode="OpNVB_Status" runat="server" ID="OpL_NVB_Status" Table="ProstatectomyProc" FIELD="ProcL_NVB_Status"/>      </td>
      <td> 
       <euc:EFormSelect DropDownHeight="auto" DropDownWidth="90"  LookupCode="OpNVB_Graft" runat="server" ID="OpL_NVB_Graft" Table="ProstatectomyProc" FIELD="ProcL_NVB_Graft" style="width: 60px;"/>      </td>
      <td>
      &nbsp;<euc:EFormSelect DropDownHeight="auto" DropDownWidth="190"  LookupCode="DonorSite" runat="server" ID="OpL_NVB_Donor" Table="ProstatectomyProc" FIELD="ProcL_NVB_Donor" size="1" style="width: 70px;"/>      </td>
      <td>
      &nbsp;<euc:EFormSelect DropDownHeight="auto" DropDownWidth="40"  LookupCode="OpQuality" runat="server" ID="OpL_NVB_Quality" Table="ProstatectomyProc" FIELD="ProcL_NVB_Quality" style="width: 22px;"/>      </td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td align="right" valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
</table>  
   <br/><br/><br/>
  
  <!-- END Neurovascular Bundles -->
