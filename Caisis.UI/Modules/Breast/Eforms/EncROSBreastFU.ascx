<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.EncROSBreastFU" CodeFile="EncROSBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
    
    tableArray.BreastComplaintsTbl2="BreastComplaintsTbl2";
    tableArray.BreastComplicationsTbl="BreastComplicationsTbl";

    function ShowHidePtComplaintsTR(option_value)
    {
      var BreastComplaintsDetailsTR = $('BreastComplaintsDetails');
      var BreastComplaintsDetailsOtherTR = $('BreastComplaintsDetailsOther');
      if (option_value == "Yes")
      {
        BreastComplaintsDetailsTR.style.display='block';
        BreastComplaintsDetailsOtherTR.style.display='block';
      } 
      else if (option_value == "No")
      {
        BreastComplaintsDetailsTR.style.display='none';
        BreastComplaintsDetailsOtherTR.style.display='none';
        
        //clears row data
        for(var i=1;i<=6;i++)
        {
            clearElementsInParentRow(document.getElementById('BreastCompltsTbl1Tr'+i));
        }
        for(var j=1;j<=3;j++)
        {
            clearElementsInParentRow(document.getElementById('BreastCompltsTbl2Tr'+j));
        }
        for(var k=1;k<=4;k++)
        {
            clearElementsInParentRow(document.getElementById('BreastCompltsTbl3Tr'+k));
        }
        for(var l=7;l<=10;l++)
        {
            clearElementsInParentRow(document.getElementById('BreastComplaintsTr'+l));
        }
        
      }
    }

</script>

<a name="StatusBreastFU" /><span class="controlBoxTitle">Interval Patient Complaints</span> <br/>

<table border="0" cellspacing="0" cellpadding="16" width="650" class="eformXLargePopulatedTable">
 <tr >
    <td style="white-space:nowrap;"><strong>Any Complaints Reported ?</strong></td>
	<td style="text-align:left; padding-right:250px;"><euc:EformRadioButtonList Table="NoTable" Field="ComplaintsYesNo" id="ComplaintsYesNo" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
  
 <tr id="BreastComplaintsDetails" style="display: none;">
     <td colspan="2">
        <table cellpadding="5" cellspacing="0">
          <tr>
	        <td ><strong>Encounter Date</strong></td>
	        <td><euc:EformTextBox RecordId="1" Width="90px" TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_1" 
	            ReadOnly="true"/> <span style="font-size: 10px; color: #666666;">(Note: This date is set on the first page of this EForm.)</span></td>
	      </tr>
	      </table><br />
	      
	      <table width="650" cellpadding="3" cellspacing="0" border="1" style="border: solid 1px #cccccc; background-color:white;" >
	        <tr>
	            <td valign="top">
	                <table width="250" cellpadding="3" cellspacing="0" border="1" style="border: solid 1px #cccccc; background-color:white;" id="BreastCompltsTbl1">  
	                    <tr>
	                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Patient Complaints - Breast</td>
	                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('BreastCompltsTbl1', 1, 4);" /><br />Yes</td>
	                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('BreastCompltsTbl1', 2, 4);" /><br />No</td>
	                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
                          </tr>
          
                        <tr id="BreastCompltsTbl1Tr1">
                            <td valign="top" class="ControlBoxLinedRowsShaded">Breast Mass</td>
                            <td class="ControlBoxLinedRows" align="center">
		                        <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_BreastMass" RecordId="1" GroupName="BreastMass" runat="server"
			                        Field1="ROS_System" Value1="Breast"
			                        Field2="ROS_Symptom" Value2="Breast Mass">
			                        <euc:EformRadioButton Id="BreastMassAbnormal" Value="Abnormal" runat="server"/>	</td>
                            <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="BreastMassNotDone" Value="Not Done" 
                                runat="server"/>
		                        </euc:EformRadioButtonGroup>	</td>
	                    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server"/></td>
                      </tr>
          
                        <tr id="BreastCompltsTbl1Tr2">
                            <td valign="top" class="ControlBoxLinedRowsShaded">Nipple Discharge</td>
                                <td class="ControlBoxLinedRows" align="center">
		                            <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_NippleDischarge" RecordId="2" GroupName="NippleDischarge" runat="server"
			                            Field1="ROS_System" Value1="Breast"
			                            Field2="ROS_Symptom" Value2="Nipple Discharge">
			                            <euc:EformRadioButton Id="NippleDischargeAbnormal" Value="Abnormal" runat="server"/>	</td>
                                <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="NippleDischargeNotDone" Value="Not Done" 
                                    runat="server"/>
		                            </euc:EformRadioButtonGroup>	</td>
	                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server"/></td>	        
                          </tr>
          
                        <tr id="BreastCompltsTbl1Tr3">
                            <td valign="top" class="ControlBoxLinedRowsShaded">Abnormal Imaging</td>
                                <td class="ControlBoxLinedRows" align="center">
		                            <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_AbnormalImaging" RecordId="3" GroupName="AbnormalImaging" runat="server"
			                            Field1="ROS_System" Value1="Breast"
			                            Field2="ROS_Symptom" Value2="Abnormal Imaging">
			                            <euc:EformRadioButton Id="AbnormalImagingAbnormal" Value="Abnormal" runat="server"/>	</td>
                                <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="AbnormalImagingNotDone" Value="Not Done" 
                                    runat="server"/>
		                            </euc:EformRadioButtonGroup>	</td>
	                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server"/></td>
                          </tr>
          
                        <tr id="BreastCompltsTbl1Tr4">
                            <td valign="top" class="ControlBoxLinedRowsShaded">Breast Biopsy</td>
                                <td class="ControlBoxLinedRows" align="center">
		                            <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_BreastBx" RecordId="4" GroupName="Breast Biopsy" runat="server"
			                            Field1="ROS_System" Value1="Breast"
			                            Field2="ROS_Symptom" Value2="BreastBx">
			                            <euc:EformRadioButton Id="BreastBxAbnormal" Value="Abnormal" runat="server"/>	</td>
                                <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="BreastBxNotDone" Value="Not Done" 
                                    runat="server"/>
		                            </euc:EformRadioButtonGroup>	</td>
	                       <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server"/></td>
                          </tr>
          
                        <tr id="BreastCompltsTbl1Tr5">
                            <td valign="top" class="ControlBoxLinedRowsShaded">Chest Wall Mass</td>
                                <td class="ControlBoxLinedRows" align="center">
		                            <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_ChestWallMass" RecordId="5" GroupName="ChestWallMass" runat="server"
			                            Field1="ROS_System" Value1="Breast"
			                            Field2="ROS_Symptom" Value2="Chest Wall Mass">
			                            <euc:EformRadioButton Id="ChestWallMassAbnormal" Value="Abnormal" runat="server"/>	</td>
                                <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="ChestWallMassNotDone" Value="Not Done" 
                                    runat="server"/>
		                            </euc:EformRadioButtonGroup>	</td>
	                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
                          </tr>
          
                        <tr id="BreastCompltsTbl1Tr6">
                            <td valign="top" class="ControlBoxLinedRowsShaded">Breast Pain</td>
                                <td class="ControlBoxLinedRows" align="center">
		                            <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_BreastPain" RecordId="6" GroupName="BreastPain" runat="server"
			                            Field1="ROS_System" Value1="Breast"
			                            Field2="ROS_Symptom" Value2="Breast Pain">
			                            <euc:EformRadioButton Id="BreastPainAbnormal" Value="Abnormal" runat="server"/>	</td>
                                <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="BreastPainNotDone" Value="Not Done" 
                                    runat="server"/>
		                            </euc:EformRadioButtonGroup>	</td>
	                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
                          </tr>
                    </table>
	            </td>
	            
	            <td valign="top">
	                <table width="225" cellpadding="3" cellspacing="0" border="1" style="border: solid 1px #cccccc; background-color:white;" id="BreastCompltsTbl2">  
	                    <tr>
	                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Complications</td>
	                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('BreastCompltsTbl2', 1, 4);" /><br />Yes</td>
	                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('BreastCompltsTbl2', 2, 4);" /><br />No</td>
	                        <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
                       </tr>
          
                        <tr id="BreastCompltsTbl2Tr1">	        
	                        <td valign="top" class="ControlBoxLinedRowsShaded">Cellulitis</td>	                
                            <td class="ControlBoxLinedRowsShaded" align="center">
	                            <euc:EformRadioButtonGroup Table="NoTable" Field="CellulitisYesNo" id="CellulitisYesNo" 
	                                GroupName="CellulitisYesNo" runat="server" >
                                    <euc:EformRadioButton Id="CellulitisYes" Value="Yes" runat="server"/>	</td>
                                <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="CellulitisNo" Value="No" runat="server"/>
	                            </euc:EformRadioButtonGroup>
                		        
	                            <euc:EFormTextBox RecordId="1" style="width:1px;display:none;" TABLE="Toxicities" FIELD="ToxName" 
	                                Runat="server" ID="ToxName_1"/>
                	            
	                            <euc:EformTextBox RecordId="1" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" 
	                                ID="ToxDateText_1"/>
	                            <euc:EformHidden RecordId="1" TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_1"/>
	                            <euc:EformTextBox RecordId="1" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
	                                ID="ToxQuality_1"/></td>
	                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
                          </tr>
          
                        <tr id="BreastCompltsTbl2Tr2">		        
	                        <td valign="top" class="ControlBoxLinedRowsShaded">Lymphedema</td>
                	        <td class="ControlBoxLinedRowsShaded" align="center">
	                            <euc:EformRadioButtonGroup Table="NoTable" Field="LymphedemaYesNo" id="LymphedemaYesNo" 
	                                GroupName="LymphedemaYesNo" runat="server" >
                                    <euc:EformRadioButton Id="LymphedemaYes" Value="Yes" runat="server"/>	</td>
                                <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="LymphedemaNo" Value="No" runat="server"/>
	                            </euc:EformRadioButtonGroup>
                		        
	                            <euc:EFormTextBox RecordId="2" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxName" Runat="server" 
	                                ID="ToxName_2"/>
                	            
	                            <euc:EformTextBox RecordId="2" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" 
	                                ID="ToxDateText_2"/>
	                            <euc:EformHidden RecordId="2" TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_2"/>
	                            <euc:EformTextBox RecordId="2" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
	                                ID="ToxQuality_2"/></td>
	                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
                          </tr>
          
                        <tr id="BreastCompltsTbl2Tr3">
	                        <td valign="top" class="ControlBoxLinedRowsShaded">Wound Problem</td>
                	                
                            <td class="ControlBoxLinedRowsShaded" align="center">
	                            <euc:EformRadioButtonGroup Table="NoTable" Field="WoundProblemYesNo" id="WoundProblemYesNo" 
	                                GroupName="WoundProblemYesNo" runat="server" >
                                    <euc:EformRadioButton Id="WoundProblemYes" Value="Yes" runat="server"/>	</td>
                                <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="WoundProblemNo" Value="No" runat="server"/>
	                            </euc:EformRadioButtonGroup>
                		        
	                            <euc:EFormTextBox RecordId="3" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxName" Runat="server" 
	                                ID="ToxName_3"/>
                	                
	                            <euc:EformTextBox RecordId="3" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxDateText" Runat="server" 
	                                ID="ToxDateText_3"/>
	                            <euc:EformHidden RecordId="3" TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_3"/>
	                            <euc:EformTextBox RecordId="3" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
	                                ID="ToxQuality_3"/></td>
	                        <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
                          </tr>            
                    </table>
	            </td>
	            
	            <td valign="top">
	                <table width="250" cellpadding="3" cellspacing="0" border="1" style="border: solid 1px #cccccc; background-color:white;" id="BreastCompltsTbl3">  
	                    <tr>
	                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Patient Complaints - Other</td>
	                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('BreastCompltsTbl3', 1, 4);" /><br />Yes</td>
	                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('BreastCompltsTbl3', 2, 4);" /><br />No</td>
	                    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">&nbsp;</td>
                      </tr>
          
                        <tr id="BreastCompltsTbl3Tr1">	        
	                    <td valign="top" class="ControlBoxLinedRowsShaded">Weight Loss</td>
                            <td class="ControlBoxLinedRows" align="center">
		                        <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_WeightLoss" RecordId="7" GroupName="WeightLoss" runat="server"
			                        Field1="ROS_System" Value1="Breast"
			                        Field2="ROS_Symptom" Value2="Weight Loss">
			                        <euc:EformRadioButton Id="WeightLossAbnormal" Value="Abnormal" runat="server"/>	</td>
                            <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="WeightLossNotDone" Value="Not Done" 
                                runat="server"/>
		                        </euc:EformRadioButtonGroup>	</td>
	                    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
                      </tr>
          
                        <tr id="BreastCompltsTbl3Tr2">
	                    <td valign="top" class="ControlBoxLinedRowsShaded">Bone Pain</td>
                            <td class="ControlBoxLinedRows" align="center">
		                        <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_BonePain" RecordId="8" GroupName="BonePain" runat="server"
			                        Field1="ROS_System" Value1="Breast"
			                        Field2="ROS_Symptom" Value2="Bone Pain">
			                        <euc:EformRadioButton Id="BonePainAbnormal" Value="Abnormal" runat="server"/>	</td>
                            <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="BonePainNotDone" Value="Not Done" 
                                runat="server"/>
		                        </euc:EformRadioButtonGroup>	</td>
	                    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
                      </tr>
          
                        <tr id="BreastCompltsTbl3Tr3">
	                    <td valign="top" class="ControlBoxLinedRowsShaded">SOB/ Cough</td>
                            <td class="ControlBoxLinedRows" align="center">
		                        <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_SOBCough" RecordId="9" GroupName="SOBCough" runat="server"
			                        Field1="ROS_System" Value1="Breast"
			                        Field2="ROS_Symptom" Value2="SOB/ Cough">
			                        <euc:EformRadioButton Id="SOBCoughAbnormal" Value="Abnormal" runat="server"/>	</td>
                            <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="SOBCoughNotDone" Value="Not Done" 
                                runat="server"/>
		                        </euc:EformRadioButtonGroup>	</td>
	                    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
                      </tr>
          
                        <tr id="BreastCompltsTbl3Tr4">
                        <td valign="top" class="ControlBoxLinedRowsShaded">Depression</td>
                            <td class="ControlBoxLinedRows" align="center">
		                        <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result_Depression" RecordId="10" GroupName="Depression" runat="server"
			                        Field1="ROS_System" Value1="Breast"
			                        Field2="ROS_Symptom" Value2="Depression">
			                        <euc:EformRadioButton Id="DepressionAbnormal" Value="Abnormal" runat="server"/>	</td>
                            <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="DepressionNotDone" Value="Not Done" 
                                runat="server"/>
		                        </euc:EformRadioButtonGroup>	</td>
	                    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
                      </tr>
            
                    </table>
	            </td>
	        </tr>
	      </table>
      </td>
  </tr>
  
  <tr id="BreastComplaintsDetailsOther" style="display: none;">
    <td colspan="2">
        <span class="controlBoxTitle">Review of Systems</span> <br/>
        <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BreastComplaintsTbl2">  
	      <tr>
	        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">System</td>
	        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Symptom</td>
	        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Related To</td>
	        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Presenting</td>
	        <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
          </tr>
          
          <tr id="BreastComplaintsTr7">	         
            <td align="center"><euc:EFormDropDownList RecordId="11" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                ID="ROS_System_11" LookupCode="BodySystem"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="11" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" 
	            Runat="server" ID="ROS_Symptom_11" LookupCode="ROS_Symptom"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="11" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" 
	            Runat="server" ID="ROS_RelatedTo_11" LookupCode="RelatedTo"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="11" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Presenting" 
	            Runat="server" ID="ROS_Presenting_11" LookupCode="ROS_Presenting"/></td>
	        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" 
	            style="cursor:pointer;"/></td>
          </tr>
          
          <tr style="display:none;" id="BreastComplaintsTr8">
            <td align="center"><euc:EFormDropDownList RecordId="12" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                ID="ROS_System_12" LookupCode="BodySystem"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="12" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" 
	            Runat="server" ID="ROS_Symptom_12" LookupCode="ROS_Symptom"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="12" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" 
	            Runat="server" ID="ROS_RelatedTo_12" LookupCode="RelatedTo"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="12" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Presenting" 
	            Runat="server" ID="ROS_Presenting_12" LookupCode="ROS_Presenting"/></td>
	        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" 
	            style="cursor:pointer;"/></td>
          </tr>
          <tr style="display:none;" id="BreastComplaintsTr9">
            <td align="center"><euc:EFormDropDownList RecordId="13" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                ID="ROS_System_13" LookupCode="BodySystem"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="13" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" 
	            Runat="server" ID="ROS_Symptom_13" LookupCode="ROS_Symptom"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="13" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" 
	            Runat="server" ID="ROS_RelatedTo_13" LookupCode="RelatedTo"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="13" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Presenting" 
	            Runat="server" ID="ROS_Presenting_13" LookupCode="ROS_Presenting"/></td>
	        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" 
	            style="cursor:pointer;"/></td>
          </tr>
          <tr style="display:none;" id="BreastComplaintsTr10">
            <td align="center"><euc:EFormDropDownList RecordId="14" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" 
                ID="ROS_System_14" LookupCode="BodySystem"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="14" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" 
	            Runat="server" ID="ROS_Symptom_14" LookupCode="ROS_Symptom"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="14" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" 
	            Runat="server" ID="ROS_RelatedTo_14" LookupCode="RelatedTo"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="14" Width="100px" TABLE="EncReviewOfSystems" FIELD="ROS_Presenting" 
	            Runat="server" ID="ROS_Presenting_14" LookupCode="ROS_Presenting"/></td>
	        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" 
	            style="cursor:pointer;"/></td>
          </tr>
       </table>
         <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" 
            onclick="return showFirstAdditionalRow(this,'BreastComplaintsTbl2');" /><br /><br />
    </td>
  </tr>
</table><br /><br />


<span class="controlBoxTitle">Complications - Other</span> <br/>
<table border="0" cellspacing="0" cellpadding="16" width="350" >
  <tr id="BreastComplicationDetails">
     <td style="padding: 0px;" colspan="3">
        <table width="350" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="BreastComplicationsTbl">
          <tr>
	        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
	        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Toxicities/Complication</td>
	        <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
          </tr> 
          
          <tr id="BreastComplicationsTr4">
            <td><euc:EformTextBox RecordId="4" ShowCalendar="True" CalcDate="True" Width="90px" TABLE="Toxicities" FIELD="ToxDateText" 
	            Runat="server" ID="ToxDateText_4"/>
	            <euc:EformHidden RecordId="4" TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_4"/>
	            <euc:EformTextBox RecordId="4" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
	                ID="ToxQuality_4"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="4" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_4" 
	            LookupCode="ToxName_Complication"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          <tr style="display:none;" id="BreastComplicationsTr5">
            <td><euc:EformTextBox RecordId="5" ShowCalendar="True" CalcDate="True" Width="90px" TABLE="Toxicities" FIELD="ToxDateText" 
	            Runat="server" ID="ToxDateText_5"/>
	            <euc:EformHidden RecordId="5" TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_5"/>
	            <euc:EformTextBox RecordId="5" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
	                ID="ToxQuality_5"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="5" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_5" 
	            LookupCode="ToxName_Complication"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          <tr style="display:none;" id="BreastComplicationsTr6">
            <td><euc:EformTextBox RecordId="6" ShowCalendar="True" CalcDate="True" Width="90px" TABLE="Toxicities" FIELD="ToxDateText" 
	            Runat="server" ID="ToxDateText_6"/>
	            <euc:EformHidden RecordId="6" TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_6"/>
	            <euc:EformTextBox RecordId="6" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
	                ID="ToxQuality_6"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="6" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_6" 
	            LookupCode="ToxName_Complication"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          <tr style="display:none;" id="BreastComplicationsTr7">
            <td><euc:EformTextBox RecordId="7" ShowCalendar="True" CalcDate="True" Width="90px" TABLE="Toxicities" FIELD="ToxDateText" 
	            Runat="server" ID="ToxDateText_7"/>
	            <euc:EformHidden RecordId="7" TABLE="Toxicities" FIELD="ToxDate" Runat="server" ID="ToxDate_7"/>
	            <euc:EformTextBox RecordId="7" style="display:none;width:1px;" TABLE="Toxicities" FIELD="ToxQuality" Runat="server" 
	                ID="ToxQuality_7"/></td>
	        <td align="center"><euc:EFormDropDownList RecordId="7" TABLE="Toxicities" FIELD="ToxName" Runat="server" ID="ToxName_7" 
	            LookupCode="ToxName_Complication"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
          </tr>
          
        </table>
        <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" 
            onclick="return showFirstAdditionalRow(this,'BreastComplicationsTbl');" /><br /><br />
      </td>
  </tr>
</table><br /><br />




<script type="text/javascript">

    //Adds events to complication controls
    function addPtComplicationEvents(ComplicationYes,ComplicationNo,ComplicationValue,ComplicationLbl,ComplicationQlty,ComplicationDtTxt,ComplicationDt,encDate)
    {
        $(ComplicationYes).addEvent('click',curry(ComplicationAutoPopulates,ComplicationYes,ComplicationNo,ComplicationValue,ComplicationLbl,ComplicationQlty,ComplicationDtTxt,ComplicationDt,encDate));
        $(ComplicationNo).addEvent('click',curry(ComplicationAutoPopulates,ComplicationYes,ComplicationNo,ComplicationValue,ComplicationLbl,ComplicationQlty,ComplicationDtTxt,ComplicationDt,encDate));
    }
    
    addPtComplicationEvents($('<%= CellulitisYes.ClientID %>'),$('<%= CellulitisNo.ClientID %>'),$('<%= ToxName_1.ClientID %>'),'Cellulitis',$('<%= ToxQuality_1.ClientID %>'),$('<%= ToxDateText_1.ClientID %>'),$('<%= ToxDate_1.ClientID %>'),$('<%= EncDateText_1.ClientID %>'));
    addPtComplicationEvents($('<%= LymphedemaYes.ClientID %>'),$('<%= LymphedemaNo.ClientID %>'),$('<%= ToxName_2.ClientID %>'),'Lymphedema',$('<%= ToxQuality_2.ClientID %>'),$('<%= ToxDateText_2.ClientID %>'),$('<%= ToxDate_2.ClientID %>'),$('<%= EncDateText_1.ClientID %>'));
    addPtComplicationEvents($('<%= WoundProblemYes.ClientID %>'),$('<%= WoundProblemNo.ClientID %>'),$('<%= ToxName_3.ClientID %>'),'Wound Problem',$('<%= ToxQuality_3.ClientID %>'),$('<%= ToxDateText_3.ClientID %>'),$('<%= ToxDate_3.ClientID %>'),$('<%= EncDateText_1.ClientID %>'));
    

    function ComplicationAutoPopulates(ComplicationYes,ComplicationNo,ComplicationValue,ComplicationLbl,ComplicationQlty,ComplicationDtTxt,ComplicationDt,encDate)
    {
        if(ComplicationYes.checked)
        {
            ComplicationValue.value = ComplicationLbl;
            ComplicationQlty.value = 'STD';
            ComplicationDtTxt.value = encDate.value;
            ComplicationDt.value = encDate.value;
        }
        else if(ComplicationNo.checked)
        {
            ComplicationValue.value = '';
            ComplicationQlty.value = '';
            ComplicationDtTxt.value = '';
            ComplicationDt.value = '';
        }
    }    
    
    function addToxicityEvents(toxName, toxQlty)
    {
        $(toxName).addEvent('blur',curry(ToxicityAutoPopulates,toxName, toxQlty));
    }
    
    addToxicityEvents($('<%= ToxName_4.ClientID %>'),$('<%= ToxQuality_4.ClientID %>'));
    addToxicityEvents($('<%= ToxName_5.ClientID %>'),$('<%= ToxQuality_5.ClientID %>'));
    addToxicityEvents($('<%= ToxName_6.ClientID %>'),$('<%= ToxQuality_6.ClientID %>'));
    addToxicityEvents($('<%= ToxName_7.ClientID %>'),$('<%= ToxQuality_7.ClientID %>'));
    

    function ToxicityAutoPopulates(toxName, toxQlty)
    {
       if (toxName.value != '')
        {
           toxQlty.value = 'STD';
        }
        else
        {
            toxQlty.value = '';
        }
    }
    
</script>