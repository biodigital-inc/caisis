<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ComplicationsExtendedGrid.ascx.cs" Inherits="Caisis.UI.Modules.All.Eforms.ComplicationsExtendedGrid" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="ComplicationsExtendedGrid" id="ComplicationsExtendedGrid" />

<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Outcomes/Toxicities"></asp:Label><br/>

<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComplicationsHtmlTable">
  <tr> 
    <td width="10%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol">Toxicity/Complication</td>
    <td width="15%" class="controlBoxDataGridHeaderFirstCol">Class</td>
    <td width="15%" class="controlBoxDataGridHeaderFirstCol">Related To</td>
    <td width="15%" class="controlBoxDataGridHeaderFirstCol">Intervention</td>
    <td width="15%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="5%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr  >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="ToxDateText_1" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="ToxDate_1" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication"    style="width:150;" Field="ToxName" RecordId="1" Table="Toxicities" Runat="server" id="ToxName_1"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxClass" Width="75" Field="ToxClass" RecordId="1" Table="Toxicities" Runat="server" id="ToxClass_1"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="RelatedTo" Width="100" Field="ToxRelatedTo" RecordId="1" Table="Toxicities" Runat="server" id="ToxRelatedTo_1"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxIntervention" Width="100" Field="ToxIntervention" RecordId="1" Table="Toxicities" Runat="server" id="ToxIntervention_1"  /></td>
    <td align="center"><euc:EformTextBox RecordId="1" Width="100"  style="width:100px;" ShowTextEditor="true" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_1"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  
   <tr style="display:none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="ToxDateText_2" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="ToxDate_2" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication"    style="width:150;" Field="ToxName" RecordId="2" Table="Toxicities" Runat="server" id="ToxName_2"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxClass" Width="75" Field="ToxClass" RecordId="2" Table="Toxicities" Runat="server" id="ToxClass_2"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="RelatedTo" Width="100" Field="ToxRelatedTo" RecordId="2" Table="Toxicities" Runat="server" id="ToxRelatedTo_2"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxIntervention" Width="100" Field="ToxIntervention" RecordId="2" Table="Toxicities" Runat="server" id="ToxIntervention_2"  /></td>
    <td align="center"><euc:EformTextBox RecordId="2" Width="100"  style="width:100px;" ShowTextEditor="true" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_2"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  
   <tr style="display:none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="ToxDateText_3" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="ToxDate_3" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication"    style="width:150;" Field="ToxName" RecordId="3" Table="Toxicities" Runat="server" id="ToxName_3"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxClass" Width="75" Field="ToxClass" RecordId="3" Table="Toxicities" Runat="server" id="ToxClass_3"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="RelatedTo" Width="100" Field="ToxRelatedTo" RecordId="3" Table="Toxicities" Runat="server" id="ToxRelatedTo_3"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxIntervention" Width="100" Field="ToxIntervention" RecordId="3" Table="Toxicities" Runat="server" id="ToxIntervention_3"  /></td>
    <td align="center"><euc:EformTextBox RecordId="3" Width="100"  style="width:100px;" ShowTextEditor="true" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_3"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  
   <tr style="display:none" >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4"  ID="ToxDateText_4" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="4" Runat="server" ID="ToxDate_4" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication"    style="width:150;" Field="ToxName" RecordId="4" Table="Toxicities" Runat="server" id="ToxName_4"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxClass" Width="75" Field="ToxClass" RecordId="4" Table="Toxicities" Runat="server" id="ToxClass_4"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="RelatedTo" Width="100" Field="ToxRelatedTo" RecordId="4" Table="Toxicities" Runat="server" id="ToxRelatedTo_4"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxIntervention" Width="100" Field="ToxIntervention" RecordId="4" Table="Toxicities" Runat="server" id="ToxIntervention_4"  /></td>
    <td align="center"><euc:EformTextBox RecordId="4" Width="100"  style="width:100px;" ShowTextEditor="true" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_4"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  
   <tr style="display:none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5"  ID="ToxDateText_5" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="5" Runat="server" ID="ToxDate_5" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxName_Complication"    style="width:150;" Field="ToxName" RecordId="5" Table="Toxicities" Runat="server" id="ToxName_5"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxClass" Width="75" Field="ToxClass" RecordId="5" Table="Toxicities" Runat="server" id="ToxClass_5"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="RelatedTo" Width="100" Field="ToxRelatedTo" RecordId="5" Table="Toxicities" Runat="server" id="ToxRelatedTo_5"  /></td>
    <td style="white-space:nowrap;"><euc:EformComboBox LookupCode="ToxIntervention" Width="100" Field="ToxIntervention" RecordId="5" Table="Toxicities" Runat="server" id="ToxIntervention_5"  /></td>
    <td align="center"><euc:EformTextBox RecordId="5" Width="100"  style="width:100px;" ShowTextEditor="true" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_5"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  
</table>

<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ComplicationsHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
<br/>
<br/><br/>
