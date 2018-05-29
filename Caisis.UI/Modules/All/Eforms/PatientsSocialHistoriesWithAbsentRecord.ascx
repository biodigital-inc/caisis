<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PatientsSocialHistoriesWithAbsentRecord" CodeFile="PatientsSocialHistoriesWithAbsentRecord.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PatientsSocialHistoriesWithAbsentRecord" /><br/>

<br />

<table class="eformLargePopulatedTable">
    <tr id="SocialHxHeaderTr" runat="server">
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Social History"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="SocialHxRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="SocialHxRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="SocialHxAbsentDiv" runat="server" style="display: none;" >
 <br /><br />  
    <table class="eformLargePopulatedTable">
        <tr>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_10"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="10" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_10"
                Runat="server" Width="1px" Style="display: none;" /></td>
        </tr>
</table>
<br />
</div>
                
<div id="SocialHxDiv" runat="server" style="display: none;">
 <br /><br />  
<table>

   <tr id="NoSocialHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No social history has been recorded for this patient.</td>
  </tr>  
  <tr id="SocialHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable"  > 
		<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> The social history recorded for this patient has been populated below.</td>            
  </tr>  


   <tr><td><br /></td></tr>

    <tr>
        <td>
        
            <table id="SocialHistoryTable"  width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" > 
            
           <!-- ********************** Row One ********************** -->
                  <tr > 
                    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Occupation</td>
                    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Marital Status</td>
                    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Children</td>
                     <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>                   
                  </tr>
                              
               <asp:Repeater ID="rowHasHx1" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                <ItemTemplate>
	                <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('SocialHistories',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxCarcinogen,SocHxNotes', 'SocialHistories');"> 
		                <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxOccupation")%></td>
	                   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxMaritalStatus")%></td>
	                   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxChildren")%></td>
	                   <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	                </tr>    
	                </ItemTemplate>
	           </asp:Repeater>
	                
                  <tr ID="rowNoHx1" runat="server"> 
                    <td height="28" ><euc:EformTextBox style="width:100px;" TABLE="SocialHistories" FIELD="SocHxOccupation"    ID="SocHxOccupation"    RecordID="1"  Runat="server"  TabIndex="1" /></td>
                    <td height="28" ><euc:EformComboBox  style="width:100px;" TABLE="SocialHistories" FIELD="SocHxMaritalStatus" ID="SocHxMaritalStatus" RecordID="1"   Runat="server" TabIndex="2" LookupCode="SocHxMaritalStatus" /></td>
                    <td height="28" ><euc:EformTextBox style="width:80px;"  TABLE="SocialHistories" FIELD="SocHxChildren"      ID="SocHxChildren"      RecordID="1"  Runat="server"  TabIndex="3" /></td>
                  </tr>

                   <!--DO NO DELETE FOLLOWING <TR> -- B/C runat="server" IS USED FOR PREVIOUS <TR>, NEEDED FOR CONTROL TO SHOW UP IN EFORM TRANSFORM 2/22/2010-->
                   <tr style="display: none;"><td><euc:EformHidden TABLE="SocialHistories" FIELD="SocHxDataSource" ID="EformTextBox1" RecordID="1" Runat="server"/></td>
                  </tr>
                 
                  
            <!-- ********************** Row Two ********************** -->                 
                  <tr> 
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">&nbsp;Tobacco Type</td>
                    <td width="50%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;" colspan="1" >Tobacco Usage</td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Tobacco Year Quit</td>   
                    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>                                
                  </tr>
                  
                  <asp:Repeater ID="rowHasHx2" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                    <ItemTemplate>
	                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('SocialHistories',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxCarcinogen,SocHxNotes', 'SocialHistories');"> 
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoType")%></td>
	                       <td style="white-space: nowrap;" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoPacksPerDay")%>&nbsp;pack(s)/day for&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoYears")%>&nbsp;years<br />
	                                                                &nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoPacksPerYear")%>&nbsp;pack(s)/year</td>
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoQuitYear")%></td>
	                       <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="Img1" runat="server" title="This record has been locked."/>&nbsp;</td>
	                    </tr>  
                		
                    </ItemTemplate>
                  </asp:Repeater>
                  <tr ID="rowNoHx2" runat="server"> 
                    <td height="28" ><euc:EformComboBox style="width:100px;" TABLE="SocialHistories" FIELD="SocHxTobaccoType"        ID="SocHxTobaccoType"        RecordID="1"  Runat="server" LookupCode="SocHxTobaccoType" /></td>
                    <td height="28" style="white-space: nowrap; " >
                                     <euc:EformTextBox style="width:30px;" TABLE="SocialHistories" FIELD="SocHxTobaccoPacksPerDay" ID="SocHxTobaccoPacksPerDay" RecordID="1"  Runat="server"  TabIndex="5" />
                                     pack(s)/day for 
                                     <euc:EformTextBox style="width:30px;" TABLE="SocialHistories" FIELD="SocHxTobaccoYears"       ID="SocHxTobaccoYears"       RecordID="1"  Runat="server"  TabIndex="6" />
                                     years
                                     <br />
                                     <euc:EformTextBox style="width:30px;" TABLE="SocialHistories" FIELD="SocHxTobaccoPacksPerYear" ID="SocHxTobaccoPacksPerYear" RecordID="1"  Runat="server"  TabIndex="5" />
                                     pack(s)/year
                    </td>
                    <td height="28" ><euc:EformTextBox style="width:80px;"  TABLE="SocialHistories" FIELD="SocHxTobaccoQuitYear"   ID="SocHxTobaccoQuitYear"    RecordID="1"  Runat="server"  /></td>    
                  </tr>


           <!-- ********************** Row Three ********************** -->
                  <tr> 
                    <td width="30%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Alcohol Status</td>
                    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;" >Alcohol Usage</td>
                    <td height="10%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;">Alcohol Year Quit</td>    
                    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>                                   
                  </tr>
                   <asp:Repeater ID="rowHasHx3" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                    <ItemTemplate>
	                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('SocialHistories',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxCarcinogen,SocHxNotes', 'SocialHistories');"> 
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxAlcohol")%></td>
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxAlcoholDrinksPerDay")%>&nbsp;drinks/day for&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxAlcoholYears")%>years</td>
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxAlcoholQuitYear")%></td>
	                       <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="Img2" runat="server" title="This record has been locked."/>&nbsp;</td>
	                    </tr>  
                    </ItemTemplate>
                  </asp:Repeater>
                  <tr ID="rowNoHx3" runat="server"> 
                    <td height="28" ><euc:EformComboBox DropDownWidth="300px" style="width:100px;" TABLE="SocialHistories" FIELD="SocHxAlcohol"    ID="SocHxAlcohol"    RecordID="1"  Runat="server" LookupCode="AlcoholUsage"  /></td>
                    <td height="28" ><euc:EformTextBox style="width:30px;"  TABLE="SocialHistories" FIELD="SocHxAlcoholDrinksPerDay" ID="SocHxAlcoholDrinksPerDay" RecordID="1"  Runat="server"  />   
                        drinks/day for  
                        <euc:EformTextBox style="width:30px;"  TABLE="SocialHistories" FIELD="SocHxAlcoholYears" ID="SocHxAlcoholYears" RecordID="1"  Runat="server"  />
                        years
                    </td>    
                    <td height="28" ><euc:EformTextBox style="width:100px;" TABLE="SocialHistories" FIELD="SocHxAlcoholQuitYear"    ID="SocHxAlcoholQuitYear"    RecordID="1"  Runat="server"  /></td>
                 </tr>
 
 
            <!-- ********************** Row Four ********************** -->
                  <tr> 
                    <td width="30%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Carcinogen Exposure</td>
                    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;" >Notes</td>
                    <td height="10%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;" ></td>    
                    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>                                   
                  </tr>
                   <asp:Repeater ID="rowHasHx4" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                    <ItemTemplate>
	                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('SocialHistories',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxAlcoholDrinksPerDay,SocHxAlcoholYears,SocHxAlcoholQuitYear,SocHxCarcinogen,SocHxNotes', 'SocialHistories');"> 
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxCarcinogen")%></td>
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxNotes")%></td>
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
	                       <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="Img2" runat="server" title="This record has been locked."/>&nbsp;</td>
	                    </tr>  
                    </ItemTemplate>
                  </asp:Repeater>
                  <tr ID="rowNoHx4" runat="server"> 
                    <td height="28" ><euc:EformTextBox style="width:100px;"  TABLE="SocialHistories" FIELD="SocHxCarcinogen" ID="SocHxCarcinogen" RecordID="1"  Runat="server"  /></td>    
                     <td height="28" colspan="3" ><euc:EformTextBox style="width:300px;"  TABLE="SocialHistories" FIELD="SocHxNotes" ID="SocHxNotes" RecordID="1"  Runat="server" ShowTextEditor="true" /></td>    
                 </tr>
   
              </table>

        </td>
    </tr>
  
</table>
</div>
<table >
    <tr id="SocialHxAbsentRow">
        <td>
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="TableName" ID="TableName_10"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="FieldName" ID="FieldName_10"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_10"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_10"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="10" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_10"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>
<br/><br/><br/>


<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= SocialHxRecorded.ClientID %>'),$('<%= SocialHxDiv.ClientID %>'),$('<%= SocialHxAbsentDiv.ClientID %>'));
    function addAbsentEvent(socialHxRecordedID,socialHxDivID,socialHxAbsentDivID)
    {  
        $(socialHxRecordedID).addEvent('click',curry(SocialHxYesNo,socialHxRecordedID,socialHxDivID,socialHxAbsentDivID));

        // check on load as well
        SocialHxYesNo(socialHxRecordedID,socialHxDivID,socialHxAbsentDivID);
    }
   
    /* ]]> */
   
    function SocialHxYesNo(socialHxRecordedID,socialHxDivID,socialHxAbsentDivID)
    {
       var socialHxRecordedRef = socialHxRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < socialHxRecordedRef.length; i++) 
        if (socialHxRecordedRef[i].checked) {  
            SocialHxRadioClick(socialHxRecordedRef[i].value,socialHxDivID,socialHxAbsentDivID);
            }
    }
    
    function SocialHxRadioClick(SocialHxoption_value,SocialHxhideDiv,SocialHxhideAbsentDiv)
    {
      if (SocialHxoption_value == "Yes")
      { 
        SocialHxhideDiv.style.display='block';
        SocialHxhideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_10.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_10.ClientID %>').value='';
        document.getElementById('<%= TableName_10.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_10.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_10.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_10.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_10.ClientID %>').value = '';
        
      } 
      else if (SocialHxoption_value == "No" || SocialHxoption_value == "Unknown")
      {
        SocialHxhideAbsentDiv.style.display='block';
        SocialHxhideDiv.style.display='none';
      
        document.getElementById('<%= TableName_10.ClientID %>').value = 'SocialHistories';        
        document.getElementById('<%= FieldName_10.ClientID %>').value = 'SocHxNotes';        
        document.getElementById('<%= FieldValue_10.ClientID %>').value = 'Social History'; 
        
        if (SocialHxoption_value == "No")       
            document.getElementById('<%= AbsentReason_10.ClientID %>').value = 'None Recorded';        
        if (SocialHxoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_10.ClientID %>').value = 'Unknown';        

        document.getElementById('<%= AbsentQuality_10.ClientID %>').value = 'OUT';        
     }
    }

</script>