<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.PreviousProceduresBreast" CodeFile="PreviousProceduresBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.PreviousProceduresBreastHtmlTable = "PreviousProceduresBreastHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="PreviousProceduresBreast" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Previous Breast Procedures"></asp:Label><br/>
<table  width="550" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="PreviousProceduresBreastHtmlTable" > 

          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >Date</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Surgery</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Site</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Side</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
    <asp:Repeater ID="rptSurgicalHistory" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 
	<ItemTemplate> 
	    
       <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcDateText,ProcName,ProcSite,ProcSide,ProcQuality', 'Procedures');"> 
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcDateText")%>&nbsp;</td>
             <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcName")%>&nbsp;</td>
           <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcSite")%>&nbsp;</td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcSide")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
        </tr>      

   
	</ItemTemplate>
  </asp:Repeater>          

           <tr>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="1"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_1" Runat="server" ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="1"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_1"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="150px" RecordId="1"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_1"     LookupCode="ProcName" Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="1"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_1" LookupCode="DxTarget"   Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="1"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_1" LookupCode="OpSide"   Runat="server" /> 
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="1"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_1" Runat="server" /> </td>
           <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
         </tr>
                     
         <tr >
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="2"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_2" Runat="server" ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="2"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_2"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="150px" RecordId="2"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_2"     LookupCode="ProcName" Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="2"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_2" LookupCode="DxTarget"   Runat="server"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="2"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_2" LookupCode="OpSide"   Runat="server"  />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="2"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_2" Runat="server" /> </td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
       <tr >
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="3"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_3" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="3"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_3"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="150px" RecordId="3"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_3"     LookupCode="ProcName" Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="3"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_3" LookupCode="DxTarget"   Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="3"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_3" LookupCode="OpSide"   Runat="server" /> 
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="3"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_3"     Runat="server" /> </td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
          <tr >
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="4"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_4" Runat="server"  ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="4"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_4"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="150px" RecordId="4"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_4"     LookupCode="ProcName" Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="4"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_4" LookupCode="DxTarget"   Runat="server" /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="4"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_4" LookupCode="OpSide"   Runat="server"  />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="4"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_4"     Runat="server" /> </td>
            <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="5"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_5" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="5"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_5"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="150px" RecordId="5"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_5"     LookupCode="ProcName" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="5"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_5" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="5"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_5" LookupCode="OpSide"   Runat="server"   />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="5"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_5"     Runat="server"   /> </td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="6"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_6" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="6"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_6"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="150px" RecordId="6"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_6"     LookupCode="ProcName" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="6"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_6" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="6"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_6" LookupCode="OpSide"   Runat="server"   />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="6"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_6"     Runat="server"   /> </td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="7"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_7" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="7"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_7"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="150px" RecordId="7"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_7"     LookupCode="ProcName" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="7"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_7" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="7"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_7" LookupCode="OpSide"   Runat="server"   />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="7"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_7"     Runat="server"   /> </td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="8"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_8" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="8"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_8"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="150px" RecordId="8"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_8"     LookupCode="ProcName" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="8"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_8" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="8"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_8" LookupCode="OpSide"   Runat="server"   />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="8"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_8"     Runat="server"   /> </td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
          </tr>
           <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="9"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_9" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="9"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_9"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="150px" RecordId="9"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_9"     LookupCode="ProcName" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="9"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_9" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="9"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_9" LookupCode="OpSide"   Runat="server"   /> 
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="9"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_9"     Runat="server"   /> </td>
             <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
          </tr>
          <tr style="display: none;">
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="80px" RecordId="10"  TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_10" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="10"  TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_10"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="150px" RecordId="10"  TABLE="Procedures" FIELD="ProcName"     ID="ProcName_10"     LookupCode="ProcName" Runat="server"    /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="10"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_10" LookupCode="DxTarget"   Runat="server"   /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="10"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_10" LookupCode="OpSide"   Runat="server"   />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="10"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_10"     Runat="server"   /> </td>
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