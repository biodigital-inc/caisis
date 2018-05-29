using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Patients_EditInstitutionsAndDiseases : AdminBasePage
    {
        protected string QuerySearch
        {
            get
            {
                return Request.QueryString["search"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                // data bind search options
                UserController uc = new UserController();
                DataTable dt = uc.GetSearchIdentifiers();

                SearchOptionsDropdown.DataSource = dt;
                SearchOptionsDropdown.DataBind();

                string encPatientId = Request.QueryString["epid"];
                if (!string.IsNullOrEmpty(encPatientId))
                {
                    EncPatientId.Value = encPatientId;
                }
                if (!string.IsNullOrEmpty(EncPatientId.Value))
                {
                    string pid = Security.CustomCryptoHelper.Decrypt(EncPatientId.Value);
                    if (!string.IsNullOrEmpty(pid))
                    {
                        int patientId = int.Parse(pid);
                        EditPatient(patientId);
                    }
                }
                if (!string.IsNullOrEmpty(QuerySearch))
                {
                    PatientSearch.TextValue = QuerySearch;
                    DoSearch(sender, e);
                }
            }
        }

        protected void DoSearch(object sender, EventArgs e)
        {
            string searchString = PatientSearch.TextValue;
            if (!string.IsNullOrEmpty(searchString))
            {
                BuildPatientList(searchString);
            }
        }

        protected void EditPatient(object sender, CommandEventArgs e)
        {
            int patientId = int.Parse(e.CommandArgument.ToString());
            EditPatient(patientId);
        }

        /// <summary>
        /// Updates the paitent's associations
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            int patientId = int.Parse(Security.CustomCryptoHelper.Decrypt(EncPatientId.Value));
            // update associations
            UpdatePatientRptr(patientId, InstitutionsRptr);
            UpdatePatientRptr(patientId, DiseasesRptr);
            // rebuild
            BuildPatientInstitutions(patientId);
            BuildPatientDiseases(patientId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        private void EditPatient(int patientId)
        {
            string encPatientId = Caisis.Security.CustomCryptoHelper.Encrypt(patientId.ToString());
            EncPatientId.Value = encPatientId;

            Patient biz = new Patient();
            biz.Get(patientId);
            PatientController pc = new PatientController();

            string searchType = SearchOptionsDropdown.Value;
            UserController uc = new UserController();
            bool canViewIdentifiers = uc.CanViewPatientIdentifiers();
            bool searchByLastNameMRN = canViewIdentifiers && searchType == PatientController.LAST_NAME_MRN_IDENTIFIER;
            string fullName = pc.GetPatientName(biz);
            string identifier = searchByLastNameMRN ? pc.GetPatientMRN(biz) : pc.GetPatientIdentifier(patientId, searchType);
            string idType = canViewIdentifiers && searchByLastNameMRN ? "MRN" : searchType;
            PtNameLabel.Text = string.Format("{0} ({1}: {2})", fullName, idType, identifier);

            BuildPatientInstitutions(patientId);
            BuildPatientDiseases(patientId);

            PatientsPanel.Visible = true;
        }

        /// <summary>
        /// Updates the Patient assoication for the specificed Repeater, i.e., list of patient institutions
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="rptr"></param>
        private void UpdatePatientRptr(int patientId, Repeater rptr)
        {
            foreach (RepeaterItem item in rptr.Items)
            {
                ICaisisInputControl foreignKeyField = item.FindControl("ForeignKeyField") as ICaisisInputControl;
                ICaisisInputControl primaryKeyField = item.FindControl("PrimaryKeyField") as ICaisisInputControl;
                CheckBox isAssociated = item.FindControl("AssociateCheckBox") as CheckBox;
                if (isAssociated.Checked)
                {
                    // only add association if none exists
                    if (string.IsNullOrEmpty(primaryKeyField.Value))
                    {
                        IBusinessObject biz = BusinessObjectFactory.BuildBusinessObject(primaryKeyField.Table);
                        // set keys (i.e, InstitutionId + PatientId)
                        biz[foreignKeyField.Field] = int.Parse(foreignKeyField.Value);
                        biz[Patient.PatientId] = patientId;
                        biz.Save();

                        primaryKeyField.Value = biz[biz.PrimaryKeyName].ToString();
                    }
                }
                else
                {
                    // remove if assocaition exists
                    if (!string.IsNullOrEmpty(primaryKeyField.Value))
                    {
                        IBusinessObject biz = BusinessObjectFactory.BuildBusinessObject(primaryKeyField.Table);
                        // delete by pri key (i.e., PatientInstitutionId)
                        int priKey = int.Parse(primaryKeyField.Value);
                        biz.Delete(priKey);

                        primaryKeyField.Value = biz[biz.PrimaryKeyName].ToString();

                    }
                }
            }
        }

        private void BuildPatientList(string search)
        {
            string searchType = SearchOptionsDropdown.Value;
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            PatientController pc = new PatientController();
            SearchController sc = new SearchController();
            UserController uc = new UserController();

            DataTable searchResults = new DataTable();
            SearchController ct = new SearchController();
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            bool canViewIdentifiers = uc.CanViewPatientIdentifiers();
            bool searchByLastNameMRN = canViewIdentifiers && searchType == PatientController.LAST_NAME_MRN_IDENTIFIER;
            if (searchByLastNameMRN)
            {
                searchResults = sc.FindPatient(search, datasetSql).Tables[0];
            }
            else
            {
                searchResults = ct.FindPatientByIdentifier(search, searchType, datasetSQL).Tables[0];
            }

            var results = from p in searchResults.AsEnumerable()
                          let pid = (int)p[Patient.PatientId]
                          let fName = p[Patient.PtFirstName].ToString()
                          let lName = p[Patient.PtLastName].ToString()
                          let fullName = pc.GetPatientName(fName, lName, false)
                          let mrn = pc.GetPatientMRN(p[Patient.PtMRN].ToString())
                          let identifier = canViewIdentifiers && searchByLastNameMRN ? mrn : pc.GetPatientIdentifier(pid, searchType)
                          let displayName = canViewIdentifiers ? fullName : ""
                          let patient = new
                          {
                              PatientName = displayName,
                              Identifier = identifier,
                              PatientId = pid,
                              EncPatientId = Security.CustomCryptoHelper.Encrypt(pid.ToString())
                          }
                          orderby patient.PatientName ascending
                          select patient;
            PatientsRptr.DataSource = results;
            PatientsRptr.DataBind();
        }

        private void BuildPatientInstitutions(int patientId)
        {
            var allInstitutions = BOL.BusinessObject.GetAll<BOL.Institution>();
            var patientInstitutions = BOL.BusinessObject.GetByFields<BOL.PatientInstitution>(new Dictionary<string, object> { { BOL.PatientInstitution.PatientId, patientId } });
            var nonAssignedPatientInstitutions = from i in allInstitutions
                                                 join pi in patientInstitutions on (int)i[BOL.Institution.InstitutionId] equals (int)pi[BOL.PatientInstitution.InstitutionId] into leftJoin
                                                 let entry = new
                                                 {
                                                     InstitutionId = (int)i[BOL.Institution.InstitutionId],
                                                     InstitutionName = i[BOL.Institution.Institution_Field].ToString(),
                                                     PatientInstitutionId = leftJoin.Count() > 0 ? leftJoin.First()[BOL.PatientInstitution.PatientInstitutionId].ToString() : ""
                                                 }
                                                 orderby !string.IsNullOrEmpty(entry.PatientInstitutionId) ? 0 : 1, entry.InstitutionName ascending
                                                 select entry;

            InstitutionsRptr.DataSource = nonAssignedPatientInstitutions;
            InstitutionsRptr.DataBind();
        }

        private void BuildPatientDiseases(int patientId)
        {
            var allDiseases = BOL.BusinessObject.GetAll<BOL.Disease>();
            var patientDiseases = BOL.BusinessObject.GetByFields<BOL.PatientDisease>(new Dictionary<string, object> { { BOL.PatientDisease.PatientId, patientId } });
            var nonAssignedDiseases = from i in allDiseases
                                      join pi in patientDiseases on (int)i[BOL.Disease.DiseaseId] equals (int)pi[BOL.PatientDisease.DiseaseId] into leftJoin
                                      let entry = new
                                      {
                                          DiseaseId = (int)i[BOL.Disease.DiseaseId],
                                          DiseaseName = i[BOL.Disease.DiseaseName].ToString(),
                                          PatientDiseaseId = leftJoin.Count() > 0 ? leftJoin.First()[BOL.PatientDisease.PatientDiseaseId].ToString() : ""
                                      }
                                      orderby !string.IsNullOrEmpty(entry.PatientDiseaseId) ? 0 : 1, entry.DiseaseName ascending
                                      select entry;

            DiseasesRptr.DataSource = nonAssignedDiseases;
            DiseasesRptr.DataBind();
        }
    }
}
