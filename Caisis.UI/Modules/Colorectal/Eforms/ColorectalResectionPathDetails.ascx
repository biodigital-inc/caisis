<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColorectalResectionPathDetails" CodeFile="ColorectalResectionPathDetails.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="ColorectalResectionPathDetails" id="ColorectalResectionPathDetails" />
<span class="controlBoxTitle">Resected Path Details</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		<strong>Tumor Gross Configuration</strong>  
 
		   <euc:EformRadioButtonList Table="ColorectalPathFinding" RecordId="3" Field="PathFindConfiguration" id="PathFindConfiguration" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
            <asp:ListItem  >Polypoid</asp:ListItem>
            <asp:ListItem  >Fungating</asp:ListItem>
            <asp:ListItem  >Plaque-like</asp:ListItem>
            <asp:ListItem  >Anular/Constrictive</asp:ListItem>
            <asp:ListItem  >Ulcerating diffuse (linitis plastica type)</asp:ListItem>
            <asp:ListItem  >Non applicable</asp:ListItem>
          </euc:EformRadioButtonList>
	</td>
</tr>
 <tr>
	<td style="padding-top: 12px;">
  		<strong>Tumor Maximum Dimension</strong>
		<euc:EformTextBox Runat="server" ID="PathFindTumorMaxDim" Table="ColorectalPathFinding"  RecordId="3" FIELD="PathFindTumorMaxDim" style="width:100px;"  ShowNumberPad="true" class="InputText"  /> cm   

	</td>	
</tr>
 <tr >
	<td style="padding-top: 20px;">
	<table>
	<tr>
	<td style="width: 32%; vertical-align: top;">
	<strong>Proximal Margin</strong>  
 		   <euc:EformRadioButtonList Table="ColorectalPathFinding"  RecordId="3" Field="PathFindProximalMargin" id="PathFindProximalMargin" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server" >
            <asp:ListItem  >Uninvolved</asp:ListItem>
            <asp:ListItem  >Close (<2mm/1hpf)</asp:ListItem>
            <asp:ListItem  >Involved/Positive</asp:ListItem>
            <asp:ListItem  >Not Evaluated</asp:ListItem>
            <asp:ListItem  >Non applicable</asp:ListItem>
          </euc:EformRadioButtonList>
	</td>
	<td style="width: 36%; vertical-align: top;">
	<strong>Lateral Margin</strong> 
        <euc:EformRadioButtonList Table="ColorectalPathFinding"  RecordId="3" Field="PathFindLateralMargin" id="EformRadioButtonList1" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >
            <asp:ListItem  >Uninvolved</asp:ListItem>
            <asp:ListItem  >Involved, Dysplasia</asp:ListItem>
            <asp:ListItem  >Involved, Malignancy</asp:ListItem>
            <asp:ListItem  >Close (<2m 1hpf)</asp:ListItem>
            <asp:ListItem  >Not Evaluated / Unknown</asp:ListItem>
       </euc:EformRadioButtonList>
	</td>
	<td style="width: 40%; vertical-align: top;">
	<strong>Distal Margin</strong> 
        <euc:EformRadioButtonList Table="ColorectalPathFinding"  RecordId="3" Field="PathFindDistalMargin" id="PathFindDistalMargin" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >
            <asp:ListItem  >Uninvolved</asp:ListItem>
            <asp:ListItem  >Involved, Dysplasia</asp:ListItem>
            <asp:ListItem  >Involved, Malignancy</asp:ListItem>
            <asp:ListItem  >Close (<2m 1hpf)</asp:ListItem>
            <asp:ListItem  >Not Evaluated / Unknown</asp:ListItem>
       </euc:EformRadioButtonList>
	</td>
	</tr>
	</table>
	</td>
</tr>
  <tr>
	<td style="padding-top: 12px;">
	<table>
	<tr>
	<td style="width: 35%; vertical-align: top;">
	    <strong>Grade / Differentiation</strong> 
        <euc:EformRadioButtonList Table="ColorectalPathFinding"  RecordId="3" Field="PathFindGrade" LookupCode="ColorectalGrade" id="PathFindGrade" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server">
          </euc:EformRadioButtonList>
	</td>
	<td style="width: 40%; vertical-align: top;">
	    <strong>Lymphovascular Invasion</strong> 
        <euc:EformRadioButtonList Table="ColorectalPathFinding"  RecordId="3" Field="PathFindVascularInv" LookupCode="ColorectalInvasion"  id="PathFindVascularInv" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >
          </euc:EformRadioButtonList>
	</td>
	<td style="width: 30%; vertical-align: top;">
	    <strong>Perineural Invasion</strong> 

        <euc:EformRadioButtonList Table="ColorectalPathFinding"  RecordId="3" Field="PathFindPerineuralInv" LookupCode="ColorectalInvasion"  id="PathFindPerineuralInv" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >
       </euc:EformRadioButtonList>
	</td>
	</tr>
	</table>
 	</td>	
  </tr> 
    <tr>
	<td style="padding-top: 12px;">
	
	<table cellpadding="0" cellspacing="0" border="0" style="width: 66%">
	<tr>
	    <td style="width: 30%">&nbsp;</td>
	    <td style="width: 29%">
    	<strong style="font-size: smaller;"># Positive Nodes</strong>
	    </td>
	    <td style="width: 6%">&nbsp;</td>
	    <td style="width: 35%">
    	<strong style="font-size: smaller;">Total # Nodes</strong>
	    </td>
	</tr>
	<tr>
	    <td><strong>Lymph Nodes</strong></td>
	    <td>
    	<euc:EformTextBox Runat="server" ID="PathFindPosNodes" Table="NodePathFinding" RecordId="1"  FIELD="PathFindPosNodes"  style="width:70px;"  ShowNumberPad="true" class="InputText"  /> 
	    </td>
	    <td style="font-weight: bold; font-size: larger;">/</td>
	    <td>
    	<euc:EformTextBox Runat="server" ID="PathFindNumNodes" Table="NodePathFinding" RecordId="1"  FIELD="PathFindNumNodes"  style="width:70px;"  ShowNumberPad="true" class="InputText"  /> 
	    </td>
	</tr>
	</table>
        </td>
    </tr>   
  <tr>
	<td style="padding-top: 12px;">
  		<strong>Number of Polyps Away from Cancer</strong>
		<euc:EformTextBox Runat="server" ID="PathFindPolypAwayNum" Table="ColorectalPathFinding"  FIELD="PathFindPolypAwayNum"  RecordId="3" style="width:60px;"  ShowNumberPad="true" class="InputText"  /> 

	</td>	
</tr>
  <tr>
	<td style="padding-top: 12px;">
  		<strong>Polyp Type Away from Cancer</strong>

        <euc:EformExtendedRadioButtonList ShowOther="true" Table="ColorectalPathFinding" LookupCode="ColorectalPolypType"  RecordId="3" Field="PathFindPolypAwayType" id="PathFindPolypAwayType" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >
       </euc:EformExtendedRadioButtonList>
	</td>	
  </tr>  
  <tr>
	<td style="padding-top: 12px;">
  		<strong> Polyp Pre-Existing</strong>&nbsp;&nbsp;

        <euc:EformExtendedRadioButtonList  Table="ColorectalPathFinding"  RecordId="3" Field="PathFindPolypPreExisting" LookupCode="YesNoUnknown" id="PathFindPolypPreExisting" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server"  >
       </euc:EformExtendedRadioButtonList>
	</td>	
  </tr>  
<tr>
	<td style="padding-top: 12px;">
  		<strong>Number of Pre-Existing Polyps</strong>
		<euc:EformTextBox Runat="server" ID="PathFindPolypPreExistingNum" Table="ColorectalPathFinding"  RecordId="3" FIELD="PathFindPolypPreExistingNum" style="width:60px;"  ShowNumberPad="true" class="InputText"  /> 

	</td>	
</tr>      
  <tr>
	<td style="padding-top: 12px;">
  		<strong>Pre-Existing Polyp Type</strong>

        <euc:EformExtendedRadioButtonList ShowOther="true" Table="ColorectalPathFinding" LookupCode="ColorectalPolypType"  RecordId="3" Field="PathFindPolypPreExistingType" id="PathFindPolypPreExistingType" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" runat="server"  >
       </euc:EformExtendedRadioButtonList>
	</td>	
  </tr>  

  <tr>
	<td style="padding-top: 12px;">
  		<strong>Notes for this Resection</strong><br />

  		<euc:EformTextArea TextMode="MultiLine"  Table="Pathology"  RecordId='3' FIELD="PathNotes" Rows="12" style="width: 550px;" Runat="server" ID="ProcNotes"/>
	</td>	
  </tr>     
</table>
<br/><br/><br/>
