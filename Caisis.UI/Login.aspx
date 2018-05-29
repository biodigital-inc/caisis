<%@ Page EnableViewStateMAC=false language="c#" Inherits="Caisis.UI.Login" CodeFile="Login.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>Caisis Login</title> 
<!--
		*********************************************************************************************************************
		
	    Caisis : Data Management System
		Copyright(C) 2015 BioDigital, Inc., All Rights Reserved. 

		Unless explicitly acquired and licensed from Licensor, the contents of this file are subject to  the GNU PUBLIC LICENSE 
		("GPU") Version 2, or subsequent versions as allowed by the GPU, and You may not copy or use this file in either source
		code or executable form, except in compliance with the terms and conditions of the GPU. 

		You may obtain a copy of both the GPU at http://www.caisis.org. 

		All software distributed under the Licenses is provided strictly on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND,  EITHER EXPRESS OR IMPLIED, AND THE CAISIS TEAM HEREBY DISCLAIMS ALL SUCH WARRANTIES, INCLUDING WITHOUT LIMITATION,  ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR  PURPOSE, QUIET ENJOYMENT, OR NON-INFRINGEMENT.  FOR THE AVOIDANCE OF DOUBT, LICENSOR DOES NOT WARRANT THAT THE SOFTWARE WILL MEET CUSTOMER'S REQUIREMENTS OR BE ERROR-FREE OR SECURE. USE OF THE SOFTWARE IS AT YOUR OWN RISK AND YOU ARE SOLELY RESPONSIBLE FOR THE SECURITY, ACCURACY, TRANSMISSION AND USE OF THE DATA.
        See the  Licenses for specific language governing rights and limitations under the Licenses. 
		
		
		**********************************************************************************************************************
-->
        
        <meta name="CODE_LANGUAGE" Content="C#">
        <meta name="vs_defaultClientScript" content="JavaScript">
        <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
        <link href="StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <SCRIPT LANGUAGE="JavaScript">

var mainWindow;
var winInterval;

var showPasswordChangeBlock = 0;

//<!-- ensures that this page never appears within frames
if (parent.location.href != self.location.href) {
top.window.location.href = 'login.aspx';
}
function popupWindow(pageName, firstTime) {
	// set x and y coordinates of pop up window according to users screen size
	var posY = (screen.availHeight/2)-140;
	var posX = (screen.availWidth/2)-210;
	
	if (pageName == 'forgotPassword') {
		window.open('Core/Utilities/ForgotPassword.aspx', 'ForgotPassword', 'toolbars=no,resize=yes,width=500,height=400,left=300,top=200');
	} 
}

function onLogout(){
	document.loginForm.userName.value = '';
	document.loginForm.Password.value = '';
}
		
function validateLogin(){
	var msg = '';
	if(document.loginForm.userName.value == '') msg = 'userName is required\n\n';
	if(document.loginForm.Password.value == '') msg += 'Password is required';
	
	if(msg != '') {
		alert(msg);
		return false;
	} else {
		document.loginForm.action='Login.aspx';
		document.loginForm.submit();
	}
}

function popupAboutBox() {
	window.open('Core/Utilities/About.aspx', 'AboutCaisis', 'toolbars=no,resize=no,scrollbars=no,width=440,height=400,left=300,top=200');
}

function switchUpdatePassword() {
	document.loginForm.newPassword1.value = '';
	document.loginForm.newPassword2.value = '';
	if (showPasswordChangeBlock == 0)
	{
		updatePasswordFields.style.display = 'block';
		document.getElementById('enterButton').style.width = 217;
		MM_swapImage('enterButton','','images/UpdatePassAndEnterSite.gif',1)
		MM_swapImage('changePasswordButton','','images/KeepCurrentPassword.gif',1)
		showPasswordChangeBlock = 1;
	} 
	else
	{
		updatePasswordFields.style.display = 'none';
		document.getElementById('enterButton').style.width = 66;
		MM_swapImage('enterButton','','images/Enter.gif',1)
		MM_swapImage('changePasswordButton','','images/ChangeYourPassword.gif',1)
		showPasswordChangeBlock = 0;
	}
}

function showUpdatePassword() {
	updatePasswordFields.style.display = 'block';
	document.getElementById('enterButton').style.width = 217;
	MM_swapImage('enterButton','','images/UpdatePassAndEnterSite.gif',1)
}

function popupAdminEmailWindow()
{
	window.open('Core/Utilities/EmailAdmin.aspx','EmailAdmin', 'toolbars=no,resize=no,scrollbars=no,width=500,height=400,left=300,top=200');
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc)x.oSrc=x.src; x.src=a[i+2];}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}

//DL
//For LoginAttemptsLog, same as in EmailAdmin.aspx
function detectScreenVars()
{
	if (document.getElementById('screenResolution'))
	{
		document.getElementById('screenResolution').value = screen.width + ' x ' + screen.height;
		document.getElementById('colorDepth').value = screen.colorDepth;
	}
}

//  End -->
        </SCRIPT>
        
<style type="text/css">
td { FONT-SIZE: 11px; COLOR: #333333; LINE-HEIGHT: 14px }
    
#LoginTop
{
    height: 79px;
    background-image: url(images/loginTop.gif);
    background-repeat: no-repeat;
    position: relative;
}
</style>
    </HEAD>
    <body scroll="no" style="background-color: #555C64; color: #333333;" link="#003366" vlink="#003366"
        alink="#003366" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="detectScreenVars();">
        <form id="loginForm" runat="server">
            <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center">
                        <table width="100%" height="653" border="0" cellpadding="0" cellspacing="0" class="loginBG">
                            <tr>
                                <td height="653" align="center">
                                    <table width="740" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td colspan="7" height="79">
                                            <div id="LoginTop">
                                                <div id="HelpOptions" style="border-right:#000000 1px; border-top:#000000 1px; z-index:5000; visibility:hidden; border-left:#000000 1px; width:750px; border-bottom:#000000 1px; position:absolute;">
                                                    <table width="750" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td><img src="Images/shim.gif" width="1" height="30"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <table width="150" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td colspan="2" rowspan="2" bgcolor="#00668d"><img src="Images/Header/LayerCornerTopLeftWhite.gif" width="5" height="5"></td>
                                                                        <td height="1" class="GlobalListBorder" bgcolor="#fbfbef"><img src="Images/shim.gif" width="2" height="1"></td>
                                                                        <td class="GlobalListBorder" bgcolor="#fbfbef"><img src="Images/shim.gif" width="136" height="1"></td>
                                                                        <td class="GlobalListBorder" bgcolor="#fbfbef"><img src="Images/shim.gif" width="2" height="1"></td>
                                                                        <td colspan="2" rowspan="2" bgcolor="#00668d"><img src="Images/Header/LayerCornerTopRightBlue.gif" width="5" height="5"></td>
                                                                    </tr>
                                                                    <tr bgcolor="#fbfbef">
                                                                        <td colspan="3" height="4"><img src="Images/shim.gif" width="1" height="4"></td>
                                                                    </tr>
                                                                    <tr bgcolor="#fbfbef">
                                                                        <td class="GlobalListBorder"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="4" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="4" height="1"></td>
                                                                        <td class="GlobalListBorder"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                    </tr>
                                                                    <tr bgcolor="#fbfbef">
                                                                        <td class="GlobalListBorder"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td height="15" colspan="3" valign="top"><a href="javascript:;"><img src="Images/Header/SmallCloseButton.gif" onclick="MM_showHideLayers('HelpOptions','','hide')"
                                                                                    width="11" height="11" hspace="4" border="0" align="right"></a><img src="Images/Header/HelpOptionsTitle.gif" width="70" height="11" hspace="2" vspace="2"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td class="GlobalListBorder"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                    </tr>
                                                                    <tr bgcolor="#fbfbef">
                                                                        <td class="GlobalListBorder"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td colspan="3" bgcolor="#8d2a2c"><img src="Images/shim.gif" width="1" height="1"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td class="GlobalListBorder"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                    </tr>
                                                                    <tr bgcolor="#fbfbef">
                                                                        <td class="GlobalListBorder"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td valign="top" height="30"><img src="Images/shim.gif" height="4" width="1"><br/>
                                                                            <a class="commonTasksText" href="javascript:popupAboutBox(); MM_showHideLayers('HelpOptions','','hide');">About This Application</a>
                                                                            <a class="commonTasksText"  href="javascript:popupAdminEmailWindow(); MM_showHideLayers('HelpOptions','','hide');">Contact Admin</a><br/>
                                                                        </td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td class="GlobalListBorder"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                    </tr>
                                                                    <tr bgcolor="#fbfbef">
                                                                        <td class="GlobalListBorder"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td valign="top"><img src="Images/shim.gif" width="1" height="7"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td><img src="Images/shim.gif" width="1" height="1"></td>
                                                                        <td class="GlobalListBorder"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" rowspan="2"><img src="Images/Header/LayerCornerBottomLeft.gif" width="5" height="5"></td>
                                                                        <td colspan="3" height="3" bgcolor="#fbfbef"><img src="Images/shim.gif" width="1" height="4"></td>
                                                                        <td colspan="2" rowspan="2"><img src="Images/Header/LayerCornerTopBottomRi.gif" width="5" height="5"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="3" height="1" class="GlobalListBorder"><img src="Images/shim.gif" width="1" height="1"></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                                <img src="images/shim.gif" style="position: absolute; width: 49px; height: 15px; left: 667px; top: 32px; cursor: pointer; z-index: 2000;" onclick="MM_showHideLayers('HelpOptions','','show');" />
                                                <img id="Holiday_Winter" runat="server" visible="false" src="images/Login_Holiday_Christmas.png" style="position: absolute; left: -55px; top: -16px; z-index: 1000;" />
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="loginBorder">
                                                <img src="images/shim.gif" width="1" height="15">
                                            </td>
                                            <td class="loginTable">
                                                <img src="images/shim.gif" width="42" height="1">
                                            </td>
                                            <td class="loginTable">
                                                <img src="images/shim.gif" width="316" height="1">
                                            </td>
                                            <td class="loginTable">
                                                <img src="images/shim.gif" width="60" height="1">
                                            </td>
                                            <td class="loginTable">
                                                <img src="images/shim.gif" width="300" height="1">
                                            </td>
                                            <td class="loginTable">
                                                <img src="images/shim.gif" width="20" height="1">
                                            </td>
                                            <td class="loginBorder">
                                                <img src="images/shim.gif" width="1" height="1">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="loginBorder">
                                                <img src="images/shim.gif" width="1" height="1">
                                            </td>
                                            <td class="loginTable">&nbsp;
                                            </td>
                                            <td class="loginTable" valign="top" height="245">
                                                <strong>Please enter your username and password on the right to begin.</strong><br/>
                                                <br/>
                                                The application will automatically log out after
                                                <asp:Literal ID="timeoutPeriod" Runat="server" />
                                                inactivity.
                                                <br/>
                                                <br/>
                                                Please update your password on your first login.<br/>
                                                <br/>
                                                If you need assistance, use the help link from anywhere in the application to 
                                                contact the system administrator.<br/>
                                                <br/>
                                                <br/>
                                                <img id="ChangePasswordButton" runat="server" name="changePasswordButton" style="CURSOR:hand" onclick="switchUpdatePassword();"
                                                    src="images/ChangeYourPassword.gif" width="156" height="22" border="0"><br/>
                                                <a href="javascript:popupWindow('forgotPassword');"><img id="ForgotPasswordButton" runat="server" src="images/ForgotYourPassword.gif" width="156" height="22" border="0" vspace="10"></a>
                                                <a href="http://mskweb5.mskcc.org/intranet/html/75630.cfm" target="_blank"><img visible="false" id="EzPasswordImg" runat="server" src="images/EZPassword.gif" style="width: 123px; height: 30px; margin-top: 3px; border: none;" /></a>
                                            </td>
                                            <td class="loginTable">&nbsp;
                                            </td>
                                            <td class="loginTable" valign="top">
                                                <asp:Label ID="errorMessage" CssClass="LoginError" Runat="server"></asp:Label>
                                                <table width="300" border="0" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td colspan="2"><img src="images/userPassTop.gif" width="300" height="2"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="loginUserPass" height="35" align="right" width="120">username&nbsp;&nbsp;</td>
                                                        <td class="loginUserPass"><input type="text" ID="userName" size="20" maxlength="50" tabindex="1" runat="server" NAME="userName"
                                                                class="loginField" autocomplete="off"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="loginUserPass" height="35" align="right" width="120">password&nbsp;&nbsp;</td>
                                                        <td class="loginUserPass"><input type="password" ID="password" size="20" maxlength="50" tabindex="2" runat="server"
                                                                NAME="password" class="loginField"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="loginUserPass" colspan="2"><div id="updatePasswordFields" style="DISPLAY: none">
                                                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                                                    <tr>
                                                                        <td class="loginUserPass" height="35" align="right" width="113">new 
                                                                            password&nbsp;&nbsp;</td>
                                                                        <td class="loginUserPass"><input type="password" ID="newPassword1" size="20" maxlength="50" tabindex="2" runat="server"
                                                                                NAME="newPassword1" class="loginField"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="loginUserPass" height="35" align="right" width="113">retype 
                                                                            new&nbsp;&nbsp;<br/>
                                                                            password&nbsp;&nbsp;</td>
                                                                        <td class="loginUserPass"><input type="password" ID="newPassword2" size="20" maxlength="50" tabindex="2" runat="server"
                                                                                NAME="newPassword2" class="loginField"></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2"><img src="images/userPassBottom.gif" width="300" height="2"></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" class="loginTable" align="center" height="30"><strong>Purpose:</strong>&nbsp;&nbsp;<input type="radio" id="purpose2" name="purpose" checked runat="server" value="Clinical">Clinical&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="purpose1" name="purpose" runat="server" value="Research">Research&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="purpose3" name="purpose" runat="server" value="Operations">Operations</td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="1" class="loginTable" align="center" valign="top" >
                                                            <%-- Only Visible on with correct LkpCode Attributes --%>
                                                            <asp:Panel runat="server" ID="IdentifiersPanel" Visible="false" style="white-space: nowrap;" >
                                                                <span style="display: block; font-weight: bold;">
                                                                    Identifier:&nbsp;&nbsp;<input type="radio" id="NoIdType" name="DefaultIdentifiersRadioList" value="" />
                                                                    <label for="NoIdType">Default</label></span>
                                                            </asp:Panel>
                                                        </td>        
                                                    </tr>
                                                    <tr>
                                                       <td colspan="2" style="padding-left: 65px;">
                                                        <asp:RadioButtonList runat="server" ID="DefaultIdentifiersRadioList" RepeatColumns="3"
                                                                RepeatDirection="Horizontal" RepeatLayout="Table" DataTextField="LkpCode"
                                                                DataValueField="LkpCode" >
                                                            </asp:RadioButtonList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="right" height="40"><asp:ImageButton ID="enterButton" ImageUrl="images/Enter.gif" Height="22" Width="66" Runat="server"
                                                                OnClick="onSubmitBtn_Click" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" align="right">
                                                            <asp:RequiredFieldValidator CssClass="LoginError" ControlToValidate="userName" id="userNameValidator" runat="server"
                                                                ErrorMessage="Please enter a value for username." /><br/>
                                                            <asp:RequiredFieldValidator CssClass="LoginError" ControlToValidate="password" id="passwordValidator" runat="server"
                                                                ErrorMessage="Please enter a value for password." />
                                                            <br />
                                                            <a href="http://www.opensource.org/"><img src="Images/OSI_Certified.gif" border="0" style="vertical-align: middle;"></a>
                                                            <a href="http://www.caisis.org"><img src="Images/CaisisCore.gif" border="0" style="vertical-align: middle; margin-left: 20px; margin-right: 86px; margin-top: 6px;"></a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td class="loginTable">&nbsp;
                                            </td>
                                            <td class="loginBorder">
                                                <img src="images/shim.gif" width="1" height="1">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="7" height="4">
                                                <img src="images/loginBottom.gif" width="740" height="4"><br/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!--DL: Client info, for login attempts log.-->
            <input id="screenResolution" type="hidden" name="screenResolution"><input id="colorDepth" type="hidden" name="colorDepth">
        </form>
    </body>
</HTML>
