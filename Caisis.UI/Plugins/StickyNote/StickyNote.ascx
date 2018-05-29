<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StickyNote.ascx.cs" Inherits="Caisis.UI.Plugins.Plugins_StickyNote_StickyNote" %>


<script type="text/javascript" language="javascript">
function showStickyNote()
{
    $('StickyNoteIframe').src = '../../Plugins/StickyNote/NotesPage.aspx' + urlString;
    
    var subLayer = $('StickyNoteLayer');
    MM_showHideLayers('StickyNoteLayer','','show');
    subLayer.style.display = 'block';
    subLayer.center();
}
function closeSticky()
{
    $('StickyNoteIframe').src = ''; 
    MM_showHideLayers('StickyNoteLayer','','hide');
}
</script>

<div id="SubLinkButtonDiv" runat="server" class="patientDataFormDiv" style="z-index: 10; display: block; visibility: visible; overflow: auto; position: absolute; right: 5px; top: 10px; ">
    <a onclick="showStickyNote();" href="javascript:;"  class="PDSublinkTextWData">
        <asp:Image ID="StickyNoteIcon"  ImageUrl="../../Images/icon_Excel.gif" runat="server" />
    </a> 
</div>

<div id="StickyNoteLayer" class="patientDataFormDiv" style="top: 0px; position: absolute;
    width: 421px; height: 440px; z-index: 1000; display: block; visibility: hidden;
    overflow: hidden; position: absolute; background-image: url(../../Plugins/StickyNote/Images/Sticky_BG.png);
    background-repeat: no-repeat; padding-left: 14px; padding-top: 20px;">
    <img style="position:absolute; top: 18px; right:34px; cursor:pointer; z-index: 20;" src="../../Plugins/StickyNote/Images/StickyClose.gif" border="0"  onclick="closeSticky();" alt="Close Note" title="Close Note" />
    <iframe id="StickyNoteIframe" height="375" width="375" frameborder="0" scrolling="no" src=""></iframe>
</div>
