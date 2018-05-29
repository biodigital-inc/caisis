<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bone.Eforms.ProceduresOsteo" CodeFile="ProceduresOsteo.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.ProceduresOsteoHtmlTable = "ProceduresOsteoHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="ProceduresOsteo" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Surgeries"></asp:Label><br/>
<table  width="750" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ProceduresOsteoHtmlTable" > 

          <tr>
  			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >Pending </td>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >Date</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Site/Bone</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Side</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Surgery</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Surgeon</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Indication</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Notes</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
    <asp:Repeater ID="rptSurgicalHistory" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 
	<ItemTemplate> 
	    
       <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcPending,ProcDateText,ProcName,ProcSurgeon,ProcSite,ProcSide,ProcIndication,ProcNotes', 'Procedures');"> 
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;">&nbsp;<asp:Literal ID="ResultField" Runat="server" /></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcDateText")%></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcSite")%></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcSide")%></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcName")%></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcSurgeon")%></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcIndication")%></td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcNotes")%></td>
            <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
        </tr>      

   
	</ItemTemplate>
  </asp:Repeater>          

           <tr>
            <td style="white-space: nowrap;">
                 <euc:EformCheckBox Width="20px" RecordId="11"  TABLE="Procedures" FIELD="ProcPending"  ID="ProcPending_11" Runat="server" Value="1" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_11" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="11"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_11"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="11"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_11" LookupCode="OsteoProcSite"   Runat="server" TabIndex="6"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="11"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_11" LookupCode="OpSide"   Runat="server" TabIndex="6"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="11"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_11"     LookupCode="OsteoProcName" Runat="server" TabIndex="2"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="11"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_11"   LookupCode="Physician"   Runat="server" TabIndex="3"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="11"  TABLE="Procedures" FIELD="ProcIndication" ID="ProcIndication_11" LookupCode="Indication"   Runat="server" TabIndex="5"  /> </td>
           
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="11"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_11"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true"  /></td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
         </tr>
                     
          <tr style="display: none;">
            <td style="white-space: nowrap;">
                 <euc:EformCheckBox Width="20px" RecordId="12"  TABLE="Procedures" FIELD="ProcPending"  ID="ProcPending_12" Runat="server" Value="1" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_12" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="12"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_12"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_12" LookupCode="OsteoProcSite"   Runat="server" TabIndex="6"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_12" LookupCode="OpSide"   Runat="server" TabIndex="6"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_12"     LookupCode="OsteoProcName" Runat="server" TabIndex="2"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_12"   LookupCode="Physician"   Runat="server" TabIndex="3"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcIndication" ID="ProcIndication_12" LookupCode="Indication"   Runat="server" TabIndex="5"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_12"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true"  /></td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
       <tr style="display: none;">
            <td style="white-space: nowrap;">
                 <euc:EformCheckBox Width="20px" RecordId="13"  TABLE="Procedures" FIELD="ProcPending"  ID="ProcPending_13" Runat="server" Value="1" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_13" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="13"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_13"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_13" LookupCode="OsteoProcSite"   Runat="server" TabIndex="6"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_13" LookupCode="OpSide"   Runat="server" TabIndex="6"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_13"     LookupCode="OsteoProcName" Runat="server" TabIndex="2"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_13"   LookupCode="Physician"   Runat="server" TabIndex="3"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcIndication" ID="ProcIndication_13" LookupCode="Indication"   Runat="server" TabIndex="5"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="13"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_13"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true"  /></td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
          <tr style="display: none;">
             <td style="white-space: nowrap;">
                 <euc:EformCheckBox Width="20px" RecordId="14"  TABLE="Procedures" FIELD="ProcPending"  ID="ProcPending_14" Runat="server" Value="1" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_14" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="14"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_14"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_14" LookupCode="OsteoProcSite"   Runat="server" TabIndex="6"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_14" LookupCode="OpSide"   Runat="server" TabIndex="6"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_14"     LookupCode="OsteoProcName" Runat="server" TabIndex="2"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_14"   LookupCode="Physician"   Runat="server" TabIndex="3"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcIndication" ID="ProcIndication_14" LookupCode="Indication"   Runat="server" TabIndex="5"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="14"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_14"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true"  /></td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
             <tr style="display: none;">
             <td style="white-space: nowrap;">
                 <euc:EformCheckBox Width="20px" RecordId="15"  TABLE="Procedures" FIELD="ProcPending"  ID="ProcPending_15" Runat="server" Value="1" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_15" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="15"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_15"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_15" LookupCode="OsteoProcSite"   Runat="server" TabIndex="6"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_15" LookupCode="OpSide"   Runat="server" TabIndex="6"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_15"     LookupCode="OsteoProcName" Runat="server" TabIndex="2"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_15"   LookupCode="Physician"   Runat="server" TabIndex="3"  /> </td>
             <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcIndication" ID="ProcIndication_15" LookupCode="Indication"   Runat="server" TabIndex="5"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="15"  TABLE="Procedures" FIELD="ProcNotes"    ID="ProcNotes_15"    Runat="server" TabIndex="8" ShowCalendar="false" CalcDate="false" ShowTextEditor="true"  /></td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
        
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ProceduresOsteoHtmlTable');" />

<br /><br /><br />


