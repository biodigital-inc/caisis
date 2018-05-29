<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.OropharynxNodePathFindings" CodeFile="OropharynxNodePathFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="OropharynxNodePathFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Cervical Nodes "></asp:Label><br/>
<br /><br />

<strong> Left Neck</strong>
<table border="0" cellspacing="0" cellpadding="6" width="400" class="eformLargePopulatedTableBlue">
 	                <tr>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Site</td>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: center; "># Positive Nodes</td>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: center;"># Total Nodes</td>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Max size (cm)</td>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: center; width: 50px;">Histologic Extra-Capsular Spread</td>
	                    <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;</td>
	                </tr>
   		
		             <tr >
			            <td  style="text-align: center;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="1" Field="PathFindSide" id="PathFindSide_L1" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="1" Field="PathFindSite" id="PathFindSite_L1" runat="server" Value="Level 1"/>
                            Level 1</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="1" Field="PathFindPosNodes" id="PathFindPosNodes_L1" runat="server" EnableHiddenOnUIEvent="PathFindSide_L1,PathFindSite_L1"/></td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="1" Field="PathFindNumNodes" id="PathFindNumNodes_L1" runat="server" EnableHiddenOnUIEvent="PathFindSide_L1,PathFindSite_L1"/></td>
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="1" Field="PathFindMaxDim" id="PathFindMaxDim_L1" runat="server" EnableHiddenOnUIEvent="PathFindSide_L1,PathFindSite_L1"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="1"  FIELD="PathFindHistology" ID="PathFindHistology_L1" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_L1,PathFindSite_L1"  >
                                 <asp:ListItem Value="" Text="" ></asp:ListItem>
                               <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                            </euc:EformDropDownList></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L1" runat="server" /></td>
            	
	                 </tr>
	                 <tr>
			            <td  style="text-align: center;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="2" Field="PathFindSide" id="PathFindSide_L2" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="2" Field="PathFindSite" id="PathFindSite_L2" runat="server" Value="Level 2"/>
                            Level 2</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="2" Field="PathFindPosNodes" id="PathFindPosNodes_L2" runat="server" EnableHiddenOnUIEvent="PathFindSide_L2,PathFindSite_L2,PathFindHistology_L2"/></td>
		                <td>    
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="2" Field="PathFindNumNodes" id="PathFindNumNodes_L2" runat="server" EnableHiddenOnUIEvent="PathFindSide_L2,PathFindSite_L2,PathFindHistology_L2"/></td>
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="2" Field="PathFindMaxDim" id="PathFindMaxDim_L2" runat="server" EnableHiddenOnUIEvent="PathFindSide_L2,PathFindSite_L2"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="2"  FIELD="PathFindHistology" ID="PathFindHistology_L2" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_L2,PathFindSite_L2"  >
                                 <asp:ListItem Value="" Text="" ></asp:ListItem>
                               <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                            </euc:EformDropDownList></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L2" runat="server" /></td>
	                 </tr>
	                 <tr>
			            <td  style="text-align: center;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="3" Field="PathFindSide" id="PathFindSide_L3" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="3" Field="PathFindSite" id="PathFindSite_L3" runat="server" Value="Level 3"/>
                            Level 3</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="3" Field="PathFindPosNodes" id="PathFindPosNodes_L3" runat="server" EnableHiddenOnUIEvent="PathFindSide_L3,PathFindSite_L3,PathFindHistology_L3"/></td>

                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="3" Field="PathFindNumNodes" id="PathFindNumNodes_L3" runat="server" EnableHiddenOnUIEvent="PathFindSide_L3,PathFindSite_L3,PathFindHistology_L3"/></td>
            		        			        
   	                    <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="3" Field="PathFindMaxDim" id="PathFindMaxDim_L3" runat="server" EnableHiddenOnUIEvent="PathFindSide_L3,PathFindSite_L3"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="3"  FIELD="PathFindHistology" ID="PathFindHistology_L3" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_L3,PathFindSite_L3"  >
                                 <asp:ListItem Value="" Text="" ></asp:ListItem>
                               <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                            </euc:EformDropDownList></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L3" runat="server" /></td>
	                 </tr>
	                 <tr>
			            <td  style="text-align: center;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="4" Field="PathFindSide" id="PathFindSide_L4" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="4" Field="PathFindSite" id="PathFindSite_L4" runat="server" Value="Level 4"/>
                            Level 4</td>		        
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="4" Field="PathFindPosNodes" id="PathFindPosNodes_L4" runat="server" EnableHiddenOnUIEvent="PathFindSide_L4,PathFindSite_L4,PathFindHistology_L4"/></td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="4" Field="PathFindNumNodes" id="PathFindNumNodes_L4" runat="server" EnableHiddenOnUIEvent="PathFindSide_L4,PathFindSite_L4,PathFindHistology_L4"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="4" Field="PathFindMaxDim" id="PathFindMaxDim_L4" runat="server" EnableHiddenOnUIEvent="PathFindSide_L4,PathFindSite_L4"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="4"  FIELD="PathFindHistology" ID="PathFindHistology_L4" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_L4,PathFindSite_L4"  >
                                 <asp:ListItem Value="" Text="" ></asp:ListItem>
                               <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                            </euc:EformDropDownList></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L4" runat="server" /></td>
	                 </tr>
	                 <tr>
			            <td  style="text-align: center;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="5" Field="PathFindSide" id="PathFindSide_L5" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="5" Field="PathFindSite" id="PathFindSite_L5" runat="server" Value="Level 5"/>
                            Level 5</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="5" Field="PathFindPosNodes" id="PathFindPosNodes_L5" runat="server" EnableHiddenOnUIEvent="PathFindSide_L5,PathFindSite_L5,PathFindHistology_L5"/></td>
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="5" Field="PathFindNumNodes" id="PathFindNumNodes_L5" runat="server" EnableHiddenOnUIEvent="PathFindSide_L5,PathFindSite_L5,PathFindHistology_L5"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="5" Field="PathFindMaxDim" id="PathFindMaxDim_L5" runat="server" EnableHiddenOnUIEvent="PathFindSide_L5,PathFindSite_L5"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="5"  FIELD="PathFindHistology" ID="PathFindHistology_L5" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_L5,PathFindSite_L5"  >
                                 <asp:ListItem Value="" Text="" ></asp:ListItem>
                               <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                            </euc:EformDropDownList></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L5" runat="server" /></td>
	                 </tr>
	                 <tr>
			            <td  style="text-align: center;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="6" Field="PathFindSide" id="PathFindSide_L6" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="6" Field="PathFindSite" id="PathFindSite_L6" runat="server" Value="Level 6"/>
                            Level 6</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="6" Field="PathFindPosNodes" id="PathFindPosNodes_L6" runat="server" EnableHiddenOnUIEvent="PathFindSide_L6,PathFindSite_L6,PathFindHistology_L6"/></td>
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="6" Field="PathFindNumNodes" id="PathFindNumNodes_L6" runat="server" EnableHiddenOnUIEvent="PathFindSide_L6,PathFindSite_L6,PathFindHistology_L6"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="6" Field="PathFindMaxDim" id="PathFindMaxDim_L6" runat="server" EnableHiddenOnUIEvent="PathFindSide_L6,PathFindSite_L6"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="6"  FIELD="PathFindHistology" ID="PathFindHistology_L6" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_L6,PathFindSite_L6"  >
                                 <asp:ListItem Value="" Text="" ></asp:ListItem>
                               <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                            </euc:EformDropDownList></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L6" runat="server" /></td>
	                 </tr>
	                 <tr>
			            <td  style="text-align: center;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="7" Field="PathFindSide" id="PathFindSide_L7" runat="server" Value="Left" />
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="7" Field="PathFindSite" id="PathFindSite_L7" runat="server" Value="Level 7"/>
                            Level 7</td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="7" Field="PathFindPosNodes" id="PathFindPosNodes_L7" runat="server" EnableHiddenOnUIEvent="PathFindSide_L7,PathFindSite_L7,PathFindHistology_L7"/></td>
		                <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="7" Field="PathFindNumNodes" id="PathFindNumNodes_L7" runat="server" EnableHiddenOnUIEvent="PathFindSide_L7,PathFindSite_L7,PathFindHistology_L7"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="7" Field="PathFindMaxDim" id="PathFindMaxDim_L7" runat="server" EnableHiddenOnUIEvent="PathFindSide_L7,PathFindSite_L7"/></td>
                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="7"  FIELD="PathFindHistology" ID="PathFindHistology_L7" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_L7,PathFindSite_L7"  >
                                 <asp:ListItem Value="" Text="" ></asp:ListItem>
                               <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                            </euc:EformDropDownList></td>
                            
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L7" runat="server" /></td>
                    </tr>
	                 <tr>
			            <td  style="text-align: center; white-space: nowrap;">
		                    <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="16" Field="PathFindSide" id="PathFindSide_L16" runat="server" Value="Right" />
		                    Other: <euc:EformComboBox Table="NodePathFinding" Width="80px" ParentRecordId="20"  RecordId="16" Field="PathFindSite" id="PathFindSite_L16" runat="server" LookupCode="NodeSite,Disease,HeadNeck"/>
                            </td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="16" Field="PathFindPosNodes" id="PathFindPosNodes_L16" runat="server" EnableHiddenOnUIEvent="PathFindSide_L16,PathFindSite_L16,PathFindHistology_L16"/></td>
                        <td>
		                    <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="16" Field="PathFindNumNodes" id="PathFindNumNodes_L16" runat="server" EnableHiddenOnUIEvent="PathFindSide_L16,PathFindSite_L16,PathFindHistology_L16"/></td>	     
   	                     <td>   
  	                        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="16" Field="PathFindMaxDim" id="PathFindMaxDim_L16" runat="server" EnableHiddenOnUIEvent="PathFindSide_L16,PathFindSite_L16"/></td>

                        <td >
                            <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="16"  FIELD="PathFindHistology" ID="PathFindHistology_L16" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_L16,PathFindSite_L16"  >
                                 <asp:ListItem Value="" Text="" ></asp:ListItem>
                               <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                                <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                            </euc:EformDropDownList></td>
             
                        <td><euc:EformDeleteIcon ID="EformDeleteIcon_L16" runat="server" /></td>
                    </tr>

		        </table>
<br />

<strong> Right Neck</strong>
<table border="0" cellspacing="0" cellpadding="6" width="400" class="eformLargePopulatedTable">
		    <tr>
		        <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Site</td>
		        <td class="controlBoxDataGridTitleColumn" style="text-align: center; "># Positive Nodes</td>
		        <td class="controlBoxDataGridTitleColumn" style="text-align: center;"># Total Nodes</td>
		        <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Max size (cm)</td>
		        <td class="controlBoxDataGridTitleColumn" style="text-align: center; width: 50px;">Histologic Extra-Capsular Spread</td>
		        <td class="controlBoxDataGridTitleColumn" style="text-align: left;">&nbsp;</td>
		    </tr>
		 <tr >
			<td style="text-align: center;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="8" Field="PathFindSide" id="PathFindSide_R8" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="8" Field="PathFindSite" id="PathFindSite_R8" runat="server" Value="Level 2"/>
                 Level 1</td>
  	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="8" Field="PathFindPosNodes" id="PathFindPosNodes_R8" runat="server" EnableHiddenOnUIEvent="PathFindSide_R8,PathFindSite_R8"/></td>               
		    <td>    
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="8" Field="PathFindNumNodes" id="PathFindNumNodes_R8" runat="server" EnableHiddenOnUIEvent="PathFindSide_R8,PathFindSite_R8"/></td>
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="8" Field="PathFindMaxDim" id="PathFindMaxDim_R8" runat="server" EnableHiddenOnUIEvent="PathFindSide_R8,PathFindSite_R8"/></td>
            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="8"  FIELD="PathFindHistology" ID="PathFindHistology_R8" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_R8,PathFindSite_R8"  >
                     <asp:ListItem Value="" Text="" ></asp:ListItem>
                   <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                </euc:EformDropDownList></td>
                
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R8" runat="server" /></td>
	     </tr>
	     <tr>
			<td  style="text-align: center;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="9" Field="PathFindSide" id="PathFindSide_R9" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="9" Field="PathFindSite" id="PathFindSite_R9" runat="server" Value="Level 2"/>
                Level 2</td>
            <td>    
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="9" Field="PathFindPosNodes" id="PathFindPosNodes_R9" runat="server" EnableHiddenOnUIEvent="PathFindSide_R9,PathFindSite_R9,PathFindHistology_R9"/></td>           
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="9" Field="PathFindNumNodes" id="PathFindNumNodes_R9" runat="server" EnableHiddenOnUIEvent="PathFindSide_R9,PathFindSite_R9,PathFindHistology_R9"/></td>	        		
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="9" Field="PathFindMaxDim" id="PathFindMaxDim_R9" runat="server" EnableHiddenOnUIEvent="PathFindSide_R9,PathFindSite_R9"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="9"  FIELD="PathFindHistology" ID="PathFindHistology_R9" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_R9,PathFindSite_R9" >
                     <asp:ListItem Value="" Text="" ></asp:ListItem>
                   <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                </euc:EformDropDownList></td>

            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R9" runat="server" /></td>
	     </tr>
	     <tr>
			<td  style="text-align: center;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="10" Field="PathFindSide" id="PathFindSide_R10" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="10" Field="PathFindSite" id="PathFindSite_R10" runat="server" Value="Level 3"/>
                Level 3</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="10" Field="PathFindPosNodes" id="PathFindPosNodes_R10" runat="server" EnableHiddenOnUIEvent="PathFindSide_R10,PathFindSite_R10,PathFindHistology_R10"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="10" Field="PathFindNumNodes" id="PathFindNumNodes_R10" runat="server" EnableHiddenOnUIEvent="PathFindSide_R10,PathFindSite_R10,PathFindHistology_R10"/></td>			        
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="10" Field="PathFindMaxDim" id="PathFindMaxDim_R10" runat="server" EnableHiddenOnUIEvent="PathFindSide_R10,PathFindSite_R10"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="10"  FIELD="PathFindHistology" ID="PathFindHistology_R10" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_R10,PathFindSite_R10"  >
                     <asp:ListItem Value="" Text="" ></asp:ListItem>
                   <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                </euc:EformDropDownList></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R10" runat="server" /></td>
	     </tr>
	     <tr>
			<td  style="text-align: center;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="11" Field="PathFindSide" id="PathFindSide_R11" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="11" Field="PathFindSite" id="PathFindSite_R11" runat="server" Value="Level 4"/>
                Level 4</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="11" Field="PathFindPosNodes" id="PathFindPosNodes_R11" runat="server" EnableHiddenOnUIEvent="PathFindSide_R11,PathFindSite_R11,PathFindHistology_R11"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="11" Field="PathFindNumNodes" id="PathFindNumNodes_R11" runat="server" EnableHiddenOnUIEvent="PathFindSide_R11,PathFindSite_R11,PathFindHistology_R11"/></td>	     
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="11" Field="PathFindMaxDim" id="PathFindMaxDim_R11" runat="server" EnableHiddenOnUIEvent="PathFindSide_R11,PathFindSite_R11"/></td>
            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="11"  FIELD="PathFindHistology" ID="PathFindHistology_R11" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_R11,PathFindSite_R11"  >
                     <asp:ListItem Value="" Text="" ></asp:ListItem>
                   <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                </euc:EformDropDownList></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R11" runat="server" /></td>
	     </tr>
	     <tr>
			<td  style="text-align: center;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="12" Field="PathFindSide" id="PathFindSide_R12" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="12" Field="PathFindSite" id="PathFindSite_R12" runat="server" Value="Level 5"/>
                Level 5</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="12" Field="PathFindPosNodes" id="PathFindPosNodes_R12" runat="server" EnableHiddenOnUIEvent="PathFindSide_R12,PathFindSite_R12,PathFindHistology_R12"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="12" Field="PathFindNumNodes" id="PathFindNumNodes_R12" runat="server" EnableHiddenOnUIEvent="PathFindSide_R12,PathFindSite_R12,PathFindHistology_R12"/></td>     
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="12" Field="PathFindMaxDim" id="PathFindMaxDim_R12" runat="server" EnableHiddenOnUIEvent="PathFindSide_R12,PathFindSite_R12"/></td>
            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="12"  FIELD="PathFindHistology" ID="PathFindHistology_R12" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_R12,PathFindSite_R12"  >
                     <asp:ListItem Value="" Text="" ></asp:ListItem>
                   <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                </euc:EformDropDownList></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R12" runat="server" /></td>
	     </tr>
	     <tr>
			<td  style="text-align: center;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="13" Field="PathFindSide" id="PathFindSide_R13" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="13" Field="PathFindSite" id="PathFindSite_R13" runat="server" Value="Level 6"/>
                Level 6</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="13" Field="PathFindPosNodes" id="PathFindPosNodes_R13" runat="server" EnableHiddenOnUIEvent="PathFindSide_R13,PathFindSite_R13,PathFindHistology_R13"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="13" Field="PathFindNumNodes" id="PathFindNumNodes_R13" runat="server" EnableHiddenOnUIEvent="PathFindSide_R13,PathFindSite_R13,PathFindHistology_R13"/></td>
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="13" Field="PathFindMaxDim" id="PathFindMaxDim_R13" runat="server" EnableHiddenOnUIEvent="PathFindSide_R13,PathFindSite_R13"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="13"  FIELD="PathFindHistology" ID="PathFindHistology_R13" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_R13,PathFindSite_R13"  >
                     <asp:ListItem Value="" Text="" ></asp:ListItem>
                   <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                </euc:EformDropDownList></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R13" runat="server" /></td>	     
	     </tr>
	     <tr>
			<td  style="text-align: center;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="14" Field="PathFindSide" id="PathFindSide_R14" runat="server" Value="Right" />
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="14" Field="PathFindSite" id="PathFindSite_R14" runat="server" Value="Level 7"/>
                Level 7</td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="14" Field="PathFindPosNodes" id="PathFindPosNodes_R14" runat="server" EnableHiddenOnUIEvent="PathFindSide_R14,PathFindSite_R14,PathFindHistology_R14"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="14" Field="PathFindNumNodes" id="PathFindNumNodes_R14" runat="server" EnableHiddenOnUIEvent="PathFindSide_R14,PathFindSite_R14,PathFindHistology_R14"/></td>	     
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="14" Field="PathFindMaxDim" id="PathFindMaxDim_R14" runat="server" EnableHiddenOnUIEvent="PathFindSide_R14,PathFindSite_R14"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="14"  FIELD="PathFindHistology" ID="PathFindHistology_R14" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_R14,PathFindSite_R14"  >
                     <asp:ListItem Value="" Text="" ></asp:ListItem>
                   <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                </euc:EformDropDownList></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R14" runat="server" /></td>
        </tr>
	     <tr>
			<td  style="text-align: center; white-space: nowrap;">
		        <euc:EformHidden Table="NodePathFinding" ParentRecordId="20"  RecordId="15" Field="PathFindSide" id="PathFindSide_R15" runat="server" Value="Right" />
		        Other: <euc:EformComboBox Table="NodePathFinding" Width="80px" ParentRecordId="20"  RecordId="15" Field="PathFindSite" id="PathFindSite_R15" runat="server" LookupCode="NodeSite,Disease,HeadNeck"/>
                </td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="15" Field="PathFindPosNodes" id="PathFindPosNodes_R15" runat="server" EnableHiddenOnUIEvent="PathFindSide_R15,PathFindSite_R15,PathFindHistology_R15"/></td>
            <td>
		        <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="15" Field="PathFindNumNodes" id="PathFindNumNodes_R15" runat="server" EnableHiddenOnUIEvent="PathFindSide_R15,PathFindSite_R15,PathFindHistology_R15"/></td>	     
   	         <td>   
  	            <euc:EformTextBox Width="40px" Table="NodePathFinding" ParentRecordId="20"  RecordId="15" Field="PathFindMaxDim" id="PathFindMaxDim_R15" runat="server" EnableHiddenOnUIEvent="PathFindSide_R15,PathFindSite_R15"/></td>

            <td >
                <euc:EformDropDownList Table="NodePathFinding" ParentRecordId="20"  RecordId="15"  FIELD="PathFindHistology" ID="PathFindHistology_R15" Runat="server"  TabIndex="2" ShowEmptyListItem="true" EnableHiddenOnUIEvent="PathFindSide_R15,PathFindSite_R15"  >
                     <asp:ListItem Value="" Text="" ></asp:ListItem>
                   <asp:ListItem Value="Histologic Extra-Capsular Spread: Yes" Text="Yes" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: No" Text="No" ></asp:ListItem>
                    <asp:ListItem Value="Histologic Extra-Capsular Spread: Unknown" Text="Unknown" ></asp:ListItem>
                </euc:EformDropDownList></td>
 
            <td><euc:EformDeleteIcon ID="EformDeleteIcon_R15" runat="server" /></td>
        </tr>

		</table>



<br/><br/><br/>
