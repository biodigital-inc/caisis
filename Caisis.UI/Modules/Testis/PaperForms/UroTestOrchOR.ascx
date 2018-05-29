<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Testis.PaperForms.UroTestOrchOR" CodeFile="UroTestOrchOR.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePaperFormControl" %>
<div id="LastPageInForm" runat="server" align="center" >

<div id="demographicsDiv" style="Z-INDEX: 31; VISIBILITY: visible; OVERFLOW: auto; POSITION: absolute; top:20px; left:400px;">
<table  width="325" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="65"><img src="../../Images/shim.gif" border="0" width="65" height="1"></td>
                  <td align="left" width="260"><img src="../../Images/shim.gif" border="0" width="260" height="1"></td>
                </tr>
                <tr> 
                  <td align="right"> 
                    <% =patientMRNLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left"><strong> 
                    <% =patientMRN  %>
                    </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <% =patientDOB  %>
                  </td>
                </tr>
                <tr> 
                  <td colspan="1" align="right"> 
                    <% =patientNameLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td colspan="1" align="left"><strong> 
                    <% =patientLastName  %>, <% =patientFirstName  %> <% =patientMiddleName  %>
                    </strong></td>
                </tr>
                <tr> 
                  <td align="right" valign="top">
                    <% =patientAddressLabel  %>
                    &nbsp;&nbsp;&nbsp;</td>
                  <td align="left" valign="top"> 
                    <% =patientAddress1  %>
                    <% =patientAddress2  %>
                    <% =patientCity  %>
                    <% =patientState  %>
                    <% =patientPostalCode  %>
                  </td>
                </tr>
              </table>
</div>

<img src="../../Images/FormImages/Orchiectomy_Pg1_20041122.gif" width="700" height="917" border="0"></div>