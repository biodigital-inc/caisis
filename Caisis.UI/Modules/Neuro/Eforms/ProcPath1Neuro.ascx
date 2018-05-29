<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.ProcPath1Neuro" CodeFile="ProcPath1Neuro.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.PathTestTbl1 = "PathTestTbl1";
    tableArray.PathTestTbl2 = "PathTestTbl2";
    tableArray.PathTestTbl3 = "PathTestTbl3";
    
     function updateDatesProc1()
     {
        document.getElementById('<%= OpDateText_1.ClientID %>').value = document.getElementById('<%= ProcDateText_1.ClientID %>').value;
        document.getElementById('<%= OpDate_1.ClientID %>').value = document.getElementById('<%= ProcDate_1.ClientID %>').value;
     }	 
	function updateOpSurgProc1()
	{
	    document.getElementById('<%= OpCaseSurgeon_1.ClientID %>').value = document.getElementById('<%= ProcSurgeon_1.ClientID %>').value;
	}
	function updateOpInstProc1()
	{
        document.getElementById('<%= OpInstitution_1.ClientID %>').value=document.getElementById('<%= ProcInstitution_1.ClientID %>').value;
	}
	function updateOpServiceProc1()
	{
        document.getElementById('<%= OpService_1.ClientID %>').value=document.getElementById('<%= ProcService_1.ClientID %>').value;
	}
	function updateOpQltyProc1()
	{
        document.getElementById('<%= OpQuality_1.ClientID %>').value=document.getElementById('<%= ProcQuality_1.ClientID %>').value;
	}
	function updateDatesProc2()
    {
       document.getElementById('<%= OpDateText_2.ClientID %>').value = document.getElementById('<%= ProcDateText_2.ClientID %>').value;
       document.getElementById('<%= OpDate_2.ClientID %>').value = document.getElementById('<%= ProcDate_2.ClientID %>').value;
    }	 
	function updateOpSurgProc2()
	{
	    document.getElementById('<%= OpCaseSurgeon_2.ClientID %>').value = document.getElementById('<%= ProcSurgeon_2.ClientID %>').value;
	}
	function updateOpInstProc2()
	{
        document.getElementById('<%= OpInstitution_2.ClientID %>').value=document.getElementById('<%= ProcInstitution_2.ClientID %>').value;
	}
	function updateOpServiceProc2()
	{
        document.getElementById('<%= OpService_2.ClientID %>').value=document.getElementById('<%= ProcService_2.ClientID %>').value;
	}
	function updateOpQltyProc2()
	{
	    document.getElementById('<%= OpQuality_2.ClientID %>').value=document.getElementById('<%= ProcQuality_2.ClientID %>').value;
	}
	
	
	
	function showPathTests(dtTextId, histologyId, tblId)
	{
	    if($(dtTextId).value!="" || $(histologyId).value!="")
	    {
	        $(tblId).style.display='block';
	    }
	}
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ProcPath1Neuro" />
<table border="0" cellspacing="0" cellpadding="8" width="350" class="eformXLargePopulatedTable">
    
    <tr>
        <td colspan="2">
        <span><strong>Prior Procedures</strong></span> <br/>
        <table width="650" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PrevSpineProcTable">
                <tr id="NoSpineProcMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Procedures were recorded for this patient.
                    </td>
                </tr>
              </table>
        
        <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 150px; width:900px; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="900px" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="SpineProcRptTable">        
        <asp:Repeater ID="SpineProcRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
        <HeaderTemplate>
            <tr runat="server" id="PrevSpineProcRptHdr"> 
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
	            <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Procedure</td>
	            <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Service</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Surgeon</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Side</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Site</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">CPT Code</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
	            <td height="10%" class="controlBoxDataGridTitleColumn">&nbsp;</td>
            </tr>
        </HeaderTemplate>
	    <ItemTemplate> 
		    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Procedures', <%# Eval("ProcedureId") %>, 'ProcDateText,ProcDate,ProcName,ProcService,ProcSurgeon,ProcSide,ProcSite,ProcCPT_Code,ProcInstitution,ProcQuality', 'Procedures');"> 
			    <td class="ClinicalEformPopulatedColumn"><%# Eval("ProcDateText")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcName")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcService")%></td>
		        <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcSurgeon")%></td>
		        <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcSide")%></td>		    
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcSite")%></td>			
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcCPT_Code")%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcInstitution").ToString() == "Memorial Sloan Kettering Cancer Center" ? "MSKCC" : Eval("ProcInstitution").ToString()%></td>
			    <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ProcQuality")%></td>
			    <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."></td>
		    </tr>      
	    </ItemTemplate>
      </asp:Repeater> 
      </table></div>
      </td>
    </tr>
    <tr >
        <td style="white-space:nowrap; width:20%"><strong>Any new Procedures to capture ?</strong></td>
	    <td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="ProcDone" id="ProcDone" runat="server" 
	        RepeatLayout="Table" RepeatDirection="Horizontal" >
		        <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
		    </euc:EformRadioButtonList></td>
    </tr>
    <tr id="NeuroProcDetails" style="display:none;" runat="server">
        <td colspan="2">

<table width="650" border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable">
    <tr>
        <td>
            <table width="650" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="NeuroProcTable">
            <tr><td colspan="11"><span><strong>Procedure</strong></span></td></tr>
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Procedure</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Service</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Surgeon</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">CPT Code</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">CPT Description</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>   
  <tr id="ProcHTMLRow1">
	<td style="text-align: left;">
        <euc:EformTextBox  Width="75px" RecordId="1" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_1" Runat="server"  
            ShowCalendar="true" CalcDate="true"  AppendToOnChange="UpdateAssociatedDate(this); updateDatesProc1();" />
	    <euc:EformHidden  RecordId="1" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_1" Runat="server"/>	    	    
    	
	    <euc:EformTextBox RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_1" Runat="server" 
	        style="display:none;width:1px;"/>
	    <euc:EformHidden  RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_1" Runat="server" />
	    <euc:EformTextBox id="OpQuality_1" RecordId="1" Table="OperatingRoomDetails" Field="OpQuality" runat="server" Width="1px" 
	        style="display:none"/>
    </td>
    
    <td style="text-align: center;"><euc:EformComboBox Width="90px" RecordId="1" TABLE="Procedures" FIELD="ProcName" ID="ProcName_1" 
            LookupCode="ProcName,Disease,Neuro" Runat="server" DropDownWidth="200px" /></td>
	<td align="center"><euc:EformComboBox id="ProcService_1" RecordId="1" Table="Procedures" Field="ProcService" runat="server" Width="80px" 
	                        LookupCode="PhSpecialty" onblur="updateOpServiceProc1();" DropDownWidth="200px" />
	                   <euc:EformTextBox id="OpService_1" RecordId="1" Table="OperatingRoomDetails" Field="OpService" runat="server" Width="1px" 
                            style="display:none"/>
    </td>
    <td style="text-align: center;">
        <euc:EformComboBox LookupCode="OpSurgeon,Disease,Neuro" Width="80px" id="ProcSurgeon_1" RecordId="1" Table="Procedures" Field="ProcSurgeon" 
            runat="server" onblur="updateOpSurgProc1();" DropDownWidth="200px"/>
        <euc:EformTextBox id="OpCaseSurgeon_1" RecordId="1" Table="OperatingRoomDetails" Field="OpCaseSurgeon" runat="server" Width="1px" 
            style="display:none"/>
    </td>
    <td style="text-align: center;"><euc:EformComboBox RecordId="1" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_1" 
        LookupCode="OpSide" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px" /> </td>
    <td style="text-align: center;"><euc:EformComboBox RecordId="1"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_1" LookupCode="DxTarget,Disease,Neuro" Runat="server" style="width:60px" DropDownWidth="200px"/> </td>
    <td align="center"><euc:EformTextBox Width="60px" ID="ProcCPT_Code_1" RecordId="1" Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
    <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_1" RecordId="1" Table="Procedures" Field="ProcCPT_Description" 
        runat="server" ShowTextEditor="true" /></td>
    <td><euc:EformComboBox id="ProcInstitution_1" RecordId="1" Table="Procedures" Field="ProcInstitution" runat="server" Width="80px" 
            LookupCode="Institution" onblur="updateOpInstProc1();" />
        <euc:EformTextBox id="OpInstitution_1" RecordId="1" Table="OperatingRoomDetails" Field="OpInstitution" runat="server" Width="1px" 
            style="display:none"/>
    </td>
	<td align="center"><euc:EformDropDownList id="ProcQuality_1" RecordId="1" Table="Procedures" Field="ProcQuality" runat="server" 
	    LookupCode="DataQuality" onblur="updateOpQltyProc1()" /></td>
    <td><euc:EformDeleteIcon runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  </table><br />

            <%--Pathology--%>
            <table>
                <tr>
                    <td style="padding-left:15px;">
                        <span><strong>Pathology</strong></span> <br/>
                        <table border="0" cellpadding="0" cellspacing="0"  class="eformLargePopulatedTable">
                <tr>
                    <td>
                        <table width="650" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="NeuroPathTable1">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Histology</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Secondary<br />Histology</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Path #</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Spec Type</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Pathologist</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>   
  <tr id="PathHTMLRow1">
	<td height="28" class="ClinicalEformGridColumnOne">
	    <euc:EformTextBox  Width="75px" TABLE="Pathology" RecordId="1" FIELD="PathDateText" ID="PathDateText_1" Runat="server" ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="1"   ID="PathDate_1" Runat="server"/> 
    </td> 
    <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology" RecordId="1" ID="PathHistology_1" 
        LookupCode="PathHistologyNeuro" Runat="server" DropDownWidth="350px"/></td> 
    <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology2" RecordId="1" ID="PathHistology2_1" 
        LookupCode="PathHistology" Runat="server" DropDownWidth="350px"/></td>
    <td align="center"><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="1" FIELD="PathNum" ID="PathNum_1" Runat="server" /></td>
    <td align="center"><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="1" FIELD="PathSpecimenType" ID="PathSpecimenType_1" 
        Runat="server" LookupCode="ProcName" /></td>
    <td align="center"><euc:EformComboBox RecordId="1"  TABLE="Pathology" FIELD="PathSide" ID="PathSide_1" LookupCode="NodeSide" 
        Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="1"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_1" 
        LookupCode="DxTarget,Disease,Neuro" Runat="server" style="width:60px" DropDownHeight="100px" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="1" FIELD="Pathologist" ID="Pathologist_1" 
        Runat="server" LookupCode="Pathologist" /></td>
    <td><euc:EformComboBox id="PathInstitution_1" RecordId="1" Table="Pathology" Field="PathInstitution" runat="server" Width="80px" 
        LookupCode="Institution" /></td>
    <td align="center"><euc:EformTextBox  TABLE="Pathology" RecordId="1" FIELD="PathNotes" ID="PathNotes_1" Runat="server" 
        ShowTextEditor="true" MaxLength="8000" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="Pathology" RecordId="1" FIELD="PathQuality" ID="PathQuality_1" Runat="server"
        LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  </table><br />
  
                        <span style="padding-left:20px;"><strong>Pathology Stages</strong></span> <br/>
                        <table border="0" cellpadding="0" cellspacing="0" style="padding-left:20px;">
<tr>
    <td>
  <table width="400" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PathStageGradeTbl1">
    <tr>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Disease</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Grade</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Quality</td>
    </tr>
    <tr id="PathStageHTMLRow1">
        <td align="center"><euc:EformComboBox  TABLE="PathologyStageGrade" RecordId="1" FIELD="PathStageDisease" 
            ID="PathStageDisease_1" LookupCode="ClinStageDisease" Runat="server" Width="100px" /></td>
        <td align="center"><euc:EformComboBox  TABLE="PathologyStageGrade" RecordId="1" FIELD="PathGrade" ID="PathGrade_1" 
            Runat="server" Width="100px" LookupCode="PathGrade,Disease,Neuro" DropDownWidth="200px" /></td>
        <td align="center"><euc:EformDropDownList  TABLE="PathologyStageGrade" RecordId="1" FIELD="PathQuality" ID="PathGradeQuality_1" 
            Runat="server" Width="100px" LookupCode="DataQuality"/></td>
    </tr>
  </table>
  </td>
  </tr></table><br />
  
                        <table id="PathTestTable1" runat="server" style=" display:none;">
    <tr>
        <td style="width:10px;"></td>
        <td><span><strong>Pathology Tests</strong></span> <br/>
            <table width="500" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PathTestTbl1">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Test</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>   
  <tr id="PathTestHTMLRow1">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="1" FIELD="PathDateText" ID="PathTestDateText_1" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="1"   ID="PathTestDate_1" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="1" FIELD="PathTest" ID="PathTest_1" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="1" FIELD="PathResult" ID="PathResult_1" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_1" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="1" FIELD="PathNotes" ID="PathTestNotes_1" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="1" FIELD="PathQuality" ID="PathTestQuality_1" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow2">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="2" FIELD="PathDateText" ID="PathTestDateText_2" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="2"   ID="PathTestDate_2" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="2" FIELD="PathTest" ID="PathTest_2" Runat="server" 
	    LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="2" FIELD="PathResult" ID="PathResult_2" Runat="server" 
        LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_2" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="2" FIELD="PathNotes" ID="PathTestNotes_2" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="2" FIELD="PathQuality" ID="PathTestQuality_2" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow3">
	<td height="28" >
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="3" FIELD="PathDateText" ID="PathTestDateText_3" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="3"   ID="PathTestDate_3" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="3" FIELD="PathTest" ID="PathTest_3" Runat="server" 
	    LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="3" FIELD="PathResult" ID="PathResult_3" Runat="server" 
        LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_3" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="3" FIELD="PathNotes" ID="PathTestNotes_3" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="3" FIELD="PathQuality" ID="PathTestQuality_3" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow4">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="4" FIELD="PathDateText" ID="PathTestDateText_4" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="4"   ID="PathTestDate_4" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="4" FIELD="PathTest" ID="PathTest_4" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="4" FIELD="PathResult" ID="PathResult_4" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_4" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="4" FIELD="PathNotes" ID="PathTestNotes_4" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="4" FIELD="PathQuality" ID="PathTestQuality_4" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow5">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="5" FIELD="PathDateText" ID="PathTestDateText_5" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="5"   ID="PathTestDate_5" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="5" FIELD="PathTest" ID="PathTest_5" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="5" FIELD="PathResult" ID="PathResult_5" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_5" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="5" FIELD="PathNotes" ID="PathTestNotes_5" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="5" FIELD="PathQuality" ID="PathTestQuality_5" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow16">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="16" FIELD="PathDateText" ID="PathTestDateText_16" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="16"   ID="PathTestDate_16" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="16" FIELD="PathTest" ID="PathTest_16" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="16" FIELD="PathResult" ID="PathResult_16" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_16" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="16" FIELD="PathNotes" ID="PathTestNotes_16" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="16" FIELD="PathQuality" ID="PathTestQuality_16" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow17">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="17" FIELD="PathDateText" ID="PathTestDateText_17" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="17"   ID="PathTestDate_17" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="17" FIELD="PathTest" ID="PathTest_17" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="17" FIELD="PathResult" ID="PathResult_17" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_17" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="17" FIELD="PathNotes" ID="PathTestNotes_17" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="17" FIELD="PathQuality" ID="PathTestQuality_17" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow18">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="18" FIELD="PathDateText" ID="PathTestDateText_18" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="18"   ID="PathTestDate_18" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="18" FIELD="PathTest" ID="PathTest_18" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="18" FIELD="PathResult" ID="PathResult_18" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_18" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="18" FIELD="PathNotes" ID="PathTestNotes_18" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="18" FIELD="PathQuality" ID="PathTestQuality_18" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow19">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="19" FIELD="PathDateText" ID="PathTestDateText_19" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="19"   ID="PathTestDate_19" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="19" FIELD="PathTest" ID="PathTest_19" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="19" FIELD="PathResult" ID="PathResult_19" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_19" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="19" FIELD="PathNotes" ID="PathTestNotes_19" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="19" FIELD="PathQuality" ID="PathTestQuality_19" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow20">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="20" FIELD="PathDateText" ID="PathTestDateText_20" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="20"   ID="PathTestDate_20" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="20" FIELD="PathTest" ID="PathTest_20" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="20" FIELD="PathResult" ID="PathResult_20" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_20" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="20" FIELD="PathNotes" ID="PathTestNotes_20" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="20" FIELD="PathQuality" ID="PathTestQuality_20" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table> 
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  
                onclick="return showFirstAdditionalRow(this,'PathTestTbl1');" />
        </td>
    </tr>
</table><br />

                    </td>
                </tr>
            </table><br />
                    </td>
                </tr>
            </table>
            
            <%--Additional Pathology--%>
            <table>
                <tr>
                    <td style="padding-left:15px;">
                        <span><strong>Additional Pathology</strong> (if any)</span> <br/>
                        <table class="eformLargePopulatedTable" border="0" cellpadding="0" cellspacing="0">
<tr>
    <td>
<table width="650" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="NeuroPathTable2">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Histology</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Secondary<br />Histology</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Path #</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Spec Type</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Pathologist</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>
  <tr id="PathHTMLRow2">
    <td height="28" class="ClinicalEformGridColumnOne">
	    <euc:EformTextBox  Width="75px" TABLE="Pathology" RecordId="2" FIELD="PathDateText" ID="PathDateText_2" Runat="server" ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="2"   ID="PathDate_2" Runat="server"/> 
    </td> 
    <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology"  RecordId="2"   ID="PathHistology_2"     LookupCode="PathHistologyNeuro" Runat="server" DropDownWidth="350px"/></td> 
    <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology2"  RecordId="2"   ID="PathHistology2_2"     LookupCode="PathHistology" Runat="server" DropDownWidth="350px"/></td>
    <td align="center"><euc:EformTextBox Width="70px"  TABLE="Pathology" RecordId="2" FIELD="PathNum" ID="PathNum_2" Runat="server" /></td>
    <td align="center"><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="2" FIELD="PathSpecimenType" ID="PathSpecimenType_2" 
        Runat="server" LookupCode="ProcName" /></td>
    <td align="center"><euc:EformComboBox RecordId="2"  TABLE="Pathology" FIELD="PathSide" ID="PathSide_2" LookupCode="NodeSide" 
        Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="2"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_2" LookupCode="BxSite" 
        Runat="server" style="width:60px" DropDownWidth="200px" DropDownHeight="100px"/> </td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="2" FIELD="Pathologist" ID="Pathologist_2" Runat="server" LookupCode="Pathologist" /></td>
    <td><euc:EformComboBox id="PathInstitution_2" RecordId="2" Table="Pathology" Field="PathInstitution" runat="server" Width="80px" 
        LookupCode="Institution" /></td>
    <td align="center"><euc:EformTextBox  TABLE="Pathology" RecordId="2" FIELD="PathNotes" ID="PathNotes_2" Runat="server" ShowTextEditor="true" MaxLength="8000" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="Pathology" RecordId="2" FIELD="PathQuality" ID="PathQuality_2" Runat="server" 
        LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  
  </table><br />
  
   <span style="padding-left:20px;"><strong>Pathology Stages</strong></span> <br/>
    <table border="0" cellpadding="0" cellspacing="0" style="padding-left:20px;">
<tr>
    <td>
  <table width="400" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PathStageGradeTbl2">
    <tr>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Disease</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Grade</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Quality</td>
    </tr>
    <tr id="PathStageHTMLRow2">
        <td align="center"><euc:EformComboBox  TABLE="PathologyStageGrade" RecordId="2" FIELD="PathStageDisease" 
            ID="PathStageDisease_2" LookupCode="ClinStageDisease" Runat="server" Width="100px" /></td>
        <td align="center"><euc:EformComboBox  TABLE="PathologyStageGrade" RecordId="2" FIELD="PathGrade" ID="PathGrade_2" 
            Runat="server" Width="100px" LookupCode="PathGrade,Disease,Neuro" DropDownWidth="200px" /></td>
        <td align="center"><euc:EformDropDownList  TABLE="PathologyStageGrade" RecordId="2" FIELD="PathQuality" ID="PathGradeQuality_2" 
            Runat="server" Width="100px" LookupCode="DataQuality"/></td>
    </tr>
  </table>
  </td>
  </tr></table><br />

<table id="PathTestTable2" runat="server" style=" display:none;">
    <tr>
        <td style=" width:10px;"></td>
        <td>
            <span ><strong>Pathology Tests</strong></span> <br/>
            <table width="500" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PathTestTbl2">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Test</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>   
  <tr id="PathTestHTMLRow6">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="6" FIELD="PathDateText" ID="PathTestDateText_6" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="6"   ID="PathTestDate_6" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="6" FIELD="PathTest" ID="PathTest_6" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="6" FIELD="PathResult" ID="PathResult_6" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_6" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="6" FIELD="PathNotes" ID="PathTestNotes_6" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="6" FIELD="PathQuality" ID="PathTestQuality_6" 
        Runat="server" LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow7">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="7" FIELD="PathDateText" ID="PathTestDateText_7" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="7"   ID="PathTestDate_7" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="7" FIELD="PathTest" ID="PathTest_7" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="7" FIELD="PathResult" ID="PathResult_7" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_7" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="7" FIELD="PathNotes" ID="PathTestNotes_7" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="7" FIELD="PathQuality" ID="PathTestQuality_7" 
        Runat="server" LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow8">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="8" FIELD="PathDateText" ID="PathTestDateText_8" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="8"   ID="PathTestDate_8" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="8" FIELD="PathTest" ID="PathTest_8" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="8" FIELD="PathResult" ID="PathResult_8" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_8" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="8" FIELD="PathNotes" ID="PathTestNotes_8" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="8" FIELD="PathQuality" ID="PathTestQuality_8" 
        Runat="server" LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow9">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="9" FIELD="PathDateText" ID="PathTestDateText_9" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="9"   ID="PathTestDate_9" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="9" FIELD="PathTest" ID="PathTest_9" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="9" FIELD="PathResult" ID="PathResult_9" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_9" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="9" FIELD="PathNotes" ID="PathTestNotes_9" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="9" FIELD="PathQuality" ID="PathTestQuality_9" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHTMLRow10">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="10" FIELD="PathDateText" ID="PathTestDateText_10" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="10"   ID="PathTestDate_10" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="10" FIELD="PathTest" ID="PathTest_10" 
        Runat="server" LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="10" FIELD="PathResult" ID="PathResult_10" 
        Runat="server" LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_10" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="10" FIELD="PathNotes" ID="PathTestNotes_10" Runat="server" 
        ShowTextEditor="true" MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="10" FIELD="PathQuality" ID="PathTestQuality_10" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table> 
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  
                onclick="return showFirstAdditionalRow(this,'PathTestTbl2');" />
        </td>
    </tr>
</table> 

    </td>
   </tr>
 </table><br />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<br /><br /><hr width="1000" align="left" style=" color:#666666;" /><br />

<table width="650" border="0" cellpadding="2" cellspacing="0" class="ClinicalEformTable" runat="server" id="AdditionalProcTbl">
    <tr><td><span ><strong>Additional Procedure</strong> (if any)</span></td></tr>
    <tr>
        <td>
<table width="650" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="NeuroProc2Table">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Procedure</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Surgeon</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Service</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">CPT Code</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">CPT Description</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>   
  <tr id="ProcHtmlRow2">
	<td style="text-align: left;">
        <euc:EformTextBox  Width="75px" RecordId="2" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_2" Runat="server"  
            ShowCalendar="true" CalcDate="true"  AppendToOnChange="UpdateAssociatedDate(this); updateDatesProc2();" />
	    <euc:EformHidden  RecordId="2" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_2" Runat="server"/>	    	    
    	
	    <euc:EformTextBox RecordId="2" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_2" Runat="server" 
	        style="display:none;width:1px;"/>
	    <euc:EformHidden  RecordId="2" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_2" Runat="server" />
	    <euc:EformTextBox id="OpQuality_2" RecordId="2" Table="OperatingRoomDetails" Field="OpQuality" runat="server" Width="1px" 
	        style="display:none"/>
    </td>
    <td style="text-align: center;"><euc:EformComboBox Width="90px" RecordId="2" TABLE="Procedures" FIELD="ProcName" ID="ProcName_2" 
            LookupCode="ProcName,Disease,Neuro" Runat="server" DropDownWidth="200px" /></td>
    <td style="text-align: center;">
        <euc:EformComboBox LookupCode="OpSurgeon,Disease,Neuro" Width="80px" id="ProcSurgeon_2" RecordId="2" Table="Procedures" Field="ProcSurgeon" 
            runat="server" onblur="updateOpSurgProc2();" DropDownWidth="200px"/>
        <euc:EformTextBox id="OpCaseSurgeon_2" RecordId="2" Table="OperatingRoomDetails" Field="OpCaseSurgeon" runat="server" Width="1px" 
            style="display:none"/>
    </td>
	<td align="center"><euc:EformComboBox id="ProcService_2" RecordId="2" Table="Procedures" Field="ProcService" runat="server" Width="80px" 
	                        LookupCode="PhSpecialty" onblur="updateOpServiceProc2();" DropDownWidth="200px" />
	                   <euc:EformTextBox id="OpService_2" RecordId="2" Table="OperatingRoomDetails" Field="OpService" runat="server" Width="1px" 
                            style="display:none"/>
    </td>
    <td style="text-align: center;"><euc:EformComboBox RecordId="2" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_2" 
        LookupCode="OpSide" Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/> </td>
    <td style="text-align: center;"><euc:EformComboBox RecordId="2"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_2" 
        LookupCode="DxTarget,Disease,Neuro" Runat="server" style="width:60px" DropDownWidth="200px"/> </td>
    <td align="center"><euc:EformTextBox Width="60px" ID="ProcCPT_Code_2" RecordId="2" Table="Procedures" Field="ProcCPT_Code" runat="server"/></td>
    <td  align="center"><euc:EformTextBox Width="90px" ID="ProcCPT_Description_2" RecordId="2" Table="Procedures" Field="ProcCPT_Description" 
        runat="server" ShowTextEditor="true" /></td>
    <td><euc:EformComboBox id="ProcInstitution_2" RecordId="2" Table="Procedures" Field="ProcInstitution" runat="server" Width="80px" 
        LookupCode="Institution" onblur="updateOpInstProc2();" />
        <euc:EformTextBox id="OpInstitution_2" RecordId="2" Table="OperatingRoomDetails" Field="OpInstitution" runat="server" Width="1px" 
            style="display:none"/>
    </td>
	<td align="center"><euc:EformDropDownList id="ProcQuality_2" RecordId="2" Table="Procedures" Field="ProcQuality" runat="server" 
	    LookupCode="DataQuality" onblur="updateOpQltyProc2()" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table><br />

<%--Pathology--%>
<table>
    <tr>
        <td style="padding-left:15px;">
            <span ><strong>Pathology</strong></span> <br/>
            <table class="eformLargePopulatedTable" border="0" cellpadding="0" cellspacing="0">
<tr>
    <td>
<table width="650" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="NeuroPathTable3">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Histology</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Secondary<br />Histology</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Path #</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Spec Type</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Pathologist</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr>
  <tr id="PathHtmlRow3">
    <td height="28" class="ClinicalEformGridColumnOne">
	    <euc:EformTextBox  Width="75px" TABLE="Pathology" RecordId="3" FIELD="PathDateText" ID="PathDateText_3" Runat="server" ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="3"   ID="PathDate_3" Runat="server"/> 
    </td> 
    <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology"  RecordId="3"   ID="PathHistology_3"     LookupCode="PathHistologyNeuro" Runat="server" DropDownWidth="350px" /></td> 
    <td align="center"><euc:EformComboBox Width="80px" TABLE="Pathology" FIELD="PathHistology2"  RecordId="3"   ID="PathHistology2_3"     LookupCode="PathHistology" Runat="server" DropDownWidth="350px" /></td>
    <td align="center"><euc:EformTextBox Width="70px"  TABLE="Pathology" RecordId="3" FIELD="PathNum" ID="PathNum_3" Runat="server" /></td>
    <td align="center"><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="3" FIELD="PathSpecimenType" ID="PathSpecimenType_3" 
        Runat="server" LookupCode="ProcName" /></td>
    <td align="center"><euc:EformComboBox RecordId="3"  TABLE="Pathology" FIELD="PathSide" ID="PathSide_3" LookupCode="NodeSide" 
        Runat="server" style="width:60px" DropDownHeight="auto" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="3"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_3" LookupCode="BxSite" 
        Runat="server" style="width:60px" DropDownHeight="100px" DropDownWidth="200px"/> </td>
    <td align="center"><euc:EformComboBox Width="70px" TABLE="Pathology" RecordId="3" FIELD="Pathologist" ID="Pathologist_3" Runat="server" LookupCode="Pathologist" /></td>
    <td><euc:EformComboBox id="PathInstitution_3" RecordId="3" Table="Pathology" Field="PathInstitution" runat="server" Width="80px" 
        LookupCode="Institution" /></td>
    <td align="center"><euc:EformTextBox  TABLE="Pathology" RecordId="3" FIELD="PathNotes" ID="PathNotes_3" Runat="server" ShowTextEditor="true" MaxLength="8000" Width="60px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="Pathology" RecordId="3" FIELD="PathQuality" ID="PathQuality_3" Runat="server" 
        LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>  
</table><br />

<span style="padding-left:20px;"><strong>Pathology Stages</strong></span> <br/>
<table border="0" cellpadding="0" cellspacing="0" style="padding-left:20px;">
<tr>
    <td>
  <table width="400" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PathStageGradeTbl3">
    <tr>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Disease</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Grade</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Quality</td>
    </tr>
    <tr id="PathStageHtmlRow3">
        <td align="center"><euc:EformComboBox  TABLE="PathologyStageGrade" RecordId="3" FIELD="PathStageDisease" 
            ID="PathStageDisease_3" LookupCode="ClinStageDisease" Runat="server" Width="100px" /></td>
        <td align="center"><euc:EformComboBox  TABLE="PathologyStageGrade" RecordId="3" FIELD="PathGrade" ID="PathGrade_3" 
            Runat="server" Width="100px" LookupCode="PathGrade,Disease,Neuro" DropDownWidth="200px" /></td>
        <td align="center"><euc:EformDropDownList  TABLE="PathologyStageGrade" RecordId="3" FIELD="PathQuality" ID="PathGradeQuality_3" 
            Runat="server" Width="100px" LookupCode="DataQuality"/></td>
    </tr>
  </table>
  </td>
  </tr></table><br />

<table id="PathTestTable3" runat="server" style=" display:none;">
    <tr>
        <td width="10px"></td>
        <td><span ><strong>Pathology Tests</strong></span> <br/>
            <table width="500" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PathTestTbl3">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Test</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Result</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Qlty</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
  </tr> 
  <tr id="PathTestHtmlRow11">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="11" FIELD="PathDateText" ID="PathTestDateText_11" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="11"   ID="PathTestDate_11" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="11" FIELD="PathTest" ID="PathTest_11" Runat="server" 
	    LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="11" FIELD="PathResult" ID="PathResult_11" Runat="server" 
        LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_11" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="11" FIELD="PathNotes" ID="PathTestNotes_11" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="11" FIELD="PathQuality" ID="PathTestQuality_11" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHtmlRow12">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="12" FIELD="PathDateText" ID="PathTestDateText_12" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="12"   ID="PathTestDate_12" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="12" FIELD="PathTest" ID="PathTest_12" Runat="server" 
	    LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="12" FIELD="PathResult" ID="PathResult_12" Runat="server" 
        LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_12" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="12" FIELD="PathNotes" ID="PathTestNotes_12" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="12" FIELD="PathQuality" ID="PathTestQuality_12" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHtmlRow13">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="13" FIELD="PathDateText" ID="PathTestDateText_13" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="13"   ID="PathTestDate_13" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="13" FIELD="PathTest" ID="PathTest_13" Runat="server" 
	    LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="13" FIELD="PathResult" ID="PathResult_13" Runat="server" 
        LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_13" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="13" FIELD="PathNotes" ID="PathTestNotes_13" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="13" FIELD="PathQuality" ID="PathTestQuality_13" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHtmlRow14">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="14" FIELD="PathDateText" ID="PathTestDateText_14" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="14"   ID="PathTestDate_14" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="14" FIELD="PathTest" ID="PathTest_14" Runat="server" 
	    LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="14" FIELD="PathResult" ID="PathResult_14" Runat="server" 
        LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_14" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="14" FIELD="PathNotes" ID="PathTestNotes_14" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="14" FIELD="PathQuality" ID="PathTestQuality_14" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;" id="PathTestHtmlRow15">
	<td height="28">
	    <euc:EformTextBox  Width="75px" TABLE="PathTest" RecordId="15" FIELD="PathDateText" ID="PathTestDateText_15" Runat="server" 
	        ShowCalendar="true" CalcDate="true"/>
	    <euc:EformHidden TABLE="PathTest" FIELD="PathDate"  RecordId="15"   ID="PathTestDate_15" Runat="server"/> 	
	</td>
	<td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="15" FIELD="PathTest" ID="PathTest_15" Runat="server" 
	    LookupCode="PathTestNeuro" /></td>
    <td align="center"><euc:EformComboBox Width="90px"  TABLE="PathTest" RecordId="15" FIELD="PathResult" ID="PathResult_15" Runat="server" 
        LookupCode="PathTestResult"  CascadeValuesBasedOn="$PathTest_15" CascadeFormatString="PathTestNeuro" /></td>
    <td align="center"><euc:EformTextBox  TABLE="PathTest" RecordId="15" FIELD="PathNotes" ID="PathTestNotes_15" Runat="server" ShowTextEditor="true" 
        MaxLength="1000" Width="100px" /></td>
    <td align="center"><euc:EformDropDownList  TABLE="PathTest" RecordId="15" FIELD="PathQuality" ID="PathTestQuality_15" Runat="server" 
         LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table> 
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  
                onclick="return showFirstAdditionalRow(this,'PathTestTbl3');" /></td>
    </tr>
</table>
</td>
</tr>
</table><br />
        </td>
    </tr>
</table>
</td></tr></table>

 </td>
    </tr>
    
    <tr id="ProcAbsentRow" style="display:none;" runat="server">
        <td colspan="2">      
      
      <table cellpadding="3" cellspacing="0" class="ClinicalEformTable">
          <tr id="ProcAbsentHdrTR" runat="server"> 
            <td  class="controlBoxDataGridTitleColumn">Absent Date</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Table</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Field</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Value</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Reason</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
        </tr>
        <tr id="ProcAbsentHTMLTR">
            <td><asp:HiddenField ID="ProcAbsEvntDt" runat="server" />
                <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_3"
                    runat="server" Width="100px" ShowCalendar="true" AppendToOnChange="UpdateAssociatedDate(this);"/>
                <euc:EformHidden RecordId="3" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_3"
                    Runat="server"/></td>
            <td><euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="TableName" ID="TableName_3"
                    runat="server" Width="110px" /></td>
            <td><euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldName" ID="FieldName_3"
                    runat="server" Width="90px" /></td>
            <td><euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_3"
                    runat="server" Width="110px" /></td>
            <td><euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_3"
                    runat="server" Width="100px" /></td>
            <td><euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_3"
                    runat="server" Width="80px" /></td>
        </tr>
        </table>
        </td>
    </tr>
</table>


<script type="text/javascript">
    //updates pathGrades as per Histologies
    function addPathGradeEvents(pathHistology,pathDisease,pathGrade,pathgradeQlty,pathQlty)
    { 
        $(pathHistology).addEvent('blur',curry(PathGradeAutoPopulates,pathHistology,pathDisease,pathGrade,pathgradeQlty,pathQlty));
        $(pathGrade).addEvent('blur',curry(PathGradeAutoPopulates,pathHistology,pathDisease,pathGrade,pathgradeQlty,pathQlty));
        $(pathQlty).addEvent('blur',curry(PathGradeAutoPopulates,pathHistology,pathDisease,pathGrade,pathgradeQlty,pathQlty));
    } 
    addPathGradeEvents($('<%= PathHistology_1.ClientID %>'),$('<%= PathStageDisease_1.ClientID %>'),$('<%= PathGrade_1.ClientID %>'),$('<%= PathGradeQuality_1.ClientID %>'),$('<%= PathQuality_1.ClientID %>'));
    addPathGradeEvents($('<%= PathHistology_2.ClientID %>'),$('<%= PathStageDisease_2.ClientID %>'),$('<%= PathGrade_2.ClientID %>'),$('<%= PathGradeQuality_2.ClientID %>'),$('<%= PathQuality_2.ClientID %>'));
    addPathGradeEvents($('<%= PathHistology_3.ClientID %>'),$('<%= PathStageDisease_3.ClientID %>'),$('<%= PathGrade_3.ClientID %>'),$('<%= PathGradeQuality_3.ClientID %>'),$('<%= PathQuality_3.ClientID %>'));
    function PathGradeAutoPopulates(pathHistology,pathDisease,pathGrade,pathgradeQlty,pathQlty)
    {
        if (pathHistology.value != '' && pathGrade.value != '')
        {
           pathDisease.value = 'Brain';
           if(pathQlty.value != '')
           {
                pathgradeQlty.value = pathQlty.value;
           }
        }
        else if(pathHistology.value == '')
        {
           pathDisease.value = '';
           pathGrade.value = '';
           pathgradeQlty.value = '';
        }
        else if(pathGrade.value == '')
        {
           pathDisease.value = '';
           pathgradeQlty.value = '';
        }
    }
    
    
    
    //Adds events for Procedure   
    addProcEvent($('<%= ProcDone.ClientID %>'),$('<%= NeuroProcDetails.ClientID %>'),$('<%= ProcAbsentRow.ClientID %>'),$('<%= AbsentDateText_3.ClientID %>'),$('<%= AbsentDate_3.ClientID %>'),$('<%= TableName_3.ClientID %>'),$('<%= FieldName_3.ClientID %>'),$('<%= FieldValue_3.ClientID %>'),$('<%= AbsentReason_3.ClientID %>'),$('<%= AbsentQuality_3.ClientID %>'),$('<%= ProcAbsEvntDt.ClientID %>'));
    
    function addProcEvent(ProcYesNoID,ProcTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt)
    {  
        $(ProcYesNoID).addEvent('click',curry(ProcHxYesNo,ProcYesNoID,ProcTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt));

        // check on load as well
        ProcHxYesNo(ProcYesNoID,ProcTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt);
    }
   
    function ProcHxYesNo(ProcYesNoID,ProcTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt)
    {
       var ProcYesNoRef = ProcYesNoID.getElementsByTagName('input');
       
       for (var i = 0; i < ProcYesNoRef.length; i++) 
        if (ProcYesNoRef[i].checked) 
        {  
            ProcHxRadioClick(ProcYesNoRef[i].value,ProcTRID,AbsentTRID,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt);
        }
    }
    
    function ProcHxRadioClick(Procoption_value,ProchideTR,ProcAbsentHideTR,dateTextFieldId,dateFieldId,tableId,fieldId,fieldValueId,reasonId,qltyId,HiddenDt)
    {
      if (Procoption_value == "Yes")
      { 
        ProchideTR.style.display='block';
        
        ProcAbsentHideTR.style.display='none';
        
        //clears absent event data
        clearElementsInParentRow(document.getElementById('ProcAbsentHTMLTR'));
        
      } 
      else if (Procoption_value == "No")
      {
        ProchideTR.style.display='none';
        
        ProcAbsentHideTR.style.display='block';
        
        //clears all rows data
        for(var i=1;i<=2;i++)
        {
            clearElementsInParentRow(document.getElementById('ProcHtmlRow'+i));
        }
        
        for(var j=1;j<=3;j++)
        {
            clearElementsInParentRow(document.getElementById('PathHtmlRow'+j));
        }
        
        for(var l=1;l<=3;l++)
        {
            clearElementsInParentRow(document.getElementById('PathStageHtmlRow'+l));
        }
        
        for(var k=1;k<=20;k++)
        {
            clearElementsInParentRow(document.getElementById('PathTestHtmlRow'+k));
        }
        
        dateTextFieldId.value = HiddenDt.value;
        dateFieldId.value = HiddenDt.value;
        tableId.value = 'Procedures';
        fieldId.value = 'ProcName';
        fieldValueId.value = 'Biopsy';
        reasonId.value = 'Not Performed';
        qltyId.value = 'STD';
      }
    }
</script>