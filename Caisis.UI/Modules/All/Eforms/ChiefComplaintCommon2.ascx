<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ChiefComplaintCommon2" CodeFile="ChiefComplaintCommon2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
ComboMaxCharLength = 52;
</script>

<a name="ChiefComplaintCommon2" id="ChiefComplaint" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Chief Complaints"></asp:Label><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td ><strong>Date</strong><br />
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
            <asp:ListItem Value="Abdominal pain/discomfort" Text="Abdominal pain/discomfort"  />
            <asp:ListItem Value="Appetite loss" Text="Appetite loss"  />
            <asp:ListItem Value="Asymptomatic" Text="Asymptomatic"  />
            <asp:ListItem Value="Back pain" Text="Back pain"  />
            <asp:ListItem Value="Diabetes" Text="Diabetes"  />
            <asp:ListItem Value="Diarrhea" Text="Diarrhea"  />
            <asp:ListItem Value="Lymph Node" Text="Lymph Node"  />
            <asp:ListItem Value="Jaundice" Text="Jaundice"  />
            <asp:ListItem Value="Nausea" Text="Nausea"  />
            <asp:ListItem Value="Rectum" Text="Rectum"  />
            <asp:ListItem Value="Tumor found incidentally" Text="Tumor found incidentally"  />
            <asp:ListItem Value="Vomiting" Text="Vomiting"  />
            <asp:ListItem Value="Weight loss" Text="Weight loss"  />      
       
 
       </euc:EformExtendedCheckBoxList>
      </td>
  </tr>
 
</table>

<br/><br/><br/>