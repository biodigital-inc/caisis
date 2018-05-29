<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CollectionNew.aspx.cs" Inherits="Modules_SpecimenMgmt_CollectionNew" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    What would you like to name your collection?
         <div class="DataEntryRow" style="text-align: left;">
                                            <cc:CaisisTextBox FieldLabel="Name" runat="server" Table="SpecimenCollections" Field="CollectionName"
                                                ID="CollectionName" TabIndex="1" MaxLength="50" Width="275" ShowLabel="True"></cc:CaisisTextBox>
                                            &nbsp; <span style="color: #ff3366;">
                                                <asp:Label ID="errorMessage" runat="server"></asp:Label>
                                            </span>
                                        </div>
    </div>
    </form>
</body>
</html>
