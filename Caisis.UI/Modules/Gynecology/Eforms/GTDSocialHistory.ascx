<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.GTDSocialHistory" CodeFile="GTDSocialHistory.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<style type="text/css">
.noSocHistoryVal
{
    color: #999999;
}
.SocHistoryMsg
{
    color: #111111;
    font-size: 11px;
    font-weight: bold;
}
#GTDSocialHistoryTable img
{
    cursor: pointer;
}
</style>


<a name="GTDSocialHistory" id="GTDSocialHistory" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Gyn History" />



<table id="GTDSocialHistoryTable" border="0" cellspacing="12" cellpadding="0" class="eformLargePopulatedTable">
    <tr id="NoSocialHxMsgTr" runat="server"  visible="false" > 
        <td colspan="2" align="center" class="SocHistoryMsg"> 
			    No Gyn history has been recorded for this patient.</td>
    </tr>  
    <tr id="SocialHxMsgTr" runat="server"  visible="false"> 
        <td colspan="2" align="center" class="SocHistoryMsg">
		        The Gyn history recorded for this<br />patient is listed below.<br />
		        <%--<img src="../../../Images/buttonEdit.gif" id="EditSocHxBtn" runat="server" style="margin-top: 5px;" />--%>
		        </td>            
    </tr> 
    <%-- This Field does not exist in the DB yet; also requested a Last Menstrual Period field  
    <tr>
        <td style="width: 120px;">Menopause Status</td>
        <td>
            <euc:EformSelect TABLE="SocialHistories" LookupCode="SocHxMenopauseStatus" FIELD="SocHxMenopauseStatus" RecordId="1" DropDownHeight="auto" Runat="server" ID="SocHxMenopauseStatus" style="width: 220px;" />
            <asp:Label ID="ExistingSoxHxMenopauseStatus" runat="server" />
        </td>
    </tr>
    --%>
    <tr>
        <td>Age at Menarche</td>
        <td>
            <euc:EformTextBox id="SocHxMenarcheAge" Table="SocialHistories" Field="SocHxMenarcheAge" RecordId="1" runat="server" style="width:60px;"/>
            <asp:Label ID="ExistingSocHxMenarcheAge" runat="server" />
        
        </td>
    </tr>
    <tr>
        <td>Age at Menopause</td>
        <td>
            <euc:EformTextBox id="SocHxMenopauseAge"  Table="SocialHistories" Field="SocHxMenopauseAge" RecordId="1" runat="server" style="width: 60px;"/>
            <asp:Label ID="ExistingSocHxMenopauseAge" runat="server" />
        
        </td>
    </tr>
    <tr>
        <td>Gravida</td>
        <td>
            <euc:EformTextBox id="SocHxGravida"  Table="SocialHistories" Field="SocHxGravida" RecordId="1" runat="server" style="width: 60px;"/>
            <asp:Label ID="ExistingSocHxGravida" runat="server" />
        
        </td>
    </tr>
    <tr>
        <td>Parity</td>
        <td>
            <euc:EformTextBox id="SocHxParity"  Table="SocialHistories" Field="SocHxParity" RecordId="1" runat="server" style="width: 60px;"/>
            <asp:Label ID="ExistingSocHxParity" runat="server" />
        
        </td>
    </tr>
    <tr>
        <td>Age at First Birth</td>
        <td>
            <euc:EformTextBox id="SocHxFirstBirthAge"  Table="SocialHistories" Field="SocHxFirstBirthAge" RecordId="1" runat="server" style="width: 60px;"/>
            <asp:Label ID="ExistingSocHxFirstBirthAge" runat="server" />
        </td>
    </tr>
     <tr>
        <td>Notes</td>
        <td>
            <euc:EformTextBox id="SocHxNotes"  Table="SocialHistories" ShowTextEditor="true" Field="SocHxNotes" RecordId="1" runat="server" style="width: 200px; height: 60px;"/>
            <asp:Label ID="ExistingSocHxNotes" runat="server" />
        </td>
    </tr>
    <tr id="SocialHxEditTr" runat="server"  visible="false"> 
        <td colspan="2" align="center" class="SocHistoryMsg">
		        <img src="../../../Images/buttonEdit.gif" id="EditSocHxBtn2" runat="server" style="margin-top: 5px;" />
        </td>            
    </tr> 
</table>
<br/><br/>