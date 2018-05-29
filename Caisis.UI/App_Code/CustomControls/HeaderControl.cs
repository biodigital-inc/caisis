using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;
using System.Text;

using Caisis.BOL;
using Caisis.Controller;

namespace Caisis.UI.Core.Classes
{
	/// <summary>
	/// Base control for header controls that display lists of patients.
    /// e.g. CurrentList.ascx and FindResults.ascx
	/// </summary>
	public class HeaderControl : BaseControl
	{

        private PatientController _pc = new PatientController();

        /// <summary>
		/// Gets current page path and query string to reload section after a patient search occurs.  
		/// </summary>
		/// <returns></returns>
		protected string GetPatientRedirectPath()  
		{
			
			// by default after search refresh current section
			string pathString = HttpContext.Current.Request.Path;
	
			// user is submitting patient name or mrn from the pop-up layer on the splash page icons 
			if (Request.Form["HeaderSearchTarget"] != null && Request.Form["HeaderSearchTarget"].Length > 0)
			{
				pathString =  HttpContext.Current.Request.ApplicationPath;
				if (!pathString.EndsWith("/"))
				{
					pathString += "/";
				}
				pathString += "Core" + Request.Form["HeaderSearchTarget"];;
			}
			// active page uses module framework
			else if(pathString.IndexOf("ModuleContainer") > -1 && Request.QueryString["mod"] != null)
			{
				// i.e. ModuleContainer.aspx?mod=/ProtocolMgr/Index.aspx
				pathString += "?mod=" + Request.QueryString["mod"];
			}
			// active page uses EmptyContainer
			else if(pathString.IndexOf("EmptyContainer") > -1 && Request.QueryString["TaskPage"] != null)
			{
				// i.e. Core/Utilities/EmptyContainer.aspx?TaskPage=EditAPhysician.aspx
				pathString += "?TaskPage=" + Request.QueryString["TaskPage"];
			}
			
			return pathString;	
		}

        /// <summary>
        /// Used by find a patient, recent find results, and current list header repeaters to format list of patients
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// <returns>row of formatted patient info in format: last, first m.  DOB   MRN</returns>
		public string SetPatientListItem(Object sender, RepeaterItemEventArgs e)
		{
			StringBuilder sb = new StringBuilder();

             if (((DataRowView)e.Item.DataItem) != null)
             {
                    // parse together search result string displaying last name, first name, mid initial, birthdate and mrn
                    if (e.Item.DataItem != null && e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			        {
                        DataRowView row = ((DataRowView)e.Item.DataItem);
                        string ptLastName = _pc.GetPatientLastName(row[Patient.PtLastName].ToString());
                        string ptFirstName = _pc.GetPatientFirstName(row[Patient.PtFirstName].ToString());
                        
                        // add last, first name  
                        sb.Append(ptLastName + ", " + ptFirstName);
        				
                        // add mid initial
                        if(row.Row.Table.Columns.Contains(Patient.PtMiddleName) && row[Patient.PtMiddleName].ToString().Length > 0)
                        {
                            string ptMiddleName = _pc.GetPatientMiddleName(row[Patient.PtMiddleName].ToString());
                            sb.Append("&nbsp;" + ptMiddleName.Substring(0, 1) + ".");
                        }
				       
				        sb.Append("&nbsp;</td><td   class=\"smallHeaderText\" >");

                        // add dob
                        if (row.Row.Table.Columns.Contains(Patient.PtBirthDateText) && row[Patient.PtBirthDateText].ToString().Length > 0)
                        {
                            string dobText = _pc.GetPatientDateOfBirth(row[Patient.PtBirthDateText].ToString());
                            sb.Append(dobText + "&nbsp;");
                        }

				        // add mrn
                        sb.Append("</td><td align=\"right\"   class=\"smallHeaderText\">" + row[Patient.PtMRN].ToString());
			        }
             }
			 return sb.ToString();
		}
           
	}
}
