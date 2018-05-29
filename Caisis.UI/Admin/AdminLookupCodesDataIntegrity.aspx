<%@ Page ValidateRequest="false" language="c#" CodeFile="AdminLookupCodesDataIntegrity.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" AutoEventWireup="false" Inherits="Caisis.UI.Admin.AdminLookupCodesDataIntegrity" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>   
    <title>Administrator</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />
    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../ClientScripts/headerJS.js" type="text/javascript"></script>
    <script type="text/javascript" src="../ClientScripts/jquery.js"></script>
    <script type="text/javascript" src="../ClientScripts/jquery-ui.js"></script>


    <script type="text/javascript">
        // supress conflict with caisis specific $ object
        jQuery.noConflict();        
        
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
		
        function valueChanged()
        {
            var theform = gettheform();
            var val = theform.ddlFieldValues.options[theform.ddlFieldValues.selectedIndex].text;
            if (val.toString().length > 0)
            {
                theform.txtNewValue.value = "";
                theform.txtNewValue.disabled = false;
		        lblRecodeInfo.innerHTML = "";
		        theform.lblRecodeInfoHidden.value = lblRecodeInfo.innerHTML;
		        theform.btnRecode.disabled = true;
            }
        }
        function updateLblRecodeInfo()
        {
            var theform = gettheform();
            var recodeTo = theform.txtNewValue.value;
		    var text = theform.ddlFieldValues.options[theform.ddlFieldValues.selectedIndex].text;
		    var val = theform.ddlFieldValues.options[theform.ddlFieldValues.selectedIndex].value;
		    var count = text.split('\u00A0',2)[0]
		    var field = theform.ddlFieldNames.options[theform.ddlFieldNames.selectedIndex].text;
            if (validateDatatype())
            {
                var message = count + " rows with field '" + field + "' = '" + val + "' will be updated to '" + field + "' = '" + recodeTo + "'.";
                for (i = 0; i < theform.ddlFieldValues.length; i++)
                {
                    if(theform.ddlFieldValues.options[i].value == recodeTo)
                    {
                        var count2 = theform.ddlFieldValues.options[i].text.split('\u00A0',2)[0]
		    
                        message = message + "<br>" + recodeTo + " is already used in " + count2 + " rows.";   
                    }
                }
                
                setInfoOK(message);
                //theform.lblRecodeInfoHidden.value = lblRecodeInfo.innerHTML;
                //theform.btnRecode.disabled = false;
            }
        }
        
        function validateDatatype()
        {
            
		    var theform = gettheform();
            var field = theform.ddlFieldNames.options[theform.ddlFieldNames.selectedIndex].text;
            var recodeTo = theform.txtNewValue.value;
		    var found = false;
		    var dtype = "";
            var datatype = "";
		    var isNullable = "";
            for (i=0;i<columns.length;i++)
            {
                if (field == columns[i][0])
                {
                    dtype = columns[i][1];
                    datatype = dtype.toLowerCase();
                    isNullable = columns[i][2];
                    var recodeTo = theform.txtNewValue.value;
                    if (recodeTo == 'Null')
                    {
                        if(isNullable == 'YES')
                        {
                            return true;
                        }
                        else
                        {
                            setInfoErrorMessage("Field '" + field + "' is not nullable.");
                            return false;
                        }
                    }
                    else
                    { 
                          if (datatype == "number" || datatype == "decimal" || datatype == "numeric" || datatype == "float" || datatype == "real" || datatype == "bigint" || datatype == "money" || datatype == "smallmoney")
                            {
                                found = true;
                                if(IsNumeric(recodeTo))
                                {
                                    return true;
                                }
                            }
                          if (datatype == "tinyint" || datatype == "smallint" || datatype == "int")
                            {
                                found = true;
                                if(isInteger(recodeTo))
                                {
                                    return true;
                                }
                            }
                            if (datatype == "date" || datatype ==  "datetime")
                            {
                                found = true;
                                if (IsDate(recodeTo)) 
                                {
                                    return true;
                                }
                            }
                            if (datatype == "varchar(50)" || 
                                datatype == "varchar(100)" ||
                                datatype == "varchar(1000)" ||
                                datatype == "varchar(255)" ||
                                datatype == "varchar(50)" ||
                                datatype == "text" || 
                                datatype == "varchar" || 
                                datatype == "char" || 
                                datatype == "text" || 
                                datatype == "ntext" || 
                                datatype == "string" || 
                                datatype == "")
                            {
                                found = true;
                                return true;
                            }
                            if (datatype == "bool" || datatype == "bit") // this still valid?
                            {
                                found = true;
                                if(recodeTo.toLowerCase() == 'true' || recodeTo.toLowerCase() == 'false')
                                { 
                                    return true;
                                }
                            }
                    }
                    if(found)
                    {
                        var message = "Field '" + field + "' must be of datatype '" + datatype + "'";
                        if(isNullable == 'YES')
                        {
                            message = message + " or 'Null'";
                        }
                        message = message + ".";
                        
                        setInfoErrorMessage(message);
                    }
                    else
                    {
                        setInfoErrorMessage("Field ('" + field + "') or datatype ('" + datatype + "') was not found in data type array.");
                    }
                    return false;
                }
            }
          }
          function IsDate(theDate)
          {
            //very rudimentary, probalby should be improved
            //should be updated to handle different date formats
            if(Date.parse(theDate))
            {
                var aDate = new Date(theDate);
                var now = new Date();
                if (now.getFullYear() - aDate.getFullYear() < 200 && aDate.getFullYear() - now.getFullYear()  < 10 )
                {
                    return true;
                }
            }
          }
          function IsNumeric(sText)
            {
            var ValidChars = "0123456789.";
            var IsNumber=true;
            var Char;

                
            for (i = 0; i < sText.length && IsNumber == true; i++) 
                { 
                Char = sText.charAt(i); 
                if (ValidChars.indexOf(Char) == -1) 
                    {
                    IsNumber = false;
                    }
                }
            return IsNumber;
                
            }
            function isInteger (s)
            {
                var i;
                if (isEmpty(s))
                if (isInteger.arguments.length == 1) return 0;
                else return (isInteger.arguments[1] == true);

                for (i = 0; i < s.length; i++)
                {
                    var c = s.charAt(i);

                    if (!isDigit(c)) return false;
                }

                return true;
            }
            function isEmpty(s)
            {
                return ((s == null) || (s.length == 0))
            }
            function isDigit (c)
            {
                return ((c >= "0") && (c <= "9"))
            }
          function setInfoErrorMessage(message)
            {
                var theform = gettheform();
                lblRecodeInfo.innerHTML = message;
                lblRecodeInfo.style.color = "red";
                theform.lblRecodeInfoHidden.value = "";
                theform.btnRecode.disabled = true;
            }
            function setInfoOK(message)
            {
                var theform = gettheform();
                lblRecodeInfo.innerHTML = message;
                lblRecodeInfo.style.color = "black";
                theform.lblRecodeInfoHidden.value = lblRecodeInfo.innerHTML;
                theform.btnRecode.disabled = false;
            }
            
            function displayFieldInfo() {
                var lblShowFieldInfo = jQuery("#lblShowFieldInfo");
                if (lblShowFieldInfo.text() == "Show details") {
                    lblShowFieldInfo.text("Hide details");
                    jQuery("#FieldInfoPanel").show();
                }
                else {
                    lblShowFieldInfo.text("Show details");
                    jQuery("#FieldInfoPanel").hide();
                }
            }
 
        
    </script>

      <style type="text/css">
          #FieldMetadataPanel
          {
              width: 615px;
              max-height: 150px;
              overflow: auto;
          }
          #FieldMetadataPanel h2
          {
              font-size: 13px;
              margin: 5px;
          }
          #FieldMetadataPanel h3
          {
              font-size: 12px;
              margin: 5px;
          }
          #FieldMetadataPanel ul
          {
              display: block;
              margin: 0;
              padding: 0;
              list-style-type: none;
          }
          #FieldMetadataPanel ul li
          {
              margin: 2px 15px;
              padding: 0;
              display: inline-block;
              width: 250px;
          }
          #FieldMetadataPanel .dataGrid
          {
            table-layout: fixed;
            margin: auto 10px;
            display: block;
           white-space: normal;
          }
      </style>
</head>
    <body >
    <form id="dataForm" method="post" runat="server">
    
    
    <div id="adminPageContentContainer" style="padding-top:10px;">
        <div id="SelectTableBox" class="adminNavBoxContainer" style="width: 210px;">
            <span class="adminNavBoxContainerTitle">Select Table</span>
            <div class="adminBox">
                <div class="adminBoxNavListContainer" style="overflow-x: hidden; word-wrap: break-word;">
                    <asp:ListBox id="ddlTableDefs"  autopostback="True" onselectedindexchanged="ddlTableDefs_onselectedindexchanged" Runat="server" Width="200px" Height="400px"></asp:ListBox>
                </div>
            </div>
        </div>
        
        <div id="SelectFieldBox" class="adminNavBoxContainer" style="margin-left: 20px; width: 210px;">
        <span class="adminNavBoxContainerTitle">Select Field</span>
        
        <div class="adminBox" >
        <div class="adminBoxNavListContainer">
        
            <asp:ListBox id="ddlFieldNames" autopostback="True"  onselectedindexchanged="ddlFieldNames_onselectedindexchanged" Runat="server" Width="200px" Height="400px"></asp:ListBox>
            
        
        </div>
        <asp:Label ID="lblShowFieldInfo" CssClass="dataEntryButtonGray" onclick="displayFieldInfo();false;" Runat="server" style="float: right; cursor: pointer; margin: 5px auto;" Visible="false" ></asp:Label>
        </div>
        </div>

        <div id="SelectFieldValueBox" class="adminNavBoxContainer" style="margin-left: 20px; width: 360px;">
        <span class="adminNavBoxContainerTitle">Select Field Value</span>
        <div class="adminBox" style="margin-bottom: 30px;">
        <div class="adminBoxNavListContainer">
            <asp:ListBox id="ddlFieldValues" autopostback="false" Runat="server" Width="350px" Height="250px"></asp:ListBox>        
        </div></div>
        
        
        <span class="adminNavBoxContainerTitle" >Recode to:</span>
        <div class="adminBox" style="min-height: 30px; word-wrap: break-word;" >
        <div class="adminBoxNavListContainer">
            <asp:TextBox id="txtNewValue" Runat="server" Width="200px" onKeyUp="javascript:updateLblRecodeInfo()" onChange="javascript:updateLblRecodeInfo()"></asp:TextBox>&nbsp;<asp:Button id="btnRecode" CssClass="dataEntryButtonGray" onclick="btnRecode_onClick"  Runat="server" Text="Recode"></asp:Button>
					<br/><br/><asp:Label name=lblRecodeInfo ID=lblRecodeInfo Runat="server"></asp:Label><input id="lblRecodeInfoHidden" type="hidden" runat="server" />    
        </div></div>
        
        
        </div>





    </div>
    
<div id="FieldInfoPanel" class="grayPanel">
<div class="grayPanelContentContainer">
<img class="grayPanelCloseButton" src="../Images/shim.gif" onclick="displayFieldInfo();" />
<div class="grayPanelTitle">Field Metadata</div>
<div class="grayPanelContent">Listed below is the metadata for this field.
    <div id="FieldMetadataPanel" class="grayPanel_SubcontentBox">
        <h2>
            Field Properties</h2>
        <asp:GridView runat="server" ID="FieldInfoGrid" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
            RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
            AutoGenerateColumns="true">
        </asp:GridView>
        <h2>
            Field Metadata (By Disease)</h2>
        <ul>
            <asp:Repeater runat="server" ID="DiseaseMetadataGrid" OnItemDataBound="BuildFieldMetadata">
                <ItemTemplate>
                    <li>
                        <h3>
                            <%# Eval("Disease") %></h3>
                        <asp:GridView runat="server" ID="FieldMetadataGrid" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
                            RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                            AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="Key" HeaderText="Attribute" />
                                <asp:BoundField DataField="Value" HeaderText="Value" />
                            </Columns>
                        </asp:GridView>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
<div class="grayPanel_SubcontentBoxBottom">&nbsp;</div>
</div>    
</div>  
</div>  
    

     </form>
     <asp:Literal ID=ltrDataTypes Runat="server"/>	
  </body>
</html>
