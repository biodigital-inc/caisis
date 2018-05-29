using System;
using System.Data;

using Caisis.DataAccess;

namespace Caisis.Controller
{
    /// <summary>
    /// Summary description for SearchController.
    /// </summary>
    public class SearchController //: BaseController
    {

        public DataSet FindPatient(string strFind, string datasetSQL)
        {
            ValidatePatientSearch();
            PatientDa da = new PatientDa();
            return da.FindPatient(strFind, datasetSQL);
        }

        public DataSet FindPatientByIdentifier(string searchFilter, string identifierType, string datasetSQL)
        {
            ValidatePatientIdentifierSearch(identifierType);
            PatientDa da = new PatientDa();
            return da.FindPatientByIdentifier(searchFilter, identifierType, datasetSQL);
        }

        /// <summary>
        /// Validates the User has View Patient Identifiers permission
        /// </summary>
        private void ValidatePatientSearch()
        {
            UserController uc = new UserController();
            if (!uc.CanViewPatientIdentifiers())
            {
                throw new Exception("User does not have View Patient Identifiers Permission to perform this search.");
            }
        }

        /// <summary>
        /// Validates that the user has permission to search by the specified Identifier
        /// </summary>
        /// <param name="identifierType"></param>
        private void ValidatePatientIdentifierSearch(string identifierType)
        {
            UserController uc = new UserController();
            if (!uc.CanSearchIdentifier(identifierType))
            {
                throw new Exception(string.Format("User cannot search by Identifier '{0}'", identifierType));
            }
        }
    }
}
