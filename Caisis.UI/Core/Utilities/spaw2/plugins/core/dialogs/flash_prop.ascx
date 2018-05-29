<%@ Control Language="C#" AutoEventWireup="true" CodeFile="flash_prop.ascx.cs" Inherits="spaw2_plugins_core_dialogs_flash_prop" %>
<table border="0" cellspacing="0" cellpadding="2" width="336">
<tr>
  <td><%=this.Language.GetMessage("source")%>:</td>
  <td colspan="3" nowrap><input type="text" name="csrc" id="csrc" class="input" size="32">&nbsp;<input type="button" value="..." onClick="SpawFlashPropDialog.browseClick()" class="bt"></td>
</tr>
<tr>
  <td><%=this.Language.GetMessage("width")%>:</td>
  <td nowrap>
    <input type="text" name="cwidth" id="cwidth" size="3" maxlength="3" class="input3chars">
  </td>
  <td><%=this.Language.GetMessage("height")%>:</td>
  <td nowrap>
    <input type="text" name="cheight" id="cheight" size="3" maxlength="3" class="input3chars">
  </td>
</tr>
<tr>
<td colspan="4" nowrap>
<hr width="100%">
</td>
</tr>
<tr>
<td colspan="4" align="right" valign="bottom" nowrap>
<input type="submit" value="<%=this.Language.GetMessage("ok")%>" onClick="SpawFlashPropDialog.okClick()" class="bt">
<input type="button" value="<%=this.Language.GetMessage("cancel")%>" onClick="SpawFlashPropDialog.cancelClick()" class="bt">
</td>
</tr>
</table>