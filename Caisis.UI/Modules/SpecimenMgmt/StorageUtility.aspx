<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StorageUtility.aspx.cs" Inherits="Modules_SpecimenMgmt_StorageUtility" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td colspan="3" align="center">Site <cc:CaisisSelect ID="Sites" Width="80" ShowLabel="false" runat=server LookupDistinct="SpecimenSites; SiteId; SiteName" AutoPostBack="true" OnTextChanged="OnSiteChange"></cc:CaisisSelect></td>
            </tr>
            <tr>
                <td>Storage</td>
                <td>Container</td>
                <td>Box</td>
            </tr>
             <tr>
                <td><cc:CaisisSelect ID="Storages" Width="80" ShowLabel="false" runat=server AutoPostBack="true" OnTextChanged="OnStorageChange"></cc:CaisisSelect></td>
                <td><cc:CaisisSelect ID="Containers" Width="80" ShowLabel="false" runat=server AutoPostBack="true" OnTextChanged="OnContainerChange"></cc:CaisisSelect></td>
                <td><cc:CaisisSelect ID="Boxes" Width="80" ShowLabel="false" runat=server AutoPostBack="true" OnTextChanged="OnBoxChange"></cc:CaisisSelect></td>
            </tr>
        </table>
        
        
        
        
    </div>
    </form>
</body>
</html>
