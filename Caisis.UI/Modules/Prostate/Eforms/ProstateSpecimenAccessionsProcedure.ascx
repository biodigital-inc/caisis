<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenAccessionsProcedure" CodeFile="ProstateSpecimenAccessionsProcedure.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ProstateSpecimenAccessionsProcedure" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>


    <table cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue" id="ProstateSpecimenAccessionsProcedureHtmlTable">
        
        <tr>
            <td style="white-space: nowrap;" ><span class="controlBoxTitle">Method of Initial Pathologic Diagnosis: </span>
                <euc:EformExtendedCheckBoxList Runat="server" RecordId="1" ID="PathSpecimenCollection_1" TABLE="Pathology" FIELD="PathSpecimenCollection" RepeatDirection="Vertical" RepeatLayout="Table" ShowOther="true" >
                    <asp:ListItem Value="Biopsy" Text="Biopsy"></asp:ListItem>
                    <asp:ListItem Value="Prostatectomy" Text="Prostatectomy"></asp:ListItem>
                    <asp:ListItem Value="Not Reported" Text="Not Reported"></asp:ListItem>
                    <asp:ListItem Value="Unknown" Text="Unknown"></asp:ListItem>
                </euc:EformExtendedCheckBoxList>	
                
            </td>
       </tr>        
    </table>
<br/><br/><br/>



