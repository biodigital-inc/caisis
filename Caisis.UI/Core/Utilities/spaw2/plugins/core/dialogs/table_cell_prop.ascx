<%@ Control Language="C#" AutoEventWireup="true" CodeFile="table_cell_prop.ascx.cs" Inherits="spaw2_plugins_core_dialogs_table_cell_prop" %>
<table border="0" cellspacing="0" cellpadding="2" width="336">
<tr>
  <td nowrap><%=this.Language.GetMessage("css_class")%>:</td>
  <td nowrap colspan="3">
    <select id="ccssclass" name="ccssclass" size="1" class="input" onchange="SpawTableCellPropDialog.cssClassChanged();" runat="server">
    </select>
  </td>
</tr>
<tr>
  <td colspan="2"><%=this.Language.GetMessage("horizontal_align")%>:</td>
  <td colspan="2" align="right"><input type="hidden" name="chalign" id="chalign">
  <img id="ha_left" src="<%=this.theme_path + "img/"%>tb_justifyleft.gif" class="buttonOff" onClick="SpawTableCellPropDialog.setHAlign('left');" alt="<%=this.Language.GetMessage("left")%>">
  <img id="ha_center" src="<%=this.theme_path + "img/"%>tb_justifycenter.gif" class="buttonOff" onClick="SpawTableCellPropDialog.setHAlign('center');" alt="<%=this.Language.GetMessage("center")%>">
  <img id="ha_right" src="<%=this.theme_path + "img/"%>tb_justifyright.gif" class="buttonOff" onClick="SpawTableCellPropDialog.setHAlign('right');" alt="<%=this.Language.GetMessage("right")%>">
  </td>
</tr>
<tr>
  <td colspan="2"><%=this.Language.GetMessage("vertical_align")%>:</td>
  <td colspan="2" align="right"><input type="hidden" name="cvalign" id="cvalign">
  <img id="ha_top" src="<%=this.theme_path + "img/"%>tb_top.gif" class="buttonOff" onClick="SpawTableCellPropDialog.setVAlign('top');" alt="<%=this.Language.GetMessage("top")%>">
  <img id="ha_middle" src="<%=this.theme_path + "img/"%>tb_middle.gif" class="buttonOff" onClick="SpawTableCellPropDialog.setVAlign('middle');" alt="<%=this.Language.GetMessage("middle")%>">
  <img id="ha_bottom" src="<%=this.theme_path + "img/"%>tb_bottom.gif" class="buttonOff" onClick="SpawTableCellPropDialog.setVAlign('bottom');" alt="<%=this.Language.GetMessage("bottom")%>">
  <img id="ha_baseline" src="<%=this.theme_path + "img/"%>tb_baseline.gif" class="buttonOff" onClick="SpawTableCellPropDialog.setVAlign('baseline');" alt="<%=this.Language.GetMessage("baseline")%>">
  </td>
</tr>
<tr>
  <td><%=this.Language.GetMessage("width")%>:</td>
  <td nowrap>
    <input type="text" name="cwidth" id="cwidth" size="3" maxlength="3" class="input3chars">
    <select size="1" name="cwunits" id="cwunits" class="input">
      <option value="%">%</option>
      <option value="px">px</option>
    </select>
  </td>
  <td><%=this.Language.GetMessage("height")%>:</td>
  <td nowrap>
    <input type="text" name="cheight" id="cheight" size="3" maxlength="3" class="input3chars">
    <select size="1" name="chunits" id="chunits" class="input">
      <option value="%">%</option>
      <option value="px">px</option>
    </select>
  </td>
</tr>
<tr>
  <td nowrap><%=this.Language.GetMessage("no_wrap")%>:</td>
  <td nowrap>
    <input type="checkbox" name="cnowrap" id="cnowrap">
  </td>
  <td colspan="2">&nbsp;</td>
</tr>
<tr>
  <td colspan="4"><%=this.Language.GetMessage("bg_color")%>: <img src="img/spacer.gif" id="color_sample" border="1" width="30" height="18" align="absbottom">&nbsp;<input type="text" name="cbgcolor" id="cbgcolor" size="7" maxlength="7" class="input7chars" onKeyUp="SpawTableCellPropDialog.setSample()">&nbsp;
  <input type="button" id="ccolorpicker" onClick="SpawTableCellPropDialog.showColorPicker(cbgcolor.value)" align="absbottom" value="..." class="bt" />
  </td>
</tr>
<tr>
  <td colspan="4">
	<%=this.Language.GetMessage("background")%>: <input type="text" name="cbackground" id="cbackground" size="20" class="input" >&nbsp;<input type="button" id="cimg_picker" onClick="SpawTableCellPropDialog.showImgPicker();" align="absbottom" class="bt" value="..." />	
  </td>
</tr>
<tr>
<td colspan="4" nowrap>
<hr width="100%">
</td>
</tr>
<tr>
<td colspan="4" align="right" valign="bottom" nowrap>
<input type="submit" value="<%=this.Language.GetMessage("ok")%>" onClick="SpawTableCellPropDialog.okClick()" class="bt">
<input type="button" value="<%=this.Language.GetMessage("cancel")%>" onClick="SpawTableCellPropDialog.cancelClick()" class="bt">
</td>
</tr>
</table>
