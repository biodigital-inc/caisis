<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dialog.aspx.cs" Inherits="Solmetra.Spaw2.spaw2_dialogs_dialog" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SPAW Editor v.2:</title>

<script type="text/javascript" src="../js/spaw.js.aspx"></script>
<script type="text/javascript">
<!--
function SpawDialog()
{
}
SpawDialog.resizeDialogToContent = function()
{
  if (window.sizeToContent)
  {
    // gecko
    window.sizeToContent();
  }
  else
  {
    // resize window so there are no scrollbars visible
    if (!spawEditor._dialog_chrome_width)
    {
      // do these calculations only once for each spaw instance on a page
      window.resizeTo(600, 500);
      spawEditor._dialog_chrome_width = 600 - document.body.clientWidth;
      spawEditor._dialog_chrome_height = 500 - document.body.clientHeight;
    }
    window.resizeTo(50, 40);
    window.resizeTo(document.body.scrollWidth + spawEditor._dialog_chrome_width, document.body.scrollHeight + spawEditor._dialog_chrome_height);
    
  }
}

var spawArgs;
var spawEditor;
var spawArguments;

SpawDialog.dialogInit = function()
{
  if (window.opener)
  {
    spawArgs = window.opener.dialogArguments;
    if (spawArgs == null)
      window.close();
    spawEditor = spawArgs.editor;
    spawArguments = spawArgs.arguments;
  }

  if (window.history.length == 0 || (window.sizeToContent && window.history.length == 1 /* Gecko */) || (navigator.vendor && navigator.vendor.indexOf('Apple')>-1 && window.history.length == 1) /* Safari */) // no need to resize and center on reloads
  {
    SpawDialog.resizeDialogToContent();
    // center according to new dimensions
    window.moveTo(screen.availWidth/2 - document.body.clientWidth/2, screen.availHeight/2 - document.body.clientHeight/2);
  }
}

SpawDialog.returnValue = function(result)
{
  if (spawArgs.callback)
  {
    eval('window.opener.'+spawArgs.callback + '(spawEditor, result, spawArgs.tbi, spawArgs.sender)');
  }
}
//-->
</script>
</head>
<body id="dialogBody" runat="server">
<asp:PlaceHolder ID="DialogHeader" runat="server" />
    <form id="form1" enctype="multipart/form-data" runat="server">
    <asp:PlaceHolder ID="DialogContent" runat="server">
    </asp:PlaceHolder>
    </form>
<asp:PlaceHolder ID="DialogFooter" runat="server" />
</body>
</html>
