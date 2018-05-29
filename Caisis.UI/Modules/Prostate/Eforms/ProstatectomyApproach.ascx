<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstatectomyApproach" CodeFile="ProstatectomyApproach.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- BEGIN Seminal Vessicles -->
<a name="ProstatectomyApproach" />
<table width="600" border="0" cellspacing="0" cellpadding="16" class="eformLargePopulatedTable">
          
          <tr>
            <td><span class="controlBoxFieldTitle">Approach</span>&nbsp;&nbsp;<euc:EformSelect DropDownHeight="auto" DropDownWidth="130" LookupCode="DissectionApproach" TABLE="Procedures" FIELD="ProcApproach" name="ProcApproach" size="1" id="ProcApproach" runat="server"/></td>
          </tr>
          
        </table>
  <br/><br/>

<!-- END Seminal Vessicles -->
