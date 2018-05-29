<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PatientPhysiciansForm.ascx.cs" Inherits="Caisis.UI.Modules.All.DataEntryForms.PatientPhysiciansForm" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePatientDataControl" %>
<%@ Register TagPrefix="uc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">
    /* <![CDATA[ */
    
    function popupAddEditPhysician(path) {
        top.showModalWithConfig(path, 'Add/Edit Physicians', { height: '590px', context: window });
    }
    
    /* ]]> */
</script>

<table>
    <tr>
        <td width="75%">
            <div class="pdFormCol">
                <div class="DataEntryRow">
                    <uc:CaisisSelect AutoPostBack="true" OnSelectedIndexChanged="SelectPhysician" Table="PatientPhysicians" Field="PhysicianId" ID="PhysicianId" CssClass="pdFormField" Required="true" runat="server" />
                </div>
                <div class="DataEntryRow">
                    <uc:CaisisSelect Table="PatientPhysicians" Field="PtPhRole" ID="PtPhRole" CssClass="pdFormField" Required="true" runat="server" />
                </div>
                <div class="DataEntryRow">
                    <uc:CaisisSelect Table="PatientPhysicians" Field="PtPhContactStatus" ID="PtPhContactStatus" CssClass="pdFormField" runat="server" />
                </div>
                <div class="DataEntryRow">
                    <uc:CaisisTextArea Table="PatientPhysicians" Field="PtPhNotes" ID="PtPhNotes" CssClass="pdFormField" runat="server" />
                </div>
            </div>
        </td>
        <td valign="top">
                <img src="../../images/AddANewPhysicianButton.gif" width="94" height="27" border="0" onclick="popupAddEditPhysician('../Utilities/AddEditPhysicians.aspx?newWindow=true');"  style="margin-top:10px; cursor: pointer;"/>

        </td>
    </tr>
</table>


<br />
<table align="center" class="pdFormTable" width="440" cellpadding="2" cellspacing="0"  style="background-color:#E0EAF0; border: solid 1px #cccccc; visibility:hidden;" id="PhysicianInfoTable" runat="server">
	<tr>
		<td><img src="../../images/shim.gif" width="90" height="1"></td>
		<td><img src="../../images/shim.gif" width="150" height="1"></td>
		<td><img src="../../images/shim.gif" width="50" height="1"></td>
		<td><img src="../../images/shim.gif" width="150" height="1"></td>
	</tr>
	<tr>
		<td colspan="4" height="26" valign="top">
		<a id="EditPhysicianLink" runat="server" style="cursor:pointer; float: right;"><img src=../../Images/EditThisPhysicianButton.gif width="101" height="16" border="0" align="absmiddle" hspace="20"></a>
		<span class="requiredField" style="width: auto; white-space: nowrap;" >&nbsp;&nbsp;Info on the Selected Physician</span> 
		</td>
	</tr>
	<tr>
		<td  class="pdFormFieldLabel" valign="top">Physician Name:&nbsp;&nbsp;</td>
		<td  valign="top"><asp:Label ID="PhysicianName" Runat="server" /></td>
		<td  class="pdFormFieldLabel"  valign="top">Specialty:&nbsp;&nbsp;</td>
		<td valign="top"><asp:Label ID="PhysicianSpecialty" Runat="server" /></td>
	</tr>
	<tr>
		<td  class="pdFormFieldLabel" valign="top">Address:&nbsp;&nbsp;</td>
		<td valign="top"><asp:Label ID="PhysicianAddress1" Runat="server" /><asp:Label ID="PhysicianAddress2" Runat="server" />
			<asp:Label ID="PhysicianCity" Runat="server" /><asp:Label ID="PhysicianState" Runat="server" /> <asp:Label ID="PhysicianPostalCode" Runat="server" />
		</td>
		<td valign="top">Institution:&nbsp;&nbsp;</td>
		<td valign="top"><asp:Label ID="PhysicianInstitution" Runat="server" /></td>
	</tr>
	<tr>
		<td  class="pdFormFieldLabel" valign="top">Phone:&nbsp;&nbsp;</td>
		<td valign="top"><asp:Label ID="PhysicianPhone" Runat="server" /></td>
		<td valign="top">&nbsp;</td>
		<td valign="top">&nbsp;</td>
	</tr>
	<tr>
		<td  class="pdFormFieldLabel" valign="top">Fax:&nbsp;&nbsp;</td>
		<td valign="top"><asp:Label ID="PhysicianFax" Runat="server" /></td>
		<td valign="top">&nbsp;</td>
		<td valign="top">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="4" valign="top">&nbsp;</td>
	</tr>
</table>