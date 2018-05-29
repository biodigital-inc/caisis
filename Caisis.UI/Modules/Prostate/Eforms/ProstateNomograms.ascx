<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateNomograms" CodeFile="ProstateNomograms.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<style type="text/css">
table#ProstateNomogramsTable
{
    border: solid 1px #cccccc;
    border-collapse: collapse;
}

table#ProstateNomogramsTable td
{
}

</style>



<a name="ProstateNomograms" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Nomogram Predictions"></asp:Label>

<table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProstateNomogramsTable">
  <tr >
    <td valign="top" width="20%" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>PFP PreRP 10 Yr</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      <asp:Label ID="preRP10Nomo" runat="server" >&nbsp;</asp:Label>     
    </span></td>
  </tr>
  <tr >
    <td valign="top" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>PreBrachy 10 Yr</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      
      <asp:Label ID="preBrachyNomo" runat="server">&nbsp;</asp:Label>
    </span></td>
  </tr>
  <tr >
    <td valign="top" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>PFP PostRP 10 Yr</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      
      <asp:Label ID="postRP10yrNomo" runat="server" >&nbsp;</asp:Label>
    </span></td>
  </tr>
  <tr >
    <td valign="top" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>PCSS PreRP 15 Yr</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      
      <asp:Label ID="PCSS15PreOpNomo" runat="server" >&nbsp;</asp:Label>
    </span></td>
  </tr>
  
  
  
  <tr >
    <td valign="top" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>PreXRT 10 Yr</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      
      <asp:Label ID="preXRTNomo" runat="server" >&nbsp;</asp:Label>  
    </span></td>
  </tr>
  <tr >
    <td valign="top" height="28" align="right" class="ClinicalEformGridColumnOne"><strong>PCSS PostRP 15 Yr</strong></td>
    <td valign="top" style="background-color:#FFFFFF;"><span class="FormInsideTableTopCell">
      
      <asp:Label ID="PCSS15PostOpNomo" runat="server" >&nbsp;</asp:Label>
    </span></td>
  </tr>
</table>



<table border="0" cellspacing="0"    class="eformLargePopulatedTable">
          <tr>
            <td height="24"  style="border-right: none;">OCD:
<euc:EformDropDownList LookupCode="YesNoUnknown" style="width:80px;"  Table="NoTable" Field="NomogramOCD" Runat="server" ID="NomogramOCD"/></td>
            <td  style="border-right: none; padding-left: 40px;">ECE:
<euc:EformDropDownList LookupCode="YesNoUnknown" style="width:80px;"  Table="NoTable" Field="NomogramECE" Runat="server" ID="NomogramECE"/></td>
            <td style="border-right: none; padding-left: 40px;">SVI:
<euc:EformDropDownList LookupCode="YesNoUnknown" style="width:80px;"  Table="NoTable" Field="NomogramSVI" Runat="server" ID="NomogramSVI"/></td>
            <td style="border-right: none; padding-left: 40px;">LNI:
<euc:EformDropDownList LookupCode="YesNoUnknown" style="width:80px;"  Table="NoTable" Field="NomogramLNI" Runat="server" ID="NomogramLNI"/></td>
          </tr>
</table>
<br/>
<br/>
<br/>
