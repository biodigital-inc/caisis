<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.PreTxStatusThoracic" CodeFile="PreTxStatusThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.PreTxStatusTbl = "PreTxStatusTbl";
    tableArray.PreTxClinStageTbl="PreTxClinStageTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PreTxStatusThoracic" /><span class="controlBoxTitle">Status</span> <br/>

<table width="400" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PreTxStatusTbl">
  <tr>
		<td  class="controlBoxDataGridTitleColumn">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
		<td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
  </tr>
  
  <asp:Repeater ID="PreTxStatusRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# DataBinder.Eval(Container.DataItem, "StatusId") %>, 'StatusDateText,StatusDate,Status', 'Status');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusDateText")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Status")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr>
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:100px;" RecordId="1" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_1"/>
	</td>
    <td align="center"><euc:EformComboBox RecordId="1" TABLE="Status" FIELD="Status" Runat="server" ID="Status_1" Width="150px" 
        LookupCode="Status,Disease,Thoracic" />
        <euc:EformTextBox RecordId="1" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_1"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style=" display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:100px;" RecordId="2" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_2"/>
	</td>
    <td align="center"><euc:EformComboBox RecordId="2" TABLE="Status" FIELD="Status" Runat="server" ID="Status_2" Width="150px"
        LookupCode="Status,Disease,Thoracic" />
        <euc:EformTextBox RecordId="2" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_2"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style=" display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:100px;" RecordId="3" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_3"/>
		    <euc:EformHidden RecordId="3" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_3"/>
	</td>
    <td align="center"><euc:EformComboBox RecordId="3" TABLE="Status" FIELD="Status" Runat="server" ID="Status_3" Width="150px"
        LookupCode="Status,Disease,Thoracic" />
        <euc:EformTextBox RecordId="3" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_3"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style=" display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:100px;" RecordId="4" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_4"/>
	</td>
    <td align="center"><euc:EformComboBox RecordId="4" TABLE="Status" FIELD="Status" Runat="server" ID="Status_4" Width="150px"
        LookupCode="Status,Disease,Thoracic" />
        <euc:EformTextBox RecordId="4" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_4"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style=" display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:100px;" RecordId="5" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_5"/>
		    <euc:EformHidden RecordId="5" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_5"/>
	</td>
    <td align="center"><euc:EformComboBox RecordId="5" TABLE="Status" FIELD="Status" Runat="server" ID="Status_5" Width="150px"
        LookupCode="Status,Disease,Thoracic" />
        <euc:EformTextBox RecordId="5" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_5"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  </table>
  <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PreTxStatusTbl');" />
  <br /><br /><br />
  
  
  <span class="controlBoxTitle">Clinical Stages</span> <br/>
    <table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PreTxClinStageTbl">
          <tr> 
            <td class="controlBoxDataGridHeaderFirstCol">Date</td>
            <td class="controlBoxDataGridHeaderFirstCol">System</td>
            <td class="controlBoxDataGridHeaderFirstCol">T</td>
            <td class="controlBoxDataGridHeaderFirstCol">N</td>
            <td class="controlBoxDataGridHeaderFirstCol">M</td>
            <td class="controlBoxDataGridHeaderFirstCol">Stage</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
          
          <tr>
            <td><euc:EformTextBox RecordId="6" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_6" Runat="server" 
                Width="80px" ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="6" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_6" Runat="server" /></td>
            <td align="center">
                <euc:EformTextBox RecordId="6" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="ClinStageDisease_6" />
                 <euc:EformDropDownList RecordId="6"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_6" 
                        LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="6" ID="ClinStageT_6" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_6,$ClinStageSystem_6" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
            <td align="center">
                <euc:EformComboBox RecordId="6" ID="ClinStageN_6" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_6,$ClinStageSystem_6" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="6" ID="ClinStageM_6" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_6,$ClinStageSystem_6" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
                <euc:EformTextBox id="ClinStageQuality_6" RecordId="6" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
                    Width="1px" style="display:none"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="6" ID="ClinStageGroup_6" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
                    Width="100px" CascadeValuesBasedOn="$ClinStageDisease_6,$ClinStageSystem_6" 
                    CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          
          <tr>
            <td><euc:EformTextBox RecordId="7" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_7" Runat="server" 
                Width="80px" ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="7" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_7" Runat="server" /></td>
            <td align="center">
                <euc:EformTextBox RecordId="7" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="ClinStageDisease_7" />
                 <euc:EformDropDownList RecordId="7"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_7" 
                        LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="7" ID="ClinStageT_7" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_7,$ClinStageSystem_7" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
            <td align="center">
                <euc:EformComboBox RecordId="7" ID="ClinStageN_7" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_7,$ClinStageSystem_7" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="7" ID="ClinStageM_7" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_7,$ClinStageSystem_7" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
                <euc:EformTextBox id="ClinStageQuality_7" RecordId="7" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
                    Width="1px" style="display:none"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="7" ID="ClinStageGroup_7" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
                    Width="100px" CascadeValuesBasedOn="$ClinStageDisease_7,$ClinStageSystem_7" 
                    CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          
          <tr style=" display:none;">
            <td><euc:EformTextBox RecordId="8" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_8" Runat="server" 
                Width="80px" ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="8" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_8" Runat="server" /></td>
            <td align="center">
                <euc:EformTextBox RecordId="8" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="ClinStageDisease_8" />
                 <euc:EformDropDownList RecordId="8"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_8" 
                        LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="8" ID="ClinStageT_8" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_8,$ClinStageSystem_8" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
            <td align="center">
                <euc:EformComboBox RecordId="8" ID="ClinStageN_8" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_8,$ClinStageSystem_8" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="8" ID="ClinStageM_8" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_8,$ClinStageSystem_8" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
                <euc:EformTextBox id="ClinStageQuality_8" RecordId="8" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
                    Width="1px" style="display:none"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="8" ID="ClinStageGroup_8" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
                    Width="100px" CascadeValuesBasedOn="$ClinStageDisease_8,$ClinStageSystem_8" 
                    CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          
          <tr style=" display:none;">
            <td><euc:EformTextBox RecordId="9" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_9" Runat="server" 
                Width="80px" ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="9" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_9" Runat="server" /></td>
            <td align="center">
                <euc:EformTextBox RecordId="9" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="ClinStageDisease_9" />
                 <euc:EformDropDownList RecordId="9"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_9" 
                        LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="9" ID="ClinStageT_9" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_9,$ClinStageSystem_9" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
            <td align="center">
                <euc:EformComboBox RecordId="9" ID="ClinStageN_9" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_9,$ClinStageSystem_9" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="9" ID="ClinStageM_9" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_9,$ClinStageSystem_9" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
                <euc:EformTextBox id="ClinStageQuality_9" RecordId="9" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
                    Width="1px" style="display:none"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="9" ID="ClinStageGroup_9" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
                    Width="100px" CascadeValuesBasedOn="$ClinStageDisease_9,$ClinStageSystem_9" 
                    CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          
          <tr style=" display:none;">
            <td><euc:EformTextBox RecordId="10" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_10" Runat="server" 
                Width="80px" ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden RecordId="10" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_10" Runat="server"/></td>
            <td align="center">
                <euc:EformTextBox RecordId="10" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="ClinStageDisease_10" />
                 <euc:EformDropDownList RecordId="10"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_10" 
                        LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="10" ID="ClinStageT_10" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_10,$ClinStageSystem_10" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
            <td align="center">
                <euc:EformComboBox RecordId="10" ID="ClinStageN_10" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_10,$ClinStageSystem_10" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="10" ID="ClinStageM_10" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_10,$ClinStageSystem_10" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
                <euc:EformTextBox id="ClinStageQuality_10" RecordId="10" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
                    Width="1px" style="display:none"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="10" ID="ClinStageGroup_10" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
                    Width="100px" CascadeValuesBasedOn="$ClinStageDisease_10,$ClinStageSystem_10" 
                    CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
      </table>
      <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PreTxClinStageTbl');" /><br /><br /><br />
  

<script type="text/javascript">
    //Adds events to controls
    function addStatusEvents(stType,stQlty)
    { 
        $(stType).addEvent('blur',curry(StatusAutoPopulates,stType,stQlty));
    }
 
    addStatusEvents($('<%= Status_1.ClientID %>'),$('<%= StatusQuality_1.ClientID %>'));
    addStatusEvents($('<%= Status_2.ClientID %>'),$('<%= StatusQuality_2.ClientID %>'));
    addStatusEvents($('<%= Status_3.ClientID %>'),$('<%= StatusQuality_3.ClientID %>'));
    addStatusEvents($('<%= Status_4.ClientID %>'),$('<%= StatusQuality_4.ClientID %>'));
    addStatusEvents($('<%= Status_5.ClientID %>'),$('<%= StatusQuality_5.ClientID %>'));


    function StatusAutoPopulates(stType,stQlty)
    {
       if (stType.value != '')
        {
           stQlty.value = 'STD';
        }
        else
        {
            stQlty.value = '';
        }
    }
    
    //updates clinstage autopopulates only if clinstagegrade value exists
    function clinstageaddEvents(clinStage,clinDisease,clinQlty)
    { 
        $(clinStage).addEvent('blur',curry(updatesClinStage,clinStage,clinDisease,clinQlty));
    } 
    clinstageaddEvents($('<%= ClinStageSystem_6.ClientID %>'),$('<%= ClinStageDisease_6.ClientID %>'),$('<%= ClinStageQuality_6.ClientID %>'));
    clinstageaddEvents($('<%= ClinStageSystem_7.ClientID %>'),$('<%= ClinStageDisease_7.ClientID %>'),$('<%= ClinStageQuality_7.ClientID %>'));
    clinstageaddEvents($('<%= ClinStageSystem_8.ClientID %>'),$('<%= ClinStageDisease_8.ClientID %>'),$('<%= ClinStageQuality_8.ClientID %>'));
    clinstageaddEvents($('<%= ClinStageSystem_9.ClientID %>'),$('<%= ClinStageDisease_9.ClientID %>'),$('<%= ClinStageQuality_9.ClientID %>'));
    clinstageaddEvents($('<%= ClinStageSystem_10.ClientID %>'),$('<%= ClinStageDisease_10.ClientID %>'),$('<%= ClinStageQuality_10.ClientID %>'));

    function updatesClinStage(clinStage,clinDisease,clinQlty)
    {
       if (clinStage.value != '')
        {
           clinDisease.value = 'Lung';
           clinQlty.value = 'STD';
        }
        else
        {
            clinDisease.value = '';
            clinQlty.value = '';
        }
    }
    
</script>
  