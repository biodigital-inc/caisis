<%@ Page Language="C#" EnableViewState="false" EnableEventValidation="false" AutoEventWireup="true"
    CodeFile="AdminChildParentLookupCodes.aspx.cs" Inherits="Caisis.UI.Admin.AdminChildParentLookupCodes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lookup Codes Editor</title>
    <link type="text/css" rel="stylesheet" href="../Stylesheets/GlobalStyles.css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../ClientScripts/Admin.js"></script>

    <script type="text/javascript">

    function onParentCodeSelect()
    {
        var list = $('ParentLookupCodeField');
        var selectedValue = getValue(list);
        // Show Associate Section
        
        $('ChildLookupCodeField').disabled = false;
        $('ChildLookupCodeField').selectedIndex = 0;
        $('LkpFieldCodesNew').clear();
        if(selectedValue!='' && (parseInt(selectedValue) + '')!='NaN')
        {
            var params = new Param();
            params.add('methodName','getAllCodesByParentId');
            params.add('parentLookupId',selectedValue);
            doAdminServerCallBack(params,onGetAllChildLookupCodes);
        }
        else
        {
            $('NewSection').style.display = 'none';
        }
    }
    
    function onGetAllChildLookupCodes(txt,xml)
    {
        $('NewSection').style.display = '';
        var rel = $('CurrentAssociations');
        rel.clear();
        var ul = document.createElement('UL');
        var li = document.createElement('LI');
        var codeList = eval('(' + txt + ')');
        if(codeList.length>0)
        {
            for(var i=0;i<codeList.length;i++)
            {
                var obj = codeList[i];
                var cloneLI = li.cloneNode(true);
                cloneLI.innerHTML = '<a href="#" onclick="return chooseChildLkpField(\'' + obj.field + '\');">' + obj.field + '</a>';
                var cloneUL = ul.cloneNode(true);
                cloneLI.appendChild(cloneUL);
                rel.appendChild(cloneLI);
                for(var j=0;j<obj.codes.length;j++)
                {
                    var lkpId = obj.codes[j][0];
                    var lkpCode = obj.codes[j][1];
                    
                    var clone = li.cloneNode(true);
                    clone.innerHTML = lkpCode;
                    cloneUL.appendChild(clone);
                }
            }
        }
    }
    
    function chooseChildLkpField(field)
    {
        showAssociationSection();
        var newLkpField = $('ChildLookupCodeField');
        for(var i=0;i<newLkpField.options.length;i++)
        {
            var opt = newLkpField.options[i];
            if(opt.text==field)
            {
                newLkpField.selectedIndex = i;
                getLookupCodesAndChildCodes();
                break;
            }
        }
        return false;
    }
    
    function setAssociation()
    {
        var parentLookupSelect = $('ParentLookupCodeField');
        var parentLookupOption = parentLookupSelect.options[parentLookupSelect.selectedIndex];
        var parentLookupId = parentLookupOption.value;
        var parentLookupField = parentLookupOption.text;
        
        var childLookupSelect = $('ChildLookupCodeField');
        var childLookupOption = childLookupSelect.options[childLookupSelect.selectedIndex];
        var childLookupField = childLookupOption.value;
                
        var pathText = $('SrcText');
        if(parentLookupId=='')
        {
            alert('Please Choose A Source Parent LookupCode');
        }
        else
        {
            pathText.innerHTML = 'Parent Lookup Code: ' + parentLookupField + ' - Child Lookup Code: ' + childLookupField;
        }
    }
    
    function populateDropDown(dropDown,optArray)
    {
        var baseOption = Node.Create('OPTION');
        dropDown.clear();
        if(dropDown==$('ParentLookupCodeField'))
        {
            dropDown.appendChild(baseOption.cloneNode(true));
        }
        for(var i=0;i<optArray.length;i++)
        {
            var lkpCodeId = optArray[i][0];
            var lkpCode = optArray[i][1];
            var opt = baseOption.cloneNode(true);
            opt.text = lkpCode;
            opt.value = lkpCodeId;
            addDropDownOption(dropDown,opt);
        }
    }
    
    function addDropDownOption(dropDown,option){ dropDown.appendChild(option); }
    
    function getLookupCodeCallBack(dropDown)
    {
        return function(txt,xml)
        {
            var obj = eval('(' + txt + ')');
            populateDropDown(dropDown,obj.codes);
        }
    }
    
    function populateLookupCodesAndChildNodes(txt,xml)
    {
        var obj = eval('(' + txt + ')');
        
        var from = $('LkpFieldCodesNew');
        var to = $('ParentChildLookupCodes');
        
        populateDropDown(from,obj.codes);
        populateDropDown(to,obj.childCodes);
    }
    
    function getLookupCodes(src,dest)
    {
        var srcDropDown = $(src);
        var targetDropDown = $(dest);
        
        $('ChildLookupCodeField').disabled = true;
        
        var lkpField = srcDropDown.value;
        var params = new Param();
        params.add('methodName','getCodes');
        params.add('lookupCodeFieldName',lkpField);
        var callback = getLookupCodeCallBack(targetDropDown);
        doAdminServerCallBack(params,callback);
    }
    
    function getLookupCodesAndChildCodes()
    {
        var srcDropDown = $('ParentLookupCodeField');
        var targetDropDown = $('ChildLookupCodeField');
        var parentLookupId = srcDropDown.value;
        var childLookupFieldName = targetDropDown.value;
        
        var params = new Param();
        params.add('methodName','getCodesByParentIdAndChildFieldName');
        params.add('parentLookupId',parentLookupId);
        params.add('childLookupFieldName',childLookupFieldName);
        doAdminServerCallBack(params,populateLookupCodesAndChildNodes);
    }
    

    
    function addAssociations()
    {
        var from = $('LkpFieldCodesNew');
        var to = $('ParentChildLookupCodes');
        var parentLookupId = $('ParentLookupCodeField').value;
        var childLkpField = $('ChildLookupCodeField').options[$('ChildLookupCodeField').selectedIndex].text;
        var fromList = new Array();
        for(var i=0;i<from.options.length;i++)
        {
            var opt = from.options[i];
            if(opt.selected)
            {
                fromList.push(opt.value);
            }
        }
        if(fromList.length>0)
        {
            var listOfKeys = fromList.join(',');
            var params = new Param();
            params.add('methodName','addAssociations');
            params.add('childLookupFieldName',childLkpField);
            params.add('parentLookupId',parentLookupId);
            params.add('lookupCodeIdList',listOfKeys);
            doAdminServerCallBack(params,populateLookupCodesAndChildNodes);
        }
        else
        {
            alert('You have not selected any codes to add.');
        }
        
    }
    
    
    function removeAssociations()
    {
        var from = $('LkpFieldCodesNew');
        var to = $('ParentChildLookupCodes');
        var parentLookupId = $('ParentLookupCodeField').value;
        var childLkpField = $('ChildLookupCodeField').options[$('ChildLookupCodeField').selectedIndex].text;
        var toList = new Array();
        for(var i=0;i<to.options.length;i++)
        {
            var opt = to.options[i];
            if(opt.selected)
            {
                toList.push(opt.value);
            }
        }
        if(toList.length>0)
        {
            var listOfKeys = toList.join(',');
            var params = new Param();
            params.add('methodName','removeAssociations');
            params.add('childLookupFieldName',childLkpField);
            params.add('parentLookupId',parentLookupId);
            params.add('lookupCodeIdList',listOfKeys);
            doAdminServerCallBack(params,populateLookupCodesAndChildNodes);
        }
        else
        {
            alert('You have not selected any codes to remove.');
        }
    }
    
    function populateAssociations()
    {
        var assc = $('CurrentAssociations');
        assc.clear();
    }
    
    function showAssociationSection()
    {
        var association = $('AssociationSection');
        var associationList = $('CurrentAssociations');
        association.style.display = '';
        associationList.style.display = 'none';
    }
    
    function hideAssociationSection()
    {
        var association = $('AssociationSection');
        var associationList = $('CurrentAssociations');
        association.style.display = 'none';
        associationList.style.display = '';
        onParentCodeSelect();
    }
    </script>

</head>
<body class="AdminBody">
    <form id="form1" runat="server">
        <div style="width: 600px;">
            <div style="float: left;">
                <div class="SectionTitle">
                    Choose a Lookup Field</div>
                <asp:DropDownList runat="server" ID="LookupCodes" DataTextField="LkpFieldName" DataValueField="LkpFieldName"
                    AppendDataBoundItems="true" onchange="getLookupCodes('LookupCodes','ParentLookupCodeField');">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div style="float: right;">
                <div class="SectionTitle">
                    Choose A Lookup Code Value</div>
                <select id="ParentLookupCodeField" style="width: 300px;" onchange="onParentCodeSelect();">
                </select>
            </div>
        </div>
        <!-- Relation Tree -->
        <div id="NewSection" style="display: none;">
            <div class="SectionTitle" style="margin-top: 25px; clear: both;">
                Child Lookup Codes and Values
            </div>
            <a href="#" onclick="showAssociationSection(); return false;">Add New Child Lookup Codes</a>
            <ul id="CurrentAssociations">
            </ul>
            <div id="SrcText" style="font-weight: bold; font-size: 14px;">
            </div>
            <div id="AssociationSection" style="display: none;">
                <img alt="Remove Lookup Codes" title="Remove Lookup Codes" src="../Images/Close.gif"
                    onclick="hideAssociationSection(); return false;" style="float: right; cursor: pointer;" />
                <div style="clear: both;">
                    <asp:DropDownList runat="server" ID="ChildLookupCodeField" DataTextField="LkpFieldName"
                        DataValueField="LkpFieldName" AppendDataBoundItems="true" onchange="getLookupCodesAndChildCodes();"
                        Style="display: block;">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                    <div>
                        <select id="LkpFieldCodesNew" style="width: 300px; height: 325px; float: left;" size="20"
                            multiple="true">
                        </select>
                        <select id="ParentChildLookupCodes" style="width: 300px; height: 325px; float: right;"
                            size="20" multiple="true">
                        </select>
                    </div>
                </div>
                <div style="clear: both;">
                    <img alt="Add Lookup Codes" title="Add Lookup Codes" src="../Images/ButtonAddSmall.gif"
                        onclick="addAssociations(); return false;" style="float: left; cursor: pointer;" />
                    <img alt="Remove Lookup Codes" title="Remove Lookup Codes" src="../Images/ButtonDeleteSmall.gif"
                        onclick="removeAssociations(); return false;" style="float: right; cursor: pointer;" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
