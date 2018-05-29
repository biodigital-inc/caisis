<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.ChiefComplaintGastric" CodeFile="ChiefComplaintGastric.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
ComboMaxCharLength = 52;
</script>

<a name="ChiefComplaintGastric" id="ChiefComplaintGastric" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Chief Complaints"></asp:Label><br/>

<table border="0" cellspacing="0" cellpadding="16" style="width: 300px;" class="eformLargePopulatedTable">
  
  <tr>
   
      <td>       
       <euc:EformExtendedCheckBoxList ShowOther="true" Table="Encounters" Field="EncChiefComplaint" id="EncChiefComplaint_List" RepeatLayout="Table" RepeatDirection="Vertical"  CellPadding="0" runat="server" >
            <asp:ListItem Value="Primary Gastric Cancer" Text="Primary Gastric Cancer"  />
            <asp:ListItem Value="Second Primary Gastric Cancer" Text="Second Primary Gastric Cancer"  />
            <asp:ListItem Value="Recurrent Gastric Cancer" Text="Recurrent Gastric Cancer"  />
       </euc:EformExtendedCheckBoxList>
      </td>
  </tr>
 
</table>

<br/><br/>