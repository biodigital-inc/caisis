<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxPathology" CodeFile="OropharynxPathology.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
 <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

<a name="OropharynxPathology" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Surgical Pathology"></asp:Label><br/>
<table  width="700" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="OropharynxPathologyHtmlTable" > 

           <tr>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Date</td>
			    <td class="controlBoxDataGridTitleColumn" style="text-align: left;"  >&nbsp;Accession Number</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;" >&nbsp;Side</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Subsite</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Result</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;Primary Histology</td>
          </tr>
          <tr>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="100px" RecordId="20" ParentRecordId="20"  TABLE="Pathology" FIELD="PathDateText" ID="PathDateText" Runat="server" ShowCalendar="true" CalcDate="true" EnableHiddenOnUIEvent="PathSite"  />
				<euc:EformHidden                RecordId="20"  ParentRecordId="20"  TABLE="Pathology" FIELD="PathDate"     ID="PathDate"     Runat="server"/></td>
            <td style="white-space: nowrap;">
                <euc:EformTextBox  Width="100px" RecordId="20" ParentRecordId="20"   TABLE="Pathology" FIELD="PathNum" ID="PathNum" Runat="server" ShowCalendar="false" CalcDate="false"  EnableHiddenOnUIEvent="PathSite"/></td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="100px" RecordId="20" ParentRecordId="20"  TABLE="Pathology" FIELD="PathSide" ID="PathSide"   LookupCode="OpSide"   Runat="server" EnableHiddenOnUIEvent="PathSite"/>            
                <euc:EformHidden                 RecordId="20" ParentRecordId="20"  TABLE="Pathology" FIELD="PathSite" ID="PathSite" Value="Oropharynx" Runat="server" TabIndex="3"  /> </td>
            <td style="white-space: nowrap;">
                <euc:EformComboBox Width="100px" RecordId="20" ParentRecordId="20"  TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite"   LookupCode="BxSubSite,Disease,HeadNeck"   Runat="server" EnableHiddenOnUIEvent="PathSite"/> </td>
            <td style="white-space: nowrap;">
                <euc:EformDropDownList Width="120px" RecordId="20" ParentRecordId="20"  TABLE="Pathology" FIELD="PathResult" ID="PathResult"    Runat="server" ShowEmptyListItem="true"  EnableHiddenOnUIEvent="PathSite">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Negative" Text="Negative"></asp:ListItem>
                    <asp:ListItem Value="Positive" Text="Positive"></asp:ListItem>
                </euc:EformDropDownList> </td>
            <td valign="top" style="white-space: nowrap;">
                <euc:EformComboBox Width="100px" RecordId="20" ParentRecordId="20"  TABLE="Pathology" FIELD="PathHistology" ID="PathHistology"   LookupCode="PathHistology,Disease,HeadNeck"   Runat="server" TabIndex="3" DropDownWidth="600px"  EnableHiddenOnUIEvent="PathSite" /> </td>

          </tr>  
          
          <tr style="display: none;">    
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;</td>           
                <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 20px;">Max Dimension (cm)</td>
                <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 10px;">Thickness (cm)</td> 
                <td class="controlBoxDataGridTitleColumn" style="text-align: left; width: 120px;">Invasion</td>
          </tr>
          <tr style="display: none;">
            <td></td>
            <td></td>

            <td valign="top" height="28" class="controlBoxDataGridValueColumn" colspan="3" >
                <table id="invasion_1" >
                    <tr>
                        <td valign="top">
                           <euc:EformTextBox   Width="100px" RecordId="1" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_1"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

                        <td valign="top">
                            <euc:EformTextBox Width="100px" RecordId="1" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindWidth"  ID="PathFindWidth_1" Runat="server" TabIndex="2"   />  </td>

                       <td style="text-align: left; white-space: nowrap;">
                            <euc:EformHidden  RecordId="1"  ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSide"     ID="PathFindSide_1"      Runat="server" TabIndex="1"    />
                            <euc:EformHidden  RecordId="1" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSubsite"   ID="PathFindSubsite_1"   Runat="server" TabIndex="3"  />           
                            <euc:EformHidden  RecordId="1" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_1" Runat="server" TabIndex="4"  />
                            <euc:EformHidden  RecordId="1" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindResult"    ID="PathFindResult_1"    Value="Invasion"   Runat="server" TabIndex="4"  />
                            <euc:EformComboBox Width="150px" RecordId="1" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="PathFindSite_1" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="PathFindResult_1,PathFindHistology_1,PathFindSubsite_1,PathFindSide_1"    />  </td>
                    </tr>
                       <tr id="invasion_1b" style="DISPLAY: none">
                       <td valign="top">
                           <euc:EformTextBox   Width="100px" RecordId="2" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_2"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

                        <td valign="top">
                            <euc:EformTextBox Width="100px" RecordId="2" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindWidth"  ID="PathFindWidth_2" Runat="server" TabIndex="2"   />  </td>

                        <td style="text-align: left; white-space: nowrap;">
                            <euc:EformHidden  RecordId="2"  ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSide"     ID="PathFindSide_2"      Runat="server" TabIndex="1"    />
                            <euc:EformHidden  RecordId="2" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSubsite"   ID="PathFindSubsite_2"   Runat="server" TabIndex="3"  />           
                            <euc:EformHidden  RecordId="2" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_2" Runat="server" TabIndex="4"  />
                            <euc:EformHidden  RecordId="2" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindResult"    ID="PathFindResult_2"    Value="Invasion"   Runat="server" TabIndex="4"  />
                            <euc:EformComboBox Width="150px" RecordId="2" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="PathFindSite_2" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="PathFindResult_2,PathFindHistology_2,PathFindSubsite_2,PathFindSide_2"    />  </td>
                      </tr>
                      <tr id="invasio_1c" style="DISPLAY: none">
                       <td valign="top">
                           <euc:EformTextBox   Width="100px" RecordId="3" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_3"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

                        <td valign="top">
                            <euc:EformTextBox Width="100px" RecordId="3" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindWidth"  ID="PathFindWidth_3" Runat="server" TabIndex="2"   />  </td>
                        <td style="text-align: left; white-space: nowrap;">
                            <euc:EformHidden  RecordId="3"  ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSide"     ID="PathFindSide_3"      Runat="server" TabIndex="1"    />
                            <euc:EformHidden  RecordId="3" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSubsite"   ID="PathFindSubsite_3"   Runat="server" TabIndex="3"  />           
                            <euc:EformHidden  RecordId="3" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_3" Runat="server" TabIndex="4"  />
                            <euc:EformHidden  RecordId="3" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindResult"    ID="PathFindResult_3"    Value="Invasion"   Runat="server" TabIndex="4"  />
                            <euc:EformComboBox Width="150px" RecordId="3" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="PathFindSite_3" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="PathFindResult_3,PathFindHistology_3,PathFindSubsite_3,PathFindSide_3"    />  </td>
                      </tr>
                     <tr id="invasio_1d" style="DISPLAY: none">
                       <td valign="top">
                           <euc:EformTextBox   Width="100px" RecordId="4" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_4"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

                        <td valign="top">
                            <euc:EformTextBox Width="100px" RecordId="4" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindWidth"  ID="PathFindWidth_4" Runat="server" TabIndex="2"   />  </td>
                        <td style="text-align: left; white-space: nowrap;">
                            <euc:EformHidden  RecordId="4"  ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSide"     ID="PathFindSide_4"      Runat="server" TabIndex="1"    />
                            <euc:EformHidden  RecordId="4" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSubsite"   ID="PathFindSubsite_4"   Runat="server" TabIndex="3"  />           
                            <euc:EformHidden  RecordId="4" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_4" Runat="server" TabIndex="4"  />
                            <euc:EformHidden  RecordId="4" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindResult"    ID="PathFindResult_4"    Value="Invasion"   Runat="server" TabIndex="4"  />
                            <euc:EformComboBox Width="150px" RecordId="4" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="PathFindSite_4" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="PathFindResult_4,PathFindHistology_4,PathFindSubsite_4,PathFindSide_4"    />  </td>
                      </tr>
                      <tr id="invasio_1e" style="DISPLAY: none">
                       <td valign="top">
                           <euc:EformTextBox   Width="100px" RecordId="5" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_5"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

                        <td valign="top">
                            <euc:EformTextBox Width="100px" RecordId="5" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindWidth"  ID="PathFindWidth_5" Runat="server" TabIndex="2"   />  </td>
                        <td style="text-align: left; white-space: nowrap;">
                            <euc:EformHidden  RecordId="5"  ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSide"     ID="PathFindSide_5"      Runat="server" TabIndex="1"    />
                            <euc:EformHidden  RecordId="5" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSubsite"   ID="PathFindSubsite_5"   Runat="server" TabIndex="3"  />           
                            <euc:EformHidden  RecordId="5" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_5" Runat="server" TabIndex="4"  />
                            <euc:EformHidden  RecordId="5" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindResult"    ID="PathFindResult_5"    Value="Invasion"   Runat="server" TabIndex="4"  />
                            <euc:EformComboBox Width="150px" RecordId="5" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="PathFindSite_5" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="PathFindResult_5,PathFindHistology_5,PathFindSubsite_5,PathFindSide_5"    />  </td>
                      </tr>
                     <tr id="invasio_1f" style="DISPLAY: none">
                       <td valign="top">
                           <euc:EformTextBox   Width="100px" RecordId="6" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_6"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

                        <td valign="top">
                            <euc:EformTextBox Width="100px" RecordId="6" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindWidth"  ID="PathFindWidth_6" Runat="server" TabIndex="2"   />  </td>
                        <td style="text-align: left; white-space: nowrap;">
                            <euc:EformHidden  RecordId="6"  ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSide"     ID="PathFindSide_6"      Runat="server" TabIndex="1"    />
                            <euc:EformHidden  RecordId="6" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSubsite"   ID="PathFindSubsite_6"   Runat="server" TabIndex="3"  />           
                            <euc:EformHidden  RecordId="6" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_6" Runat="server" TabIndex="4"  />
                            <euc:EformHidden  RecordId="6" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindResult"    ID="PathFindResult_6"    Value="Invasion"   Runat="server" TabIndex="4"  />
                            <euc:EformComboBox Width="150px" RecordId="6" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="PathFindSite_6" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="PathFindResult_6,PathFindHistology_6,PathFindSubsite_6,PathFindSide_6"    />  </td>
                      </tr>
                     <tr id="invasio_1g" style="DISPLAY: none">
                       <td valign="top">
                           <euc:EformTextBox   Width="100px" RecordId="7" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_7"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

                        <td valign="top">
                            <euc:EformTextBox Width="100px" RecordId="7" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindWidth"  ID="PathFindWidth_7" Runat="server" TabIndex="2"   />  </td>
                        <td style="text-align: left; white-space: nowrap;">
                            <euc:EformHidden  RecordId="7"  ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSide"     ID="PathFindSide_7"      Runat="server" TabIndex="1"    />
                            <euc:EformHidden  RecordId="7" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSubsite"   ID="PathFindSubsite_7"   Runat="server" TabIndex="3"  />           
                            <euc:EformHidden  RecordId="7" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_7" Runat="server" TabIndex="4"  />
                            <euc:EformHidden  RecordId="7" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindResult"    ID="PathFindResult_7"    Value="Invasion"   Runat="server" TabIndex="4"  />
                            <euc:EformComboBox Width="150px" RecordId="7" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="PathFindSite_7" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="PathFindResult_7,PathFindHistology_7,PathFindSubsite_7,PathFindSide_7"    />  </td>
                      </tr>
                     <tr id="invasio_1h" style="DISPLAY: none">
                       <td valign="top">
                           <euc:EformTextBox   Width="100px" RecordId="8" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_8"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

                        <td valign="top">
                            <euc:EformTextBox Width="100px" RecordId="8" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindWidth"  ID="PathFindWidth_8" Runat="server" TabIndex="2"   />  </td>
                        <td style="text-align: left; white-space: nowrap;">
                            <euc:EformHidden  RecordId="8"  ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSide"     ID="PathFindSide_8"      Runat="server" TabIndex="1"    />
                            <euc:EformHidden  RecordId="8" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSubsite"   ID="PathFindSubsite_8"   Runat="server" TabIndex="3"  />           
                            <euc:EformHidden  RecordId="8" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_8" Runat="server" TabIndex="4"  />
                            <euc:EformHidden  RecordId="8" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindResult"    ID="PathFindResult_8"    Value="Invasion"   Runat="server" TabIndex="4"  />
                            <euc:EformComboBox Width="150px" RecordId="8" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="PathFindSite_8" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="PathFindResult_8,PathFindHistology_8,PathFindSubsite_8,PathFindSide_8"    />  </td>
                      </tr>
                     <tr id="invasio_1i" style="DISPLAY: none">
                       <td valign="top">
                           <euc:EformTextBox   Width="100px" RecordId="9" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_9"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

                        <td valign="top">
                            <euc:EformTextBox Width="100px" RecordId="9" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindWidth"  ID="PathFindWidth_9" Runat="server" TabIndex="2"   />  </td>
                        <td style="text-align: left; white-space: nowrap;">
                            <euc:EformHidden  RecordId="9"  ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSide"     ID="PathFindSide_9"      Runat="server" TabIndex="1"    />
                            <euc:EformHidden  RecordId="9" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSubsite"   ID="PathFindSubsite_9"   Runat="server" TabIndex="3"  />           
                            <euc:EformHidden  RecordId="9" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_9" Runat="server" TabIndex="4"  />
                            <euc:EformHidden  RecordId="9" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindResult"    ID="PathFindResult_9"    Value="Invasion"   Runat="server" TabIndex="4"  />
                            <euc:EformComboBox Width="150px" RecordId="9" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="PathFindSite_9" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="PathFindResult_9,PathFindHistology_9,PathFindSubsite_9,PathFindSide_9"    />  </td>
                      </tr>
                     <tr id="invasio_1j" style="DISPLAY: none">
                       <td valign="top">
                           <euc:EformTextBox   Width="100px" RecordId="10" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHeight"    ID="PathFindHeight_10"    Runat="server" TabIndex="5" ShowCalendar="false" CalcDate="false"   /></td>

                        <td valign="top">
                            <euc:EformTextBox Width="100px" RecordId="10" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindWidth"  ID="PathFindWidth_10" Runat="server" TabIndex="2"   />  </td>
                        <td style="text-align: left; white-space: nowrap;">
                            <euc:EformHidden  RecordId="10"  ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSide"     ID="PathFindSide_10"      Runat="server" TabIndex="1"    />
                            <euc:EformHidden  RecordId="10" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSubsite"   ID="PathFindSubsite_10"   Runat="server" TabIndex="3"  />           
                            <euc:EformHidden  RecordId="10" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindHistology" ID="PathFindHistology_10" Runat="server" TabIndex="4"  />
                            <euc:EformHidden  RecordId="10" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindResult"    ID="PathFindResult_10"    Value="Invasion"   Runat="server" TabIndex="4"  />
                            <euc:EformComboBox Width="150px" RecordId="10" ParentRecordId="20" TABLE="PathologyFinding" FIELD="PathFindSite"  ID="PathFindSite_10" LookupCode="DxTarget,Disease,HeadNeck" Runat="server" TabIndex="2" EnableHiddenOnUIEvent="PathFindResult_10,PathFindHistology_10,PathFindSubsite_10,PathFindSide_10"    />  </td>
                      </tr>
                     <tr >
                        <td height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'invasion_1');" /></td>
                      </tr>
                </table>
            </td>

          </tr>
         
       
</table>
<br /><br />

<strong>Head and Neck Pathology</strong>
<table  width="550" border="0" cellpadding="6" cellspacing="0" class="eformLargePopulatedTable" id="OropharynxPathologyHtmlTable2" > 

    <tr>
        <td align="left"><strong>Tumor Invasion </strong><br /> 
            <euc:EformComboBox style="width: 100px;" TABLE="HeadNeckPath" FIELD="PathTumorInv" ID="PathTumorInv" LookupCode="DxTarget,Disease,HeadNeck" Runat="server"  TabIndex="2" EnableHiddenOnUIEvent="PathNotes"/></td>
        
        <td align="left"><strong>Invasion Depth  </strong><br /> 
            <euc:EformTextBox style="width: 100px;" TABLE="HeadNeckPath" FIELD="PathInvasionDepth" ID="PathInvasionDepth" Runat="server"  TabIndex="2" EnableHiddenOnUIEvent="PathNotes"/></td>

          <td align="left"><strong>Morphology</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="20"  TABLE="HeadNeckPath" FIELD="PathMorphology" ID="PathMorphology" LookupCode="Morphology,Disease,HeadNeck" Runat="server"  TabIndex="2"  /></td>
       
         <td align="left"><strong>Tumor Max Dim (cm) </strong><br /> 
            <euc:EformTextBox style="width: 100px;" RecordId="1" ParentRecordId="20"  TABLE="HeadNeckPath" FIELD="PathTumorMaxDim" ID="PathTumorMaxDim" Runat="server"  TabIndex="2"  /></td>
    </tr>
    
        <tr>
        <td align="left"><strong>Lymphovascular</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="20"  TABLE="HeadNeckPath" FIELD="PathVascularInv" ID="PathVascularInv" LookupCode="YesNoUnknown" Runat="server"  TabIndex="2"/></td>

        <td align="left"><strong>Neural Invasion</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="20"  TABLE="HeadNeckPath" FIELD="PathPerineuralInv" ID="PathPerineuralInv" LookupCode="YesNoUnknown" Runat="server"  TabIndex="2"  /></td>

        <td align="left"><strong>Margin</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="20"  TABLE="HeadNeckPath" FIELD="PathMargin" ID="PathMargin" LookupCode="MarginStatus,Disease,HeadNeck" Runat="server"  TabIndex="2"  /></td>

        <td align="left"><strong>Margin Site</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="20"  TABLE="HeadNeckPath" FIELD="PathMarginSite" ID="PathMarginSite" LookupCode="PathMarginSite,Disease,HeadNeck" Runat="server"  TabIndex="2"/></td>
    </tr>
    <tr>
        <td align="left"><strong>Invasion Pattern </strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="20"  TABLE="HeadNeckPath" FIELD="PathInvasionPattern" ID="PathInvasionPattern" LookupCode="PathInvasionPattern,Disease,HeadNeck" Runat="server"  TabIndex="2"/></td>

        <td align="left"><strong>Multi Centricity </strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="20"  TABLE="HeadNeckPath" FIELD="PathMultiCentricity" ID="PathMultiCentricity" LookupCode="PathMultiCentricity" Runat="server"  TabIndex="2"  /></td>

         <td align="left"><strong>Necrosis </strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="20"  TABLE="HeadNeckPath" FIELD="PathNecrosis" ID="PathNecrosis" LookupCode="PathNecrosis,Disease,HeadNeck" Runat="server"  TabIndex="2"  /></td>

        <td align="left"><strong>Non Neoplastic Mucosa</strong><br /> 
            <euc:EformComboBox style="width: 100px;" RecordId="1" ParentRecordId="20"  TABLE="HeadNeckPath" FIELD="PathNonNeoplasticMucosa" ID="PathNonNeoplasticMucosa" LookupCode="PathNonNeoplasticMucosa,Disease,HeadNeck" Runat="server"  TabIndex="2"/></td>
    </tr>
</table>
<br /><br /><br />


<script type="text/javascript">
    /* <![CDATA[ */
   
    //Adds blur event to combo
    function addBlurToPathFindSite(pathResult,pathSide,pathSite,pathSubsite,pathHistology,pathFindSide,pathFindSite,pathFindSubsite,pathFindHistology)
    {  
        $(pathSide).addEvent('blur',curry(SetPathFindingFields,pathResult,pathSide,pathSite,pathSubsite,pathHistology,pathFindSide,pathFindSite,pathFindSubsite,pathFindHistology));
        $(pathSubsite).addEvent('blur',curry(SetPathFindingFields,pathResult,pathSide,pathSite,pathSubsite,pathHistology,pathFindSide,pathFindSite,pathFindSubsite,pathFindHistology));
        $(pathHistology).addEvent('blur',curry(SetPathFindingFields,pathResult,pathSide,pathSite,pathSubsite,pathHistology,pathFindSide,pathFindSite,pathFindSubsite,pathFindHistology));
        $(pathFindSite).addEvent('blur',curry(SetPathFindingFields,pathResult,pathSide,pathSite,pathSubsite,pathHistology,pathFindSide,pathFindSite,pathFindSubsite,pathFindHistology));
        $(pathFindSite).addEvent('blur',curry(SetPathFindingFields,pathResult,pathSide,pathSite,pathSubsite,pathHistology,pathFindSide,pathFindSite,pathFindSubsite,pathFindHistology));
    }

    addBlurToPathFindSite($('<%= PathResult.ClientID %>'),$('<%= PathSide.ClientID %>'),$('<%= PathSite.ClientID %>'),$('<%= PathSubsite.ClientID %>'),$('<%= PathHistology.ClientID %>'),$('<%= PathFindSide_1.ClientID %>'),$('<%= PathFindSite_1.ClientID %>'), $('<%= PathFindSubsite_1.ClientID  %>'),$('<%= PathFindHistology_1.ClientID  %>'));
    addBlurToPathFindSite($('<%= PathResult.ClientID %>'),$('<%= PathSide.ClientID %>'),$('<%= PathSite.ClientID %>'),$('<%= PathSubsite.ClientID %>'),$('<%= PathHistology.ClientID %>'),$('<%= PathFindSide_2.ClientID %>'),$('<%= PathFindSite_2.ClientID %>'), $('<%= PathFindSubsite_2.ClientID  %>'),$('<%= PathFindHistology_2.ClientID  %>'));
    addBlurToPathFindSite($('<%= PathResult.ClientID %>'),$('<%= PathSide.ClientID %>'),$('<%= PathSite.ClientID %>'),$('<%= PathSubsite.ClientID %>'),$('<%= PathHistology.ClientID %>'),$('<%= PathFindSide_3.ClientID %>'),$('<%= PathFindSite_3.ClientID %>'), $('<%= PathFindSubsite_3.ClientID  %>'),$('<%= PathFindHistology_3.ClientID  %>'));
    addBlurToPathFindSite($('<%= PathResult.ClientID %>'),$('<%= PathSide.ClientID %>'),$('<%= PathSite.ClientID %>'),$('<%= PathSubsite.ClientID %>'),$('<%= PathHistology.ClientID %>'),$('<%= PathFindSide_4.ClientID %>'),$('<%= PathFindSite_4.ClientID %>'), $('<%= PathFindSubsite_4.ClientID  %>'),$('<%= PathFindHistology_4.ClientID  %>'));
    addBlurToPathFindSite($('<%= PathResult.ClientID %>'),$('<%= PathSide.ClientID %>'),$('<%= PathSite.ClientID %>'),$('<%= PathSubsite.ClientID %>'),$('<%= PathHistology.ClientID %>'),$('<%= PathFindSide_5.ClientID %>'),$('<%= PathFindSite_5.ClientID %>'), $('<%= PathFindSubsite_5.ClientID  %>'),$('<%= PathFindHistology_5.ClientID  %>'));
    addBlurToPathFindSite($('<%= PathResult.ClientID %>'),$('<%= PathSide.ClientID %>'),$('<%= PathSite.ClientID %>'),$('<%= PathSubsite.ClientID %>'),$('<%= PathHistology.ClientID %>'),$('<%= PathFindSide_6.ClientID %>'),$('<%= PathFindSite_6.ClientID %>'), $('<%= PathFindSubsite_6.ClientID  %>'),$('<%= PathFindHistology_6.ClientID  %>'));
    addBlurToPathFindSite($('<%= PathResult.ClientID %>'),$('<%= PathSide.ClientID %>'),$('<%= PathSite.ClientID %>'),$('<%= PathSubsite.ClientID %>'),$('<%= PathHistology.ClientID %>'),$('<%= PathFindSide_7.ClientID %>'),$('<%= PathFindSite_7.ClientID %>'), $('<%= PathFindSubsite_7.ClientID  %>'),$('<%= PathFindHistology_7.ClientID  %>'));
    addBlurToPathFindSite($('<%= PathResult.ClientID %>'),$('<%= PathSide.ClientID %>'),$('<%= PathSite.ClientID %>'),$('<%= PathSubsite.ClientID %>'),$('<%= PathHistology.ClientID %>'),$('<%= PathFindSide_8.ClientID %>'),$('<%= PathFindSite_8.ClientID %>'), $('<%= PathFindSubsite_8.ClientID  %>'),$('<%= PathFindHistology_8.ClientID  %>'));
    addBlurToPathFindSite($('<%= PathResult.ClientID %>'),$('<%= PathSide.ClientID %>'),$('<%= PathSite.ClientID %>'),$('<%= PathSubsite.ClientID %>'),$('<%= PathHistology.ClientID %>'),$('<%= PathFindSide_9.ClientID %>'),$('<%= PathFindSite_9.ClientID %>'), $('<%= PathFindSubsite_9.ClientID  %>'),$('<%= PathFindHistology_9.ClientID  %>'));
    addBlurToPathFindSite($('<%= PathResult.ClientID %>'),$('<%= PathSide.ClientID %>'),$('<%= PathSite.ClientID %>'),$('<%= PathSubsite.ClientID %>'),$('<%= PathHistology.ClientID %>'),$('<%= PathFindSide_10.ClientID %>'),$('<%= PathFindSite_10.ClientID %>'), $('<%= PathFindSubsite_10.ClientID  %>'),$('<%= PathFindHistology_10.ClientID  %>'));
   
    /* ]]> */
    
    function SetPathFindingFields(pathResult,pathSide,pathSite,pathSubsite,pathHistology,pathFindSide,pathFindSite,pathFindSubsite,pathFindHistology)
	{
	    if (pathFindSite.value != '')
	    {
	        pathFindSide.value = pathSide.value;
	        pathFindSubsite.value = pathSubsite.value;
	        pathFindHistology.value = pathHistology.value;
	    }
	    else
	    {
	    	pathFindSide.value = '';
	        pathFindSubsite.value = '';
	        pathFindHistology.value = '';

	    }	    
	}
	
</script>