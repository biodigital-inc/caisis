<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.SurgCCsRvwQualityAssurance" CodeFile="SurgCCsRvwQualityAssurance.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="SurgCCsRvwQualityAssurance" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Quality Assurance Review"></asp:Label><br/>

<table cellpadding="5" cellspacing="0" class="eformLargePopulatedTableBlue" id="QAReviewHtmlTable">
    
  <tr> 
  <td style="white-space: nowrap;"><strong>Date: </strong></td>
    <td style="white-space: nowrap;">
        <euc:EformTextBox Width="80px" Runat="server" ID="GlobalActionDateText" TABLE="NoTable" FIELD="GlobalActionDateText" ShowCalendar="True" CalcDate="True"  />
        <euc:EformHidden Runat="server" ID="GlobalActionDate" Table="NoTable" Field="GlobalActionDate" />    
        
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1"  TABLE="Actions" FIELD="ActionDateText" ID="ActionDateText_1"  />
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1"  TABLE="Actions" FIELD="ActionDate" ID="ActionDate_1"  />
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1"  TABLE="Actions" FIELD="ActionItem" ID="ActionItem_1"  />
        
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2"  TABLE="Actions" FIELD="ActionDateText" ID="ActionDateText_2"  />
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2"  TABLE="Actions" FIELD="ActionDate" ID="ActionDate_2"  />
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="2"  TABLE="Actions" FIELD="ActionItem" ID="ActionItem_2"  /></td>
  </tr>    
  <tr>
  <td style="white-space: nowrap;"><strong>Submitted for QA Review: </strong></td>
    <td style="white-space: nowrap;">
        Yes&nbsp;<euc:EformCheckBox TABLE="NoTable" FIELD="SubmittedQAReview" ID="SubmittedQAReview" Runat="server" Value="Yes"  /></td>          
  </tr>               
  <tr>
    <td style="white-space: nowrap;"><strong>Requires Peer Review: </strong></td>
    <td style="white-space: nowrap;">
        Yes&nbsp;<euc:EformCheckBox TABLE="NoTable" FIELD="RequiresPeerReview" ID="RequiresPeerReview" Runat="server" Value="Yes"  /></td>            
  </tr>
  <tr> 
    <td style="white-space: nowrap;"><strong>Follow Up Action Required: </strong></td>
    <td style="white-space: nowrap;">
        Yes&nbsp;<euc:EformCheckBox TABLE="NoTable" FIELD="FUActionRequired" ID="FUActionRequired" Runat="server" Value="Yes"  /></td>          
  </tr>
  <tr>
    <td style="white-space: nowrap;"><strong>Classification: </strong></td>
    <td style="white-space: nowrap;">
        <euc:EformDropDownList RecordId="1"  TABLE="Categories" FIELD="Category" ID="Category_1" Runat="server" LookupDistinct="Categories; Category; Category; ((EnteredBy = @UserName) AND (CategoryType = 'Private')) OR (CategoryType = 'Public'); Category ASC"/>
        <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1"  ID="CategoryType_1" TABLE="Categories" FIELD="CategoryType" /></td>    
  </tr>                   
</table>
<br/><br/><br/>

  <script type="text/javascript">

    //Adds blur event to combo
    addAbsentEvent($('<%= CategoryType_1.ClientID %>'),$('<%= Category_1.ClientID %>'));

    function addAbsentEvent(categoryType,category)
    {  
        $(category).addEvent('blur',curry(SetHiddenFields,categoryType,category));
    }
	
	function SetHiddenFields(categoryType,category)
    {        
        if (category.value != '')
            categoryType.value = "Public";  
        else
            categoryType.value = '';                
    }
    
    /**************************************************/
    /**************************************************/
    /**************************************************/
    
     addAbsentEvent2($('<%= GlobalActionDateText.ClientID %>'),$('<%= GlobalActionDate.ClientID %>'),$('<%= ActionDateText_1.ClientID %>'),$('<%= ActionDate_1.ClientID %>'),$('<%= ActionItem_1.ClientID %>'),$('<%= ActionDateText_2.ClientID %>'),$('<%= ActionDate_2.ClientID %>'),$('<%= ActionItem_2.ClientID %>'),$('<%= SubmittedQAReview.ClientID %>'),$('<%= RequiresPeerReview.ClientID %>'),$('<%= FUActionRequired.ClientID %>'));

    function addAbsentEvent2(globalActionDateTextID,actionDateGlobalID,actionDateText1ID,actionDate1ID,acitonItem1ID,actionDateText2ID,actionDate2ID,acitonItem2ID,qaReviewCB,peerReviewCB,actionRequiredCB)
    {  
        $(globalActionDateTextID).addEvent('blur',curry(SetHiddenFields2,globalActionDateTextID,actionDateGlobalID,actionDateText1ID,actionDate1ID,acitonItem1ID,actionDateText2ID,actionDate2ID,acitonItem2ID,qaReviewCB,peerReviewCB,actionRequiredCB));
        $(qaReviewCB).addEvent('click',curry(SetHiddenFields2,globalActionDateTextID,actionDateGlobalID,actionDateText1ID,actionDate1ID,acitonItem1ID,actionDateText2ID,actionDate2ID,acitonItem2ID,qaReviewCB,peerReviewCB,actionRequiredCB));
        $(peerReviewCB).addEvent('click',curry(SetHiddenFields2,globalActionDateTextID,actionDateGlobalID,actionDateText1ID,actionDate1ID,acitonItem1ID,actionDateText2ID,actionDate2ID,acitonItem2ID,qaReviewCB,peerReviewCB,actionRequiredCB));
        $(actionRequiredCB).addEvent('click',curry(SetHiddenFields2,globalActionDateTextID,actionDateGlobalID,actionDateText1ID,actionDate1ID,acitonItem1ID,actionDateText2ID,actionDate2ID,acitonItem2ID,qaReviewCB,peerReviewCB,actionRequiredCB));
    }
	
	function SetHiddenFields2(globalActionDateTextID,actionDateGlobalID,actionDateText1ID,actionDate1ID,acitonItem1ID,actionDateText2ID,actionDate2ID,acitonItem2ID,qaReviewCB,peerReviewCB,actionRequiredCB)
    {        
         acitonItem1ID.value = '';
         actionDateText1ID.value = '';
         actionDate1ID.value = '';
         
         acitonItem2ID.value = '';
         actionDateText2ID.value = '';
         actionDate2ID.value = '';
         
        if (qaReviewCB.checked && !peerReviewCB.checked)
        {
            actionDateText1ID.value = globalActionDateTextID.value;
            actionDate1ID.value = actionDateGlobalID.value;
            acitonItem1ID.value = 'Submitted for QA Review';
        }      
        
        if ( (qaReviewCB.checked && peerReviewCB.checked) || peerReviewCB.checked )
        {
            actionDateText1ID.value = globalActionDateTextID.value;
            actionDate1ID.value = actionDateGlobalID.value;
            acitonItem1ID.value = 'Submitted for Peer QA Review';
        }

        if (actionRequiredCB.checked)
        {
            actionDateText2ID.value = globalActionDateTextID.value;
            actionDate2ID.value = actionDateGlobalID.value;
            acitonItem2ID.value = 'QA Follow Up Required';
        }      

    }   
    
    
</script>
