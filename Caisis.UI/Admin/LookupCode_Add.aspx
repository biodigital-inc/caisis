<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupCode_Add.aspx.cs" Inherits="Caisis.UI.Admin.LookupCode_Add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Lookup Code</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        /* <![CDATA[ */

        function closeAndReloadLkpCode(lkpField) {
            // refresh frame
            var lkpFrame = window.top.frames['DataEntryFrame'];
            if (lkpFrame) {
                lkpFrame.location = 'LookupCode_Edit.aspx?lkpField=' + lkpField;

            }
            // hide modal
            if (top.hideModal) {
                top.hideModal();
            }
            return false;
        }

        function cancelAddLkpCode() {
            if (top.hideModal) {
                top.hideModal();
            }
            return false;
        }

        function validateAgainstCurrent() {
            var testValue = document.getElementById('<%= LkpFieldName.ClientID %>').value;
            var testCompareValue = testValue.toLowerCase();
            // validate empty
            if (testValue.replace(' ', '') == '') {
                alert('Please enter a valid Vocabulary Term.');
                return false;
            }
            // validate existing
            if (window.CURRENT_LKPFIELDS) {
                var codes = window.CURRENT_LKPFIELDS;
                for (var i = 0; i < codes.length; i++) {
                    var lkpFieldName = codes[i];
                    if (lkpFieldName.toLowerCase() == testCompareValue) {
                        alert('The Vocabulary Term "' + testValue + '" already exists.\nPlease enter a new value');
                        return false;
                    }
                }
            }
            return true;
        }

        /* ]]> */
    </script>

</head>
<body class="AdminBody">
    <form id="form1" runat="server" onsubmit="return validateAgainstCurrent();">
    <div>
        <label for="LkpFieldName">
            Lookup Code:</label>
        <asp:TextBox runat="server" ID="LkpFieldName"></asp:TextBox>
        <asp:Button runat="server" ID="SaveBtn" Text="Save" CssClass="dataEntryButtonGray"
            OnClick="AddLkpCode" />
        <asp:Button runat="server" ID="CancelBtn" Text="Cancel" CssClass="dataEntryButtonGray"
            OnClientClick="return cancelAddLkpCode();" />
    </div>
    </form>
</body>
</html>
