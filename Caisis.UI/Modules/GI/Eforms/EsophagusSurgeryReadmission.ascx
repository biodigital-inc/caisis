<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgeryReadmission" CodeFile="EsophagusSurgeryReadmission.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
    tableArray.ReadmissionHtmlTable = "ReadmissionHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<a name="EsophagusSurgeryReadmission" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Re-admission/Operation"></asp:Label><br/>





                

<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ReadmissionHtmlTable">
  

      <tr> 
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; " >&nbsp;Date</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; ">Re-admission Type</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; ">Reason for readmission</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; ">Notes</td>
        <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
      </tr>
      
    <tr > 
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="80px" ParentRecordId="11" RecordId="90"  TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_90"  Runat="server"  ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden ParentRecordId="11" RecordId="90" Table="Toxicities" Field="ToxDate" ID="ToxDate_90" Runat="server" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDropDownList Width="200px"   ParentRecordId="11" RecordId="90" Table="Toxicities" Field="ToxName" LookupCode="ToxName_Complication,FieldType,Readmission"  ID="ToxName_90" Runat="server"  /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="90" Table="Toxicities" Field="ToxRelatedTo"  id="ToxRelatedTo_90" Runat="server"  ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="90" TABLE="Toxicities" FIELD="ToxNotes" ID="ToxNotes_90" Runat="server" ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDeleteIcon ID="EformDeleteIcon_90" runat="server"/></td>
    </tr>
    <tr style="display: none; " > 
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="80px" ParentRecordId="11" RecordId="91"  TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_91"  Runat="server"  ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden ParentRecordId="11" RecordId="91" Table="Toxicities" Field="ToxDate" ID="ToxDate_91" Runat="server" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDropDownList Width="200px"   ParentRecordId="11" RecordId="91" Table="Toxicities" Field="ToxName" LookupCode="ToxName_Complication,FieldType,Readmission"  ID="ToxName_91" Runat="server"  /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="91" Table="Toxicities" Field="ToxRelatedTo"  id="ToxRelatedTo_91" Runat="server"  ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="91" TABLE="Toxicities" FIELD="ToxNotes" ID="ToxNotes_91" Runat="server" ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDeleteIcon ID="EformDeleteIcon_91" runat="server"/></td>
    </tr>
    <tr style="display: none; " > 
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="80px" ParentRecordId="11" RecordId="92"  TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_92"  Runat="server"  ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden ParentRecordId="11" RecordId="92" Table="Toxicities" Field="ToxDate" ID="ToxDate_92" Runat="server" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDropDownList Width="200px"   ParentRecordId="11" RecordId="92" Table="Toxicities" Field="ToxName" LookupCode="ToxName_Complication,FieldType,Readmission"  ID="ToxName_92" Runat="server"  /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="92" Table="Toxicities" Field="ToxRelatedTo"  id="ToxRelatedTo_92" Runat="server"  ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="92" TABLE="Toxicities" FIELD="ToxNotes" ID="ToxNotes_92" Runat="server" ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDeleteIcon ID="EformDeleteIcon_92" runat="server"/></td>
    </tr>
    <tr style="display: none; " > 
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="80px" ParentRecordId="11" RecordId="93"  TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_93"  Runat="server"  ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden ParentRecordId="11" RecordId="93" Table="Toxicities" Field="ToxDate" ID="ToxDate_93" Runat="server" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDropDownList Width="200px"   ParentRecordId="11" RecordId="93" Table="Toxicities" Field="ToxName" LookupCode="ToxName_Complication,FieldType,Readmission"  ID="ToxName_93" Runat="server"  /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="93" Table="Toxicities" Field="ToxRelatedTo"  id="ToxRelatedTo_93" Runat="server"  ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="93" TABLE="Toxicities" FIELD="ToxNotes" ID="ToxNotes_93" Runat="server" ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDeleteIcon ID="EformDeleteIcon_93" runat="server"/></td>
    </tr>
    <tr style="display: none; " > 
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="80px" ParentRecordId="11" RecordId="94"  TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_94"  Runat="server"  ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden ParentRecordId="11" RecordId="94" Table="Toxicities" Field="ToxDate" ID="ToxDate_94" Runat="server" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDropDownList Width="200px"   ParentRecordId="11" RecordId="94" Table="Toxicities" Field="ToxName" LookupCode="ToxName_Complication,FieldType,Readmission"  ID="ToxName_94" Runat="server"  /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="94" Table="Toxicities" Field="ToxRelatedTo"  id="ToxRelatedTo_94" Runat="server"  ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="94" TABLE="Toxicities" FIELD="ToxNotes" ID="ToxNotes_94" Runat="server" ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDeleteIcon ID="EformDeleteIcon_94" runat="server"/></td>
    </tr>
    <tr style="display: none; " > 
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="80px" ParentRecordId="11" RecordId="95"  TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_95"  Runat="server"  ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden ParentRecordId="11" RecordId="95" Table="Toxicities" Field="ToxDate" ID="ToxDate_95" Runat="server" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDropDownList Width="200px"   ParentRecordId="11" RecordId="95" Table="Toxicities" Field="ToxName" LookupCode="ToxName_Complication,FieldType,Readmission"  ID="ToxName_95" Runat="server"  /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="95" Table="Toxicities" Field="ToxRelatedTo"  id="ToxRelatedTo_95" Runat="server"  ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="95" TABLE="Toxicities" FIELD="ToxNotes" ID="ToxNotes_95" Runat="server" ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDeleteIcon ID="EformDeleteIcon_95" runat="server"/></td>
    </tr>
    <tr style="display: none; " > 
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="80px" ParentRecordId="11" RecordId="96"  TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_96"  Runat="server"  ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden ParentRecordId="11" RecordId="96" Table="Toxicities" Field="ToxDate" ID="ToxDate_96" Runat="server" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDropDownList Width="200px"   ParentRecordId="11" RecordId="96" Table="Toxicities" Field="ToxName" LookupCode="ToxName_Complication,FieldType,Readmission"  ID="ToxName_96" Runat="server"  /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="96" Table="Toxicities" Field="ToxRelatedTo"  id="ToxRelatedTo_96" Runat="server"  ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="96" TABLE="Toxicities" FIELD="ToxNotes" ID="ToxNotes_96" Runat="server" ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDeleteIcon ID="EformDeleteIcon_96" runat="server"/></td>
    </tr>
    <tr style="display: none; " > 
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="80px" ParentRecordId="11" RecordId="97"  TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_97"  Runat="server"  ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden ParentRecordId="11" RecordId="97" Table="Toxicities" Field="ToxDate" ID="ToxDate_97" Runat="server" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDropDownList Width="200px"   ParentRecordId="11" RecordId="97" Table="Toxicities" Field="ToxName" LookupCode="ToxName_Complication,FieldType,Readmission"  ID="ToxName_97" Runat="server"  /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="97" Table="Toxicities" Field="ToxRelatedTo"  id="ToxRelatedTo_97" Runat="server"  ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="97" TABLE="Toxicities" FIELD="ToxNotes" ID="ToxNotes_97" Runat="server" ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDeleteIcon ID="EformDeleteIcon_97" runat="server"/></td>
    </tr>
    <tr style="display: none; " > 
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="80px" ParentRecordId="11" RecordId="98"  TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_98"  Runat="server"  ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden ParentRecordId="11" RecordId="98" Table="Toxicities" Field="ToxDate" ID="ToxDate_98" Runat="server" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDropDownList Width="200px"   ParentRecordId="11" RecordId="98" Table="Toxicities" Field="ToxName" LookupCode="ToxName_Complication,FieldType,Readmission"  ID="ToxName_98" Runat="server"  /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="98" Table="Toxicities" Field="ToxRelatedTo"  id="ToxRelatedTo_98" Runat="server"  ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="98" TABLE="Toxicities" FIELD="ToxNotes" ID="ToxNotes_98" Runat="server" ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDeleteIcon ID="EformDeleteIcon_98" runat="server"/></td>
    </tr>
    <tr style="display: none; " > 
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="80px" ParentRecordId="11" RecordId="99"  TABLE="Toxicities" FIELD="ToxDateText" ID="ToxDateText_99"  Runat="server"  ShowCalendar="True" CalcDate="True" />
            <euc:EformHidden ParentRecordId="11" RecordId="99" Table="Toxicities" Field="ToxDate" ID="ToxDate_99" Runat="server" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDropDownList Width="200px"   ParentRecordId="11" RecordId="99" Table="Toxicities" Field="ToxName" LookupCode="ToxName_Complication,FieldType,Readmission"  ID="ToxName_99" Runat="server"  /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="99" Table="Toxicities" Field="ToxRelatedTo"  id="ToxRelatedTo_99" Runat="server"  ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformTextBox Width="150px" ParentRecordId="11" RecordId="99" TABLE="Toxicities" FIELD="ToxNotes" ID="ToxNotes_99" Runat="server" ShowTextEditor="true" /></td>
        <td valign="top" style="white-space: nowrap; ">
            <euc:EformDeleteIcon ID="EformDeleteIcon_99" runat="server"/></td>
    </tr>




</table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ReadmissionHtmlTable');" />




<script type="text/javascript">
    /* <![CDATA[ */

</script>