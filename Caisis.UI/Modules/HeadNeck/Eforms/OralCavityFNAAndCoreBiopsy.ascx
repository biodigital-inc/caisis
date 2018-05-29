<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OralCavityFNAAndCoreBiopsy" CodeFile="OralCavityFNAAndCoreBiopsy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script language="javascript" type="text/javascript">
    tableArray.FNAHtmlTable = "FNAHtmlTable";
    tableArray.CoreHtmlTable = "CoreHtmlTable";
</script>

<a name="OralCavityFNAAndCoreBiopsy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle">FNA Biopsy ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="FNARecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="FNARecorded">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>
        </td>
    </tr>
</table>

<br />

<div id="FNADiv" runat="server" style="display: none;">
    <table cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue" id="FNAHtmlTable">
        <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Side</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Subsite</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Result</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left">Histology</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >Data Quality</td>
        </tr>
        
        <tr>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="1" ParentRecordId="1" ID="PathDateText_1" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="1" ParentRecordId="1" ID="PathDate_1" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ID="OpDateText_1" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ID="OpDate_1" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ID="OpQuality_1" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1"  ID="ProcDateText_1" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1"  ID="ProcDate_1" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1"  ID="ProcName_1" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1"  ID="ProcSite_1" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1"  ID="ProcSide_1" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1"  ID="ProcSubsite_1" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1"  ID="ProcQuality_1" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1"  ID="PathSpecimenType_1" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ParentRecordId="1"  ID="PathSite_1" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="1" ParentRecordId="1" ID="PathSide_1" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="1" ParentRecordId="1" ID="PathSubsite_1" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="1" ParentRecordId="1" ID="PathResult_1" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="1" ParentRecordId="1" ID="PathHistology_1" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="1" ParentRecordId="1" ID="PathQuality_1" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_1"  runat="server"/></td>
        </tr>
        
        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="2" ParentRecordId="2" ID="PathDateText_2" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="2" ParentRecordId="2" ID="PathDate_2" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ID="OpDateText_2" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ID="OpDate_2" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ID="OpQuality_2" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="2"  ID="ProcDateText_2" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="2"  ID="ProcDate_2" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="2"  ID="ProcName_2" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="2"  ID="ProcSite_2" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="2"  ID="ProcSide_2" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="2"  ID="ProcSubsite_2" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="2"  ID="ProcQuality_2" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="2"  ID="PathSpecimenType_2" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2" ParentRecordId="2"  ID="PathSite_2" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="2" ParentRecordId="2" ID="PathSide_2" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="2" ParentRecordId="2" ID="PathSubsite_2" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="2" ParentRecordId="2" ID="PathResult_2" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="2" ParentRecordId="2" ID="PathHistology_2" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="2" ParentRecordId="2" ID="PathQuality_2" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_2"  runat="server"/></td>
        </tr>
 
        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="3" ParentRecordId="3" ID="PathDateText_3" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="3" ParentRecordId="3" ID="PathDate_3" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ID="OpDateText_3" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ID="OpDate_3" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ID="OpQuality_3" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="3"  ID="ProcDateText_3" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="3"  ID="ProcDate_3" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="3"  ID="ProcName_3" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="3"  ID="ProcSite_3" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="3"  ID="ProcSide_3" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="3"  ID="ProcSubsite_3" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="3"  ID="ProcQuality_3" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="3"  ID="PathSpecimenType_3" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="3" ParentRecordId="3"  ID="PathSite_3" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="3" ParentRecordId="3" ID="PathSide_3" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="3" ParentRecordId="3" ID="PathSubsite_3" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="3" ParentRecordId="3" ID="PathResult_3" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="3" ParentRecordId="3" ID="PathHistology_3" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="3" ParentRecordId="3" ID="PathQuality_3" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_3"  runat="server"/></td>
        </tr>
       
        <tr style="display: none; ">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="4" ParentRecordId="4" ID="PathDateText_4" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="4" ParentRecordId="4" ID="PathDate_4" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ID="OpDateText_4" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ID="OpDate_4" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ID="OpQuality_4" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="4"  ID="ProcDateText_4" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="4"  ID="ProcDate_4" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="4"  ID="ProcName_4" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="4"  ID="ProcSite_4" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="4"  ID="ProcSide_4" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="4"  ID="ProcSubsite_4" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="4"  ID="ProcQuality_4" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="4"  ID="PathSpecimenType_4" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="4" ParentRecordId="4"  ID="PathSite_4" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="4" ParentRecordId="4" ID="PathSide_4" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="4" ParentRecordId="4" ID="PathSubsite_4" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="4" ParentRecordId="4" ID="PathResult_4" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="4" ParentRecordId="4" ID="PathHistology_4" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="4" ParentRecordId="4" ID="PathQuality_4" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_4"  runat="server"/></td>
        </tr>

        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="5" ParentRecordId="5" ID="PathDateText_5" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="5" ParentRecordId="5" ID="PathDate_5" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ID="OpDateText_5" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ID="OpDate_5" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ID="OpQuality_5" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="5"  ID="ProcDateText_5" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="5"  ID="ProcDate_5" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="5"  ID="ProcName_5" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="5"  ID="ProcSite_5" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="5"  ID="ProcSide_5" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="5"  ID="ProcSubsite_5" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="5"  ID="ProcQuality_5" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="5"  ID="PathSpecimenType_5" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="5" ParentRecordId="5"  ID="PathSite_5" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="5" ParentRecordId="5" ID="PathSide_5" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="5" ParentRecordId="5" ID="PathSubsite_5" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="5" ParentRecordId="5" ID="PathResult_5" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="5" ParentRecordId="5" ID="PathHistology_5" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="5" ParentRecordId="5" ID="PathQuality_5" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_5"  runat="server"/></td>
        </tr>
        
    </table>
    <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'FNAHtmlTable');" />
</div>

<br /><br />

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle">Core Biopsy ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="CoreRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="CoreRecorded">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>
        </td>
    </tr>
</table>

<br />

<div id="CoreDiv" runat="server" style="display: none;">
    <table cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="CoreHtmlTable">
        <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Side</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Subsite</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Result</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left">Histology</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >Data Quality</td>
        </tr>
        
        <tr>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="6" ParentRecordId="6" ID="PathDateText_6" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="6" ParentRecordId="6" ID="PathDate_6" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ID="OpDateText_6" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ID="OpDate_6" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ID="OpQuality_6" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ParentRecordId="6"  ID="ProcDateText_6" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ParentRecordId="6"  ID="ProcDate_6" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ParentRecordId="6"  ID="ProcName_6" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ParentRecordId="6"  ID="ProcSite_6" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ParentRecordId="6"  ID="ProcSide_6" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ParentRecordId="6"  ID="ProcSubsite_6" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ParentRecordId="6"  ID="ProcQuality_6" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ParentRecordId="6"  ID="PathSpecimenType_6" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="6" ParentRecordId="6"  ID="PathSite_6" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="6" ParentRecordId="6" ID="PathSide_6" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="6" ParentRecordId="6" ID="PathSubsite_6" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="6" ParentRecordId="6" ID="PathResult_6" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="6" ParentRecordId="6" ID="PathHistology_6" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="6" ParentRecordId="6" ID="PathQuality_6" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_6"  runat="server"/></td>
        </tr>
        
        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="7" ParentRecordId="7" ID="PathDateText_7" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="7" ParentRecordId="7" ID="PathDate_7" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ID="OpDateText_7" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ID="OpDate_7" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ID="OpQuality_7" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ParentRecordId="7"  ID="ProcDateText_7" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ParentRecordId="7"  ID="ProcDate_7" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ParentRecordId="7"  ID="ProcName_7" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ParentRecordId="7"  ID="ProcSite_7" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ParentRecordId="7"  ID="ProcSide_7" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ParentRecordId="7"  ID="ProcSubsite_7" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ParentRecordId="7"  ID="ProcQuality_7" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ParentRecordId="7"  ID="PathSpecimenType_7" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="7" ParentRecordId="7"  ID="PathSite_7" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="7" ParentRecordId="7" ID="PathSide_7" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="7" ParentRecordId="7" ID="PathSubsite_7" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="7" ParentRecordId="7" ID="PathResult_7" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="7" ParentRecordId="7" ID="PathHistology_7" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="7" ParentRecordId="7" ID="PathQuality_7" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_7"  runat="server"/></td>
        </tr>
 
        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="8" ParentRecordId="8" ID="PathDateText_8" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="8" ParentRecordId="8" ID="PathDate_8" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ID="OpDateText_8" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ID="OpDate_8" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ID="OpQuality_8" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ParentRecordId="8"  ID="ProcDateText_8" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ParentRecordId="8"  ID="ProcDate_8" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ParentRecordId="8"  ID="ProcName_8" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ParentRecordId="8"  ID="ProcSite_8" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ParentRecordId="8"  ID="ProcSide_8" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ParentRecordId="8"  ID="ProcSubsite_8" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ParentRecordId="8"  ID="ProcQuality_8" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ParentRecordId="8"  ID="PathSpecimenType_8" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="8" ParentRecordId="8"  ID="PathSite_8" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="8" ParentRecordId="8" ID="PathSide_8" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="8" ParentRecordId="8" ID="PathSubsite_8" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="8" ParentRecordId="8" ID="PathResult_8" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="8" ParentRecordId="8" ID="PathHistology_8" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="8" ParentRecordId="8" ID="PathQuality_8" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_8"  runat="server"/></td>
        </tr>
       
        <tr style="display: none; ">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="9" ParentRecordId="9" ID="PathDateText_9" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="9" ParentRecordId="9" ID="PathDate_9" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ID="OpDateText_9" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ID="OpDate_9" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ID="OpQuality_9" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ParentRecordId="9"  ID="ProcDateText_9" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ParentRecordId="9"  ID="ProcDate_9" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ParentRecordId="9"  ID="ProcName_9" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ParentRecordId="9"  ID="ProcSite_9" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ParentRecordId="9"  ID="ProcSide_9" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ParentRecordId="9"  ID="ProcSubsite_9" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ParentRecordId="9"  ID="ProcQuality_9" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ParentRecordId="9"  ID="PathSpecimenType_9" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="9" ParentRecordId="9"  ID="PathSite_9" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="9" ParentRecordId="9" ID="PathSide_9" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="9" ParentRecordId="9" ID="PathSubsite_9" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="9" ParentRecordId="9" ID="PathResult_9" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="9" ParentRecordId="9" ID="PathHistology_9" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="9" ParentRecordId="9" ID="PathQuality_9" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_9"  runat="server"/></td>
        </tr>

        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="10" ParentRecordId="10" ID="PathDateText_10" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="10" ParentRecordId="10" ID="PathDate_10" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ID="OpDateText_10" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ID="OpDate_10" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ID="OpQuality_10" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ParentRecordId="10"  ID="ProcDateText_10" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ParentRecordId="10"  ID="ProcDate_10" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ParentRecordId="10"  ID="ProcName_10" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ParentRecordId="10"  ID="ProcSite_10" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ParentRecordId="10"  ID="ProcSide_10" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ParentRecordId="10"  ID="ProcSubsite_10" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ParentRecordId="10"  ID="ProcQuality_10" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ParentRecordId="10"  ID="PathSpecimenType_10" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="10" ParentRecordId="10"  ID="PathSite_10" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="10" ParentRecordId="10" ID="PathSide_10" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="10" ParentRecordId="10" ID="PathSubsite_10" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="10" ParentRecordId="10" ID="PathResult_10" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="10" ParentRecordId="10" ID="PathHistology_10" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="10" ParentRecordId="10" ID="PathQuality_10" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_10"  runat="server"/></td>
        </tr>
        
    </table>
    <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'CoreHtmlTable');" />
</div>

<br /><br />

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle">Punch Biopsy ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="PunchRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="PunchRecorded">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>
        </td>
    </tr>
</table>

<br />

<div id="PunchDiv" runat="server" style="display: none;">
    <table cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="PunchHtmlTable">
        <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Side</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Subsite</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Result</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left">Histology</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >Data Quality</td>
        </tr>
        
        <tr>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="36" ParentRecordId="36" ID="PathDateText_36" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="36" ParentRecordId="36" ID="PathDate_36" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ID="OpDateText_36" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ID="OpDate_36" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ID="OpQuality_36" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ParentRecordId="36"  ID="ProcDateText_36" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ParentRecordId="36"  ID="ProcDate_36" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ParentRecordId="36"  ID="ProcName_36" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ParentRecordId="36"  ID="ProcSite_36" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ParentRecordId="36"  ID="ProcSide_36" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ParentRecordId="36"  ID="ProcSubsite_36" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ParentRecordId="36"  ID="ProcQuality_36" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ParentRecordId="36"  ID="PathSpecimenType_36" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="36" ParentRecordId="36"  ID="PathSite_36" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="36" ParentRecordId="36" ID="PathSide_36" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="36" ParentRecordId="36" ID="PathSubsite_36" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="36" ParentRecordId="36" ID="PathResult_36" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="36" ParentRecordId="36" ID="PathHistology_36" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="36" ParentRecordId="36" ID="PathQuality_36" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_36"  runat="server"/></td>
        </tr>
        
        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="37" ParentRecordId="37" ID="PathDateText_37" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="37" ParentRecordId="37" ID="PathDate_37" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ID="OpDateText_37" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ID="OpDate_37" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ID="OpQuality_37" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ParentRecordId="37"  ID="ProcDateText_37" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ParentRecordId="37"  ID="ProcDate_37" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ParentRecordId="37"  ID="ProcName_37" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ParentRecordId="37"  ID="ProcSite_37" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ParentRecordId="37"  ID="ProcSide_37" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ParentRecordId="37"  ID="ProcSubsite_37" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ParentRecordId="37"  ID="ProcQuality_37" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ParentRecordId="37"  ID="PathSpecimenType_37" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="37" ParentRecordId="37"  ID="PathSite_37" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="37" ParentRecordId="37" ID="PathSide_37" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="37" ParentRecordId="37" ID="PathSubsite_37" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="37" ParentRecordId="37" ID="PathResult_37" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="37" ParentRecordId="37" ID="PathHistology_37" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="37" ParentRecordId="37" ID="PathQuality_37" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_37"  runat="server"/></td>
        </tr>
 
        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="38" ParentRecordId="38" ID="PathDateText_38" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="38" ParentRecordId="38" ID="PathDate_38" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ID="OpDateText_38" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ID="OpDate_38" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ID="OpQuality_38" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ParentRecordId="38"  ID="ProcDateText_38" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ParentRecordId="38"  ID="ProcDate_38" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ParentRecordId="38"  ID="ProcName_38" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ParentRecordId="38"  ID="ProcSite_38" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ParentRecordId="38"  ID="ProcSide_38" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ParentRecordId="38"  ID="ProcSubsite_38" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ParentRecordId="38"  ID="ProcQuality_38" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ParentRecordId="38"  ID="PathSpecimenType_38" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="38" ParentRecordId="38"  ID="PathSite_38" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="38" ParentRecordId="38" ID="PathSide_38" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="38" ParentRecordId="38" ID="PathSubsite_38" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="38" ParentRecordId="38" ID="PathResult_38" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="38" ParentRecordId="38" ID="PathHistology_38" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="38" ParentRecordId="38" ID="PathQuality_38" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_38"  runat="server"/></td>
        </tr>
       
        <tr style="display: none; ">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="39" ParentRecordId="39" ID="PathDateText_39" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="39" ParentRecordId="39" ID="PathDate_39" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ID="OpDateText_39" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ID="OpDate_39" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ID="OpQuality_39" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ParentRecordId="39"  ID="ProcDateText_39" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ParentRecordId="39"  ID="ProcDate_39" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ParentRecordId="39"  ID="ProcName_39" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ParentRecordId="39"  ID="ProcSite_39" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ParentRecordId="39"  ID="ProcSide_39" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ParentRecordId="39"  ID="ProcSubsite_39" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ParentRecordId="39"  ID="ProcQuality_39" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ParentRecordId="39"  ID="PathSpecimenType_39" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="39" ParentRecordId="39"  ID="PathSite_39" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="39" ParentRecordId="39" ID="PathSide_39" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="39" ParentRecordId="39" ID="PathSubsite_39" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="39" ParentRecordId="39" ID="PathResult_39" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="39" ParentRecordId="39" ID="PathHistology_39" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="39" ParentRecordId="39" ID="PathQuality_39" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_39"  runat="server"/></td>
        </tr>

        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="40" ParentRecordId="40" ID="PathDateText_40" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="40" ParentRecordId="40" ID="PathDate_40" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ID="OpDateText_40" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ID="OpDate_40" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ID="OpQuality_40" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ParentRecordId="40"  ID="ProcDateText_40" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ParentRecordId="40"  ID="ProcDate_40" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ParentRecordId="40"  ID="ProcName_40" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ParentRecordId="40"  ID="ProcSite_40" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ParentRecordId="40"  ID="ProcSide_40" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ParentRecordId="40"  ID="ProcSubsite_40" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ParentRecordId="40"  ID="ProcQuality_40" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ParentRecordId="40"  ID="PathSpecimenType_40" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="40" ParentRecordId="40"  ID="PathSite_40" TABLE="Pathology" FIELD="PathSite" />  		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="40" ParentRecordId="40" ID="PathSide_40" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="40" ParentRecordId="40" ID="PathSubsite_40" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="40" ParentRecordId="40" ID="PathResult_40" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="40" ParentRecordId="40" ID="PathHistology_40" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="40" ParentRecordId="40" ID="PathQuality_40" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_40"  runat="server"/></td>
        </tr>
        
    </table>
    <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PunchHtmlTable');" />
</div>
<br/><br/><br/>

  <script type="text/javascript">

    addAbsentEvent($('<%= FNARecorded.ClientID %>'),$('<%= FNADiv.ClientID %>'),$('<%= OpDateText_1.ClientID %>'),$('<%= OpDate_1.ClientID %>'),$('<%= OpQuality_1.ClientID %>'),$('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcName_1.ClientID %>'),$('<%= ProcSite_1.ClientID %>'),$('<%= ProcSide_1.ClientID %>'),$('<%= ProcSubsite_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'),$('<%= PathSpecimenType_1.ClientID %>'),$('<%= PathSite_1.ClientID %>'),$('<%= PathDateText_1.ClientID %>'),$('<%= PathDate_1.ClientID %>'),$('<%= PathSide_1.ClientID %>'),$('<%= PathSubsite_1.ClientID %>'),$('<%= PathResult_1.ClientID %>'),$('<%= PathHistology_1.ClientID %>'),$('<%= PathQuality_1.ClientID %>'),'Fine Needle Aspirate');
    addAbsentEvent($('<%= FNARecorded.ClientID %>'),$('<%= FNADiv.ClientID %>'),$('<%= OpDateText_2.ClientID %>'),$('<%= OpDate_2.ClientID %>'),$('<%= OpQuality_2.ClientID %>'),$('<%= ProcDateText_2.ClientID %>'),$('<%= ProcDate_2.ClientID %>'),$('<%= ProcName_2.ClientID %>'),$('<%= ProcSite_2.ClientID %>'),$('<%= ProcSide_2.ClientID %>'),$('<%= ProcSubsite_2.ClientID %>'),$('<%= ProcQuality_2.ClientID %>'),$('<%= PathSpecimenType_2.ClientID %>'),$('<%= PathSite_2.ClientID %>'),$('<%= PathDateText_2.ClientID %>'),$('<%= PathDate_2.ClientID %>'),$('<%= PathSide_2.ClientID %>'),$('<%= PathSubsite_2.ClientID %>'),$('<%= PathResult_2.ClientID %>'),$('<%= PathHistology_2.ClientID %>'),$('<%= PathQuality_2.ClientID %>'),'Fine Needle Aspirate');
    addAbsentEvent($('<%= FNARecorded.ClientID %>'),$('<%= FNADiv.ClientID %>'),$('<%= OpDateText_3.ClientID %>'),$('<%= OpDate_3.ClientID %>'),$('<%= OpQuality_3.ClientID %>'),$('<%= ProcDateText_3.ClientID %>'),$('<%= ProcDate_3.ClientID %>'),$('<%= ProcName_3.ClientID %>'),$('<%= ProcSite_3.ClientID %>'),$('<%= ProcSide_3.ClientID %>'),$('<%= ProcSubsite_3.ClientID %>'),$('<%= ProcQuality_3.ClientID %>'),$('<%= PathSpecimenType_3.ClientID %>'),$('<%= PathSite_3.ClientID %>'),$('<%= PathDateText_3.ClientID %>'),$('<%= PathDate_3.ClientID %>'),$('<%= PathSide_3.ClientID %>'),$('<%= PathSubsite_3.ClientID %>'),$('<%= PathResult_3.ClientID %>'),$('<%= PathHistology_3.ClientID %>'),$('<%= PathQuality_3.ClientID %>'),'Fine Needle Aspirate');
    addAbsentEvent($('<%= FNARecorded.ClientID %>'),$('<%= FNADiv.ClientID %>'),$('<%= OpDateText_4.ClientID %>'),$('<%= OpDate_4.ClientID %>'),$('<%= OpQuality_4.ClientID %>'),$('<%= ProcDateText_4.ClientID %>'),$('<%= ProcDate_4.ClientID %>'),$('<%= ProcName_4.ClientID %>'),$('<%= ProcSite_4.ClientID %>'),$('<%= ProcSide_4.ClientID %>'),$('<%= ProcSubsite_4.ClientID %>'),$('<%= ProcQuality_4.ClientID %>'),$('<%= PathSpecimenType_4.ClientID %>'),$('<%= PathSite_4.ClientID %>'),$('<%= PathDateText_4.ClientID %>'),$('<%= PathDate_4.ClientID %>'),$('<%= PathSide_4.ClientID %>'),$('<%= PathSubsite_4.ClientID %>'),$('<%= PathResult_4.ClientID %>'),$('<%= PathHistology_4.ClientID %>'),$('<%= PathQuality_4.ClientID %>'),'Fine Needle Aspirate');
    addAbsentEvent($('<%= FNARecorded.ClientID %>'),$('<%= FNADiv.ClientID %>'),$('<%= OpDateText_5.ClientID %>'),$('<%= OpDate_5.ClientID %>'),$('<%= OpQuality_5.ClientID %>'),$('<%= ProcDateText_5.ClientID %>'),$('<%= ProcDate_5.ClientID %>'),$('<%= ProcName_5.ClientID %>'),$('<%= ProcSite_5.ClientID %>'),$('<%= ProcSide_5.ClientID %>'),$('<%= ProcSubsite_5.ClientID %>'),$('<%= ProcQuality_5.ClientID %>'),$('<%= PathSpecimenType_5.ClientID %>'),$('<%= PathSite_5.ClientID %>'),$('<%= PathDateText_5.ClientID %>'),$('<%= PathDate_5.ClientID %>'),$('<%= PathSide_5.ClientID %>'),$('<%= PathSubsite_5.ClientID %>'),$('<%= PathResult_5.ClientID %>'),$('<%= PathHistology_5.ClientID %>'),$('<%= PathQuality_5.ClientID %>'),'Fine Needle Aspirate');

    addAbsentEvent($('<%= CoreRecorded.ClientID %>'),$('<%= CoreDiv.ClientID %>'),$('<%= OpDateText_6.ClientID %>'),$('<%= OpDate_6.ClientID %>'),$('<%= OpQuality_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= ProcName_6.ClientID %>'),$('<%= ProcSite_6.ClientID %>'),$('<%= ProcSide_6.ClientID %>'),$('<%= ProcSubsite_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'),$('<%= PathSpecimenType_6.ClientID %>'),$('<%= PathSite_6.ClientID %>'),$('<%= PathDateText_6.ClientID %>'),$('<%= PathDate_6.ClientID %>'),$('<%= PathSide_6.ClientID %>'),$('<%= PathSubsite_6.ClientID %>'),$('<%= PathResult_6.ClientID %>'),$('<%= PathHistology_6.ClientID %>'),$('<%= PathQuality_6.ClientID %>'),'Core Biopsy');
    addAbsentEvent($('<%= CoreRecorded.ClientID %>'),$('<%= CoreDiv.ClientID %>'),$('<%= OpDateText_7.ClientID %>'),$('<%= OpDate_7.ClientID %>'),$('<%= OpQuality_7.ClientID %>'),$('<%= ProcDateText_7.ClientID %>'),$('<%= ProcDate_7.ClientID %>'),$('<%= ProcName_7.ClientID %>'),$('<%= ProcSite_7.ClientID %>'),$('<%= ProcSide_7.ClientID %>'),$('<%= ProcSubsite_7.ClientID %>'),$('<%= ProcQuality_7.ClientID %>'),$('<%= PathSpecimenType_7.ClientID %>'),$('<%= PathSite_7.ClientID %>'),$('<%= PathDateText_7.ClientID %>'),$('<%= PathDate_7.ClientID %>'),$('<%= PathSide_7.ClientID %>'),$('<%= PathSubsite_7.ClientID %>'),$('<%= PathResult_7.ClientID %>'),$('<%= PathHistology_7.ClientID %>'),$('<%= PathQuality_7.ClientID %>'),'Core Biopsy');
    addAbsentEvent($('<%= CoreRecorded.ClientID %>'),$('<%= CoreDiv.ClientID %>'),$('<%= OpDateText_8.ClientID %>'),$('<%= OpDate_8.ClientID %>'),$('<%= OpQuality_8.ClientID %>'),$('<%= ProcDateText_8.ClientID %>'),$('<%= ProcDate_8.ClientID %>'),$('<%= ProcName_8.ClientID %>'),$('<%= ProcSite_8.ClientID %>'),$('<%= ProcSide_8.ClientID %>'),$('<%= ProcSubsite_8.ClientID %>'),$('<%= ProcQuality_8.ClientID %>'),$('<%= PathSpecimenType_8.ClientID %>'),$('<%= PathSite_8.ClientID %>'),$('<%= PathDateText_8.ClientID %>'),$('<%= PathDate_8.ClientID %>'),$('<%= PathSide_8.ClientID %>'),$('<%= PathSubsite_8.ClientID %>'),$('<%= PathResult_8.ClientID %>'),$('<%= PathHistology_8.ClientID %>'),$('<%= PathQuality_8.ClientID %>'),'Core Biopsy');
    addAbsentEvent($('<%= CoreRecorded.ClientID %>'),$('<%= CoreDiv.ClientID %>'),$('<%= OpDateText_9.ClientID %>'),$('<%= OpDate_9.ClientID %>'),$('<%= OpQuality_9.ClientID %>'),$('<%= ProcDateText_9.ClientID %>'),$('<%= ProcDate_9.ClientID %>'),$('<%= ProcName_9.ClientID %>'),$('<%= ProcSite_9.ClientID %>'),$('<%= ProcSide_9.ClientID %>'),$('<%= ProcSubsite_9.ClientID %>'),$('<%= ProcQuality_9.ClientID %>'),$('<%= PathSpecimenType_9.ClientID %>'),$('<%= PathSite_9.ClientID %>'),$('<%= PathDateText_9.ClientID %>'),$('<%= PathDate_9.ClientID %>'),$('<%= PathSide_9.ClientID %>'),$('<%= PathSubsite_9.ClientID %>'),$('<%= PathResult_9.ClientID %>'),$('<%= PathHistology_9.ClientID %>'),$('<%= PathQuality_9.ClientID %>'),'Core Biopsy');
    addAbsentEvent($('<%= CoreRecorded.ClientID %>'),$('<%= CoreDiv.ClientID %>'),$('<%= OpDateText_10.ClientID %>'),$('<%= OpDate_10.ClientID %>'),$('<%= OpQuality_10.ClientID %>'),$('<%= ProcDateText_10.ClientID %>'),$('<%= ProcDate_10.ClientID %>'),$('<%= ProcName_10.ClientID %>'),$('<%= ProcSite_10.ClientID %>'),$('<%= ProcSide_10.ClientID %>'),$('<%= ProcSubsite_10.ClientID %>'),$('<%= ProcQuality_10.ClientID %>'),$('<%= PathSpecimenType_10.ClientID %>'),$('<%= PathSite_10.ClientID %>'),$('<%= PathDateText_10.ClientID %>'),$('<%= PathDate_10.ClientID %>'),$('<%= PathSide_10.ClientID %>'),$('<%= PathSubsite_10.ClientID %>'),$('<%= PathResult_10.ClientID %>'),$('<%= PathHistology_10.ClientID %>'),$('<%= PathQuality_10.ClientID %>'),'Core Biopsy');

    addAbsentEvent($('<%= PunchRecorded.ClientID %>'),$('<%= PunchDiv.ClientID %>'),$('<%= OpDateText_36.ClientID %>'),$('<%= OpDate_36.ClientID %>'),$('<%= OpQuality_36.ClientID %>'),$('<%= ProcDateText_36.ClientID %>'),$('<%= ProcDate_36.ClientID %>'),$('<%= ProcName_36.ClientID %>'),$('<%= ProcSite_36.ClientID %>'),$('<%= ProcSide_36.ClientID %>'),$('<%= ProcSubsite_36.ClientID %>'),$('<%= ProcQuality_36.ClientID %>'),$('<%= PathSpecimenType_36.ClientID %>'),$('<%= PathSite_36.ClientID %>'),$('<%= PathDateText_36.ClientID %>'),$('<%= PathDate_36.ClientID %>'),$('<%= PathSide_36.ClientID %>'),$('<%= PathSubsite_36.ClientID %>'),$('<%= PathResult_36.ClientID %>'),$('<%= PathHistology_36.ClientID %>'),$('<%= PathQuality_36.ClientID %>'),'Punch Biopsy');
    addAbsentEvent($('<%= PunchRecorded.ClientID %>'),$('<%= PunchDiv.ClientID %>'),$('<%= OpDateText_37.ClientID %>'),$('<%= OpDate_37.ClientID %>'),$('<%= OpQuality_37.ClientID %>'),$('<%= ProcDateText_37.ClientID %>'),$('<%= ProcDate_37.ClientID %>'),$('<%= ProcName_37.ClientID %>'),$('<%= ProcSite_37.ClientID %>'),$('<%= ProcSide_37.ClientID %>'),$('<%= ProcSubsite_37.ClientID %>'),$('<%= ProcQuality_37.ClientID %>'),$('<%= PathSpecimenType_37.ClientID %>'),$('<%= PathSite_37.ClientID %>'),$('<%= PathDateText_37.ClientID %>'),$('<%= PathDate_37.ClientID %>'),$('<%= PathSide_37.ClientID %>'),$('<%= PathSubsite_37.ClientID %>'),$('<%= PathResult_37.ClientID %>'),$('<%= PathHistology_37.ClientID %>'),$('<%= PathQuality_37.ClientID %>'),'Punch Biopsy');
    addAbsentEvent($('<%= PunchRecorded.ClientID %>'),$('<%= PunchDiv.ClientID %>'),$('<%= OpDateText_38.ClientID %>'),$('<%= OpDate_38.ClientID %>'),$('<%= OpQuality_38.ClientID %>'),$('<%= ProcDateText_38.ClientID %>'),$('<%= ProcDate_38.ClientID %>'),$('<%= ProcName_38.ClientID %>'),$('<%= ProcSite_38.ClientID %>'),$('<%= ProcSide_38.ClientID %>'),$('<%= ProcSubsite_38.ClientID %>'),$('<%= ProcQuality_38.ClientID %>'),$('<%= PathSpecimenType_38.ClientID %>'),$('<%= PathSite_38.ClientID %>'),$('<%= PathDateText_38.ClientID %>'),$('<%= PathDate_38.ClientID %>'),$('<%= PathSide_38.ClientID %>'),$('<%= PathSubsite_38.ClientID %>'),$('<%= PathResult_38.ClientID %>'),$('<%= PathHistology_38.ClientID %>'),$('<%= PathQuality_38.ClientID %>'),'Punch Biopsy');
    addAbsentEvent($('<%= PunchRecorded.ClientID %>'),$('<%= PunchDiv.ClientID %>'),$('<%= OpDateText_39.ClientID %>'),$('<%= OpDate_39.ClientID %>'),$('<%= OpQuality_39.ClientID %>'),$('<%= ProcDateText_39.ClientID %>'),$('<%= ProcDate_39.ClientID %>'),$('<%= ProcName_39.ClientID %>'),$('<%= ProcSite_39.ClientID %>'),$('<%= ProcSide_39.ClientID %>'),$('<%= ProcSubsite_39.ClientID %>'),$('<%= ProcQuality_39.ClientID %>'),$('<%= PathSpecimenType_39.ClientID %>'),$('<%= PathSite_39.ClientID %>'),$('<%= PathDateText_39.ClientID %>'),$('<%= PathDate_39.ClientID %>'),$('<%= PathSide_39.ClientID %>'),$('<%= PathSubsite_39.ClientID %>'),$('<%= PathResult_39.ClientID %>'),$('<%= PathHistology_39.ClientID %>'),$('<%= PathQuality_39.ClientID %>'),'Punch Biopsy');
    addAbsentEvent($('<%= PunchRecorded.ClientID %>'),$('<%= PunchDiv.ClientID %>'),$('<%= OpDateText_40.ClientID %>'),$('<%= OpDate_40.ClientID %>'),$('<%= OpQuality_40.ClientID %>'),$('<%= ProcDateText_40.ClientID %>'),$('<%= ProcDate_40.ClientID %>'),$('<%= ProcName_40.ClientID %>'),$('<%= ProcSite_40.ClientID %>'),$('<%= ProcSide_40.ClientID %>'),$('<%= ProcSubsite_40.ClientID %>'),$('<%= ProcQuality_40.ClientID %>'),$('<%= PathSpecimenType_40.ClientID %>'),$('<%= PathSite_40.ClientID %>'),$('<%= PathDateText_40.ClientID %>'),$('<%= PathDate_40.ClientID %>'),$('<%= PathSide_40.ClientID %>'),$('<%= PathSubsite_40.ClientID %>'),$('<%= PathResult_40.ClientID %>'),$('<%= PathHistology_40.ClientID %>'),$('<%= PathQuality_40.ClientID %>'),'Punch Biopsy');

    function addAbsentEvent(fnaCoreRecorded,fnaCoreDiv,opDateTextHidden,opDateHidden,opQualityHidden,procDateTextHidden,procDateHidden,procNameHidden,procSiteHidden,procSideHidden,procSubsiteHidden,procQualityHidden,pathSpecimenHidden,pathSiteHidden,pathDateText,pathDate,pathSide,pathSubSite,pathResult,pathHistology,pathQuality,BiopsyValue)
    {  
        $(pathDateText).addEvent('blur',curry(SetHiddenFields,fnaCoreRecorded,fnaCoreDiv,opDateTextHidden,opDateHidden,opQualityHidden,procDateTextHidden,procDateHidden,procNameHidden,procSiteHidden,procSideHidden,procSubsiteHidden,procQualityHidden,pathSpecimenHidden,pathSiteHidden,pathDateText,pathDate,pathSide,pathSubSite,pathResult,pathHistology,pathQuality,BiopsyValue));
        $(pathSide).addEvent('blur',curry(SetHiddenFields,fnaCoreRecorded,fnaCoreDiv,opDateTextHidden,opDateHidden,opQualityHidden,procDateTextHidden,procDateHidden,procNameHidden,procSiteHidden,procSideHidden,procSubsiteHidden,procQualityHidden,pathSpecimenHidden,pathSiteHidden,pathDateText,pathDate,pathSide,pathSubSite,pathResult,pathHistology,pathQuality,BiopsyValue));
        $(pathSubSite).addEvent('blur',curry(SetHiddenFields,fnaCoreRecorded,fnaCoreDiv,opDateTextHidden,opDateHidden,opQualityHidden,procDateTextHidden,procDateHidden,procNameHidden,procSiteHidden,procSideHidden,procSubsiteHidden,procQualityHidden,pathSpecimenHidden,pathSiteHidden,pathDateText,pathDate,pathSide,pathSubSite,pathResult,pathHistology,pathQuality,BiopsyValue));
        $(pathResult).addEvent('blur',curry(SetHiddenFields,fnaCoreRecorded,fnaCoreDiv,opDateTextHidden,opDateHidden,opQualityHidden,procDateTextHidden,procDateHidden,procNameHidden,procSiteHidden,procSideHidden,procSubsiteHidden,procQualityHidden,pathSpecimenHidden,pathSiteHidden,pathDateText,pathDate,pathSide,pathSubSite,pathResult,pathHistology,pathQuality,BiopsyValue));
        $(pathHistology).addEvent('blur',curry(SetHiddenFields,fnaCoreRecorded,fnaCoreDiv,opDateTextHidden,opDateHidden,opQualityHidden,procDateTextHidden,procDateHidden,procNameHidden,procSiteHidden,procSideHidden,procSubsiteHidden,procQualityHidden,pathSpecimenHidden,pathSiteHidden,pathDateText,pathDate,pathSide,pathSubSite,pathResult,pathHistology,pathQuality,BiopsyValue));
        $(pathQuality).addEvent('blur',curry(SetHiddenFields,fnaCoreRecorded,fnaCoreDiv,opDateTextHidden,opDateHidden,opQualityHidden,procDateTextHidden,procDateHidden,procNameHidden,procSiteHidden,procSideHidden,procSubsiteHidden,procQualityHidden,pathSpecimenHidden,pathSiteHidden,pathDateText,pathDate,pathSide,pathSubSite,pathResult,pathHistology,pathQuality,BiopsyValue));

        $(fnaCoreRecorded).addEvent('click',curry(SetHiddenFields,fnaCoreRecorded,fnaCoreDiv,opDateTextHidden,opDateHidden,opQualityHidden,procDateTextHidden,procDateHidden,procNameHidden,procSiteHidden,procSideHidden,procSubsiteHidden,procQualityHidden,pathSpecimenHidden,pathSiteHidden,pathDateText,pathDate,pathSide,pathSubSite,pathResult,pathHistology,pathQuality,BiopsyValue));
    
        //show on load
        SetHiddenFields(fnaCoreRecorded,fnaCoreDiv,opDateTextHidden,opDateHidden,opQualityHidden,procDateTextHidden,procDateHidden,procNameHidden,procSiteHidden,procSideHidden,procSubsiteHidden,procQualityHidden,pathSpecimenHidden,pathSiteHidden,pathDateText,pathDate,pathSide,pathSubSite,pathResult,pathHistology,pathQuality,BiopsyValue);
    }
	
	function SetHiddenFields(fnaCoreRecorded,fnaCoreDiv,opDateTextHidden,opDateHidden,opQualityHidden,procDateTextHidden,procDateHidden,procNameHidden,procSiteHidden,procSideHidden,procSubsiteHidden,procQualityHidden,pathSpecimenHidden,pathSiteHidden,pathDateText,pathDate,pathSide,pathSubSite,pathResult,pathHistology,pathQuality,BiopsyValue)
    {
        var fnaCoreRecordedRef = fnaCoreRecorded.getElementsByTagName('input');
        for (var i = 0; i < fnaCoreRecordedRef.length; i++) 
            if (fnaCoreRecordedRef[i].checked) 
            {                 
                  if (fnaCoreRecordedRef[i].value == "Yes" )
                   fnaCoreDiv.style.display='block';
                  else if (fnaCoreRecordedRef[i].value == "No")
                  {
                    fnaCoreDiv.style.display='none';
                    pathDateText.value = '';
                    pathDate.value = '';
                    pathSide.value = '';
                    pathSubSite.value = '';
                    pathResult.value = ''; 
                    pathHistology.value = ''; 
                    pathQuality.value = '';
                  }
            }
        
        if (pathDateText.value != '' || pathSide.value != '' || pathSubSite.value != '' || pathResult.value != '' || pathHistology.value != '' || pathQuality.value != '')
        { 
            opDateTextHidden.value = pathDateText.value;
            opDateHidden.value = pathDate.value;
            procDateTextHidden.value = pathDateText.value;
            procDateHidden.value = pathDate.value;
            
            procNameHidden.value = BiopsyValue;
            pathSpecimenHidden.value = BiopsyValue;
            
            procSiteHidden.value = 'Oral Cavity';
            pathSiteHidden.value = 'Oral Cavity';
            
            procSideHidden.value = pathSide.value;
            
            procSubsiteHidden.value = pathSubSite.value;
            
            opQualityHidden.value = pathQuality.value;
            procQualityHidden.value = pathQuality.value;
        }
        else
        {
            opDateTextHidden.value = '';
            opDateHidden.value = '';

            procDateTextHidden.value = '';
            procDateHidden.value = '';            
            procNameHidden.value = '';
            pathSpecimenHidden.value = '';            
            procSiteHidden.value = '';
            procSideHidden.value = '';            
            procSubsiteHidden.value = '';            

            opQualityHidden.value = '';
            procQualityHidden.value = '';        
        }
    }	

</script>
