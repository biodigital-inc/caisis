<%@ Page language="c#" Inherits="Caisis.UI.Admin.AdminHelpSections" CodeFile="AdminHelpSections.aspx.cs" %>
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
    <script language="javascript">
        
		function gettheform()
		{
		    var theform = document.dataForm;
		    if (window.navigator.appName.toLowerCase().indexOf("microsoft") > -1) 
		    {
			    theform = document.dataForm;
		    }
		    else 
		    {
			    theform = document.forms["dataForm"];
		    }
		    return theform;
		}
		
        function btnHelpSectionEdit_Click(btn)
        {
            var ctrl;
            ctrl = document.getElementById('btnHelpSectionEdit');
            ctrl.disabled = true;
            ctrl = document.getElementById('btnHelpSectionDelete');
            ctrl.disabled = true;
            ctrl = document.getElementById('btnHelpSectionCancel');
            ctrl.disabled = false;
            
            
            ctrl = document.getElementById('txtHelpSectionName');
            ctrl.disabled = false;
            ctrl = document.getElementById('txtHelpSectionDescription');
            ctrl.disabled = false;
        }
        function dataChanged()
        {
            var ok = true;
            ctrl = document.getElementById('lblHelpSectionId');
            var id = ctrl.innerHTML;
            
            if (ctrl.innerHTML.toLowerCase() == 'new' || ctrl.innerHTML.toLowerCase() == '' )
            {
                ctrl = document.getElementById('txtHelpSectionName');
                var name = ctrl.value;
            
                ctrl = document.getElementById('SectionList');
                if(name.length > 0 && valueExistsInDropDown(name,ctrl))
                {
                    ok = false;
                }
            }
            ctrl = document.getElementById('txtHelpSectionName');
            if (ctrl.value.length > 0 && ok)
            {
                ctrl = document.getElementById('btnHelpSectionSave');
                ctrl.disabled = false;
            }
            else
            {  
                ctrl = document.getElementById('btnHelpSectionSave');
                ctrl.disabled = true;
            }
            
           ctrl = document.getElementById('SectionList');
           ctrl.disabled = true;
           
           if (!ok)
           {
                ctrl = document.getElementById('txtHelpSectionName');
                var name = ctrl.value; 
                ctrl = document.getElementById('lblHelpSectionInfo');
                ctrl.style.color = "red";
                ctrl.innerHTML = "The Help Section name '" + name + "' already exists.";
                
           }
           else
           {    ctrl = document.getElementById('lblHelpSectionInfo');
                ctrl.innerHTML = "";
               }
           
        }
        function valueExistsInDropDown(value,dropDown)
        {   
            var rtrn = false;
           for(var i = 0; i < dropDown.options.length; i++)
            {
               if (dropDown[i].text.toLowerCase() == value.toLowerCase())
               {
                rtrn = true;
                break;
               }
            }
            return rtrn;
        }
    </script>
	</HEAD>
	<body  style="background-color: #ffffff">
		<form id="dataForm" method="post" runat="server">
			 <table width="550" border="0" cellspacing="0" cellpadding="0">
			   <tr>
					<td width="144">Select Help Section:</td >
					<td><asp:DropDownList ID="SectionList" runat="server" OnSelectedIndexChanged="SectionList_OnSelectedIndexChanged" AutoPostBack="True" /></td>
				</tr>
		    </table>
			<asp:Panel ID=pnlEdit runat=server>
			    <br />
			    <table width="550" border="0" cellspacing="0" cellpadding="0">
				    <tr><td colspan=2><asp:Label ID="lblHelpSectionTitle" runat=server Text="Edit help section" CssClass="adminSectionNavOn"></asp:Label></td></tr>
	                <tr><td width=144>Help Section id:</td><td><asp:Label ID="lblHelpSectionId" runat=server></asp:Label></td></tr>
	                <tr><td width=144>Help Section name:</td><td><asp:TextBox ID="txtHelpSectionName" runat=server Width="350" Enabled=false onKeyUp="javascript:dataChanged()"></asp:TextBox></td></tr>
	                <tr><td colspan=2>Help Section description:</td></tr>
	                <tr><td colspan=2><asp:TextBox ID="txtHelpSectionDescription" runat=server TextMode=MultiLine Rows="10" Columns=50 Width="500" Enabled=false onKeyUp="javascript:dataChanged()"></asp:TextBox></td></tr>
	                <tr><td  width=144><asp:Button id=btnHelpSectionSave OnClick=btnHelpSectionSave_Click Text=Save runat=server Enabled=false/>&nbsp;&nbsp;<asp:Button id=btnHelpSectionCancel OnClick=btnHelpSectionCancel_Click Text=Cancel runat=server Enabled=false/></td><td><asp:Button id=btnHelpSectionEdit OnClientClick="btnHelpSectionEdit_Click(this);return false;" Text=Edit runat=server />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button id=btnHelpSectionDelete OnClick="btnHelpSectionDelete_Click" Text=Delete runat=server OnClientClick="javascript: return confirm('Delete this Help Section?');"/></td></tr>
	                <tr><td colspan=2><asp:Label ID=lblHelpSectionInfo runat=server Text=""></asp:Label></td></tr>
			    </table>
			</asp:Panel>
		</form>
	</body>
</HTML>
