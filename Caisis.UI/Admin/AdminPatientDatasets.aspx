<%@ Page Language="C#" CodeFile="AdminPatientDatasets.aspx.cs" Inherits="Caisis.UI.Admin.AdminPatientDatasets" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Panel Runat="server" ID="AddPanel">
    Patient Id: 
	<asp:TextBox id="SearchField" Runat="server"></asp:TextBox><BR>Available Datasets: 
	<asp:DropDownList id="DataSetsList" Runat="server"></asp:DropDownList>
	<asp:Button id="AddDataSetButton" Runat="server" OnCommand="AddDataSet" Text="Add Dataset"></asp:Button>
    </asp:Panel>
	<asp:Panel ID="ResultsPanel" Runat="server">
	Search Results: <br />
	<div>
	<asp:DataGrid ID="ResultsGrid" Runat="server" AutoGenerateColumns="False">
		<Columns>
		<asp:BoundColumn DataField="PtMRN" HeaderText="MRN Number"></asp:BoundColumn>
		<asp:BoundColumn DataField="PtFirstName" HeaderText="First Name"></asp:BoundColumn>
		<asp:BoundColumn DataField="PtLastName" HeaderText="Last Name"></asp:BoundColumn>
		</Columns>
	</asp:DataGrid>
	</div>
	</asp:Panel>
    </form>
</body>
</html>
