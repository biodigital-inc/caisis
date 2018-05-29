<%@ Page ValidateRequest="false" Language="C#" AutoEventWireup="true" CodeFile="ManageContent.aspx.cs" Inherits="Modules_PatientEducation_ManageContent" %>
<%@ Register TagPrefix="spaw" Namespace="Solmetra.Spaw2" Assembly="Solmetra.Spaw2" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Caisis: Patient Education - Manage Content</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
	<link href="../../StyleSheets/MenuStyles.css" type="text/css" rel="stylesheet" />
	<link href="PtEdStyles.css" type="text/css" rel="stylesheet" />
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/Menu.js" type="text/javascript"></script>
    <script src="PatientEdScripts.js" type="text/javascript"></script>
    <script type="text/javascript">
        // Resize frame
        //Browser.ResizeFrame({ heightOffset: 100, widthOffset: 10 });
        Browser.ResizeFrame({ heightOffset: 50 });
        
        // Resize Left and Right Navigation and Content divs
        //Browser.ResizeElement({nodeId: 'LeftDiv', heightOffset: 240 },{nodeId: 'RightDiv', heightOffset: 240, widthOffset: 400 },{nodeId: 'ContentDetail', heightOffset: 220,  widthOffset: 415  }, { nodeId: 'PrintingContainer', heightOffset: 230} );
        Browser.ResizeElement({nodeId: 'LeftDiv', heightOffset: 220 },{nodeId: 'RightDiv', heightOffset: 200 },{nodeId: 'ContentDetail', heightOffset: 220}, { nodeId: 'PrintingContainer', heightOffset: 230} );
        
        var lastNodeId = '';
        
        function saveContentDetail()
        {   
            // set button click type
            //cleanContentDetails();
            window.frames['ContentDetail'].document.forms[0].btnType.value = 'save';
            window.frames['ContentDetail'].document.forms[0].submit();
        }
        
        function cleanContentDetails(txtArea)
        {
            var detailsWindow = window.frames['ContentDetail'];
            if(detailsWindow.SpawEngine)
            {
                var editor = detailsWindow.SpawEngine.getEditor(detailsWindow.RTE_ID);
                var editorPage = editor.getPage(detailsWindow.RTE_ID);

                if(editor)
                {
                    var txtarea = editor.getPageInput(editor.name);
                    if(txtarea)
                    {
                        var raw = txtarea.value;
                        var tmp = document.createElement('DIV');
                        tmp.innerHTML = raw;

                        var elementsToClean = ['UL','LI'];
                        for(var a=0;a<elementsToClean.length;a++)
                        {
                            var ele = elementsToClean[a];
                            var list = tmp.getElementsByTagName(ele);
                            cleanDirtyHtmlElements(list);
                         }
                        var cleanHTML = tmp.innerHTML;
                        txtarea.value = cleanHTML;
                        
                       editor.updatePageDoc(editorPage);
                    }
                }
            }
        }
        
        function cleanDirtyHtmlElements(l)
        {
            for(var i=0;i<l.length;i++)
            {
                var node = l[i];
                var brs = node.getElementsByTagName('BR');
                // Copies elements into tmp area
                var tmp = new Array();
                for(var x=0;x<brs.length;x++) { tmp.push(brs[x]); }
                for(var j=0;j<tmp.length;j++)
                {
                    var br = tmp[j];
                    var par = br.parentNode;
                    par.removeChild(br);
                }
            }
         }
        
        function reloadContentPage(contentType,contentId)
        {
            // New sections will have empty type and id, but still need to reload page
            if(contentType=='' && contentId=='') { window.location.href = 'ManageContent.aspx'; }
            // New Topics and Subtopics need to reload page with path to new node inserted
            else
            {
                window.location.href = 'ManageContent.aspx?contentType=' + contentType + '&contentId=' + contentId + '&mode=Single';
            }
        }
        
        function resetContentDetail() 
        {   
            window.frames['ContentDetail'].document.forms[0].reset(); 
           
            //alert(window.frames['ContentDetail'].document.form1.SubTopicContentRTE.value);
            
            //NOTE: SubTopic text is not being reset to initial value
            //'SubTopicContentRTE' is the textarea in ManageContentDetail's SPAW2 text editor
        }
       
        function clearFramePage()
        {
            document.getElementById('ContentDetail').src = "ContentPrintPage.aspx";
            setPageTitle('');
            $('newNodeBtns').style.display = "none";
            hideDeleteButtons();
        }
        function showNewButtons(nodeType)  
        {
            $('existingNodeBtns').style.display = "none";
            $('newNodeBtns').style.display = "inline";
        }
        
        function showExButtons()  
        {
            $('existingNodeBtns').style.display = "inline";
            $('newNodeBtns').style.display = "none";
        }
        
        function showAddButton(type)
        {   
            var btnId = "";
            var deleteBtnId = "";
            
            switch(type)
            {
                case 1: //selected Section, so we show button to add Topic to this Section
                  btnId = "AddNewTopicBtn";
                  deleteBtnId = "deleteSectionBtn";
                  break;    
                case 2: //selected Topic, so we show button to add SubTopic to this Topic
                  btnId = "AddNewSubTopicBtn";
                  deleteBtnId = "deleteTopicBtn";
                  break;
                case 3:
                  deleteBtnId = "deleteSubTopicBtn";
                  break;
                default: 
            }
            
            hideAddButtons();
            if(btnId != "")
            {
                $(btnId).style.display = "inline";
            }
            
            hideDeleteButtons();
            if(deleteBtnId != "")
            {
                $(deleteBtnId).style.display = "inline";
            }
        }
        
        function hideAddButtons()
        {
            $('AddNewTopicBtn').style.display = "none";
            $('AddNewSubTopicBtn').style.display = "none";
        }
        
        function hideDeleteButtons()
        {
            $('deleteSectionBtn').style.display = "none";
            $('deleteTopicBtn').style.display = "none";
            $('deleteSubTopicBtn').style.display = "none";
        }
        
        function setHiddenTitles(sectionId,sectionTitle,topicId,topicTitle,subTopicId,subTopicTitle,e)
        {
            var span;
            // See if tree node (span tag) was firing element
            if(e) { span = e.srcElement || e.target; }
            // Else lookup node by type + id
            else if(subTopicId!='') { span = $('SubTopic'+subTopicId); }
            else if(topicId!='') { span = $('Topic'+topicId); }
            else if(sectionId!='') { span = $('Section'+sectionId); }
            else { return; }
            
            var newSectionBtn = $('AddNewSectionBtn');
            var newTopicBtn = $('AddNewTopicBtn');
            var newSubTopicBtn = $('AddNewSubTopicBtn');
            
            var section = '';
            var topic = '';
            var subTopic = '';

            // Section was clicked
            if(topicId==''&&subTopicId=='')
            {
                if(!span.sectionName){ span.sectionName = sectionTitle; }
                section = sectionTitle;
                // Set Button Labels
                newTopicBtn.insertingSection = span;
                //newTopicBtn.newPageTitle = span.sectionName;
                newTopicBtn.href = 'ManageContentDetail.aspx?type=2&sectionId=' + sectionId;
                showAddButton(1);
                
                var newNodeId = 'Section'+sectionId;
                setNodeClassName(lastNodeId, newNodeId);
                lastNodeId = newNodeId;
            }
            // Topic Was Clicked
            else if (subTopicId=='')
            {
                if(!span.topicName){ span.topicName = topicTitle; }
                if(!span.parentSection)
                {
                    var parentSection = $('Section'+sectionId);
                    span.parentSection = parentSection;
                    if(!span.parentSection.sectionName) { span.parentSection.sectionName = sectionTitle; }
                }
                section = span.parentSection.sectionName;
                topic = span.topicName;
                // Set Button Labels
                newTopicBtn.insertingSection = span.parentSection;
                
                newSubTopicBtn.insertingSection = span.parentSection;
                newSubTopicBtn.insertingTopic = span;

                newSubTopicBtn.href = 'ManageContentDetail.aspx?type=3&sectionId=' + sectionId + '&topicId=' + topicId;
                showAddButton(2);

                var newNodeId = 'Topic'+topicId;
                setNodeClassName(lastNodeId, newNodeId);
                lastNodeId = newNodeId;
            }
            // SubTopic Was Clicked
            else
            {
                if(!span.subTopicName){ span.subTopicName = subTopicTitle; }
                if(!span.parentTopic)
                { 
                    var parentTopic = $('Topic'+topicId);
                    span.parentTopic = parentTopic;
                    if(!span.parentTopic.topicName) { span.parentTopic.topicName = topicTitle; } 
                }
                if(!span.parentTopic.parentSection)
                {
                    var parentSection = $('Section'+sectionId);
                    span.parentTopic.parentSection = parentSection;
                    if(!span.parentTopic.parentSection.sectionName) { span.parentTopic.parentSection.sectionName = sectionTitle; }
                }
                section = span.parentTopic.parentSection.sectionName;
                topic = span.parentTopic.topicName;
                subTopic = span.subTopicName;
                
                showAddButton(3);
                 
                var newNodeId = 'SubTopic'+subTopicId;
                setNodeClassName(lastNodeId, newNodeId);
                lastNodeId = newNodeId;
            }
            setPageTitle(section,topic,subTopic);
        }
        
        function setNodeClassName(oldNodeId, newNodeId)
        {   
            if(oldNodeId != '')
            {
                $(lastNodeId).className = "manageNode";
            }
            $(newNodeId).className = "selectedManageNode";
        } 
        
        
        // Gets a friendly's title text (section > topic > subtopic)
        function getTitleText(section,topic,subTopic)
        {
            var title = section;
            var gt =' &nbsp;&gt;&nbsp; '; 
            if(topic!=null && topic!='') { title+= gt + topic; }
            if(subTopic!=null && subTopic!='') { title+= gt + subTopic; }
            return title;
        }
        
        // Set the page title
        function setPageTitle(section,topic,subTopic)
        { 
            var titleNode = $('nodePath');
            titleNode.innerHTML = getTitleText(section,topic,subTopic);
        }
        
        function setAddNewSectionTitle() { $('nodePath').innerHTML = 'Add New Section';  hideDeleteButtons();}
        
        function setAddNewTopicTitle()
        {
            var newTopicBtn = $('AddNewTopicBtn');
            var sectionName = getTitleText(newTopicBtn.insertingSection.sectionName);
            $('nodePath').innerHTML = 'Add New Topic to: &nbsp;' + sectionName;
            hideDeleteButtons();
        }
        
        function setAddNewSubTopicTitle()
        {
            var newSubTopicBtn = $('AddNewSubTopicBtn');
            var sectionName = newSubTopicBtn.insertingSection.sectionName;
            var topicName = newSubTopicBtn.insertingTopic.topicName;
            var path = getTitleText(sectionName,topicName);
            $('nodePath').innerHTML = 'Add New SubTopic to: &nbsp;' + path;
             hideDeleteButtons();
        }
    
        // All Nodes have DOM id="typeid"
        function updateNodeTitle(type,id,title)
        {
            var DOMid = type+id;
            var node = $(DOMid);
            var section = '';
            var topic = '';
            var subTopic = '';
            if(node) 
            { 
                // Determine which type of node is updating, and get titles
                // from parent section,topic if needed.
                switch(type)
                {
                    case 'Section':
                        node.sectionName = title;
                        section = node.sectionName;
                        break;
                    case 'Topic':
                        node.topicName = title;
                        section = node.parentSection.sectionName;
                        topic = node.topicName;
                        break;
                    case 'SubTopic':
                        node.subTopicName = title;
                        section = node.parentTopic.parentSection.sectionName;
                        topic = node.parentTopic.topicName;
                        subTopic = node.subTopicName;
                        break;
                    default:
                }
                // Update hyperlink title/tooltip
                if(node.parentNode.nodeName=='A') { node.parentNode.title = title; }
                // Set next node title
                node.innerHTML = title;
                // Update page title
                setPageTitle(section,topic,subTopic);
            }
        }

        function deleteNode(type)
        {
            var message = "";
            
            switch(type)
            {
                case 1: //attempt to delete Section
                    message = 'Are you sure you want to remove this section? Removing the section will also delete all its topics and sub-topics.';
                    break;
                case 2: //attempt to delete Topic
                    message = 'Are you sure you want to remove this topic? Removing the topic will also delete all its sub-topics.';
                    break;                    
                case 3: //attempt to delete SubTopic
                    message = 'Are you sure you want to remove this sub-topic?';
                    break;
                default:
            }
            
            if (confirm(message))
            {
                 setCallBackType('delete');
                 document.form1.submit();
            }
        }
        Event.Register('load',window,wireEventsOnLoad);
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="treeInfoLevel" runat="server" />  
        <asp:HiddenField ID="SelectedSectionTitle" runat="server" />  
        <asp:HiddenField ID="SelectedTopicTitle" runat="server" />  
        <asp:HiddenField ID="SelectedSubTopicTitle" runat="server" />
        <asp:HiddenField ID="_callbackType" runat="server" />
        
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color: #f8fafc; height: 100%;">
            <tr>
                <td align="center">
                    <table width="910" border="0" cellspacing="0" cellpadding="0" style="text-align:left;">
                        <tr><td style="height: 5px;" colspan="2"><img src="../../Images/shim.gif" width="1" height="1" /></td></tr>
                        <!-- Page Title -->
                        <tr>
                            <td colspan="1"  style="text-align:left; padding-top:5px;">
                                <asp:Label ID="ResultsTitle" runat="server" CssClass="ListManTitle">Manage Content</asp:Label>
                               
                            </td>
                            <td valign="bottom">
                                 <div id="ddlsDiv"  runat="server" style="margin-top:10px; padding:0px; margin-bottom:0px;">
                                     Disease&nbsp;<cc:CaisisSelect ID="ddlDiseaseType" Table="PatientEdDisease" Field="DiseaseName" Value="DiseaseId" LabelClass="label" ShowLabel="False"
                                        runat="server" AutoPostBack=true OnSelectedIndexChanged="LoadPacketDDL" Width="110">
                                     </cc:CaisisSelect>
                                     &nbsp;&nbsp;
                                     Visit&nbsp;<cc:CaisisSelect ID="ddlVisitType" Table="PatientEdVisitType" Field="VisitTypeName" Value="VisitTypeId" LabelClass="label" AutoPostBack="True" OnSelectedIndexChanged="LoadPacketDDL" ShowLabel="False"
                                        runat="server" Width="130">
                                     </cc:CaisisSelect>
                                     &nbsp;&nbsp;
                                     Packet&nbsp;<cc:CaisisSelect ID="ddlPacketName" LabelClass="label" AutoPostBack=true ShowLabel="False" OnSelectedIndexChanged="LoadPacket" runat="server" Width="130">
                                     </cc:CaisisSelect>
                                     <cc:CaisisTextBox Width="100" ID="txtPacketName" LabelClass="label" ShowLabel=false runat=server Visible=false></cc:CaisisTextBox>               
                                 </div>
                                <table>
                                    <tr>
                                        <td width="90%">
                                            <asp:Label ID="nodePath" runat="server" CssClass="nodePathTitle"></asp:Label>
                                        </td>
                                        <td width="10%">
                                            <img id="deleteSectionBtn" onclick="deleteNode(1);" alt="Delete Section" title="Delete Section" src="Images/deleteSection.gif" class="btnImageLink" style="display: none;"/>
                                            <img id="deleteTopicBtn" onclick="deleteNode(2);" alt="Delete Topic" title="Delete Topic" src="Images/deleteTopic.gif" class="btnImageLink" style="display: none;"/>
                                            <img id="deleteSubTopicBtn" onclick="deleteNode(3);" alt="Delete SubTopic" title="Delete SubTopic" src="Images/deleteSubTopic.gif" class="btnImageLink" style="display: none;"/>
                                        </td>
                                    </tr>
                                
                                </table>
                            </td>
                        </tr>
                    
                        <tr>
                            <td valign="top">
                                <div id="LeftDiv" style="background-color:#F1F7FC; width:275px; height:600px; margin-right:20px; margin-top:10px; margin-bottom:10px; padding:10px; border:solid 1px #cccccc; overflow: auto;">
                                    <asp:TreeView ID="contentTV" runat="server" OnTreeNodePopulate="TreeNode_Populate" ImageSet="Arrows" NoExpandImageUrl="../../Images/treeview_collapsed.gif" 
                                        ShowLines="true" CollapseImageUrl="../../Images/treeview_collapsed.gif" ExpandImageUrl="../../Images/treeview_expanded.gif" Target="ContentDetail">
                                       <%-- <LevelStyles>
                                            <asp:TreeNodeStyle ImageUrl="../../Images/icon_encounters.gif" HorizontalPadding="5" />
                                            <asp:TreeNodeStyle ImageUrl="../../Images/icon_protocols.gif" HorizontalPadding="5" />
                                        </LevelStyles>--%>
                                    </asp:TreeView>
                                </div>
                            </td>
                          
                             <td valign="top">
                                 <div id="RightDiv"  style="background-color:#FFFFFF; width:630px; height:100px; margin-top:10px;  margin-bottom:10px; border:solid 1px #cccccc;">
                                    <iframe id="ContentDetail" name="ContentDetail" runat="server"  src="ContentPrintPage.aspx" frameborder="0" style="background-color:#FFFFFF; width: 610px; height: 700px; margin: 10px;">
                                    </iframe>
                                 </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:325px; text-align:left;">
                                <div id="addNewBtnsDiv" runat="server">
                                    <a id="AddNewSectionBtn" href="ManageContentDetail.aspx?type=1" target="ContentDetail"
                                        title="Add New Section" style="margin-left: 25px; margin-right: 15px;" onclick="setAddNewSectionTitle();">
                                        <img alt="Add New Section" title="Add New Section" src="Images/addNewSection.gif" class="btnImageLink" /></a>
                                    <a id="AddNewTopicBtn" href="ManageContentDetail.aspx?type=2" target="ContentDetail"
                                        title="Add New Topic" style="display: none;" onclick="setAddNewTopicTitle();">
                                        <img alt="Add New Topic" title="Add New Topic" src="Images/addNewTopic.gif" class="btnImageLink"/></a>
                                    <a id="AddNewSubTopicBtn" href="ManageContentDetail.aspx?type=3" target="ContentDetail"
                                        title="Add New Sub Topic" style="display: none;" onclick="setAddNewSubTopicTitle();">
                                        <img alt="Add New SubTopic" title="Add New SubTopic" src="Images/addNewSubTopic.gif" class="btnImageLink"/></a>
                                </div>
                            </td>
                            <td style="text-align:center; vertical-align:top;">
                                <div id="existingNodeBtns" style="display:none;" runat="server">
                                    <img id="SaveContentBtn" onclick="saveContentDetail();" alt="Save Content" title="Save Content" src="../../Images/SaveContentBtn.gif" style="cursor:pointer;"/>
                                    <img id="ResetContentBtn" onclick="resetContentDetail();" alt="Reset Content" title="Reset Content" src="../../Images/ResetContentBtn.gif" style="cursor:pointer;"/>
                                </div>
                                <div id="newNodeBtns" style="display:none;">
                                    <img id="SaveAddNew" onclick="saveContentDetail();" alt="Save" title="Save" src="../../Images/SaveContentBtn.gif" style="cursor:pointer;"/>
                                    <img id="CancelAddNew" onclick="clearFramePage();" alt="Cancel" title="Cancel" src="../../Images/CancelOnWhite_small.gif" style="cursor:pointer;" />
                                </div>
                                <div id="defaultDocBtns" runat="server">
                                    <asp:ImageButton id="saveDefaultDocBtn" runat="server" OnClick="SaveDefaultDocument" OnClientClick="$(_callbackType).value='save';" ImageUrl="Images/SavePacketBtn.gif" ToolTip="Save Packet" />
                                    <asp:ImageButton runat="server" ToolTip="Cancel Changes" ImageUrl="Images/CancelChangesBtn.gif" />
                                     <asp:ImageButton ID="BtnDeletePacket" OnCommand="DeletePacket" runat="server" ToolTip="Delete this packet" Visible="false" ImageUrl="Images/DeletePacketBtn.gif" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
