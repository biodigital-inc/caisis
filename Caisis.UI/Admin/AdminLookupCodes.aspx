<%@ Page EnableEventValidation="false" Language="c#" Inherits="Caisis.UI.Admin.AdminLookupCodes"
    CodeFile="AdminLookupCodes.aspx.cs" AutoEventWireup="false" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>LookUp Codes Administrator</title>
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

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../ClientScripts/Admin.js"></script>

    <script type="text/javascript">
		var maxCharCount = 150;
		function updateCharCounter()
		{
		    var node = document.getElementById('lkpValue');
		    var charCounter = document.getElementById('CharCounter');
		    if(node && charCounter)
		    {
		        var charCount = node.value.length;
		        charCounter.firstChild.nodeValue = "char count: " + charCount + "/" + maxCharCount;
		    }
		}
		function checkCharMax()
		{
		    var node = document.getElementById('lkpValue');
		    var charCount = node ? node.value.length : 0;
		    if(charCount>maxCharCount) 
		    { 
		        var msg = 'You have entered more than '+ maxCharCount + ' characters. Please revise your value.';
		        alert(msg);
		        return false;
		    }
		    else
		    {
		        return true;
		    }
		}
		
		function addNewLookupCode(img)
		{
		    addEmptyRow();
		    //img.style.display = 'none';
		    return false;
		}
		
		function enableRow(lkpId,img)
		{
		    var row = $(lkpId + 'InputRow');
		    var fields = row.getElementsByTagName('input');
		    enableInputFields(row);
		    $(img).enable();
		    ForEach(fields,setInputEnabled,this);
		    return false;
		}
		
		function cancelRow(lkpId,img)
		{
		    var row = $(lkpId + 'InputRow');
		    var fields = row.getElementsByTagName('input');
		    disableInputFields(row);
		    $(img).enable();
		    $(img.previousSibling.previousSibling).enable();
		    ForEach(fields,setInputDisabled,this);
		    return false;
		}
		
		function setInputEnabled(input) { input.className = 'InputFieldEnabled'; }
		function setInputDisabled(input) { input.className = 'InputFieldDisabled'; }
		
		function editLookupCodes()
		{
		    var lkpTable = $('LookupTable');
		    ForEach(lkpTable.rows,r,this);
		    ForEach(lkpTable.rows,setRowDirty,this);
		}
				
		function saveLookupCodes()
		{
		    
		}
		function r(row)
		{
		    var inputs = $(row).getByTag('input');
		    ForEach(inputs,setInputEnabled,this);
		    enableInputFields(row);
		}
		function setRowDirty(row)
		{
		    var inputs = $(row).getByTag('input');
		    var onchange = function(field)
		    {
		        return function(e)
		        {
		            
		            if(isFieldDirty(field))
		            {
		                row.isDirty = true;
		            }
		        }
		    }
		    for(var i=0;i<inputs.length;i++)
		    {
		        var inp = $(inputs[i]);
		        Event.Register('change',inp,onchange(inp),false);
		    }
		}

var lkpCodeGridId = '<%= LookupCodeGrid.ClientID %>';
var LKP_ID_PREFIX = 'id_';
var LKP_CODE_PREFIX = 'code_';
var LKP_DESC_PREFIX = 'desc_';
var LKP_ORDER_PREFIX = 'order_';
var LKP_SUPRESS_PREFIX = 'suppress_';
var CLONE_ROW;

function onLoad()
{
    var lkpTable = $(lkpCodeGridId);
    if(lkpTable)
    {
        CLONE_ROW = lkpTable.rows[lkpTable.rows.length-1].cloneNode(true);    
    }

}

function addEmptyRow()
{
    var clone = $(CLONE_ROW.cloneNode(true));
    var inputs = clone.getByTag('INPUT');
    clone.lkpCodeId = inputs[0];
    clone.lkpCode = inputs[0];
    clone.lkpDesc = inputs[1];
    clone.lkpOrder = inputs[2];
    clone.lkpSuppress = inputs[3];
    clone.validate = function() { return clone.lkpCode.value!=''; }
    clone.focusOnLkpCode = function() { clone.lkpCode.focus(); }
    clone.className = 'VisibleRow';
    addRow(clone);
    return clone;
}

function addRow(row)
{
    $(lkpCodeGridId).getByTag('TBODY')[0].appendChild(row);
}


Event.Register('load',window,onLoad,false);

function LookupRow(priKey)
{
    this.lkpId = $(LKP_ID_PREFIX + priKey);
    this.lkpCode = $(LKP_CODE_PREFIX + priKey);
    this.lkpDesc = $(LKP_DESC_PREFIX + priKey);
    this.LkpOrder = $(LKP_ORDER_PREFIX + priKey);
    this.lkpSupress = $(LKP_SUPRESS_PREFIX + priKey);
    this.fieldList = [this.lkpId,this.lkpCode,this.lkpDesc,this.LkpOrder,this.lkpSupress];
    this.isDirty = function() { return Map(this.fieldList,isFieldDirty,this).toBool('||'); }
}

function showNextAddRow(img,index)
{
    if(img==null) { return; }
    var isReset = img.src.indexOf('Cancel')>-1;  
    var grid = $(lkpCodeGridId);
    if(isReset)
    {
        var currentRow = grid.rows[index];
        resetInputFields(currentRow);
        img.src = '../Images/buttonAddSmall.gif';
        return false;
    }
    else
    {
        img.src = '../Images/buttonCancelSmall.gif';
        var nextRow = grid.rows[index+1];
        if(nextRow) { nextRow.className = ''; }
        else { alert('You have reached the end.'); }
    }
}
    function focusOnNextRow(nextIndex)
    {
        var grid = $(lkpCodeGridId);
        var nextRow = grid.rows[nextIndex];
        if(nextRow) 
        { 
            var fields = nextRow.getElementsByTagName('INPUT');
            if(fields.length>0) { fields[0].focus(); }
        }
    }
    
    function validateRow(rowIndex)
    {
        var grid = $(lkpCodeGridId);
        var row = grid.rows[rowIndex];
        if(row.getElementsByTagName('INPUT')[0].value=='')
        {
            alert('You must enter a value for Lookup Code before saving.');
            return false;
        }
        else
        {
            return true;
        }
    }
    
    function onRowKeyEvent(e,imgId,index)
    {
        if(e.keyCode==13)
        {
            Event.CancelBubble(e);
            if(!validateRow(index))
            {
                return false;
            }
            showNextAddRow($(imgId),index);
            focusOnNextRow(index+1);
            return false;
        }
        else { return true; }
    }
    
    function validateLkpOrder(field,evt) 
    { 
        var intVal = parseInt(field.value) + '';
        if(intVal == 'NaN') { field.value = ''; }
        else { field.value = intVal; }
    }
    </script>

    <style type="text/css">
        #repeaterDiv
        {
            margin-top: 10px;
        }
		.LookupAddImage
		{
		    margin-left: 7px;
		}
		.InputFieldDisabled
		{
		    border: 1px solid #cccccc;
		    color: #000000; 
		    background-color: #ffffff;
		}
		.InputFieldEnabled
		{
		    border: 1px solid #cccccc;
		    color: #000000; 
		    background-color: #ffffff;
		}
		.LookupGrid
		{
		    table-layout: fixed;
		    border-collapse: collapse;
		}
	    .LookupGrid td
		{
 		    border-top: 1px dotted #cccccc;
		}
		.LookupGrid img
		{
		    margin-left: auto;
		    margin-right: auto;
		}
		
		.HiddenRow
		{
		    display: none;
		}
		.VisibleRow
		{
		    display: inline;
		}
		</style>
</head>
<body class="AdminBody">
    <form id="dataForm" method="post" runat="server">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table style="table-layout: fixed; width: 100%;" border="0" cellspacing="3" cellpadding="0">
                        <tr>
                            <td class="adminFieldLabel" style="width: 100px;">
                                select field name:
                            </td>
                            <td style="width: 300px;">
                                <asp:DropDownList AutoPostBack="true" ID="fieldName" runat="server" Style="width: 200"
                                    OnSelectedIndexChanged="OnLookupFieldChange" AppendDataBoundItems="true">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="padding-left: 10px;">
                                <asp:ImageButton ID="fieldNameAddBtn" OnCommand="AddFieldNameButtonClick" runat="server"
                                    ImageUrl="../Images/ButtonAddNewFieldSmall.gif" />
                            </td>
                        </tr>
                    </table>
                    <div runat="server" id="repeaterDiv">
                        <!-- Lookup Grid Header -->
                        <table id="rptLookupCodesColumnHeadings" style="width: auto; table-layout: fixed;
                            text-align: center;" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 180px;" class="requiredField">
                                    value</td>
                                <td style="width: 180px;" class="requiredField">
                                    desciption</td>
                                <td style="width: 60px;" class="requiredField">
                                    order</td>
                                <td style="width: 80px;" class="requiredField">
                                    suppressed</td>
                            </tr>
                        </table>
                        <!-- Lookup Grid -->
                        <div style="border-style: none; z-index: 1; visibility: visible; overflow: auto;
                            width: auto; margin-left: auto; margin-bottom: 10px; margin-right: auto; height: 390px;
                            background-color: #ffffff;">
                            <asp:GridView CssClass="LookupGrid" GridLines="None" BorderStyle="None" BorderWidth="0"
                                RowStyle-BorderStyle="None" RowStyle-BorderWidth="0" DataKeyNames="LookupCodeId"
                                runat="server" ID="LookupCodeGrid" OnRowUpdating="OnLookupGridRowUpdaing" AutoGenerateColumns="false"
                                ShowHeader="false" ShowFooter="true" OnRowCreated="WireControlDataBoundEvents"
                                OnRowDeleting="OnRowDeleting" OnPreRender="HideBlankGridRows">
                                <Columns>
                                    <asp:TemplateField ItemStyle-Width="180">
                                        <ItemTemplate>
                                            <cc:CaisisTextBox Width="170" CssClass="InputFieldDisabled" runat="server" ID="LkpCode"
                                                Field="LkpCode" Table="LookupCodes" ShowLabel="false"></cc:CaisisTextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="180">
                                        <ItemTemplate>
                                            <cc:CaisisTextBox Width="170" CssClass="InputFieldDisabled" runat="server" ID="LkpDescription"
                                                Field="LkpDescription" Table="LookupCodes" ShowLabel="false"></cc:CaisisTextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="60" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <cc:CaisisTextBox Width="50" CssClass="InputFieldDisabled" runat="server" ID="LkpOrder"
                                                onchange="return validateLkpOrder(this,event);" Field="LkpOrder" Table="LookupCodes"
                                                ShowLabel="false"></cc:CaisisTextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-Width="60">
                                        <ItemTemplate>
                                            <cc:CaisisCheckBox CssClass="InputFieldDisabled" runat="server" ID="LkpSuppress"
                                                Field="LkpSuppress" Table="LookupCodes" ShowLabel="false"></cc:CaisisCheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <img alt="Add/Cancel" runat="server" id="ShowNextRowButton" visible="false" style="cursor: pointer;"
                                                src="../Images/ButtonAddSmall.gif" />
                                            <asp:ImageButton runat="server" ID="DeleteRow" Visible="false" ImageUrl="~/Images/ButtonDeleteSmall.gif"
                                                AlternateText="Delete Record" CommandName="Delete" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <asp:ImageButton runat="server" ID="btnUpdate" ImageUrl="~/Images/buttonUpdate.gif"
                            AlternateText="Update Lookup Codes" ImageAlign="AbsMiddle" OnClick="UpdateLookupCodesGrid" />
                    </div>
                    <div style="margin-top: 5px;">
                        <span style="font-weight: bold;">Note: </span>For changes to appear on the user
                        interfaces immediately, you must refresh the cache using the link to the left.
                    </div>
                    <table id="LookupTable" width="525" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td>
                                <asp:ImageButton Style="display: none;" CssClass="LookupAddImage" ID="addBtn" OnCommand="AddButtonClick"
                                    runat="server" ImageUrl="../Images/ButtonAddSmall.gif" AlternateText="Add A New Lookup Code."
                                    OnClientClick="return addNewLookupCode();" Visible="false" /></td>
                            <td colspan="3" height="20">
                                &nbsp;</td>
                        </tr>
                    </table>
                    <div id="tableDiv" runat="server" style="z-index: 4; overflow: auto; position: absolute;">
                        <table cellpadding="2" style="border: 1px solid gray;" width="180" align="right"
                            bgcolor="#e8e8e8">
                            <tr>
                                <td valign="top" id="AddFieldNameTableRow" runat="server">
                                    field name:<br>
                                    <input type="text" value="" id="lkpName" style="width: 175" runat="server" name="Text1" /><br>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="width: 100%; display: block;"><span style="float: left;">value:</span><span
                                        id="CharCounter" style="float: right;">char count: 0/150</span></span>
                                    <input type="text" value="" id="lkpValue" style="width: 175" runat="server" onkeyup="updateCharCounter();"
                                        onblur="checkCharMax();" /><br>

                                    <script type="text/javascript">
                            updateCharCounter();
                                    </script>

                                    description:<br>
                                    <textarea id="lkpDescription" style="width: 175; height: 80" runat="server"></textarea><br>
                                    <input type="text" id="lkpOrder" style="width: 30;" runat="server" name="lkpOrder" />&nbsp;order&nbsp;&nbsp;&nbsp;&nbsp<input
                                        type="checkbox" value="" id="lkpSuppress" runat="server" />&nbsp;suppress
                                    <input type="hidden" id="lkpCodeId" runat="server" />
                                    <input type="hidden" id="lkpFieldName" runat="server" name="Hidden1" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:ImageButton ID="tblAddBtn" OnCommand="InsertButtonClick" runat="server" OnClientClick="return checkCharMax();"
                                        src="../Images/ButtonAddSmall.gif"></asp:ImageButton><asp:ImageButton ID="updateBtn"
                                            OnCommand="UpdateButtonClick" runat="server" OnClientClick="return checkCharMax();"
                                            src="../Images/ButtonUpdateSmall.gif"></asp:ImageButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton
                                                ID="deleteBtn" OnCommand="DeleteButtonClick" runat="server" src="../Images/ButtonDeleteSmall.gif">
                                            </asp:ImageButton>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="cancelBtn" OnCommand="CancelButtonClick"
                                                runat="server" src="../Images/ButtonCancelSmall.gif"></asp:ImageButton></td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
