<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ProceduresPrimary" CodeFile="ProceduresPrimary.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.ProceduresPrimaryHtmlTable = "ProceduresPrimaryHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="ProceduresPrimary" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Primary Procedure"></asp:Label><br/>
<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ProceduresPrimaryHtmlTable" > 


          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Procedure</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Surgeon</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Surgeon Type</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          <tr>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" EnableHiddenOnUIEvent="ProcPrimary" />
				<euc:EformHidden                RecordId="11"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate"     Runat="server"/></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="11"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName"     LookupCode="ProcName" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="ProcPrimary"  /> 
                <euc:EformHidden Width="100px" RecordId="11"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary" Runat="server" Value="1" /> </td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="11"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon"   LookupCode="Physician"   Runat="server" TabIndex="3" EnableHiddenOnUIEvent="ProcPrimary" /> </td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="11"  TABLE="Procedures" FIELD="ProcSurgeonType" ID="ProcSurgeonType" LookupCode="PhysicianLevel"   Runat="server" TabIndex="4" EnableHiddenOnUIEvent="ProcPrimary" /> </td>
          </tr>
 
           <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Assistant</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left">&nbsp;Assistant Type</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Side </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Notes</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          <tr>
            <td>
                <euc:EformComboBox Width="100px" RecordId="11"  TABLE="Procedures" FIELD="ProcAssistant" ID="ProcAssistant" LookupCode="Physician"   Runat="server" TabIndex="5" EnableHiddenOnUIEvent="ProcPrimary" /> </td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="11"  TABLE="Procedures" FIELD="ProcAssistantType" ID="ProcAssistantType" LookupCode="PhysicianLevel"   Runat="server" TabIndex="6" EnableHiddenOnUIEvent="ProcPrimary" /> </td>

            <td>
                <euc:EformComboBox Width="100px" RecordId="11"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide" LookupCode="OpSide" Runat="server" TabIndex="7" EnableHiddenOnUIEvent="ProcPrimary" /> </td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="11"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" EnableHiddenOnUIEvent="ProcPrimary"  /></td>

          </tr>
</table>
<br /><br /><br />


