<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PatientsDemographicsBasicDisplayOnly" CodeFile="PatientsDemographicsBasicDisplayOnly.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<a href="../../../ClientScripts/utilities.js"></a>


<a name="PatientsDemographicsBasicDisplayOnly" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Demographics"></asp:Label><br/>
<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DemographicsHtmlTable" >

  <asp:Repeater ID="PtDemoGx" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
<%--		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtTitle,PtAddress1,PtBirthDate,PtBirthDateText,PtFirstName,PtAddress2,PtGender,PtMiddleName,PtCity,PtRace,PtLastName,PtState,PtSuffix,PtPostalCode', 'Patients');"> 
			<td id="rptr_PtTitle" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtTitle")%></td>  
			<td id="rptr_PtFirstName" align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtFirstName")%>&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtMiddleName")%></td>
			<td id="rptr_PtLastName" align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtLastName")%>&nbsp;</td>
			<td id="rptr_PtSuffix" align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtSuffix")%>&nbsp;</td>
			<td id="rptr_PtBirthDateText" align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtBirthDateText")%></td>
			<td id="rptr_PtGender" align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtGender")%></td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	</tr> --%>     
	</ItemTemplate>
  </asp:Repeater>
  
    <asp:Repeater ID="PtDemoGx2" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
<%--		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtTitle,PtAddress1,PtBirthDate,PtBirthDateText,PtFirstName,PtAddress2,PtGender,PtMiddleName,PtCity,PtRace,PtLastName,PtState,PtSuffix,PtPostalCode', 'Patients');"> 
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtAddress1")%>&nbsp;</td> 
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtAddress2")%>&nbsp;</td> 
  		   <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtCity")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtState")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "PtPostalCode")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr> --%>     
	</ItemTemplate>
  </asp:Repeater>
  
 	
    <tr> 
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;First&nbsp;</td>
		<td align="left" width="250px" ><asp:Label Width="100px" runat="server" ID="PtFirstName" Text="Not Specified"/></td>

		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Last&nbsp;</td>
		<td align="left" width="250px" ><asp:Label Width="100px" runat="server" ID="PtLastName" Text="Not Specified"/></td>
			
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="100px">&nbsp;Age&nbsp;</td>
		<td align="left" width="100px" ><asp:Label Width="50px" runat="server" ID="Age" Text="Not Specified"/></td>

		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="100px" >&nbsp;Gender&nbsp;</td>
		<td align="left" width="100px" ><asp:Label Width="50px" runat="server" ID="PtGender" Text="Not Specified"/></td>


       <%--<euc:EformHidden runat="server" TABLE="Patients" FIELD="PtMRN" ID="PtMRN"/>--%>
<%-- 		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Title&nbsp;</td>
		<td align="left" width="250px"><euc:EFormSelect Width="100px" LookupCode="Title" runat="server" TABLE="Patients" FIELD="PtTitle" ID="PtTitle"/></td>
		
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Address 1&nbsp;</td>
		<td align="left" width="250px"><euc:EFormTextBox Width="100px" runat="server" TABLE="Patients" FIELD="PtAddress1" ID="PtAddress1"/></td>
--%>		
	
	</tr>
<%--	<tr> 
		
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Address 2&nbsp;</td>
		<td align="left" width="250px" ><euc:EFormTextBox Width="100px" runat="server" TABLE="Patients" FIELD="PtAddress2" ID="PtAddress2"/></td>
		
	</tr>
	<tr> 
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Middle&nbsp;</td>
		<td align="left" width="250px" ><euc:EFormTextBox Width="100px" runat="server" TABLE="Patients" FIELD="PtMiddleName" ID="PtMiddleName"/></td>
		
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;City&nbsp;</td>
		<td align="left" width="250px" ><euc:EFormTextBox Width="100px" runat="server" TABLE="Patients" FIELD="PtCity" ID="PtCity"/></td>
	
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Race&nbsp;</td>
		<td align="left" width="250px" ><euc:EformSelect Width="100px" runat="server" TABLE="Patients" FIELD="PtRace" ID="PtRace" LookupCode="PtRace"/></td>
	</tr>
	<tr> 
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;State&nbsp;</td>
		<td align="left"width="250px"  ><euc:EFormSelect Width="100px" runat="server" LookupCode="State" TABLE="Patients" FIELD="PtState" ID="PtState"/></td>

		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" ></td>
		<td align="left"width="250px"  ></td>

	</tr>
	<tr> 
		<td style="white-space: nowrap; width: 80px;" align="left"  class="controlBoxDataGridTitleColumn">&nbsp;Suffix&nbsp;</td>
		<td align="left"><euc:EFormSelect Width="100px" LookupCode="Suffix" runat="server" TABLE="Patients" FIELD="PtSuffix" ID="PtSuffix"/></td>
	
		<td style="white-space: nowrap; width: 80px;" align="left"  class="controlBoxDataGridTitleColumn">&nbsp;Zip&nbsp;</td>
		<td align="left"><euc:EFormTextBox Width="100px" runat="server" TABLE="Patients" ShowNumberPad="True" FIELD="PtPostalCode" ID="PtPostalCode"/></td>

		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" ></td>
		<td align="left"width="250px"  ></td>

	</tr>
 --%> </table>
  <br/><br /><br />