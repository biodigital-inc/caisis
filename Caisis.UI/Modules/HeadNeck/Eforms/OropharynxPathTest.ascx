<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxPathTest" CodeFile="OropharynxPathTest.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<script type="text/javascript" language="javascript">
	tableArray.OropharynxPathTestHtmlTable = "OropharynxPathTestHtmlTable";
</script>

<a name="OropharynxPathTest" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology Tests"></asp:Label><br/>
<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="OropharynxPathTestHtmlTable" > 
  <tr>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Test</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Date</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Result</td>
	    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>        
  </tr>  
    <tr>
       <td align="left" valign="top" style="white-space: nowrap">     
               <euc:EformCheckBox RecordId="1" ParentRecordId="16"  TABLE="PathTest" FIELD="PathTest" ID="PathTest_1" Value="HPV" Runat="server"  TabIndex="2"  />HPV</td>

        <td align="left" valign="top" style="white-space: nowrap">
                <euc:EformTextBox  Width="100px" RecordId="1" ParentRecordId="16"   TABLE="PathTest" FIELD="PathDateText" ID="PathTestDateText_1" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="1" ParentRecordId="16"  TABLE="PathTest" FIELD="PathDate"     ID="PathTestDate_1"     Runat="server"/></td>

        <td align="left" valign="top" style="white-space: nowrap">
            <euc:EformRadioButtonList TABLE="NoTable" FIELD="PathResultType" ID="PathResultType_1" Runat="server"  
                TabIndex="2" RepeatDirection="Horizontal" style="white-space: nowrap;" >
                <asp:ListItem Value="Positive" Text="Positive"></asp:ListItem>
                <asp:ListItem Value="Negative" Text="Negative"></asp:ListItem>
                <asp:ListItem Value="Not Done" Text="Not Done"></asp:ListItem>
            </euc:EformRadioButtonList></td>
         
          
        <td align="left" valign="top" style="white-space: nowrap; ">
            <div id="ResultDiv_1" runat="server" style="display: none; ">
                <euc:EformComboBox Width="80px" RecordId="1" ParentRecordId="16"  TABLE="PathTest" FIELD="PathResult" ID="PathResult_1" LookupCode="PathResult,Disease,HeadNeck" Runat="server"  TabIndex="2"  />
            </div></td>
        
    </tr>
    
    <tr>
       <td align="left" valign="top" style="white-space: nowrap"> 
               <euc:EformCheckBox RecordId="2" ParentRecordId="16"  TABLE="PathTest" FIELD="PathTest" ID="PathTest_2" Value="P16" Runat="server"  TabIndex="2"  />P16</td>

        <td align="left" valign="top" style="white-space: nowrap">
                <euc:EformTextBox Width="100px" RecordId="2" ParentRecordId="16"   TABLE="PathTest" FIELD="PathDateText" ID="PathDateText_2" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="2" ParentRecordId="16"  TABLE="PathTest" FIELD="PathDate"     ID="PathDate_2"     Runat="server"/></td>

        <td align="left" valign="top" style="white-space: nowrap">
            <euc:EformRadioButtonList RecordId="2" ParentRecordId="16"  TABLE="PathTest" FIELD="PathResult" ID="PathResult_2" Runat="server"  
                TabIndex="2" RepeatDirection="Horizontal" style="white-space: nowrap;" >
                <asp:ListItem Value="Positive" Text="Positive"></asp:ListItem>
                <asp:ListItem Value="Negative" Text="Negative"></asp:ListItem>
                <asp:ListItem Value="Not Done" Text="Not Done"></asp:ListItem>
            </euc:EformRadioButtonList></td>         
          
        <td align="left" valign="top" style="white-space: nowrap; "></td>
        
    </tr>
    <tr style="display: none;">
       <td align="left" valign="top" style="white-space: nowrap"> 
               <euc:EformComboBox Width="100px" RecordId="3" ParentRecordId="16"  TABLE="PathTest" FIELD="PathTest" ID="PathTest_3" LookupCode="PathTest,Disease,HeadNeck" Runat="server"  TabIndex="2"  /></td>

        <td align="left" valign="top" style="white-space: nowrap">
                <euc:EformTextBox Width="100px" RecordId="3" ParentRecordId="16"   TABLE="PathTest" FIELD="PathDateText" ID="PathDateText_3" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="3" ParentRecordId="16"  TABLE="PathTest" FIELD="PathDate"     ID="PathDate_3"     Runat="server"/></td>

        <td align="left" valign="top" style="white-space: nowrap">
            <euc:EformRadioButtonList RecordId="3" ParentRecordId="16"  TABLE="PathTest" FIELD="PathResult" ID="PathResult_3" Runat="server"  
                TabIndex="2" RepeatDirection="Horizontal" style="white-space: nowrap;" >
                <asp:ListItem Value="Positive" Text="Positive"></asp:ListItem>
                <asp:ListItem Value="Negative" Text="Negative"></asp:ListItem>
                <asp:ListItem Value="Not Done" Text="Not Done"></asp:ListItem>
            </euc:EformRadioButtonList></td>         
          
        <td align="left" valign="top" style="white-space: nowrap; "></td>
        
    </tr>
    <tr style="display: none;">
       <td align="left" valign="top" style="white-space: nowrap"> 
               <euc:EformComboBox Width="100px" RecordId="4" ParentRecordId="16"  TABLE="PathTest" FIELD="PathTest" ID="PathTest_4" LookupCode="PathTest,Disease,HeadNeck" Runat="server"  TabIndex="2"  /></td>

        <td align="left" valign="top" style="white-space: nowrap">
                <euc:EformTextBox Width="100px" RecordId="4" ParentRecordId="16"   TABLE="PathTest" FIELD="PathDateText" ID="PathDateText_4" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="4" ParentRecordId="16"  TABLE="PathTest" FIELD="PathDate"     ID="PathDate_4"     Runat="server"/></td>

        <td align="left" valign="top" style="white-space: nowrap">
            <euc:EformRadioButtonList RecordId="4" ParentRecordId="16"  TABLE="PathTest" FIELD="PathResult" ID="PathResult_4" Runat="server"  
                TabIndex="2" RepeatDirection="Horizontal" style="white-space: nowrap;" >
                <asp:ListItem Value="Positive" Text="Positive"></asp:ListItem>
                <asp:ListItem Value="Negative" Text="Negative"></asp:ListItem>
                <asp:ListItem Value="Not Done" Text="Not Done"></asp:ListItem>
            </euc:EformRadioButtonList></td>         
          
        <td align="left" valign="top" style="white-space: nowrap; "></td>
        
    </tr>
    <tr style="display: none;">
       <td align="left" valign="top" style="white-space: nowrap"> 
               <euc:EformComboBox Width="100px" RecordId="5" ParentRecordId="16"  TABLE="PathTest" FIELD="PathTest" ID="PathTest_5" LookupCode="PathTest,Disease,HeadNeck" Runat="server"  TabIndex="2"  /></td>

        <td align="left" valign="top" style="white-space: nowrap">
                <euc:EformTextBox Width="100px" RecordId="5" ParentRecordId="16"   TABLE="PathTest" FIELD="PathDateText" ID="PathDateText_5" Runat="server" TabIndex="1"  ShowCalendar="true" CalcDate="true" />
				<euc:EformHidden                 RecordId="5" ParentRecordId="16"  TABLE="PathTest" FIELD="PathDate"     ID="PathDate_5"     Runat="server"/></td>

        <td align="left" valign="top" style="white-space: nowrap">
            <euc:EformRadioButtonList RecordId="5" ParentRecordId="16"  TABLE="PathTest" FIELD="PathResult" ID="PathResult_5" Runat="server"  
                TabIndex="2" RepeatDirection="Horizontal" style="white-space: nowrap;" >
                <asp:ListItem Value="Positive" Text="Positive"></asp:ListItem>
                <asp:ListItem Value="Negative" Text="Negative"></asp:ListItem>
                <asp:ListItem Value="Not Done" Text="Not Done"></asp:ListItem>
            </euc:EformRadioButtonList></td>         
          
        <td align="left" valign="top" style="white-space: nowrap; "></td>
        
    </tr>


</table>
<img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'OropharynxPathTestHtmlTable');" />
<br /><br /><br />

<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds events to controls
    function addEvents(pathResultType,pathResult,resultDiv)
    { 
        $(pathResultType).addEvent('click',curry(SetHiddenFields,pathResultType,pathResult,resultDiv));
        ShowResultsOnLoad();
    }

    addEvents($('<%= PathResultType_1.ClientID %>'),$('<%= PathResult_1.ClientID %>'),$('<%= ResultDiv_1.ClientID %>'));
 
    /* ]]> */
    
    function SetHiddenFields(pathResultType,pathResult,resultDiv)
    {
        SetHPVFields(pathResultType,pathResult,resultDiv);

    }
    
    function SetHPVFields(pathResultType,pathResult,resultDiv)
    {
        var radioList = pathResultType.getElementsByTagName('input');

      for (var i = 0; i < radioList.length; i ++) {
      
        if (radioList[i].checked) 
        {
         
          if (radioList[i].value == 'Positive'){
            pathResult.value = '';
            resultDiv.style.display = 'block';
          }
         else if (radioList[i].value == 'Negative'){
            resultDiv.style.display = 'none';
            pathResult.value = radioList[i].value;
          }
         else if (radioList[i].value == 'Not Done'){
            resultDiv.style.display = 'none';
            pathResult.value = radioList[i].value;
          }
         else {
            pathResult.style.display = 'none';
            pathResult.value = '';
          }
        }
        
      }
    }
	
   function  ShowResultsOnLoad()
   {
     var resultObj = document.getElementById('<%= ResultDiv_1.ClientID %>');
     var typeObj = document.getElementById('<%= PathResultType_1.ClientID %>');
     var radioList = typeObj.getElementsByTagName('input');

     for (var i = 0; i < radioList.length; i ++) {
      
        if (radioList[i].checked) 
        {          
          if (radioList[i].value == 'Positive'){
                    
            resultObj.style.display = 'block';
          }
        }
     }
   }
   	
</script>