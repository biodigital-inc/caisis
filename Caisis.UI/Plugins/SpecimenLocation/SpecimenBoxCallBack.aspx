<%@ Page Language="C#" ContentType="text/xml" EnableViewState="false" AutoEventWireup="true"
    CodeFile="SpecimenBoxCallBack.aspx.cs" Inherits="Caisis.UI.Plugins.SpecimenLocation.SpecimenBoxCallBack" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Specimen Interface</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- The DropDownList containing either the bound Storages,Containers, and Boxes -->
            <cc:CaisisSelect runat="server" ID="DropDownResults" ShowLabel="false">
            </cc:CaisisSelect>
            <cc:CaisisSelect runat="server" ID="StoragesDropDown" ShowLabel="false">
            </cc:CaisisSelect>
            <cc:CaisisSelect runat="server" ID="ContainersDropDown" ShowLabel="false">
            </cc:CaisisSelect>
            <cc:CaisisSelect runat="server" ID="BoxesDropDown" ShowLabel="false">
            </cc:CaisisSelect>
            <asp:Label runat="server" ID="BoxMatrix"></asp:Label>
            <asp:Label runat="server" ID="SiteId"></asp:Label>
        </div>
    </form>
</body>
</html>
