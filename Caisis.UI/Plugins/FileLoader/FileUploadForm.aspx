<%@ Page MaintainScrollPositionOnPostback="true" Language="c#" Inherits="Caisis.UI.Plugins.FileLoader.FileUploadForm"
    CodeFile="FileUploadForm.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<%@ Reference Control="~/Plugins/FileLoader/FileLoaderPlugin.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>Image Loader - Beta</title>
    <meta http-equiv="Content-Disposition" content="inline;" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="expires" content="-1" />
    <meta http-equiv="cache-control" content="no-store" />
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <style type="text/css">
		.rounded_table {
		    width: 500px; 
		    border: 1px solid #999999; 
		    padding: 0px; 
		    border-spacing: 0px; 
		    background-color: #F1F7FC;
		    vertical-align: text-top;
		    text-align: left;
	    }
	    
	    .cell_header
	    {
	        font-weight: bold;
	    }
	          
	    .ThumbnailExplorer
	    {
	        overflow: auto; 
	        width: 150px; 
	        height: 600px; 
	        border: none;
	        background-color: #f1f7fc;
	        border: 1px solid #999999;
	        margin: auto;
	        padding-top: 10px;
	        padding-bottom: 10px;
	    }
	    .ThumbImageOff
	    {
	        vertical-align: middle;
	        margin-right:2px;
	        
	    }
	    .ThumbImageOn
	    {
	        vertical-align: middle;
	        margin-right:2px;
	    }
	    	    
	    .thumbContainer
	    {
	        border: none;
	        border-collapse: separate;
	        margin-right: 5px;
	    }
	    .ThumbLabel
	    {
	        display: block;
	        font-weight: bold;
	        text-decoration: none;
	    }
	    .ThumbItem
	    {
	        text-align: center;
	        margin: 5px auto 5px auto;
	    }
		</style>
    <!-- CLIENT-SIDE VALIDATION -->

    <script language="javascript" type="text/javascript">
	    
		// Validates allowable file types, also need to check on server side
		function validateFields()
		{
		    var fileTypes = new Array(<%= getExtArray() %>);
		    var errors = true;
		    var filename = document.getElementById('FileToUpload').value;
		    for (var i=0;i<fileTypes.length;i++)
		    {
		       var typeString = fileTypes[i].toString().toLowerCase();
		       var fileExtensionString = "." + getExtension(filename.toLowerCase());
		       if ( typeString == fileExtensionString )
		       {
		           errors = false;
		       }
		    }
		    
		    if (errors)
		    {
		        alert("Please choose a valid file type: " + fileTypes.toString());
		        return false;
		    }

		    else
		    {
		        return true;
		    }
		}
		
		// Get extension from string
		function getExtension(string)
		{
		    var testString = new String(string);
		    var lastIndex = testString.lastIndexOf(".");
		    
		    // If no period(".") or period is last char, return ""
		    if (lastIndex == -1 || lastIndex == testString.length-1)
		    {
		        return "";
		    }
		    // Else return string after "."
		    else
		    {
		        var ext = "";
		        for (var i=lastIndex+1;i<testString.length;i++)
		        {
		           ext+= testString.charAt(i);
		        }
		        return ext;
		    }
		}
		
    </script>

    <!-- CLIENT-SIZE HELPERS -->

    <script runat="server" language="C#">
        // Gets a string representation "ext1,ext2,...etc" of the file extensions 
        // used to validate upload of proper types        
        string getExtArray()
        {
            string[][] sa = new string[][] { IMG_EXTENSIONS, DOC_EXTENSIONS };
            string extList = "";
            foreach (string[] tmp in sa)
            {
                foreach (string s in tmp)
                {
                    extList += "\'" + s + "\',";
                }
            }
            extList = extList.Remove(extList.Length - 1);
            return extList;
        }

        string getInvalidDocExts()
        {
            string extList = "";
            foreach (string s in DOC_EXTENSIONS)
            {
                extList += "\'" + s + "\',";
            }
            extList = extList.Remove(extList.Length - 1);
            return extList;
        }

        
    </script>

    <script language="javascript" type="text/javascript">
	
	// helper functions
	function posLeft() {return typeof window.pageXOffset != 'undefined' ? window.pageXOffset:document.documentElement.scrollLeft? document.documentElement.scrollLeft:document.body.scrollLeft? document.body.scrollLeft:0;}
	function posTop() {return typeof window.pageYOffset != 'undefined' ? window.pageYOffset:document.documentElement.scrollTop? document.documentElement.scrollTop: document.body.scrollTop?document.body.scrollTop:0;}
	function posRight() {return posLeft() + getWidth();}
	function posBottom() {return posTop()+ getHeight();}
	
	var naturalImageWidth;
	var naturalImageHeight;
	var maxWindowHeight = screen.height - 70;
	var maxWindowWidth = screen.width - 40;
	var startingWindowHeight = 800;		// starting height from the refering js function - jf
	var startingWindowWidth = 900;		// starting width  from the refering js function - jf
	var heightCushion = 200;			// the amount of vertical cushion required by the Caisis table - jf
	var widthCushion = 70;				// the amount of horizontal cushion required by the Caisis table - jf

	function setZoom(zoomSetting, imageId)
	{
		if (zoomSetting.toString().length > 0)
		{
			if (zoomSetting.toString() == 'Fit')
			{
				fitInWindow(imageId);
			}
			else if (zoomSetting.toString() == 'Full')
			{
				window.resizeTo(maxWindowWidth, maxWindowHeight);
				fitInWindow(imageId);
			}
			else
			{
				determineNaturalImageSize(imageId);
			
				var newWidth = Math.round(naturalImageWidth * zoomSetting);
				var newHeight = Math.round(naturalImageHeight * zoomSetting);
				
				document.getElementById(imageId).style.width = newWidth;
				document.getElementById(imageId).style.height = '';  // this is on purpose - jf
				
				
				// set window size ----------------------------
				setWindowSize(newWidth, newHeight);
			}
		}
	}
	
	function setWindowSize(newWidth, newHeight)
	{
			var newWindowWidth;
			var newWindowHeight;
			if (newWidth > (maxWindowWidth - widthCushion))
			{
				newWindowWidth = maxWindowWidth;
			}
			else if (newWidth < (startingWindowWidth - widthCushion))
			{
				newWindowWidth = startingWindowWidth;
			}
			else newWindowWidth = newWidth + widthCushion;

			
			if (newHeight > (maxWindowHeight - heightCushion))
			{
				newWindowHeight = maxWindowHeight;
			}
			else if (newHeight < (startingWindowHeight - heightCushion))
			{
				newWindowHeight = startingWindowHeight;
			}
			else newWindowHeight = newHeight + heightCushion;
			
			
			window.resizeTo(newWindowWidth, newWindowHeight);
	}
	
	function determineNaturalImageSize(imageId)
	{
	    if(imageId != "")
	    {
		    if (document.getElementById(imageId))
		    {
			    if (!naturalImageWidth)
			    {
				    naturalImageWidth = document.getElementById(imageId).width;
				    naturalImageHeight = document.getElementById(imageId).height;
			    }
		    }
        }
	}
	
	function openingFunctions(elementId)
	{
	    var cell = document.getElementById(elementId);
	    if(cell)
	    {
	        for(var i=0;i<cell.childNodes.length;i++)
	        {
	            var node = cell.childNodes[i];
	            var type = node.nodeName;
	            if( type == 'IMG' || type == 'IFRAME' )
	            {
	                this.window.focus();
	                fitInWindow(node.id);
	            }
	        }
	    }
	}
	
	// image id could also be id of iframe when a document is uploaded
	function fitInWindow(imageId)
	{
        if(imageId == null || imageId == "")
        {
            return;
        }
		determineNaturalImageSize(imageId);
	
		var winW, winH;

		if (navigator.appName.indexOf("Microsoft") > -1) 
		{
			winW = document.body.offsetWidth;
			winH = document.body.offsetHeight;
		}
		else
		{
			winW = window.innerWidth;
			winH = window.innerHeight;
		}

	
		var startingPercentageWidth = 1;
		if (naturalImageWidth > (winW - widthCushion))
		{	
			startingPercentageWidth = (winW - widthCushion) / naturalImageWidth;
		}
		var startingPercentageHeight = 1;
		
		if (naturalImageHeight > (winH - heightCushion))
		{	
			startingPercentageHeight = (winH - heightCushion) / naturalImageHeight;
		}
		
		if (startingPercentageWidth < 1 || startingPercentageHeight < 1)
		{
			if (startingPercentageWidth < startingPercentageHeight)
			{
				document.getElementById(imageId).style.height = '';
				document.getElementById(imageId).style.width = (winW - widthCushion) + 'px';
			}
			else
			{
				document.getElementById(imageId).style.width = '';
				document.getElementById(imageId).style.height = (winH - heightCushion) + 'px';
			}
						
		}
		else  // in this case image is smaller than space
		{
		    var widthFraction = (winW - widthCushion) / naturalImageWidth;
		    var heightFraction = (winH - heightCushion) / naturalImageHeight;


		    if (widthFraction > heightFraction)
		    {
			    document.getElementById(imageId).style.width = '';
			    document.getElementById(imageId).style.height = (winH - heightCushion) + 'px';
		    }
		    else
		    {
			    document.getElementById(imageId).style.width = (winW - widthCushion) + 'px';
			    document.getElementById(imageId).style.height = '';
		    }
		
		
		}
	}
	
    </script>

</head>
<body id="ImageUploadBody" onload="openingFunctions('DocPlaceHolder');">
    <form name="FileUploadForm" id="Form1" method="post" runat="server" enctype="multipart/form-data">
        <input type="hidden" id="FileId" runat="server" />
        <input type="hidden" id="FileExtension" runat="server" />
        <%-- Shows controls to upload the file --%>
        <table id="ContentHolder" style="table-layout: fixed; width: auto;" height="100%"
            cellpadding="0" cellspacing="0" border="0">
            <tr align="center" valign="middle">
                <td style="width: 200px;">
                    <%-- FILE SELECTION PANEL --%>
                    <asp:Panel ID="ThumbnailExplorer" runat="server" CssClass="ThumbnailExplorer">
                        <asp:Repeater runat="server" ID="UploadedFilesRptr" DataSourceID="FilesDataSource"
                            OnItemDataBound="OnThumbsRptrDataBound">
                            <ItemTemplate>
                                <div class="ThumbItem">
                                    <asp:HyperLink runat="server" ID="ThumbLink">
                                        <asp:Image runat="server" ID="ThumbLinkImage" CssClass="ThumbImageOff" />
                                        <asp:Label runat="server" ID="ThumbLabel" CssClass="ThumbLabel"></asp:Label>
                                    </asp:HyperLink>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                    <%-- Data Binding - bind images to Files Business Object --%>
                    <asp:ObjectDataSource runat="server" ID="FilesDataSource" TypeName="Caisis.DataAccess.FilesDa"
                        SelectMethod="GetRecordsByTableAndTablePK">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="tableName" QueryStringField="tableName" Type="String" />
                            <asp:QueryStringParameter Name="tablePrimaryKey" QueryStringField="primaryKey" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <%-- END - FILE SELECTION PANEL --%>
                </td>
                <td align="center">
                    <%-- FILE UPLOAD PANEL --%>
                    <asp:Panel ID="UploadPanel" runat="server">
                        <asp:Label ID="UploadLabel" runat="server" CssClass="ListManTitle" Text="Upload Image or Document" /><br />
                        <br />
                        <table class="rounded_table" id="FileUploadTable" runat="server" style="height: 250px;">
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Label ID="UploadMsg" runat="server" />
                                    <asp:Label ID="ThumbMsg" runat="server" />
                                    <br /><asp:Label ID="UploadErrorMsg" runat="server" ForeColor="Red" />
                                </td>
                            </tr>
                            <tr align="center">
                                <td class="cell_header" align="right" style="width: 160px;">
                                    File
                                </td>
                                <td align="left">
                                    <asp:FileUpload ID="FileToUpload" runat="server" />
                                </td>
                            </tr>
                            <tr align="center">
                                <td class="cell_header" align="right">
                                    File Label
                                </td>
                                <td align="left">
                                    <asp:TextBox runat="server" ID="FileLabel" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:ImageButton ID="btnUpload" OnCommand="UploadBtn_Click" runat="server" Width="65"
                                        Height="26" ImageUrl="../../Images/Upload.gif" OnClientClick="return validateFields();" />
                                    <span style="width: 60px;">&nbsp;</span>
                                    <asp:ImageButton ID="btnCancel" OnCommand="CancelBtn_Click" runat="server" ImageUrl="../../Images/CancelOnWhite.gif"
                                        ImageAlign="TextTop" />
                                </td>
                                <td>
                                    <asp:Image ID="ThumbImg" Visible="false" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <%-- END - FILE UPLOAD PANEL --%>
                    <%-- DOCUMENT VIEWER PANEL - Shows Entire Image with option to update or delete --%>
                    <asp:Panel ID="ViewPanel" runat="server">
                        <asp:Label ID="MainImgTitle" runat="server" CssClass="ListManTitle" /><br />
                        <br />
                        <br />
                        <table class="rounded_table">
                            <tr>
                                <td>
                                    <strong>
                                        <asp:Label ID="ZoomLabel" runat="server"></asp:Label></strong>
                                    <select id="ImageZoomSelector" name="ImageZoomSelector" runat="server">
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" id="DocPlaceHolder">
                                    <asp:Image ID="MainImg" runat="server"></asp:Image>
                                    <asp:PlaceHolder ID="DocumentHolder" runat="server"></asp:PlaceHolder>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <asp:ImageButton ID="AddRecordBtn" ImageUrl="../../Images/UploadAnotherFile.gif"
                            OnCommand="AddRecordBtn_Click" runat="server" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="DeleteBtn" ImageUrl="../../Images/DeleteThisImage.gif" OnCommand="DeleteBtn_Click"
                            OnClientClick="return confirm('Are you sure you want to delete this file?');"
                            runat="server" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="CloseBtn" ImageUrl="../../Images/Close.gif" OnClientClick="window.close();"
                            runat="server" />
                    </asp:Panel>
                    <%-- END - DOCUMENT VIEWER PANEL --%>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
