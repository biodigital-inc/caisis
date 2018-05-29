<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.ColonAndRectalProcedures" CodeFile="ColonAndRectalProcedures.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
  

<table id="AncillaryProceduresListTable" runat="server" style="display:none;">
    <tr>
        <td>
            <span class="controlBoxTitle">Ancillary Procedures</span>&nbsp;&nbsp;<span  style="font-size: 11px;">(Select all additional procedures performed.)</span><br/><br/>
            <table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">
                <tr>
                    <td> 
                        <%--Start of Colon And Ancillary procs--%>
                            <table border="0" cellspacing="0" cellpadding="0" width="600">
                         <tr>
	                        <td style="width:290px; vertical-align:top;">
		                         <span class="controlBoxTitle" style="font-size: 12px;">Colon</span><br/>
		                        <table border="0" cellspacing="0" cellpadding="16" width="290" class="eformLargePopulatedTable" style="margin-bottom: 20px;">
		                         <tr  id="AncillaryProceduresListRow1" runat="server">
			                        <td >
			                        <asp:HiddenField ID="colonRectalProcDt" runat="server"/>
			                        <euc:EformTextBox id="ProcDateText_2" Table="Procedures" Field="ProcDateText" RecordId="2" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_2" Table="Procedures" Field="ProcDate"  RecordId="2" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_3" Table="Procedures" Field="ProcDateText" RecordId="3" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_3" Table="Procedures" Field="ProcDate"  RecordId="3" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_4" Table="Procedures" Field="ProcDateText" RecordId="4" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_4" Table="Procedures" Field="ProcDate"  RecordId="4" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_5" Table="Procedures" Field="ProcDateText" RecordId="5" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_5" Table="Procedures" Field="ProcDate"  RecordId="5" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_6" Table="Procedures" Field="ProcDateText" RecordId="6" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_6" Table="Procedures" Field="ProcDate"  RecordId="6" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_7" Table="Procedures" Field="ProcDateText" RecordId="7" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_7" Table="Procedures" Field="ProcDate"  RecordId="7" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_8" Table="Procedures" Field="ProcDateText" RecordId="8" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_8" Table="Procedures" Field="ProcDate"  RecordId="8" runat="server" style="display:none;width:1px;"/>

		                            <euc:EformTextBox id="ProcSite_2" Table="Procedures" Field="ProcSite"  RecordId="2" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_3" Table="Procedures" Field="ProcSite"  RecordId="3" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_4" Table="Procedures" Field="ProcSite"  RecordId="4" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_5" Table="Procedures" Field="ProcSite"  RecordId="5" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_6" Table="Procedures" Field="ProcSite"  RecordId="6" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_7" Table="Procedures" Field="ProcSite"  RecordId="7" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_8" Table="Procedures" Field="ProcSite"  RecordId="8" runat="server" style="display:none; width:1px;" />
                        		    
                        		    
			                        <euc:EformCheckBox RecordId="2" Table="Procedures" Field="ProcName" id="ProcName_2" Value="Right Hemicolectomy" runat="server" /> Right Hemicolectomy<br/>
			                        <euc:EformCheckBox RecordId="3" Table="Procedures" Field="ProcName" id="ProcName_3" Value="Extended Right Colectomy" runat="server" /> Extended Right Colectomy<br/>
			                        <euc:EformCheckBox RecordId="4" Table="Procedures" Field="ProcName" id="ProcName_4" Value="Left Hemicolectomy" runat="server" /> Left Hemicolectomy<br/>
			                        <euc:EformCheckBox RecordId="5" Table="Procedures" Field="ProcName" id="ProcName_5" Value="Extended Left Colectomy" runat="server" /> Extended Left Colectomy<br/>
			                        <euc:EformCheckBox RecordId="6" Table="Procedures" Field="ProcName" id="ProcName_6" Value="Subtotal Colectomy" runat="server" /> Subtotal Colectomy<br/>
			                        <euc:EformCheckBox RecordId="7" Table="Procedures" Field="ProcName" id="ProcName_7" Value="Anterior/Sigmoid Resection" runat="server" /> Anterior/Sigmoid Resection<br/>
			                        <euc:EformCheckBox RecordId="8" Table="Procedures" Field="ProcName" id="ProcName_8" Value="Hartmann Colectomy" runat="server" /> Hartmann Colectomy<br/>			
			                        </td>
		                        </tr>
		                        </table>
                        		
                        		
		                        <span class="controlBoxTitle" style="font-size: 12px;">Rectosigmoid</span><br/>
		                        <table border="0" cellspacing="0" cellpadding="16" width="290" class="eformLargePopulatedTable" style="margin-bottom: 20px;">
		                         <tr  id="AncillaryProceduresListRow2" runat="server">
			                        <td >
			                        <euc:EformTextBox id="ProcDateText_9" Table="Procedures" Field="ProcDateText" RecordId="9" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_9" Table="Procedures" Field="ProcDate"  RecordId="9" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_10" Table="Procedures" Field="ProcDateText" RecordId="10" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_10" Table="Procedures" Field="ProcDate"  RecordId="10" runat="server" style="display:none;width:1px;"/>
                        		    
		                            <euc:EformTextBox id="ProcSite_9" Table="Procedures" Field="ProcSite"  RecordId="9" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_10" Table="Procedures" Field="ProcSite"  RecordId="10" runat="server" style="display:none; width:1px;" />
                        			
                        			
			                        <euc:EformCheckBox RecordId="9" Table="Procedures" Field="ProcName" id="ProcName_9" Value="LAR" runat="server" /> LAR<br/>
			                        <euc:EformCheckBox RecordId="10" Table="Procedures" Field="ProcName" id="ProcName_10" Value="LAR w/ Ileostomy" runat="server" /> LAR w/ Ileostomy<br/>			
		                            </td>
		                        </tr>
		                        </table>	
                        		
                        		
		                        <span class="controlBoxTitle" style="font-size: 12px;">Stoma</span><br/>
		                        <table border="0" cellspacing="0" cellpadding="16" width="290" class="eformLargePopulatedTable" style="margin-bottom: 20px;">
		                         <tr  id="AncillaryProceduresListRow3" runat="server">
			                        <td >			
			                        <euc:EformTextBox id="ProcDateText_11" Table="Procedures" Field="ProcDateText" RecordId="11" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_11" Table="Procedures" Field="ProcDate"  RecordId="11" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_12" Table="Procedures" Field="ProcDateText" RecordId="12" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_12" Table="Procedures" Field="ProcDate"  RecordId="12" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_13" Table="Procedures" Field="ProcDateText" RecordId="13" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_13" Table="Procedures" Field="ProcDate"  RecordId="13" runat="server" style="display:none;width:1px;"/>
                        		    
		                            <euc:EformTextBox id="ProcDateText_60" Table="Procedures" Field="ProcDateText" RecordId="60" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_60" Table="Procedures" Field="ProcDate"  RecordId="60" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_61" Table="Procedures" Field="ProcDateText" RecordId="61" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_61" Table="Procedures" Field="ProcDate"  RecordId="61" runat="server" style="display:none;width:1px;"/>
                        		    
		                            <euc:EformTextBox id="ProcSite_11" Table="Procedures" Field="ProcSite"  RecordId="11" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_12" Table="Procedures" Field="ProcSite"  RecordId="12" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_13" Table="Procedures" Field="ProcSite"  RecordId="13" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_60" Table="Procedures" Field="ProcSite"  RecordId="60" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_61" Table="Procedures" Field="ProcSite"  RecordId="61" runat="server" style="display:none; width:1px;" />
                        			
			                        <euc:EformCheckBox RecordId="11" Table="Procedures" Field="ProcName" id="ProcName_11" Value="Ileostomy Closure" runat="server" /> Ileostomy Closure<br/>
			                        <euc:EformCheckBox RecordId="12" Table="Procedures" Field="ProcName" id="ProcName_12" Value="Colostomy Closure" runat="server" /> Colostomy Closure<br/>
			                        <euc:EformCheckBox RecordId="13" Table="Procedures" Field="ProcName" id="ProcName_13" Value="Hartmann Closure" runat="server" /> Hartmann Closure<br/>
                        			
			                        <euc:EformCheckBox RecordId="60" Table="Procedures" Field="ProcName" id="ProcName_60" Value="Ileostomy" runat="server" /> Ileostomy<br/>
			                        <euc:EformCheckBox RecordId="61" Table="Procedures" Field="ProcName" id="ProcName_61" Value="Colostomy, Loop" runat="server" /> Colostomy, Loop<br/>

		                            </td>
		                        </tr>
		                        </table>		
	                        </td>
	                        <td style="width:10px;">	
                        			

	                        </td>
	                        <td style="width:290px; vertical-align:top;">
		                         <span class="controlBoxTitle"  style="font-size: 12px;">Rectum</span><br/>
		                        <table border="0" cellspacing="0" cellpadding="16" width="290" class="eformXLargePopulatedTable">
		                         <tr  id="AncillaryProceduresListRow4" runat="server">
			                        <td style="height: 448px; vertical-align: top;">
			                        <euc:EformTextBox id="ProcDateText_14" Table="Procedures" Field="ProcDateText" RecordId="14" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_14" Table="Procedures" Field="ProcDate"  RecordId="14" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_15" Table="Procedures" Field="ProcDateText" RecordId="15" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_15" Table="Procedures" Field="ProcDate"  RecordId="15" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_16" Table="Procedures" Field="ProcDateText" RecordId="16" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_16" Table="Procedures" Field="ProcDate"  RecordId="16" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_17" Table="Procedures" Field="ProcDateText" RecordId="17" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_17" Table="Procedures" Field="ProcDate"  RecordId="17" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_18" Table="Procedures" Field="ProcDateText" RecordId="18" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_18" Table="Procedures" Field="ProcDate"  RecordId="18" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_19" Table="Procedures" Field="ProcDateText" RecordId="19" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_19" Table="Procedures" Field="ProcDate"  RecordId="19" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_20" Table="Procedures" Field="ProcDateText" RecordId="20" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_20" Table="Procedures" Field="ProcDate"  RecordId="20" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_21" Table="Procedures" Field="ProcDateText" RecordId="21" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_21" Table="Procedures" Field="ProcDate"  RecordId="21" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_22" Table="Procedures" Field="ProcDateText" RecordId="22" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_22" Table="Procedures" Field="ProcDate"  RecordId="22" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_23" Table="Procedures" Field="ProcDateText" RecordId="23" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_23" Table="Procedures" Field="ProcDate"  RecordId="23" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_24" Table="Procedures" Field="ProcDateText" RecordId="24" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_24" Table="Procedures" Field="ProcDate"  RecordId="24" runat="server" style="display:none;width:1px;"/>
                        		    
		                            <euc:EformTextBox id="ProcDateText_67" Table="Procedures" Field="ProcDateText" RecordId="67" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_67" Table="Procedures" Field="ProcDate"  RecordId="67" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_68" Table="Procedures" Field="ProcDateText" RecordId="68" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_68" Table="Procedures" Field="ProcDate"  RecordId="68" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_69" Table="Procedures" Field="ProcDateText" RecordId="69" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_69" Table="Procedures" Field="ProcDate"  RecordId="69" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_70" Table="Procedures" Field="ProcDateText" RecordId="70" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_70" Table="Procedures" Field="ProcDate"  RecordId="70" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_71" Table="Procedures" Field="ProcDateText" RecordId="71" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_71" Table="Procedures" Field="ProcDate"  RecordId="71" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_72" Table="Procedures" Field="ProcDateText" RecordId="72" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_72" Table="Procedures" Field="ProcDate"  RecordId="72" runat="server" style="display:none;width:1px;"/>
                        			
                        			
		                            <euc:EformTextBox id="ProcSite_14" Table="Procedures" Field="ProcSite"  RecordId="14" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_15" Table="Procedures" Field="ProcSite"  RecordId="15" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_16" Table="Procedures" Field="ProcSite"  RecordId="16" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_17" Table="Procedures" Field="ProcSite"  RecordId="17" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_18" Table="Procedures" Field="ProcSite"  RecordId="18" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_19" Table="Procedures" Field="ProcSite"  RecordId="19" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_20" Table="Procedures" Field="ProcSite"  RecordId="20" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_21" Table="Procedures" Field="ProcSite"  RecordId="21" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_22" Table="Procedures" Field="ProcSite"  RecordId="22" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_23" Table="Procedures" Field="ProcSite"  RecordId="23" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_24" Table="Procedures" Field="ProcSite"  RecordId="24" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_67" Table="Procedures" Field="ProcSite"  RecordId="67" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_68" Table="Procedures" Field="ProcSite"  RecordId="68" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_69" Table="Procedures" Field="ProcSite"  RecordId="69" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_70" Table="Procedures" Field="ProcSite"  RecordId="70" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_71" Table="Procedures" Field="ProcSite"  RecordId="71" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_72" Table="Procedures" Field="ProcSite"  RecordId="72" runat="server" style="display:none; width:1px;" />
                        			
                        			
			                        <euc:EformCheckBox RecordId="14" Table="Procedures" Field="ProcName" id="ProcName_14" Value="Abdomino-Perineal Resection" runat="server"  /> Abdomino-Perineal Resection<br/>
			                        <euc:EformCheckBox RecordId="15" Table="Procedures" Field="ProcName" id="ProcName_15" Value="APR w/ PSWD" runat="server" /> APR w/ PSWD<br/>
			                        <euc:EformCheckBox RecordId="16" Table="Procedures" Field="ProcName" id="ProcName_16" Value="LAR" runat="server" /> LAR<br/>
			                        <euc:EformCheckBox RecordId="17" Table="Procedures" Field="ProcName" id="ProcName_17" Value="LAR w/ Ileostomy" runat="server" /> LAR w/ Ileostomy<br/>
			                        <euc:EformCheckBox RecordId="18" Table="Procedures" Field="ProcName" id="ProcName_18" Value="LAR / PSWD" runat="server" /> LAR / PSWD<br/>
			                        <euc:EformCheckBox RecordId="19" Table="Procedures" Field="ProcName" id="ProcName_19" Value="LAR w/ Ileostomy / PSWD" runat="server" /> LAR w/ Ileostomy / PSWD<br/>
			                        <euc:EformCheckBox RecordId="20" Table="Procedures" Field="ProcName" id="ProcName_20" Value="LAR / CAA, w/ pouch +/- Ileostomy" runat="server"/> LAR / CAA, w/ pouch +/- Ileostomy<br/>
			                        <euc:EformCheckBox RecordId="21" Table="Procedures" Field="ProcName" id="ProcName_21" Value="LAR / Coloanal / PSWD" runat="server" /> LAR / Coloanal / PSWD<br/>
			                        <euc:EformCheckBox RecordId="22" Table="Procedures" Field="ProcName" id="ProcName_22" Value="LAR w/ CAA, w/ pouch, w/ Ileostomy / PSWD" runat="server" /> LAR w/ CAA, w/ pouch, w/ Ileostomy /<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PSWD<br/>
			                        <euc:EformCheckBox RecordId="23" Table="Procedures" Field="ProcName" id="ProcName_23" Value="Proctocolectomy / IPAA" runat="server" /> Proctocolectomy / IPAA<br/>
			                        <euc:EformCheckBox RecordId="24" Table="Procedures" Field="ProcName" id="ProcName_24" Value="Proctocolectomy / Ileostomy" runat="server"  /> Proctocolectomy / Ileostomy<br/>
                        			
			                        <euc:EformCheckBox RecordId="67" Table="Procedures" Field="ProcName" id="ProcName_67" Value="Proctectomy, Perineal" runat="server" /> Proctectomy, Perineal<br/>
			                        <euc:EformCheckBox RecordId="68" Table="Procedures" Field="ProcName" id="ProcName_68" Value="Transanal Excision" runat="server" /> Transanal Excision<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;w/o Pouch<br/>
			                        <euc:EformCheckBox RecordId="69" Table="Procedures" Field="ProcName" id="ProcName_69" Value="Transanal Microsurgery" runat="server" /> Transanal Microsurgery<br/>
			                        <euc:EformCheckBox RecordId="70" Table="Procedures" Field="ProcName" id="ProcName_70" Value="Proctectomy, Partial" runat="server" /> Proctectomy, Partial<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;& PSWD<br/>
			                        <euc:EformCheckBox RecordId="71" Table="Procedures" Field="ProcName" id="ProcName_71" Value="Rectal Tumor Fulguration" runat="server" /> Rectal Tumor Fulguration<br/>
			                        <euc:EformCheckBox RecordId="72" Table="Procedures" Field="ProcName" id="ProcName_72" Value="Presacral Mobilization" runat="server" /> Presacral Mobilization<br/>			
			                        </td>
		                        </tr>
		                        </table>
                                
	                        </td>

                          </tr>
                        </table><br/>
                        <%--End of Colon AND Ancillary Procs--%>


                        <%--Start of Pelvis And Abdomen Procs--%>
                            <table border="0" cellspacing="0" cellpadding="0" width="600">
                                <tr >
	                        <td style="width:290px; vertical-align:top;">
		                         <span class="controlBoxTitle"  style="font-size: 12px;">Pelvis</span><br/>
		                        <table border="0" cellspacing="0" cellpadding="16" width="290" class="eformLargePopulatedTable">
		                         <tr id="AncillaryProceduresListRow5" runat="server">
			                        <td  style="height: 295px; vertical-align: top;">			
			                        <asp:HiddenField ID="PelvisAbdomenProcDt" runat="server" />
			                        <euc:EformTextBox id="ProcDateText_25" Table="Procedures" Field="ProcDateText" RecordId="25" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_25" Table="Procedures" Field="ProcDate"  RecordId="25" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_26" Table="Procedures" Field="ProcDateText" RecordId="26" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_26" Table="Procedures" Field="ProcDate"  RecordId="26" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_27" Table="Procedures" Field="ProcDateText" RecordId="27" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_27" Table="Procedures" Field="ProcDate"  RecordId="27" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_28" Table="Procedures" Field="ProcDateText" RecordId="28" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_28" Table="Procedures" Field="ProcDate"  RecordId="28" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_29" Table="Procedures" Field="ProcDateText" RecordId="29" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_29" Table="Procedures" Field="ProcDate"  RecordId="29" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_30" Table="Procedures" Field="ProcDateText" RecordId="30" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_30" Table="Procedures" Field="ProcDate"  RecordId="30" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_31" Table="Procedures" Field="ProcDateText" RecordId="31" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_31" Table="Procedures" Field="ProcDate"  RecordId="31" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_32" Table="Procedures" Field="ProcDateText" RecordId="32" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_32" Table="Procedures" Field="ProcDate"  RecordId="32" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_33" Table="Procedures" Field="ProcDateText" RecordId="33" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_33" Table="Procedures" Field="ProcDate"  RecordId="33" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_34" Table="Procedures" Field="ProcDateText" RecordId="34" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_34" Table="Procedures" Field="ProcDate"  RecordId="34" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_35" Table="Procedures" Field="ProcDateText" RecordId="35" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_35" Table="Procedures" Field="ProcDate"  RecordId="35" runat="server" style="display:none;width:1px;"/>
                        		    
		                            <euc:EformTextBox id="ProcSite_25" Table="Procedures" Field="ProcSite"  RecordId="25" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_26" Table="Procedures" Field="ProcSite"  RecordId="26" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_27" Table="Procedures" Field="ProcSite"  RecordId="27" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_28" Table="Procedures" Field="ProcSite"  RecordId="28" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_29" Table="Procedures" Field="ProcSite"  RecordId="29" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_30" Table="Procedures" Field="ProcSite"  RecordId="30" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_31" Table="Procedures" Field="ProcSite"  RecordId="31" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_32" Table="Procedures" Field="ProcSite"  RecordId="32" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_33" Table="Procedures" Field="ProcSite"  RecordId="33" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_34" Table="Procedures" Field="ProcSite"  RecordId="34" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_35" Table="Procedures" Field="ProcSite"  RecordId="35" runat="server" style="display:none; width:1px;" />	
                        			
			                        <euc:EformCheckBox RecordId="25" Table="Procedures" Field="ProcName" id="ProcName_25" Value="Pelvic Mass Resection" runat="server"  /> Pelvic Mass Resection<br/>
			                        <euc:EformCheckBox RecordId="26" Table="Procedures" Field="ProcName" id="ProcName_26" Value="Pelvic Exenteration, Total" runat="server" /> Pelvic Exenteration, Total<br/>
			                        <euc:EformCheckBox RecordId="27" Table="Procedures" Field="ProcName" id="ProcName_27" Value="Pelvic Extent w/ Sacrectomy" runat="server" /> Pelvic Extent w/ Sacrectomy<br/>
			                        <euc:EformCheckBox RecordId="28" Table="Procedures" Field="ProcName" id="ProcName_28" Value="Post-Pelvic Exenteration" runat="server" /> Post-Pelvic Exenteration<br/>
			                        <euc:EformCheckBox RecordId="29" Table="Procedures" Field="ProcName" id="ProcName_29" Value="Vaginectomy, Partial" runat="server" /> Vaginectomy, Partial<br/>
			                        <euc:EformCheckBox RecordId="30" Table="Procedures" Field="ProcName" id="ProcName_30" Value="TAH-BSO" runat="server" /> TAH-BSO<br/>
			                        <euc:EformCheckBox RecordId="31" Table="Procedures" Field="ProcName" id="ProcName_31" Value="BSO/USO" runat="server" /> BSO/USO<br/>
			                        <euc:EformCheckBox RecordId="32" Table="Procedures" Field="ProcName" id="ProcName_32" Value="Retroperitoneal/Pelvic Tumor Resect, Simple" runat="server" /> Retroperitoneal/Pelvic Tumor Resect,<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Simple<br/>
			                        <euc:EformCheckBox RecordId="33" Table="Procedures" Field="ProcName" id="ProcName_33" Value="Retroperitoneal/Pelvic Tumor Resect, Extensive" runat="server" /> Retroperitoneal/Pelvic Tumor Resect,<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Extensive<br/>
			                        <euc:EformCheckBox RecordId="34" Table="Procedures" Field="ProcName" id="ProcName_34" Value="Sacrectomy, Ant Partial" runat="server" /> Sacrectomy, Ant Partial<br/>
			                        <euc:EformCheckBox RecordId="35" Table="Procedures" Field="ProcName" id="ProcName_35" Value="Inguinal Node Dissection" runat="server" /> Inguinal Node Dissection<br/>			
                        			
			                        </td>
		                        </tr>
		                        </table>		
	                        </td>
	                        <td style="width:10px;">	
                        			

	                        </td>
	                        <td style="width:290px; vertical-align:top;">
		                         <span class="controlBoxTitle"  style="font-size: 12px;">Abdomen</span><br/>
		                        <table border="0" cellspacing="0" cellpadding="16" width="290" class="eformLargePopulatedTable">
		                         <tr id="AncillaryProceduresListRow6" runat="server">
			                        <td  style="height: 295px; vertical-align: top;">		

			                        <euc:EformTextBox id="ProcDateText_36" Table="Procedures" Field="ProcDateText" RecordId="36" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_36" Table="Procedures" Field="ProcDate"  RecordId="36" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_37" Table="Procedures" Field="ProcDateText" RecordId="37" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_37" Table="Procedures" Field="ProcDate"  RecordId="37" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_38" Table="Procedures" Field="ProcDateText" RecordId="38" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_38" Table="Procedures" Field="ProcDate"  RecordId="38" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_39" Table="Procedures" Field="ProcDateText" RecordId="39" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_39" Table="Procedures" Field="ProcDate"  RecordId="39" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_40" Table="Procedures" Field="ProcDateText" RecordId="40" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_40" Table="Procedures" Field="ProcDate"  RecordId="40" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_41" Table="Procedures" Field="ProcDateText" RecordId="41" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_41" Table="Procedures" Field="ProcDate"  RecordId="41" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_42" Table="Procedures" Field="ProcDateText" RecordId="42" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_42" Table="Procedures" Field="ProcDate"  RecordId="42" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_43" Table="Procedures" Field="ProcDateText" RecordId="43" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_43" Table="Procedures" Field="ProcDate"  RecordId="43" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_44" Table="Procedures" Field="ProcDateText" RecordId="44" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_44" Table="Procedures" Field="ProcDate"  RecordId="44" runat="server" style="display:none;width:1px;"/>		
                        		    
		                            <euc:EformTextBox id="ProcDateText_73" Table="Procedures" Field="ProcDateText" RecordId="73" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_73" Table="Procedures" Field="ProcDate"  RecordId="73" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_74" Table="Procedures" Field="ProcDateText" RecordId="74" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_74" Table="Procedures" Field="ProcDate"  RecordId="74" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_75" Table="Procedures" Field="ProcDateText" RecordId="75" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_75" Table="Procedures" Field="ProcDate"  RecordId="75" runat="server" style="display:none;width:1px;"/>
                        		    
		                            <euc:EformTextBox id="ProcDateText_62" Table="Procedures" Field="ProcDateText" RecordId="62" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_62" Table="Procedures" Field="ProcDate"  RecordId="62" runat="server" style="display:none;width:1px;"/>
                        		    
		                            <euc:EformTextBox id="ProcDateText_63" Table="Procedures" Field="ProcDateText" RecordId="63" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_63" Table="Procedures" Field="ProcDate"  RecordId="63" runat="server" style="display:none;width:1px;"/>
                        		    
                        		    
		                            <euc:EformTextBox id="ProcSite_36" Table="Procedures" Field="ProcSite"  RecordId="36" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_37" Table="Procedures" Field="ProcSite"  RecordId="37" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_38" Table="Procedures" Field="ProcSite"  RecordId="38" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_39" Table="Procedures" Field="ProcSite"  RecordId="39" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_40" Table="Procedures" Field="ProcSite"  RecordId="40" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_41" Table="Procedures" Field="ProcSite"  RecordId="41" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_42" Table="Procedures" Field="ProcSite"  RecordId="42" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_43" Table="Procedures" Field="ProcSite"  RecordId="43" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_44" Table="Procedures" Field="ProcSite"  RecordId="44" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_73" Table="Procedures" Field="ProcSite"  RecordId="73" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_74" Table="Procedures" Field="ProcSite"  RecordId="74" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_75" Table="Procedures" Field="ProcSite"  RecordId="75" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_62" Table="Procedures" Field="ProcSite"  RecordId="62" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_63" Table="Procedures" Field="ProcSite"  RecordId="63" runat="server" style="display:none; width:1px;" />

                        			
			                        <euc:EformCheckBox RecordId="36" Table="Procedures" Field="ProcName" id="ProcName_36" Value="Abdominal Wall Exc, Partial Thick" runat="server"/> Abdominal Wall Exc, Partial Thick<br/>
			                        <euc:EformCheckBox RecordId="37" Table="Procedures" Field="ProcName" id="ProcName_37" Value="Abdominal Wall Exc, Full Thick" runat="server"/> Abdominal Wall Exc, Full Thick<br/>
			                        <euc:EformCheckBox RecordId="38" Table="Procedures" Field="ProcName" id="ProcName_38" Value="Gastrostomy, Temporary" runat="server"  /> Gastrostomy, Temporary<br/>
			                        <euc:EformCheckBox RecordId="39" Table="Procedures" Field="ProcName" id="ProcName_39" Value="Lysis Adhesions" runat="server"  /> Lysis Adhesions<br/>
			                        <euc:EformCheckBox RecordId="40" Table="Procedures" Field="ProcName" id="ProcName_40" Value="Small Bowel Resection" runat="server" /> Small Bowel Resection<br/>
			                        <euc:EformCheckBox RecordId="41" Table="Procedures" Field="ProcName" id="ProcName_41" Value="Omentectomy-Secondary" runat="server" /> Omentectomy-Secondary<br/>
			                        <euc:EformCheckBox RecordId="42" Table="Procedures" Field="ProcName" id="ProcName_42" Value="Omental Pedicle Graft" runat="server" /> Omental Pedicle Graft<br/>
			                        <euc:EformCheckBox RecordId="43" Table="Procedures" Field="ProcName" id="ProcName_43" Value="Incisional Hernia Repair" runat="server" /> Incisional Hernia Repair<br/>
			                        <euc:EformCheckBox RecordId="44" Table="Procedures" Field="ProcName" id="ProcName_44" Value="Incisional Hernia Repair w/ Mesh" runat="server" /> Incisional Hernia Repair w/ Mesh<br/>
                        			
			                        <euc:EformCheckBox RecordId="73" Table="Procedures" Field="ProcName" id="ProcName_73" Value="Appendectomy" runat="server"/> Appendectomy<br/>
			                        <euc:EformCheckBox RecordId="74" Table="Procedures" Field="ProcName" id="ProcName_74" Value="Splenectomy" runat="server" /> Splenectomy<br/>
			                        <euc:EformCheckBox RecordId="75" Table="Procedures" Field="ProcName" id="ProcName_75" Value="Laparotomy, Exploratory" runat="server"/> Laparotomy, Exploratory<br/>
                        			
			                        <euc:EformCheckBox RecordId="62" Table="Procedures" Field="ProcName" id="ProcName_62" Value="Intraperitoneal Cath Insertion" runat="server"/> Intraperitoneal Cath Insertion<br/>
                        			
			                        <euc:EformCheckBox RecordId="63" Table="Procedures" Field="ProcName" id="ProcName_63" Value="Splenic Flexure Mobilization" runat="server"  /> Splenic Flexure Mobilization<br/>
                        			
			                        </td>
		                        </tr>
		                        </table>        
	                        </td>

                          </tr>
                            </table><br/>
                        <%--End of Pelvis And Abdomen Procs--%>


                        <%-- Start of Miscellaneous and Hepatic Procs--%>
                            <table border="0" cellspacing="0" cellpadding="0" width="600">
                                <tr >
	                               <td style="width:290px; vertical-align:top;">
                        	
	                         <span class="controlBoxTitle"  style="font-size: 12px;">Hepatic</span><br/>
		                        <table border="0" cellspacing="0" cellpadding="16" width="290" class="eformLargePopulatedTable" style="margin-bottom: 27px;">
		                         <tr id="AncillaryProceduresListRow7" runat="server">
			                        <td >			
			                        <asp:HiddenField ID="MiscHepaticProcDt" runat="server" />
			                        <euc:EformTextBox id="ProcDateText_55" Table="Procedures" Field="ProcDateText" RecordId="55" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_55" Table="Procedures" Field="ProcDate"  RecordId="55" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_56" Table="Procedures" Field="ProcDateText" RecordId="56" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_56" Table="Procedures" Field="ProcDate"  RecordId="56" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_57" Table="Procedures" Field="ProcDateText" RecordId="57" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_57" Table="Procedures" Field="ProcDate"  RecordId="57" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_58" Table="Procedures" Field="ProcDateText" RecordId="58" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_58" Table="Procedures" Field="ProcDate"  RecordId="58" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_59" Table="Procedures" Field="ProcDateText" RecordId="59" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_59" Table="Procedures" Field="ProcDate"  RecordId="59" runat="server" style="display:none;width:1px;"/>
                        			
                                    <euc:EformTextBox id="ProcSite_55" Table="Procedures" Field="ProcSite"  RecordId="55" runat="server" style="display:none; width:1px;" />
                                    <euc:EformTextBox id="ProcSite_56" Table="Procedures" Field="ProcSite"  RecordId="56" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_57" Table="Procedures" Field="ProcSite"  RecordId="57" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_58" Table="Procedures" Field="ProcSite"  RecordId="58" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_59" Table="Procedures" Field="ProcSite"  RecordId="59" runat="server" style="display:none; width:1px;" />
                        			
                        			
			                        <euc:EformCheckBox RecordId="55" Table="Procedures" Field="ProcName" id="ProcName_55" Value="Hep Art Cath Pump" runat="server" /> Hep Art Cath Pump<br/>
			                        <euc:EformCheckBox RecordId="56" Table="Procedures" Field="ProcName" id="ProcName_56" Value="Liver Biopsy" runat="server" /> Liver Biopsy<br/>
			                        <euc:EformCheckBox RecordId="57" Table="Procedures" Field="ProcName" id="ProcName_57" Value="Hepatectomy, Wedge (Simple)" runat="server"  /> Hepatectomy, Wedge (Simple)<br/>
			                        <euc:EformCheckBox RecordId="58" Table="Procedures" Field="ProcName" id="ProcName_58" Value="Cholecystectomy" runat="server"  /> Cholecystectomy<br/>
			                        <euc:EformCheckBox RecordId="59" Table="Procedures" Field="ProcName" id="ProcName_59" Value="Ultrasound, Intraoperative" runat="server"  /> Ultrasound, Intraoperative<br/>
                        			
			                        </td>
		                        </tr>
		                        </table>
                        		
                        		
			                        
                        		
                        		
                                <span class="controlBoxTitle"  style="font-size: 12px;">Other Procedures</span><br/>
		                        <table border="0" cellspacing="0" cellpadding="16" width="290" class="eformLargePopulatedTable" style="background-position: 0px -150px;">
		                         <tr id="AncillaryProceduresListRow8" runat="server">
			                        <td >
			                            <euc:EformTextBox id="ProcDateText_Other" Table="Procedures" Field="ProcDateText" RecordId="76" runat="server" style="display:none;width:1px;"/>
		                                <euc:EformTextBox id="ProcDate_Other" Table="Procedures" Field="ProcDate"  RecordId="76" runat="server" style="display:none;width:1px;"/>
				                        <euc:EformComboBox   runat="server" style="width:200px;" LookupCode="ProcName" Field="ProcName" RecordId="76" Table="Procedures" MaxLength="50" id="ProcName_76"/>
			                        </td>
		                        </tr>
		                        </table>	
                        		
	                        </td>
	                               <td style="width:10px;">				

	                        </td>
	                               <td style="width:290px; vertical-align:top;">	
			                         <span class="controlBoxTitle"  style="font-size: 12px;">Anorectal</span><br/>
		                        <table border="0" cellspacing="0" cellpadding="16" width="290" class="eformLargePopulatedTable">
		                         <tr id="AncillaryProceduresListRow9" runat="server">
			                        <td  style="height: 228px; vertical-align: top;">			
                        			
			                        <euc:EformTextBox id="ProcDateText_45" Table="Procedures" Field="ProcDateText" RecordId="45" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_45" Table="Procedures" Field="ProcDate"  RecordId="45" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_46" Table="Procedures" Field="ProcDateText" RecordId="46" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_46" Table="Procedures" Field="ProcDate"  RecordId="46" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_47" Table="Procedures" Field="ProcDateText" RecordId="47" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_47" Table="Procedures" Field="ProcDate"  RecordId="47" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_48" Table="Procedures" Field="ProcDateText" RecordId="48" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_48" Table="Procedures" Field="ProcDate"  RecordId="48" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_49" Table="Procedures" Field="ProcDateText" RecordId="49" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_49" Table="Procedures" Field="ProcDate"  RecordId="49" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_50" Table="Procedures" Field="ProcDateText" RecordId="50" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_50" Table="Procedures" Field="ProcDate"  RecordId="50" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_51" Table="Procedures" Field="ProcDateText" RecordId="51" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_51" Table="Procedures" Field="ProcDate"  RecordId="51" runat="server" style="display:none;width:1px;"/>
			                        <euc:EformTextBox id="ProcDateText_52" Table="Procedures" Field="ProcDateText" RecordId="52" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_52" Table="Procedures" Field="ProcDate"  RecordId="52" runat="server" style="display:none;width:1px;"/>
                        			
                                    <euc:EformTextBox id="ProcSite_45" Table="Procedures" Field="ProcSite"  RecordId="45" runat="server" style="display:none; width:1px;" />
                                    <euc:EformTextBox id="ProcSite_46" Table="Procedures" Field="ProcSite"  RecordId="46" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_47" Table="Procedures" Field="ProcSite"  RecordId="47" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_48" Table="Procedures" Field="ProcSite"  RecordId="48" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_49" Table="Procedures" Field="ProcSite"  RecordId="49" runat="server" style="display:none; width:1px;" />
                                    <euc:EformTextBox id="ProcSite_50" Table="Procedures" Field="ProcSite"  RecordId="50" runat="server" style="display:none; width:1px;" />
                                    <euc:EformTextBox id="ProcSite_51" Table="Procedures" Field="ProcSite"  RecordId="51" runat="server" style="display:none; width:1px;" />
		                            <euc:EformTextBox id="ProcSite_52" Table="Procedures" Field="ProcSite"  RecordId="52" runat="server" style="display:none; width:1px;" />
                        			
                        			
			                        <euc:EformCheckBox RecordId="45" Table="Procedures" Field="ProcName" id="ProcName_45" Value="Anorectal Biopsy" runat="server" /> Anorectal Biopsy<br/>
			                        <euc:EformCheckBox RecordId="46" Table="Procedures" Field="ProcName" id="ProcName_46" Value="Anal Fistulotomy (Complex)" runat="server"  /> Anal Fistulotomy (Complex)<br/>
			                        <euc:EformCheckBox RecordId="47" Table="Procedures" Field="ProcName" id="ProcName_47" Value="Closure Anal Fistula w/ Rectal Advancement Flap" runat="server" /> Closure Anal Fistula w/ Rectal<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Advancement Flap<br/>
			                        <euc:EformCheckBox RecordId="48" Table="Procedures" Field="ProcName" id="ProcName_48" Value="Repair Anal Fistula with Fibrin Glue" runat="server" /> Repair Anal Fistula with Fibrin Glue<br/>
			                        <euc:EformCheckBox RecordId="49" Table="Procedures" Field="ProcName" id="ProcName_49" Value="Condyloma Excision Intra Anal" runat="server"/> Condyloma Excision Intra Anal<br/>
			                        <euc:EformCheckBox RecordId="50" Table="Procedures" Field="ProcName" id="ProcName_50" Value="Exam Under Anesthesia" runat="server" /> Exam Under Anesthesia<br/>
			                        <euc:EformCheckBox RecordId="51" Table="Procedures" Field="ProcName" id="ProcName_51" Value="Hemorrhoidectomy" runat="server" /> Hemorrhoidectomy<br/>
			                        <euc:EformCheckBox RecordId="52" Table="Procedures" Field="ProcName" id="ProcName_52" Value="Excision of Anal Margin Lesion" runat="server"/> Excision of Anal Margin Lesion<br/>
                        			
			                        <!-- Record number 53, 54 has been removed. -->			
			                        </td>
		                        </tr>
		                        </table>
	                        </td>

                                </tr>
                            </table>
                        <%--End of Miscellaneous and Hepatic Procs--%>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>





<script type="text/javascript" language="javascript">
    //this value is used in AppendixProcedure usercontrol to show or hide ancillary procs list 
    var AncillaryProceduresListTable = $('<%=AncillaryProceduresListTable.ClientID %>');
    var AncillaryProceduresListRow1 = $('<%= AncillaryProceduresListRow1.ClientID %>');  //colon proc list
    var AncillaryProceduresListRow2 = $('<%= AncillaryProceduresListRow2.ClientID %>');  //Rectosigmoid proc list
    var AncillaryProceduresListRow3 = $('<%= AncillaryProceduresListRow3.ClientID %>');  //Rectum proc list
    var AncillaryProceduresListRow4 = $('<%= AncillaryProceduresListRow4.ClientID %>');  //Stoma proc list
    var AncillaryProceduresListRow5 = $('<%= AncillaryProceduresListRow5.ClientID %>');  //Pelvis proc list
    var AncillaryProceduresListRow6 = $('<%= AncillaryProceduresListRow6.ClientID %>');  //Abdomen proc list
    var AncillaryProceduresListRow7 = $('<%= AncillaryProceduresListRow7.ClientID %>');  //Hepatic proc list
    var AncillaryProceduresListRow8 = $('<%= AncillaryProceduresListRow8.ClientID %>');  //Other proc list
    var AncillaryProceduresListRow9 = $('<%= AncillaryProceduresListRow9.ClientID %>');  //Anorectal proc list
    
    //Adds events to controls
    function addColonRectalProcEvents(procName,procDtTxt,procDt,HiddenProcDt,procSite,procSiteValue)
    { 
        $(procName).addEvent('click',curry(ColonRectalAutoPopulates,procName,procDtTxt,procDt,HiddenProcDt,procSite,procSiteValue));
    }
 
    addColonRectalProcEvents($('<%= ProcName_2.ClientID %>'),$('<%= ProcDateText_2.ClientID %>'),$('<%= ProcDate_2.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_2.ClientID %>'),'Colon');
    addColonRectalProcEvents($('<%= ProcName_3.ClientID %>'),$('<%= ProcDateText_3.ClientID %>'),$('<%= ProcDate_3.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_3.ClientID %>'),'Colon');
    addColonRectalProcEvents($('<%= ProcName_4.ClientID %>'),$('<%= ProcDateText_4.ClientID %>'),$('<%= ProcDate_4.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_4.ClientID %>'),'Colon');
    addColonRectalProcEvents($('<%= ProcName_5.ClientID %>'),$('<%= ProcDateText_5.ClientID %>'),$('<%= ProcDate_5.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_5.ClientID %>'),'Colon');
    addColonRectalProcEvents($('<%= ProcName_6.ClientID %>'),$('<%= ProcDateText_6.ClientID %>'),$('<%= ProcDate_6.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_6.ClientID %>'),'Colon');
    addColonRectalProcEvents($('<%= ProcName_7.ClientID %>'),$('<%= ProcDateText_7.ClientID %>'),$('<%= ProcDate_7.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_7.ClientID %>'),'Colon');
    addColonRectalProcEvents($('<%= ProcName_8.ClientID %>'),$('<%= ProcDateText_8.ClientID %>'),$('<%= ProcDate_8.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_8.ClientID %>'),'Colon');

    addColonRectalProcEvents($('<%= ProcName_9.ClientID %>'),$('<%= ProcDateText_9.ClientID %>'),$('<%= ProcDate_9.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_9.ClientID %>'),'Rectosigmoid');
    addColonRectalProcEvents($('<%= ProcName_10.ClientID %>'),$('<%= ProcDateText_10.ClientID %>'),$('<%= ProcDate_10.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_10.ClientID %>'),'Rectosigmoid');

    addColonRectalProcEvents($('<%= ProcName_11.ClientID %>'),$('<%= ProcDateText_11.ClientID %>'),$('<%= ProcDate_11.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_11.ClientID %>'),'Stoma');
    addColonRectalProcEvents($('<%= ProcName_12.ClientID %>'),$('<%= ProcDateText_12.ClientID %>'),$('<%= ProcDate_12.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_12.ClientID %>'),'Stoma');
    addColonRectalProcEvents($('<%= ProcName_13.ClientID %>'),$('<%= ProcDateText_13.ClientID %>'),$('<%= ProcDate_13.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_13.ClientID %>'),'Stoma');
    addColonRectalProcEvents($('<%= ProcName_60.ClientID %>'),$('<%= ProcDateText_60.ClientID %>'),$('<%= ProcDate_60.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_60.ClientID %>'),'Stoma');
    addColonRectalProcEvents($('<%= ProcName_61.ClientID %>'),$('<%= ProcDateText_61.ClientID %>'),$('<%= ProcDate_61.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_61.ClientID %>'),'Stoma');

    addColonRectalProcEvents($('<%= ProcName_14.ClientID %>'),$('<%= ProcDateText_14.ClientID %>'),$('<%= ProcDate_14.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_14.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_15.ClientID %>'),$('<%= ProcDateText_15.ClientID %>'),$('<%= ProcDate_15.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_15.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_16.ClientID %>'),$('<%= ProcDateText_16.ClientID %>'),$('<%= ProcDate_16.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_16.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_17.ClientID %>'),$('<%= ProcDateText_17.ClientID %>'),$('<%= ProcDate_17.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_17.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_18.ClientID %>'),$('<%= ProcDateText_18.ClientID %>'),$('<%= ProcDate_18.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_18.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_19.ClientID %>'),$('<%= ProcDateText_19.ClientID %>'),$('<%= ProcDate_19.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_19.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_20.ClientID %>'),$('<%= ProcDateText_20.ClientID %>'),$('<%= ProcDate_20.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_20.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_21.ClientID %>'),$('<%= ProcDateText_21.ClientID %>'),$('<%= ProcDate_21.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_21.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_22.ClientID %>'),$('<%= ProcDateText_22.ClientID %>'),$('<%= ProcDate_22.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_22.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_23.ClientID %>'),$('<%= ProcDateText_23.ClientID %>'),$('<%= ProcDate_23.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_23.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_24.ClientID %>'),$('<%= ProcDateText_24.ClientID %>'),$('<%= ProcDate_24.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_24.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_67.ClientID %>'),$('<%= ProcDateText_67.ClientID %>'),$('<%= ProcDate_67.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_67.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_68.ClientID %>'),$('<%= ProcDateText_68.ClientID %>'),$('<%= ProcDate_68.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_68.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_69.ClientID %>'),$('<%= ProcDateText_69.ClientID %>'),$('<%= ProcDate_69.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_69.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_70.ClientID %>'),$('<%= ProcDateText_70.ClientID %>'),$('<%= ProcDate_70.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_70.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_71.ClientID %>'),$('<%= ProcDateText_71.ClientID %>'),$('<%= ProcDate_71.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_71.ClientID %>'),'Rectum');
    addColonRectalProcEvents($('<%= ProcName_72.ClientID %>'),$('<%= ProcDateText_72.ClientID %>'),$('<%= ProcDate_72.ClientID %>'),$('<%= colonRectalProcDt.ClientID %>'),$('<%= ProcSite_72.ClientID %>'),'Rectum');


    function ColonRectalAutoPopulates(procName,procDtTxt,procDt,HiddenProcDt,procSite,procSiteValue)
    {
       if (procName.checked == true)
        {
           procSite.value = procSiteValue;
           procDtTxt.value = HiddenProcDt.value;
           procDt.value = HiddenProcDt.value;
        }
        else
        {
            procSite.value = '';
            procDtTxt.value = '';
            procDt.value = '';
        }
    }
    
    
    //Adds events to controls
    function addPelvisAbdomenProcEvents(PAprocName,PAprocDtTxt,PAprocDt,PAHiddenProcDt,PAprocSite,PAprocSiteValue)
    { 
        $(PAprocName).addEvent('click',curry(PelvisAbdomenAutoPopulates,PAprocName,PAprocDtTxt,PAprocDt,PAHiddenProcDt,PAprocSite,PAprocSiteValue));
    }
 
    addPelvisAbdomenProcEvents($('<%= ProcName_25.ClientID %>'),$('<%= ProcDateText_25.ClientID %>'),$('<%= ProcDate_25.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_25.ClientID %>'),'Pelvis');
    addPelvisAbdomenProcEvents($('<%= ProcName_26.ClientID %>'),$('<%= ProcDateText_26.ClientID %>'),$('<%= ProcDate_26.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_26.ClientID %>'),'Pelvis');
    addPelvisAbdomenProcEvents($('<%= ProcName_27.ClientID %>'),$('<%= ProcDateText_27.ClientID %>'),$('<%= ProcDate_27.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_27.ClientID %>'),'Pelvis');
    addPelvisAbdomenProcEvents($('<%= ProcName_28.ClientID %>'),$('<%= ProcDateText_28.ClientID %>'),$('<%= ProcDate_28.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_28.ClientID %>'),'Pelvis');
    addPelvisAbdomenProcEvents($('<%= ProcName_29.ClientID %>'),$('<%= ProcDateText_29.ClientID %>'),$('<%= ProcDate_29.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_29.ClientID %>'),'Pelvis');
    addPelvisAbdomenProcEvents($('<%= ProcName_30.ClientID %>'),$('<%= ProcDateText_30.ClientID %>'),$('<%= ProcDate_30.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_30.ClientID %>'),'Pelvis');
    addPelvisAbdomenProcEvents($('<%= ProcName_31.ClientID %>'),$('<%= ProcDateText_31.ClientID %>'),$('<%= ProcDate_31.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_31.ClientID %>'),'Pelvis');
    addPelvisAbdomenProcEvents($('<%= ProcName_32.ClientID %>'),$('<%= ProcDateText_32.ClientID %>'),$('<%= ProcDate_32.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_32.ClientID %>'),'Pelvis');
    addPelvisAbdomenProcEvents($('<%= ProcName_33.ClientID %>'),$('<%= ProcDateText_33.ClientID %>'),$('<%= ProcDate_33.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_33.ClientID %>'),'Pelvis');
    addPelvisAbdomenProcEvents($('<%= ProcName_34.ClientID %>'),$('<%= ProcDateText_34.ClientID %>'),$('<%= ProcDate_34.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_34.ClientID %>'),'Pelvis');
    addPelvisAbdomenProcEvents($('<%= ProcName_35.ClientID %>'),$('<%= ProcDateText_35.ClientID %>'),$('<%= ProcDate_35.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_35.ClientID %>'),'Pelvis');
    
    addPelvisAbdomenProcEvents($('<%= ProcName_36.ClientID %>'),$('<%= ProcDateText_36.ClientID %>'),$('<%= ProcDate_36.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_36.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_37.ClientID %>'),$('<%= ProcDateText_37.ClientID %>'),$('<%= ProcDate_37.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_37.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_38.ClientID %>'),$('<%= ProcDateText_38.ClientID %>'),$('<%= ProcDate_38.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_38.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_39.ClientID %>'),$('<%= ProcDateText_39.ClientID %>'),$('<%= ProcDate_39.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_39.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_40.ClientID %>'),$('<%= ProcDateText_40.ClientID %>'),$('<%= ProcDate_40.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_40.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_41.ClientID %>'),$('<%= ProcDateText_41.ClientID %>'),$('<%= ProcDate_41.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_41.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_42.ClientID %>'),$('<%= ProcDateText_42.ClientID %>'),$('<%= ProcDate_42.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_42.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_43.ClientID %>'),$('<%= ProcDateText_43.ClientID %>'),$('<%= ProcDate_43.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_43.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_44.ClientID %>'),$('<%= ProcDateText_44.ClientID %>'),$('<%= ProcDate_44.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_44.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_73.ClientID %>'),$('<%= ProcDateText_73.ClientID %>'),$('<%= ProcDate_73.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_73.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_74.ClientID %>'),$('<%= ProcDateText_74.ClientID %>'),$('<%= ProcDate_74.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_74.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_75.ClientID %>'),$('<%= ProcDateText_75.ClientID %>'),$('<%= ProcDate_75.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_75.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_62.ClientID %>'),$('<%= ProcDateText_62.ClientID %>'),$('<%= ProcDate_62.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_62.ClientID %>'),'Abdomen');
    addPelvisAbdomenProcEvents($('<%= ProcName_63.ClientID %>'),$('<%= ProcDateText_63.ClientID %>'),$('<%= ProcDate_63.ClientID %>'),$('<%= PelvisAbdomenProcDt.ClientID %>'),$('<%= ProcSite_63.ClientID %>'),'Abdomen');

    function PelvisAbdomenAutoPopulates(PAprocName,PAprocDtTxt,PAprocDt,PAHiddenProcDt,PAprocSite,PAprocSiteValue)
    {
       if (PAprocName.checked == true)
        {
           PAprocSite.value = PAprocSiteValue;
           PAprocDtTxt.value = PAHiddenProcDt.value;
           PAprocDt.value = PAHiddenProcDt.value;
        }
        else
        {
            PAprocSite.value = '';
            PAprocDtTxt.value = '';
            PAprocDt.value = '';
        }
    }
    
    
    //Adds events to controls
    function addMiscHepaticProcEvents(MHprocName,MHprocDtTxt,MHprocDt,MHHiddenProcDt,MHprocSite,MHprocSiteValue)
    { 
        $(MHprocName).addEvent('click',curry(MiscHepaticAutoPopulates,MHprocName,MHprocDtTxt,MHprocDt,MHHiddenProcDt,MHprocSite,MHprocSiteValue));
    }
 
    addMiscHepaticProcEvents($('<%= ProcName_55.ClientID %>'),$('<%= ProcDateText_55.ClientID %>'),$('<%= ProcDate_55.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_55.ClientID %>'),'Hepatic');
    addMiscHepaticProcEvents($('<%= ProcName_56.ClientID %>'),$('<%= ProcDateText_56.ClientID %>'),$('<%= ProcDate_56.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_56.ClientID %>'),'Hepatic');
    addMiscHepaticProcEvents($('<%= ProcName_57.ClientID %>'),$('<%= ProcDateText_57.ClientID %>'),$('<%= ProcDate_57.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_57.ClientID %>'),'Hepatic');
    addMiscHepaticProcEvents($('<%= ProcName_58.ClientID %>'),$('<%= ProcDateText_58.ClientID %>'),$('<%= ProcDate_58.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_58.ClientID %>'),'Hepatic');
    addMiscHepaticProcEvents($('<%= ProcName_59.ClientID %>'),$('<%= ProcDateText_59.ClientID %>'),$('<%= ProcDate_59.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_59.ClientID %>'),'Hepatic');
    
    addMiscHepaticProcEvents($('<%= ProcName_45.ClientID %>'),$('<%= ProcDateText_45.ClientID %>'),$('<%= ProcDate_45.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_45.ClientID %>'),'Anorectal');
    addMiscHepaticProcEvents($('<%= ProcName_46.ClientID %>'),$('<%= ProcDateText_46.ClientID %>'),$('<%= ProcDate_46.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_46.ClientID %>'),'Anorectal');
    addMiscHepaticProcEvents($('<%= ProcName_47.ClientID %>'),$('<%= ProcDateText_47.ClientID %>'),$('<%= ProcDate_47.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_47.ClientID %>'),'Anorectal');
    addMiscHepaticProcEvents($('<%= ProcName_48.ClientID %>'),$('<%= ProcDateText_48.ClientID %>'),$('<%= ProcDate_48.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_48.ClientID %>'),'Anorectal');
    addMiscHepaticProcEvents($('<%= ProcName_49.ClientID %>'),$('<%= ProcDateText_49.ClientID %>'),$('<%= ProcDate_49.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_49.ClientID %>'),'Anorectal');
    addMiscHepaticProcEvents($('<%= ProcName_50.ClientID %>'),$('<%= ProcDateText_50.ClientID %>'),$('<%= ProcDate_50.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_50.ClientID %>'),'Anorectal');
    addMiscHepaticProcEvents($('<%= ProcName_51.ClientID %>'),$('<%= ProcDateText_51.ClientID %>'),$('<%= ProcDate_51.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_51.ClientID %>'),'Anorectal');
    addMiscHepaticProcEvents($('<%= ProcName_52.ClientID %>'),$('<%= ProcDateText_52.ClientID %>'),$('<%= ProcDate_52.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'),$('<%= ProcSite_52.ClientID %>'),'Anorectal');




    function MiscHepaticAutoPopulates(MHprocName,MHprocDtTxt,MHprocDt,MHHiddenProcDt,MHprocSite,MHprocSiteValue)
    {
       if (MHprocName.checked == true)
        {
           MHprocSite.value = MHprocSiteValue;
           MHprocDtTxt.value = MHHiddenProcDt.value;
           MHprocDt.value = MHHiddenProcDt.value;
        }
        else
        {
            MHprocSite.value = '';
            MHprocDtTxt.value = '';
            MHprocDt.value = '';
        }
    }
    
    
    function addMiscHepaticOtherProcEvents(otherprocName,otherprocDtTxt,otherprocDt,otherHiddenProcDt)
    { 
        $(otherprocName).addEvent('blur',curry(MiscHepaticOtherAutoPopulates,otherprocName,otherprocDtTxt,otherprocDt,otherHiddenProcDt));
    }
 
    addMiscHepaticOtherProcEvents($('<%= ProcName_76.ClientID %>'),$('<%= ProcDateText_Other.ClientID %>'),$('<%= ProcDate_Other.ClientID %>'),$('<%= MiscHepaticProcDt.ClientID %>'));

    function MiscHepaticOtherAutoPopulates(otherprocName,otherprocDtTxt,otherprocDt,otherHiddenProcDt)
    {
       if (otherprocName.value != '')
        {
           otherprocDtTxt.value = otherHiddenProcDt.value;
           otherprocDt.value = otherHiddenProcDt.value;
        }
        else
        {
            otherprocDtTxt.value = '';
            otherprocDt.value = '';
        }
    }
</script>