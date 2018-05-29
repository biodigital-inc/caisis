<%@ Page language="c#" Inherits="Caisis.UI.Core.Eforms.EFormViewer" CodeFile="EFormViewer.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.EFormBasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>EFormViewer</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet">
    <script language=javascript>
		// empty functions :should not be able to edit forms displayed in the viewer
		function editDE(deId){}
		function updateDE(value, elementId){}
    </script>
  </head>
  <BODY leftMargin="0" topMargin="0" rightMargin="0" style="background-color: #004256;">
  
  
  
  	 <br/>
	
	
	

    
		<table width="100%" border="0" cellpadding="0" cellspacing="0" >  
  				<tr><td align="center">
	
  		<table width="990" border="0" cellpadding="0" cellspacing="0" class="eformViewerBG">  
    <tr>
    <td width="*" align="center" valign="top" width="170">
    <asp:Label ID="eformTitle" CssClass="eformTitle" ForeColor="#ffffff" Runat="server" />
    
    
    <a target=_top href="../Utilities/EmptyContainer.aspx?TaskPage=Inbox.aspx" style="color:white"><img src="../../Images/BackToEform.gif" height="25" width="107" border="0" /></a>
   
    
    
    
    
    
    </td>
    
    <td align="center" width="820">


						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td><img src="../../Images/shim.gif" height="6" width="1" border="0" /></td>
							</tr>
							<tr>
								<td ><div STYLE="Z-INDEX: 7; VISIBILITY: visible; OVERFLOW: auto;  WIDTH: 755px;  HEIGHT: 455px; BACKGROUND-COLOR: #f2f3f5" id="theReport" runat="server"></div>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
						</table>
		</td></tr>
		<tr><td align="right" height="36">
				  &nbsp;
		</td></tr>
		</table>
		</td></tr>
		</table>
	
		
  </body>
</html>
