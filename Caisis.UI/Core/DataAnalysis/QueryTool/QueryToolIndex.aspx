<%@ Page language="c#" Inherits="Caisis.UI.Core.DataAnalysis.QueryTool.QueryToolIndex" CodeFile="QueryToolIndex.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<%@ Register tagprefix="fhcrc" assembly="Caisis.QueryTool" namespace="Caisis.QueryTool" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>QueryToolIndex</title>
    <meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" Content="C#">
    <meta name=vs_defaultClientScript content="JavaScript">
    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
	<LINK href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
  </head>
  <body>
	
    <form id="Form1" method="post" runat="server">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
		
			<tr>
				<td align="center">
				
				<table width="820" cellpadding="0" cellspacing="0" border="0">
				<tr>
				<td  class="ListManTitle">Query the Caisis Database<br/><br/></td>
		</tr>
					<tr>
						<td>
				
				
		<div style="overflow:auto; height:450; width:820">
		<table width="800">
			<tr>
				<td >
					<fhcrc:dataqueryview id="QueryView" runat="server">
						<fhcrc:TextColumn columnName="PatientID" visible=false returnonselection="true" runat="Server" ID="Textcolumn1"/>
						<fhcrc:TextColumn displayName="First Name" columnName="PtFirstName" visible="true" returnonselection="true" runat="Server" ID="Textcolumn2"/>
						<fhcrc:TextColumn columnName="PtLastName" visible=true returnonselection="true" runat="Server" ID="Textcolumn3"/>
						<fhcrc:TextColumn displayName="Patient MRN" columnName="PtMRN" returnonselection="true" selectable="true" maxLength="25" runat="Server" ID="Textcolumn4"/>
						<%--<fhcrc:TextColumn displayName="Patient Name" columnName="PtFullName" fixed="true" maxLength="25" runat="Server" ID="Textcolumn5"/>--%>
						<fhcrc:SelectColumn displayName="City" columnName="City" datatextfield="city" runat="Server" ID="Selectcolumn3"/>
						<fhcrc:SelectColumn displayName="State" columnName="State" datatextfield="state" runat="Server" ID="Selectcolumn4"/>
						<fhcrc:TextColumn displayName="Race" columnName="Race" maxLength="25" runat="Server" ID="Textcolumn6"/>		
						<fhcrc:NumericColumn displayName="Age" columnName="Age" lowerRange="0" upperRange="100" runat="server" ID="Numericcolumn2"/>
					</fhcrc:dataqueryview>	
				</td>
			</tr>
		</table>
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
