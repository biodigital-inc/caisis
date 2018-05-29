<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Surveys_Add.aspx.cs" Inherits="Caisis.UI.Admin.Surveys_Add" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add A Survey</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        function closeAndReloadSurveys(surveyId) {
            // refresh frame
            var dataFrame = window.top.frames['DataEntryFrame'];
            if (dataFrame) {
                dataFrame.location = 'Surveys_Edit.aspx?surveyId=' + surveyId;

            }
            // hide modal
            if (top.hideModal) {
                top.hideModal();
            }
            return false;
        }

        /* ]]> */
    </script>

</head>
<body class="AdminBody">
    <form id="form1" runat="server">
    <table style="width: 95%; margin: auto;" cellpadding="2" cellspacing="2" border="0">
        <tr>
            <td>
                <label for="SurveyType">
                    Survey</label>
            </td>
            <td colspan="5">
                <cic:CaisisTextBox ID="SurveyType" runat="server" Table="MetadataSurveys" Field="SurveyType"
                    ShowLabel="false" Width="100%"></cic:CaisisTextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a valid survey name"
                    ControlToValidate="SurveyType"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <label for="SurveyCategory">
                    Category</label>
            </td>
            <td>
                <cic:CaisisComboBox ID="SurveyCategory" runat="server" Table="MetadataSurveys" Field="SurveyCategory"
                    LookupCode="SurveyCategory" ShowLabel="false"></cic:CaisisComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <label for="SendCondition">
                    Send Condition</label>
            </td>
            <td>
                <cic:CaisisTextBox ID="SendCondition" runat="server" Table="MetadataSurveys" Field="SendCondition"
                    ShowLabel="false"></cic:CaisisTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <label for="VersionNumber">
                    Version Number</label>
            </td>
            <td>
                <cic:CaisisTextBox ID="VersionNumber" runat="server" Table="MetadataSurveys" Field="VersionNumber"
                    ShowLabel="false" Width="50px"></cic:CaisisTextBox>
            </td>
        </tr>
    </table>
    <asp:ImageButton runat="server" ID="SaveBtn" ImageUrl="~/Images/DataEntryButtons/Button_Save_Click.gif"
        OnClick="SaveClick" />
    </form>
</body>
</html>
