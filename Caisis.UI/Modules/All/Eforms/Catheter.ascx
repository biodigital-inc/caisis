<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Catheter" CodeFile="Catheter.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

     <!-- BEGIN Catheter -->
<a name="Catheter" />
      
  <span class="controlBoxTitle">&nbsp;&nbsp;Catheter</span><br />
  <table width="480" border="0" cellpadding="0" cellspacing="0" class="controlBox">
    <tr> 
      <td width="2" valign="top"><img src="../../Images/EFormControlTopLeft.gif" width="2" height="2" /></td>
      <td  width="576">&nbsp;</td>
      <td width="2" valign="top" align="right"><img src="../../Images/EFormControlTopRight.gif" width="2" height="2" /></td>
    </tr>
    <tr> 
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
      <td><table width="476" border="0" cellspacing="0" cellpadding="4">
          <tr> 
            <td width="160" height="18" align="right" class="controlBoxFieldTitle">Catheter 
              on Traction?</td>
            <td class="controlBoxFieldOption"> 
				<euc:EformRadioButtonList TABLE="ProstatectomyProc" FIELD="ProcCathTraction" LookupCode="YesNoUnknown" id="OpCathTraction" RepeatLayout="Table" CellSpacing="6" RepeatDirection="Horizontal"  runat="server">
			
			<%-- 		<asp:ListItem>None</asp:ListItem>
					<asp:ListItem>Immediate</asp:ListItem>
					<asp:ListItem>Delayed</asp:ListItem>
					
					
					<asp:ListItem>Yes</asp:ListItem>
					<asp:ListItem>No</asp:ListItem>--%>
				</euc:EformRadioButtonList>		
			</td>
          </tr>
          <%-- 
          <tr> 
            <td height="18" align="right" class="controlBoxFieldTitle">Duration 
              of Traction&nbsp; </td>
            <td class="controlBoxFieldOption"> 
				<euc:EformRadioButtonList TABLE="ProstatectomyProc" FIELD="ProcCathTractionDuration" id="OpCathTractionTime" RepeatLayout="Table" CellSpacing="6" RepeatDirection="Horizontal"  runat="server">
					<asp:ListItem>&lt;12</asp:ListItem>
					<asp:ListItem>12-24</asp:ListItem>
					<asp:ListItem>24-48</asp:ListItem>
					<asp:ListItem>48+</asp:ListItem>
				</euc:EformRadioButtonList>		
		       </td>
          </tr>--%>
        </table></td>
      <td><img src="../../Images/shim.gif" width="1" height="1" /></td>
    </tr>
    <tr> 
      <td valign="bottom"><img src="../../Images/EFormControlBottomLeft.gif" width="2" height="2" /></td>
      <td>&nbsp;</td>
      <td valign="bottom" align="right"><img src="../../Images/EFormControlBottomRight.gif" width="2" height="2" /></td>
    </tr>
  </table>  <br/><br/><br/>
  
  
  <!-- END Catheter -->
