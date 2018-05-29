<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateOverallAssessment" CodeFile="BiopsyOfProstateOverallAssessment.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="BiopsyOfProstateOverallAssessment" id="BiopsyOfProstateOverallAssessment" />
<table border="0" cellspacing="0" cellpadding="1" width="650" class="eformLargePopulatedTable">
    <tr>       
        <td width="2" valign="top" align="right"><img src="../../../Images/shim.gif" width="2" height="2" /></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td width="2" valign="top" align="right"><img src="../../../Images/shim.gif" width="2" height="2" /></td>
    </tr>
    <tr>
        <td width="2"><img src="../../../Images/shim.gif" width="2" /></td>
        <td width="30%"><span class="ControlBoxTitle">&nbsp;Overall Assessment</span></td>
        <td>
            <euc:EformRadioButtonList Table="Diagnostics" Field="DxResult" id="DxResult" RepeatLayout="Table" RepeatDirection="Horizontal" runat="server" EnableHiddenOnUIEvent="DxInstitution,DxQuality,DxDataSource,DxType,DxDisease,DxTarget,DxDateText" >
            <asp:ListItem >Normal</asp:ListItem>
            <asp:ListItem >Abnormal</asp:ListItem>
            </euc:EformRadioButtonList>
            <euc:EformHidden id="DxInstitution" runat="server" Table="Diagnostics" Field="DxInstitution" Value="Memorial Sloan Kettering Cancer Center" />
            <euc:EformHidden id="DxQuality" runat="server" Table="Diagnostics" Field="DxQuality" Value="STD" />
            <euc:EformHidden id="DxDataSource" runat="server" Table="Diagnostics" Field="DxDataSource"  Value="EForm" />
            <euc:EformHidden id="DxType" runat="server" Table="Diagnostics" Field="DxType"  Value="TRUS" />
            <euc:EformHidden id="DxDisease" runat="server" Table="Diagnostics" Field="DxDisease"  Value="Prostate Cancer" />
            <euc:EformHidden id="DxTarget" runat="server" Table="Diagnostics" Field="DxTarget"  Value="Prostate" />
            <euc:EformHidden Runat="server" ID="DxDateText" Table="Diagnostics" Field="DxDateText" />
            <euc:EformHidden Runat="server" ID="DxDate" Table="Diagnostics" Field="DxDate" />        	
         </td>  
         <td width="2"><img src="../../../Images/shim.gif" width="2" /></td>
    </tr>
    <tr>        
        <td width="2" valign="top" align="right"><img src="../../../Images/shim.gif" width="2" height="2" /></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td width="2" valign="top" align="right"><img src="../../../Images/shim.gif" width="2" height="2" /></td>
    </tr>
</table>
<br /><br />