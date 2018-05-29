<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.BiopsiesBreastFU" CodeFile="BiopsiesBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
    tableArray.BreastBiopsiesTable = "BreastBiopsiesTable"; 

    function ShowHideBxTR(option_value)
    {
      var BreastBxDetailsTR = $('BreastBxDetails');
      if (option_value == "Yes")
      {
        BreastBxDetailsTR.style.display='block';
      } 
      else if (option_value == "No")
      {
        BreastBxDetailsTR.style.display='none';
        
        //clears row data
        for(var i=1;i<=5;i++)
        {
            clearElementsInParentRow(document.getElementById('BxProcedureHtmlTr'+i));
        }
        
        for(var j=3;j<=15;j+=3)
        {             
            clearElementsInParentRow(document.getElementById('BxPathologyHtmlTr'+j));
        }
      }
    }
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
<script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>

<a name="BiopsiesBreastFU" /><span class="controlBoxTitle">Biopsies</span> <br/>  
<table border="0" cellspacing="0" cellpadding="16" width="650" class="eformXLargePopulatedTable" style="border-bottom:none;">
 <tr >
    <td style="white-space:nowrap;"><strong>Any biopsies performed since last appointment ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="BxDone" id="BxDone" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:60%"></td>
  </tr>
 <tr id="BreastBxDetails" style="display: none;">
     <td style="padding: 0px;" colspan="3">
        <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastBiopsiesTable">
            <tr><td style="padding: 10px 10px 5px 10px;">
            <span class="controlBoxTitle" style="line-height: 30px;">Biopsy 1</span> <br/>
            <span style="font-weight: bold;">Procedure</span> <br/>
            <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BxProcedureHtmlTbl1">
            <tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; white-space: nowrap;">&nbsp;Date</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Procedure</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Side</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Site</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Subsite</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Service</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Surgeon</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Quality</td>
                <%--<td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Source</td>--%>
                <td style="white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            
            <tr id="BxProcedureHtmlTr1">
                <td><euc:EformTextBox  Width="70px" RecordId="1"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_1" 
                    Runat="server" ShowCalendar="true" CalcDate="true"/>
                    <euc:EformHidden  RecordId="1" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_1" Runat="server"/></td>
                <td><euc:EformComboBox Width="120px" RecordId="1"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_1" 
                    LookupCode="ProcName" DropDownWidth="250px" Runat="server"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="1" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_1" LookupCode="OpSide" 
                    Runat="server" DropDownHeight="auto" DropDownWidth="100px"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="1" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_1" LookupCode="DxTarget" 
                    Runat="server" DropDownWidth="250px"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="1" TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_1" 
                    LookupCode="DxTarget" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox Width="75px" RecordId="1" TABLE="Procedures" FIELD="ProcService" ID="ProcService_1" 
                    LookupCode="PhSpecialty" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox Width="75px" RecordId="1" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_1" 
                    LookupCode="Physician" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox id="ProcInstitution_1" RecordId="1" Table="Procedures" Field="ProcInstitution" runat="server" 
                        Width="100px" LookupCode="Institution"/></td>
                <td><euc:EformSelect id="ProcQuality_1" RecordId="1" Table="Procedures" Field="ProcQuality" runat="server" 
                    style="width:50px;" LookupCode="DataQuality"/></td>
                <%--<td><euc:EformSelect id="ProcDataSource_1" RecordId="1" Table="Procedures" Field="ProcDataSource" runat="server" 
                    style="width:50px;" LookupCode="DataSource"/></td>--%>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
        </table><br />
        
            <table border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td>
                    <span style="font-weight: bold;">Pathology</span> <br/>
                    <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BxPathologyHtmlTbl1">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; white-space: nowrap;">&nbsp;Date</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Path #</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Spec Type</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Site</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Subsite</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Side</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Result</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Histology</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Secondary<br />Histology</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Laboratory</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Specimen<br />Collection Type</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Pathologist</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Quality</td>
                            <%--<td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Source</td>--%>
                            <td style="white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                        </tr>
                        
                        <tr id="BxPathologyHtmlTr3">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="3" FIELD="PathDateText" ID="PathDateText_3" 
                                Runat="server" ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="3"   ID="PathDate_3" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="3" FIELD="PathNum" ID="PathNum_3" 
                                Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="3" FIELD="PathSpecimenType" 
                                ID="PathSpecimenType_3" Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="3"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_3" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="3" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_3" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="3" TABLE="Pathology" FIELD="PathSide" ID="PathSide_3" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="3" TABLE="Pathology" FIELD="PathResult" ID="PathResult_3" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="3" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_3" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="3" TABLE="Pathology" FIELD="PathHistology2" 
                                ID="PathHistology2_3" LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="3" Table="Pathology" Field="PathInstitution" runat="server" 
                                id="PathInstitution_3" Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="3" Table="Pathology" Field="PathLaboratory" runat="server" 
                                id="PathLaboratory_3" Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="3" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_3" Width="80px" LookupCode="SpecimenCollectionMethod" 
                                    DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="3" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_3" 
                                Width="80px" LookupCode="Pathologist" DropDownWidth="220px"/></td>                                
                            <td><euc:EformSelect id="PathQuality_3" RecordId="3" Table="Pathology" Field="PathQuality" runat="server" 
                                style="width:50px;" LookupCode="DataQuality"/></td>
                            <%--<td><euc:EformSelect id="PathDataSource_3" RecordId="3" Table="Pathology" Field="PathDataSource" 
                                runat="server" style="width:50px;" LookupCode="DataSource"/></td>--%>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        
                        <%--<tr id="BxPathologyHtmlTr4">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="4" FIELD="PathDateText" ID="PathDateText_4" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="4"   ID="PathDate_4" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="4" FIELD="PathNum" ID="PathNum_4" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="4" FIELD="PathSpecimenType" ID="PathSpecimenType_4" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="4"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_4" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="4" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_4" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="4" TABLE="Pathology" FIELD="PathSide" ID="PathSide_4" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="4" TABLE="Pathology" FIELD="PathResult" ID="PathResult_4" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="4" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_4" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="4" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_4" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="4" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_4" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="4" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_4" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="4" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_4" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="4" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_4" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/>
                                
                                <euc:EformTextBox id="PathQuality_4" RecordId="4" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
                                    style="display:none"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        
                        <tr id="BxPathologyHtmlTr5">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="5" FIELD="PathDateText" ID="PathDateText_5" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="5"   ID="PathDate_5" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="5" FIELD="PathNum" ID="PathNum_5" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="5" FIELD="PathSpecimenType" ID="PathSpecimenType_5" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="5"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_5" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="5" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_5" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="5" TABLE="Pathology" FIELD="PathSide" ID="PathSide_5" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="5" TABLE="Pathology" FIELD="PathResult" ID="PathResult_5" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="5" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_5" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="5" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_5" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="5" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_5" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="5" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_5" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="5" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_5" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="5" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_5" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/>
                                
                                <euc:EformTextBox id="PathQuality_5" RecordId="5" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
                                    style="display:none"/></td>                                    
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>--%>
                    </table><br />
                </td>
            </tr>
        </table><br />
            </td></tr>
         
            <tr style="display:none;"><td style="padding: 10px 10px 5px 10px;">
          <hr width="1300" align="center" style="color:#cccccc;background-color:#cccccc;" /><br />
            <span class="controlBoxTitle" style="line-height: 30px;">Biopsy 2</span> <br/>
            <span style="font-weight: bold;">Procedure</span> <br/>
            <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BxProcedureHtmlTbl2">
            <tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; white-space: nowrap;">&nbsp;Date</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Procedure</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Side</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Site</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Subsite</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Service</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Surgeon</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Quality</td>
                <%--<td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Source</td>--%>
                <td style="white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            
            <tr id="BxProcedureHtmlTr2">
                <td><euc:EformTextBox  Width="70px" RecordId="2"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_2" 
                    Runat="server" ShowCalendar="true" CalcDate="true"/>
                    <euc:EformHidden  RecordId="2" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_2" Runat="server"/></td>
                <td><euc:EformComboBox Width="120px" RecordId="2"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_2" 
                    LookupCode="ProcName" DropDownWidth="250px" Runat="server"/></td> 
                <td><euc:EformComboBox Width="50px" RecordId="2" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_2" LookupCode="OpSide" 
                    Runat="server" DropDownHeight="auto" DropDownWidth="200px"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="2" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_2" LookupCode="DxTarget" 
                    Runat="server" DropDownWidth="250px"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="2" TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_2" 
                    LookupCode="DxTarget" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox Width="75px" RecordId="2" TABLE="Procedures" FIELD="ProcService" ID="ProcService_2" 
                    LookupCode="PhSpecialty" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox Width="75px" RecordId="2" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_2" 
                    LookupCode="Physician" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox id="ProcInstitution_2" RecordId="2" Table="Procedures" Field="ProcInstitution" runat="server" 
                        Width="100px" LookupCode="Institution"/></td>
                <td><euc:EformSelect id="ProcQuality_2" RecordId="2" Table="Procedures" Field="ProcQuality" runat="server" 
                    style="width:50px;" LookupCode="DataQuality"/></td>
                <%--<td><euc:EformSelect id="ProcDataSource_2" RecordId="2" Table="Procedures" Field="ProcDataSource" runat="server" 
                    style="width:50px;" LookupCode="DataSource"/></td>--%>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
        </table><br />
            
            <table border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td>
                    <span class="controlBoxTitle">Pathology</span> <br/>
                    <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BxPathologyHtmlTbl2">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; white-space: nowrap;">&nbsp;Date</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Path #</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Spec Type</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Site</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Subsite</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Side</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Result</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Histology</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Secondary<br />Histology</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Laboratory</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Specimen<br />Collection Type</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Pathologist</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Quality</td>
                            <%--<td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Source</td>--%>
                            <td style="white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                        </tr>
                        
                        <tr id="BxPathologyHtmlTr6">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="6" FIELD="PathDateText" ID="PathDateText_6" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="6"   ID="PathDate_6" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="6" FIELD="PathNum" ID="PathNum_6" 
                                Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="6" FIELD="PathSpecimenType" 
                                ID="PathSpecimenType_6" Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="6"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_6" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="6" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_6" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="6" TABLE="Pathology" FIELD="PathSide" ID="PathSide_6" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="6" TABLE="Pathology" FIELD="PathResult" ID="PathResult_6" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="6" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_6" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="6" TABLE="Pathology" FIELD="PathHistology2" 
                                ID="PathHistology2_6" LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="6" Table="Pathology" Field="PathInstitution" runat="server" 
                                id="PathInstitution_6" Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="6" Table="Pathology" Field="PathLaboratory" runat="server" 
                                id="PathLaboratory_6" Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="6" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_6" Width="80px" LookupCode="SpecimenCollectionMethod" 
                                    DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="6" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_6" 
                                Width="80px" LookupCode="Pathologist" DropDownWidth="220px"/></td>
                            <td><euc:EformSelect id="PathQuality_6" RecordId="6" Table="Pathology" Field="PathQuality" runat="server" 
                                style="width:50px;" LookupCode="DataQuality"/></td>
                            <%--<td><euc:EformSelect id="PathDataSource_6" RecordId="6" Table="Pathology" Field="PathDataSource" 
                                runat="server" style="width:50px;" LookupCode="DataSource"/></td>--%>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        
                        <%--<tr id="BxPathologyHtmlTr7">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="7" FIELD="PathDateText" ID="PathDateText_7" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="7"   ID="PathDate_7" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="7" FIELD="PathNum" ID="PathNum_7" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="7" FIELD="PathSpecimenType" ID="PathSpecimenType_7" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="7"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_7" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="7" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_7" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="7" TABLE="Pathology" FIELD="PathSide" ID="PathSide_7" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="7" TABLE="Pathology" FIELD="PathResult" ID="PathResult_7" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="7" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_7" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="7" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_7" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="7" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_7" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="7" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_7" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="7" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_7" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="7" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_7" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/>
                                
                                <euc:EformTextBox id="PathQuality_7" RecordId="7" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
                                    style="display:none"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        
                        <tr id="BxPathologyHtmlTr8">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="8" FIELD="PathDateText" ID="PathDateText_8" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="8"   ID="PathDate_8" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="8" FIELD="PathNum" ID="PathNum_8" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="8" FIELD="PathSpecimenType" ID="PathSpecimenType_8" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="8"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_8" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="8" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_8" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="8" TABLE="Pathology" FIELD="PathSide" ID="PathSide_8" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="8" TABLE="Pathology" FIELD="PathResult" ID="PathResult_8" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="8" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_8" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="8" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_8" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="8" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_8" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="8" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_8" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="8" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_8" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="8" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_8" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/>
                                
                                <euc:EformTextBox id="PathQuality_8" RecordId="8" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
                                    style="display:none"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>--%>
                    </table><br />
                </td>
            </tr>
        </table><br />
            </td></tr>
         
            <tr style="display:none;"><td  style="padding: 10px 10px 5px 10px;">
          <hr width="1300" align="center" style="color:#cccccc;background-color:#cccccc;" /><br /> 
            <span class="controlBoxTitle" style="line-height: 30px;">Biopsy 3</span> <br/>
            <span style="font-weight: bold;">Procedure</span> <br/>
            <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BxProcedureHtmlTbl3">
            <tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; white-space: nowrap;">&nbsp;Date</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Procedure</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Side</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Site</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Subsite</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Service</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Surgeon</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Quality</td>
                <%--<td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Source</td>--%>
                <td style="white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            
            <tr id="BxProcedureHtmlTr3">
                <td><euc:EformTextBox  Width="70px" RecordId="3"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_3" 
                    Runat="server" ShowCalendar="true" CalcDate="true"/>
                    <euc:EformHidden  RecordId="3" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_3" Runat="server"/></td>
                <td><euc:EformComboBox Width="120px" RecordId="3"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_3" 
                    LookupCode="ProcName" DropDownWidth="250px" Runat="server"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="3" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_3" LookupCode="OpSide" 
                    Runat="server" DropDownHeight="auto" DropDownWidth="200px"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="3" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_3" LookupCode="DxTarget" 
                    Runat="server" DropDownWidth="250px"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="3" TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_3" 
                    LookupCode="DxTarget" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox Width="75px" RecordId="3" TABLE="Procedures" FIELD="ProcService" ID="ProcService_3" 
                    LookupCode="PhSpecialty" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox Width="75px" RecordId="3" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_3" 
                    LookupCode="Physician" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox id="ProcInstitution_3" RecordId="3" Table="Procedures" Field="ProcInstitution" runat="server" 
                        Width="100px" LookupCode="Institution"/></td>
                <td><euc:EformSelect id="ProcQuality_3" RecordId="3" Table="Procedures" Field="ProcQuality" runat="server" 
                    style="width:50px;" LookupCode="DataQuality"/></td>
                <%--<td><euc:EformSelect id="ProcDataSource_3" RecordId="3" Table="Procedures" Field="ProcDataSource" runat="server" 
                    style="width:50px;" LookupCode="DataSource"/></td>--%>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
        </table><br />
        
            <table border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td>
                    <span class="controlBoxTitle">Pathology</span> <br/>
                    <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BxPathologyHtmlTbl3">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; white-space: nowrap;">&nbsp;Date</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Path #</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Spec Type</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Site</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Subsite</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Side</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Result</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Histology</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Secondary<br />Histology</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Laboratory</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Specimen<br />Collection Type</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Pathologist</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Quality</td>
                            <%--<td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Source</td>--%>
                            <td style="white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                        </tr>
                        
                        <tr id="BxPathologyHtmlTr9">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="9" FIELD="PathDateText" ID="PathDateText_9" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="9"   ID="PathDate_9" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="9" FIELD="PathNum" ID="PathNum_9" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="9" FIELD="PathSpecimenType" ID="PathSpecimenType_9" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="9"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_9" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="9" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_9" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="9" TABLE="Pathology" FIELD="PathSide" ID="PathSide_9" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="9" TABLE="Pathology" FIELD="PathResult" ID="PathResult_9" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="9" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_9" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="9" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_9" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="9" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_9" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="9" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_9" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="9" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_9" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="9" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_9" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/></td>
                            <td><euc:EformSelect id="PathQuality_9" RecordId="9" Table="Pathology" Field="PathQuality" runat="server" 
                                style="width:50px;" LookupCode="DataQuality"/></td>
                            <%--<td><euc:EformSelect id="PathDataSource_9" RecordId="9" Table="Pathology" Field="PathDataSource" 
                                runat="server" style="width:50px;" LookupCode="DataSource"/></td>--%>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        
                        <%--<tr id="BxPathologyHtmlTr10">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="10" FIELD="PathDateText" ID="PathDateText_10" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="10"   ID="PathDate_10" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="10" FIELD="PathNum" ID="PathNum_10" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="10" FIELD="PathSpecimenType" ID="PathSpecimenType_10" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="10"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_10" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="10" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_10" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="10" TABLE="Pathology" FIELD="PathSide" ID="PathSide_10" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="10" TABLE="Pathology" FIELD="PathResult" ID="PathResult_10" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="10" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_10" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="10" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_10" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="10" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_10" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="10" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_10" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="10" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_10" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="10" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_10" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/>
                                
                                <euc:EformTextBox id="PathQuality_10" RecordId="10" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
                                    style="display:none"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        
                        <tr id="BxPathologyHtmlTr11">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="11" FIELD="PathDateText" ID="PathDateText_11" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="11"   ID="PathDate_11" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="11" FIELD="PathNum" ID="PathNum_11" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="11" FIELD="PathSpecimenType" ID="PathSpecimenType_11" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="11"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_11" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="11" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_11" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="11" TABLE="Pathology" FIELD="PathSide" ID="PathSide_11" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="11" TABLE="Pathology" FIELD="PathResult" ID="PathResult_11" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="11" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_11" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="11" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_11" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="11" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_11" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="11" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_11" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="11" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_11" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="11" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_11" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/>
                                
                                <euc:EformTextBox id="PathQuality_11" RecordId="11" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
                                    style="display:none"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>--%>
                    </table><br />
                </td>
            </tr>
        </table><br />
            </td></tr>
         
            <tr style="display:none;"><td style="padding: 10px 10px 5px 10px;">
          <hr width="1300" align="center" style="color:#cccccc;background-color:#cccccc;" /><br />
            <span class="controlBoxTitle" style="line-height: 30px;">Biopsy 4</span> <br/>
            <span style="font-weight: bold;">Procedure</span> <br/>
            <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BxProcedureHtmlTbl4">
            <tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; white-space: nowrap;">&nbsp;Date</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Procedure</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Side</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Site</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Subsite</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Service</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Surgeon</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Quality</td>
                <%--<td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Source</td>--%>
                <td style="white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            
            <tr id="BxProcedureHtmlTr4">
                <td><euc:EformTextBox  Width="70px" RecordId="4"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_4" 
                    Runat="server" ShowCalendar="true" CalcDate="true"/>
                    <euc:EformHidden  RecordId="4" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_4" Runat="server"/></td>
                <td><euc:EformComboBox Width="120px" RecordId="4"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_4" 
                    LookupCode="ProcName" DropDownWidth="250px" Runat="server"/></td>  
                <td><euc:EformComboBox Width="50px" RecordId="4" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_4" LookupCode="OpSide" 
                    Runat="server" DropDownHeight="auto" DropDownWidth="200px"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="4" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_4" LookupCode="DxTarget" 
                    Runat="server" DropDownWidth="250px"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="4" TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_4" 
                    LookupCode="DxTarget" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox Width="75px" RecordId="4" TABLE="Procedures" FIELD="ProcService" ID="ProcService_4" 
                    LookupCode="PhSpecialty" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox Width="75px" RecordId="4" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_4" 
                    LookupCode="Physician" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox id="ProcInstitution_4" RecordId="4" Table="Procedures" Field="ProcInstitution" runat="server" 
                        Width="100px" LookupCode="Institution"/></td>
                <td><euc:EformSelect id="ProcQuality_4" RecordId="4" Table="Procedures" Field="ProcQuality" runat="server" 
                    style="width:50px;" LookupCode="DataQuality"/></td>
                <%--<td><euc:EformSelect id="ProcDataSource_4" RecordId="4" Table="Procedures" Field="ProcDataSource" runat="server" 
                    style="width:50px;" LookupCode="DataSource"/></td>--%>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
        </table><br />
        
            <table border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td>
                    <span class="controlBoxTitle">Pathology</span> <br/>
                    <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BxPathologyHtmlTbl4">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; white-space: nowrap;">&nbsp;Date</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Path #</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Spec Type</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Site</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Subsite</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Side</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Result</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Histology</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Secondary<br />Histology</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Laboratory</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Specimen<br />Collection Type</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Pathologist</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Quality</td>
                            <%--<td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Source</td>--%>
                            <td style="white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                        </tr>
                        
                        <tr id="BxPathologyHtmlTr12">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="12" FIELD="PathDateText" ID="PathDateText_12" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="12"   ID="PathDate_12" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="12" FIELD="PathNum" ID="PathNum_12" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="12" FIELD="PathSpecimenType" ID="PathSpecimenType_12" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="12"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_12" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="12" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_12" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="12" TABLE="Pathology" FIELD="PathSide" ID="PathSide_12" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="12" TABLE="Pathology" FIELD="PathResult" ID="PathResult_12" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="12" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_12" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="12" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_12" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="12" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_12" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="12" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_12" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="12" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_12" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="12" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_12" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/></td>
                            <td><euc:EformSelect id="PathQuality_12" RecordId="12" Table="Pathology" Field="PathQuality" runat="server" 
                                style="width:50px;" LookupCode="DataQuality"/></td>
                            <%--<td><euc:EformSelect id="PathDataSource_12" RecordId="12" Table="Pathology" Field="PathDataSource" 
                                runat="server" style="width:50px;" LookupCode="DataSource"/></td>--%>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        
                        <%--<tr id="BxPathologyHtmlTr13">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="13" FIELD="PathDateText" ID="PathDateText_13" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="13"   ID="PathDate_13" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="13" FIELD="PathNum" ID="PathNum_13" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="13" FIELD="PathSpecimenType" ID="PathSpecimenType_13" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="13"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_13" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="13" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_13" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="13" TABLE="Pathology" FIELD="PathSide" ID="PathSide_13" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="13" TABLE="Pathology" FIELD="PathResult" ID="PathResult_13" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="13" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_13" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="13" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_13" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="13" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_13" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="13" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_13" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="13" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_13" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="13" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_13" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/>
                                
                                <euc:EformTextBox id="PathQuality_13" RecordId="13" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
                                    style="display:none"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        
                        <tr id="BxPathologyHtmlTr14">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="14" FIELD="PathDateText" ID="PathDateText_14" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="14"   ID="PathDate_14" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="14" FIELD="PathNum" ID="PathNum_14" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="14" FIELD="PathSpecimenType" ID="PathSpecimenType_14" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="14"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_14" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="14" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_14" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="14" TABLE="Pathology" FIELD="PathSide" ID="PathSide_14" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="14" TABLE="Pathology" FIELD="PathResult" ID="PathResult_14" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="14" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_14" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="14" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_14" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="14" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_14" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="14" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_14" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="14" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_14" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="14" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_14" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/>
                                
                                <euc:EformTextBox id="PathQuality_14" RecordId="14" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
                                    style="display:none"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>--%>
                    </table><br />
                </td>
            </tr>
        </table><br />
            </td></tr>
         
            <tr style="display:none;"><td style="padding: 10px 10px 5px 10px;">
          <hr width="1300" align="center" style="color:#cccccc;background-color:#cccccc;" /><br />
            <span class="controlBoxTitle" style="line-height: 30px;">Biopsy 5</span> <br/>
            <span style="font-weight: bold;">Procedure</span> <br/>
            <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BxProcedureHtmlTbl5">
            <tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; white-space: nowrap;">&nbsp;Date</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Procedure</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Side</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Site</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Subsite</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Service</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Surgeon</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
                <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Quality</td>
                <%--<td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Source</td>--%>
                <td style="white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
            </tr>
            
            <tr id="BxProcedureHtmlTr5">
                <td><euc:EformTextBox  Width="70px" RecordId="5"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_5" 
                    Runat="server" ShowCalendar="true" CalcDate="true"/>
                    <euc:EformHidden  RecordId="5" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_5" Runat="server"/></td>
                <td><euc:EformComboBox Width="120px" RecordId="5"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_5" 
                    LookupCode="ProcName" DropDownWidth="250px" Runat="server"/></td> 
                <td><euc:EformComboBox Width="50px" RecordId="5" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_5" LookupCode="OpSide" 
                    Runat="server" DropDownHeight="auto" DropDownWidth="200px"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="5" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_5" LookupCode="DxTarget" 
                    Runat="server" DropDownWidth="250px"/></td>
                <td><euc:EformComboBox Width="50px" RecordId="5" TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_5" 
                    LookupCode="DxTarget" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox Width="75px" RecordId="5" TABLE="Procedures" FIELD="ProcService" ID="ProcService_5" 
                    LookupCode="PhSpecialty" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox Width="75px" RecordId="5" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_5" 
                    LookupCode="Physician" Runat="server" DropDownWidth="220px"/></td>
                <td><euc:EformComboBox id="ProcInstitution_5" RecordId="5" Table="Procedures" Field="ProcInstitution" runat="server" 
                        Width="100px" LookupCode="Institution"/></td>
                <td><euc:EformSelect id="ProcQuality_5" RecordId="5" Table="Procedures" Field="ProcQuality" runat="server" 
                    style="width:50px;" LookupCode="DataQuality"/></td>
                <%--<td><euc:EformSelect id="ProcDataSource_5" RecordId="5" Table="Procedures" Field="ProcDataSource" runat="server" 
                    style="width:50px;" LookupCode="DataSource"/></td>--%>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
            </tr>
        </table><br />
            
            <table border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td>
                    <span class="controlBoxTitle">Pathology</span> <br/>
                    <table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BxPathologyHtmlTbl5">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; white-space: nowrap;">&nbsp;Date</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Path #</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Spec Type</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Site</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Subsite</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Side</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Result</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Histology</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Secondary<br />Histology</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Institution</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Laboratory</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Specimen<br />Collection Type</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Pathologist</td>
                            <td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Quality</td>
                            <%--<td style="white-space: nowrap;" class="controlBoxDataGridHeaderFirstCol">Data<br />Source</td>--%>
                            <td style="white-space: nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                        </tr>
                        
                        <tr id="BxPathologyHtmlTr15">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="15" FIELD="PathDateText" ID="PathDateText_15" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="15"   ID="PathDate_15" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="15" FIELD="PathNum" ID="PathNum_15" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="15" FIELD="PathSpecimenType" ID="PathSpecimenType_15" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="15"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_15" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="15" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_15" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="15" TABLE="Pathology" FIELD="PathSide" ID="PathSide_15" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="15" TABLE="Pathology" FIELD="PathResult" ID="PathResult_15" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="15" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_15" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="15" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_15" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="15" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_15" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="15" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_15" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="15" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_15" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="15" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_15" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/></td>
                            <td><euc:EformSelect id="PathQuality_15" RecordId="15" Table="Pathology" Field="PathQuality" runat="server" 
                                style="width:50px;" LookupCode="DataQuality"/></td>
                            <%--<td><euc:EformSelect id="PathDataSource_15" RecordId="15" Table="Pathology" Field="PathDataSource" 
                                runat="server" style="width:50px;" LookupCode="DataSource"/></td>--%>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        
                        <%--<tr id="BxPathologyHtmlTr16">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="16" FIELD="PathDateText" ID="PathDateText_16" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="16"   ID="PathDate_16" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="16" FIELD="PathNum" ID="PathNum_16" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="16" FIELD="PathSpecimenType" ID="PathSpecimenType_16" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="16"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_16" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="16" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_16" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="16" TABLE="Pathology" FIELD="PathSide" ID="PathSide_16" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="16" TABLE="Pathology" FIELD="PathResult" ID="PathResult_16" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="16" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_16" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="16" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_16" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="16" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_16" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="16" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_16" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="16" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_16" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="16" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_16" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/>
                                
                                <euc:EformTextBox id="PathQuality_16" RecordId="16" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
                                    style="display:none"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>
                        
                        <tr id="BxPathologyHtmlTr17">
                            <td><euc:EformTextBox  Width="70px" TABLE="Pathology" RecordId="17" FIELD="PathDateText" ID="PathDateText_17" Runat="server" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden TABLE="Pathology" FIELD="PathDate"  RecordId="17"   ID="PathDate_17" Runat="server"/></td>
                            <td><euc:EformTextBox Width="70px" TABLE="Pathology" RecordId="17" FIELD="PathNum" ID="PathNum_17" Runat="server" /></td>
                            <td><euc:EformComboBox Width="70px"  TABLE="Pathology" RecordId="17" FIELD="PathSpecimenType" ID="PathSpecimenType_17" 
                                Runat="server" LookupCode="ProcName" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="17"  TABLE="Pathology" FIELD="PathSite" ID="PathSite_17" 
                                LookupCode="DxTarget" Runat="server" /></td>
                            <td><euc:EformComboBox Width="50px" RecordId="17" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_17" 
                                LookupCode="BxSubSite" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="17" TABLE="Pathology" FIELD="PathSide" ID="PathSide_17" 
                                LookupCode="OpSide" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="50px" RecordId="17" TABLE="Pathology" FIELD="PathResult" ID="PathResult_17" 
                                LookupCode="BxResult" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="17" TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_17" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox Width="80px" RecordId="17" TABLE="Pathology" FIELD="PathHistology2" ID="PathHistology2_17" 
                                LookupCode="PathHistology" Runat="server" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="17" Table="Pathology" Field="PathInstitution" runat="server" id="PathInstitution_17" 
                                    Width="80px" LookupCode="Institution" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="17" Table="Pathology" Field="PathLaboratory" runat="server" id="PathLaboratory_17" 
                                    Width="80px" LookupCode="PathLaboratory" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="17" Table="Pathology" Field="PathSpecimenCollection" runat="server" 
                                id="PathSpecimenCollection_17" Width="80px" LookupCode="SpecimenCollectionMethod" DropDownWidth="220px"/></td>
                            <td><euc:EformComboBox RecordId="17" Table="Pathology" Field="Pathologist" runat="server" id="Pathologist_17" Width="80px" 
                                LookupCode="Pathologist" DropDownWidth="220px"/>
                                
                                <euc:EformTextBox id="PathQuality_17" RecordId="17" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
                                    style="display:none"/></td>
                            <td><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                        </tr>--%>
                    </table><br />
                </td>
            </tr>
        </table><br />
            </td></tr>
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'BreastBiopsiesTable');" /><br />
    </td>
 </tr>      
</table>