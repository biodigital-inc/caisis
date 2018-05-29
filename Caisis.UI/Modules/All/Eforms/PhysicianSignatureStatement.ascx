<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PhysicianSignatureStatement" CodeFile="PhysicianSignatureStatement.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style  type="text/css">

#PhysicianSignatureStatementTable
{
    background-position: left center;
    width: 650px;
    margin-bottom: 50px;
}
#PhysicianSignatureStatementTable td
{
    padding: 8px 3px 8px 3px;
    vertical-align: top;
}
</style>
<a name="PhysicianSignatureStatement" />
<table id="PhysicianSignatureStatementTable" class="eformLargePopulatedTable" cellspacing="0" >
<tr>
<td>
<euc:EformCheckBox ID="SignatureStatement_Attending" Table="NoTable" Field="SignatureStatement_Attending" runat="server" Value="I personally performed or was physically present during the key portions of the visit today. I agree with the history, physical exam, and assessment/plan as documented by the fellow above."/>
</td>
<td>I personally performed or was physically present during the <strong>key portions</strong> of the visit today. I agree with the history, physical exam, and assessment/plan as documented by the <strong>fellow</strong> above.
</td>
</tr>
</table>
<br/><br/>
  
