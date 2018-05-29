<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Page language="c#" CodeFile="PrintCollection.aspx.cs" AutoEventWireup="True" Inherits="Caisis.UI.Modules.SpecimenMgmt.PrintCollection" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Edit Collection</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<LINK href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
		<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
		<script language="javascript">
	
		function CallPrint()
		{
			var strid='divPrint'
			var prtContent = document.getElementById(strid);
			var WinPrint = window.open('','','letf=0,top=0,width=1,height=1,toolbar=0,scrollbars=0,status=0');
			WinPrint.document.write(prtContent.innerHTML);
			WinPrint.document.close();
			WinPrint.focus();
			WinPrint.print();
			WinPrint.close();
			prtContent.innerHTML=strOldOne;
		}
		
		</script>
	</HEAD>
	<body>
		<form id="dataForm" method="post" runat="server">
			<table style="WIDTH: 762px; HEIGHT: 22px" width="762" align="center">
				<tr>
					<td class="SectionTitle"><asp:label id="lblTitle" runat="server">Print Collection: </asp:label></td>
				</tr>
			</table>
			<table class="PDForm" id="tblMainBody" style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 762px; BORDER-BOTTOM: gray 1px solid; HEIGHT: 560px"
				height="560" cellSpacing="0" cellPadding="0" width="762" align="center">
				<tr>
					<td align="center"><asp:label id="lblMsg" runat="server" ForeColor="Red"></asp:label></td>
				</tr>
				<tr>
					<td align="center">
						<P>Select a&nbsp;collection from the list below:<asp:dropdownlist id="ddlList" runat="server" ></asp:dropdownlist>
                            <cc:CaisisSelect ID="ddlIdentifierType" runat="server" CssClass="pdFormField" LookupCode="IdentifierType"
                                Width="146px">
                            </cc:CaisisSelect>
                            </P>
						
						<P><asp:imagebutton id="ibSubmit" runat="server" ImageUrl="Images/Submit.gif"></asp:imagebutton></P>
						
					</td>
				</tr>
				<tr align="center">
					<td><INPUT id="btnPrint" onclick="CallPrint('strid')" type="submit" value="Print" name="btnPrint"
							runat="server">
						<div id="divPrint" style="VISIBILITY: visible; OVERFLOW: auto; WIDTH: 721px; HEIGHT: 312px">
							<table class="ListManBGTableBody" id="tblPrintArea" style="WIDTH: 691px; HEIGHT: 361px"
								runat="server">
								<tr align="center">
									<td></td>
								</tr>
								<tr align="center">
									<td>
										<TABLE id="tblCollection" style="WIDTH: 336px; HEIGHT: 53px" cellSpacing="3" cellPadding="0"
											width="336" border="0" runat="server">
											<TR>
												<TD style="WIDTH: 203px">Collection 
                  Name:</TD>
												<TD><asp:label id="lblCollectionName" runat="server"></asp:label></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD>Date Created:</TD>
												<TD><asp:label id="lblCollectionDate" runat="server"></asp:label></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD style="HEIGHT: 13px">Type:</TD>
												<TD style="HEIGHT: 13px"><asp:label id="lblCollectonType" runat="server"></asp:label></TD>
												<TD style="HEIGHT: 13px"></TD>
											</TR>
											<TR>
												<TD>Status:</TD>
												<TD><asp:label id="lblCollectionStaus" runat="server"></asp:label></TD>
												<TD></TD>
											</TR>
											<TR>
												<TD></TD>
												<TD></TD>
												<TD></TD>
											</TR>
										</TABLE>
									</td>
								</tr>
								<tr align="center">
									<td><asp:label id="lblTotalSpecimens" runat="server"></asp:label></td>
								</tr>
								<tr>
									<td><asp:datagrid id="dgSpecimens" runat="server" Width="680px" DataKeyField="specimenId" AutoGenerateColumns="False">
											<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#00ffff"></HeaderStyle>
											<Columns>
												<asp:BoundColumn Visible="False" DataField="specimenId" ReadOnly="True" HeaderText="Specimen ID"></asp:BoundColumn>
												<asp:BoundColumn DataField="specimenVial" ReadOnly="True" HeaderText="Specimen Vial"></asp:BoundColumn>
												<asp:BoundColumn DataField="Identifier" ReadOnly="True" HeaderText="TB Ref#"></asp:BoundColumn>
												<asp:BoundColumn DataField="specimenType" ReadOnly="True" HeaderText="Sample Type"></asp:BoundColumn>
												<asp:BoundColumn DataField="specimenRemainingQty" ReadOnly="True" HeaderText="Size/Volume"></asp:BoundColumn>
												<asp:BoundColumn DataField="specimenStatus" ReadOnly="True" HeaderText="Sample Status"></asp:BoundColumn>
												<asp:BoundColumn DataField="storageInfo" HeaderText="Freezer/Tank"></asp:BoundColumn>
												<asp:BoundColumn DataField="shelforRack" HeaderText="Shelf/Rack"></asp:BoundColumn>
												<asp:BoundColumn DataField="boxId" HeaderText="Box"></asp:BoundColumn>
												<asp:BoundColumn DataField="positionId" HeaderText="Position ID"></asp:BoundColumn>
												<asp:TemplateColumn HeaderText="Verify">
													<ItemTemplate>
														<input type="checkbox" runat="server" id="chkSpId" checked='false' name="chkSpId" />
													</ItemTemplate>
												</asp:TemplateColumn>
											</Columns>
										</asp:datagrid></td>
								</tr>
								<tr align="right">
									<td>
										<P>&nbsp;</P>
										<P><asp:label id="lblPrintInfo" runat="server"></asp:label></P>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
