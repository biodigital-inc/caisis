<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Modules_SpecimenMgmt_Index" %>

<!--
		*********************************************************************************************************************
		
	    Caisis : Data Management System
		Copyright(C) 2015 BioDigital, Inc., All Rights Reserved. 

		Unless explicitly acquired and licensed from Licensor, the contents of this file are subject to  the GNU PUBLIC LICENSE 
		("GPU") Version 2, or subsequent versions as allowed by the GPU, and You may not copy or use this file in either source
		code or executable form, except in compliance with the terms and conditions of the GPU. 

		You may obtain a copy of both the GPU at http://www.caisis.org. 

		All software distributed under the Licenses is provided strictly on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND,  EITHER EXPRESS OR IMPLIED, AND THE CAISIS TEAM HEREBY DISCLAIMS ALL SUCH WARRANTIES, INCLUDING WITHOUT LIMITATION,  ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR  PURPOSE, QUIET ENJOYMENT, OR NON-INFRINGEMENT.  FOR THE AVOIDANCE OF DOUBT, LICENSOR DOES NOT WARRANT THAT THE SOFTWARE WILL MEET CUSTOMER'S REQUIREMENTS OR BE ERROR-FREE OR SECURE. USE OF THE SOFTWARE IS AT YOUR OWN RISK AND YOU ARE SOLELY RESPONSIBLE FOR THE SECURITY, ACCURACY, TRANSMISSION AND USE OF THE DATA.
        See the  Licenses for specific language governing rights and limitations under the Licenses. 
		
		
		**********************************************************************************************************************
-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
	<title>Caisis: Specimen Management</title>
	<meta content="Microsoft Visual Studio 7.0" name="GENERATOR" />
	<meta content="C#" name="CODE_LANGUAGE" />
	<meta content="JavaScript" name="vs_defaultClientScript" />
	<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta content="NOINDEX" name="ROBOTS" />
	<link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
	<link href="../../StyleSheets/MenuStyles.css" type="text/css" rel="stylesheet" />
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script src="../../ClientScripts/PatientDataEntry.js" type="text/javascript"></script>
	<script src="../../ClientScripts/Menu.js" type="text/javascript"></script>
	<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
	<script type="text/javascript">
	Browser.ResizeElement( { nodeId: 'MainWindow', heightOffset: 110 } );
	 </script>
</head>
<body>
	<table cellspacing="0" cellpadding="0" width="100%" border="0" align="center" height="100%">
        <tr>
			<td class="MenuContainter" nowrap align="center" width="100%" >
			    <ul id="menu" style="text-align: center; padding-left: 180px;">  
			    
			        <%--<li style="width: 150px; cursor:default;">Specimen Accessions</a>
                        <ul style="width: 150px;">
                            <li>
                                <a target="MainWindow" href="AccessionSearchByIdentifiers.aspx">Search by Identifiers</a>
                            </li>
                        </ul>
                    </li>--%>
                   
                    <li style="width: 150px;"><a href="SpecimensSplash.aspx"  target="MainWindow">Specimens</a>
                        <ul style="width: 150px;">
                            <li>
                                <a target="MainWindow" href="SpecimenQueryResults.aspx?ViewAll=true">View All Specimens</a>
                                <a target="MainWindow" href="SpecimenQueryResults.aspx?ViewAll=false">View Available Specimens</a>
                                <a target="MainWindow" href="LocalSpecimenQuery.aspx">Basic Specimen Search</a>
                                <a target="MainWindow" href="BTCSpecimenQuery.aspx">Brain Specimen Search</a>
					            <a target="MainWindow" href="AdvancedBreastSpecimenQuery.aspx">Breast Specimen Search</a>
					            <a target="MainWindow" href="AdvancedProstateSpecimenQuery.aspx">Prostate Specimen Search</a>
					            <%--<a target="MainWindow" href="AccessionSearchByIdentifiers.aspx">Specimen Accessions</a>--%>
                            </li>
                        </ul>
                    </li>
                    
                    <li style="width: 150px;"><a href="CollectionsSplash.aspx"  target="MainWindow">Collections</a>
                        <ul style="width: 150px;">
                            <li>
                                <a target="MainWindow" href="SearchForCollection.aspx?menu=viewAll">View All Collections</a>
                                <a target="MainWindow" href="SearchForCollection.aspx">Find Collection</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li style="width: 150px;"><a href="TransfersSplash.aspx"  target="MainWindow">Transfers</a>
                        <ul style="width: 150px;">
                            <li>
                                <a target="MainWindow" href="SearchForTransfer.aspx?menu=viewAll">View Existing Transfers</a>
                                <a target="MainWindow" href="TransferRequest.aspx">New Transfer Request</a>
                                <a target="MainWindow" href="SearchForTransfer.aspx">Find Transfer Request</a>
                            </li>
                        </ul>
                    </li>
                    
                    <!-- need to make this permission based -->		
                    <li style="width: 150px; cursor:default;">Manage Storage
                        <ul style="width: 150px;">
                            <li>
					            <a target="MainWindow" href="StorageManager.aspx">Manage Storage</a>
                            </li>
                        </ul>
                    </li>
                </ul>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<table id="contentTable" cellspacing="0" cellpadding="0" width="100%" border="0" >
					<tr>
						<td style="vertical-align: top;" align="center">
							<iframe id="MainWindow" style="width: 95%; height: 600px;" scrolling="no" name="MainWindow" src="SpecimenManagementSplash.aspx" frameborder="0">
							</iframe>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>