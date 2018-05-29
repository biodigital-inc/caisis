<%@ Control Language="c#" Inherits="Caisis.UI.Core.Eforms.EFormMenus" CodeFile="EFormMenus.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseControl" %>
<%@ Register TagPrefix="val" Assembly="System.Data" NameSpace="System.Data" %>
<script type="text/javascript" language="javascript">
	
	// save data onclick of clinic list btn when leaving data entry page
	function doIsDirtySave()
	{
		if(window.frames['EFormFrame'].window.document.forms[0].nextEformId)
		{		
			if(window.frames['EFormFrame'].window.document.forms[0].nextEformId.value > 0)
			{
				window.frames['EFormFrame'].window.document.forms[0].submit();
			}
		}
	}
	
	function externalDisableEformListRefresh()
	{
		// eformlist is in eformframe
		if (window.frames['EFormFrame'].window.disableEformListRefresh) {
			window.frames['EFormFrame'].window.disableEformListRefresh();
		}
	}
	
	function showClinicUserLogin()
	{
		externalDisableEformListRefresh();
		//submitClinicLoginForm();
		document.getElementById('ClinicLoginPage').width = screen.width; 
		document.getElementById('ClinicLoginPage').height = screen.height;
		document.getElementById('lockedLayer').style.visibility = 'visible';
		
	}
	function hideClinicUserLogin()
	{
		document.getElementById('lockedLayer').style.width = '0';
		document.getElementById('lockedLayer').style.height = '0';
		document.getElementById('lockedLayer').style.visibility = 'hidden';
	}
	function submitClinicLoginForm()
	{
		document.frames('ClinicLoginPage').forms[0].submit();
		//document.frames['ClinicLoginPage'].src = "EFormClinicUserLogin.aspx";
	}
	
	function showEFormList(ListType)
	{
	    doIsDirtySave();
		window.frames['EFormFrame'].window.location = 'EFormList.aspx?EFormListType=' + ListType;
		setListTypeIndicator(ListType);
	}
	
	
	function setListTypeIndicator(ListType)
	{
		document.getElementById('EFormsByClinic').src = '../../Images/EFormsByClinic.gif';
		document.getElementById('EFormsByPhysician').src = '../../Images/EFormsMyEForms.gif';
		document.getElementById('EFormsByPatient').src = '../../Images/EFormsByPatient.gif';

        if (ListType == 'clinic') document.getElementById('EFormsByClinic').src = '../../Images/EFormsByClinic_on.gif';
        else if (ListType == 'physician') document.getElementById('EFormsByPhysician').src = '../../Images/EFormsMyEForms_on.gif';
        else document.getElementById('EFormsByPatient').src = '../../Images/EFormsByPatient_on.gif';
	
	}
	
	
	<asp:Literal ID="EFormMenuJSScript" runat="server" />
	
	
</script>


<div id="menubar">
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td height="25" nowrap>
				<%--
				<A href="javascript:;"><IMG onclick="MM_showHideLayers('currentList','','hide','commonTasks','','show','flashList','','hide')" hspace="0" src="../../Images/Header/CommonTasks.gif" border="0" vspace="3" align="middle"></A>
				--%>
				
				
				<img width="80" height="8" src="../../Images/EFormNavBrowseEForms.gif" border="0" style="margin-left: 20px; margin-right: 8px; vertical-align: middle;" /><IMG width="6" height="8" src="../../Images/MenuBarWidget.gif" border="0" hspace="3">
				<img id="EFormsByClinic" onclick="showEFormList('clinic')" width="58" height="15" src="../../Images/EFormsByClinic.gif" style="border: solid 1px #596E82; vertical-align: middle; cursor: pointer;" /><img id="EFormsByPhysician"  onclick="showEFormList('physician')" width="71" height="15" src="../../Images/EFormsMyEForms.gif"  style="border-top: solid 1px #596E82; border-bottom: solid 1px #596E82;vertical-align: middle; cursor: pointer;" /><img id="EFormsByPatient" onclick="showEFormList('patient')" width="65" height="15" src="../../Images/EFormsByPatient.gif"  style="border: solid 1px #596E82;vertical-align: middle; cursor: pointer;"  />
				
				
				
				<!--
				<a href="Index.aspx?status=home" target="_self"><IMG width="79" height="18" onclick="doIsDirtySave();" src="../../Images/ClinicList_small.gif" border="0" align="absmiddle" style="cursor: pointer;"/></a>
				<IMG width="20" height="1" src="../../Images/shim.gif" border="0">
				<a id="PatientAllEformLink" runat="server" href="" target="_self" style="DISPLAY: none;"><IMG width="156" height="18" onclick="doIsDirtySave();" src="../../Images/ListEformsForThisPatient.gif" border="0" align="absmiddle" /></a>
				-->
				
				
				<!--<asp:Label CssClass="MenuBarLabel" ID="EFormGroupName" Runat="server" Font-Bold="True"><span id="JSClinicName"><asp:Literal ID="ClinicTitle" Runat=server/></span></asp:Label>-->
			</td>
			<td>&nbsp;</td>
			<td nowrap align="right">
				<span class="MenuBarLabel">Current User <IMG width="6" height="8" src="../../Images/MenuBarWidget.gif" border="0" hspace="3"><asp:Literal ID="CurrentClinicUser" Runat=server/></span>
				<IMG width="5" height="1" src="../../Images/shim.gif" border="0">
				<a href="EFormClinicUserLogin.aspx" target="ClinicLoginPage"><IMG onclick="showClinicUserLogin();" width="173" height="18" src="../../Images/LockSystemChangeUser.gif" border="0" align="absmiddle" style="cursor: pointer;"/></a>
				<IMG width="20" height="1" src="../../Images/shim.gif" border="0">
			</td>
		</tr>
	</table>
</div>


<!-- layer for locking page out -->
<div id="lockedLayer" style="Z-INDEX: 50; LEFT: 0px; VISIBILITY: hidden; OVERFLOW: off; POSITION: absolute; width: 80%; TOP: 0px;background-color:#9FABB0;">
		<table width="90%" border="0">
			
			<tr>
				<td align="center">
					<iframe id="ClinicLoginPage" frameborder="0" name="ClinicLoginPage" src="" width="80%" height="80%"></iframe>
				</td>
			</tr>
		</table>
</div>