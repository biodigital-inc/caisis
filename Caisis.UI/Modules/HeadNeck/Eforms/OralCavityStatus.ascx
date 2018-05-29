<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OralCavityStatus" CodeFile="OralCavityStatus.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="SalivaryGlandRecurrence" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Last Follow-Up Status "></asp:Label><br/>
  

<table cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="StatusTable">     
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;FU Type</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; color: #8d2a2c;" >Status</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
 
  <tr>    
    <td height="28" class="ClinicalEformPopulatedColumn" style="white-space: nowrap;">Last Seen by DMT</td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="11"  ID="StatusDateText_11" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="11"  ID="StatusDate_11" Table="Status" Field="StatusDate" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="11" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_11"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="11" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_11"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="120px" RecordId="11" TABLE="Status" FIELD="Status"  ID="Status_11" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Text="Alive" Value="Alive"></asp:ListItem>
            <asp:ListItem Text="Alive with Disease" Value="Alive with Disease"></asp:ListItem>
            <asp:ListItem Text="No Evidence of Disease" Value="No Evidence of Disease"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformTextBox Width="150px" RecordId="11" TABLE="Status" FIELD="StatusNotes"  ID="StatusNotes_11" Runat="server" ShowTextEditor="true" /></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_11" runat="server"/>
    </td> 
  </tr>   
  <tr>    
    <td height="28" class="ClinicalEformPopulatedColumn" style="white-space: nowrap;">Last Seen by Outside Physician</td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="12"  ID="StatusDateText_12" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="12"  ID="StatusDate_12" Table="Status" Field="StatusDate" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="12" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_12"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="12" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_12"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="120px" RecordId="12" TABLE="Status" FIELD="Status"  ID="Status_12" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Text="Alive" Value="Alive"></asp:ListItem>
            <asp:ListItem Text="Alive with Disease" Value="Alive with Disease"></asp:ListItem>
            <asp:ListItem Text="No Evidence of Disease" Value="No Evidence of Disease"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformTextBox Width="150px" RecordId="12" TABLE="Status" FIELD="StatusNotes"  ID="StatusNotes_12" Runat="server" ShowTextEditor="true" /></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_12" runat="server"/>
    </td> 
  </tr>   
  <tr>    
    <td height="28" class="ClinicalEformPopulatedColumn" style="white-space: nowrap;">Last Follow up by Patient Letter</td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="13"  ID="StatusDateText_13" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="13"  ID="StatusDate_13" Table="Status" Field="StatusDate" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="13" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_13"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="13" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_13"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="120px" RecordId="13" TABLE="Status" FIELD="Status"  ID="Status_13" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Text="Alive" Value="Alive"></asp:ListItem>
            <asp:ListItem Text="Alive with Disease" Value="Alive with Disease"></asp:ListItem>
            <asp:ListItem Text="No Evidence of Disease" Value="No Evidence of Disease"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformTextBox Width="150px" RecordId="13" TABLE="Status" FIELD="StatusNotes"  ID="StatusNotes_13" Runat="server" ShowTextEditor="true" /></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_13" runat="server"/>
    </td> 
  </tr>   
  <tr>    
    <td height="28" class="ClinicalEformPopulatedColumn" style="white-space: nowrap;">Last Seen by non-DMT MSKCC Physician</td>
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="14"  ID="StatusDateText_14" TABLE="Status" FIELD="StatusDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="14"  ID="StatusDate_14" Table="Status" Field="StatusDate" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="14" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_14"  />
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="14" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_14"  /></td>
        
    <td align="left" style="white-space: nowrap;" >
        <euc:EformDropDownList Width="120px" RecordId="14" TABLE="Status" FIELD="Status"  ID="Status_14" Runat="server" ShowEmptyListItem="true" >
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Text="Alive" Value="Alive"></asp:ListItem>
            <asp:ListItem Text="Alive with Disease" Value="Alive with Disease"></asp:ListItem>
            <asp:ListItem Text="No Evidence of Disease" Value="No Evidence of Disease"></asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="left" style="white-space: nowrap;" >
        <euc:EformTextBox Width="150px" RecordId="14" TABLE="Status" FIELD="StatusNotes"  ID="StatusNotes_14" Runat="server" ShowTextEditor="true" /></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_14" runat="server"/>
    </td> 
  </tr>   

  <tr>    
    <td height="28" class="ClinicalEformPopulatedColumn" style="white-space: nowrap;" >
        <span class="controlBoxTitle">Discharged from Practice?
        <euc:EformCheckBox RecordId="1" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_1" Value="Discharged from Practice" /></span></td>
    
    <td align="left" style="white-space: nowrap;" class="ClinicalEformPopulatedColumn" >        
        <euc:EformTextBox Width="80px" RecordId="1"  ID="ActionDateText_1" TABLE="Actions" FIELD="ActionDateText" Runat="server"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden               RecordId="1"  ID="ActionDate_1" Table="Actions" Field="ActionDate" Runat="server" /></td>
        
    <td align="left" style="white-space: nowrap;" ></td>
    <td align="left" style="white-space: nowrap;" ></td>
            
    <td align="left" style="white-space: nowrap;"><euc:EformDeleteIcon ID="EformDeleteIcon_1a" runat="server"/>
    </td> 
  </tr>   

  
  
</table>

<br /><br />
<span class="controlBoxTitle">Vital Status</span>
<table width="300" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DemographicsHtmlTable" >  
         
        <tr>
		    <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >Date</td>
		    <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >Cause of Death</td>
		    <td style="white-space: nowrap; " align="left" class="controlBoxDataGridTitleColumn" >Death Type</td>
		    <td class="controlBoxDataGridTitleColumn"></td>
		</tr>
		
		<tr>
		    <asp:Repeater ID="PtDemoGx" runat="server" >
                         <ItemTemplate>
                            <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Patients',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtDeathDateText,PtDeathCause,PtDeathType', 'Patients');"> 
	                           <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathDateText")%></td>
	                           <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathCause")%></td>
	                           <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathType")%></td>
                               <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
                            </tr>    
	                    </ItemTemplate>
             </asp:Repeater>
		</tr>  
		       
</table>
<br/><br/><br />

<script type="text/javascript">
    /* <![CDATA[ */
 
    addAbsentEvent('Last Seen by DMT',$('<%= StatusDateText_11.ClientID %>'),$('<%= StatusDate_11.ClientID %>'),$('<%= Status_11.ClientID %>'),$('<%= StatusNotes_11.ClientID %>'),$('<%= StatusDisease_11.ClientID %>'),$('<%= StatusQuality_11.ClientID %>'));
    addAbsentEvent('Last Seen by Outside Physician',$('<%= StatusDateText_12.ClientID %>'),$('<%= StatusDate_12.ClientID %>'),$('<%= Status_12.ClientID %>'),$('<%= StatusNotes_12.ClientID %>'),$('<%= StatusDisease_12.ClientID %>'),$('<%= StatusQuality_12.ClientID %>'));
    addAbsentEvent('Last Follow up by Patient Letter',$('<%= StatusDateText_13.ClientID %>'),$('<%= StatusDate_13.ClientID %>'),$('<%= Status_13.ClientID %>'),$('<%= StatusNotes_13.ClientID %>'),$('<%= StatusDisease_13.ClientID %>'),$('<%= StatusQuality_13.ClientID %>'));
    addAbsentEvent('Last Seen by non-DMT MSKCC Physician',$('<%= StatusDateText_14.ClientID %>'),$('<%= StatusDate_14.ClientID %>'),$('<%= Status_14.ClientID %>'),$('<%= StatusNotes_14.ClientID %>'),$('<%= StatusDisease_14.ClientID %>'),$('<%= StatusQuality_14.ClientID %>'));
   
    function addAbsentEvent(fuTypeValue,dateText,date,status,statusNotes,diseaseHidden,qualityHidden)
    {  
        $(dateText).addEvent('blur',curry(SetHiddenFields,fuTypeValue,dateText,date,status,statusNotes,diseaseHidden,qualityHidden));
        $(status).addEvent('blur',curry(SetHiddenFields,fuTypeValue,dateText,date,status,statusNotes,diseaseHidden,qualityHidden));
        $(statusNotes).addEvent('blur',curry(SetHiddenFields,fuTypeValue,dateText,date,status,statusNotes,diseaseHidden,qualityHidden));
    }

   
    /* ]]> */
    
    function SetHiddenFields(fuTypeValue,dateText,date,status,statusNotes,diseaseHidden,qualityHidden)
	{
	    if (dateText.value != '' || status.value != ''  || statusNotes.value != '' )
	    {
	        diseaseHidden.value = 'Oral Cancer';	        
	              
	        if (fuTypeValue == 'Last Seen by DMT')
	           qualityHidden.value = 'STD';
	        else if (fuTypeValue == 'Last Seen by Outside Physician')
	        {
	            qualityHidden.value = 'OUT';
	            if (status.value == '')
	                status.value = 'Alive';
	        }
	        else if (fuTypeValue == 'Last Follow up by Patient Letter')
	        {
	            qualityHidden.value = 'OUT';
	            if (status.value == '')
	                status.value = 'Alive';
	        }
	        else if (fuTypeValue == 'Last Seen by non-DMT MSKCC Physician')
	        {
	            qualityHidden.value = 'STD';
	            if (status.value == '')
	                status.value = 'Alive';
	        }
	    }
	    else
	    {
	        diseaseHidden.value = '';
	        qualityHidden.value = '';    
	    }
	}
	
	/********************************************************************************/
	/********************************************************************************/
	/********************************************************************************/

    addAbsentEvent2($('<%= ActionDateText_1.ClientID %>'),$('<%= ActionDate_1.ClientID %>'),$('<%= ActionItem_1.ClientID %>'),$('<%= StatusDate_11.ClientID %>'));
   
    function addAbsentEvent2(dateText,date,actionItemCB,DMTDate)
    {  
        $(dateText).addEvent('blur',curry(SetHiddenFields2,dateText,date,actionItemCB,DMTDate));
        $(actionItemCB).addEvent('click',curry(SetHiddenFields2,dateText,date,actionItemCB,DMTDate));

        
    }   
    /* ]]> */
    
    function SetHiddenFields2(dateText,date,actionItemCB,DMTDate)
	{       
        if (actionItemCB.checked)
        {
            if (dateText.value == '')
            {
                dateText.value = DMTDate.value;
                date.value = DMTDate.value;
            }
        }
        else
        {
            dateText.value = '';
            date.value = '';            
        }
	}

</script>