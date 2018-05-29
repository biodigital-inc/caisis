<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.GynSocialHistory" CodeFile="GynSocialHistory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="GynSocialHistory" id="GynSocialHistory" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Gyn History" />
<table>
    <tr id="NoSocialHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" visible="false" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> 
			    No Gyn history has been recorded for this patient.</td>
    </tr>  
    <tr id="SocialHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" visible="false"> 
		<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
		    The Gyn history recorded for this patient has been populated below.</td>            
    </tr> 
   <tr><td><br /></td></tr>
   
   <tr>
    <td>
        <table cellpadding="10" cellspacing="0" class="ClinicalEformTable" id="GynSocialHxHtmlTable">
	        <tr> 
		        <td class="controlBoxDataGridHeaderFirstCol" align="center">Age at<br />Menarche</td>
		        <td class="controlBoxDataGridHeaderFirstCol" align="center">Menopause<br />Status</td>
		        <td class="controlBoxDataGridHeaderFirstCol" align="center">Age at<br />Menopause</td>
		        <td class="controlBoxDataGridHeaderFirstCol" align="center">Parity</td>
		        <td class="controlBoxDataGridHeaderFirstCol" align="center">First Birth Age</td>
		        <td class="controlBoxDataGridHeaderFirstCol" align="center">&nbsp;</td>
	        </tr>
        	
	        <asp:Repeater ID="rowHasHx1" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                <ItemTemplate>
                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('SocialHistories',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'SocHxMenarcheAge,SocHxMenopauseStatus,SocHxMenopauseAge,SocHxParity,SocHxFirstBirthAge', 'SocialHistories');"> 
                       <td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "SocHxMenarcheAge")%></td>
                       <td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "SocHxMenopauseStatus")%></td>
                       <td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "SocHxMenopauseAge")%></td>
                       <td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "SocHxParity")%></td>
                       <td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "SocHxFirstBirthAge")%></td>
                       <td class="ClinicalEformPopulatedColumn" align="center"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
                    </tr>    
                </ItemTemplate>
           </asp:Repeater>

            <tr ID="rowNoHx1"  runat="server">
    <td align="center"><euc:EformTextBox id="SocHxMenarcheAge" Table="SocialHistories" Field="SocHxMenarcheAge" RecordId="1" runat="server" 
        style="width:60px;"/></td>
    <td align="center"><euc:EformDropDownList LookupCode="MenopauseStatus" id="SocHxMenopauseStatus" Table="SocialHistories" Field="SocHxMenopauseStatus" RecordId="1" runat="server" />
        </td>
    <td align="center"><euc:EformTextBox id="SocHxMenopauseAge"  Table="SocialHistories" Field="SocHxMenopauseAge" RecordId="1" runat="server" 
        style="width: 60px;"/></td>
    <td align="center"><euc:EformTextBox id="SocHxParity"  Table="SocialHistories" Field="SocHxParity" RecordId="1" runat="server" 
        style="width: 60px;"/></td>
    <td align="center"><euc:EformTextBox id="SocHxFirstBirthAge"  Table="SocialHistories" Field="SocHxFirstBirthAge" RecordId="1" runat="server" 
        style="width: 60px;"/></td>
    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" /></td>
  </tr>
        </table>
    </td>
   </tr>   
</table><br/><br/>