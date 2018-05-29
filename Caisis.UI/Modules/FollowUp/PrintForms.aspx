<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintForms.aspx.cs" Inherits="Caisis.UI.Modules.FollowUp.Modules_FollowUp_PrintForms" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>PrintForms</title>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta name="ROBOTS" content="NOINDEX">
		<meta HTTP-EQUIV="PRAGMAS" CONTENT="NO-CACHE">
		<meta HTTP-EQUIV="EXPIRES" CONTENT="0">
		<meta HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
		
		<script src="../../ClientScripts/formsJS.js" type="text/javascript"></script>
		<meta name="GENERATOR" Content="Microsoft Visual Studio 7.0">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		
		<script type="text/javascript">

		var nowDate = '<asp:Literal ID="nowDate" Runat="server" />';
		
		function noClinicDateAlert() 
		{
			alert('One or more patients did not have a scheduled appointment date.  Forms for those patients will display today, ' + nowDate + ', as the appointment date.');
		}
		
		
		
		var InstShortName = '<%= ConfigurationSettings.AppSettings["institutionShortName"] %>';		
		var pageMaxHeight = 1020;
		var currentPageStartY = 0;
		var currentPaperFormNeedsToBeRenumbered = false;

		
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
		if(bw.ie7)
		{
			document.write('<link href="../../StyleSheets/IE7FormStyles.css" rel="stylesheet" type="text/css" media="all">')
			pageMaxHeight = 1223;
		}
		else if(bw.ie4 || bw.ie5 || bw.ie6)
		{
			document.write('<link href="../../StyleSheets/formStyles.css" rel="stylesheet" type="text/css" media="all">')
		}
		else
		{
			document.write('<link href="../../StyleSheets/XBFormStyles.css" rel="stylesheet" type="text/css" media="all">')
			pageMaxHeight = 1223;
		}
	
		</script>		
	
		<style media="screen" type="text/css">
		body {background-color: none;}
		</style>

		<style media="print" type="text/css">
		body {background-color: #ffffff;}
		</style>
	</HEAD>
	<body  id="formContentBody" bottomMargin="0" leftMargin="0" topMargin="0" rightMargin="0" runat="server" >
	
    <asp:PlaceHolder id="formHolder" runat="server"></asp:PlaceHolder>
	
	<script type="text/javascript">
		ScanPagesForAdditionalPageBreaks();
	</script>
		
	</body>
</HTML>
