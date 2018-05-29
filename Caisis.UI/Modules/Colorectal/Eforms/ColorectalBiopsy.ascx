<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalBiopsy" CodeFile="ColorectalBiopsy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />

<%-- 
<script type="text/javascript">

function setPathDate(dateValue)
{
    var PathDateTextID = '<asp:Literal ID="PathDateTextID" runat="server" />';
    var PathDateID = '<asp:Literal ID="PathDateID" runat="server" />';
    
    if (dateValue && dateValue.length > 0 && PathDateTextID.length > 0 && PathDateID.length > 0)
    {
        alert(PathDateTextID);
        document.getElementById(PathDateTextID).value = dateValue;
        document.getElementById(PathDateID).value = dateValue;
    }
}

</script>
--%>


<script type="text/javascript">
function copyDates(sourceInput)
{
    var targetDateTextControl = document.getElementById('<% =PathDateText_Biopsy.ClientID %>');
    var targetDateControl = document.getElementById('<% =PathDate_Biopsy.ClientID %>');
    
    targetDateTextControl.value = sourceInput.value;
    fuzzyDate(targetDateTextControl, targetDateControl);

}

function siteSelectClick(selection_value)
{
      var listDiv = document.getElementById('BxsiteListDiv');
      var otherDiv = document.getElementById('BxsiteOtherDiv');
      if (selection_value == "List")
      {
        listDiv.style.display='block';
        otherDiv.style.display='none';
        
        clearElementsInParentRow(document.getElementById('otherTR')); 
      }
      else if(selection_value == "Other")
      {
        otherDiv.style.display='block';
        listDiv.style.display='none';
        
        clearElementsInParentRow(document.getElementById('listTR'));
      }
}

function  updateSite(site)
{
    document.getElementById('<% =BxOther.ClientID %>').value = site;
}

</script>


<a name="ColorectalBiopsy" id="ColorectalBiopsy" />
<span class="controlBoxTitle">Biopsy of Primary, Recurrent, Metastatic or Benign Lesion (Related to Current Visit)</span><br/>

    <%--Updates Encounter record(from prev page) with the values of BenignDisease or DiseaseExtent sections, whichever exists--%> 
    <euc:EformTextBox ID="EncChiefComplaint" Table="Encounters" Field="EncChiefComplaint" runat="server" style="display:none;width:1px;" />
    <euc:EformTextBox ID="EncNotes" TABLE="Encounters" FIELD="EncNotes" runat="server"  style="display:none;width:1px;" />
    
    <euc:EformTextBox ID="DisExtent" Table="NoTable" Field="DisExtent" runat="server" style="display:none;width:1px;" />
    <euc:EformTextBox ID="ColoPathType" TABLE="NoTable" FIELD="ColoPathType" runat="server" style="display:none;width:1px;" />
    <euc:EformTextBox ID="DisSite" TABLE="NoTable" FIELD="DisSite" runat="server"  style="display:none;width:1px;"/>
    <%--End--%>
    
<table border="0" cellspacing="0" cellpadding="16" width="650" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Date of Biopsy</strong>
		<euc:EformTextBox Runat="server" ID="ProcDateText" Table="Procedures" RecordId="1" FIELD="ProcDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="PathDateText_Biopsy,PathDate_Biopsy"  AppendToOnChange="copyDates(this);"  />
		<euc:EformHidden  Runat="server" ID="ProcDate" Table="Procedures" RecordId="1" Field="ProcDate"></euc:EformHidden>
		
		<euc:EformHidden  Runat="server" ID="PathDateText_Biopsy" Table="Pathology"  RecordId="1"  Field="PathDateText"></euc:EformHidden>
		<euc:EformHidden  Runat="server" ID="PathDate_Biopsy" Table="Pathology"  RecordId="1"  Field="PathDate"></euc:EformHidden>
		
		
		</td>
</tr>
<tr>	
	<td style="padding-top: 12px;">
	    <table>
	        <tr>
	            <td id="BiopsyTypeTd">
	                <strong>Biopsy Type</strong>
                    <euc:EformRadioButtonList Table="Procedures" RecordId="1" Field="ProcName" id="ProcName" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
                        <asp:ListItem  >FNA</asp:ListItem>
                        <asp:ListItem  >Tru-Cut Biopsy of Mass</asp:ListItem>
                        <asp:ListItem  >Incisional/Excisional Biopsy Mass/Polyp</asp:ListItem>
                        <asp:ListItem  >Pap Smear</asp:ListItem>
                      </euc:EformRadioButtonList>
                    <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('BiopsyTypeTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
	            </td>
	            <td>
	               <strong>Disease Extent</strong> 
		           <euc:EformExtendedCheckBoxList Table="ColorectalPath" RecordId="1" Field="PathDiseaseExtent" LookupCode="ColorectalDiseaseExtent" id="PathDiseaseExtent" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
                  </euc:EformExtendedCheckBoxList> 
	            </td>
	        </tr>
	    </table>
	</td>	
  </tr>
<tr>	
	<td style="padding-top: 12px;">
	    <table>
	        <tr>
	            <td><strong>Biopsy Site</strong></td>
	            <td><euc:EformRadioButtonList ID="BxSiteSelect" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" Table="NoTable" 
		    Field="BxSiteOther">
                <asp:ListItem Value="List" Text="Select from Standard List" Selected="True"></asp:ListItem> <%-- if these list texts are changed,change in JS function also--%>
                <asp:ListItem Value="Other" Text="Enter Other Site"></asp:ListItem> <%--Text should be anything except "Other" --%>
                                                                              <%-- to override builtin 'Other'--%>
        </euc:EformRadioButtonList></td>
	        </tr>
	    </table>
        
        <div id="BxsiteListDiv" style=" display:block;" >
        <euc:EformRadioButtonGroup Table="Procedures" Field="ProcSite" id="ProcSite" RecordId="1" GroupName="ProcSite" runat="server" >
        
        <table cellpadding="3" cellspacing="0" style="margin-top: 10px; border: solid 1px #dddddd; background-color: #f2f2f2;">
            <tr id="listTR">
                <td style="vertical-align: top;" nowrap>
                    <span style="font-size: 11px; font-weight: 900; margin-left: 13px;">Primary</span><br />
                    
                    <euc:EformRadioButton Id="Appendix" Value="Appendix" runat="server" Text="Appendix" onclick="updateSite('Appendix');"/><br />
                    <euc:EformRadioButton Id="RightColon" Value="Right Colon" runat="server" Text="Right Colon" onclick="updateSite('Right Colon');"/><br />
                    <euc:EformRadioButton Id="LeftColon" Value="Left Colon" runat="server" Text="Left Colon" onclick="updateSite('Left Colon');"/><br />
					<euc:EformRadioButton Id="TransverseColon" Value="Transverse Colon" runat="server" Text="Transverse Colon" onclick="updateSite('Transverse Colon');"/><br />
					<euc:EformRadioButton Id="SigmoidColon" Value="Sigmoid Colon" runat="server" Text="Sigmoid Colon" onclick="updateSite('Sigmoid Colon');"/><br />
                    <euc:EformRadioButton Id="Rectosigmoid" Value="Rectosigmoid" runat="server" Text="Rectosigmoid" onclick="updateSite('Rectosigmoid');"/><br />
                    <euc:EformRadioButton Id="Rectum" Value="Rectum" runat="server" Text="Rectum" onclick="updateSite('Rectum');"/><br />
                    <euc:EformRadioButton Id="Anus" Value="Anus" runat="server" Text="Anus" onclick="updateSite('Anus');"/><br />
                    <euc:EformRadioButton Id="SmallIntestine" Value="Small Intestine" runat="server" Text="Small Intestine" onclick="updateSite('Small Intestine');"/><br />
                    <euc:EformRadioButton Id="Pelvis" Value="Pelvis" runat="server" Text="Pelvis" onclick="updateSite('Pelvis');"/>                </td>
                <td style="vertical-align: top;" nowrap>
                    <span style="font-size: 11px; font-weight: 900; margin-left: 13px;">Recurrent/Metastatic</span><br />
                    <euc:EformRadioButton Id="AbdominalWallWound" Value="Abdominal Wall / Wound" runat="server" Text="Abdominal Wall / Wound" onclick="updateSite('Abdominal Wall / Wound');"/><br />
                    <euc:EformRadioButton Id="Anastomosis" Value="Anastomosis" runat="server" Text="Anastomosis" onclick="updateSite('Anastomosis');"/><br />
                    <euc:EformRadioButton Id="Bone" Value="Bone" runat="server" Text="Bone" onclick="updateSite('Bone');"/><br />
                    <euc:EformRadioButton Id="Brain" Value="Brain" runat="server" Text="Brain" onclick="updateSite('Brain');"/><br />
                    <euc:EformRadioButton Id="Liver" Value="Liver" runat="server" Text="Liver" onclick="updateSite('Liver');"/><br />
                    <euc:EformRadioButton Id="Lung" Value="Lung" runat="server" Text="Lung" onclick="updateSite('Lung');"/><br />
                    <euc:EformRadioButton Id="NonRegionalLymphNodes" Value="Non Regional Lymph Nodes" runat="server" Text="Non Regional Lymph Nodes" onclick="updateSite(this);"/><br />     
                    <euc:EformRadioButton Id="Omentum" Value="Omentum" runat="server" Text="Omentum" onclick="updateSite('Omentum');"/><br />
                    <euc:EformRadioButton Id="Peritoneum" Value="Peritoneum" runat="server" Text="Peritoneum" onclick="updateSite('Peritoneum');"/><br />
                    <euc:EformRadioButton Id="Presacrum" Value="Presacrum" runat="server" Text="Presacrum" onclick="updateSite('Presacrum');"/><br />
                </td>
                <td style="vertical-align: top;" nowrap>
                    <span style="font-size: 11px; font-weight: 900; margin-left: 13px;">&nbsp;</span><br />
                    <euc:EformRadioButton Id="Retroperitoneum" Value="Retroperitoneum" runat="server" Text="Retroperitoneum" onclick="updateSite('Retroperitoneum');"/><br />
					<euc:EformRadioButton Id="TransverseColon2" Value="Transverse Colon" runat="server" Text="Transverse Colon" onclick="updateSite('Transverse Colon');"/><br />
					<euc:EformRadioButton Id="Colon" Value="Colon" runat="server" Text="Colon" onclick="updateSite('Colon');"/><br />
                    <euc:EformRadioButton Id="Rectum2" Value="Rectum" runat="server" Text="Rectum" onclick="updateSite('Rectum');"/><br />
                    <euc:EformRadioButton Id="Ovary" Value="Ovary" runat="server" Text="Ovary" onclick="updateSite('Ovary');"/><br />
                    <euc:EformRadioButton Id="Pelvis2" Value="Pelvis" runat="server" Text="Pelvis" onclick="updateSite('Pelvis');"/>
					</td>					
	            <td style="vertical-align: top; padding-left: 24px;">
	            <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('listTR'));clearInputFields($('otherTR'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
                </td>
            </tr>
        </table>
        </euc:EformRadioButtonGroup>	
        </div>       
       
           <div  style=" display:none; position:relative;" id="BxsiteOtherDiv">
                <table>
                    <tr id="otherTR">
                        <td><euc:EformComboBox LookupCode="DxTarget" ID="BxOther" Table="Procedures" Field="ProcSite" RecordId="1" runat="server"/>
                        </td>
                    </tr>
                </table>
            </div>    
        </td>	
  </tr>
  <tr>
	<td style="padding-top: 12px;" id="ProcQualityTd">
		<strong>Biopsy performed at</strong>
		
		   <euc:EformRadioButtonList Table="Procedures" RecordId="1" Field="ProcQuality" id="ProcQuality" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server" >
                <asp:ListItem Value="STD" Text="MSKCC"></asp:ListItem>
                <asp:ListItem Value="OUT" Text="Outside"></asp:ListItem>
          </euc:EformRadioButtonList>
          <img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('ProcQualityTd'));"  style="cursor: pointer; margin-left: 20px; vertical-align: middle;" />
          </td>	
  </tr>
  <tr>
	<td style="padding-top: 12px;" id="PathQualityTd">
	
	    <%--
	    <euc:EformHidden  Runat="server" ID="PathDateText" Table="Pathology" RecordId="1" Field="PathDateText"></euc:EformHidden>
	    <euc:EformHidden  Runat="server" ID="PathDate" Table="Pathology" RecordId="1" Field="PathDate"></euc:EformHidden>
	    --%>
	    
	    
  		<strong>Biopsy Pathology Reviewed at</strong>
		   <euc:EformRadioButtonList Table="Pathology" RecordId="1" Field="PathQuality" id="PathQuality" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server"  >
                <asp:ListItem Value="STD" Text="MSKCC"></asp:ListItem>
                <asp:ListItem Value="OUT" Text="Outside"></asp:ListItem>
          </euc:EformRadioButtonList>
          <img src="../../Images/EFormDeleteRow.gif" onclick="clearInputFields($('PathQualityTd'));"  style="cursor: pointer; margin-left: 20px; vertical-align: middle;" />
          </td>	
  </tr>  
  <tr>
	<td style="padding-top: 12px;">
  		<strong>Accession Number</strong>
		<euc:EformTextBox Runat="server" ID="PathNum_1" Table="Pathology" RecordId="1" FIELD="PathNum" style="width:300px;"  ShowCalendar="False" CalcDate="False" class="InputText"  />	</td>	
  </tr>    
  <tr>
	<td style="padding-top: 12px;">
  		<strong>Biopsy Pathology (Histology)</strong>&nbsp;&nbsp;
  		
  		<euc:EformDropDownList Field="PathHistology" Table="Pathology" RecordId="1" id="PathHistology_1"  runat="server">
            <asp:ListItem Value="" Text=""  />
            <asp:ListItem Value="Adenoma" Text="Adenoma"  />
            <asp:ListItem Value="Adenoma with Dysplasia/CIS" Text="Adenoma with Dysplasia/CIS"  />
            <asp:ListItem Value="AIN 1" Text="AIN 1"  />
            <asp:ListItem Value="AIN 2" Text="AIN 2"  />
            <asp:ListItem Value="AIN 3" Text="AIN 3"  />
            <asp:ListItem Value="Carcinoid" Text="Carcinoid"  />
            <asp:ListItem Value="Crohn's with Dysplasia" Text="Crohn's with Dysplasia"  />
            <asp:ListItem Value="Gastro-Intestinal Stromal Tumor" Text="GIST"  />
            <asp:ListItem Value="Adenocarcinoma" Text="Adenocarcinoma"  />
            <asp:ListItem Value="Invasive Adenocarcinoma" Text="Invasive Adenocarcinoma"  />
            <asp:ListItem Value="Normal" Text="Normal"  />
            <asp:ListItem Value="Pagets" Text="Pagets"  />
            <asp:ListItem Value="Sarcoma" Text="Sarcoma"  />
            <asp:ListItem Value="Squamous Carcinoma" Text="Squamous Carcinoma"  />
            <asp:ListItem Value="Ulcerative Colitis with Dysplasia" Text="Ulcerative Colitis with Dysplasia"  />
                    </euc:EformDropDownList>	</td>	
	</tr>    
  <tr>
  	<td style="padding-top: 12px;">
	<table>
	    <tr>
	        <td style="width: 37%; vertical-align: top;" id="GradeDifferentiationTd">
	            <strong>Grade / Differentiation</strong> 
<%--        this hidden field used to be enabled by the Grade / Differentiation field below it, but that was going into the wrong table.  this is no longer necessary
  		    <euc:EformHidden  Runat="server" ID="PathStageDisease_1" Table="PathologyStageGrade" RecordId="1" Field="PathStageDisease" Value="Colorectal"></euc:EformHidden>--%>	     
            <euc:EformRadioButtonList Table="ColorectalPathFinding" Field="PathFindGrade" id="PathGrade_1" RecordId="1" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
                <asp:ListItem  >Well</asp:ListItem>
                <asp:ListItem  >Moderate</asp:ListItem>
                <asp:ListItem  >Poor/Undifferentiated</asp:ListItem>
                <asp:ListItem  >Not Evaluated</asp:ListItem>
                <asp:ListItem  >Not Applicable</asp:ListItem>            
              </euc:EformRadioButtonList>
                <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('GradeDifferentiationTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
                </td>
	        <td style="width: 40%; vertical-align: top;" id="LymphovascularInvasionTd">
	            <strong>Lymphovascular Invasion</strong> 
                <euc:EformRadioButtonList Table="ColorectalPathFinding" Field="PathFindVascularInv" LookupCode="ColorectalInvasion" id="PathFindVascularInv_1" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  ></euc:EformRadioButtonList>
                <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('LymphovascularInvasionTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
                
                </td>
	        <td style="width: 35%; vertical-align: top;" id="PerineuralInvasionTd">
	        <strong>Perineural Invasion</strong> 
            <euc:EformRadioButtonList Table="ColorectalPathFinding" Field="PathFindPerineuralInv" LookupCode="ColorectalInvasion" id="PathFindPerineuralInv_1" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >            </euc:EformRadioButtonList>
            <img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('PerineuralInvasionTd'));" style="cursor: pointer; margin-left: 7px; vertical-align: middle;" />
            </td>
	    </tr>
	</table>    </td>
  </tr>    
  <tr>
   <td style="padding-top: 12px;">
  		    <strong>Notes for this Biopsy</strong><br />
  		    <euc:EformTextArea TextMode="MultiLine" TABLE="Procedures" RecordId="1" FIELD="ProcNotes" Rows="12" style="width:550px;" Runat="server" ID="ProcNotes"/>	    </td>	
  </tr>
</table>