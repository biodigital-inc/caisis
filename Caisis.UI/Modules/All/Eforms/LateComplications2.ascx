<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.LateComplications2" CodeFile="LateComplications2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ComplicationsHtmlTable = "ComplicationsHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="LateComplications2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Interval History"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComplicationsHtmlTable">
  <tr> 
    <td width="15%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="35%" class="controlBoxDataGridHeaderFirstCol">Complication</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  

  
  

  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="6"  ID="ToxDateText_6" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="6" Runat="server" ID="ToxDate_6" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="6" Table="Toxicities" Runat="server" id="ToxName_6"  /></td>
    <td align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_6"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="7"  ID="ToxDateText_7" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="7" Runat="server" ID="ToxDate_7" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="7" Table="Toxicities" Runat="server" id="ToxName_7"  /></td>
    <td align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_7"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="8"  ID="ToxDateText_8" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="8" Runat="server" ID="ToxDate_8" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="8" Table="Toxicities" Runat="server" id="ToxName_8"  /></td>
    <td align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_8"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="9"  ID="ToxDateText_9" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="9" Runat="server" ID="ToxDate_9" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="9" Table="Toxicities" Runat="server" id="ToxName_9"  /></td>
    <td align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_9"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="10"  ID="ToxDateText_5" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="10" Runat="server" ID="ToxDate_5" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="10" Table="Toxicities" Runat="server" id="ToxName_5"  /></td>
    <td align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1"/></td>
    <td>&nbsp;</td>
  </tr>
</table>

<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ComplicationsHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
<br/>
<br/><br/>
