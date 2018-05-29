<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminAddEditInstitutionAndContacts.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.AdminAddEditInstitutionAndContacts" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add/Edit Contacts and Institutions</title>
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script type="text/javascript">
    Browser.ResizeElement( { nodeId: 'AddEditFrame', heightOffset: 240 });
    
    var saveType;
    
    function saveInnerForm(type)
    {
        
        var formPage = window.frames['AddEditFrame'];
        if(formPage.doFormSave)
        {
            saveType = type;
            formPage.doFormSave();
            return false;
        }
        return true;
    }
    
    // Determine if save was initatized by back or next btn
    function handleOrgSave()
    {
        if(saveType=='Back' && goBack)
        {
            goBack();
        }
        else if(saveType=='Next' && goForward)
        {
            goForward();
        }
    }
       
    </script>

    <style type="text/css">
    .NavBtn
    {
        margin: 5px;
    }
    #BackBtn
    {
        float: left;
    }
    #NextBtn
    {
        float: right;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <div class="MenuContainter" style="height: 12px; width: 100%; display: block; border: none; margin: 0px;"> </div>
    
    
        <!-- Determines Edit Mode - Organizations Or Contacts -->
        <asp:HiddenField runat="server" ID="EditType" Value="Organizations" />
        <div style="width: 80%; margin: 15px auto auto auto;">
            <table cellpadding="0" cellspacing="0" border="0" align="center" style="width: 100%;
                margin: auto;">
                <tr class="BlueListBar">
                    <td class="BlueListBar" width="2%">
                        <img src="../Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;" /></td>
                    <td class="BlueListBar" width="96%">
                        <span style="font-size: 14px; margin-top: 10px; font-weight: normal;"><strong>Create New Project -</strong>&nbsp;&nbsp;&nbsp; Step 3:
                            <asp:Label runat="server" ID="PageTitle"></asp:Label></span></td>
                    <td class="BlueListBar" width="2%" style="text-align: right;">
                        <img src="../Images/HeaderBarBlueRight.gif" width="6" height="35" align="right" /></td>
                </tr>
            </table>
            <div style="margin-left: auto; margin-right: auto; border: solid 3px #e4e4e4; padding-top: 10px; background-color: #ffffff;">
                <iframe runat="server" id="AddEditFrame" name="AddEditFrame" src="" style="width: 100%;
                    height: 510px; border-style: none;" frameborder="0"></iframe>
            </div>
            <div class="WizardBtnContainer">
                <asp:ImageButton runat="server" ID="BackBtn" CssClass="NavBtn" ImageUrl="../Images/Button_Back.gif"
                    ToolTip="Return to Edit Stages/Events" OnClick="HandleBackClick" OnClientClick="return saveInnerForm('Back');" />
                <asp:ImageButton runat="server" ID="NextBtn" CssClass="NavBtn" ImageUrl="../Images/Button_Next.gif"
                    ToolTip="Go to edit Stages/Events" OnClick="HandleNextClick" OnClientClick="return saveInnerForm('Next');" />
            </div>
        </div>
    </form>
</body>
</html>
