<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxProcOperativeDetails" CodeFile="OropharynxProcOperativeDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.OropharynxProcSoftTissueRescHtmlTable = "OropharynxProcSoftTissueRescHtmlTable";
	tableArray.BoneWorkHtmlTable = "BoneWorkHtmlTable";
	tableArray.LateralNeckDissectionHtmlTable = "LateralNeckDissectionHtmlTable";
	tableArray.ReconHtmlTable = "ReconHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="OropharynxProcOperativeDetails" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Operative Details"></asp:Label><br/>

<span class="controlBoxTitle">OR Room Details</span>
 <table  width="300" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsBMDHtmlTable" > 


  <tr> 
    <td width="30%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Surgery Date</td>
    <td width="30%" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Case Surgeon</td> 
    <td width="30%" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Institution</td> 
    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td> 
 </tr>
  <tr > 
    <td height="28" style="white-space: nowrap;" >
				<euc:EformTextBox Runat="server"  style="width: 100px;"
						ID="SurgDateText" 
						TABLE="OperatingRoomDetails" 
						FIELD="OpDateText" 
						ShowCalendar="True"
						CalcDate="True"
						class="InputText" />
				<euc:EformHidden Runat="server" ID="SurgDate" Table="OperatingRoomDetails" Field="OpDate"></euc:EformHidden>		
 				<euc:EformTextBox Width="1px" style="display: none;" Runat="server" ID="OpQuality" Table="OperatingRoomDetails" Field="OpQuality"></euc:EformTextBox>		
       
        </td>   

       <td style="white-space: nowrap;" >
            <euc:EformComboBox LookupCode="OpSurgeon" DropDownWidth="280" id="CaseSurgeonField" Table="OperatingRoomDetails" Field="OpCaseSurgeon" runat="server"  class="InputText" />
        </td>


        <td height="28" style="white-space: nowrap;" >	
            <euc:CaisisRadioButtonList id="OpInstitutionDefaultBtn" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"  ></euc:CaisisRadioButtonList>
            <euc:CaisisRadioButtonList  id="OpInstitutionOtherBtn" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Flow">
            <asp:ListItem></asp:ListItem></euc:CaisisRadioButtonList>Other
            <euc:EformTextBox Width="1px" style="display: none;"  Table="OperatingRoomDetails"  RecordId="1" Field="OpInstitution" id="OpInstitution" runat="server" /> 

       </td>
       <td style="white-space: nowrap;" >
            <div id="OpInstitutionOtherDiv" runat="server" style="display: none; white-space:nowrap; ">
               <euc:CaisisComboBox  id="OpInstitutionOther" LookupCode="Institution" runat="server"/>                  
            </div> 
       </td>

   
  </tr>      

</table>
<br /><br /><br />

<span class="controlBoxTitle">Soft Tissue Resection</span>
<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="OropharynxProcSoftTissueRescHtmlTable" > 

          <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Indication</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Approach</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Procedure</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Side </td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Site of Primary </td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
  
                
          <tr>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="1"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_1" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;" RecordId="1"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_1"     Runat="server"/>			
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="1"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_1" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="1"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_1" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="1"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_1" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="1"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_1" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="1"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_1" Runat="server" />
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="1"  TABLE="Procedures" FIELD="ProcApproach"  ID="ProcApproach_1" Runat="server" />
		        
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="1"  TABLE="Procedures" FIELD="ProcIndication"     ID="ProcIndication_1" LookupCode="Indication,Disease,HeadNeck"  Runat="server"   /></td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformDropDownList Width="150px" TABLE="NoTable" FIELD="ProcApproachOption_1" ID="ProcApproachOption_1"   Runat="server" ShowEmptyListItem="true"  >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                    <asp:ListItem Value="Endoscopic with Robot" Text="Endoscopic with Robot"></asp:ListItem>
                    <asp:ListItem Value="Endoscopic without Robot" Text="Endoscopic without Robot"></asp:ListItem>
                </euc:EformDropDownList> 
                <div id="ProcApproachOpenOptionDiv_1" style="display: none;" runat="server" >
                <euc:EformRadioButtonList style="white-space: nowrap;" TABLE="NoTable" FIELD="ProcApproachOpenOption_1" ID="ProcApproachOpenOption_1"   Runat="server" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Table"  >
                    <asp:ListItem Value="Split" Text="Split"></asp:ListItem>
                    <asp:ListItem Value="Visor" Text="Visor"></asp:ListItem>
                    <asp:ListItem Value="Lingual drop" Text="Lingual drop"></asp:ListItem>
                    <asp:ListItem Value="Peroral" Text="Peroral"></asp:ListItem>
                </euc:EformRadioButtonList>                 
                </div>
                
                
                </td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="1"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_1" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /> </td> 
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="1"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_1" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="1"  TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_1" LookupCode="DxTarget,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;" valign="top" ><euc:EformDeleteIcon ID="EformDeleteIcon_1" runat="server"/></td>
       </tr>
       <tr style="DISPLAY: none;" valign="top" >
            <td style="white-space: nowrap;">
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="2"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_2" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;" RecordId="2"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_2"     Runat="server"/>			
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_2" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_2" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_2" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_2" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_2" Runat="server" />
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="2"  TABLE="Procedures" FIELD="ProcApproach"  ID="ProcApproach_2" Runat="server" />
		        
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="2"  TABLE="Procedures" FIELD="ProcIndication"     ID="ProcIndication_2" LookupCode="Indication,Disease,HeadNeck"  Runat="server"   /></td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformDropDownList Width="150px" TABLE="NoTable" FIELD="ProcApproachOption_2" ID="ProcApproachOption_2"   Runat="server" ShowEmptyListItem="true"  >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                    <asp:ListItem Value="Endoscopic with Robot" Text="Endoscopic with Robot"></asp:ListItem>
                    <asp:ListItem Value="Endoscopic without Robot" Text="Endoscopic without Robot"></asp:ListItem>
                </euc:EformDropDownList> 
                <div id="ProcApproachOpenOptionDiv_2" style="display: none;" runat="server">
                <euc:EformRadioButtonList style="white-space: nowrap;" TABLE="NoTable" FIELD="ProcApproachOpenOption_2" ID="ProcApproachOpenOption_2"   Runat="server" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Table"  >
                    <asp:ListItem Value="Split" Text="Split"></asp:ListItem>
                    <asp:ListItem Value="Visor" Text="Visor"></asp:ListItem>
                    <asp:ListItem Value="Lingual drop" Text="Lingual drop"></asp:ListItem>
                    <asp:ListItem Value="Peroral" Text="Peroral"></asp:ListItem>
                </euc:EformRadioButtonList></div></td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="2"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_2" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /> </td> 
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="2"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_2" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="2"  TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_2" LookupCode="DxTarget,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;" valign="top" ><euc:EformDeleteIcon ID="EformDeleteIcon_2" runat="server"/></td>
       </tr>
       <tr style="DISPLAY: none;">
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="3"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_3" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;" RecordId="3"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_3"     Runat="server"/>			
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_3" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_3" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_3" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_3" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_3" Runat="server" />
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="3"  TABLE="Procedures" FIELD="ProcApproach"  ID="ProcApproach_3" Runat="server" />
		        
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="3"  TABLE="Procedures" FIELD="ProcIndication"     ID="ProcIndication_3" LookupCode="Indication,Disease,HeadNeck"  Runat="server"   /></td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformDropDownList Width="150px" TABLE="NoTable" FIELD="ProcApproachOption_3" ID="ProcApproachOption_3"   Runat="server" ShowEmptyListItem="true"  >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                    <asp:ListItem Value="Endoscopic with Robot" Text="Endoscopic with Robot"></asp:ListItem>
                    <asp:ListItem Value="Endoscopic without Robot" Text="Endoscopic without Robot"></asp:ListItem>
                </euc:EformDropDownList> 
                <div id="ProcApproachOpenOptionDiv_3" style="display: none;" runat="server">
                <euc:EformRadioButtonList style="white-space: nowrap;" TABLE="NoTable" FIELD="ProcApproachOpenOption_3" ID="ProcApproachOpenOption_3"   Runat="server" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Table"  >
                    <asp:ListItem Value="Split" Text="Split"></asp:ListItem>
                    <asp:ListItem Value="Visor" Text="Visor"></asp:ListItem>
                    <asp:ListItem Value="Lingual drop" Text="Lingual drop"></asp:ListItem>
                    <asp:ListItem Value="Peroral" Text="Peroral"></asp:ListItem>
                </euc:EformRadioButtonList></div></td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="3"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_3" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /> </td> 
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="3"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_3" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="3"  TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_3" LookupCode="DxTarget,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;" valign="top" ><euc:EformDeleteIcon ID="EformDeleteIcon_3" runat="server"/></td>
       </tr>
       <tr style="DISPLAY: none;">
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="4"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_4" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;" RecordId="4"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_4"     Runat="server"/>			
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_4" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_4" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_4" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_4" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_4" Runat="server" />
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="4"  TABLE="Procedures" FIELD="ProcApproach"  ID="ProcApproach_4" Runat="server" />
		        
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="4"  TABLE="Procedures" FIELD="ProcIndication"     ID="ProcIndication_4" LookupCode="Indication,Disease,HeadNeck"  Runat="server"   /></td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformDropDownList Width="150px" TABLE="NoTable" FIELD="ProcApproachOption_4" ID="ProcApproachOption_4"   Runat="server" ShowEmptyListItem="true"  >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                    <asp:ListItem Value="Endoscopic with Robot" Text="Endoscopic with Robot"></asp:ListItem>
                    <asp:ListItem Value="Endoscopic without Robot" Text="Endoscopic without Robot"></asp:ListItem>
                </euc:EformDropDownList> 
                <div id="ProcApproachOpenOptionDiv_4" style="display: none;" runat="server">
                <euc:EformRadioButtonList style="white-space: nowrap;" TABLE="NoTable" FIELD="ProcApproachOpenOption_4" ID="ProcApproachOpenOption_4"   Runat="server" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Table"  >
                    <asp:ListItem Value="Split" Text="Split"></asp:ListItem>
                    <asp:ListItem Value="Visor" Text="Visor"></asp:ListItem>
                    <asp:ListItem Value="Lingual drop" Text="Lingual drop"></asp:ListItem>
                    <asp:ListItem Value="Peroral" Text="Peroral"></asp:ListItem>
                </euc:EformRadioButtonList></div></td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="4"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_4" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /> </td> 
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="4"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_4" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="4"  TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_4" LookupCode="DxTarget,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;" valign="top" ><euc:EformDeleteIcon ID="EformDeleteIcon_4" runat="server"/></td>
       </tr>
       <tr style="DISPLAY: none;">
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="5"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_5" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;" RecordId="5"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_5"     Runat="server"/>			
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5"  TABLE="Procedures" FIELD="ProcPrimary"  ID="ProcPrimary_5" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_5" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_5" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_5" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_5" Runat="server" />
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="5"  TABLE="Procedures" FIELD="ProcApproach"  ID="ProcApproach_5" Runat="server" />
		        
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="5"  TABLE="Procedures" FIELD="ProcIndication"     ID="ProcIndication_5" LookupCode="Indication,Disease,HeadNeck"  Runat="server"   /></td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformDropDownList Width="150px" TABLE="NoTable" FIELD="ProcApproachOption_5" ID="ProcApproachOption_5"   Runat="server" ShowEmptyListItem="true"  >
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Open" Text="Open"></asp:ListItem>
                    <asp:ListItem Value="Endoscopic with Robot" Text="Endoscopic with Robot"></asp:ListItem>
                    <asp:ListItem Value="Endoscopic without Robot" Text="Endoscopic without Robot"></asp:ListItem>
                </euc:EformDropDownList> 
                <div id="ProcApproachOpenOptionDiv_5" style="display: none;" runat="server">
                <euc:EformRadioButtonList style="white-space: nowrap;" TABLE="NoTable" FIELD="ProcApproachOpenOption_5" ID="ProcApproachOpenOption_5"   Runat="server" RepeatColumns="2" RepeatDirection="Horizontal" RepeatLayout="Table"  >
                    <asp:ListItem Value="Split" Text="Split"></asp:ListItem>
                    <asp:ListItem Value="Visor" Text="Visor"></asp:ListItem>
                    <asp:ListItem Value="Lingual drop" Text="Lingual drop"></asp:ListItem>
                    <asp:ListItem Value="Peroral" Text="Peroral"></asp:ListItem>
                </euc:EformRadioButtonList></div></td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="5"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_5" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /> </td> 
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="5"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_5" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>
            <td style="white-space: nowrap;" valign="top" >
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="5"  TABLE="Procedures" FIELD="ProcSubsite" ID="ProcSubsite_5" LookupCode="DxTarget,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;" valign="top" ><euc:EformDeleteIcon ID="EformDeleteIcon_5" runat="server"/></td>
       </tr>
 
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxProcSoftTissueRescHtmlTable');" />
<br /><br /><br />

<table>
    <tr>
        <td>
            <span class="controlBoxTitle">Bone Work Done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="BoneWorkRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="BoneWorkRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="BoneWorkAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_1"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="1" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_1"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
    </table>
</div>

<div id="BoneWorkDiv" runat="server" style="display: none;">
<table  width="300" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="BoneWorkHtmlTable" > 

          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Bone Surgery</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Side</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
  
                
          <tr>
            <td style="white-space: nowrap;">
            
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="6"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_6" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /> 

		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="6"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_6" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="6"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_6" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="6"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_6" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="6"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_6" Runat="server" />
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="6" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_6" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="6" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_6"     Runat="server"/></td>		
				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="6"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_6" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_6" runat="server"/></td>
       </tr>
       <tr style="DISPLAY: none;">
            <td style="white-space: nowrap;">
            
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="7"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_7" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /> 

		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="7"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_7" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="7"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_7" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="7"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_7" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="7"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_7" Runat="server" />
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="7" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_7" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="7" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_7"     Runat="server"/></td>		
				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="7"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_7" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_7" runat="server"/></td>
       </tr>
       <tr style="DISPLAY: none;">
            <td style="white-space: nowrap;">
            
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="8"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_8" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /> 

		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="8"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_8" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="8"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_8" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="8"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_8" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="8"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_8" Runat="server" />
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="8" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_8" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="8" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_8"     Runat="server"/></td>		
				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="8"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_8" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_8" runat="server"/></td>
       </tr>
       <tr style="DISPLAY: none;">
            <td style="white-space: nowrap;">
            
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="9"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_9" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /> 

		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="9"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_9" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="9"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_9" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="9"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_9" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="9"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_9" Runat="server" />
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="9" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_9" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="9" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_9"     Runat="server"/></td>		
				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="9"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_9" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_9" runat="server"/></td>
       </tr>
       <tr style="DISPLAY: none;">
            <td style="white-space: nowrap;">
            
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="10"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_10" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /> 

		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="10"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_10" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="10"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_10" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="10"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_10" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="10"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_10" Runat="server" />
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="10" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_10" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="10" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_10"     Runat="server"/></td>		
				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="10"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_10" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_10" runat="server"/></td>
       </tr>
   
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'BoneWorkHtmlTable');" />

</div>
<table>
    <tr id="BoneWorkAbsentRow">
        <td>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="TableName" ID="TableName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldName" ID="FieldName_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_1"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_1"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br /><br />

<table>
    <tr>
        <td>
            <span class="controlBoxTitle">Lateral Neck Dissection Done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="LateralDissectDone" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="LateralDissectDone">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="LateralDissectAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_2"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="2" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_2"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
    </table>
</div>

<div id="LateralDissectDiv" runat="server" style="display: none;">
    <table width="350" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="LateralNeckDissectionHtmlTable">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                &nbsp;Indication</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                Side</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">
                Level</td>
            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
        </tr>
        <tr id="LateralNeckDissectionHtmlRow1">
        
            <td style="white-space: nowrap;" height="28" >
                <euc:EformTextBox Width="1px" style="display:none;" RecordId="11" Table="Procedures" Field="ProcDateText" ID="ProcDateText_11" runat="server" />
                <euc:EformTextBox Width="1px" style="display:none;" RecordId="11" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_11" Runat="server" />              
                <euc:EformTextBox Width="1px" style="display:none;"  RecordId="11" TABLE="Procedures" FIELD="ProcName" ID="ProcName_11" Runat="server"  />
                <euc:EformTextBox Width="1px" style="display:none" id="ProcInstitution_11" RecordId="11" Table="Procedures" Field="ProcInstitution" runat="server" />
	            <euc:EformTextBox Width="1px" style="display:none" id="ProcSubsite_11" RecordId="11" Table="Procedures" Field="ProcSubsite" runat="server" />
	            <euc:EformTextBox Width="1px" style="display:none" id="ProcSite_11" RecordId="11" Table="Procedures" Field="ProcSite" runat="server" />
	            <euc:EformTextBox Width="1px" style="display: none;" id="ProcQuality_11" RecordId="11" Table="Procedures" Field="ProcQuality" runat="server" />
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="11"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_11" Runat="server" />
           
              <euc:EformComboBox Width="100px" DropDownWidth="auto" id="ProcIndication_11" RecordId="11" Table="Procedures" Field="ProcIndication" LookupCode="Indication,Disease,HeadNeck" runat="server" /></td>
 
            <td style="white-space: nowrap;" align="center">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="11" Table="Procedures" Field="ProcSide" ID="ProcSide_11" LookupCode="NodeSide,Disease,HeadNeck" runat="server"  /></td>

            <td style="white-space: nowrap;" align="left">
                <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="120px" style="white-space: nowrap;" Table="NoTable" Field="ProcSubsiteCBL_11" ID="ProcSubsiteCBL_11" runat="server" RepeatDirection="Horizontal"  RepeatColumns="3" RepeatLayout="Table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>
            
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_11" runat="server" /></td>
        </tr>
        
        <tr style="display: none">
        
            <td style="white-space: nowrap;" height="28" >
                <euc:EformTextBox Width="1px" style="display:none;" RecordId="12" Table="Procedures" Field="ProcDateText" ID="ProcDateText_12" runat="server" />
                <euc:EformTextBox Width="1px" style="display:none;" RecordId="12" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_12" Runat="server" />                
                <euc:EformTextBox Width="1px" style="display:none;"  RecordId="12" TABLE="Procedures" FIELD="ProcName" ID="ProcName_12" Runat="server"  />
                <euc:EformTextBox Width="1px" style="display:none" id="ProcInstitution_12" RecordId="12" Table="Procedures" Field="ProcInstitution" runat="server" />
	            <euc:EformTextBox Width="1px" style="display:none" id="ProcSite_12" RecordId="12" Table="Procedures" Field="ProcSite" runat="server" />
	            <euc:EformTextBox Width="1px" style="display:none" id="ProcSubsite_12" RecordId="12" Table="Procedures" Field="ProcSubsite" runat="server" />
	            <euc:EformTextBox Width="1px" style="display: none;" id="ProcQuality_12" RecordId="12" Table="Procedures" Field="ProcQuality" runat="server" />
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="12"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_12" Runat="server" />
	            
              <euc:EformComboBox Width="100px" DropDownWidth="auto" id="ProcIndication_12" RecordId="12" Table="Procedures" Field="ProcIndication" LookupCode="Indication,Disease,HeadNeck" runat="server" /></td>

            <td style="white-space: nowrap;" align="center">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="12" Table="Procedures" Field="ProcSide" ID="ProcSide_12" LookupCode="NodeSide,Disease,HeadNeck" runat="server"  /></td>

            <td style="white-space: nowrap;" align="left">
                <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="120px" style="white-space: nowrap;" Table="NoTable" Field="ProcSubsiteCBL_12" ID="ProcSubsiteCBL_12" runat="server" RepeatDirection="Vertical" RepeatColumns="4" RepeatLayout="table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>
            
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_12" runat="server" /></td>
        </tr>
    </table>
    <img alt="row" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" onclick="return showFirstAdditionalRow(this,'LateralNeckDissectionHtmlTable');" />
</div>
<table>
    <tr id="LateralNeckDissectionAbsentRow">
        <td>
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="TableName" ID="TableName_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldName" ID="FieldName_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_2"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_2"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br /><br />

<table>
    <tr>
        <td>
            <span class="controlBoxTitle">Ancillary Surgery Done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="AncillaryDone" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="AncillaryRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="AncillaryAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_3"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="3" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_3"
                Runat="server" Width="1px" style="display: none;" /></td>
        </tr>
    </table>
</div>

<div id="AncillaryDiv" runat="server" style="display: none;">
<table  width="300" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="AncillaryHtmlTable" > 

                
          <tr>
            <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Procedure: </td>
 
            <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_15" value="Percutaneous Placement Gastrostomy Tube"    runat="server"   />PEG
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_15_Text" runat="server" RecordId="15"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="15"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_15" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="15"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_15"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="15"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_15" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="15"  TABLE="Procedures" Field="ProcInstitution" ID="ProcInstitution_15" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="15"  TABLE="Procedures" Field="ProcDataSource" ID="ProcDataSource_15" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="15"  TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_15" runat="server" /></td>
 
            <td align="left" style="white-space: nowrap;">
                <input type="checkbox" id="ProcName_16" value="Tracheostomy "    runat="server"   />Tracheostomy 
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_16_Text" runat="server" RecordId="16"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="16"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_16" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="16"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_16"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="16"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_16" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="16"  TABLE="Procedures" Field="ProcInstitution" ID="ProcInstitution_16" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="16"  TABLE="Procedures" Field="ProcDataSource" ID="ProcDataSource_16" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="16"  TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_16" runat="server" /></td>
 
             <td align="left" style="white-space: nowrap;" colspan="2">
                <strong>Other:&nbsp;</strong>
                <input type="text" id="ProcName_17"     runat="server"   />
                <euc:EformTextBox Width="1px" style="display: none;" ID="ProcName_17_Text" runat="server" RecordId="17"  TABLE="Procedures" FIELD="ProcName"/>             
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="17"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_17" Runat="server" />
				<euc:EformTextBox Width="1px" style="display: none;"   RecordId="17"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_17"     Runat="server"/>
			    <euc:EformTextBox Width="1px" style="display: none;"   RecordId="17"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_17" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="17"  TABLE="Procedures" Field="ProcInstitution" ID="ProcInstitution_17" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="17"  TABLE="Procedures" Field="ProcDataSource" ID="ProcDataSource_17" runat="server" />
                <euc:EformTextBox Width="1px" style="display: none;"   RecordId="17"  TABLE="Procedures" Field="ProcQuality" ID="ProcQuality_17" runat="server" /></td>
        </tr>
</table>
</div>
<table>
    <tr id="AncillaryAbsentRow">
        <td>
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="TableName" ID="TableName_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldName" ID="FieldName_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_3"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_3"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br /><br />

<table>
    <tr>
        <td>
            <span class="controlBoxTitle">Reconstructive Surgery Done ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ReconRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="ReconRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="ReconAbsentDiv" runat="server" style="display: none;">
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_4"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="4" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_4"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
    </table>
</div>

<div id="ReconDiv" runat="server" style="display: none;">
<table  width="300" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ReconHtmlTable" > 

          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Surgeon</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Procedure</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Side</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
  
                
          <tr>
            <td style="white-space: nowrap;">
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="20"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_20" LookupCode="Physician"   Runat="server"  />
                 
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="20"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_20" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="20"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_20" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="20"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_20" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="20"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_20" Runat="server" />		
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="20" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_20" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="20" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_20"     Runat="server"/></td>		
            <td style="white-space: nowrap;">
            
                 <%--<euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="20"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_20" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  />--%>
                 <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="220px" style="white-space: nowrap;" RecordId="20"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_20" runat="server" RepeatDirection="Vertical"  RepeatColumns="1" RepeatLayout="Table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="Radial Forearm Free Flap" Value="Radial Forearm Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Anterolateral Thigh Free Flap" Value="Anterolateral Thigh Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Rectus Abdominis Free Flap" Value="Rectus Abdominis Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Scapular Free Flap" Value="Scapular Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Flap" Value="Pectoralis Major Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Myocutaneous Flap" Value="Pectoralis Major Myocutaneous Flap"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>

				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="20"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_20" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_20" runat="server"/></td>
       </tr>
       <tr style="display: none;">
            <td style="white-space: nowrap;">
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="21"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_21" LookupCode="Physician"   Runat="server"  />
                 
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="21"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_21" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="21"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_21" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="21"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_21" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="21"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_21" Runat="server" />		
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="21" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_21" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="21" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_21"     Runat="server"/></td>		
            <td style="white-space: nowrap;">
            
                 <%--<euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="21"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_21" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /></td>--%>
                 <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="220px" style="white-space: nowrap;" RecordId="21"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_21" runat="server" RepeatDirection="Vertical"  RepeatColumns="1" RepeatLayout="Table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="Radial Forearm Free Flap" Value="Radial Forearm Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Anterolateral Thigh Free Flap" Value="Anterolateral Thigh Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Rectus Abdominis Free Flap" Value="Rectus Abdominis Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Scapular Free Flap" Value="Scapular Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Flap" Value="Pectoralis Major Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Myocutaneous Flap" Value="Pectoralis Major Myocutaneous Flap"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>

				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="21"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_21" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_21" runat="server"/></td>
       </tr>
       <tr style="display: none;">
            <td style="white-space: nowrap;">
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="22"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_22" LookupCode="Physician"   Runat="server"  />
                 
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="22"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_22" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="22"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_22" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="22"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_22" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="22"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_22" Runat="server" />		
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="22" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_22" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="22" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_22"     Runat="server"/></td>		
            <td style="white-space: nowrap;">
            
                 <%--<euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="22"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_22" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /></td>--%>
                 <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="220px" style="white-space: nowrap;" RecordId="22"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_22" runat="server" RepeatDirection="Vertical"  RepeatColumns="1" RepeatLayout="Table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="Radial Forearm Free Flap" Value="Radial Forearm Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Anterolateral Thigh Free Flap" Value="Anterolateral Thigh Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Rectus Abdominis Free Flap" Value="Rectus Abdominis Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Scapular Free Flap" Value="Scapular Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Flap" Value="Pectoralis Major Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Myocutaneous Flap" Value="Pectoralis Major Myocutaneous Flap"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>

				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="22"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_22" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_22" runat="server"/></td>
       </tr>
       <tr style="display: none;">
            <td style="white-space: nowrap;">
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="23"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_23" LookupCode="Physician"   Runat="server"  />
                 
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="23"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_23" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="23"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_23" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="23"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_23" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="23"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_23" Runat="server" />		
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="23" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_23" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="23" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_23"     Runat="server"/></td>		
            <td style="white-space: nowrap;">
            
                 <%--<euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="23"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_23" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /></td>--%>
                 <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="220px" style="white-space: nowrap;" RecordId="23"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_23" runat="server" RepeatDirection="Vertical"  RepeatColumns="1" RepeatLayout="Table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="Radial Forearm Free Flap" Value="Radial Forearm Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Anterolateral Thigh Free Flap" Value="Anterolateral Thigh Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Rectus Abdominis Free Flap" Value="Rectus Abdominis Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Scapular Free Flap" Value="Scapular Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Flap" Value="Pectoralis Major Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Myocutaneous Flap" Value="Pectoralis Major Myocutaneous Flap"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>

				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="23"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_23" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_23" runat="server"/></td>
       </tr>
       <tr style="display: none;">
            <td style="white-space: nowrap;">
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="24"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_24" LookupCode="Physician"   Runat="server"  />
                 
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="24"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_24" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="24"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_24" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="24"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_24" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="24"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_24" Runat="server" />		
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="24" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_24" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="24" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_24"     Runat="server"/></td>		
            <td style="white-space: nowrap;">
            
                 <%--<euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="24"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_24" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /></td>--%>
                 <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="220px" style="white-space: nowrap;" RecordId="24"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_24" runat="server" RepeatDirection="Vertical"  RepeatColumns="1" RepeatLayout="Table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="Radial Forearm Free Flap" Value="Radial Forearm Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Anterolateral Thigh Free Flap" Value="Anterolateral Thigh Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Rectus Abdominis Free Flap" Value="Rectus Abdominis Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Scapular Free Flap" Value="Scapular Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Flap" Value="Pectoralis Major Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Myocutaneous Flap" Value="Pectoralis Major Myocutaneous Flap"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>

				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="24"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_24" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_24" runat="server"/></td>
       </tr>
       <tr style="display: none;">
            <td style="white-space: nowrap;">
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="25"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_25" LookupCode="Physician"   Runat="server"  />
                 
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="25"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_25" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="25"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_25" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="25"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_25" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="25"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_25" Runat="server" />		
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="25" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_25" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="25" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_25"     Runat="server"/></td>		
            <td style="white-space: nowrap;">
            
                 <%--<euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="25"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_25" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /></td>--%>
                 <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="220px" style="white-space: nowrap;" RecordId="25"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_25" runat="server" RepeatDirection="Vertical"  RepeatColumns="1" RepeatLayout="Table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="Radial Forearm Free Flap" Value="Radial Forearm Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Anterolateral Thigh Free Flap" Value="Anterolateral Thigh Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Rectus Abdominis Free Flap" Value="Rectus Abdominis Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Scapular Free Flap" Value="Scapular Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Flap" Value="Pectoralis Major Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Myocutaneous Flap" Value="Pectoralis Major Myocutaneous Flap"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>

				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="25"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_25" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_25" runat="server"/></td>
       </tr>
       <tr style="display: none;">
            <td style="white-space: nowrap;">
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="26"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_26" LookupCode="Physician"   Runat="server"  />
                 
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="26"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_26" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="26"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_26" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="26"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_26" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="26"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_26" Runat="server" />		
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="26" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_26" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="26" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_26"     Runat="server"/></td>		
            <td style="white-space: nowrap;">
            
                 <%--<euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="26"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_26" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /></td>--%>
                 <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="220px" style="white-space: nowrap;" RecordId="26"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_26" runat="server" RepeatDirection="Vertical"  RepeatColumns="1" RepeatLayout="Table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="Radial Forearm Free Flap" Value="Radial Forearm Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Anterolateral Thigh Free Flap" Value="Anterolateral Thigh Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Rectus Abdominis Free Flap" Value="Rectus Abdominis Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Scapular Free Flap" Value="Scapular Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Flap" Value="Pectoralis Major Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Myocutaneous Flap" Value="Pectoralis Major Myocutaneous Flap"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>

				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="26"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_26" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_26" runat="server"/></td>
       </tr>
       <tr style="display: none;">
            <td style="white-space: nowrap;">
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="27"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_27" LookupCode="Physician"   Runat="server"  />
                 
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="27"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_27" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="27"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_27" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="27"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_27" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="27"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_27" Runat="server" />		
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="27" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_27" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="27" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_27"     Runat="server"/></td>		
            <td style="white-space: nowrap;">
            
                 <%--<euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="27"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_27" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /></td>--%>
                 <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="220px" style="white-space: nowrap;" RecordId="27"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_27" runat="server" RepeatDirection="Vertical"  RepeatColumns="1" RepeatLayout="Table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="Radial Forearm Free Flap" Value="Radial Forearm Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Anterolateral Thigh Free Flap" Value="Anterolateral Thigh Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Rectus Abdominis Free Flap" Value="Rectus Abdominis Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Scapular Free Flap" Value="Scapular Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Flap" Value="Pectoralis Major Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Myocutaneous Flap" Value="Pectoralis Major Myocutaneous Flap"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>

				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="27"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_27" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_27" runat="server"/></td>
       </tr>
       <tr style="display: none;">
            <td style="white-space: nowrap;">
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="28"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_28" LookupCode="Physician"   Runat="server"  />
                 
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="28"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_28" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="28"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_28" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="28"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_28" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="28"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_28" Runat="server" />		
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="28" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_28" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="28" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_28"     Runat="server"/></td>		
            <td style="white-space: nowrap;">
            
                 <%--<euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="28"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_28" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /></td>--%>
                 <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="220px" style="white-space: nowrap;" RecordId="28"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_28" runat="server" RepeatDirection="Vertical"  RepeatColumns="1" RepeatLayout="Table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="Radial Forearm Free Flap" Value="Radial Forearm Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Anterolateral Thigh Free Flap" Value="Anterolateral Thigh Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Rectus Abdominis Free Flap" Value="Rectus Abdominis Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Scapular Free Flap" Value="Scapular Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Flap" Value="Pectoralis Major Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Myocutaneous Flap" Value="Pectoralis Major Myocutaneous Flap"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>

				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="28"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_28" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_28" runat="server"/></td>
       </tr>
       <tr style="display: none;">
            <td style="white-space: nowrap;">
                 <euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="29"  TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_29" LookupCode="Physician"   Runat="server"  />
                 
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="29"  TABLE="Procedures" FIELD="ProcSite"  ID="ProcSite_29" Runat="server" />		
		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="29"  TABLE="Procedures" FIELD="ProcInstitution"  ID="ProcInstitution_29" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="29"  TABLE="Procedures" FIELD="ProcQuality"  ID="ProcQuality_29" Runat="server" />		
 		        <euc:EformTextBox Width="1px" style="display: none;" RecordId="29"  TABLE="Procedures" FIELD="ProcDataSource"  ID="ProcDataSource_29" Runat="server" />		
                <euc:EformTextBox  Width="1px" style="display: none;" RecordId="29" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_29" Runat="server" />
				<euc:EformTextBox  Width="1px" style="display: none;" RecordId="29" TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_29"     Runat="server"/></td>		
            <td style="white-space: nowrap;">
            
                 <%--<euc:EformComboBox Width="100px" DropDownWidth="auto" RecordId="29"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_29" LookupCode="ProcName,Disease,HeadNeck"   Runat="server"  /></td>--%>
                 <euc:EformExtendedCheckBoxList DropDown="true" DropDownTextWidth="220px" style="white-space: nowrap;" RecordId="29"  TABLE="Procedures" FIELD="ProcName" ID="ProcName_29" runat="server" RepeatDirection="Vertical"  RepeatColumns="1" RepeatLayout="Table" ShowOther="false" OtherFieldStyle="display:none">
                    <asp:ListItem Text="Radial Forearm Free Flap" Value="Radial Forearm Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Anterolateral Thigh Free Flap" Value="Anterolateral Thigh Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Rectus Abdominis Free Flap" Value="Rectus Abdominis Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Scapular Free Flap" Value="Scapular Free Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Flap" Value="Pectoralis Major Flap"></asp:ListItem>
                    <asp:ListItem Text="Pectoralis Major Myocutaneous Flap" Value="Pectoralis Major Myocutaneous Flap"></asp:ListItem>
                </euc:EformExtendedCheckBoxList></td>

				
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="80px" DropDownWidth="auto" RecordId="29"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_29" LookupCode="OpSide,Disease,HeadNeck" Runat="server"  /> </td>

            <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_29" runat="server"/></td>
       </tr>   
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ReconHtmlTable');" />

</div>
<table>
    <tr id="ReconAbsentRow">
        <td>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="TableName" ID="TableName_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldName" ID="FieldName_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_4"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>

<br /><br /><br />

<script type="text/javascript">

//*******************************************************************************
//******************************************************************************* OR Room Details JS
//*******************************************************************************

    // DATETEXT - DATE HANDLING  -- 
    function GlobalAssociatedDate(dateTextElement,dateElement)
    {
        dateTextElementId = dateTextElement.id;
        dateDisplayId = dateTextElementId.replace('DateText','DateDisplay');
        dateDisplayElement = document.getElementById(dateDisplayId);
        fuzzyDate(dateTextElement, dateElement);
        if (dateElement && dateDisplayElement) { dateDisplayElement.innerHTML = dateElement.value; }
    }

    //Adds events to controls
    function addEventsOR(OpInstitutionDefaultBtn,OpInstitutionOtherBtn,OpInstitutionOtherDiv,OpInstitutionOther,OpInstitution,SurgDateText,SurgDate,CaseSurgeonField,OpQuality)
    { 
        $(OpInstitutionDefaultBtn).addEvent('click',curry(SetHiddenFieldsOR1,OpInstitutionDefaultBtn,OpInstitutionOtherBtn,OpInstitutionOtherDiv,OpInstitutionOther,OpInstitution,OpQuality));
        $(OpInstitutionOtherBtn).addEvent('click',curry(SetHiddenFieldsOR2,OpInstitutionDefaultBtn,OpInstitutionOtherBtn,OpInstitutionOtherDiv,OpInstitutionOther,OpInstitution,OpQuality));
        $(OpInstitutionOther).addEvent('blur',curry(SetHiddenFieldsOR2,OpInstitutionDefaultBtn,OpInstitutionOtherBtn,OpInstitutionOtherDiv,OpInstitutionOther,OpInstitution,OpQuality));

        $(SurgDateText).addEvent('blur',curry(SetHiddenFieldsOR3,SurgDateText,SurgDate,CaseSurgeonField,OpQuality));
        $(CaseSurgeonField).addEvent('blur',curry(SetHiddenFieldsOR3,SurgDateText,SurgDate,CaseSurgeonField,OpQuality));

      ShowResultsOnLoadOR();
    }

    addEventsOR($('<%= OpInstitutionDefaultBtn.ClientID %>'),$('<%= OpInstitutionOtherBtn.ClientID %>'),$('<%= OpInstitutionOtherDiv.ClientID %>'),$('<%= OpInstitutionOther.ClientID %>'),$('<%= OpInstitution.ClientID %>'),$('<%= SurgDateText.ClientID %>'),$('<%= SurgDate.ClientID %>'),$('<%= CaseSurgeonField.ClientID %>'),$('<%= OpQuality.ClientID %>'));
 
    /* ]]> */
        
    function SetHiddenFieldsOR1(OpInstitutionDefaultBtn,OpInstitutionOtherBtn,OpInstitutionOtherDiv,OpInstitutionOther,OpInstitution,OpQuality)
    {
         var radioList1 = OpInstitutionDefaultBtn.getElementsByTagName('input');
         var radioList2 = OpInstitutionOtherBtn.getElementsByTagName('input');


       if (radioList1[0].checked)
        {
             OpInstitution.value = radioList1[0].value;

            radioList2[0].checked = false;
            OpInstitutionOther.value = '';
            OpInstitutionOtherDiv.style.display = 'none';
            
            OpQuality.value = 'STD';
        }
        else
        {
            OpInstitution.value = '';
            OpQuality.value = '';
        }
    }

    function SetHiddenFieldsOR2(OpInstitutionDefaultBtn,OpInstitutionOtherBtn,OpInstitutionOtherDiv,OpInstitutionOther,OpInstitution,OpQuality)
    {
         var radioList1 = OpInstitutionDefaultBtn.getElementsByTagName('input');
         var radioList2 = OpInstitutionOtherBtn.getElementsByTagName('input');

        if (radioList2[0].checked)
        {
             OpInstitution.value = OpInstitutionOther.value;

            radioList1[0].checked = false;
            OpInstitutionOtherDiv.style.display = 'block';
            OpQuality.value = 'STD';      
        }
        else
        {
            OpInstitution.value = '';
            OpQuality.value = '';
        }
    }

    function SetHiddenFieldsOR3(SurgDateText,CaseSurgeonField,OpQuality)
    {   
    	if ( SurgDateText.value != '' || CaseSurgeonField.value != '' )
        {
            OpQuality.value = 'STD';      
        }
        else
        {
            OpQuality.value = '';
        }
    }
    
    	
   function  ShowResultsOnLoadOR()
   {
       var resultObj = document.getElementById('<%= OpInstitution.ClientID %>');
       var otherDiv = document.getElementById('<%= OpInstitutionOtherDiv.ClientID %>');
       var otherObj = document.getElementById('<%= OpInstitutionOther.ClientID %>');
       var typeObj1 = document.getElementById('<%= OpInstitutionDefaultBtn.ClientID %>');
       var radioList1 = typeObj1.getElementsByTagName('input');
       var typeObj2 = document.getElementById('<%= OpInstitutionOtherBtn.ClientID %>');
       var radioList2 = typeObj2.getElementsByTagName('input');
   
        if (resultObj.value != '')
        {
            if (resultObj.value == radioList1[0].value) 
            {          
                radioList1[0].checked = true;
                
                radioList2[0].checked = false;
                otherObj.value = '';
                otherDiv.style.display = 'none';
            }
            else
            {
                radioList2[0].checked = true;
                otherObj.value = resultObj.value;
                otherDiv.style.display = 'block';
                
                radioList1[0].checked = false;

            }
        }
   }
   


//*******************************************************************************
//******************************************************************************* Soft Tissue Resection JS
//*******************************************************************************

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEventsSTR(procDateTextID,procDateID,procPrimaryID,procSiteID,procInstitutionID,procQualityID,procDataSourceID,procIndicationID,procApproachHiddenID,procApproachID,procApproachSuffixID,procApproachSuffixDiv,procNameID,procSideID,ProcSubsiteID,defaultInstitutionID,globalProcDateTextID,globalProcDateID)
    { 
         // update associated global date element
        $(globalProcDateTextID).addEvent('blur',curry(GlobalAssociatedDate,globalProcDateTextID, globalProcDateID));
        // also, calculate on page load
        GlobalAssociatedDate(globalProcDateTextID, globalProcDateID);

       $(globalProcDateTextID).addEvent('blur',curry(SetHiddenFieldsSTR1,procDateTextID,procDateID,procPrimaryID,procSiteID,procInstitutionID,procQualityID,procDataSourceID,procIndicationID,procApproachHiddenID,procApproachID,procApproachSuffixID,procApproachSuffixDiv,procNameID,procSideID,ProcSubsiteID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        $(procIndicationID).addEvent('blur',curry(SetHiddenFieldsSTR1,procDateTextID,procDateID,procPrimaryID,procSiteID,procInstitutionID,procQualityID,procDataSourceID,procIndicationID,procApproachHiddenID,procApproachID,procApproachSuffixID,procApproachSuffixDiv,procNameID,procSideID,ProcSubsiteID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        $(procApproachID).addEvent('blur',curry(SetHiddenFieldsSTR1,procDateTextID,procDateID,procPrimaryID,procSiteID,procInstitutionID,procQualityID,procDataSourceID,procIndicationID,procApproachHiddenID,procApproachID,procApproachSuffixID,procApproachSuffixDiv,procNameID,procSideID,ProcSubsiteID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        $(procNameID).addEvent('blur',curry(SetHiddenFieldsSTR1,procDateTextID,procDateID,procPrimaryID,procSiteID,procInstitutionID,procQualityID,procDataSourceID,procIndicationID,procApproachHiddenID,procApproachID,procApproachSuffixID,procApproachSuffixDiv,procNameID,procSideID,ProcSubsiteID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        $(procSideID).addEvent('blur',curry(SetHiddenFieldsSTR1,procDateTextID,procDateID,procPrimaryID,procSiteID,procInstitutionID,procQualityID,procDataSourceID,procIndicationID,procApproachHiddenID,procApproachID,procApproachSuffixID,procApproachSuffixDiv,procNameID,procSideID,ProcSubsiteID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        $(ProcSubsiteID).addEvent('blur',curry(SetHiddenFieldsSTR1,procDateTextID,procDateID,procPrimaryID,procSiteID,procInstitutionID,procQualityID,procDataSourceID,procIndicationID,procApproachHiddenID,procApproachID,procApproachSuffixID,procApproachSuffixDiv,procNameID,procSideID,ProcSubsiteID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
  
         var rbl = procApproachSuffixID.getElementsByTagName('input');
        for (var j = 0; j < rbl.length; j++)
        {
            var rblRef = rbl[j];
            if (rblRef.type == 'radio')
                  $(rblRef).addEvent('click',curry(SetHiddenFieldsSTR1,procDateTextID,procDateID,procPrimaryID,procSiteID,procInstitutionID,procQualityID,procDataSourceID,procIndicationID,procApproachHiddenID,procApproachID,procApproachSuffixID,procApproachSuffixDiv,procNameID,procSideID,ProcSubsiteID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        } 
        //show on load
        SetHiddenFieldsSTR1(procDateTextID,procDateID,procPrimaryID,procSiteID,procInstitutionID,procQualityID,procDataSourceID,procIndicationID,procApproachHiddenID,procApproachID,procApproachSuffixID,procApproachSuffixDiv,procNameID,procSideID,ProcSubsiteID,defaultInstitutionID,globalProcDateTextID,globalProcDateID);
   }

    addEventsSTR($('<%= ProcDateText_1.ClientID %>'),$('<%= ProcDate_1.ClientID %>'),$('<%= ProcPrimary_1.ClientID %>'),$('<%= ProcSite_1.ClientID %>'),$('<%= ProcInstitution_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'),$('<%= ProcDataSource_1.ClientID %>'),$('<%= ProcIndication_1.ClientID %>'),$('<%= ProcApproach_1.ClientID %>'),$('<%= ProcApproachOption_1.ClientID %>'),$('<%= ProcApproachOpenOption_1.ClientID %>'),$('<%= ProcApproachOpenOptionDiv_1.ClientID %>'),$('<%= ProcName_1.ClientID %>'),$('<%= ProcSide_1.ClientID %>'),$('<%= ProcSubsite_1.ClientID %>'),$('<%= OpInstitution.ClientID %>'),$('<%= SurgDateText.ClientID %>'),$('<%= SurgDate.ClientID %>'));
    addEventsSTR($('<%= ProcDateText_2.ClientID %>'),$('<%= ProcDate_2.ClientID %>'),$('<%= ProcPrimary_2.ClientID %>'),$('<%= ProcSite_2.ClientID %>'),$('<%= ProcInstitution_2.ClientID %>'),$('<%= ProcQuality_2.ClientID %>'),$('<%= ProcDataSource_2.ClientID %>'),$('<%= ProcIndication_2.ClientID %>'),$('<%= ProcApproach_2.ClientID %>'),$('<%= ProcApproachOption_2.ClientID %>'),$('<%= ProcApproachOpenOption_2.ClientID %>'),$('<%= ProcApproachOpenOptionDiv_2.ClientID %>'),$('<%= ProcName_2.ClientID %>'),$('<%= ProcSide_2.ClientID %>'),$('<%= ProcSubsite_2.ClientID %>'),$('<%= OpInstitution.ClientID %>'),$('<%= SurgDateText.ClientID %>'),$('<%= SurgDate.ClientID %>'));
    addEventsSTR($('<%= ProcDateText_3.ClientID %>'),$('<%= ProcDate_3.ClientID %>'),$('<%= ProcPrimary_3.ClientID %>'),$('<%= ProcSite_3.ClientID %>'),$('<%= ProcInstitution_3.ClientID %>'),$('<%= ProcQuality_3.ClientID %>'),$('<%= ProcDataSource_3.ClientID %>'),$('<%= ProcIndication_3.ClientID %>'),$('<%= ProcApproach_3.ClientID %>'),$('<%= ProcApproachOption_3.ClientID %>'),$('<%= ProcApproachOpenOption_3.ClientID %>'),$('<%= ProcApproachOpenOptionDiv_3.ClientID %>'),$('<%= ProcName_3.ClientID %>'),$('<%= ProcSide_3.ClientID %>'),$('<%= ProcSubsite_3.ClientID %>'),$('<%= OpInstitution.ClientID %>'),$('<%= SurgDateText.ClientID %>'),$('<%= SurgDate.ClientID %>'));
    addEventsSTR($('<%= ProcDateText_4.ClientID %>'),$('<%= ProcDate_4.ClientID %>'),$('<%= ProcPrimary_4.ClientID %>'),$('<%= ProcSite_4.ClientID %>'),$('<%= ProcInstitution_4.ClientID %>'),$('<%= ProcQuality_4.ClientID %>'),$('<%= ProcDataSource_4.ClientID %>'),$('<%= ProcIndication_4.ClientID %>'),$('<%= ProcApproach_4.ClientID %>'),$('<%= ProcApproachOption_4.ClientID %>'),$('<%= ProcApproachOpenOption_4.ClientID %>'),$('<%= ProcApproachOpenOptionDiv_4.ClientID %>'),$('<%= ProcName_4.ClientID %>'),$('<%= ProcSide_4.ClientID %>'),$('<%= ProcSubsite_4.ClientID %>'),$('<%= OpInstitution.ClientID %>'),$('<%= SurgDateText.ClientID %>'),$('<%= SurgDate.ClientID %>'));
    addEventsSTR($('<%= ProcDateText_5.ClientID %>'),$('<%= ProcDate_5.ClientID %>'),$('<%= ProcPrimary_5.ClientID %>'),$('<%= ProcSite_5.ClientID %>'),$('<%= ProcInstitution_5.ClientID %>'),$('<%= ProcQuality_5.ClientID %>'),$('<%= ProcDataSource_5.ClientID %>'),$('<%= ProcIndication_5.ClientID %>'),$('<%= ProcApproach_5.ClientID %>'),$('<%= ProcApproachOption_5.ClientID %>'),$('<%= ProcApproachOpenOption_5.ClientID %>'),$('<%= ProcApproachOpenOptionDiv_5.ClientID %>'),$('<%= ProcName_5.ClientID %>'),$('<%= ProcSide_5.ClientID %>'),$('<%= ProcSubsite_5.ClientID %>'),$('<%= OpInstitution.ClientID %>'),$('<%= SurgDateText.ClientID %>'),$('<%= SurgDate.ClientID %>'));

    /* ]]> */
    
    function SetHiddenFieldsSTR1(procDateTextID,procDateID,procPrimaryID,procSiteID,procInstitutionID,procQualityID,procDataSourceID,procIndicationID,procApproachHiddenID,procApproachID,procApproachSuffixID,procApproachSuffixDiv,procNameID,procSideID,ProcSubsiteID,defaultInstitutionID,globalProcDateTextID,globalProcDateID)
    {   
       if (procApproachID.value != '' && procApproachID.value.indexOf('Open') > -1)
            procApproachSuffixDiv.style.display = 'block';
        else
        {
            procApproachSuffixDiv.style.display = 'none';
            
            var suffixRBLRef = procApproachSuffixID.getElementsByTagName('input');
            for (var i = 0; i < suffixRBLRef.length; i++)
                        suffixRBLRef[i].checked = false;
        }
    
        if (procIndicationID.value != '' || procApproachID.value != '' || procNameID.value != '' || procSideID.value != '' || ProcSubsiteID.value != '' )
        {
            procDateTextID.value = globalProcDateTextID.value;
            procDateID.value = globalProcDateID.value;            
            procPrimaryID.value = '1';
            procSiteID.value = "Oropharynx";
            procInstitutionID.value = defaultInstitutionID.value;
            procQualityID.value = "STD";
            procDataSourceID.value = "Medical Record";
            
            procApproachHiddenID.value = procApproachID.value;
            
            if (procApproachID.value != '' )
            {
                if (procApproachID.value.indexOf('Open') > -1)
                {
                    var approachSuffixString = RetrieveRadioBtnListSelectedValues (procApproachSuffixID,"TABLE");
                    procApproachHiddenID.value = "Open " + approachSuffixString;                    
                }                    
            }            
        }
        else
        {
            procDateTextID.value = '';
            procDateID.value = '';            
            procPrimaryID.value = '';
            procSiteID.value = '';
            procInstitutionID.value = '';
            procQualityID.value = '';
            procDataSourceID.value = '';
        }
    }
    
//*******************************************************************************
//******************************************************************************* BONE WORK JS
//*******************************************************************************

    //Adds events to controls 
    addEventsBW($('<%= ProcDateText_6.ClientID %>'), $('<%= ProcDate_6.ClientID %>'), $('<%= ProcName_6.ClientID %>'), $('<%= ProcSide_6.ClientID %>'), $('<%= ProcInstitution_6.ClientID %>'), $('<%= ProcSite_6.ClientID %>'), $('<%= ProcQuality_6.ClientID %>'), $('<%= ProcDataSource_6.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsBW($('<%= ProcDateText_7.ClientID %>'), $('<%= ProcDate_7.ClientID %>'), $('<%= ProcName_7.ClientID %>'), $('<%= ProcSide_7.ClientID %>'), $('<%= ProcInstitution_7.ClientID %>'), $('<%= ProcSite_7.ClientID %>'), $('<%= ProcQuality_7.ClientID %>'), $('<%= ProcDataSource_7.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsBW($('<%= ProcDateText_8.ClientID %>'), $('<%= ProcDate_8.ClientID %>'), $('<%= ProcName_8.ClientID %>'), $('<%= ProcSide_8.ClientID %>'), $('<%= ProcInstitution_8.ClientID %>'), $('<%= ProcSite_8.ClientID %>'), $('<%= ProcQuality_8.ClientID %>'), $('<%= ProcDataSource_8.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsBW($('<%= ProcDateText_9.ClientID %>'), $('<%= ProcDate_9.ClientID %>'), $('<%= ProcName_9.ClientID %>'), $('<%= ProcSide_9.ClientID %>'), $('<%= ProcInstitution_9.ClientID %>'), $('<%= ProcSite_9.ClientID %>'), $('<%= ProcQuality_9.ClientID %>'), $('<%= ProcDataSource_9.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsBW($('<%= ProcDateText_10.ClientID %>'), $('<%= ProcDate_10.ClientID %>'), $('<%= ProcName_10.ClientID %>'), $('<%= ProcSide_10.ClientID %>'), $('<%= ProcInstitution_10.ClientID %>'), $('<%= ProcSite_10.ClientID %>'), $('<%= ProcQuality_10.ClientID %>'), $('<%= ProcDataSource_10.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));

    function addEventsBW(procDateTextID,procDateID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID)
    { 
        // update associated global date element
        $(globalProcDateTextID).addEvent('blur',curry(GlobalAssociatedDate,globalProcDateTextID, globalProcDateID));
        // also, calculate on page load
        GlobalAssociatedDate(globalProcDateTextID, globalProcDateID);

        $(globalProcDateTextID).addEvent('blur',curry(SetHiddenFieldsBW1,procDateTextID,procDateID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        $(procNameID).addEvent('blur',curry(SetHiddenFieldsBW1,procDateTextID,procDateID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        $(procSideID).addEvent('blur',curry(SetHiddenFieldsBW1,procDateTextID,procDateID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
    }

    function SetHiddenFieldsBW1 (procDateTextID,procDateID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID)
    { 
        if (procNameID.value != '' || procSideID.value != '')
        {
            procDateTextID.value = globalProcDateTextID.value;
            procDateID.value = globalProcDateID.value;
            procInstitutionID.value = defaultInstitutionID.value;
            procSiteID.value = 'Oropharynx';
            procQualityID.value = 'STD';
            procDataSourceID.value = 'Medical Record';
        }
        else
        {
            procDateTextID.value = '';
            procDateID.value = '';
            procInstitutionID.value = '';
            procSiteID.value = '';
            procQualityID.value = '';
            procDataSourceID.value = '';
        }              
    } 


    addAbsentEventBW($('<%= BoneWorkRecorded.ClientID %>'),$('<%= BoneWorkDiv.ClientID %>'),$('<%= BoneWorkAbsentDiv.ClientID %>'),$('<%= AbsentDateText_2.ClientID %>'));

    function addAbsentEventBW(boneWorkRecordedID,boneWorkDivID,boneWorkAbsentDivID,absentDateTextID)
    {  
        $(absentDateTextID).addEvent('blur',curry(BoneWorkYesNo,boneWorkRecordedID,boneWorkDivID,boneWorkAbsentDivID));
        $(boneWorkRecordedID).addEvent('click',curry(BoneWorkYesNo,boneWorkRecordedID,boneWorkDivID,boneWorkAbsentDivID));
       
        // check on load as well
       BoneWorkYesNo(boneWorkRecordedID,boneWorkDivID,boneWorkAbsentDivID);

    }
   
    /* ]]> */
    
   
    function BoneWorkYesNo(boneWorkRecordedID,boneWorkDivID,boneWorkAbsentDivID)
    {
       var boneWorkRecordedRef = boneWorkRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < boneWorkRecordedRef.length; i++) 
        if (boneWorkRecordedRef[i].checked) {  
            BoneWorkRadioClick(boneWorkRecordedRef[i].value,boneWorkDivID,boneWorkAbsentDivID);
            }
    }

    function BoneWorkRadioClick(BoneWorkoption_value,BoneWorkhideDiv,BoneWorkhideAbsentDiv)
    {
      if (BoneWorkoption_value == "Yes" )
      { 
       BoneWorkhideDiv.style.display='block';
       BoneWorkhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_1.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_1.ClientID %>').value='';
        document.getElementById('<%= TableName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_1.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_1.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_1.ClientID %>').value = '';
       
      } 
      else if (BoneWorkoption_value == "No")
      {
        BoneWorkhideAbsentDiv.style.display='block';
        BoneWorkhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_1.ClientID %>').value = 'Procedures';        
        document.getElementById('<%= FieldName_1.ClientID %>').value = 'ProcName';        
        document.getElementById('<%= FieldValue_1.ClientID %>').value = 'Bone Work';        
        document.getElementById('<%= AbsentReason_1.ClientID %>').value = 'Not Performed';        
        document.getElementById('<%= AbsentQuality_1.ClientID %>').value = 'STD';        
              
        document.getElementById('<%= ProcDateText_6.ClientID %>').value='';
        document.getElementById('<%= ProcDate_6.ClientID %>').value='';
        document.getElementById('<%= ProcName_6.ClientID %>').value='';
        document.getElementById('<%= ProcSide_6.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_6.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_6.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_6.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_6.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_7.ClientID %>').value='';
        document.getElementById('<%= ProcDate_7.ClientID %>').value='';
        document.getElementById('<%= ProcName_7.ClientID %>').value='';
        document.getElementById('<%= ProcSide_7.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_7.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_7.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_7.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_7.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_8.ClientID %>').value='';
        document.getElementById('<%= ProcDate_8.ClientID %>').value='';
        document.getElementById('<%= ProcName_8.ClientID %>').value='';
        document.getElementById('<%= ProcSide_8.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_8.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_8.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_8.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_8.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_9.ClientID %>').value='';
        document.getElementById('<%= ProcDate_9.ClientID %>').value='';
        document.getElementById('<%= ProcName_9.ClientID %>').value='';
        document.getElementById('<%= ProcSide_9.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_9.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_9.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_9.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_9.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_10.ClientID %>').value='';
        document.getElementById('<%= ProcDate_10.ClientID %>').value='';
        document.getElementById('<%= ProcName_10.ClientID %>').value='';
        document.getElementById('<%= ProcSide_10.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_10.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_10.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_10.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_10.ClientID %>').value=''; 

     }
   }

//*******************************************************************************
//******************************************************************************* Lateral Neck Dissection JS
//*******************************************************************************


	    
    //Adds events to controls 
    addEventsLND($('<%= ProcDateText_11.ClientID %>'), $('<%= ProcDate_11.ClientID %>'), $('<%= ProcIndication_11.ClientID %>'), $('<%= ProcName_11.ClientID %>'), $('<%= ProcInstitution_11.ClientID %>'), $('<%= ProcSite_11.ClientID %>'), $('<%= ProcSide_11.ClientID %>'), $('<%= ProcSubsite_11.ClientID %>'), $('<%= ProcSubsiteCBL_11.ClientID %>'), $('<%= ProcQuality_11.ClientID %>'), $('<%= ProcDataSource_11.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsLND($('<%= ProcDateText_12.ClientID %>'), $('<%= ProcDate_12.ClientID %>'), $('<%= ProcIndication_12.ClientID %>'), $('<%= ProcName_12.ClientID %>'), $('<%= ProcInstitution_12.ClientID %>'), $('<%= ProcSite_12.ClientID %>'), $('<%= ProcSide_12.ClientID %>'), $('<%= ProcSubsite_12.ClientID %>'), $('<%= ProcSubsiteCBL_12.ClientID %>'), $('<%= ProcQuality_12.ClientID %>'), $('<%= ProcDataSource_12.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));

    function addEventsLND(procDateTextID,procDateID,procIndicationID,procNameID,procInstitutionID,procSiteID,procSideID,procSubsiteHiddenID,procSubsiteCBL,procQualityID,procDatasourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID)
    { 
         // update associated global date element
        $(globalProcDateTextID).addEvent('blur',curry(GlobalAssociatedDate,globalProcDateTextID, globalProcDateID));
        // also, calculate on page load
        GlobalAssociatedDate(globalProcDateTextID, globalProcDateID);

       $(globalProcDateTextID).addEvent('blur',curry(SetHiddenFieldsLND1,procDateTextID,procDateID,procIndicationID,procNameID,procInstitutionID,procSiteID,procSideID,procSubsiteHiddenID,procSubsiteCBL,procQualityID,procDatasourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        $(procIndicationID).addEvent('blur',curry(SetHiddenFieldsLND1,procDateTextID,procDateID,procIndicationID,procNameID,procInstitutionID,procSiteID,procSideID,procSubsiteHiddenID,procSubsiteCBL,procQualityID,procDatasourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        $(procSideID).addEvent('blur',curry(SetHiddenFieldsLND1,procDateTextID,procDateID,procIndicationID,procNameID,procInstitutionID,procSiteID,procSideID,procSubsiteHiddenID,procSubsiteCBL,procQualityID,procDatasourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
    
        var cbl = procSubsiteCBL.getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++)
        {
            var cblRef = cbl[j];
            if (cblRef.type == 'checkbox')
                  $(cblRef).addEvent('click',curry(SetHiddenFieldsLND1,procDateTextID,procDateID,procIndicationID,procNameID,procInstitutionID,procSiteID,procSideID,procSubsiteHiddenID,procSubsiteCBL,procQualityID,procDatasourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
            else if (cblRef.type == 'text')
                  $(cblRef).addEvent('blur',curry(SetHiddenFieldsLND1,procDateTextID,procDateID,procIndicationID,procNameID,procInstitutionID,procSiteID,procSideID,procSubsiteHiddenID,procSubsiteCBL,procQualityID,procDatasourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        } 
    }

    function SetHiddenFieldsLND1 (procDateTextID,procDateID,procIndicationID,procNameID,procInstitutionID,procSiteID,procSideID,procSubsiteHiddenID,procSubsiteCBL,procQualityID,procDatasourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID)
    {
        var selectedSubsites = RetrieveCheckBoxListSelectedValues (procSubsiteCBL, "Table");

        if (procIndicationID.value != '' || procSideID.value != '' || selectedSubsites != '')
        {
            procDateTextID.value = globalProcDateTextID.value;
            procDateID.value = globalProcDateID.value;
            if (selectedSubsites != '')
                procSubsiteHiddenID.value = "Level " + selectedSubsites;
            else
                procSubsiteHiddenID.value = '';
            procNameID.value = 'Lateral Neck Dissection';
            procInstitutionID.value = defaultInstitutionID.value;  
            procSiteID.value = 'Oropharynx';
            procQualityID.value = 'STD';
            procDatasourceID.value = 'Medical Record';
        }
        else
        {
            procDateTextID.value = '';
            procDateID.value = '';
            procNameID.value = '';
            procSubsiteHiddenID.value = '';
            procInstitutionID.value = '';
            procSiteID.value = '';
            procQualityID.value = '';
            procDatasourceID.value = '';
        }              
    } 
 


    addAbsentEvent2($('<%= LateralDissectDone.ClientID %>'),$('<%= LateralDissectDiv.ClientID %>'),$('<%= LateralDissectAbsentDiv.ClientID %>'),$('<%= AbsentDateText_2.ClientID %>'));

    function addAbsentEvent2(lateralDissectRecordedID,lateralDissectDivID,lateralDissectAbsentDivID, absentDateID)
    {  
        $(lateralDissectRecordedID).addEvent('click',curry(LateralDissectYesNo,lateralDissectRecordedID,lateralDissectDivID,lateralDissectAbsentDivID));
         $(absentDateID).addEvent('blur',curry(LateralDissectYesNo,lateralDissectRecordedID,lateralDissectDivID,lateralDissectAbsentDivID));
      
        // check on load as well
       LateralDissectYesNo(lateralDissectRecordedID,lateralDissectDivID,lateralDissectAbsentDivID);

    }
   
    /* ]]> */
    
    function LateralDissectYesNo(lateralDissectRecordedID,lateralDissectDivID,lateralDissectAbsentDivID)
    {
       var lateralDissectRecordedRef = lateralDissectRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < lateralDissectRecordedRef.length; i++) 
        if (lateralDissectRecordedRef[i].checked) {  
            LateralDissectRadioClick(lateralDissectRecordedRef[i].value,lateralDissectDivID,lateralDissectAbsentDivID);
            }
    }
    
    function LateralDissectRadioClick(LateralDissectoption_value,LateralDissecthideDiv,LateralDissecthideAbsentDiv)
    {
      if (LateralDissectoption_value == "Yes")
      { 
       LateralDissecthideDiv.style.display='block';
       LateralDissecthideAbsentDiv.style.display='none';
    
        document.getElementById('<%= AbsentDateText_2.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_2.ClientID %>').value='';
        document.getElementById('<%= TableName_2.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_2.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_2.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_2.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_2.ClientID %>').value = '';
               
      } 
      else if (LateralDissectoption_value == "No")
      {
        LateralDissecthideAbsentDiv.style.display='block';
        LateralDissecthideDiv.style.display='none';
      
        document.getElementById('<%= TableName_2.ClientID %>').value = 'Procedures';        
        document.getElementById('<%= FieldName_2.ClientID %>').value = 'ProcName';        
        document.getElementById('<%= FieldValue_2.ClientID %>').value = 'Lateral Neck Dissection';        
        document.getElementById('<%= AbsentReason_2.ClientID %>').value = 'Not Performed';        
        document.getElementById('<%= AbsentQuality_2.ClientID %>').value = 'STD';        
        
        document.getElementById('<%= ProcDateText_11.ClientID %>').value='';
        document.getElementById('<%= ProcDate_11.ClientID %>').value='';
         document.getElementById('<%= ProcIndication_11.ClientID %>').value='';
       document.getElementById('<%= ProcName_11.ClientID %>').value='';
        document.getElementById('<%= ProcInstitution_11.ClientID %>').value='';
	    document.getElementById('<%= ProcSite_11.ClientID %>').value='';
	    document.getElementById('<%= ProcQuality_11.ClientID %>').value='';
	    document.getElementById('<%= ProcDataSource_11.ClientID %>').value='';
	    document.getElementById('<%= ProcSubsite_11.ClientID %>').value='';
	    
	    var subsite4ID = document.getElementById('<%= ProcSubsiteCBL_11.ClientID %>');
	    var subsite4Ref = subsite4ID.getElementsByTagName("input");
         for (var i = 0; i < subsite4Ref.length; i++) {
               subsite4Ref[i].checked = false;
         }

	    document.getElementById('<%= ProcSide_11.ClientID %>').value='';
	    
	    document.getElementById('<%= ProcDateText_12.ClientID %>').value='';
        document.getElementById('<%= ProcDate_12.ClientID %>').value='';
         document.getElementById('<%= ProcIndication_12.ClientID %>').value='';
        document.getElementById('<%= ProcName_12.ClientID %>').value='';
        document.getElementById('<%= ProcInstitution_12.ClientID %>').value='';
	    document.getElementById('<%= ProcSite_12.ClientID %>').value='';
	    document.getElementById('<%= ProcQuality_12.ClientID %>').value='';
	    document.getElementById('<%= ProcDataSource_12.ClientID %>').value='';
	     document.getElementById('<%= ProcSubsite_12.ClientID %>').value='';
	    
	    var subsite5ID = document.getElementById('<%= ProcSubsiteCBL_12.ClientID %>');
	    var subsite5Ref = subsite5ID.getElementsByTagName("input");
	    
         for (var i = 0; i < subsite5Ref.length; i++) {
               subsite5Ref[i].checked = false;

          }
               
	    document.getElementById('<%= ProcSide_12.ClientID %>').value='';
	    
      }
    }

//*******************************************************************************
//******************************************************************************* Ancillary Surgery JS
//*******************************************************************************

    addProcEventsAS($('<%= ProcName_15_Text.ClientID %>'), $('<%= ProcName_15.ClientID %>'), $('<%= ProcDateText_15.ClientID %>') ,$('<%= ProcDate_15.ClientID %>'), $('<%= ProcSite_15.ClientID %>'), $('<%= ProcInstitution_15.ClientID %>'), $('<%= ProcQuality_15.ClientID %>'), $('<%= ProcDataSource_15.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addProcEventsAS($('<%= ProcName_16_Text.ClientID %>'), $('<%= ProcName_16.ClientID %>'), $('<%= ProcDateText_16.ClientID %>') ,$('<%= ProcDate_16.ClientID %>'), $('<%= ProcSite_16.ClientID %>'), $('<%= ProcInstitution_16.ClientID %>'), $('<%= ProcQuality_16.ClientID %>'), $('<%= ProcDataSource_16.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addProcEventsAS($('<%= ProcName_17_Text.ClientID %>'), $('<%= ProcName_17.ClientID %>'), $('<%= ProcDateText_17.ClientID %>') ,$('<%= ProcDate_17.ClientID %>'), $('<%= ProcSite_17.ClientID %>'), $('<%= ProcInstitution_17.ClientID %>'), $('<%= ProcQuality_17.ClientID %>'), $('<%= ProcDataSource_17.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));

    function addProcEventsAS(procNameID,procNameCBID,procDateTextID,procDateID,siteID,institutionID,procQualityID,procDataSourceID,globalInstitutionID,globalProcDateTextID,globalProcDateID)
    {   
        // update associated global date element
        $(globalProcDateTextID).addEvent('blur',curry(GlobalAssociatedDate,globalProcDateTextID, globalProcDateID));
        // also, calculate on page load
        GlobalAssociatedDate(globalProcDateTextID, globalProcDateID);


        if (procNameCBID.type == 'checkbox') {
            $(procNameCBID).addEvent('click',curry(SetHiddenFieldsAS1,procNameID,procNameCBID,procDateTextID,procDateID,siteID,institutionID,procQualityID,procDataSourceID,globalInstitutionID,globalProcDateTextID,globalProcDateID));
        }
        else if (procNameCBID.type == 'text') {
            $(procNameCBID).addEvent('blur',curry(SetHiddenFieldsAS1,procNameID,procNameCBID,procDateTextID,procDateID,siteID,institutionID,procQualityID,procDataSourceID,globalInstitutionID,globalProcDateTextID,globalProcDateID));
        }
        
        CheckOnLoadAS (procNameID,procNameCBID);
    }
    
    function CheckOnLoadAS (procNameID,procNameCBID)
    {
        if (procNameID.value != '')
        {
            if (procNameCBID.type == 'checkbox')
                procNameCBID.checked = true;
            
            else if (procNameCBID.type == 'text')
                procNameCBID.value = procNameID.value;
        }
        else
        {
             if (procNameCBID.type == 'checkbox')
                procNameCBID.checked = false;
            
            else if (procNameCBID.type == 'text')
                procNameCBID.value = '';
       
        }
            
    }
    
    function SetHiddenFieldsAS1 (procNameID,procNameCBID,procDateTextID,procDateID,siteID,institutionID,procQualityID,procDataSourceID,globalInstitutionID,globalProcDateTextID,globalProcDateID) 
    {

      // if user clicked a procedure name            
      if (procNameCBID.type == 'checkbox')
      {
        if (procNameCBID.checked)
        {                  
            // set hidden fields for procedure date 
            procDateTextID.value = globalProcDateTextID.value;
            procDateID.value = globalProcDateID.value;
            procNameID.value = procNameCBID.value;  
            siteID.value = 'Oropharynx';                  
            institutionID.value = globalInstitutionID.value;
            procQualityID.value = 'STD';
            procDataSourceID.value = 'Medical Record';
        }
        else
        {
            procDateTextID.value = '';
            procDateID.value = '';
            procNameID.value = '';                    
            siteID.value = '';                  
            institutionID.value = '';
            procQualityID.value = '';
            procDataSourceID.value = '';
        }        
      }
      
      // if user typed a new procedure name 
      else if (procNameCBID.type == 'text') 
      {
        if (procNameCBID.value != '')
        {  
            // set hidden fields for procedure date
             procDateTextID.value = globalProcDateTextID.value;
             procDateID.value = globalProcDateID.value;
             procNameID.value = procNameCBID.value;                    
            siteID.value = 'Oropharynx';                  
            institutionID.value = globalInstitutionID.value;
            procQualityID.value = 'STD';
            procDataSourceID.value = 'Medical Record';

        }
        else
        {
            procDateTextID.value = '';
            procDateID.value = '';
            procNameID.value = '';                    
            siteID.value = '';                  
            institutionID.value = '';
            procQualityID.value = '';
            procDataSourceID.value = '';
        }
      }
    } 


    addAbsentEvent3($('<%= AncillaryDone.ClientID %>'),$('<%= AncillaryDiv.ClientID %>'),$('<%= AncillaryAbsentDiv.ClientID %>'),$('<%= AbsentDateText_3.ClientID %>'));

    function addAbsentEvent3(AncillaryRecordedID,AncillaryDivID,AncillaryAbsentDivID, absentDateID)
    {  
        $(AncillaryRecordedID).addEvent('click',curry(AncillaryYesNo,AncillaryRecordedID,AncillaryDivID,AncillaryAbsentDivID));
         $(absentDateID).addEvent('blur',curry(AncillaryYesNo,AncillaryRecordedID,AncillaryDivID,AncillaryAbsentDivID));
      
        // check on load as well
       AncillaryYesNo(AncillaryRecordedID,AncillaryDivID,AncillaryAbsentDivID);

    }
   
    /* ]]> */
    
    function AncillaryYesNo(AncillaryRecordedID,AncillaryDivID,AncillaryAbsentDivID)
    {
       var AncillaryRecordedRef = AncillaryRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < AncillaryRecordedRef.length; i++) 
        if (AncillaryRecordedRef[i].checked) {  
            AncillaryRadioClick(AncillaryRecordedRef[i].value,AncillaryDivID,AncillaryAbsentDivID);
            }
    }
    
    function AncillaryRadioClick(Ancillaryoption_value,AncillaryhideDiv,AncillaryhideAbsentDiv)
    {
      if (Ancillaryoption_value == "Yes")
      { 
       AncillaryhideDiv.style.display='block';
       AncillaryhideAbsentDiv.style.display='none';
    
        document.getElementById('<%= AbsentDateText_3.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_3.ClientID %>').value='';
        document.getElementById('<%= TableName_3.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_3.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_3.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_3.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_3.ClientID %>').value = '';
               
      } 
      else if (Ancillaryoption_value == "No")
      {
        AncillaryhideAbsentDiv.style.display='block';
        AncillaryhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_3.ClientID %>').value = 'Procedures';        
        document.getElementById('<%= FieldName_3.ClientID %>').value = 'ProcName';        
        document.getElementById('<%= FieldValue_3.ClientID %>').value = 'Ancillary Surgey';        
        document.getElementById('<%= AbsentReason_3.ClientID %>').value = 'Not Performed';        
        document.getElementById('<%= AbsentQuality_3.ClientID %>').value = 'STD';        
      
        document.getElementById('<%= ProcDateText_15.ClientID %>').value='';
        document.getElementById('<%= ProcDate_15.ClientID %>').value='';
        document.getElementById('<%= ProcName_15_Text.ClientID %>').value='';
        document.getElementById('<%= ProcName_15.ClientID %>').checked= false;
        document.getElementById('<%= ProcInstitution_15.ClientID %>').value='';
	    document.getElementById('<%= ProcSite_15.ClientID %>').value='';
	    document.getElementById('<%= ProcQuality_15.ClientID %>').value='';
	    document.getElementById('<%= ProcDataSource_15.ClientID %>').value='';
	    
   
        document.getElementById('<%= ProcDateText_16.ClientID %>').value='';
        document.getElementById('<%= ProcDate_16.ClientID %>').value='';
        document.getElementById('<%= ProcName_16_Text.ClientID %>').value='';
        document.getElementById('<%= ProcName_16.ClientID %>').checked= false;
        document.getElementById('<%= ProcInstitution_16.ClientID %>').value='';
	    document.getElementById('<%= ProcSite_16.ClientID %>').value='';
	    document.getElementById('<%= ProcQuality_16.ClientID %>').value='';
	    document.getElementById('<%= ProcDataSource_16.ClientID %>').value='';

        document.getElementById('<%= ProcDateText_17.ClientID %>').value='';
        document.getElementById('<%= ProcDate_17.ClientID %>').value='';
        document.getElementById('<%= ProcName_17_Text.ClientID %>').value='';
        document.getElementById('<%= ProcName_17.ClientID %>').value='';
        document.getElementById('<%= ProcInstitution_17.ClientID %>').value='';
	    document.getElementById('<%= ProcSite_17.ClientID %>').value='';
	    document.getElementById('<%= ProcQuality_17.ClientID %>').value='';
	    document.getElementById('<%= ProcDataSource_17.ClientID %>').value='';
	        
      }
    }

//*******************************************************************************
//******************************************************************************* Reconstructive Surgrery JS
//*******************************************************************************

    //Adds events to controls 
    addEventsRS($('<%= ProcDateText_20.ClientID %>'), $('<%= ProcDate_20.ClientID %>'), $('<%= ProcSurgeon_20.ClientID %>'), $('<%= ProcName_20.ClientID %>'), $('<%= ProcSide_20.ClientID %>'), $('<%= ProcInstitution_20.ClientID %>'), $('<%= ProcSite_20.ClientID %>'), $('<%= ProcQuality_20.ClientID %>'), $('<%= ProcDataSource_20.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsRS($('<%= ProcDateText_21.ClientID %>'), $('<%= ProcDate_21.ClientID %>'), $('<%= ProcSurgeon_21.ClientID %>'), $('<%= ProcName_21.ClientID %>'), $('<%= ProcSide_21.ClientID %>'), $('<%= ProcInstitution_21.ClientID %>'), $('<%= ProcSite_21.ClientID %>'), $('<%= ProcQuality_21.ClientID %>'), $('<%= ProcDataSource_21.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsRS($('<%= ProcDateText_22.ClientID %>'), $('<%= ProcDate_22.ClientID %>'), $('<%= ProcSurgeon_22.ClientID %>'), $('<%= ProcName_22.ClientID %>'), $('<%= ProcSide_22.ClientID %>'), $('<%= ProcInstitution_22.ClientID %>'), $('<%= ProcSite_22.ClientID %>'), $('<%= ProcQuality_22.ClientID %>'), $('<%= ProcDataSource_22.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsRS($('<%= ProcDateText_23.ClientID %>'), $('<%= ProcDate_23.ClientID %>'), $('<%= ProcSurgeon_23.ClientID %>'), $('<%= ProcName_23.ClientID %>'), $('<%= ProcSide_23.ClientID %>'), $('<%= ProcInstitution_23.ClientID %>'), $('<%= ProcSite_23.ClientID %>'), $('<%= ProcQuality_23.ClientID %>'), $('<%= ProcDataSource_23.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsRS($('<%= ProcDateText_24.ClientID %>'), $('<%= ProcDate_24.ClientID %>'), $('<%= ProcSurgeon_24.ClientID %>'), $('<%= ProcName_24.ClientID %>'), $('<%= ProcSide_24.ClientID %>'), $('<%= ProcInstitution_24.ClientID %>'), $('<%= ProcSite_24.ClientID %>'), $('<%= ProcQuality_24.ClientID %>'), $('<%= ProcDataSource_24.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsRS($('<%= ProcDateText_25.ClientID %>'), $('<%= ProcDate_25.ClientID %>'), $('<%= ProcSurgeon_25.ClientID %>'), $('<%= ProcName_25.ClientID %>'), $('<%= ProcSide_25.ClientID %>'), $('<%= ProcInstitution_25.ClientID %>'), $('<%= ProcSite_25.ClientID %>'), $('<%= ProcQuality_25.ClientID %>'), $('<%= ProcDataSource_25.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsRS($('<%= ProcDateText_26.ClientID %>'), $('<%= ProcDate_26.ClientID %>'), $('<%= ProcSurgeon_26.ClientID %>'), $('<%= ProcName_26.ClientID %>'), $('<%= ProcSide_26.ClientID %>'), $('<%= ProcInstitution_26.ClientID %>'), $('<%= ProcSite_26.ClientID %>'), $('<%= ProcQuality_26.ClientID %>'), $('<%= ProcDataSource_26.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsRS($('<%= ProcDateText_27.ClientID %>'), $('<%= ProcDate_27.ClientID %>'), $('<%= ProcSurgeon_27.ClientID %>'), $('<%= ProcName_27.ClientID %>'), $('<%= ProcSide_27.ClientID %>'), $('<%= ProcInstitution_27.ClientID %>'), $('<%= ProcSite_27.ClientID %>'), $('<%= ProcQuality_27.ClientID %>'), $('<%= ProcDataSource_27.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsRS($('<%= ProcDateText_28.ClientID %>'), $('<%= ProcDate_28.ClientID %>'), $('<%= ProcSurgeon_28.ClientID %>'), $('<%= ProcName_28.ClientID %>'), $('<%= ProcSide_28.ClientID %>'), $('<%= ProcInstitution_28.ClientID %>'), $('<%= ProcSite_28.ClientID %>'), $('<%= ProcQuality_28.ClientID %>'), $('<%= ProcDataSource_28.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));
    addEventsRS($('<%= ProcDateText_29.ClientID %>'), $('<%= ProcDate_29.ClientID %>'), $('<%= ProcSurgeon_29.ClientID %>'), $('<%= ProcName_29.ClientID %>'), $('<%= ProcSide_29.ClientID %>'), $('<%= ProcInstitution_29.ClientID %>'), $('<%= ProcSite_29.ClientID %>'), $('<%= ProcQuality_29.ClientID %>'), $('<%= ProcDataSource_29.ClientID %>'), $('<%= OpInstitution.ClientID %>'), $('<%= SurgDateText.ClientID %>'), $('<%= SurgDate.ClientID %>'));

    function addEventsRS(procDateTextID,procDateID,procSurgeonID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID)
    { 
        // update associated global date element
        $(globalProcDateTextID).addEvent('blur',curry(GlobalAssociatedDate,globalProcDateTextID, globalProcDateID));
        // also, calculate on page load
        GlobalAssociatedDate(globalProcDateTextID, globalProcDateID);
        
        $(globalProcDateTextID).addEvent('blur',curry(SetHiddenFieldsRS1,procDateTextID,procDateID,procSurgeonID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        $(procSurgeonID).addEvent('blur',curry(SetHiddenFieldsRS1,procDateTextID,procDateID,procSurgeonID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        
        var cbl = procNameID.getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++)
        {
            var cblRef = cbl[j];
            if (cblRef.type == 'checkbox')
                  $(cblRef).addEvent('click',curry(SetHiddenFieldsRS1,procDateTextID,procDateID,procSurgeonID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
            else if (cblRef.type == 'text')
                  $(cblRef).addEvent('blur',curry(SetHiddenFieldsRS1,procDateTextID,procDateID,procSurgeonID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
        } 
        
        $(procSideID).addEvent('blur',curry(SetHiddenFieldsRS1,procDateTextID,procDateID,procSurgeonID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID));
    }

    function SetHiddenFieldsRS1 (procDateTextID,procDateID,procSurgeonID,procNameID,procSideID,procInstitutionID,procSiteID,procQualityID,procDataSourceID,defaultInstitutionID,globalProcDateTextID,globalProcDateID)
    { 
        var selectedProcNames = RetrieveCheckBoxListSelectedValues (procNameID, "Table");
        
        if (procSurgeonID.value != '' || selectedProcNames != '' || procSideID.value != '')
        {
            procDateTextID.value = globalProcDateTextID.value;
            procDateID.value = globalProcDateID.value;
            procInstitutionID.value = defaultInstitutionID.value;
            procSiteID.value = 'Oropharynx';
            procQualityID.value = 'STD';
            procDataSourceID.value = 'Medical Record';
        }
        else
        {
            procDateTextID.value = '';
            procDateID.value = '';
            procInstitutionID.value = '';
            procSiteID.value = '';
            procQualityID.value = '';
            procDataSourceID.value = '';
        }              
    } 


    addAbsentEventRS($('<%= ReconRecorded.ClientID %>'),$('<%= ReconDiv.ClientID %>'),$('<%= ReconAbsentDiv.ClientID %>'),$('<%= AbsentDateText_2.ClientID %>'));

    function addAbsentEventRS(ReconRecordedID,ReconDivID,ReconAbsentDivID,absentDateTextID)
    {  
        $(absentDateTextID).addEvent('blur',curry(ReconYesNo,ReconRecordedID,ReconDivID,ReconAbsentDivID));
        $(ReconRecordedID).addEvent('click',curry(ReconYesNo,ReconRecordedID,ReconDivID,ReconAbsentDivID));
       
        // check on load as well
       ReconYesNo(ReconRecordedID,ReconDivID,ReconAbsentDivID);

    }
   
    /* ]]> */
    
   
    function ReconYesNo(ReconRecordedID,ReconDivID,ReconAbsentDivID)
    {
       var ReconRecordedRef = ReconRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < ReconRecordedRef.length; i++) 
        if (ReconRecordedRef[i].checked) {  
            ReconRadioClick(ReconRecordedRef[i].value,ReconDivID,ReconAbsentDivID);
            }
    }

    function ReconRadioClick(Reconoption_value,ReconhideDiv,ReconhideAbsentDiv)
    {
      if (Reconoption_value == "Yes" )
      { 
       ReconhideDiv.style.display='block';
       ReconhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_4.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_4.ClientID %>').value='';
        document.getElementById('<%= TableName_4.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_4.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_4.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_4.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_4.ClientID %>').value = '';
       
      } 
      else if (Reconoption_value == "No")
      {
        ReconhideAbsentDiv.style.display='block';
        ReconhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_4.ClientID %>').value = 'Procedures';        
        document.getElementById('<%= FieldName_4.ClientID %>').value = 'ProcName';        
        document.getElementById('<%= FieldValue_4.ClientID %>').value = 'Reonstructive Surgery';        
        document.getElementById('<%= AbsentReason_4.ClientID %>').value = 'Not Performed';        
        document.getElementById('<%= AbsentQuality_4.ClientID %>').value = 'STD';        
        
        document.getElementById('<%= ProcDateText_20.ClientID %>').value='';
        document.getElementById('<%= ProcDate_20.ClientID %>').value='';
        document.getElementById('<%= ProcSurgeon_20.ClientID %>').value='';
        document.getElementById('<%= ProcName_20.ClientID %>').value='';
        document.getElementById('<%= ProcSide_20.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_20.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_20.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_20.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_20.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_21.ClientID %>').value='';
        document.getElementById('<%= ProcDate_21.ClientID %>').value='';
        document.getElementById('<%= ProcSurgeon_21.ClientID %>').value='';
        document.getElementById('<%= ProcName_21.ClientID %>').value='';
        document.getElementById('<%= ProcSide_21.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_21.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_21.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_21.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_21.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_22.ClientID %>').value='';
        document.getElementById('<%= ProcDate_22.ClientID %>').value='';
        document.getElementById('<%= ProcSurgeon_22.ClientID %>').value='';
        document.getElementById('<%= ProcName_22.ClientID %>').value='';
        document.getElementById('<%= ProcSide_22.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_22.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_22.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_22.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_22.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_23.ClientID %>').value='';
        document.getElementById('<%= ProcDate_23.ClientID %>').value='';
        document.getElementById('<%= ProcSurgeon_23.ClientID %>').value='';
        document.getElementById('<%= ProcName_23.ClientID %>').value='';
        document.getElementById('<%= ProcSide_23.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_23.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_23.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_23.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_23.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_24.ClientID %>').value='';
        document.getElementById('<%= ProcDate_24.ClientID %>').value='';
        document.getElementById('<%= ProcSurgeon_24.ClientID %>').value='';
        document.getElementById('<%= ProcName_24.ClientID %>').value='';
        document.getElementById('<%= ProcSide_24.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_24.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_24.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_24.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_24.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_25.ClientID %>').value='';
        document.getElementById('<%= ProcDate_25.ClientID %>').value='';
        document.getElementById('<%= ProcSurgeon_25.ClientID %>').value='';
        document.getElementById('<%= ProcName_25.ClientID %>').value='';
        document.getElementById('<%= ProcSide_25.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_25.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_25.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_25.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_25.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_26.ClientID %>').value='';
        document.getElementById('<%= ProcDate_26.ClientID %>').value='';
        document.getElementById('<%= ProcSurgeon_26.ClientID %>').value='';
        document.getElementById('<%= ProcName_26.ClientID %>').value='';
        document.getElementById('<%= ProcSide_26.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_26.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_26.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_26.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_26.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_27.ClientID %>').value='';
        document.getElementById('<%= ProcDate_27.ClientID %>').value='';
        document.getElementById('<%= ProcSurgeon_27.ClientID %>').value='';
        document.getElementById('<%= ProcName_27.ClientID %>').value='';
        document.getElementById('<%= ProcSide_27.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_27.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_27.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_27.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_28.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_28.ClientID %>').value='';
        document.getElementById('<%= ProcDate_28.ClientID %>').value='';
        document.getElementById('<%= ProcSurgeon_28.ClientID %>').value='';
        document.getElementById('<%= ProcName_28.ClientID %>').value='';
        document.getElementById('<%= ProcSide_28.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_28.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_28.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_28.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_28.ClientID %>').value=''; 

        document.getElementById('<%= ProcDateText_29.ClientID %>').value='';
        document.getElementById('<%= ProcDate_29.ClientID %>').value='';
        document.getElementById('<%= ProcSurgeon_29.ClientID %>').value='';
        document.getElementById('<%= ProcName_29.ClientID %>').value='';
        document.getElementById('<%= ProcSide_29.ClientID %>').value=''; 
        document.getElementById('<%= ProcSite_29.ClientID %>').value=''; 
        document.getElementById('<%= ProcInstitution_29.ClientID %>').value=''; 
        document.getElementById('<%= ProcQuality_29.ClientID %>').value=''; 
        document.getElementById('<%= ProcDataSource_29.ClientID %>').value=''; 
     }
   }
   
</script>
