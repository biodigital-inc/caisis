<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.PriorLungCancerThoracic" CodeFile="PriorLungCancerThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.PathStageTbl = "PathStageTbl";
    tableArray.ClinStageTbl = "ClinStageTbl";
    
    function updateDates()
	 {
	    var procDt = $('<%= ProcDateText_1.ClientID %>').value;
	    if(procDt != '')
	    {
	        $('<%= PathDateText_1.ClientID %>').value = procDt;
	        $('<%= PathDate_1.ClientID %>').value = $('<%= ProcDate_1.ClientID %>').value;
	    }
	    else
	    {
	        $('<%= PathDateText_1.ClientID %>').value = '';
	        $('<%= PathDate_1.ClientID %>').value = '';
	    }
	 }
	 
	function updateProcDetails()
	{
	    if($('<%= ProcName_1.ClientID %>').value != '')
	    {
	        $('<%= ProcQuality_1.ClientID %>').value='STD';
	    }
	    else
	    {
	        $('<%= ProcQuality_1.ClientID %>').value='';
	    }
	}
	
	function updatePathDetails()
	{
	    if($('<%= PathHistology_1.ClientID %>').value != '')
	    {
	        $('<%= PathQuality_1.ClientID %>').value='STD';
	    }
	    else
	    {
	        $('<%= PathQuality_1.ClientID %>').value='';
	    }
	}
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PriorLungCancerThoracic" /><span class="controlBoxTitle">Prior Lung Cancer Procedure</span>

<table width="600" cellpadding="5" cellspacing="0" style="border: solid 1px #cccccc" id="PriorLungCancerTbl">
    <tr>
        <td>        
            <span></span> <br/>
            <table width="400" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ProcHtmlTable">
              <tr> 
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol">Procedure</td>
                <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>  
              <tr>
                <td><euc:EformTextBox  Width="80px" RecordId="1"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_1" Runat="server" ShowCalendar="true" CalcDate="true"  AppendToOnChange="UpdateAssociatedDate(this); updateDates();" />
	            <euc:EformHidden  RecordId="1"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_1"     Runat="server"/></td>
	            <td align="center"><euc:EformComboBox Width="150px" RecordId="1"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_1" 
	                LookupCode="ProcName,Disease,Thoracic" DropDownWidth="250px" Runat="server" onblur="updateProcDetails();" />
	                <euc:EformTextBox id="ProcQuality_1" RecordId="1" Table="Procedures" Field="ProcQuality" runat="server" Width="1px" style="display:none"/></td>
                <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table><br />

            <span class="controlBoxDataGridHeader">Prior Pathology</span> <br/>
            <table width="600" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="PathHtmlTbl">
              <tr> 
                <td>&nbsp;Date</td>
                <td><euc:EformTextBox RecordId="1" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_1" Runat="server" Width="80px" 
                    ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="1" TABLE="Pathology" FIELD="PathDate" ID="PathDate_1" Runat="server" />
                </td>
                <td>Histology</td>
                <td><euc:EformComboBox Width="150px" RecordId="1"  TABLE="Pathology" FIELD="PathHistology" ID="PathHistology_1" 
	                LookupCode="PathHistology,Disease,Thoracic" Runat="server" onblur="updatePathDetails();" DropDownHeight="auto" />
	                <euc:EformTextBox id="PathQuality_1" RecordId="1" Table="Pathology" Field="PathQuality" runat="server" Width="1px" style="display:none"/></td>
              </tr>  
              
              <tr>
                <td>&nbsp;Subsite</td>
                <td><euc:EformDropDownList Width="100px" RecordId="1"  TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_1" 
                    LookupCode="ThoracicBxSubsite" Runat="server" /></td>
                <td nowrap="nowrap">Prior Lung Resection</td>
                <td valign="top">
                    <euc:EformDropDownList id="PriorLungResection" Table="NoTable" Field="PriorLungResection" runat="server" 
                        LookupCode="PriorLungResection" /></td>	
              </tr>
              
              <tr>
                <td>&nbsp;Side</td>
                <td><euc:EformDropDownList Width="100px" RecordId="1"  TABLE="Pathology" FIELD="PathSide" ID="PathSide_1" 
                    LookupCode="OpSide,Disease,Thoracic" Runat="server" /></td>
                <td>Prior Lung Cancer</td>
                <td valign="top">
                    <euc:EformRadioButtonList Table="NoTable" Field="PriorLungCancer" ID="PriorLungCancer" runat="server" 
                        RepeatDirection="Horizontal" RepeatLayout="table">
                        <asp:ListItem Text="Sync" Value="Sync"></asp:ListItem>
                        <asp:ListItem Text="Metachronous" Value="Metachronous"></asp:ListItem>
                        <asp:ListItem Text="Persistent" Value="Persistent"></asp:ListItem>
                        <asp:ListItem Text="None" Value="None"></asp:ListItem>
                    </euc:EformRadioButtonList>  
                    <%--PathNotes is updated with Prior lung resection and cancer details in first control of next Eformsection--%>              
                    <euc:EformTextBox id="PathNotes_1" RecordId="1" Table="Pathology" Field="PathNotes" runat="server" Width="1px" style="display:none"/></td>	
              </tr>
              </table><br />
              
      <table id="PathStageTR" runat="server" style=" display:none;">
          <tr >
                <td colspan="4">      
                  <span class="controlBoxDataGridHeader">Prior Pathology Stages</span> <br/>
                    <table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PathStageTbl">
                      <tr> 
                        <td class="controlBoxDataGridHeaderFirstCol">System</td>
                        <td class="controlBoxDataGridHeaderFirstCol">T</td>
                        <td class="controlBoxDataGridHeaderFirstCol">N</td>
                        <td class="controlBoxDataGridHeaderFirstCol">M</td>
                        <td class="controlBoxDataGridHeaderFirstCol">Stage</td>
                        <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                      </tr>  
                      
                      <tr> 
                        <td align="center">
                            <euc:EformTextBox RecordId="1" TABLE="PathologyStageGrade" FIELD="PathStageDisease" Runat="server" Width="1px" 
                                style="display:none" ID="PathStageDisease_1" />
                            <euc:EformDropDownList RecordId="1"  TABLE="PathologyStageGrade" FIELD="PathStageSystem" 
	                            ID="PathStageSystem_1" LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="1" ID="PathStageT_1" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageT" Width="80px" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_T"/></td>  
	                    <td align="center">
	                        <euc:EformComboBox RecordId="1" ID="PathStageN_1" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageN" Width="80px" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_N"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="1" ID="PathStageM_1" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageM" Width="80px" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_M"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="1"  TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_1" 
                                Runat="server" Width="100px" CascadeValuesBasedOn="$PathStageDisease_1,$PathStageSystem_1" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_Group"/>
	                        <euc:EformTextBox id="PathQlty_1" RecordId="1" Table="PathologyStageGrade" Field="PathQuality" runat="server" 
	                            Width="1px" style="display:none"/></td>  
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                      </tr>  
                      
                       <tr> 
                        <td align="center">
                            <euc:EformTextBox RecordId="2" TABLE="PathologyStageGrade" FIELD="PathStageDisease" Runat="server" Width="1px" 
                                style="display:none" ID="PathStageDisease_2" />
                            <euc:EformDropDownList RecordId="2"  TABLE="PathologyStageGrade" FIELD="PathStageSystem" 
	                            ID="PathStageSystem_2" LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="2" ID="PathStageT_2" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageT" Width="80px" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_T"/></td>  
	                    <td align="center">
	                        <euc:EformComboBox RecordId="2" ID="PathStageN_2" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageN" Width="80px" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_N"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="2" ID="PathStageM_2" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageM" Width="80px" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_M"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="2"  TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_2" 
                                Runat="server" Width="100px" CascadeValuesBasedOn="$PathStageDisease_2,$PathStageSystem_2" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_Group"/>
	                        <euc:EformTextBox id="PathQlty_2" RecordId="2" Table="PathologyStageGrade" Field="PathQuality" runat="server" 
	                            Width="1px" style="display:none"/></td>  
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                      </tr>
                      
                      <tr style=" display:none;"> 
                        <td align="center">
                            <euc:EformTextBox RecordId="3" TABLE="PathologyStageGrade" FIELD="PathStageDisease" Runat="server" Width="1px" 
                                style="display:none" ID="PathStageDisease_3" />
                            <euc:EformDropDownList RecordId="3"  TABLE="PathologyStageGrade" FIELD="PathStageSystem" 
	                            ID="PathStageSystem_3" LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="3" ID="PathStageT_3" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageT" Width="80px" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_T"/></td>  
	                    <td align="center">
	                        <euc:EformComboBox RecordId="3" ID="PathStageN_3" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageN" Width="80px" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_N"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="3" ID="PathStageM_3" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageM" Width="80px" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_M"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="3"  TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_3" 
                                Runat="server" Width="100px" CascadeValuesBasedOn="$PathStageDisease_3,$PathStageSystem_3" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_Group"/>
	                        <euc:EformTextBox id="PathQlty_3" RecordId="3" Table="PathologyStageGrade" Field="PathQuality" runat="server" 
	                            Width="1px" style="display:none"/></td>
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                      </tr>
                      
                      <tr style=" display:none;"> 
                        <td align="center">
                            <euc:EformTextBox RecordId="4" TABLE="PathologyStageGrade" FIELD="PathStageDisease" Runat="server" Width="1px" 
                                style="display:none" ID="PathStageDisease_4" />
                            <euc:EformDropDownList RecordId="4"  TABLE="PathologyStageGrade" FIELD="PathStageSystem" 
	                            ID="PathStageSystem_4" LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="4" ID="PathStageT_4" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageT" Width="80px" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_T"/></td>  
	                    <td align="center">
	                        <euc:EformComboBox RecordId="4" ID="PathStageN_4" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageN" Width="80px" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_N"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="4" ID="PathStageM_4" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageM" Width="80px" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_M"/></td>
	                    <td align="center">
	                        <euc:EformComboBox RecordId="4"  TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_4" 
                                Runat="server" Width="100px" CascadeValuesBasedOn="$PathStageDisease_4,$PathStageSystem_4" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_Group"/>
	                        <euc:EformTextBox id="PathQlty_4" RecordId="4" Table="PathologyStageGrade" Field="PathQuality" runat="server" 
	                            Width="1px" style="display:none"/></td>
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
                      </tr>
                      
              <tr style=" display:none;"> 
                    <td align="center">
                            <euc:EformTextBox RecordId="5" TABLE="PathologyStageGrade" FIELD="PathStageDisease" Runat="server" Width="1px" 
                                style="display:none" ID="PathStageDisease_5" />
                            <euc:EformDropDownList RecordId="5"  TABLE="PathologyStageGrade" FIELD="PathStageSystem" 
	                            ID="PathStageSystem_5" LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
	                <td align="center">
	                        <euc:EformComboBox RecordId="5" ID="PathStageT_5" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageT" Width="80px" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_T"/></td>  
	                 <td align="center">
	                        <euc:EformComboBox RecordId="5" ID="PathStageN_5" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageN" Width="80px" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_N"/></td>
	                 <td align="center">
	                        <euc:EformComboBox RecordId="5" ID="PathStageM_5" runat="server" Table="PathologyStageGrade" 
	                            Field="PathStageM" Width="80px" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_M"/></td>
	                 <td align="center">
	                        <euc:EformComboBox RecordId="5"  TABLE="PathologyStageGrade" FIELD="PathStageGroup" ID="PathStageGroup_5" 
                                Runat="server" Width="100px" CascadeValuesBasedOn="$PathStageDisease_5,$PathStageSystem_5" 
	                            CascadeFormatString="StagePath_{0}_{n.1}_Group"/>
	                        <euc:EformTextBox id="PathQlty_5" RecordId="5" Table="PathologyStageGrade" Field="PathQuality" runat="server" 
	                            Width="1px" style="display:none"/></td>
                      <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
              </tr>
            </table>        
            <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PathStageTbl');" />
        </td>
      </tr>
    </table><br/>
    
    <span class="controlBoxDataGridHeader">Prior Clinical Stages</span> <br/>
    <table width="600" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ClinStageTbl">
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
            <td><euc:EformTextBox RecordId="1" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_1" Runat="server" 
                Width="80px" ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="1" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_1" Runat="server" /></td>
            <td align="center">
                <euc:EformTextBox RecordId="1" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="ClinStageDisease_1" />
                 <euc:EformDropDownList RecordId="1"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_1" 
                        LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="1" ID="ClinStageT_1" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_1,$ClinStageSystem_1" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
            <td align="center">
                <euc:EformComboBox RecordId="1" ID="ClinStageN_1" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_1,$ClinStageSystem_1" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="1" ID="ClinStageM_1" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_1,$ClinStageSystem_1" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
                <euc:EformTextBox id="ClinStageQuality_1" RecordId="1" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
                    Width="1px" style="display:none"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="1" ID="ClinStageGroup_1" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
                    Width="100px" CascadeValuesBasedOn="$ClinStageDisease_1,$ClinStageSystem_1" 
                    CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          
          <tr>
            <td><euc:EformTextBox RecordId="2" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_2" Runat="server" 
                Width="80px" ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="2" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_2" Runat="server" /></td>
            <td align="center">
                <euc:EformTextBox RecordId="2" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="ClinStageDisease_2" />
                 <euc:EformDropDownList RecordId="2"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_2" 
                        LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="2" ID="ClinStageT_2" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_2,$ClinStageSystem_2" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
            <td align="center">
                <euc:EformComboBox RecordId="2" ID="ClinStageN_2" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_2,$ClinStageSystem_2" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="2" ID="ClinStageM_2" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_2,$ClinStageSystem_2" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
                <euc:EformTextBox id="ClinStageQuality_2" RecordId="2" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
                    Width="1px" style="display:none"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="2" ID="ClinStageGroup_2" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
                    Width="100px" CascadeValuesBasedOn="$ClinStageDisease_2,$ClinStageSystem_2" 
                    CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          
          <tr style=" display:none;">
            <td><euc:EformTextBox RecordId="3" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_3" Runat="server" 
                Width="80px" ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="3" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_3" Runat="server" /></td>
            <td align="center">
                <euc:EformTextBox RecordId="3" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="ClinStageDisease_3" />
                 <euc:EformDropDownList RecordId="3"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_3" 
                        LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="3" ID="ClinStageT_3" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_3,$ClinStageSystem_3" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
            <td align="center">
                <euc:EformComboBox RecordId="3" ID="ClinStageN_3" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_3,$ClinStageSystem_3" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="3" ID="ClinStageM_3" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_3,$ClinStageSystem_3" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
                <euc:EformTextBox id="ClinStageQuality_3" RecordId="3" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
                    Width="1px" style="display:none"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="3" ID="ClinStageGroup_3" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
                    Width="100px" CascadeValuesBasedOn="$ClinStageDisease_3,$ClinStageSystem_3" 
                    CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          
          <tr style=" display:none;">
            <td><euc:EformTextBox RecordId="4" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_4" Runat="server" 
                Width="80px" ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="4" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_4" Runat="server" /></td>
            <td align="center">
                <euc:EformTextBox RecordId="4" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="ClinStageDisease_4" />
                 <euc:EformDropDownList RecordId="4"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_4" 
                        LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="4" ID="ClinStageT_4" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_4,$ClinStageSystem_4" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
            <td align="center">
                <euc:EformComboBox RecordId="4" ID="ClinStageN_4" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_4,$ClinStageSystem_4" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="4" ID="ClinStageM_4" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_4,$ClinStageSystem_4" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
                <euc:EformTextBox id="ClinStageQuality_4" RecordId="4" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
                    Width="1px" style="display:none"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="4" ID="ClinStageGroup_4" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
                    Width="100px" CascadeValuesBasedOn="$ClinStageDisease_4,$ClinStageSystem_4" 
                    CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          
          <tr style=" display:none;">
            <td><euc:EformTextBox RecordId="5" TABLE="ClinicalStages" FIELD="ClinStageDateText" ID="ClinStageDateText_5" Runat="server" 
                Width="80px" ShowCalendar="true" CalcDate="true"/>
	                <euc:EformHidden  RecordId="5" TABLE="ClinicalStages" FIELD="ClinStageDate" ID="ClinStageDate_5" Runat="server" /></td>
            <td align="center">
                <euc:EformTextBox RecordId="5" TABLE="ClinicalStages" FIELD="ClinStageDisease" Runat="server" Width="1px" 
                        style="display:none" ID="ClinStageDisease_5" />
                 <euc:EformDropDownList RecordId="5"  TABLE="ClinicalStages" FIELD="ClinStageSystem" ID="ClinStageSystem_5" 
                        LookupCode="StagingSystem,Disease,Thoracic" Runat="server"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="5" ID="ClinStageT_5" runat="server" Table="ClinicalStages" Field="ClinStageT" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_5,$ClinStageSystem_5" CascadeFormatString="StageClin_{0}_{n.1}_T"/></td>  
            <td align="center">
                <euc:EformComboBox RecordId="5" ID="ClinStageN_5" runat="server" Table="ClinicalStages" Field="ClinStageN" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_5,$ClinStageSystem_5" CascadeFormatString="StageClin_{0}_{n.1}_N"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="5" ID="ClinStageM_5" runat="server" Table="ClinicalStages" Field="ClinStageM" Width="80px" 
                    CascadeValuesBasedOn="$ClinStageDisease_5,$ClinStageSystem_5" CascadeFormatString="StageClin_{0}_{n.1}_M"/>
                <euc:EformTextBox id="ClinStageQuality_5" RecordId="5" Table="ClinicalStages" Field="ClinStageQuality" runat="server" 
                    Width="1px" style="display:none"/></td>
            <td align="center">
                <euc:EformComboBox RecordId="5" ID="ClinStageGroup_5" runat="server" Table="ClinicalStages" Field="ClinStageGroup" 
                    Width="100px" CascadeValuesBasedOn="$ClinStageDisease_5,$ClinStageSystem_5" 
                    CascadeFormatString="StageClin_{0}_{n.1}_Group"/></td>
            <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
      </table>
      <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ClinStageTbl');" /> 
        </td>
    </tr>
</table>

<script type="text/javascript">
    //updates pathstage autopopulates only if pathstagegrade value exists
    function addEvents(stageSystem,StageDisease,stageQlty)
    { 
        $(stageSystem).addEvent('blur',curry(AutoPopulates,stageSystem,StageDisease,stageQlty));
    } 
    addEvents($('<%= PathStageSystem_1.ClientID %>'),$('<%= PathStageDisease_1.ClientID %>'),$('<%= PathQlty_1.ClientID %>'));
    addEvents($('<%= PathStageSystem_2.ClientID %>'),$('<%= PathStageDisease_2.ClientID %>'),$('<%= PathQlty_2.ClientID %>'));
    addEvents($('<%= PathStageSystem_3.ClientID %>'),$('<%= PathStageDisease_3.ClientID %>'),$('<%= PathQlty_3.ClientID %>'));
    addEvents($('<%= PathStageSystem_4.ClientID %>'),$('<%= PathStageDisease_4.ClientID %>'),$('<%= PathQlty_4.ClientID %>'));
    addEvents($('<%= PathStageSystem_5.ClientID %>'),$('<%= PathStageDisease_5.ClientID %>'),$('<%= PathQlty_5.ClientID %>'));

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
    
    //shows path stage grade child record only if any field in parent Pathology record is entered
    function addEvnt(pathDate,pathHistology,pathSide,pathSubsite, pathStageRow)
    { 
        $(pathDate).addEvent('blur',curry(showHidePathStage,pathDate,pathHistology,pathSide,pathSubsite,pathStageRow));
        $(pathHistology).addEvent('blur',curry(showHidePathStage,pathDate,pathHistology,pathSide,pathSubsite,pathStageRow));
        $(pathSide).addEvent('blur',curry(showHidePathStage,pathDate,pathHistology,pathSide,pathSubsite,pathStageRow));
        $(pathSubsite).addEvent('blur',curry(showHidePathStage,pathDate,pathHistology,pathSide,pathSubsite,pathStageRow));
    } 
    addEvnt($('<%= PathDateText_1.ClientID %>'),$('<%= PathHistology_1.ClientID %>'),$('<%= PathSide_1.ClientID %>'),$('<%= PathSubsite_1.ClientID %>'),$('<%= PathStageTR.ClientID %>'));

    function showHidePathStage(pathDate,pathHistology,pathSide,pathSubsite,pathStageRow)
    {
       if (pathDate.value != '' || pathHistology.value != '' || pathSide.value != '' || pathSubsite.value != '')
        {
           pathStageRow.style.display = 'block';
        }
        else
        {
            pathStageRow.style.display = 'none';
        }
    }
    
    //updates clinstage autopopulates only if clinstagegrade value exists
    function clinstageaddEvents(clinStage,clinDisease,clinQlty)
    { 
        $(clinStage).addEvent('blur',curry(updatesClinStage,clinStage,clinDisease,clinQlty));
    } 
    clinstageaddEvents($('<%= ClinStageSystem_1.ClientID %>'),$('<%= ClinStageDisease_1.ClientID %>'),$('<%= ClinStageQuality_1.ClientID %>'));
    clinstageaddEvents($('<%= ClinStageSystem_2.ClientID %>'),$('<%= ClinStageDisease_2.ClientID %>'),$('<%= ClinStageQuality_2.ClientID %>'));
    clinstageaddEvents($('<%= ClinStageSystem_3.ClientID %>'),$('<%= ClinStageDisease_3.ClientID %>'),$('<%= ClinStageQuality_3.ClientID %>'));
    clinstageaddEvents($('<%= ClinStageSystem_4.ClientID %>'),$('<%= ClinStageDisease_4.ClientID %>'),$('<%= ClinStageQuality_4.ClientID %>'));
    clinstageaddEvents($('<%= ClinStageSystem_5.ClientID %>'),$('<%= ClinStageDisease_5.ClientID %>'),$('<%= ClinStageQuality_5.ClientID %>'));

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