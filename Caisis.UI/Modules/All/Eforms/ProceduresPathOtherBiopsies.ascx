<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ProceduresPathOtherBiopsies" CodeFile="ProceduresPathOtherBiopsies.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.Pathology = "Pathology";
	tableArray.BiopsyPath = "BiopsyPath";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="ProceduresPathOtherBiopsies" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=">Pathology Report"></asp:Label><br/>
<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="Pathology" > 


          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Path Report Date</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Path #</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Pathologist </td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          <tr>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="2"   TABLE="Pathology" FIELD="PathDateText" ID="PathDateText" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                 RecordId="2"   TABLE="Pathology" FIELD="PathDate"     ID="PathDate"     Runat="server"/></td>
            <td>
                <euc:EformTextBox  Width="100px" RecordId="2"   TABLE="Pathology" FIELD="PathNum" ID="PathNum" Runat="server" TabIndex="2"  ShowCalendar="false" CalcDate="false"  /></td>
            <td>
                <euc:EformComboBox Width="100px" RecordId="2"  TABLE="Pathology" FIELD="Pathologist" ID="Pathologist"   LookupCode="Pathologist"   Runat="server" TabIndex="3"  /> </td>
          </tr>
 
</table>
<br /><br /><br />

<span class="controlBoxTitle">Biopsy Pathology</span><br/>
<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="BiopsyPath" > 


          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Vascular Invasion </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Perineural Invasion </td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
          <tr>
            <td>
                <euc:EformSelect  Width="80px" RecordId="1" ParentRecordId="2"  TABLE="BiopsyPath" FIELD="PathPerineuralInv" ID="PathPerineuralInv" LookupCode="YesNoUnknown" Runat="server" TabIndex="4" /></td>
            <td>
                <euc:EformSelect  Width="80px" RecordId="1" ParentRecordId="2"  TABLE="BiopsyPath" FIELD="PathVascularInv" ID="PathVascularInv" LookupCode="YesNoUnknown" Runat="server" TabIndex="5" /></td>
          </tr>
 
</table>
<br /><br /><br />


