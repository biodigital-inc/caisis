<%@ Page EnableViewState="true" Language="c#" CodeFile="EditSpecimens.aspx.cs" AutoEventWireup="true"
    Inherits="Caisis.UI.Modules.SpecimenMgmt.EditSpecimens" %>
<%@ Register TagPrefix="cc" TagName="LocationControl" Src="~/Plugins/SpecimenLocation/SpecimenLocationControl.ascx" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Specimen Info</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>  
    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script type="text/javascript">	
    
        NotesEditor.editorWidth = 425;
        NotesEditor.editorHeight = 150;
        
        function toggle_visible (arg1) 
	    {
	        var el = document.getElementById (arg1);
	        var isVisible = (el.style.visibility == "hidden") ? true : false;

	        el.style.visibility = isVisible ? "visible" : "hidden";
	        el.style.display = isVisible ? "inline" : "none";
	    }
	    
	    function validateupdateQty()
        {
            var org=document.getElementById('SpecimenOriginalQty').value;
            var pRem=document.getElementById('pRemQty').value;    
            var pId=document.getElementById('pspecId').value;
            var res = (org<=pRem);
            if(pId!='')
            {
                if(res)
                {
                    return true;
                }
                else
                { 
                    alert('Original qty cannot be greater than Parent remaining qty = '+pRem+' !');
                    return false;                
                }
            }
            else
            {
                return true;    
            }        
        }
	           
	    function disIsDirty(){}

        // When page is loaded, signal underlying query page to update box name and position name
        // This function is attached by query page
        function setQueryPageBoxAndPosition()
        {
            if(top.setBoxPositionHelper)
            {
                var boxIdValue = document.getElementById('<%= BoxId.ClientID %>').value;
                var referenceNumValue = document.getElementById('<%= SpecimenReferenceNumber.ClientID %>').value;
                var typeValue = document.getElementById('<%= SpecimenType.ClientID %>').value;
                var subTypeValue = document.getElementById('<%= SpecimenSubType.ClientID %>').value;
                var statusValue = document.getElementById('<%= SpecimenStatus.ClientID %>').value;
                var contactValue=document.getElementById('<%=Contact.ClientID %>').value;
                var orgqtyValue = document.getElementById('<%= SpecimenOriginalQty.ClientID %>').value;
                var curqtyValue=document.getElementById('<%=SpecimenRemainingQty.ClientID %>').value;
                var unitsValue = document.getElementById('<%= SpecimenUnits.ClientID %>').value;
                var boxNameTextValue = document.getElementById('<%= BoxName.ClientID %>').value;
                var positionNameTextValue = document.getElementById('<%= PositionName.ClientID %>').value;
                
                // Call helper function with parameters
                top.setBoxPositionHelper(boxIdValue,referenceNumValue,typeValue,subTypeValue,statusValue,contactValue,orgqtyValue,curqtyValue,unitsValue,boxNameTextValue,positionNameTextValue);
            }
        }
        Event.Register('load',window,setQueryPageBoxAndPosition,false);
    </script>

    <!-- Controls the Styles defining box colors in popup layer -->
    <style type="text/css">
    .CurrentPosition {  background-color: #8d2a2c;  color: #ffffff; font-weight: bold; }
    .FilledPosition { background-color: #999999; cursor: default;  border: solid 2px #999999; border-collapse: separate;  color: #000000;}
    .UnavailablePosition { background-color: #666666; cursor: text;  }
    .AvailablePosition { background-color: #e4e4e4; border: solid 2px #e4e4e4; border-collapse: separate; }
    .AvailablePositionHover { background-color: #e4e4e4; border: solid 2px #8d2a2c; border-collapse: separate; color: #8d2a2c;}
    .ActivePosition { background-color: #0066cc; }
    .BoxMatrix { border: 1px solid #666666; }
    .BoxMatrix td
    {
        text-align: center;
        vertical-align: middle;
        height: 20px;
        cursor: pointer;
    }

    input.PseudoSpan
    {
        border-style: none; 
        background-color: #f8fafc;
    }
        td.leftL
        {
            text-align:right; font-size:11px;
        }
        td.leftR
        {
            text-align:left; font-size:11px;
        }
        td.left
        {
            text-align:left; padding-top:10px; vertical-align:top;
        }
        .LeftAlignText
        {
            text-align:left;
        }
    </style>
</head>
<body style="margin: 0px; width: 100%; background-color: #f8fafc; text-align:center; padding-top:0px; " >
    <form id="dataForm" method="post" runat="server" defaultfocus="SpecimenReferenceNumber">
        <asp:HiddenField ID="isGridVisible" runat="server" />
        <asp:HiddenField ID="pspecId" runat="server" />
        <asp:HiddenField ID="pRemQty" runat="server" />
        <table width="95%" border="0" cellpadding="0" cellspacing="0">
            <!-- Specimen Info Input Controls -->
            <tr runat="server" id="inputControlsRow">
                <td  class="left">
                    <table border="0">
                        <tr>
                            <td align="left" colspan="5" style="font-size:12px; font-weight: bold;color: #8d282c; padding-bottom:10px;">
                                <asp:Label ID="PtId" runat="server"></asp:Label><asp:Label ID="TumorBankNumber" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" style="padding-bottom: 5px;">
                                Reference #&nbsp;</td>
                            <td class="leftR" style="padding-bottom: 5px;">
                                <cc:CaisisTextBox FieldLabel="Reference Number " runat="server" ID="SpecimenReferenceNumber"
                                    Table="Specimens" Field="SpecimenReferenceNumber" TabIndex="1" MaxLength="50"
                                    Width="100" ShowLabel="false" /></td>
                            <td class="leftL" style="padding-bottom: 5px;">
                                SampleStatus
                            </td>
                            <td class="leftR" style="padding-bottom: 5px;" colspan="2">
                                <cc:CaisisComboBox FieldLabel="Sample Status " runat="server" ID="SpecimenStatus" LookupCode="Specimen_Status"
                                    Table="Specimens" Field="SpecimenStatus" TabIndex="2" Width="125" ShowLabel="False">
                                </cc:CaisisComboBox></td>
                        </tr> 
                        <tr>
                            <td class="leftL" style="padding-bottom: 5px;">
                                SpecimenType
                            </td>
                            <td class="leftR" style="padding-bottom: 5px;">
                                <cc:CaisisSelect FieldLabel="Specimen Type " runat="server" ID="SpecimenType" LookupCode="Specimen_Type"
                                    Table="Specimens" Field="SpecimenType" TabIndex="3" Width="105" ShowLabel="False">
                                </cc:CaisisSelect></td>
                            <td class="leftL" style="padding-bottom: 5px;">
                                Contact</td>
                            <td class="leftR" style="padding-bottom: 5px;">
                                <cc:CaisisSelect FieldLabel="Contact" runat="server" ID="Contact" Table="Specimens" Field="ContactId" 
                                     TabIndex="4" Width="145px" ShowLabel="False" DataTextField="Name" DataValueField="ContactId"></cc:CaisisSelect>
                            </td>
                        </tr>
                        <tr>
                            <td class="leftL" style="padding-bottom: 5px;" valign="bottom">
                                SubType
                            </td>
                            <td class="leftR" style="padding-bottom: 5px;" valign="bottom">
                                <cc:CaisisComboBox ID="SpecimenSubType" runat="server" LookupCode="Specimen_SubType"
                                    CascadeValuesBasedOn="SpecimenType" CascadeFormatString="Specimen_SubType_{0}"
                                    Width="88" ShowLabel="False" DropDownWidth="98px" DropDownHeight="auto" Table="Specimens" Field="SpecimenSubType" Enabled="true" TabIndex="5">
                                </cc:CaisisComboBox></td>
                            <td class="leftL" style="padding-bottom: 5px;">
                                StorageType
                            </td>
                            <td class="leftR" style="padding-bottom: 5px;" colspan="2">
                                <cc:CaisisComboBox FieldLabel="Preservation Type " runat="server" ID="SpecimenPreservationType"
                                    Table="Specimens" Field="SpecimenPreservationType" LookupCode="Specimen_PreservationType" 
                                    CascadeValuesBasedOn="SpecimenType" CascadeFormatString="Specimen_PreservationType_{0}"
                                    TabIndex="6" Width="125" ShowLabel="False" DropDownHeight="auto" DropDownWidth="155px">
                                </cc:CaisisComboBox>
                           </td>
                           </tr>
                           <tr>
                            <%-- Quantity and Units --%>
                            <td class="leftL" style="padding-bottom: 5px;" valign="bottom">
                                Quantity</td>
                            <td class="leftR" style="padding-bottom: 5px;">
                                &nbsp;Original &nbsp;&nbsp; Remaining<br />
                                    <cc:CaisisTextBox FieldLabel="OrginalQuantity" runat="server" ID="SpecimenOriginalQty"
                                        Table="Specimens" Field="SpecimenOriginalQty" TabIndex="7" MaxLength="45" Width="45"
                                        ShowLabel="False" Height="15"></cc:CaisisTextBox>&nbsp;&nbsp;<cc:CaisisTextBox FieldLabel="CurrentQuantity" runat="server" ID="SpecimenRemainingQty"
                                        Table="Specimens" Field="SpecimenRemainingQty" TabIndex="8" MaxLength="45" Width="45"
                                        ShowLabel="False" Height="15"></cc:CaisisTextBox></td>
                                        <td class="leftR" style="padding-top: 3px;padding-bottom: 10px;" >
                                    &nbsp;&nbsp;&nbsp;
                                    Units<br />
                                    <cc:CaisisComboBox FieldLabel="Units " runat="server" ID="SpecimenUnits" TabIndex="9"
                                        Table="Specimens" Field="SpecimenUnits" LookupCode="Specimen_Units"  Width="45" ShowLabel="False" 
                                        DropDownWidth="auto" DropDownHeight="auto">
                                    </cc:CaisisComboBox></td>
                        </tr>
                        <%-- Storage Info --%>
                        <tr>
                            <td class="leftL" style="padding-bottom: 5px;" valign="bottom">
                                Location<cc:LocationControl ID="LocationControl" Visible="True" runat="server"></cc:LocationControl></td>
                            <td class="leftR" style="padding-bottom: 5px;" colspan="4"><img alt="" src="../../Images/shim.gif" width="30" style="height: 5px"/>Site<img alt="" src="../../Images/shim.gif" width="40" style="height: 5px"/>Storage/Shelf<img alt="" src="../../Images/shim.gif" width="5" style="height: 5px"/>Container/Rack<img alt="" src="../../Images/shim.gif" width="30" style="height: 5px"/>Box<img alt="" src="../../Images/shim.gif" width="23" style="height: 5px"/>Pstn<br />
                                <span>
                                    <cc:CaisisTextBox Enabled="true" FieldLabel="Site" runat="server" ID="SiteName" MaxLength="50" 
                                        Width="75" ShowLabel="False"></cc:CaisisTextBox>
                                    <cc:CaisisTextBox FieldLabel="Storage/Rack" Enabled="true" runat="server" ID="StorageName" 
                                        MaxLength="50" Width="65" ShowLabel="False"></cc:CaisisTextBox>
                                    <cc:CaisisTextBox FieldLabel="Container/Bin" Enabled="true" runat="server" ID="ContainerName" 
                                        MaxLength="50" Width="65" ShowLabel="False"></cc:CaisisTextBox>
                                    <cc:CaisisTextBox Enabled="true" FieldLabel="Box Name" runat="server" ID="BoxName" MaxLength="50" 
                                        Width="65" ShowLabel="False"></cc:CaisisTextBox>
                                    <%--<cc:CaisisTextBox FieldLabel="Position Name" Enabled="true" runat="server" ID="PositionName" MaxLength="50" 
                                        Width="25" ShowLabel="False"></cc:CaisisTextBox>--%>
                                    <input type="text" id="PositionName" runat="server" readonly="readonly" maxlength="50" style=" width:25px;" />    
                                </span>
                                <span>
                                    <cc:CaisisHidden CssClass="PseudoSpan" FieldLabel="Box Id " Enabled="true" runat="server"
                                        ID="BoxId" MaxLength="50" Width="50" Table="Specimens" Field="BoxId" ShowLabel="False"></cc:CaisisHidden>
                                    <cc:CaisisHidden CssClass="PseudoSpan" FieldLabel="Position " Enabled="true" runat="server"
                                        ID="PositionId" MaxLength="50" Table="Specimens" Field="PositionId" Width="50"
                                        ShowLabel="False"></cc:CaisisHidden></span></td>
                        </tr>
                        <tr>
                            <td class="leftL" style="padding-bottom: 5px;">
                                Notes
                            </td>
                            <td class="leftR" colspan="4" style="padding-bottom: 5px">
                                <cc:CaisisTextArea FieldLabel="Notes " runat="server" ID="SpecimenNotes" TabIndex="11" Table="Specimens" 
                                    Field="SpecimenNotes" Font-Size="Small" Height="50" Width="315" ShowLabel="False"></cc:CaisisTextArea>
                            </td>
                        </tr>
                        <!-- Buttons: Cancel, Save -->
                        <tr>
                            <td align="center" style="vertical-align: top; padding-top: 5px; padding-bottom: 5px;"
                                colspan="5">
                                <asp:ImageButton runat="server" ID="CancelBtn" OnClientClick="document.forms[0].reset(); return false;"
                                    ImageUrl="~/Images/ButtonCancel.gif" AlternateText="Cancel Changes" ToolTip="Cancel Changes"
                                    TabIndex="12" Style="vertical-align: bottom; cursor: pointer; margin-right: 25px;" />
                                
                                <asp:ImageButton ID="SaveBtn" OnCommand="Update_Click" runat="server" ImageUrl="..\..\Images\buttonUpdate.gif"
                                    Style="margin-right: 25px; cursor: pointer;" ToolTip="Save Changes" TabIndex="13" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>