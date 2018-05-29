<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Cryotherapy" CodeFile="Cryotherapy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.CryotherapyHtmlTable = "CryotherapyHtmlTable";
</script>
<a name="Cryotherapy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Cryotherapy"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="CryotherapyHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol"  >Date</td>
    <td  class="controlBoxDataGridHeaderFirstCol">Side</td>
    <td   class="controlBoxDataGridHeaderFirstCol" >Site</td>
    <td   class="controlBoxDataGridHeaderFirstCol"  >Institution</td>
    <td  class="controlBoxDataGridHeaderFirstCol">Physician</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>

  
  <asp:Repeater ID="rptCryo" Runat="server" > 
	<ItemTemplate> 
		<tr id="SurgicalHistoryRow" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProcDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcSide") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcSite") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcInstitution") %>&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcSurgeon") %>&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcNotes") %>&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
<tr> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox  Runat="server"   RecordId="61"  ID="ProcDateText_61" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
														<euc:EformHidden   Runat="server"   RecordId="61"  ID="ProcDate_61"     Table="Procedures" Field="ProcDate" />	  </td>
    <td  style="white-space: nowrap;"><euc:EformDropDownList   Runat="server"   RecordId="61"  ID="ProcSide_61"     TABLE="Procedures" FIELD="ProcSide"    LookupCode="OpSide"    /></td>
    <td align="center"  style="white-space: nowrap;"><euc:EformComboBox Runat="server"   RecordId="61"  ID="ProcSite_61"     Table="Procedures" Field="ProcSite"    LookupCode="DxTarget"  style="width:90px;" />	</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" style="width:100px;" DropDownWidth="300" Field="ProcInstitution" RecordId="61" Table="Procedures" Runat="server" id="ProcInstitution_61"  /></td>
    <td align="center"><euc:EformComboBox  runat="server"  LookupCode="OpSurgeon" DropDownWidth="300" style="width:80px;" Field="ProcSurgeon" RecordId="61" Table="Procedures" id="OpSurgeon_61"  /></td>
    <td><euc:EformTextBox  Runat="server"   RecordId="61"  ID="ProcNotes_61"    TABLE="Procedures" FIELD="ProcNotes"   ShowCalendar="False" CalcDate="False" style="width:100px;"  ShowTextEditor="true" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
<tr style="display: none;"> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox  Runat="server"   RecordId="62"  ID="ProcDateText_62" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
														<euc:EformHidden   Runat="server"   RecordId="62"  ID="ProcDate_62"     Table="Procedures" Field="ProcDate" />	  </td>
    <td  style="white-space: nowrap;"><euc:EformDropDownList   Runat="server"   RecordId="62"  ID="ProcSide_62"     TABLE="Procedures" FIELD="ProcSide"    LookupCode="OpSide"    /></td>
    <td align="center"  style="white-space: nowrap;"><euc:EformComboBox Runat="server"   RecordId="62"  ID="ProcSite_62"     Table="Procedures" Field="ProcSite"    LookupCode="DxTarget"  style="width:90px;" />	</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" style="width:100px;" DropDownWidth="300" Field="ProcInstitution" RecordId="62" Table="Procedures" Runat="server" id="ProcInstitution_62"  /></td>
    <td align="center"><euc:EformComboBox  runat="server"  LookupCode="OpSurgeon" DropDownWidth="300" style="width:80px;" Field="ProcSurgeon" RecordId="62" Table="Procedures" id="OpSurgeon_62"  /></td>
    <td><euc:EformTextBox  Runat="server"   RecordId="62"  ID="ProcNotes_62"    TABLE="Procedures" FIELD="ProcNotes"   ShowCalendar="False" CalcDate="False" style="width:100px;"  ShowTextEditor="true" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
<tr style="display: none;"> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox  Runat="server"   RecordId="63"  ID="ProcDateText_63" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
														<euc:EformHidden   Runat="server"   RecordId="63"  ID="ProcDate_63"     Table="Procedures" Field="ProcDate" />	  </td>
    <td  style="white-space: nowrap;"><euc:EformDropDownList   Runat="server"   RecordId="63"  ID="ProcSide_63"     TABLE="Procedures" FIELD="ProcSide"    LookupCode="OpSide"    /></td>
    <td align="center"  style="white-space: nowrap;"><euc:EformComboBox Runat="server"   RecordId="63"  ID="ProcSite_63"     Table="Procedures" Field="ProcSite"    LookupCode="DxTarget"  style="width:90px;" />	</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" style="width:100px;" DropDownWidth="300" Field="ProcInstitution" RecordId="63" Table="Procedures" Runat="server" id="ProcInstitution_63"  /></td>
    <td align="center"><euc:EformComboBox  runat="server"  LookupCode="OpSurgeon" DropDownWidth="300" style="width:80px;" Field="ProcSurgeon" RecordId="63" Table="Procedures" id="OpSurgeon_63"  /></td>
    <td><euc:EformTextBox  Runat="server"   RecordId="63"  ID="ProcNotes_63"    TABLE="Procedures" FIELD="ProcNotes"   ShowCalendar="False" CalcDate="False" style="width:100px;"  ShowTextEditor="true" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
<tr style="display: none;"> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox  Runat="server"   RecordId="64"  ID="ProcDateText_64" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
														<euc:EformHidden   Runat="server"   RecordId="64"  ID="ProcDate_64"     Table="Procedures" Field="ProcDate" />	  </td>
    <td  style="white-space: nowrap;"><euc:EformDropDownList   Runat="server"   RecordId="64"  ID="ProcSide_64"     TABLE="Procedures" FIELD="ProcSide"    LookupCode="OpSide"    /></td>
    <td align="center"  style="white-space: nowrap;"><euc:EformComboBox Runat="server"   RecordId="64"  ID="ProcSite_64"     Table="Procedures" Field="ProcSite"    LookupCode="DxTarget"  style="width:90px;" />	</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" style="width:100px;" DropDownWidth="300" Field="ProcInstitution" RecordId="64" Table="Procedures" Runat="server" id="ProcInstitution_64"  /></td>
    <td align="center"><euc:EformComboBox  runat="server"  LookupCode="OpSurgeon" DropDownWidth="300" style="width:80px;" Field="ProcSurgeon" RecordId="64" Table="Procedures" id="OpSurgeon_64"  /></td>
    <td><euc:EformTextBox  Runat="server"   RecordId="64"  ID="ProcNotes_64"    TABLE="Procedures" FIELD="ProcNotes"   ShowCalendar="False" CalcDate="False" style="width:100px;"  ShowTextEditor="true" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
<tr style="display: none;"> 
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox  Runat="server"   RecordId="65"  ID="ProcDateText_65" TABLE="Procedures" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
														<euc:EformHidden   Runat="server"   RecordId="65"  ID="ProcDate_65"     Table="Procedures" Field="ProcDate" />	  </td>
    <td  style="white-space: nowrap;"><euc:EformDropDownList   Runat="server"   RecordId="65"  ID="ProcSide_65"     TABLE="Procedures" FIELD="ProcSide"    LookupCode="OpSide"    /></td>
    <td align="center"  style="white-space: nowrap;"><euc:EformComboBox Runat="server"   RecordId="65"  ID="ProcSite_65"     Table="Procedures" Field="ProcSite"    LookupCode="DxTarget"  style="width:90px;" />	</td>
    <td><euc:EformComboBox  LookupCode="Institution,PercentUsage,Top80" style="width:100px;" DropDownWidth="300" Field="ProcInstitution" RecordId="65" Table="Procedures" Runat="server" id="ProcInstitution_65"  /></td>
    <td align="center"><euc:EformComboBox  runat="server"  LookupCode="OpSurgeon" DropDownWidth="300" style="width:80px;" Field="ProcSurgeon" RecordId="65" Table="Procedures" id="OpSurgeon_65"  /></td>
    <td><euc:EformTextBox  Runat="server"   RecordId="65"  ID="ProcNotes_65"    TABLE="Procedures" FIELD="ProcNotes"   ShowCalendar="False" CalcDate="False" style="width:100px;"  ShowTextEditor="true" /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'CryotherapyHtmlTable');"><img alt="" src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"/></a>
<br/>
<br/><br/>
