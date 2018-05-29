<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditLetterOfIntentField.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.EditLetterOfIntentField" %>
    
<%@ Register TagPrefix="diseaseState" TagName="DiseaseEditor" Src="Controls/DiseaseState.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Letter of Intent Field</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

</head>
<body style="background-color: #ffffff;">
    <form id="form1" runat="server">
        <div style="width: 100%;">
            <asp:PlaceHolder ID="EditorHolder" runat="server"></asp:PlaceHolder>
            
            <table style="width: 100%; table-layout: fixed;">
                <tr>
                    <td style="text-align: right;">
                        <asp:ImageButton ID="BtnCancel" runat="server" OnClientClick="top.hideModal(); return false;"
                            ImageUrl="~/Images/buttonCancel.gif" AlternateText="Cancel" />
                    </td>
                    <td style="text-align: left;">
                        <asp:ImageButton ID="BtnSave" runat="server" ImageUrl="~/Images/buttonSave.gif" AlternateText="Update"
                            OnClick="SaveRecord" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
