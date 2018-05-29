<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPatientDataConfig.aspx.cs"
    Inherits="AdminPatientDataConfig" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    body { background-color: #ffffff; }
    #TreeHolder { float: left; width: 45%; }
    #AttributesEditor { position: absolute; float: right; left: 45%; }
    #SaveEditButtons { margin-left: auto; margin-right: auto; text-align: center; }
    #SaveEditButtons input { width: 100px; }
    label { width: 150px; display: block; float: left; }
    input,select { width: 125px; margin-bottom: 3px; }
    </style>

    <script type="text/javascript">
    var fields = new Array();
    function setFieldsReadOnly(readonly) { for(var i in fields){ fields[i].disabled = readonly; } }
    var onLoadEvent = function() 
    { 
        var list = document.getElementById('AttributesEditor').childNodes;
        for(var i=0;i<list.length;i++) 
        { 
            if(list[i].tagName == 'INPUT' || list[i].tagName == 'SELECT') fields.push(list[i]); 
        }
        setFieldsReadOnly(true);
    }
    window.attachEvent ? window.attachEvent('onload',onLoadEvent) : window.addEventListener('load',onLoadEvent,false);
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 500px; overflow: auto; padding: 10px;">
            <!-- START Left Column - Tree -->
            <span style="display: block; color: Red;">NOTE: These settings can be edited directly in the PatientDataEntryConfig.xml file located in your App_Data folder under the application root. In order to update the configuration from this interface,
            you application needs to have write permissions to the file.</span>
            <div id="TreeHolder">
                <h5>
                    Please Select A Node:</h5>
                <asp:HiddenField ID="XPathHidden" runat="server" />
                <asp:TreeView ID="XmlConfigTree" runat="server" DataSourceID="XmlDS" OnSelectedNodeChanged="SetSelectedNodeXPath"
                    ShowExpandCollapse="true" ShowLines="true">
                    <DataBindings>
                        <asp:TreeNodeBinding DataMember="menuItem" TextField="menuTitle" />
                        <asp:TreeNodeBinding DataMember="menu" TextField="menuTitle" />
                    </DataBindings>
                </asp:TreeView>
                <asp:XmlDataSource runat="server" ID="XmlDS" DataFile="~/App_Data/PatientDataEntryConfig.xml"
                    XPath="//menu"></asp:XmlDataSource>
            </div>
            <!-- END Left Column -->
            <!-- Right Column - Attributes Editor -->
            <div runat="server" id="AttributesEditor">
                <h5>
                    <span style="width: 150px;">Current Node: </span>
                    <asp:Label runat="server" ID="CurrentNodeLabel"></asp:Label></h5>
                <!-- 
                    START Attributes Definition (TextBox or DropDownList) 
                    Set label and control for metadata attribute, ID needs to 
                    be the same as attrbute name. Saving/Population happens in Code-Behind.
                -->
                <label for="menuTitle">
                    Menu Title</label>
                <asp:TextBox runat="server" ID="menuTitle"></asp:TextBox>
                <label for="tableName">
                    Table Name</label>
                <asp:TextBox runat="server" ID="tableName"></asp:TextBox>
                <label for="numDisplayColumns">
                    Number Of Display Columns</label>
                <asp:TextBox runat="server" ID="numDisplayColumns"></asp:TextBox>
                <label for="loadByDefault">
                    Load By Default</label>
                <asp:DropDownList runat="server" ID="loadByDefault">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <asp:ListItem Text="true" Value="true"></asp:ListItem>
                    <asp:ListItem Text="false" Value="False"></asp:ListItem>
                </asp:DropDownList>
                <label for="fileName">
                    Filename</label>
                <asp:TextBox runat="server" ID="fileName"></asp:TextBox>
                <label for="fileName">
                    Page Title</label>
                <asp:TextBox runat="server" ID="pageTitle"></asp:TextBox>
                <label for="displayWithParent">
                    Display With Parent Table</label>
                <asp:DropDownList runat="server" ID="displayWithParent">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <asp:ListItem Text="true" Value="true"></asp:ListItem>
                    <asp:ListItem Text="false" Value="False"></asp:ListItem>
                </asp:DropDownList>
                <label for="displayWithChild">
                    Display With Child Tables</label>
                <asp:TextBox runat="server" ID="displayWithChild"></asp:TextBox>
                <label for="chronListOption">
                    Chron List Option</label>
                <asp:TextBox runat="server" ID="chronListOption"></asp:TextBox>
                <label for="chronListText">
                    Chron List Text</label>
                <asp:TextBox runat="server" ID="chronListText"></asp:TextBox>
                <label for="displayInMainMenu">
                    Display In Main Menu</label>
                <asp:DropDownList runat="server" ID="displayInMainMenu">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <asp:ListItem Text="true" Value="true"></asp:ListItem>
                    <asp:ListItem Text="false" Value="false"></asp:ListItem>
                </asp:DropDownList>
                <label for="displayInSubMenu">
                    Display In Sub Menu</label>
                <asp:DropDownList runat="server" ID="displayInSubMenu">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <asp:ListItem Text="true" Value="true"></asp:ListItem>
                    <asp:ListItem Text="false" Value="false"></asp:ListItem>
                </asp:DropDownList>
                <label for="gridView">
                    Display As Grid</label>
                <asp:DropDownList runat="server" ID="gridView">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <asp:ListItem Text="true" Value="true"></asp:ListItem>
                    <asp:ListItem Text="false" Value="false"></asp:ListItem>
                </asp:DropDownList>
                <label for="defaultGridRows">
                    Default Blank Grid Rows</label>
                <asp:TextBox runat="server" ID="defaultGridRows"></asp:TextBox>
                <!-- END Attributes Definition -->
                <div id="SaveEditButtons">
                    <asp:Button runat="server" OnClientClick="setFieldsReadOnly(false); return false;"
                        Text="Edit" />
                    <asp:Button runat="server" OnCommand="SaveAttributes" Text="Save" />
                    <input type="reset" value="Cancel" onclick="setFieldsReadOnly(true);return true;" />
                </div>
            </div>
            <!-- END Left Column -->
        </div>
    </form>
</body>
</html>
