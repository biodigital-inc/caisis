<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="AdminPatientToInstitution.aspx.cs" Inherits="Admin_AdminPatientToInstitution" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Admin Patients To Institution</title>
    <meta content="Microsoft Visual Studio 7.0" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <meta content="NOINDEX" name="ROBOTS" />
    <meta http-equiv="PRAGMAS" content="NO-CACHE" />
    <meta http-equiv="EXPIRES" content="0" />
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .adminFieldLabel a 
    { 
        float: left;
        display: block; 
        border: 1px solid #999999;
        cursor: pointer;
        font-size: 12px;
        width: 16px;
        height: 16px;
        text-align: center;
        margin: 3px;
        background-color: #ffffff;
        vertical-align: middle;
    }
    </style>
    <script type="text/javascript">
      function ldPts(firstLetter)
      {
        this.window.location.href = 'AdminPatientToInstitution.aspx?firstLetter='+ firstLetter;
      }
      
      var activeLinkColor = '#660000';
      function setSelectedLetter()
      {
        var selectedLetter = document.getElementById('SelectedLetter');
        var table = document.getElementById('SelectPatientTable');
        var links = table.getElementsByTagName('a');
        if(selectedLetter.value !='')
        {
            for(var i=0;i<links.length;i++)
            {
                var link = links[i];
                if(link.firstChild && link.firstChild.nodeType==3 && link.firstChild.nodeValue == selectedLetter.value) 
                {
                    link.style.backgroundColor = activeLinkColor;
                    link.style.color = '#ffffff';
                }
            }
        }
      }
    </script>

</head>
<body style="background-color: #ffffff;" onload="setSelectedLetter();">
	<form id="dataForm" method="post" runat="server">
	<input id="SelectSubmitted" runat="server" type="hidden" value="false" name="SelectSubmitted" />
	<input id="SelectedLetter" value="" runat="server" type="hidden" name="SelectedLetter" />
	<table width="520" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td>
				<table id="SelectPatientTable" runat="server" width="520" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="2" class="adminFieldLabel">select first initial of patient last name:</td>
					</tr>
					<tr>
						<td colspan="2" class="adminFieldLabel">
						<a onclick="ldPts('A')">A</a>
						<a onclick="ldPts('B')">B</a>
						<a onclick="ldPts('C')">C</a>
						<a onclick="ldPts('D')">D</a>
						<a onclick="ldPts('E')">E</a>
						<a onclick="ldPts('F')">F</a>
						<a onclick="ldPts('G')">G</a>
						<a onclick="ldPts('H')">H</a>
						<a onclick="ldPts('I')">I</a>
						<a onclick="ldPts('J')">J</a>
						<a onclick="ldPts('K')">K</a>
						<a onclick="ldPts('L')">L</a>
						<a onclick="ldPts('M')">M</a>						
						</td>
					</tr>
                    <tr>
                        <td colspan="2" class="adminFieldLabel">
                        <a onclick="ldPts('N')">N</a>
						<a onclick="ldPts('O')">O</a>
						<a onclick="ldPts('P')">P</a>
						<a onclick="ldPts('Q')">Q</a>
						<a onclick="ldPts('R')">R</a>
						<a onclick="ldPts('S')">S</a>
						<a onclick="ldPts('T')">T</a>
						<a onclick="ldPts('U')">U</a>
						<a onclick="ldPts('V')">V</a>
						<a onclick="ldPts('W')">W</a>
						<a onclick="ldPts('X')">X</a>
						<a onclick="ldPts('Y')">Y</a>
						<a onclick="ldPts('Z')">Z</a>
                        </td>
                    </tr>
					<tr>
						<td colspan="2" class="adminFieldLabel">&nbsp;</td>
					</tr>
					<tr>
						<td class="adminFieldLabel" width="100">select patient</td>
						<td align="left" width="370"><select id="SelectPatientName" runat="server" style="width:300" name="SelectPatientName"></select></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
				</table>
				<table id="SelectInstitutionTable" runat="server" width="520" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class="adminFieldLabel"  width="110" valign="top">current institutions</td>
						<td align="left"><asp:Literal ID="groupMessage" Runat=server></asp:Literal>
							<table width="420" border="0" cellspacing="0" cellpadding="0">
							<asp:Repeater ID="rptInstitutions" Runat=server>
								<ItemTemplate>
									<tr valign="middle"> 
										<td height="25" width="125">&nbsp;<%# Eval("Institution") %></td>
										<td width="75" align=left><asp:ImageButton ID="DeleteBtn" OnCommand="DeleteButtonClick"  CommandArgument='<%# Eval("PatientInstitutionId") %>' Runat=server src="../Images/ButtonDelete.gif"></asp:ImageButton></td>
									</tr>
								</ItemTemplate>
								<SeparatorTemplate>
									<tr> 
										<td height="1" colspan="2" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
									</tr>
								</SeparatorTemplate>
								<FooterTemplate>
									<tr> 
										<td height="1" colspan="2" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
									</tr>
								</FooterTemplate>
							</asp:Repeater>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td width="110" height="30" class="adminFieldLabel">add new institution</td>
						<td align=left>
							<table width="350" border="0" cellspacing="0" cellpadding="0">
								<tr valign="middle"> 
									<td height="30" width="125"><select id="Institutions" runat="server" style="width:200" NAME="Institutions"></select></td>
									<td width="50" align=left><asp:ImageButton OnClick="AddButtonClick" Runat=server ID="AddBtn"></asp:ImageButton></td>
								</tr>
							</table>
						</td>
					</tr>		
				</table>
			</td>
		</tr>
	<tr>
        <td height="50" valign="middle">
            <asp:Literal ID="valMsg" runat="server"></asp:Literal></td>
	</tr>
	</table>
</form>
</body>
</html>
