<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminTreatmentInfo.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminTreatmentInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Treatment Arm Info</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        function onWindowResize() {
            $('MainContainer').style.height = Math.max(100, getHeight(window) - 225) + 'px';
        }

        function goToNext() {
            parent.reloadTreatmentArmsList();
            parent.setActiveTab('SchemaItems');
        }

        function reloadAndGoToNext(url) {
            parent.reloadTreatmentArmsList();
            parent.reloadAdminWizard(url);
        }

        /* ]]> */
    </script>

    <style type="text/css">
        body
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #222222;
            font-size: 14px;
        }
        #PrevBtn
        {
            float: left;
            cursor: pointer;
        }
        #NextBtn
        {
            float: right;
            cursor: pointer;
        }
    </style>
</head>
<body id="infoBody">
    <form id="form1" runat="server">
    <div id="MainContainer" style="width: 450px; margin: 100px auto auto auto;">
        Please enter information for this treatment arm.
        <div style="width: 100%; padding: 18px; text-align: left; border: solid 1px #cccccc;
            background-color: #f8fafc;">
            <table border="0">
                <tr>
                    <td width="100">
                        <label for="ArmName">
                            Name</label>
                    </td>
                    <td>
                        <asp:TextBox ID="ArmName" MaxLength="499" runat="server" Style="width: 300px; border: solid 1px #999999;"
                            OnTextChanged="MarkFormDirty"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="ArmNameRequired" runat="server" ErrorMessage="Name is required"
                            ControlToValidate="ArmName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="ArmMaxAccrual">
                            Accrual Limit</label>
                    </td>
                    <td>
                        <asp:TextBox ID="ArmMaxAccrual" runat="server" Style="width: 28px; border: solid 1px #999999;"
                            OnTextChanged="MarkFormDirty"></asp:TextBox>
                    </td>
                </tr>
                    <tr>
                    <td>
                        <label for="ArmActive">
                            Arm Active?</label>
                    </td>
                    <td>
                        <asp:CheckBox ID="ArmActive" runat="server" OnCheckedChanged="MarkFormDirty" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        <asp:RangeValidator Type="Integer" MinimumValue="0" MaximumValue="20000" ID="ArmMaxAccrualRequired"
                            runat="server" ErrorMessage="Maximum Accrual must be a number greater than zero."
                            ControlToValidate="ArmMaxAccrual"></asp:RangeValidator>
                    </td>
                </tr>
            </table>
        </div>
        <asp:ImageButton ID="NextBtn" runat="server" CausesValidation="true" ImageUrl="Images/Button_Next.png"
            AlternateText="Next Screen" ToolTip="Save" OnClick="NextClick" OnPreRender="SetBtnVisibility"
            CssClass="WizardNextBtn" Style="margin-top: 10px;" />
        <asp:ImageButton ID="SaveTreatment" runat="server" CausesValidation="true" ImageUrl="Images/Button_Next.png"
            AlternateText="Save" ToolTip="Save" OnClick="SaveTreatment_Click" OnPreRender="SetBtnVisibility"
            Style="float: right; margin-top: 10px; margin-right: 40px;" />
    </div>
    </form>
</body>
</html>
