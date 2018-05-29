<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetAccessLevel.aspx.cs" Inherits="Caisis.UI.Core.Utilities.SetAccessLevel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function setFormVar(datasetId) {
            document.getElementById('<%= DatasetId.ClientID %>').value = datasetId;
            var mainForm = document.getElementById('form1');
            mainForm.submit();
        }
    </script>
    <link href="../../StyleSheets/DataAnalysis.css" rel="stylesheet" type="text/css" />
    
    <style type="text/css">
    .ReportList_ReportOuterContainer div.ReportList_ReportInnerContainer
    {
        min-height: 17px; 
    }
    .ReportList_ReportOuterContainer:hover div.ReportList_ReportInnerContainer
    {
        min-height: 17px; 
        background-image: url(../../Images/ReportListHoverBorder_Top_500px.png);
        width: 500px;
    }
    .ReportList_ReportOuterContainer:hover div.ReportList_ReportContainerBottom
    {
        background-image: url(../../Images/ReportListHoverBorder_Bottom_500px.png);
        width: 500px;
    }
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="DatasetId" runat="server" />
    
        <div id="ReportListContainer" visible="true" style="margin-top: 30px; width: 536px;">
        <div id="DataAnalysisSelectAReportTitle" runat="server" style="font-size: 14px; font-weight: normal;">
                    You have been assigned to more than one patient dataset. A dataset is an isolated view of patients grouped by some shared property such as a disease or institution service. 
                    <br /><br /><br />
                    <strong>Please select your default dataset below. You will only see this screen on your first login, but your dataset can be updated at any time from the user dashboard.</strong> 
        </div>
        <div id="NoDatasetAccess" visible="false" runat="server" style="font-size: 14px; font-weight: normal;">
                   
                    <br />
                    <strong>You have not been assigned to a User Group with access to a Dataset of patients</strong> 
                    <br /><br />Please contact your system admin and ask them to confirm your user group is assigned to at least one dataset of patients. 
        </div>
        <div class="GrayContainerBox_TopLeft">
            <div class="GrayContainerBox_TopRight">
                <div class="GrayContainerBox_BottomLeft">
                    <div class="GrayContainerBox_BottomRight">
                        <div class="GrayContainerBox_InnerContainer" style="padding: 10px 2px 10px 18px;">
                            <div id="scrollableDiv" style="overflow: auto; overflow-x: hidden; max-height: 550px;">
                                <%-- start repeating unit --%>
                                <asp:Repeater runat="server" ID="DatasetButtons" >
                                    <ItemTemplate>
                                        <div class="ReportList_ReportOuterContainer" onclick="setFormVar('<%# EncryptDatasetId(Eval("DatasetId").ToString()) %>');" style="width: 500px;">
                                            <div class="ReportList_ReportInnerContainer" >
                                                <div class="ReportList_ReportText">
                                                    <span class="ReportList_ReportTitle"><%# Eval("DatasetName") %></span>
                                                </div>
                                            </div>
                                            <div class="ReportList_ReportContainerBottom">
                                                &nbsp;</div>
                                        </div>
                                    </ItemTemplate>
                                    <SeparatorTemplate>
                                        <%-- separator --%>
                                        <div class="ReportList_Separator">
                                            &nbsp;</div>
                                        <%-- end separator --%>
                                    </SeparatorTemplate>
                                </asp:Repeater>
                                <%-- end repeating unit --%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
 
    </form>
</body>
</html>
