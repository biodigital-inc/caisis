<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandFNAAndCoreBiopsy" CodeFile="SalivaryGlandFNAAndCoreBiopsy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script language="javascript" type="text/javascript">
    tableArray.FNAHtmlTable = "FNAHtmlTable";
    tableArray.CoreHtmlTable = "CoreHtmlTable";
</script>

<a name="SalivaryGlandFNAAndCoreBiopsy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="1" ParentRecordId="1" ID="PathSide_1" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,SalivaryCancer" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="1" ParentRecordId="1" ID="PathSubsite_1" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="1" ParentRecordId="1" ID="PathHistology_1" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="2" ParentRecordId="2" ID="PathSide_2" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,SalivaryCancer" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="2" ParentRecordId="2" ID="PathSubsite_2" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="2" ParentRecordId="2" ID="PathHistology_2" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="3" ParentRecordId="3" ID="PathSide_3" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,SalivaryCancer" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="3" ParentRecordId="3" ID="PathSubsite_3" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="3" ParentRecordId="3" ID="PathHistology_3" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="4" ParentRecordId="4" ID="PathSide_4" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,SalivaryCancer" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="4" ParentRecordId="4" ID="PathSubsite_4" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="4" ParentRecordId="4" ID="PathHistology_4" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="5" ParentRecordId="5" ID="PathSide_5" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,SalivaryCancer" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="5" ParentRecordId="5" ID="PathSubsite_5" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="5" ParentRecordId="5" ID="PathHistology_5" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="6" ParentRecordId="6" ID="PathSide_6" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,SalivaryCancer" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="6" ParentRecordId="6" ID="PathSubsite_6" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="6" ParentRecordId="6" ID="PathHistology_6" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="7" ParentRecordId="7" ID="PathSide_7" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,SalivaryCancer" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="7" ParentRecordId="7" ID="PathSubsite_7" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="7" ParentRecordId="7" ID="PathHistology_7" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="8" ParentRecordId="8" ID="PathSide_8" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,SalivaryCancer" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="8" ParentRecordId="8" ID="PathSubsite_8" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="8" ParentRecordId="8" ID="PathHistology_8" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="9" ParentRecordId="9" ID="PathSide_9" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,SalivaryCancer" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="9" ParentRecordId="9" ID="PathSubsite_9" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="9" ParentRecordId="9" ID="PathHistology_9" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="10" ParentRecordId="10" ID="PathSide_10" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,SalivaryCancer" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="10" ParentRecordId="10" ID="PathSubsite_10" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,SalivaryCancer" /></td>
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
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="10" ParentRecordId="10" ID="PathHistology_10" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,SalivaryCancer" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="10" ParentRecordId="10" ID="PathQuality_10" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_10"  runat="server"/></td>
        </tr>
        
    </table>
    <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'CoreHtmlTable');" />
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
            
            procSiteHidden.value = 'Salivary Gland';
            pathSiteHidden.value = 'Salivary Gland';
            
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
