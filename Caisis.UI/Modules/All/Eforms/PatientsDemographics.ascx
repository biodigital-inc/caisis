<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PatientsDemographics" CodeFile="PatientsDemographics.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script language="javascript" type="text/javascript">
	tableArray.DemographicsHtmlTable = "DemographicsHtmlTable";
</script>

<a name="PatientsDemographics" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Demographics"></asp:Label><br/>

<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DemographicsHtmlTable" >

  <asp:Repeater ID="PtDemoGx" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
    <tr> 
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;MRN&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Title&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;First&nbsp;</td>
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Last&nbsp;</td>
		<td style="white-space: nowrap; width: 80px;" align="left"  class="controlBoxDataGridTitleColumn">&nbsp;Suffix&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Gender&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Birth Date&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;&nbsp;</td>
	</tr>
		<tr class="ClinicalEformPopulatedRow" > 
			<td id="rptr_PtMRN" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtMRN', 'Patients');">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtMRN")%>&nbsp;</td>  
			<td id="rptr_PtTitle" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtTitle', 'Patients');">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtTitle")%>&nbsp;</td>  
			<td id="rptr_PtFirstName" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtFirstName', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtFirstName")%>&nbsp;</td>
			<td id="rptr_PtLastName" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtLastName', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtLastName")%>&nbsp;</td>
			<td id="rptr_PtSuffix" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtSuffix', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtSuffix")%>&nbsp;</td>
			<td id="rptr_PtGender" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtGender', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtGender")%>&nbsp;</td>
			<td id="rptr_PtBirthDateText" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtBirthDateText', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtBirthDateText")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
    <asp:Repeater ID="PtDemoGx2" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
    <tr> 
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" colspan="2">&nbsp;Address (line 1)&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" colspan="1">&nbsp;Address (line 2)&nbsp;</td>
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;City&nbsp;</td>
		<td style="white-space: nowrap; width: 80px;" align="left"  class="controlBoxDataGridTitleColumn">&nbsp;State&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Postal Code&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Country&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;&nbsp;</td>
	</tr>
		<tr class="ClinicalEformPopulatedRow" > 
			<td id="rptr_PtAddress1" align="left" class="ClinicalEformPopulatedColumn" colspan="2" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtAddress1', 'Patients');">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtAddress1")%>&nbsp;</td> 
			<td id="rptr_PtAddress2" align="left" class="ClinicalEformPopulatedColumn" colspan="1" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtAddress2', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtAddress2")%>&nbsp;</td> 
  		    <td id="rptr_PtCity" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtCity', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtCity")%>&nbsp;</td>
			<td id="rptr_PtState" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtState', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtState")%>&nbsp;</td>
			<td id="rptr_PtPostalCode" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtPostalCode', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtPostalCode")%>&nbsp;</td>
			<td id="rptr_PtCountry" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtCountry', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtCountry")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>

  <asp:Repeater ID="PtDemoGx3" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
    <tr> 
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Birth Place&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Race&nbsp;</td>
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Ethnicity&nbsp;</td>
		<td style="white-space: nowrap; width: 80px;" align="left"  class="controlBoxDataGridTitleColumn">&nbsp;Language&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Death Date&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;&nbsp;</td>
	</tr>
		<tr class="ClinicalEformPopulatedRow" > 
			<td id="rptr_PtBirthPlace" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtBirthPlace', 'Patients');">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtBirthPlace")%>&nbsp;</td>  
			<td id="rptr_PtRace" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtRace', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtRace")%>&nbsp;</td>
			<td id="rptr_PtEthnicity" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtEthnicity', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtEthnicity")%>&nbsp;</td>
			<td id="rptr_PtLanguage" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtLanguage', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtLanguage")%>&nbsp;</td>
			<td id="rptr_PtDeathDateText" align="left" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtDeathDateText', 'Patients');"><%# DataBinder.Eval(Container.DataItem, "PtDeathDateText")%>&nbsp;</td>
			<td id="Td2" align="left" class="ClinicalEformPopulatedColumn"  >&nbsp;</td>
			<td id="Td1" align="left" class="ClinicalEformPopulatedColumn"  >&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  </table>
  
  <br />
  <table width="100" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="Table1" >
	<tr  > 
		<td style="white-space: nowrap; " align="center" class="controlBoxDataGridTitleColumn" width="50px">&nbsp;Age&nbsp;</td>
		<td align="center" width="50px" ><asp:Label Width="50px" runat="server" ID="Age" Text="Not Specified"/></td>

	</tr>  
</table>

  <br/><br /><br />