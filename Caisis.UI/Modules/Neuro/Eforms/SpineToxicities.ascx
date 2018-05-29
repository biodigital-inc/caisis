<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.SpineToxicities" CodeFile="SpineToxicities.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.SpineToxTbl = "SpineToxTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<span class="controlBoxTitle">Toxicities</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="500" class="ClinicalEformTable">
    <tr >
        <td>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevSpineToxTable">
                <tr id="NoSpineToxMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="8" class="ClinicalEformPopulatedColumn" align="center" height="20">
                        No previous Toxicities were recorded for this patient.
                    </td>
                </tr>
             </table>
             
             <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 100px; width:685; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="685" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpineToxRptTable">  
                  <asp:Repeater ID="SpineToxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                    <HeaderTemplate>
                      <tr runat="server" id="PrevSpineToxRptHdr">
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Toxicity/Complication</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Class</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">System</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Grade</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
	                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
	                    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                      </tr>
                    </HeaderTemplate>
	                <ItemTemplate> 
		                <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Toxicities', <%# Eval("ToxicityId") %>, 'ToxDateText,ToxDate,ToxName,ToxClass,ToxCategory,ToxGrade,ToxNotes,ToxQuality', 'Toxicities');"> 
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ToxDateText")%></td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ToxName")%></td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ToxClass")%></td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ToxCategory")%></td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ToxGrade")%></td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ToxNotes")%></td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ToxQuality")%></td>
			                <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		                </tr>      
	                </ItemTemplate>
                  </asp:Repeater>
                  </table></div><br /><br />

<table width="750" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpineToxTbl">
  <tr runat="server" id="SpineActionsHdr"> 
    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Toxicity/Complication</td>
    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Class</td>
    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">System</td>
    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Grade</td>
    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
	<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr>
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="1" ID="ToxDateText_1" TABLE="Toxicities" FIELD="ToxDateText" 
            ShowCalendar="True" CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="1" TABLE="Toxicities" Field="ToxDate" Runat="server" ID="ToxDate_1" />
    </td>
    <td align="center"><euc:EformComboBox RecordId="1" width="100px" TABLE="Toxicities" FIELD="ToxName" Runat="server" 
        ID="ToxName_1" LookupCode="ToxName_Complication" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformDropDownList RecordId="1" width="65px" TABLE="Toxicities" FIELD="ToxClass" Runat="server" 
        ID="ToxClass_1" LookupCode="ToxClass" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="1" width="80px" TABLE="Toxicities" FIELD="ToxCategory" Runat="server" 
        ID="ToxCategory_1" LookupCode="ToxCategory,Disease,Spine" DropDownHeight="150px"/></td>
    <td align="center"><euc:EformDropDownList RecordId="1" width="65px" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" 
        ID="ToxGrade_1" LookupCode="ToxGrade" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformTextBox RecordId="1" width="80px" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" 
        ID="ToxNotes_1" ShowTextEditor="true" MaxLength="1000"/></td>
    <td align="center"><euc:EformDropDownList RecordId="1" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
        ID="ToxQuality_1" LookupCode="DataQuality" width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
   <tr style="display:none">
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="2" ID="ToxDateText_2" TABLE="Toxicities" FIELD="ToxDateText" 
            ShowCalendar="True" CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="2" TABLE="Toxicities" Field="ToxDate" Runat="server" ID="ToxDate_2" />
    </td>
    <td align="center"><euc:EformComboBox RecordId="2" width="100px" TABLE="Toxicities" FIELD="ToxName" Runat="server" 
        ID="ToxName_2" LookupCode="ToxName_Complication" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformDropDownList RecordId="2" width="65px" TABLE="Toxicities" FIELD="ToxClass" Runat="server" 
        ID="ToxClass_2" LookupCode="ToxClass" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="2" width="80px" TABLE="Toxicities" FIELD="ToxCategory" Runat="server" 
        ID="ToxCategory_2" LookupCode="ToxCategory,Disease,Spine" DropDownHeight="150px"/></td>
    <td align="center"><euc:EformDropDownList RecordId="2" width="65px" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" 
        ID="ToxGrade_2" LookupCode="ToxGrade" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformTextBox RecordId="2" width="80px" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" 
        ID="ToxNotes_2" ShowTextEditor="true" MaxLength="1000"/></td>
    <td align="center"><euc:EformDropDownList RecordId="2" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
        ID="ToxQuality_2" LookupCode="DataQuality" width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none">
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="3" ID="ToxDateText_3" TABLE="Toxicities" FIELD="ToxDateText" 
            ShowCalendar="True" CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="3" TABLE="Toxicities" Field="ToxDate" Runat="server" ID="ToxDate_3" />
    </td>
    <td align="center"><euc:EformComboBox RecordId="3" width="100px" TABLE="Toxicities" FIELD="ToxName" Runat="server" 
        ID="ToxName_3" LookupCode="ToxName_Complication" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformDropDownList RecordId="3" width="65px" TABLE="Toxicities" FIELD="ToxClass" Runat="server" 
        ID="ToxClass_3" LookupCode="ToxClass" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="3" width="80px" TABLE="Toxicities" FIELD="ToxCategory" Runat="server" 
        ID="ToxCategory_3" LookupCode="ToxCategory,Disease,Spine" DropDownHeight="150px"/></td>
    <td align="center"><euc:EformDropDownList RecordId="3" width="65px" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" 
        ID="ToxGrade_3" LookupCode="ToxGrade" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformTextBox RecordId="3" width="80px" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" 
        ID="ToxNotes_3" ShowTextEditor="true" MaxLength="1000"/></td>
    <td align="center"><euc:EformDropDownList RecordId="3" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
        ID="ToxQuality_3" LookupCode="DataQuality" width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none">
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="4" ID="ToxDateText_4" TABLE="Toxicities" FIELD="ToxDateText" 
            ShowCalendar="True" CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="4" TABLE="Toxicities" Field="ToxDate" Runat="server" ID="ToxDate_4" />
    </td>
    <td align="center"><euc:EformComboBox RecordId="4" width="100px" TABLE="Toxicities" FIELD="ToxName" Runat="server" 
        ID="ToxName_4" LookupCode="ToxName_Complication" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformDropDownList RecordId="4" width="65px" TABLE="Toxicities" FIELD="ToxClass" Runat="server" 
        ID="ToxClass_4" LookupCode="ToxClass" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="4" width="80px" TABLE="Toxicities" FIELD="ToxCategory" Runat="server" 
        ID="ToxCategory_4" LookupCode="ToxCategory,Disease,Spine" DropDownHeight="150px"/></td>
    <td align="center"><euc:EformDropDownList RecordId="4" width="65px" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" 
        ID="ToxGrade_4" LookupCode="ToxGrade" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformTextBox RecordId="4" width="80px" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" 
        ID="ToxNotes_4" ShowTextEditor="true" MaxLength="1000"/></td>
    <td align="center"><euc:EformDropDownList RecordId="4" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
        ID="ToxQuality_4" LookupCode="DataQuality" width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none">
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="5" ID="ToxDateText_5" TABLE="Toxicities" FIELD="ToxDateText" 
            ShowCalendar="True" CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="5" TABLE="Toxicities" Field="ToxDate" Runat="server" ID="ToxDate_5" />
    </td>
    <td align="center"><euc:EformComboBox RecordId="5" width="100px" TABLE="Toxicities" FIELD="ToxName" Runat="server" 
        ID="ToxName_5" LookupCode="ToxName_Complication" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformDropDownList RecordId="5" width="65px" TABLE="Toxicities" FIELD="ToxClass" Runat="server" 
        ID="ToxClass_5" LookupCode="ToxClass" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="5" width="80px" TABLE="Toxicities" FIELD="ToxCategory" Runat="server" 
        ID="ToxCategory_5" LookupCode="ToxCategory,Disease,Spine" DropDownHeight="150px"/></td>
    <td align="center"><euc:EformDropDownList RecordId="5" width="65px" TABLE="Toxicities" FIELD="ToxGrade" Runat="server" 
        ID="ToxGrade_5" LookupCode="ToxGrade" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformTextBox RecordId="5" width="80px" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" 
        ID="ToxNotes_5" ShowTextEditor="true" MaxLength="1000"/></td>
    <td align="center"><euc:EformDropDownList RecordId="5" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
        ID="ToxQuality_5" LookupCode="DataQuality" width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SpineToxTbl');" /><br />
</td></tr></table><br /><br />