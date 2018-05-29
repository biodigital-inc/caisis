<%@ Control AutoEventWireup="true" Language="c#" Inherits="Caisis.UI.Core.Header.CommonTasks"
    CodeFile="CommonTasks.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseControl" %>

<script type="text/javascript">

function showCommonTaskLink(url,title)
{
    // common tasks are all contained in Utilities folder
    var basePath = '<%= Page.ResolveUrl("~/Core/Utilities/") %>';
    var fullPath = basePath + url;
    top.showModalWithConfig(fullPath,title, { height: '590px' } ); 
    // hide popup layer
    MM_showHideLayers('commonTasks','','hide','flashList','','show');
    return false;
}

</script>

<div id="commonTasks" style="border-right: #000000 1px; border-top: #000000 1px;
    z-index: 8; left: 11px; visibility: hidden; border-left: #000000 1px; width: 180px;
    border-bottom: #000000 1px; position: absolute;">
     <!-- DataSource for controlling Common Tasks -->
     <asp:XmlDataSource runat="server" ID="CommonTasksConfig" DataFile="~/App_Data/CommonTasksConfig.xml"
            XPath="/commonTasks/task[@displayName]"></asp:XmlDataSource>
    <table cellspacing="0" cellpadding="0" width="180" border="0" bgcolor="#ffffff">
        <tr>
            <td colspan="2" rowspan="2" bgcolor="#00668d">
                <img height="5" src="../../Images/Header/LayerCornerTopLeftBlue.gif" width="5"></td>
            <td class="GlobalListBorder" height="1">
                <img height="1" src="../../Images/shim.gif" width="2"></td>
            <td class="GlobalListBorder">
                <img height="1" src="../../Images/shim.gif" width="166"></td>
            <td class="GlobalListBorder">
                <img height="1" src="../../Images/shim.gif" width="2"></td>
            <td colspan="2" rowspan="2" bgcolor="#00668d">
                <img height="5" src="../../Images/Header/LayerCornerTopRightBlue.gif" width="5"></td>
        </tr>
        <tr>
            <td colspan="3" height="4">
                <img height="4" src="../../Images/shim.gif" width="1"></td>
        </tr>
        <tr>
            <td class="GlobalListBorder">
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="4"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="4"></td>
            <td class="GlobalListBorder">
                <img height="1" src="../../Images/shim.gif" width="1"></td>
        </tr>
        <tr>
            <td class="GlobalListBorder">
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td valign="top" colspan="3" height="15">
                <a onclick="MM_showHideLayers('commonTasks','','hide','flashList','','show')" href="javascript:;">
                    <img height="11" hspace="4" src="../../Images/Header/SmallCloseButton.gif" width="11"
                        align="right" border="0"></a><img id="IMG2" height="8" hspace="2" src="../../Images/Header/commonTasksTitle.gif"
                            width="83" vspace="2"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td class="GlobalListBorder">
                <img height="1" src="../../Images/shim.gif" width="1"></td>
        </tr>
        <tr>
            <td class="GlobalListBorder">
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td bgcolor="#00668d" colspan="3">
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td class="GlobalListBorder">
                <img height="1" src="../../Images/shim.gif" width="1"></td>
        </tr>
        <tr>
            <td class="GlobalListBorder">
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td class="commonTasksText" valign="top">
                <!-- A List of Common Tasks -->
                <div style="padding: 3px;">
                    <asp:Repeater ID="rptCommonTasks" DataSourceID="CommonTasksConfig" OnItemDataBound="SetTaskLink"
                        runat="server">
                        <ItemTemplate>
                            <a href="#" id="taskLink" runat="server" class="commonTasksText">
                                <%# Eval("displayName") %>
                            </a>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td>
                <img height="1" src="../../Images/shim.gif" width="1"></td>
            <td class="GlobalListBorder">
                <img height="1" src="../../Images/shim.gif" width="1"></td>
        </tr>
        <tr>
            <td colspan="2" rowspan="2">
                <img height="5" src="../../Images/Header/LayerCornerBottomLeft.gif" width="5"></td>
            <td colspan="3" height="4">
                <img height="4" src="../../Images/shim.gif" width="1"></td>
            <td colspan="2" rowspan="2">
                <img height="5" src="../../Images/Header/LayerCornerTopBottomRi.gif" width="5"></td>
        </tr>
        <tr>
            <td class="GlobalListBorder" colspan="3" height="1">
                <img height="1" src="../../Images/shim.gif" width="1"></td>
        </tr>
    </table>
</div>
