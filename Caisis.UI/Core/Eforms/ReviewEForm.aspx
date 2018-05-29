<%@ Page EnableEventValidation="false" language="c#"  validateRequest="false" Inherits="Caisis.UI.Core.Eforms.ReviewEForm" CodeFile="ReviewEForm.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.EFormBasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Review Eform</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/FormStyles.css" type="text/css" rel="stylesheet" media="screen" />
    <link href="../../StyleSheets/IE7FormStyles.css" type="text/css" rel="stylesheet" media="print" />

    <script language="javascript" type="text/javascript" src="../../ClientScripts/utilities.js"></script>
    <script src="../../ClientScripts/jQuery.js" type="text/javascript"></script>

    <script type="text/javascript">  
    /* <![CDATA[ */
    
     jQuery.noConflict();
    
    Browser.ResizeElement( { nodeId: 'theNarrative', heightOffset: 32 } );
        
	var allLink = parent.document.getElementById('EFormMenus_PatientAllEformLink');
	if (allLink != null) {
		allLink.href = 'Index.aspx?epid=<%= Caisis.Security.CustomCryptoHelper.Encrypt(Session[Caisis.UI.Core.Classes.SessionKey.PatientId].ToString()) %>&status=ListAllEForms';
		allLink.style.display = 'inline';
	}
	
    /* ]]> */
    </script>

    <script type="text/javascript">  
    /* <![CDATA[ */

	function setHiddenField()
	{
		document.getElementById('NarrativeHolder').value = document.getElementById('theNarrative').innerHTML;
	}
	function LoadComponentByField(field, anchorPrefix)
	{
			parent.LoadComponentByField(field, anchorPrefix);
	}
	function LoadComponentByTable(table, recordId)
	{
			parent.LoadComponentByTable(table, recordId);
	}
	function LoadComponentByTableAndFields(table, fields, prefix)
	{
			parent.LoadComponentByTableAndFields(table, fields, prefix);
	}
	function LoadDataEntryForm(table, id, fields)
	{
			parent.LoadDataEntryForm(table, id, fields);
	}
	function ClosePopup()
	{
			parent.ClosePopup();
	}
	function CheckAnchor()
	{
		var anchor = parent.RetrieveAnchor();
		if (anchor != null)
		{
			document.location = '#' + anchor;
		}
	}
	function setReferrals(referralIDs,referralMsg)
	{
	    if (referralIDs.length > 0) document.getElementById('<% = referTo.ClientID %>').value = referralIDs;
	    if (referralMsg.length > 0) document.getElementById('<% = referralMessage.ClientID %>').value = referralMsg;
	}
	
	
	function signThisForm(doSign, signatureSrc, signDate, signTime)
	{
	    if (doSign)
	    {
            jQuery('.AttendingSignature_Signed').css('display','');
            jQuery('.signedForm_signatureImage').attr('src', signatureSrc);
            jQuery('.signedForm_date').html(signDate);
            jQuery('.signedForm_time').html(signTime);
            jQuery('.AttendingSignature_Blank').css('display','none');
	    }
	    else
	    {
            jQuery('.AttendingSignature_Signed').css('display','none');
            jQuery('.AttendingSignature_Blank').css('display','');
	    }
	}
	
    /* ]]> */
    </script>
    
    <style type="text/css" media="screen">
    .chronListHilighted
    {
        background-color: #e7d1c8;
        color: #000000;
        cursor: pointer;
    }
    div.theNarrative
    {
        PADDING-BOTTOM: 175px;
        HEIGHT: auto;
        BORDER: none;
        overflow: visible;
        WIDTH: 100%;
        background-color: #ffffff;
    }
    
.VerticalBarCodeDiv 
{
    display:none;
}
.NoVerticalBarCodeDiv
{
	display:none;
}


.VerticalBarCodeMRN {
    display:none;
}
.VerticalBarCodeDocType {
    display:none;
}
.VerticalBarCodeAcctType {
    display:none;
}
.VerticalBarCodeDate {
    display:none;
}
.VerticalBarCodeDateText 
{
    display:none;
}
.VerticalBarCodeDateTextBG
{
    display:none;
}
.VerticalBarCodeStatement {
    display:none;
}
.VerticalBarCodeStatementImage {
    display:none;
}

</style>

    
<style type="text/css" media="print">
    div.theNarrative
    {
        WIDTH: 744px;
        background-color: #ffffff;
        display: inline;
        vertical-align: top;
    }
    
.VerticalBarCodeDiv 
{
    display:none;
}
.NoVerticalBarCodeDiv
{
	display:none;
}


.VerticalBarCodeMRN {
    display:none;
}
.VerticalBarCodeDocType {
    display:none;
}
.VerticalBarCodeAcctType {
    display:none;
}
.VerticalBarCodeDate {
    display:none;
}
.VerticalBarCodeDateText 
{
    display:none;
}
.VerticalBarCodeDateTextBG
{
    display:none;
}
.VerticalBarCodeStatement {
    display:none;
}
.VerticalBarCodeStatementImage {
    display:none;
}

    </style>

</head>
<body>
	 
   	<form id="Form1" method="post" runat="server">
  	<input type="hidden" id="NarrativeHolder" runat="server" name="NarrativeHolder" />
	<input type="hidden" id="HiddenEformName" runat="server" name="EformName" />
				<div  id="theNarrative" class="theNarrative" runat="server">
				</div>
	<input type="hidden" id="referTo" runat="server" name="referTo" /><input type="hidden" id="referralMessage" runat="server" name="referralMessage" />
    </form>
    <script  language="javascript" type="text/javascript">
		CheckAnchor();
		
		var enableSignature = false;
		if (jQuery('.AttendingSignature_Signed')[0]) enableSignature = true;
		if(typeof parent.showApproveButton == 'function') { parent.showApproveButton(enableSignature); }
		
    </script>
  </body>
</html>