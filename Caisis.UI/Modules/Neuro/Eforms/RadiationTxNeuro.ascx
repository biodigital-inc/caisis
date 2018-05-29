<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.RadiationTxNeuro" CodeFile="RadiationTxNeuro.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.NeuroRadTxHtmlTable = "NeuroRadTxHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="RadiationTxNeuro" /><span class="controlBoxTitle">Radiation Therapy</span><br />  
<table border="0" cellspacing="0" cellpadding="16" width="350" class="eformXLargePopulatedTable">
    <tr >
        <td style="white-space:nowrap; width:20%"><strong>Radiation Therapy done ?</strong></td>
	    <td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="RadTxDone" id="RadTxDone" runat="server" 
	        RepeatLayout="Table" RepeatDirection="Horizontal" >
		        <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
		    </euc:EformRadioButtonList></td>
  </tr>

    <tr id="NeuroRadTxDetails" style="display:none;" runat="server">
        <td colspan="2">
        <table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <table width="750" cellpadding="13" cellspacing="0" class="ClinicalEformTable" id="PrevNeuroRadTxTable">
                <tr id="NoNeuroRadTxMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Radiation Therapies were recorded for this patient.
                    </td>
                </tr>
            </table>
            
            <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 150px; width:1150; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="1140" cellpadding="1" cellspacing="0" class="ClinicalEformTable" id="NeuroRadTxRptTable">
        <asp:Repeater ID="NeuroRadTxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
        <HeaderTemplate>
            <tr runat="server" id="PrevNeuroRadTxRptHdr"> 
                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">StartDate</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">StopDate</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Primary<br />Disease</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Targeted<br />Site</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Total<br />Dose</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Units</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fractions</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data<br />Qlty</td>
	            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
        </HeaderTemplate>
	    <ItemTemplate> 
		    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# Eval("RadiationTherapyId") %>, 'RadTxPending,RadTxDateText,RadTxDate,RadTxStopDateText,RadTxStopDate,RadTxType,RadTxDisease,RadTxSite,RadTxTotalDose,RadTxUnits,RadTxTarget,RadTxNumFractions,RadTxPhysician,RadTxInstitution,RadTxNotes,RadTxQuality', 'RadiationTherapy');"> 
		        <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxPending").ToString() == "1" ? "Yes" : "No"  %></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxDateText") %></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxStopDateText")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxType") %></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxDisease") %></td>			    
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxSite") %></td>
		        <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxTotalDose") %></td>
		        <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxUnits")%></td>		    
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxTarget") %></td>			
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxNumFractions")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxPhysician")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxInstitution").ToString() == "Memorial Sloan Kettering Cancer Center" ? "MSKCC" : Eval("RadTxInstitution").ToString()%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxNotes")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("RadTxQuality")%></td>
			    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."></td>
		    </tr>      
	    </ItemTemplate>
      </asp:Repeater> 
      </table></div><br /><br />
      
        <table cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="NeuroRadTxHtmlTable">
            <tr runat="server" id="NeuroRadTxHdr"> 
                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">StartDate</td>
		        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">StopDate</td>
		        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Primary<br />Disease</td>
	            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Targeted<br />Site</td>
		        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Total<br />Dose</td>
		        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Units</td>
		        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target</td>
		        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Fractions</td>
		        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>
                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
		        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data<br />Qlty</td>
		        <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
      
            <tr id="RadTxHtmlRow1">
                <td align="center"><euc:EformCheckBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxPending" 
                    Runat="server" ID="RadTxPending_1" Value="1" /></td>
                <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_1"/>
		        <euc:EformHidden RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_1"/>
                </td>
                <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" TABLE="RadiationTherapy" 
                        FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_1"/>
		            <euc:EformHidden RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_1"/>
	            </td>
	            <td align="center"><euc:EformComboBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_1" 
                    LookupCode="RadTxType" Width="70px"/></td>
                <td align="center"><euc:EformComboBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_1" 
                    LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
                 <td align="center"><euc:EformComboBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxSite" Runat="server" 
                    ID="RadTxSite_1" LookupCode="RadTxSite" style="width:70px;"/></td>
                 <td align="center"><euc:EformTextBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                        ID="RadTxTotalDose_1"  Width="40px" /></td>
                <td align="center"><euc:EformDropDownList RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_1" 
                    LookupCode="RadTxUnits" Width="50px"/></td>
                <td><euc:EformComboBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_1" 
                    LookupCode="RadTxTarget" Width="70px"/></td>
                <td align="center"><euc:EformTextBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" 
                    ID="RadTxNumFractions_1"  Width="40px" /></td>
                <td ><euc:EformComboBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxPhysician" Runat="server" ID="RadTxPhysician_1" 
                    LookupCode="RadiationOncologist,Disease,Neuro" Width="80px" DropDownWidth="250px"/></td>
                <td align="center"><euc:EformComboBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                    ID="RadTxInstitution_1" LookupCode="Institution" Width="80px"/></td>
                <td align="center"><euc:EformTextBox RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                    ID="RadTxNotes_1" ShowTextEditor="true" Width="70px" MaxLength="1000"/></td>
                <td align="center"><euc:EformDropDownList RecordId="1" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_1" 
                    LookupCode="DataQuality" /></td>
                <td><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
            
            <tr id="RadTxHtmlRow2" style="DISPLAY: none">
                <td align="center"><euc:EformCheckBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxPending" 
                    Runat="server" ID="RadTxPending_2" Value="1" /></td>
                <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_2"/>
		        <euc:EformHidden RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_2"/>
                </td>
                <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" TABLE="RadiationTherapy" 
                        FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_2"/>
		            <euc:EformHidden RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_2"/>
	            </td>
	            <td align="center"><euc:EformComboBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_2" 
                    LookupCode="RadTxType" Width="70px"/></td>
                <td align="center"><euc:EformComboBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_2" 
                    LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
                 <td align="center"><euc:EformComboBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxSite" Runat="server" 
                    ID="RadTxSite_2" LookupCode="RadTxSite" style="width:70px;"/></td>
                 <td align="center"><euc:EformTextBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                        ID="RadTxTotalDose_2"  Width="40px" /></td>
                <td align="center"><euc:EformDropDownList RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_2" 
                    LookupCode="RadTxUnits" Width="50px"/></td>
                <td><euc:EformComboBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_2" 
                    LookupCode="RadTxTarget" Width="70px"/></td>
                <td align="center"><euc:EformTextBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" 
                    ID="RadTxNumFractions_2"  Width="40px" /></td>
                <td ><euc:EformComboBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxPhysician" Runat="server" ID="RadTxPhysician_2" 
                    LookupCode="RadiationOncologist,Disease,Neuro" Width="80px" DropDownWidth="250px"/></td>
                <td align="center"><euc:EformComboBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                    ID="RadTxInstitution_2" LookupCode="Institution" Width="80px"/></td>
                <td align="center"><euc:EformTextBox RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                    ID="RadTxNotes_2" ShowTextEditor="true" Width="70px" MaxLength="1000"/></td>
                <td align="center"><euc:EformDropDownList RecordId="2" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_2" 
                    LookupCode="DataQuality" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
            
            <tr id="RadTxHtmlRow3" style="DISPLAY: none">
                <td align="center"><euc:EformCheckBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxPending" 
                    Runat="server" ID="RadTxPending_3" Value="1" /></td>
                <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_3"/>
		        <euc:EformHidden RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_3"/>
                </td>
                <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" TABLE="RadiationTherapy" 
                        FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_3"/>
		            <euc:EformHidden RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_3"/>
	            </td>
	            <td align="center"><euc:EformComboBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_3" 
                    LookupCode="RadTxType" Width="70px"/></td>
                <td align="center"><euc:EformComboBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_3" 
                    LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
                 <td align="center"><euc:EformComboBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxSite" Runat="server" 
                    ID="RadTxSite_3" LookupCode="RadTxSite" style="width:70px;"/></td>
                 <td align="center"><euc:EformTextBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                        ID="RadTxTotalDose_3"  Width="40px" /></td>
                <td align="center"><euc:EformDropDownList RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_3" 
                    LookupCode="RadTxUnits" Width="50px"/></td>
                <td><euc:EformComboBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_3" 
                    LookupCode="RadTxTarget" Width="70px"/></td>
                <td align="center"><euc:EformTextBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" 
                    ID="RadTxNumFractions_3"  Width="40px" /></td>
                <td ><euc:EformComboBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxPhysician" Runat="server" ID="RadTxPhysician_3" 
                    LookupCode="RadiationOncologist,Disease,Neuro" Width="80px" DropDownWidth="250px"/></td>
                <td align="center"><euc:EformComboBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                    ID="RadTxInstitution_3" LookupCode="Institution" Width="80px"/></td>
                <td align="center"><euc:EformTextBox RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                    ID="RadTxNotes_3" ShowTextEditor="true" Width="70px" MaxLength="1000"/></td>
                <td align="center"><euc:EformDropDownList RecordId="3" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_3" 
                    LookupCode="DataQuality" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
            
            <tr id="RadTxHtmlRow4" style="DISPLAY: none">
                <td align="center"><euc:EformCheckBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxPending" 
                    Runat="server" ID="RadTxPending_4" Value="1" /></td>
                <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_4"/>
		        <euc:EformHidden RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_4"/>
                </td>
                <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" TABLE="RadiationTherapy" 
                        FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_4"/>
		            <euc:EformHidden RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_4"/>
	            </td>
	            <td align="center"><euc:EformComboBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_4" 
                    LookupCode="RadTxType" Width="70px"/></td>
                <td align="center"><euc:EformComboBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_4" 
                    LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
                 <td align="center"><euc:EformComboBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxSite" Runat="server" 
                    ID="RadTxSite_4" LookupCode="RadTxSite" style="width:70px;"/></td>
                 <td align="center"><euc:EformTextBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                        ID="RadTxTotalDose_4"  Width="40px" /></td>
                <td align="center"><euc:EformDropDownList RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_4" 
                    LookupCode="RadTxUnits" Width="50px"/></td>
                <td><euc:EformComboBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_4" 
                    LookupCode="RadTxTarget" Width="70px"/></td>
                <td align="center"><euc:EformTextBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" 
                    ID="RadTxNumFractions_4"  Width="40px" /></td>
                <td ><euc:EformComboBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxPhysician" Runat="server" ID="RadTxPhysician_4" 
                    LookupCode="RadiationOncologist,Disease,Neuro" Width="80px" DropDownWidth="250px"/></td>
                <td align="center"><euc:EformComboBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                    ID="RadTxInstitution_4" LookupCode="Institution" Width="80px"/></td>
                <td align="center"><euc:EformTextBox RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                    ID="RadTxNotes_4" ShowTextEditor="true" Width="70px" MaxLength="1000"/></td>
                <td align="center"><euc:EformDropDownList RecordId="4" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_4" 
                    LookupCode="DataQuality" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
            
            <tr id="RadTxHtmlRow5" style="DISPLAY: none">
                <td align="center"><euc:EformCheckBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxPending" 
                    Runat="server" ID="RadTxPending_5" Value="1" /></td>
                <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_5"/>
		        <euc:EformHidden RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_5"/>
                </td>
                <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" TABLE="RadiationTherapy" 
                        FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_5"/>
		            <euc:EformHidden RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_5"/>
	            </td>
	            <td align="center"><euc:EformComboBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_5" 
                    LookupCode="RadTxType" Width="70px"/></td>
                <td align="center"><euc:EformComboBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_5" 
                    LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
                 <td align="center"><euc:EformComboBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxSite" Runat="server" 
                    ID="RadTxSite_5" LookupCode="RadTxSite" style="width:70px;"/></td>
                 <td align="center"><euc:EformTextBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                        ID="RadTxTotalDose_5"  Width="40px" /></td>
                <td align="center"><euc:EformDropDownList RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_5" 
                    LookupCode="RadTxUnits" Width="50px"/></td>
                <td><euc:EformComboBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_5" 
                    LookupCode="RadTxTarget" Width="70px"/></td>
                <td align="center"><euc:EformTextBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" 
                    ID="RadTxNumFractions_5"  Width="40px" /></td>
                <td ><euc:EformComboBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxPhysician" Runat="server" ID="RadTxPhysician_5" 
                    LookupCode="RadiationOncologist,Disease,Neuro" Width="80px" DropDownWidth="250px"/></td>
                <td align="center"><euc:EformComboBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                    ID="RadTxInstitution_5" LookupCode="Institution" Width="80px"/></td>
                <td align="center"><euc:EformTextBox RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                    ID="RadTxNotes_5" ShowTextEditor="true" Width="70px" MaxLength="1000"/></td>
                <td align="center"><euc:EformDropDownList RecordId="5" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_5" 
                    LookupCode="DataQuality" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
            
            <tr id="RadTxHtmlRow6" style="DISPLAY: none">
                <td align="center"><euc:EformCheckBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxPending" 
                    Runat="server" ID="RadTxPending_6" Value="1" /></td>
                <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="6" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_6"/>
		        <euc:EformHidden RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_6"/>
                </td>
                <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="6" TABLE="RadiationTherapy" 
                        FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_6"/>
		            <euc:EformHidden RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_6"/>
	            </td>
	            <td align="center"><euc:EformComboBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_6" 
                    LookupCode="RadTxType" Width="70px"/></td>
                <td align="center"><euc:EformComboBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_6" 
                    LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
                 <td align="center"><euc:EformComboBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxSite" Runat="server" 
                    ID="RadTxSite_6" LookupCode="RadTxSite" style="width:70px;"/></td>
                 <td align="center"><euc:EformTextBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                        ID="RadTxTotalDose_6"  Width="40px" /></td>
                <td align="center"><euc:EformDropDownList RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_6" 
                    LookupCode="RadTxUnits" Width="50px"/></td>
                <td><euc:EformComboBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_6" 
                    LookupCode="RadTxTarget" Width="70px"/></td>
                <td align="center"><euc:EformTextBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" 
                    ID="RadTxNumFractions_6"  Width="40px" /></td>
                <td ><euc:EformComboBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxPhysician" Runat="server" ID="RadTxPhysician_6" 
                    LookupCode="RadiationOncologist,Disease,Neuro" Width="80px" DropDownWidth="250px"/></td>
                <td align="center"><euc:EformComboBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                    ID="RadTxInstitution_6" LookupCode="Institution" Width="80px"/></td>
                <td align="center"><euc:EformTextBox RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                    ID="RadTxNotes_6" ShowTextEditor="true" Width="70px" MaxLength="1000"/></td>
                <td align="center"><euc:EformDropDownList RecordId="6" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_6" 
                    LookupCode="DataQuality" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
            
            <tr id="RadTxHtmlRow7" style="DISPLAY: none">
                <td align="center"><euc:EformCheckBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxPending" 
                    Runat="server" ID="RadTxPending_7" Value="1" /></td>
                <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="7" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_7"/>
		        <euc:EformHidden RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_7"/>
                </td>
                <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="7" TABLE="RadiationTherapy" 
                        FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_7"/>
		            <euc:EformHidden RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_7"/>
	            </td>
	            <td align="center"><euc:EformComboBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_7" 
                    LookupCode="RadTxType" Width="70px"/></td>
                <td align="center"><euc:EformComboBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_7" 
                    LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
                 <td align="center"><euc:EformComboBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxSite" Runat="server" 
                    ID="RadTxSite_7" LookupCode="RadTxSite" style="width:70px;"/></td>
                 <td align="center"><euc:EformTextBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                        ID="RadTxTotalDose_7"  Width="40px" /></td>
                <td align="center"><euc:EformDropDownList RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_7" 
                    LookupCode="RadTxUnits" Width="50px"/></td>
                <td><euc:EformComboBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_7" 
                    LookupCode="RadTxTarget" Width="70px"/></td>
                <td align="center"><euc:EformTextBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" 
                    ID="RadTxNumFractions_7"  Width="40px" /></td>
                <td ><euc:EformComboBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxPhysician" Runat="server" ID="RadTxPhysician_7" 
                    LookupCode="RadiationOncologist,Disease,Neuro" Width="80px" DropDownWidth="250px"/></td>
                <td align="center"><euc:EformComboBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                    ID="RadTxInstitution_7" LookupCode="Institution" Width="80px"/></td>
                <td align="center"><euc:EformTextBox RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                    ID="RadTxNotes_7" ShowTextEditor="true" Width="70px" MaxLength="1000"/></td>
                <td align="center"><euc:EformDropDownList RecordId="7" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_7" 
                    LookupCode="DataQuality" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
            
            <tr id="RadTxHtmlRow8" style="DISPLAY: none">
                <td align="center"><euc:EformCheckBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxPending" 
                    Runat="server" ID="RadTxPending_8" Value="1" /></td>
                <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="8" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_8"/>
		        <euc:EformHidden RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_8"/>
                </td>
                <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="8" TABLE="RadiationTherapy" 
                        FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_8"/>
		            <euc:EformHidden RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_8"/>
	            </td>
	            <td align="center"><euc:EformComboBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_8" 
                    LookupCode="RadTxType" Width="70px"/></td>
                <td align="center"><euc:EformComboBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_8" 
                    LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
                 <td align="center"><euc:EformComboBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxSite" Runat="server" 
                    ID="RadTxSite_8" LookupCode="RadTxSite" style="width:70px;"/></td>
                 <td align="center"><euc:EformTextBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                        ID="RadTxTotalDose_8"  Width="40px" /></td>
                <td align="center"><euc:EformDropDownList RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_8" 
                    LookupCode="RadTxUnits" Width="50px"/></td>
                <td><euc:EformComboBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_8" 
                    LookupCode="RadTxTarget" Width="70px"/></td>
                <td align="center"><euc:EformTextBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" 
                    ID="RadTxNumFractions_8"  Width="40px" /></td>
                <td ><euc:EformComboBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxPhysician" Runat="server" ID="RadTxPhysician_8" 
                    LookupCode="RadiationOncologist,Disease,Neuro" Width="80px" DropDownWidth="250px"/></td>
                <td align="center"><euc:EformComboBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                    ID="RadTxInstitution_8" LookupCode="Institution" Width="80px"/></td>
                <td align="center"><euc:EformTextBox RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                    ID="RadTxNotes_8" ShowTextEditor="true" Width="70px" MaxLength="1000"/></td>
                <td align="center"><euc:EformDropDownList RecordId="8" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_8" 
                    LookupCode="DataQuality" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
            
            <tr id="RadTxHtmlRow9" style="DISPLAY: none">
                <td align="center"><euc:EformCheckBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxPending" 
                    Runat="server" ID="RadTxPending_9" Value="1" /></td>
                <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="9" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_9"/>
		        <euc:EformHidden RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_9"/>
                </td>
                <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="9" TABLE="RadiationTherapy" 
                        FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_9"/>
		            <euc:EformHidden RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_9"/>
	            </td>
	            <td align="center"><euc:EformComboBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_9" 
                    LookupCode="RadTxType" Width="70px"/></td>
                <td align="center"><euc:EformComboBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_9" 
                    LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
                 <td align="center"><euc:EformComboBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxSite" Runat="server" 
                    ID="RadTxSite_9" LookupCode="RadTxSite" style="width:70px;"/></td>
                 <td align="center"><euc:EformTextBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                        ID="RadTxTotalDose_9"  Width="40px" /></td>
                <td align="center"><euc:EformDropDownList RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_9" 
                    LookupCode="RadTxUnits" Width="50px"/></td>
                <td><euc:EformComboBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_9" 
                    LookupCode="RadTxTarget" Width="70px"/></td>
                <td align="center"><euc:EformTextBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" 
                    ID="RadTxNumFractions_9"  Width="40px" /></td>
                <td ><euc:EformComboBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxPhysician" Runat="server" ID="RadTxPhysician_9" 
                    LookupCode="RadiationOncologist,Disease,Neuro" Width="80px" DropDownWidth="250px"/></td>
                <td align="center"><euc:EformComboBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                    ID="RadTxInstitution_9" LookupCode="Institution" Width="80px"/></td>
                <td align="center"><euc:EformTextBox RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                    ID="RadTxNotes_9" ShowTextEditor="true" Width="70px" MaxLength="1000"/></td>
                <td align="center"><euc:EformDropDownList RecordId="9" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_9" 
                    LookupCode="DataQuality" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
            
            <tr id="RadTxHtmlRow10" style="DISPLAY: none">
                <td align="center"><euc:EformCheckBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxPending" 
                    Runat="server" ID="RadTxPending_10" Value="1" /></td>
                <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="10" TABLE="RadiationTherapy" 
                    FIELD="RadTxDateText" Runat="server" ID="RadTxDateText_10"/>
		        <euc:EformHidden RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxDate" Runat="server" ID="RadTxDate_10"/>
                </td>
                <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="10" TABLE="RadiationTherapy" 
                        FIELD="RadTxStopDateText" Runat="server" ID="RadTxStopDateText_10"/>
		            <euc:EformHidden RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxStopDate" Runat="server" ID="RadTxStopDate_10"/>
	            </td>
	            <td align="center"><euc:EformComboBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_10" 
                    LookupCode="RadTxType" Width="70px"/></td>
                <td align="center"><euc:EformComboBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxDisease" Runat="server" ID="RadTxDisease_10" 
                    LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
                 <td align="center"><euc:EformComboBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxSite" 
                    Runat="server" ID="RadTxSite_10" LookupCode="RadTxSite" style="width:70px;"/></td>
                 <td align="center"><euc:EformTextBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxTotalDose" Runat="server" 
                        ID="RadTxTotalDose_10"  Width="40px" /></td>
                <td align="center"><euc:EformDropDownList RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" ID="RadTxUnits_10" 
                    LookupCode="RadTxUnits" Width="50px"/></td>
                <td><euc:EformComboBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxTarget" Runat="server" ID="RadTxTarget_10" 
                    LookupCode="RadTxTarget" Width="70px"/></td>
                <td align="center"><euc:EformTextBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" 
                    ID="RadTxNumFractions_10"  Width="40px" /></td>
                <td ><euc:EformComboBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxPhysician" Runat="server" ID="RadTxPhysician_10" 
                    LookupCode="RadiationOncologist,Disease,Neuro" Width="80px" DropDownWidth="250px"/></td>
                <td align="center"><euc:EformComboBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxInstitution" Runat="server" 
                    ID="RadTxInstitution_10" LookupCode="Institution" Width="80px"/></td>
                <td align="center"><euc:EformTextBox RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxNotes" Runat="server" 
                    ID="RadTxNotes_10" ShowTextEditor="true" Width="70px" MaxLength="1000"/></td>
                <td align="center"><euc:EformDropDownList RecordId="10" TABLE="RadiationTherapy" FIELD="RadTxQuality" Runat="server" ID="RadTxQuality_10" 
                    LookupCode="DataQuality" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'NeuroRadTxHtmlTable');" /><br />
        </td></tr></table>
        </td>
    </tr>
    
    <tr id="RadTxAbsentRow" style="display:none;" runat="server">
        <td colspan="2"> 
      <table cellpadding="3" cellspacing="0" class="ClinicalEformTable">
          <tr id="RadTxAbsentHdrTR" runat="server"> 
            <td  class="controlBoxDataGridTitleColumn">Absent Date</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Table</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Field</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Value</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Reason</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
        </tr>
        <tr id="RadTxAbsentHTMLTR">
            <td><asp:HiddenField ID="RadTxAbsEvntDt" runat="server" />
                <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_1"
                    runat="server" Width="100px" ShowCalendar="true" AppendToOnChange="UpdateAssociatedDate(this);" />
                <euc:EformHidden RecordId="1" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_1"
                    Runat="server"/></td>
            <td><euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="TableName" ID="TableName_1"
                    runat="server" Width="110px" /></td>
            <td><euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldName" ID="FieldName_1"
                    runat="server" Width="90px" /></td>
            <td><euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_1"
                    runat="server" Width="110px" /></td>
            <td><euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_1"
                    runat="server" Width="100px" /></td>
            <td><euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_1"
                    runat="server" Width="80px" /></td>
        </tr>
        </table>
        </td>
    </tr>
</table><br /><br />



<script type="text/javascript">
   
    //Adds events for radTx   
    addRadTxEvent($('<%= RadTxDone.ClientID %>'),$('<%= NeuroRadTxDetails.ClientID %>'),$('<%= RadTxAbsentRow.ClientID %>'),$('<%= AbsentDateText_1.ClientID %>'),$('<%= AbsentDate_1.ClientID %>'),$('<%= TableName_1.ClientID %>'),$('<%= FieldName_1.ClientID %>'),$('<%= FieldValue_1.ClientID %>'),$('<%= AbsentReason_1.ClientID %>'),$('<%= AbsentQuality_1.ClientID %>'),$('<%= RadTxAbsEvntDt.ClientID %>'));
    
    function addRadTxEvent(RadTxYesNoID,RadTxTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt)
    {  
        $(RadTxYesNoID).addEvent('click',curry(RadTxHxYesNo,RadTxYesNoID,RadTxTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt));

        // check on load as well
        RadTxHxYesNo(RadTxYesNoID,RadTxTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt);
    }
   
    function RadTxHxYesNo(RadTxYesNoID,RadTxTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt)
    {
       var RadTxYesNoRef = RadTxYesNoID.getElementsByTagName('input');
       
       for (var i = 0; i < RadTxYesNoRef.length; i++) 
        if (RadTxYesNoRef[i].checked) 
        {  
            RadTxHxRadioClick(RadTxYesNoRef[i].value,RadTxTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt);
        }
    }
    
    function RadTxHxRadioClick(RadTxoption_value,RadTxhideTR,RadTxAbsentHideTR,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt)
    {
      if (RadTxoption_value == "Yes")
      { 
        RadTxhideTR.style.display='block';
        
        RadTxAbsentHideTR.style.display='none';
        
        //clears absent event data
        clearElementsInParentRow(document.getElementById('RadTxAbsentHTMLTR'));
        
      } 
      else if (RadTxoption_value == "No")
      {
        RadTxhideTR.style.display='none';
        
        RadTxAbsentHideTR.style.display='block';
        
        //clears all rows data
        for(var i=1;i<=10;i++)
        {
            clearElementsInParentRow(document.getElementById('RadTxHtmlRow'+i));
        }
        
        dateTextFieldId.value = HiddenDt.value;
        dateFieldId.value = HiddenDt.value;
        tableId.value = 'RadiationTherapy';
        fieldId.value = 'RadTxType';
        fieldValueId.value = 'Radiation Therapy';
        reasonId.value = 'Not Performed';
        qltyId.value = 'STD';
      }
    }
    
</script>