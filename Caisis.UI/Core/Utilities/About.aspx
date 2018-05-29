<%@ Page language="c#" Inherits="Caisis.UI.Core.Utilities.About" CodeFile="About.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>About Caisis</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
	<link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript">
<!--
function popupCaisisOrg() {
	window.open('http://www.caisis.org', 'CaisisOrg', 'toolbars=yes,resize=yes,scrollbars=yes,width=900,height=700');
}

function popupSTA() {
	window.open('http://www.caisis.org/license.aspx', 'STA', 'toolbars=yes,resize=yes,scrollbars=yes,width=840,height=600,left=50,top=50');
}

//opens window to email admin
function popupAdminEmailWindow()
{
	window.open('EmailAdmin.aspx','EmailAdmin', 'toolbars=no,resize=no,scrollbars=no,width=500,height=400,left=300,top=200');
}

function checkBrowser(){
	this.ver=navigator.appVersion
	this.dom=document.getElementById?1:0
	this.ie5=(this.ver.indexOf("MSIE 5")>-1 && this.dom)?1:0;
	this.ie6=(this.ver.indexOf("MSIE 6")>-1 && this.dom)?1:0;
	this.ie4=(document.all && !this.dom)?1:0;
	this.ns5=(this.dom && parseInt(this.ver) >= 5) ?1:0;
	this.ns4=(document.layers && !this.dom)?1:0;
	this.bw=(this.ie5 || this.ie4 || this.ns4 || this.ns5)
	return this
}


//-->
</script>

<script language="JavaScript" src="../../ClientScripts/dhtmllib.js"></script>
<script language="JavaScript" src="../../ClientScripts/scroller.js"></script>


<script language="JavaScript">


//SET SCROLLER APPEARANCE AND MESSAGES
var valCredits = new Scroller(0, 0, 165, 40, 1, 5); //(xpos, ypos, width, height, border, padding)
valCredits.setColors("#ffffff", "#004257", "#cccccc"); //(fgcolor, bgcolor, bdcolor)
valCredits.setFont("Verdana,Arial,Helvetica", "1");
valCredits.addItem("<strong>Special Thanks to the Following Sponsoring Institutions:</strong>");
valCredits.addItem("Memorial Sloan-Kettering Cancer Center");
valCredits.addItem("University Hospitals Case Medical Center");
valCredits.addItem("U of Washington / Fred-Hutchinson Center");
valCredits.addItem("McGill University");
valCredits.addItem("NYU Langone Medical Center");
valCredits.addItem("University of Sydney, Westmead Australia");
valCredits.addItem("Eastern Virginia Medical School");
valCredits.addItem("MD Anderson Cancer Center");
valCredits.addItem("University of Southern California");

valCredits.addItem("<strong>Thanks to the Following Participants:</strong>");
valCredits.addItem("Baylor Medical Center");
valCredits.addItem("University of Rochester");
valCredits.addItem("Cleveland Clinic");
valCredits.addItem("Cancer Research UK");
valCredits.addItem("George Washington University");
valCredits.addItem("University of Alabama Birmingham");
valCredits.addItem("University of Malmo, Sweden");
valCredits.addItem("Columbia University");
valCredits.addItem("Karmanos Cancer Institute");
valCredits.addItem("Biobank Switzerland");



valCredits.addItem("<strong>Development Team</strong>");
valCredits.addItem("Paul Alli");
valCredits.addItem("Avinash Chan");
valCredits.addItem("Jason Fajardo");
valCredits.addItem("Paul Fearn");
valCredits.addItem("Delvin Kelleybrew")
valCredits.addItem("Marina Matatova");
valCredits.addItem("Kevin Regan");
valCredits.addItem("Frank Sculli");
valCredits.addItem("Brandon Smith");
valCredits.addItem("Tumen Tumor");
valCredits.addItem("Katia Yau");
valCredits.addItem("Mahitha Vallurupalli");



valCredits.setPause(900); //set pause beteen msgs, in milliseconds

function runmikescroll() {

  var layer;
  var mikex, mikey;

  layer = getLayer("placeholder");
  valx = 56;
  valy = 320;

  valCredits.create();
  valCredits.hide();
  valCredits.moveTo(valx, valy);
  valCredits.setzIndex(100);
  valCredits.show();
}

window.onload=runmikescroll
</script>


</head>
<body link="ffffff" vlink="ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="400" cellpadding="0" cellspacing="0" border="0">
<tr><td height="400" valign="middle" align="center">
<table width="400" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td><img src="../../Images/shim.gif" width="1" height="1"></td>
    <td><img src="../../Images/shim.gif" width="36" height="1"></td>
    <td><img src="../../Images/shim.gif" width="326" height="1"></td>
    <td><img src="../../Images/shim.gif" width="36" height="1"></td>
    <td><img src="../../Images/shim.gif" width="1" height="1"></td>
  </tr>
  <tr> 
    <td colspan="5">
    
    <div style="Z-INDEX: 4; VISIBILITY: visible; OVERFLOW: auto; WIDTH: 100%; POSITION: absolute;" >
    <table width="380" border="0" cellpadding="0" cellspacing="0">
    <tr><td>&nbsp;</td></tr>
    <tr><td align="right" style="font-family: arial, sans-serif; color: #004256; font-weight: bold; font-size: 11px;">
        Caisis v <asp:Label ID="VersionNumber" runat="server"></asp:Label><br />
        <span style="font-family: arial, sans-serif; color: #004256; font-weight: bold; font-size: 10px;">
        Built with ASP.Net 3.5<br />
        Culture Setting: <asp:Label ID="Culture" runat="server"></asp:Label><br/>
        Date Format: <asp:Label ID="DateFormat" runat="server"></asp:Label>
        </span>
        </td></tr>
    </table>
    </div>
    
    
    <img src="../../Images/AboutTop.gif" width="400" height="166" id="AboutTopImage" runat="server"></td>
  </tr>
  <tr> 
    <td bgcolor="00668d"><img src="../../Images/shim.gif" width="1" height="1"></td>
    <td colspan="3" class="aboutBoxText"><img src="../../Images/shim.gif" width="10" height="10"></td>
    <td bgcolor="00668d"><img src="../../Images/shim.gif" width="1" height="1"></td>
  </tr>
  <tr> 
    <td bgcolor="00668d"><img src="../../Images/shim.gif" width="1" height="1"></td>
    <td class="aboutBoxText">&nbsp;</td>
    <td height="120" valign="top" class="aboutBoxText">All use and modifications of this application 
      are subject to the terms, conditions and copyright set forth in the <a href="javascript: popupSTA();" >Open Source Software 
      Transfer Agreement</a>. This program is provided with NO WARRANTY. The entire risk as to the quality and performance of the program is with you.
      <br/><br/>
      &copy;This computer program is protected by copyright law and international treaties. Unauthorized reproduction, distribution, or sale of the software 
      is strictly prohibited.<br/><br/>



        <div id="tempholder" ></div>


        <div id="placeholder" style="background-color: #004256; border-right: #000000 1px;
    border-top: #000000 1px; z-index: 20; border-left: #000000 1px; width: 150px;
    height: 40px; border-bottom: #000000 1px; position: absolute; visibility: visible;"><img src="../../Images/shim.gif" width="218" height="24" /><a href="javascript:popupCaisisOrg();" class="aboutBoxText">www.caisis.org</a></div>

    <br />
    <br />
    <br />
    </td>
    <td class="aboutBoxText">&nbsp;</td>
    <td bgcolor="00668d"><img src="../../Images/shim.gif" width="1" height="1"></td>
  </tr>
  <tr> 
    <td colspan="5"><img border="0" vspace="0" hspace="0" src="../../Images/AboutBottom.gif" width="400" height="46" usemap="#AboutMap"><br/></td>
  </tr>
</table>
</td></tr></table>
<map name="AboutMap" id="AboutMap">
  <area shape="rect" coords="34,11,208,29" href="javascript:popupAdminEmailWindow();window.close();">
  <area shape="rect" coords="267,11,358,29" href="javascript: window.close();">
</map>
</body>
</html>







