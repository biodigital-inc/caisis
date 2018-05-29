<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Toxicities_UrinaryAndRectal" CodeFile="Toxicities_UrinaryAndRectal.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="Toxicities_UrinaryAndRectal" />
<table width="500" border="0" cellpadding="0" cellspacing="0" class="controlBox">
   
    <tr> 
      <td><img src="../Images/shim.gif" width="1" height="1" /></td>
      <td> 
		<table width="100%" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td colspan="3" height="18" align="left" class="controlBoxTitle">Toxicities&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            </td>
          </tr>
          <tr>
				<td  class="controlBoxDataGridTitleColumn"></td>
				<td  class="controlBoxDataGridTitleColumn">Grade</td>
				<td  class="controlBoxDataGridTitleColumn">Date</td>
          </tr>
          <tr>
			 <td class="controlBoxDataGridTitleColumn">
				<euc:EformCheckBox Text="Rectal Toxicity" RecordId="1" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_1"/>&nbsp;</td>
			<td>
				<euc:EformTextBox RecordId="1" ShowNumberPad="True" style="width:100;" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" ID="ToxGrade_1"/></td>
			<td>
				<euc:EformHidden RecordId="1"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_1"/>
				<euc:EformTextBox RecordId="1" ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_1"/></td>
		  </tr>
		  
		  <tr>
			 <td class="controlBoxDataGridTitleColumn">
				<euc:EformCheckBox Text="Urinary Toxicity" RecordId="2" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_2"/>&nbsp;</td>
			<td>
				<euc:EformTextBox RecordId="2" ShowNumberPad="True"	 style="width:100;" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" ID="ToxGrade_2"/></td>
			<td>
				<euc:EformHidden RecordId="2"  TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_2"/>
				<euc:EformTextBox RecordId="2" ShowCalendar="True" CalcDate="True" style="width:100;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" ID="ToxDateText_2"/></td>
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