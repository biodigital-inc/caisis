<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.PreviousProceduresGyn" CodeFile="PreviousProceduresGyn.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.PreviousProceduresBreastHtmlTable = "PreviousProceduresBreastHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="PreviousProceduresGyn" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Previous Breast Procedures"></asp:Label><br/>
<table  width="550" border="0" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="PreviousProceduresBreastHtmlTable" > 

          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >Date</td>
                <td class="controlBoxDataGridTitleColumn" >Surgery</td>
                <td class="controlBoxDataGridTitleColumn" >Site</td>
                <td class="controlBoxDataGridTitleColumn" >Side</td>
                <td class="controlBoxDataGridTitleColumn"  >Approach</td>
                <td class="controlBoxDataGridTitleColumn"  >Indication</td>
                <td class="controlBoxDataGridTitleColumn" >Surgeon</td>
                <td class="controlBoxDataGridTitleColumn" >Institution</td>
                <td class="controlBoxDataGridTitleColumn" >&nbsp;</td>
          </tr>
    <asp:Repeater ID="rptSurgicalHistory" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 
	<ItemTemplate> 
	    
       <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcDateText,ProcName,ProcSite,ProcSide,ProcApproach,ProcIndication,ProcSurgeon,ProcInstitution', 'Procedures');"> 
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcDateText")%>&nbsp;</td>
             <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcName")%>&nbsp;</td>
           <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcSite")%>&nbsp;</td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcSide")%>&nbsp;</td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcApproach")%>&nbsp;</td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcIndication")%>&nbsp;</td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcSurgeon")%>&nbsp;</td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcInstitution")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
        </tr>      
	</ItemTemplate>
  </asp:Repeater>          

           <tr>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="1"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_1" Runat="server" ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="1"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_1"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownHeight="auto" Width="150px" DropDownWidth="300" RecordId="1"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_1"     LookupCode="ProcName,Disease,GTD" Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="1"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_1" LookupCode="DxTarget"   Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="1"  TABLE="Procedures" DropDownHeight="auto" FIELD="ProcSide" ID="ProcSide_1" LookupCode="OpSide"   Runat="server" /> 
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="1"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_1" Runat="server" /> </td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="90" Width="90" LookupCode="OpApproach,Disease,Gynecology" TABLE="Procedures" FIELD="ProcApproach" id="ProcApproach_1" RecordId="1" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="200" Width="90" LookupCode="Indication" TABLE="Procedures" FIELD="ProcIndication" id="ProcIndication_1" RecordId="1" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox LookupCode="Physician" id="ProcSurgeon_1" Width="90"  Table="Procedures" RecordId="1" Field="ProcSurgeon" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="ProcInstitution" RecordId="1" Table="Procedures" Runat="server" id="ProcInstitution_1"  /></td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
         </tr>
                     
         <tr >
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="2"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_2" Runat="server" ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="2"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_2"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownHeight="auto" Width="150px" DropDownWidth="300" RecordId="2"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_2"     LookupCode="ProcName,Disease,GTD" Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="2"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_2" LookupCode="DxTarget"   Runat="server"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="2"  TABLE="Procedures" DropDownHeight="auto" FIELD="ProcSide" ID="ProcSide_2" LookupCode="OpSide"   Runat="server"  />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="2"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_2" Runat="server" /> </td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="90" Width="90" LookupCode="OpApproach,Disease,Gynecology" TABLE="Procedures" FIELD="ProcApproach" id="ProcApproach_2" RecordId="2" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="200" Width="90" LookupCode="Indication" TABLE="Procedures" FIELD="ProcIndication" id="ProcIndication_2" RecordId="2" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox LookupCode="Physician" id="ProcSurgeon_2" Width="90"  Table="Procedures" RecordId="2" Field="ProcSurgeon" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="ProcInstitution" RecordId="2" Table="Procedures" Runat="server" id="ProcInstitution_2"  /></td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
       <tr >
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="3"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_3" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="3"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_3"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownHeight="auto" Width="150px" DropDownWidth="300" RecordId="3"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_3"     LookupCode="ProcName,Disease,GTD" Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="3"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_3" LookupCode="DxTarget"   Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="3"  TABLE="Procedures" DropDownHeight="auto" FIELD="ProcSide" ID="ProcSide_3" LookupCode="OpSide"   Runat="server" /> 
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="3"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_3"     Runat="server" /> </td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="90" Width="90" LookupCode="OpApproach,Disease,Gynecology" TABLE="Procedures" FIELD="ProcApproach" id="ProcApproach_3" RecordId="3" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="200" Width="90" LookupCode="Indication" TABLE="Procedures" FIELD="ProcIndication" id="ProcIndication_3" RecordId="3" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox LookupCode="Physician" id="ProcSurgeon_3" Width="90"  Table="Procedures" RecordId="3" Field="ProcSurgeon" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="ProcInstitution" RecordId="3" Table="Procedures" Runat="server" id="ProcInstitution_3"  /></td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
          <tr >
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="4"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_4" Runat="server"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="4"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_4"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownHeight="auto" Width="150px" DropDownWidth="300" RecordId="4"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_4"     LookupCode="ProcName,Disease,GTD" Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="4"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_4" LookupCode="DxTarget"   Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="4"  TABLE="Procedures" DropDownHeight="auto" FIELD="ProcSide" ID="ProcSide_4" LookupCode="OpSide"   Runat="server"  />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="4"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_4"     Runat="server" /> </td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="90" Width="90" LookupCode="OpApproach,Disease,Gynecology" TABLE="Procedures" FIELD="ProcApproach" id="ProcApproach_4" RecordId="4" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="200" Width="90" LookupCode="Indication" TABLE="Procedures" FIELD="ProcIndication" id="ProcIndication_4" RecordId="4" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox LookupCode="Physician" id="ProcSurgeon_4" Width="90"  Table="Procedures" RecordId="4" Field="ProcSurgeon" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="ProcInstitution" RecordId="4" Table="Procedures" Runat="server" id="ProcInstitution_4"  /></td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="5"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_5" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="5"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_5"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownHeight="auto" Width="150px" DropDownWidth="300" RecordId="5"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_5"     LookupCode="ProcName,Disease,GTD" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="5"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_5" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="5"  TABLE="Procedures" DropDownHeight="auto" FIELD="ProcSide" ID="ProcSide_5" LookupCode="OpSide"   Runat="server"   />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="5"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_5"     Runat="server"   /> </td>
             <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="90" Width="90" LookupCode="OpApproach,Disease,Gynecology" TABLE="Procedures" FIELD="ProcApproach" id="ProcApproach_5" RecordId="5" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="200" Width="90" LookupCode="Indication" TABLE="Procedures" FIELD="ProcIndication" id="ProcIndication_5" RecordId="5" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox LookupCode="Physician" id="ProcSurgeon_5" Width="90"  Table="Procedures" RecordId="5" Field="ProcSurgeon" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="ProcInstitution" RecordId="5" Table="Procedures" Runat="server" id="ProcInstitution_5"  /></td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="6"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_6" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="6"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_6"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownHeight="auto" Width="150px" DropDownWidth="300" RecordId="6"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_6"     LookupCode="ProcName,Disease,GTD" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="6"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_6" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="6"  TABLE="Procedures" DropDownHeight="auto" FIELD="ProcSide" ID="ProcSide_6" LookupCode="OpSide"   Runat="server"   />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="6"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_6"     Runat="server"   /> </td>
             <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="90" Width="90" LookupCode="OpApproach,Disease,Gynecology" TABLE="Procedures" FIELD="ProcApproach" id="ProcApproach_6" RecordId="6" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="200" Width="90" LookupCode="Indication" TABLE="Procedures" FIELD="ProcIndication" id="ProcIndication_6" RecordId="6" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox LookupCode="Physician" id="ProcSurgeon_6" Width="90"  Table="Procedures" RecordId="6" Field="ProcSurgeon" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="ProcInstitution" RecordId="6" Table="Procedures" Runat="server" id="ProcInstitution_6"  /></td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="7"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_7" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="7"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_7"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownHeight="auto" Width="150px" DropDownWidth="300" RecordId="7"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_7"     LookupCode="ProcName,Disease,GTD" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="7"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_7" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="7"  TABLE="Procedures" DropDownHeight="auto" FIELD="ProcSide" ID="ProcSide_7" LookupCode="OpSide"   Runat="server"   />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="7"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_7"     Runat="server"   /> </td>
             <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="90" Width="90" LookupCode="OpApproach,Disease,Gynecology" TABLE="Procedures" FIELD="ProcApproach" id="ProcApproach_7" RecordId="7" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="200" Width="90" LookupCode="Indication" TABLE="Procedures" FIELD="ProcIndication" id="ProcIndication_7" RecordId="7" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox LookupCode="Physician" id="ProcSurgeon_7" Width="90"  Table="Procedures" RecordId="7" Field="ProcSurgeon" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="ProcInstitution" RecordId="7" Table="Procedures" Runat="server" id="ProcInstitution_7"  /></td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="8"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_8" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="8"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_8"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownHeight="auto" Width="150px" DropDownWidth="300" RecordId="8"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_8"     LookupCode="ProcName,Disease,GTD" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="8"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_8" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="8"  TABLE="Procedures" DropDownHeight="auto" FIELD="ProcSide" ID="ProcSide_8" LookupCode="OpSide"   Runat="server"   />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="8"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_8"     Runat="server"   /> </td>
             <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="90" Width="90" LookupCode="OpApproach,Disease,Gynecology" TABLE="Procedures" FIELD="ProcApproach" id="ProcApproach_8" RecordId="8" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="200" Width="90" LookupCode="Indication" TABLE="Procedures" FIELD="ProcIndication" id="ProcIndication_8" RecordId="8" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox LookupCode="Physician" id="ProcSurgeon_8" Width="90"  Table="Procedures" RecordId="8" Field="ProcSurgeon" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="ProcInstitution" RecordId="8" Table="Procedures" Runat="server" id="ProcInstitution_8"  /></td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
          </tr>
           <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="9"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_9" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="9"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_9"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownHeight="auto" Width="150px" DropDownWidth="300" RecordId="9"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_9"     LookupCode="ProcName,Disease,GTD" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="9"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_9" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="9"  TABLE="Procedures" DropDownHeight="auto" FIELD="ProcSide" ID="ProcSide_9" LookupCode="OpSide"   Runat="server"   /> 
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="9"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_9"     Runat="server"   /> </td>
             <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="90" Width="90" LookupCode="OpApproach,Disease,Gynecology" TABLE="Procedures" FIELD="ProcApproach" id="ProcApproach_9" RecordId="9" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="200" Width="90" LookupCode="Indication" TABLE="Procedures" FIELD="ProcIndication" id="ProcIndication_9" RecordId="9" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox LookupCode="Physician" id="ProcSurgeon_9" Width="90"  Table="Procedures" RecordId="9" Field="ProcSurgeon" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="ProcInstitution" RecordId="9" Table="Procedures" Runat="server" id="ProcInstitution_9"  /></td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="10"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_10" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="10"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_10"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownHeight="auto" Width="150px" DropDownWidth="300" RecordId="10"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_10"     LookupCode="ProcName,Disease,GTD" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="10"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_10" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="300" Width="80px" RecordId="10"  TABLE="Procedures" DropDownHeight="auto" FIELD="ProcSide" ID="ProcSide_10" LookupCode="OpSide"   Runat="server"   />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="10"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_10"     Runat="server"   /> </td>
             <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="90" Width="90" LookupCode="OpApproach,Disease,Gynecology" TABLE="Procedures" FIELD="ProcApproach" id="ProcApproach_10" RecordId="10" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox DropDownHeight="auto" DropDownWidth="200" Width="90" LookupCode="Indication" TABLE="Procedures" FIELD="ProcIndication" id="ProcIndication_10" RecordId="10" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EformComboBox LookupCode="Physician" id="ProcSurgeon_10" Width="90"  Table="Procedures" RecordId="10" Field="ProcSurgeon" runat="server"/></td>
            <td style="white-space: nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="ProcInstitution" RecordId="10" Table="Procedures" Runat="server" id="ProcInstitution_10"  /></td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
          </tr>
</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PreviousProceduresBreastHtmlTable');" />

<br /><br /><br />


<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(procDateTextID,procNameID,procSiteID,procSideID,procDataQualityID)
    { 
        $(procDateTextID).addEvent('blur',curry(SetHiddenFields,procDateTextID,procNameID,procSiteID,procSideID,procDataQualityID));
        $(procNameID).addEvent('blur',curry(SetHiddenFields,procDateTextID,procNameID,procSiteID,procSideID,procDataQualityID));
        $(procSiteID).addEvent('blur',curry(SetHiddenFields,procDateTextID,procNameID,procSiteID,procSideID,procDataQualityID));
        $(procSideID).addEvent('blur',curry(SetHiddenFields,procDateTextID,procNameID,procSiteID,procSideID,procDataQualityID));
   }

    addEvents($('<%= ProcDateText_1.ClientID %>'),$('<%= ProcName_1.ClientID %>'),$('<%= ProcSite_1.ClientID %>'),$('<%= ProcSide_1.ClientID %>'),$('<%= ProcQuality_1.ClientID %>'));
    addEvents($('<%= ProcDateText_2.ClientID %>'),$('<%= ProcName_2.ClientID %>'),$('<%= ProcSite_2.ClientID %>'),$('<%= ProcSide_2.ClientID %>'),$('<%= ProcQuality_2.ClientID %>'));
    addEvents($('<%= ProcDateText_3.ClientID %>'),$('<%= ProcName_3.ClientID %>'),$('<%= ProcSite_3.ClientID %>'),$('<%= ProcSide_3.ClientID %>'),$('<%= ProcQuality_3.ClientID %>'));
    addEvents($('<%= ProcDateText_4.ClientID %>'),$('<%= ProcName_4.ClientID %>'),$('<%= ProcSite_4.ClientID %>'),$('<%= ProcSide_4.ClientID %>'),$('<%= ProcQuality_4.ClientID %>'));
    addEvents($('<%= ProcDateText_5.ClientID %>'),$('<%= ProcName_5.ClientID %>'),$('<%= ProcSite_5.ClientID %>'),$('<%= ProcSide_5.ClientID %>'),$('<%= ProcQuality_5.ClientID %>'));
    addEvents($('<%= ProcDateText_6.ClientID %>'),$('<%= ProcName_6.ClientID %>'),$('<%= ProcSite_6.ClientID %>'),$('<%= ProcSide_6.ClientID %>'),$('<%= ProcQuality_6.ClientID %>'));
    addEvents($('<%= ProcDateText_7.ClientID %>'),$('<%= ProcName_7.ClientID %>'),$('<%= ProcSite_7.ClientID %>'),$('<%= ProcSide_7.ClientID %>'),$('<%= ProcQuality_7.ClientID %>'));
    addEvents($('<%= ProcDateText_8.ClientID %>'),$('<%= ProcName_8.ClientID %>'),$('<%= ProcSite_8.ClientID %>'),$('<%= ProcSide_8.ClientID %>'),$('<%= ProcQuality_8.ClientID %>'));
    addEvents($('<%= ProcDateText_9.ClientID %>'),$('<%= ProcName_9.ClientID %>'),$('<%= ProcSite_9.ClientID %>'),$('<%= ProcSide_9.ClientID %>'),$('<%= ProcQuality_9.ClientID %>'));
    addEvents($('<%= ProcDateText_10.ClientID %>'),$('<%= ProcName_10.ClientID %>'),$('<%= ProcSite_10.ClientID %>'),$('<%= ProcSide_10.ClientID %>'),$('<%= ProcQuality_10.ClientID %>'));
 
    /* ]]> */
    
function SetHiddenFields(procDateTextID,procNameID,procSiteID,procSideID,procDataQualityID)
{
    if (procDateTextID.value != '' || procNameID.value != '' || procSiteID.value != '' || procSideID.value != '')
    {
        procDataQualityID.value = 'STD';
    }
    else
    {
        procDataQualityID.value = '';    
    }
}
</script>