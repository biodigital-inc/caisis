<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectFundingDetails.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectFundingDetails" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="Custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Funding Details</title>

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
           
        function goToEditDetails(fundingId, projectId)
        {
            top.OpenObj=window.self;
            var page = 'ProjectFundingDetails.aspx?edit=true&projectId=' + projectId + '&fundingId=' + fundingId ;
            var url = window.location.href;
            url = url.substr(0,url.lastIndexOf("/")) + "/" + page;
            showEditDetailsInModal(url, 'Funding Details', 800, 530);
        }
        
        function refreshList(fundingId, projectId)
        {
            parent.refreshList(fundingId, projectId);
        }

    </script>

    <style type="text/css">
    #DisplayPanel
    {
        overflow: auto;
        border: 1px solid #cccccc; 
        padding: 10px; 
        position: relative;
        background-color: #ffffff;
    }
    #EditPanel
    {
        overflow: auto;
        border: 1px solid #cccccc; 
        padding: 10px; 
 
        background-color: #ffffff;
    }
    .LabelCol
        {
            font-size: 12px;
            width: 145px;
        }
    .ValueCol
        {
            font-size: 12px;
        }
    .pdFormFieldLabel
    {
        margin-right: 8px;
    }
   </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label runat="server" ID="DetailsHeader" CssClass="ProjMgrDetailsHeader"></asp:Label>
        <asp:Panel runat="server" ID="DisplayPanel">
        
        <div style="padding: 10px; height: 340px; overflow: auto; padding-right: 20px; margin-bottom: 10px;">
        
            <asp:Panel ID="DisplayFundingPanel" runat="server">
                <table runat="server" id="DetailsViewLayer" class="ContentDetails">
                    <tr>
                        <td class="LabelCol">
                            Source Type
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="SourceType" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Start Date
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="StartDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            End Date
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="EndDate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Amount
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="Amount" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Amount Per Patient
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="AmountPerPatient" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Startup Cost
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="StartupCost" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Total Invoicable Cost
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="TotalInvoicableCost" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="LabelCol">
                            Initial Payment
                        </td>
                        <td class="ValueCol">
                            <asp:Label ID="InitialPayment" runat="server" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="ViewInvoicesPanel" runat="server" style="margin-top: 20px;">
                <asp:Label runat="server" ID="ViewInvoicesLabel" Text="Invoices" style="font-size: 13px; font-weight: bold;" />
                <asp:GridView HeaderStyle-CssClass="dataGridHeader" BorderColor="#cccccc" runat="server"
                    ID="FundingInvoiceGridViewReadOnly" ShowHeader="true" AutoGenerateColumns="false" style="table-layout: fixed; width: 90%"
                    ShowFooter="false" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB" >
                    <Columns>
                        <asp:TemplateField HeaderText="Service" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label Width="80" runat="server" ID="InvoiceService" Text='<%#Eval("InvoiceService")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cost" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label Width="80" runat="server" ID="InvoiceCost" Text='<%#Eval("InvoiceCost")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Condition" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label Width="80" runat="server" ID="InvoiceCondition" Text='<%#Eval("InvoiceCondition")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Notes" ItemStyle-VerticalAlign="Top" FooterStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <asp:Label Width="80" runat="server" ID="InvoiceNotes" Text='<%#Eval("Notes")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
            </div>
            <table class="ProjectMgmtBtnContainer">
                <tr>
                    <td><project:ProjectMgmtButton ID="ProjectMgmtButton1" runat="server" ImageUrl="Images/Button_Delete.gif" UserTypeNames="ModuleAdmin"
                            ToolTip="Delete Funding Source" CausesValidation="false" OnClientClick="return confirmDelete();"
                            OnClick="DeleteButton_Click" style="margin-right: 20px;" />
                        <project:ProjectMgmtButton runat="server" ID="EditButton" ImageUrl="Images/Button_Edit.gif" UserTypeNames="ModuleAdmin"
                            ToolTip="Edit Funding Source" style="margin-right: 20px;" />
                        
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel runat="server" ID="EditPanel">
            <div style="padding: 10px; height: 400px; overflow: auto; padding-right: 20px; margin-bottom: 0px; position: relative; ">
                <asp:Panel ID="EditFundingPanel" runat="server">
                    <asp:Label ID="UserMessage" runat="server"></asp:Label>
                    <table width="80%" cellpadding="4" cellspacing="0" border="0">
                        <tr>
                            <td>
                                <cic:CaisisComboBox TabIndex="1" FieldLabel="Source" Table="ProjectFundingSource"
                                    Field="Source" MaxLength="50" runat="server" Required="true" ID="SourceEdit" LookupCode="ProjectFundingSource" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSource" runat="server" ControlToValidate="SourceEdit"
                                    CssClass="RequiredFieldValidator" ErrorMessage="Required" ValidationGroup="SourceGroup"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisComboBox TabIndex="2" FieldLabel="Source Type" Table="ProjectFundingSource"
                                    Field="SourceType" MaxLength="50" runat="server" ID="SourceTypeEdit" LookupCode="ProjectFundingSourceType" /></td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisTextBox TabIndex="3" FieldLabel="Start Date" ShowCalendar="true" Table="ProjectFundingSource"
                                    Field="StartDate" runat="server" ID="StartDateEdit" /></td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisTextBox TabIndex="4" FieldLabel="End Date" ShowCalendar="true" Table="ProjectFundingSource"
                                    Field="EndDate" runat="server" ID="EndDateEdit" /></td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisTextBox TabIndex="5" FieldLabel="Amount" Table="ProjectFundingSource"
                                    Field="Amount" MaxLength="50" runat="server" ID="AmountEdit" /></td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisTextBox TabIndex="6" FieldLabel="Amount per Patient" Table="ProjectFundingSource"
                                    Field="AmountPerPatient" MaxLength="50" runat="server" ID="AmountPerPatientEdit" /></td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisTextBox TabIndex="7" FieldLabel="Startup Cost" Table="ProjectFundingSource"
                                    Field="StartupCost" MaxLength="50" runat="server" ID="StartupCostEdit" /></td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisTextBox TabIndex="8" FieldLabel="Total Invoicable Cost" Table="ProjectFundingSource"
                                    Field="TotalInvoicableCost" MaxLength="50" runat="server" ID="TotalInvoicableCostEdit" /></td>
                        </tr>
                        <tr>
                            <td>
                                <cic:CaisisTextBox TabIndex="9" FieldLabel="Initial Payment" Table="ProjectFundingSource"
                                    Field="InitialPayment" MaxLength="50" runat="server" ID="InitialPaymentEdit" /></td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="EditInvoicesPanel" runat="server"  style="margin-top: 30px;">
                    <asp:Label ID="EditInvoicesLabel" runat="server" Text="Invoices" style="display: block; font-size: 12px; font-weight: bold;"></asp:Label>
                    <Custom:ExtendedGridView TableName="ProjectInvoice" runat="server" ID="ProjectInvoiceGridView"
                        ShowHeader="true" AutoGenerateColumns="false" ShowFooter="false" HeaderStyle-CssClass="dataGridHeader"
                        RowStyle-CssClass="dataGridItemRowA" GridLines="None" AlternatingRowStyle-CssClass="dataGridItemRowB"
                        ShowFooterOnEmpty="false" BlankRows="5" RebindOnDelete="true" BorderColor="#cccccc" BorderWidth="1">
                        <Columns>
                            <Custom:GridRowDeleteImage HeaderText="Delete" ItemStyle-VerticalAlign="Top">
                            </Custom:GridRowDeleteImage>
                            <Custom:ExtendedTemplateField HeaderText="Service" ItemStyle-VerticalAlign="Top">
                                <ItemTemplate>
                                    <cic:CaisisComboBox Width="100" FieldLabel="InvoiceService" ShowLabel="false" runat="server"
                                        ID="InvoiceServiceEdit" Table="ProjectInvoice" Field="InvoiceService" MaxLength="50" LookupCode="ProjectFundingService" />
                                </ItemTemplate>
                            </Custom:ExtendedTemplateField>
                            <Custom:ExtendedTemplateField HeaderText="Cost" ItemStyle-VerticalAlign="Top">
                                <ItemTemplate>
                                    <cic:CaisisTextBox Width="80" FieldLabel="InvoiceCost" ShowLabel="false" runat="server"
                                        ID="InvoiceCostEdit" Table="ProjectInvoice" Field="InvoiceCost" MaxLength="50" />
                                </ItemTemplate>
                            </Custom:ExtendedTemplateField>
                            <Custom:ExtendedTemplateField HeaderText="Condition" ItemStyle-VerticalAlign="Top">
                                <ItemTemplate>
                                    <cic:CaisisTextBox Width="100" FieldLabel="InvoiceCondition" ShowLabel="false" runat="server"
                                        ID="InvoiceConditionEdit" Table="ProjectInvoice" Field="InvoiceCondition" MaxLength="50" />
                                </ItemTemplate>
                            </Custom:ExtendedTemplateField>
                            <Custom:ExtendedTemplateField HeaderText="Notes" ItemStyle-VerticalAlign="Top">
                                <ItemTemplate>
                                    <cic:CaisisTextArea Width="200" Height="25" FieldLabel="Notes" ShowLabel="false"
                                        runat="server" ID="NotesEdit" Table="ProjectInvoice" Field="Notes" MaxLength="1000" />
                                </ItemTemplate>
                            </Custom:ExtendedTemplateField>
                        </Columns>
                    </Custom:ExtendedGridView>
        </asp:Panel></div>
            <div id="DataEntryButtons">
                <project:ProjectMgmtButton ID="DeleteButton" runat="server" ImageUrl="Images/Button_Delete.gif"
                    UserTypeNames="ModuleAdmin" ToolTip="Delete Funding Source" CausesValidation="false"
                    OnClientClick="return confirmDelete();" OnClick="DeleteButton_Click" />
                <project:ProjectMgmtButton runat="server" ID="CancelBtn" UserTypeNames="ModuleAdmin"
                    OnClientClick="top.hideModal();" ImageUrl="Images/Button_Cancel.gif" ToolTip="Cancel" CausesValidation="false" />
                <project:ProjectMgmtButton runat="server" ID="UpdateButton" ImageUrl="Images/Button_Save.gif" UserTypeNames="ModuleAdmin"
                    ToolTip="Save Funding Source" CausesValidation="true" ValidationGroup="SourceGroup" OnClick="UpdateButton_Click" />
            </div>
        </asp:Panel>
    </form>
</body>
</html>
