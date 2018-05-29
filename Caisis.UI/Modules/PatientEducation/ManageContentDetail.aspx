<%@ Page ValidateRequest="false" Language="C#" AutoEventWireup="true" CodeFile="ManageContentDetail.aspx.cs" Inherits="Modules_PatientEducation_ManageContentDetail" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >

<head runat="server">
    <title>Caisis: Patient Education - Manage Content Detail</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
	<link href="../../StyleSheets/MenuStyles.css" type="text/css" rel="stylesheet" />
	<link href="PtEdStyles.css" type="text/css" rel="stylesheet" />
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script type="text/javascript">
	var RTE_ID = 'SubTopicContentRTE';
	// Custom function which is called when browser is resized and page loaded.
	function resizeRichTextEditor(width,height)
	{
	    var textEditor = $('<%= SubTopicContentRTE.ClientID %>');
	    if(textEditor)
	    {
	        var iframes = textEditor.parentNode.getElementsByTagName('iframe');
	        if(iframes.length>0)
	        {
	            textEditor.style.height = (height - 455) + 'px';
	            iframes[0].style.height = (height - 455) + 'px';
	        }
	    }
	}
    Browser.ResizeElement( { customResizer: resizeRichTextEditor});	
	</script>
</head>

<body style="background-color:#ffffff;">
    <form id="form1" runat="server">
        <%--<asp:Label ID="btnType" runat="server">aa</asp:Label> --%>
        <asp:HiddenField ID="btnType" runat="server" />
        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color: #ffffff; height: 100%;">
            <tr>
                <td>
                    <!-- Add New Node -->
                    <%--<div id="addNewDiv" runat="server" visible="false" style="display: none;">
                        <cc:CaisisTextBox ID="newName" runat="server" FieldLabel="Collection Name " Width="275" MaxLength="200"></cc:CaisisTextBox>
                        <asp:ImageButton ID="btnSubmit" runat="server" OnClick="btnSubmit_onClick" ImageUrl="../../images/submit.gif" />
                    </div> --%>
                     
                    <!-- Section Node -->
                    <div id="sectionEditDiv" runat="server" visible="false" style="display: none;">
                        Heading 
                        <cc:CaisisTextBox ID="SectionTitleTxtBox" runat="server" Width="350" MaxLength="200"></cc:CaisisTextBox>
                        <br />
                        <cc:CaisisTextBox ID="SectionDesc" runat="server" Width="99%" Height="75" />
                    </div>
                    <!-- Topic Node -->
                    <div id="topicEditDiv" runat="server" visible="false" style="display: none;">
                        <asp:Label ID="SectionTitle" runat="server" CssClass="mediumUneditableHeading"></asp:Label>
                        Heading
                        <cc:CaisisTextBox ID="TopicTitleTxtBox" runat="server" Width="350" Height="15" />
                        <br />
                        <cc:CaisisTextBox ID="TopicDesc" runat="server" Width="99%" Height="75" Wrap="true" TextMode="MultiLine" />
                    </div>
                    <!-- SubTopic Node -->
                    <div id="subTopicEditDiv" runat="server" visible="false" style="display: none;">
                        <asp:Label ID="StSectionTitle" runat="server" CssClass="largeUneditableHeading"></asp:Label>
                        <asp:Label ID="StTopicTitle" runat="server" CssClass="mediumUneditableHeading"></asp:Label>
                        Heading
                        <asp:TextBox ID="SubTopicTitleTxtBox" runat="server" Width="350" Height="15"></asp:TextBox>
                        <br />
                        <br />
                        <cc:CaisisRichTextEditor ID="SubTopicContentRTE" runat="server" ToolbarSet="patiented" Height="330"
                           FileUploadDirectory="PatientEdImages" FileUploadCaption="Patient Ed Images"  FloatingMode="false" Resizable="false" ModeStripVisible="true" Width="610">
                        </cc:CaisisRichTextEditor>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
