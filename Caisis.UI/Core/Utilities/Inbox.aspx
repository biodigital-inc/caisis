<%@ Reference Page="~/Core/Utilities/InboxMessages.aspx" %>
<%@ Page language="c#" Inherits="Caisis.UI.Core.Utilities.Inbox" CodeFile="Inbox.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>FormsContainer</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
	<LINK href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
	<script src="../../ClientScripts/PatientData.js" type="text/javascript"></script>
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>


<script language="JavaScript" type="text/JavaScript">


function CheckIsIE() 
{ 
    if  (navigator.appName.toUpperCase() == 'MICROSOFT INTERNET EXPLORER')
		{ return true;} 
    else { return false; } 
} 

function printForm() 
  { 
     if (CheckIsIE() == true) 
      { 
         document.InboxMessages.focus(); 
         document.InboxMessages.print(); 
      }      
      else 
       { 
          window.frames['InboxMessages'].focus(); 
          window.frames['InboxMessages'].print(); 
       } 
   } 


function setNumMessages(num){
	document.getElementById('numMessages').innerHTML = num;
}




//-->
</script>
	
  </head>
  <body>
  	<table width="940" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
  	<td>
	<table width="820" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td colspan="4" class="ListManTitle"><br/><br/>Inbox: You have <span id="numMessages">no</span> messages</td>
			<td valign="bottom" align="right"><a href="javascript:printForm();"><img id="printFormButton" src="../../Images/PrintInbox.gif" width="115" height="23" border="0" hspace="30"  runat="server"/></a></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="6"><img src="../../Images/shim.gif" width="10" height="8"></td>
		</tr>
		<tr>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerTopLeft.gif" width="5" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="10" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="20" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="420" height="5"></td>
			<td class="ListManagerBGTableTop"><img src="../../Images/shim.gif" width="360" height="5"></td>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerTopRight.gif" width="5" height="5"></td>
		</tr>
		<tr>
			<td class="ListManBGTableLeftSide"><img src="../Images/shim.gif" width="1" height="1"></td>
			<td colspan="4" class="ListManBGTableBody"><img src="../Images/shim.gif" width="10" height="8"></td>
			<td class="ListManBGTableRightSide"><img src="../Images/shim.gif" width="1" height="1"></td>
		</tr>
		<tr>
			<td class="ListManBGTableLeftSide"><img src="../Images/shim.gif" width="1" height="1"></td>
			<td colspan="4" class="ListManBGTableBody"><img src="../Images/shim.gif" width="10" height="8"></td>
			<td class="ListManBGTableRightSide"><img src="../Images/shim.gif" width="1" height="1"></td>
		</tr>
		<form id="InboxForm" Runat="server">
		<tr>
			<td height="415" class="ListManBGTableLeftSide">&nbsp;</td>
			<td colspan="2" class="ListManBGTableBody">&nbsp;</td>
			<td colspan="2" valign="top" class="ListManBGTableBody" ><strong>Click on a message below to view more.</strong>
			<img src="../Images/shim.gif" width="220" height="1"  class="ListManBGTableBody" ><strong>eform status:&nbsp;</strong><asp:DropDownList AutoPostBack=True Width="165" Rows="1" ID="InboxMsgType" Runat="server"></asp:DropDownList>
			<br/><br/>
			
			<iframe id="InboxMessages" name="FormsContent" runat="server" src="InboxMessages.aspx" width="750" height="375" scrolling="auto" frameborder="0"></iframe>
			
			</td>
			<td class="ListManBGTableRightSide">&nbsp;</td>
		</tr>
		</form>
		<tr>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomLeft.gif" width="5" height="5"></td>
			<td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="10" height="5"></td>
			<td class="ListManagerBGTableBottom"><img src="../../Images/shim.gif" width="20" height="5"></td>
			<td colspan="2" class="ListManagerBGTableBottom"><img src="../Images/shim.gif" width="1" height="1"></td>
			<td bgcolor="#f1f7fc"><img src="../../Images/ListManCornerBottomRight.gif" width="5" height="5"></td>
		</tr>
	</table>
	</td></tr></table>
  </body>
</html>
