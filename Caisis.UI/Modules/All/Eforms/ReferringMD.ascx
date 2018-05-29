<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ReferringMD" CodeFile="ReferringMD.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.AllergiesHtmlTable = "AllergiesHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ReferringMD" /><span class="controlBoxTitle">Referring MDs</span><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="AllergiesHtmlTable">
  <tr> 
    <td width="40%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Physician (First, Last) </td>
    <td class="controlBoxDataGridHeaderFirstCol">Role</td>
    <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td height="30%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="ReferringMD" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Physicians', <%# DataBinder.Eval(Container.DataItem, "PhysicianId") %>, 'PhTitle,PhFirstName,PhLastName,PhSpecialty,PhLevel,PhInstitution', 'ReferringMD');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "phFirstName") %> <%# DataBinder.Eval(Container.DataItem, "phLastName") %></td>
		    <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtPhRole") %></td>
	      <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "phInstitution") %></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne" nowrap>
	<euc:EformTextBox ShowCalendar="False" CalcDate="False" ParentRecordId="1" RecordId="1" style="width:90px;" TABLE="Physicians" FIELD="PhFirstName" Runat="server" ID="PhFirstName_1" EnableHiddenOnUIEvent="PtPhRole_1"/>
	<euc:EformTextBox ShowCalendar="False" CalcDate="False" ParentRecordId="1"  RecordId="1" style="width:140px;" TABLE="Physicians" FIELD="PhLastName" Runat="server" ID="PhLastName_1" EnableHiddenOnUIEvent="PtPhRole_1" />	</td>
    <td valign="baseline"><euc:EformSelect RecordId="1" LookupCode="PtPhRole" TABLE="PatientPhysicians" FIELD="PtPhRole" Runat="server" ID="PtPhRole_1"/></td>
    <td valign="baseline"><euc:EformComboBox LookupCode="Institution"  RefBy="PhInstitution" style="width:180;" Field="PhInstitution" ParentRecordId="1"   RecordId="1" Table="Physicians" Runat="server" id="PhInstitution_1"  /></td>
    <td>&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr  style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne" nowrap>
        <euc:EformTextBox ShowCalendar="False" CalcDate="False" ParentRecordId="2"  RecordId="1" style="width:90px;" TABLE="Physicians" FIELD="PhFirstName" Runat="server" ID="PhFirstName_2" />
        <euc:EformTextBox ShowCalendar="False" CalcDate="False" ParentRecordId="2"  RecordId="1" style="width:140px;" TABLE="Physicians" FIELD="PhLastName" Runat="server" ID="PhLastName_2" />    </td>
    <td valign="baseline"><euc:EformSelect RecordId="2" LookupCode="PtPhRole" TABLE="PatientPhysicians" FIELD="PtPhRole" Runat="server" ID="PtPhRole_2"/></td>
    <td valign="baseline"><euc:EformComboBox LookupCode="Institution"  RefBy="PhInstitution" style="width:180;" Field="PhInstitution" ParentRecordId="2"  RecordId="1"  Table="Physicians" Runat="server" id="PhInstitution_2"  /></td>
    <td>&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr  style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne" nowrap>
        <euc:EformTextBox ShowCalendar="False" CalcDate="False" ParentRecordId="3"  RecordId="1" style="width:90px;" TABLE="Physicians" FIELD="PhFirstName" Runat="server" ID="PhFirstName_3" />
        <euc:EformTextBox ShowCalendar="False" CalcDate="False" ParentRecordId="3"  RecordId="1" style="width:140px;" TABLE="Physicians" FIELD="PhLastName" Runat="server" ID="PhLastName_3" />    </td>
    <td valign="baseline"><euc:EformSelect RecordId="3" LookupCode="PtPhRole" TABLE="PatientPhysicians" FIELD="PtPhRole" Runat="server" ID="PtPhRole_3"/></td>
    <td valign="baseline"><euc:EformComboBox LookupCode="Institution"  RefBy="PhInstitution" style="width:180;" Field="PhInstitution" ParentRecordId="3"   RecordId="1" Table="Physicians" Runat="server" id="PhInstitution_3"  /> </td>
    <td>&nbsp;</td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'AllergiesHtmlTable');" />
<br/>
<br/><br/>
