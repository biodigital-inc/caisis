<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChildFormMenu.ascx.cs"
    Inherits="Core_DataEntryForms_ChildFormMenu" %>

<script type="text/javascript">
    /* <![CDATA[ */
    var REFRESH_RELATED_COUNT = 0;

    if (window.jQuery) {
        jQuery(document).ready(function() {
            var relatedMenu = jQuery('#relatedRecordsMenuContainer');
            jQuery('#relatedRecordsButton').click(function() {
                // show menu and refresh list
                relatedMenu.show();
                // refresh records (only first time)
                var selectTableLayer = jQuery('#<%= RelatedRecordsFrame.ClientID %>');

                if (REFRESH_RELATED_COUNT == 0 && selectTableLayer.size() > 0) {
                    refreshRelatedRecordLinks();
                }
            });
            relatedMenu.mouseleave(function() {
                relatedMenu.hide();
            });
        });
    }

    function addOtherRelatedRecord(srcTableName) {
        var selectTableLayer = jQuery('#<%= RelatedRecordsFrame.ClientID %>');
        var relatedMenu = jQuery('#relatedRecordsMenuContainer');
        // reload frame
        var relatedRecordsFrame = window.frames['<%= RelatedRecordsFrame.Attributes["name"] %>'];
        var baseUrl = '<%= RelatedRecordsFrame.Attributes["src"] %>';
        relatedRecordsFrame.location = baseUrl + (srcTableName ? '&srcTableName=' + srcTableName : '');
        selectTableLayer.show();
        relatedMenu.hide();
        return false;
    }

    function refreshRelatedRecordLinks() {
        // clear current results
        var container = jQuery('#<%= RelatedRecordsContainer.ClientID %>_Links');
        container.empty();
        // make request to load updated list of related records
        var requestParams =
        {
            'methodName': 'GetRelatedRecords',
            'destTableName': '<%= Request.QueryString["tableName"] %>',
            'destTablePrimaryKey': '<%= Request.QueryString["primKey"] %>'
        };
        var responseCallback = function(data) {
            // get list of updated records
            var doc = jQuery(data);
            var links = doc.find('#CurrentRecords a');
            // fill container with new links
            container.append(links);
            // updated refresh count
            REFRESH_RELATED_COUNT++;
        };
        // make AJAX request
        jQuery.post('RelatedRecords.aspx', requestParams, responseCallback);
    }

    function cancelAddOtherRelatedRecord() {
        jQuery('#<%= RelatedRecordsFrame.ClientID %>').hide();
        return false;
    }



    /* ]]> */
</script>

<style type="text/css">
    .RelatedRecordsFrame
    {
        display: block;
        height: 100%;
        width: 600px;
        margin: auto;
        position: absolute;
        z-index: 1001;
        top: 40px;
        left: 0px;
    }     
</style>
<img id="relatedRecordsButton" <%= _childRecordsExist ? "class=\"hasData\"" : ""  %>
    src="../../Images/shim.gif" title="View/Enter Related Records" />
<div id="relatedRecordsMenuContainer">
    <div id="patientDataMenuTitleBar">
        Related Records</div>
    <div id="patientDataMenuContents">
        <asp:Literal ID="relevantFormNavigation" runat="server"></asp:Literal>
<%--        <a class="RelatedRecordStrength0" onclick="loadRelatedRecord(this.innerHTML);">Add Other Related Record</a>--%>
<asp:Literal ID="subFormNavigation" runat="server"></asp:Literal>
        <%-- Related Records --%>
        <div id="RelatedRecordsContainer" runat="server" visible="false">
 <div class="divider" >&nbsp;</div>
            <%-- existing related records --%>
            <div id="<%= RelatedRecordsContainer.ClientID %>_Links">
                <asp:Repeater runat="server" ID="RelatedRecordsRptr">
                    <ItemTemplate>
                        <%--    <a class="RelatedRecordStrength<%# Eval("RelationStrength") %>" href="?tableName=<%# Eval("DestTableName") %>&primKey=<%# Eval("DestPrimaryKey") %>">
                            <%# Eval("DestTableName") %></a>--%>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <%-- add related record --%>
            <a class="RelatedRecordStrength0" href="#" title="Add Other Related Record" onclick="return addOtherRelatedRecord();">Add Other Related Record</a>
        </div>
    </div>
</div>
<%-- Add Related Record --%>
<asp:PlaceHolder runat="server" ID="RelatedRecordsPopup" Visible="false">
    <iframe id="RelatedRecordsFrame" name="RelatedRecordsFrame" class="RelatedRecordsFrame"
        src="" runat="server" scrolling="no" frameborder="0" allowtransparency="true"
        backgroundcolor="transparent" style="display: none;"></iframe>
</asp:PlaceHolder>
