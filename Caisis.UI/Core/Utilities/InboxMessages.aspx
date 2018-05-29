<%@ Page language="c#" Inherits="Caisis.UI.Core.Utilities.InboxMessages" CodeFile="InboxMessages.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>InboxMessages</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
	<LINK href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
	<script src="../../ClientScripts/PatientData.js" type="text/javascript"></script>
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
    
    
  </head>
  <body id="InboxMessagesBody" runat="server">
	<table cellpadding="0" cellspacing="0" border="0" width="733">
	<tr>
	<td>
	
	
		<table id="InboxTable" width="733" border="0" cellpadding="4" cellspacing="0" class="ListManBGTableBody">
           <tr> 
               <td width="100" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;&nbsp;Date</td>
               <td width="200" class="ListManDataTableTop">Subject</td>
               <td width="433" class="ListManDataTableTop" style="TEXT-ALIGN: left">&nbsp;&nbsp;&nbsp;&nbsp;Message</td>
           </tr>
        </table>
                 
	
	
	</td>
	</tr>
	<tr>
	<td>
				<table id="InboxTableTitles" width="733" border="0" cellpadding="4" cellspacing="0" class="ListManDataTableOuterBorder"  >
                 	<asp:Repeater ID="rptInbox" Runat=server OnItemCreated="rptItemCreated" >
								<ItemTemplate>
									<tr id="listRow" runat="server" class="ListManDataTableRow" valign="middle" onmouseover="this.className='ListManDataTableRowOver'" onmouseout="this.className='ListManDataTableRow';"> 
										<td width="100" valign="top"><%# DataBinder.Eval(Container.DataItem, "EnteredTime", "{0:d}") %></td>
										<td width="200" align="left" valign="top"><%# ((System.Data.DataRowView)Container.DataItem)["CurrentStatus"]%>&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["EFormName"]%></td>
										<td width="433" valign="top"><asp:Literal ID="inboxMessage" Runat=server/></td>
									</tr>
								</ItemTemplate>
								<SeparatorTemplate>
									<tr> 
										<td height="1" colspan="3" class="ListManDataTableDottedLine"><img src="../../Images/shim.gif" width="1" height="1"></td>
									</tr>
								</SeparatorTemplate>
								<FooterTemplate>
									<tr> 
										<td height="1" colspan="3" class="ListManDataTableBottomBorder"><img src="../../Images/shim.gif" width="1" height="1"></td>
									</tr>
								</FooterTemplate>
							</asp:Repeater>
                 </table>
	</td>
	</tr>
	</table>
  </body>
</html>
