<%@ Control Language="C#" AutoEventWireup="true" CodeFile="spawfm.ascx.cs" Inherits="spaw2_plugins_spawfm_dialogs_spawfm" %>
<input type="hidden" name="delete_file" value="" />
<input type="hidden" name="new_folder" value="" />
<input type="hidden" name="rename_from" value="" />
<input type="hidden" name="rename_to" value="" />
<input type="hidden" name="subdir" value="removed PHP code" />
<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
  <td nowrap="nowrap" colspan="2" style="border-bottom: 1px solid #000000;">
    <table border="0" cellpadding="2" cellspacing="0" width="550">
    <tr>
      <td valign="middle" nowrap="nowrap" width="350">
        <select name="dir" id="dir" style="width: 350px;" onchange="document.forms[0].submit()" runat="server">
        </select>
      </td>
      <td valign="middle" nowrap="nowrap">
        <input id="go_up_button" type="image" src="../img/btn_up.gif" class="bt" style="width: 24px; height: 24px; margin: 1px;" runat="server" />
        <input id="create_dir_button" type="image" class="bt" style="width: 24px; height: 24px; margin: 1px;" runat="server" />
      </td>
      <td valign="middle" nowrap="nowrap" align="right">
        &nbsp;
        <select name="type" id="type" style="width: 150px;" onchange="document.forms[0].submit()" runat="server">
        </select>
      </td>
      <td valign="middle" align="right" nowrap="nowrap">
        <!-- 
        &nbsp;
        -->
      </td>
    </tr>
    </table>
  </td>
</tr>
<tr>
  <td nowrap="nowrap" style="border-right: 1px solid #000000; border-bottom: 1px solid #000000;" width="90%">
    <div id="file_list">
      <div id="details_header">
        <div id="details_name" class="details_header_col"><%=this.Language.GetMessage("file_details", "name") %></div>
        <div id="details_size" class="details_header_col"><%=this.Language.GetMessage("file_details", "size") %></div>
        <div id="details_type" class="details_header_col"><%=this.Language.GetMessage("file_details", "type") %></div>
        <div id="details_date" class="details_header_col"><%=this.Language.GetMessage("file_details", "date") %></div>
      </div>
      <iframe src="../empty/empty.html?<%=DateTime.Now.Ticks.ToString()%>" id="dir_cont" onload="SpawFm.initIframe();" name="dir_cont" scrolling="auto" width="100%" height="100%" frameborder="0"></iframe>
    </div>
  </td>
  <td width="180" nowrap="nowrap" valign="top" style="border-bottom: 1px solid #000000;">
    <div id="file_details"></div>
  </td>
</tr>
<tr>
  <td colspan="2" nowrap="nowrap" style="border-bottom: 1px solid #000000;">
    <input type="button" name="delete_button" value="<%=this.Language.GetMessage("buttons", "delete")%>" class="bt" disabled="disabled" onclick="SpawFm.deleteClick()" />
    <input type="button" name="rename_button" value="<%=this.Language.GetMessage("buttons", "rename")%>" class="bt" disabled="disabled" onclick="SpawFm.renameClick()" />
<!-- removed PHP code -->
    &nbsp;
    <input type="file" id="upload_file" name="upload_file" class="input" runat="server" />
    <input type="submit" name="upload_button" value="<%=this.Language.GetMessage("buttons", "upload")%>" class="bt" />
  </td>
</tr>
<tr>
  <td align="left" valign="top" style="padding: 5px;">
    <div id="error"><%=this.ErrorMsg %></div>
  </td>
  <td align="right" valign="bottom" nowrap="nowrap" style="padding: 5px;">
    <input type="button" name="ok_button" value="<%=this.Language.GetMessage("buttons", "ok")%>" onClick="SpawFm.okClick()" class="bt" disabled="disabled" />
    <input type="button" name="cancel_button" value="<%=this.Language.GetMessage("buttons", "cancel")%>" onClick="SpawFm.cancelClick()" class="bt" />
  </td>
</tr>
</table>
