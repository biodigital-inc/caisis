<%@ Register TagPrefix="val" TagName="PageHeader" Src="../Header/pageHeader.ascx" %>
<%@ Page Language="c#" Inherits="Caisis.UI.Core.PatientLists.PatientListPage" CodeFile="PatientListPage.aspx.cs"
    CodeFileBaseClass="Caisis.UI.Core.Classes.FramePage" %>
<%@ Register TagPrefix="val" TagName="PatientListMenus" Src="PatientListMenus.ascx" %>
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Patient Lists</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
    <meta content="C#" name="CODE_LANGUAGE">
    <meta content="JavaScript" name="vs_defaultClientScript">
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    <meta content="NOINDEX" name="ROBOTS">
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
    <link href="../../StyleSheets/MenuStyles.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
	<script type="text/javascript" src="../../ClientScripts/Menu.js"></script>

    <script type="text/javascript">
	
    function loadPatientList(listType, listName)
    {
        listOptions.listType.value = listType;  
        listOptions.listName.value = listName; 
        listOptions.submit();
    }

    function goToList(listType,listCrit,listCritName)
    {
        var args = [listType,listCrit,listCritName];
        var targetURL = formatString('PatListContent.aspx?listType={0}&listCrit={1}&listCritName={2}',args);
        window.frames['patientListContent'].document.location.href = targetURL;
    }

    /************************* end window sizing functions *********************/
    var PATIENT_LIST_CALLBACK_PATH = '<%= Caisis.UI.Core.Classes.PageUtil.GetBasePath(this.Request) + "/Core/Utilities/AjaxCallBacks/PatientListCallBack.aspx" %>';

    function getPatientMenus(filterType,expr,fields,cbFunc)
    {
        // Create params to pass back to server
        var p = new Param(); 
        p.add('type',filterType); 
        p.add('filter',expr);
        p.add('fields',fields.join(','));
        p.add('methodName','GetPatientListMenus');
        // Call server
        AjaxManager.MakeRequest('POST',PATIENT_LIST_CALLBACK_PATH,p,cbFunc,true);
    }
        
    //** START Ajax Patient-List Menus **//
    var MenuCache = new Array(); // Cache items(array) which are returned form server
    useHelper = false; // Disable iframe helper in IE, not needed here
    var currentClickedNode;
	    
	var AjaxMenus = 
	{
		Protocols: 
	    { 
	        menuType: 'Protocols', 
	        menuId: 'ProtocolsMenu',
	        fields: ['ProtocolId','ProtocolNum'],
	        baseURL: 'PatListContent.aspx?listType=Protocol&listCrit={0}&listCritName={1}',
	        baseText: '{1}'
	    },
	    Physicians: 
	    { 
	        menuType: 'Physicians', 
	        menuId: 'PhysiciansMenu',
	        fields: ['PhysicianId','PhLastName','PhFirstName'],
	        baseURL: 'PatListContent.aspx?listType=Physician&listCrit={0}&listCritName={1}, {2}',
	        baseText: '{1}, {2}'
	    }
	}

    // Loops through ajax menus and inserts menu (ul) into DOM
    // and sets up methods on these object which help in clearing/populating
    // the submenus.
    // Structure:
    //<ul> <-- parent menu
    //  <li><a>A</a>
    //      START GENERATED DOM vis JS
    //      <ul> <--- menu
    //          <li> All <--- holder
    //              <a hred="#">item 1</a> <-- items
    //              <a hred="#">item 2</a>
    //              <a hred="#">item 3</a>
    //              ....
    //          </li>
    //      </ul>
    //      END GENERATED DOM
    //  <li>
    //      <a>B</a>
    //      <a>C</a>
    //      <a>D</a>
    //  </li>
    //</ul>
	function initPatientMenus()
	{
        for(var key in AjaxMenus)
        {
            var item = AjaxMenus[key];
            var parentMenu = document.getElementById(item.menuId);
            var liHolder = parentMenu.getElementsByTagName('li')[0];
            
            var ul = document.createElement('ul');
            ul.style.height = "45em";
            ul.style.width = "150px";
            ul.style.overflow = "auto";
            ul.style.display = "none";
            
            var li = document.createElement('li');
            ul.appendChild(li);
            liHolder.appendChild(ul);
            
            var menu = ul;
            item.menu = menu;
            menu.parentMenu = parentMenu;
            parentMenu.subMenu = menu;
            
            for(var p in item) { menu[p] = item[p]; } // copy properties from item into sub menu object

            menu.populate = function(key)
            {
                this.clear();
                var defaultWidth = 150,defaultHeight = 400,defaultTop = 12;
                if(!this.posSet) 
                { 
                    var l = this.parentMenu.offsetWidth;
                    var h = Math.max(defaultHeight,this.parentMenu.offsetHeight);
                    this.style.top = defaultTop + "px";
                    this.style.left =  l - 2 + "px";
                    this.style.height = h - 14 + "px"; 
                    this.posSet = true;
                }
                if(MenuCache[key]) 
                { 
                    var liCache = MenuCache[key];
                    this.appendChild(liCache);
                }
                else
                {
                    this.clear();
                    var noResults = document.createElement('a');
                    noResults.appendChild(document.createTextNode('...no results'));
                    this.appendChild(noResults);
                }

                if(MenuCache[key + "width"])
                {
                    defaultWidth = MenuCache[key + "width"];
                }
                this.show();
                this.style.width = defaultWidth + "px";
            }
            menu.fill = function(aList,key)
            {
                if(aList.length>0)
                {
                    var holder = document.createElement('li');
                    var aBase = document.createElement('a');
                    var menuWidth = 150;
                    aBase.target = 'patientListContent'
                    for(var i=0;i<aList.length;i++)
                    {
                        var row = aList[i];
                        var a = aBase.cloneNode(false);
                        a.href = formatString(this.baseURL,row);
                        var text = formatString(this.baseText,row);
                        a.appendChild(document.createTextNode(text));
                        menuWidth = Math.max(menuWidth,text.length*6);
                        holder.appendChild(a);
                    }
                    if(key)
                    {
                        var clonedList = holder.cloneNode(true);
                        MenuCache[key] = clonedList;
                        MenuCache[key + "width"] = menuWidth;
                    }                    
                }
            }
            menu.fillNoResults = function()
            {
                this.clear();
                var m = document.createElement('li');
                var a = document.createElement('a');
                a.appendChild(document.createTextNode('....no results'));
                m.appendChild(a);
                this.appendChild(m);
                this.show();
            }
            menu.clear = function() {  while(this.childNodes.length>0) { this.removeChild(this.firstChild); } };
	        menu.show = function() { this.style.left = this.parentMenu.offsetWidth -2 + "px"; this.style.display = "block"; }
	        menu.hide = function() { this.style.display = 'none'; clearCurrentNode(); }
	    }
	}
	
	// Occurs when menu items are clicked
	// Calls the server and asks for filter 
	// list based on filter and menu type/name
	// If list is in cache, use it else, get from server
	function getMenu(srcNode,menuName,filterExpr)
	{
        setCurrentNode(srcNode);
        var menu = AjaxMenus[menuName].menu;
	    var key = menuName + filterExpr,cachedItems;
	    var fields = AjaxMenus[menuName].fields;
	    var populateMenu = getPatientListCallback(menu,key);
	    if(cachedItems = MenuCache[key]) { menu.populate(key); }
	    else { getPatientMenus(menuName,filterExpr,fields,populateMenu); }
	}
	
	// Gets callback function which gets called when returned from server
	function getPatientListCallback(menu,key)
	{
	    // anon func gets called with return text
	    // which is a js array (as literal string)
	    return function(txt,xml)
	    {
	        if(txt.length>0) 
	        { 
	            // parse literal string into js Array Object
	            var resultAsArray = eval(txt);
	            menu.fill(resultAsArray,key); 
	            menu.populate(key); 
	        } 
            else { menu.fillNoResults(); }
        }
	}
	
	function setCurrentNode(node) 
	{ 
        if(currentClickedNode) { currentClickedNode.className = '';}
        currentClickedNode = node;
        currentClickedNode.className = 'AjaxMenuItemClicked';
	}
	
	function clearCurrentNode() { if(currentClickedNode) { currentClickedNode.className = ''; currentClickedNode = null;  } }

	// Initalize submenus when page is loaded
	window.addEvent('load',initPatientMenus);
    //** END Ajax Patient-List Menus **//
    </script>

</head>
<body style="margin: 0px 0px 0px 0px;">
    <table height="100%" cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td height="70" bgcolor="#ffffff">
                <val:PageHeader ID="PageHeader1" runat="server"></val:PageHeader>
            </td>
        </tr>
        <tr>
            <td class="MenuContainter"  style="white-space: nowrap;">
                <a href="javascript:;" style="float: left;">
                    <img onClick="MM_showHideLayers('currentList','','hide','commonTasks','','show','flashList','','hide')"
                        hspace="0" src="../../Images/Header/CommonTasks.gif" border="0" align="middle"
                        style="margin-left: 12px; margin-top: 6px;" />
                </a>
                <div style="margin-left: 200px; width: auto; white-space: nowrap;">
                    <val:PatientListMenus ID="PatientListMenus1" runat="server" />
                </div>
            </td>
        </tr>
        <tr>
            <td align="middle" valign="top">
                <iframe id="patientListContent" name="patientListContent" src="PatListContent.aspx"
                    frameborder="0" width="100%" height="510" scrolling="no" runat="server"></iframe>
            </td>
        </tr>
    </table>
</body>
</html>
