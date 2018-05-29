<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateDate" CodeFile="BiopsyOfProstateDate.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="BiopsyOfProstateDate" id="BiopsyOfProstateDate" />

<table border="0" cellspacing="0" cellpadding="1" width="650" class="eformLargePopulatedTable">
    <tr> 
        <td width="2" valign="top"></td>
        <td width="322">&nbsp;</td>
        <td width="2" valign="top" align="right"><img src="../../../Images/shim.gif" width="2" height="2" /></td>
        <td width="322">&nbsp;</td>
        <td width="2" valign="top" align="right"><img src="../../../Images/shim.gif" width="2" height="2" /></td>
    </tr>
    <tr>
        <td width="2"><img src="../../../Images/shim.gif" width="2" /></td>
        <td><table width="100%" border="0" cellspacing ="0" cellpadding ="0">
                <tr>
                    <td><span class ="controlBoxTitle">Date</span></td>
                    <td>
                        <euc:EformTextBox Runat="server" ID="EncDateText" Table="Encounters" Field="EncDateText" CalcDate="true" ShowCalendar ="true" style="width:150;" /> 
                        <euc:EformHidden Runat="server" ID="EncDate" Table="Encounters" Field="EncDate" />
                    </td>                    
                </tr>
            </table>
        </td>
        <td width="2"><img src="../../../Images/shim.gif" width="2" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><span class="ControlBoxTitle">Physician</span></td>
                    <td>
                        <euc:EformComboBox Runat="server" id="EncNurse" Table="Encounters" Field="EncPhysician"  LookupCode="Physician" DropDownWidth="170" style="width:150;" EnableHiddenOnUIEvent="EncInstitution,EncQuality,EncDataSource,EncType" />
                        
                        <euc:EformHidden id="EncInstitution" runat="server" Table="Encounters" Field="EncInstitution" Value="Memorial Sloan Kettering Cancer Center" Enabled="false"/>
                        <euc:EformHidden id="EncQuality" runat="server" Table="Encounters" Field="EncQuality" Value="STD" Enabled="false"/>
                        <euc:EformHidden id="EncDataSource" runat="server" Table="Encounters" Field="EncDataSource"  Value="EForm" Enabled="false"/>
                        <euc:EformHidden id="EncType" runat="server" Table="Encounters" Field="EncType"  Value="RN" Enabled="false"/>

                    </td>
                </tr>
            </table>       
        </td>
        <td width="2"><img src="../../../Images/shim.gif" width="2" /></td>
    </tr>
    <tr> 
        <td width="2" valign="top"></td>
        <td width="322">&nbsp;</td>
        <td width="2" valign="top" align="right"><img src="../../../Images/shim.gif" width="2" height="2" /></td>
        <td width="322">&nbsp;</td>
        <td width="2" valign="top" align="right"><img src="../../../Images/shim.gif" width="2" height="2" /></td>
    </tr>
</table>
<br /><br />