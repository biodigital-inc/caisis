<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.ProceduresBiopsyBreast" CodeFile="ProceduresBiopsyBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
 
 <script language="javascript" type="text/javascript">
 
 var breastPerformed = '<% =BxDone.Value %>'; 
 var axillaPerformed = '<% =AxillaBxDone.Value %>'; 
  
    function showHideBreastBx(breastBxPerformed_value,breastBxAEDtTxtId, breastBxAEDtTxtIdVal, breastBxAEDtId, breastBxAEDtIdVal, breastBxAETableId, breastBxAETableIdVal, breastBxAEFieldId, breastBxAEFieldIdVal, breastBxAEFieldValueId, breastBxAEFieldValueIdVal, breastBxAEReasonId, breastBxAEReasonIdVal, breastBxAEQltyId, breastBxAEQltyIdVal)
    {
		breastPerformed = breastBxPerformed_value;
	
	
      var BreastBxDetailsRow = $('BreastBxDetails');
      var BreastTableRow = $('BreastBxRow1');
      if (breastBxPerformed_value == "Yes")
      {
        BreastBxDetailsRow.style.display='block';
        BreastTableRow.style.display='block';
		
	
        //clears absent row data
        clearElementsInParentRow(document.getElementById('<% =AbsentDateText_6.ClientID %>'));      
      } 
      else if (breastBxPerformed_value == "No")
      { 
	  
	  	clearElementsInParentRow(document.getElementById('<% =ProcDateText_11.ClientID %>'));
		       
        if (axillaPerformed != "Yes") BreastBxDetailsRow.style.display='none';  
        BreastTableRow.style.display='none';

        //clears breastBx rows data
        
                
        
        document.getElementById(breastBxAEDtTxtId).value = breastBxAEDtTxtIdVal;
        document.getElementById(breastBxAEDtId).value = breastBxAEDtIdVal;
        document.getElementById(breastBxAETableId).value = breastBxAETableIdVal;        
        document.getElementById(breastBxAEFieldId).value = breastBxAEFieldIdVal;
        document.getElementById(breastBxAEFieldValueId).value = breastBxAEFieldValueIdVal;
        document.getElementById(breastBxAEReasonId).value = breastBxAEReasonIdVal;
        document.getElementById(breastBxAEQltyId).value = breastBxAEQltyIdVal;
      }
    }
	
	function showHideAxillaBx(axillaBxPerformed_value,axillaBxAEDtTxtId, axillaBxAEDtTxtIdVal, axillaBxAEDtId, axillaBxAEDtIdVal, axillaBxAETableId, axillaBxAETableIdVal, axillaBxAEFieldId, axillaBxAEFieldIdVal, axillaBxAEFieldValueId, axillaBxAEFieldValueIdVal, axillaBxAEReasonId, axillaBxAEReasonIdVal, axillaBxAEQltyId, axillaBxAEQltyIdVal)
    {
		axillaPerformed = axillaBxPerformed_value;
		
		
      var BreastBxDetailsRow = $('BreastBxDetails');
      var AxillaTableRow = $('BreastBxRow2');
      if (axillaBxPerformed_value == "Yes")
      {
        BreastBxDetailsRow.style.display='block';
        AxillaTableRow.style.display='block';
		
		
        //clears absent row data
        clearElementsInParentRow(document.getElementById('<% =AbsentDateText_10.ClientID %>'));      
      } 
      else if (axillaBxPerformed_value == "No")
      {        
	  
	  	//clears breastBx rows data
       clearElementsInParentRow(document.getElementById('<% =ProcDateText_12.ClientID %>'));
	  
        if (breastPerformed != "Yes") BreastBxDetailsRow.style.display='none';  
        AxillaTableRow.style.display='none';
		
		
        
                
        
        document.getElementById(axillaBxAEDtTxtId).value = axillaBxAEDtTxtIdVal;
        document.getElementById(axillaBxAEDtId).value = axillaBxAEDtIdVal;
        document.getElementById(axillaBxAETableId).value = axillaBxAETableIdVal;        
        document.getElementById(axillaBxAEFieldId).value = axillaBxAEFieldIdVal;
        document.getElementById(axillaBxAEFieldValueId).value = axillaBxAEFieldValueIdVal;
        document.getElementById(axillaBxAEReasonId).value = axillaBxAEReasonIdVal;
        document.getElementById(axillaBxAEQltyId).value = axillaBxAEQltyIdVal;
      }
    }
	
	
	function setDefaultProcValues(BxPerformed_value,procNameControl,procName,procSiteControl,procSite,procDataQualityControl)
	{
		if (BxPerformed_value == "Yes")
		{
			if (procNameControl.value == '' && procSiteControl.value == '')  // don't overwrite altered values if user returns to screen
			{
				procNameControl.value = procName;
				procSiteControl.value = procSite;
			}
			procDataQualityControl.value = 'STD';
		}
	}
	
	
 </script>

<a name="ProceduresBiopsyBreast" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Previous Breast Procedures"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="620" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap; width: 200px; padding: 16px 0px 0px 16px;"><strong>Breast Biopsy Performed ?</strong></td>
	<td style="text-align:left; width: 420px; padding: 16px 16px 0px 0px;"><euc:EformRadioButtonList Table="NoTable" Field="BxDone" id="BxDone" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
  <tr >
	<td style="white-space:nowrap; padding: 7px 0px 16px 16px;"><strong>Axilla Biopsy Performed ?</strong></td>
	<td style="text-align:left; padding: 7px 16px 16px 0px;"><euc:EformRadioButtonList Table="NoTable" Field="AxillaBxDone" id="AxillaBxDone" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="BreastBxDetails" style="display: none;">
     <td style="padding: 0px 0px 16px 16px;" colspan="2">
        <table  width="500" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="PreviousProceduresBreastHtmlTable" > 

          <tr>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >Date</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Procedure</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Site</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Side</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >Indication</td>
                <td class="controlBoxDataGridTitleColumn" style="height: 10%;" >&nbsp;</td>
          </tr>
    <asp:Repeater ID="rptSurgicalHistory" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 
	<ItemTemplate> 
	    
       <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'ProcDateText,ProcName,ProcSite,ProcSide,ProcIndication,ProcQuality', 'Procedures');"> 
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcDateText")%>&nbsp;</td>
             <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcName")%>&nbsp;</td>
             <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcSite")%>&nbsp;</td>
            <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcSide")%>&nbsp;</td>
           <td  class="ClinicalEformPopulatedColumn" style="text-align: left;"><%# DataBinder.Eval(Container.DataItem, "ProcIndication")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked." />&nbsp;</td>
        </tr>      

   
	</ItemTemplate>
  </asp:Repeater>          

           <tr id="BreastBxRow1"  style="display: none;">
            <td style="white-space: nowrap;" id="BreastBxRow1Td1">
                <euc:EformTextBox  Width="80px" RecordId="11"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_11" Runat="server" ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="11"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_11"     Runat="server"/></td>
            <td style="white-space: nowrap; font-weight: 700;">
                 <euc:EformComboBox RecordId="11"  style="width: 100px;" DropDownHeight="auto" DropDownWidth="200" LookupCode="ProcName,Disease,Breast" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_11"     Runat="server"    />
               <%-- <euc:EformTextBox RecordId="11"  style="width: 130px; display: none;" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_11"     Runat="server"    />Breast Biopsy --%>
			</td>
            <td style="white-space: nowrap;  ">
				<%-- <euc:EformTextBox Width="1px" style="display: none;" RecordId="11"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_11"    Runat="server"   />Breast --%>
				<euc:EformTextBox style="width: 80px;" RecordId="11"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_11"    Runat="server"   />
				</td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="11" DropDownHeight="auto"  TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_11" LookupCode="OpSide"   Runat="server" /> 
                </td>
              <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="11"  TABLE="Procedures" FIELD="ProcIndication" ID="ProcIndication_11" LookupCode="Indication, Disease, Breast"    Runat="server"   />   
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="11"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_11"    Runat="server"   /> </td>
           <td style="white-space: nowrap;"><euc:EformDeleteIcon runat="server"/></td>
         </tr>
                     
           <tr id="BreastBxRow2"  style="display: none;">
            <td style="white-space: nowrap;"  id="BreastBxRow2Td1">
                <euc:EformTextBox  Width="80px" RecordId="12"   TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_12" Runat="server"   ShowCalendar="true" CalcDate="true"  />
				<euc:EformHidden                RecordId="12"   TABLE="Procedures" FIELD="ProcDate"     ID="ProcDate_12"     Runat="server"/></td>
            <td style="white-space: nowrap; font-weight: 700;">
                <euc:EformComboBox RecordId="12"  style="width: 100px;" DropDownHeight="auto" DropDownWidth="200" LookupCode="ProcName,Disease,Breast" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_12"     Runat="server"    /> 
                <%-- <euc:EformTextBox RecordId="12"  style="width: 130px; display: none;" TABLE="Procedures" FIELD="ProcName"     ID="ProcName_12"     Runat="server"    />
				Axilla Biopsy--%>
            </td>
            <td style="white-space: nowrap; text-align: center;">
				<%-- <euc:EformTextBox Width="1px" style="display: none;" RecordId="12"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_12"    Runat="server"   />Axilla --%>
				<euc:EformTextBox style="width: 80px;" RecordId="12"  TABLE="Procedures" FIELD="ProcSite" ID="ProcSite_12"    Runat="server"   />
				</td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="12"  DropDownHeight="auto" TABLE="Procedures" FIELD="ProcSide" ID="ProcSide_12" LookupCode="OpSide"   Runat="server"   /> </td>
              <td style="white-space: nowrap;">
              <euc:EformComboBox DropDownWidth="auto" Width="80px" RecordId="12"  TABLE="Procedures" FIELD="ProcIndication" ID="ProcIndication_12" LookupCode="Indication, Disease, Breast"    Runat="server"  />  
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="12"  TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_12"    Runat="server"   /> </td>
           <td style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
         </tr>

        
</table>
     </td>
 </tr>
 </table>
 <table>
    <tr id="BreastBxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_6"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="6" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_6"
                Runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="TableName" ID="TableName_6"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="FieldName" ID="FieldName_6"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_6"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_6"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_6"
                runat="server"  style="width:1px;display:none;"/>
        </td>
    </tr>
	<tr id="AxillaBxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_10"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="10" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_10"
                Runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="TableName" ID="TableName_10"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="FieldName" ID="FieldName_10"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_10"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_10"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_10"
                runat="server"  style="width:1px;display:none;"/>
        </td>
    </tr>
</table><br />


<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents1(procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID)
    { 
        $(procDateTextID).addEvent('blur',curry(SetHiddenFields1,procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID));
        $(procSideID).addEvent('blur',curry(SetHiddenFields1,procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID));
        $(procIndicationID).addEvent('blur',curry(SetHiddenFields1,procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID));
        $(procNameID).addEvent('blur',curry(SetHiddenFields1,procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID));
        $(procSiteID).addEvent('blur',curry(SetHiddenFields1,procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID));
   }

    addEvents1($('<%= ProcDateText_11.ClientID %>'),$('<%= ProcName_11.ClientID %>'),$('<%= ProcSite_11.ClientID %>'),$('<%= ProcSide_11.ClientID %>'),$('<%= ProcIndication_11.ClientID %>'),$('<%= ProcQuality_11.ClientID %>'));
 
    /* ]]> */
    
    function SetHiddenFields1(procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID)
    {
        if (procDateTextID.value != '' || procSideID.value != '' || procIndicationID.value != '' || procNameID.value != '' || procSiteID.value != '' )
        {
           	if (procNameID.value == '' && procSiteID.value == '')
			{
				procNameID.value = 'Breast Biopsy';
				procSiteID.value = 'Breast';
			}
            procDataQualityID.value = 'STD';
        }
        else
        {
            procDataQualityID.value = '';
        }
    }


    //Adds events to controls
    function addEvents2(procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID)
    { 
        $(procDateTextID).addEvent('blur',curry(SetHiddenFields2,procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID));
        $(procSideID).addEvent('blur',curry(SetHiddenFields2,procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID));
        $(procNameID).addEvent('blur',curry(SetHiddenFields2,procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID));
        $(procSiteID).addEvent('blur',curry(SetHiddenFields2,procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID));
        $(procIndicationID).addEvent('blur',curry(SetHiddenFields2,procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID));
   }

    addEvents2($('<%= ProcDateText_12.ClientID %>'),$('<%= ProcName_12.ClientID %>'),$('<%= ProcSite_12.ClientID %>'),$('<%= ProcSide_12.ClientID %>'),$('<%= ProcIndication_12.ClientID %>'),$('<%= ProcQuality_12.ClientID %>'));

    function SetHiddenFields2(procDateTextID,procNameID,procSiteID,procSideID,procIndicationID,procDataQualityID)
    {
        if (procDateTextID.value != '' || procSideID.value != '' || procIndicationID.value != '' || procNameID.value != '' || procSiteID.value != '' )
        {
           	if (procNameID.value == '' && procSiteID.value == '')
			{
				procNameID.value = 'Axilla Biopsy';
				procSiteID.value = 'Axilla';
			}
            procDataQualityID.value = 'STD';
        }
        else
        {
            procDataQualityID.value = '';
        }
    }
</script>