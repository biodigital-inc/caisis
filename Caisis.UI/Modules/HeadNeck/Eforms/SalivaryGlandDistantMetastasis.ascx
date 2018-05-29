<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandDistantMetastasis" CodeFile="SalivaryGlandDistantMetastasis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="SalivaryGlandDistantMetastasis" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text=""></asp:Label><br/>

<table width="200" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable" id="DistantMetastasisHtmlTable">
    <tr>
        <td style="white-space: nowrap;">
            <span class="controlBoxTitle">Distant Metastasis ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="DistantMetastasisRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" Table="NoTable" Field="DistantMetastasisRecorded">
                <asp:ListItem Value="Yes" Text="Yes"></asp:ListItem>
                <asp:ListItem Value="No" Text="No"></asp:ListItem>
            </euc:EformRadioButtonList>       
            
            <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ID="Status_1" TABLE="Status" FIELD="Status" />  		       
            <euc:EformTextBox Width="1px" style="display: none;" Runat="server" RecordId="1" ID="StatusDisease_1" TABLE="Status" FIELD="StatusDisease" />  		       
        </td>
    </tr>    
</table>
<br /><br />

<div id="DistantMetastasisDiv" runat="server" style="display: none;">
    <table cellpadding="5" cellspacing="0" class="ClinicalEformTable">
        <tr>
            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
           <td class="controlBoxDataGridHeaderFirstCol"  style="text-align: left;">Notes</td>
        </tr>
        <tr >
             <td style="white-space: nowrap;" valign="top" align="left">
                    <euc:EformTextBox Width="80px" Runat="server" RecordId="1" ID="StatusDateText_1" TABLE="Status" FIELD="StatusDateText" ShowCalendar="true" CalcDate="true" />  		    
                    <euc:EformHidden Runat="server" RecordId="1" ID="StatusDate_1" TABLE="Status" FIELD="StatusDate" />	
            </td>
            <td style="white-space: nowrap;" valign="top" align="left">
               <euc:EformTextArea Rows="1" Width="200px" Runat="server" RecordId="1" ID="StatusNotes_1" TABLE="Status" FIELD="StatusNotes" ShowTextEditor="true" />  		    
            </td>
        </tr>
    </table>
</div>



<br/><br/><br/>

  <script type="text/javascript">
    
     addAbsentEvent1($('<%= DistantMetastasisRecorded.ClientID %>'),$('<%= DistantMetastasisDiv.ClientID %>'),$('<%= Status_1.ClientID %>'),$('<%= StatusDateText_1.ClientID %>'),$('<%= StatusDate_1.ClientID %>'),$('<%= StatusNotes_1.ClientID %>'),$('<%= StatusDisease_1.ClientID %>'));

    function addAbsentEvent1(distantMetRecorded,distantMetDiv,status,dateText,date,notes,disease)
    {  
        $(distantMetRecorded).addEvent('click',curry(SetHiddenFields1,distantMetRecorded,distantMetDiv,status,dateText,date,notes,disease));
       
        // show on load as well
        SetHiddenFields1(distantMetRecorded,distantMetDiv,status,dateText,date,notes,disease);
    }
    	
	function SetHiddenFields1(distantMetRecorded,distantMetDiv,status,dateText,date,notes,disease)
    { 
        var rblRef = distantMetRecorded.getElementsByTagName('input');   

        status.value = '';
        disease.value = '';

        for (var i = 0; i < rblRef.length; i++)
            if (rblRef[i].checked)
            {
               if (rblRef[i].value == "No")
               {
                    dateText.value = '';
                    date.value = '';
                    notes.value = '';                        
                    distantMetDiv.style.display = 'none';
                    
              }
               else
               {
                    distantMetDiv.style.display = 'block';
                    status.value = 'Distant Metastasis';
                    disease.value = 'Salivary Cancer';
               }
               
               
            }
     }   
</script>
