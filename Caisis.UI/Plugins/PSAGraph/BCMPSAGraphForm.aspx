<%@ Page Language="c#" Inherits="Caisis.UI.Plugins.PSAGraph.BCMPSAGraphForm" CodeFile="BCMPSAGraphForm.aspx.cs"
    CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>PSA Graph</title>
</head>
<body style="background-color: #f1f7fc; margin: 0px;">
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
        width="870" height="410" id="PSADoublingTime">
        <param name="movie" value="PSADoublingTime.swf?ASPPatientId=<%= patientId %>" />
        <param name="quality" value="high" />
        <param name="bgcolor" value="#ffffff" />
        <param name="wmode" value="transparent" />
        <embed src="PSADoublingTime.swf?ASPPatientId=<%= patientId %>" quality="high" bgcolor="#ffffff"
            width="870" height="410" name="PSADoublingTime" type="application/x-shockwave-flash"
            pluginspage="http://www.macromedia.com/go/getflashplayer" wmode="transparent"></embed>
    </object>
</body>
</html>
