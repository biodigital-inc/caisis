<%@ Control Language="C#" AutoEventWireup="true" CodeFile="image_prop.ascx.cs" Inherits="spaw2_plugins_core_dialogs_image_prop" %>
<table border="0" cellspacing="0" cellpadding="2">
<tr>
  <td rowspan="9" id="img_preview_box" valign="top" align="center" class="groupbox" width="210">
    <div id="img_preview_placeholder" style="padding: 0px 1px 0px 0px; margin: 0px; visibility: hidden; white-space:nowrap;">
      <img id="img_preview_sizer" src="img/spacer.gif" width="1px" alt="" /><img id="img_preview" src="img/spacer.gif" width="200" height="100" alt="" />
    </div>
    <div id="img_data" class="info_message" style="visibility: hidden;">
      <b><%=this.Language.GetMessage("dimensions")%>:</b><br />
      <span id="img_dimensions" class="info_message">&nbsp;</span><br />
      <a href="#" style="white-space: nowrap;" onclick="SpawImagePropDialog.resetDimensions();"><%=this.Language.GetMessage("reset_dimensions")%> &raquo;</a>
    </div>
  </td>
  <td rowspan="9">&nbsp;</td>
  <td align="right" nowrap><%=this.Language.GetMessage("source")%>:</td>
  <td colspan="3" nowrap><input type="text" name="csrc" id="csrc" class="input" size="32" onchange="SpawImagePropDialog.previewImage(this.value, 0);" />&nbsp;<input type="button" value="..." onClick="SpawImagePropDialog.imageBrowseClick()" class="bt"></td>
</tr>
<tr>
  <td align="right" nowrap><%=this.Language.GetMessage("alt")%>:</td>
  <td colspan="3"><input type="text" name="calt" id="calt" class="input" size="32"></td>
</tr>
<tr>
  <td align="right" nowrap><%=this.Language.GetMessage("title_attr")%>:</td>
  <td colspan="3"><input type="text" name="ctitle" id="ctitle" class="input" size="32"></td>
</tr>
<tr>
  <td align="right" nowrap><%=this.Language.GetMessage("width")%>:</td>
  <td colspan="3" align="left" nowrap>
    <input type="text" name="cwidth" id="cwidth" size="4" maxlength="5" class="input3chars" onchange="SpawImagePropDialog.widthChanged();" />
  <%=this.Language.GetMessage("height")%>:
    <input type="text" name="cheight" id="cheight" size="4" maxlength="5" class="input3chars" onchange="SpawImagePropDialog.heightChanged();" />
  </td>
</tr>
<tr>
  <td>&nbsp;</td>
  <td colspan="3"><input type="checkbox" name="cproportions" id="cproportions" checked="yes" onclick="SpawImagePropDialog.proportionsClick();" /> <%=this.Language.GetMessage("constrain_proportions")%></td>
</tr>
<tr>
  <td align="right" nowrap><%=this.Language.GetMessage("css_class")%>:</td>
  <td nowrap colspan="3">
    <select id="ccssclass" name="ccssclass" size="1" class="input" onchange="SpawImagePropDialog.cssClassChanged();" runat="server">
    </select>
  </td>
</tr>
<tr>
  <td align="right" nowrap><%=this.Language.GetMessage("align")%>:</td>
  <td align="left" colspan="3">
  <select name="calign" id="calign" size="1" class="input">
    <option value=""></option>
    <option value="left"><%=this.Language.GetMessage("left")%></option>
    <option value="right"><%=this.Language.GetMessage("right")%></option>
    <option value="top"><%=this.Language.GetMessage("top")%></option>
    <option value="middle"><%=this.Language.GetMessage("middle")%></option>
    <option value="bottom"><%=this.Language.GetMessage("bottom")%></option>
    <option value="absmiddle"><%=this.Language.GetMessage("absmiddle")%></option>
    <option value="texttop"><%=this.Language.GetMessage("texttop")%></option>
    <option value="baseline"><%=this.Language.GetMessage("baseline")%></option>
  </select>
  </td>
</tr>
<tr>
  <td align="right" nowrap><%=this.Language.GetMessage("border")%>:</td>
  <td align="left"><input type="text" name="cborder" id="cborder" class="input3chars"></td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr>
  <td align="right" nowrap><%=this.Language.GetMessage("hspace")%>:</td>
  <td colspan="3" nowrap>
    <input type="text" name="chspace" id="chspace" size="3" maxlength="3" class="input3chars">
    <%=this.Language.GetMessage("vspace")%>:
    <input type="text" name="cvspace" id="cvspace" size="3" maxlength="3" class="input3chars">
  </td>
</tr>
</table>
<table border="0" cellspacing="0" cellpadding="2" width="100%">
<tr>
<td nowrap>
<hr width="100%">
</td>
</tr>
<tr>
<td align="right" valign="bottom" nowrap>
<input type="submit" value="<%=this.Language.GetMessage("ok")%>" onClick="SpawImagePropDialog.okClick()" class="bt">
<input type="button" value="<%=this.Language.GetMessage("cancel")%>" onClick="SpawImagePropDialog.cancelClick()" class="bt">
</td>
</tr>
</table>
