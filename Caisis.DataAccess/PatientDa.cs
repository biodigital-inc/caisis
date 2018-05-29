using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

using System.Linq;
using System.Xml;
using System.Xml.Linq;




namespace Caisis.DataAccess
{
    /// <summary>
    /// Calls to the database directly related to patients other than standard CRUD
    /// </summary>
    public class PatientDa : BaseDA
    {

        /// <summary>
        /// Populates all drop down menus other than clinic and last name: Categories, Protocols, Contact Status and Referring Physician
        /// </summary>
        /// <param name="dataSetId">sql string DatasetId in Session</param>
        /// <param name="listName">List name, eg, Protocol, Category..</param>
        /// <param name="listValue">The selected option, eg, 00-290 (protocol value)</param>
        /// <param name="orderBy">Order by defaults to alphabetical</param>
        /// <param name="startRow">Start row for lists greater than 200</param>
        /// <param name="numRows">The number of rows to display</param>
        /// <returns>Dataset of patients that match criteria name and type and in working dataset</returns>
        public DataSet ListPatients(string dataSet, string listName, string listValue, string listModifier, string orderBy,
            int startRow, int numRows, string listUser)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spListPatients");
            DataAccessHelper.AddLongStringInputParam(com, "DataSet", dataSet);
            DataAccessHelper.AddStringInputParam(com, "listName", listName);
            DataAccessHelper.AddStringInputParam(com, "listValue", listValue);

            if (listModifier != null && !listModifier.Equals(""))
            {
                DataAccessHelper.AddStringInputParam(com, "listModifier", listModifier);
            }
            if (orderBy != null && !orderBy.Equals(""))
            {
                DataAccessHelper.AddStringInputParam(com, "orderByField", orderBy);
            }
            if (listUser != null && !listUser.Equals(""))
            {
                DataAccessHelper.AddStringInputParam(com, "UserName", listUser);
            }

            return DataAccessHelper.GetList(com, startRow, numRows);
        }


        /// <summary>
        /// Called by Admin. Does not query based on DataSet. Accepts Wildcards.
        /// </summary>
        /// <param name="lastName"></param>
        /// <returns></returns>
        public DataTable GetPatientsByLastName(string lastName)
        {
            DataTable dt = new DataTable();
            if (lastName.ToLower().Contains("delete"))
            {
                return dt;
            }
            else
            {
                string sql = "SELECT PatientId, COALESCE(PtLastName,'') + ', ' + COALESCE (PtMiddleName, '') + ' ' + COALESCE(PtFirstName, '') AS PatientName FROM Patients WHERE PtLastName Like '" + lastName + "' ORDER BY PtLastName ASC";
                DataAccessHelper.ExecuteSqlSelect(sql, dt);
                return dt;
            }
        }

        public DataSet FindPatient(string strFind, string dataSet)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFindPatient");
            DataAccessHelper.AddStringInputParam(com, "strFind", strFind);
            DataAccessHelper.AddLongStringInputParam(com, "dataSet", dataSet);
            return DataAccessHelper.GetList(com);
        }

        public DataSet FindPatientByIdentifier(string strFind, string idType, string dataSet)
        {
            // special case
            if (idType == "Study Id")
            {
                return FindPatientByStudyId(strFind, dataSet);
            }
            else
            {
                SqlCommand com = DataAccessHelper.CreateCommand("spFindPatient");
                DataAccessHelper.AddStringInputParam(com, "strFind", strFind);
                DataAccessHelper.AddStringInputParam(com, "strIdType", idType);
                DataAccessHelper.AddLongStringInputParam(com, "dataSet", dataSet);
                return DataAccessHelper.GetList(com);
            }
        }

        #region Custom Identifier Search

        /// <summary>
        /// Find a list of patients by Study Id (Identifiers.Identifier or PatientProtocols.PtProtocolStudyId
        /// </summary>
        /// <param name="strFind"></param>
        /// <param name="dataSet"></param>
        /// <returns></returns>
        public DataSet FindPatientByStudyId(string strFind, string dataSet)
        {
            string sql = @"
            SELECT DISTINCT
                a.PtMRN,
                a.PtLastName,
                a.PtFirstName,
                a.PatientId,
                a.PtBirthDateText,
                a.PtTitle,
                a.PtSuffix,
                a.PtMiddleName,
                ISNULL(b.Identifier, c.PtProtocolStudyId) AS Identifier
            FROM ({0}) AS a
            LEFT OUTER JOIN Identifiers AS b
	            ON a.PatientId = b.PatientId AND IdType = 'Study Id' 
            LEFT OUTER JOIN PatientProtocols c
	            ON a.PatientId = c.PatientId
            WHERE
	            b.Identifier LIKE @strFindParam OR c.PtProtocolStudyId LIKE @strFindParam
            ORDER BY
	            ISNULL(b.Identifier, c.PtProtocolStudyId) ASC
            ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(sql, dataSet));
            string strFindParam = string.Format("%{0}%", strFind);
            DataAccessHelper.AddStringInputParam(com, "strFindParam", strFindParam);
            return DataAccessHelper.GetList(com);
        }

        #endregion

        public DataTable GetPatientById(int patientId, string datasetSql)
        {
            string sql =  "SELECT * FROM (" + datasetSql + ") AS a WHERE PatientId = " + patientId;
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        

        //contact status must select within the dataset
        public DataSet GetDistinctContactStatus(string dataSet)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetDistinctPtContactStatus");
            DataAccessHelper.AddLongStringInputParam(com, "dataSet", dataSet);
            DataSet statusDs = DataAccessHelper.GetList(com);
            return statusDs;
        }

        //contact status must select within the dataset
        public DataSet GetDistinctContactStatusByPhysicianAndDisease(string datasetSql, int physicianId, string physicianRole, string diseaseName)
        {
            DataSet ds = new DataSet();

            string sql = @"
                SELECT PtContactStatus, COUNT(PatientId) AS NumberOfPatients FROM
                (                
	                SELECT pt.* FROM Patients pt ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON pt.PatientId= ds.PatientId ";

            if (physicianId > 0 && !String.IsNullOrEmpty(physicianRole))
            {
                sql += @"
                        INNER JOIN PatientPhysicians ptPh ON ptPh.PatientId = pt.PatientId 
                           			AND ptPh.PatientPhysicianId = 
                                   (
		                                SELECT TOP 1 PatientPhysicians.PatientPhysicianId
		                                FROM PatientPhysicians
                                        LEFT JOIN Physicians ON Physicians.PhysicianId = PatientPhysicians.PhysicianId
		                                WHERE PatientPhysicians.PatientId = pt.PatientId 
                                              AND PatientPhysicians.PhysicianId = @PhysicianId 
		                                      AND PatientPhysicians.PtPhRole LIKE @PtPhRole 
                                   ) ";
            }
            if (!String.IsNullOrEmpty(diseaseName))
            {
                sql += @"
	                    INNER JOIN PatientDiseases ptDs ON ptDs.PatientId = pt.PatientId
				                    AND ptDs.PatientDiseaseId = 
				                    (
					                    SELECT TOP 1 PatientDiseases.PatientDiseaseId 
					                    FROM PatientDiseases
					                    LEFT JOIN Diseases ON Diseases.DiseaseId = PatientDiseases.DiseaseId
					                    WHERE  PatientDiseases.PatientId = pt.PatientId
						                       AND Diseases.DiseaseName LIKE @DiseaseName 
				                    ) ";
            }

            sql += @" ) AS a GROUP BY PtContactStatus HAVING PtContactStatus IS NOT NULL ORDER BY PtContactStatus ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            if (physicianId > 0 && !String.IsNullOrEmpty(physicianRole))
            {
                DataAccessHelper.AddIntInputParam(com, "PhysicianId", physicianId);
                DataAccessHelper.AddStringInputParam(com, "PtPhRole", String.Format("%{0}%", physicianRole));
            }
            if (!String.IsNullOrEmpty(diseaseName))
                DataAccessHelper.AddStringInputParam(com, "DiseaseName", String.Format("%{0}%", diseaseName));

            ds = DataAccessHelper.GetRecord(com);

            return ds;
        }

        public DataSet ListPatientsByContactStatusPhysicianAndDisease(string datasetSql, string[] contactStatus, int physicianId, string physicianRole, string diseaseName, string orderByField, int startRow, int numRows)
        {
            DataSet ds = new DataSet();

            string sql = @"
                SELECT pt.*
                       FROM Patients pt ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON pt.PatientId= ds.PatientId ";

            if (physicianId > 0 && !String.IsNullOrEmpty(physicianRole))
            {
                sql += @"
                        INNER JOIN PatientPhysicians ptPh ON ptPh.PatientId = pt.PatientId 
                           			AND ptPh.PatientPhysicianId = 
                                   (
		                                SELECT TOP 1 PatientPhysicians.PatientPhysicianId
		                                FROM PatientPhysicians
                                        LEFT JOIN Physicians ON Physicians.PhysicianId = PatientPhysicians.PhysicianId
		                                WHERE PatientPhysicians.PatientId = pt.PatientId 
                                              AND PatientPhysicians.PhysicianId = @PhysicianId 
		                                      AND PatientPhysicians.PtPhRole LIKE @PtPhRole 
                                   ) 
                        INNER JOIN Physicians ph ON ph.PhysicianId =  ptPh.PhysicianId ";
            }
            if (!String.IsNullOrEmpty(diseaseName))
            {
                sql += @"
	                    INNER JOIN PatientDiseases ptDs ON ptDs.PatientId = pt.PatientId
				                    AND ptDs.PatientDiseaseId = 
				                    (
					                    SELECT TOP 1 PatientDiseases.PatientDiseaseId 
					                    FROM PatientDiseases
					                    LEFT JOIN Diseases ON Diseases.DiseaseId = PatientDiseases.DiseaseId
					                    WHERE  PatientDiseases.PatientId = pt.PatientId
						                       AND Diseases.DiseaseName LIKE @DiseaseName 
				                    ) 
                        INNER JOIN Diseases dis ON dis.DiseaseId = ptDs.DiseaseId ";
            }


            //sql += @" WHERE pt.PtContactStatus = @ContactStatus ";
            sql += @" WHERE ";

            string[] paramList = new string[contactStatus.Length];
            for (int i = 0; i < contactStatus.Length; i++)
            {
                string paramName = "ContactStatus_" + i;
                if (i == 0)
                    paramList[i] = " pt.PtContactStatus = @" + paramName + " ";
                else
                    paramList[i] = " OR pt.PtContactStatus = @" + paramName + " ";
            }
            sql += string.Join(" ", paramList);

            if (!String.IsNullOrEmpty(orderByField))
            {
                if (orderByField == "PtLastName")
                    sql += @" ORDER BY pt.PtlastName ASC, pt.PtFirstName ASC ";
                else if (orderByField == "PtMrn")
                    sql += @" ORDER BY pt.PtMrn ASC, pt.PtLastName ASC ";
            }
            else
                sql += @" ORDER BY pt.PtlastName ASC, pt.PtFirstName ASC ";

            sql += @" SET @Rowcount = @@ROWCOUNT ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);

            if (physicianId > 0 && !String.IsNullOrEmpty(physicianRole))
            {
                DataAccessHelper.AddIntInputParam(com, "PhysicianId", physicianId);
                DataAccessHelper.AddStringInputParam(com, "PtPhRole", String.Format("%{0}%", physicianRole));
            }
            if (!String.IsNullOrEmpty(diseaseName))
                DataAccessHelper.AddStringInputParam(com, "DiseaseName", String.Format("%{0}%", diseaseName));


            //DataAccessHelper.AddStringInputParam(com, "ContactStatus", contactStatus);
            for (int i = 0; i < contactStatus.Length; i++)
            {
                string paramName = "ContactStatus_" + i;
                string paramValue = contactStatus[i];
                DataAccessHelper.AddStringInputParam(com, paramName, paramValue);
            }


            return DataAccessHelper.GetList(com, startRow, numRows);
        }

        /// <summary>
        /// Takes patientID and returns all physcians associated with the patient via the physicians table
        /// </summary>
        /// <param name="patientId">int patientId</param>
        /// <returns>DataSet</returns>
        public DataSet GetPatientPhysicians(int patientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientPhysicians");
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            return DataAccessHelper.GetList(com);
        }




        /// <summary>
        /// Takes patientId and returns all protocols associated with the patient
        /// </summary>
        /// <param name="patientId">patientID</param>
        /// <returns>DataSet</returns>
        public DataSet GetPatientProtocols(int patientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientProtocols");
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            return DataAccessHelper.GetList(com);
        }
        /// <summary>
        /// Takes patientId and returns all diseases associated with the patient
        /// </summary>
        /// <param name="patientId">patientID</param>
        /// <returns>DataSet</returns>
        public DataSet GetPatientDiseases(int patientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientDiseases");
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            return DataAccessHelper.GetList(com);
        }

        public DataTable GetPatientByMRN(string MRN)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spValidateMRN");
            DataAccessHelper.AddStringInputParam(com, "PtMRN", MRN);
            DataTable dt = DataAccessHelper.GetList(com).Tables[0];

            return dt;
        }

        public DataTable GetPatientByMRNAndDOB(string MRN, DateTime dob)
        {
            string sql =
            @"
            SELECT
	            PatientId, PtFirstName, PtMiddleName, PtLastName
            FROM Patients
            WHERE
	            PtMRN = @MRN
	            AND PtBirthDate IS NOT NULL
	            AND YEAR(PtBirthDate) = YEAR(@DOB)
	            AND MONTH(PtBirthDate) = MONTH(@DOB)
	            AND DAY(PtBirthDate) = DAY(@DOB)
            ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "MRN", MRN);
            DataAccessHelper.AddDateTimeInputParam(com, "DOB", dob);
            DataTable dt = DataAccessHelper.GetList(com).Tables[0];

            return dt;
        }

        public DataSet ValidatePatientDeletion(int patientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spValidatePatientDeletion");
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            return DataAccessHelper.GetList(com);
        }


        public DataSet FormGetPatientsIdentification(int PatientId, string FormName, string FormType)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormGetPatientsIdentification");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
            DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataSet FormGetPatientsIdentificationAll(int PatientId, string FormName, string FormType)
        {
            string sql = "SELECT * FROM Patients ";
            sql += "WHERE Patients.PatientId = @PatientId ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataSet ds = DataAccessHelper.GetList(com);
            return ds;

        }

        
        public DataSet GetPatientHPIBladder(int PatientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientHPIBladder");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }


        public DataSet GetPatientHPIKidney(int PatientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientHPIKidney");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }



        public DataSet GetPatientHPITestis(int PatientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientHPITestis ");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }


        public DataSet GetPatientHPI(int PatientId, System.Byte NomogramResults, System.Byte NomogramValues)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientHPI");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddBitInputParam(com, "NomogramResults", NomogramResults);
            DataAccessHelper.AddBitInputParam(com, "NomogramValues", NomogramResults);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataSet GetPatientHPIForEForm(int PatientId, System.Byte NomogramResults, System.Byte NomogramValues, System.Byte ShowEFormValues)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientHPI");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddBitInputParam(com, "NomogramResults", NomogramResults);
            DataAccessHelper.AddBitInputParam(com, "NomogramValues", NomogramResults);
            DataAccessHelper.AddBitInputParam(com, "EForm", ShowEFormValues);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataSet GetPatientHPIProstateGU(int PatientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientHPIProstateGU");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataSet GetPatientHPIProstateGU(int PatientId, System.Byte ShowEFormValues)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientHPIProstateGU");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddBitInputParam(com, "EForm", ShowEFormValues);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        /// <summary>
        /// Visit each item in the Prostate GU HPI and process the results to the consumer callback.
        /// </summary>
        /// <param name="PatientId"></param>
        /// <param name="ShowEFormValues"></param>
        /// <param name="consumer"></param>
        private static void ConsumePatientHPIProstateGU(int PatientId, System.Byte ShowEFormValues, Action<Dictionary<string, object>> consumer)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientHPIProstateGU");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddBitInputParam(com, "EForm", ShowEFormValues);

            char[] sep1 = { '|' };

            char[] sep2 = { ',' };

            int groupIndex = 0;

            // while row data returned, cleanup and notify consumer with clean data
            Connectivity.ConsumeRecord(com, (record) =>
            {
                // maybe move this into a RowFilter for a DataView later - jf
                string filter = record["Filters"].ToString();

                string[] tableNames = record["TableNames"].ToString().Split(sep2);

                string[] primaryKeys = record["PrimaryKeys"].ToString().Split(sep2);

                string[] hpiItems = record["patientHPIDelimited"].ToString().Split(sep1, StringSplitOptions.RemoveEmptyEntries);

                string hpiString = record["patientHPIDelimited"].ToString();

                string sortDate = record["SortDate"].ToString();

                int numberOfHpiItems = tableNames.Length; //primaryKeys.Length;

                string hpi;
                if (numberOfHpiItems > 0)
                {
                    DateTime hpiDate;
                    string hpiDateString = "";
                    // group like items into grouping
                    for (int i = 0; i < hpiItems.Length; i++)
                    {
                        int groupRowIndex = i;

                        var hpiItem = hpiItems[i];
                        string table = "";
                        // this if statement is here to catch the special case of there being a mismatch in the lengths of patientHPIDelimited, tablenames, and primarykeys
                        if (i < tableNames.Length) table = tableNames[i];


                        int priKey;
                        string priKeyStr = "";
                        // this extra if statement is here to catch the special case of there being a mismatch in the lengths of patientHPIDelimited, tablenames, and primarykeys
                        if (i < primaryKeys.Length) priKeyStr = primaryKeys[i];
                        bool priKeyIsInt = Int32.TryParse(priKeyStr, out priKey);
                        string endDate = "";
                        string item = "";


                        if (table.Length > 0)
                        {
                            hpi = hpiItem.Replace("__", "");
                            var pairs = hpi.Split(' ');
                            // extract dates
                            // get End Date
                            if (pairs.First().Contains("-"))
                            {
                                var dateField = pairs.First().Split('-');
                                hpiDateString = dateField.ElementAt(0);
                                endDate = dateField.ElementAt(1);

                                item = string.Join(" ", pairs.Skip(1).Take(pairs.Count()).ToArray());
                            }
                            else
                            {
                                if (pairs.Count() > 0)
                                {
                                    if (i == 0)
                                    {
                                        if (DateTime.TryParse(pairs.First(), out hpiDate))
                                        {
                                            hpiDateString = pairs.First();
                                            item = string.Join(" ", pairs.Skip(1).Take(pairs.Count()).ToArray());
                                        }
                                        else
                                        {
                                            item = string.Join(" ", pairs.ToArray());
                                        }
                                    }
                                    else
                                    {
                                        item = string.Join(" ", pairs.ToArray());
                                    }
                                }
                            }
                            // create callback data source
                            Dictionary<string, object> consumerData = new Dictionary<string, object>();

                            // set field values
                            consumerData["Table"] = table;
                            consumerData["PriKey"] = priKey;
                            DateTime sDateParse = DateTime.Now;
                            DateTime eDateParse = DateTime.Now;
                            if (!string.IsNullOrEmpty(sortDate) && DateTime.TryParse(sortDate, out sDateParse))
                            {
                                consumerData["StartDate"] = sDateParse;
                            }
                            else if (!string.IsNullOrEmpty(hpiDateString) && DateTime.TryParse(hpiDateString, out sDateParse))
                            {
                                consumerData["StartDate"] = sDateParse;
                            }
                            else
                            {
                                consumerData["StartDate"] = DBNull.Value;
                            }
                            if (!string.IsNullOrEmpty(endDate) && DateTime.TryParse(endDate, out eDateParse))
                            {
                                consumerData["EndDate"] = eDateParse;
                            }
                            else
                            {
                                consumerData["EndDate"] = DBNull.Value;
                            }
                            // date text fields
                            consumerData["StartDateText"] = hpiDateString;
                            consumerData["EndDateText"] = endDate;

                            consumerData["Item"] = item;
                            consumerData["Filters"] = filter;

                            // set lookup indexes
                            consumerData["GroupIndex"] = groupIndex;
                            consumerData["GroupRowIndex"] = groupRowIndex;

                            // call consumer with current data
                            consumer(consumerData);
                        }
                        else
                        {

                        }
                    }

                }
                else
                {

                }

                // increment
                groupIndex++;
                // continue
                return true;
            });
        }

        /// <summary>
        /// Returns a list of HPIGroup XElements, each containig a list of HPI XElements represnting the Prostate GU HPI.
        /// HPIGroup
        ///     HPI
        ///         Table
        ///         PriKey
        ///         Item
        ///         StartDate
        ///         StartDateText
        ///         EndDate
        ///         EndDateText
        ///         Filters
        ///         GroupIndex
        ///         GroupRowIndex      
        /// </summary>
        /// <param name="PatientId"></param>
        /// <param name="ShowEFormValues"></param>
        /// <returns></returns>
        public List<XElement> GetPatientHPIProstateGUXML(int PatientId, System.Byte ShowEFormValues)
        {
            // list for processing hpi and xml items
            List<XElement> hpiItems = new List<XElement>();
            Func<object, object> getFieldValue = (val) =>
            {
                return val is DateTime ? ((DateTime)val).ToShortDateString() : val;
            };
            // build a list of HPI items                               
            ConsumePatientHPIProstateGU(PatientId, ShowEFormValues, (hpiSourceData) =>
            {
                XElement hpi = new XElement("HPI",
                                 from fieldName in hpiSourceData.Keys
                                 let fieldValue = hpiSourceData[fieldName]
                                 select new XElement(fieldName, getFieldValue(fieldValue))
                             );
                hpiItems.Add(hpi);
            });
            // create HPIGroup
            var hpiGroups = from hpi in hpiItems
                            let groupIndex = int.Parse(hpi.Element("GroupIndex").Value)
                            group hpi by groupIndex into g
                            orderby g.Key ascending
                            let hpiGroupItems = from hpi in g
                                                let groupRowIndex = int.Parse(hpi.Element("GroupRowIndex").Value)
                                                orderby groupRowIndex ascending
                                                select hpi
                            select new XElement("HPIGroup",
                                   new XAttribute("HPIDate", hpiGroupItems.First().Element("StartDate").Value),
                                   hpiGroupItems);
            return hpiGroups.ToList();
        }

        /// <summary>
        /// Returns a DataTable of the Prostate GU HPI with the following columns.
        ///     Table
        ///     PriKey
        ///     Item
        ///     StartDate
        ///     StartDateText
        ///     EndDate
        ///     EndDateText
        ///     Filters
        ///     GroupIndex
        ///     GroupRowIndex   
        /// </summary>
        /// <param name="PatientId"></param>
        /// <param name="ShowEFormValues"></param>
        /// <returns></returns>
        public DataTable GetPatientHPIProstateGUDataTable(int PatientId, System.Byte ShowEFormValues)
        {

            // build table
            DataTable dt = new DataTable("HPI");
            // build columns
            Dictionary<string, Type> columns = new Dictionary<string, Type>
            {
                { "Table", typeof(String) },
                { "PriKey", typeof(int)},
                { "Item", typeof(String) },
                { "StartDate", typeof(DateTime) },
                { "StartDateText", typeof(String) },
                { "EndDate", typeof(DateTime) },
                { "EndDateText", typeof(String) },
                { "Filters", typeof(String) },
                { "GroupIndex", typeof(int) },
                { "GroupRowIndex", typeof(int) },
            };
            dt.Columns.AddRange(columns.Select(p => new DataColumn(p.Key, p.Value)).ToArray());
            // as data is streamed, fill data table 
            ConsumePatientHPIProstateGU(PatientId, ShowEFormValues, (hpiSourceData) =>
            {
                // create new HPI row
                DataRow hpi = dt.NewRow();
                // fill data
                foreach (var column in columns)
                {
                    string columnName = column.Key;
                    hpi[columnName] = hpiSourceData[columnName];
                }
                // commit
                dt.Rows.Add(hpi);
            });

            dt.AcceptChanges();
            return dt;
        }
        public DataSet GetPatientHPIBreast(int PatientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientHPIBreast");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataSet GetPatientHPIBreastForEForm(int PatientId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientHPIBreast");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }


        public DataSet FormGetPatientAppointments(int PatientId, string ApptClinicDate, string ApptPhysician)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormGetPatientAppointments");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            //DataAccessHelper.AddStringInputParam(com, "ApptClinicDate", ApptClinicDate);
            DataAccessHelper.AddDateTimeInputParam(com, "ApptClinicDate", DataAccessHelper.ToDBDate(ApptClinicDate));
            DataAccessHelper.AddStringInputParam(com, "ApptPhysician", ApptPhysician);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }


        public DataSet FormGetLastPatientProblemPlans(int PatientId, string EncPhysician)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormGetLastPatientProblemPlans");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "EncPhysician", EncPhysician);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataSet FormGetLastPatientProblemPlans(int PatientId)
        {
            string sql =
            @"
            SELECT PatientProblems.PatientProblemId,ProblemName,ProblemStatus,ProblemNotes,PlanName,PlanStatus,PlanType,Encounters.EncPhysician,Encounters.EncDateText
            FROM PatientProblems INNER JOIN ProblemPlans ON PatientProblems.PatientProblemId = ProblemPlans.PatientProblemId
                                 INNER JOIN Encounters ON ProblemPlans.EncounterId = Encounters.EncounterId         
            WHERE Encounters.PatientId = @PatientId AND 
                  Encounters.EncounterId IN 
                     (
                     SELECT TOP 1 Encounters.EncounterId
                     FROM PatientProblems INNER JOIN ProblemPlans ON PatientProblems.PatientProblemId = ProblemPlans.PatientProblemId
                                          INNER JOIN Encounters ON ProblemPlans.EncounterId = Encounters.EncounterId         
                     WHERE Encounters.PatientId = @PatientId
                     ORDER BY Encounters.EnteredTime DESC
                     )
            ORDER BY PatientProblems.PatientProblemId,ProblemPlanId
            ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }



        /// <summary>
        /// Returns if the specifiec PatientId is in the given dataset.
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="dataset"></param>
        /// <returns></returns>
        public bool IsPatientInDataset(int patientId, string dataset)
        {
            if (!string.IsNullOrEmpty(dataset))
            {
                string sql = string.Format("SELECT COUNT(P_COUNT.PatientId) FROM ({0}) AS P_COUNT WHERE P_COUNT.PatientId = @PatientId", dataset);
                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
                DataSet ds = DataAccessHelper.GetList(com);
                bool inDataSet = (int)ds.Tables[0].Rows[0][0] > 0;
                return inDataSet;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Get the patient's most recent weight (in kg) near a timepoint (optional).
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="date"></param>
        /// <returns></returns>
        public int? GetPatientWeight(int patientId, DateTime? date)
        {
            string recentWeightSQL =
@"
SELECT TOP 1
	PatientId,
	FLOOR(CAST(EncWeight as float)) AS EncWeight
FROM Encounters
WHERE
	PatientId = @PatientId AND EncDate IS NOT NULL
	AND
	EncWeight IS NOT NULL AND ISNUMERIC(EncWeight) = 1
ORDER BY
	EncDate DESC
";
            string dateWeightSQL =
@"
SELECT TOP 1
	PatientId,
	EncWeight
FROM
(
	SELECT
		PatientId,
		EncWeight,
		ROW_NUMBER() OVER(Partition BY PatientId ORDER BY [EncDateOffset]) as RowNum 
	FROM
	(
		SELECT
			PatientId,
			FLOOR(CAST(EncWeight as float)) AS EncWeight,
			DAY(GETDATE() - EncDate) AS [EncDateOffset]
		FROM Encounters
		WHERE
		PatientId = @PatientId AND EncDate IS NOT NULL
		AND
		EncWeight IS NOT NULL AND ISNUMERIC(EncWeight) = 1
	) a
) a
WHERE RowNum = 1
";
            string sql = date.HasValue ? dateWeightSQL : recentWeightSQL;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetList(com).Tables[0];
            if (dt.Rows.Count > 0)
            {
                return Convert.ToInt32(dt.Rows[0]["EncWeight"]);
            }
            else
            {
                return null;
            }
        }

    }
}
