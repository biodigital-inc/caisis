<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.SalivaryGlandNodePathFindings" CodeFile="SalivaryGlandNodePathFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SalivaryGlandNodePathFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Cervical Nodes "></asp:Label><br/>
<br /><br />


<table>
    <tr>
        <td><strong> Left Neck</strong></td>
    </tr>
</table>
<table border="0" cellspacing="0" cellpadding="6" width="400" class="eformLargePopulatedTableBlue">
 	                <tr>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: center; white-space: nowrap;">Site</td>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: center; "># Positive Nodes</td>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: center; white-space: nowrap;"># Total Nodes</td>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: center; white-space: nowrap;">Max Dim (cm)</td>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: center; width: 50px;">ECS</td>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;</td>
	                </tr>
   		
		             <tr >
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="1" Field="PathFindSide" id="PathFindSide_L1" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="1" Field="PathFindSite" id="PathFindSite_L1" runat="server" Value=" Level 1"/>
                            Level 1</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="1" Field="PathFindPosNodes" id="PathFindPosNodes_L1" runat="server" EnableHiddenOnUIEvent="PathFindSide_L1,PathFindSite_L1"/></td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="1" Field="PathFindNumNodes" id="PathFindNumNodes_L1" runat="server" EnableHiddenOnUIEvent="PathFindSide_L1,PathFindSite_L1"/></td>
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="1" Field="PathFindMaxDim" id="PathFindMaxDim_L1" runat="server" EnableHiddenOnUIEvent="PathFindSide_L1,PathFindSite_L1"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="1"  FIELD="PathFindExtension" ID="PathFindExtension_L1" Runat="server" EnableHiddenOnUIEvent="PathFindSide_L1,PathFindSite_L1"  LookupCode="YesNoUnknown" /></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L1" runat="server" /></td>
            	
	                 </tr>
	                 <tr>
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="2" Field="PathFindSide" id="PathFindSide_L2" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="2" Field="PathFindSite" id="PathFindSite_L2" runat="server" Value="Level 2"/>
                            Level 2</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="2" Field="PathFindPosNodes" id="PathFindPosNodes_L2" runat="server" EnableHiddenOnUIEvent="PathFindSide_L2,PathFindSite_L2,PathFindExtension_L2"/></td>
		                <td>    
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="2" Field="PathFindNumNodes" id="PathFindNumNodes_L2" runat="server" EnableHiddenOnUIEvent="PathFindSide_L2,PathFindSite_L2,PathFindExtension_L2"/></td>
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="2" Field="PathFindMaxDim" id="PathFindMaxDim_L2" runat="server" EnableHiddenOnUIEvent="PathFindSide_L2,PathFindSite_L2"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="2"  FIELD="PathFindExtension" ID="PathFindExtension_L2" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_L2,PathFindSite_L2"  LookupCode="YesNoUnknown" /></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L2" runat="server" /></td>
	                 </tr>
	                 <tr>
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="3" Field="PathFindSide" id="PathFindSide_L3" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="3" Field="PathFindSite" id="PathFindSite_L3" runat="server" Value="Level 3"/>
                            Level 3</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="3" Field="PathFindPosNodes" id="PathFindPosNodes_L3" runat="server" EnableHiddenOnUIEvent="PathFindSide_L3,PathFindSite_L3,PathFindExtension_L3"/></td>

                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="3" Field="PathFindNumNodes" id="PathFindNumNodes_L3" runat="server" EnableHiddenOnUIEvent="PathFindSide_L3,PathFindSite_L3,PathFindExtension_L3"/></td>
            		        			        
   	                    <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="3" Field="PathFindMaxDim" id="PathFindMaxDim_L3" runat="server" EnableHiddenOnUIEvent="PathFindSide_L3,PathFindSite_L3"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="3"  FIELD="PathFindExtension" ID="PathFindExtension_L3" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_L3,PathFindSite_L3" LookupCode="YesNoUnknown" /></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L3" runat="server" /></td>
	                 </tr>
	                 <tr>
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="4" Field="PathFindSide" id="PathFindSide_L4" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="4" Field="PathFindSite" id="PathFindSite_L4" runat="server" Value="Level 4"/>
                            Level 4</td>		        
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="4" Field="PathFindPosNodes" id="PathFindPosNodes_L4" runat="server" EnableHiddenOnUIEvent="PathFindSide_L4,PathFindSite_L4,PathFindExtension_L4"/></td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="4" Field="PathFindNumNodes" id="PathFindNumNodes_L4" runat="server" EnableHiddenOnUIEvent="PathFindSide_L4,PathFindSite_L4,PathFindExtension_L4"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="4" Field="PathFindMaxDim" id="PathFindMaxDim_L4" runat="server" EnableHiddenOnUIEvent="PathFindSide_L4,PathFindSite_L4"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="4"  FIELD="PathFindExtension" ID="PathFindExtension_L4" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_L4,PathFindSite_L4"  LookupCode="YesNoUnknown" /></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L4" runat="server" /></td>
	                 </tr>
	                 <tr>
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="5" Field="PathFindSide" id="PathFindSide_L5" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="5" Field="PathFindSite" id="PathFindSite_L5" runat="server" Value="Level 5"/>
                            Level 5</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="5" Field="PathFindPosNodes" id="PathFindPosNodes_L5" runat="server" EnableHiddenOnUIEvent="PathFindSide_L5,PathFindSite_L5,PathFindExtension_L5"/></td>
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="5" Field="PathFindNumNodes" id="PathFindNumNodes_L5" runat="server" EnableHiddenOnUIEvent="PathFindSide_L5,PathFindSite_L5,PathFindExtension_L5"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="5" Field="PathFindMaxDim" id="PathFindMaxDim_L5" runat="server" EnableHiddenOnUIEvent="PathFindSide_L5,PathFindSite_L5"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="5"  FIELD="PathFindExtension" ID="PathFindExtension_L5" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_L5,PathFindSite_L5" LookupCode="YesNoUnknown" /></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L5" runat="server" /></td>
	                 </tr>
	                 <tr>
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="6" Field="PathFindSide" id="PathFindSide_L6" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="6" Field="PathFindSite" id="PathFindSite_L6" runat="server" Value="Level 6"/>
                            Level 6</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="6" Field="PathFindPosNodes" id="PathFindPosNodes_L6" runat="server" EnableHiddenOnUIEvent="PathFindSide_L6,PathFindSite_L6,PathFindExtension_L6"/></td>
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="6" Field="PathFindNumNodes" id="PathFindNumNodes_L6" runat="server" EnableHiddenOnUIEvent="PathFindSide_L6,PathFindSite_L6,PathFindExtension_L6"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="6" Field="PathFindMaxDim" id="PathFindMaxDim_L6" runat="server" EnableHiddenOnUIEvent="PathFindSide_L6,PathFindSite_L6"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="6"  FIELD="PathFindExtension" ID="PathFindExtension_L6" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_L6,PathFindSite_L6" LookupCode="YesNoUnknown" /></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L6" runat="server" /></td>
	                 </tr>
	                 <tr>
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="7" Field="PathFindSide" id="PathFindSide_L7" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="7" Field="PathFindSite" id="PathFindSite_L7" runat="server" Value="Level 7"/>
                            Level 7</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="7" Field="PathFindPosNodes" id="PathFindPosNodes_L7" runat="server" EnableHiddenOnUIEvent="PathFindSide_L7,PathFindSite_L7,PathFindExtension_L7"/></td>
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="7" Field="PathFindNumNodes" id="PathFindNumNodes_L7" runat="server" EnableHiddenOnUIEvent="PathFindSide_L7,PathFindSite_L7,PathFindExtension_L7"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="7" Field="PathFindMaxDim" id="PathFindMaxDim_L7" runat="server" EnableHiddenOnUIEvent="PathFindSide_L7,PathFindSite_L7"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="7"  FIELD="PathFindExtension" ID="PathFindExtension_L7" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_L7,PathFindSite_L7"  LookupCode="YesNoUnknown" /></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L7" runat="server" /></td>
                    </tr>
	                 <tr>
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="17" Field="PathFindSide" id="PathFindSide_L17" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="17" Field="PathFindSite" id="PathFindSite_L17" runat="server" Value="Level 1,2,3,4,5"/>
                            Level Unknown: Lateral</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="17" Field="PathFindPosNodes" id="PathFindPosNodes_L17" runat="server" EnableHiddenOnUIEvent="PathFindSide_L17,PathFindSite_L17,PathFindExtension_L17"/></td>
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="17" Field="PathFindNumNodes" id="PathFindNumNodes_L17" runat="server" EnableHiddenOnUIEvent="PathFindSide_L17,PathFindSite_L17,PathFindExtension_L17"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="17" Field="PathFindMaxDim" id="PathFindMaxDim_L17" runat="server" EnableHiddenOnUIEvent="PathFindSide_L17,PathFindSite_L17"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="17"  FIELD="PathFindExtension" ID="PathFindExtension_L17" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_L17,PathFindSite_L17"  LookupCode="YesNoUnknown" /></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L17" runat="server" /></td>
                    </tr>
	                 <tr>
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="18" Field="PathFindSide" id="PathFindSide_L18" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="18" Field="PathFindSite" id="PathFindSite_L18" runat="server" Value="Level 6,7"/>
                            Level Unknown: Central</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="18" Field="PathFindPosNodes" id="PathFindPosNodes_L18" runat="server" EnableHiddenOnUIEvent="PathFindSide_L18,PathFindSite_L18,PathFindExtension_L18"/></td>
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="18" Field="PathFindNumNodes" id="PathFindNumNodes_L18" runat="server" EnableHiddenOnUIEvent="PathFindSide_L18,PathFindSite_L18,PathFindExtension_L18"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="18" Field="PathFindMaxDim" id="PathFindMaxDim_L18" runat="server" EnableHiddenOnUIEvent="PathFindSide_L18,PathFindSite_L18"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="18"  FIELD="PathFindExtension" ID="PathFindExtension_L18" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_L18,PathFindSite_L18"  LookupCode="YesNoUnknown" /></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L18" runat="server" /></td>
                    </tr>
	                 <tr>
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="19" Field="PathFindSide" id="PathFindSide_L19" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="19" Field="PathFindSite" id="PathFindSite_L19" runat="server" Value="Level 1,2,3,4,5,6,7"/>
                            Level Unknown</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="19" Field="PathFindPosNodes" id="PathFindPosNodes_L19" runat="server" EnableHiddenOnUIEvent="PathFindSide_L19,PathFindSite_L19,PathFindExtension_L19"/></td>
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="19" Field="PathFindNumNodes" id="PathFindNumNodes_L19" runat="server" EnableHiddenOnUIEvent="PathFindSide_L19,PathFindSite_L19,PathFindExtension_L19"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="19" Field="PathFindMaxDim" id="PathFindMaxDim_L19" runat="server" EnableHiddenOnUIEvent="PathFindSide_L19,PathFindSite_L19"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="19"  FIELD="PathFindExtension" ID="PathFindExtension_L19" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_L19,PathFindSite_L19" LookupCode="YesNoUnknown" /></td>
                    </tr>
	                 <tr>
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="23" Field="PathFindSide" id="PathFindSide_L23" runat="server" Value="Left" />
		                    <euc:EformTextBox Width="1px" style="display: none;" Table="NodePathFinding" ParentRecordId="16"  RecordId="23" Field="PathFindSite" id="PathFindSite_L23" runat="server" />
                            Levels:<br />
                            <euc:EformExtendedCheckBoxList style="white-space: nowrap;" Table="NoTable" Field="PathFindSiteCBL_L23" ID="PathFindSiteCBL_L23" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" RepeatLayout="Flow" EnableHiddenOnUIEvent="PathFindSide_L23,PathFindExtension_L23" >
                                <asp:ListItem Value="1" Text="1" />
                                <asp:ListItem Value="2" Text="2" />
                                <asp:ListItem Value="3" Text="3" />
                                <asp:ListItem Value="4" Text="4" />
                                <asp:ListItem Value="5" Text="5" />
                                <asp:ListItem Value="6" Text="6" />
                                <asp:ListItem Value="7" Text="7" />           
                            </euc:EformExtendedCheckBoxList>
                            
                            
                            </td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="23" Field="PathFindPosNodes" id="PathFindPosNodes_L23" runat="server" EnableHiddenOnUIEvent="PathFindSide_L23,PathFindExtension_L23"/></td>
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="23" Field="PathFindNumNodes" id="PathFindNumNodes_L23" runat="server" EnableHiddenOnUIEvent="PathFindSide_L23,PathFindExtension_L23"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="23" Field="PathFindMaxDim" id="PathFindMaxDim_L23" runat="server" EnableHiddenOnUIEvent="PathFindSide_L23"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="23"  FIELD="PathFindExtension" ID="PathFindExtension_L23" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_L23" LookupCode="YesNoUnknown" /></td>
                    </tr>

		        </table>
<br />

<strong> Right Neck</strong>
<table border="0" cellspacing="0" cellpadding="6" width="400" class="eformLargePopulatedTable">
		    <tr>
		        <td class="controlBoxDataGridTitleColumn" style="text-align: center; white-space: nowrap;">Site</td>
		        <td class="controlBoxDataGridTitleColumn" style="text-align: center; "># Positive Nodes</td>
		        <td class="controlBoxDataGridTitleColumn" style="text-align: center; white-space: nowrap;"># Total Nodes</td>
		        <td class="controlBoxDataGridTitleColumn" style="text-align: center; white-space: nowrap;">Max Dim (cm)</td>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: center; width: 50px;">ECS</td>
		        <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;</td>
		    </tr>
		 <tr >
			<td style="text-align: center; white-space: nowrap;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="8" Field="PathFindSide" id="PathFindSide_R8" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="8" Field="PathFindSite" id="PathFindSite_R8" runat="server" Value="Level 1"/>
                 Level 1</td>
  	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="8" Field="PathFindPosNodes" id="PathFindPosNodes_R8" runat="server" EnableHiddenOnUIEvent="PathFindSide_R8,PathFindSite_R8"/></td>               
		    <td>    
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="8" Field="PathFindNumNodes" id="PathFindNumNodes_R8" runat="server" EnableHiddenOnUIEvent="PathFindSide_R8,PathFindSite_R8"/></td>
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="8" Field="PathFindMaxDim" id="PathFindMaxDim_R8" runat="server" EnableHiddenOnUIEvent="PathFindSide_R8,PathFindSite_R8"/></td>
            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="8"  FIELD="PathFindExtension" ID="PathFindExtension_R8" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_R8,PathFindSite_R8" LookupCode="YesNoUnknown" /></td>
                
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R8" runat="server" /></td>
	     </tr>
	     <tr>
			<td  style="text-align: center; white-space: nowrap;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="9" Field="PathFindSide" id="PathFindSide_R9" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="9" Field="PathFindSite" id="PathFindSite_R9" runat="server" Value="Level 2"/>
                Level 2</td>
            <td>    
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="9" Field="PathFindPosNodes" id="PathFindPosNodes_R9" runat="server" EnableHiddenOnUIEvent="PathFindSide_R9,PathFindSite_R9,PathFindExtension_R9"/></td>           
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="9" Field="PathFindNumNodes" id="PathFindNumNodes_R9" runat="server" EnableHiddenOnUIEvent="PathFindSide_R9,PathFindSite_R9,PathFindExtension_R9"/></td>	        		
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="9" Field="PathFindMaxDim" id="PathFindMaxDim_R9" runat="server" EnableHiddenOnUIEvent="PathFindSide_R9,PathFindSite_R9"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="9"  FIELD="PathFindExtension" ID="PathFindExtension_R9" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_R9,PathFindSite_R9" LookupCode="YesNoUnknown" /></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R9" runat="server" /></td>
	     </tr>
	     <tr>
			<td  style="text-align: center; white-space: nowrap;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="10" Field="PathFindSide" id="PathFindSide_R10" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="10" Field="PathFindSite" id="PathFindSite_R10" runat="server" Value="Level 3"/>
                Level 3</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="10" Field="PathFindPosNodes" id="PathFindPosNodes_R10" runat="server" EnableHiddenOnUIEvent="PathFindSide_R10,PathFindSite_R10,PathFindExtension_R10"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="10" Field="PathFindNumNodes" id="PathFindNumNodes_R10" runat="server" EnableHiddenOnUIEvent="PathFindSide_R10,PathFindSite_R10,PathFindExtension_R10"/></td>			        
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="10" Field="PathFindMaxDim" id="PathFindMaxDim_R10" runat="server" EnableHiddenOnUIEvent="PathFindSide_R10,PathFindSite_R10"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="10"  FIELD="PathFindExtension" ID="PathFindExtension_R10" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_R10,PathFindSite_R10"  LookupCode="YesNoUnknown" /></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R10" runat="server" /></td>
	     </tr>
	     <tr>
			<td  style="text-align: center; white-space: nowrap;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="11" Field="PathFindSide" id="PathFindSide_R11" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="11" Field="PathFindSite" id="PathFindSite_R11" runat="server" Value="Level 4"/>
                Level 4</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="11" Field="PathFindPosNodes" id="PathFindPosNodes_R11" runat="server" EnableHiddenOnUIEvent="PathFindSide_R11,PathFindSite_R11,PathFindExtension_R11"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="11" Field="PathFindNumNodes" id="PathFindNumNodes_R11" runat="server" EnableHiddenOnUIEvent="PathFindSide_R11,PathFindSite_R11,PathFindExtension_R11"/></td>	     
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="11" Field="PathFindMaxDim" id="PathFindMaxDim_R11" runat="server" EnableHiddenOnUIEvent="PathFindSide_R11,PathFindSite_R11"/></td>
            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="11"  FIELD="PathFindExtension" ID="PathFindExtension_R11" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_R11,PathFindSite_R11"  LookupCode="YesNoUnknown" /></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R11" runat="server" /></td>
	     </tr>
	     <tr>
			<td  style="text-align: center; white-space: nowrap;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="12" Field="PathFindSide" id="PathFindSide_R12" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="12" Field="PathFindSite" id="PathFindSite_R12" runat="server" Value="Level 5"/>
                Level 5</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="12" Field="PathFindPosNodes" id="PathFindPosNodes_R12" runat="server" EnableHiddenOnUIEvent="PathFindSide_R12,PathFindSite_R12,PathFindExtension_R12"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="12" Field="PathFindNumNodes" id="PathFindNumNodes_R12" runat="server" EnableHiddenOnUIEvent="PathFindSide_R12,PathFindSite_R12,PathFindExtension_R12"/></td>     
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="12" Field="PathFindMaxDim" id="PathFindMaxDim_R12" runat="server" EnableHiddenOnUIEvent="PathFindSide_R12,PathFindSite_R12"/></td>
            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="12"  FIELD="PathFindExtension" ID="PathFindExtension_R12" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_R12,PathFindSite_R12"  LookupCode="YesNoUnknown" /></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R12" runat="server" /></td>
	     </tr>
	     <tr>
			<td  style="text-align: center; white-space: nowrap;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="13" Field="PathFindSide" id="PathFindSide_R13" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="13" Field="PathFindSite" id="PathFindSite_R13" runat="server" Value="Level 6"/>
                Level 6</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="13" Field="PathFindPosNodes" id="PathFindPosNodes_R13" runat="server" EnableHiddenOnUIEvent="PathFindSide_R13,PathFindSite_R13,PathFindExtension_R13"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="13" Field="PathFindNumNodes" id="PathFindNumNodes_R13" runat="server" EnableHiddenOnUIEvent="PathFindSide_R13,PathFindSite_R13,PathFindExtension_R13"/></td>
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="13" Field="PathFindMaxDim" id="PathFindMaxDim_R13" runat="server" EnableHiddenOnUIEvent="PathFindSide_R13,PathFindSite_R13"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="13"  FIELD="PathFindExtension" ID="PathFindExtension_R13" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_R13,PathFindSite_R13"  LookupCode="YesNoUnknown" /></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R13" runat="server" /></td>	     
	     </tr>
	     <tr>
			<td  style="text-align: center; white-space: nowrap;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="14" Field="PathFindSide" id="PathFindSide_R14" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="14" Field="PathFindSite" id="PathFindSite_R14" runat="server" Value="Level 7"/>
                Level 7</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="14" Field="PathFindPosNodes" id="PathFindPosNodes_R14" runat="server" EnableHiddenOnUIEvent="PathFindSide_R14,PathFindSite_R14,PathFindExtension_R14"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="14" Field="PathFindNumNodes" id="PathFindNumNodes_R14" runat="server" EnableHiddenOnUIEvent="PathFindSide_R14,PathFindSite_R14,PathFindExtension_R14"/></td>	     
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="14" Field="PathFindMaxDim" id="PathFindMaxDim_R14" runat="server" EnableHiddenOnUIEvent="PathFindSide_R14,PathFindSite_R14"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="14"  FIELD="PathFindExtension" ID="PathFindExtension_R14" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_R14,PathFindSite_R14" LookupCode="YesNoUnknown" /></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R14" runat="server" /></td>
        </tr>
	     <tr>
			<td  style="text-align: center; white-space: nowrap;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="20" Field="PathFindSide" id="PathFindSide_R20" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="20" Field="PathFindSite" id="PathFindSite_R20" runat="server" Value="Level 1,2,3,4,5"/>
                Level Unknown: Lateral</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="20" Field="PathFindPosNodes" id="PathFindPosNodes_R20" runat="server" EnableHiddenOnUIEvent="PathFindSide_R20,PathFindSite_R20,PathFindExtension_R20"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="20" Field="PathFindNumNodes" id="PathFindNumNodes_R20" runat="server" EnableHiddenOnUIEvent="PathFindSide_R20,PathFindSite_R20,PathFindExtension_R20"/></td>	     
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="20" Field="PathFindMaxDim" id="PathFindMaxDim_R20" runat="server" EnableHiddenOnUIEvent="PathFindSide_R20,PathFindSite_R20"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="20"  FIELD="PathFindExtension" ID="PathFindExtension_R20" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_R20,PathFindSite_R20" LookupCode="YesNoUnknown" /></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R20" runat="server" /></td>
        </tr>
	     <tr>
			<td  style="text-align: center; white-space: nowrap;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="21" Field="PathFindSide" id="PathFindSide_R21" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="21" Field="PathFindSite" id="PathFindSite_R21" runat="server" Value="Level 6,7"/>
                Level Unknown: Central</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="21" Field="PathFindPosNodes" id="PathFindPosNodes_R21" runat="server" EnableHiddenOnUIEvent="PathFindSide_R21,PathFindSite_R21,PathFindExtension_R21"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="21" Field="PathFindNumNodes" id="PathFindNumNodes_R21" runat="server" EnableHiddenOnUIEvent="PathFindSide_R21,PathFindSite_R21,PathFindExtension_R21"/></td>	     
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="21" Field="PathFindMaxDim" id="PathFindMaxDim_R21" runat="server" EnableHiddenOnUIEvent="PathFindSide_R21,PathFindSite_R21"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="21"  FIELD="PathFindExtension" ID="PathFindExtension_R21" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_R21,PathFindSite_R21" LookupCode="YesNoUnknown" /></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R21" runat="server" /></td>
        </tr>
	     <tr>
			<td  style="text-align: center; white-space: nowrap;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="22" Field="PathFindSide" id="PathFindSide_R22" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="22" Field="PathFindSite" id="PathFindSite_R22" runat="server" Value="Level 1,2,3,4,5,6,7"/>
                Level Unknown</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="22" Field="PathFindPosNodes" id="PathFindPosNodes_R22" runat="server" EnableHiddenOnUIEvent="PathFindSide_R22,PathFindSite_R22,PathFindExtension_R22"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="22" Field="PathFindNumNodes" id="PathFindNumNodes_R22" runat="server" EnableHiddenOnUIEvent="PathFindSide_R22,PathFindSite_R22,PathFindExtension_R22"/></td>	     
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="22" Field="PathFindMaxDim" id="PathFindMaxDim_R22" runat="server" EnableHiddenOnUIEvent="PathFindSide_R22,PathFindSite_R22"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="22"  FIELD="PathFindExtension" ID="PathFindExtension_R22" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_R22,PathFindSite_R22" LookupCode="YesNoUnknown" /></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R22" runat="server" /></td>
        </tr>
         <tr>
            <td  style="text-align: center; white-space: nowrap;">
                <euc:EformHidden Table="NodePathFinding" ParentRecordId="16"  RecordId="24" Field="PathFindSide" id="PathFindSide_R24" runat="server" Value="Right" />
                <euc:EformTextBox Width="1px" style="display: none; " Table="NodePathFinding" ParentRecordId="16"  RecordId="24" Field="PathFindSite" id="PathFindSite_R24" runat="server" />
                Levels:<br />
                <euc:EformExtendedCheckBoxList style="white-space: nowrap;" Table="NoTable" Field="PathFindSiteCBL_R24" ID="PathFindSiteCBL_R24" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" RepeatLayout="Flow" EnableHiddenOnUIEvent="PathFindSide_R24,PathFindExtension_R24" >
                    <asp:ListItem Value="1" Text="1" />
                    <asp:ListItem Value="2" Text="2" />
                    <asp:ListItem Value="3" Text="3" />
                    <asp:ListItem Value="4" Text="4" />
                    <asp:ListItem Value="5" Text="5" />
                    <asp:ListItem Value="6" Text="6" />
                    <asp:ListItem Value="7" Text="7" />           
                </euc:EformExtendedCheckBoxList>                            
                
                </td>
            <td>
                <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="24" Field="PathFindPosNodes" id="PathFindPosNodes_R24" runat="server" EnableHiddenOnUIEvent="PathFindSide_R24,PathFindExtension_R24"/></td>
            <td>
                <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="24" Field="PathFindNumNodes" id="PathFindNumNodes_R24" runat="server" EnableHiddenOnUIEvent="PathFindSide_R24,PathFindExtension_R24"/></td>	     
             <td>   
                <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="16"  RecordId="24" Field="PathFindMaxDim" id="PathFindMaxDim_R24" runat="server" EnableHiddenOnUIEvent="PathFindSide_R24"/></td>
            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="16"  RecordId="24"  FIELD="PathFindExtension" ID="PathFindExtension_R24" Runat="server"   EnableHiddenOnUIEvent="PathFindSide_R24" LookupCode="YesNoUnknown" /></td>
        </tr>

		</table>



<br/><br/><br/>


<script type="text/javascript">

    /* <![CDATA[ */
    addEvents($('<%= PathFindSiteCBL_L23.ClientID %>'),$('<%= PathFindSite_L23.ClientID %>'),$('<%= PathFindPosNodes_L23.ClientID %>'),$('<%= PathFindNumNodes_L23.ClientID %>'),$('<%= PathFindMaxDim_L23.ClientID %>'),$('<%= PathFindExtension_L23.ClientID %>'));
    addEvents($('<%= PathFindSiteCBL_R24.ClientID %>'),$('<%= PathFindSite_R24.ClientID %>'),$('<%= PathFindPosNodes_R24.ClientID %>'),$('<%= PathFindNumNodes_R24.ClientID %>'),$('<%= PathFindMaxDim_R24.ClientID %>'),$('<%= PathFindExtension_R24.ClientID %>'));

    //Adds events to controls
    function addEvents(siteCBL,pathFindSiteID,pathFindPosNodesID,pathFindNumNodesID,pathFindMaxDimID,pathFindExtensionID)
    { 
        var cbl = siteCBL.getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++)
        {
            var cblRef = cbl[j];
            if (cblRef.type == 'checkbox')
                  $(cblRef).addEvent('click',curry(SetHiddenFields,siteCBL,pathFindSiteID,pathFindPosNodesID,pathFindNumNodesID,pathFindMaxDimID,pathFindExtensionID));
            else if (rblRef.type == 'text')
                  $(cblRef).addEvent('blur',curry(SetHiddenFields,siteCBL,pathFindSiteID,pathFindPosNodesID,pathFindNumNodesID,pathFindMaxDimID,pathFindExtensionID));
        }  

        $(pathFindPosNodesID).addEvent('blur',curry(SetHiddenFields,siteCBL,pathFindSiteID,pathFindPosNodesID,pathFindNumNodesID,pathFindMaxDimID,pathFindExtensionID));
        $(pathFindNumNodesID).addEvent('blur',curry(SetHiddenFields,siteCBL,pathFindSiteID,pathFindPosNodesID,pathFindNumNodesID,pathFindMaxDimID,pathFindExtensionID));
        $(pathFindMaxDimID).addEvent('blur',curry(SetHiddenFields,siteCBL,pathFindSiteID,pathFindPosNodesID,pathFindNumNodesID,pathFindMaxDimID,pathFindExtensionID));
        $(pathFindExtensionID).addEvent('blur',curry(SetHiddenFields,siteCBL,pathFindSiteID,pathFindPosNodesID,pathFindNumNodesID,pathFindMaxDimID,pathFindExtensionID));
   }

 
    /* ]]> */
    
function SetHiddenFields(siteCBL,pathFindSiteID,pathFindPosNodesID,pathFindNumNodesID,pathFindMaxDimID,pathFindExtensionID)
{
    var levelsString =  RetrieveCheckBoxListSelectedValues (siteCBL,"FLOW");
    if (levelsString != '')
        pathFindSiteID.value = "Level " + levelsString;

}
</script>