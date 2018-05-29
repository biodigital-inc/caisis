<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContentPrintPage.aspx.cs"
    Inherits="Modules_PatientEducation_ContentPrintPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Content Printing</title>
    <link href="PtEdScreenStyles.css" rel="stylesheet" type="text/css"  media="screen" />
    <script src="PatientEdScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
		function checkBrowser(){
		this.ver=navigator.appVersion
		this.dom=document.getElementById?1:0
		this.ie5=(this.ver.indexOf("MSIE 5")>-1 && this.dom)?1:0;
		this.ie6=(this.ver.indexOf("MSIE 6")>-1 && this.dom)?1:0;
		this.ie7=(this.ver.indexOf("MSIE 7")>-1 && this.dom)?1:0;
		this.ie4=(document.all && !this.dom)?1:0;
		this.ns5=(this.dom && parseInt(this.ver) >= 5) ?1:0;
		this.ns4=(document.layers && !this.dom)?1:0;
		this.bw=(this.ie5 || this.ie4 || this.ns4 || this.ns5)
		return this
		}
		
		
		bw=new checkBrowser()

		
		
	
    </script>

    

</head>
<body style="background-color:#ffffff;">
    <form id="form1" runat="server"></form>
<div id="DocumentStart" style="text-align: center;">
<div class="PageSize" >
<div id="PatientEdHeader" class="Header"><img class="HeaderImg" src="Images/PatientInformationHeaderBG_3.png"  /><span id="HeaderMarker" />
<div id="PatientEdFooter" class="Footer" style="z-index: -10; position: absolute;">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr><td colspan="3" class="pageBG">&nbsp;</td></tr>
          <tr>
            <td class="FooterTableCell" style="text-align: center;">&copy;<%=System.DateTime.Now.Year %> <asp:Label ID="InstitutionName" runat="server"></asp:Label></td>
            <td class="FooterTableCell" style="text-align: center;">&nbsp;</td>
            <td class="FooterTableCell" style="text-align: center;"><span>Page </span><span id="PageNumber">1</span><span> of </span><span id="TotalPages">1</span> </td>
          </tr>
        </table>
</div>

</div>

        <div id="PrintingContainer">
        </div>
		




</div>
</div>



</body>
</html>
