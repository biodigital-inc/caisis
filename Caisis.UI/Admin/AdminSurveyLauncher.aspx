<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSurveyLauncher.aspx.cs"
    Inherits="Admin_AdminSurveyLauncher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Admin Launcher</title>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/GlobalStyles.css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript">
        function editSurveys() {
            top.showModalWithConfig('Survey_Edit.aspx', 'Edit Surveys', { width: '85%', height: '85%', context: window });
            return false;
        }
        
        editSurveys();
    
    </script>

</head>
<body class="AdminBody">
    <form id="form1" runat="server">
        <div>
            <a charset="SectionTitle" href="Survey_Edit.aspx" target="_blank" onclick="return editSurveys();">
                Edit Surveys</a>
        </div>
    </form>
</body>
</html>
