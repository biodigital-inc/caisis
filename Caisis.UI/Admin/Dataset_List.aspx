<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dataset_List.aspx.cs" Inherits="Caisis.UI.Admin.Dataset_List" %>
<%@ Register TagPrefix="filter" TagName="SearchFilter" Src="~/Admin/ListFilter_Control.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Datasets</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>
 <script type="text/javascript" src="../ClientScripts/Admin.js"></script>
    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../ClientScripts/jquery-ui.js"></script>

   

    <script type="text/javascript">
        /* <![CDATA[ */
        jQuery.noConflict();
        
        jQuery(document).ready(function(e) {
            // adjust main content height
            adjustMainContentScroll();        
            jQuery(window).resize(adjustMainContentScroll);
        });

        function adjustMainContentScroll() {
            var winHeight = jQuery(window).height() - 75;
            var mainContainer = jQuery('#adminBoxNavListContainer');
            mainContainer.css('max-height', Math.max(winHeight, 100) + 'px');
        }
        
        function editDataset(datasetId) {
            slideOutNavigation('Dataset_Edit.aspx?datasetId=' + datasetId, 'left');
            return false;
        }

        /* ]]> */
    </script>

</head>
<body onload="top.setActiveButton('Datasets');">
    <form id="form1" runat="server">
<div id="AdminUserGroupPopupContainer" style="width: 400px;">
    <span class="adminNavHeading">Datasets</span>
     <asp:Label runat="server" ID="DatasetsCount" CssClass="adminNavHelpText" style="margin-left: 20px;"></asp:Label>
    <span class="adminNavHelpText">Datasets in Caisis (click to edit)</span>
    <div id="mainAdminBox" class="adminBox" style="width: 100%; border-color: #e1e1e1;-webkit-box-shadow: 0px 0px 10px #ddd; box-shadow: 0px 0px 10px #ddd;">
    <filter:SearchFilter ID="DatasetSearch" runat="server" ListId="DatasetList" />
    <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden; ">
                <ul id="DatasetList" class="adminBoxNavList">                    
                    <asp:Repeater runat="server" ID="DatasetRptr">
                    <ItemTemplate>
                            <li onclick="this.className='selected'; return editDataset('<%# Eval("DatasetId") %>');"  <%# Container.ItemIndex % 2 == 0 ? "class=\"alternate\"" : "" %>>
                                <span style="width: 220px; margin-right: 20px; float: left;">
                                    <%# Eval("DatasetName")%>
                                </span>
                                <span style="">
                                    <%#  (Convert.ToBoolean(Eval("DatasetActive"))) ? "Active" : "Inactive" %>
                                </span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <span runat="server" id="NoTablesMessage" visible="false">No data entry forms have been customized for this disease view.<br /><br />Click <strong>Manage Tables</strong> below to select forms you would like to customize for this disease.</span>
            </div>
</div>
            <span class="dataEntryButtonGray" onclick="return editDataset('');" style="margin: 5px auto;">Add Dataset</span>
</div>
    </form>
</body>
</html>
