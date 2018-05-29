<%@ Control Language="C#" CodeFile="ClinicalStage.ascx.cs" AutoEventWireup="false"
    Inherits="Caisis.UI.Modules.All.DataEntryForms.ClinicalStage" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
function showClinStage(clinStageId)
{
    MM_showHideLayers('iFrameHelper','','show');
    MM_showHideLayers('stagingInfoDiv','','show'); 
    MM_showHideLayers('ClinStageTDiv','','hide'); 
    MM_showHideLayers('ClinStageNDiv','','hide'); 
    MM_showHideLayers('ClinStageMDiv','','hide'); 
    MM_showHideLayers('ClinStageSDiv','','hide');
    
    MM_showHideLayers(clinStageId,'','show');
}

function closeClinStage()
{
    MM_showHideLayers('iFrameHelper','','hide');
    MM_showHideLayers('stagingInfoDiv','','hide'); 
    MM_showHideLayers('ClinStageTDiv','','hide'); 
    MM_showHideLayers('ClinStageNDiv','','hide'); 
    MM_showHideLayers('ClinStageMDiv','','hide'); 
    MM_showHideLayers('ClinStageSDiv','','hide');
}
function selectStageValue(clinStageId,valToSet)
{
    var sel = document.getElementById(clinStageId);
    var valFound = false;
    for(var index=0;index<sel.options.length;index++)
    {
        var optVal = sel.options[index].value;
        if(optVal==valToSet)
        {
            sel.selectedIndex = index;
            return;
        }
    }
    // Only gets executed when value not found in list, i.e. function doesn't return explicitly
    alert('Value ' + optVal + ' not found in list.');
}

</script>

<div style="margin-left: auto; margin-right: auto; width: 400px">
    <asp:HiddenField runat="server" ID="StagingGroupRestrictions" Value="Testis,Lung" />
    <div class="DataEntryRow">
        <custom:CaisisTextBox Table="ClinicalStages" ID="ClinStageDateText" runat="server" Field="ClinStageDateText">
        </custom:CaisisTextBox></div>
    <div class="DataEntryRow">
        <custom:CaisisHidden Table="ClinicalStages" ID="ClinStageDate" Field="ClinStageDate" runat="server"></custom:CaisisHidden>
    </div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="ClinicalStages" ID="ClinStageDisease" runat="server" Field="ClinStageDisease">
        </custom:CaisisSelect></div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="ClinicalStages" ID="ClinStageSystem" runat="server" Field="ClinStageSystem"
            CascadeValuesBasedOn="ClinStageDisease" OnCascadeEvent="FilterByDisease">
        </custom:CaisisSelect></div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="ClinicalStages" ID="ClinStageGroup" runat="server" Field="ClinStageGroup" CascadeValuesBasedOn="ClinStageDisease,ClinStageSystem"
            CascadeFormatString="StageClin_{0}_{n.1}_Group">
        </custom:CaisisSelect></div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="ClinicalStages" ID="ClinStageSide" runat="server" Field="ClinStageSide"
            LookupCode="ClinStageSide">
        </custom:CaisisSelect></div>
    <!-- Staging Info Layer-->
    <div id="stagingInfoDiv" style="border-right: #000000 1px; border-top: #000000 1px; z-index: 30; visibility: hidden; overflow: auto; border-left: #000000 1px; width: 430px; border-bottom: #000000 1px; position: absolute; height: 250px; ">
        <table cellpadding="0" cellspacing="0" border="0" width="400">
            <tr>
                <td colspan="6">
                    <img src="../../images/StagingInfoPanelHeadTop.gif" height="4" width="400" border="0" /><br>
                </td>
            </tr>
            <tr class="popupHeader">
                <td class="loginBorder">
                    <img src="../../images/shim.gif" height="1" width="1" border="0" /></td>
                <td>
                    <img src="../../images/shim.gif" height="1" width="26" border="0" /></td>
                <td>
                    <img src="../../images/shim.gif" height="1" width="82" border="0" /></td>
                <td>
                    <img src="../../images/shim.gif" height="1" width="10" border="0" /></td>
                <td>
                    <img src="../../images/shim.gif" height="1" width="280" border="0" /></td>
                <td class="loginBorder">
                    <img src="../../images/shim.gif" height="1" width="1" border="0" /></td>
            </tr>
            <tr class="popupTable">
                <td class="loginBorder">
                    <img src="../../images/shim.gif" height="1" width="1" border="0" /></td>
                <td class="popupHeader">
                    &nbsp;</td>
                <td colspan="3" class="popupHeader">
                    <img src="../../images/SmallCloseButtonOnBlue.gif" vspace="2" hspace="7" height="11"
                        width="12" border="0" align="right" style="cursor: hand;" onclick="closeClinStage();" />Clinical
                    Staging Info</td>
                <td class="loginBorder">
                    <img src="../../images/shim.gif" height="1" width="1" border="0" /></td>
            </tr>
            <tr>
                <td colspan="6">
                    <img src="../../images/StagingInfoPanelHeadBottom.gif" height="4" width="400" border="0" /><br>
                </td>
            </tr>
            <tr class="popupTable">
                <td class="loginBorder" height="40"><img src="../../images/shim.gif" height="1" width="1" border="0" /></td>
                <td style="background-color: #ffffff;">&nbsp;</td>
                <td colspan="3" valign="top" height="200" style="background-color: #ffffff;">
                    <br>
                    <div id="ClinStageTDiv" class="patientDataFormDiv" style="border-right: #000000 1px; border-top: #000000 1px; z-index: 30; overflow: auto; border-left: #000000 1px; width: 366px; border-bottom: #000000 1px; position: absolute; height: 190px;">
                        <table cellpadding="0" cellspacing="0" border="0" width="346">
                            <tr>
                                <td>
                                    <img src="../../images/shim.gif" height="1" width="56" border="0" /></td>
                                <td>
                                    <img src="../../images/shim.gif" height="1" width="290" border="0" /></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <strong>Please select a T-Stage.</strong><br />
                                    <br />
                                </td>
                            </tr>
                            <asp:Repeater ID="ClinStageTRptr" runat="server" OnItemDataBound="BindLinksToStageInfo">
                                <ItemTemplate>
                                    <tr>
                                        <td valign="top" height="22">
                                            <a id="ClinStageTLink" runat="server" class="stagingInfoLink">
                                                <%# DataBinder.Eval(Container.DataItem, "LkpCode") %>
                                            </a>
                                        </td>
                                        <td valign="top">
                                            <%# DataBinder.Eval(Container.DataItem, "LkpDescription") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                    <div id="ClinStageNDiv" class="patientDataFormDiv" style="visibility: hidden; border-right: #000000 1px;
                        border-top: #000000 1px; z-index: 31; overflow: auto; border-left: #000000 1px;
                        width: 366px; border-bottom: #000000 1px; position: absolute; height: 190px;">
                        <table cellpadding="0" cellspacing="0" border="0" width="346">
                            <tr>
                                <td>
                                    <img src="../../images/shim.gif" height="1" width="56" border="0" /></td>
                                <td>
                                    <img src="../../images/shim.gif" height="1" width="290" border="0" /></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <strong>Please select an N-Stage.</strong><br />
                                    <br />
                                </td>
                            </tr>
                            <asp:Repeater ID="ClinStageNRptr" runat="server" OnItemDataBound="BindLinksToStageInfo">
                                <ItemTemplate>
                                    <tr>
                                        <td valign="top" height="22">
                                            <a style="color: #8d2a2c;" id="ClinStageNLink" runat="server" class="stagingInfoLink">
                                                <strong>
                                                    <%# DataBinder.Eval(Container.DataItem, "LkpCode") %>
                                                </strong></a>
                                        </td>
                                        <td valign="top">
                                            <%# DataBinder.Eval(Container.DataItem, "LkpDescription") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                    <div id="ClinStageMDiv" class="patientDataFormDiv" style="visibility: hidden; border-right: #000000 1px;
                        border-top: #000000 1px; z-index: 32; overflow: auto; border-left: #000000 1px;
                        width: 366px; border-bottom: #000000 1px; position: absolute; height: 190px;">
                        <table cellpadding="0" cellspacing="0" border="0" width="346">
                            <tr>
                                <td>
                                    <img src="../../images/shim.gif" height="1" width="56" border="0" /></td>
                                <td>
                                    <img src="../../images/shim.gif" height="1" width="290" border="0" /></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <strong>Please select an M-Stage.</strong><br />
                                    <br />
                                </td>
                            </tr>
                            <asp:Repeater ID="ClinStageMRptr" runat="server" OnItemDataBound="BindLinksToStageInfo">
                                <ItemTemplate>
                                    <tr>
                                        <td valign="top" height="22">
                                            <a style="color: #8d2a2c;" id="ClinStageMLink" runat="server" class="stagingInfoLink">
                                                <strong>
                                                    <%# DataBinder.Eval(Container.DataItem, "LkpCode") %>
                                                </strong></a>
                                        </td>
                                        <td valign="top">
                                            <%# DataBinder.Eval(Container.DataItem, "LkpDescription") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                    <div id="ClinStageSDiv" class="patientDataFormDiv" style="visibility: hidden; border-right: #000000 1px;
                        border-top: #000000 1px; z-index: 33; overflow: auto; border-left: #000000 1px;
                        width: 366px; border-bottom: #000000 1px; position: absolute; height: 190px;">
                        <table cellpadding="0" cellspacing="0" border="0" width="346">
                            <tr>
                                <td>
                                    <img src="../../images/shim.gif" height="1" width="56" border="0" /></td>
                                <td>
                                    <img src="../../images/shim.gif" height="1" width="290" border="0" /></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <strong>Please select an S-Stage.</strong><br />
                                    <br />
                                </td>
                            </tr>
                            <asp:Repeater ID="ClinStageSRptr" runat="server" OnItemDataBound="BindLinksToStageInfo">
                                <ItemTemplate>
                                    <tr>
                                        <td valign="top" height="22">
                                            <a style="color: #8d2a2c;" id="ClinStageSLink" runat="server" class="stagingInfoLink">
                                                <strong>
                                                    <%# DataBinder.Eval(Container.DataItem, "LkpCode") %>
                                                </strong></a>
                                        </td>
                                        <td valign="top">
                                            <%# DataBinder.Eval(Container.DataItem, "LkpDescription") %>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </td>
                <td class="loginBorder">
                    <img src="../../images/shim.gif" height="1" width="1" border="0" /></td>
            </tr>
            <tr class="popupTable">
                <td class="loginBorder">
                    <img src="../../images/shim.gif" height="1" width="1" border="0" /></td>
                <td style="background-color: #ffffff;">
                    &nbsp;</td>
                <td class="popupLabel" valign="top"style="background-color: #ffffff;">
                    &nbsp;</td>
                <td style="background-color: #ffffff;">
                    &nbsp;</td>
                <td style="background-color: #ffffff;">
                    &nbsp;</td>
                <td class="loginBorder">
                    <img src="../../images/shim.gif" height="1" width="1" border="0" /></td>
            </tr>
            <tr class="popupTable">
                <td colspan="6">
                    <img src="../../images/StagingInfoPanelFoot.gif" height="4" width="400" border="0" /><br>
                </td>
            </tr>
        </table>
    </div>
    <iframe id="iFrameHelper" style="z-index: 29; width: 395px; height: 240px; position: absolute;
        visibility: hidden;"></iframe>
    <!-- END - Staging Info Layer-->
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="ClinicalStages" ID="ClinStageT" runat="server" Field="ClinStageT" CascadeValuesBasedOn="ClinStageDisease,ClinStageSystem"
            CascadeFormatString="StageClin_{0}_{n.1}_T">
        </custom:CaisisSelect><a runat="server" id="ClinStageTShowLink"><img runat="server"
            src="~/Images/TStaging.gif" alt="T Staging Info"  class="StagingInfoButton" /></a>
    </div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="ClinicalStages" ID="ClinStageN" runat="server" Field="ClinStageN" CascadeValuesBasedOn="ClinStageDisease,ClinStageSystem"
            CascadeFormatString="StageClin_{0}_{n.1}_N">
        </custom:CaisisSelect><a runat="server" id="ClinStageNShowLink"><img runat="server"
            src="~/Images/NStaging.gif" alt="N Staging Info"  class="StagingInfoButton" /></a>
    </div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="ClinicalStages" ID="ClinStageM" runat="server" Field="ClinStageM" CascadeValuesBasedOn="ClinStageDisease,ClinStageSystem"
            CascadeFormatString="StageClin_{0}_{n.1}_M">
        </custom:CaisisSelect><a runat="server" id="ClinStageMShowLink"><img runat="server"
            src="~/Images/MStaging.gif" alt="M Staging Info"  class="StagingInfoButton"/></a></div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="ClinicalStages" ID="ClinStageS" runat="server" Field="ClinStageS" CascadeValuesBasedOn="ClinStageDisease,ClinStageSystem"
            CascadeFormatString="StageClin_{0}_{n.1}_S">
        </custom:CaisisSelect><a runat="server" id="ClinStageSShowLink"><img runat="server"
            src="~/Images/SStaging.gif" alt="S Staging Info"  class="StagingInfoButton" /></a></div>
    <div class="DataEntryRow">
        <custom:CaisisComboBox Table="ClinicalStages" ID="ClinStagePhysician" runat="server" Field="ClinStagePhysician">
        </custom:CaisisComboBox></div>
    <div class="DataEntryRow">
        <custom:CaisisTextArea Table="ClinicalStages" ID="ClinStageNotes" runat="server" Field="ClinStageNotes">
        </custom:CaisisTextArea></div>
    <div class="DataEntryRow">
        <custom:CaisisComboBox Table="ClinicalStages" ID="ClinStageDataSource" runat="server" Field="ClinStageDataSource">
        </custom:CaisisComboBox></div>
    <div class="DataEntryRow">
        <custom:CaisisSelect Table="ClinicalStages" ID="ClinStageQuality" runat="server" Field="ClinStageQuality">
        </custom:CaisisSelect></div>
</div>
