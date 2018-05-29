<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="StorageManager.aspx.cs" Inherits="Modules_SpecimenMgmt_StorageManager" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Storage Manager</title>
    
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script type="text/javascript">
    
        function getUpdateHandler(win)
        {
            return function(val,resubmit)
            {
                if(window.top.refControl) { window.top.refControl.innerHTML = val; }
                if(resubmit) { win.document.Form1.submit(); }
            }
        }
        // This function will set an event handle which either
        // updates the text(refControl/SPAN element) when a user closes the modal window
        // or resubmits the form when adding a new record to show up on the interface
        function setRefControl(imgRef) 
        {
            window.top.refControl = imgRef ? imgRef.parentNode.getElementsByTagName('SPAN')[0] : null; 
            window.top.updatePage = getUpdateHandler(window);
        }
        
        function launchSiteEditWindow(siteId,imgRef)
        {
            setRefControl(imgRef);
            var url = window.location.href;
            url = url.substr(0,url.lastIndexOf("/")) + "/SpecimenStorageSite.aspx?siteId=" + siteId;
            var mTitle = siteId == 0 ?  'Add New Specimen Site' : 'Specimen Site Details';
            top.showModal(url, mTitle);
        }
        
        function launchStorageEditWindow(storageId,imgRef)
        {
            setRefControl(imgRef);
            var siteId = document.getElementById('<%= SiteId.ClientID %>').value;
            var url = window.location.href;
            url = url.substr(0,url.lastIndexOf("/")) + "/SpecimenStorage.aspx?storageId=" + storageId + "&siteId=" + siteId;
            var mTitle = storageId == 0 ? 'Add New Specimen Storage/Rack' : 'Specimen Storage Details';
            top.showModal(url,mTitle);
        }
        
        function launchContainerEditWindow(containerId,imgRef)
        {
            setRefControl(imgRef);
            var storageId = document.getElementById('<%= StorageId.ClientID %>').value;
            var url = window.location.href;
            url = url.substr(0,url.lastIndexOf("/")) + "/SpecimenStorageContainer.aspx?containerId=" + containerId + "&storageId=" + storageId;            
            var mTitle = containerId == 0 ? 'Add New Specimen Container/Bin' : 'Specimen Container Details';
            top.showModal(url,mTitle);
        }
     
        function launchBoxEditWindow(boxId,imgRef)
        {
            setRefControl(imgRef);
            var containerId = document.getElementById('<%= ContainerId.ClientID %>').value;
            var url = window.location.href;
            url = url.substr(0,url.lastIndexOf("/")) + "/SpecimenStorageBox.aspx?boxId=" + boxId + "&containerId=" + containerId;            
            var mTitle = boxId == '' ? 'Add New Specimen Box' : 'Specimen Box Details';
            top.showModalWithConfig(url, mTitle, { width : '900px', height: '515px'} );
        }

	    var currentSiteId; 
	    var currentStorageId; 
	    var currentContainerId;
	    var currentBoxId;
	    
	    function highlightItem(type, id)
	    {
	        var elementId = type + "_" + id;
	        //alert(elementId);
	        if(type == "Site")
	        {
	            if(currentSiteId && document.getElementById(currentSiteId))
	            {
	                document.getElementById(currentSiteId).className = '';
	            }
	            currentSiteId = elementId;
	        }
	        else if(type == "Storage")
	        {
	            if(currentStorageId && document.getElementById(currentStorageId))
	            {
	                document.getElementById(currentStorageId).className = '';
	            }
	            currentStorageId = elementId;
	        }
	        else if(type == "Container")
	        {
	            if(currentContainerId && document.getElementById(currentContainerId))
	            {
	                document.getElementById(currentContainerId).className = '';
	            }
	            currentContainerId = elementId;
	        }
	        else if(type == "Box")
	        {
	            if(currentBoxId && document.getElementById(currentBoxId))
	            {
	                document.getElementById(currentBoxId).className = '';
	            }
	            currentBoxId = elementId;
	        }
	        if(document.getElementById(elementId))
	        {
	            document.getElementById(elementId).className = 'ActiveItem';
	        }
	    }
	    function submitItem(type, id)
	    {
	        document.Form1.ItemType.value = type;
	        document.Form1.ItemValue.value = id;
	        document.Form1.submit();
	    }
    </script>

    <style type="text/css">
        .title
        {
            width:200px;
            text-align:center;
            font-size:13px;
        }
        .ListManDataTableRow
        {
            color: #000000;
            background-color: #ffffff;
        }
        .ListManDataTableRowOver
        {
            background-color: #e9d5d6;
            color: #00668d;
            cursor: pointer; 
            cursor: hand;
        }
        .column
        {
            border-right: 1px solid #CCCCCC;
            text-align:left;
        }
        
        
        
        .StorageItem
        {
            font-family: Arial, Helvetica, sans-serif;
            background-color: transparent;
            background-image: url(Images/StorageWidget.gif);
            background-repeat: no-repeat;
            background-position: right center;
            color: #333333;
            cursor: pointer;
            text-align: left;
        }
        
        .StorageItem:hover
        {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #E9D5D6;
            background-image: url(Images/StorageWidget_hover.gif);
            background-repeat: no-repeat;
            background-position: right center;
            color: #111111;
            cursor: pointer;
            text-align: left;
        }
        
        .StorageDetailsIcon
        {
            vertical-align: middle;
            margin: 7px 5px 7px 4px;
        }
        
        
        .ActiveItem
        {
           font-family: Arial, Helvetica, sans-serif;
            background-color: #8d2a2c;
            background-image: url(Images/StorageWidget_on.gif);
            background-repeat: no-repeat;
            background-position: right center;
            color: #ffffff;
            cursor: default;
        }
        
        
    </style>
    </head>
    
<body>
    <form id="Form1" runat="server">
    <!-- Keep Track of Ids -->
    <asp:HiddenField runat="server" ID="ItemType" /> 
    <asp:HiddenField runat="server" ID="ItemValue" />
    <asp:HiddenField runat="server" ID="SiteId" />
    <asp:HiddenField runat="server" ID="StorageId" />
    <asp:HiddenField runat="server" ID="ContainerId" />
    <asp:HiddenField runat="server" ID="BoxId" />
    <asp:HiddenField runat="server" ID="Rebind" />
        <div align="center" style="margin-top: 15px;">
            <table width="800">
                <tr>
                    <td colspan="4" height="30" style="text-align: left;">
                        <span class="ListManTitle">Manage Storage</span>
                        <span style="margin-left: 50px; color: #666666;">Select a storage level to view its contents.  For further information on a level, click the applicable <img src="Images/Buttton_info_small.png" style="vertical-align: middle; margin: 0px 2px 0px 2px;"  /> icon.</span>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <table style=" border: 1px solid #dddddd;  background-color:#f1f7fc;" cellpadding="4">
                        
                            <tr style="height: 20px; font-weight: bold; text-align: left;">
                                <td class="title">Site</td>
                                <td class="title">
                                    Storage/Shelf</td>
                                <td class="title">
                                    Container/Rack</td>
                                <td class="title">Box</td>
                            </tr>
                            <tr style="height:300px">
                                <td valign="top" class="column"  style="padding-bottom:5px; ">
                                    <div style=" overflow:auto; height:300px">
                                    <asp:Repeater ID="RptSite" runat="server">
                                        <ItemTemplate>
                                            <div id="Site_<%# Eval("DropDownValue") %>" class="StorageItem" onclick="submitItem('Site', '<%# Eval("DropDownValue") %>');" >
                                                <img alt="Click to edit Site" id="SiteBtn" class="StorageDetailsIcon" src="Images/Buttton_info_small.png" onclick="launchSiteEditWindow('<%# Eval("DropDownValue")%>',this);stopBubble(event);" /><span><%# Eval("DropDownText") %></span>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                                <div style="text-align:center; padding-bottom:5px; padding-top:5px;">
                                        <asp:ImageButton ID="addSiteBtn" runat="server" OnClientClick="launchSiteEditWindow(0);stopBubble(event);"
                                            ImageUrl="Images/AddNewSite.gif" ToolTip="Add New Site" />
                                    </div>
                                </td>
                                
                                <td valign="top" class="column">
                                    <div style=" overflow:auto; height:300px">
                                    <asp:Repeater ID="RptStorage" runat="server">
                                        <ItemTemplate>
                                            <div id="Storage_<%# Eval("StorageId") %>" class="StorageItem" onclick="submitItem('Storage', '<%# Eval("StorageId") %>');">
                                                <img alt="Click to edit Storage/Rack" id="StorageBtn" class="StorageDetailsIcon" src="Images/Buttton_info_small.png" onclick="launchStorageEditWindow(<%# Eval("StorageId") %>,this);stopBubble(event);" /><span><%# Eval("StorageName")%></span>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    </div>
                                    <div style="text-align:center; padding-bottom:5px; padding-top:5px;">
                                        <asp:ImageButton ID="addStorageBtn" runat="server" OnClientClick="launchStorageEditWindow(0);stopBubble(event);"
                                            ImageUrl="Images/AddNewStorage_Off.gif" Enabled="false" ToolTip="Add New Storage" />
                                    </div>
                                </td>
                                
                                <td valign="top" class="column">
                                    <div style=" overflow:auto; height:300px">
                                    <asp:Repeater ID="RptContainer" runat="server">
                                        <ItemTemplate>
                                            <div id="Container_<%# Eval("ContainerId") %>" class="StorageItem" onclick="submitItem('Container', '<%# Eval("ContainerId") %>');">
                                                <img alt="Click to edit Container/Bin" id="ContainerBtn" class="StorageDetailsIcon" src="Images/Buttton_info_small.png" onclick="launchContainerEditWindow(<%# Eval("ContainerId")%>,this);stopBubble(event);" /><span><%# Eval("ContainerName")%></span>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    </div>
                                    <div style="text-align:center; padding-bottom:5px; padding-top:5px;">
                                        <asp:ImageButton ID="addContainerBtn" runat="server" OnClientClick="launchContainerEditWindow(0);stopBubble(event);"
                                            ImageUrl="Images/AddNewContainer_Off.gif" Enabled="false" ToolTip="Add New Container" />
                                    </div>
                                </td>
                                
                                <td valign="top">
                                    <div style=" overflow:auto; height:300px">
                                    <asp:Repeater ID="RptBoxes" runat="server">
                                        <ItemTemplate>
                                            <div id="Box_<%# Eval("BoxId") %>"  class="StorageItem" style="background-image: none;"  onclick="launchBoxEditWindow(<%# Eval("BoxId")%>,this);stopBubble(event);" >
                                                <img alt="Click to view Box details" id="BoxesBtn" class="StorageDetailsIcon" src="Images/Buttton_info_small.png" onclick="launchBoxEditWindow(<%# Eval("BoxId")%>,this);stopBubble(event);" /><span><%# Eval("BoxName")%></span>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    </div>
                                    <div  class="StorageItem"  style="text-align:center; padding-bottom:5px; padding-top:5px;">
                                        <asp:ImageButton ID="addBoxBtn" runat="server" OnClientClick="launchBoxEditWindow('');stopBubble(event);"
                                            Enabled="false" ImageUrl="Images/AddNewBox_Off.gif" ToolTip="Add New Box" />
                                    </div>
                                </td>
                           
                            </tr>
                        
                        </table>
                    </td>
                </tr>
               
            </table>
        </div>
    </form>
</body>
</html>
