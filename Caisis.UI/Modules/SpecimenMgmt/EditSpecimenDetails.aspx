<%@ Page EnableViewState="true" Language="c#" CodeFile="EditSpecimenDetails.aspx.cs" AutoEventWireup="true"
    Inherits="Caisis.UI.Modules.SpecimenMgmt.EditSpecimenDetails" %>
<%@ Register TagPrefix="cc" TagName="LocationControl" Src="~/Plugins/SpecimenLocation/SpecimenLocationControl.ascx" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/Dtd/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Edit Specimen Info</title>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
    
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/EFormStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script type="text/javascript">	
        
        NotesEditor.editorWidth = 450;
        NotesEditor.editorHeight = 150;
        
        //reloads specimens hierarchy frame of parent page on updating selected specimen details 
        function refreshParentwindow()
        { 
            var browser=navigator.appName;
            if(browser=="Microsoft Internet Explorer")
            {
                parent.frames['SpecimensRptFrame'].window.location.reload();
            }
            else if(browser=="Netscape")
            {
                parent.document.getElementById('SpecimensRptFrame').contentDocument.location.reload(true);
            }
        }
        
        //reloads parent page on addition of new child-specimen
        function refreshParent(specId,parentspecId)
        { 
            var url='SpecimenDetails.aspx?specimenId=' + specId + '&parentspecimenId='+ parentspecId;
            window.parent.location.href =url;
        }
        
        //hide events frame of parent page while adding new child-specimens
        function HideProcessingEvents()
        {
            var eventsframe = window.parent.document.getElementById('processingevntsframe');
            eventsframe.style.display='none';
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
        
        function validateSaveQty()
        {
            var org=document.getElementById('SpecimenOriginalQty').value;
            var pRem=document.getElementById('RemQty').value;    
            var pId=document.getElementById('specId').value;
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
        
        function toggle_visible (arg1) 
	    {
	        var el = document.getElementById (arg1);
	        var isVisible = (el.style.visibility == "hidden") ? true : false;

	        el.style.visibility = isVisible ? "visible" : "hidden";
	        el.style.display = isVisible ? "inline" : "none";
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
            text-align:left; padding-top:2px; vertical-align:top;
        }
        .LeftAlignText
        {
            text-align:left;
        }
    </style>
</head>
<body id="EditSpecimenBody" runat="server" style="margin: 0px; width: 100%; background-color: #ffffff; text-align:left; " >
    <form id="dataForm" method="post" runat="server" defaultfocus="SpecimenReferenceNumber">
        <asp:HiddenField ID="pspecId" runat="server" />
        <asp:HiddenField ID="pRemQty" runat="server" />
        <asp:HiddenField ID="specId" runat="server" />
        <asp:HiddenField ID="RemQty" runat="server" />
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr><td style="padding-left: 10px; padding-top: 3px;">
            <asp:Label ID="hdrlbl" runat="server" Text="Edit Specimen / Create Sub-Specimen" Font-Size="12px" ForeColor="#8d282c" Font-Bold="true"></asp:Label>
            <asp:Label ID="subspeclbl" runat="server" Font-Size="12px" ForeColor="#8d282c" Font-Bold="true" Visible="false"></asp:Label>
            </td></tr>
            <!-- Specimen Info Input Controls -->
            <tr runat="server" id="inputControlsRow" valign="top">
                <td  class="left">
                    <table>
                        <tr>
                            <td class="leftL" style="padding-bottom: 1px; width: 60px;">
                                Ref #</td>
                            <td class="leftR" style="padding-bottom: 1px;">
                                <cc:CaisisTextBox FieldLabel="Reference Number " runat="server" ID="SpecimenReferenceNumber"
                                    Table="Specimens" Field="SpecimenReferenceNumber" TabIndex="1" MaxLength="50"
                                    Width="115px" ShowLabel="false" /></td>
                            <td class="leftL" style="padding-bottom: 1px;">
                                Type
                            </td>
                            <td class="leftR" style="padding-bottom: 1px;">
                                <cc:CaisisSelect FieldLabel="Specimen Type " runat="server" ID="SpecimenType" LookupCode="Specimen_Type"
                                    Table="Specimens" Field="SpecimenType" TabIndex="2" Width="95px" ShowLabel="False">
                                </cc:CaisisSelect></td>
                            <td class="leftL" style="padding-bottom: 1px;">
                                SubType</td>
                            <td class="leftR" style="padding-bottom: 1px;">
                                <cc:CaisisComboBox ID="SpecimenSubType" runat="server" LookupCode="Specimen_SubType"
                                    CascadeValuesBasedOn="SpecimenType" CascadeFormatString="Specimen_SubType_{0}"
                                    Width="75px" ShowLabel="False" DropDownWidth="80px" DropDownHeight="auto" Table="Specimens" 
                                    Field="SpecimenSubType" Enabled="true"></cc:CaisisComboBox></td>
                        </tr> 
                        <tr>
                            <td class="leftL" style="padding-bottom: 1px; width: 60px;">
                                Status</td>
                            <td class="leftR" style="padding-bottom: 1px;">
                                <cc:CaisisComboBox FieldLabel="Sample Status " runat="server" ID="SpecimenStatus" LookupCode="Specimen_Status"
                                    Table="Specimens" Field="SpecimenStatus" TabIndex="4" Width="100px" ShowLabel="False" DropDownHeight="auto" 
                                    DropDownWidth="auto">
                                </cc:CaisisComboBox></td>
                            <td class="leftL" style="padding-bottom: 1px;">
                                Contact</td>
                            <td class="leftR" style="padding-bottom: 1px;">
                                <cc:CaisisSelect FieldLabel="Contact" runat="server" ID="Contact" Table="Specimens" Field="ContactId" 
                                     TabIndex="5" Width="95px" ShowLabel="False" DataTextField="Name" DataValueField="ContactId"></cc:CaisisSelect>
                            </td>
                            <td class="leftL" style="padding-bottom: 1px">
                                StorageType</td>
                            <td class="leftR" style="padding-bottom: 1px">
                                <cc:CaisisComboBox FieldLabel="Preservation Type " runat="server" ID="SpecimenPreservationType"
                                    Table="Specimens" Field="SpecimenPreservationType" LookupCode="Specimen_PreservationType" 
                                    CascadeValuesBasedOn="SpecimenType" CascadeFormatString="Specimen_PreservationType_{0}"
                                    TabIndex="6" Width="75px" ShowLabel="False" DropDownHeight="auto" DropDownWidth="auto"></cc:CaisisComboBox></td>
                        </tr>
                        <%-- Quantity and Units --%>
                        <tr>
                            <td class="leftL" valign="bottom" style="width: 60px">
                                Quantity&nbsp;</td>
                            <td class="leftR" valign="bottom" colspan="5">
                                &nbsp;Original &nbsp;&nbsp; &nbsp; Remaining &nbsp;&nbsp; &nbsp; Units<br />
                                    <cc:CaisisTextBox FieldLabel="OrginalQuantity" runat="server" ID="SpecimenOriginalQty"
                                        Table="Specimens" Field="SpecimenOriginalQty" TabIndex="6" MaxLength="45" Width="45"
                                        ShowLabel="False"></cc:CaisisTextBox>&nbsp;
                                    <cc:CaisisTextBox FieldLabel="CurrentQuantity" runat="server" ID="SpecimenRemainingQty" Table="Specimens" 
                                        Field="SpecimenRemainingQty" TabIndex="7" MaxLength="45" Width="45" ShowLabel="False">
                                    </cc:CaisisTextBox>&nbsp;
                                    <cc:CaisisComboBox FieldLabel="Units " runat="server" ID="SpecimenUnits" TabIndex="8"
                                        Table="Specimens" Field="SpecimenUnits" LookupCode="Specimen_Units"  Width="45" ShowLabel="False">
                                    </cc:CaisisComboBox>&nbsp;</td>
                        </tr>
                        <%-- Storage Info --%>
                        <tr>
                            <td class="leftL" style="padding-top: 2px; width: 60px;" valign="bottom">
                                Location<cc:LocationControl ID="LocationControl" Visible="True" runat="server"></cc:LocationControl></td>
                            <td class="leftR" style="padding-top: 2px" colspan="5"><img alt="" src="../../Images/shim.gif" width="50" style="height: 5px">Site<img alt="" src="../../Images/shim.gif" width="49" style="height: 5px">Storage/Shelf<img alt="" src="../../Images/shim.gif" width="10" style="height: 5px">Container/Rack<img alt="" src="../../Images/shim.gif" width="35" style="height: 5px">Box<img alt="" src="../../Images/shim.gif" width="27" style="height: 5px">Pstn<br />
                            
                                <span>
                                    <cc:CaisisTextBox Enabled="true" FieldLabel="Site" runat="server" ID="SiteName" MaxLength="50" 
                                        Width="110" ShowLabel="False"></cc:CaisisTextBox>
                                    <cc:CaisisTextBox FieldLabel="Storage/Rack" Enabled="true" runat="server" ID="StorageName" 
                                        MaxLength="50" Width="70" ShowLabel="False"></cc:CaisisTextBox>
                                    <cc:CaisisTextBox FieldLabel="Container/Bin" Enabled="true" runat="server" ID="ContainerName" 
                                        MaxLength="50" Width="70" ShowLabel="False"></cc:CaisisTextBox>
                                    <cc:CaisisTextBox Enabled="true" FieldLabel="Box Name" runat="server" ID="BoxName" MaxLength="50" 
                                        Width="70" ShowLabel="False"></cc:CaisisTextBox>
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
                            <td class="leftL" style="vertical-align: top; width: 60px;">
                                Notes
                            </td>
                            <td class="leftR" colspan="5">
                                <cc:CaisisTextArea FieldLabel="Notes " runat="server" ID="SpecimenNotes" TabIndex="8"
                                    Table="Specimens" Field="SpecimenNotes" Font-Size="Small" Height="40" Width="365"
                                    ShowLabel="False"></cc:CaisisTextArea>
                            </td>
                        </tr>
                        <!-- Buttons: Cancel, Save -->
                        <tr>
                            <td align="center" style="vertical-align: top; padding-top: 2px;"
                                colspan="6">
                                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                <asp:ImageButton runat="server" ID="CancelBtn" OnClientClick="document.forms[0].reset(); return false;"
                                    ImageUrl="~/Images/ButtonCancel.gif" AlternateText="Cancel Changes" ToolTip="Cancel Changes"
                                    TabIndex="11" Style="vertical-align: bottom; cursor: pointer; margin-right: 25px;" />
                                <%--<asp:ImageButton ID="SaveBtn" OnClick="SaveBtn_Click" runat="server" ImageUrl="..\..\Images\ButtonSave.gif"
                                    Style="margin-right: 25px; cursor: pointer;" ToolTip="Save Sub-Specimen" TabIndex="10" Visible="false"  
                                    OnClientClick="return validateSaveQty();" />
                                <asp:ImageButton ID="UpdateBtn" runat="server" ImageUrl="..\..\Images\buttonUpdate.gif" ToolTip="Update Changes" 
                                    Style="margin-right: 25px; cursor: pointer;" TabIndex="10" OnClientClick="return validateupdateQty();" 
                                    OnClick="UpdateBtn_Click"/>--%>
                                    
                                <asp:ImageButton ID="SaveBtn" OnClick="SaveBtn_Click" runat="server" ImageUrl="..\..\Images\ButtonSave.gif"
                                    Style="margin-right: 25px; cursor: pointer;" ToolTip="Save Sub-Specimen" TabIndex="12" Visible="false" />
                                    
                                <asp:ImageButton ID="UpdateBtn" runat="server" ImageUrl="..\..\Images\buttonUpdate.gif" ToolTip="Update Changes" 
                                    Style="margin-right: 25px; cursor: pointer;" TabIndex="12" OnClick="UpdateBtn_Click"/>    
                                    
                                <asp:ImageButton ID="addSubSpecimenbtn" runat="server" ToolTip="Click to add new Sub-Specimen" TabIndex="13" 
                                    ImageUrl="Images\button_AddNewSubSpecimen.gif" OnClick="addSubSpecimenbtn_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>