<%@ Page language="c#" Inherits="Caisis.UI.Admin.AdminMetadata" CodeFile="AdminMetadata.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Metadata Administrator</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta content="NOINDEX" name="ROBOTS">
		<meta http-equiv="PRAGMAS" content="NO-CACHE">
		<meta http-equiv="EXPIRES" content="0">
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
		<link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css">
	</HEAD>
	<body class="AdminBody">
		<form id="dataForm" method="post" runat="server">
			<table width="550" border="0" cellspacing="0" cellpadding="0">
				<!-- should we use divs here to keep the table list in place? -->
				<tr>
					<td>select table:</td>
					<td><asp:DropDownList ID="TableList" runat="server" OnSelectedIndexChanged="ChooseTable" AutoPostBack="True" /></td>
				</tr>
				<tr>
					<!-- show dataset here -->
					<td colspan="2">
						<asp:DataGrid ID="MetadataGrid" Runat="server" DataKeyField="FieldId"
							OnEditCommand="MetadataGrid_EditCommand" OnCancelCommand="MetadataGrid_CancelCommand"
							OnUpdateCommand="MetadataGrid_UpdateCommand" AutoGenerateColumns="False"
							OnItemDataBound="PreSelectDropDowns">
							<Columns>
								<asp:EditCommandColumn ButtonType="LinkButton" UpdateText="Update" CancelText="Cancel" EditText="Edit" HeaderStyle-CssClass="dataGridHeader"></asp:EditCommandColumn>
								<asp:BoundColumn ReadOnly="True" DataField="FieldId" Visible="False"/>
								<asp:BoundColumn HeaderText="Field Name" ReadOnly="True" DataField="FieldName" HeaderStyle-CssClass="dataGridHeader"/>
								<asp:BoundColumn HeaderText="Label" DataField="FieldLabel" HeaderStyle-CssClass="dataGridHeader"/>
								<asp:BoundColumn HeaderText="Description" DataField="FieldDescription" HeaderStyle-CssClass="dataGridHeader"/>
								<asp:TemplateColumn HeaderStyle-CssClass="dataGridHeader">
									<HeaderTemplate>Control Type</HeaderTemplate>
									<ItemTemplate>
										<asp:Label Text='<%# DataBinder.Eval(Container.DataItem, "FieldControlType") %>' Runat="server"/>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:DropDownList Runat="server" ID="ControlTypes">
											<asp:ListItem Value=""></asp:ListItem>
											<asp:ListItem Value="CheckBox">CheckBox</asp:ListItem>
											<asp:ListItem Value="Combo">Combo</asp:ListItem>
											<asp:ListItem Value="ComboBox">ComboBox</asp:ListItem>
											<asp:ListItem Value="Radio Button">Radio Button</asp:ListItem>
											<asp:ListItem Value="Select">Select</asp:ListItem>
											<asp:ListItem Value="Text">Text</asp:ListItem>
											<asp:ListItem Value="TextArea">TextArea</asp:ListItem>
										</asp:DropDownList>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:TemplateColumn HeaderStyle-CssClass="dataGridHeader">
									<HeaderTemplate>Data Type</HeaderTemplate>
									<ItemTemplate>
										<asp:Label Text='<%# DataBinder.Eval(Container.DataItem, "FieldDataType") %>' Runat="server"/>
									</ItemTemplate>
									<EditItemTemplate>
										<asp:DropDownList Runat="server" ID="Datatypes">
											<asp:ListItem Value=""></asp:ListItem>
											<asp:ListItem Value="Date">Date</asp:ListItem>
											<asp:ListItem Value="int">int</asp:ListItem>
											<asp:ListItem Value="Number">Number</asp:ListItem>
											<asp:ListItem Value="Text">Text</asp:ListItem>
											<asp:ListItem Value="varchar">varchar</asp:ListItem>
										</asp:DropDownList>
									</EditItemTemplate>
								</asp:TemplateColumn>
								<asp:BoundColumn HeaderText="Row Source" DataField="FieldRowSource" HeaderStyle-CssClass="dataGridHeader"/>
							</Columns>
						</asp:DataGrid>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
