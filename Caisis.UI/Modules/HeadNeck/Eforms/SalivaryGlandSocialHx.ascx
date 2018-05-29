<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.SalivaryGlandSocialHx" CodeFile="SalivaryGlandSocialHx.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SalivaryGlandSocialHx" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Social History"></asp:Label><br/>

<br />

<table>

   <tr id="NoSocialHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> No social history has been recorded for this patient.</td>
  </tr>  
  <tr id="SocialHxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable"  > 
		<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> The social history recorded for this patient has been populated below.</td>            
  </tr>  


   <tr><td><br /></td></tr>

    <tr>
        <td>
        
            <table id="SocialHistoryTable"  width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" > 
            
           <%-- ********************** Row One ********************** --%>
<%--                  <tr > 
                    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Occupation</td>
                    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Marital Status</td>
                    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Children</td>
                     <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>                   
                  </tr>
                              
               <asp:Repeater ID="rowHasHx1" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                <ItemTemplate>
	                <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('SocialHistories',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxCarcinogen', 'SocialHistories');"> 
		                <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxOccupation")%></td>
	                   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxMaritalStatus")%></td>
	                   <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxChildren")%></td>
	                   <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
	                </tr>    
	                </ItemTemplate>
	           </asp:Repeater>
	                
                  <tr ID="rowNoHx1" runat="server"> 
                    <td height="28" ><euc:EformTextBox style="width:100px;" TABLE="SocialHistories" FIELD="SocHxOccupation"    ID="SocHxOccupation"    RecordID="1"  Runat="server"  TabIndex="1" /></td>
                    <td height="28" ><euc:EformComboBox  style="width:100px;" TABLE="SocialHistories" FIELD="SocHxMaritalStatus" ID="SocHxMaritalStatus" RecordID="1"   Runat="server" TabIndex="2" LookupCode="SocHxMaritalStatus" /></td>
                    <td height="28" ><euc:EformTextBox style="width:80px;"  TABLE="SocialHistories" FIELD="SocHxChildren"      ID="SocHxChildren"      RecordID="1"  Runat="server"  TabIndex="3" /></td>
                  </tr>--%>

                   <%--DO NO DELETE FOLLOWING <TR> -- B/C runat="server" IS USED FOR PREVIOUS <TR>, NEEDED FOR CONTROL TO SHOW UP IN EFORM TRANSFORM 2/22/2010--%>
                   <tr style="display: none;"><td><euc:EformHidden TABLE="SocialHistories" FIELD="SocHxDataSource" ID="EformTextBox1" RecordID="1" Runat="server"/></td>
                  </tr>
                 
                  
            <%-- ********************** Row Two ********************** --%>                 
                  <tr> 
                    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Tobacco Type</td>
                    <td width="40%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;" >&nbsp;Tobacco Usage</td>
                    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Year Quit</td>
                     <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>                                     
                  </tr>
                  
                  <asp:Repeater ID="rowHasHx2" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                    <ItemTemplate>
	                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('SocialHistories',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxCarcinogen', 'SocialHistories');"> 
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoType")%></td>
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoPacksPerDay")%>&nbsp;packs/day for&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoYears")%>&nbsp;years</td>
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxTobaccoQuitYear")%></td>
	                       <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="Img1" runat="server" title="This record has been locked."/>&nbsp;</td>
	                    </tr>  
                		
                    </ItemTemplate>
                  </asp:Repeater>
                  <tr ID="rowNoHx2" runat="server"> 
                    <td height="28" ><euc:EformComboBox style="width:100px;" TABLE="SocialHistories" FIELD="SocHxTobaccoType"        ID="SocHxTobaccoType"        RecordID="1"  Runat="server" TabIndex="4" LookupCode="SocHxTobaccoType" /></td>
                    <td height="28" >
                                     <euc:EformTextBox style="width:30px;" TABLE="SocialHistories" FIELD="SocHxTobaccoPacksPerDay" ID="SocHxTobaccoPacksPerDay" RecordID="1"  Runat="server"  TabIndex="5" />
                                     packs/day for 
                                     <euc:EformTextBox style="width:30px;" TABLE="SocialHistories" FIELD="SocHxTobaccoYears"       ID="SocHxTobaccoYears"       RecordID="1"  Runat="server"  TabIndex="6" />
                                     years
                    </td>
                    <td height="28" ><euc:EformTextBox style="width:80px;"  TABLE="SocialHistories" FIELD="SocHxTobaccoQuitYear"   ID="SocHxTobaccoQuitYear"    RecordID="1"  Runat="server"  TabIndex="7" /></td>    
                  </tr>


           <%-- ********************** Row Three ********************** --%>
                  <tr> 
                    <td width="30%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Alcohol Use</td>
                    <td width="20%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left; white-space:nowrap;" >&nbsp;Carcinogen Exposure</td>
                    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                      <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>                                     
                  </tr>
                   <asp:Repeater ID="rowHasHx3" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
                    <ItemTemplate>
	                    <tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('SocialHistories',  <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'SocHxOccupation,SocHxMaritalStatus,SocHxChildren,SocHxTobaccoType,SocHxTobaccoPacksPerDay,SocHxTobaccoYears,SocHxTobaccoQuitYear,SocHxAlcohol,SocHxCarcinogen', 'SocialHistories');"> 
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxAlcohol")%></td>
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "SocHxCarcinogen")%></td>
	                       <td class="ClinicalEformPopulatedColumn">&nbsp;</td>
	                       <td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="Img2" runat="server" title="This record has been locked."/>&nbsp;</td>
	                    </tr>  
                    </ItemTemplate>
                  </asp:Repeater>
                  <tr ID="rowNoHx3" runat="server"> 
                    <td height="28" ><euc:EformComboBox style="width:100px;" TABLE="SocialHistories" FIELD="SocHxAlcohol"    ID="SocHxAlcohol"    RecordID="1"  Runat="server" TabIndex="8" LookupCode="AlcoholUsage"  /></td>
                    <td height="28" ><euc:EformTextBox style="width:100px;"  TABLE="SocialHistories" FIELD="SocHxCarcinogen" ID="SocHxCarcinogen" RecordID="1"  Runat="server" TabIndex="9" /></td>    
                  </tr>
    
              </table>

        </td>
    </tr>
  
</table>

<br/><br/><br/>
