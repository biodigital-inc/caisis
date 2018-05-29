<%@ Control Language="C#" AutoEventWireup="true" CodeFile="table_prop.ascx.cs" Inherits="spaw2_plugins_core_dialogs_table_prop" %>
<table border="0" cellspacing="0" cellpadding="2" width="336">
<tr>
  <td><%=this.Language.GetMessage("rows")%>:</td>
  <td><input type="text" name="trows" id="trows" size="3" maxlength="3" class="input3chars"></td>
  <td><%=this.Language.GetMessage("columns")%>:</td>
  <td><input type="text" name="tcols" id="tcols" size="3" maxlenght="3" class="input3chars"></td>
</tr>
<tr>
  <td><%=this.Language.GetMessage("css_class")%>:</td>
  <td colspan="3">
    <select id="tcssclass" name="tcssclass" size="1" class="input" onchange="SpawTablePropDialog.cssClassChanged();" runat="server">
    </select>
  </td>
</tr>
<tr>
  <td><%=this.Language.GetMessage("width")%>:</td>
  <td nowrap>
    <input type="text" name="twidth" id="twidth" size="3" maxlenght="3" class="input3chars">
    <select size="1" name="twunits" id="twunits" class="input">
      <option value="%">%</option>
      <option value="px">px</option>
    </select>
  </td>
  <td><%=this.Language.GetMessage("height")%>:</td>
  <td nowrap>
    <input type="text" name="theight" id="theight" size="3" maxlenght="3" class="input3chars">
    <select size="1" name="thunits" id="thunits" class="input">
      <option value="%">%</option>
      <option value="px">px</option>
    </select>
  </td>
</tr>
<tr>
  <td><%=this.Language.GetMessage("border")%>:</td>
  <td colspan="3"><input type="text" name="tborder" id="tborder" size="2" maxlenght="2" class="input3chars"> <%=this.Language.GetMessage("pixels")%></td>
</tr>
<tr>
  <td><%=this.Language.GetMessage("cellpadding")%>:</td>
  <td><input type="text" name="tcpad" id="tcpad" size="3" maxlenght="3" class="input3chars"></td>
  <td><%=this.Language.GetMessage("cellspacing")%>:</td>
  <td><input type="text" name="tcspc" id="tcspc" size="3" maxlenght="3" class="input3chars"></td>
</tr>
<tr>
  <td colspan="4"><%=this.Language.GetMessage("bg_color")%>: <img src="img/spacer.gif" id="color_sample" border="1" width="30" height="18" align="absmiddle">&nbsp;<input type="text" name="tbgcolor" id="tbgcolor" size="7" maxlenght="7" class="input7chars" onKeyUp="setSample()" align="absmiddle">
  <input type="button" id="tcolorpicker" border="0" onClick="SpawTablePropDialog.showColorPicker(tbgcolor.value)" align="absbottom" value="..." class="bt" align="absmiddle">
  </td>
</tr>
<tr>
  <td colspan="4">
	<%=this.Language.GetMessage("background")%>: <input type="text" name="tbackground" id="tbackground" size="20" class="input" >&nbsp;<input type="button" id="timg_picker" onClick="SpawTablePropDialog.showImgPicker();" value="..." class="bt" align="absmiddle">	
  </td>
</tr>
<tr>
<td colspan="4" nowrap>
<hr width="100%">
</td>
</tr>
<tr>
<td colspan="4" align="right" valign="bottom" nowrap>
<input type="submit" value="<%=this.Language.GetMessage("ok")%>" onClick="SpawTablePropDialog.okClick()" class="bt">
<input type="button" value="<%=this.Language.GetMessage("cancel")%>" onClick="SpawTablePropDialog.cancelClick()" class="bt">
</td>
</tr>
</table>
