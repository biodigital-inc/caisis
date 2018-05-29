<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.ComorbiditiesBreastFU" CodeFile="ComorbiditiesBreastFU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
    tableArray.BreastMedicalComorbTbl="BreastMedicalComorbTbl";
    //tableArray.BreastComorbTbl="BreastComorbTbl";
</script>

<a name="ComorbiditiesBreastFU" /><span class="controlBoxTitle">Comorbidities</span> <br/>

<table border="0" cellspacing="0" cellpadding="16" width="400" class="eformXLargePopulatedTable">
 <tr >
    <td style="white-space:nowrap;"><strong>Any previous medical history ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="MedicalComorbYesNo" id="MedicalComorbYesNo" 
	    runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:30%"></td>
  </tr>
  
  <tr id="BreastComorbTR" style="display: none;" runat="server">
     <td  colspan="3">
        <span class="controlBoxTitle" style="font-size: 12px;">Previous Comorbidities</span><br/>
            <table cellpadding="2" width="400px" cellspacing="0" class="ClinicalEformTable" id="ComorbHxTable">
                <tr>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:175px">Comorbidity</td>
                    <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:165px">Date</td>		    
	                <td  class="controlBoxDataGridTitleColumn" style="text-align: center; width:30px">&nbsp;</td>
                </tr>
                
                <asp:Repeater ID="comorbidities" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	                <ItemTemplate> 
		                <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Comorbidities', <%# DataBinder.Eval(Container.DataItem, "ComorbidityId") %>, 'ComorbDateText,ComorbDate,Comorbidity,ComorbQuality','Comorbidities');"> 
		                    <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Comorbidity") %>&nbsp;</td>
			                <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ComorbDateText") %></td>	
			                <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		                </tr>      
                </ItemTemplate>
            </asp:Repeater>
            
            </table><br /><br />
            
            <span class="controlBoxTitle" style="font-size: 12px;">Add Comorbidities</span><br/>
            <table width="400" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastMedicalComorbTbl">
          <tr>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Comorbidity</td>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>		    
	        <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
          </tr>
          
          <tr id="BreastMedicalComorbTr1">                
            		    
		    <%--<td align="center"><euc:EformSelect RecordId="1" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_1" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td> --%>               
            <td align="center"><euc:EformComboBox RecordId="1" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_1" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/><%--</td>                
            <td align="center"><euc:EformTextBox RecordId="1" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_1" style="width:100px"/>--%>
	            <euc:EformTextBox RecordId="1" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_1" style="width:1px;display:none;"/></td>
	        <td align="center">
                <euc:EformTextBox RecordId="1" TABLE="Encounters" FIELD="EncDateText" Runat="server" ID="EncDateText_1" 
                style="display:none; width:1px;"/>
                
                <euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="1" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_1"/>
		        <euc:EformHidden RecordId="1" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_1"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastMedicalComorbTr2" style="display:none;">                
            		    
		    <%--<td align="center"><euc:EformSelect RecordId="2" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_2" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>--%>                
            <td align="center"><euc:EformComboBox RecordId="2" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_2" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/><%--</td>                
            <td align="center"><euc:EformTextBox RecordId="2" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_2" style="width:100px"/>--%>
	            <euc:EformTextBox RecordId="2" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_2" style="width:1px;display:none;"/></td>
	        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="2" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_2"/>
		        <euc:EformHidden RecordId="2" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_2"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastMedicalComorbTr3" style="display:none;"> 
		    <%--<td align="center"><euc:EformSelect RecordId="3" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_3" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>--%>                
            <td align="center"><euc:EformComboBox RecordId="3" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_3" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/><%--</td>                
            <td align="center"><euc:EformTextBox RecordId="3" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_3" style="width:100px"/>--%>
	            <euc:EformTextBox RecordId="3" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_3" style="width:1px;display:none;"/></td>
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="3" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_3"/>
		        <euc:EformHidden RecordId="3" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_3"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastMedicalComorbTr4" style="display:none;">                
            		    
		    <%--<td align="center"><euc:EformSelect RecordId="4" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_4" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>--%>                
            <td align="center"><euc:EformComboBox RecordId="4" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_4" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/><%--</td>                
            <td align="center"><euc:EformTextBox RecordId="4" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_4" style="width:100px"/>--%>	            
	            <euc:EformTextBox RecordId="4" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_4" style="width:1px;display:none;"/></td>
	        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="4" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_4"/>
		        <euc:EformHidden RecordId="4" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_4"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastMedicalComorbTr5" style="display:none;">                
            		    
		    <%--<td align="center"><euc:EformSelect RecordId="5" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_5" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>--%>                
            <td align="center"><euc:EformComboBox RecordId="5" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_5" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/><%--</td>                
            <td align="center"><euc:EformTextBox RecordId="5" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_5" style="width:100px"/>--%>	            
	            <euc:EformTextBox RecordId="5" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_5" style="width:1px;display:none;"/></td>
	        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="5" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_5"/>
		        <euc:EformHidden RecordId="5" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_5"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastMedicalComorbTr6" style="display:none;">                
            		    
		    <%--<td align="center"><euc:EformSelect RecordId="6" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_6" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>--%>                
            <td align="center"><euc:EformComboBox RecordId="6" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_6" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/><%--</td>                
            <td align="center"><euc:EformTextBox RecordId="6" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_6" style="width:100px"/>--%>	            
	            <euc:EformTextBox RecordId="6" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_6" style="width:1px;display:none;"/></td>
	        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="6" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_6"/>
		        <euc:EformHidden RecordId="6" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_6"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastMedicalComorbTr7" style="display:none;">                
            		    
		    <%--<td align="center"><euc:EformSelect RecordId="7" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_7" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>--%>                
            <td align="center"><euc:EformComboBox RecordId="7" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_7" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/><%--</td>                
            <td align="center"><euc:EformTextBox RecordId="7" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_7" style="width:100px"/>--%>	            
	            <euc:EformTextBox RecordId="7" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_7" style="width:1px;display:none;"/></td>
	        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="7" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_7"/>
		        <euc:EformHidden RecordId="7" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_7"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastMedicalComorbTr8" style="display:none;">                
            		    
		    <%--<td align="center"><euc:EformSelect RecordId="8" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_8" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>--%>                
            <td align="center"><euc:EformComboBox RecordId="8" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_8" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/><%--</td>                
            <td align="center"><euc:EformTextBox RecordId="8" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_8" style="width:100px"/>--%>	            
	            <euc:EformTextBox RecordId="8" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_8" style="width:1px;display:none;"/></td>
	        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="8" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_8"/>
		        <euc:EformHidden RecordId="8" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_8"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastMedicalComorbTr9" style="display:none;">                
            		    
		    <%--<td align="center"><euc:EformSelect RecordId="9" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_9" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>--%>                
            <td align="center"><euc:EformComboBox RecordId="9" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_9" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/><%--</td>                
            <td align="center"><euc:EformTextBox RecordId="9" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_9" style="width:100px"/>--%>	            
	            <euc:EformTextBox RecordId="9" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_9" style="width:1px;display:none;"/></td>
	        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="9" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_9"/>
		        <euc:EformHidden RecordId="9" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_9"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastMedicalComorbTr10" style="display:none;">                
            	    
		    <%--<td align="center"><euc:EformSelect RecordId="10" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_10" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>--%>                
            <td align="center"><euc:EformComboBox RecordId="10" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_10" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/><%--</td>                
            <td align="center"><euc:EformTextBox RecordId="10" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_10" style="width:100px"/>--%>	            
	            <euc:EformTextBox RecordId="10" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_10" style="width:1px;display:none;"/></td>
	        <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="10" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_10"/>
		        <euc:EformHidden RecordId="10" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_10"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
         </table>
         <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" 
            onclick="return showFirstAdditionalRow(this,'BreastMedicalComorbTbl');" /><br /><br />
      </td>
  </tr>
 </table><br /><br />
 
 
 <%--<span class="controlBoxTitle">Comorbidities</span> <br/>
<table border="0" cellspacing="0" cellpadding="16" width="400" class="eformXLargePopulatedTable">
 <tr >
    <td style="white-space:nowrap;"><strong>Any comorbidities ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="ComorbidityYesNo" id="ComorbidityYesNo" 
	    runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:30%"></td>
  </tr>
  
  <tr id="BreastComorbDetails" style="display: none;">
     <td style="padding: 0px;" colspan="3">
        <table width="550" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="BreastComorbTbl">
          <tr>
            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">System</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Comorbidity</td>
		    <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Treatment</td>
	        <td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
          </tr>
          
          <tr id="BreastComorbTr1">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="11" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_11"/>
		        <euc:EformHidden RecordId="11" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_11"/></td>	    
		    <td align="center"><euc:EformSelect RecordId="11" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_11" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>                
            <td align="center"><euc:EformComboBox RecordId="11" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_11" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/></td>                
            <td align="center"><euc:EformTextBox RecordId="11" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_11" style="width:100px"/>	            
	            <euc:EformTextBox RecordId="11" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_11" style="width:1px;display:none;"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastComorbTr2" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="12" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_12"/>
		        <euc:EformHidden RecordId="12" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_12"/></td>	    
		    <td align="center"><euc:EformSelect RecordId="12" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_12" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>                
            <td align="center"><euc:EformComboBox RecordId="12" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_12" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/></td>                
            <td align="center"><euc:EformTextBox RecordId="12" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_12" style="width:100px"/>	            
	            <euc:EformTextBox RecordId="12" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_12" style="width:1px;display:none;"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastComorbTr3" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="13" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_13"/>
		        <euc:EformHidden RecordId="13" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_13"/></td>	    
		    <td align="center"><euc:EformSelect RecordId="13" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_13" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>                
            <td align="center"><euc:EformComboBox RecordId="13" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_13" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/></td>                
            <td align="center"><euc:EformTextBox RecordId="13" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_13" style="width:100px"/>	            
	            <euc:EformTextBox RecordId="13" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_13" style="width:1px;display:none;"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastComorbTr4" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="14" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_14"/>
		        <euc:EformHidden RecordId="14" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_14"/></td>	    
		    <td align="center"><euc:EformSelect RecordId="14" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_14" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>                
            <td align="center"><euc:EformComboBox RecordId="14" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_14" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/></td>                
            <td align="center"><euc:EformTextBox RecordId="14" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_14" style="width:100px"/>	            
	            <euc:EformTextBox RecordId="14" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_14" style="width:1px;display:none;"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastComorbTr5" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="15" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_15"/>
		        <euc:EformHidden RecordId="15" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_15"/></td>	    
		    <td align="center"><euc:EformSelect RecordId="15" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_15" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>                
            <td align="center"><euc:EformComboBox RecordId="15" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_15" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/></td>                
            <td align="center"><euc:EformTextBox RecordId="15" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_15" style="width:100px"/>	            
	            <euc:EformTextBox RecordId="15" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_15" style="width:1px;display:none;"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastComorbTr6" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="16" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_16"/>
		        <euc:EformHidden RecordId="16" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_16"/></td>	    
		    <td align="center"><euc:EformSelect RecordId="16" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_16" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>                
            <td align="center"><euc:EformComboBox RecordId="16" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_16" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/></td>                
            <td align="center"><euc:EformTextBox RecordId="16" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_16" style="width:100px"/>	            
	            <euc:EformTextBox RecordId="16" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_16" style="width:1px;display:none;"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastComorbTr7" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="17" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_17"/>
		        <euc:EformHidden RecordId="17" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_17"/></td>	    
		    <td align="center"><euc:EformSelect RecordId="17" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_17" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>                
            <td align="center"><euc:EformComboBox RecordId="17" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_17" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/></td>                
            <td align="center"><euc:EformTextBox RecordId="17" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_17" style="width:100px"/>	            
	            <euc:EformTextBox RecordId="17" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_17" style="width:1px;display:none;"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastComorbTr8" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="18" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_18"/>
		        <euc:EformHidden RecordId="18" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_18"/></td>	    
		    <td align="center"><euc:EformSelect RecordId="18" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_18" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>                
            <td align="center"><euc:EformComboBox RecordId="18" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_18" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/></td>                
            <td align="center"><euc:EformTextBox RecordId="18" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_18" style="width:100px"/>	            
	            <euc:EformTextBox RecordId="18" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_18" style="width:1px;display:none;"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastComorbTr9" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="19" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_19"/>
		        <euc:EformHidden RecordId="19" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_19"/></td>	    
		    <td align="center"><euc:EformSelect RecordId="19" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_19" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>                
            <td align="center"><euc:EformComboBox RecordId="19" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_19" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/></td>                
            <td align="center"><euc:EformTextBox RecordId="19" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_19" style="width:100px"/>	            
	            <euc:EformTextBox RecordId="19" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_19" style="width:1px;display:none;"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
		  <tr id="BreastComorbTr10" style="display:none;">                
            <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:90px;" RecordId="20" Runat="server" 
                TABLE="Comorbidities" FIELD="ComorbDateText" ID="ComorbDateText_20"/>
		        <euc:EformHidden RecordId="20" TABLE="Comorbidities" FIELD="ComorbDate" Runat="server" ID="ComorbDate_20"/></td>	    
		    <td align="center"><euc:EformSelect RecordId="20" TABLE="Comorbidities" FIELD="ComorbSystem" Runat="server" 
                ID="ComorbSystem_20" LookupCode="BodySystem" style="width:100px" DropDownWidth="200px"/></td>                
            <td align="center"><euc:EformComboBox RecordId="20" TABLE="Comorbidities" FIELD="Comorbidity" Runat="server" 
                ID="Comorbidity_20" LookupCode="Comorbidity" style="width:100px" DropDownWidth="250px"/></td>                
            <td align="center"><euc:EformTextBox RecordId="20" TABLE="Comorbidities" FIELD="ComorbTreatment" Runat="server" 
	            ID="ComorbTreatment_20" style="width:100px"/>	            
	            <euc:EformTextBox RecordId="20" TABLE="Comorbidities" FIELD="ComorbQuality" Runat="server" 
	            ID="ComorbQuality_20" style="width:1px;display:none;"/></td>
	        <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
		  </tr>
		  
         </table>
         <img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left" 
            onclick="return showFirstAdditionalRow(this,'BreastComorbTbl');" /><br /><br />
      </td>
  </tr>
 </table><br /><br />--%>
 
 
 <script type="text/javascript">
    //Adds events to controls
    function addComorbEvents(encDate,comorbDate,comorb,comorbQlty)
    {
        $(comorb).addEvent('blur',curry(ComorbAutoPopulates,encDate,comorbDate,comorb,comorbQlty));
   }

    addComorbEvents($('<%= EncDateText_1.ClientID %>'),$('<%= ComorbDateText_1.ClientID %>'),$('<%= Comorbidity_1.ClientID %>'),$('<%= ComorbQuality_1.ClientID %>'));
    addComorbEvents($('<%= EncDateText_1.ClientID %>'),$('<%= ComorbDateText_2.ClientID %>'),$('<%= Comorbidity_2.ClientID %>'),$('<%= ComorbQuality_2.ClientID %>'));
    addComorbEvents($('<%= EncDateText_1.ClientID %>'),$('<%= ComorbDateText_3.ClientID %>'),$('<%= Comorbidity_3.ClientID %>'),$('<%= ComorbQuality_3.ClientID %>'));
    addComorbEvents($('<%= EncDateText_1.ClientID %>'),$('<%= ComorbDateText_4.ClientID %>'),$('<%= Comorbidity_4.ClientID %>'),$('<%= ComorbQuality_4.ClientID %>'));
    addComorbEvents($('<%= EncDateText_1.ClientID %>'),$('<%= ComorbDateText_5.ClientID %>'),$('<%= Comorbidity_5.ClientID %>'),$('<%= ComorbQuality_5.ClientID %>'));
    addComorbEvents($('<%= EncDateText_1.ClientID %>'),$('<%= ComorbDateText_6.ClientID %>'),$('<%= Comorbidity_6.ClientID %>'),$('<%= ComorbQuality_6.ClientID %>'));
    addComorbEvents($('<%= EncDateText_1.ClientID %>'),$('<%= ComorbDateText_7.ClientID %>'),$('<%= Comorbidity_7.ClientID %>'),$('<%= ComorbQuality_7.ClientID %>'));
    addComorbEvents($('<%= EncDateText_1.ClientID %>'),$('<%= ComorbDateText_8.ClientID %>'),$('<%= Comorbidity_8.ClientID %>'),$('<%= ComorbQuality_8.ClientID %>'));
    addComorbEvents($('<%= EncDateText_1.ClientID %>'),$('<%= ComorbDateText_9.ClientID %>'),$('<%= Comorbidity_9.ClientID %>'),$('<%= ComorbQuality_9.ClientID %>'));
    addComorbEvents($('<%= EncDateText_1.ClientID %>'),$('<%= ComorbDateText_10.ClientID %>'),$('<%= Comorbidity_10.ClientID %>'),$('<%= ComorbQuality_10.ClientID %>'));
    
    function ComorbAutoPopulates(encDate,comorbDate,comorb,comorbQlty)
    {
        if (comorb.value != '')
        {
            comorbDate.value = encDate.value;
            comorbQlty.value = 'STD';
        }
        else
        { 
            comorbDate.value = '';
            comorbQlty.value = '';
        }
    }
    
    //Adds events for Meds   
    addComorbEvent($('<%= MedicalComorbYesNo.ClientID %>'),$('<%= BreastComorbTR.ClientID %>'));
    
    function addComorbEvent(ComorbYesNoID,ComorbTRID)
    {  
        $(ComorbYesNoID).addEvent('click',curry(ComorbHxYesNo,ComorbYesNoID,ComorbTRID));

        // check on load as well
        ComorbHxYesNo(ComorbYesNoID,ComorbTRID);
    }
   
    function ComorbHxYesNo(ComorbYesNoID,ComorbTRID)
    {
       var ComorbYesNoRef = ComorbYesNoID.getElementsByTagName('input');
       
       for (var i = 0; i < ComorbYesNoRef.length; i++) 
        if (ComorbYesNoRef[i].checked) 
        {  
            ComorbHxRadioClick(ComorbYesNoRef[i].value,ComorbTRID);
        }
    }
    
    function ComorbHxRadioClick(Comorboption_value,ComorbhideTR)
    {
      if (Comorboption_value == "Yes")
      { 
        ComorbhideTR.style.display='block';
        
      } 
      else if (Comorboption_value == "No")
      {
        ComorbhideTR.style.display='none';
        
        //clears all rows data
        for(var i=1;i<=10;i++)
        {
            clearElementsInParentRow(document.getElementById('BreastMedicalComorbTr'+i));
        }
      }
    }
</script>