using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.SessionState;
using System.Xml;

//using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.Security;

using System.Linq;


namespace Caisis.Controller
{
    /// <summary>
    /// Handles logic between UI and DA for patient transactions including inserts, updates, validation, and placement into correct datasets(patient populations).
    /// </summary>
    public class PatientController //: UniqueConstraintsController
    {

        /// <summary>
        /// The character used to mask Patient identifiers
        /// </summary>
        private static readonly char BLINDED_PATIENT_MASK_CHAR = 'x';

        /// <summary>
        /// The number of characters to mask Patient identifiers
        /// </summary>
        private static readonly int BLINDED_PATIENT_MASK_AMOUNT = 10;

        /// <summary>
        /// defines the default identifier type for the Patient (default MRN)
        /// </summary>
        public static readonly string LAST_NAME_MRN_IDENTIFIER = "LastNameMRN";

        private PatientDa _pda;
        private Security.SecurityController _sc = new Caisis.Security.SecurityController();
        private UserController _uc;

        private bool CanViewIdentifiers
        {
            get
            {
                if (_uc == null)
                {
                    _uc = new UserController();
                }
                return _uc.CanViewPatientIdentifiers();
            }
        }

        public PatientController()
        {
            _pda = new PatientDa();
        }

		// TODO: MIGRATION - DELETE ME
        /// <summary>
        /// Main method for ensuring Patient in Session matches the Patient represented in the current Page.
        /// Places Patient (as specified by Patient Biz) in Session (if needed), Log's Patient View (if needed) and updates header via client script.
        /// </summary>
        /// <param name="page">The current Page which contains relevant Session</param>
        /// <param name="ptBiz">The Patient BusinessObject representing the current Patient</param>
        public void PutPatientInSession(Page page, Patient ptBiz)
        {
            int patientId = (int)ptBiz[Patient.PatientId];

            // Get Current Session
            HttpSessionState _session = page.Session;

            // Load SessionHandler for setting/reseting SESSION varaibles
            SessionHandler sHandler = new SessionHandler(_session);

            // LOG PATIENT VIEW AND SET PATIENT IN SESSION (if needed)
            // If no patient in session or patient is session != current, then log view and update session
            if (!sHandler.VerifyPatientInSession(ptBiz))
            {
                // get encrypted patient id
                string encPatientId = Security.CustomCryptoHelper.Encrypt(patientId.ToString());

                // log that user is viewing Patient
                UserController uController = new UserController(_session);
                uController.ViewPatient(patientId);

                // update Patient in Session
                sHandler.UpdateSessionPatientInfo(ptBiz);

                // SET PATIENT IN HEADER (UI) - generate client script for syncing header info
                // Check if patient is Deceased 
                string isDeceased = this.IsPatientDeceased(ptBiz).ToString().ToLower();

                // HANDLE SPECIAL CASE for identifiers (default to mrn)
                string identifierField = string.Empty;// _session[SessionKey.PtMRN].ToString();
                UserController uc = new UserController(page.Session);
                if (uc.HasDefaultIdentifierType())
                {
                    string idType = uc.GetDefaultIdentifierType();
                    if (!string.IsNullOrEmpty(idType))
                    {
                        identifierField = GetPatientIdentifier(patientId, idType);
                    }
                    else
                    {
                        identifierField = GetPatientMRN(ptBiz);
                    }
                }
                else
                {
                    identifierField = GetPatientMRN(ptBiz);
                }

                // build a list of client arguments, with single quotes escaped
                string[] clientScriptArgumentsList = new string[] 
                { 
                    GetPatientFirstName(ptBiz), 
                    GetPatientLastName(ptBiz), 
                    identifierField, 
                    GetPatientDateOfBirth(ptBiz),
                    encPatientId
                };
                for (int i = 0; i < clientScriptArgumentsList.Length; i++)
                {
                    string identifier = clientScriptArgumentsList[i];
                    clientScriptArgumentsList[i] = PageUtil.EscapeSingleQuotes(identifier);
                }
                // generates 'a','b','c','d'
                string clientScriptArguments = "'" + string.Join("','", clientScriptArgumentsList) + "'";
                // function which sets patient header
                string clientScriptName = "top.changePatientInHeader";
                // full client script,i.e., if(f) { f(a,b,c..); }
                string fullClientScript = "if(" + clientScriptName + ") { " + clientScriptName + "(" + clientScriptArguments + "," + isDeceased + "); }";
                page.ClientScript.RegisterStartupScript(page.GetType(), "RegsiterPatientInSession", fullClientScript, true);
            }
        }

        /// <summary>
        /// Main method for ensuring Patient in Session matches the Patient represented in the current Page.
        /// Places Patient (as specified by patientId) in Session (if needed), Log's Patient View (if needed) and updates header via client script.
        /// </summary>
        /// <param name="page">The current Page which contains relevant Session</param>
        /// <param name="patientId">The primary key of the Patient to load into Session</param>
        public void PutPatientInSession(Page page, int patientId)
        {
            // LOAD PATIENT RECORD
            Patient ptBiz = new Patient();
            ptBiz.Get(patientId);
            // update relevant fields
            PutPatientInSession(page, ptBiz);
        }

        public string msgInsertConflictWithMovePermission(string MRN, string patientLastName)
        {
            string msg = "Another patient with the MRN " + MRN + " and the Last Name " + patientLastName + " already exists in another dataset.<br/><br/>Click the Move Button below to include this patient in your dataset as well.";
            return msg;
        }

        public string msgInsertConflictWithOtherDataset()
        {
            string msg = "Another patient with the same MRN already exists in another dataset.<br/><br/>If you would like to include this patient in your dataset, please contact the system admin.";
            return msg;
        }

        public string msgInsertConflictWithMRNAndLastNameMismatch()
        {
            string msg = "Another patient with the same MRN, but a different last name already exists.";
            return msg;
        }

        protected string msgInsert()
        {
            string msg = "Another patient with the same MRN already exists in your dataset.<br/><br/>Please use another MRN or check for duplicate entry.";
            return msg;
        }

        protected string msgUpdate()
        {
            string msg = "Select a new MRN, another patient with the same MRN already exists in the datbase.";
            return msg;
        }

        public int InsertRecord(DataSet args)
        {
            return -1;
        }

        /// <summary>
        /// Return patient record using MRN
        /// </summary>
        /// <param name="mrn"></param>
        /// <returns></returns>
        public DataTable GetPatientByMRN(string mrn)
        {
            return _pda.GetPatientByMRN(mrn);
        }

        /// <summary>
        /// Validates MRN is not already in use
        /// </summary>
        /// <param name="mrn"></param>
        /// <returns></returns>
        public bool IsNewMRN(string mrn, int datasetId)
        {
            // call spValidateMRN(mrn); if rowcount > 0 then MRN already exists	
            DataTable ptDt = this.GetPatientByMRN(mrn);

            if (ptDt != null && ptDt.Rows.Count > 0)
            {
                // is the patient in the users current dataset? 
                int patientId = int.Parse(ptDt.Rows[0][Patient.PatientId].ToString());
                
                if(IsPatientInDataSet(patientId, datasetId))
                {
                    // tell user this patient is already in this dataset
                    throw new ClientException(this.msgInsert());
                }
 
                throw new ClientException(msgInsertConflictWithOtherDataset());
            }

            return true;
        }

        
        public bool IsNewPatient(string enteredMrn, string enteredLastName, int datasetId)
        {
            // call spValidateMRN(mrn); if rowcount > 0 then MRN already exists	
            DataTable ptDt = this.GetPatientByMRN(enteredMrn);

            if (ptDt != null && ptDt.Rows.Count > 0)
            {
               
                int patientId = int.Parse(ptDt.Rows[0][Patient.PatientId].ToString());
                string ptMRN = ptDt.Rows[0][Patient.PtMRN].ToString();
                string ptLastName = ptDt.Rows[0][Patient.PtLastName].ToString();

                // is the patient in the users current dataset? 
                if (IsPatientInDataSet(patientId, datasetId))
                {
                    // tell user this patient is already in this dataset
                    throw new ClientException(this.msgInsert());
                }
                else
                {
                    // does user have permission to move patients between datasets?
                    if (PermissionManager.HasPermission(PermissionManager.MovePatient) && enteredLastName.ToUpper().Equals(ptLastName.ToUpper()))
                    {
                        string exception = this.msgInsertConflictWithMovePermission(ptMRN, ptLastName.ToUpper());
                        throw new ClientException(exception);
                    }
                    else
                    {
                        throw new ClientException(msgInsertConflictWithOtherDataset());
                    }
                }
            }

            return true;
        }

        public bool IsPatientInDataSet(int patientId, int datasetId)
        {
            string datasetSql = CacheManager.GetDatasetSQL(datasetId);

            DataTable dt = new DataTable();
            dt = _pda.GetPatientById(patientId, datasetSql);

            if (dt.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /*
                public DataTable GetOrDimensions(int datasetId)  
                {
                    DataSetController dsCt = new DataSetController();
                    XmlNode dataSet = dsCt.FindDatasetNode(datasetId);

                    DataTable dt = this.GetDimensionTable();
                    this.ProcessOrChildren(dataSet, dt, "or");
                    return dt;
                }
        */
        public DataSet InsertNewPatientRecord(Patient patient, int datasetId)
        {
            SqlTransaction trans = null;
            DataSet ds = new DataSet();

            try
            {
                trans = DataAccessHelper.BeginTransaction();
                //  v4 SAVING OF PATIENT IS NO LONGER PART OF THIS TRANSACTION 
                // (but if insert of patient fails, the insert of the dimensions will fail since there will be no primary key)
                if (IsNewPatient(patient[Patient.PtMRN].ToString(), patient[Patient.PtLastName].ToString(), datasetId))
                {
                    patient.Save();
                    int patientId = (int)patient[Patient.PatientId];

                    DataTable dt = this.InsertDatasetDimensions(patientId, datasetId, trans);
                    if (dt != null)
                    {
                        ds.Tables.Add(dt);
                    }

                    trans.Commit();
                }
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                throw (ex);
            }
            finally
            {
                if (trans != null)
                {
                    SqlConnection conn = trans.Connection;
                    trans.Dispose();
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
            }
            return ds;
        }

        /*public DataSet InsertRecord(DataSet args, int datasetId)
        {

            //
            //DataTable orDims = this.GetOrDimensions(datasetId);
            //if (orDims.Rows.Count > 0)  
            //{
            //    DataSet ds = new DataSet();
            //  ds.Tables.Add(orDims);
            //    return ds;
            //}
            //

            SqlTransaction trans = null;
            DataRow dr = args.Tables[0].Rows[0];
            try
            {
                trans = DataAccessHelper.BeginTransaction();
                int patientId = (int)this._InsertRecord(dr, trans);

                Patient pt = new Patient();
                DataTable dt = this.InsertDatasetDimensions(patientId, datasetId, trans);
                if (dt != null)
                {
                    args.Tables.Add(dt);
                }
                trans.Commit();
                dr[Patient.PatientId] = patientId;
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                throw (ex);
            }
            finally
            {
                if (trans != null)
                {
                    SqlConnection conn = trans.Connection;
                    trans.Dispose();
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
            }
            return args;
        }
        */

        /// <summary>
        /// Returns a list of DataTables representing the OR dimension groups of a dataset
        /// </summary>
        /// <param name="datasetId"></param>
        /// <returns></returns>
        public DataSet GetPatientDatasetOrDimensions(int datasetId)
        {
            DataSet ds = new DataSet();

            DataSetController ct = new DataSetController();
            // for current dataset get list of or dimensions
            XmlNode dsNode = ct.FindDatasetNode(datasetId);
            if (dsNode != null)
            {
                XmlNodeList dimNodes = dsNode.SelectNodes("dimGroup[@operator='or']");
                for (int i = 0; i < dimNodes.Count; i++)
                {
                    XmlNode dimNode = dimNodes[i];
                    DataTable dt = this.GetDimensionTable();
                    dt.TableName = dt.TableName + "_" + i;
                    this.ProcessOrChildren(dimNode, dt, "or");
                    ds.Tables.Add(dt);
                }
            }
            return ds;
        }

        // v4 moved here from UniqueConstraintController to get page to compile
        protected int _InsertRecord(DataRow dr, SqlTransaction trans)
        {
            // this.ValidateUniqueInsert(dr);
            // return base._InsertRecord(dr, trans); //base of UniqueConstraintController was DataEntryController. 
            return -1;
        }

        public void InsertOrDatasetDimensions(DataTable dt, int patientId)
        {
            SqlTransaction trans = null;
            try
            {
                //must add trans logic here too -2/21 spy
                trans = DataAccessHelper.BeginTransaction();
                foreach (DataRow dr in dt.Rows)
                {
                    InsertDimension(dr, patientId, trans);
                }
                trans.Commit();
            }
            catch (Exception ex)
            {
                if (trans != null)
                {
                    trans.Rollback();
                }
                //PatientDa ptda = new PatientDa();
                // v4 _pda.DeleteRecord(patientId);
                throw (ex);
            }
            finally
            {
                if (trans != null)
                {
                    SqlConnection conn = trans.Connection;
                    trans.Dispose();
                    if (conn != null)
                    {
                        conn.Close();
                    }
                }
            }
        }


        public DataTable InsertDatasetDimensions(int patientId, int datasetId, SqlTransaction trans)
        {
            DataSetController dsCt = new DataSetController();
            XmlNode dataSet = dsCt.FindDatasetNode(datasetId);

            DataTable dt = ProcessChildren(dataSet, patientId, trans);

            return dt;
        }

        private DataRow AttributesToRow(XmlAttributeCollection atts)
        {
            DataTable dt = this.GetDimensionTable();
            DataRow dr = dt.NewRow();
            foreach (XmlAttribute att in atts)
            {
                dr[att.Name] = att.Value;
            }
            return dr;
        }

        private void InsertDimension(object atts, int patientId, SqlTransaction trans)
        {
            DataRow dr;
            if (atts is XmlNode)
            {
                dr = this.AttributesToRow(((XmlNode)atts).Attributes);
            }
            else
            {
                dr = (DataRow)atts;
            }

            string dimType = (string)dr["type"];

            switch (dimType)
            {
                case "Institution":
                    InstitutionDa ida = new InstitutionDa();
                    int institutionId = ida.GetPrimKey((string)dr["value"]);
                    this._CheckId(institutionId, dimType, dr);
                    PatientInstitutionDa pida = new PatientInstitutionDa();

                    if (VerifyUnique((pida.GetPatientInstitution(patientId, institutionId, trans)).Tables[0]))
                    {
                        // NEW CODE, insert record though middle tier
                        PatientInstitution ptInstitution = new PatientInstitution();
                        ptInstitution[PatientInstitution.PatientId] = patientId;
                        ptInstitution[PatientInstitution.InstitutionId] = institutionId;
                        ptInstitution.Save();

                        // OLD CODE, inserts now handled by middle tier
                        // pida.InsertPatientInstitution(patientId, institutionId, trans);  add trans logic after concurrency fully tested- spy 2/21
                        // pida.InsertPatientInstitution(patientId, institutionId, trans);
                    }
                    break;

                case "Physician":
                    PhysicianDa pda = new PhysicianDa();
                    //to get Physician primary key need to pass first and last name in from dataset defined in XML
                    int physicianId = pda.GetPrimKey((string)dr["value"], (string)dr["value2"]);
                    this._CheckId(physicianId, dimType, dr);

                    PatientPhysicianDa ppda = new PatientPhysicianDa();
                    if (VerifyUnique((ppda.ValidatePatientPhysician(patientId, physicianId)).Tables[0]))
                    {
                        // NEW CODE, insert record though middle tier
                        PatientPhysician ptPhysician = new PatientPhysician();
                        ptPhysician[PatientPhysician.PatientId] = patientId;
                        ptPhysician[PatientPhysician.PhysicianId] = physicianId;
                        ptPhysician.Save();

                        // OLD CODE, inserts now handled by middle tier
                        //should be creating Patient Physician biz object and passing object to PatientPhysicianDa  
                        //ppda.InsertPatientPhysicianDimension(patientId, physicianId, _sc.GetUserName(), trans);
                    }
                    break;

                case "Protocol":
                    ProtocolDa protDa = new ProtocolDa();
                    int protocolId = protDa.GetPrimKey((string)dr["value"]);
                    this._CheckId(protocolId, dimType, dr);

                    PatientProtocolDa ptProtDa = new PatientProtocolDa();
                    if (VerifyUnique((ptProtDa.ValidatePatientProtocol(patientId, protocolId)).Tables[0]))
                    {
                        // NEW CODE, insert record though middle tier
                        PatientProtocol ptProtocol = new PatientProtocol();
                        ptProtocol[PatientProtocol.PatientId] = patientId;
                        ptProtocol[PatientProtocol.ProtocolId] = protocolId;
                        ptProtocol.Save();

                        // OLD CODE, inserts now handled by middle tier
                        //ptProtDa.InsertPatientProtocolDimension(patientId, protocolId, _sc.GetUserName(), trans);
                    }
                    break;

                case "Disease":
                    DiseaseDa disDa = new DiseaseDa();
                    int diseaseId = disDa.GetPrimKey((string)dr["value"]);
                    this._CheckId(diseaseId, dimType, dr);

                    PatientDiseaseDa ptDiseaseDa = new PatientDiseaseDa();
                    if (VerifyUnique((ptDiseaseDa.GetPatientDisease(patientId, diseaseId)).Tables[0]))
                    {
                        // NEW CODE, insert record though middle tier
                        PatientDisease ptDisease = new PatientDisease();
                        ptDisease[PatientDisease.PatientId] = patientId;
                        ptDisease[PatientDisease.DiseaseId] = diseaseId;
                        ptDisease.Save();

                        // OLD CODE, inserts now handled by middle tier
                        //ptDiseaseDa.InsertPatientDisease(patientId, diseaseId, trans);
                    }
                    break;
            }
        }

        // v4 moved here from DataEntryController which was excluded to get this class to compile
        protected bool VerifyUnique(DataTable dt)
        {
            if (dt.Rows.Count == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public DataTable GetDimensionTable()
        {
            DataTable dt = new DataTable("OrDatasetDimensions");
            dt.Columns.Add(new DataColumn("type", typeof(System.String)));
            dt.Columns.Add(new DataColumn("value", typeof(System.String)));
            dt.Columns.Add(new DataColumn("value2", typeof(System.String)));
            return dt;
        }

        /// <summary>
        /// Returns if a patient is decased, if their deathdatetext != ''
        /// </summary>
        /// <param name="biz">Patient Business Object</param>
        /// <returns>whether a patient is deceased</returns>
        public bool IsPatientDeceased(Patient biz)
        {
            string deathDate = biz[Patient.PtDeathDateText].ToString();
            return !string.IsNullOrEmpty(deathDate);
        }

        /// <summary>
        /// Gets wheather a Patient (by patientId) is deceased
        /// </summary>
        /// <param name="patientId">The PatientId of the patient being checked</param>
        /// <returns>whether a patient is deceased</returns>
        public bool IsPatientDeceased(int patientId)
        {
            Patient biz = new Patient();
            biz.Get(patientId);
            return IsPatientDeceased(biz);
        }

        private DataTable InsertGroup(XmlNode dimNod, int patientId, SqlTransaction trans)
        {
            DataTable dt = null; ;
            string opStr = dimNod.Attributes["operator"].Value.ToLower();
            if (opStr.Equals("or"))
            {
                dt = this.GetDimensionTable();
                this.ProcessOrChildren(dimNod, dt, opStr);
                return dt;
            }
            else
            {
                this.ProcessChildren(dimNod, patientId, trans);
                return null;
            }
        }

        private void ProcessOrChildren(XmlNode nodAdult, DataTable dt, string opStr)
        {
            XmlNode dimChild = nodAdult.FirstChild;
            bool firstAndChild = true;
            while (dimChild != null)
            {
                if (dimChild.Name.Equals("dimension"))
                {
                    if (opStr.Equals("or"))
                    {
                        DataRow dr = dt.NewRow();
                        dr["type"] = dimChild.Attributes["type"].Value;
                        dr["value"] = dimChild.Attributes["type"].Value + ":" + dimChild.Attributes["value"].Value;
                        if (dimChild.Attributes["value2"] != null)
                        {
                            dr["value"] += " " + dimChild.Attributes["value2"].Value;
                        }

                        dt.Rows.Add(dr);
                    }
                    else if (opStr.Equals("and"))
                    {
                        if (firstAndChild)
                        {
                            firstAndChild = false;
                            DataRow dr = dt.NewRow();
                            dr["type"] = dimChild.Attributes["type"].Value;
                            dr["value"] = dimChild.Attributes["type"].Value + ":" + dimChild.Attributes["value"].Value;
                            if (dimChild.Attributes["value2"] != null)
                            {
                                dr["value"] += " " + dimChild.Attributes["value2"].Value;
                            }
                            dt.Rows.Add(dr);
                        }
                        else
                        {
                            DataRow dr = dt.Rows[dt.Rows.Count - 1];
                            dr["Value"] += " & " + dimChild.Attributes["type"].Value + ":" + dimChild.Attributes["value"].Value;
                            if (dimChild.Attributes["value2"] != null)
                            {
                                dr["value"] += " " + dimChild.Attributes["value2"];
                            }
                        }
                    }
                }
                else if (dimChild.Name.Equals("dimGroup"))
                {
                    string childOp = dimChild.Attributes["operator"].Value.ToLower();
                    ProcessOrChildren(dimChild, dt, childOp);
                }
                dimChild = dimChild.NextSibling;
            }
        }

        private DataTable ProcessChildren(XmlNode nodAdult, int patientId, SqlTransaction trans)
        {
            XmlNode dimChild = nodAdult.FirstChild;

            DataTable dt = null;

            while (dimChild != null)
            {
                if (dimChild.Name.Equals("dimension"))
                {
                    this.InsertDimension(dimChild, patientId, trans);
                }
                else if (dimChild.Name.Equals("dimGroup"))
                {
                    dt = this.InsertGroup(dimChild, patientId, trans);
                }
                dimChild = dimChild.NextSibling;
            }	//end inside while loop

            return dt;
        }


        protected DataTable GetUniqueCriteria(DataRow dr)
        {
            DataTable dt = (_pda.GetPatientByMRN(dr[Patient.PtMRN].ToString()));

            return dt;
        }

        private void _CheckId(int id, string type, DataRow dr)
        {
            if (id == -1)
            {
                string msg = type + " " + dr["value"].ToString();
                if (dr["value2"] != DBNull.Value && !dr["value2"].ToString().Equals(""))
                {
                    msg += " " + dr["value2"].ToString();
                }
                msg += " does not exist in our database, please fix dataset XML.  Patient not saved.";
                throw new ClientException(msg);
            }
        }

        /// <summary>
        /// Returns the Patient Identifier (by IdType) for the Patient (by PatientId)
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="idType"></param>
        /// <returns></returns>
        public string GetPatientIdentifier(int patientId, string idType)
        {
            //if (idType == LAST_NAME_MRN_IDENTIFIER || string.IsNullOrEmpty(idType))
            //{
            //    Patient biz = new Patient();
            //    biz.Get(patientId);
            //    return biz[Patient.PtMRN].ToString();
            //}
            //else
            {
                IdentifierDa da = new IdentifierDa();
                return da.GetPatientIdentifierByIdType(patientId, idType);
            }
        }

        /// <summary>
        /// Returns the Patient's name in a standard format, i.e., "John Smith",
        /// accounting for User's View Patient Identifier Permission.
        /// </summary>
        /// <param name="biz">The Patient BO containing the naming information.</param>
        /// <returns>A formatted patient display name.</returns>
        public string GetPatientName(Patient biz)
        {
            return GetPatientName(biz, true);
        }

        /// <summary>
        /// Returns the Patient's name in a standard format, i.e., "John Smith" (useStandardNaming=true),
        /// or "Smith, John" (useStandardNaming=false) accounting for User's View Patient Identifier Permission.
        /// </summary>
        /// <param name="biz">The Patient BO containing the naming information.</param>
        /// <param name="useStandardNaming">Whether or not to use the standard, "FirstName LastName" naming convention.</param>
        /// <returns>A formatted patient display name.</returns>
        public string GetPatientName(Patient biz, bool useStandardNaming)
        {
            return GetPatientName(biz[Patient.PtFirstName].ToString(), biz[Patient.PtLastName].ToString(), useStandardNaming);
        }

        /// <summary>
        /// Returns the Patient's name in a standard format, i.e., "John Smith" (useStandardNaming=true),
        /// or "Smith, John" (useStandardNaming=false) accounting for User's View Patient Identifier Permission.
        /// </summary>
        /// <param name="ptFirstName">The Patient's first name</param>
        /// <param name="ptLastName">The Patient's last name</param>
        /// <param name="useStandardNaming">Whether or not to use the standard, "FirstName LastName" naming convention.</param>
        /// <returns>A formatted patient display name.</returns>
        public string GetPatientName(string ptFirstName, string ptLastName, bool useStandardNaming)
        {
            // get computed names to account for view patient identifier permission
            string first = GetPatientFirstName(ptFirstName);
            string last = GetPatientLastName(ptLastName);
            // determine formatting

            // has first name
            if (!string.IsNullOrEmpty(first))
            {
                // has last name, determine special format
                if (!string.IsNullOrEmpty(last))
                {
                    if (useStandardNaming)
                    {
                        // i.e., "John Smith"
                        return string.Format("{0} {1}", first, last);
                    }
                    else
                    {
                        // i.e., "Smith, John"
                        return string.Format("{0}, {1}", last, first);
                    }
                }
                // no last name, return first name
                else
                {
                    return first;
                }
            }
            // no first name, but valid last name
            else if (!string.IsNullOrEmpty(last))
            {
                // no first name, return last name
                return last;
            }
            // no valid first or last name
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="biz"></param>
        /// <returns></returns>
        public string GetPatientLastName(Patient biz)
        {
            return GetPatientLastName(biz[Patient.PtLastName].ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ptLastName"></param>
        /// <returns></returns>
        public string GetPatientLastName(string ptLastName)
        {
            return GetBlindedPatientIdentifier(ptLastName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="biz"></param>
        /// <returns></returns>
        public string GetPatientFirstName(Patient biz)
        {
            return GetPatientFirstName(biz[Patient.PtFirstName].ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ptFirstName"></param>
        /// <returns></returns>
        public string GetPatientFirstName(string ptFirstName)
        {
            return GetBlindedPatientIdentifier(ptFirstName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="biz"></param>
        /// <returns></returns>
        public string GetPatientMiddleName(Patient biz)
        {
            return GetPatientMiddleName(biz[Patient.PtMiddleName].ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ptMiddleName"></param>
        /// <returns></returns>
        public string GetPatientMiddleName(string ptMiddleName)
        {
            return GetBlindedPatientIdentifier(ptMiddleName);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="biz"></param>
        /// <returns></returns>
        public string GetPatientMRN(Patient biz)
        {
            return GetPatientMRN(biz[Patient.PtMRN].ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ptMRN"></param>
        /// <returns></returns>
        public string GetPatientMRN(string ptMRN)
        {
            return GetBlindedPatientIdentifier(ptMRN);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="biz"></param>
        /// <returns></returns>
        public string GetPatientDateOfBirth(Patient biz)
        {
            return GetPatientDateOfBirth(biz[Patient.PtBirthDateText].ToString());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="ptDOB"></param>
        /// <returns></returns>
        public string GetPatientDateOfBirth(string ptDOB)
        {
            return GetBlindedPatientIdentifier(ptDOB);
        }

        /// <summary>
        /// If a User can view Identifiers, return original string, else return blinded value
        /// </summary>
        /// <param name="idValue">The original identifier value.</param>
        /// <returns>The identified value computed by View Patient Identifier permission</returns>
        private string GetBlindedPatientIdentifier(string idValue)
        {
            if (CanViewIdentifiers)
            {
                return idValue;
            }
            else
            {
                // create a masked array of characters representing the blinded identifier
                // masked identifier should be consistent (i.e., fixed) in order to not reveal string length
                // i.e., "Smith" -> "xxxxxxxxxx"
                //       "ABC123DEF456GHI789" -> "xxxxxxxxxx"
                var blindedCharacters = from mask in Enumerable.Range(0, BLINDED_PATIENT_MASK_AMOUNT)
                                        select BLINDED_PATIENT_MASK_CHAR;

                // create a string out of blinded characters
                string blindedIdentifier = new string(blindedCharacters.ToArray());
                return blindedIdentifier;
            }
        }

        /// <summary>
        /// Returns if the Patient has no constraints on child tables preventing deletion. (true=no constraints)
        /// </summary>
        /// <param name="patientId">The PatientId of the patient to check</param>
        /// <returns>Returns true if there are no restictions on child tables preventing deletion.</returns>
        public bool ValidatePatientDeleteNoConstraints(int patientId)
        {
            bool hasNoConstraints = ValidatePatientDeleteConstraints(patientId).Rows.Count == 0;
            return hasNoConstraints;
        }

        /// <summary>
        /// Returns a Table which represent the TableName and TableCount of tables and respecitive records
        /// which must be deleted manually before deleting the patient record. 0 rows =no restrictions
        /// </summary>
        /// <param name="patientId">The PatientId of the patient to check</param>
        /// <returns>A table containing TableName, TableCount of child table constraints.</returns>
        public DataTable ValidatePatientDeleteConstraints(int patientId)
        {
            PatientDa da = new PatientDa();
            DataTable dt = da.ValidatePatientDeletion(patientId).Tables[0];
            return dt;
        }
    }
}
