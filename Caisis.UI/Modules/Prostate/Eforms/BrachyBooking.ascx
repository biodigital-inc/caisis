<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BrachyBooking" CodeFile="BrachyBooking.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="BrachyBooking" />
<table width="500" border="0" cellpadding="0" cellspacing="0" class="controlBox">
   
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="3" height="18" align="left" class="controlBoxTitle">Booking&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
          </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn" colspan="3"><asp:Literal ID="brachyMsg" Runat=server></asp:Literal></td>
          </tr>
          
          <tr>
				<td class="controlBoxDataGridTitleColumn">Date</td>
				<td><euc:EformHidden TABLE="Actions" FIELD="ActionDate" Runat="server" ID="ActionDate"/>
				<euc:EformTextBox ShowCalendar="True" CalcDate="True" TABLE="Actions" FIELD="ActionDateText" style="width:160;" Calendar="True" Runat="server" ID="ActionDateText"/></td>
			</tr>
			<tr>
				<td class="controlBoxDataGridTitleColumn">Booking</td>
				<td><euc:EformSelect style="width:160;" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem">
						<asp:ListItem value=""></asp:ListItem>
						<asp:ListItem value="OKForSeedImplant">OK For Seed Implant</asp:ListItem>
						<asp:ListItem value="NotOKForSeedImplant">NOT OK For Seed Implant</asp:ListItem>
						<asp:ListItem value="BookedForSeedImplant">BOOKED For Seed Implant</asp:ListItem>
					</euc:EformSelect>
					
				</td>
			
			</tr>
			<tr>
				<td class="controlBoxDataGridTitleColumn">Prescribed Dose</td>
				<td><euc:EformSelect  LookupCode="BrachyPrescribedDose" style="width:160;" TABLE="BrachyTherapy" FIELD="BrachyPrescribedDose" Runat="server" ID="BrachyPrescribedDose"/></td>
			</tr>
			<tr>
				<td class="controlBoxDataGridTitleColumn">Isotope</td>
				<td><euc:EformSelect LookupCode="SeedIsotope" style="width:160;" TABLE="BrachyTherapy" FIELD="BrachyIsotope" Runat="server" ID="BrachyIsotope"/></td>
			</tr>
            
        </table>
       </td>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
</table>

<br>