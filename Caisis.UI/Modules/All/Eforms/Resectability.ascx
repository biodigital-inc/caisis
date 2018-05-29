<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Resectability" CodeFile="Resectability.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="Resectability" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Resectability"></asp:Label><br/>
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsFindingsHtmlTable">
  <tr> 
    <td width="12%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Study Performed</td>
    <td width="25%" class="controlBoxDataGridHeaderFirstCol">Results</td>
    <td width="35%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
   
  
  
  <tr align="left"> 
      <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="20"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="20" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
   
      <td style="white-space: nowrap;" valign="top">
		<euc:EformExtendedCheckBoxList RecordId="20" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1" RepeatDirection="Horizontal">
		    <asp:ListItem Value="CT" Text="CT"  />
		    <asp:ListItem Value="MRI" Text="MRI"  />
		</euc:EformExtendedCheckBoxList></td>
 
        <td align="left" style="white-space: nowrap;" valign="top">
		    <euc:EformComboBox DropDownWidth="auto" LookupCode="DxResult" style="width:140px;" Field="DxResult" RecordId="20" Table="Diagnostics" Runat="server" id="DxResult_1"  />
	    </td>		

        <td align="center" valign="top">
		    <euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_1" ShowTextEditor="true"/>
	    </td>	 
  
  </tr>
  
  <tr>
    <td valign="top" colspan="4" style="padding-left: 40px;" >
    
        <strong>Resectability</strong>
        <table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsFindingsHtmlTable2">
         
          <tr align="left"> 
         
   		         <td valign="top"><strong>&nbsp;Site&nbsp;</strong><br />
		            <euc:EformComboBox DropDownWidth="200px"  RecordId="1" ParentRecordId="20" style="width:100px;" TABLE="DxImageFindings" FIELD="ImgFindSite" Runat="server" ID="ImgFindSite" LookupCode="ImgFindSite"/>
	            </td>	
        	    
             <td align="left" style="white-space: nowrap;" valign="top">

		        <euc:EformHidden RecordId="1" ParentRecordId="20" Runat="server" ID="ImgFindStatus" Table="DxImageFindings" Field="ImgFindStatus" Value="Resectability" ></euc:EformHidden>
                <strong>
  		            <euc:EformExtendedRadioButtonList RecordId="1" ParentRecordId="20" TABLE="DxImageFindings" FIELD="ImgFindResult" Runat="server" ID="ImgFindResult" CellSpacing="2" CellPadding="2" RepeatDirection="Vertical" RepeatLayout="flow" EnableHiddenOnUIEvent="ImgFindStatus">
		                <asp:ListItem Value="Resectable" Text="Resectable"  />
		                <asp:ListItem Value="Borderline resectable" Text="Borderline resectable"  />
		                <asp:ListItem Value="Unresectable" Text="Unresectable"  />
		            </euc:EformExtendedRadioButtonList>
		        </strong></td>
        		
                <td valign="top"><strong>&nbsp;Notes&nbsp;</strong><br />
		            <euc:EformTextBox RecordId="1" ParentRecordId="20" ShowCalendar="False" CalcDate="False" style="width:100px;" TABLE="DxImageFindings" FIELD="ImgFindNotes" Runat="server" ID="ImgFindNotes" ShowTextEditor="true"/>
	            </td>	

          </tr>
          
            <tr  align="left" style="white-space: nowrap;"> 


            </tr>
          
        </table>
    
    </td>
  </tr>
  
</table>
<br/><br/><br/>
