<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidFNABiopsy" CodeFile="ThyroidFNABiopsy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script language="javascript" type="text/javascript">
    tableArray.FNAHtmlTable = "FNAHtmlTable";    
</script>

<a name="ThyroidFNABiopsy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

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
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Site</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Subsite</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;">Result</td>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left">Histology</td>
            <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >Data Quality</td>
        </tr>
        
        <tr>
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="31" ParentRecordId="31" ID="PathDateText_31" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="31" ParentRecordId="31" ID="PathDate_31" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ID="OpDateText_31" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ID="OpDate_31" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ID="OpQuality_31" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31"  ID="ProcDateText_31" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31"  ID="ProcDate_31" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31"  ID="ProcName_31" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31"  ID="ProcSite_31" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31"  ID="ProcSide_31" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31"  ID="ProcSubsite_31" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31"  ID="ProcQuality_31" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="31" ParentRecordId="31"  ID="PathSpecimenType_31" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="31" ParentRecordId="31" ID="PathSide_31" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;">
                 <euc:EformTextBox  Runat="server" RecordId="31" ParentRecordId="31"  ID="PathSite_31" TABLE="Pathology" FIELD="PathSite" /> </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="31" ParentRecordId="31" ID="PathSubsite_31" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="31" ParentRecordId="31" ID="PathResult_31" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="31" ParentRecordId="31" ID="PathHistology_31" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="31" ParentRecordId="31" ID="PathQuality_31" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_31"  runat="server"/></td>
        </tr>
        
        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="32" ParentRecordId="32" ID="PathDateText_32" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="32" ParentRecordId="32" ID="PathDate_32" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ID="OpDateText_32" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ID="OpDate_32" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ID="OpQuality_32" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32"  ID="ProcDateText_32" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32"  ID="ProcDate_32" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32"  ID="ProcName_32" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32"  ID="ProcSite_32" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32"  ID="ProcSide_32" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32"  ID="ProcSubsite_32" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32"  ID="ProcQuality_32" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="32" ParentRecordId="32"  ID="PathSpecimenType_32" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	      		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="32" ParentRecordId="32" ID="PathSide_32" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;">
                <euc:EformTextBox  Runat="server" RecordId="32" ParentRecordId="32"  ID="PathSite_32" TABLE="Pathology" FIELD="PathSite" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="32" ParentRecordId="32" ID="PathSubsite_32" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="32" ParentRecordId="32" ID="PathResult_32" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="32" ParentRecordId="32" ID="PathHistology_32" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="32" ParentRecordId="32" ID="PathQuality_32" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_32"  runat="server"/></td>
        </tr>
 
        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="33" ParentRecordId="33" ID="PathDateText_33" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="33" ParentRecordId="33" ID="PathDate_33" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ID="OpDateText_33" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ID="OpDate_33" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ID="OpQuality_33" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33"  ID="ProcDateText_33" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33"  ID="ProcDate_33" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33"  ID="ProcName_33" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33"  ID="ProcSite_33" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33"  ID="ProcSide_33" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33"  ID="ProcSubsite_33" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33"  ID="ProcQuality_33" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="33" ParentRecordId="33"  ID="PathSpecimenType_33" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	      		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="33" ParentRecordId="33" ID="PathSide_33" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >   
                <euc:EformTextBox Runat="server" RecordId="33" ParentRecordId="33"  ID="PathSite_33" TABLE="Pathology" FIELD="PathSite" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="33" ParentRecordId="33" ID="PathSubsite_33" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="33" ParentRecordId="33" ID="PathResult_33" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="33" ParentRecordId="33" ID="PathHistology_33" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="33" ParentRecordId="33" ID="PathQuality_33" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_33"  runat="server"/></td>
        </tr>
       
        <tr style="display: none; ">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="34" ParentRecordId="34" ID="PathDateText_34" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="34" ParentRecordId="34" ID="PathDate_34" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ID="OpDateText_34" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ID="OpDate_34" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ID="OpQuality_34" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34"  ID="ProcDateText_34" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34"  ID="ProcDate_34" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34"  ID="ProcName_34" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34"  ID="ProcSite_34" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34"  ID="ProcSide_34" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34"  ID="ProcSubsite_34" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34"  ID="ProcQuality_34" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="34" ParentRecordId="34"  ID="PathSpecimenType_34" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	    
                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="34" ParentRecordId="34" ID="PathSide_34" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformTextBox Runat="server" RecordId="34" ParentRecordId="34"  ID="PathSite_34" TABLE="Pathology" FIELD="PathSite" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="34" ParentRecordId="34" ID="PathSubsite_34" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="34" ParentRecordId="34" ID="PathResult_34" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="34" ParentRecordId="34" ID="PathHistology_34" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="34" ParentRecordId="34" ID="PathQuality_34" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_34"  runat="server"/></td>
        </tr>

        <tr style="display: none;">
            <td style="white-space: nowrap;" >
                <euc:EformTextBox Width="80px"  Runat="server" RecordId="35" ParentRecordId="35" ID="PathDateText_35" TABLE="Pathology" FIELD="PathDateText" ShowCalendar="true" CalcDate="true" />  		    
                <euc:EformHidden Runat="server" RecordId="35" ParentRecordId="35" ID="PathDate_35" TABLE="Pathology" FIELD="PathDate" />
                
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ID="OpDateText_35" TABLE="OperatingRoomDetails" FIELD="OpDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ID="OpDate_35" TABLE="OperatingRoomDetails" FIELD="OpDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ID="OpQuality_35" TABLE="OperatingRoomDetails" FIELD="OpQuality" />  
               			    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35"  ID="ProcDateText_35" TABLE="Procedures" FIELD="ProcDateText" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35"  ID="ProcDate_35" TABLE="Procedures" FIELD="ProcDate" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35"  ID="ProcName_35" TABLE="Procedures" FIELD="ProcName" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35"  ID="ProcSite_35" TABLE="Procedures" FIELD="ProcSite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35"  ID="ProcSide_35" TABLE="Procedures" FIELD="ProcSide" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35"  ID="ProcSubsite_35" TABLE="Procedures" FIELD="ProcSubsite" />  		    
           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35"  ID="ProcQuality_35" TABLE="Procedures" FIELD="ProcQuality" />  		    

           	    <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="35" ParentRecordId="35"  ID="PathSpecimenType_35" TABLE="Pathology" FIELD="PathSpecimenType" />  		    
           	      		    		    

                </td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="35" ParentRecordId="35" ID="PathSide_35" TABLE="Pathology" FIELD="PathSide" LookupCode="OpSide,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformTextBox Runat="server" RecordId="35" ParentRecordId="35"  ID="PathSite_35" TABLE="Pathology" FIELD="PathSite" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="35" ParentRecordId="35" ID="PathSubsite_35" TABLE="Pathology" FIELD="PathSubsite" LookupCode="BxSubSite,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformDropDownList Width="100px"  Runat="server" RecordId="35" ParentRecordId="35" ID="PathResult_35" TABLE="Pathology" FIELD="PathResult" ShowEmptyListItem="true" >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Atypical" Text="Atypical" />
                    <asp:ListItem Value="Negative" Text="Negative" />
                    <asp:ListItem Value="Positive" Text="Positive" />
                    <asp:ListItem Value="Suspicious" Text="Suspicious" />
                    <asp:ListItem Value="Unknown" Text="Unknown" />
                </euc:EformDropDownList></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="auto" Width="100px"  Runat="server" RecordId="35" ParentRecordId="35" ID="PathHistology_35" TABLE="Pathology" FIELD="PathHistology" LookupCode="PathHistology,Disease,HeadNeck" /></td>
             <td style="white-space: nowrap;" >
                <euc:EformComboBox DropDownWidth="200px" Width="100px"  Runat="server" RecordId="35" ParentRecordId="35" ID="PathQuality_35" TABLE="Pathology" FIELD="PathQuality" LookupCode="DataQuality" /></td>          
            <td style="white-space: nowrap;" valign="top"><euc:EformDeleteIcon ID="EformDeleteIcon_35"  runat="server"/></td>
        </tr>
        
    </table>
    <img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'FNAHtmlTable');" />
</div>

<br/>

  <script type="text/javascript">

    addAbsentEvent($('<%= FNARecorded.ClientID %>'),$('<%= FNADiv.ClientID %>'),$('<%= OpDateText_31.ClientID %>'),$('<%= OpDate_31.ClientID %>'),$('<%= OpQuality_31.ClientID %>'),$('<%= ProcDateText_31.ClientID %>'),$('<%= ProcDate_31.ClientID %>'),$('<%= ProcName_31.ClientID %>'),$('<%= ProcSite_31.ClientID %>'),$('<%= ProcSide_31.ClientID %>'),$('<%= ProcSubsite_31.ClientID %>'),$('<%= ProcQuality_31.ClientID %>'),$('<%= PathSpecimenType_31.ClientID %>'),$('<%= PathSite_31.ClientID %>'),$('<%= PathDateText_31.ClientID %>'),$('<%= PathDate_31.ClientID %>'),$('<%= PathSide_31.ClientID %>'),$('<%= PathSubsite_31.ClientID %>'),$('<%= PathResult_31.ClientID %>'),$('<%= PathHistology_31.ClientID %>'),$('<%= PathQuality_31.ClientID %>'),'Fine Needle Aspirate');
    addAbsentEvent($('<%= FNARecorded.ClientID %>'),$('<%= FNADiv.ClientID %>'),$('<%= OpDateText_32.ClientID %>'),$('<%= OpDate_32.ClientID %>'),$('<%= OpQuality_32.ClientID %>'),$('<%= ProcDateText_32.ClientID %>'),$('<%= ProcDate_32.ClientID %>'),$('<%= ProcName_32.ClientID %>'),$('<%= ProcSite_32.ClientID %>'),$('<%= ProcSide_32.ClientID %>'),$('<%= ProcSubsite_32.ClientID %>'),$('<%= ProcQuality_32.ClientID %>'),$('<%= PathSpecimenType_32.ClientID %>'),$('<%= PathSite_32.ClientID %>'),$('<%= PathDateText_32.ClientID %>'),$('<%= PathDate_32.ClientID %>'),$('<%= PathSide_32.ClientID %>'),$('<%= PathSubsite_32.ClientID %>'),$('<%= PathResult_32.ClientID %>'),$('<%= PathHistology_32.ClientID %>'),$('<%= PathQuality_32.ClientID %>'),'Fine Needle Aspirate');
    addAbsentEvent($('<%= FNARecorded.ClientID %>'),$('<%= FNADiv.ClientID %>'),$('<%= OpDateText_33.ClientID %>'),$('<%= OpDate_33.ClientID %>'),$('<%= OpQuality_33.ClientID %>'),$('<%= ProcDateText_33.ClientID %>'),$('<%= ProcDate_33.ClientID %>'),$('<%= ProcName_33.ClientID %>'),$('<%= ProcSite_33.ClientID %>'),$('<%= ProcSide_33.ClientID %>'),$('<%= ProcSubsite_33.ClientID %>'),$('<%= ProcQuality_33.ClientID %>'),$('<%= PathSpecimenType_33.ClientID %>'),$('<%= PathSite_33.ClientID %>'),$('<%= PathDateText_33.ClientID %>'),$('<%= PathDate_33.ClientID %>'),$('<%= PathSide_33.ClientID %>'),$('<%= PathSubsite_33.ClientID %>'),$('<%= PathResult_33.ClientID %>'),$('<%= PathHistology_33.ClientID %>'),$('<%= PathQuality_33.ClientID %>'),'Fine Needle Aspirate');
    addAbsentEvent($('<%= FNARecorded.ClientID %>'),$('<%= FNADiv.ClientID %>'),$('<%= OpDateText_34.ClientID %>'),$('<%= OpDate_34.ClientID %>'),$('<%= OpQuality_34.ClientID %>'),$('<%= ProcDateText_34.ClientID %>'),$('<%= ProcDate_34.ClientID %>'),$('<%= ProcName_34.ClientID %>'),$('<%= ProcSite_34.ClientID %>'),$('<%= ProcSide_34.ClientID %>'),$('<%= ProcSubsite_34.ClientID %>'),$('<%= ProcQuality_34.ClientID %>'),$('<%= PathSpecimenType_34.ClientID %>'),$('<%= PathSite_34.ClientID %>'),$('<%= PathDateText_34.ClientID %>'),$('<%= PathDate_34.ClientID %>'),$('<%= PathSide_34.ClientID %>'),$('<%= PathSubsite_34.ClientID %>'),$('<%= PathResult_34.ClientID %>'),$('<%= PathHistology_34.ClientID %>'),$('<%= PathQuality_34.ClientID %>'),'Fine Needle Aspirate');
    addAbsentEvent($('<%= FNARecorded.ClientID %>'),$('<%= FNADiv.ClientID %>'),$('<%= OpDateText_35.ClientID %>'),$('<%= OpDate_35.ClientID %>'),$('<%= OpQuality_35.ClientID %>'),$('<%= ProcDateText_35.ClientID %>'),$('<%= ProcDate_35.ClientID %>'),$('<%= ProcName_35.ClientID %>'),$('<%= ProcSite_35.ClientID %>'),$('<%= ProcSide_35.ClientID %>'),$('<%= ProcSubsite_35.ClientID %>'),$('<%= ProcQuality_35.ClientID %>'),$('<%= PathSpecimenType_35.ClientID %>'),$('<%= PathSite_35.ClientID %>'),$('<%= PathDateText_35.ClientID %>'),$('<%= PathDate_35.ClientID %>'),$('<%= PathSide_35.ClientID %>'),$('<%= PathSubsite_35.ClientID %>'),$('<%= PathResult_35.ClientID %>'),$('<%= PathHistology_35.ClientID %>'),$('<%= PathQuality_35.ClientID %>'),'Fine Needle Aspirate');

    

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
	
	function SetHiddenFields(fnaCoreRecorded,fnaCoreDiv,opDateTextHidden,opDateHidden,opQualityHidden,procDateTextHidden,procDateHidden,procNameHidden,procSiteHidden,procSideHidden,procSubsiteHidden,procQualityHidden,pathSpecimenHidden,pathSite,pathDateText,pathDate,pathSide,pathSubSite,pathResult,pathHistology,pathQuality,BiopsyValue)
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
        
        if (pathDateText.value != '' || pathSide.value != '' || pathSite.value != '' || pathSubSite.value != '' || pathResult.value != '' || pathHistology.value != '' || pathQuality.value != '')
        { 
            opDateTextHidden.value = pathDateText.value;
            opDateHidden.value = pathDate.value;
            procDateTextHidden.value = pathDateText.value;
            procDateHidden.value = pathDate.value;
            
            procNameHidden.value = BiopsyValue;
            pathSpecimenHidden.value = BiopsyValue;

//            procSiteHidden.value = 'Thyroid';
//            pathSiteHidden.value = 'Thyroid';

            procSiteHidden.value = pathSite.value;

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
