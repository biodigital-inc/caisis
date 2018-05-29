using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Text;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;
using Caisis.BOL;


namespace Caisis.UI.Core.Utilities
{
    public partial class PatientSearch : System.Web.UI.Page
    {
        private string searchType = string.Empty;
        private string patientFilter = string.Empty;

        private static readonly string searchTypeKey = "searchTypeValue";
        private static readonly string searchFilterKey = "searchFilter";
        private static readonly int MaxSearchResults = 500;

        protected PatientController pc = new PatientController();

        protected void Page_Load(object sender, EventArgs e)
        {
            searchType = Request.Form[searchTypeKey];
            patientFilter = Request.Form[searchFilterKey];
            SetSearchCookie(searchType);

            if (!string.IsNullOrEmpty(patientFilter.Replace(" ", "")))
            {
                DataTable searchResults = SearchForPatients(searchType, patientFilter);
                int recordCount = searchResults.Rows.Count;

                // If we have 1 result, return encrypted id to client
                if (recordCount == 1)
                {
                    string pId = searchResults.Rows[0][Patient.PatientId].ToString();
                    string encpId = Caisis.Security.CustomCryptoHelper.Encrypt(pId);
                    SetSingleResultMessages(recordCount, encpId);
                }
                else
                {
                    // If search count is below or search limit, bind to control for
                    // rendering
                    if (recordCount <= MaxSearchResults)
                    {
                        PatientsRptr.DataSource = searchResults;
                        PatientsRptr.DataBind();
                    }
                    SetMessages(recordCount);
                }
            }
            else
            {
                SetMessages(0);
            }
        }

        /// <summary>
        /// Sets the message and status of the search results
        /// </summary>
        /// <param name="resultSet"></param>
        private void SetMessages(int recordCount)
        {
            SearchCount.InnerText = recordCount.ToString();
        }

        /// <summary>
        /// Sets the message and status of the search results and set encrypted id for
        /// single result.
        /// </summary>
        /// <param name="resultSet"></param>
        private void SetSingleResultMessages(int recordCount, string epId)
        {
            SearchCount.InnerText = recordCount.ToString();
            SingleSearchEPID.InnerText = epId;
        }


        /// <summary>
        /// Sets the default search type as a cookie in the user's browser
        /// </summary>
        /// <param name="searchType"></param>
        private void SetSearchCookie(string lastSearchType)
        {
            HttpCookie lastSearchTypeCookie = Request.Cookies["DefaultSearchType"];
            lastSearchTypeCookie = lastSearchTypeCookie != null ? lastSearchTypeCookie : new HttpCookie("DefaultSearchType");
            lastSearchTypeCookie.Value = lastSearchType;

            Response.SetCookie(lastSearchTypeCookie);
        }

        /// <summary>
        /// Returns a DataTable of Patients and associated info (LastName, FirstName, etc...)
        /// </summary>
        /// <param name="identifierType">unique identifier or LastNameMRN</param>
        /// <param name="searchFilter">search filter to search for</param>
        /// <returns></returns>
        private DataTable SearchForPatients(string identifierType, string searchFilter)
        {
            DataTable results = new DataTable();
            SearchController ct = new SearchController();
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            if (identifierType == "LastNameMRN")
            {
                results = ct.FindPatient(searchFilter, datasetSQL).Tables[0];
            }
            else
            {
                results = ct.FindPatientByIdentifier(searchFilter, identifierType, datasetSQL).Tables[0];
            }
            return results;
        }

        protected void HandleIdentifiersColumn(object sender, RepeaterItemEventArgs e)
        {
            Label idCol = e.Item.FindControl("IdentifierCol") as Label;
            string colName = searchType == "LastNameMRN" ? "PtMRN" : "Identifier";
            string colVal = DataBinder.Eval(e.Item.DataItem, colName).ToString();
            idCol.Text = Server.HtmlEncode(colVal);
        }
    }
}
