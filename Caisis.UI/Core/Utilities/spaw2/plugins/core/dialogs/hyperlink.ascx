<%@ Control Language="C#" AutoEventWireup="true" CodeFile="hyperlink.ascx.cs" Inherits="spaw2_plugins_core_dialogs_hyperlink" %>
<script type="text/javascript" src="<%=Solmetra.Spaw2.Configuration.SpawDirectory %>plugins/core/dialogs/hyperlink.js"></script>

<table border="0" cellpadding="0" cellspacing="0" id="prop_table">
<tr>
<td valign="top" align="left">
<table border="0" cellpadding="2" cellspacing="0">
<tr>
  <td width="50%"><%=this.Language.GetMessage("a_type")%>:</td>
  <td width="50%">
  <select name="catype" id="catype" size="1" class="input" onchange="SpawHyperlinkDialog.changeType(this.options[this.selectedIndex].value);">
  	<option value="link"><%=this.Language.GetMessage("type_link")%></option>
  	<option value="anchor"><%=this.Language.GetMessage("type_anchor")%></option>
  	<option value="link2anchor"><%=this.Language.GetMessage("type_link2anchor")%></option>
  </select>
  </td>
</tr>
<tr id="url_row">
  <td width="50%"><%=this.Language.GetMessage("url")%>:</td>
  <td width="50%" nowrap><input type="text" name="chref" id="chref" class="input" size="32">&nbsp;<input type="button" value="..." onClick="SpawHyperlinkDialog.browseClick()" class="bt"></td>
</tr>
<tr id="quick_link_row" runat="server">
  <td width="50%"><%=this.Language.GetMessage("quick_links")%>:</td>
  <td width="50%" align="left">
  <select name="cquicklinks" id="cquicklinks" size="1" class="input" onchange="SpawHyperlinkDialog.changeQuickLink(this.options[this.selectedIndex].value);" style="width: 50px;" runat="server">
    <option value=""></option>
  </select>
  </td>
</tr>

<tr id="name_row">
  <td width="50%"><%=this.Language.GetMessage("name")%>:</td>
  <td width="50%"><input type="text" name="cname" id="cname" class="input" size="32"></td>
</tr>
<tr id="anchor_row">
  <td width="50%"><%=this.Language.GetMessage("anchors")%>:</td>
  <td width="50%">
  <select name="canchor" id="canchor" size="1" class="input">
  	<option></option>
  </select>
  </td>
</tr>
<tr id="target_row">
  <td width="50%"><%=this.Language.GetMessage("target")%>:</td>
  <td width="50%" align="left">
  <select name="ctarget" id="ctarget" size="1" class="input" runat="server">
  </select>
  </td>
</tr>
<tr id="title_row">
  <td width="50%"><%=this.Language.GetMessage("title_attr")%>:</td>
  <td width="50%" align="left">
    <input type="text" name="ctitle" id="ctitle" size="32" class="input">
  </td>
</tr>
</table>
</td>
</tr>
</table>
<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td nowrap>
<hr width="100%">
</td>
</tr>
<tr>
<td align="right" valign="bottom" nowrap>
<input type="submit" value="<%=this.Language.GetMessage("ok")%>" onClick="SpawHyperlinkDialog.okClick()" class="bt">
<input type="button" value="<%=this.Language.GetMessage("cancel")%>" onClick="SpawHyperlinkDialog.cancelClick()" class="bt">
</td>
</tr>
</table>
