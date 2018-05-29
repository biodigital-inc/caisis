<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenDemographics" CodeFile="ProstateSpecimenDemographics.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script language="javascript" type="text/javascript">
	tableArray.DemographicsHtmlTable = "DemographicsHtmlTable";
</script>

<a name="ProstateSpecimenDemographics" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Demographics"></asp:Label><br/>

<br />
<table width="400" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DemographicsHtmlTable" >  
         
        <tr>
		    <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >Gender </td>
		    <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >Race </td>
		    <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >Spanish/Hispanic Origin </td>
		    <td class="controlBoxDataGridTitleColumn"></td>
		</tr>
		
		<tr>
		    <asp:Repeater ID="PtDemoGx" runat="server" >
                         <ItemTemplate>
                            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Patients',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtGender,PtRace,PtEthnicity', 'Patients');"> 
	                           <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtGender")%></td>
	                           <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtRace")%></td>
	                           <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtEthnicity")%></td>
                               <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
                            </tr>    
	                    </ItemTemplate>
             </asp:Repeater>
		</tr>  
		       
</table>
<br/><br /><br />