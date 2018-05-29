<%@ Control Language="c#" AutoEventWireup="true" Inherits="Caisis.UI.Core.Header.CurrentList"
    CodeFile="CurrentList.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.HeaderControl" %>

<script type="text/javascript">
var patientRedirectPath = "<%= patientRedirectPath %>";
var lastSearchBoxId = 'PreviousSearchText';

// beware updated in v4.2
// handles page redirect when item selected in the current list
function navigateToPatientOnCurrentList(epid)
{ 
    // If url already contains query params, append extra params
    var urlSeparator = "?";
    if(new String(patientRedirectPath).indexOf('?')>-1)
    { 
        urlSeparator = "&";
    }
    window.top.location = patientRedirectPath + urlSeparator+'findClicked=true&verifyPatientId=true&epid=' + epid; 
}
</script>

<div id="currentList" style="position: absolute; left: 118px; top: 8px; width: 230;
    z-index: 10; border: 1px none #000000; display: none;">
    <table id="currentListTable" width="280" border="0" cellspacing="0" cellpadding="0"
        bgcolor="#ffffff">
        <tr>
            <td colspan="2" rowspan="2" bgcolor="8d2a2c">
                <img src="../../Images/Header/LayerCornerTopLeftRed.gif" width="5" height="5"></td>
            <td height="1" class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="2" height="1"></td>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="236" height="1"></td>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="2" height="1"></td>
            <td colspan="2" rowspan="2" bgcolor="8d2a2c">
                <img src="../../Images/Header/LayerCornerTopRightRed.gif" width="5" height="5"></td>
        </tr>
        <tr>
            <td colspan="3" height="4">
                <img src="../../Images/shim.gif" width="1" height="4"></td>
        </tr>
        <tr>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="4" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="4" height="1"></td>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
        </tr>
        <tr>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td height="15" colspan="3" valign="top">
                <a href="javascript:;" onclick="MM_showHideLayers('currentList','','hide','flashList','','show')">
                    <img src="../../Images/Header/SmallCloseButton.gif" width="11" height="11" hspace="4"
                        border="0" align="right"></a><img src="../../Images/Header/currentListTitle.gif"
                            width="65" height="8" hspace="2" vspace="2"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
        </tr>
        <tr>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td colspan="3" bgcolor="8d2a2c">
                <img src="../../Images/shim.gif" width="1" height="1"><img src="../../Images/shim.gif"
                    width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
        </tr>
        <tr>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td valign="top" id="asdaf">
                <table id="recentFindTable" width="250" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td colspan="2" class="listLayer">
                            <img src="../../Images/Header/shim.gif" width="10" height="10"></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="listLayer">
                            <span class="currentListSubtitle">Recent Find Results</span></td>
                    </tr>
                    <tr>
                        <td colspan="3" bgcolor="8d2a2c">
                            <img src="../../Images/Header/shim.gif" width="1" height="1"></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="listLayer">
                            <img src="../../Images/Header/shim.gif" width="10" height="5"></td>
                    </tr>
                    <tr id="RecentFindsMessageRow" runat="server">
                        <td colspan="2" class="smallHeaderText">
                            You have not selected any patients with the search feature during this session.<br />
                            <br />
                            <br />
                        </td>
                    </tr>
                    <asp:Repeater ID="findRpt" OnItemCreated="SetFindRepeaterListItem" runat="server">
                        <ItemTemplate>
                            <tr class="listLayer" onmouseover="this.className='listLayerOver'" onmouseout="this.className='listLayer'"
                                onclick="navigateToPatientOnCurrentList('<%# Caisis.Security.CustomCryptoHelper.Encrypt(((System.Data.DataRowView)Container.DataItem)["patientID"].ToString())%>')">
                                <td style="font-size: 11px">
                                    <asp:Label ID="FindRepeaterListItem" runat="server"></asp:Label></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
        </tr>
        <tr>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td valign="top">
                <table width="250" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td height="15" colspan="2">
                            <img src="../../Images/Header/shim.gif" width="10" height="5"></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="listLayer">
                            <asp:Label ID="recentListTitle" runat="server" CssClass="currentListSubtitle">Current Patient List</asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <img src="../../Images/Header/shimRed2.gif" width="250" height="1"></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="listLayer">
                            <img src="../../Images/Header/shim.gif" width="10" height="5"></td>
                    </tr>
                    <tr>
                        <td>
                            <div style="width: 270px; height: 210px; overflow: auto;">
                                <table width="250" border="0" cellpadding="0" cellspacing="0">
                                    <asp:Repeater ID="patientRpt" OnItemCreated="SetPatientRepeaterListItem" runat="server">
                                        <ItemTemplate>
                                            <tr class="listLayer" onmouseover="this.className='listLayerOver'" onmouseout="this.className='listLayer'"
                                                onclick="navigateToPatientOnCurrentList('<%# Caisis.Security.CustomCryptoHelper.Encrypt(((System.Data.DataRowView)Container.DataItem)["patientID"].ToString())%>')">
                                                <td class="smallHeaderText">
                                                    <asp:Label ID="PatientRepeaterListItem" runat="server" /></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:Repeater ID="clinicRpt" runat="server" OnItemCreated="rptClinicItemCreated">
                                        <ItemTemplate>
                                            <tr id="clinicListRow" onmouseover="this.className='listLayerOver'" onmouseout="this.className='listLayer'"
                                                runat="server">
                                                <td class="smallHeaderText">
                                                    <%# _pc.GetPatientLastName(Eval("ApptLastName").ToString()) %>
                                                    ,
                                                    <%# _pc.GetPatientFirstName(Eval("ApptFirstName").ToString()) %>
                                                </td>
                                                <td align="right" class="smallHeaderText">
                                                    <%# DataBinder.Eval(Container.DataItem, "ApptMRN")%>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <tr id="CurrentListMessageRow" runat="server">
                                        <td colspan="2" class="smallHeaderText">
                                            <asp:Label ID="CurrentListMessage" runat="server">No list is currently selected.<br>Please go to the <a href="<%= Page.ResolveUrl("~/Core/PatientLists/PatientListPage.aspx") %>">Patient List Section</a> to select lists and patients.</asp:Label></td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
        </tr>
        <tr>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td valign="top">
                &nbsp;
            </td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td>
                <img src="../../Images/shim.gif" width="1" height="1"></td>
            <td class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
        </tr>
        <tr>
            <td colspan="2" rowspan="2">
                <img src="../../Images/Header/LayerCornerBottomLeft.gif" width="5" height="5"></td>
            <td colspan="3" height="4">
                <img src="../../Images/shim.gif" width="1" height="4"></td>
            <td colspan="2" rowspan="2">
                <img src="../../Images/Header/LayerCornerTopBottomRi.gif" width="5" height="5"></td>
        </tr>
        <tr>
            <td colspan="3" height="1" class="GlobalListBorder">
                <img src="../../Images/shim.gif" width="1" height="1"></td>
        </tr>
    </table>
</div>
