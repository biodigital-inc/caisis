<%@ Page language="c#" Inherits="Caisis.UI.Core.Eforms.EFormUpdateElement" CodeFile="EFormUpdateElement.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.EFormBasePage" EnableViewState="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>Update Eform Data Element</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
	
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script><!-- handles comboboxes, interpretated date: must come before other js files -->
	<script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    <script src="../../ClientScripts/EFormScripts.js" type="text/javascript"></script>
    <script src="../../ClientScripts/jQuery.js" type="text/javascript"></script>
	<link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" /><!-- need global styles for combo box -->
	<link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
	<script  type="text/javascript">

    jQuery.noConflict();

	function LoadDataEntryForm(table, id, fields, anchorname)
	{
	    var callWindow = top.getModalCallingWindow();
		    
	    if (callWindow != null)
	    {
	    	callWindow.LoadDataEntryForm(table, id, fields, anchorname);
	    }
	}
	
	function closeUpdateElement()
	{
	    top.hideModal();
	}
	
	function closeAfterSave()
	{
	    var callWindow = top.getModalCallingWindow();
		    
	    if (callWindow != null)
	    {
	    	    callWindow.reloadDataIframe();
	    }
	    closeUpdateElement();
	}
	
	
	
	
function findPos(obj) {
	var curleft = curtop = 0;

	if (obj.offsetParent) {
		do {
			curleft += obj.offsetLeft;
			curtop += obj.offsetTop;
		} while (obj = obj.offsetParent);
	}

	return({
		'x': curleft,
		'y': curtop
	});
}
	
	
function showEFormBubbleMsg(msg, show, recordDataHtmlCell) {

    alert(recordDataHtmlCell.innerHTML);

    var dataBubble = $('EFormInfoBubble');
    var dataBubbleContentContainer = $('EFormInfoBubbleContent');
    if (show) {
        dataBubbleContentContainer.innerHTML = msg;
        dataBubble.style.top = ((findPos(recordDataHtmlCell).y - 0) + 'px');
        dataBubble.style.left = ((findPos(recordDataHtmlCell).x - 240) + 'px');
        dataBubble.style.display = 'block';
    }
    else {
        dataBubble.style.display = 'none';
    }
}


    var iPad =  navigator.appVersion.indexOf("iPad") > -1 ? true : false;
    
    
	</script>
	
	<style type="text/css">
span.pdFormFieldLabel {
    display: none;
}
</style>
  </head>
  
  <!-- TODO: will probably need to pass back eform name -->
  <body id="Body" runat="server">
	
  <form id="dataForm"  name="dataForm" method="post" runat="server">
  

	<input type="hidden" id="reportHolder" runat="server">
	<div id="reportContainer" runat="server"></div>
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
<%--	<tr>
	<td class="EFormPopupTitleCell" height="23"><img src="../../Images/CloseSmall.gif" width="38" height="8" vspace="3" hspace="30" align="right" style="cursor: pointer;" onClick="parent.ClosePopup();" />Update EForm Section</td>
	</tr>--%>
    <tr>
      <td align="center" valign="middle"> 
			<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td colspan="3"><img src="../../Images/shim.gif" width="10" height="8"></td>
				</tr>
				<tr>
					<td><img src="../../Images/shim.gif" width="20"></td>
					<td align="center" valign="top">
							<div id="EFormScrollingDiv" style="height:310px; overflow: auto; position: relative;">
							<script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
							<table width="90%" border="0" cellpadding="0" cellspacing="0" bgcolor="#f2f3f5">
								<tr>
									<td><img src="../../Images/shim.gif" height="1" width="740" border="0" /></td>
								</tr>
								<tr>
									<td valign="top" align="left">
										<asp:PlaceHolder ID="holder" Runat="server"></asp:PlaceHolder>
									</td>
								</tr>
							
							</table>
							</div>
						</td>
						<td><img src="../../Images/shim.gif" width="20"></td>
				</tr>
				<tr>
					<td colspan="3"><img src="../../Images/shim.gif" width="1" height="10"></td>
				</tr>
				<tr>
					<td colspan="3" align="center" valign="bottom"><img src="../../Images/CancelOnWhite.gif" width="61" height="25" hspace="30" style="cursor:pointer;" align="absmiddle"  onclick="closeUpdateElement();" /><img src="../../Images/shim.gif" height="1" width="20" border="0" /><asp:ImageButton  ID="SaveBtn" Runat="server"  ImageAlign="AbsMiddle"  ImageUrl="../../Images/SaveAndClose.gif" ></asp:ImageButton></td>
				</tr>	
			</table>
		</td>
	</tr>
	</table>
		
		
		
		
		


    <%-- EditEFormInfoBubble --%>
    <div id="EFormInfoBubbleContainer">
        <div id="EFormInfoBubble" class="EFormInfoBubble">
            <div id="EFormInfoBubbleContent" class="EFormInfoBubbleContent">
                <%-- when showing the bubble, copy the content into this div --%>
                <table>
                    <tr>
                        <td>
                            field name
                        </td>
                        <td>
                            field value
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>




		
		
		
		
		
     </form>
	<script language="javascript">
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
				}
			}
			
			return false;
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
		
		$('EFormScrollingDiv').style.height = getHeight(window) - 75 + 'px';
		
		
	</script>
  </body>
</html>