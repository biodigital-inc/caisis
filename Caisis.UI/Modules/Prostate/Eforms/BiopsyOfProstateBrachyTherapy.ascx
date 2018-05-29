<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateBrachyTherapy" CodeFile="BiopsyOfProstateBrachyTherapy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.BrachyTherapyHtmlTable = "BrachyTherapyHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<div id="BrachyTxDiv" style="display: <asp:Literal ID="DivDisplay" Runat="server" >block</asp:Literal>;">
<a name="BrachyTherapy" /><span class="controlBoxTitle">BrachyTherapy </span><br>
<table border="0" width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BrachyTherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Prescribed Dose </td>
    <td class="controlBoxDataGridHeaderFirstCol">Isotope</td>
    <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <asp:Repeater ID="Brachy" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('BrachyTherapy', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'BrachyDateText,BrachyDate,BrachyPrescribedDose,BrachyIsotope,BrachyInstitution,BrachyNotes', 'BrachyTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "BrachyDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "BrachyPrescribedDose") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "BrachyIsotope") %>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "BrachyInstitution") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "BrachyNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  <tr >
    <td height="10%" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="BrachyDateText_1" TABLE="BrachyTherapy" FIELD="BrachyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="BrachyDate_1" Table="BrachyTherapy" Field="BrachyDate" />    </td> 
    <td><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="BrachyTherapy" FIELD="BrachyPrescribedDose" Runat="server" ID="BrachyPrescribedDose_1"/></td>
    <td><euc:EformSelect RecordId="1" LookupCode="SeedIsotope" TABLE="BrachyTherapy" FIELD="BrachyIsotope" Runat="server" ID="BrachyIsotope_1"/></td>
    <td><euc:EformComboBox LookupCode="Institution,PercentUsage,Top80" RefBy="Institution" style="width:80;" Field="BrachyInstitution" RecordId="1" Table="BrachyTherapy" Runat="server" id="BrachyInstitution_1"  /></td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowTextEditor="true" style="width:60px;" TABLE="BrachyTherapy" FIELD="BrachyNotes" Runat="server" ID="BrachyNotes_1"/>&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
    <tr style="DISPLAY: none">
    <td height="10%" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="BrachyDateText_2" TABLE="BrachyTherapy" FIELD="BrachyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="BrachyDate_2" Table="BrachyTherapy" Field="BrachyDate" />    </td> 
    <td><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="BrachyTherapy" FIELD="BrachyPrescribedDose" Runat="server" ID="BrachyPrescribedDose_2"/></td>
    <td><euc:EformSelect RecordId="2" LookupCode="SeedIsotope" TABLE="BrachyTherapy" FIELD="BrachyIsotope" Runat="server" ID="BrachyIsotope_2"/></td>
    <td><euc:EformComboBox LookupCode="Institution,PercentUsage,Top80" RefBy="Institution" style="width:80;" Field="BrachyInstitution" RecordId="2" Table="BrachyTherapy" Runat="server" id="BrachyInstitution_2"  /></td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowTextEditor="true" style="width:60px;" TABLE="BrachyTherapy" FIELD="BrachyNotes" Runat="server" ID="BrachyNotes_2"/>&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
    <tr style="DISPLAY: none">
    <td height="10%" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="BrachyDateText_3" TABLE="BrachyTherapy" FIELD="BrachyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="BrachyDate_3" Table="BrachyTherapy" Field="BrachyDate" />    </td> 
    <td><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="BrachyTherapy" FIELD="BrachyPrescribedDose" Runat="server" ID="BrachyPrescribedDose_3"/></td>
    <td><euc:EformSelect RecordId="3" LookupCode="SeedIsotope" TABLE="BrachyTherapy" FIELD="BrachyIsotope" Runat="server" ID="BrachyIsotope_3"/></td>
    <td><euc:EformComboBox LookupCode="Institution,PercentUsage,Top80" RefBy="Institution" style="width:80;" Field="BrachyInstitution" RecordId="3" Table="BrachyTherapy" Runat="server" id="BrachyInstitution_3"  /></td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowTextEditor="true" style="width:60px;" TABLE="BrachyTherapy" FIELD="BrachyNotes" Runat="server" ID="BrachyNotes_3"/>&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'BrachyTherapyHtmlTable');" />
<br/><br/>
<br/>
</div>
<asp:Literal ID="ShowDivScript" Runat="server" />
