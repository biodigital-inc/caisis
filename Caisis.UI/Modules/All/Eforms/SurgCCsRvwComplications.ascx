<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.SurgCCsRvwComplications" CodeFile="SurgCCsRvwComplications.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.SurgCCRvwHtmlTable = "SurgCCRvwHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="SurgCCsRvwComplications" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle">Complications Clavien-Dindo Scale ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="SurgCCRvwCompRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="SurgCCRvwCompRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="SurgCCRvwCompAbsentDiv" runat="server" style="display: none;" >
<br /><br /> 
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_7"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="7" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_7"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table>

</div>
                 
<div id="SurgCCRvwCompDiv" runat="server" style="display: none;">
<br /><br /> 
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SurgCCRvwHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Category</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Grade</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Complication</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <tr >
    <td align="left" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="11"  ID="ToxDateText_11" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden RecordId="11" Runat="server" ID="ToxDate_11" Table="Toxicities" Field="ToxDate" />    
         
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="11"  ID="ToxScale_11" TABLE="Toxicities" FIELD="ToxScale"   /></td> 
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="11" Table="Toxicities" Field="ToxCategory"  Runat="server" id="ToxCategory_11" LookupCode="ToxCategory,ComplicationsScale,Clavien-Dindo"   /></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="60px" RecordId="11" Table="Toxicities" Field="ToxGrade"  Runat="server" id="ToxGrade_11" LookupCode="ToxGrade,ComplicationsScale,Clavien-Dindo" /></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="300px" MaxLength="100" Width="150px"  RecordId="11" Table="Toxicities" Field="ToxName"  Runat="server" id="ToxName_11"  LookupCode="ToxName_Complication,ComplicationsScale,Clavien-Dindo"/></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformTextBox Width="150px"  RecordId="11" Table="Toxicities" Field="ToxNotes"  Runat="server" id="ToxNotes_11" ShowTextEditor="true"  /></td>
    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_11" runat="server"/></td>
  </tr>
  <tr style="display: none;" >
    <td align="left" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="12"  ID="ToxDateText_12" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden RecordId="12" Runat="server" ID="ToxDate_12" Table="Toxicities" Field="ToxDate" />    
         
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="12"  ID="ToxScale_12" TABLE="Toxicities" FIELD="ToxScale "   /></td> 
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="12" Table="Toxicities" Field="ToxCategory"  Runat="server" id="ToxCategory_12" LookupCode="ToxCategory,ComplicationsScale,Clavien-Dindo" /></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="60px" RecordId="12" Table="Toxicities" Field="ToxGrade"  Runat="server" id="ToxGrade_12" LookupCode="ToxGrade,ComplicationsScale,Clavien-Dindo" /></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="300px" MaxLength="100" Width="150px"  RecordId="12" Table="Toxicities" Field="ToxName"  Runat="server" id="ToxName_12"  LookupCode="ToxName_Complication,ComplicationsScale,Clavien-Dindo"/></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformTextBox Width="150px"  RecordId="12" Table="Toxicities" Field="ToxNotes"  Runat="server" id="ToxNotes_12" ShowTextEditor="true"  /></td>
    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_12" runat="server"/></td>
  </tr>
  <tr >
    <td align="left" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="13"  ID="ToxDateText_13" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden RecordId="13" Runat="server" ID="ToxDate_13" Table="Toxicities" Field="ToxDate" />    
         
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="13"  ID="ToxScale_13" TABLE="Toxicities" FIELD="ToxScale "   /></td> 
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="13" Table="Toxicities" Field="ToxCategory"  Runat="server" id="ToxCategory_13" LookupCode="ToxCategory,ComplicationsScale,Clavien-Dindo" /></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="60px" RecordId="13" Table="Toxicities" Field="ToxGrade"  Runat="server" id="ToxGrade_13" LookupCode="ToxGrade,ComplicationsScale,Clavien-Dindo" /></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="300px" MaxLength="100" Width="150px"  RecordId="13" Table="Toxicities" Field="ToxName"  Runat="server" id="ToxName_13"  LookupCode="ToxName_Complication,ComplicationsScale,Clavien-Dindo"/></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformTextBox Width="150px"  RecordId="13" Table="Toxicities" Field="ToxNotes"  Runat="server" id="ToxNotes_13" ShowTextEditor="true"  /></td>
    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_13" runat="server"/></td>
  </tr>
  <tr style="display: none;" >
    <td align="left" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="14"  ID="ToxDateText_14" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden RecordId="14" Runat="server" ID="ToxDate_14" Table="Toxicities" Field="ToxDate" />    
         
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="14"  ID="ToxScale_14" TABLE="Toxicities" FIELD="ToxScale "   /></td> 
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="14" Table="Toxicities" Field="ToxCategory"  Runat="server" id="ToxCategory_14" LookupCode="ToxCategory,ComplicationsScale,Clavien-Dindo" /></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="60px" RecordId="14" Table="Toxicities" Field="ToxGrade"  Runat="server" id="ToxGrade_14" LookupCode="ToxGrade,ComplicationsScale,Clavien-Dindo" /></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="300px" MaxLength="100" Width="150px"  RecordId="14" Table="Toxicities" Field="ToxName"  Runat="server" id="ToxName_14" LookupCode="ToxName_Complication,ComplicationsScale,Clavien-Dindo" /></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformTextBox Width="150px"  RecordId="14" Table="Toxicities" Field="ToxNotes"  Runat="server" id="ToxNotes_14" ShowTextEditor="true"  /></td>
    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_14" runat="server"/></td>
  </tr>
  <tr style="display: none;" >
    <td align="left" class="ClinicalEformGridColumnOne">
        <euc:EformTextBox Runat="server" RecordId="15"  ID="ToxDateText_15" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden RecordId="15" Runat="server" ID="ToxDate_15" Table="Toxicities" Field="ToxDate" />    
         
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="15"  ID="ToxScale_15" TABLE="Toxicities" FIELD="ToxScale "   /></td> 
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="15" Table="Toxicities" Field="ToxCategory"  Runat="server" id="ToxCategory_15" LookupCode="ToxCategory,ComplicationsScale,Clavien-Dindo" /></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="auto" Width="60px" RecordId="15" Table="Toxicities" Field="ToxGrade"  Runat="server" id="ToxGrade_15" LookupCode="ToxGrade,ComplicationsScale,Clavien-Dindo" /></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformComboBox DropDownWidth="300px" MaxLength="100" Width="150px"  RecordId="15" Table="Toxicities" Field="ToxName"  Runat="server" id="ToxName_15"  LookupCode="ToxName_Complication,ComplicationsScale,Clavien-Dindo"/></td>
    <td align="center" style="white-space:nowrap;">
        <euc:EformTextBox Width="150px"  RecordId="15" Table="Toxicities" Field="ToxNotes"  Runat="server" id="ToxNotes_15" ShowTextEditor="true"  /></td>
    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_15" runat="server"/></td>
  </tr>  
</table>

<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'SurgCCRvwHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>

</div>
<br/><br/><br/>
<table>
    <tr id="SurgCCRvwCompAbsentRow">
        <td>
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="TableName" ID="TableName_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="FieldName" ID="FieldName_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_7"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="7" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_7"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>


<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= SurgCCRvwCompRecorded.ClientID %>'),$('<%= SurgCCRvwCompDiv.ClientID %>'),$('<%= SurgCCRvwCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_11.ClientID %>'),$('<%= ToxDate_11.ClientID %>'),$('<%= ToxName_11.ClientID %>'),$('<%= ToxScale_11.ClientID %>'),$('<%= ToxCategory_11.ClientID %>'),$('<%= ToxGrade_11.ClientID %>'),$('<%= ToxNotes_11.ClientID %>'));
    addAbsentEvent($('<%= SurgCCRvwCompRecorded.ClientID %>'),$('<%= SurgCCRvwCompDiv.ClientID %>'),$('<%= SurgCCRvwCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_12.ClientID %>'),$('<%= ToxDate_12.ClientID %>'),$('<%= ToxName_12.ClientID %>'),$('<%= ToxScale_12.ClientID %>'),$('<%= ToxCategory_12.ClientID %>'),$('<%= ToxGrade_12.ClientID %>'),$('<%= ToxNotes_12.ClientID %>'));
    addAbsentEvent($('<%= SurgCCRvwCompRecorded.ClientID %>'),$('<%= SurgCCRvwCompDiv.ClientID %>'),$('<%= SurgCCRvwCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_13.ClientID %>'),$('<%= ToxDate_13.ClientID %>'),$('<%= ToxName_13.ClientID %>'),$('<%= ToxScale_13.ClientID %>'),$('<%= ToxCategory_13.ClientID %>'),$('<%= ToxGrade_13.ClientID %>'),$('<%= ToxNotes_13.ClientID %>'));
    addAbsentEvent($('<%= SurgCCRvwCompRecorded.ClientID %>'),$('<%= SurgCCRvwCompDiv.ClientID %>'),$('<%= SurgCCRvwCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_14.ClientID %>'),$('<%= ToxDate_14.ClientID %>'),$('<%= ToxName_14.ClientID %>'),$('<%= ToxScale_14.ClientID %>'),$('<%= ToxCategory_14.ClientID %>'),$('<%= ToxGrade_14.ClientID %>'),$('<%= ToxNotes_14.ClientID %>'));
    addAbsentEvent($('<%= SurgCCRvwCompRecorded.ClientID %>'),$('<%= SurgCCRvwCompDiv.ClientID %>'),$('<%= SurgCCRvwCompAbsentDiv.ClientID %>'),$('<%= ToxDateText_15.ClientID %>'),$('<%= ToxDate_15.ClientID %>'),$('<%= ToxName_15.ClientID %>'),$('<%= ToxScale_15.ClientID %>'),$('<%= ToxCategory_15.ClientID %>'),$('<%= ToxGrade_15.ClientID %>'),$('<%= ToxNotes_15.ClientID %>'));

    function addAbsentEvent(SurgCCRvwCompRecordedID,SurgCCRvwCompDivID,SurgCCRvwCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxScaleID,toxCategoryID,toxGradeID,toxNotesID)
    {  
        $(SurgCCRvwCompRecordedID).addEvent('click',curry(SurgCCRvwCompYesNo,SurgCCRvwCompRecordedID,SurgCCRvwCompDivID,SurgCCRvwCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxScaleID,toxCategoryID,toxGradeID,toxNotesID));
        $(toxDateTextID).addEvent('blur',curry(SurgCCRvwCompYesNo,SurgCCRvwCompRecordedID,SurgCCRvwCompDivID,SurgCCRvwCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxScaleID,toxCategoryID,toxGradeID,toxNotesID));
        $(toxNameID).addEvent('blur',curry(SurgCCRvwCompYesNo,SurgCCRvwCompRecordedID,SurgCCRvwCompDivID,SurgCCRvwCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxScaleID,toxCategoryID,toxGradeID,toxNotesID));
        $(toxCategoryID).addEvent('blur',curry(SurgCCRvwCompYesNo,SurgCCRvwCompRecordedID,SurgCCRvwCompDivID,SurgCCRvwCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxScaleID,toxCategoryID,toxGradeID,toxNotesID));
        $(toxGradeID).addEvent('blur',curry(SurgCCRvwCompYesNo,SurgCCRvwCompRecordedID,SurgCCRvwCompDivID,SurgCCRvwCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxScaleID,toxCategoryID,toxGradeID,toxNotesID));
        $(toxNotesID).addEvent('blur',curry(SurgCCRvwCompYesNo,SurgCCRvwCompRecordedID,SurgCCRvwCompDivID,SurgCCRvwCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxScaleID,toxCategoryID,toxGradeID,toxNotesID));

        // check on load as well
        SurgCCRvwCompYesNo(SurgCCRvwCompRecordedID,SurgCCRvwCompDivID,SurgCCRvwCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxScaleID,toxCategoryID,toxGradeID,toxNotesID);
    }
   
    /* ]]> */
   
    function SurgCCRvwCompYesNo(SurgCCRvwCompRecordedID,SurgCCRvwCompDivID,SurgCCRvwCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxScaleID,toxCategoryID,toxGradeID,toxNotesID)
    {
       var SurgCCRvwCompRecordedRef = SurgCCRvwCompRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < SurgCCRvwCompRecordedRef.length; i++) 
        if (SurgCCRvwCompRecordedRef[i].checked) {  
            SurgCCRvwCompRadioClick(SurgCCRvwCompRecordedRef[i].value,SurgCCRvwCompDivID,SurgCCRvwCompAbsentDivID,toxDateTextID,toxDateID,toxNameID,toxScaleID,toxCategoryID,toxGradeID,toxNotesID);
            }
    }
    
    function SurgCCRvwCompRadioClick(SurgCCRvwCompoption_value,SurgCCRvwComphideDiv,SurgCCRvwComphideAbsentDiv,toxDateTextID,toxDateID,toxNameID,toxScaleID,toxCategoryID,toxGradeID,toxNotesID)
    {
      if (SurgCCRvwCompoption_value == "Yes")
      { 
        SurgCCRvwComphideDiv.style.display='block';
        SurgCCRvwComphideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_7.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_7.ClientID %>').value='';
        document.getElementById('<%= TableName_7.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_7.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_7.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_7.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_7.ClientID %>').value = '';
        
        if (toxNameID.value != '' || toxDateTextID.value != '' || toxCategoryID.value != '' || toxGradeID.value != '' || toxNotesID.value != '')
        {
            toxScaleID.value = 'Clavien-Dindo';
        }
        
        else
        {
             toxScaleID.value = '';       
        }
        
      } 
      else if (SurgCCRvwCompoption_value == "No" || SurgCCRvwCompoption_value == "Unknown")
      {
        SurgCCRvwComphideAbsentDiv.style.display='block';
        SurgCCRvwComphideDiv.style.display='none';
      
        document.getElementById('<%= TableName_7.ClientID %>').value = 'Toxicities';        
        document.getElementById('<%= FieldName_7.ClientID %>').value = 'ToxName';        
        document.getElementById('<%= FieldValue_7.ClientID %>').value = 'Complications Clavien-Dindo Scale'; 
        
        if (SurgCCRvwCompoption_value == "No")       
            document.getElementById('<%= AbsentReason_7.ClientID %>').value = 'None Recorded';        
        if (SurgCCRvwCompoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_7.ClientID %>').value = 'Unknown';        

        document.getElementById('<%= AbsentQuality_7.ClientID %>').value = 'OUT';        

        toxDateTextID.value = '';
        toxDateID.value = '';
        toxNameID.value = '';
        toxScaleID.value = '';   
        toxCategoryID.value = '';           
        toxGradeID.value = '';  
        toxNotesID.value = '';      
      }
    }

</script>