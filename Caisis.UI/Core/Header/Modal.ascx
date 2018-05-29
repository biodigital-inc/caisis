<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Modal.ascx.cs" Inherits="Caisis.UI.Core.Header.Modal" %>
<%-- Modal Control: must be placed in top level page for correct formatting --%>
<!-- required modal script -->
<script type="text/javascript" src="<%= Page.ResolveUrl("~/ClientScripts/Modal.js") %>"></script>

<!-- modal transparent background -->
<div id="ModalContainerOpacity">
</div>
<!-- Modal will stay within bounds of container -->
<div id="ModalContainment">
</div>
<!-- main modal transparent background -->
<div id="ModalContainer" style="z-index: 101; display: none; cursor: move;">
    <table id="ModalTable" cellspacing="0">
        <tr>
            <td id="ModalMain">
                
                <span id="ModalPrintButtonContainer"><div id="DoubleSidedContainer" onclick="switchDoubleSided(this);" <% = (DoubleSidedPrintEnabled) ? "" : "style=\"display:none;\"" %>  >Double Sided Printing: <span id="DoubleSidedIndicator" class="DoubleSidedIndicator"><% = (DoubleSidedPrintPreference) ? "ON" : "OFF" %></span></div><img id="ModalPrintButton" src="<%= Page.ResolveUrl("~/Images/Modal_Print.png") %>" onclick="return printModal();" alt="Print" title="Print" /></span>
                <span id="modalTitle">Modal Title</span>
                <!-- modal iframe -->
                <iframe id="modalFrame" name="modalFrame" onload="_onModalLoaded();" frameborder="0"
                    src=""></iframe>
            </td>
            <td id="ModalTopRight">
                <img id="ModalCloseButton" src="<%= Page.ResolveUrl("~/Images/Modal_Close.gif") %>"
                    onclick="return hideModal();" alt="Close" title="Close" />
            </td>
        </tr>
        <tr>
            <td id="ModalBottomLeft">
                &nbsp;
            </td>
            <td id="ModalBottomRight">
                &nbsp;
            </td>
        </tr>
    </table>
</div>
