<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeadNeckAdditionalManagement.ascx.cs" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.HeadNeckAdditionalManagement" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="Additional Management" id="AdditionalManagement" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Additional Management"></asp:Label>

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable" id="tblThyroidDetails" onclick="setTotalThyroidectomy();">
    <tr >
	    <td colspan ="2">
            <strong>Management of Thyroid</strong>&nbsp;
            <euc:EformDropDownList Width="220px" Runat="server" ShowEmptyListItem="true" ID="ddlProcTotalThyroidectomy" Table="NoTable" Field="TotalThyroidectomyRecorded" >
           	    <asp:ListItem></asp:ListItem>
           	    <asp:ListItem Value="1" Text="Total Thyroidectomy" />
           	    <asp:ListItem Value="2" Text="Left Thyroid Lobectomy" />
                <asp:ListItem Value="3" Text="Right Thyroid Lobectomy" />
                <asp:ListItem Value="4" Text="Thyroid Isthmusectomy" />
           	</euc:EformDropDownList>
         
        </td>
    </tr>
    <tr>
        <td colspan ="2">
            &nbsp;&nbsp;<euc:EformCheckBox Table="ThyroidProc" Field="ProcTotalThyroidectomy" id="ProcTotalThyroidectomy" runat="server" Value="Yes" Text="Total Thyroidectomy" RecordId="1" />            
            &nbsp;&nbsp;<euc:EformCheckBox Table="ThyroidProc" Field="ProcL_Lobe" id="ProcL_Lobe" runat="server" Value="Yes" Text="Left Lobe" RecordId="1"/>
            &nbsp;&nbsp;<euc:EformCheckBox Table="ThyroidProc" Field="ProcR_Lobe" id="ProcR_Lobe" runat="server" Value="Yes" Text="Right Lobe" RecordId="1"/>
            &nbsp;&nbsp;<euc:EformCheckBox Table="ThyroidProc" Field="ProcIsthmus" id="ProcIsthmus" runat="server" Value="Yes" Text="Isthmus" RecordId="1"/>
        </td>
    </tr>
    <tr>
        <td><strong>Left Superior</strong>
            <euc:EformDropDownList Width="150px" Runat="server" ShowEmptyListItem="true" Table="ThyroidProc" Field="ProcL_SuperiorParathyroid" LookupCode="ThyroidManagement" id="ProcL_SuperiorParathyroid" RecordId="1">       	    
           	</euc:EformDropDownList>
        </td>
        <td><strong>Right Superior</strong>
            <euc:EformDropDownList Width="150px" Runat="server" ShowEmptyListItem="true" Table="ThyroidProc" Field="ProcR_SuperiorParathyroid" LookupCode="ThyroidManagement" id="ProcR_SuperiorParathyroid" RecordId="1">       	    
           	</euc:EformDropDownList>
        </td>
    </tr>
    <tr>
        <td><strong>Left Inferior</strong>
             &nbsp;&nbsp;<euc:EformDropDownList Width="150px" Runat="server" ShowEmptyListItem="true" Table="ThyroidProc" Field="ProcL_InferiorParathyroid" LookupCode="ThyroidManagement" id="ProcL_InferiorParathyroid" RecordId="1">       	    
           	</euc:EformDropDownList>
        </td>
        <td><strong>Right Inferior</strong>
             &nbsp;&nbsp;<euc:EformDropDownList Width="150px" Runat="server" ShowEmptyListItem="true" Table="ThyroidProc" Field="ProcR_InferiorParathyroid" LookupCode="ThyroidManagement" id="ProcR_InferiorParathyroid" RecordId="1">       	    
           	</euc:EformDropDownList>
        </td>
    </tr>
    <tr>
        <td colspan ="2"><strong>Strap Muscles</strong>&nbsp;&nbsp;&nbsp;&nbsp;
            <euc:EformRadioButtonList Table="ThyroidProc" Field="ProcStrapMuscle" LookupCode="YesNoUnknown" id="ProcStrapMuscle" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="0" runat="server" RecordId="1">
		    </euc:EformRadioButtonList>
        </td>
    </tr>
</table>

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable" id="tblLarynxDetails">
    <tr >
	    <td>
            <strong>Management of Larynx</strong>&nbsp;
            <euc:EformDropDownList Width="300px" Runat="server" ShowEmptyListItem="true" Table="ThyroidProc" Field="ProcLarynxMgmt" LookupCode="ThyroidLarynxManagement" id="ProcLarynxMgmt" RecordId="1">       	    
           	</euc:EformDropDownList>
        </td>
    </tr>
</table>

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable" id="tblTracheaDetails">
    <tr>
	    <td>
            <strong>Management of Trachea</strong>&nbsp;
            <euc:EformDropDownList Width="220px" Runat="server" ShowEmptyListItem="true" Table="ThyroidProc" Field="ProcTracheaMgmt" LookupCode="ThyroidTracheaManagement" id="ProcTracheaMgmt" RecordId="1">       	    
           	</euc:EformDropDownList>
        </td>
    </tr>
    <tr>
        <td><strong>Trachea Reconctraction</strong>&nbsp;&nbsp;
            <euc:EformDropDownList Width="220px" Runat="server" ShowEmptyListItem="true" Table="ThyroidProc" Field="ProcTracheaReconstruct" LookupCode="ThyroidTracheaReconstruction" id="ProcTracheaReconstruct" RecordId="1">       	    
           	</euc:EformDropDownList>
        </td>
    </tr>
</table>

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable" id="tblEsophPharynx">
    <tr >
	    <td>
            <strong>Management of Esophagus/Pharynx</strong>&nbsp;
            <euc:EformDropDownList Width="220px" Runat="server" ShowEmptyListItem="true" Table="ThyroidProc" Field="ProcEsophagusPharynxMgmt" LookupCode="ThyroidEsophagusManagement" id="ProcEsophagusPharynxMgmt" RecordId="1">       	    
           	</euc:EformDropDownList>
        </td>
    </tr>
    <tr>
        <td><strong>Esophagus/Pharynx Reconstruction</strong>&nbsp;&nbsp;
            <euc:EformDropDownList Width="220px" Runat="server" ShowEmptyListItem="true" Table="ThyroidProc" Field="ProcEsophagusPharynxReconstruct" LookupCode="ThyroidEsophagusReconstruction" id="ProcEsophagusPharynxReconstruct" RecordId="1">       	    
           	</euc:EformDropDownList>
        </td>
    </tr>
</table>


<br/><br/><br/>


<script type="text/javascript">    

    function SetHiddenFields(procSubsite, findingSide, findingSite, findingSubsite, findingValue) {
        var subsiteRbl = procSubsite.getElementsByTagName('input');
        var found = 'false';


        if (findingValue == 'Nerve Graft') {
            temp = RetrieveRadioBtnListSelectedValues(findingFind, "TABLE");
            if (temp == 'Yes') {
                findingSide.value = procSide.value;
                findingSite.value = procSite.value;
                findingSubsite.value = findingValue;
            }
            else {
                findingSide.value = '';
                findingSite.value = '';
                findingSubsite.value = '';
            }
        }
    }

    function setTotalThyroidectomy() {
        var isTotal = false;
        var NumInputs = document.getElementById('tblThyroidDetails').getElementsByTagName('input').length;

        var ddl = document.getElementById('<% = ddlProcTotalThyroidectomy.ClientID %>');
       //'ctl03_ddlProcTotalThyroidectomy'
        if(ddl){
		    var ProcVal = ddl.options[ddl.selectedIndex].value;
            if (ProcVal == '1')
                isTotal = true;           
        }

        for (i = 0; i < NumInputs; i++) {
           
            //Total Thyroidectomy
            if (document.getElementById('tblThyroidDetails').getElementsByTagName('input')[i].getAttribute('type').toUpperCase().indexOf('CHECK') > -1)
                document.getElementById('tblThyroidDetails').getElementsByTagName('input')[i].checked = isTotal;

            //Left Lobe
            if (ProcVal == '2') {
                if (document.getElementById('tblThyroidDetails').getElementsByTagName('input')[i].id.indexOf('ProcL') > -1)
                    document.getElementById('tblThyroidDetails').getElementsByTagName('input')[i].checked = true;
            }
            //Right Lobe
            if (ProcVal == '3')
            { 
                if (document.getElementById('tblThyroidDetails').getElementsByTagName('input')[i].id.indexOf('ProcR') > -1)
                    document.getElementById('tblThyroidDetails').getElementsByTagName('input')[i].checked = true;
            }
            //Isthmus
            if (ProcVal == '4') {
                if (document.getElementById('tblThyroidDetails').getElementsByTagName('input')[i].id.indexOf('ProcIsthmus') > -1)
                    document.getElementById('tblThyroidDetails').getElementsByTagName('input')[i].checked = true;
            }
        }

    }

</script>