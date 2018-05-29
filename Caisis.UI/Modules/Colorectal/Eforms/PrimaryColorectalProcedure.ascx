<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Colorectal.Eforms.PrimaryColorectalProcedure" CodeFile="PrimaryColorectalProcedure.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<script type="text/javascript" >

function  updateOtherTxt(proc)
{
    var PrimaryProcListProcValue = $('<% =procOther.ClientID %>');
    PrimaryProcListProcValue.value = proc;
    
    //updates with Surgery date from hidden field
    if(PrimaryProcListProcValue.value != '')
    {
        $('<%= ProcDateText_1.ClientID %>').value=$('<%= procHiddenDate.ClientID %>').value;
        $('<%= ProcDate_1.ClientID %>').value=$('<%= procHiddenDate.ClientID %>').value;
        
        if(PSMProcPrimary.value == '')
        {
            $('<%= ProcPrimary_1.ClientID %>').value = '1';
        }
        else
        {
            $('<%= ProcPrimary_1.ClientID %>').value = '';
        }
    }
}

function setProcSite(site)
{
    if($('<%= procOther.ClientID %>').value !='')
    {
        document.getElementById('<% = ProcSite_1.ClientID %>').value = site;
        document.getElementById('<% = siteOther.ClientID %>').value = site;
    }
}

function primProcSelection(selection_value)
{
      var listDiv = document.getElementById('procListTbl');
      var otherDiv = document.getElementById('procOtherTbl');
      if (selection_value == "List")
      {
        listDiv.style.display='block';
        otherDiv.style.display='none';
        
      }
      else if(selection_value == "Other")
      {
        otherDiv.style.display='block';
        listDiv.style.display='none';
        
        clearElementsInParentRow(PrimaryProcedureListRow1);
      }
}
</script>



<a name="PrimaryColorectalProcedure" id="PrimaryColorectalProcedure" />
<table id="PrimaryProceduresListTable" runat="server" style="display:none;">
    <tr>
        <td>
            <table border="0" cellspacing="0" cellpadding="4" width="600" class="eformLargePopulatedTable">
             <tr >
	            <td id="ColorectalApproachTd">
		            <euc:EformRadioButtonList LookupCode="ColorectalApproach" Table="Procedures" RecordId="1" Field="ProcApproach" id="ProcApproach" 
		                RepeatLayout="Table" RepeatDirection="Horizontal" Cellpadding="10" runat="server" />
	            </td>
	            <td><img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('ColorectalApproachTd'));" style="float: right; cursor: pointer;" /></td>
              </tr>
            </table><br/><br/>
            <table>
                <tr>
                    <td><span class="controlBoxTitle">Primary Procedure</span>&nbsp;&nbsp;</td>
                    <td><euc:EformRadioButtonList ID="PrimProcOther" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" Table="NoTable" 
                        Field="PrimProcOther">
                            <asp:ListItem Value="List" Text="Select from Standard List" Selected="True" ></asp:ListItem> <%-- if these list texts are changed,change in JS function also--%>
                            <asp:ListItem Value="Other" Text="Enter Other Procedure" style="margin-left: 20px;"></asp:ListItem> <%--Text should be anything except "Other" --%>
                                                                                          <%-- to override builtin 'Other'--%>
                    </euc:EformRadioButtonList></td>
                </tr>
            </table>

            <table id="procListTbl" style=" display: block;" >
                <tr>
                    <td>
                        <span  style="font-size: 11px;">(Select One)</span>
                        <table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">
                         <tr id="PrimaryProcedureListRow1" runat="server">
	                        <td width="47%" style="vertical-align: top;">
                                    <asp:HiddenField ID="procHiddenDate" runat="server" />
		                            <euc:EformTextBox id="ProcDateText_1" Table="Procedures" Field="ProcDateText" RecordId="1" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcDate_1" Table="Procedures" Field="ProcDate"  RecordId="1" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox id="ProcSite_1" Table="Procedures" Field="ProcSite" RecordId="1" runat="server" style="display:none;width:1px;"/>
		                            <euc:EformTextBox ID="ProcPrimary_1" Table="Procedures" Field="ProcPrimary" RecordId="1" runat="server" style="display:none;width:1px;"/>
                        						
			                        <euc:EformRadioButtonGroup Table="Procedures" Field="ProcName" id="ProcName" RecordId="1" GroupName="ProcName" runat="server"
			                        Field1="ProcQuality" Value1="STD"
			                        Field3="ProcInstitution" Value3="Memorial Sloan Kettering Cancer Center">
                        			

                        			
                                    <strong style="margin-left:13px; color: #000000;">Colon</strong><br/>
	 		                        <euc:EformRadioButton Value="Right Hemicolectomy"  runat="server" Id="ProcName1" Text="Right Hemicolectomy" onclick="updateOtherTxt('Right Hemicolectomy'); setProcSite('Colon');" /><br/>
                                    <euc:EformRadioButton Value="Extended Right Colectomy"   runat="server" Id="ProcName2" Text="Extended Right Colectomy" onclick="updateOtherTxt('Extended Right Colectomy'); setProcSite('Colon');" /><br/>
                                    <euc:EformRadioButton Value="Left Hemicolectomy"  runat="server"  Id="ProcName3" Text="Left Hemicolectomy" onclick="updateOtherTxt('Left Hemicolectomy'); setProcSite('Colon');" /><br/>
                                    <euc:EformRadioButton Value="Extended Left Colectomy"  runat="server"  Id="ProcName4" Text="Extended Left Colectomy" onclick="updateOtherTxt('Extended Left Colectomy'); setProcSite('Colon');" /><br/>
                                    <euc:EformRadioButton Value="Subtotal Colectomy"  runat="server"  Id="ProcName5" Text="Subtotal Colectomy" onclick="updateOtherTxt('Subtotal Colectomy'); setProcSite('Colon');" /><br/>
                                    <euc:EformRadioButton Value="Anterior/Sigmoid Resection"  runat="server"  Id="ProcName6" Text="Anterior/Sigmoid Resection" onclick="updateOtherTxt('Anterior/Sigmoid Resection'); setProcSite('Colon');" /><br/>
                                    <euc:EformRadioButton Value="Hartmann Colectomy"  runat="server"  Id="ProcName7" Text="Hartmann Colectomy" onclick="updateOtherTxt('Hartmann Colectomy'); setProcSite('Colon');" /><br/>
			                        <euc:EformRadioButton Value="Total Colectomy / IRA"  runat="server"  Id="ProcName8" Text="Total Colectomy / IRA" onclick="updateOtherTxt('Total Colectomy / IRA'); setProcSite('Colon');" /><br/>
			                        <br/>
			                        <strong style="margin-left:13px; color: #000000;">Rectosigmoid</strong><br/>
                                    <euc:EformRadioButton Value="LAR"  runat="server"  Id="ProcName9" Text="LAR" onclick="setProcSite('Rectosigmoid'); updateOtherTxt('LAR');" /><br/>
                                    <euc:EformRadioButton Value="LAR w/ Ileostomy"  runat="server"  Id="ProcName10" Text="LAR w/ Ileostomy" onclick="setProcSite('Rectosigmoid'); updateOtherTxt('LAR w/ Ileostomy');" /><br/>
			                        <br/>
			                        <strong style="margin-left:13px; color: #000000;">Stoma</strong><br/>
			                        <euc:EformRadioButton Value="Ileostomy Closure"   runat="server" Id="ProcName11" Text="Ileostomy Closure" onclick="setProcSite('Stoma'); updateOtherTxt('Ileostomy Closure');" /><br/>
                                    <euc:EformRadioButton Value="Colostomy Closure"  runat="server"  Id="ProcName12" Text="Colostomy Closure" onclick="setProcSite('Stoma'); updateOtherTxt('Colostomy Closure');" /><br/>
                                    <euc:EformRadioButton Value="Hartmann Closure"  runat="server"  Id="ProcName13" Text="Hartmann Closure" onclick="setProcSite('Stoma'); updateOtherTxt('Hartmann Closure');" /><br/>
                                    <euc:EformRadioButton Value="Ileostomy"  runat="server"  Id="ProcName14" Text="Ileostomy" onclick="setProcSite('Stoma'); updateOtherTxt('Ileostomy');" /><br/>
                                    <euc:EformRadioButton Value="Colostomy, Loop"  runat="server"  Id="ProcName15" Text="Colostomy, Loop" onclick="setProcSite('Stoma'); updateOtherTxt('Colostomy, Loop');" /><br/>
                        			

                                    
       		                        </td><td>
                        			<img src="../../Images/Button_X_Clear.png" onclick="clearInputFields($('procListTbl'));clearInputFields($('procOtherTbl'));"  style="float: right; cursor: pointer; margin-right: -16; margin-top: -16;" />
			                        <strong style="margin-left:13px; color: #000000;">Rectum</strong><br/>
                                    <euc:EformRadioButton Value="Abdomino-Perineal Resection"  runat="server"  Id="ProcName16" Text="Abdomino-Perineal Resection" onclick="setProcSite('Rectum'); updateOtherTxt('Abdomino-Perineal Resection');" /><br/>
                                    <euc:EformRadioButton Value="APR w/ PSWD"  runat="server" Id="ProcName17" Text="APR w/ PSWD" onclick="setProcSite('Rectum'); updateOtherTxt('APR w/ PSWD');" /><br/>
                                    <euc:EformRadioButton Value="LAR"  runat="server"  Id="ProcName18" Text="LAR" onclick="setProcSite('Rectum'); updateOtherTxt('LAR');" /><br/>
                                    <euc:EformRadioButton Value="LAR w/ Ileostomy"  runat="server"  Id="ProcName19" Text="LAR w/ Ileostomy" onclick="setProcSite('Rectum'); updateOtherTxt('LAR w/ Ileostomy');" /><br/>
                                    <euc:EformRadioButton Value="LAR / PSWD"  runat="server"  Id="ProcName20" Text="LAR / PSWD" onclick="setProcSite('Rectum'); updateOtherTxt('LAR / PSWD');" /><br/>
                                    <euc:EformRadioButton Value="LAR w/ Ileostomy / PSWD"  runat="server"  Id="ProcName21" Text="LAR w/ Ileostomy / PSWD" onclick="setProcSite('Rectum'); updateOtherTxt('LAR w/ Ileostomy / PSWD');" /><br/>
		                            <euc:EformRadioButton Value="LAR / CAA, w/ pouch +/- Ileostomy"  runat="server"  Id="ProcName22" Text="LAR / CAA, w/ pouch +/- Ileostomy" onclick="setProcSite('Rectum'); updateOtherTxt('LAR / CAA, w/ pouch +/- Ileostomy');" /><br/>
                                    <euc:EformRadioButton Value="LAR / Coloanal / PSWD"  runat="server"  Id="ProcName23" Text="LAR / Coloanal / PSWD" onclick="setProcSite('Rectum'); updateOtherTxt('LAR / Coloanal / PSWD');" /><br/>
                                    <euc:EformRadioButton Value="LAR w/ CAA, w/ pouch, w/ Ileostomy / PSWD"  runat="server"  Id="ProcName24" Text="LAR w/ CAA, w/ pouch,<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;w/ Ileostomy / PSWD" onclick="setProcSite('Rectum'); updateOtherTxt('LAR w/ CAA, w/ pouch, w/ Ileostomy / PSWD');" /><br/>
                                    <euc:EformRadioButton Value="Proctocolectomy / IPAA"  runat="server"  Id="ProcName25" Text="Proctocolectomy / IPAA" onclick="setProcSite('Rectum'); updateOtherTxt('Proctocolectomy / IPAA');" /><br/>
                                    <euc:EformRadioButton Value="Proctocolectomy / Ileostomy"  runat="server"  Id="ProcName26" Text="Proctocolectomy / Ileostomy" onclick="setProcSite('Rectum'); updateOtherTxt('Proctocolectomy / Ileostomy');" /><br/>
                                    <euc:EformRadioButton Value="Proctectomy, Perineal"  runat="server"  Id="ProcName27" Text="Proctectomy, Perineal" onclick="setProcSite('Rectum'); updateOtherTxt('Proctectomy, Perineal');" /><br/>
                                    <euc:EformRadioButton Value="Transanal Excision"  runat="server"  Id="ProcName28" Text="Transanal Excision" onclick="setProcSite('Rectum'); updateOtherTxt('Transanal Excision');" /><br/>
                                    <euc:EformRadioButton Value="Transanal Microsurgery"  runat="server"  Id="ProcName29" Text="Transanal Microsurgery" onclick="setProcSite('Rectum'); updateOtherTxt('Transanal Microsurgery');" /><br/>
                                    <euc:EformRadioButton Value="Proctectomy, Partial"  runat="server"  Id="ProcName30" Text="Proctectomy, Partial" onclick="setProcSite('Rectum'); updateOtherTxt('Proctectomy, Partial');" /><br/>
                                    <euc:EformRadioButton Value="Rectal Tumor Fulguration"  runat="server"  Id="ProcName31" Text="Rectal Tumor Fulguration" onclick="setProcSite('Rectum'); updateOtherTxt('Rectal Tumor Fulguration');" /><br/>
                                    <euc:EformRadioButton Value="Presacral Mobilization"  runat="server"  Id="ProcName32" Text="Presacral Mobilization" onclick="setProcSite('Rectum'); updateOtherTxt('Presacral Mobilization');" /><br/>
                        			
                        <%--			
                                    <euc:EformRadioButton Value="LAR / Coloanal / Pelvic Sidewall Diss"  runat="server"  Id="ProcName33" Text="LAR / Coloanal / Pelvic Sidewall Diss" /><br/>
                                    <euc:EformRadioButton Value="LAR w/ CAA, w/pouch, w/ Enterostomy & PSWD"  runat="server"  Id="ProcName34" Text="LAR w/ CAA, w/pouch, w/ Enterostomy &<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PSWD" /><br/>
                                    <euc:EformRadioButton Value="Rectal Tumor Fulguration"  runat="server"  Id="ProcName35" Text="Rectal Tumor Fulguration" /><br/>
                                    <euc:EformRadioButton Value="Presacral Mobilization of Rectum"  runat="server"  Id="ProcName36" Text="Presacral Mobilization of Rectum" /><br/>
                        --%>          
                                    
                                    
		                        </td></tr>
		                        <tr><td style="vertical-align: top;">			
                        		
			                        <strong style="margin-left:13px; color: #000000;">Pelvis</strong><br/>
			                        <euc:EformRadioButton Value="Pelvic Mass Resection"  runat="server"  Id="ProcName37" Text="Pelvic Mass Resection" onclick="setProcSite('Pelvis'); updateOtherTxt('Pelvic Mass Resection');" /><br/>
                                    <euc:EformRadioButton Value="Pelvic Exenteration, Total"  runat="server"  Id="ProcName39" Text="Pelvic Exenteration, Total" onclick="setProcSite('Pelvis'); updateOtherTxt('Pelvic Exenteration, Total');" /><br/>
                                    <euc:EformRadioButton Value="Pelvic Extent w/ Sacrectomy"  runat="server"  Id="ProcName40" Text="Pelvic Extent w/ Sacrectomy" onclick="setProcSite('Pelvis'); updateOtherTxt('Pelvic Extent w/ Sacrectomy');" /><br/>
			                        <euc:EformRadioButton Value="Post-Pelvic Exenteration"  runat="server"  Id="ProcName43" Text="Post-Pelvic Exenteration" onclick="setProcSite('Pelvis'); updateOtherTxt('Post-Pelvic Exenteration');" /><br/>
                                    <euc:EformRadioButton Value="Vaginectomy, Partial"  runat="server"  Id="ProcName41" Text="Vaginectomy, Partial" onclick="setProcSite('Pelvis'); updateOtherTxt('Vaginectomy, Partial');" /><br/>
    		                        <euc:EformRadioButton Value="TAH-BSO"  runat="server"  Id="ProcName42" Text="TAH-BSO" onclick="setProcSite('Pelvis'); updateOtherTxt('TAH-BSO');" /><br/>
    		                        <euc:EformRadioButton Value="BSO/USO"  runat="server"  Id="ProcName44" Text="BSO/USO" onclick="setProcSite('Pelvis'); updateOtherTxt('BSO/USO');" /><br/>
                                    <euc:EformRadioButton Value="Retroperitoneal/Pelvic Tumor Resect, Simple"  runat="server"  Id="ProcName45" Text="Retroperitoneal/Pelvic Tumor Resect,<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Simple" onclick="setProcSite('Pelvis'); updateOtherTxt('Retroperitoneal/Pelvic Tumor Resect, Simple');" /><br/>
                                    <euc:EformRadioButton Value="Retroperitoneal/Pelvic Tumor Resect, Extensive"  runat="server"  Id="ProcName46" Text="Retroperitoneal/Pelvic Tumor Resect,<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Extensive" onclick="setProcSite('Pelvis'); updateOtherTxt('Retroperitoneal/Pelvic Tumor Resect, Extensive');" /><br/>
                                    <euc:EformRadioButton Value="Sacrectomy, Ant Partial"  runat="server"  Id="ProcName47" Text="Sacrectomy, Ant Partial" onclick="setProcSite('Pelvis'); updateOtherTxt('Sacrectomy, Ant Partial');" /><br/>
                                    <euc:EformRadioButton Value="Inguinal Node Dissection"  runat="server"  Id="ProcName38" Text="Inguinal Node Dissection" onclick="setProcSite('Pelvis'); updateOtherTxt('Inguinal Node Dissection');" />

                        <%-- 			<br/>
                                    <euc:EformRadioButton Value="LAR w/ CAA, w/pouch, w/ Enterostomy & PSWD"  runat="server"  Id="ProcName34" Text="LAR w/ CAA, w/pouch, w/ Enterostomy &<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PSWD" /><br/>
                                    <euc:EformRadioButton Value="Rectal Tumor Fulguration"  runat="server"  Id="ProcName35" Text="Rectal Tumor Fulguration" /><br/>
                                    <euc:EformRadioButton Value="Presacral Mobilization of Rectum"  runat="server"  Id="ProcName36" Text="Presacral Mobilization of Rectum" /><br/>
                        --%>

                        						
		                        </td>
		                        <td valign="top">				
                        						
			                        <strong style="margin-left:13px; color: #000000;">Abdomen</strong><br/>
			                        <euc:EformRadioButton Value="Abdominal Wall Exc, Partial Thick"  runat="server"  Id="ProcName48" Text="Abdominal Wall Exc, Partial Thick" onclick="setProcSite('Abdomen'); updateOtherTxt('Abdominal Wall Exc, Partial Thick');" /><br/>
			                        <euc:EformRadioButton Value="Abdominal Wall Exc, Full Thick"  runat="server"  Id="ProcName49" Text="Abdominal Wall Exc, Full Thick" onclick="setProcSite('Abdomen'); updateOtherTxt('Abdominal Wall Exc, Full Thick');" /><br/>
			                        <euc:EformRadioButton Value="Gastrostomy, Temporary"  runat="server"  Id="ProcName50" Text="Gastrostomy, Temporary" onclick="setProcSite('Abdomen'); updateOtherTxt('Gastrostomy, Temporary');" /><br/>
			                        <euc:EformRadioButton Value="Lysis Adhesions"  runat="server"  Id="ProcName51" Text="Lysis Adhesions" onclick="setProcSite('Abdomen'); updateOtherTxt('Lysis Adhesions');" /><br/>
			                        <euc:EformRadioButton Value="Small Bowel Resection"  runat="server"  Id="ProcName52" Text="Small Bowel Resection" onclick="setProcSite('Abdomen'); updateOtherTxt('Small Bowel Resection');" /><br/>
			                        <euc:EformRadioButton Value="Omentectomy-Secondary"  runat="server"  Id="ProcName54" Text="Omentectomy-Secondary" onclick="setProcSite('Abdomen'); updateOtherTxt('Omentectomy-Secondary');" /><br/>
			                        <euc:EformRadioButton Value="Omental Pedicle Graft"  runat="server"  Id="ProcName53" Text="Omental Pedicle Graft" onclick="setProcSite('Abdomen'); updateOtherTxt('Omental Pedicle Graft');" /><br/>
			                        <euc:EformRadioButton Value="Incisional Hernia Repair"  runat="server"  Id="ProcName55" Text="Incisional Hernia Repair" onclick="setProcSite('Abdomen'); updateOtherTxt('Incisional Hernia Repair');" /><br/>
			                        <euc:EformRadioButton Value="Incisional Hernia Repair w/ Mesh"  runat="server"  Id="ProcName56" Text="Incisional Hernia Repair w/ Mesh" onclick="setProcSite('Abdomen'); updateOtherTxt('Incisional Hernia Repair w/ Mesh');" /><br/>
			                        <euc:EformRadioButton Value="Appendectomy"  runat="server"  Id="ProcName57" Text="Appendectomy" onclick="setProcSite('Abdomen'); updateOtherTxt('Appendectomy');" /><br/>
			                        <euc:EformRadioButton Value="Splenectomy"  runat="server"  Id="ProcName58" Text="Splenectomy" onclick="setProcSite('Abdomen'); updateOtherTxt('Splenectomy');" /><br/>
			                        <euc:EformRadioButton Value="Laparotomy, Exploratory"  runat="server"  Id="ProcName59" Text="Laparotomy, Exploratory" onclick="setProcSite('Abdomen'); updateOtherTxt('Laparotomy, Exploratory');" /><br/>
                                    <euc:EformRadioButton Value="Intraperitoneal Cath Insertion"  runat="server"  Id="ProcName33" Text="Intraperitoneal Cath Insertion" onclick="setProcSite('Abdomen'); updateOtherTxt('Intraperitoneal Cath Insertion');" /><br />
                                    <euc:EformRadioButton Value="Debulking"  runat="server"  Id="ProcName84" Text="Debulking" onclick="setProcSite('Abdomen'); updateOtherTxt('Debulking');" />
                                    
                        			

                        			
		                        </td></tr>
		                        <tr><td  valign="top">
                        		
			                        <strong style="margin-left:13px; color: #000000;">Hepatic</strong><br/>                        	   
			                        <euc:EformRadioButton Value="Hep Art Cath Pump"  runat="server"  Id="ProcName69" Text="Hep Art Cath Pump" onclick="setProcSite('Hepatic'); updateOtherTxt('Hep Art Cath Pump');" /><br/>
			                        <euc:EformRadioButton Value="Liver Biopsy"  runat="server"  Id="ProcName70" Text="Liver Biopsy" onclick="setProcSite('Hepatic'); updateOtherTxt('Liver Biopsy');" /><br/>			
			                        <euc:EformRadioButton Value="Hepatectomy, Wedge (Simple)"  runat="server"  Id="ProcName71" Text="Hepatectomy, Wedge (Simple)" onclick="setProcSite('Hepatic'); updateOtherTxt('Hepatectomy, Wedge (Simple)');" /><br/>
			                        <euc:EformRadioButton Value="Cholecystectomy"  runat="server"  Id="ProcName72" Text="Cholecystectomy" onclick="setProcSite('Hepatic'); updateOtherTxt('Cholecystectomy');" /><br/>
			                        <euc:EformRadioButton Value="Ultrasound, Intraoperative"  runat="server"  Id="ProcName73" Text="Ultrasound, Intraoperative" onclick="setProcSite('Hepatic'); updateOtherTxt('Ultrasound, Intraoperative');" /><br/>
                        		
                        						
                        			
                               </td>
	                           <td valign="top">
                        			
			                        <strong style="margin-left:13px; color: #000000;">Anorectal</strong><br/>
                        	 
			                        <euc:EformRadioButton Value="Anorectal Biopsy"  runat="server"  Id="ProcName61" Text="Anorectal Biopsy" onclick="setProcSite('Anorectal'); updateOtherTxt('Anorectal Biopsy');" /><br/>
			                        <euc:EformRadioButton Value="Anal Fistulotomy (Complex)"  runat="server"  Id="ProcName62" Text="Anal Fistulotomy (Complex)" onclick="setProcSite('Anorectal'); updateOtherTxt('Anal Fistulotomy (Complex)');" /><br/>
			                        <euc:EformRadioButton Value="Closure Anal Fistula w/ Rectal Advancement Flap"  runat="server"  Id="ProcName63" Text="Closure Anal Fistula w/ Rectal<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Advancement Flap" onclick="setProcSite('Anorectal'); updateOtherTxt('Closure Anal Fistula w/ Rectal Advancement Flap');" /><br/>
			                        <euc:EformRadioButton Value="Repair Anal Fistula with Fibrin Glue"  runat="server"  Id="ProcName64" Text="Repair Anal fistula with Fibrin Glue" onclick="setProcSite('Anorectal'); updateOtherTxt('Repair Anal Fistula with Fibrin Glue');" /><br/>
			                        <euc:EformRadioButton Value="Condyloma Excision Intra Anal"  runat="server"  Id="ProcName65" Text="Condyloma Excision Intra Anal" onclick="setProcSite('Anorectal'); updateOtherTxt('Condyloma Excision Intra Anal');" /><br/>
                        <%--			<euc:EformRadioButton Value="Intraperitoneal Cath Insertion"  runat="server"  Id="ProcName66" Text="Intraperitoneal Cath insertion" onclick="setProcSite('Anorectal');" /><br/>--%>
			                        <euc:EformRadioButton Value="Exam Under Anesthesia"  runat="server"  Id="ProcName67" Text="Exam Under Anesthesia" onclick="setProcSite('Anorectal'); updateOtherTxt('Exam Under Anesthesia');" /><br/>
			                        <euc:EformRadioButton Value="Hemorrhoidectomy"  runat="server"  Id="ProcName68" Text="Hemorrhoidectomy" onclick="setProcSite('Anorectal'); updateOtherTxt('Hemorrhoidectomy');" /><br/>
    	                           <euc:EformRadioButton Value="Excision of Anal Margin Lesion"  runat="server"  Id="ProcName60" Text="Excision of Anal Margin Lesion" onclick="setProcSite('Anorectal'); updateOtherTxt('Excision of Anal Margin Lesion');" /><br/>
                        	   
                        	   
        		                        </euc:EformRadioButtonGroup>
	                        </td>

                          </tr>
                        </table>
                    </td>
                </tr>
            </table>


            <table id="procOtherTbl" style=" display:none;" >
                <tr id="PrimaryProcedureListRow2" runat="server">
                    <td><strong>Procedure</strong></td>
                    <td style="padding-right:30px;"><euc:EformComboBox LookupCode="ProcName" ID="procOther" Table="Procedures" Field="ProcName" RecordId="1" runat="server" Width="200px" /></td>
                    <td><strong>Site</strong></td>
                    <td><euc:EformDropDownList LookupCode="DxTarget" ID="siteOther" Table="Procedures" Field="ProcSite" RecordId="1" runat="server" /></td>
                </tr>
            </table>
        </td>
    </tr>
</table><br/><br/>



<script type="text/javascript" language="javascript">
    var PrimaryProceduresListTable = $('<%= PrimaryProceduresListTable.ClientID %>');
    var ProcApproach = $('<%= ProcApproach.ClientID %>');
    var PrimaryProcedureListRow1 = $('<%= PrimaryProcedureListRow1.ClientID %>');   //Primary proc radibuttonlist
    var PrimaryProcedureListRow2 = $('<%= PrimaryProcedureListRow2.ClientID %>');   //Other Proc list
</script>