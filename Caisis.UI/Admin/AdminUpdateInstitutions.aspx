<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminUpdateInstitutions.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminUpdateInstitutions" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Institutions Table</title>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/GlobalStyles.css" />
    <style type="text/css">
.Buttons { margin-left: auto; margin-right: auto; text-align: center; }
</style>

    <script type="text/javascript">
    var fields = new Array();
    function setFieldsReadOnly(readonly,isPageLoad) 
    { 
        isPageLoad = isPageLoad ? isPageLoad : false;
        for(var i in fields){ fields[i].disabled = readonly; } 
        var saveBtn = document.getElementById('SaveInstitutionsBtn');
        var editBtn = document.getElementById('EditInstitutionsBtn');
        var cancelBtn = document.getElementById('CancelInstitutionsBtn');
        saveBtn.src = readonly ? "../Images/DataEntryButtons/Button_Save_Off.gif" : "../Images/DataEntryButtons/Button_Save_On.gif";
        saveBtn.disabled = readonly;
        cancelBtn.src = readonly ? "../Images/DataEntryButtons/Button_Cancel_Off.gif" : "../Images/DataEntryButtons/Button_Cancel_On.gif";
        cancelBtn.disabled = readonly;

        if(!isPageLoad)
        {
        editBtn.src = !readonly ? "../Images/DataEntryButtons/Button_Edit_Off.gif" : "../Images/DataEntryButtons/Button_Edit_On.gif";
        editBtn.disabled = !readonly && !isPageLoad ;
        }
    }
    var onLoadEvent = function() 
    { 
        var list = document.getElementsByTagName('table')[0];
        list = list.getElementsByTagName('input');
        for(var i=0;i<list.length;i++) { fields.push(list[i]);  }
        setFieldsReadOnly(true,true);
    }
    window.attachEvent ? window.attachEvent('onload',onLoadEvent) : window.addEventListener('load',onLoadEvent,false);
    </script>

</head>
<body class="AdminBody">
    <form id="form1" runat="server">
        <div>
            <!-- Institutions Grid -->
            <div style="margin-left: auto; margin-right: auto; width: 400px; padding-bottom: 10px;">
                <asp:GridView CssClass="dataGrid" runat="server" ID="InstitutionGrid" DataSourceID="GridDS"
                    DataKeyNames="InstitutionId" AutoGenerateColumns="false" HorizontalAlign="Center">
                    <Columns>
                        <asp:TemplateField ControlStyle-BorderStyle="None">
                            <ItemTemplate>
                                <asp:HiddenField ID="InstitutionId" runat="server" Value='<%# Eval("InstitutionId")%>' />
                                <asp:ImageButton runat="server" ID="DeleteInstitutionBtn" CommandName="DeleteInstitution"
                                    OnCommand="DeleteInstitution" CommandArgument='<%# Eval("InstitutionId")%>' ImageUrl="~/Images/iconDelete.gif"
                                    OnClientClick="return confirm('Are you sure you want to delete this Institution?');">
                                </asp:ImageButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Current Institutions">
                            <ItemTemplate>
                                <asp:TextBox ID="InstitutionName" Width="200" OnTextChanged="MarkDirty" runat="server"
                                    Text='<%# Eval("Institution")%>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource runat="server" ID="GridDS" TypeName="Caisis.DataAccess.InstitutionDa"
                    SelectMethod="GetInstitutions"></asp:ObjectDataSource>
            </div>
            <div class="Buttons">
                <asp:ImageButton ID="AddInstitutionsBtn" ImageUrl="~/Images/DataEntryButtons/Button_New_On.gif"
                    runat="server" OnCommand="ShowAddInstitution" />
                <asp:ImageButton ID="EditInstitutionsBtn" ImageUrl="~/Images/DataEntryButtons/Button_Edit_On.gif"
                    runat="server" OnClientClick="setFieldsReadOnly(false); return false;" />
                <asp:ImageButton ID="SaveInstitutionsBtn" ImageUrl="~/Images/DataEntryButtons/Button_Save_Off.gif"
                    runat="server" OnCommand="SaveInstitutionsGrid" />
                <asp:ImageButton ID="CancelInstitutionsBtn" ImageUrl="~/Images/DataEntryButtons/Button_Cancel_On.gif"
                    runat="server" OnCommand="CancelAddInstitution"/>
            </div>
            <div id="AddPanel" style="text-align: center; padding-top: 20px;" runat="server"
                visible="false">
                <h5 style="margin-bottom: 0px;">
                    Please Enter a New Institution</h5>
                <asp:TextBox ID="InstitutionName" Width="200" runat="server"></asp:TextBox>
                <div>
                    <asp:ImageButton ID="AddBtn" Width="65" Height="21" ImageUrl="~/Images/AdminImages/submit.gif"
                        runat="server" OnCommand="AddInstitution" />
                    <asp:ImageButton ID="CancelBtn" Width="65" Height="21" ImageUrl="~/Images/CancelOnWhite_small.gif"
                        runat="server" OnCommand="CancelAddInstitution" /></div>
            </div>
        </div>
    </form>
</body>
</html>
