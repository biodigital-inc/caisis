<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalResection" CodeFile="ColorectalResection.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
function copyDates(sourceInput)
{
    var targetDateTextControl = document.getElementById('<% =ProcDateText_Resection.ClientID %>');
    var targetDateControl = document.getElementById('<% =ProcDate_Resection.ClientID %>');
    
    targetDateTextControl.value = sourceInput.value;
    fuzzyDate(targetDateTextControl, targetDateControl);
}
</script>



<a name="ColorectalResection" id="ColorectalResection" />
<span class="controlBoxTitle">Resection (Primary / Recurrent / Metastatic)</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<strong>Pathology Date</strong>
		<euc:EformTextBox Runat="server" ID="PathDateText" Table="Pathology"  RecordId='3' FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText" EnableHiddenOnUIEvent="ProcName_Resection,ProcDateText_Resection,ProcDate_Resection" AppendToOnChange="copyDates(this);"  />
		<euc:EformHidden  Runat="server" ID="PathDate" Table="Pathology"  RecordId='3' Field="PathDate" ></euc:EformHidden>
		<euc:EformHidden  Runat="server" ID="ProcName_Resection" Table="Procedures"  RecordId='3' Field="ProcName"  Value="Resection"></euc:EformHidden>
		
		<euc:EformHidden  Runat="server" ID="ProcDateText_Resection" Table="Procedures"  RecordId='3' Field="ProcDateText"></euc:EformHidden>
		<euc:EformHidden  Runat="server" ID="ProcDate_Resection" Table="Procedures"  RecordId='3' Field="ProcDate"></euc:EformHidden>


	</td>
</tr>

<tr>
	
	<td style="padding-top: 12px;">
		<strong>Location of Specimen</strong> 
  		<euc:EformDropDownList Field="PathSite" Table="Pathology"  RecordId='3' id="PathSite_2"  runat="server">

            <asp:ListItem Value="" Text=""  />
            <asp:ListItem Value="Abdominal Wall" Text="Abdominal Wall"  />
            <asp:ListItem Value="Anal Canal" Text="Anal Canal"  />
            <asp:ListItem Value="Anastomosis" Text="Anastomosis"  />
            <asp:ListItem Value="Appendix" Text="Appendix"  />
            <asp:ListItem Value="Bone" Text="Bone"  />
            <asp:ListItem Value="Colon" Text="Colon"  />
            <asp:ListItem Value="Liver" Text="Liver"  />
            <asp:ListItem Value="Lung" Text="Lung"  />
            <asp:ListItem Value="Lymph Node" Text="Lymph Node"  />
            <asp:ListItem Value="Omentum" Text="Omentum"  />
            <asp:ListItem Value="Peritoneum" Text="Peritoneum"  />
            <asp:ListItem Value="Pelvis/Presacrum" Text="Pelvis/Presacrum"  />
            <asp:ListItem Value="Rectum" Text="Rectum"  />
            <asp:ListItem Value="Retroperitoneum" Text="Retroperitoneum"  />
            <asp:ListItem Value="Small Intestine" Text="Small Intestine"  />
            <asp:ListItem Value="Transverse Colon" Text="Transverse Colon"  />

        </euc:EformDropDownList>


	</td>	
  </tr>
  
  <tr>
	
	<td style="padding-top: 12px;">
	<table>
	<tr>
	<td style="width: 35%; vertical-align: top;">
	<strong>Result</strong> 
 
		   <euc:EformRadioButtonList Table="Pathology"  RecordId='3' Field="PathResult" id="PathResult_2" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
            <asp:ListItem  >Malignant</asp:ListItem>
            <asp:ListItem  >Premalignant</asp:ListItem>
            <asp:ListItem  >Non neoplastic</asp:ListItem>
            <asp:ListItem  >Unknown</asp:ListItem>
            
          </euc:EformRadioButtonList>
	</td>
	<td style="width: 35%; vertical-align: top;">
	<strong>Disease Extent at This Resection</strong> 
 
		   <euc:EformExtendedCheckBoxList Table="ColorectalPath" RecordId="2" Field="PathDiseaseExtent" LookupCode="ColorectalDiseaseExtent" id="PathDiseaseExtent" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
          </euc:EformExtendedCheckBoxList>
	</td>
	</tr>
	</table>
	</td>	
  </tr>
 <tr>
	<td style="padding-top: 12px;">
  		<strong>Pathology (Histology)</strong>&nbsp;&nbsp;
  		
  		<euc:EformDropDownList Field="PathHistology" Table="Pathology"   RecordId='3' id="PathHistology"  runat="server">

            <asp:ListItem Value="" Text=""  />
            <asp:ListItem Value="No residual tumor" Text="No residual tumor"  />
            <asp:ListItem Value="" Text="-- Malignant --"  />
            <asp:ListItem Value="Adenocarcinoma" Text="Adenocarcinoma"  />
            <asp:ListItem Value="Carcinoid" Text="Carcinoid"  />
            <asp:ListItem Value="Chordoma" Text="Chordoma"  />
            <asp:ListItem Value="Gastro-Intestinal Stromal Tumor" Text="GIST"  />
            <asp:ListItem Value="Lymphoma" Text="Lymphoma"  />
            <asp:ListItem Value="Pseudomyxoma" Text="Pseudomyxoma"  />
            <asp:ListItem Value="Sarcoma" Text="Sarcoma"  />
            <asp:ListItem Value="Teratocarcinoma" Text="Teratocarcinoma"  />
            <asp:ListItem Value="" Text="-- Non Neoplastic  --"  />
            <asp:ListItem Value="Crohn's disease" Text="Crohn's disease"  />
            <asp:ListItem Value="Fistula" Text="Fistula"  />
            <asp:ListItem Value="Ulcerative colitis" Text="Ulcerative colitis"  />
            <asp:ListItem Value="" Text="-- Pre Malignant --"  />
            <asp:ListItem Value="Adenomatous Polyp" Text="Adenomatous Polyp"  />
            <asp:ListItem Value="Anal Intraepithelial Neoplasia (AIN)" Text="Anal Intraepithelial Neoplasia (AIN)"  />
            <asp:ListItem Value="Carcinoma In Situ" Text="Carcinoma In Situ"  />
            <asp:ListItem Value="Familial Adenomatous Polyposis" Text="Familial Adenomatous Polyposis"  />
            <asp:ListItem Value="Paget's Disease" Text="Paget's Disease"  />
            <asp:ListItem Value="Squamous Cell" Text="Squamous Cell"  />
            <asp:ListItem Value="Teratoma" Text="Teratoma"  />            
        </euc:EformDropDownList>
	</td>	
  </tr> 
 <tr>
	<td style="padding-top: 12px;">
  		<strong>Accession Number</strong>
		<euc:EformTextBox Runat="server" ID="PathNum_2" Table="Pathology"  RecordId='3' FIELD="PathNum" style="width:200px;"  ShowCalendar="False" CalcDate="False" class="InputText"  />

	</td>	
  </tr>    <tr>
	<td style="padding-top: 12px;">
		<strong>Procedure performed at</strong>
		
		   <euc:EformRadioButtonList Table="Pathology"  RecordId='3' Field="PathInstitution" id="PathInstitution" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server" >
            <asp:ListItem Value="STD"></asp:ListItem>
            <asp:ListItem Value="OUT" Text="Outside"></asp:ListItem> 
          </euc:EformRadioButtonList>
		

	</td>	
  </tr>
  <tr>
	<td style="padding-top: 12px;">
  		<strong>Biopsy Pathology Reviewed at</strong>
		   <euc:EformRadioButtonList Table="Pathology"  RecordId='3' Field="PathQuality" id="PathQuality" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server" >
            <asp:ListItem Value="STD"></asp:ListItem>
            <asp:ListItem Value="OUT" Text="Outside"></asp:ListItem> 
          </euc:EformRadioButtonList>

	</td>	
  </tr>  
 <tr>
	<td style="padding-top: 12px;">
  		<strong>ICD Code</strong>
		<euc:EformTextBox Runat="server" ID="PathICD9_Code" Table="ColorectalPath" RecordId="2" FIELD="PathICD9_Code" style="width:100px;"  ShowCalendar="False" CalcDate="False" class="InputText"  />

	</td>	
  </tr>
  
  
  
      
</table>
<br/><br/><br/>
