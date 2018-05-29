<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ProceduresAncillary" CodeFile="ProceduresAncillary.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.ProceduresAcnillaryHtmlTable = "ProceduresAcnillaryHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="ProceduresAncillary" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Ancillary Procedures"></asp:Label><br/>
<table  width="925" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ProceduresAcnillaryHtmlTable" > 


          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Procedure</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Surgeon</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Surgeon Type</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Assistant</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left">&nbsp;Assistant Type</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Side </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Notes</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          
          
          <asp:Repeater ID="AncillaryProcs" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                <ItemTemplate> 
                    <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('<%# DataBinder.Eval(Container.DataItem, "TableName") %>', <%# DataBinder.Eval(Container.DataItem, "PrimaryKey") %>, 'ProcDateText,ProcName,ProcSurgeon,ProcSurgeonType,ProcAssistant,ProcAssistantType,ProcSide,ProcNotes', 'ProceduresAcnillaryHtmlTable');"> 
                        <td align="center" class="ClinicalEformPopulatedColumn" >&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcDateText")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcName")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcSurgeon")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcSurgeonType")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcAssistant")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcAssistantType")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcSide")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcNotes")%></td>
                        <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;</td>
                        <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
                    </tr>      
                </ItemTemplate>
            </asp:Repeater>
            
          <tr>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_12" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="12"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_12"     Runat="server"/></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_12"     LookupCode="ProcName" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_12"   LookupCode="Physician"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcSurgeonType" ID="ProcSurgeonType_12" LookupCode="PhysicianLevel"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcAssistant" ID="ProcAssistant_12" LookupCode="Physician"   Runat="server" TabIndex="5"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcAssistantType" ID="ProcAssistantType_12" LookupCode="PhysicianLevel"   Runat="server" TabIndex="6"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_12" LookupCode="OpSide" Runat="server" TabIndex="7"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_12"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td>
                <euc:EformTextBox  Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_13" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="13"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_13"     Runat="server"/></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_13"     LookupCode="ProcName" Runat="server" TabIndex="2"   /></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_13"   LookupCode="Physician"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcSurgeonType" ID="ProcSurgeonType_13" LookupCode="PhysicianLevel"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcAssistant" ID="ProcAssistant_13" LookupCode="Physician"   Runat="server" TabIndex="5"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcAssistantType" ID="ProcAssistantType_13" LookupCode="PhysicianLevel"   Runat="server" TabIndex="6"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_13" LookupCode="OpSide" Runat="server" TabIndex="7"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_13"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td>
                <euc:EformTextBox  Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_14" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="14"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_14"     Runat="server"/></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_14"     LookupCode="ProcName" Runat="server" TabIndex="2"   /></td> 
            <td>
                <euc:EformComboBox Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_14"   LookupCode="Physician"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcSurgeonType" ID="ProcSurgeonType_14" LookupCode="PhysicianLevel"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcAssistant" ID="ProcAssistant_14" LookupCode="Physician"   Runat="server" TabIndex="5"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcAssistantType" ID="ProcAssistantType_14" LookupCode="PhysicianLevel"   Runat="server" TabIndex="6"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_14" LookupCode="OpSide" Runat="server" TabIndex="7"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_14"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td>
                <euc:EformTextBox  Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_15" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="15"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_15"     Runat="server"/></td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_15"     LookupCode="ProcName" Runat="server" TabIndex="2"   /></td> 
            <td>
                <euc:EformComboBox Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_15"   LookupCode="Physician"   Runat="server" TabIndex="3"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcSurgeonType" ID="ProcSurgeonType_15" LookupCode="PhysicianLevel"   Runat="server" TabIndex="4"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcAssistant" ID="ProcAssistant_15" LookupCode="Physician"   Runat="server" TabIndex="5"  /> </td>
            <td>
                <euc:EformComboBox Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcAssistantType" ID="ProcAssistantType_15" LookupCode="PhysicianLevel"   Runat="server" TabIndex="6"  /> </td>

            <td>
                <euc:EformComboBox Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_15" LookupCode="OpSide" Runat="server" TabIndex="7"  /> </td>
            <td>
                <euc:EformTextBox  Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_15"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false"   /></td>
            <td><euc:EformDeleteIcon runat="server"/></td>
          </tr>
        
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresAcnillaryHtmlTable');" />

<br /><br /><br />


