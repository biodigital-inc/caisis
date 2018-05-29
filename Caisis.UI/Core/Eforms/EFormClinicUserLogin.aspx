<%@ Page language="c#" Inherits="Caisis.UI.Core.Eforms.EFormClinicUserLogin" CodeFile="EFormClinicUserLogin.aspx.cs" %>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 


<html>
  <head>
    <title>EFormClinicUserLogin</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
    <link href="../../StyleSheets/EformStyles.css" type="text/css" rel="stylesheet">
    <script>
    function externalEnableEformListRefresh() {
		if (parent.window.frames['EFormFrame'].window.enableEformListRefresh) {
			parent.window.frames['EFormFrame'].window.enableEformListRefresh();
		}
    }
    </script>
  </head>
  
   <body  style="background-color:#9FABB0; color: #333333;" > 
   <!-- todo: add onsubmit = enable eform refresh -->   
   <form id="form1" runat="server" onsubmit="externalEnableEformListRefresh();">
   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="loginBG">
			<tr  height="80%">
				<td width="1"><img src="../../Images/shim.gif" width="1" height="480" /></td>
				<td align="center" valign="center">
   
   
   		<table width="350" border="0" cellspacing="0" cellpadding="4" class="EFormPopupTable" style="border: solid 1px #8d2a2c; background-color: #F8FAFC;">
			<tr>
				<td class="EFormPopupTitleCell">This session has been locked.</td>
			</tr>
			<tr>
				<td class="EFormPopupCell"><table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="50" class="EFormPopupInstructionText">This session of Caisis has been locked by the previous user. Please enter your username and password below to continue. </td>
					
				</tr>
				</table></td>
			</tr>
			<tr>
				<td valign="top" class="EFormPopupCell" align="center">


		<table align="center"> 
			
			<tr>
				<td colspan="2"><asp:Literal ID="errorMessage" Runat=server></asp:Literal></td>
			</tr>
			<tr>
				<td><strong>User</strong></td>
				<td><asp:DropDownList ID="ClinicUsers" Runat="server" Width="150"></asp:DropDownList></td>
			</tr>
			<tr>
				<td><strong>Password</strong></td>
				<td> <asp:TextBox TextMode="Password" Width="150" ID="ClinicUserPswd" Runat=server></asp:TextBox></td>
			</tr>
				  </table>








			
				</td>
			</tr>
			<tr>
			  <td align="center" class="EFormPopupCell" height="100"><asp:ImageButton ImageUrl="../../Images/GoToMainLoginScreen.gif" width="174" height="22" style="cursor: pointer;" align="absmiddle" runat=server OnCommand="RedirectUser"/><img src="../../Images/shim.gif" width="30" height="1" /><asp:ImageButton  ID="SubmitBtn" Runat=server ImageUrl="../../Images/Submit.gif"></asp:ImageButton></td>
			</tr>
		</table>
   
   
   </td>
			</tr>
		</table>
	</form>
  </body>
</html>