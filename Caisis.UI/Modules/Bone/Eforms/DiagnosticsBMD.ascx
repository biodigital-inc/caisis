<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bone.Eforms.DiagnosticsBMD" CodeFile="DiagnosticsBMD.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.DiagnosticsBMDHtmlTable = "DiagnosticsBMDHtmlTable";
	

</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="DiagnosticsBMD" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Bone Mineral Density"></asp:Label><br/>

<br /><strong>Previous Bone Mineral Densities</strong>
<table   border="0" cellpadding="0" cellspacing="0" class="ClinicalEformTable" id="Table1">
          
    <asp:Repeater ID="BmdRptr" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 
	<ItemTemplate> 
	    
         <tr class="controlBoxDataGridTitleColumn" >
			    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"  >&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Result</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Institution</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" ></td>
        </tr>
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Diagnostics',  <%# DataBinder.Eval(Container.DataItem, "DiagnosticID") %>, 'DxDateText,DxType,DxResult,DxInstitution', 'Diagnostics');"> 
			<td style="width: 130px; text-align: left;" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText")%></td>
			<td style="width: 130px; text-align: left;" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxType ")%></td>
		    <td style="width: 130px; text-align: left;" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxResult")%></td>
		    <td style="width: 130px; text-align: left;" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "DxInstitution")%></td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>   
		
	    <tr class="controlBoxDataGridTitleColumn">
	        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;Site </td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >T-Score</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Density</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Notes</td>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" ></td>
         </tr>
		
		<asp:Repeater ID="BmdChildRptr" runat="server" > 
        <ItemTemplate> 
            <tr class="ClinicalEformPopulatedRow" > 
                <td style="width: 100px; text-align: left;" class="ClinicalEformPopulatedColumn" >&nbsp;<%# DataBinder.Eval(Container.DataItem, "ImgFindSite")%></td>
                <td style="width: 100px; text-align: left;" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('DxImageFindings',  <%# DataBinder.Eval(Container.DataItem, "DxImageFindingId") %>, 'ImgFindSite,ImgFindStatus,ImgFindResult,ImgFindNotes', 'DxImageFindings');"><%# DataBinder.Eval(Container.DataItem, "ImgFindResult")%></td>
        </ItemTemplate>
        <AlternatingItemTemplate>
                <td style="width: 100px; text-align: left;" class="ClinicalEformPopulatedColumn" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('DxImageFindings',  <%# DataBinder.Eval(Container.DataItem, "DxImageFindingId") %>, 'ImgFindSite,ImgFindStatus,ImgFindResult,ImgFindNotes', 'DxImageFindings');"><%# DataBinder.Eval(Container.DataItem, "ImgFindResult")%></td>
                <td style="width: 100px; text-align: left;" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ImgFindNotes")%></td>
                <td class="ClinicalEformPopulatedColumn" ></td>
            </tr>        
        </AlternatingItemTemplate>
    </asp:Repeater>  
    <tr>
        <td style="text-align: left;" >&nbsp;</td>
        <td style="text-align: left;" >&nbsp;</td>
        <td style="text-align: left;" >&nbsp;</td>
        <td style="text-align: left;" >&nbsp;</td>
    </tr>
    
	</ItemTemplate>
  </asp:Repeater>
  

  <tr id="NoDiagnostiMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="4" class="ClinicalEformPopulatedColumn" align="center" height="40"> No prior bone mineral densities have been recorded for this patient.</td>
  </tr>  

</table>
<br />


<table  width="300" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsBMDHtmlTable" > 



  <tr> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Result</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;Institution</td> 
    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td> 
  </tr>
  <tr > 
    <td height="28" style="white-space: nowrap;" >
        <euc:EformTextBox style="width:140px;" TABLE="Diagnostics" FIELD="DxDateText"    ID="DxDateText"    RecordID="16"  Runat="server"  TabIndex="1" ShowCalendar="true" CalcDate="true" />
        <euc:EformHidden  RecordId="16"   TABLE="Diagnostics" FIELD="DxDate"     ID="DxDate"     Runat="server"/>
        <euc:EformTextBox Width="1px" style="display: none;"  RecordId="16"   TABLE="Diagnostics" FIELD="DxType"     ID="DxType"     Runat="server" /> 
        
        </td>   

    <td height="28" style="white-space: nowrap;" >
        <euc:EformComboBox DropDownWidth="auto" style="width:140px;" TABLE="Diagnostics" FIELD="DxResult"    ID="DxResult" LookupCode="DxResult,FieldType,BoneMineralDensity"    RecordID="16"  Runat="server"   />
        
        </td>   

    <td height="28" style="white-space: nowrap;" valign="bottom" >
        <center>	
        <strong>Done at </strong><br /> 
        <euc:CaisisRadioButtonList id="DxInstitutionDefaultBtn" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"  ></euc:CaisisRadioButtonList>
        <euc:CaisisRadioButtonList  id="DxInstitutionOtherBtn" runat="server" RepeatDirection="Horizontal"  RepeatLayout="Flow">
        <asp:ListItem></asp:ListItem></euc:CaisisRadioButtonList>Other
        <euc:EformTextBox Width="1px" style="display: none;"  Table="Diagnostics"  RecordId="16" Field="DxInstitution" id="DxInstitution" runat="server" /> 
        </center>
   </td>
   <td style="white-space: nowrap;" >
        <div id="DxInstitutionOtherDiv" runat="server" style="display: none; white-space:nowrap; ">
           <euc:CaisisComboBox  id="DxInstitutionOther" LookupCode="Institution" runat="server"/>                  
        </div> 
   </td>
   
  </tr>      

</table>
<br />

<table  width="300" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable"  > 


  <tr> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;T-Score</td>
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Density</td> 
    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Notes</td> 
	<td width="15%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr > 
   <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne">
                <strong>L2-L4</strong></td>

     <td style="text-align: center;" > 
                 <euc:EformTextBox Width="1px" style="display: none;" RecordId="1" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" ID="ImgFindSite_Tscore_L2L4"  />

 				<euc:EformTextBox Width="1px" style="display: none;" RecordId="1" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindStatus"    ID="ImgFindStatus_Tscore_L2L4" Runat="server" />
                <euc:EformTextBox style="width:100px;" RecordID="1" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindResult"    ID="ImgFindResult_Tscore_L2L4" Runat="server"  /></td>


    <td style="text-align: center;" > 
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="2" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" ID="ImgFindSite_Density_L2L4" />

 				<euc:EformTextBox Width="1px" style="display: none;" RecordId="2" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindStatus"    ID="ImgFindStatus_Density_L2L4" Runat="server" />
                <euc:EformTextBox style="width:100px;" RecordID="2" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindResult"    ID="ImgFindResult_Density_L2L4" Runat="server" /></td>

    <td style="text-align: center; white-space:nowrap;" > 
                <euc:EformTextBox style="width:100px;" RecordID="1" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindNotes"    ID="ImgFindNotes_Tscore_L2L4" Runat="server" ShowTextEditor="true" />
 				<euc:EformTextBox Width="1px" style="display: none;" RecordId="2" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindNotes"    ID="ImgFindNotes_Density_L2L4" Runat="server" /></td> 
        <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" /></td>   
 				
  </tr>             

  <tr > 
   <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne">
                <strong>Femoral Neck</strong></td>

     <td style="text-align: center;" > 
                 <euc:EformTextBox Width="1px" style="display: none;" RecordId="3" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" ID="ImgFindSite_Tscore_FemoralNeck" />

 				<euc:EformTextBox Width="1px" style="display: none;" RecordId="3" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindStatus"    ID="ImgFindStatus_Tscore_FemoralNeck" Runat="server" />
                <euc:EformTextBox style="width:100px;" RecordId="3" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindResult"    ID="ImgFindResult_Tscore_FemoralNeck" Runat="server"   /></td>


    <td style="text-align: center;" > 
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="4" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" ID="ImgFindSite_Density_FemoralNeck"  />

 				<euc:EformTextBox Width="1px" style="display: none;" RecordId="4" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindStatus"    ID="ImgFindStatus_Density_FemoralNeck" Runat="server" />
                <euc:EformTextBox style="width:100px;" RecordId="4" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindResult"    ID="ImgFindResult_Density_FemoralNeck" Runat="server" /></td>

    <td style="text-align: center; white-space:nowrap;" > 
                <euc:EformTextBox style="width:100px;" RecordId="3" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindNotes"    ID="ImgFindNotes_Tscore_FemoralNeck" Runat="server" ShowTextEditor="true" />
 				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="4" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindNotes"    ID="ImgFindNotes_Density_FemoralNeck" Runat="server" /></td>
 				
          <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" /></td>
</tr>    

  <tr > 
   <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne">
                <strong>Trochanter</strong></td>

     <td style="text-align: center;" > 
                 <euc:EformTextBox Width="1px" style="display: none;" RecordId="5" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" ID="ImgFindSite_Tscore_Trochanter" />

 				<euc:EformTextBox Width="1px" style="display: none;"  RecordId="5" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindStatus"    ID="ImgFindStatus_Tscore_Trochanter" Runat="server" />
                <euc:EformTextBox style="width:100px;" RecordId="5" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindResult"    ID="ImgFindResult_Tscore_Trochanter" Runat="server" /></td>


    <td style="text-align: center;" > 
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="6" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" ID="ImgFindSite_Density_Trochanter"  />

 				<euc:EformTextBox Width="1px" style="display: none;" RecordId="6" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindStatus"    ID="ImgFindStatus_Density_Trochanter" Runat="server" />
                <euc:EformTextBox style="width:100px;" RecordId="6" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindResult"    ID="ImgFindResult_Density_Trochanter" Runat="server" /></td>

    <td style="text-align: center; white-space:nowrap;" > 
                <euc:EformTextBox style="width:100px;" RecordId="5" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindNotes"    ID="ImgFindNotes_Tscore_Trochanter" Runat="server" ShowTextEditor="true" />
 				<euc:EformTextBox Width="1px" style="display: none;" RecordId="6" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindNotes"    ID="ImgFindNotes_Density_Trochanter" Runat="server" /></td>
 				
         <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" /></td>
 </tr>   

  <tr > 
   <td style="white-space: nowrap;" class="ClinicalEformGridColumnOne">
                <strong>Total Hip</strong></td>

     <td style="text-align: center;" > 
                 <euc:EformTextBox Width="1px" style="display: none;" RecordId="7" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" ID="ImgFindSite_Tscore_TotalHip" />

 				<euc:EformTextBox Width="1px" style="display: none;" RecordId="7" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindStatus"    ID="ImgFindStatus_Tscore_TotalHip" Runat="server" />
                <euc:EformTextBox style="width:100px;" RecordId="7" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindResult"    ID="ImgFindResult_Tscore_TotalHip" Runat="server" /></td>


    <td style="text-align: center;" > 
                <euc:EformTextBox Width="1px" style="display: none;" RecordId="8" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" ID="ImgFindSite_Density_TotalHip" />

 				<euc:EformTextBox Width="1px" style="display: none;" RecordId="8" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindStatus"    ID="ImgFindStatus_Density_TotalHip" Runat="server" />
                <euc:EformTextBox style="width:100px;" RecordId="8" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindResult"    ID="ImgFindResult_Density_TotalHip" Runat="server" /></td>

    <td style="text-align: center; white-space:nowrap;" > 
                <euc:EformTextBox style="width:100px;" RecordId="7" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindNotes"    ID="ImgFindNotes_Tscore_TotalHip" Runat="server" ShowTextEditor="true" />
 				<euc:EformTextBox Width="1px" style="display: none;" RecordId="8" ParentRecordId="16" TABLE="DxImageFindings" FIELD="ImgFindNotes"    ID="ImgFindNotes_Density_TotalHip" Runat="server" /></td>
 
         <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" /></td>
				
  </tr> 
  
</table>

<script type="text/javascript">
    //Adds events to controls
    function addEvents(dxInstitutionDefaultBtn,dxInstitutionOtherBtn,dxInstitutionOtherDiv,dxInstitutionOther,dxInstitution)
    { 
        $(dxInstitutionDefaultBtn).addEvent('click',curry(SetHiddenFields1,dxInstitutionDefaultBtn,dxInstitutionOtherBtn,dxInstitutionOtherDiv,dxInstitutionOther,dxInstitution));
        $(dxInstitutionOtherBtn).addEvent('click',curry(SetHiddenFields2,dxInstitutionDefaultBtn,dxInstitutionOtherBtn,dxInstitutionOtherDiv,dxInstitutionOther,dxInstitution));
        $(dxInstitutionOther).addEvent('blur',curry(SetHiddenFields2,dxInstitutionDefaultBtn,dxInstitutionOtherBtn,dxInstitutionOtherDiv,dxInstitutionOther,dxInstitution));
      ShowResultsOnLoad();
    }

    addEvents($('<%= DxInstitutionDefaultBtn.ClientID %>'),$('<%= DxInstitutionOtherBtn.ClientID %>'),$('<%= DxInstitutionOtherDiv.ClientID %>'),$('<%= DxInstitutionOther.ClientID %>'),$('<%= DxInstitution.ClientID %>'));
 
    /* ]]> */
        
    function SetHiddenFields1(dxInstitutionDefaultBtn,dxInstitutionOtherBtn,dxInstitutionOtherDiv,dxInstitutionOther,dxInstitution)
    {
         var radioList1 = dxInstitutionDefaultBtn.getElementsByTagName('input');
         var radioList2 = dxInstitutionOtherBtn.getElementsByTagName('input');


       if (radioList1[0].checked)
        {
             dxInstitution.value = radioList1[0].value;
             
            radioList2[0].checked = false;
            dxInstitutionOther.value = '';
            dxInstitutionOtherDiv.style.display = 'none';
        }
        else
            dxInstitution.value = '';

    }

    function SetHiddenFields2(dxInstitutionDefaultBtn,dxInstitutionOtherBtn,dxInstitutionOtherDiv,dxInstitutionOther,dxInstitution)
    {
         var radioList1 = dxInstitutionDefaultBtn.getElementsByTagName('input');
         var radioList2 = dxInstitutionOtherBtn.getElementsByTagName('input');

        if (radioList2[0].checked)
        {
             dxInstitution.value = dxInstitutionOther.value;

            radioList1[0].checked = false;
            dxInstitutionOtherDiv.style.display = 'block';
        }
        else
            dxInstitution.value = '';
    }
	
   function  ShowResultsOnLoad()
   {
       var resultObj = document.getElementById('<%= DxInstitution.ClientID %>');
       var otherDiv = document.getElementById('<%= DxInstitutionOtherDiv.ClientID %>');
       var otherObj = document.getElementById('<%= DxInstitutionOther.ClientID %>');
       var typeObj1 = document.getElementById('<%= DxInstitutionDefaultBtn.ClientID %>');
       var radioList1 = typeObj1.getElementsByTagName('input');
       var typeObj2 = document.getElementById('<%= DxInstitutionOtherBtn.ClientID %>');
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
   
//*************************************************************************************
//*************************************************************************************
//*************************************************************************************

    //Adds events to controls
    function addEvents2(dxDateTextID,dxTypeID,dxResultID,dxInstDefaultBtnID,dxInstOtherBtn,dxInstOtherID,imgFindSiteValue,imgFindSiteTSID,imgFindStatusTSID,imgFindResultTSID,imgFindSiteDID,imgFindStatusDID,imgFindResultDID,imgFindNotesTSID,imgFindNotesDID)
    { 
        $(dxDateTextID).addEvent('blur',curry(SetHiddenFields3,dxDateTextID,dxTypeID,dxInstDefaultBtnID,dxInstOtherBtn,dxInstOtherID,imgFindSiteValue,imgFindSiteTSID,imgFindStatusTSID,imgFindResultTSID,imgFindSiteDID,imgFindStatusDID,imgFindResultDID,imgFindNotesTSID,imgFindNotesDID));
        $(dxResultID).addEvent('blur',curry(SetHiddenFields3,dxDateTextID,dxTypeID,dxResultID,dxInstDefaultBtnID,dxInstOtherBtn,dxInstOtherID,imgFindSiteValue,imgFindSiteTSID,imgFindStatusTSID,imgFindResultTSID,imgFindSiteDID,imgFindStatusDID,imgFindResultDID,imgFindNotesTSID,imgFindNotesDID));        
        $(dxInstDefaultBtnID).addEvent('click',curry(SetHiddenFields3,dxDateTextID,dxTypeID,dxResultID,dxInstDefaultBtnID,dxInstOtherBtn,dxInstOtherID,imgFindSiteValue,imgFindSiteTSID,imgFindStatusTSID,imgFindResultTSID,imgFindSiteDID,imgFindStatusDID,imgFindResultDID,imgFindNotesTSID,imgFindNotesDID));
        $(dxInstOtherBtn).addEvent('click',curry(SetHiddenFields3,dxDateTextID,dxTypeID,dxResultID,dxInstDefaultBtnID,dxInstOtherBtn,dxInstOtherID,imgFindSiteValue,imgFindSiteTSID,imgFindStatusTSID,imgFindResultTSID,imgFindSiteDID,imgFindStatusDID,imgFindResultDID,imgFindNotesTSID,imgFindNotesDID));
        $(dxInstOtherID).addEvent('blur',curry(SetHiddenFields3,dxDateTextID,dxTypeID,dxResultID,dxInstDefaultBtnID,dxInstOtherBtn,dxInstOtherID,imgFindSiteValue,imgFindSiteTSID,imgFindStatusTSID,imgFindResultTSID,imgFindSiteDID,imgFindStatusDID,imgFindResultDID,imgFindNotesTSID,imgFindNotesDID));
        $(imgFindResultTSID).addEvent('blur',curry(SetHiddenFields3,dxDateTextID,dxTypeID,dxResultID,dxInstDefaultBtnID,dxInstOtherBtn,dxInstOtherID,imgFindSiteValue,imgFindSiteTSID,imgFindStatusTSID,imgFindResultTSID,imgFindSiteDID,imgFindStatusDID,imgFindResultDID,imgFindNotesTSID,imgFindNotesDID));
        $(imgFindResultDID).addEvent('blur',curry(SetHiddenFields3,dxDateTextID,dxTypeID,dxResultID,dxInstDefaultBtnID,dxInstOtherBtn,dxInstOtherID,imgFindSiteValue,imgFindSiteTSID,imgFindStatusTSID,imgFindResultTSID,imgFindSiteDID,imgFindStatusDID,imgFindResultDID,imgFindNotesTSID,imgFindNotesDID));
        $(imgFindNotesTSID).addEvent('blur',curry(SetHiddenFields3,dxDateTextID,dxTypeID,dxResultID,dxInstDefaultBtnID,dxInstOtherBtn,dxInstOtherID,imgFindSiteValue,imgFindSiteTSID,imgFindStatusTSID,imgFindResultTSID,imgFindSiteDID,imgFindStatusDID,imgFindResultDID,imgFindNotesTSID,imgFindNotesDID));
    }

    addEvents2($('<%= DxDateText.ClientID %>'),$('<%= DxType.ClientID %>'),$('<%= DxResult.ClientID %>'),$('<%= DxInstitutionDefaultBtn.ClientID %>'),$('<%= DxInstitutionOtherBtn.ClientID %>'),$('<%= DxInstitutionOther.ClientID %>'),'L2-L4',$('<%= ImgFindSite_Tscore_L2L4.ClientID %>'),$('<%= ImgFindStatus_Tscore_L2L4.ClientID %>'),$('<%= ImgFindResult_Tscore_L2L4.ClientID %>'),$('<%= ImgFindSite_Density_L2L4.ClientID %>'),$('<%= ImgFindStatus_Density_L2L4.ClientID %>'),$('<%= ImgFindResult_Density_L2L4.ClientID %>'),$('<%= ImgFindNotes_Tscore_L2L4.ClientID %>'),$('<%= ImgFindNotes_Density_L2L4.ClientID %>'));
    addEvents2($('<%= DxDateText.ClientID %>'),$('<%= DxType.ClientID %>'),$('<%= DxResult.ClientID %>'),$('<%= DxInstitutionDefaultBtn.ClientID %>'),$('<%= DxInstitutionOtherBtn.ClientID %>'),$('<%= DxInstitutionOther.ClientID %>'),'Femoral Neck',$('<%= ImgFindSite_Tscore_FemoralNeck.ClientID %>'),$('<%= ImgFindStatus_Tscore_FemoralNeck.ClientID %>'),$('<%= ImgFindResult_Tscore_FemoralNeck.ClientID %>'),$('<%= ImgFindSite_Density_FemoralNeck.ClientID %>'),$('<%= ImgFindStatus_Density_FemoralNeck.ClientID %>'),$('<%= ImgFindResult_Density_FemoralNeck.ClientID %>'),$('<%= ImgFindNotes_Tscore_FemoralNeck.ClientID %>'),$('<%= ImgFindNotes_Density_FemoralNeck.ClientID %>'));
    addEvents2($('<%= DxDateText.ClientID %>'),$('<%= DxType.ClientID %>'),$('<%= DxResult.ClientID %>'),$('<%= DxInstitutionDefaultBtn.ClientID %>'),$('<%= DxInstitutionOtherBtn.ClientID %>'),$('<%= DxInstitutionOther.ClientID %>'),'Trochanter',$('<%= ImgFindSite_Tscore_Trochanter.ClientID %>'),$('<%= ImgFindStatus_Tscore_Trochanter.ClientID %>'),$('<%= ImgFindResult_Tscore_Trochanter.ClientID %>'),$('<%= ImgFindSite_Density_Trochanter.ClientID %>'),$('<%= ImgFindStatus_Density_Trochanter.ClientID %>'),$('<%= ImgFindResult_Density_Trochanter.ClientID %>'),$('<%= ImgFindNotes_Tscore_Trochanter.ClientID %>'),$('<%= ImgFindNotes_Density_Trochanter.ClientID %>'));
    addEvents2($('<%= DxDateText.ClientID %>'),$('<%= DxType.ClientID %>'),$('<%= DxResult.ClientID %>'),$('<%= DxInstitutionDefaultBtn.ClientID %>'),$('<%= DxInstitutionOtherBtn.ClientID %>'),$('<%= DxInstitutionOther.ClientID %>'),'Total Hip',$('<%= ImgFindSite_Tscore_TotalHip.ClientID %>'),$('<%= ImgFindStatus_Tscore_TotalHip.ClientID %>'),$('<%= ImgFindResult_Tscore_TotalHip.ClientID %>'),$('<%= ImgFindSite_Density_TotalHip.ClientID %>'),$('<%= ImgFindStatus_Density_TotalHip.ClientID %>'),$('<%= ImgFindResult_Density_TotalHip.ClientID %>'),$('<%= ImgFindNotes_Tscore_TotalHip.ClientID %>'),$('<%= ImgFindNotes_Density_TotalHip.ClientID %>'));


  	function SetHiddenFields3(dxDateTextID,dxTypeID,dxResultID,dxInstDefaultBtnID,dxInstOtherBtn,dxInstOtherID,imgFindSiteValue,imgFindSiteTSID,imgFindStatusTSID,imgFindResultTSID,imgFindSiteDID,imgFindStatusDID,imgFindResultDID,imgFindNotesTSID,imgFindNotesDID)
	{
	    var radioList1 = dxInstDefaultBtnID.getElementsByTagName('input');
	    var radioList2 = dxInstOtherBtn.getElementsByTagName('input');

	    
	    if ( (dxDateTextID.value != '' || dxResultID.value != '' || radioList1[0].checked || radioList2[0].checked || dxInstOtherID.value != '' ) && (imgFindResultTSID.value != '' || imgFindNotesTSID.value != '') )
        {
            dxTypeID.value = "Bone Mass Density";
            imgFindSiteTSID.value = imgFindSiteValue;
            imgFindStatusTSID.value = 'T-Score';           
        }
        else
        {
            dxTypeID.value = '';
            imgFindSiteTSID.value = '';
            imgFindStatusTSID.value = '';      
        }

	    if ( (dxDateTextID.value != '' || dxResultID.value != '' || dxTypeID.value != '' || radioList1[0].checked || radioList2[0].checked || dxInstOtherID.value != '' ) && (imgFindResultDID.value != '' || imgFindNotesTSID.value != '') )
        {
            dxTypeID.value = "Bone Mineral Density";
            imgFindSiteDID.value = imgFindSiteValue;
            imgFindStatusDID.value = 'Density';
            imgFindNotesDID.value = imgFindNotesTSID.value;            
        }
        else
        {
            dxTypeID.value = '';
            imgFindSiteDID.value = '';
            imgFindStatusDID.value = '';
            imgFindNotesDID.value = '';      
        }
           
        if (dxDateTextID.value != '' || dxResultID.value != '' || radioList1[0].checked || radioList2[0].checked || dxInstOtherID.value != '' )
            dxTypeID.value = "Bone Mineral Density";
        else
            dxTypeID.value = '';
            
	}
	
	 	
</script>
