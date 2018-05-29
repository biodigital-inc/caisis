<%@ Page EnableViewState=false  language="c#" Inherits="Caisis.UI.Core.Eforms.ValidateEForm" CodeFile="ValidateEForm.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.EFormBasePage" %>
<asp:Literal id="doctypeBreaker" runat="server"><!-- Set IE to quirks mode --></asp:Literal>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title></title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1" />
    <meta name="CODE_LANGUAGE" Content="C#" />
    <meta name=vs_defaultClientScript content="JavaScript" />
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5" />
  	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script><!-- handles comboboxes, interpretated date, and calculator keypad -->
    <script src="../../ClientScripts/EFormScripts.js" type="text/javascript"></script>
    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
	<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="../../ClientScripts/jQuery.js" type="text/javascript"></script>
	<link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" /><!-- need global styles for combo box -->
	<link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">

        jQuery.noConflict();

		var tableArray = new Array();
		
		function showFirstAdditionalRow(linkReference, tableId) {
			var rowShown = false;
			var hideWidget = true;
			var table = document.getElementById(tableId);
			for (i = 0; i < table.rows.length; i++) {
				var row = table.rows[i];
				if (rowShown == false && row.style['display'] == 'none') {
					row.style['display'] = '';
					rowShown = true;
				} else if (rowShown == true && row.style['display'] == 'none') {
					hideWidget = false;
				}
			}
			
			if (hideWidget) {
				linkReference.style['display'] = 'none';
			}
			return false;
		}
	</script>
	
	<style type="text/css">
    span.pdFormFieldLabel {
        display: none;
    }
    </style>
  </head>
  <body bgcolor="#004256">
	
      <form id="dataForm" name="dataForm" method="post" runat="server">
          <table cellpadding="0" cellspacing="0" border="0" width="100%" bgcolor="#004256">
              <tr>
                  <td align="center" valign="middle" height="540">
                      <table width="851" border="0" cellspacing="0" cellpadding="0" align="center" class="eformValidationBG">
                          <tr>
                              <td height="30" valign="bottom" align="center">
                                  <asp:Label ID="valMsg" CssClass="ListManTitle" runat="server"></asp:Label></td>
                          </tr>
                          <tr>
                              <td>
                                  <img src="../../Images/shim.gif" width="10" height="8" /></td>
                          </tr>
                          <tr>
                              <td height="360" align="center">
                                  <div style="width: 820px; height: 330px; overflow: auto; position: relative;">
                                      <table width="800" height="300" border="0" cellpadding="0" cellspacing="0" bgcolor="#f2f3f5">
                                          <tr>
                                              <td>
                                                  <img src="../../Images/shim.gif" height="1" width="800" border="0" /></td>
                                          </tr>
                                          <tr>
                                              <td valign="top" align="left">
                                                  <asp:PlaceHolder ID="holder" runat="server"></asp:PlaceHolder>
                                              </td>
                                          </tr>
                                      </table>
                                  </div>
                                  <!-- <br/><asp:Literal ID="debugOut" Runat=server></asp:Literal>  -->
                              </td>
                          </tr>
                          <tr>
                              <td align="right">
                                  <a href="" id="returnLink" runat="server">
                                      <img src="../../Images/ReturnToEformBlue.gif" border="0" align="left" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <asp:ImageButton ID="SaveBtn" runat="server" ImageAlign="AbsMiddle" ImageUrl="../../Images/SaveBold.gif">
                                  </asp:ImageButton><img src="../../Images/shim.gif" height="1" width="130" border="0" />
                                  <br />
                                  <br />
                              </td>
                          </tr>
                      </table>
                  </td>
              </tr>
          </table>
      </form>
      <div id="PopupDiv" style="position: absolute; left: 312px; top: 59px; width: 466px;
          height: 390px; z-index: -1; visibility: hidden;">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                  <td>
                      <img src="Images/CloseSmall.gif" width="38" height="8" hspace="0" vspace="0" class="ClickableImage"
                          title="Click here to close." onclick="MM_showHideLayers('ExistingRecordDiv','','hide')"
                          align="right" /></td>
              </tr>
              <tr>
                  <td height="20">
                      <iframe scrolling="no" frameborder="0" style="border: solid 3px #8d2a2c;" id="PopupFrame"
                          height="380" width="100%"></iframe>
                  </td>
              </tr>
          </table>
      </div>
     <!-- data checker; should be at the bottom of eform edit -->
	<script type="text/javascript">
	    function checkPopulated(cell) {
	        for (k = 0; k < cell.childNodes.length; k++) {
	            node = cell.childNodes[k];

	            if (node.nodeName == 'SELECT') {
	                if (node.selectedIndex > 0) {
	                    return true;
	                }
	            } else if (node.nodeName == 'INPUT') {
	                type = node.getAttribute('type');
	                if (type == 'checkbox' || type == 'radio') {
	                    if (node.checked) {
	                        return true;
	                    }
	                } else if (type != 'hidden') {
	                    if (node.value != null && node.value != '') {
	                        return true;
	                    }
	                }
	            } else if (node.nodeName == 'TEXTAREA') {
	                if (node.value != null && node.value != '') {
	                    return true;
	                }
	            } else if (node.nodeName == 'TABLE') {

	                if (proccessTable(node))
	                    return true;

	            }
	        }

	        return false;
	    }

	    function proccessTable(node) {

	        if (node.id != null && node.id != "undefined" && node.id != '') {
	            var tbl = document.getElementById(node.id);
	            var populated = false;
	            for (var j = 0; j < tbl.rows.length; j++) {
	                var row = tbl.rows[j];
	                for (var i = 0; i < row.cells.length; i++) {
	                    var cell = row.cells[i];
	                    if (cell.hasChildNodes()) {
	                        for (var k = 0; k < cell.childNodes.length; k++) {
	                            var node2 = cell.childNodes[k];

	                            if (node2.nodeName == 'SELECT') {
	                                if (node2.selectedIndex > 0) {
	                                    populated = true;
	                                    break;
	                                }
	                            }
	                            else if (node2.nodeName == 'INPUT') {
	                                var type2 = node2.getAttribute('type');
	                                if (type2 == 'checkbox' || type2 == 'radio') {
	                                    if (node2.checked) {
	                                        populated = true;
	                                        break;
	                                    }
	                                } else if (type2 != 'hidden') {
	                                    if (node2.value != null && node2.value != '') {
	                                        populated = true;
	                                        break;
	                                    }
	                                }
	                            }
	                            else if (node2.nodeName == 'TEXTAREA') {
	                                if (node2.value != null && node2.value != '') {
	                                    populated = true;
	                                    break;
	                                }
	                            }
	                            else if (node2.nodeName == 'TABLE') {
	                                if (proccessTable(node2))
	                                    populated = true;
	                                break;
	                            }
	                        }
	                    }
	                    if (populated) {
	                        break;
	                    }
	                }
	                if (populated) {
	                    break;
	                }
	            }
	            if (populated) {
	                return true;
	            }
	        }
	        else {
	            return false;
	        }

	    }

	    function showRowIfPopulated(row) {
	        var populated = false;

	        for (i = 0; i < row.cells.length; i++) {
	            var cell = row.cells[i];
	            if (cell.hasChildNodes()) {
	                if (checkPopulated(cell)) {
	                    populated = true;
	                    break;
	                }
	            }
	        }

	        if (populated) {
	            row.style['display'] = '';
	        }
	    }

	    for (var el in tableArray) {
	        var tbl = document.getElementById(el);
	        for (j = 0; j < tbl.rows.length; j++) {
	            showRowIfPopulated(tbl.rows[j]);
	        }
	    }

	</script>
  </body>
</html>
