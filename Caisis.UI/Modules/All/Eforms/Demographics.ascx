<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Demographics" CodeFile="Demographics.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="Demographics" />
  <table class="controlBox" width="700" border="0" cellpadding="4" cellspacing="0">
 	
    <tr>
		<td colspan="6" height="18" class="controlBoxTitle">&nbsp;Demographics</td>
    </tr>
    <tr> 
		<td width="150" class="controlBoxDataGridTitleColumn">&nbsp;Title&nbsp;</td>
		<td align="left"><euc:EFormSelect LookupCode="Title" runat=server TABLE="Patients" FIELD="PtTitle" ID="PtTitle"/></td>
		
		<td width="150" class="controlBoxDataGridTitleColumn">&nbsp;Address 1&nbsp;</td>
		<td align="left"><euc:EFormTextBox runat=server TABLE="Patients" FIELD="PtAddress1" ID="PtAddress1"/></td>
		
		<td width="150" class="controlBoxDataGridTitleColumn">&nbsp;Birth Date&nbsp;</td>
		<td align="left"><euc:EFormTextBox runat=server TABLE="Patients" FIELD="PtBirthDate" ID="PtBirthDate"/></td>
	
	</tr>
	<tr> 
		<td class="controlBoxDataGridTitleColumn">&nbsp;First&nbsp;</td>
		<td align="left"><euc:EFormTextBox runat=server TABLE="Patients" FIELD="PtFirstName" ID="PtFirstName"/></td>
		
		<td width="100" class="controlBoxDataGridTitleColumn">&nbsp;Address 2&nbsp;</td>
		<td align="left"><euc:EFormTextBox runat=server TABLE="Patients" FIELD="PtAddress2" ID="PtAddress2"/></td>
		
		<td class="controlBoxDataGridTitleColumn">&nbsp;Age&nbsp;</td>
		<td align="left"><euc:EFormTextBox runat=server TABLE="Patients" FIELD="PtAge" ID="PtAge"/></td>
	</tr>
	<tr> 
		<td class="controlBoxDataGridTitleColumn">&nbsp;Middle&nbsp;</td>
		<td align="left"><euc:EFormTextBox runat=server TABLE="Patients" FIELD="PtMiddleName" ID="PtMiddleName"/></td>
		
		<td class="controlBoxDataGridTitleColumn">&nbsp;City&nbsp;</td>
		<td align="left"><euc:EFormTextBox runat=server TABLE="Patients" FIELD="PtCity" ID="PtCity"/></td>
	
		<td class="controlBoxDataGridTitleColumn">&nbsp;Race&nbsp;</td>
		<td align="left"><euc:EFormTextBox runat=server TABLE="Patients" FIELD="PtRace" ID="PtRace"/></td>
	</tr>
	<tr> 
		<td class="controlBoxDataGridTitleColumn">&nbsp;Last&nbsp;</td>
		<td align="left"><euc:EFormTextBox runat=server TABLE="Patients" FIELD="PtLastName" ID="PtLastName"/></td>
			
		<td class="controlBoxDataGridTitleColumn">&nbsp;State&nbsp;</td>
		<td align="left"><euc:EFormSelect runat=server LookupCode="State" TABLE="Patients" FIELD="PtState" ID="PtState"/></td>
	</tr>
	<tr> 
		<td class="controlBoxDataGridTitleColumn">&nbsp;Suffix&nbsp;</td>
		<td align="left"><euc:EFormSelect LookupCode="Suffix" runat=server TABLE="Patients" FIELD="PtSuffix" ID="PtSuffix"/></td>
	
		<td class="controlBoxDataGridTitleColumn">&nbsp;Zip&nbsp;</td>
		<td align="left"><euc:EFormTextBox runat=server TABLE="Patients" NumberPad="True" FIELD="PtPostalCode" ID="PtPostalCode"/></td>
	</tr>
  </table>
  <br>