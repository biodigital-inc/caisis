<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryChiefComplaintPresentation" CodeFile="LiverSurgeryChiefComplaintPresentation.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
ComboMaxCharLength = 52;
</script>

<a name="LiverSurgeryChiefComplaintPresentation" id="ChiefComplaint" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Chief Complaints / Presentation"></asp:Label><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600" class="ClinicalEformTable">
  
  <tr>
   
      <td align="center">       
       <euc:EformExtendedCheckBoxList ShowOther="true" RecordId="1" Table="Encounters" Field="EncChiefComplaint" id="EncChiefComplaint_List" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
 
            <asp:ListItem Value="Abdominal Pain" Text="Abdominal Pain"  />
            <asp:ListItem Value="Jaundice" Text="Jaundice"  />
            <asp:ListItem Value="Asymptomatic" Text="Asymptomatic"  />
            
       </euc:EformExtendedCheckBoxList>
      </td>
  </tr>
 
</table>
<br/><br/><br/>