<%@ Page Language="C#" Inherits="Caisis.UI.Admin.Admin" CodeFile="Admin.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<%@ Register TagPrefix="modal" TagName="Modal" Src="~/Core/Header/Modal.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Caisis Administration</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AdminNavIcons img { border: none; margin: auto auto 12px auto; }
        #AdminNavIcons a { border: none; }
    </style>

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <!-- Register Modal javascript for use anywhere in application -->
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/ClientScripts/jquery.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/ClientScripts/jquery-ui.js") %>"></script>

    <script type="text/javascript">

    jQuery.noConflict();
    
    /* <![CDATA[ */
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

    function MM_nbGroup(event, grpName) { //v6.0
      var i,img,nbArr,args=MM_nbGroup.arguments;
      if (event == "init" && args.length > 2) {
        if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
          img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
          if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
          nbArr[nbArr.length] = img;
          for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
            if (!img.MM_up) img.MM_up = img.src;
            img.src = img.MM_dn = args[i+1];
            nbArr[nbArr.length] = img;
        } }
      } else if (event == "over") {
        document.MM_nbOver = nbArr = new Array();
        for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
          if (!img.MM_up) img.MM_up = img.src;
          img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
          nbArr[nbArr.length] = img;
        }
      } else if (event == "out" ) {
        for (i=0; i < document.MM_nbOver.length; i++) {
          img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
      } else if (event == "down") {
        nbArr = document[grpName];
        if (nbArr)
          for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
        document[grpName] = nbArr = new Array();
        for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
          if (!img.MM_up) img.MM_up = img.src;
          img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
          nbArr[nbArr.length] = img;
      } }
  }

  var MIN_ADMIN_HEIGHT = 500;
  var ADMIN_HEIGHT_OFFSET = 100;

  // when window loads and resizes adjust main admin frame
  function onWindowResize(width, height, e) {
      var adjustedHeight = Math.max(MIN_ADMIN_HEIGHT, height - ADMIN_HEIGHT_OFFSET);
      // set height of frame
      $('adminSection').style.height = adjustedHeight + 'px';
  }

     /* ]]> */
    </script>
	
	<style type="text/css">
	#adminLayoutTable
	{
		width: 100%;
	}
	#adminNavColumn
	{
		width: 74px;
		vertical-align: top;
	}
	#adminMainContent
	{
		vertical-align: top;
	}
	
	</style>
	
</head>
<body class="AdminBody">
    <modal:Modal runat="server" />
    <div style="margin: 10px 10px auto 10px; ">
	<table cellspacing="0" id="adminLayoutTable">
		<tr>
			<td id="adminNavColumn">
			<table width="74" border="0" cellspacing="0" cellpadding="0" class="adminTable" >
            <tr>
                <td colspan="3">
                    <img src="../Images/AdminImages/AdminNavTop.gif" width="74" height="39" alt="Caisis Admin" /></td>
            </tr>
            <tr>
                <td class="adminNavBorder">
                    <img src="../Images/shim.gif" width="1" height="10"/></td>
                <td>
                    <img src="../Images/shim.gif" width="72" height="1"/></td>
                <td class="adminNavBorder">
                    <img src="../Images/shim.gif" width="1" height="1"/></td>
            </tr>
            <tr> 
                <td class="adminNavBorder"><img src="../Images/shim.gif" width="1" height="1" /></td>
                <td align="center" valign="top" id="AdminNavIcons">
                <!-- Navigation Handled by ~/App_Data/AdminConfig.xml -->
                  <asp:Repeater runat="server" DataSourceID="AdminNavDataSource">
                      <ItemTemplate>
                          <a href="<%# Eval("href") %>" target="adminSection" onclick="MM_nbGroup('down','group1','<%# Eval("name") %>','../Images/AdminImages/<%# Eval("icon") %>On.gif',1)">
                              <img alt="<%# Eval("pageTitle") %>" src="../Images/AdminImages/<%# Eval("icon") %>.gif"
                                  id="<%# Eval("name") %>" /></a>
                      </ItemTemplate>
                  </asp:Repeater>
                  <!-- Get XML Data Source from config file. -->
                  <asp:XmlDataSource runat="server" ID="AdminNavDataSource" DataFile="~/App_Data/AdminConfig.xml"
                      XPath="//section"></asp:XmlDataSource>
                </td>
                <td class="adminNavBorder"><img src="../Images/shim.gif" width="1" height="1" /></td>
            </tr>
                  <tr> 
                    <td colspan="3"><img src="../Images/AdminImages/AdminNavBottom.gif" width="74" height="3" /></td>
            </tr>
        </table>
			</td>
			<td id="adminMainContent">
			<table style="width: 100%; float: right;" cellspacing="0" cellpadding="0" class="adminTable">
			<tr>
                <td class="adminBorder"><img src="../Images/shim.gif" width="1" height="1" /></td>
                <td><img src="../Images/shim.gif"  height="1"/></td>
                <td class="adminBorder"><img src="../Images/shim.gif" width="1" height="1"/></td>
            </tr>
            <tr>
                <td colspan="3" id="adminTop">&nbsp;<img src="../Images/AdminImages/AdminTop_right.gif" style="width: 265px; height: 39px; border: none;" usemap="#AdminTopMap" alt="Caisis System Administration" /></td>
            </tr>
            <tr>
                <td class="adminBorder"><img src="../Images/shim.gif" width="1" height="1" /></td>
                <td><img src="../Images/shim.gif"  height="1"/></td>
                <td class="adminBorder"><img src="../Images/shim.gif" width="1" height="1"/></td>
            </tr>
            <tr>
                <td class="adminBorder"><img src="../Images/shim.gif" width="1" height="1"/></td>
                <td valign="top" style="padding: 5px 10px 5px 10px;"><iframe id="adminSection" name="adminSection" src="adminSectionWelcome.aspx" frameborder="0" scrolling="no" style="width: 100%; height: 600px;"></iframe></td>
                <td class="adminBorder"><img src="../Images/shim.gif" width="1" height="1"/></td>
            </tr>
            <tr>
                <td colspan="3" id="adminBottom"><img src="../Images/AdminImages/AdminBottom_right.gif" width="265" height="3"/></td>
            </tr>
        </table>
			</td>
		</tr>
	</table>
	
	
        
        
    </div>
    <map id="AdminTopMap" name="AdminTopMap">
        <area shape="rect" coords="178,11,246,27" href="../Logout.aspx" alt="Logout" />
        <area shape="rect" coords="22,11,116,27" href="../Core/Utilities/Dashboard.aspx" alt="Back To Site" />
</map>
</body>
</html>
