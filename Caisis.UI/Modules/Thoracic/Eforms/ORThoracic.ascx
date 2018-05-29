<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.ORThoracic" CodeFile="ORThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.PathStageGradeTbl = "PathStageGradeTbl";
    tableArray.PathTestTbl = "PathTestTbl";
    tableArray.PathFindingsTbl = "PathFindingsTbl";
    tableArray.AddProcHtmlTable = "AddProcHtmlTable";
    
    //updates procDate, Pathdate and ORQlty
    function populateDates()
    {
        var OpDt = $('<%= OpDateText_1.ClientID %>').value;
        if(OpDt != '')
        {
            $('<%= OpQuality_1.ClientID %>').value = 'STD';
            $('<%= OpService_1.ClientID %>').value = 'Thoracic';
            $('<%= OpAdmitStatus_1.ClientID %>').value = 'Inpatient';
            
            $('<%= ProcDateText_2.ClientID %>').value = OpDt;
            $('<%= ProcDate_2.ClientID %>').value = $('<%= OpDate_1.ClientID %>').value;
            
            $('<%= PathDateText_2.ClientID %>').value = OpDt;
            $('<%= PathDate_2.ClientID %>').value = $('<%= OpDate_1.ClientID %>').value;
        }
        else
        {
            $('<%= ProcDateText_2.ClientID %>').value = '';
            $('<%= ProcDate_2.ClientID %>').value = '';
            
            $('<%= PathDateText_2.ClientID %>').value = '';
            $('<%= PathDate_2.ClientID %>').value = '';
        }
    }
    
    function PathAutopopulates()
	{
	    if($('<%= PathHistology_2.ClientID %>').value != '')
	    {
	        $('<%= PathQuality_2.ClientID %>').value='STD';
	        $('<%= PathSite_2.ClientID %>').value='Lung';
	    }
	    else
	    {
	        $('<%= PathQuality_2.ClientID %>').value='';
	        $('<%= PathSite_2.ClientID %>').value='';
	    }
	}
	
	function setPathSideSite1(side,site)
    {
        $('<% = PathFindSide_1.ClientID %>').value = side; $('<% = PathFindSite_1.ClientID %>').value = site;
    }
    function setPathSideSite2(side,site)
    {
        $('<% = PathFindSide_2.ClientID %>').value = side; $('<% = PathFindSite_2.ClientID %>').value = site;
    }
    function setPathSideSite3(side,site)
    {
        $('<% = PathFindSide_3.ClientID %>').value = side; $('<% = PathFindSite_3.ClientID %>').value = site;
    }
    function setPathSideSite4(side,site)
    {
        $('<% = PathFindSide_4.ClientID %>').value = side; $('<% = PathFindSite_4.ClientID %>').value = site;
    }
    function setPathSideSite5(side,site)
    {
        $('<% = PathFindSide_5.ClientID %>').value = side; $('<% = PathFindSite_5.ClientID %>').value = site;
    }
    function setPathSideSite6(side,site)
    {
        $('<% = PathFindSide_6.ClientID %>').value = side; $('<% = PathFindSite_6.ClientID %>').value = site;
    }
    function setPathSideSite7(side,site)
    {
        $('<% = PathFindSide_7.ClientID %>').value = side; $('<% = PathFindSite_7.ClientID %>').value = site;
    }
    function setPathSideSite8(side,site)
    {
        $('<% = PathFindSide_8.ClientID %>').value = side; $('<% = PathFindSite_8.ClientID %>').value = site;
    }
    function setPathSideSite9(side,site)
    {
        $('<% = PathFindSide_9.ClientID %>').value = side; $('<% = PathFindSite_9.ClientID %>').value = site;
    }
    function setPathSideSite10(side,site)
    {
        $('<% = PathFindSide_10.ClientID %>').value = side; $('<% = PathFindSite_10.ClientID %>').value = site;
    }
    function setPathSideSite11(side,site)
    {
        $('<% = PathFindSide_11.ClientID %>').value = side; $('<% = PathFindSite_11.ClientID %>').value = site;
    }
    function setPathSideSite12(side,site)
    {
        $('<% = PathFindSide_12.ClientID %>').value = side; $('<% = PathFindSite_12.ClientID %>').value = site;
    }
    function setPathSideSite13(side,site)
    {
        $('<% = PathFindSide_13.ClientID %>').value = side; $('<% = PathFindSite_13.ClientID %>').value = site;
    }
    function setPathSideSite14(side,site)
    {
        $('<% = PathFindSide_14.ClientID %>').value = side; $('<% = PathFindSite_14.ClientID %>').value = site;
    }
    function setPathSideSite15(side,site)
    {
        $('<% = PathFindSide_15.ClientID %>').value = side; $('<% = PathFindSite_15.ClientID %>').value = site;
    }
    function setPathSideSite16(side,site)
    {
        $('<% = PathFindSide_16.ClientID %>').value = side; $('<% = PathFindSite_16.ClientID %>').value = site;
    }
    function setPathSideSite17(side,site)
    {
        $('<% = PathFindSide_17.ClientID %>').value = side; $('<% = PathFindSite_17.ClientID %>').value = site;
    }
    function setPathSideSite18(side,site)
    {
        $('<% = PathFindSide_18.ClientID %>').value = side; $('<% = PathFindSite_18.ClientID %>').value = site;
    }
    function setPathSideSite19(side,site)
    {
        $('<% = PathFindSide_19.ClientID %>').value = side; $('<% = PathFindSite_19.ClientID %>').value = site;
    }
    function setPathSideSite20(side,site)
    {
        $('<% = PathFindSide_20.ClientID %>').value = side; $('<% = PathFindSite_20.ClientID %>').value = site;
    }
    function setPathSideSite21(side,site)
    {
        $('<% = PathFindSide_21.ClientID %>').value = side; $('<% = PathFindSite_21.ClientID %>').value = site;
    }
    function setPathSideSite22(side,site)
    {
        $('<% = PathFindSide_22.ClientID %>').value = side; $('<% = PathFindSite_22.ClientID %>').value = site;
    }
    function setPathSideSite23(side,site)
    {
        $('<% = PathFindSide_23.ClientID %>').value = side; $('<% = PathFindSite_23.ClientID %>').value = site;
    }
    function setPathSideSite24(side,site)
    {
        $('<% = PathFindSide_24.ClientID %>').value = side; $('<% = PathFindSite_24.ClientID %>').value = site;
    }
    function setPathSideSite25(side,site)
    {
        $('<% = PathFindSide_25.ClientID %>').value = side; $('<% = PathFindSite_25.ClientID %>').value = site;
    }
    function setPathSideSite26(side,site)
    {
        $('<% = PathFindSide_26.ClientID %>').value = side; $('<% = PathFindSite_26.ClientID %>').value = site;
    }
    function setPathSideSite27(side,site)
    {
        $('<% = PathFindSide_27.ClientID %>').value = side; $('<% = PathFindSite_27.ClientID %>').value = site;
    }
    function setPathSideSite28(side,site)
    {
        $('<% = PathFindSide_28.ClientID %>').value = side; $('<% = PathFindSite_28.ClientID %>').value = site;
    }
    function setPathSideSite29(side,site)
    {
        $('<% = PathFindSide_29.ClientID %>').value = side; $('<% = PathFindSite_29.ClientID %>').value = site;
    }
    function setPathSideSite30(side,site)
    {
        $('<% = PathFindSide_30.ClientID %>').value = side; $('<% = PathFindSite_30.ClientID %>').value = site;
    }
    function setPathSideSite31(side,site)
    {
        $('<% = PathFindSide_31.ClientID %>').value = side; $('<% = PathFindSite_31.ClientID %>').value = site;
    }
    function setPathSideSite32(side,site)
    {
        $('<% = PathFindSide_32.ClientID %>').value = side; $('<% = PathFindSite_32.ClientID %>').value = site;
    }
    function setPathSideSite33(side,site)
    {
        $('<% = PathFindSide_33.ClientID %>').value = side; $('<% = PathFindSite_33.ClientID %>').value = site;
    }
    function setPathSideSite34(side,site)
    {
        $('<% = PathFindSide_34.ClientID %>').value = side; $('<% = PathFindSite_34.ClientID %>').value = site;
    }
    function setPathSideSite35(side,site)
    {
        $('<% = PathFindSide_35.ClientID %>').value = side; $('<% = PathFindSite_35.ClientID %>').value = site;
    }
    function setPathSideSite36(side,site)
    {
        $('<% = PathFindSide_36.ClientID %>').value = side; $('<% = PathFindSite_36.ClientID %>').value = site;
    }
    function setPathSideSite37(side,site)
    {
        $('<% = PathFindSide_37.ClientID %>').value = side; $('<% = PathFindSite_37.ClientID %>').value = site;
    }
    function setPathSideSite38(side,site)
    {
        $('<% = PathFindSide_38.ClientID %>').value = side; $('<% = PathFindSite_38.ClientID %>').value = site;
    }
    function setPathSideSite39(side,site)
    {
        $('<% = PathFindSide_39.ClientID %>').value = side; $('<% = PathFindSite_39.ClientID %>').value = site;
    }
    function setPathSideSite40(side,site)
    {
        $('<% = PathFindSide_40.ClientID %>').value = side; $('<% = PathFindSite_40.ClientID %>').value = site;
    }
    function setPathSideSite41(side,site)
    {
        $('<% = PathFindSide_41.ClientID %>').value = side; $('<% = PathFindSite_41.ClientID %>').value = site;
    }
    function setPathSideSite42(side,site)
    {
        $('<% = PathFindSide_42.ClientID %>').value = side; $('<% = PathFindSite_42.ClientID %>').value = site;
    }
    
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="ORThoracic" /><span class="controlBoxTitle">Operating Room Details</span> <br/>
<table width="600" cellpadding="3" cellspacing="0" class="eformLargePopulatedTable" id="ORHtmlTbl">
  <tr> 
    <td>Surgery Date</td>
    <td><euc:EformTextBox RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_1" Runat="server" Width="100px" 
        ShowCalendar="true" CalcDate="true"   AppendToOnChange="UpdateAssociatedDate(this); populateDates();" />
        <euc:EformHidden  RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_1" Runat="server" /></td>
    <td>OR In Time</td>
    <td><euc:EformTextBox RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpInTime" ID="OpInTime_1" Runat="server" Width="100px"/></td>    
  </tr>  
  
   <tr>
    <td>Service</td>
    <td><euc:EformSelect style="width:100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpService" ID="OpService_1" 
        LookupCode="HospitalService" Runat="server" DropDownWidth="200px"/></td>
    <td>OR Out Time </td>
    <td><euc:EformTextBox RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpOutTime" ID="OpOutTime_1" Runat="server" Width="100px"/></td>    
  </tr>
  
  <tr>
    <td>Surgeon</td>
    <td><euc:EformComboBox Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpCaseSurgeon" ID="OpCaseSurgeon_1" 
        LookupCode="OpSurgeon, Disease, Thoracic" Runat="server" DropDownWidth="200px"/>
        <euc:EformTextBox id="OpQuality_1" RecordId="1" Table="OperatingRoomDetails" Field="OpQuality" runat="server" Width="1px" 
        style="display:none"/></td>    
    <td>Patient Disposition</td>
    <td><euc:EformComboBox Width="100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpPatientDisposition" ID="OpPatientDisposition_1" 
        LookupCode="OpPatientDisposition" Runat="server" DropDownHeight="auto" DropDownWidth="200px"/></td>
  </tr>
  
  <tr>
    <td>Admit Status</td>
    <td><euc:EformSelect style="width:100px" RecordId="1"  TABLE="OperatingRoomDetails" FIELD="OpAdmitStatus" ID="OpAdmitStatus_1" 
        LookupCode="OpAdmitStatus" Runat="server" DropDownHeight="auto"/></td>        
    <td>ASA</td>
    <td ><euc:EformDropDownList id="OpASA_1" RecordId="1" Table="OperatingRoomDetails" Field="OpASA" runat="server" Width="100px" 
        LookupCode="ASA_Score"/></td>
  </tr>
  
  <tr>
    <td>Discharge Date</td>
    <td ><euc:EformTextBox RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpDischargeDateText" ID="OpDischargeDateText_1" Runat="server" 
        Width="100px" ShowCalendar="true" CalcDate="true"/>
        <euc:EformHidden  RecordId="1" TABLE="OperatingRoomDetails" FIELD="OpDischargeDate" ID="OpDischargeDate_1" Runat="server" /></td>
    <td>RBC Transfused</td>
    <td width="100px"><euc:EformDropDownList id="OpRBC_Transfused_1" RecordId="1" Table="OperatingRoomDetails" Field="OpRBC_Transfused" 
        runat="server" LookupCode="YesNoUnknown" Width="100px"/></td>
  </tr>
  
  <tr>        
    <td>Notes</td>
    <td colspan="3"><euc:EformTextBox id="OpNotes_1" RecordId="1" Table="OperatingRoomDetails" Field="OpNotes" runat="server" Width="400px" 
        Height="35px" ShowTextEditor="true"/></td>
  </tr>
</table><br />

<span class="controlBoxTitle">Procedure</span> <br/>
<table width="500" cellpadding="2" cellspacing="0" class="eformLargePopulatedTable" id="ProcHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;font-size:10px">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">Procedure</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">Start<br />Time</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">End<br />Time</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">Site</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">Approach</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">CPT<br />Code</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td><euc:EformTextBox  Width="70px" RecordId="2"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_2" Runat="server" 
        ShowCalendar="true" CalcDate="true"/>
        <euc:EformHidden  RecordId="2"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_2"     Runat="server"/></td>
    <td><euc:EformComboBox Width="120px" RecordId="2"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_2" 
        LookupCode="ProcName,Disease,Thoracic" DropDownWidth="250px" Runat="server"/>
        <euc:EformTextBox id="ProcPrimary_2" RecordId="2" Table="Procedures" Field="ProcPrimary" runat="server" 
            style="display:none;width:1px;" />
        <euc:EformTextBox id="ProcQuality_2" RecordId="2" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" 
            style="display:none"/></td>
    <td><euc:EformTextBox RecordId="2" TABLE="Procedures" FIELD="ProcStartTime" ID="ProcStartTime_2" Runat="server" Width="50px"/></td>
    <td><euc:EformTextBox RecordId="2" TABLE="Procedures" FIELD="ProcEndTime" ID="ProcEndTime_2" Runat="server" Width="50px"/></td>
    <td><euc:EformComboBox Width="60px" RecordId="2" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_2" LookupCode="OpSide" 
        Runat="server" DropDownHeight="auto" DropDownWidth="100px"/></td>
    <td><euc:EformComboBox Width="50px" RecordId="2" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_2" LookupCode="DxTarget" 
        Runat="server" DropDownWidth="250px"/></td>
    <td><euc:EformComboBox Width="75px" RecordId="2" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_2" 
        LookupCode="OpApproach,Disease,Thoracic" Runat="server" DropDownWidth="220px"/></td>
    <td><euc:EformTextBox RecordId="2" TABLE="Procedures" FIELD="ProcCPT_Code" ID="ProcCPT_Code_2" Runat="server" Width="50px"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon42" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table><br />

<span class="controlBoxTitle">Additional Procedures</span> <br/>
<table width="500" cellpadding="2" cellspacing="0" class="eformLargePopulatedTable" id="AddProcHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;font-size:10px">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">Procedure</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">Start<br />Time</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">End<br />Time</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">Site</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">Approach</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">CPT<br />Code</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;font-size:10px">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr>
    <td><euc:EformTextBox  Width="70px" RecordId="5"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_5" Runat="server" 
        ShowCalendar="true" CalcDate="true"/>
        <euc:EformHidden  RecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_5"     Runat="server"/></td>
    <td><euc:EformComboBox Width="85px" RecordId="5"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_5" LookupCode="ProcName,Disease,Thoracic" 
        DropDownWidth="250px"  Runat="server"/>
        <euc:EformTextBox id="ProcQuality_5" RecordId="5" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" 
            style="display:none"/></td>
    <td><euc:EformTextBox RecordId="5" TABLE="Procedures" FIELD="ProcStartTime" ID="ProcStartTime_5" Runat="server" Width="50px"/></td>
    <td><euc:EformTextBox RecordId="5" TABLE="Procedures" FIELD="ProcEndTime" ID="ProcEndTime_5" Runat="server" Width="50px"/></td>
    <td><euc:EformComboBox Width="60px" RecordId="5" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_5" LookupCode="OpSide" 
        Runat="server" DropDownHeight="auto" DropDownWidth="100px"/></td>
    <td><euc:EformComboBox Width="50px" RecordId="5" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_5" LookupCode="DxTarget" 
        Runat="server" DropDownWidth="250px"/></td>
    <td><euc:EformComboBox Width="65px" RecordId="5" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_5" 
        LookupCode="OpApproach,Disease,Thoracic" Runat="server" DropDownWidth="220px"/></td>
    <td><euc:EformTextBox RecordId="5" TABLE="Procedures" FIELD="ProcCPT_Code" ID="ProcCPT_Code_5" Runat="server" Width="50px"/></td>
    <td align="center"><euc:EformTextBox  TABLE="Procedures" RecordId="5" FIELD="ProcNotes" ID="ProcNotes_5" Runat="server" 
        ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon37" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox  Width="70px" RecordId="6"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_6" Runat="server" 
        ShowCalendar="true" CalcDate="true"/>
        <euc:EformHidden  RecordId="6"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_6"     Runat="server"/></td>
    <td><euc:EformComboBox Width="85px" RecordId="6"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_6" LookupCode="ProcName" 
        Runat="server"/>
        <euc:EformTextBox id="ProcQuality_6" RecordId="6" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" 
            style="display:none"/></td>
    <td><euc:EformTextBox RecordId="6" TABLE="Procedures" FIELD="ProcStartTime" ID="ProcStartTime_6" Runat="server" Width="50px"/></td>
    <td><euc:EformTextBox RecordId="6" TABLE="Procedures" FIELD="ProcEndTime" ID="ProcEndTime_6" Runat="server" Width="50px"/></td>
    <td><euc:EformComboBox Width="60px" RecordId="6" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_6" LookupCode="OpSide" 
        Runat="server" DropDownHeight="auto" DropDownWidth="100px"/></td>
    <td><euc:EformComboBox Width="50px" RecordId="6" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_6" LookupCode="DxTarget" 
        Runat="server" DropDownWidth="250px"/></td>
    <td><euc:EformComboBox Width="65px" RecordId="6" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_6" 
        LookupCode="OpApproach,Disease,Thoracic" Runat="server" DropDownWidth="220px"/></td>
    <td><euc:EformTextBox RecordId="6" TABLE="Procedures" FIELD="ProcCPT_Code" ID="ProcCPT_Code_6" Runat="server" Width="50px"/></td>
    <td align="center"><euc:EformTextBox  TABLE="Procedures" RecordId="6" FIELD="ProcNotes" ID="ProcNotes_6" Runat="server" 
        ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon38" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox  Width="70px" RecordId="7"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_7" Runat="server" 
        ShowCalendar="true" CalcDate="true"/>
        <euc:EformHidden  RecordId="7"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_7"     Runat="server"/></td>
    <td><euc:EformComboBox Width="85px" RecordId="7"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_7" LookupCode="ProcName" 
        Runat="server"/>
        <euc:EformTextBox id="ProcQuality_7" RecordId="7" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" 
            style="display:none"/></td>
    <td><euc:EformTextBox RecordId="7" TABLE="Procedures" FIELD="ProcStartTime" ID="ProcStartTime_7" Runat="server" Width="50px"/></td>
    <td><euc:EformTextBox RecordId="7" TABLE="Procedures" FIELD="ProcEndTime" ID="ProcEndTime_7" Runat="server" Width="50px"/></td>
    <td><euc:EformComboBox Width="60px" RecordId="7" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_7" LookupCode="OpSide" 
        Runat="server" DropDownHeight="auto" DropDownWidth="100px"/></td>
    <td><euc:EformComboBox Width="50px" RecordId="7" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_7" LookupCode="DxTarget" 
        Runat="server" DropDownWidth="250px"/></td>
    <td><euc:EformComboBox Width="65px" RecordId="7" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_7" 
        LookupCode="OpApproach,Disease,Thoracic" Runat="server" DropDownWidth="220px"/></td>
    <td><euc:EformTextBox RecordId="7" TABLE="Procedures" FIELD="ProcCPT_Code" ID="ProcCPT_Code_7" Runat="server" Width="50px"/></td>
    <td align="center"><euc:EformTextBox  TABLE="Procedures" RecordId="7" FIELD="ProcNotes" ID="ProcNotes_7" Runat="server" 
        ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon39" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox  Width="70px" RecordId="8"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_8" Runat="server" 
        ShowCalendar="true" CalcDate="true"/>
        <euc:EformHidden  RecordId="8"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_8"     Runat="server"/></td>
    <td><euc:EformComboBox Width="85px" RecordId="8"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_8" LookupCode="ProcName" 
        Runat="server"/>
        <euc:EformTextBox id="ProcQuality_8" RecordId="8" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" 
            style="display:none"/></td>
    <td><euc:EformTextBox RecordId="8" TABLE="Procedures" FIELD="ProcStartTime" ID="ProcStartTime_8" Runat="server" Width="50px"/></td>
    <td><euc:EformTextBox RecordId="8" TABLE="Procedures" FIELD="ProcEndTime" ID="ProcEndTime_8" Runat="server" Width="50px"/></td>
    <td><euc:EformComboBox Width="60px" RecordId="8" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_8" LookupCode="OpSide" 
        Runat="server" DropDownHeight="auto" DropDownWidth="100px"/></td>
    <td><euc:EformComboBox Width="50px" RecordId="8" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_8" LookupCode="DxTarget" 
        Runat="server" DropDownWidth="250px"/></td>
    <td><euc:EformComboBox Width="65px" RecordId="8" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_8" 
        LookupCode="OpApproach,Disease,Thoracic" Runat="server" DropDownWidth="220px"/></td>
    <td><euc:EformTextBox RecordId="8" TABLE="Procedures" FIELD="ProcCPT_Code" ID="ProcCPT_Code_8" Runat="server" Width="50px"/></td>
    <td align="center"><euc:EformTextBox  TABLE="Procedures" RecordId="8" FIELD="ProcNotes" ID="ProcNotes_8" Runat="server" 
        ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon40" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformTextBox  Width="70px" RecordId="9"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_9" Runat="server" 
        ShowCalendar="true" CalcDate="true"/>
        <euc:EformHidden  RecordId="9"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_9"     Runat="server"/></td>
    <td><euc:EformComboBox Width="85px" RecordId="9"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_9" LookupCode="ProcName" 
        Runat="server"/>
        <euc:EformTextBox id="ProcQuality_9" RecordId="9" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" 
            style="display:none"/></td>
    <td><euc:EformTextBox RecordId="9" TABLE="Procedures" FIELD="ProcStartTime" ID="ProcStartTime_9" Runat="server" Width="50px"/></td>
    <td><euc:EformTextBox RecordId="9" TABLE="Procedures" FIELD="ProcEndTime" ID="ProcEndTime_9" Runat="server" Width="50px"/></td>
    <td><euc:EformComboBox Width="60px" RecordId="9" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_9" LookupCode="OpSide" 
        Runat="server" DropDownHeight="auto" DropDownWidth="100px"/></td>
    <td><euc:EformComboBox Width="50px" RecordId="9" TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_9" LookupCode="DxTarget" 
        Runat="server" DropDownWidth="250px"/></td>
    <td><euc:EformComboBox Width="65px" RecordId="9" TABLE="Procedures" FIELD="ProcApproach" ID="ProcApproach_9" 
        LookupCode="OpApproach,Disease,Thoracic" Runat="server" DropDownWidth="220px"/></td>
    <td><euc:EformTextBox RecordId="9" TABLE="Procedures" FIELD="ProcCPT_Code" ID="ProcCPT_Code_9" Runat="server" Width="50px"/></td>
    <td align="center"><euc:EformTextBox  TABLE="Procedures" RecordId="9" FIELD="ProcNotes" ID="ProcNotes_9" Runat="server" 
        ShowTextEditor="true" MaxLength="1000" Width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon41" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'AddProcHtmlTable');" /><br /><br /><br />


<span class="controlBoxTitle">Pathology</span> <br/>
<table width="650" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="PriorLungCancerTbl">
    <tr>
        <td>
            <table width="400" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="Table1">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol">Path #</td>
                <td class="controlBoxDataGridHeaderFirstCol">Histology</td>
                <td class="controlBoxDataGridHeaderFirstCol">Side</td>
                <td class="controlBoxDataGridHeaderFirstCol">Site</td>
                <td class="controlBoxDataGridHeaderFirstCol">Subsite</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr> 
              
              <tr>
                <td><euc:EformTextBox RecordId="2" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_2" Runat="server" Width="70px" 
                                ShowCalendar="true" CalcDate="true"/>
	                            <euc:EformHidden  RecordId="2" TABLE="Pathology" FIELD="PathDate" ID="PathDate_2" Runat="server" /></td>
                <td><euc:EformTextBox id="PathNum_2" RecordId="2" Table="Pathology" Field="PathNum" runat="server" Width="80px"/></td>
                <td><euc:EformComboBox Width="100px" RecordId="2"  TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_2" 
                    LookupCode="PathHistology,Disease,Thoracic" Runat="server" onblur="PathAutopopulates();" DropDownWidth="300px"/>
                    <euc:EformTextBox id="PathQuality_2" RecordId="2" Table="Pathology" Field="PathQuality" runat="server" Width="1px" 
                        style="display:none"/>
                </td>
                <td><euc:EformComboBox Width="70px" RecordId="2" TABLE="Pathology" FIELD="PathSide" ID="PathSide_2" LookupCode="OpSide" 
                    Runat="server" DropDownHeight="auto"/></td>
                <td><euc:EformComboBox Width="80px" RecordId="2" TABLE="Pathology" FIELD="PathSite" ID="PathSite_2" LookupCode="BxSite" 
                    Runat="server" DropDownWidth="150px"/></td>
                <td><euc:EformComboBox Width="80px" RecordId="2" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_2" 
                    LookupCode="BxSubSite,Disease,Thoracic" Runat="server" DropDownWidth="120px" DropDownHeight="auto"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table><br /><br />
            
            
            
            <span class="controlBoxDataGridHeader">Lung Pathology</span> <br/>
            <table width="650" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="Table2">
              <tr align="center"> 
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Rx Changes</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Vascular<br />Inv</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Perineural<br />Inv</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Pleura</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Tumor Max<br />Dim</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Bronchial<br />Margin</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Pre-neo<br />Changes </td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr> 
              
              <tr align="center">
                <td><euc:EformTextBox RecordId="1" TABLE="LungPath" FIELD="PathRxChanges" ID="PathRxChanges_1" Runat="server" Width="60px"/></td>
                <td><euc:EformSelect style="width:70px" RecordId="1"  TABLE="LungPath" FIELD="PathVascularInv" ID="PathVascularInv_1" 
	                LookupCode="YesNoUnknown" Runat="server" DropDownHeight="auto" /></td>
                <td><euc:EformSelect style="width:70px" RecordId="1"  TABLE="LungPath" FIELD="PathPerineuralInv" ID="PathPerineuralInv_1" 
	                LookupCode="YesNoUnknown" Runat="server" DropDownHeight="auto" /></td>
                <td><euc:EformSelect style="width:70px" RecordId="1"  TABLE="LungPath" FIELD="PathPleuraInv" ID="PathPleuraInv_1" 
	                LookupCode="LungPathPleura" Runat="server" DropDownHeight="auto" /></td>
                <td><euc:EformTextBox RecordId="1" TABLE="LungPath" FIELD="PathTumorMaxDim" ID="PathTumorMaxDim_1" Runat="server" Width="60px"/></td>
                <td><euc:EformSelect style="width:70px" RecordId="1"  TABLE="LungPath" FIELD="PathBronchMargin" ID="PathBronchMargin_1" 
	                LookupCode="LungPathBronchMargin" Runat="server" DropDownHeight="auto" /></td>
                <td><euc:EformSelect style="width:70px" RecordId="1"  TABLE="LungPath" FIELD="PathPreNeoChanges" ID="PathPreNeoChanges_1" 
	                LookupCode="LungPathPreNeoChanges" Runat="server" DropDownHeight="auto" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table><br /><br />
            
            <span class="controlBoxDataGridHeader">Node Findings</span>
            <table id="NodeFingsTbl" cellspacing="0" cellpadding="3" width="600" style="background-color:#DFE3E6;border:solid 1px #cccccc;">
                <tr>
                    <td><img src="../../Images/shim.gif" /></td>
                    <td align="center" colspan="3" class="controlBoxDataGridHeaderFirstCol" 
                        style="border-right-color:Gray; border-right-width:1px; border-right-style:solid;"><strong>Left</strong></td>
                    <td align="center" colspan="3" class="controlBoxDataGridHeaderFirstCol" 
                        style="border-right-color:Gray; border-right-width:1px; border-right-style:solid;"><strong>Right</strong></td>
                        <td align="center" colspan="3" class="controlBoxDataGridHeaderFirstCol"><strong>Midline</strong></td>
                    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                <tr>
                    <td><img src="../../Images/shim.gif" /></td>
                    <td align="center" style="font-size:10px;" class="controlBoxDataGridHeaderFirstCol"><strong>Positive</strong><br/></td>
                    <td align="center" style="font-size:10px;" class="controlBoxDataGridHeaderFirstCol"><strong>Negative</strong><br/></td>
                    <td align="center" style="font-size:10px;border-right-color:Gray; border-right-width:1px; border-right-style:solid;" 
                        class="controlBoxDataGridHeaderFirstCol"><strong>Not<br />Sampled</strong><br /></td>
                        
                    <td align="center" style="font-size:10px;" class="controlBoxDataGridHeaderFirstCol"><strong>Positive</strong><br/></td>
                    <td align="center" style="font-size:10px;" class="controlBoxDataGridHeaderFirstCol"><strong>Negative</strong><br/></td>
                    <td align="center" style="font-size:10px;border-right-color:Gray; border-right-width:1px; border-right-style:solid;" 
                        class="controlBoxDataGridHeaderFirstCol"><strong>Not<br />Sampled</strong><br /></td>
                    
                    <td align="center" style="font-size:10px;" class="controlBoxDataGridHeaderFirstCol"><strong>Positive</strong><br/></td>
                    <td align="center" style="font-size:10px;" class="controlBoxDataGridHeaderFirstCol"><strong>Negative</strong><br/></td>
                    <td align="center" style="font-size:10px;" class="controlBoxDataGridHeaderFirstCol">
                        <strong>Not<br />Sampled</strong><br /></td>
                    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                </tr>
                
                
        <%--Thoracic group wanted to remove the below commented radiobuttons--%>
        
        
                <tr style=" background-color:White;">
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                    <euc:EformTextBox Table="NodePathFinding" RecordId="1" Field="PathFindSide" id="PathFindSide_1" runat="server" 
	                        style="display:none; width:1px;"/>
		                <euc:EformTextBox Table="NodePathFinding" RecordId="1" Field="PathFindSite" id="PathFindSite_1" runat="server" 
		                    style="display:none; width:1px;"/>Level 1</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="1"  Field="PathFindHistology" id="PathFindHistology_1" 
	                    GroupName="LeftLevel1" runat="server">
                        <euc:EformRadioButton id="LeftLevel1Pos" Value="Positive" Text="" runat="server" Enabled="false" 
                            onclick="setPathSideSite1('Left','Level 1');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="LeftLevel1Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite1('Left','Level 1');"/>--%></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">&nbsp;
                            <%--<euc:EformRadioButton ID="LeftLevel1NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite1('Left','Level 1');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="2" Field="PathFindSide" id="PathFindSide_2" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="2" Field="PathFindSite" id="PathFindSite_2" runat="server" 
	                    style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="2"  Field="PathFindHistology" id="PathFindHistology_2" 
	                    GroupName="RightLevel1" runat="server">
                        <euc:EformRadioButton id="RightLevel1Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite2('Right','Level 1');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="RightLevel1Neg" Value="Negative" Text="" runat="server"  Enabled="false"
                               onclick="setPathSideSite2('Right','Level 1');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">&nbsp;
                            <%--<euc:EformRadioButton ID="RightLevel1NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite2('Right','Level 1');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="29" Field="PathFindSide" id="PathFindSide_29" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="29" Field="PathFindSite" id="PathFindSite_29" runat="server" 
	                    style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="29"  Field="PathFindHistology" id="PathFindHistology_29" 
	                    GroupName="MidlineLevel1" runat="server">
                        <euc:EformRadioButton id="MidlineLevel1Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite29('Midline','Level 1');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="MidlineLevel1Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite29('Midline','Level 1');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <euc:EformRadioButton ID="MidlineLevel1NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite29('Midline','Level 1');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr>
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="3" Field="PathFindSide" id="PathFindSide_3" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="3" Field="PathFindSite" id="PathFindSite_3" runat="server" 
		                style="display:none; width:1px;"/>Level 2</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="3"  Field="PathFindHistology" id="PathFindHistology_3" 
	                    GroupName="LeftLevel2" runat="server">
                        <euc:EformRadioButton id="LeftLevel2Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite3('Left','Level 2');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="LeftLevel2Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite3('Left','Level 2');"/></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="LeftLevel2NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite3('Left','Level 2');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="4" Field="PathFindSide" id="PathFindSide_4" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="4" Field="PathFindSite" id="PathFindSite_4" runat="server" 
		                 style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="4"  Field="PathFindHistology" id="PathFindHistology_4" 
	                    GroupName="RightLevel2" runat="server">
                        <euc:EformRadioButton id="RightLevel2Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite4('Right','Level 2');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="RightLevel2Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite4('Right','Level 2');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="RightLevel2NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite4('Right','Level 2');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="30" Field="PathFindSide" id="PathFindSide_30" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="30" Field="PathFindSite" id="PathFindSite_30" runat="server" 
	                    style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="30"  Field="PathFindHistology" id="PathFindHistology_30" 
	                    GroupName="MidlineLevel2" runat="server">
                        <euc:EformRadioButton id="MidlineLevel2Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite30('Midline','Level 2');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="MidlineLevel2Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite30('Midline','Level 2');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <%--<euc:EformRadioButton ID="MidlineLevel2NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite30('Midline','Level 2');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr style="background-color:White;">
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="5" Field="PathFindSide" id="PathFindSide_5" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="5" Field="PathFindSite" id="PathFindSite_5" runat="server" 
		                style="display:none; width:1px;"/>Level 3</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="5"  Field="PathFindHistology" id="PathFindHistology_5" 
	                    GroupName="LeftLevel3" runat="server">
                        <euc:EformRadioButton id="LeftLevel3Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite5('Left','Level 3');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="LeftLevel3Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite5('Left','Level 3');"/>--%></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">&nbsp;
                            <%--<euc:EformRadioButton ID="LeftLevel3NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite5('Left','Level 3');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;" >
	                <euc:EformTextBox Table="NodePathFinding" RecordId="6" Field="PathFindSide" id="PathFindSide_6" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="6" Field="PathFindSite" id="PathFindSite_6" runat="server" 
		                 style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="6"  Field="PathFindHistology" id="PathFindHistology_6" 
	                    GroupName="RightLevel3" runat="server">
                        <euc:EformRadioButton id="RightLevel3Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite6('Right','Level 3');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="RightLevel3Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite6('Right','Level 3');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">&nbsp;
                            <%--<euc:EformRadioButton ID="RightLevel3NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite6('Right','Level 3');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="31" Field="PathFindSide" id="PathFindSide_31" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="31" Field="PathFindSite" id="PathFindSite_31" runat="server" 
	                    style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="31"  Field="PathFindHistology" id="PathFindHistology_31" 
	                    GroupName="MidlineLevel3" runat="server">
                        <euc:EformRadioButton id="MidlineLevel3Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite31('Midline','Level 3');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="MidlineLevel3Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite31('Midline','Level 3');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <euc:EformRadioButton ID="MidlineLevel3NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite31('Midline','Level 3');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr>
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="7" Field="PathFindSide" id="PathFindSide_7" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="7" Field="PathFindSite" id="PathFindSite_7" runat="server" 
		                style="display:none; width:1px;"/>Level 4</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="7"  Field="PathFindHistology" id="PathFindHistology_7" 
	                    GroupName="LeftLevel4" runat="server">
                        <euc:EformRadioButton id="LeftLevel4Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite7('Left','Level 4');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="LeftLevel4Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite7('Left','Level 4');"/></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="LeftLevel4NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite7('Left','Level 4');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="8" Field="PathFindSide" id="PathFindSide_8" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="8" Field="PathFindSite" id="PathFindSite_8" runat="server" 
		                 style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="8"  Field="PathFindHistology" id="PathFindHistology_8" 
	                    GroupName="RightLevel4" runat="server">
                        <euc:EformRadioButton id="RightLevel4Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite8('Right','Level 4');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="RightLevel4Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite8('Right','Level 4');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="RightLevel4NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite8('Right','Level 4');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="32" Field="PathFindSide" id="PathFindSide_32" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="32" Field="PathFindSite" id="PathFindSite_32" runat="server" 
	                    style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="32"  Field="PathFindHistology" id="PathFindHistology_32" 
	                    GroupName="MidlineLevel4" runat="server">
                        <euc:EformRadioButton id="MidlineLevel4Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite32('Midline','Level 4');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="MidlineLevel4Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite32('Midline','Level 4');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <%--<euc:EformRadioButton ID="MidlineLevel4NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite32('Midline','Level 4');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr style="background-color:White;">
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="9" Field="PathFindSide" id="PathFindSide_9" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="9" Field="PathFindSite" id="PathFindSite_9" runat="server" 
		                style="display:none; width:1px;"/>Level 5</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="9"  Field="PathFindHistology" id="PathFindHistology_9" 
	                    GroupName="LeftLevel5" runat="server">
                        <euc:EformRadioButton id="LeftLevel5Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite9('Left','Level 5');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="LeftLevel5Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite9('Left','Level 5');"/>--%></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">&nbsp;
                            <%--<euc:EformRadioButton ID="LeftLevel5NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite9('Left','Level 5');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="10" Field="PathFindSide" id="PathFindSide_10" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="10" Field="PathFindSite" id="PathFindSite_10" runat="server" 
		                 style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="10"  Field="PathFindHistology" id="PathFindHistology_10" 
	                    GroupName="RightLevel5" runat="server">
                        <euc:EformRadioButton id="RightLevel5Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite10('Right','Level 5');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="RightLevel5Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite10('Right','Level 5');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">&nbsp;
                            <%--<euc:EformRadioButton ID="RightLevel5NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite10('Right','Level 5');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="33" Field="PathFindSide" id="PathFindSide_33" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="33" Field="PathFindSite" id="PathFindSite_33" runat="server" 
	                    style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="33"  Field="PathFindHistology" id="PathFindHistology_33" 
	                    GroupName="MidlineLevel5" runat="server">
                        <euc:EformRadioButton id="MidlineLevel5Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite33('Midline','Level 5');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="MidlineLevel5Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite33('Midline','Level 5');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <euc:EformRadioButton ID="MidlineLevel5NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite33('Midline','Level 5');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr>
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="11" Field="PathFindSide" id="PathFindSide_11" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="11" Field="PathFindSite" id="PathFindSite_11" runat="server" 
		                style="display:none; width:1px;"/>Level 6</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="11"  Field="PathFindHistology" id="PathFindHistology_11" 
	                    GroupName="LeftLevel6" runat="server">
                        <euc:EformRadioButton id="LeftLevel6Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite11('Left','Level 6');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="LeftLevel6Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite11('Left','Level 6');"/>--%></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">&nbsp;
                            <%--<euc:EformRadioButton ID="LeftLevel6NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite11('Left','Level 6');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="12" Field="PathFindSide" id="PathFindSide_12" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="12" Field="PathFindSite" id="PathFindSite_12" runat="server" 
		                 style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="12"  Field="PathFindHistology" id="PathFindHistology_12" 
	                    GroupName="RightLevel6" runat="server">
                        <euc:EformRadioButton id="RightLevel6Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite12('Right','Level 6');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="RightLevel6Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite12('Right','Level 6');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">&nbsp;
                            <%--<euc:EformRadioButton ID="RightLevel6NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite12('Right','Level 6');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="34" Field="PathFindSide" id="PathFindSide_34" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="34" Field="PathFindSite" id="PathFindSite_34" runat="server" 
	                    style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="34"  Field="PathFindHistology" id="PathFindHistology_34" 
	                    GroupName="MidlineLevel6" runat="server">
                        <euc:EformRadioButton id="MidlineLevel6Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite34('Midline','Level 6');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="MidlineLevel6Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite34('Midline','Level 6');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <euc:EformRadioButton ID="MidlineLevel6NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite34('Midline','Level 6');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr style="background-color:White;">
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="13" Field="PathFindSide" id="PathFindSide_13" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="13" Field="PathFindSite" id="PathFindSite_13" runat="server" 
		                style="display:none; width:1px;"/>Level 7</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="13"  Field="PathFindHistology" id="PathFindHistology_13" 
	                    GroupName="LeftLevel7" runat="server">
                        <euc:EformRadioButton id="LeftLevel7Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite13('Left','Level 7');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="LeftLevel7Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite13('Left','Level 7');"/>--%></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">&nbsp;
                            <%--<euc:EformRadioButton ID="LeftLevel7NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite13('Left','Level 7');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="14" Field="PathFindSide" id="PathFindSide_14" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="14" Field="PathFindSite" id="PathFindSite_14" runat="server" 
		                 style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="14"  Field="PathFindHistology" id="PathFindHistology_14" 
	                    GroupName="RightLevel7" runat="server">
                        <euc:EformRadioButton id="RightLevel7Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite14('Right','Level 7');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="RightLevel7Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite14('Right','Level 7');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">&nbsp;
                            <%--<euc:EformRadioButton ID="RightLevel7NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite14('Right','Level 7');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="35" Field="PathFindSide" id="PathFindSide_35" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="35" Field="PathFindSite" id="PathFindSite_35" runat="server" 
	                    style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="35"  Field="PathFindHistology" id="PathFindHistology_35" 
	                    GroupName="MidlineLevel7" runat="server">
                        <euc:EformRadioButton id="MidlineLevel7Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite35('Midline','Level 7');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="MidlineLevel7Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite35('Midline','Level 7');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <euc:EformRadioButton ID="MidlineLevel7NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite35('Midline','Level 7');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr>
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="15" Field="PathFindSide" id="PathFindSide_15" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="15" Field="PathFindSite" id="PathFindSite_15" runat="server" 
		                style="display:none; width:1px;"/>Level 8</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="15"  Field="PathFindHistology" id="PathFindHistology_15" 
	                    GroupName="LeftLevel8" runat="server">
                        <euc:EformRadioButton id="LeftLevel8Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite15('Left','Level 8');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="LeftLevel8Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite15('Left','Level 8');"/></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="LeftLevel8NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite15('Left','Level 8');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="16" Field="PathFindSide" id="PathFindSide_16" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="16" Field="PathFindSite" id="PathFindSite_16" runat="server" 
		                 style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="16"  Field="PathFindHistology" id="PathFindHistology_16" 
	                    GroupName="RightLevel8" runat="server">
                        <euc:EformRadioButton id="RightLevel8Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite16('Right','Level 8');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="RightLevel8Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite16('Right','Level 8');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="RightLevel8NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite16('Right','Level 8');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="36" Field="PathFindSide" id="PathFindSide_36" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="36" Field="PathFindSite" id="PathFindSite_36" runat="server" 
	                    style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="36"  Field="PathFindHistology" id="PathFindHistology_36" 
	                    GroupName="MidlineLevel8" runat="server">
                        <euc:EformRadioButton id="MidlineLevel8Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite36('Midline','Level 8');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="MidlineLevel8Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite36('Midline','Level 8');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <%--<euc:EformRadioButton ID="MidlineLevel8NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite36('Midline','Level 8');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr style="background-color:White;">
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="17" Field="PathFindSide" id="PathFindSide_17" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="17" Field="PathFindSite" id="PathFindSite_17" runat="server" 
		                style="display:none; width:1px;"/>Level 9</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="17"  Field="PathFindHistology" id="PathFindHistology_17" 
	                    GroupName="LeftLevel9" runat="server">
                        <euc:EformRadioButton id="LeftLevel9Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite17('Left','Level 9');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="LeftLevel9Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite17('Left','Level 9');"/></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="LeftLevel9NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite17('Left','Level 9');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="18" Field="PathFindSide" id="PathFindSide_18" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="18" Field="PathFindSite" id="PathFindSite_18" runat="server" 
		                 style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="18"  Field="PathFindHistology" id="PathFindHistology_18" 
	                    GroupName="RightLevel9" runat="server">
                        <euc:EformRadioButton id="RightLevel9Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite18('Right','Level 9');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="RightLevel9Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite18('Right','Level 9');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="RightLevel9NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite18('Right','Level 9');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="37" Field="PathFindSide" id="PathFindSide_37" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="37" Field="PathFindSite" id="PathFindSite_37" runat="server" 
	                    style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="37"  Field="PathFindHistology" id="PathFindHistology_37" 
	                    GroupName="MidlineLevel9" runat="server">
                        <euc:EformRadioButton id="MidlineLevel9Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite37('Midline','Level 9');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="MidlineLevel9Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite37('Midline','Level 9');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <%--<euc:EformRadioButton ID="MidlineLevel9NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite37('Midline','Level 9');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr>
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="19" Field="PathFindSide" id="PathFindSide_19" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="19" Field="PathFindSite" id="PathFindSite_19" runat="server" 
		                style="display:none; width:1px;"/>Level 10</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="19"  Field="PathFindHistology" id="PathFindHistology_19" 
	                    GroupName="LeftLevel10" runat="server">
                        <euc:EformRadioButton id="LeftLevel10Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite19('Left','Level 10');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="LeftLevel10Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite19('Left','Level 10');"/></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="LeftLevel10NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite19('Left','Level 10');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="20" Field="PathFindSide" id="PathFindSide_20" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="20" Field="PathFindSite" id="PathFindSite_20" runat="server" 
		                 style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="20"  Field="PathFindHistology" id="PathFindHistology_20" 
	                    GroupName="RightLevel10" runat="server">
                        <euc:EformRadioButton id="RightLevel10Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite20('Right','Level 10');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="RightLevel10Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite20('Right','Level 10');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="RightLevel10NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite20('Right','Level 10');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="38" Field="PathFindSide" id="PathFindSide_38" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="38" Field="PathFindSite" id="PathFindSite_38" runat="server" 
	                    style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="38"  Field="PathFindHistology" id="PathFindHistology_38" 
	                    GroupName="MidlineLevel10" runat="server">
                        <euc:EformRadioButton id="MidlineLevel10Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite38('Midline','Level 10');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="MidlineLevel10Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite38('Midline','Level 10');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <%--<euc:EformRadioButton ID="MidlineLevel10NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite38('Midline','Level 10');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr style="background-color:White;">
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="21" Field="PathFindSide" id="PathFindSide_21" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="21" Field="PathFindSite" id="PathFindSite_21" runat="server" 
		                style="display:none; width:1px;"/>Level 11</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="21"  Field="PathFindHistology" id="PathFindHistology_21" 
	                    GroupName="LeftLevel11" runat="server">
                        <euc:EformRadioButton id="LeftLevel11Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite21('Left','Level 11');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="LeftLevel11Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite21('Left','Level 11');"/></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="LeftLevel11NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite21('Left','Level 11');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="22" Field="PathFindSide" id="PathFindSide_22" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="22" Field="PathFindSite" id="PathFindSite_22" runat="server" 
		                 style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="22"  Field="PathFindHistology" id="PathFindHistology_22" 
	                    GroupName="RightLevel11" runat="server">
                        <euc:EformRadioButton id="RightLevel11Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite22('Right','Level 11');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="RightLevel11Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite22('Right','Level 11');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="RightLevel11NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite22('Right','Level 11');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="39" Field="PathFindSide" id="PathFindSide_39" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="39" Field="PathFindSite" id="PathFindSite_39" runat="server" 
	                    style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="39"  Field="PathFindHistology" id="PathFindHistology_39" 
	                    GroupName="MidlineLevel11" runat="server">
                        <euc:EformRadioButton id="MidlineLevel11Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite39('Midline','Level 11');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="MidlineLevel11Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite39('Midline','Level 11');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <%--<euc:EformRadioButton ID="MidlineLevel11NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite39('Midline','Level 11');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr>
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left; " class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="23" Field="PathFindSide" id="PathFindSide_23" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="23" Field="PathFindSite" id="PathFindSite_23" runat="server" 
		                style="display:none; width:1px;"/>Level 12</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="23"  Field="PathFindHistology" id="PathFindHistology_23" 
	                    GroupName="LeftLevel12" runat="server">
                        <euc:EformRadioButton id="LeftLevel12Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite23('Left','Level 12');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="LeftLevel12Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite23('Left','Level 12');"/></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="LeftLevel12NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite23('Left','Level 12');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="24" Field="PathFindSide" id="PathFindSide_24" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="24" Field="PathFindSite" id="PathFindSite_24" runat="server" 
		                 style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="24"  Field="PathFindHistology" id="PathFindHistology_24" 
	                    GroupName="RightLevel12" runat="server">
                        <euc:EformRadioButton id="RightLevel12Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite24('Right','Level 12');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="RightLevel12Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite24('Right','Level 12');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="RightLevel12NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite24('Right','Level 12');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="40" Field="PathFindSide" id="PathFindSide_40" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="40" Field="PathFindSite" id="PathFindSite_40" runat="server" 
	                    style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="40"  Field="PathFindHistology" id="PathFindHistology_40" 
	                    GroupName="MidlineLevel12" runat="server">
                        <euc:EformRadioButton id="MidlineLevel12Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite40('Midline','Level 12');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="MidlineLevel12Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite40('Midline','Level 12');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <%--<euc:EformRadioButton ID="MidlineLevel12NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite40('Midline','Level 12');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr style="background-color:White;">
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left;" class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="25" Field="PathFindSide" id="PathFindSide_25" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="25" Field="PathFindSite" id="PathFindSite_25" runat="server" 
		                style="display:none; width:1px;"/>Level 13</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="25"  Field="PathFindHistology" id="PathFindHistology_25" 
	                    GroupName="LeftLevel13" runat="server">
                        <euc:EformRadioButton id="LeftLevel13Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite25('Left','Level 13');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="LeftLevel13Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite25('Left','Level 13');"/></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="LeftLevel13NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite25('Left','Level 13');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="26" Field="PathFindSide" id="PathFindSide_26" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="26" Field="PathFindSite" id="PathFindSite_26" runat="server" 
		                 style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="26"  Field="PathFindHistology" id="PathFindHistology_26" 
	                    GroupName="RightLevel13" runat="server">
                        <euc:EformRadioButton id="RightLevel13Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite26('Right','Level 13');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="RightLevel13Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite26('Right','Level 13');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="RightLevel13NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite26('Right','Level 13');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="41" Field="PathFindSide" id="PathFindSide_41" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="41" Field="PathFindSite" id="PathFindSite_41" runat="server" 
	                    style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="41"  Field="PathFindHistology" id="PathFindHistology_41" 
	                    GroupName="MidlineLevel13" runat="server">
                        <euc:EformRadioButton id="MidlineLevel13Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite41('Midline','Level 13');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="MidlineLevel13Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite41('Midline','Level 13');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                           <%-- <euc:EformRadioButton ID="MidlineLevel13NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite41('Midline','Level 13');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>
                
                <tr>
	                <td style="padding-top: 5px; padding-left: 16px; font-weight: 800;text-align:left; " class="controlBoxDataGridHeaderFirstCol">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="27" Field="PathFindSide" id="PathFindSide_27" runat="server" 
	                    style="display:none; width:1px;"/>
		            <euc:EformTextBox Table="NodePathFinding" RecordId="27" Field="PathFindSite" id="PathFindSite_27" runat="server" 
		                style="display:none; width:1px;"/>Level 14</td>	
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="27"  Field="PathFindHistology" id="PathFindHistology_27" 
	                    GroupName="LeftLevel14" runat="server">
                        <euc:EformRadioButton id="LeftLevel14Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite27('Left','Level 14');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="LeftLevel14Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite27('Left','Level 14');"/></td>
                        <td style="padding-top:5px; padding-left:0px; text-align:center; border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="LeftLevel14NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite27('Left','Level 14');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="28" Field="PathFindSide" id="PathFindSide_28" runat="server" 
	                    style="display:none; width:1px;" />
	                <euc:EformTextBox Table="NodePathFinding" RecordId="28" Field="PathFindSite" id="PathFindSite_28" runat="server" 
		                 style="display:none; width:1px;"/>
	                <euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="28"  Field="PathFindHistology" id="PathFindHistology_28" 
	                    GroupName="RightLevel14" runat="server">
                        <euc:EformRadioButton id="RightLevel14Pos" Value="Positive" Text="" runat="server" 
                            onclick="setPathSideSite28('Right','Level 14');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <euc:EformRadioButton id="RightLevel14Neg" Value="Negative" Text="" runat="server" 
                                onclick="setPathSideSite28('Right','Level 14');"/></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;border-right-color:Gray; border-right-width:1px; 
                            border-right-style:solid;">
                            <euc:EformRadioButton ID="RightLevel14NS" Value="Not Sampled" Text="" runat="server" Checked="true"
                                onclick="setPathSideSite28('Right','Level 14');"/>
	                </euc:EformRadioButtonGroup>
	                </td>
	                
	                <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
	                <euc:EformTextBox Table="NodePathFinding" RecordId="42" Field="PathFindSide" id="PathFindSide_42" runat="server" 
	                     style="display:none; width:1px;"/>
	                <euc:EformTextBox Table="NodePathFinding" RecordId="42" Field="PathFindSite" id="PathFindSite_42" runat="server" 
	                    style="display:none; width:1px;"/>
	                <%--<euc:EformRadioButtonGroup Table="NodePathFinding" RecordId="42"  Field="PathFindHistology" id="PathFindHistology_42" 
	                    GroupName="MidlineLevel14" runat="server">
                        <euc:EformRadioButton id="MidlineLevel14Pos" Value="Positive" Text="" runat="server" Enabled="false"
                            onclick="setPathSideSite42('Midline','Level 14');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px;text-align:center;">
                            <%--<euc:EformRadioButton id="MidlineLevel14Neg" Value="Negative" Text="" runat="server" Enabled="false"
                                onclick="setPathSideSite42('Midline','Level 14');"/>--%></td>
                        <td style="padding-top: 5px; padding-left: 0px; text-align:center;">
                            <%--<euc:EformRadioButton ID="MidlineLevel14NS" Value="Not Sampled" Text="" runat="server" Checked="true" 
                                onclick="setPathSideSite42('Midline','Level 14');"/>
	                </euc:EformRadioButtonGroup>--%>
	                </td>
                		
                   <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                </tr>                
            </table><br /><br />
            
            <span class="controlBoxDataGridHeader">Pathology Stages</span> <br/>
            <table width="650" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PathStageGradeTbl">
              <tr align="center"> 
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">System</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">T</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">N</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">M</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">R</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Group</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Grade</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr> 
              
              <tr align="center">
                <td align="center">
                    <euc:EformTextBox RecordId="6" TABLE="PathologyStageGrade" FIELD="PathStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="PathStageDisease_6" />
                    <euc:EformDropDownList RecordId="6"  TABLE="PathologyStageGrade" FIELD="PathStageSystem" 
                        ID="PathStageSystem_6" LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="6" ID="PathStageT_6" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageT" Width="50px" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" 
                        CascadeFormatString="StagePath_{0}_{n.1}_T"/></td>  
                <td align="center">
                    <euc:EformComboBox RecordId="6" ID="PathStageN_6" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageN" Width="50px" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" 
                        CascadeFormatString="StagePath_{0}_{n.1}_N"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="6" ID="PathStageM_6" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageM" Width="50px" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" 
                        CascadeFormatString="StagePath_{0}_{n.1}_M"/></td>
                <td align="center"><euc:EformComboBox RecordId="6" ID="PathStageR_6" runat="server" Table="PathologyStageGrade" 
                    Field="PathStageR" LookupCode="StagePath_R" style=" width:50px;"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="6"  TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_6" 
                        Runat="server" Width="70px" CascadeValuesBasedOn="$PathStageDisease_6,$PathStageSystem_6" 
                        CascadeFormatString="StagePath_{0}_{n.1}_Group"/></td>
                <td align="center"><euc:EformSelect RecordId="6" ID="PathGrade_6" runat="server" Table="PathologyStageGrade" 
                    Field="PathGrade" LookupCode="PathGrade,Disease,Thoracic" style=" width:80px;"/></td>
                <td align="center"><euc:EformTextBox RecordId="6" ID="PathNotes_6" runat="server" Table="PathologyStageGrade" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:80px;"/>
                    <euc:EformTextBox id="PathQlty_6" RecordId="6" Table="PathologyStageGrade" Field="PathQuality" runat="server" Width="1px" style="display:none"/></td>  
                <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr align="center">
                <td align="center">
                    <euc:EformTextBox RecordId="7" TABLE="PathologyStageGrade" FIELD="PathStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="PathStageDisease_7" />
                    <euc:EformDropDownList RecordId="7"  TABLE="PathologyStageGrade" FIELD="PathStageSystem" 
                        ID="PathStageSystem_7" LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="7" ID="PathStageT_7" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageT" Width="50px" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" 
                        CascadeFormatString="StagePath_{0}_{n.1}_T"/></td>  
                <td align="center">
                    <euc:EformComboBox RecordId="7" ID="PathStageN_7" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageN" Width="50px" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" 
                        CascadeFormatString="StagePath_{0}_{n.1}_N"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="7" ID="PathStageM_7" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageM" Width="50px" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" 
                        CascadeFormatString="StagePath_{0}_{n.1}_M"/></td>
                <td align="center"><euc:EformComboBox RecordId="7" ID="PathStageR_7" runat="server" Table="PathologyStageGrade" 
                    Field="PathStageR" LookupCode="StagePath_R" style=" width:50px;"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="7"  TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_7" 
                        Runat="server" Width="70px" CascadeValuesBasedOn="$PathStageDisease_7,$PathStageSystem_7" 
                        CascadeFormatString="StagePath_{0}_{n.1}_Group"/></td>
                <td align="center"><euc:EformSelect RecordId="7" ID="PathGrade_7" runat="server" Table="PathologyStageGrade" 
                    Field="PathGrade" LookupCode="PathGrade,Disease,Thoracic" style=" width:80px;"/></td>
                <td align="center"><euc:EformTextBox RecordId="7" ID="PathNotes_7" runat="server" Table="PathologyStageGrade" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:80px;"/>
                    <euc:EformTextBox id="PathQlty_7" RecordId="7" Table="PathologyStageGrade" Field="PathQuality" runat="server" Width="1px" style="display:none"/></td>  
                <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr align="center" style="display:none;">
                <td align="center">
                    <euc:EformTextBox RecordId="8" TABLE="PathologyStageGrade" FIELD="PathStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="PathStageDisease_8" />
                    <euc:EformDropDownList RecordId="8"  TABLE="PathologyStageGrade" FIELD="PathStageSystem" 
                        ID="PathStageSystem_8" LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="8" ID="PathStageT_8" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageT" Width="50px" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" 
                        CascadeFormatString="StagePath_{0}_{n.1}_T"/></td>  
                <td align="center">
                    <euc:EformComboBox RecordId="8" ID="PathStageN_8" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageN" Width="50px" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" 
                        CascadeFormatString="StagePath_{0}_{n.1}_N"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="8" ID="PathStageM_8" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageM" Width="50px" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" 
                        CascadeFormatString="StagePath_{0}_{n.1}_M"/></td>
                <td align="center"><euc:EformComboBox RecordId="8" ID="PathStageR_8" runat="server" Table="PathologyStageGrade" 
                    Field="PathStageR" LookupCode="StagePath_R" style=" width:50px;"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="8"  TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_8" 
                        Runat="server" Width="70px" CascadeValuesBasedOn="$PathStageDisease_8,$PathStageSystem_8" 
                        CascadeFormatString="StagePath_{0}_{n.1}_Group"/></td>
                <td align="center"><euc:EformSelect RecordId="8" ID="PathGrade_8" runat="server" Table="PathologyStageGrade" 
                    Field="PathGrade" LookupCode="PathGrade,Disease,Thoracic" style=" width:80px;"/></td>
                <td align="center"><euc:EformTextBox RecordId="8" ID="PathNotes_8" runat="server" Table="PathologyStageGrade" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:80px;"/>
                    <euc:EformTextBox id="PathQlty_8" RecordId="8" Table="PathologyStageGrade" Field="PathQuality" runat="server" Width="1px" style="display:none"/></td>  
                <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr align="center" style="display:none;">
                <td align="center">
                    <euc:EformTextBox RecordId="9" TABLE="PathologyStageGrade" FIELD="PathStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="PathStageDisease_9" />
                    <euc:EformDropDownList RecordId="9"  TABLE="PathologyStageGrade" FIELD="PathStageSystem" 
                        ID="PathStageSystem_9" LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="9" ID="PathStageT_9" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageT" Width="50px" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" 
                        CascadeFormatString="StagePath_{0}_{n.1}_T"/></td>  
                <td align="center">
                    <euc:EformComboBox RecordId="9" ID="PathStageN_9" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageN" Width="50px" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" 
                        CascadeFormatString="StagePath_{0}_{n.1}_N"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="9" ID="PathStageM_9" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageM" Width="50px" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" 
                        CascadeFormatString="StagePath_{0}_{n.1}_M"/></td>
                <td align="center"><euc:EformComboBox RecordId="9" ID="PathStageR_9" runat="server" Table="PathologyStageGrade" 
                    Field="PathStageR" LookupCode="StagePath_R" style=" width:50px;"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="9"  TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_9" 
                        Runat="server" Width="70px" CascadeValuesBasedOn="$PathStageDisease_9,$PathStageSystem_9" 
                        CascadeFormatString="StagePath_{0}_{n.1}_Group"/></td>
                <td align="center"><euc:EformSelect RecordId="9" ID="PathGrade_9" runat="server" Table="PathologyStageGrade" 
                    Field="PathGrade" LookupCode="PathGrade,Disease,Thoracic" style=" width:80px;"/></td>
                <td align="center"><euc:EformTextBox RecordId="9" ID="PathNotes_9" runat="server" Table="PathologyStageGrade" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:80px;"/>
                    <euc:EformTextBox id="PathQlty_9" RecordId="9" Table="PathologyStageGrade" Field="PathQuality" runat="server" Width="1px" style="display:none"/></td>  
                <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              <tr align="center" style="display:none;">
                <td align="center">
                    <euc:EformTextBox RecordId="10" TABLE="PathologyStageGrade" FIELD="PathStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="PathStageDisease_10" />
                    <euc:EformDropDownList RecordId="10"  TABLE="PathologyStageGrade" FIELD="PathStageSystem" 
                        ID="PathStageSystem_10" LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="10" ID="PathStageT_10" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageT" Width="50px" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" 
                        CascadeFormatString="StagePath_{0}_{n.1}_T"/></td>  
                <td align="center">
                    <euc:EformComboBox RecordId="10" ID="PathStageN_10" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageN" Width="50px" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" 
                        CascadeFormatString="StagePath_{0}_{n.1}_N"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="10" ID="PathStageM_10" runat="server" Table="PathologyStageGrade" 
                        Field="PathStageM" Width="50px" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" 
                        CascadeFormatString="StagePath_{0}_{n.1}_M"/></td>
                <td align="center"><euc:EformComboBox RecordId="10" ID="PathStageR_10" runat="server" Table="PathologyStageGrade" 
                    Field="PathStageR" LookupCode="StagePath_R" style=" width:50px;"/></td>
                <td align="center">
                    <euc:EformComboBox RecordId="10"  TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_10" 
                        Runat="server" Width="70px" CascadeValuesBasedOn="$PathStageDisease_10,$PathStageSystem_10" 
                        CascadeFormatString="StagePath_{0}_{n.1}_Group"/></td>
                <td align="center"><euc:EformSelect RecordId="10" ID="PathGrade_10" runat="server" Table="PathologyStageGrade" 
                    Field="PathGrade" LookupCode="PathGrade,Disease,Thoracic" style=" width:80px;"/></td>
                <td align="center"><euc:EformTextBox RecordId="10" ID="PathNotes_10" runat="server" Table="PathologyStageGrade" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:80px;"/>
                    <euc:EformTextBox id="PathQlty_10" RecordId="10" Table="PathologyStageGrade" Field="PathQuality" runat="server" Width="1px" style="display:none"/></td>  
                <td><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table>
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathStageGradeTbl');" /><br /><br /><br />
            
            <span class="controlBoxDataGridHeader">Pathology Tests</span> <br/>
            <table width="300" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PathTestTbl">
              <tr align="center"> 
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px" align="left">Test</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px" align="center">Result</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px" align="center">Notes</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr> 
              
              <tr align="center">
                <td align="left">
                    <asp:TextBox ID="EGFRLbl" runat="server" Text="EGFR" ReadOnly="true" style="border:none; font-size:14px;" 
                        Width="80px" />    
                    <euc:EformTextBox RecordId="1" ID="PathTest_1" runat="server" Table="PathTest" Field="PathTest" 
                       style="width:1px;display:none;" /></td>
                <td align="center"><euc:EformDropDownList RecordId="1" ID="PathResult_1" runat="server" Table="PathTest" 
                    Field="PathResult" Width="120px" LookupCode="ThoracicPathTestResult_EGFR"/></td>
                <td align="center"><euc:EformTextBox RecordId="1" ID="PathNotesID_1" runat="server" Table="PathTest" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:100px;"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center">
                <td align="left">
                    <asp:TextBox ID="ERCC1Lbl" runat="server" Text="ERCC1" ReadOnly="true" style="border:none; font-size:14px;" 
                    Width="80px"  />
                    <euc:EformTextBox RecordId="2" ID="PathTest_2" runat="server" Table="PathTest" Field="PathTest" 
                        style="width:1px;display:none;" /></td>
                <td align="center"><euc:EformDropDownList RecordId="2" ID="PathResult_2" runat="server" Table="PathTest" 
                    Field="PathResult" LookupCode="ThoracicPathTestResult_ERCC" Width="120px"/></td>
                <td align="center"><euc:EformTextBox RecordId="2" ID="PathNotesID_2" runat="server" Table="PathTest" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:100px;"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center">
                <td align="left">
                    <asp:TextBox ID="p27Lbl" runat="server" Text="p27" ReadOnly="true" style="border:none; font-size:14px;" Width="80px" />
                    <euc:EformTextBox RecordId="3" ID="PathTest_3" runat="server" Table="PathTest" Field="PathTest" 
                        style="width:1px;display:none;"/></td>
                <td align="center"><euc:EformDropDownList RecordId="3" ID="PathResult_3" runat="server" Table="PathTest" 
                    Field="PathResult" LookupCode="ThoracicPathTestResult_ERCC" Width="120px"/></td>
                <td align="center"><euc:EformTextBox RecordId="3" ID="PathNotesID_3" runat="server" Table="PathTest" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:100px;"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center">
                <td align="left">
                    <asp:TextBox ID="KRASLbl" runat="server" Text="KRAS" ReadOnly="true" style="border:none; font-size:14px;" 
                    Width="80px" />
                    <euc:EformTextBox RecordId="4" ID="PathTest_4" runat="server" Table="PathTest" Field="PathTest" 
                        style="width:1px;display:none;" /></td>
                <td align="center"><euc:EformDropDownList RecordId="4" ID="PathResult_4" runat="server" Table="PathTest" 
                    Field="PathResult" LookupCode="ThoracicPathTestResult_KRAS" Width="120px"/></td>
                <td align="center"><euc:EformTextBox RecordId="4" ID="PathNotesID_4" runat="server" Table="PathTest" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:100px;"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon25" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              
              
              <tr align="center" style="display:none;">
                <td align="center"><euc:EformDropDownList RecordId="5" ID="PathTest_5" runat="server" Table="PathTest" Field="PathTest" 
                    LookupCode="PathTest,Disease,Thoracic" Width="100px" /></td>
                <td align="center"><euc:EformComboBox RecordId="5" ID="PathResult_5" runat="server" Table="PathTest" Field="PathResult" 
                    Width="120px" CascadeValuesBasedOn="$PathTest_5" CascadeFormatString="PathTestResult_{0}_Result"/></td>
                <td align="center"><euc:EformTextBox RecordId="5" ID="PathNotesID_5" runat="server" Table="PathTest" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:100px;"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon26" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center" style="display:none;">
                <td align="center"><euc:EformDropDownList RecordId="6" ID="PathTest_6" runat="server" Table="PathTest" Field="PathTest" 
                    LookupCode="PathTest,Disease,Thoracic" Width="100px" /></td>
                <td align="center"><euc:EformComboBox RecordId="6" ID="PathResult_6" runat="server" Table="PathTest" Field="PathResult" 
                    Width="120px" CascadeValuesBasedOn="$PathTest_6" CascadeFormatString="PathTestResult_{0}_Result"/></td>
                <td align="center"><euc:EformTextBox RecordId="6" ID="PathNotesID_6" runat="server" Table="PathTest" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:100px;"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon27" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center" style="display:none;">
                <td align="center"><euc:EformDropDownList RecordId="7" ID="PathTest_7" runat="server" Table="PathTest" Field="PathTest" 
                    LookupCode="PathTest,Disease,Thoracic" Width="100px" /></td>
                <td align="center"><euc:EformComboBox RecordId="7" ID="PathResult_7" runat="server" Table="PathTest" Field="PathResult" 
                    Width="120px" CascadeValuesBasedOn="$PathTest_7" CascadeFormatString="PathTestResult_{0}_Result"/></td>
                <td align="center"><euc:EformTextBox RecordId="7" ID="PathNotesID_7" runat="server" Table="PathTest" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:100px;"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon28" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center" style="display:none;">
                <td align="center"><euc:EformDropDownList RecordId="8" ID="PathTest_8" runat="server" Table="PathTest" Field="PathTest" 
                    LookupCode="PathTest,Disease,Thoracic" Width="100px" /></td>
                <td align="center"><euc:EformComboBox RecordId="8" ID="PathResult_8" runat="server" Table="PathTest" Field="PathResult" 
                    Width="120px" CascadeValuesBasedOn="$PathTest_8" CascadeFormatString="PathTestResult_{0}_Result"/></td>
                <td align="center"><euc:EformTextBox RecordId="8" ID="PathNotesID_8" runat="server" Table="PathTest" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:100px;"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon29" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center" style="display:none;">
                <td align="center"><euc:EformDropDownList RecordId="9" ID="PathTest_9" runat="server" Table="PathTest" Field="PathTest" 
                    LookupCode="PathTest,Disease,Thoracic" Width="100px" /></td>
                <td align="center"><euc:EformComboBox RecordId="9" ID="PathResult_9" runat="server" Table="PathTest" Field="PathResult" 
                    Width="120px" CascadeValuesBasedOn="$PathTest_9" CascadeFormatString="PathTestResult_{0}_Result"/></td>
                <td align="center"><euc:EformTextBox RecordId="9" ID="PathNotesID_9" runat="server" Table="PathTest" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:100px;"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon30" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center" style="display:none;">
                <td align="center"><euc:EformDropDownList RecordId="10" ID="PathTest_10" runat="server" Table="PathTest" Field="PathTest" 
                    LookupCode="PathTest,Disease,Thoracic" Width="100px" /></td>
                <td align="center"><euc:EformComboBox RecordId="10" ID="PathResult_10" runat="server" Table="PathTest" 
                    Field="PathResult" Width="120px" CascadeValuesBasedOn="$PathTest_10" 
                    CascadeFormatString="PathTestResult_{0}_Result"/></td>
                <td align="center"><euc:EformTextBox RecordId="10" ID="PathNotesID_10" runat="server" Table="PathTest" 
                    Field="PathNotes" ShowTextEditor="true" style=" width:100px;"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon31" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table>
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathTestTbl');" /><br /><br />
            
            <span class="controlBoxDataGridHeader">Pathology Findings</span> <br/>
            <table width="500" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PathFindingsTbl">
              <tr align="center"> 
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Side</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Site</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Subsite</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Histology</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="font-size:10px">Result</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr> 
              
              <tr align="center">
                <td align="left"><euc:EformDropDownList RecordId="1" ID="PathFindingSide_1" runat="server" Table="PathologyFinding" 
                    Field="PathFindSide" LookupCode="FindSide" Width="100px" /></td>
                <td align="center"><euc:EformComboBox RecordId="1" ID="PathFindingSite_1" runat="server" Table="PathologyFinding" 
                    Field="PathFindSite" LookupCode="DxTarget" Width="100px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="1" TABLE="PathologyFinding" FIELD="PathFindSubsite" 
                    ID="PathFindSubsite_1" LookupCode="BxSubSite,Disease,Thoracic" Runat="server" Width="100px"/></td>
                <td align="center"><euc:EformComboBox RecordId="1" ID="PathFindingHistology_1" runat="server" Table="PathologyFinding" 
                    Field="PathFindHistology" LookupCode="PathHistology,Disease,Thoracic" Width="150px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="1" ID="PathFindingResult_1" runat="server" Table="PathologyFinding" 
                    Field="PathFindResult" LookupCode="Result" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon32" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center" style="display:none;">
                <td align="left"><euc:EformDropDownList RecordId="2" ID="PathFindingSide_2" runat="server" Table="PathologyFinding" 
                    Field="PathFindSide" LookupCode="FindSide" Width="100px" /></td>
                <td align="center"><euc:EformComboBox RecordId="2" ID="PathFindingSite_2" runat="server" Table="PathologyFinding" 
                    Field="PathFindSite" LookupCode="DxTarget" Width="100px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="2" TABLE="PathologyFinding" FIELD="PathFindSubsite" 
                    ID="PathFindSubsite_2" LookupCode="BxSubSite,Disease,Thoracic" Runat="server" Width="100px"/></td>
                <td align="center"><euc:EformComboBox RecordId="2" ID="PathFindingHistology_2" runat="server" Table="PathologyFinding" 
                    Field="PathFindHistology" LookupCode="PathHistology,Disease,Thoracic" Width="150px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="2" ID="PathFindingResult_2" runat="server" Table="PathologyFinding" 
                    Field="PathFindResult" LookupCode="Result" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon33" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center" style="display:none;">
                <td align="left"><euc:EformDropDownList RecordId="3" ID="PathFindingSide_3" runat="server" Table="PathologyFinding" 
                    Field="PathFindSide" LookupCode="FindSide" Width="100px" /></td>
                <td align="center"><euc:EformComboBox RecordId="3" ID="PathFindingSite_3" runat="server" Table="PathologyFinding" 
                    Field="PathFindSite" LookupCode="DxTarget" Width="100px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="3" TABLE="PathologyFinding" FIELD="PathFindSubsite" 
                    ID="PathFindSubsite_3" LookupCode="BxSubSite,Disease,Thoracic" Runat="server" Width="100px"/></td>
                <td align="center"><euc:EformComboBox RecordId="3" ID="PathFindingHistology_3" runat="server" Table="PathologyFinding" 
                    Field="PathFindHistology" LookupCode="PathHistology,Disease,Thoracic" Width="150px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="3" ID="PathFindingResult_3" runat="server" Table="PathologyFinding" 
                    Field="PathFindResult" LookupCode="Result" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon34" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center" style="display:none;">
                <td align="left"><euc:EformDropDownList RecordId="4" ID="PathFindingSide_4" runat="server" Table="PathologyFinding" 
                    Field="PathFindSide" LookupCode="FindSide" Width="100px" /></td>
                <td align="center"><euc:EformComboBox RecordId="4" ID="PathFindingSite_4" runat="server" Table="PathologyFinding" 
                    Field="PathFindSite" LookupCode="DxTarget" Width="100px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="4" TABLE="PathologyFinding" FIELD="PathFindSubsite" 
                    ID="PathFindSubsite_4" LookupCode="BxSubSite,Disease,Thoracic" Runat="server" Width="100px"/></td>
                <td align="center"><euc:EformComboBox RecordId="4" ID="PathFindingHistology_4" runat="server" Table="PathologyFinding" 
                    Field="PathFindHistology" LookupCode="PathHistology,Disease,Thoracic" Width="150px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="4" ID="PathFindingResult_4" runat="server" Table="PathologyFinding" 
                    Field="PathFindResult" LookupCode="Result" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon35" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
              <tr align="center" style="display:none;">
                <td align="left"><euc:EformDropDownList RecordId="5" ID="PathFindingSide_5" runat="server" Table="PathologyFinding" 
                    Field="PathFindSide" LookupCode="FindSide" Width="100px" /></td>
                <td align="center"><euc:EformComboBox RecordId="5" ID="PathFindingSite_5" runat="server" Table="PathologyFinding" 
                    Field="PathFindSite" LookupCode="DxTarget" Width="100px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="5" TABLE="PathologyFinding" FIELD="PathFindSubsite" 
                    ID="PathFindSubsite_5" LookupCode="BxSubSite,Disease,Thoracic" Runat="server" Width="100px"/></td>
                <td align="center"><euc:EformComboBox RecordId="5" ID="PathFindingHistology_5" runat="server" Table="PathologyFinding" 
                    Field="PathFindHistology" LookupCode="PathHistology,Disease,Thoracic" Width="150px"/></td>
                <td align="center"><euc:EformDropDownList RecordId="5" ID="PathFindingResult_5" runat="server" Table="PathologyFinding" 
                    Field="PathFindResult" LookupCode="Result" /></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon36" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table>
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathFindingsTbl');" />
       </td>
    </tr>
</table><br /><br />

<span class="controlBoxTitle">Tissue Protocol Status</span> <br/>
<table width="350" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProtocolTbl">
  <tr id="NoProtocolMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" visible="false" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> 
			    There are no consented Tissue protocol statuses recorded for this patient</td>
  </tr>
  <tr id="ProtocolStatusMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" visible="false" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> 
			    Below are the consented Tissue protocol statuses recorded for this patient</td>
  </tr>
  <tr id="ProtocolStatusRptTr" runat="server">  
        <td  class="controlBoxDataGridTitleColumn">Date</td>
        <td  class="controlBoxDataGridTitleColumn" align="center">Protocol</td>
		<td  class="controlBoxDataGridTitleColumn" align="center">Protocol Status</td>
		<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <asp:Repeater ID="ProtocolRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('PatientProtocolStatus', <%# DataBinder.Eval(Container.DataItem, "PatientProtocolStatusId") %>, 'PtProtocolStatusDateText,PtProtocolStatusDate,ProtocolNum,PtProtocolStatus', 'PatientProtocolStatus');"> 
		    <td class="ClinicalEformPopulatedColumn" align="left">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtProtocolStatusDateText")%>&nbsp;</td>
		    <td class="ClinicalEformPopulatedColumn" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ProtocolNum")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn" align="center">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtProtocolStatus")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater> 
 </table>



<script type="text/javascript">
    //updates pathstage autopopulates only if pathstagegrade value exists
    function addEvents(stageSystem,StageDisease,stageQlty)
    { 
        $(stageSystem).addEvent('blur',curry(AutoPopulates,stageSystem,StageDisease,stageQlty));
    } 
    addEvents($('<%= PathStageSystem_6.ClientID %>'),$('<%= PathStageDisease_6.ClientID %>'),$('<%= PathQlty_6.ClientID %>'));
    addEvents($('<%= PathStageSystem_7.ClientID %>'),$('<%= PathStageDisease_7.ClientID %>'),$('<%= PathQlty_7.ClientID %>'));
    addEvents($('<%= PathStageSystem_8.ClientID %>'),$('<%= PathStageDisease_8.ClientID %>'),$('<%= PathQlty_8.ClientID %>'));
    addEvents($('<%= PathStageSystem_9.ClientID %>'),$('<%= PathStageDisease_9.ClientID %>'),$('<%= PathQlty_9.ClientID %>'));
    addEvents($('<%= PathStageSystem_10.ClientID %>'),$('<%= PathStageDisease_10.ClientID %>'),$('<%= PathQlty_10.ClientID %>'));

    function AutoPopulates(stageSystem,StageDisease,stageQlty)
    {
       if (stageSystem.value != '')
        {
           StageDisease.value = 'Lung';
           stageQlty.value = 'STD';
        }
        else
        {
            StageDisease.value = '';
            stageQlty.value = '';
        }
    }
    
    //updates pathfinding result
    function addFindingEvents(findingSide,findingSite,findingHist,findingResult)
    { 
        $(findingSide).addEvent('blur',curry(findingPopulates,findingSide,findingSite,findingHist,findingResult));
        $(findingSite).addEvent('blur',curry(findingPopulates,findingSide,findingSite,findingHist,findingResult));
        $(findingHist).addEvent('blur',curry(findingPopulates,findingSide,findingSite,findingHist,findingResult));
    } 
    addFindingEvents($('<%= PathFindingSide_1.ClientID %>'),$('<%= PathFindingSite_1.ClientID %>'),$('<%= PathFindingHistology_1.ClientID %>'),$('<%= PathFindingResult_1.ClientID %>'));
    addFindingEvents($('<%= PathFindingSide_2.ClientID %>'),$('<%= PathFindingSite_2.ClientID %>'),$('<%= PathFindingHistology_2.ClientID %>'),$('<%= PathFindingResult_2.ClientID %>'));
    addFindingEvents($('<%= PathFindingSide_3.ClientID %>'),$('<%= PathFindingSite_3.ClientID %>'),$('<%= PathFindingHistology_3.ClientID %>'),$('<%= PathFindingResult_3.ClientID %>'));
    addFindingEvents($('<%= PathFindingSide_4.ClientID %>'),$('<%= PathFindingSite_4.ClientID %>'),$('<%= PathFindingHistology_4.ClientID %>'),$('<%= PathFindingResult_4.ClientID %>'));
    addFindingEvents($('<%= PathFindingSide_5.ClientID %>'),$('<%= PathFindingSite_5.ClientID %>'),$('<%= PathFindingHistology_5.ClientID %>'),$('<%= PathFindingResult_5.ClientID %>'));

    function findingPopulates(findingSide,findingSite,findingHist,findingResult)
    {
       if (findingSide.value != '' || findingHist.value != '')
        {
           findingSite.value = 'Lung';
           findingResult.value = 'Second Primary';
        }
        else
        {
            findingSite.value = '';
            findingResult.value = '';
        }
    }
    
    
    //updating Procedure details
    function addProcedureEvents(prName,prSite,prQlty)
    { 
        $(prName).addEvent('blur',curry(prPopulates,prName,prSite,prQlty));
    } 
    addProcedureEvents($('<%= ProcName_2.ClientID %>'),$('<%= ProcSite_2.ClientID %>'),$('<%= ProcQuality_2.ClientID %>'));
    addProcedureEvents($('<%= ProcName_5.ClientID %>'),$('<%= ProcSite_5.ClientID %>'),$('<%= ProcQuality_5.ClientID %>'));
    addProcedureEvents($('<%= ProcName_6.ClientID %>'),$('<%= ProcSite_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'));
    addProcedureEvents($('<%= ProcName_7.ClientID %>'),$('<%= ProcSite_7.ClientID %>'),$('<%= ProcQuality_7.ClientID %>'));
    addProcedureEvents($('<%= ProcName_8.ClientID %>'),$('<%= ProcSite_8.ClientID %>'),$('<%= ProcQuality_8.ClientID %>'));
    addProcedureEvents($('<%= ProcName_9.ClientID %>'),$('<%= ProcSite_9.ClientID %>'),$('<%= ProcQuality_9.ClientID %>'));

    function prPopulates(prName,prSite,prQlty)
    {
       if (prName.value != '')
        {
           prSite.value = 'Lung';
           prQlty.value = 'STD';
        }
        else
        {
           prSite.value = '';
           prQlty.value = '';
        }
    }
    
    //updating Primary procedure
    function addProcEvents(procName,procPrim)
    { 
        $(procName).addEvent('blur',curry(prPrimPopulates,procName,procPrim));
    } 
    addProcEvents($('<%= ProcName_2.ClientID %>'),$('<%= ProcPrimary_2.ClientID %>'));

    function prPrimPopulates(procName,procPrim)
    {
       if (procName.value != '')
        {
           procPrim.value = '1';
        }
        else
        {
           procPrim.value = '';
        }
    }
    
    //updating Pathology Tests
    function addPathTestEvents(pathTestLbl, pathTest, pathRes)
    { 
        $(pathRes).addEvent('blur',curry(pathTestPopulates,pathTestLbl,pathTest, pathRes));
    } 
    addPathTestEvents($('<%= EGFRLbl.ClientID %>'),$('<%= PathTest_1.ClientID %>'),$('<%= PathResult_1.ClientID %>'));
    addPathTestEvents($('<%= ERCC1Lbl.ClientID %>'),$('<%= PathTest_2.ClientID %>'),$('<%= PathResult_2.ClientID %>'));
    addPathTestEvents($('<%= p27Lbl.ClientID %>'),$('<%= PathTest_3.ClientID %>'),$('<%= PathResult_3.ClientID %>'));
    addPathTestEvents($('<%= KRASLbl.ClientID %>'),$('<%= PathTest_4.ClientID %>'),$('<%= PathResult_4.ClientID %>'));

    function pathTestPopulates(pathTestLbl,pathTest, pathRes)
    {
       if (pathRes.value != '')
        {
           pathTest.value = pathTestLbl.value;
        }
        else
        {
           pathTest.value = '';
        }
    }
       
    
</script>