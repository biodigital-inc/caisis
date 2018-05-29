<%@ Control Language="c#" AutoEventWireup="true" Inherits="Caisis.UI.Core.Header.FindResults"
    CodeFile="FindResults.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.HeaderControl" %>

<script type="text/javascript">
    /* <![CDATA[ */
    // Register client id for search container
    var resultsBoxId = '<%= findResults.ClientID %>';
    /* ]]> */
</script>

<!-- Search Results Container -->
<div id="findResults" style="width: 280px; border: 1px solid #ffffcc; z-index: 12; position: absolute; background-color: #ffffff; visibility: hidden; border: 1px solid #cccccc; padding: 2px 0px 0px 4px;" runat="server">
    <div style="padding: 2px; border-bottom: 1px solid #8d282c;">
        <!-- Search Type/Count -->
        <div id="searchType" style="color: #990000; font-weight: bold; font-size: 11px; text-align: left;">
            Search Results</div>
        <img src="../../Images/Header/SmallCloseButton.gif" style="height: 11px; position: absolute;
            top: 4px; right: 4px; cursor: pointer;" alt="Close Search Results" onclick="hideSearchResults();" />
    </div>
    <!-- Search Status -->
    <div id="searchStatusText" style="text-align: center; display: none; font-weight: bold; width: 100%; padding: 50px 2px 50px 2px;">... Loading ...</div>
    <!-- Search Result Items -->
    <div id="resultsList" style="overflow: auto; margin: 5px auto auto 4px; padding-right: 4px; padding-bottom: 6px; overflow: auto; min-height: 60px; max-height: 360px; height: auto; *height: 360px;"></div>
</div>
