<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddComments.aspx.cs" Inherits="Caisis.UI.Core.Plugins.AddComments" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
   <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
</head>
<body><form id="AddCommentsForm" runat="server">     
    <div style="width:98%; background-color:#ffffff; padding: 3px; color: #333333;">
       <asp:Label ID="NarrativeTitle" runat="server" Font-Bold="true">Narrative:<br /><br style="line-height: 3px;" /></asp:Label>

    
        <div id="commentDiv" runat="server" style="overflow:auto; max-height:60px; margin-bottom: 15px;">
            <asp:Repeater ID="RptComments" runat="server">
                <HeaderTemplate><table cellpadding="2" cellspacing="0" border="0"></HeaderTemplate>
                <ItemTemplate>
                   <tr><td valign="top" style="white-space: nowrap;">
            	        <strong> <%# DataBinder.Eval(Container.DataItem, "EnteredTime", "{0:d}") %> &nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["NarratedBy"]%>&nbsp;:&nbsp;</strong>
				   </td><td valign="top" >
				        <%# ((System.Data.DataRowView)Container.DataItem)["Narrative"]%>	
				   </td></tr>			
                </ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
               
            </asp:Repeater>
        </div>
        
        
       
        <strong>Add a narrative: </strong><br /><textarea style="width:400px; height: 40px;" ID="NewComment" runat="server"></textarea> 
        <br /><asp:ImageButton ImageUrl="../../Images/add.gif" runat="server"  ID="submit" />
        
</div></form>
</body>
</html>
