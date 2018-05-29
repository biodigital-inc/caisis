<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bone.Eforms.PatientsDemographicsOsteo" CodeFile="PatientsDemographicsOsteo.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script language="javascript" type="text/javascript">
	tableArray.DemographicsHtmlTable = "DemographicsHtmlTable";
</script>

<a name="PatientsDemographicsOsteo" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Demographics"></asp:Label><br/>


<br />
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DemographicsHtmlTable" >
    
      <tr style="display:none;" id="DemographicsxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable"  > 
			<td colspan="8" class="ClinicalEformPopulatedColumn" align="center" height="40"> The demographics recorded for this patient has been populated below.  Click to edit.</td>            
    </tr>    


  <asp:Repeater ID="PtDemoGx" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
    <%--<tr> 
		<td style="white-space: nowrap; "  align="left"  class="controlBoxDataGridTitleColumn"  width="250px">&nbsp;MRN&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;First&nbsp;</td>
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Middle&nbsp;</td>
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Last&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Gender&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;Birth Date&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;&nbsp;</td>
	</tr>--%>
		<%--<tr  > 
			<td id="rptr_PtMRN" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtMRN")%>&nbsp;</td>
			<td id="rptr_PtFirstName" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtFirstName")%>&nbsp;</td>
			<td id="rptr_PtMiddleName" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtMiddleName")%>&nbsp;</td>
			<td id="rptr_PtLastName" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtLastName")%>&nbsp;</td>
			<td id="rptr_PtGender" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtGender")%>&nbsp;</td>
			<td id="rptr_PtBirthDateText" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtBirthDateText")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	</tr>--%>      
	</ItemTemplate>
  </asp:Repeater>
  
    <asp:Repeater ID="PtDemoGx2" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
    <%--<tr> 
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" colspan="2">&nbsp;Address (line 1)&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" colspan="1">Address (line 2)&nbsp;</td>
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;City&nbsp;</td>
		<td style="white-space: nowrap; width: 80px;" align="left"  class="controlBoxDataGridTitleColumn">&nbsp;State&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px">&nbsp;Postal Code&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >&nbsp;&nbsp;</td>
	</tr>--%>
	<%--<tr > 
		<td id="rptr_PtAddress1" align="left" class="ClinicalEformPopulatedColumn" colspan="2" >&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtAddress1")%>&nbsp;</td> 
		<td id="rptr_PtAddress2" align="left" class="ClinicalEformPopulatedColumn" colspan="1" ><%# DataBinder.Eval(Container.DataItem, "PtAddress2")%>&nbsp;</td> 
	    <td id="rptr_PtCity" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtCity")%>&nbsp;</td>
		<td id="rptr_PtState" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtState")%>&nbsp;</td>
		<td id="rptr_PtPostalCode" align="left" class="ClinicalEformPopulatedColumn" ><%# DataBinder.Eval(Container.DataItem, "PtPostalCode")%>&nbsp;</td>
		<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	</tr>--%>      
	</ItemTemplate>
  </asp:Repeater> 	
  
  
  
  
        <tr>
  		    <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" ><asp:Label ID="PtMRNTitle" runat="server" Text="MRN"></asp:Label></td>
            <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" ><strong></strong>&nbsp;First&nbsp;</td>
		    <td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Middle&nbsp;</td>
		    <td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;Last&nbsp;</td>
		    <td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="100px" >&nbsp;Gender&nbsp;</td>
		    <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="100px">Birth Date&nbsp;</td>
		</tr>
  
      <tr> 
 		<td style="white-space: nowrap; " align="left" width="250px" ><asp:Label  runat="server" ID="PtMRN" /></td>
     
		<td style="white-space: nowrap; " align="left" width="250px" ><asp:Label  runat="server" ID="PtFirstName" /></td>

		<td style="white-space: nowrap; " align="left"  width="250px" ><asp:Label  runat="server" ID="PtMiddleName" /></td>

		<td style="white-space: nowrap; " align="left"  width="250px" ><asp:Label  runat="server" ID="PtLastName" /></td>
			
		<td style="white-space: nowrap; " align="left"  width="100px" ><asp:Label Width="50px" runat="server" ID="PtGender" /></td>
		
		<td style="white-space: nowrap; " align="left" width="100px"><asp:Label Width="50px" runat="server" ID="PtBirthDateText" /></td>


     </tr>
     
     <tr>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" width="250px" colspan="2">&nbsp;Address (line 1)&nbsp;</td>
		<td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" colspan="1">Address (line 2)&nbsp;</td>
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;City&nbsp;</td>
		<td style="white-space: nowrap; " align="left"  class="controlBoxDataGridTitleColumn" width="250px" >&nbsp;State&nbsp;</td>
		<td style="white-space: nowrap; width: 80px;" align="left"  class="controlBoxDataGridTitleColumn">Postal Code&nbsp;</td>
     
     </tr>
     <tr>
		<td style="white-space: nowrap; " align="left" width="250px" colspan="2"><asp:Label runat="server" ID="PtAddress1"/></td>

	
		<td style="white-space: nowrap; " align="left" colspan="1"><asp:Label  runat="server" ID="PtAddress2"/></td>

		<td style="white-space: nowrap; " align="left"  width="250px" ><asp:Label   runat="server" ID="PtCity"/></td>
	
		<td style="white-space: nowrap; " align="left"  width="250px" ><asp:Label runat="server" ID="PtState"/></td>

		<td style="white-space: nowrap; width: 80px;" align="left"  ><asp:Label runat="server" ID="PtPostalCode"/></td>
     
     </tr>

  </table>
  
  
  
<%--<br /><strong>Additional Demographics</strong>--%>
<table style="display: none;" width="75" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="Table1" >
	<tr  > 
		<td align="center" valign="top" style="white-space: nowrap; width: 120px;" ><strong>Age&nbsp;<br /></strong>    
		    <asp:Label style="white-space: nowrap;" runat="server" ID="Age" /></td>
 
	</tr>  
</table>
<br/><br /><br />
