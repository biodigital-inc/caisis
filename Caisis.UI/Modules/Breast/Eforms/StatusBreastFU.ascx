<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.StatusBreastFU" CodeFile="StatusBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />


<a name="StatusBreastFU" /><span class="controlBoxTitle">Menopause</span> <br/>

<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
 <tr >
    <td style="white-space:nowrap;"><strong>Menopausal ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="MenopauseYesNo" id="MenopauseYesNo" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:40%"></td>
  </tr>
  
  <tr id="SocHxTR" runat="server" style="display: none;">
     <td style="padding: 0px 0px 0px 16px;" colspan="3">
        <table>
            <tr id="NoSocialHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" visible="false" > 
			        <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> 
			            No Social history has been recorded for this patient.</td>
            </tr>  
            <tr id="SocialHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" visible="false"> 
		        <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
		            The Gyn history recorded for this patient has been populated below.</td>            
            </tr> 
           <tr><td><br /></td></tr>
           <tr>
            <td>
                <table width="200" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="GynSocialHxHtmlTable">
	                <tr> 
		                <td class="controlBoxDataGridHeaderFirstCol" align="center">Age at Menopause</td>
		                <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
		            </tr>
        		    
		            <asp:Repeater ID="rowHasHx1" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                        <ItemTemplate>
                            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('SocialHistories',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'SocHxMenopauseAge', 'SocialHistories');"> 
                               <td class="ClinicalEformPopulatedColumn" align="center"><%# DataBinder.Eval(Container.DataItem, "SocHxMenopauseAge")%></td>
                               <td class="ClinicalEformPopulatedColumn" align="center"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
                            </tr>    
                        </ItemTemplate>
                   </asp:Repeater>
                   
                   <tr ID="rowNoHx1"  runat="server">
                    <td align="center"><euc:EformTextBox id="SocHxMenopauseAge_1"  Table="SocialHistories" Field="SocHxMenopauseAge" 
                        RecordId="1" runat="server" style="width: 100px;"/></td>
                    <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" /></td>
                  </tr>
              </table><br />
            </td>
           </tr>
          </table>
     </td>
 </tr>
 
 <tr id="BreastMenopauseDetailsTR" runat="server" style="display: none;">
     <td style="padding: 0px 0px 0px 16px;" colspan="3">
        <table width="250" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BreastMenopauseTbl">
          <tr>
		        <td  class="controlBoxDataGridHeaderFirstCol">Date</td>
		        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Status</td>
		        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Disease</td>
		        <td  class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
          </tr>
          
          <tr id="BreastMenopauseTr1">
	         <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="Status" 
	            FIELD="StatusDateText" Runat="server" ID="StatusDateText_1"/>
		         <euc:EformHidden RecordId="1" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_1"/></td>
            <td align="center"><euc:EformTextBox RecordId="1" TABLE="Status" FIELD="Status" Runat="server" ID="Status_1" 
                Width="150px" ReadOnly="true" /></td>
            <td align="center"><euc:EformTextBox RecordId="1" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_1" 
                Width="125px" ReadOnly="true"/>
                <euc:EformTextBox RecordId="1" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" 
                    ID="StatusQuality_1"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
        </table><br /><br />
        </td>
        </tr>
        
         
</table><br /><br />


<script type="text/javascript"> 
    //Adds events for menopause YesNo   
    addMenopauseEvent($('<%= MenopauseYesNo.ClientID %>'),$('<%= BreastMenopauseDetailsTR.ClientID %>'),$('<%= SocHxTR.ClientID %>'));
    
    function addMenopauseEvent(MenopauseYesNoID,BreastMenopauseDetailsTRID,SocHxTRID)
    {  
        $(MenopauseYesNoID).addEvent('click',curry(MenopauseYesNo,MenopauseYesNoID,BreastMenopauseDetailsTRID,SocHxTRID));

        // check on load as well
        MenopauseYesNo(MenopauseYesNoID,BreastMenopauseDetailsTRID,SocHxTRID);
    }
   
    function MenopauseYesNo(MenopauseYesNoID,BreastMenopauseDetailsTRID,SocHxTRID)
    {
       var MenopauseYesNoRef = MenopauseYesNoID.getElementsByTagName('input');
       
       for (var i = 0; i < MenopauseYesNoRef.length; i++) 
        if (MenopauseYesNoRef[i].checked) 
        {  
            MenopauseRadioClick(MenopauseYesNoRef[i].value,BreastMenopauseDetailsTRID,SocHxTRID);
        }
    }
    
    function MenopauseRadioClick(Menopauseoption_value,MenopausehideTR,SocHxHideTR)
    {
      if (Menopauseoption_value == "Yes")
      { 
        MenopausehideTR.style.display='block';
        SocHxHideTR.style.display='block';        
      } 
      else if (Menopauseoption_value == "No")
      {
        MenopausehideTR.style.display='none';
        MenopausehideTR.style.display='none';
        
        //clears all rows data
        clearElementsInParentRow(document.getElementById('BreastMenopauseTr1'));
      }
    }
    
    
    //Adds events to controls
    function addStatusEvents(stDate,stType,stDis,stQlty)
    { 
        $(stDate).addEvent('blur',curry(StatusAutoPopulates,stDate,stType,stDis,stQlty));
    }
 
    addStatusEvents($('<%= StatusDateText_1.ClientID %>'),$('<%= Status_1.ClientID %>'),$('<%= StatusDisease_1.ClientID %>'),$('<%= StatusQuality_1.ClientID %>'));

    function StatusAutoPopulates(stDate,stType,stDis,stQlty)
    {
       if (stDate.value != '')
        {
           stType.value = 'Last Menstrual Period'
           stDis.value = 'Breast Cancer'; 
           stQlty.value = 'STD';
        }
        else
        {
            stType.value = '';
            stDis.value = '';
            stQlty.value = '';
        }
    }
    
</script>