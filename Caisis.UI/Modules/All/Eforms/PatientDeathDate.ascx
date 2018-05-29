<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PatientDeathDate" CodeFile="PatientDeathDate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="PatientDeathDate" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Death Date"></asp:Label><br/>
  
<table width="300" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DeathDateHtmlTable" >  
         
        <tr>
		    <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >Date </td>
		    <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >Cause of Death </td>
		    <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >Death Type</td>
		    <td class="controlBoxDataGridTitleColumn"></td>
		</tr>
		
		<tr>
		    <asp:Repeater ID="PtDemoGx" runat="server" >
                         <ItemTemplate>
                            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Patients',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtDeathDateText,PtDeathCause,PtDeathType', 'Patients');"> 
	                           <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathDateText")%></td>
	                           <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathCause")%></td>
	                           <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathType")%></td>
                               <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
                            </tr>    
	                    </ItemTemplate>
             </asp:Repeater>
		</tr>  
		       
</table>
<br/><br/><br />
