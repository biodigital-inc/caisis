<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintLabels.aspx.cs" Inherits="Caisis.UI.Modules.FollowUp.Modules_FollowUp_PrintLabels" %>

<%@ Register TagPrefix="address" TagName="AddressLabel" Src="Surveys/AddressLabel.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Print Labels</title>
    
    <script type="text/javascript">
        function checkBrowser() {
            this.ver = navigator.appVersion
            this.dom = document.getElementById ? 1 : 0
            this.ie7 = (this.ver.indexOf("MSIE 7") > -1 && this.dom) ? 1 : 0;
            this.ie8 = (this.ver.indexOf("MSIE 8") > -1 && this.dom) ? 1 : 0;
            this.bw = (this.ie7 || this.ie8)
            return this
        }

        bw = new checkBrowser()
        if (bw.ie7 || bw.ie8) {
            document.write('<link href="follow-up_surveys.css" rel="stylesheet" type="text/css" />')
        }
        else {
            document.write('<link href="follow-up_surveys_ff.css" rel="stylesheet" type="text/css" />')
        }
    </script>


    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <style type="text/css">
		    body 
		    {
		        background-color: #ffffff;
		    }
		    
		    #AddressLabelsContainer
		    {
		        width: auto;
		        margin: auto;
		        margin-top:10px;
		    }
		    .PtNameLabel
		    {
		        display: block;
		        font-weight: bolder;
		        font-size: larger;
		    }
		    .PtAddressLabel
		    {
		        display: block;
		    }
		    .PageBreaker
		    {
		        clear: both;
		        page-break-after: always;
		    }
		    .PageBreakerTopSpacing
		    {
		        height:25px;
		    }
		</style>
    <style media="print" type="text/css">
        .PtAddressItem 
        {
          border-style: none;
        }
    </style>
</head>
<body id="formContentBody">
    <br /> 
    <div id="AddressLabelsContainer">
        <asp:PlaceHolder ID="DynamicAddressHolder" runat="server"></asp:PlaceHolder>
        <asp:Repeater ID="rptLabels" runat="server" OnItemDataBound="SetPatientInfo">
            <ItemTemplate>
                <address:AddressLabel runat="server" ID="PtAddress" />
            </ItemTemplate>
        </asp:Repeater>
    </div>
</body>
</html>
