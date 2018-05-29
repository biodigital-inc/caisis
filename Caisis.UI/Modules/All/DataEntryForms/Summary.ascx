<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Summary.ascx.cs" Inherits="Modules_All_DataEntryForms_Summary" %>
<%@ Register TagPrefix="plugin" TagName="AddComments" Src="../../../Plugins/Comments/AddCommentsContainer.ascx" %>




<table align="center" border="0" cellspacing="3" class="pdSummaryTable" >
	
	<tr>
		<td colspan="2" valign="top" id="HPITableCell" style="padding: 0px;" >
            <iframe id="HPIFrame" src="../../Modules/All/DataEntryForms/PatientHPI.aspx" frameborder="0" scrolling="no" style="width: 448px; height: 200px;" ></iframe>
		</td>
	</tr>
	<tr>
		<td colspan="2" >
			<span style="font-weight:bold;">Medications:</span>
			<asp:Repeater ID="rptMedications" Runat=server>
				<ItemTemplate>
					<%# DataBinder.Eval(Container.DataItem, "Medication") %>
				</ItemTemplate>
				<SeparatorTemplate>, </SeparatorTemplate>
		</asp:Repeater>
		</td>
	</tr>

	<tr>
		<td colspan="2" >
		<span style="font-weight:bold;">Allergies:</span>
		<asp:Repeater ID="rptAllergies" Runat=server>
				<ItemTemplate>
					<%# DataBinder.Eval(Container.DataItem, "Allergen") %>
				</ItemTemplate>
				<SeparatorTemplate>, </SeparatorTemplate>
			</asp:Repeater>
		</td>
	</tr>
	
	<tr>
		<td colspan="2"  >
		<span style="font-weight:bold;">Comorbidities:</span>
		<asp:Repeater ID="rptComorbidities" Runat="server">
				<ItemTemplate>
					<%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>
				</ItemTemplate>
				<SeparatorTemplate>, </SeparatorTemplate>
			</asp:Repeater></td>
	</tr>
   
	<tr>
        <td colspan="2> 
            <plugin:AddComments ID="AddComments" runat="server"></plugin:AddComments>
        </td>
    </tr>

</table>
