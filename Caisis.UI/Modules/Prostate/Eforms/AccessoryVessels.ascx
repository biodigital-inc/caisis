<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.AccessoryVessels" CodeFile="AccessoryVessels.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<a name="AccessoryVessels" />

<!-- BEGIN Accessory Vessels -->
<span class="controlBoxTitle">&nbsp;&nbsp;Accessory Vessels</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<%--
<euc:EformRadioButtonGroup Table="NoTable" Field="AccessoryVesselsYesNo" id="AccessoryVesselsYesNo" GroupName="AccessoryVesselsYesNoGroup" runat="server">
			<euc:EformRadioButton Id="AccessoryVesselsYesNo_Yes" Value="Yes" runat="server" ExpandClickableArea="False"/>Yes&nbsp;&nbsp;
			<euc:EformRadioButton Id="AccessoryVesselsYesNo_No" Value="No" runat="server" ExpandClickableArea="False" />No
</euc:EformRadioButtonGroup>
--%>

   	<euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="AccessoryVesselsYesNo" id="AccessoryVesselsYesNo" runat="server">
				<asp:ListItem  Value="Yes">Yes</asp:ListItem>
				<asp:ListItem Value="No">No</asp:ListItem>
	</euc:EformRadioButtonList>

  <br />

  <table width="450" border="0" cellpadding="0" cellspacing="0" class="controlBoxDataGridTable" id="accessoryVesselsTable" >
  <tr><td colspan="5" height="24" valign="bottom">
<img src="../../Images/shim.gif" width="6" height="1" />Preserved?&nbsp;&nbsp;


   	<euc:EformRadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" TABLE="ProstatectomyProc" FIELD="ProcAV_Preserved" LookupCode="YesNoUnknown" id="OpAV_Preserved" runat="server">	</euc:EformRadioButtonList>


  </td></tr>
    <tr> 
      <td width="2" valign="top" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="100" height="25" class="controlBoxDataGridHeaderFirstCol">Side</td>
      <td class="controlBoxDataGridHeader">Location</td>
      <td class="controlBoxDataGridHeader">Diameter</td>
      <td width="2" align="right" valign="top" class="controlBox"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" align="right" /></td>
    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> Right</td>
      <td style="padding-left: 30px;">
			<euc:EFormSelect DropDownHeight="auto" DropDownWidth="90" LookupCode="OpAV_Site" runat="server" ID="OpR_AV_Site" TABLE="ProstatectomyProc" FIELD="ProcR_AV_Site" />        </td>
      <td align="center">
            <euc:EformComboBox Style="width:80px" LookupCode="ProstateMedianLobe" DropDownWidth="80" DropDownHeight="auto" ID="ProcR_AV_Diam" TABLE="ProstatectomyProc" FIELD="ProcR_AV_Diam" runat="server"/>

    </tr>
    <tr> 
      <td class="controlBoxDataGridFirstColumn"><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td height="35" align="center" class="controlBoxDataGridFirstColumn"> Left</td>
      <td style="padding-left: 30px;"> 
			<euc:EFormSelect DropDownHeight="auto" DropDownWidth="90" LookupCode="OpAV_Site" runat="server" ID="OpL_AV_Site" TABLE="ProstatectomyProc" FIELD="ProcL_AV_Site" />      </td>
      <td align="center"><euc:EformComboBox Style="width:80px" LookupCode="ProstateMedianLobe" DropDownWidth="80" DropDownHeight="auto" ID="ProcL_AV_Diam" TABLE="ProstatectomyProc" FIELD="ProcL_AV_Diam" runat="server"/>
      </td>
    </tr>
    <tr> 
      <td valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td align="right" valign="bottom" class="controlBoxDataGridFirstColumn"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>  
  <br/><br/><br/>
  
<script type="text/javascript">
	var AVTable = document.getElementById('<asp:Literal ID="AccessoryVesselsTableId" Runat="server" />');
//	var AccessoryVesselsRadioYes = document.getElementById('<asp:Literal ID="AccessoryVesselsYesNo_YesId" Runat="server" />');

//	if (AccessoryVesselsRadioYes.checked) AVTable.style.display = '';

</script>

  <!-- END Accessory Vessels -->
