<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BrachyTherapy" CodeFile="BrachyTherapy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="BrachyTherapy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Brachy Therapy"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BrachyTherapyHtmlTable">
  
  <tr runat="server"> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Prescribed Dose </td>
    <td class="controlBoxDataGridHeaderFirstCol">Isotope</td>
    <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="Brachy" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('BrachyTherapy', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'BrachyDateText,BrachyDate,BrachyPrescribedDose,BrachyIsotope,BrachyInstitution,BrachyNotes', 'BrachyTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "BrachyDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "BrachyPrescribedDose") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "BrachyIsotope") %>&nbsp;</td>
		    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "BrachyInstitution") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "BrachyNotes") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  <tr id="NewTableRow" runat="server" >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="BrachyDateText_1" TABLE="BrachyTherapy" FIELD="BrachyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="BrachyDate_1" Table="BrachyTherapy" Field="BrachyDate" />    </td> 
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="BrachyTherapy" FIELD="BrachyPrescribedDose" Runat="server" ID="BrachyPrescribedDose_1"/></td>
    <td><euc:EformComboBox style="width:100px;"  RecordId="1" LookupCode="SeedIsotope" TABLE="BrachyTherapy" FIELD="BrachyIsotope" Runat="server" ID="BrachyIsotope_1"/></td>
    <td><euc:EformComboBox DropDownWidth="400px" style="width:100px;"  LookupCode="Institution,PercentUsage,Top80" RefBy="Institution"  Field="BrachyInstitution" RecordId="1" Table="BrachyTherapy" Runat="server" id="BrachyInstitution_1"  /></td>
    <td align="center"><euc:EformTextBox style="width:100px;" RecordId="1" ShowCalendar="False" CalcDate="False"  TABLE="BrachyTherapy" FIELD="BrachyNotes" Runat="server" ID="BrachyNotes_1" ShowTextEditor="true"/>
      &nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
   <%--DO NO DELETE FOLLOWING <TR> -- B/C runat="server" IS USED FOR PREVIOUS <TR>, NEEDED FOR CONTROL TO SHOW UP IN EFORM TRANSFORM 2/22/2010
    <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformHidden Runat="server" RecordId="1" Table="BrachyTherapy" Field="BrachyDataSource" ID="EformTextBox1"  /> </td> 
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  - removed because this was breaking mskcc production
  
--%>
</table>
<br/><br/><br/>

