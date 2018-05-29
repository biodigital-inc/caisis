<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Liver.Eforms.LiverSurgeryImaging" CodeFile="LiverSurgeryImaging.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript" type="text/javascript">
	tableArray.ImagingLiverHtmlTable1 = "ImagingLiverHtmlTable1";



</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />

<a name="LiverSurgeryImaging" /><br/>


<table class="eformLargePopulatedTableBlue">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Imaging"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="ImagingRecorded" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="ImagingRecorded">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Unknown</asp:ListItem>
                <asp:ListItem>N/A</asp:ListItem>
           </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="ImagingAbsentDiv" runat="server" style="display: none;" >
<br /><br /> 
    <table class="eformLargePopulatedTable">
        <tr>
           <td><strong> <asp:Label ID="AbsentEventPrefix" runat="server" /></strong></td>
           <td height="28" ><strong> Date </strong>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_6"
                runat="server" Width="100px" ShowCalendar="true" CalcDate="true" />
            <euc:EformTextBox RecordId="6" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_6"
                Runat="server" Width="1px" Style="display: none;" /></td>
            <td>(Optional)</td>
       </tr>
</table>

</div>
                 
<div id="ImagingDiv" runat="server" style="display: none;">

<br /><br />
<table  border="0" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="Table12">
          
    <asp:Repeater ID="ImagingHx" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound"   > 
	    <HeaderTemplate>
		    <tr  ><td align="center" colspan="6"><i> <asp:Literal ID="MostRecentMsg" Runat="server" Visible="false" Text="most recent 10" /></i></td></tr>	    
	    </HeaderTemplate>	    
	<ItemTemplate> 
	    
         <tr class="controlBoxDataGridTitleColumn" >
			    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"  >&nbsp;Date</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Result</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Scan Type</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;# of tumors</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;Institution</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;</td>
        </tr>
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Diagnostics',  <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxResult,DxType,DxTotalNumTumors,DxInstitution,DxNotes', 'Diagnostics');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText")%></td>
		   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxResult")%></td>
		   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType")%></td>
		   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxTotalNumTumors")%></td>
		   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxInstitution")%></td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>    
    		
		    <asp:Repeater ID="ImagingFindingHx" runat="server" OnItemDataBound="dxFindingsEFormRepeaterOnDataBound" > 
		        <HeaderTemplate>
	            <tr class="controlBoxDataGridTitleColumn">
	                <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;Finding</td>
                    <td colspan="2" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Location</td>
                    <td colspan="1" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Size (cm) </td>
                    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" ></td>
                 </tr>		    
		        </HeaderTemplate>
                <ItemTemplate> 
		        <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('DxImageFindings', <%# DataBinder.Eval(Container.DataItem, "DxImageFindingId") %>, 'ImgFindResult,ImgFindSubsite,ImgFindWidth', 'DxImageFindings');"> 
		           <td colspan="2" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ImgFindResult")%></td>
		           <td colspan="2" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ImgFindSubsite")%></td>
		           <td colspan="1" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ImgFindWidth")%></td>
			       <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		        </tr>   
                </ItemTemplate>
                <FooterTemplate>
                    <tr><td align="center" colspan="6"><i> <asp:Literal ID="NoFindingsMsg" Runat="server" Visible="false" Text="no findings found" /></i></td></tr>
                </FooterTemplate>
            </asp:Repeater>  
    
    <tr>
        <td style="text-align: left;" colspan="6" height="30px" >&nbsp;</td>
    </tr>
    
	</ItemTemplate>
  </asp:Repeater>
  

  <tr id="NoImagingHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No imaging history exists for this patient.</td>
  </tr>  

</table>

<br /><br />
<table width="300" cellpadding="0" cellspacing="0" class="ClinicalEformTable" id="ImagingLiverHtmlTable1">
 
  
   <tr style="padding-bottom: 20px; ">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTable1a" >
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="1"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"  />
                <euc:EformHidden RecordId="1" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="1" Table="Diagnostics" id="DxResult_1" LookupCode="DxResult,Disease,Liver" Runat="server" /></td>

         
         
            <td style="white-space: nowrap;" colspan="1" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="1"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1" LookupCode="DxType,Disease,Liver"/></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors<br /></strong>
                    <div style="padding-left: 10px;">
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" Runat="server" ID="DxTarget_1" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_1" RecordId="1" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>

            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		        <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="1" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_1" LookupCode="Institution,Disease,Liver" Runat="server" /></td>

            
            </tr> 
           <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_a">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_a" RecordID="1"  ParentRecordId="1" Runat="server" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_a" RecordId="1" ParentRecordId="1" Runat="server" /></td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_a" RecordID="1"  ParentRecordId="1" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_a" RecordID="1"  ParentRecordId="1" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_a" RecordId="2"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_a" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "   Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_a" RecordId="2" ParentRecordId="1" Runat="server" /></td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_a" RecordId="2"  ParentRecordId="1" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_a" RecordId="2"  ParentRecordId="1" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_a" RecordId="3"  ParentRecordId="1" Runat="server"  Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "   Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_a" RecordId="3" ParentRecordId="1" Runat="server"  /></td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_a" RecordId="3"  ParentRecordId="1" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_a" RecordId="3"  ParentRecordId="1" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_a" RecordId="8"  ParentRecordId="1" Runat="server" Value="Liver" />Lymphadenopathy
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_a" RecordId="8" ParentRecordId="1" Runat="server"  /> </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none; " LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_a" RecordId="8"  ParentRecordId="1" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;"  TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_a" RecordId="8"  ParentRecordId="1" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_a" RecordId="6"  ParentRecordId="1" Runat="server"  Value="Liver" />Vascular invasion
    		                    <euc:EformTextBox Width="1px" style="display: none; "  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_a" RecordId="6" ParentRecordId="1" Runat="server" /> </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none; " LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_a" RecordId="6"  ParentRecordId="1" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_a" RecordId="7"  ParentRecordId="1" Runat="server" Value="Liver" />Ascites
    		                    <euc:EformTextBox Width="1px" style="display: none; "  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_a" RecordId="7" ParentRecordId="1" Runat="server"  /></td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none; " LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_a" RecordId="7"  ParentRecordId="1" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_a" RecordId="9" ParentRecordId="1" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9_a" RecordId="9"  ParentRecordId="1" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    
                
                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_a">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="1"  ID="DxNotes_1" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top" >      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_a">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_a" RecordId="10"  ParentRecordId="1" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_a" RecordId="10" ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_a" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_a" RecordId="10"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_a" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_a" RecordId="10"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_a" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_a" RecordId="11"  ParentRecordId="1" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_a" RecordId="11" ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_a" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_a" RecordId="11"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_a" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_a" RecordId="11"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_a" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_a" RecordId="12"  ParentRecordId="1" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_a" RecordId="12" ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_a" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_a" RecordId="12"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_a" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_a" RecordId="12"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_a" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_a" RecordId="13"  ParentRecordId="1" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_a" RecordId="13" ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_a" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_a" RecordId="13"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_a" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_a" RecordId="13"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_a" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_a" RecordId="14"  ParentRecordId="1" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_a" RecordId="14" ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_a" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_a" RecordId="14"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_a" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_a" RecordId="14"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_a" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_a" RecordId="15"  ParentRecordId="1" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_a" RecordId="15" ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_a" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_a" RecordId="15"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_a" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_a" RecordId="15"  ParentRecordId="1" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_a" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>    
            
    
        </table>
    </td>
   </tr>

   <tr style="padding-bottom: 20px; display: none;">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTable2">
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="2"  ID="DxDateText_2" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"  />
                <euc:EformHidden RecordId="2" Runat="server" ID="DxDate_2" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="2" Table="Diagnostics" id="DxResult_2" LookupCode="DxResult,Disease,Liver" Runat="server" /></td>

         
         
            <td align="left" style="white-space: nowrap;" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="2"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_2" LookupCode="DxType,Disease,Liver"/></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors</strong>
                    <div style="padding-left: 10px;">
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" Runat="server" ID="DxTarget_2" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_2" RecordId="2" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>

            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		        <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="2" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_2" LookupCode="Institution,Disease,Liver" Runat="server" /></td>
            
            </tr> 
            
            <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_b">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_b" RecordID="1"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_1_b" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_b" RecordId="1" ParentRecordId="2" Runat="server"  /></td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_b" RecordID="1"  ParentRecordId="2" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_b" RecordID="1"  ParentRecordId="2" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_b" RecordId="2"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_b" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_b" RecordId="2" ParentRecordId="2" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_b" RecordId="2"  ParentRecordId="2" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_b" RecordId="2"  ParentRecordId="2" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_b" RecordId="3"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_3_b" Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_b" RecordId="3" ParentRecordId="2" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_b" RecordId="3"  ParentRecordId="2" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_b" RecordId="3"  ParentRecordId="2" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_b" RecordId="8"  ParentRecordId="2" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_b" RecordId="8" ParentRecordId="2" Runat="server" />Lymphadenopathy </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_b" RecordId="8"  ParentRecordId="2" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_b" RecordId="8"  ParentRecordId="2" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_b" RecordId="6"  ParentRecordId="2" Runat="server"  Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_b" RecordId="6" ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_6_b" />Vascular invasion </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_b" RecordId="6"  ParentRecordId="2" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_b" RecordId="7"  ParentRecordId="2" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_b" RecordId="7" ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_7_b" />Ascites</td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_b" RecordId="7"  ParentRecordId="2" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_b" RecordId="9" ParentRecordId="2" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9_b" RecordId="9"  ParentRecordId="2" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    

                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="Table1">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="2"  ID="DxNotes_2" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top" >      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_b">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_b" RecordId="10"  ParentRecordId="2" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_b" RecordId="10" ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_b" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_b" RecordId="10"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_b" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_b" RecordId="10"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_b" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_b" RecordId="11"  ParentRecordId="2" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_b" RecordId="11" ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_b" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_b" RecordId="11"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_b" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_b" RecordId="11"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_b" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_b" RecordId="12"  ParentRecordId="2" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_b" RecordId="12" ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_b" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_b" RecordId="12"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_b" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_b" RecordId="12"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_b" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_b" RecordId="13"  ParentRecordId="2" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_b" RecordId="13" ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_b" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_b" RecordId="13"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_b" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_b" RecordId="13"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_b" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_b" RecordId="14"  ParentRecordId="2" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_b" RecordId="14" ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_b" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_b" RecordId="14"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_b" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_b" RecordId="14"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_b" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_b" RecordId="15"  ParentRecordId="2" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_b" RecordId="15" ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_b" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_b" RecordId="15"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_b" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_b" RecordId="15"  ParentRecordId="2" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_b" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>            
            </table>
    </td>
   </tr>

   <tr style="padding-bottom: 20px; display: none;">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTable3">
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="3"  ID="DxDateText_3" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"  />
                <euc:EformHidden RecordId="3" Runat="server" ID="DxDate_3" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="3" Table="Diagnostics" id="DxResult_3" LookupCode="DxResult,Disease,Liver" Runat="server" /></td>

         
         
            <td style="white-space: nowrap;" colspan="1" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="3"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_3" LookupCode="DxType,Disease,Liver"/></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors</strong>
                    <div style="padding-left: 10px;">
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" Runat="server" ID="DxTarget_3" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_3" RecordId="3" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>

                <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		            <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="3" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_3" LookupCode="Institution,Disease,Liver" Runat="server" /></td>
            
            </tr> 
            
            <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_c">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_c" RecordID="1"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_1_c" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_c" RecordId="1" ParentRecordId="3" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_c" RecordID="1"  ParentRecordId="3" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_c" RecordID="1"  ParentRecordId="3" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_c" RecordId="2"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_c" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_c" RecordId="2" ParentRecordId="3" Runat="server"  /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_c" RecordId="2"  ParentRecordId="3" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_c" RecordId="2"  ParentRecordId="3" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_c" RecordId="3"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_3_c" Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_c" RecordId="3" ParentRecordId="3" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_c" RecordId="3"  ParentRecordId="3" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_c" RecordId="3"  ParentRecordId="3" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_c" RecordId="8"  ParentRecordId="3" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_c" RecordId="8" ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_8_c" />Lymphadenopathy </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_c" RecordId="8"  ParentRecordId="3" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_c" RecordId="8"  ParentRecordId="3" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_c" RecordId="6"  ParentRecordId="3" Runat="server"  Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_c" RecordId="6" ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_6_c" />Vascular invasion </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_c" RecordId="6"  ParentRecordId="3" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_c" RecordId="7"  ParentRecordId="3" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_c" RecordId="7" ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_7_c" />Ascites</td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_c" RecordId="7"  ParentRecordId="3" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_c" RecordId="9" ParentRecordId="3" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9_c" RecordId="9"  ParentRecordId="3" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    

                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="Table2">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="3"  ID="DxNotes_3" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top">      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_c">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_c" RecordId="10"  ParentRecordId="3" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_c" RecordId="10" ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_c" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_c" RecordId="10"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_c" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_c" RecordId="10"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_c" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_c" RecordId="11"  ParentRecordId="3" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_c" RecordId="11" ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_c" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_c" RecordId="11"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_c" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_c" RecordId="11"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_c" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_c" RecordId="12"  ParentRecordId="3" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_c" RecordId="12" ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_c" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_c" RecordId="12"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_c" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_c" RecordId="12"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_c" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_c" RecordId="13"  ParentRecordId="3" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_c" RecordId="13" ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_c" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_c" RecordId="13"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_c" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_c" RecordId="13"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_c" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_c" RecordId="14"  ParentRecordId="3" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_c" RecordId="14" ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_c" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_c" RecordId="14"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_c" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_c" RecordId="14"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_c" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_c" RecordId="15"  ParentRecordId="3" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_c" RecordId="15" ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_c" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_c" RecordId="15"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_c" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_c" RecordId="15"  ParentRecordId="3" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_c" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>                    
            
       </table>
    </td>
   </tr>

   <tr style="padding-bottom: 20px; display: none;">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableD">
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="4"  ID="DxDateText_4" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"  />
                <euc:EformHidden RecordId="4" Runat="server" ID="DxDate_4" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="4" Table="Diagnostics" id="DxResult_4" LookupCode="DxResult,Disease,Liver" Runat="server" /></td>

         
         
            <td style="white-space: nowrap;" colspan="1" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="4"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4" LookupCode="DxType,Disease,Liver"/></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors</strong>
                    <div style="padding-left: 10px;">
                    <euc:EformHidden RecordId="4" Runat="server" ID="DxTarget_4" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_4" RecordId="4" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>

                <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		            <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="4" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_4" LookupCode="Institution,Disease,Liver" Runat="server" /></td>
            
            </tr> 
            
            <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_d">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_d" RecordID="1"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_1_d" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_d" RecordId="1" ParentRecordId="4" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_d" RecordID="1"  ParentRecordId="4" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_d" RecordID="1"  ParentRecordId="4" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_d" RecordId="2"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_d" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_d" RecordId="2" ParentRecordId="4" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_d" RecordId="2"  ParentRecordId="4" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_d" RecordId="2"  ParentRecordId="4" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_d" RecordId="3"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_3_d" Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_d" RecordId="3" ParentRecordId="4" Runat="server"   /></td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_d" RecordId="3"  ParentRecordId="4" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_d" RecordId="3"  ParentRecordId="4" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_d" RecordId="8"  ParentRecordId="4" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_d" RecordId="8" ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_8_d" />Lymphadenopathy </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_d" RecordId="8"  ParentRecordId="4" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_d" RecordId="8"  ParentRecordId="4" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_d" RecordId="6"  ParentRecordId="4" Runat="server"  Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_d" RecordId="6" ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_6_d" />Vascular invasion </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_d" RecordId="6"  ParentRecordId="4" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_d" RecordId="7"  ParentRecordId="4" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_d" RecordId="7" ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_7_d" />Ascites</td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_d" RecordId="7"  ParentRecordId="4" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_d" RecordId="9" ParentRecordId="4" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9_d" RecordId="9"  ParentRecordId="4" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    

                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="Table3">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="4"  ID="DxNotes_4" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top">      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_d">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_d" RecordId="10"  ParentRecordId="4" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_d" RecordId="10" ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_d" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_d" RecordId="10"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_d" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_d" RecordId="10"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_d" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_d" RecordId="11"  ParentRecordId="4" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_d" RecordId="11" ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_d" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_d" RecordId="11"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_d" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_d" RecordId="11"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_d" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_d" RecordId="12"  ParentRecordId="4" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_d" RecordId="12" ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_d" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_d" RecordId="12"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_d" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_d" RecordId="12"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_d" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_d" RecordId="13"  ParentRecordId="4" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_d" RecordId="13" ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_d" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_d" RecordId="13"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_d" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_d" RecordId="13"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_d" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_d" RecordId="14"  ParentRecordId="4" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_d" RecordId="14" ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_d" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_d" RecordId="14"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_d" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_d" RecordId="14"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_d" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_d" RecordId="15"  ParentRecordId="4" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_d" RecordId="15" ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_d" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_d" RecordId="15"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_d" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_d" RecordId="15"  ParentRecordId="4" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_d" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>        
            
        </table>
    </td>
   </tr>
   
   <tr style="padding-bottom: 20px; display: none;">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableE">
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="5"  ID="DxDateText_5" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"  />
                <euc:EformHidden RecordId="5" Runat="server" ID="DxDate_5" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="5" Table="Diagnostics" id="DxResult_5" LookupCode="DxResult,Disease,Liver" Runat="server" /></td>

         
         
            <td style="white-space: nowrap;" colspan="1" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="5"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5" LookupCode="DxType,Disease,Liver"/></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors</strong>
                    <div style="padding-left: 10px;">
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" Runat="server" ID="DxTarget_5" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_5" RecordId="5" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>

                <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		            <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="5" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_5" LookupCode="Institution,Disease,Liver" Runat="server" /></td>
            
            </tr> 
            
            <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_e">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_e" RecordID="1"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_1_e" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_e" RecordId="1" ParentRecordId="5" Runat="server"   /></td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_e" RecordID="1"  ParentRecordId="5" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_e" RecordID="1"  ParentRecordId="5" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_e" RecordId="2"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_e" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_e" RecordId="2" ParentRecordId="5" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_e" RecordId="2"  ParentRecordId="5" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_e" RecordId="2"  ParentRecordId="5" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_e" RecordId="3"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_3_e" Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_e" RecordId="3" ParentRecordId="5" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_e" RecordId="3"  ParentRecordId="5" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_e" RecordId="3"  ParentRecordId="5" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_e" RecordId="8"  ParentRecordId="5" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_e" RecordId="8" ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_8_e" />Lymphadenopathy </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_e" RecordId="8"  ParentRecordId="5" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_e" RecordId="8"  ParentRecordId="5" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_e" RecordId="6"  ParentRecordId="5" Runat="server"  Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_e" RecordId="6" ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_6_e" />Vascular invasion </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_e" RecordId="6"  ParentRecordId="5" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_e" RecordId="7"  ParentRecordId="5" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_e" RecordId="7" ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_7_e" />Ascites</td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_e" RecordId="7"  ParentRecordId="5" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_e" RecordId="9" ParentRecordId="5" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9_e" RecordId="9"  ParentRecordId="5" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    

                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="Table4">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="5"  ID="DxNotes_5" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top">      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_e">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_e" RecordId="10"  ParentRecordId="5" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_e" RecordId="10" ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_e" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_e" RecordId="10"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_e" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_e" RecordId="10"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_e" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_e" RecordId="11"  ParentRecordId="5" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_e" RecordId="11" ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_e" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_e" RecordId="11"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_e" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_e" RecordId="11"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_e" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_e" RecordId="12"  ParentRecordId="5" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_e" RecordId="12" ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_e" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_e" RecordId="12"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_e" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_e" RecordId="12"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_e" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_e" RecordId="13"  ParentRecordId="5" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_e" RecordId="13" ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_e" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_e" RecordId="13"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_e" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_e" RecordId="13"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_e" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_e" RecordId="14"  ParentRecordId="5" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_e" RecordId="14" ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_e" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_e" RecordId="14"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_e" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_e" RecordId="14"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_e" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_e" RecordId="15"  ParentRecordId="5" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_e" RecordId="15" ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_e" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_e" RecordId="15"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_e" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_e" RecordId="15"  ParentRecordId="5" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_e" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>        
       
       </table>
    </td>
   </tr>

   <tr style="padding-bottom: 20px; display: none;">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableF">
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="6"  ID="DxDateText_6" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"  />
                <euc:EformHidden RecordId="6" Runat="server" ID="DxDate_6" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="6" Table="Diagnostics" id="DxResult_6" LookupCode="DxResult,Disease,Liver" Runat="server" /></td>

         
         
            <td style="white-space: nowrap;" colspan="1" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="6"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_6" LookupCode="DxType,Disease,Liver"/></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors</strong>
                    <div style="padding-left: 10px;">
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" Runat="server" ID="DxTarget_6" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_6" RecordId="6" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>

                <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		            <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="6" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_6" LookupCode="Institution,Disease,Liver" Runat="server" /></td>
            
            </tr> 
            
            <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_f">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_f" RecordID="1"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_1_f" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "   Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_f" RecordId="1" ParentRecordId="6" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_f" RecordID="1"  ParentRecordId="6" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_f" RecordID="1"  ParentRecordId="6" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_f" RecordId="2"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_f" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_f" RecordId="2" ParentRecordId="6" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_f" RecordId="2"  ParentRecordId="6" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_f" RecordId="2"  ParentRecordId="6" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_f" RecordId="3"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_3_f" Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_f" RecordId="3" ParentRecordId="6" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_f" RecordId="3"  ParentRecordId="6" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_f" RecordId="3"  ParentRecordId="6" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_f" RecordId="8"  ParentRecordId="6" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_f" RecordId="8" ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_8_f" />Lymphadenopathy </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_f" RecordId="8"  ParentRecordId="6" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_f" RecordId="8"  ParentRecordId="6" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_f" RecordId="6"  ParentRecordId="6" Runat="server"  Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_f" RecordId="6" ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_6_f" />Vascular invasion </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_f" RecordId="6"  ParentRecordId="6" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_f" RecordId="7"  ParentRecordId="6" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_f" RecordId="7" ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_7_f" />Ascites</td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_f" RecordId="7"  ParentRecordId="6" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_f" RecordId="9" ParentRecordId="6" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9_f" RecordId="9"  ParentRecordId="6" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    

                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="Table5">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="6"  ID="DxNotes_6" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top">      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_f">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_f" RecordId="10"  ParentRecordId="6" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_f" RecordId="10" ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_f" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_f" RecordId="10"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_f" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_f" RecordId="10"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_f" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_f" RecordId="11"  ParentRecordId="6" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_f" RecordId="11" ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_f" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_f" RecordId="11"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_f" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_f" RecordId="11"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_f" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_f" RecordId="12"  ParentRecordId="6" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_f" RecordId="12" ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_f" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_f" RecordId="12"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_f" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_f" RecordId="12"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_f" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_f" RecordId="13"  ParentRecordId="6" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_f" RecordId="13" ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_f" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_f" RecordId="13"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_f" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_f" RecordId="13"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_f" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_f" RecordId="14"  ParentRecordId="6" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_f" RecordId="14" ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_f" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_f" RecordId="14"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_f" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_f" RecordId="14"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_f" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_f" RecordId="15"  ParentRecordId="6" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_f" RecordId="15" ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_f" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_f" RecordId="15"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_f" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_f" RecordId="15"  ParentRecordId="6" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_f" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>              
        </table>
    </td>
   </tr>

   <tr style="padding-bottom: 20px; display: none;">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableG">
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="7"  ID="DxDateText_7" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"  />
                <euc:EformHidden RecordId="7" Runat="server" ID="DxDate_7" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="7" Table="Diagnostics" id="DxResult_7" LookupCode="DxResult,Disease,Liver" Runat="server"  /></td>

         
         
            <td style="white-space: nowrap;" colspan="1" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="7"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_7" LookupCode="DxType,Disease,Liver" /></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors</strong>
                    <div style="padding-left: 10px;">
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" Runat="server" ID="DxTarget_7" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_7" RecordId="7" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>

                <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		            <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="7" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_7" LookupCode="Institution,Disease,Liver" Runat="server" /></td>
            
            </tr> 
            
            <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_g">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_g" RecordID="1"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_1_g" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_g" RecordId="1" ParentRecordId="7" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_g" RecordID="1"  ParentRecordId="7" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_g" RecordID="1"  ParentRecordId="7" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_g" RecordId="2"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_g" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_g" RecordId="2" ParentRecordId="7" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_g" RecordId="2"  ParentRecordId="7" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_g" RecordId="2"  ParentRecordId="7" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_g" RecordId="3"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_3_g" Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_g" RecordId="3" ParentRecordId="7" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_g" RecordId="3"  ParentRecordId="7" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_g" RecordId="3"  ParentRecordId="7" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_g" RecordId="8"  ParentRecordId="7" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_g" RecordId="8" ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_8_g" />Lymphadenopathy </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_g" RecordId="8"  ParentRecordId="7" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_g" RecordId="8"  ParentRecordId="7" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_g" RecordId="6"  ParentRecordId="7" Runat="server"  Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_g" RecordId="6" ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_6_g" />Vascular invasion </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_g" RecordId="6"  ParentRecordId="7" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_g" RecordId="7"  ParentRecordId="7" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_g" RecordId="7" ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_7_g" />Ascites</td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_g" RecordId="7"  ParentRecordId="7" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_g" RecordId="9" ParentRecordId="7" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9_g" RecordId="9"  ParentRecordId="7" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    

                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="Table6">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="7"  ID="DxNotes_7" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top">      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_g">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_g" RecordId="10"  ParentRecordId="7" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_g" RecordId="10" ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_g" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_g" RecordId="10"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_g" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_g" RecordId="10"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_g" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_g" RecordId="11"  ParentRecordId="7" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_g" RecordId="11" ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_g" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_g" RecordId="11"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_g" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_g" RecordId="11"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_g" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_g" RecordId="12"  ParentRecordId="7" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_g" RecordId="12" ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_g" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_g" RecordId="12"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_g" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_g" RecordId="12"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_g" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_g" RecordId="13"  ParentRecordId="7" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_g" RecordId="13" ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_g" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_g" RecordId="13"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_g" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_g" RecordId="13"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_g" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_g" RecordId="14"  ParentRecordId="7" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_g" RecordId="14" ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_g" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_g" RecordId="14"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_g" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_g" RecordId="14"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_g" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_g" RecordId="15"  ParentRecordId="7" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_g" RecordId="15" ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_g" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_g" RecordId="15"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_g" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_g" RecordId="15"  ParentRecordId="7" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_g" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>              
        </table>
    </td>
   </tr>

   <tr style="padding-bottom: 20px; display: none;">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableH">
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="8"  ID="DxDateText_8" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"  />
                <euc:EformHidden RecordId="8" Runat="server" ID="DxDate_8" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="8" Table="Diagnostics" id="DxResult_8" LookupCode="DxResult,Disease,Liver" Runat="server"  /></td>

         
         
            <td style="white-space: nowrap;" colspan="1" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="8"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_8" LookupCode="DxType,Disease,Liver" /></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors</strong>
                    <div style="padding-left: 10px;">
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" Runat="server" ID="DxTarget_8" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_8" RecordId="8" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>

                <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		            <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="8" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_8" LookupCode="Institution,Disease,Liver" Runat="server" /></td>
            
            </tr> 
            
            <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_h">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_h" RecordID="1"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_1_h" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_h" RecordId="1" ParentRecordId="8" Runat="server"   /></td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_h" RecordID="1"  ParentRecordId="8" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_h" RecordID="1"  ParentRecordId="8" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_h" RecordId="2"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_h" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_h" RecordId="2" ParentRecordId="8" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_h" RecordId="2"  ParentRecordId="8" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_h" RecordId="2"  ParentRecordId="8" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_h" RecordId="3"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_3_h" Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_h" RecordId="3" ParentRecordId="8" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_h" RecordId="3"  ParentRecordId="8" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_h" RecordId="3"  ParentRecordId="8" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_h" RecordId="8"  ParentRecordId="8" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_h" RecordId="8" ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_8_h" />Lymphadenopathy </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_h" RecordId="8"  ParentRecordId="8" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_h" RecordId="8"  ParentRecordId="8" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_h" RecordId="6"  ParentRecordId="8" Runat="server"  Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_h" RecordId="6" ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_6_h" />Vascular invasion </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_h" RecordId="6"  ParentRecordId="8" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_h" RecordId="7"  ParentRecordId="8" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_h" RecordId="7" ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_7_h" />Ascites</td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_h" RecordId="7"  ParentRecordId="8" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_h" RecordId="9" ParentRecordId="8" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9_h" RecordId="9"  ParentRecordId="8" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    

                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="Table7">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="8"  ID="DxNotes_8" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top">      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_h">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_h" RecordId="10"  ParentRecordId="8" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_h" RecordId="10" ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_h" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_h" RecordId="10"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_h" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_h" RecordId="10"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_h" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_h" RecordId="11"  ParentRecordId="8" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_h" RecordId="11" ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_h" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_h" RecordId="11"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_h" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_h" RecordId="11"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_h" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_h" RecordId="12"  ParentRecordId="8" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_h" RecordId="12" ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_h" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_h" RecordId="12"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_h" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_h" RecordId="12"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_h" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_h" RecordId="13"  ParentRecordId="8" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_h" RecordId="13" ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_h" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_h" RecordId="13"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_h" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_h" RecordId="13"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_h" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_h" RecordId="14"  ParentRecordId="8" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_h" RecordId="14" ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_h" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_h" RecordId="14"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_h" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_h" RecordId="14"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_h" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_h" RecordId="15"  ParentRecordId="8" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_h" RecordId="15" ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_h" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_h" RecordId="15"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_h" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_h" RecordId="15"  ParentRecordId="8" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_h" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>               
       </table>
    </td>
   </tr>

   <tr style="padding-bottom: 20px; display: none;">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableI">
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="9"  ID="DxDateText_9" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"  />
                <euc:EformHidden RecordId="9" Runat="server" ID="DxDate_9" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="9" Table="Diagnostics" id="DxResult_9" LookupCode="DxResult,Disease,Liver" Runat="server" /></td>

         
         
            <td style="white-space: nowrap;" colspan="1" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="9"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_9" LookupCode="DxType,Disease,Liver"/></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors</strong>
                    <div style="padding-left: 10px;">
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="9" Runat="server" ID="DxTarget_9" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_9" RecordId="9" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>

                <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		            <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="9" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_9" LookupCode="Institution,Disease,Liver" Runat="server" /></td>
            
            </tr> 
            
            <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_i">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_i" RecordID="1"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_1_i" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_i" RecordId="1" ParentRecordId="9" Runat="server"  /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_i" RecordID="1"  ParentRecordId="9" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_i" RecordID="1"  ParentRecordId="9" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_i" RecordId="2"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_i" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_i" RecordId="2" ParentRecordId="9" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_i" RecordId="2"  ParentRecordId="9" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_i" RecordId="2"  ParentRecordId="9" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_i" RecordId="3"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_3_i" Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_i" RecordId="3" ParentRecordId="9" Runat="server"  /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_i" RecordId="3"  ParentRecordId="9" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_i" RecordId="3"  ParentRecordId="9" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_i" RecordId="8"  ParentRecordId="9" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_i" RecordId="8" ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_8_i" />Lymphadenopathy </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_i" RecordId="8"  ParentRecordId="9" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_i" RecordId="8"  ParentRecordId="9" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_i" RecordId="6"  ParentRecordId="9" Runat="server"  Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_i" RecordId="6" ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_6_i" />Vascular invasion </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_i" RecordId="6"  ParentRecordId="9" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_i" RecordId="7"  ParentRecordId="9" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_i" RecordId="7" ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_7_i" />Ascites</td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_i" RecordId="7"  ParentRecordId="9" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_i" RecordId="9" ParentRecordId="9" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9_i" RecordId="9"  ParentRecordId="9" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    

                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="Table8">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="9"  ID="DxNotes_9" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top">      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_i">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_i" RecordId="10"  ParentRecordId="9" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_i" RecordId="10" ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_i" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_i" RecordId="10"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_i" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_i" RecordId="10"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_i" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_i" RecordId="11"  ParentRecordId="9" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_i" RecordId="11" ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_i" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_i" RecordId="11"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_i" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_i" RecordId="11"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_i" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_i" RecordId="12"  ParentRecordId="9" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_i" RecordId="12" ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_i" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_i" RecordId="12"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_i" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_i" RecordId="12"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_i" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_i" RecordId="13"  ParentRecordId="9" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_i" RecordId="13" ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_i" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_i" RecordId="13"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_i" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_i" RecordId="13"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_i" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_i" RecordId="14"  ParentRecordId="9" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_i" RecordId="14" ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_i" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_i" RecordId="14"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_i" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_i" RecordId="14"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_i" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_i" RecordId="15"  ParentRecordId="9" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_i" RecordId="15" ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_i" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_i" RecordId="15"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_i" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_i" RecordId="15"  ParentRecordId="9" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_i" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>             
        </table>
    </td>
   </tr>
   
   <tr style="padding-bottom: 20px; display: none;">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableJ">
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="10"  ID="DxDateText_10" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"  />
                <euc:EformHidden RecordId="10" Runat="server" ID="DxDate_10" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="10" Table="Diagnostics" id="DxResult_10" LookupCode="DxResult,Disease,Liver" Runat="server" /></td>

         
         
            <td style="white-space: nowrap;" colspan="1" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="10"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_10" LookupCode="DxType,Disease,Liver"/></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors</strong>
                    <div style="padding-left: 10px;">
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="10" Runat="server" ID="DxTarget_10" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_10" RecordId="10" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>           
 
                <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		            <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="10" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_10" LookupCode="Institution,Disease,Liver" Runat="server" /></td>
 
            </tr> 
            
            <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_j">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_j" RecordID="1"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_1_j" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_j" RecordId="1" ParentRecordId="10" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_j" RecordID="1"  ParentRecordId="10" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_j" RecordID="1"  ParentRecordId="10" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_j" RecordId="2"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_j" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_j" RecordId="2" ParentRecordId="10" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_j" RecordId="2"  ParentRecordId="10" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_j" RecordId="2"  ParentRecordId="10" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_j" RecordId="3"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_3_j" Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_j" RecordId="3" ParentRecordId="10" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_j" RecordId="3"  ParentRecordId="10" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_j" RecordId="3"  ParentRecordId="10" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_j" RecordId="8"  ParentRecordId="10" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_j" RecordId="8" ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_8_j" />Lymphadenopathy </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_j" RecordId="8"  ParentRecordId="10" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_j" RecordId="8"  ParentRecordId="10" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_j" RecordId="6"  ParentRecordId="10" Runat="server"  Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_j" RecordId="6" ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_6_j" />Vascular invasion </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_j" RecordId="6"  ParentRecordId="10" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_j" RecordId="7"  ParentRecordId="10" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_j" RecordId="7" ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_7_j" />Ascites</td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_j" RecordId="7"  ParentRecordId="10" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_j" RecordId="9" ParentRecordId="10" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" Table="DxImageFindings" Field="ImgFindSite" ID="ImgFindSite_9_j" RecordId="9"  ParentRecordId="10" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    

                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="Table9">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="10"  ID="DxNotes_10" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top">      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_j">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_j" RecordId="10"  ParentRecordId="10" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_j" RecordId="10" ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_j" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_j" RecordId="10"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_j" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_j" RecordId="10"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_j" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_j" RecordId="11"  ParentRecordId="10" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_j" RecordId="11" ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_j" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_j" RecordId="11"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_j" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_j" RecordId="11"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_j" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_j" RecordId="12"  ParentRecordId="10" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_j" RecordId="12" ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_j" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_j" RecordId="12"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_j" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_j" RecordId="12"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_j" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_j" RecordId="13"  ParentRecordId="10" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_j" RecordId="13" ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_j" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_j" RecordId="13"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_j" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_j" RecordId="13"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_j" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_j" RecordId="14"  ParentRecordId="10" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_j" RecordId="14" ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_j" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_j" RecordId="14"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_j" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_j" RecordId="14"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_j" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_j" RecordId="15"  ParentRecordId="10" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_j" RecordId="15" ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_j" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_j" RecordId="15"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_j" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_j" RecordId="15"  ParentRecordId="10" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_j" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>            
        </table>
    </td>
   </tr>
 
   <tr style="padding-bottom: 20px; display: none;">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableK">
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="11"  ID="DxDateText_11" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="11" Runat="server" ID="DxDate_11" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="11" Table="Diagnostics" id="DxResult_11" LookupCode="DxResult,Disease,Liver" Runat="server"  /></td>

         
         
            <td style="white-space: nowrap;" colspan="1" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="11"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_11" LookupCode="DxType,Disease,Liver" /></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors</strong>
                    <div style="padding-left: 10px;">
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="11" Runat="server" ID="DxTarget_11" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_11" RecordId="11" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>

                <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		            <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="11" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_11" LookupCode="Institution,Disease,Liver" Runat="server" /></td>
            
            </tr> 
            
            <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_k">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_k" RecordID="1"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_1_k" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_k" RecordId="1" ParentRecordId="11" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_k" RecordID="1"  ParentRecordId="11" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_k" RecordID="1"  ParentRecordId="11" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_k" RecordId="2"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_k" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_k" RecordId="2" ParentRecordId="11" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_k" RecordId="2"  ParentRecordId="11" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_k" RecordId="2"  ParentRecordId="11" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_k" RecordId="3"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_3_k" Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_k" RecordId="3" ParentRecordId="11" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_k" RecordId="3"  ParentRecordId="11" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_k" RecordId="3"  ParentRecordId="11" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_k" RecordId="8"  ParentRecordId="11" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_k" RecordId="8" ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_8_k" />Lymphadenopathy </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_k" RecordId="8"  ParentRecordId="11" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_k" RecordId="8"  ParentRecordId="11" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_k" RecordId="6"  ParentRecordId="11" Runat="server"  Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_k" RecordId="6" ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_6_k" />Vascular invasion </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_k" RecordId="6"  ParentRecordId="11" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_k" RecordId="7"  ParentRecordId="11" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_k" RecordId="7" ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_7_k" />Ascites</td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox Width="1px" style="display: none;"  LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_k" RecordId="7"  ParentRecordId="11" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_k" RecordId="9" ParentRecordId="11" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9_k" RecordId="9"  ParentRecordId="11" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    

                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="Table10">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="11"  ID="DxNotes_11" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top">      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_k">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_k" RecordId="10"  ParentRecordId="11" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_k" RecordId="10" ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_k" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_k" RecordId="10"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_k" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_k" RecordId="10"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_k" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_k" RecordId="11"  ParentRecordId="11" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_k" RecordId="11" ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_k" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_k" RecordId="11"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_k" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_k" RecordId="11"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_k" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_k" RecordId="12"  ParentRecordId="11" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_k" RecordId="12" ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_k" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_k" RecordId="12"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_k" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_k" RecordId="12"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_k" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_k" RecordId="13"  ParentRecordId="11" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_k" RecordId="13" ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_k" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_k" RecordId="13"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_k" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_k" RecordId="13"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_k" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_k" RecordId="14"  ParentRecordId="11" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_k" RecordId="14" ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_k" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_k" RecordId="14"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_k" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_k" RecordId="14"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_k" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_k" RecordId="15"  ParentRecordId="11" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_k" RecordId="15" ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_k" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_k" RecordId="15"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_k" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_k" RecordId="15"  ParentRecordId="11" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_k" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>              
        </table>
    </td>
   </tr>  
   
   <tr style="padding-bottom: 20px; display: none;">
    <td>
        <table border="0" cellpadding="5" cellspacing="0" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableL" >
           <tr align="left">
         
            <td height="28"  valign="top"><strong>Date&nbsp;</strong><br />
                <euc:EformTextBox Runat="server" RecordId="12"  ID="DxDateText_12" TABLE="Diagnostics" FIELD="DxDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True"   />
                <euc:EformHidden RecordId="12" Runat="server" ID="DxDate_12" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
         
            <td align="left" style="white-space: nowrap;"  valign="top"><strong>Result&nbsp;</strong><br />
		        <euc:EformDropDownList DropDownWidth="auto" Width="140px" Field="DxResult" RecordId="12" Table="Diagnostics" id="DxResult_12" LookupCode="DxResult,Disease,Liver" Runat="server"  /></td>

         
         
            <td style="white-space: nowrap;" colspan="1" valign="top"><strong>Scan Type<br /></strong>
            
		        <euc:EformDropDownList DropDownWidth="auto" style="width:80px;" RecordId="12"  TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_12" LookupCode="DxType,Disease,Liver" /></td>

                 <td style="white-space: nowrap;"  valign="top" ><strong># of tumors</strong>
                    <div style="padding-left: 10px;">
                    <euc:EformTextBox Width="1px" style="display: none; " RecordId="12" Runat="server" ID="DxTarget_12" Table="Diagnostics" Field="DxTarget"/>
	                <euc:EformDropDownList Width="60px"  Table="Diagnostics" Field="DxTotalNumTumors" ID="DxTotalNumTumors_12" RecordId="12" Runat="server" ShowEmptyListItem="true"  >
	                    <asp:ListItem Value="" Text=""></asp:ListItem>
	                    <asp:ListItem Value="0" Text="0"></asp:ListItem>
	                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
	                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
	                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
	                    <asp:ListItem Value="> 3" Text="> 3"></asp:ListItem>
	                </euc:EformDropDownList></div> </td>

                <td align="left" style="white-space: nowrap;"  valign="top"><strong>Institution&nbsp;</strong><br />
		            <euc:EformComboBox DropDownWidth="auto" Width="100px" RecordId="12" Table="Diagnostics" Field="DxInstitution" id="DxInstitution_12" LookupCode="Institution,Disease,Liver" Runat="server" /></td>
            
            </tr> 
            
            <tr>
                <td colspan="3"  valign="top"  >
                    <br /><strong >Findings</strong>
                    <table style="border: solid 1px white;" cellpadding="2" cellspacing="0" width="290" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTableb_1_l">

                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>
            
                        <tr>
                             <td style="white-space: nowrap;" valign="top"  >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1_l" RecordID="1"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_1_l" Value="Liver" />Tumor #1
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_1_l" RecordId="1" ParentRecordId="12" Runat="server"  /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_1_l" RecordID="1"  ParentRecordId="12" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table"  /></td>
                                
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_1_l" RecordID="1"  ParentRecordId="12" Runat="server" /></td>
                        </tr>

                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2_l" RecordId="2"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_2_l" Value="Liver" />Tumor #2
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_2_l" RecordId="2" ParentRecordId="12" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_2_l" RecordId="2"  ParentRecordId="12" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_2_l" RecordId="2"  ParentRecordId="12" Runat="server" /></td>
                        </tr>
                
                        <tr >
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3_l" RecordId="3"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindResult_3_l" Value="Liver" />Tumor #3
    		                    <euc:EformTextBox Width="1px" style="display: none; "    Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_3_l" RecordId="3" ParentRecordId="12" Runat="server"   /> </td>
                    		    
                            <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformCheckBoxList DropDown="true" DropDownTextCssClass="LocationDropDown" ShowOther="false"   LookupCode="SegmentSubSite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_3_l" RecordId="3"  ParentRecordId="12" Runat="server" RepeatColumns="1" RepeatDirection="Vertical" RepeatLayout="Table" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_3_l" RecordId="3"  ParentRecordId="12" Runat="server" /></td>
                        </tr>  
                        <tr>
                              <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8_l" RecordId="8"  ParentRecordId="12" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_8_l" RecordId="8" ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_8_l" />Lymphadenopathy </td>

                               <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox  Width="1px" style="display: none;" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_8_l" RecordId="8"  ParentRecordId="12" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_8_l" RecordId="8"  ParentRecordId="12" Runat="server" /></td>                     
                      
                        </tr>
                        <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6_l" RecordId="6"  ParentRecordId="12" Runat="server"  Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_6_l" RecordId="6" ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_6_l" />Vascular invasion </td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox  Width="1px" style="display: none;" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_6_l" RecordId="6"  ParentRecordId="12" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                        </tr> 
                        <tr>
                              <td style="white-space: nowrap;" >
		                        <euc:EformCheckBox TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7_l" RecordId="7"  ParentRecordId="12" Runat="server" Value="Liver" />
    		                    <euc:EformTextBox Width="1px" style="display: none; " Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_7_l" RecordId="7" ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_7_l" />Ascites</td>    
 
                              <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox  Width="1px" style="display: none;" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_7_l" RecordId="7"  ParentRecordId="12" Runat="server" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                       
                        </tr> 
                        <tr>
                                <td style="white-space: nowrap;" valign="top" >
    		                    <euc:EformCheckBox Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_9_l" RecordId="9" ParentRecordId="12" Runat="server" Value="Distant metastases"/>Distant metastases</td>
  
                                 <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="MetastasesSubsite,Disease,Liver" Table="DxImageFindings" Field="ImgFindSite" ID="ImgFindSite_9_l" RecordId="9"  ParentRecordId="12" Runat="server"  /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        </td>                     
                     
                        </tr>        
                 
                    </table>

                </td>    

                <td colspan="3" valign="top">
                    <br /><strong >Notes</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="Table11">
                        <tr>
                            <td>
                                <euc:EformTextArea Width="200px" Height="185px"  TextMode="MultiLine" RecordId="12"  ID="DxNotes_12" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ShowTextEditor="true"/></td>
                        </tr>
                    </table>
                </td>

                <%--<td colspan="3"  valign="top">      	
                	<br /><strong >Other Findings</strong>
                    <table style="border: solid 1px white;" cellspacing="0" cellpadding="2" width="200" class="ClinicalEformGridColumnOne" id="ImagingLiverHtmlTablec_1_l">
                        <tr>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;"></td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Location</td>
                            <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Size (cm)</td>
                        </tr>

                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10_l" RecordId="10"  ParentRecordId="12" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_10_l" RecordId="10" ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_l" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_10_l" RecordId="10"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_l" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_10_l" RecordId="10"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_10_l" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11_l" RecordId="11"  ParentRecordId="12" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_11_l" RecordId="11" ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_l" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_11_l" RecordId="11"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_l" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_11_l" RecordId="11"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_11_l" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12_l" RecordId="12"  ParentRecordId="12" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_12_l" RecordId="12" ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_l" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_12_l" RecordId="12"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_l" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_12_l" RecordId="12"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_12_l" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13_l" RecordId="13"  ParentRecordId="12" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_13_l" RecordId="13" ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_l" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_13_l" RecordId="13"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_l" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_13_l" RecordId="13"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_13_l" /></td>                     
                        </tr>                       
                          <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14_l" RecordId="14"  ParentRecordId="12" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_14_l" RecordId="14" ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_l" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_14_l" RecordId="14"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_l" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_14_l" RecordId="14"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_14_l" /></td>                     
                        </tr>                       
                         <tr>
                             <td style="white-space: nowrap;" valign="top">
		                        <euc:EformHidden TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15_l" RecordId="15"  ParentRecordId="12" Runat="server"  Value="Liver" />
    		                    <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImageFinding,Disease,Liver"  Table="DxImageFindings" Field="ImgFindResult" ID="ImgFindResult_15_l" RecordId="15" ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_l" /></td> 
 
                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformComboBox DropDownWidth="auto" Width="100px" LookupCode="ImgFindSubsite,Disease,Liver" TABLE="DxImageFindings"  FIELD="ImgFindSubsite" ID="ImgFindSubsite_15_l" RecordId="15"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_l" /></td>

                             <td style="white-space: nowrap;" valign="top" >
		                        <euc:EformTextBox style="width: 80px;" TABLE="DxImageFindings"  FIELD="ImgFindWidth" ID="ImgFindWidth_15_l" RecordId="15"  ParentRecordId="12" Runat="server" EnableHiddenOnUIEvent="ImgFindSite_15_l" /></td>                     
                        </tr>                       
    
                    
                    </table>

	                </td>--%>        
            </tr>               
        </table>
    </td>
   </tr>

   
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ImagingLiverHtmlTable1');" />

</div>
<br/><br/><br/>
<table>
    <tr id="ImagingAbsentRow">
        <td>
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="TableName" ID="TableName_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="FieldName" ID="FieldName_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_6"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="6" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_6"
            runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>


<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo   
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_1.ClientID %>'),$('<%= DxDate_1.ClientID %>'),$('<%= DxResult_1.ClientID %>'),$('<%= DxType_1.ClientID %>'),$('<%= DxTarget_1.ClientID %>'),$('<%= DxInstitution_1.ClientID %>'),$('<%= DxTotalNumTumors_1.ClientID %>'),$('<%= DxNotes_1.ClientID %>'),$('<%= ImgFindSite_1_a.ClientID %>'),$('<%= ImgFindResult_1_a.ClientID %>'),$('<%= ImgFindSubsite_1_a.ClientID %>'),$('<%= ImgFindWidth_1_a.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_1.ClientID %>'),$('<%= DxDate_1.ClientID %>'),$('<%= DxResult_1.ClientID %>'),$('<%= DxType_1.ClientID %>'),$('<%= DxTarget_1.ClientID %>'),$('<%= DxInstitution_1.ClientID %>'),$('<%= DxTotalNumTumors_1.ClientID %>'),$('<%= DxNotes_1.ClientID %>'),$('<%= ImgFindSite_2_a.ClientID %>'),$('<%= ImgFindResult_2_a.ClientID %>'),$('<%= ImgFindSubsite_2_a.ClientID %>'),$('<%= ImgFindWidth_2_a.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_1.ClientID %>'),$('<%= DxDate_1.ClientID %>'),$('<%= DxResult_1.ClientID %>'),$('<%= DxType_1.ClientID %>'),$('<%= DxTarget_1.ClientID %>'),$('<%= DxInstitution_1.ClientID %>'),$('<%= DxTotalNumTumors_1.ClientID %>'),$('<%= DxNotes_1.ClientID %>'),$('<%= ImgFindSite_3_a.ClientID %>'),$('<%= ImgFindResult_3_a.ClientID %>'),$('<%= ImgFindSubsite_3_a.ClientID %>'),$('<%= ImgFindWidth_3_a.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_1.ClientID %>'),$('<%= DxDate_1.ClientID %>'),$('<%= DxResult_1.ClientID %>'),$('<%= DxType_1.ClientID %>'),$('<%= DxTarget_1.ClientID %>'),$('<%= DxInstitution_1.ClientID %>'),$('<%= DxTotalNumTumors_1.ClientID %>'),$('<%= DxNotes_1.ClientID %>'),$('<%= ImgFindSite_6_a.ClientID %>'),$('<%= ImgFindResult_6_a.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_1.ClientID %>'),$('<%= DxDate_1.ClientID %>'),$('<%= DxResult_1.ClientID %>'),$('<%= DxType_1.ClientID %>'),$('<%= DxTarget_1.ClientID %>'),$('<%= DxInstitution_1.ClientID %>'),$('<%= DxTotalNumTumors_1.ClientID %>'),$('<%= DxNotes_1.ClientID %>'),$('<%= ImgFindSite_7_a.ClientID %>'),$('<%= ImgFindResult_7_a.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_1.ClientID %>'),$('<%= DxDate_1.ClientID %>'),$('<%= DxResult_1.ClientID %>'),$('<%= DxType_1.ClientID %>'),$('<%= DxTarget_1.ClientID %>'),$('<%= DxInstitution_1.ClientID %>'),$('<%= DxTotalNumTumors_1.ClientID %>'),$('<%= DxNotes_1.ClientID %>'),$('<%= ImgFindSite_8_a.ClientID %>'),$('<%= ImgFindResult_8_a.ClientID %>'),null,$('<%= ImgFindWidth_8_a.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_1.ClientID %>'),$('<%= DxDate_1.ClientID %>'),$('<%= DxResult_1.ClientID %>'),$('<%= DxType_1.ClientID %>'),$('<%= DxTarget_1.ClientID %>'),$('<%= DxInstitution_1.ClientID %>'),$('<%= DxTotalNumTumors_1.ClientID %>'),$('<%= DxNotes_1.ClientID %>'),$('<%= ImgFindSite_9_a.ClientID %>'),$('<%= ImgFindResult_9_a.ClientID %>'),null,null,'Distant metastases');

    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_2.ClientID %>'),$('<%= DxDate_2.ClientID %>'),$('<%= DxResult_2.ClientID %>'),$('<%= DxType_2.ClientID %>'),$('<%= DxTarget_2.ClientID %>'),$('<%= DxInstitution_2.ClientID %>'),$('<%= DxTotalNumTumors_2.ClientID %>'),$('<%= DxNotes_2.ClientID %>'),$('<%= ImgFindSite_1_b.ClientID %>'),$('<%= ImgFindResult_1_b.ClientID %>'),$('<%= ImgFindSubsite_1_b.ClientID %>'),$('<%= ImgFindWidth_1_b.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_2.ClientID %>'),$('<%= DxDate_2.ClientID %>'),$('<%= DxResult_2.ClientID %>'),$('<%= DxType_2.ClientID %>'),$('<%= DxTarget_2.ClientID %>'),$('<%= DxInstitution_2.ClientID %>'),$('<%= DxTotalNumTumors_2.ClientID %>'),$('<%= DxNotes_2.ClientID %>'),$('<%= ImgFindSite_2_b.ClientID %>'),$('<%= ImgFindResult_2_b.ClientID %>'),$('<%= ImgFindSubsite_2_b.ClientID %>'),$('<%= ImgFindWidth_2_b.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_2.ClientID %>'),$('<%= DxDate_2.ClientID %>'),$('<%= DxResult_2.ClientID %>'),$('<%= DxType_2.ClientID %>'),$('<%= DxTarget_2.ClientID %>'),$('<%= DxInstitution_2.ClientID %>'),$('<%= DxTotalNumTumors_2.ClientID %>'),$('<%= DxNotes_2.ClientID %>'),$('<%= ImgFindSite_3_b.ClientID %>'),$('<%= ImgFindResult_3_b.ClientID %>'),$('<%= ImgFindSubsite_3_b.ClientID %>'),$('<%= ImgFindWidth_3_b.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_2.ClientID %>'),$('<%= DxDate_2.ClientID %>'),$('<%= DxResult_2.ClientID %>'),$('<%= DxType_2.ClientID %>'),$('<%= DxTarget_2.ClientID %>'),$('<%= DxInstitution_2.ClientID %>'),$('<%= DxTotalNumTumors_2.ClientID %>'),$('<%= DxNotes_2.ClientID %>'),$('<%= ImgFindSite_6_b.ClientID %>'),$('<%= ImgFindResult_6_b.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_2.ClientID %>'),$('<%= DxDate_2.ClientID %>'),$('<%= DxResult_2.ClientID %>'),$('<%= DxType_2.ClientID %>'),$('<%= DxTarget_2.ClientID %>'),$('<%= DxInstitution_2.ClientID %>'),$('<%= DxTotalNumTumors_2.ClientID %>'),$('<%= DxNotes_2.ClientID %>'),$('<%= ImgFindSite_7_b.ClientID %>'),$('<%= ImgFindResult_7_b.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_2.ClientID %>'),$('<%= DxDate_2.ClientID %>'),$('<%= DxResult_2.ClientID %>'),$('<%= DxType_2.ClientID %>'),$('<%= DxTarget_2.ClientID %>'),$('<%= DxInstitution_2.ClientID %>'),$('<%= DxTotalNumTumors_2.ClientID %>'),$('<%= DxNotes_2.ClientID %>'),$('<%= ImgFindSite_8_b.ClientID %>'),$('<%= ImgFindResult_8_b.ClientID %>'),null,$('<%= ImgFindWidth_8_b.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_2.ClientID %>'),$('<%= DxDate_2.ClientID %>'),$('<%= DxResult_2.ClientID %>'),$('<%= DxType_2.ClientID %>'),$('<%= DxTarget_2.ClientID %>'),$('<%= DxInstitution_2.ClientID %>'),$('<%= DxTotalNumTumors_2.ClientID %>'),$('<%= DxNotes_2.ClientID %>'),$('<%= ImgFindSite_9_b.ClientID %>'),$('<%= ImgFindResult_9_b.ClientID %>'),null,null,'Distant metastases');

    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_3.ClientID %>'),$('<%= DxDate_3.ClientID %>'),$('<%= DxResult_3.ClientID %>'),$('<%= DxType_3.ClientID %>'),$('<%= DxTarget_3.ClientID %>'),$('<%= DxInstitution_3.ClientID %>'),$('<%= DxTotalNumTumors_3.ClientID %>'),$('<%= DxNotes_3.ClientID %>'),$('<%= ImgFindSite_1_c.ClientID %>'),$('<%= ImgFindResult_1_c.ClientID %>'),$('<%= ImgFindSubsite_1_c.ClientID %>'),$('<%= ImgFindWidth_1_c.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_3.ClientID %>'),$('<%= DxDate_3.ClientID %>'),$('<%= DxResult_3.ClientID %>'),$('<%= DxType_3.ClientID %>'),$('<%= DxTarget_3.ClientID %>'),$('<%= DxInstitution_3.ClientID %>'),$('<%= DxTotalNumTumors_3.ClientID %>'),$('<%= DxNotes_3.ClientID %>'),$('<%= ImgFindSite_2_c.ClientID %>'),$('<%= ImgFindResult_2_c.ClientID %>'),$('<%= ImgFindSubsite_2_c.ClientID %>'),$('<%= ImgFindWidth_2_c.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_3.ClientID %>'),$('<%= DxDate_3.ClientID %>'),$('<%= DxResult_3.ClientID %>'),$('<%= DxType_3.ClientID %>'),$('<%= DxTarget_3.ClientID %>'),$('<%= DxInstitution_3.ClientID %>'),$('<%= DxTotalNumTumors_3.ClientID %>'),$('<%= DxNotes_3.ClientID %>'),$('<%= ImgFindSite_3_c.ClientID %>'),$('<%= ImgFindResult_3_c.ClientID %>'),$('<%= ImgFindSubsite_3_c.ClientID %>'),$('<%= ImgFindWidth_3_c.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_3.ClientID %>'),$('<%= DxDate_3.ClientID %>'),$('<%= DxResult_3.ClientID %>'),$('<%= DxType_3.ClientID %>'),$('<%= DxTarget_3.ClientID %>'),$('<%= DxInstitution_3.ClientID %>'),$('<%= DxTotalNumTumors_3.ClientID %>'),$('<%= DxNotes_3.ClientID %>'),$('<%= ImgFindSite_6_c.ClientID %>'),$('<%= ImgFindResult_6_c.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_3.ClientID %>'),$('<%= DxDate_3.ClientID %>'),$('<%= DxResult_3.ClientID %>'),$('<%= DxType_3.ClientID %>'),$('<%= DxTarget_3.ClientID %>'),$('<%= DxInstitution_3.ClientID %>'),$('<%= DxTotalNumTumors_3.ClientID %>'),$('<%= DxNotes_3.ClientID %>'),$('<%= ImgFindSite_7_c.ClientID %>'),$('<%= ImgFindResult_7_c.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_3.ClientID %>'),$('<%= DxDate_3.ClientID %>'),$('<%= DxResult_3.ClientID %>'),$('<%= DxType_3.ClientID %>'),$('<%= DxTarget_3.ClientID %>'),$('<%= DxInstitution_3.ClientID %>'),$('<%= DxTotalNumTumors_3.ClientID %>'),$('<%= DxNotes_3.ClientID %>'),$('<%= ImgFindSite_8_c.ClientID %>'),$('<%= ImgFindResult_8_c.ClientID %>'),null,$('<%= ImgFindWidth_8_c.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_3.ClientID %>'),$('<%= DxDate_3.ClientID %>'),$('<%= DxResult_3.ClientID %>'),$('<%= DxType_3.ClientID %>'),$('<%= DxTarget_3.ClientID %>'),$('<%= DxInstitution_3.ClientID %>'),$('<%= DxTotalNumTumors_3.ClientID %>'),$('<%= DxNotes_3.ClientID %>'),$('<%= ImgFindSite_9_c.ClientID %>'),$('<%= ImgFindResult_9_c.ClientID %>'),null,null,'Distant metastases');

    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_4.ClientID %>'),$('<%= DxDate_4.ClientID %>'),$('<%= DxResult_4.ClientID %>'),$('<%= DxType_4.ClientID %>'),$('<%= DxTarget_4.ClientID %>'),$('<%= DxInstitution_4.ClientID %>'),$('<%= DxTotalNumTumors_4.ClientID %>'),$('<%= DxNotes_4.ClientID %>'),$('<%= ImgFindSite_1_d.ClientID %>'),$('<%= ImgFindResult_1_d.ClientID %>'),$('<%= ImgFindSubsite_1_d.ClientID %>'),$('<%= ImgFindWidth_1_d.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_4.ClientID %>'),$('<%= DxDate_4.ClientID %>'),$('<%= DxResult_4.ClientID %>'),$('<%= DxType_4.ClientID %>'),$('<%= DxTarget_4.ClientID %>'),$('<%= DxInstitution_4.ClientID %>'),$('<%= DxTotalNumTumors_4.ClientID %>'),$('<%= DxNotes_4.ClientID %>'),$('<%= ImgFindSite_2_d.ClientID %>'),$('<%= ImgFindResult_2_d.ClientID %>'),$('<%= ImgFindSubsite_2_d.ClientID %>'),$('<%= ImgFindWidth_2_d.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_4.ClientID %>'),$('<%= DxDate_4.ClientID %>'),$('<%= DxResult_4.ClientID %>'),$('<%= DxType_4.ClientID %>'),$('<%= DxTarget_4.ClientID %>'),$('<%= DxInstitution_4.ClientID %>'),$('<%= DxTotalNumTumors_4.ClientID %>'),$('<%= DxNotes_4.ClientID %>'),$('<%= ImgFindSite_3_d.ClientID %>'),$('<%= ImgFindResult_3_d.ClientID %>'),$('<%= ImgFindSubsite_3_d.ClientID %>'),$('<%= ImgFindWidth_3_d.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_4.ClientID %>'),$('<%= DxDate_4.ClientID %>'),$('<%= DxResult_4.ClientID %>'),$('<%= DxType_4.ClientID %>'),$('<%= DxTarget_4.ClientID %>'),$('<%= DxInstitution_4.ClientID %>'),$('<%= DxTotalNumTumors_4.ClientID %>'),$('<%= DxNotes_4.ClientID %>'),$('<%= ImgFindSite_6_d.ClientID %>'),$('<%= ImgFindResult_6_d.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_4.ClientID %>'),$('<%= DxDate_4.ClientID %>'),$('<%= DxResult_4.ClientID %>'),$('<%= DxType_4.ClientID %>'),$('<%= DxTarget_4.ClientID %>'),$('<%= DxInstitution_4.ClientID %>'),$('<%= DxTotalNumTumors_4.ClientID %>'),$('<%= DxNotes_4.ClientID %>'),$('<%= ImgFindSite_7_d.ClientID %>'),$('<%= ImgFindResult_7_d.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_4.ClientID %>'),$('<%= DxDate_4.ClientID %>'),$('<%= DxResult_4.ClientID %>'),$('<%= DxType_4.ClientID %>'),$('<%= DxTarget_4.ClientID %>'),$('<%= DxInstitution_4.ClientID %>'),$('<%= DxTotalNumTumors_4.ClientID %>'),$('<%= DxNotes_4.ClientID %>'),$('<%= ImgFindSite_8_d.ClientID %>'),$('<%= ImgFindResult_8_d.ClientID %>'),null,$('<%= ImgFindWidth_8_d.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_4.ClientID %>'),$('<%= DxDate_4.ClientID %>'),$('<%= DxResult_4.ClientID %>'),$('<%= DxType_4.ClientID %>'),$('<%= DxTarget_4.ClientID %>'),$('<%= DxInstitution_4.ClientID %>'),$('<%= DxTotalNumTumors_4.ClientID %>'),$('<%= DxNotes_4.ClientID %>'),$('<%= ImgFindSite_9_d.ClientID %>'),$('<%= ImgFindResult_9_d.ClientID %>'),null,null,'Distant metastases');

    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_5.ClientID %>'),$('<%= DxDate_5.ClientID %>'),$('<%= DxResult_5.ClientID %>'),$('<%= DxType_5.ClientID %>'),$('<%= DxTarget_5.ClientID %>'),$('<%= DxInstitution_5.ClientID %>'),$('<%= DxTotalNumTumors_5.ClientID %>'),$('<%= DxNotes_5.ClientID %>'),$('<%= ImgFindSite_1_e.ClientID %>'),$('<%= ImgFindResult_1_e.ClientID %>'),$('<%= ImgFindSubsite_1_e.ClientID %>'),$('<%= ImgFindWidth_1_e.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_5.ClientID %>'),$('<%= DxDate_5.ClientID %>'),$('<%= DxResult_5.ClientID %>'),$('<%= DxType_5.ClientID %>'),$('<%= DxTarget_5.ClientID %>'),$('<%= DxInstitution_5.ClientID %>'),$('<%= DxTotalNumTumors_5.ClientID %>'),$('<%= DxNotes_5.ClientID %>'),$('<%= ImgFindSite_2_e.ClientID %>'),$('<%= ImgFindResult_2_e.ClientID %>'),$('<%= ImgFindSubsite_2_e.ClientID %>'),$('<%= ImgFindWidth_2_e.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_5.ClientID %>'),$('<%= DxDate_5.ClientID %>'),$('<%= DxResult_5.ClientID %>'),$('<%= DxType_5.ClientID %>'),$('<%= DxTarget_5.ClientID %>'),$('<%= DxInstitution_5.ClientID %>'),$('<%= DxTotalNumTumors_5.ClientID %>'),$('<%= DxNotes_5.ClientID %>'),$('<%= ImgFindSite_3_e.ClientID %>'),$('<%= ImgFindResult_3_e.ClientID %>'),$('<%= ImgFindSubsite_3_e.ClientID %>'),$('<%= ImgFindWidth_3_e.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_5.ClientID %>'),$('<%= DxDate_5.ClientID %>'),$('<%= DxResult_5.ClientID %>'),$('<%= DxType_5.ClientID %>'),$('<%= DxTarget_5.ClientID %>'),$('<%= DxInstitution_5.ClientID %>'),$('<%= DxTotalNumTumors_5.ClientID %>'),$('<%= DxNotes_5.ClientID %>'),$('<%= ImgFindSite_6_e.ClientID %>'),$('<%= ImgFindResult_6_e.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_5.ClientID %>'),$('<%= DxDate_5.ClientID %>'),$('<%= DxResult_5.ClientID %>'),$('<%= DxType_5.ClientID %>'),$('<%= DxTarget_5.ClientID %>'),$('<%= DxInstitution_5.ClientID %>'),$('<%= DxTotalNumTumors_5.ClientID %>'),$('<%= DxNotes_5.ClientID %>'),$('<%= ImgFindSite_7_e.ClientID %>'),$('<%= ImgFindResult_7_e.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_5.ClientID %>'),$('<%= DxDate_5.ClientID %>'),$('<%= DxResult_5.ClientID %>'),$('<%= DxType_5.ClientID %>'),$('<%= DxTarget_5.ClientID %>'),$('<%= DxInstitution_5.ClientID %>'),$('<%= DxTotalNumTumors_5.ClientID %>'),$('<%= DxNotes_5.ClientID %>'),$('<%= ImgFindSite_8_e.ClientID %>'),$('<%= ImgFindResult_8_e.ClientID %>'),null,$('<%= ImgFindWidth_8_e.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_5.ClientID %>'),$('<%= DxDate_5.ClientID %>'),$('<%= DxResult_5.ClientID %>'),$('<%= DxType_5.ClientID %>'),$('<%= DxTarget_5.ClientID %>'),$('<%= DxInstitution_5.ClientID %>'),$('<%= DxTotalNumTumors_5.ClientID %>'),$('<%= DxNotes_5.ClientID %>'),$('<%= ImgFindSite_9_e.ClientID %>'),$('<%= ImgFindResult_9_e.ClientID %>'),null,null,'Distant metastases');

    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_6.ClientID %>'),$('<%= DxDate_6.ClientID %>'),$('<%= DxResult_6.ClientID %>'),$('<%= DxType_6.ClientID %>'),$('<%= DxTarget_6.ClientID %>'),$('<%= DxInstitution_6.ClientID %>'),$('<%= DxTotalNumTumors_6.ClientID %>'),$('<%= DxNotes_6.ClientID %>'),$('<%= ImgFindSite_1_f.ClientID %>'),$('<%= ImgFindResult_1_f.ClientID %>'),$('<%= ImgFindSubsite_1_f.ClientID %>'),$('<%= ImgFindWidth_1_f.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_6.ClientID %>'),$('<%= DxDate_6.ClientID %>'),$('<%= DxResult_6.ClientID %>'),$('<%= DxType_6.ClientID %>'),$('<%= DxTarget_6.ClientID %>'),$('<%= DxInstitution_6.ClientID %>'),$('<%= DxTotalNumTumors_6.ClientID %>'),$('<%= DxNotes_6.ClientID %>'),$('<%= ImgFindSite_2_f.ClientID %>'),$('<%= ImgFindResult_2_f.ClientID %>'),$('<%= ImgFindSubsite_2_f.ClientID %>'),$('<%= ImgFindWidth_2_f.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_6.ClientID %>'),$('<%= DxDate_6.ClientID %>'),$('<%= DxResult_6.ClientID %>'),$('<%= DxType_6.ClientID %>'),$('<%= DxTarget_6.ClientID %>'),$('<%= DxInstitution_6.ClientID %>'),$('<%= DxTotalNumTumors_6.ClientID %>'),$('<%= DxNotes_6.ClientID %>'),$('<%= ImgFindSite_3_f.ClientID %>'),$('<%= ImgFindResult_3_f.ClientID %>'),$('<%= ImgFindSubsite_3_f.ClientID %>'),$('<%= ImgFindWidth_3_f.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_6.ClientID %>'),$('<%= DxDate_6.ClientID %>'),$('<%= DxResult_6.ClientID %>'),$('<%= DxType_6.ClientID %>'),$('<%= DxTarget_6.ClientID %>'),$('<%= DxInstitution_6.ClientID %>'),$('<%= DxTotalNumTumors_6.ClientID %>'),$('<%= DxNotes_6.ClientID %>'),$('<%= ImgFindSite_6_f.ClientID %>'),$('<%= ImgFindResult_6_f.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_6.ClientID %>'),$('<%= DxDate_6.ClientID %>'),$('<%= DxResult_6.ClientID %>'),$('<%= DxType_6.ClientID %>'),$('<%= DxTarget_6.ClientID %>'),$('<%= DxInstitution_6.ClientID %>'),$('<%= DxTotalNumTumors_6.ClientID %>'),$('<%= DxNotes_6.ClientID %>'),$('<%= ImgFindSite_7_f.ClientID %>'),$('<%= ImgFindResult_7_f.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_6.ClientID %>'),$('<%= DxDate_6.ClientID %>'),$('<%= DxResult_6.ClientID %>'),$('<%= DxType_6.ClientID %>'),$('<%= DxTarget_6.ClientID %>'),$('<%= DxInstitution_6.ClientID %>'),$('<%= DxTotalNumTumors_6.ClientID %>'),$('<%= DxNotes_6.ClientID %>'),$('<%= ImgFindSite_8_f.ClientID %>'),$('<%= ImgFindResult_8_f.ClientID %>'),null,$('<%= ImgFindWidth_8_f.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_6.ClientID %>'),$('<%= DxDate_6.ClientID %>'),$('<%= DxResult_6.ClientID %>'),$('<%= DxType_6.ClientID %>'),$('<%= DxTarget_6.ClientID %>'),$('<%= DxInstitution_6.ClientID %>'),$('<%= DxTotalNumTumors_6.ClientID %>'),$('<%= DxNotes_6.ClientID %>'),$('<%= ImgFindSite_9_f.ClientID %>'),$('<%= ImgFindResult_9_f.ClientID %>'),null,null,'Distant metastases');

    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_7.ClientID %>'),$('<%= DxDate_7.ClientID %>'),$('<%= DxResult_7.ClientID %>'),$('<%= DxType_7.ClientID %>'),$('<%= DxTarget_7.ClientID %>'),$('<%= DxInstitution_7.ClientID %>'),$('<%= DxTotalNumTumors_7.ClientID %>'),$('<%= DxNotes_7.ClientID %>'),$('<%= ImgFindSite_1_g.ClientID %>'),$('<%= ImgFindResult_1_g.ClientID %>'),$('<%= ImgFindSubsite_1_g.ClientID %>'),$('<%= ImgFindWidth_1_g.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_7.ClientID %>'),$('<%= DxDate_7.ClientID %>'),$('<%= DxResult_7.ClientID %>'),$('<%= DxType_7.ClientID %>'),$('<%= DxTarget_7.ClientID %>'),$('<%= DxInstitution_7.ClientID %>'),$('<%= DxTotalNumTumors_7.ClientID %>'),$('<%= DxNotes_7.ClientID %>'),$('<%= ImgFindSite_2_g.ClientID %>'),$('<%= ImgFindResult_2_g.ClientID %>'),$('<%= ImgFindSubsite_2_g.ClientID %>'),$('<%= ImgFindWidth_2_g.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_7.ClientID %>'),$('<%= DxDate_7.ClientID %>'),$('<%= DxResult_7.ClientID %>'),$('<%= DxType_7.ClientID %>'),$('<%= DxTarget_7.ClientID %>'),$('<%= DxInstitution_7.ClientID %>'),$('<%= DxTotalNumTumors_7.ClientID %>'),$('<%= DxNotes_7.ClientID %>'),$('<%= ImgFindSite_3_g.ClientID %>'),$('<%= ImgFindResult_3_g.ClientID %>'),$('<%= ImgFindSubsite_3_g.ClientID %>'),$('<%= ImgFindWidth_3_g.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_7.ClientID %>'),$('<%= DxDate_7.ClientID %>'),$('<%= DxResult_7.ClientID %>'),$('<%= DxType_7.ClientID %>'),$('<%= DxTarget_7.ClientID %>'),$('<%= DxInstitution_7.ClientID %>'),$('<%= DxTotalNumTumors_7.ClientID %>'),$('<%= DxNotes_7.ClientID %>'),$('<%= ImgFindSite_6_g.ClientID %>'),$('<%= ImgFindResult_6_g.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_7.ClientID %>'),$('<%= DxDate_7.ClientID %>'),$('<%= DxResult_7.ClientID %>'),$('<%= DxType_7.ClientID %>'),$('<%= DxTarget_7.ClientID %>'),$('<%= DxInstitution_7.ClientID %>'),$('<%= DxTotalNumTumors_7.ClientID %>'),$('<%= DxNotes_7.ClientID %>'),$('<%= ImgFindSite_7_g.ClientID %>'),$('<%= ImgFindResult_7_g.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_7.ClientID %>'),$('<%= DxDate_7.ClientID %>'),$('<%= DxResult_7.ClientID %>'),$('<%= DxType_7.ClientID %>'),$('<%= DxTarget_7.ClientID %>'),$('<%= DxInstitution_7.ClientID %>'),$('<%= DxTotalNumTumors_7.ClientID %>'),$('<%= DxNotes_7.ClientID %>'),$('<%= ImgFindSite_8_g.ClientID %>'),$('<%= ImgFindResult_8_g.ClientID %>'),null,$('<%= ImgFindWidth_8_g.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_7.ClientID %>'),$('<%= DxDate_7.ClientID %>'),$('<%= DxResult_7.ClientID %>'),$('<%= DxType_7.ClientID %>'),$('<%= DxTarget_7.ClientID %>'),$('<%= DxInstitution_7.ClientID %>'),$('<%= DxTotalNumTumors_7.ClientID %>'),$('<%= DxNotes_7.ClientID %>'),$('<%= ImgFindSite_9_g.ClientID %>'),$('<%= ImgFindResult_9_g.ClientID %>'),null,null,'Distant metastases');

    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_8.ClientID %>'),$('<%= DxDate_8.ClientID %>'),$('<%= DxResult_8.ClientID %>'),$('<%= DxType_8.ClientID %>'),$('<%= DxTarget_8.ClientID %>'),$('<%= DxInstitution_8.ClientID %>'),$('<%= DxTotalNumTumors_8.ClientID %>'),$('<%= DxNotes_8.ClientID %>'),$('<%= ImgFindSite_1_h.ClientID %>'),$('<%= ImgFindResult_1_h.ClientID %>'),$('<%= ImgFindSubsite_1_h.ClientID %>'),$('<%= ImgFindWidth_1_h.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_8.ClientID %>'),$('<%= DxDate_8.ClientID %>'),$('<%= DxResult_8.ClientID %>'),$('<%= DxType_8.ClientID %>'),$('<%= DxTarget_8.ClientID %>'),$('<%= DxInstitution_8.ClientID %>'),$('<%= DxTotalNumTumors_8.ClientID %>'),$('<%= DxNotes_8.ClientID %>'),$('<%= ImgFindSite_2_h.ClientID %>'),$('<%= ImgFindResult_2_h.ClientID %>'),$('<%= ImgFindSubsite_2_h.ClientID %>'),$('<%= ImgFindWidth_2_h.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_8.ClientID %>'),$('<%= DxDate_8.ClientID %>'),$('<%= DxResult_8.ClientID %>'),$('<%= DxType_8.ClientID %>'),$('<%= DxTarget_8.ClientID %>'),$('<%= DxInstitution_8.ClientID %>'),$('<%= DxTotalNumTumors_8.ClientID %>'),$('<%= DxNotes_8.ClientID %>'),$('<%= ImgFindSite_3_h.ClientID %>'),$('<%= ImgFindResult_3_h.ClientID %>'),$('<%= ImgFindSubsite_3_h.ClientID %>'),$('<%= ImgFindWidth_3_h.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_8.ClientID %>'),$('<%= DxDate_8.ClientID %>'),$('<%= DxResult_8.ClientID %>'),$('<%= DxType_8.ClientID %>'),$('<%= DxTarget_8.ClientID %>'),$('<%= DxInstitution_8.ClientID %>'),$('<%= DxTotalNumTumors_8.ClientID %>'),$('<%= DxNotes_8.ClientID %>'),$('<%= ImgFindSite_6_h.ClientID %>'),$('<%= ImgFindResult_6_h.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_8.ClientID %>'),$('<%= DxDate_8.ClientID %>'),$('<%= DxResult_8.ClientID %>'),$('<%= DxType_8.ClientID %>'),$('<%= DxTarget_8.ClientID %>'),$('<%= DxInstitution_8.ClientID %>'),$('<%= DxTotalNumTumors_8.ClientID %>'),$('<%= DxNotes_8.ClientID %>'),$('<%= ImgFindSite_7_h.ClientID %>'),$('<%= ImgFindResult_7_h.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_8.ClientID %>'),$('<%= DxDate_8.ClientID %>'),$('<%= DxResult_8.ClientID %>'),$('<%= DxType_8.ClientID %>'),$('<%= DxTarget_8.ClientID %>'),$('<%= DxInstitution_8.ClientID %>'),$('<%= DxTotalNumTumors_8.ClientID %>'),$('<%= DxNotes_8.ClientID %>'),$('<%= ImgFindSite_8_h.ClientID %>'),$('<%= ImgFindResult_8_h.ClientID %>'),null,$('<%= ImgFindWidth_8_h.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_8.ClientID %>'),$('<%= DxDate_8.ClientID %>'),$('<%= DxResult_8.ClientID %>'),$('<%= DxType_8.ClientID %>'),$('<%= DxTarget_8.ClientID %>'),$('<%= DxInstitution_8.ClientID %>'),$('<%= DxTotalNumTumors_8.ClientID %>'),$('<%= DxNotes_8.ClientID %>'),$('<%= ImgFindSite_9_h.ClientID %>'),$('<%= ImgFindResult_9_h.ClientID %>'),null,null,'Distant metastases');

    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_9.ClientID %>'),$('<%= DxDate_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxInstitution_9.ClientID %>'),$('<%= DxTotalNumTumors_9.ClientID %>'),$('<%= DxNotes_9.ClientID %>'),$('<%= ImgFindSite_1_i.ClientID %>'),$('<%= ImgFindResult_1_i.ClientID %>'),$('<%= ImgFindSubsite_1_i.ClientID %>'),$('<%= ImgFindWidth_1_i.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_9.ClientID %>'),$('<%= DxDate_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxInstitution_9.ClientID %>'),$('<%= DxTotalNumTumors_9.ClientID %>'),$('<%= DxNotes_9.ClientID %>'),$('<%= ImgFindSite_2_i.ClientID %>'),$('<%= ImgFindResult_2_i.ClientID %>'),$('<%= ImgFindSubsite_2_i.ClientID %>'),$('<%= ImgFindWidth_2_i.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_9.ClientID %>'),$('<%= DxDate_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxInstitution_9.ClientID %>'),$('<%= DxTotalNumTumors_9.ClientID %>'),$('<%= DxNotes_9.ClientID %>'),$('<%= ImgFindSite_3_i.ClientID %>'),$('<%= ImgFindResult_3_i.ClientID %>'),$('<%= ImgFindSubsite_3_i.ClientID %>'),$('<%= ImgFindWidth_3_i.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_9.ClientID %>'),$('<%= DxDate_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxInstitution_9.ClientID %>'),$('<%= DxTotalNumTumors_9.ClientID %>'),$('<%= DxNotes_9.ClientID %>'),$('<%= ImgFindSite_6_i.ClientID %>'),$('<%= ImgFindResult_6_i.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_9.ClientID %>'),$('<%= DxDate_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxInstitution_9.ClientID %>'),$('<%= DxTotalNumTumors_9.ClientID %>'),$('<%= DxNotes_9.ClientID %>'),$('<%= ImgFindSite_7_i.ClientID %>'),$('<%= ImgFindResult_7_i.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_9.ClientID %>'),$('<%= DxDate_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxInstitution_9.ClientID %>'),$('<%= DxTotalNumTumors_9.ClientID %>'),$('<%= DxNotes_9.ClientID %>'),$('<%= ImgFindSite_8_i.ClientID %>'),$('<%= ImgFindResult_8_i.ClientID %>'),null,$('<%= ImgFindWidth_8_i.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_9.ClientID %>'),$('<%= DxDate_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxInstitution_9.ClientID %>'),$('<%= DxTotalNumTumors_9.ClientID %>'),$('<%= DxNotes_9.ClientID %>'),$('<%= ImgFindSite_9_i.ClientID %>'),$('<%= ImgFindResult_9_i.ClientID %>'),null,null,'Distant metastases');

    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_10.ClientID %>'),$('<%= DxDate_10.ClientID %>'),$('<%= DxResult_10.ClientID %>'),$('<%= DxType_10.ClientID %>'),$('<%= DxTarget_10.ClientID %>'),$('<%= DxInstitution_10.ClientID %>'),$('<%= DxTotalNumTumors_10.ClientID %>'),$('<%= DxNotes_10.ClientID %>'),$('<%= ImgFindSite_1_j.ClientID %>'),$('<%= ImgFindResult_1_j.ClientID %>'),$('<%= ImgFindSubsite_1_j.ClientID %>'),$('<%= ImgFindWidth_1_j.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_10.ClientID %>'),$('<%= DxDate_10.ClientID %>'),$('<%= DxResult_10.ClientID %>'),$('<%= DxType_10.ClientID %>'),$('<%= DxTarget_10.ClientID %>'),$('<%= DxInstitution_10.ClientID %>'),$('<%= DxTotalNumTumors_10.ClientID %>'),$('<%= DxNotes_10.ClientID %>'),$('<%= ImgFindSite_2_j.ClientID %>'),$('<%= ImgFindResult_2_j.ClientID %>'),$('<%= ImgFindSubsite_2_j.ClientID %>'),$('<%= ImgFindWidth_2_j.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_10.ClientID %>'),$('<%= DxDate_10.ClientID %>'),$('<%= DxResult_10.ClientID %>'),$('<%= DxType_10.ClientID %>'),$('<%= DxTarget_10.ClientID %>'),$('<%= DxInstitution_10.ClientID %>'),$('<%= DxTotalNumTumors_10.ClientID %>'),$('<%= DxNotes_10.ClientID %>'),$('<%= ImgFindSite_3_j.ClientID %>'),$('<%= ImgFindResult_3_j.ClientID %>'),$('<%= ImgFindSubsite_3_j.ClientID %>'),$('<%= ImgFindWidth_3_j.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_10.ClientID %>'),$('<%= DxDate_10.ClientID %>'),$('<%= DxResult_10.ClientID %>'),$('<%= DxType_10.ClientID %>'),$('<%= DxTarget_10.ClientID %>'),$('<%= DxInstitution_10.ClientID %>'),$('<%= DxTotalNumTumors_10.ClientID %>'),$('<%= DxNotes_10.ClientID %>'),$('<%= ImgFindSite_6_j.ClientID %>'),$('<%= ImgFindResult_6_j.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_10.ClientID %>'),$('<%= DxDate_10.ClientID %>'),$('<%= DxResult_10.ClientID %>'),$('<%= DxType_10.ClientID %>'),$('<%= DxTarget_10.ClientID %>'),$('<%= DxInstitution_10.ClientID %>'),$('<%= DxTotalNumTumors_10.ClientID %>'),$('<%= DxNotes_10.ClientID %>'),$('<%= ImgFindSite_7_j.ClientID %>'),$('<%= ImgFindResult_7_j.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_10.ClientID %>'),$('<%= DxDate_10.ClientID %>'),$('<%= DxResult_10.ClientID %>'),$('<%= DxType_10.ClientID %>'),$('<%= DxTarget_10.ClientID %>'),$('<%= DxInstitution_10.ClientID %>'),$('<%= DxTotalNumTumors_10.ClientID %>'),$('<%= DxNotes_10.ClientID %>'),$('<%= ImgFindSite_8_j.ClientID %>'),$('<%= ImgFindResult_8_j.ClientID %>'),null,$('<%= ImgFindWidth_8_j.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_10.ClientID %>'),$('<%= DxDate_10.ClientID %>'),$('<%= DxResult_10.ClientID %>'),$('<%= DxType_10.ClientID %>'),$('<%= DxTarget_10.ClientID %>'),$('<%= DxInstitution_10.ClientID %>'),$('<%= DxTotalNumTumors_10.ClientID %>'),$('<%= DxNotes_10.ClientID %>'),$('<%= ImgFindSite_9_j.ClientID %>'),$('<%= ImgFindResult_9_j.ClientID %>'),null,null,'Distant metastases');

    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_11.ClientID %>'),$('<%= DxDate_11.ClientID %>'),$('<%= DxResult_11.ClientID %>'),$('<%= DxType_11.ClientID %>'),$('<%= DxTarget_11.ClientID %>'),$('<%= DxInstitution_11.ClientID %>'),$('<%= DxTotalNumTumors_11.ClientID %>'),$('<%= DxNotes_11.ClientID %>'),$('<%= ImgFindSite_1_k.ClientID %>'),$('<%= ImgFindResult_1_k.ClientID %>'),$('<%= ImgFindSubsite_1_k.ClientID %>'),$('<%= ImgFindWidth_1_k.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_11.ClientID %>'),$('<%= DxDate_11.ClientID %>'),$('<%= DxResult_11.ClientID %>'),$('<%= DxType_11.ClientID %>'),$('<%= DxTarget_11.ClientID %>'),$('<%= DxInstitution_11.ClientID %>'),$('<%= DxTotalNumTumors_11.ClientID %>'),$('<%= DxNotes_11.ClientID %>'),$('<%= ImgFindSite_2_k.ClientID %>'),$('<%= ImgFindResult_2_k.ClientID %>'),$('<%= ImgFindSubsite_2_k.ClientID %>'),$('<%= ImgFindWidth_2_k.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_11.ClientID %>'),$('<%= DxDate_11.ClientID %>'),$('<%= DxResult_11.ClientID %>'),$('<%= DxType_11.ClientID %>'),$('<%= DxTarget_11.ClientID %>'),$('<%= DxInstitution_11.ClientID %>'),$('<%= DxTotalNumTumors_11.ClientID %>'),$('<%= DxNotes_11.ClientID %>'),$('<%= ImgFindSite_3_k.ClientID %>'),$('<%= ImgFindResult_3_k.ClientID %>'),$('<%= ImgFindSubsite_3_k.ClientID %>'),$('<%= ImgFindWidth_3_k.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_11.ClientID %>'),$('<%= DxDate_11.ClientID %>'),$('<%= DxResult_11.ClientID %>'),$('<%= DxType_11.ClientID %>'),$('<%= DxTarget_11.ClientID %>'),$('<%= DxInstitution_11.ClientID %>'),$('<%= DxTotalNumTumors_11.ClientID %>'),$('<%= DxNotes_11.ClientID %>'),$('<%= ImgFindSite_6_k.ClientID %>'),$('<%= ImgFindResult_6_k.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_11.ClientID %>'),$('<%= DxDate_11.ClientID %>'),$('<%= DxResult_11.ClientID %>'),$('<%= DxType_11.ClientID %>'),$('<%= DxTarget_11.ClientID %>'),$('<%= DxInstitution_11.ClientID %>'),$('<%= DxTotalNumTumors_11.ClientID %>'),$('<%= DxNotes_11.ClientID %>'),$('<%= ImgFindSite_7_k.ClientID %>'),$('<%= ImgFindResult_7_k.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_11.ClientID %>'),$('<%= DxDate_11.ClientID %>'),$('<%= DxResult_11.ClientID %>'),$('<%= DxType_11.ClientID %>'),$('<%= DxTarget_11.ClientID %>'),$('<%= DxInstitution_11.ClientID %>'),$('<%= DxTotalNumTumors_11.ClientID %>'),$('<%= DxNotes_11.ClientID %>'),$('<%= ImgFindSite_8_k.ClientID %>'),$('<%= ImgFindResult_8_k.ClientID %>'),null,$('<%= ImgFindWidth_8_k.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_11.ClientID %>'),$('<%= DxDate_11.ClientID %>'),$('<%= DxResult_11.ClientID %>'),$('<%= DxType_11.ClientID %>'),$('<%= DxTarget_11.ClientID %>'),$('<%= DxInstitution_11.ClientID %>'),$('<%= DxTotalNumTumors_11.ClientID %>'),$('<%= DxNotes_11.ClientID %>'),$('<%= ImgFindSite_9_k.ClientID %>'),$('<%= ImgFindResult_9_k.ClientID %>'),null,null,'Distant metastases');

    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_12.ClientID %>'),$('<%= DxDate_12.ClientID %>'),$('<%= DxResult_12.ClientID %>'),$('<%= DxType_12.ClientID %>'),$('<%= DxTarget_12.ClientID %>'),$('<%= DxInstitution_12.ClientID %>'),$('<%= DxTotalNumTumors_12.ClientID %>'),$('<%= DxNotes_12.ClientID %>'),$('<%= ImgFindSite_1_l.ClientID %>'),$('<%= ImgFindResult_1_l.ClientID %>'),$('<%= ImgFindSubsite_1_l.ClientID %>'),$('<%= ImgFindWidth_1_l.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_12.ClientID %>'),$('<%= DxDate_12.ClientID %>'),$('<%= DxResult_12.ClientID %>'),$('<%= DxType_12.ClientID %>'),$('<%= DxTarget_12.ClientID %>'),$('<%= DxInstitution_12.ClientID %>'),$('<%= DxTotalNumTumors_12.ClientID %>'),$('<%= DxNotes_12.ClientID %>'),$('<%= ImgFindSite_2_l.ClientID %>'),$('<%= ImgFindResult_2_l.ClientID %>'),$('<%= ImgFindSubsite_2_l.ClientID %>'),$('<%= ImgFindWidth_2_l.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_12.ClientID %>'),$('<%= DxDate_12.ClientID %>'),$('<%= DxResult_12.ClientID %>'),$('<%= DxType_12.ClientID %>'),$('<%= DxTarget_12.ClientID %>'),$('<%= DxInstitution_12.ClientID %>'),$('<%= DxTotalNumTumors_12.ClientID %>'),$('<%= DxNotes_12.ClientID %>'),$('<%= ImgFindSite_3_l.ClientID %>'),$('<%= ImgFindResult_3_l.ClientID %>'),$('<%= ImgFindSubsite_3_l.ClientID %>'),$('<%= ImgFindWidth_3_l.ClientID %>'),'Tumor');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_12.ClientID %>'),$('<%= DxDate_12.ClientID %>'),$('<%= DxResult_12.ClientID %>'),$('<%= DxType_12.ClientID %>'),$('<%= DxTarget_12.ClientID %>'),$('<%= DxInstitution_12.ClientID %>'),$('<%= DxTotalNumTumors_12.ClientID %>'),$('<%= DxNotes_12.ClientID %>'),$('<%= ImgFindSite_6_l.ClientID %>'),$('<%= ImgFindResult_6_l.ClientID %>'),null,null,'Vascular invasion');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_12.ClientID %>'),$('<%= DxDate_12.ClientID %>'),$('<%= DxResult_12.ClientID %>'),$('<%= DxType_12.ClientID %>'),$('<%= DxTarget_12.ClientID %>'),$('<%= DxInstitution_12.ClientID %>'),$('<%= DxTotalNumTumors_12.ClientID %>'),$('<%= DxNotes_12.ClientID %>'),$('<%= ImgFindSite_7_l.ClientID %>'),$('<%= ImgFindResult_7_l.ClientID %>'),null,null,'Ascites');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_12.ClientID %>'),$('<%= DxDate_12.ClientID %>'),$('<%= DxResult_12.ClientID %>'),$('<%= DxType_12.ClientID %>'),$('<%= DxTarget_12.ClientID %>'),$('<%= DxInstitution_12.ClientID %>'),$('<%= DxTotalNumTumors_12.ClientID %>'),$('<%= DxNotes_12.ClientID %>'),$('<%= ImgFindSite_8_l.ClientID %>'),$('<%= ImgFindResult_8_l.ClientID %>'),null,$('<%= ImgFindWidth_8_l.ClientID %>'),'Lymphadenopathy');
    addAbsentEvent($('<%= ImagingRecorded.ClientID %>'),$('<%= ImagingDiv.ClientID %>'),$('<%= ImagingAbsentDiv.ClientID %>'),$('<%= DxDateText_12.ClientID %>'),$('<%= DxDate_12.ClientID %>'),$('<%= DxResult_12.ClientID %>'),$('<%= DxType_12.ClientID %>'),$('<%= DxTarget_12.ClientID %>'),$('<%= DxInstitution_12.ClientID %>'),$('<%= DxTotalNumTumors_12.ClientID %>'),$('<%= DxNotes_12.ClientID %>'),$('<%= ImgFindSite_9_l.ClientID %>'),$('<%= ImgFindResult_9_l.ClientID %>'),null,null,'Distant metastases');
    
    function addAbsentEvent(ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue)
    {  
        $(ImagingRecordedID).addEvent('click',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue));
        $(dxDateText).addEvent('blur',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue));
        $(dxType).addEvent('blur',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue));
        $(dxTarget).addEvent('blur',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue));
        $(dxInstitution).addEvent('blur',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue));
        $(dxNumOfTumors).addEvent('blur',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue));
        $(dxNotes).addEvent('blur',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue));
 
        if (dxResult.type == 'checkbox')
            $(dxResult).addEvent('click',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue)); 
        else if (dxResult.type == 'text')
            $(dxResult).addEvent('blur',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue)); 
     
        if (imgFindSite.type == 'checkbox')
            $(imgFindSite).addEvent('click',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue)); 
        else if (imgFindSite.type == 'text')
            $(imgFindSite).addEvent('blur',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue)); 
        
        if (imgFindSubsite != null)
        {
            var cbl = imgFindSubsite.getElementsByTagName('input');
            for (var j = 0; j < cbl.length; j++)
            {
                var cblRef = cbl[j];   
                if (cblRef.type == 'checkbox')
                      $(cblRef).addEvent('click',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue));
                else (cblRef.type == 'text')
                      $(cblRef).addEvent('blur',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue));
            } 
        }
        if (imgFindWidth != null) 
        {
            $(imgFindWidth).addEvent('blur',curry(ImagingYesNo,ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue));
        }
        // check on load as well
        ImagingYesNo(ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue);
    }
   
    /* ]]> */
   
    function ImagingYesNo(ImagingRecordedID,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue)
    {
       var ImagingRecordedRef = ImagingRecordedID.getElementsByTagName('input');
       
       for (var i = 0; i < ImagingRecordedRef.length; i++) 
        if (ImagingRecordedRef[i].checked) {  
            ImagingRadioClick(ImagingRecordedRef[i].value,ImagingDivID,ImagingAbsentDivID,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue);
            }
    }
    
    function ImagingRadioClick(Imagingoption_value,ImaginghideDiv,ImaginghideAbsentDiv,dxDateText,dxDate,dxResult,dxType,dxTarget,dxInstitution,dxNumOfTumors,dxNotes,imgFindSite,imgFindResult,imgFindSubsite,imgFindWidth,findingValue)
    {
      if (Imagingoption_value == "Yes")
      { 
        ImaginghideDiv.style.display='block';
        ImaginghideAbsentDiv.style.display='none';
       
        document.getElementById('<%= AbsentDateText_6.ClientID %>').value='';
        document.getElementById('<%= AbsentDate_6.ClientID %>').value='';
        document.getElementById('<%= TableName_6.ClientID %>').value = '';        
        document.getElementById('<%= FieldName_6.ClientID %>').value = '';        
        document.getElementById('<%= FieldValue_6.ClientID %>').value = '';        
        document.getElementById('<%= AbsentReason_6.ClientID %>').value = '';        
        document.getElementById('<%= AbsentQuality_6.ClientID %>').value = '';
           

        if (dxDateText.value != '' || dxResult.value != '' || dxType.value != '' || dxNumOfTumors.value != '' || dxInstitution.value != '' || dxNotes.value != '')
            dxTarget.value = 'Liver';
        else
            dxTarget.value = '';

        if (findingValue == 'Tumor' )
        {
            var findingSubsiteString = RetrieveCheckBoxListSelectedValues (imgFindSubsite,"TABLE");
            
             if (findingSubsiteString != '' || imgFindWidth.value != '')
                imgFindSite.checked = true;
                
             if (imgFindSite.checked || findingSubsiteString != '' || imgFindWidth.value != '') 
                imgFindResult.value = findingValue;          
        }
        else if (findingValue == 'Distant metastases')
        {
            if (imgFindSite.value != '' )
                imgFindResult.checked = true;        
        }
        else if (findingValue == 'Lymphadenopathy')
        {
            if (imgFindWidth.value != '' )
                imgFindSite.checked = true;    
            
            if (imgFindSite.checked || imgFindWidth.value != '' )
                imgFindResult.value = findingValue;    
        }
        else if (findingValue == 'Vascular invasion' || findingValue == 'Ascites')
        {
            if (imgFindSite.checked)
                imgFindResult.value = findingValue;   
        }


                 
      }
      else if (Imagingoption_value == "No" || Imagingoption_value == "Unknown" || Imagingoption_value == "N/A")
      {
        ImaginghideAbsentDiv.style.display='block';
        ImaginghideDiv.style.display='none';
      
        document.getElementById('<%= TableName_6.ClientID %>').value = 'Diagnostics';        
        document.getElementById('<%= FieldName_6.ClientID %>').value = 'DxType';        
        document.getElementById('<%= FieldValue_6.ClientID %>').value = 'Imaging'; 
        
        if (Imagingoption_value == "No")       
            document.getElementById('<%= AbsentReason_6.ClientID %>').value = 'None Recorded';        
        else if (Imagingoption_value == "Unknown")       
            document.getElementById('<%= AbsentReason_6.ClientID %>').value = 'Unknown';
        else if (Imagingoption_value == "N/A")
            document.getElementById('<%= AbsentReason_6.ClientID %>').value = 'Not Applicable';

        document.getElementById('<%= AbsentEventPrefix.ClientID %>').innerHTML = document.getElementById('<%= AbsentReason_6.ClientID %>').value + ' as of ';

        document.getElementById('<%= AbsentQuality_6.ClientID %>').value = 'OUT';     
        
        dxDateText.value = '';
        dxDate.value = '';
        dxResult.value = '';
        dxType.value = '';
        dxTarget.value = '';
        dxInstitution.value = '';
        dxNumOfTumors.value = '';
        dxNotes.value = '';
        
        if (imgFindSite.type == 'checkbox')
            imgFindSite.checked = false;
        else
            imgFindSite.value = '';
            
         if (imgFindSubsite != null)
         {
            if (findingValue == 'Distant metastases')
                imgFindSubsite.value = '';
            else 
            {        
                ResetCheckBoxList(imgFindSubsite);
            }
         }
         
        if (imgFindWidth != null)
            imgFindWidth.value = '';           

         if (imgFindResult.type == 'checkbox')
            imgFindResult.checked = false;
        else
            imgFindResult.value = '';
                   

     }
    }

</script>