<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CannedQuestionsChoose.aspx.cs"
    Inherits="Caisis.UI.Plugins.SurveyPlugin.CannedQuestionsChoose" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Canned Questions</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />

    <script type="text/javascript">
    /* <![CDATA[ */
    
    function copyCannedQuestion(val)
    {
        if(parent.setQuestionFromCanned)
        {
            parent.setQuestionFromCanned(val);
        }
    }
    
    function cancelCanned()
    {
        if(parent.closeCannedQuestions) { parent.closeCannedQuestions(); }
        return false;
    }
    
    /* ]]> */
    </script>

    <style type="text/css">
    a.Question
    {
        color: #333333;
        text-decoration: none;
        font-weight: bold;
        font-size: 12px;
    }
    a.Question:hover
    {
         text-decoration: underline;
    }
    </style>
</head>
<body style="background-color: #ffffff;">
    <form id="form1" runat="server">
        <div id="CannedQuestionsLayer" style="margin: auto;">
            <cic:CaisisSelect runat="server" ID="CannedSurveyList" ShowLabel="true" FieldLabel="Survey List:"
                DataTextField="SurveyType" DataValueField="MetadataSurveyId" AutoPostBack="true"
                OnSelectedIndexChanged="SetQuestions">
            </cic:CaisisSelect>
            <button onclick="return cancelCanned();">
                Close</button>
            <ol style="list-style-type: decimal;">
                <asp:Repeater runat="server" ID="CannedQuestionsRptr">
                    <ItemTemplate>
                        <li><a href="#" title="Copy Question" class="Question" onclick="copyCannedQuestion(this.innerHTML); return false;">
                            <%# Eval("Question") %>
                        </a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ol>
        </div>
    </form>
</body>
</html>
