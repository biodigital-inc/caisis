<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgeryChiefComplaint" CodeFile="EsophagusSurgeryChiefComplaint.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
ComboMaxCharLength = 52;
</script>

<a name="EsophagusSurgeryChiefComplaint" id="ChiefComplaint" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Chief Complaints"></asp:Label><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td ><strong>Encounter Date</strong><br />
		<euc:EformTextBox id="EncDateText" RecordId="1" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server"/>
		<euc:EformHidden id="EncDate" RecordId="1" Table="Encounters" Field="EncDate" Runat="server"/>
	</td>
	<td ><strong>Attending</strong><br/>
		<euc:EformComboBox LookupCode="Physician,Disease,@DiseaseView" RecordId="1" id="EncPhysician" Table="Encounters" Field="EncPhysician" runat="server"/>
		<euc:EformHidden id="EncType" RecordId="1" Table="Encounters" Field="EncType" runat="server"/>
	</td>
  </tr>
</table>
<br/>

<table border="0" cellspacing="0" cellpadding="16" width="600" class="ClinicalEformTable">
  
  <tr>
   
      <td align="center">       
       <euc:EformExtendedCheckBoxList ShowOther="true" RecordId="1" Table="Encounters" Field="EncChiefComplaint" id="EncChiefComplaint_List" RepeatLayout="Table" RepeatDirection="Horizontal" RepeatColumns="3"  CellPadding="0" runat="server" >
            <asp:ListItem Value="None Recorded" Text="None Recorded"  />
            <asp:ListItem Value="Appetite loss" Text="Appetite loss"  />   
            <asp:ListItem Value="Asymptomatic" Text="Asymptomatic"  />
            <asp:ListItem Value="Dysphagia to liquids" Text="Dysphagia to liquids"  />
            <asp:ListItem Value="Dysphagia to solids" Text="Dysphagia to solids"  />
            <asp:ListItem Value="Hemoptosis" Text="Hemoptosis"  />
            <asp:ListItem Value="Pain on swallowing" Text="Pain on swallowing"  />
            <asp:ListItem Value="Hoarseness" Text="Hoarseness"  />
            <asp:ListItem Value="Weight loss" Text="Weight loss"  />
            <asp:ListItem Value="Nausea/vomiting" Text="Nausea/vomiting"  />
            <asp:ListItem Value="Melena" Text="Melena"  />
            <asp:ListItem Value="Tumor found on screening" Text="Tumor found on screening"  />
            <asp:ListItem Value="Anemic on screening" Text="Anemic on screening"  />
            <asp:ListItem Value="Reflux/Regurgitation" Text="Reflux/Regurgitation"  />             
       </euc:EformExtendedCheckBoxList>
      </td>
  </tr>
 
</table>

<br/><br/><br/>