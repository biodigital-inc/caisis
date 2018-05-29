
using System.Collections;
using System.Collections.Generic;
using System.Text;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;

namespace Caisis.DataAccess
{
    public class SpecimenManagerDa : BaseDA
    {
        public SpecimenManagerDa()
        {
            // TODO: Add constructor logic here
        }

        #region methods for Specimens

        // new one added by eftaker
        public DataSet GetSpecimenDetails(int collectionId, string collectionIdList, string arg, string IdentifierType)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimen_GetDetails");
            DataAccessHelper.AddIntInputParam(com, "collectionId", collectionId);
            DataAccessHelper.AddLongStringInputParam(com, "collectionIdList", collectionIdList);
            DataAccessHelper.AddStringInputParam(com, "arg", arg);
            DataAccessHelper.AddStringInputParam(com, "IdentifierType", IdentifierType);

            return DataAccessHelper.GetList(com);
        }

        ///<summary>
        /// used to get the Specimens having Children
        /// this is used to validate deletion of specimens in SpecimenAccession record Specimens grid
        ///</summary>
        public DataTable GetSpecimenshavingChilds(int accessionId)
        {
            DataTable dt = new DataTable();
            StringBuilder sql = new StringBuilder();
            sql.Append("WITH Recursion(SpecimenId, ParentSpecimenId) AS ");
            sql.Append("( ");
            sql.Append("SELECT SpecimenId, ParentSpecimenId FROM Specimens ");
            sql.Append("WHERE ParentSpecimenId IS NOT NULL AND SpecimenAccessionId=" + accessionId + " ");
            sql.Append(") ");
            sql.Append("SELECT DISTINCT ParentSpecimenId FROM Recursion");
            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }

        ///<summary>
        /// Get contacts by ContactType=Specimen for specimens
        /// </summary>
        /// <returns></returns> 
        public DataTable GetContactsForSpecimens()
        {
            DataTable dt = new DataTable();
            string sql = "SELECT ContactId, FirstName, LastName,LastName  + ', ' + FirstName as Name " +
                         "FROM Contact " +
                         "WHERE ContactType='Specimen'";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }

        ///<summary>
        /// Get Identifier by type (from Web.config) and specimenId
        /// </summary>
        /// <param name="specimenId"></param>
        /// <returns></returns> 
        public DataTable GetIdentifier(int specimenId, string idType, string datasetSql)
        {
            string sql = "SELECT DISTINCT s.specimenid, p.patientid, i.Identifier, s.specimenReferenceNumber ";
            sql += "FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ";
            sql += "LEFT OUTER JOIN (" + datasetSql + ") p ON p.patientid=sa.patientid ";
            sql += "LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType= @IdType) AS i ON p.patientId=i.patientId ";
            sql += "WHERE s.SpecimenId = @SpecimenId";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "SpecimenId", specimenId);
            DataAccessHelper.AddStringInputParam(cmd, "IdType", idType);
            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);

            return dt;
        }

        ///<summary>
        /// Get Identifier by type (from Web.config), patientId and dataset
        /// </summary>
        /// <param name="specimenId"></param>
        /// <returns></returns> 
        public DataTable GetIdentifierByType(int ptId, string idType, string datasetSql)
        {
            DataTable dt = new DataTable();

            string sql = "";
            sql += "SELECT DISTINCT p.patientid, i.Identifier ";
            sql += "FROM Identifiers i ";
            sql += "LEFT OUTER JOIN Patients p ON p.patientid=i.patientid ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON p.PatientId= ds.PatientId ";
            sql += "WHERE IdType= '" + idType + "' AND p.patientid = " + ptId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        /// <summary>
        /// Get Parents hierarchy, Siblings & Subspecimens of a selected specimen by Id
        /// </summary>
        /// <param name="specimenId"></param>
        /// <returns></returns>
        public DataTable GetParentsSiblingsAndSubsById(string parentspecimenId, int specimenId)
        {
            DataTable dt = new DataTable();
            StringBuilder sql = new StringBuilder();
            StringBuilder query = new StringBuilder();

            query.Append("SELECT ParentSpecimenId,SpecimenId,SpecimenReferenceNumber,SpecimenOriginalQty,SpecimenRemainingQty,SpecimenUnits, ");
            query.Append("(select TOP 1 BoxName FROM SpecimenBoxes bx WHERE bx.BoxId=s.BoxId ) BoxName, ");
            query.Append("(select TOP 1 POSITION FROM SpecimenPositions sp WHERE sp.PositionId=s.PositionId ) Position ");

            if (!string.IsNullOrEmpty(parentspecimenId))
            {
                sql.Append("WITH Hierarchy(ParentSpecimenId, SpecimenId, SpecimenReferenceNumber,SpecimenOriginalQty,SpecimenRemainingQty, ");
                sql.Append("SpecimenUnits,PositionId,BoxId,Level) AS");
                sql.Append("(");
                //Gets active specimen
                sql.Append("SELECT ParentSpecimenId,SpecimenId,SpecimenReferenceNumber,SpecimenOriginalQty,SpecimenRemainingQty,SpecimenUnits,");
                sql.Append("PositionId,BoxId,0 from Specimens ");
                sql.Append("WHERE SpecimenId=" + specimenId + " and ParentSpecimenId = " + parentspecimenId + "");
                sql.Append("UNION ALL ");
                //Gets parents hierarchy
                sql.Append("SELECT dt.ParentSpecimenId, dt.SpecimenId, dt.SpecimenReferenceNumber,dt.SpecimenOriginalQty,dt.SpecimenRemainingQty, ");
                sql.Append("dt.SpecimenUnits,dt.PositionId, dt.BoxId, h.level+1 ");
                sql.Append("from Specimens dt INNER JOIN Hierarchy h ON dt.SpecimenId=h.ParentSpecimenId");
                sql.Append(")");

                sql.Append(query);
                sql.Append("from hierarchy s ");

                //Gets siblings
                sql.Append("UNION ");
                sql.Append(query);
                sql.Append("from Specimens s ");
                sql.Append("WHERE ParentSpecimenId = " + parentspecimenId + "");

                //Gets childs
                sql.Append("UNION ALL ");
                sql.Append(query);
                sql.Append("from Specimens s ");
                sql.Append("WHERE ParentSpecimenId = " + specimenId + "");
            }
            else
            {
                sql.Append(query);
                sql.Append(" from Specimens s ");
                sql.Append("WHERE s.SpecimenId = " + specimenId + ""); //active specimen

                sql.Append("UNION ");
                sql.Append(query);
                sql.Append(" from Specimens s ");
                sql.Append("WHERE s.ParentSpecimenId = " + specimenId + ""); //childs

            }
            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }

        /// <summary>
        /// Get all Accession records by PatientId
        /// </summary>
        /// <param name="idType"></param>
        /// <returns>DataTable with all Accessions.</returns>
        public DataTable GetAccessionsChronoList(int patientId, string datasetSql)
        {
            DataTable dt = new DataTable();
            StringBuilder sql = new StringBuilder();

            sql.Append("SELECT sa.AccessionDateText AS VarDate, 'Specimen Accession' AS VarName, sa.AccessionProcName AS VarValue, sa.AccessionDepartment AS Quality, sa.AccessionDate AS SortDate, 'SpecimenAccessions' AS TableName, sa.SpecimenAccessionId AS PrimaryKey, sa.PatientId AS ParentKey FROM SpecimenAccessions sa ");
            sql.Append("INNER JOIN (" + datasetSql + ") AS ds ON sa.PatientId= ds.PatientId ");
            sql.Append("WHERE sa.PatientId = " + patientId + " ORDER BY SortDate");

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }

        /// <summary>
        /// Get all Accession records by PatientId
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns>DataTable with all Accessions.</returns>
        public DataSet GetAccessionsByPatientId(int PatientId)
        {
            DataSet ds = new DataSet();

            string sql = @"
                  SELECT * FROM SpecimenAccessions sa 
                  WHERE (sa.PatientId = @PatientId )
                  ORDER BY sa.AccessionDate DESC ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            ds = DataAccessHelper.GetRecord(com);

            return ds;
        }

        /// <summary>
        /// Get Specimens by AccessionId.
        /// </summary>
        /// <param name="specimenId"></param>
        /// <returns></returns>
        public DataTable GetSpecimensbyAccessionId(int accessionId, string idType)
        {
            DataTable dt = new DataTable();

            string sql = "";
            sql += "SELECT DISTINCT s.specimenid, p.patientid, sa.AccessionProcName, sa.SpecimenAccessionId, i.Identifier, ";
            sql += "s.specimenReferenceNumber, s.specimenStatus, s.specimenType, s.specimenPreservationType, s.specimenSubType, s.specimenOriginalQty, s.specimenRemainingQty, s.specimenUnits, s.boxId, s.positionId, s.SpecimenNotes, sb.boxName, sp.position, si.SiteId,si.SiteName,sto.StorageId,sto.StorageName,cont.ContainerId,cont.ContainerName, c.ContactId,c.LastName + ', ' + c.FirstName AS Name ";
            sql += "FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ";
            sql += "LEFT OUTER JOIN SpecimenPositions sp ON sp.boxId=s.boxId AND sp.positionId=s.positionId ";
            sql += "LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=s.boxId ";
            sql += "LEFT OUTER JOIN SpecimenContainers cont ON cont.ContainerId=sb.ContainerId ";
            sql += "LEFT OUTER JOIN SpecimenStorages sto ON sto.StorageId=cont.StorageId ";
            sql += "LEFT OUTER JOIN SpecimenSites si ON si.SiteId=sto.SiteId ";
            sql += "LEFT OUTER JOIN Patients p ON p.patientid=sa.patientid ";
            sql += "LEFT OUTER JOIN Contact c ON c.ContactId=s.ContactId ";
            sql += "LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType= '" + idType + "') AS i ON p.patientId=i.patientId ";
            sql += "WHERE sa.specimenaccessionid = " + accessionId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        /// <summary>
        /// Get all specimens records. Order by Boxname, then PositionId
        /// </summary>
        /// <param name="idType"></param>
        /// <returns>DataTable with all specimens.</returns>
        public DataTable GetAllSpecimens(string idType, bool showAll, string datasetSql)
        {
            DataTable dt = new DataTable();

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT DISTINCT s.specimenid, p.Patientid, sa.AccessionProcName, i.Identifier, ");
            sql.Append("s.specimenReferenceNumber, s.specimenType,  s.specimenSubType,  s.specimenPreservationType, s.specimenStatus, s.specimenOriginalQty, s.specimenRemainingQty, s.specimenUnits, s.boxId, sb.boxName, s.positionId, sp.Position,s.ParentSpecimenId, MRN ");
            sql.Append("FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ");

            sql.Append("INNER JOIN (" + datasetSql + ") AS ds ON sa.PatientId= ds.PatientId ");

            sql.Append("LEFT OUTER JOIN SpecimenPositions sp ON sp.positionId=s.positionId ");
            sql.Append("LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=s.boxId ");
            sql.Append("LEFT OUTER JOIN (SELECT PtMRN AS MRN, PatientId FROM Patients) p ON p.patientid=sa.patientid ");
            sql.Append("LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType= '" + idType + "') AS i ON p.patientId=i.patientId ");
            sql.Append("LEFT OUTER JOIN Specimen_SpecimenCollections ssc ON ssc.specimenId=s.specimenId ");
            sql.Append("LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=ssc.collectionId ");

            if (!showAll)
            {
                sql.Append("WHERE s.specimenStatus NOT LIKE '%Unavailable%' OR SpecimenStatus IS NULL ");
            }
            sql.Append("ORDER BY sb.boxName, s.positionId ");

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }

        public DataTable GetAllSpecimensInRange(bool totalCountOnly, string idType, bool showAll, int startRow, int endRow, string orderBy, string datasetSql)
        {

            DataTable dt = new DataTable();

            StringBuilder sql = new StringBuilder();
            if (totalCountOnly == false)
            {
                string _orderBy = "sb.boxName, sp.position";
                if (orderBy != "")
                {
                    _orderBy = orderBy;
                }

                sql.Append("SELECT a.* FROM (");
                sql.Append("SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY " + _orderBy + ") AS Num, s.specimenid, p.Patientid, ");
                sql.Append("sa.AccessionProcName,s.specimenReferenceNumber, i.Identifier, MRN, s.specimenType,  s.specimenSubType,  s.specimenPreservationType, s.specimenStatus, s.specimenOriginalQty, s.specimenRemainingQty, s.specimenUnits,s.ParentSpecimenId, s.boxId, sb.boxName, s.positionId, sp.Position ");
            }
            else
            {
                sql.Append("Select Count(DISTINCT s.specimenid) AS \"TotalCount\" ");
            }
            sql.Append("FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ");

            sql.Append("INNER JOIN (" + datasetSql + ") AS ds ON sa.PatientId= ds.PatientId ");

            /* datasetSql example
            SELECT DISTINCT Dataset_Patients.* 
                FROM Dataset_Patients  
                    WHERE  Dataset_Patients.patientid in
                        (SELECT PatientId FROM PatientInstitutions WHERE institutionid = 1)
            */
            sql.Append("LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=s.boxId ");
            sql.Append("LEFT OUTER JOIN SpecimenPositions sp ON sp.positionId=s.positionId ");
            sql.Append("LEFT OUTER JOIN (SELECT PtMRN AS MRN, PatientId FROM Patients) p ON p.patientid=sa.patientid ");
            sql.Append("LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType= '" + idType + "') AS i ON p.patientId=i.patientId ");
            sql.Append("LEFT OUTER JOIN Specimen_SpecimenCollections ssc ON ssc.specimenId=s.specimenId ");
            sql.Append("LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=ssc.collectionId ");

            if (!showAll)
            {
                sql.Append("WHERE s.specimenStatus NOT LIKE '%Unavailable%' OR SpecimenStatus IS NULL ");
            }

            if (totalCountOnly == false)
            {
                sql.Append(")a WHERE Num BETWEEN " + startRow + " AND " + endRow + "");
            }

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }


        //  ONLY SQL SERVER 2005 Compatible
        public DataTable GetLocalSpecimensInRange(bool totalCountOnly, string collectDateFrom, string collectDateTo,
                                          string[,] typeSubTypeArr, string identifier, string status, string boxName, bool useBoxNameWildcard, string idType, string referenceNum, bool showAll, int startRow, int endRow, string orderBy, string datasetSql)
        {
            string sql = "";
            if (totalCountOnly == false)
            {
                string _orderBy = "sb.boxName, sp.Position";
                if (orderBy != "")
                {
                    _orderBy = orderBy;
                }

                sql += "SELECT a.* FROM (";
                sql += "SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY " + _orderBy + ") AS Num, s.specimenid, p.PatientId, sa.AccessionProcName, ";
                sql += "s.specimenReferenceNumber, i.identifier, MRN,s.specimenType, s.specimenSubType, s.specimenPreservationType, s.specimenStatus, s.specimenOriginalQty, s.specimenRemainingQty, s.specimenUnits, s.boxId, sb.boxName, s.positionId, sp.Position,s.ParentSpecimenId ";
            }
            else
            {
                sql += "Select Count(DISTINCT s.specimenid) AS \"TotalCount\" ";
            }

            sql += "FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ";

            sql += "INNER JOIN (" + datasetSql + ") AS ds ON sa.PatientId= ds.PatientId ";

            sql += "LEFT OUTER JOIN SpecimenPositions sp ON sp.positionId=s.positionId ";
            sql += "LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=s.boxId ";
            sql += "LEFT OUTER JOIN (SELECT PtMRN AS MRN, PatientId FROM Patients) p ON p.patientid=sa.patientid ";
            sql += "LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType= '" + idType + "') AS i ON p.patientId=i.patientId ";
            sql += "LEFT OUTER JOIN Specimen_SpecimenCollections ssc ON ssc.specimenId=s.specimenId ";
            sql += "LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=ssc.collectionId ";

            StringBuilder wc = new StringBuilder(); //WHERE clause
            if (collectDateFrom.Length > 0 && collectDateTo.Length > 0)
            {
                wc.Append("AND sa.AccessionDate BETWEEN '" + collectDateFrom + "' AND '" + collectDateTo + "' ");
            }
            else if (collectDateFrom.Length > 0)
            {
                wc.Append("AND sa.AccessionDate >= '" + collectDateFrom + "' ");
            }
            else if (collectDateTo.Length > 0)
            {
                wc.Append("AND sa.AccessionDate <= '" + collectDateTo + "' ");
            }

            if (identifier.Length > 0)
            {
                wc.Append("AND i.identifier LIKE '%' + @identifier + '%' ");
            }

            if (boxName.Length > 0 && useBoxNameWildcard == true)
            {
                wc.Append("AND sb.boxName LIKE '%' + @boxName + '%' ");
            }
            else if (boxName.Length > 0 && useBoxNameWildcard == false)
            {
                wc.Append("AND sb.boxName = @boxName ");
            }

            // Reference Number / Vial Number
            if (referenceNum.Length > 0)
            {
                wc.Append("AND s.specimenReferenceNumber LIKE '%' + @referenceNum + '%' ");
            }

            // Specimen type and subtypes 
            // look at each element in 2d array to create the AND ( ... OR ... OR ... ) clause for type and subtype
            StringBuilder sb = new StringBuilder();
            int numOfPairs = typeSubTypeArr.GetLength(0);

            sb.Append("AND (");
            for (int i = 0; i < numOfPairs; i++)
            {
                string typeVal = typeSubTypeArr[i, 0];
                string subTypeVal = typeSubTypeArr[i, 1];

                if (!string.IsNullOrEmpty(typeVal))
                {
                    if (!string.IsNullOrEmpty(subTypeVal))
                    {
                        string[] subTypeValArr = typeSubTypeArr[i, 1].Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                        subTypeVal = ConvertToSQLValuesInFormat(subTypeValArr);
                        sb.Append("(s.SpecimenType='" + typeVal + "' AND s.SpecimenSubType IN (" + subTypeVal + ")) OR ");
                    }
                    else
                    {
                        sb.Append("(s.SpecimenType='" + typeVal + "') OR ");
                    }
                }
            }
            if (sb.Length > 5) // we test for > 5 because "AND (" is 5
            {
                sb.Remove(sb.Length - 4, 4); //remove last OR and spaces
                sb.Append(") ");

                wc.Append(sb.ToString());
            }

            if (status.Length > 0)
            {
                wc.Append("AND s.specimenStatus = '" + status + "' ");
            }
            if (!showAll)
            {
                wc.Append("AND s.specimenStatus NOT LIKE '%Unavailable%' ");
            }

            if (wc.Length > 0)
            {
                wc.Remove(0, 3); //removes the first AND
                wc.Insert(0, " WHERE ");
            }

            sql += wc.ToString();

            //sql.Append("ORDER BY sb.boxName, sp.positionId ");

            if (totalCountOnly == false)
            {
                sql += ")a WHERE Num BETWEEN " + startRow + " AND " + endRow + "";
            }

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "referenceNum", referenceNum);
            DataAccessHelper.AddStringInputParam(com, "boxName", boxName);
            DataAccessHelper.AddStringInputParam(com, "identifier", identifier);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        #region old GetLocalSpecimens
        /*public DataTable GetLocalSpecimens(string collectDateFrom, string collectDateTo,
                                           string type, string[] subTypeList, string identifier, string status, string boxName, string idType, bool showAll)
        {
            DataTable dt = new DataTable();
            string subTypeInStatement = "";
            if (subTypeList.Length > 0)
            {
                subTypeInStatement = " IN(";
                foreach (string subType in subTypeList)
                {
                    subTypeInStatement += "'" + subType + "',";
                }
                subTypeInStatement = subTypeInStatement.Remove(subTypeInStatement.Length - 1);
                subTypeInStatement += ") ";
            }

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT DISTINCT s.specimenid, p.patientid, sc.collectionName, sa.accessionProcName, i.identifier, ");
            sql.Append("s.specimenReferenceNumber, s.specimenType, s.specimenSubType, s.specimenPreservationType, s.specimenStatus, s.specimenRemainingQty, s.specimenUnits, s.boxId, sl.position ");
            sql.Append("FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ");
            sql.Append("LEFT OUTER JOIN SpecimenPositions sl ON s.boxId=sl.boxId AND s.positionId=sl.positionId ");
            sql.Append("LEFT OUTER JOIN Patients p ON p.patientid=sa.patientid ");
            sql.Append("LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType= '" + idType + "') AS i ON p.patientId=i.patientId ");
            sql.Append("LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=s.collectionId ");

            StringBuilder wc = new StringBuilder(); //WHERE clause
            if (collectDateFrom.Length > 0 && collectDateTo.Length > 0)
            {
                wc.Append("AND sa.AccessionDate BETWEEN '" + collectDateFrom + "' AND '" + collectDateTo + "' ");
            }
            else if (collectDateFrom.Length > 0)
            {
                wc.Append("AND sa.AccessionDate >= '" + collectDateFrom + "' ");
            }
            else if (collectDateTo.Length > 0)
            {
                wc.Append("AND sa.AccessionDate <= '" + collectDateTo + "' ");
            }

            if (identifier.Length > 0)
            {
                wc.Append("AND i.identifier LIKE '%" + identifier + "%' ");
            }

            if (type.Length > 0)
            {
                wc.Append("AND s.SpecimenType = '" + type + "' ");
            }
            if (status.Length > 0)
            {
                wc.Append("AND s.specimenStatus = '" + status + "' ");
            }
            if (!showAll)
            {
                wc.Append("AND s.specimenStatus NOT LIKE '%Unavailable%' ");
            }

            if (wc.Length > 0)
            {
                wc.Remove(0, 3); //removes the first AND
                wc.Insert(0, " WHERE ");
            }

            sql.Append(wc.ToString());

            sql.Append("ORDER BY s.boxId, sl.position ");

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }*/
        #endregion

        public DataTable GetBTCSpecimensInRange(bool totalCountOnly, string collectDateFrom, string collectDateTo, string[] typeArr,
            string[] bloodSubTypeArr, string[] tissueSubTypeArr, string[] histArr, string histpathOther, string histpathGrade, string contact,
            string orgQty, string optr, string units, string remQty, string RemOptr, string RemUnits, string surgeon, string eventTest, string eventResult, string vitalStatus, string identifier, string status, string boxName, bool useBoxNameWildcard, string idType,
            string referenceNum, string MRN, bool showAll, int startRow, int endRow, string orderBy, string datasetSql)
        {
            string sql = "";
            //CTE to combine aliveStatus from Status table & deathStatus from Patients table
            sql = "WITH CombinedVital(PatientId, Date, VitalStatus) AS ";
            sql += "( ";
            sql += "select st.PatientId,(st.StatusDate) AS Date,st.Status as VitalStatus from Status AS st ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON st.PatientId = ds.PatientId ";
            sql += "where st.Status like '%alive%' ";
            sql += "UNION ALL ";
            sql += "select pt.PatientId, pt.PtDeathDate AS Date,pt.PtDeathType as VitalStatus from Patients AS pt ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON pt.PatientId = ds.PatientId ";
            sql += "where pt.PtDeathType is not null ";
            sql += ") ";
            if (totalCountOnly == false)
            {
                string _orderBy = "path.PathHistology,SpecimenReferenceNumber,sb.boxName";
                if (orderBy != "")
                {
                    _orderBy = orderBy;
                }

                sql += "SELECT a.* FROM (";
                sql += "SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY " + _orderBy + ") AS Num, s.specimenid, p.PatientId, sa.SpecimenAccessionId AS SpecimenAccessionId, sa.AccessionProcName, ";
                sql += "s.SpecimenReferenceNumber AS SpecimenReferenceNumber, i.Identifier, MRN, PtName, s.SpecimenType AS SpecimenType, s.SpecimenSubType, s.SpecimenNotes, s.SpecimenStatus, co.LastName + ', ' + co.FirstName AS ContactPurpose, s.SpecimenOriginalQty, s.SpecimenRemainingQty, s.SpecimenUnits, s.boxId, sb.BoxName, s.positionId, sp.Position,s.specimenPreservationType, s.ParentSpecimenId,  op.OpDate, op.OpCaseSurgeon, path.PathHistology,sa.AccessionNotes, st.VitalStatus, se.EventType, se.EventResult, ";
                sql += "CASE WHEN proSt.ptprotocolstatus='consented'  THEN 'Yes' ELSE 'NO' END AS PtConsented ";
            }
            else
            {
                sql += "Select Count(s.specimenid) AS \"TotalCount\" ";
            }

            sql += "FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON sa.PatientId= ds.PatientId ";
            sql += "LEFT OUTER JOIN SpecimenPositions sp ON sp.positionId=s.positionId ";
            sql += "LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=s.boxId ";
            sql += "LEFT OUTER JOIN (SELECT PtMRN AS MRN, PatientId, (PtLastName + ', ' + PtFirstName) AS PtName FROM Patients) p ON p.patientid=sa.patientid ";
            sql += "LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType= '" + idType + "') AS i ON p.patientId=i.patientId ";
            sql += "LEFT OUTER JOIN Specimen_SpecimenCollections ssc ON ssc.specimenId=s.specimenId ";
            sql += "LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=ssc.collectionId ";
            sql += "LEFT OUTER JOIN OperatingRoomDetails op ON op.PatientId = sa.PatientId AND (sa.AccessionDate = op.OpDate OR sa.DateBanked = op.OpDate) AND op.OpService = 'Neurosurgery' ";
            sql += "LEFT OUTER JOIN Pathology path ON path.patientid=p.patientid AND path.OperatingRoomDetailId=op.OperatingRoomDetailId ";
            sql += "LEFT OUTER JOIN PathologyStageGrade pathSG ON pathSG.PathologyId=path.PathologyId ";
            sql += "LEFT OUTER JOIN Contact co ON co.ContactId=s.ContactId ";
            sql += "LEFT OUTER JOIN SpecimenEvents se ON se.SpecimenId=s.SpecimenId ";
            sql += "LEFT OUTER JOIN (Select cv.PatientId, cv.Date, cv.VitalStatus from CombinedVital cv INNER JOIN (Select PatientId, Max(Date) AS Date from CombinedVital GROUP BY PatientId ) MaxDate ON cv.PatientId = MaxDate.PatientId AND cv.Date = MaxDate.Date GROUP BY cv.PatientId, cv.Date, cv.VitalStatus) AS st ON st.PatientId=sa.PatientId ";
            sql += "LEFT OUTER JOIN (select pp.PatientId,pps.* from patientprotocols pp INNER JOIN protocols p on p.ProtocolId=pp.ProtocolId INNER JOIN patientprotocolstatus pps on pp.PatientProtocolId=pps.PatientProtocolId WHERE p.ProtocolNum='06-107' and pps.ptprotocolstatus='consented')proSt on proSt.PatientId=sa.PatientId ";

            StringBuilder wc = new StringBuilder(); //WHERE clause
            if (collectDateFrom.Length > 0 && collectDateTo.Length > 0)
            {
                wc.Append("AND sa.AccessionDate BETWEEN '" + collectDateFrom + "' AND '" + collectDateTo + "' ");
            }
            else if (collectDateFrom.Length > 0)
            {
                wc.Append("AND sa.AccessionDate >= '" + collectDateFrom + "' ");
            }
            else if (collectDateTo.Length > 0)
            {
                wc.Append("AND sa.AccessionDate <= '" + collectDateTo + "' ");
            }

            if (identifier.Length > 0)
            {
                wc.Append("AND i.identifier LIKE '%' + @identifier + '%' ");
            }

            if (boxName.Length > 0 && useBoxNameWildcard == true)
            {
                wc.Append("AND sb.boxName LIKE '%' + @boxName + '%' ");
            }
            else if (boxName.Length > 0 && useBoxNameWildcard == false)
            {
                wc.Append("AND sb.boxName = @boxName ");
            }

            if (contact.Length > 0)
            {
                wc.Append("AND s.ContactId ='" + contact + "' ");
            }

            if (orgQty.Length > 0)
            {
                wc.Append("AND CAST(CASE WHEN ISNUMERIC(s.SpecimenOriginalQty) = 1 THEN s.SpecimenOriginalQty ");
                wc.Append("WHEN s.SpecimenOriginalQty = 'Small' THEN '0.25' ");
                wc.Append("WHEN s.SpecimenOriginalQty = 'Missing' THEN '0.00' ");
                wc.Append("WHEN s.SpecimenOriginalQty = 'No More Left' THEN '0.00' ");
                wc.Append("WHEN s.SpecimenOriginalQty IS NULL THEN '0.00' ");
                wc.Append("ELSE '0.00' ");
                wc.Append("END as decimal(10,2)) " + optr + " @orgQty ");
            }

            if (units.Length > 0)
            {
                wc.Append("AND s.SpecimenUnits = @units ");
            }

            if (remQty.Length > 0)
            {
                wc.Append("AND CAST(CASE WHEN ISNUMERIC(s.SpecimenRemainingQty) = 1 THEN s.SpecimenRemainingQty ");
                wc.Append("WHEN s.SpecimenRemainingQty = 'Small' THEN '0.25' ");
                wc.Append("WHEN s.SpecimenRemainingQty = 'Missing' THEN '0.00' ");
                wc.Append("WHEN s.SpecimenRemainingQty = 'No More Left' THEN '0.00' ");
                wc.Append("WHEN s.SpecimenRemainingQty IS NULL THEN '0.00' ");
                wc.Append("ELSE '0.00' ");
                wc.Append("END as decimal(10,2)) " + RemOptr + " @remQty ");
            }

            if (RemUnits.Length > 0)
            {
                wc.Append("AND s.SpecimenUnits = @RemUnits ");
            }

            if (surgeon.Length > 0)
            {
                wc.Append("AND op.OpCaseSurgeon LIKE '" + surgeon + "%' ");
            }

            if (eventTest.Length > 0)
            {
                wc.Append("AND se.EventType ='" + eventTest + "' ");
            }

            if (vitalStatus.Length > 0)
            {
                wc.Append("AND st.VitalStatus LIKE '" + vitalStatus + "%' ");
            }

            string histologies = ConvertToSQLValuesInFormat(histArr);
            int histLength = histArr.Length;

            //histologies from checkboxlist
            if (histLength > 0 && histpathOther.Length > 0)
            {
                wc.Append("AND (");
                wc.Append("(path.PathHistology IN ( select LC.LkpCode from LookupCodes LC LEFT OUTER JOIN LookupCodeAttributes LCA ON LC.LookupCodeId=LCA.LookupCodeId where LCA.AttributeValue IN (" + histologies + ") )) OR ");
                wc.Remove(wc.Length - 4, 4); //remove last OR and spaces

                //other histology from dropdown                
                wc.Append("OR path.PathHistology LIKE '%' + @histpathOther + '%' ");
                wc.Append(") ");
            }
            else if (histLength > 0 && histpathOther.Length == 0)
            {
                wc.Append("AND (");
                wc.Append("(path.PathHistology IN ( select LC.LkpCode from LookupCodes LC LEFT OUTER JOIN LookupCodeAttributes LCA ON LC.LookupCodeId=LCA.LookupCodeId where LCA.AttributeValue IN (" + histologies + ") )) OR ");
                wc.Remove(wc.Length - 4, 4); //remove last OR and spaces
                wc.Append(") ");
            }
            else if (histpathOther.Length > 0 && histLength == 0)
            {
                wc.Append("AND (path.PathHistology LIKE '%' + @histpathOther + '%' ");
                wc.Append(") ");
            }

            if (histpathGrade.Length > 0)
            {
                wc.Append("AND pathSG.PathGrade = '" + histpathGrade + "' ");
            }

            // Reference Number / Vial Number
            if (referenceNum.Length > 0)
            {
                wc.Append("AND s.specimenReferenceNumber LIKE '%' + @referenceNum + '%' ");
            }

            // MRN
            if (MRN.Length > 0)
            {
                wc.Append("AND MRN = '" + @MRN + "' ");
            }

            // Event Result
            if (eventResult.Length > 0)
            {
                wc.Append("AND se.EventResult LIKE '%' + @eventResult + '%' ");
            }

            // specimen type and subtypes 
            string bloodSubTypes = ConvertToSQLValuesInFormat(bloodSubTypeArr);
            string tissueSubTypes = ConvertToSQLValuesInFormat(tissueSubTypeArr);
            int bloodLength = bloodSubTypeArr.Length;
            int tissueLength = tissueSubTypeArr.Length;
            bool isBloodChecked = false;
            bool isTissueChecked = false;

            for (int i = 0; i < typeArr.Length; i++)
            {
                string type = typeArr[i];
                if (type.Equals("Blood"))
                {
                    isBloodChecked = true;
                }
                else if (type.Equals("Tissue"))
                {
                    isTissueChecked = true;
                }
            }

            wc.Append("AND (");

            if (bloodSubTypes.Length > 0)
            {
                wc.Append("(s.SpecimenType='Blood' AND s.SpecimenSubType IN (" + bloodSubTypes + ")) OR ");
            }
            else if ((bloodSubTypes.Length == 0 && isBloodChecked) || (!isBloodChecked && !isTissueChecked))
            {
                wc.Append("(s.SpecimenType='Blood') OR ");
            }

            if (tissueSubTypes.Length > 0)
            {
                wc.Append("(s.SpecimenType='Tissue' AND s.SpecimenSubType IN (" + tissueSubTypes + ")) OR ");
            }
            else if ((tissueSubTypes.Length == 0 && isTissueChecked) || (!isTissueChecked && !isBloodChecked))
            {
                wc.Append("(s.SpecimenType='Tissue') OR ");
            }

            wc.Remove(wc.Length - 4, 4); //remove last OR and spaces
            wc.Append(") ");

            if (status.Length > 0)
            {
                wc.Append("AND s.specimenStatus = @status ");
            }
            if (!showAll)
            {
                wc.Append("AND s.specimenStatus NOT LIKE '%Unavailable%' ");
            }

            if (wc.Length > 0)
            {
                wc.Remove(0, 3); //removes the first AND
                wc.Insert(0, " WHERE ");
            }

            sql += wc.ToString();

            sql += " AND (path.PathHistology!='Cytogenetic Report' OR path.PathHistology IS NULL) ";

            if (totalCountOnly == false)
            {
                sql += ")a WHERE Num BETWEEN " + startRow + " AND " + endRow + " ";
            }

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "status", status);
            DataAccessHelper.AddStringInputParam(com, "orgQty", orgQty);
            DataAccessHelper.AddStringInputParam(com, "units", units);
            DataAccessHelper.AddStringInputParam(com, "remQty", remQty);
            DataAccessHelper.AddStringInputParam(com, "RemUnits", RemUnits);
            DataAccessHelper.AddStringInputParam(com, "referenceNum", referenceNum);
            DataAccessHelper.AddStringInputParam(com, "MRN", MRN);
            DataAccessHelper.AddStringInputParam(com, "boxName", boxName);
            DataAccessHelper.AddStringInputParam(com, "identifier", identifier);
            DataAccessHelper.AddStringInputParam(com, "histpathOther", histpathOther);
            DataAccessHelper.AddStringInputParam(com, "eventResult", eventResult);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public DataTable CheckBloodForTissue(int saId, string datasetSql)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT Distinct SpecimenType from Specimens s ";
            sql += "INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON sa.PatientId= ds.PatientId where s.SpecimenAccessionId=" + saId + "";

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }

        public DataTable GetCytogeneticRpt(string datasetSql)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT s.specimenid, p.patientid AS PatientId, sa.SpecimenAccessionId, s.specimenReferenceNumber AS RefNum, ";
            sql += "p.ptMRN AS MRN,(p.PtLastName + ', ' + p.PtFirstName) AS PtName,pTest.PathTest FROM Specimens s ";
            sql += "INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON sa.PatientId= ds.PatientId ";
            sql += "INNER JOIN Patients p ON p.patientid=sa.patientid ";
            sql += "INNER JOIN OperatingRoomDetails op ON op.PatientId = sa.PatientId ";
            sql += "AND (op.OpDate=sa.AccessionDate OR op.OpDate=sa.DateBanked) AND op.OpService='Neurosurgery' ";
            sql += "INNER JOIN Pathology pa ON pa.patientid=op.patientid ";
            sql += "AND pa.OperatingRoomDetailId=op.OperatingRoomDetailId ";
            sql += "LEFT OUTER JOIN PathTest pTest ON pTest.PathologyId=pa.PathologyId ";
            sql += "WHERE (s.SpecimenType='Tissue' AND s.SpecimenSubType = 'Tumor') AND ((pTest.PathTest LIKE '%1p%' OR pTest.PathTest LIKE '%19q%') OR pTest.PathTest LIKE 'EGFR %')";

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }


        #region GetBreastResearchSpecimens ... takes array of strings
        /// <summary>
        /// Get specimens based on breast cancer clinical/research data
        /// </summary>
        /// <param name="ageDiagFrom">Youngest age of patient at diagnosis.</param>
        /// <param name="ageDiagTo">Oldest age of patient at diagnosis.</param>
        /// <param name="priHistDiag"></param>
        /// <param name="histpathGrade"></param>
        /// <param name="ER"></param>
        /// <param name="PR"></param>
        /// <param name="Her2ICC"></param>
        /// <param name="nodePositive"></param>
        /// <param name="adjuvAgent"></param>
        /// <param name="replapseStatus"></param>
        /// <param name="bloodSamplesArr"></param>
        /// <param name="tissueSamplesArr"></param>
        /// <param name="tissueType"></param>
        /// <returns>DataTable with specimens based on breast cancer search criteria.</returns>
        public DataTable GetBreastResearchSpecimens(string ageDiagFrom, string ageDiagTo,
                                                    string priHistDiag, string histpathGrade,
                                                    string ER, string PR, string Her2ICC, string nodePositive,
                                                    string adjuvAgent, string replapseStatus,
                                                    string[] typeArr, string[] bloodSubTypeArr, string[] tissueSubTypeArr,
                                                    string preservationType, string idType, bool showAll)
        {
            DataTable dt = new DataTable();

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT DISTINCT s.specimenid, p.patientid, sc.collectionName, sa.AccessionProcName, idn.identifier, ");
            sql.Append("s.specimenReferenceNumber, s.specimenType, s.specimenSubType, s.specimenPreservationType, s.specimenStatus, s.specimenOriginalQty, s.specimenRemainingQty, s.specimenUnits, sp.boxId, sb.boxName, sp.positionId, sp.Position ");
            sql.Append("FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ");
            sql.Append("LEFT OUTER JOIN SpecimenPositions sp ON sp.boxId=s.boxId AND sp.positionId=s.positionId ");
            sql.Append("LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=sp.boxId ");
            sql.Append("LEFT OUTER JOIN Patients p ON p.patientid=sa.patientid ");
            sql.Append("LEFT OUTER JOIN Identifiers idn ON idn.patientid=p.patientId AND idn.idType='" + idType + "' ");
            sql.Append("LEFT OUTER JOIN Status st ON st.patientId=p.patientId AND st.statusDisease='Breast Cancer' ");
            sql.Append("LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=s.collectionId ");
            sql.Append("LEFT OUTER JOIN Pathology path ON path.patientid=p.patientid ");
            sql.Append("LEFT OUTER JOIN PathologyStageGrade pathSG ON pathSG.PathologyId=path.PathologyId ");
            sql.Append("LEFT OUTER JOIN PathTest PathT ON PathT.PathologyId=path.PathologyId ");

            StringBuilder wc = new StringBuilder(); //WHERE clause
            if (ageDiagFrom.Length > 0 && ageDiagTo.Length > 0)
            {
                wc.Append("AND dateDiff(year,p.ptBirthDate,st.StatusDate) BETWEEN '" + ageDiagFrom + "' AND '" + ageDiagTo + "' ");
            }
            else if (ageDiagFrom.Length > 0)
            {
                wc.Append("AND dateDiff(year,p.ptBirthDate,st.StatusDate) >= '" + ageDiagFrom + "' ");
            }
            else if (ageDiagTo.Length > 0)
            {
                wc.Append("AND dateDiff(year,p.ptBirthDate,st.StatusDate) <= '" + ageDiagTo + "' ");
            }

            if (priHistDiag.Length > 0)
            {
                wc.Append("AND path.PathHistology = '" + priHistDiag + "' ");
            }
            if (histpathGrade.Length > 0)
            {
                wc.Append("AND pathSG.PathStageSystem = '" + histpathGrade + "' ");
            }

            if (ER.Length > 0)
            {
                wc.Append("AND pathT.PathTest = '" + ER + "' AND pathT.PathResult = '" + ER + "' ");
            }
            if (PR.Length > 0)
            {
                wc.Append("AND pathT.PathTest = '" + PR + "' AND pathT.PathResult = '" + PR + "' ");
            }
            if (Her2ICC.Length > 0)
            {
                wc.Append("AND pathT.PathTest = '" + Her2ICC + "' AND pathT.PathResult = '" + Her2ICC + "' ");
            }

            // specimen type and subtypes 
            string bloodSubTypes = ConvertToSQLValuesInFormat(bloodSubTypeArr);
            string tissueSubTypes = ConvertToSQLValuesInFormat(tissueSubTypeArr);
            int bloodLength = bloodSubTypeArr.Length;
            int tissueLength = tissueSubTypeArr.Length;
            bool isBloodChecked = false;
            bool isTissueChecked = false;

            for (int i = 0; i < typeArr.Length; i++)
            {
                string type = typeArr[i];
                if (type.Equals("Blood"))
                {
                    isBloodChecked = true;
                }
                else if (type.Equals("Tissue"))
                {
                    isTissueChecked = true;
                }
            }

            wc.Append("AND (");

            if (bloodSubTypes.Length > 0)
            {
                wc.Append("(s.SpecimenType='Blood' AND s.SpecimenSubType IN (" + bloodSubTypes + ")) OR ");
            }
            else if ((bloodSubTypes.Length == 0 && isBloodChecked) || (!isBloodChecked && !isTissueChecked))
            {
                wc.Append("(s.SpecimenType='Blood') OR ");
            }

            if (tissueSubTypes.Length > 0)
            {
                wc.Append("(s.SpecimenType='Tissue' AND s.SpecimenSubType IN (" + tissueSubTypes + ")) OR ");
            }
            else if ((tissueSubTypes.Length == 0 && isTissueChecked) || (!isTissueChecked && !isBloodChecked))
            {
                wc.Append("(s.SpecimenType='Tissue') OR ");
            }

            wc.Remove(wc.Length - 4, 4); //remove last OR and spaces
            wc.Append(") ");

            if (preservationType.Length > 0)
            {
                // TODO: this reference is wrong
                //wc.Append("AND path.PathSpecimenType LIKE '" + preservationType + "'AND path.PathSite = 'Breast'");
                wc.Append("AND s.specimenPreservationType LIKE '" + preservationType + "' ");
            }

            if (!showAll)
            {
                wc.Append("AND s.specimenStatus NOT LIKE '%Unavailable%' ");
            }

            if (wc.Length > 0)
            {
                wc.Remove(0, 3); //removes the first AND
                wc.Insert(0, " WHERE ");
            }

            sql.Append(wc.ToString());

            sql.Append("ORDER BY sp.boxId, sp.positionId ");

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }
        #endregion

        /// <summary>
        /// Same as GetBreastResearchSpecimens but takes a range of record to be returned and allows option of just returning the record count
        /// ONLY SQL SERVER 2005 Compatible
        /// </summary>
        /// <param name="ageDiagFrom"></param>
        /// <param name="ageDiagTo"></param>
        /// <param name="priHistDiag"></param>
        /// <param name="histpathGrade"></param>
        /// <param name="ER"></param>
        /// <param name="PR"></param>
        /// <param name="Her2ICC"></param>
        /// <param name="nodePositive"></param>
        /// <param name="adjuvAgent"></param>
        /// <param name="replapseStatus"></param>
        /// <param name="typeArr"></param>
        /// <param name="bloodSubTypeArr"></param>
        /// <param name="tissueSubTypeArr"></param>
        /// <param name="preservationType"></param>
        /// <param name="idType"></param>
        /// <param name="showAll"></param>
        /// <returns></returns>
        public DataTable GetBreastResearchSpecimensInRange(bool totalCountOnly, string ageDiagFrom, string ageDiagTo,
                                                    string priHistDiag, string histpathGrade,
                                                    string ER, string PR, string Her2ICC, string nodePositive,
                                                    string adjuvAgent, string replapseStatus,
                                                    string[] typeArr, string[] bloodSubTypeArr, string[] tissueSubTypeArr,
                                                    string preservationType, string idType, bool showAll, int startRow, int endRow, string datasetSql)
        {
            DataTable dt = new DataTable();
            StringBuilder sql = new StringBuilder();

            if (totalCountOnly == false)
            {
                sql.Append("SELECT a.* FROM (");
                sql.Append("SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY sb.boxName, sp.positionId) AS Num, s.specimenid, p.Patientid, sa.AccessionProcName, ");
                sql.Append("s.specimenReferenceNumber, idn.identifier, MRN, s.specimenType, s.specimenSubType, s.specimenPreservationType, s.specimenStatus, s.specimenOriginalQty, s.specimenRemainingQty, s.specimenUnits, s.boxId, sb.boxName, s.positionId, sp.Position,s.ParentSpecimenId ");
            }
            else
            {
                sql.Append("Select Count(DISTINCT s.specimenid) AS \"TotalCount\" ");
            }
            sql.Append("FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ");
            sql.Append("INNER JOIN (" + datasetSql + ") AS ds ON sa.PatientId= ds.PatientId ");
            sql.Append("LEFT OUTER JOIN SpecimenPositions sp ON sp.positionId=s.positionId ");
            sql.Append("LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=s.boxId ");
            sql.Append("LEFT OUTER JOIN (SELECT PtMRN AS MRN, PatientId FROM Patients) p ON p.patientid=sa.patientid ");
            sql.Append("LEFT OUTER JOIN Identifiers idn ON idn.patientid=p.patientId AND idn.idType='" + idType + "' ");
            sql.Append("LEFT OUTER JOIN Status st ON st.patientId=p.patientId AND st.statusDisease='Breast Cancer' ");
            sql.Append("LEFT OUTER JOIN Specimen_SpecimenCollections ssc ON ssc.specimenId=s.specimenId ");
            sql.Append("LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=ssc.collectionId ");
            sql.Append("LEFT OUTER JOIN Pathology path ON path.patientid=p.patientid ");
            sql.Append("LEFT OUTER JOIN PathologyStageGrade pathSG ON pathSG.PathologyId=path.PathologyId ");
            sql.Append("LEFT OUTER JOIN PathTest PathT ON PathT.PathologyId=path.PathologyId ");

            StringBuilder wc = new StringBuilder(); //WHERE clause
            if (ageDiagFrom.Length > 0 && ageDiagTo.Length > 0)
            {
                wc.Append("AND dateDiff(year,p.ptBirthDate,st.StatusDate) BETWEEN '" + ageDiagFrom + "' AND '" + ageDiagTo + "' ");
            }
            else if (ageDiagFrom.Length > 0)
            {
                wc.Append("AND dateDiff(year,p.ptBirthDate,st.StatusDate) >= '" + ageDiagFrom + "' ");
            }
            else if (ageDiagTo.Length > 0)
            {
                wc.Append("AND dateDiff(year,p.ptBirthDate,st.StatusDate) <= '" + ageDiagTo + "' ");
            }

            if (priHistDiag.Length > 0)
            {
                wc.Append("AND path.PathHistology = '" + priHistDiag + "' ");
            }
            if (histpathGrade.Length > 0)
            {
                wc.Append("AND pathSG.PathGrade = '" + histpathGrade + "' ");
            }

            if (ER.Length > 0)
            {
                wc.Append("AND pathT.PathTest = '" + ER + "' AND pathT.PathResult = '" + ER + "' ");
            }
            if (PR.Length > 0)
            {
                wc.Append("AND pathT.PathTest = '" + PR + "' AND pathT.PathResult = '" + PR + "' ");
            }
            if (Her2ICC.Length > 0)
            {
                wc.Append("AND pathT.PathTest = '" + Her2ICC + "' AND pathT.PathResult = '" + Her2ICC + "' ");
            }

            // specimen type and subtypes 
            string bloodSubTypes = ConvertToSQLValuesInFormat(bloodSubTypeArr);
            string tissueSubTypes = ConvertToSQLValuesInFormat(tissueSubTypeArr);
            int bloodLength = bloodSubTypeArr.Length;
            int tissueLength = tissueSubTypeArr.Length;
            bool isBloodChecked = false;
            bool isTissueChecked = false;

            for (int i = 0; i < typeArr.Length; i++)
            {
                string type = typeArr[i];
                if (type.Equals("Blood"))
                {
                    isBloodChecked = true;
                }
                else if (type.Equals("Tissue"))
                {
                    isTissueChecked = true;
                }
            }

            wc.Append("AND (");

            if (bloodSubTypes.Length > 0)
            {
                wc.Append("(s.SpecimenType='Blood' AND s.SpecimenSubType IN (" + bloodSubTypes + ")) OR ");
            }
            else if ((bloodSubTypes.Length == 0 && isBloodChecked) || (!isBloodChecked && !isTissueChecked))
            {
                wc.Append("(s.SpecimenType='Blood') OR ");
            }

            if (tissueSubTypes.Length > 0)
            {
                wc.Append("(s.SpecimenType='Tissue' AND s.SpecimenSubType IN (" + tissueSubTypes + ")) OR ");
            }
            else if ((tissueSubTypes.Length == 0 && isTissueChecked) || (!isTissueChecked && !isBloodChecked))
            {
                wc.Append("(s.SpecimenType='Tissue') OR ");
            }

            wc.Remove(wc.Length - 4, 4); //remove last OR and spaces
            wc.Append(") ");

            if (preservationType.Length > 0)
            {
                // TODO: this reference is wrong
                //wc.Append("AND path.PathSpecimenType LIKE '" + preservationType + "'AND path.PathSite = 'Breast'");
                wc.Append("AND s.specimenPreservationType LIKE '" + preservationType + "' ");
            }

            if (!showAll)
            {
                wc.Append("AND s.specimenStatus NOT LIKE '%Unavailable%' ");
            }

            if (wc.Length > 0)
            {
                wc.Remove(0, 3); //removes the first AND
                wc.Insert(0, " WHERE ");
            }

            sql.Append(wc.ToString());

            //sql.Append("ORDER BY sp.boxId, sp.positionId ");

            if (totalCountOnly == false)
            {
                sql.Append(")a WHERE Num BETWEEN " + startRow + " AND " + endRow + "");
            }

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }


        /// <summary>
        /// Same as GetProstateResearchByHistologyData but takes a range of record to be returned and allows option of just returning the record count
        /// ONLY SQL SERVER 2005 Compatible
        /// </summary>
        /// <param name="histology"></param>
        /// <returns></returns>
        public DataTable GetProstateResearchByHistologySpecimensInRange(bool totalCountOnly, string histology,
                                                     string idType, bool showAll, int startRow, int endRow, string datasetSql)
        {
            DataTable dt = new DataTable();
            string sql = String.Empty;


            if (totalCountOnly == false)
            {
                sql = @"
                      SELECT a.* FROM (  
                      SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY sb.boxName, s.positionId) AS Num,
                      s.specimenid, p.patientid, sa.AccessionProcName, s.specimenReferenceNumber,
                      path.pathHistology, p.ptMRN as MRN,  idn.identifier, 
                      s.specimenType, s.specimenSubType, 
                      DATEDIFF(year, p.PtBirthDate, GETDATE()) AS Age, s.specimenPreservationType,
                      s.specimenStatus, s.specimenOriginalQty,
                      s.specimenRemainingQty, s.specimenUnits,
                      site.siteName, storage.storageName, container.containerName,
                      s.boxId, sb.boxName, s.positionId, sp.position,
                      s.parentSpecimenId,  pp.pathGGS, pathSG.pathGrade, pathSG.pathStageGroup, labs.labdatetext as Last_PSA_Date, labs.labresult as PSA_Result ";
            }
            else
            {
                sql = @"Select Count(DISTINCT s.specimenid) AS 'TotalCount' ";
            }
            sql += @"
                  FROM Specimens s
                  INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid
                  LEFT OUTER JOIN Patients p ON p.patientid=sa.patientid
                  ";
            sql += @"INNER JOIN (" + datasetSql + ") AS ds ON p.PatientId= ds.PatientId ";
            sql += @"LEFT OUTER JOIN Identifiers idn ON idn.patientid=p.PatientId AND idn.idType='" + idType + "' ";
            sql += @"
                  LEFT OUTER JOIN SpecimenPositions sp ON sp.positionId=s.positionId
                  LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=s.boxId
                  LEFT OUTER JOIN SpecimenContainers container ON container.ContainerId = sb.ContainerId
                  LEFT OUTER JOIN SpecimenStorages storage On storage.StorageId = container.StorageId
                  LEFT OUTER JOIN SpecimenSites site ON site.SiteId = storage.SiteId
                  LEFT OUTER JOIN Specimen_SpecimenCollections ssc ON ssc.specimenId=s.specimenId
                  LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=ssc.collectionId
                  LEFT OUTER JOIN Pathology path ON path.patientid=p.patientid
                  LEFT OUTER JOIN ProstatectomyPath pp ON pp.PathologyId = path.PathologyId

                  LEFT OUTER JOIN PathologyStageGrade pathSG
                  ON pathSG.PathologyId=path.PathologyId
                  AND pathSG.PathologyStageGradeId =
                  (
                  SELECT TOP 1 PathologyStageGradeId
                  FROM PathologyStageGrade
                  WHERE PathologyId = path.PathologyId
                  ORDER BY
                  CASE PathQuality
                  WHEN 'RR' THEN 4
                  WHEN 'REV' THEN 3
                  WHEN 'STD' THEN 2
                  WHEN 'OUT' THEN 1
                  ELSE 0
                  END DESC
                  )

                  LEFT OUTER JOIN LabTests labs
                  ON P.PatientId = labs.PatientId
                  AND labs.LabTestId = (
                  SELECT TOP 1 LabTestId
                  FROM LabTests
                  WHERE PatientId = P.PatientId
                  AND LabTest = 'PSA'
                  ORDER BY
                  LabDate DESC,
                  CASE LabQuality
                  WHEN 'RR' THEN 4
                  WHEN 'STD' THEN 3
                  WHEN 'REV' THEN 2
                  WHEN 'OUT' THEN 1
                  ELSE 0
                  END DESC
                  )
                  WHERE path.PathHistology Like '%' + @Histology + '%'
                  AND path.PathNum = sa.PathologyReferenceNumber ";

            if (!showAll)
            {
                sql += @"AND s.specimenStatus NOT LIKE '%Unavailable%' ";
            }

            if (totalCountOnly == false)
            {
                sql += @") a WHERE Num BETWEEN " + startRow + " AND " + endRow + " ";
            }

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "Histology", histology);
            dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Same as GetProstateResearchByReferenceNumberData but takes a range of record to be returned and allows option of just returning the record count
        /// ONLY SQL SERVER 2005 Compatible
        /// </summary>
        /// <param name="histology"></param>
        /// <returns></returns>
        public DataTable GetProstateResearchByReferenceNumberSpecimensInRange(bool totalCountOnly, string referenceNumber,
                                                     string idType, bool showAll, int startRow, int endRow, string datasetSql)
        {
            DataTable dt = new DataTable();
            string sql = String.Empty;


            if (totalCountOnly == false)
            {
                sql = @"
                      SELECT a.* FROM (  
                      SELECT DISTINCT ROW_NUMBER() OVER (ORDER BY sb.boxName, s.positionId) AS Num,
                      s.specimenid, p.patientid, sa.AccessionProcName, s.specimenReferenceNumber,
                      path.pathHistology, p.ptMRN as MRN,  idn.identifier, 
                      s.specimenType, s.specimenSubType, 
                      DATEDIFF(year, p.PtBirthDate, GETDATE()) AS Age, s.specimenPreservationType,
                      s.specimenStatus, s.specimenOriginalQty,
                      s.specimenRemainingQty, s.specimenUnits,
                      site.siteName, storage.storageName, container.containerName,
                      s.boxId, sb.boxName, s.positionId, sp.position,
                      s.parentSpecimenId,  pp.pathGGS, pathSG.pathGrade, pathSG.pathStageGroup, labs.labdatetext as Last_PSA_Date, labs.labresult as PSA_Result ";
            }
            else
            {
                sql = @"Select Count(DISTINCT s.specimenid) AS 'TotalCount' ";
            }
            sql += @"
                  FROM Specimens s
                  INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid
                  LEFT OUTER JOIN Patients p ON p.patientid=sa.patientid
                  ";
            sql += @"INNER JOIN (" + datasetSql + ") AS ds ON p.PatientId= ds.PatientId ";
            sql += @"LEFT OUTER JOIN Identifiers idn ON idn.patientid=p.PatientId AND idn.idType='" + idType + "' ";
            sql += @"
                  LEFT OUTER JOIN SpecimenPositions sp ON sp.positionId=s.positionId
                  LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=s.boxId
                  LEFT OUTER JOIN SpecimenContainers container ON container.ContainerId = sb.ContainerId
                  LEFT OUTER JOIN SpecimenStorages storage On storage.StorageId = container.StorageId
                  LEFT OUTER JOIN SpecimenSites site ON site.SiteId = storage.SiteId
                  LEFT OUTER JOIN Specimen_SpecimenCollections ssc ON ssc.specimenId=s.specimenId
                  LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=ssc.collectionId
                  LEFT OUTER JOIN Pathology path ON path.patientid=p.patientid
                  LEFT OUTER JOIN ProstatectomyPath pp ON pp.PathologyId = path.PathologyId

                  LEFT OUTER JOIN PathologyStageGrade pathSG
                  ON pathSG.PathologyId=path.PathologyId
                  AND pathSG.PathologyStageGradeId =
                  (
                  SELECT TOP 1 PathologyStageGradeId
                  FROM PathologyStageGrade
                  WHERE PathologyId = path.PathologyId
                  ORDER BY
                  CASE PathQuality
                  WHEN 'RR' THEN 4
                  WHEN 'REV' THEN 3
                  WHEN 'STD' THEN 2
                  WHEN 'OUT' THEN 1
                  ELSE 0
                  END DESC
                  )

                  LEFT OUTER JOIN LabTests labs
                  ON P.PatientId = labs.PatientId
                  AND labs.LabTestId = (
                  SELECT TOP 1 LabTestId
                  FROM LabTests
                  WHERE PatientId = P.PatientId
                  AND LabTest = 'PSA'
                  ORDER BY
                  LabDate DESC,
                  CASE LabQuality
                  WHEN 'RR' THEN 4
                  WHEN 'STD' THEN 3
                  WHEN 'REV' THEN 2
                  WHEN 'OUT' THEN 1
                  ELSE 0
                  END DESC
                  )
                  WHERE s.specimenReferenceNumber Like '%' + @Reference# + '%'
                  AND path.PathNum = sa.PathologyReferenceNumber ";

            if (!showAll)
            {
                sql += @"AND s.specimenStatus NOT LIKE '%Unavailable%' ";
            }

            if (totalCountOnly == false)
            {
                sql += @") a WHERE Num BETWEEN " + startRow + " AND " + endRow + " ";
            }

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "Reference#", referenceNumber);
            dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }


        /// <summary>
        /// Gets all the collections that are available for putting specimens in (status "Available" or "Pending Transfer").
        /// </summary>
        /// <returns></returns>
        public DataTable GetAvailableCollectionsForSpecimens()
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                         "FROM SpecimenCollections " +
                         "WHERE CollectionStatus = 'Available' OR CollectionStatus = 'Pending Transfer' " +
                         "ORDER BY CollectionName ASC ";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }

        #endregion methods for Specimens



        #region methods for Collection
        /// <summary>
        /// Get the list of collections that match the parameters passed in.
        /// </summary>
        /// <param name="name">Name of the collection.</param>
        /// <param name="type">Type of the collection.</param>
        /// <param name="status">Status of the collection.</param>
        /// <param name="dateFrom">Start of the date range of the collection.</param>
        /// <param name="dateTo">End of the date range of the collection.</param>
        /// <param name="viewAll">Indicates if we should show collections with status 'Transaction Complete' or not.</param>
        /// <returns>DataTable with collections based on search criteria.</returns>
        public DataTable GetCollections(string name, string type, string status, string dateFrom, string dateTo, bool viewAll)
        {
            string sql = "SELECT sc.CollectionId, sc.CollectionName, sc.CollectionProjectCode, sc.CollectionType, sc.CollectionStatus, sc.CollectionAssignDate, sc.CollectionAssignNotes, COUNT(s.SpecimenId) AS SpecimensInCollection " +
                         "FROM SpecimenCollections sc LEFT OUTER JOIN Specimen_SpecimenCollections ssc ON ssc.CollectionId = sc.CollectionId " +
                         "LEFT OUTER JOIN Specimens s on s.SpecimenId=ssc.SpecimenId " +
                         "WHERE sc.CollectionName LIKE '%' + @name + '%' ";

            if (type.Length > 0)
            {
                sql += "AND sc.CollectionType = '" + type + "' ";
            }

            if (status.Length > 0)
            {
                sql += "AND sc.CollectionStatus = '" + status + "' ";
            }

            if (dateFrom.Length > 0 && dateTo.Length > 0)
            {
                sql += "AND sc.CollectionAssignDate BETWEEN '" + dateFrom + "' AND '" + dateTo + "' ";
            }
            else if (dateFrom.Length > 0)
            {
                sql += "AND sc.CollectionAssignDate >= '" + dateFrom + "' ";
            }
            else if (dateTo.Length > 0)
            {
                sql += "AND sc.CollectionAssignDate <= '" + dateTo + "' ";
            }

            if (viewAll == false)
            {
                sql += "AND (sc.CollectionStatus <> 'Transaction Complete' OR sc.CollectionStatus IS NULL) ";
            }

            sql += "GROUP BY sc.CollectionId, sc.CollectionName, sc.CollectionProjectCode, sc.CollectionType, sc.CollectionStatus, sc.CollectionAssignDate, sc.CollectionAssignNotes ";
            sql += "ORDER BY sc.CollectionName ASC";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "name", name);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public DataSet GetCollectionDetails(int collectionId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Collections_GetDetails");
            DataAccessHelper.AddIntInputParam(com, "collectionId", collectionId);
            DataAccessHelper.AddStringInputParam(com, "arg", "");

            return DataAccessHelper.GetList(com);
        }

        /// <summary>
        /// Get all specimens in the collection with the passed in Id.
        /// </summary>
        /// <param name="colId">Id of the collection</param>
        /// <param name="idtype">Currently "Tumor Bank Number"</param>
        /// <returns>DataTable with all specimens in the collection</returns>
        public DataTable GetSpecimensInCollection(int colId, string idtype)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT s.specimenid, sa.accessionProcName, i.identifier, " +
                         "s.specimenReferenceNumber, s.specimenType, s.specimenSubType, s.specimenStatus, " +
                         "s.specimenOriginalQty, s.specimenRemainingQty, s.specimenUnits, sp.boxId, sb.boxName, sp.positionId, sp.Position " +
                         "FROM Specimens s INNER JOIN SpecimenAccessions sa " +
                         "ON sa.specimenaccessionid=s.specimenaccessionid " +
                         "LEFT OUTER JOIN SpecimenPositions sp ON sp.boxId=s.boxId AND sp.positionId=s.positionId " +
                         "LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=sp.boxId " +
                         "LEFT OUTER JOIN Patients p on p.patientid=sa.patientid " +
                         "LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType = '" + idtype + "') " +
                         "AS i on p.patientid = i.patientid " +
                         "LEFT OUTER JOIN Specimen_SpecimenCollections ssc on ssc.specimenId=s.specimenId " +
                         "WHERE ssc.collectionId = " + colId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }

        public DataTable GetSpecimensInCollectionForPrint(int colId, string idtype)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT i.identifier AS '" + idtype + "', " +
                         "s.specimenReferenceNumber AS 'Reference #', s.specimenType AS 'Type', s.specimenSubType AS 'SubType', s.specimenStatus AS 'Status', " +
                         "s.specimenOriginalQty  AS 'Qty', s.specimenUnits AS 'Units', sb.boxName AS 'Box', sp.position AS 'Position' " +
                         "FROM Specimens s INNER JOIN SpecimenAccessions sa " +
                         "ON sa.specimenaccessionid=s.specimenaccessionid " +
                         "LEFT OUTER JOIN SpecimenPositions sp ON sp.boxId=s.boxId AND sp.positionId=s.positionId " +
                         "LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=sp.boxId " +
                         "LEFT OUTER JOIN Patients p on p.patientid=sa.patientid " +
                         "LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType = '" + idtype + "') " +
                         "AS i on p.patientid = i.patientid " +
                         "LEFT OUTER JOIN Specimen_SpecimenCollections ssc on ssc.specimenId=s.specimenId " +
                         "WHERE ssc.collectionId = " + colId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }

        /// <summary>
        /// Get the Id of the collection by its name
        /// </summary>
        /// <param name="collectionName">Name of the collection</param>
        /// <returns>The Id of the collection with the passed in name</returns>
        public int GetCollectionIdByName(string collectionName)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT CollectionId " +
                         "FROM SpecimenCollections " +
                         "WHERE CollectionName = '" + collectionName + "'";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return int.Parse(dt.Rows[0]["CollectionId"].ToString());
        }


        /// <summary>
        /// Get the collection with the passed in collection name
        /// </summary>
        /// <param name="collectionName">Name of the collection we want</param>
        /// <returns>DataTable with the collection with the passed in name</returns>
        public DataTable GetCollectionByName(string collectionName)
        {
            string sql = "SELECT * " +
                         "FROM SpecimenCollections " +
                         "WHERE CollectionName = @CollectionName";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "CollectionName", collectionName);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];

            return dt;
        }

        /// <summary>
        /// Get Parentkey by SpeciemnId
        /// </summary>
        /// <param name="SpecimenId">SpecimenId we want</param>
        /// <returns>SpecimenId with passed</returns>
        public int GetPrimKeybySpecId(int sId)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT SpecimenCollectionId " +
                         "FROM Specimen_SpecimenCollections " +
                         "WHERE SpecimenId = " + sId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return int.Parse(dt.Rows[0]["SpecimenCollectionId"].ToString());
        }

        /// <summary>
        /// Get all Collections of each specimen passing SpecimenId
        /// </summary>
        /// <param name="collectionName">Name of collections list</param>
        /// <returns>DataTable with the collections with the passed in SpecimenId</returns>
        public DataTable GetCollectionsBySpecimenId(int sId)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT sc.CollectionId, sc.CollectionName " +
                         "FROM SpecimenCollections sc LEFT OUTER JOIN Specimen_SpecimenCollections ssc ON ssc.CollectionId = sc.CollectionId " +
                         "WHERE ssc.SpecimenId = " + sId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }

        #endregion methods for Collection



        #region methods for Transfers
        /// <summary>
        /// Gets all the collections that are available for (transfer) requests (status "Available").
        /// </summary>
        /// <returns></returns>
        public DataTable GetAvailableCollections()
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                         "FROM SpecimenCollections " +
                //"WHERE SpecimenRequestId IS NULL";
                // SHOULD THE WHERE CLAUSE BE BASED ON THE COLLECTION STATUS?
                        "WHERE CollectionStatus = 'Available' " +
                        "ORDER BY CollectionName ASC ";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }

        public DataTable GetCollectionsByRequestId(int requestId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                         "FROM SpecimenCollections " +
                         "WHERE SpecimenRequestId=" + requestId + " " +
                         "ORDER BY CollectionName ASC ";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }


        public DataTable GetRequests(string name, string type, string status, string dateFrom, string dateTo, bool viewAll)
        {
            string sql = "SELECT * " +
                         "FROM SpecimenRequests " +
                         "WHERE RequestIdentifier LIKE '%' + @name + '%' ";

            if (type.Length > 0)
            {
                sql += "AND RequestType = '" + type + "' ";
            }

            if (status.Length > 0)
            {
                sql += "AND RequestStatus = '" + status + "' ";
            }

            if (dateFrom.Length > 0 && dateTo.Length > 0)
            {
                sql += "AND RequestDate BETWEEN '" + dateFrom + "' AND '" + dateTo + "' ";
            }
            else if (dateFrom.Length > 0)
            {
                sql += "AND RequestDate >= '" + dateFrom + "' ";
            }
            else if (dateTo.Length > 0)
            {
                sql += "AND RequestDate <= '" + dateTo + "' ";
            }

            if (viewAll == false)
            {
                sql += "AND (RequestStatus <> 'Received' OR RequestStatus IS NULL) ";
            }

            sql += "ORDER BY RequestIdentifier ASC";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "name", name);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }


        /// <summary>
        /// Gets the distribution associated with the request Id.
        /// </summary>
        /// <param name="requestId"></param>
        /// <returns></returns>
        public DataTable GetDistributionByRequestId(int requestId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                         "FROM SpecimenRequests r, SpecimenDistributions d " +
                         "WHERE d.SpecimenRequestId=" + requestId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        public DataTable GetExisitingDistribution(int distributionId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                         "FROM SpecimenDistributions " +
                         "WHERE DistributionId=" + distributionId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        public void UpdateRequestStatus(int rId, string rStatus)
        {
            DataTable dt = new DataTable();

            string sql = "UPDATE SpecimenRequests " +
                         "SET RequestStatus='" + rStatus + "' " +
                         "WHERE SpecimenRequestId=" + rId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
        }

        /// <summary>
        /// Get a Specimen Request by name (RequestIdentifier).
        /// </summary>
        /// <param name="requestName"></param>
        /// <returns></returns>
        public DataTable GetRequestByName(string requestName)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                         "FROM SpecimenRequests " +
                         "WHERE RequestIdentifier = '" + requestName + "'";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }


        /// <summary>
        /// Get details of all the specimens and boxes in the collections part of this request.
        /// </summary>
        /// <param name="requestId"></param>
        /// <returns></returns>
        public DataTable GetReceivedRequestDetails(int requestId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                         "FROM SpecimenCollections sc INNER JOIN Specimens s ON s.CollectionId = sc.CollectionId " +
                         "LEFT OUTER JOIN SpecimenBoxes sb ON sb.BoxId = s.BoxId " +
                         "WHERE sc.SpecimenRequestId = " + requestId + " ";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        /// <summary>
        /// Gets all boxes (id and name) that are part of the collection
        /// If there are specimens in the collection, with no box associated, 
        /// it also adds a new "Other" box with id 0
        /// </summary>
        /// <param name="colId">Collection Id</param>
        /// <returns></returns>
        public DataTable GetBoxesByCollectionId(int colId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT DISTINCT COALESCE(sb.BoxId, 0) BoxId, COALESCE(sb.BoxName, 'Other Unboxed Specimens') BoxName " +
                        "FROM Specimens s LEFT OUTER JOIN SpecimenBoxes sb ON sb.BoxId=s.BoxId " +
                        "LEFT OUTER JOIN Specimen_SpecimenCollections ssc ON ssc.SpecimenId=s.SpecimenId " +
                        "WHERE ssc.CollectionId = " + colId +
                        "GROUP BY sb.BoxId, sb.BoxName ";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }

        /// <summary>
        /// Gets all specimens that are part of a collection but are not in a box 
        /// </summary>
        /// <param name="colId">Collection Id</param>
        /// <returns></returns>
        public DataTable GetUnboxedSpecimensByCollectionId(int colId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT s.SpecimenId, s.SpecimenReferenceNumber " +
                        "FROM Specimens s " +
                        "WHERE s.CollectionId = " + colId + " AND s.BoxId IS NULL ";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }

        /// <summary>
        /// Gets all specimens in the box.
        /// Adds a custom column "Transferable" with values 
        /// "yes" if the specimen is part of the collection
        /// "no" otherwise
        /// </summary>
        /// <param name="boxId"></param>
        /// <returns></returns>
        public DataTable GetSpecimensByBoxId(int boxId, int colId)
        {
            string sql = "SELECT s.SpecimenId, s.SpecimenReferenceNumber, s.BoxId, sp.PositionId, sp.Position, ";
            sql += "CASE ";
            sql += "WHEN ssc.CollectionId = 0 THEN 'yes'   ";
            sql += "ELSE 'no'   ";
            sql += "END AS Transferable   ";
            sql += "FROM Specimens s  ";
            sql += "INNER JOIN SpecimenPositions sp  ";
            sql += "ON s.PositionId=sp.PositionId ";
            sql += "LEFT OUTER JOIN Specimen_SpecimenCollections ssc ";
            sql += "ON ssc.SpecimenId = s.SpecimenId AND ssc.CollectionId = @CollectionId ";
            sql += "WHERE s.BoxId = @BoxId";

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "BoxId", boxId);
            DataAccessHelper.AddIntInputParam(cmd, "CollectionId", colId);
            DataTable dt = new DataTable();
            DataAccessHelper.GetList(cmd, dt);

            return dt;
        }

        // I added this because the app wouldn't compile on 9/10/08; SpecimenStorageBox.aspx.cs line 48; FS
        public DataTable GetSpecimensByBoxId(int boxId)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT s.SpecimenId, s.SpecimenReferenceNumber, s.BoxId, sp.PositionId, sp.Position " +
                        "FROM Specimens s INNER JOIN SpecimenPositions sp ON s.PositionId=sp.PositionId " +
                        "WHERE s.BoxId=" + boxId + " ";
            DataAccessHelper.ExecuteSql(sql, dt);
            return dt;
        }

        public DataTable GetSpecimensInBox(int boxId)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT s.SpecimenId, s.SpecimenReferenceNumber, s.BoxId " +
                        "FROM Specimens s " +
                        "WHERE s.BoxId=" + boxId + " ";
            DataAccessHelper.ExecuteSql(sql, dt);
            return dt;
        }

        public DataTable GetSpecimensInBoxbyOrder(int boxId)
        {
            DataTable dt = new DataTable();
            string sql = "SELECT s.SpecimenId, s.SpecimenReferenceNumber, s.BoxId " +
                        "FROM Specimens s " +
                        "WHERE s.BoxId=" + boxId + " " +
                        "order by s.SpecimenReferenceNumber, s.SpecimenId";
            DataAccessHelper.ExecuteSql(sql, dt);
            return dt;
        }

        #endregion for Transfers

        #region Protocol Specimens

        private static readonly string SPECIMEN_TRANSFER_SQL_FORMAT =
@"
SELECT
    r.SpecimenRequestId,
    d.DistributionId,
    c.CollectionId,
	COUNT(sc.SpecimenCollectionId) AS SpecimenCount,
    RequestIdentifier,
	RequestDate,
	DispatchedDate,
	DispatchedContact,
	DispatchedInstitution,
    ReceivedDate,
	ReceivedContact,
	ReceivedInstitution,
	DispatchedTrackingNumber
FROM SpecimenRequests r
INNER JOIN SpecimenDistributions d
	ON r.SpecimenRequestId = d.SpecimenRequestId
INNER JOIN SpecimenCollections c
	ON r.SpecimenRequestId = c.SpecimenRequestId
INNER JOIN Specimen_SpecimenCollections sc
	ON c.CollectionId = sc.CollectionId
INNER JOIN Specimens s
    ON sc.SpecimenId = s.SpecimenId
INNER JOIN SpecimenAccessions sa
	ON s.SpecimenAccessionId = sa.SpecimenAccessionId
INNER JOIN ({0}) ds
    ON sa.PatientId = ds.PatientId
INNER JOIN PatientProtocols pp
	ON ds.PatientId = pp.PatientId AND s.SpecimenReferenceNumber LIKE pp.PtProtocolStudyId + '%'
INNER JOIN Protocols p
    ON pp.ProtocolId = p.ProtocolId
WHERE
	 {1}
GROUP BY
    r.SpecimenRequestId,
    d.DistributionId,
    c.CollectionId,
    RequestIdentifier,
	RequestDate,
	DispatchedDate,
	DispatchedContact,
	DispatchedInstitution,
    ReceivedDate,
	ReceivedContact,
	ReceivedInstitution,
	DispatchedTrackingNumber
ORDER BY
    r.SpecimenRequestId DESC";

        private static readonly string SPECIMEN_SEARCH_BY_TRANSFER_SQL_FORMAT =
@"
SELECT DISTINCT
    SpecimenReferenceNumber,
    RequestIdentifier,
    r.SpecimenRequestId,
    d.DistributionId,
    c.CollectionId    
FROM SpecimenRequests r
INNER JOIN SpecimenDistributions d
	ON r.SpecimenRequestId = d.SpecimenRequestId
INNER JOIN SpecimenCollections c
	ON r.SpecimenRequestId = c.SpecimenRequestId
INNER JOIN Specimen_SpecimenCollections sc
	ON c.CollectionId = sc.CollectionId
INNER JOIN Specimens s
    ON sc.SpecimenId = s.SpecimenId
INNER JOIN SpecimenAccessions sa
	ON s.SpecimenAccessionId = sa.SpecimenAccessionId
INNER JOIN ({0}) ds
    ON sa.PatientId = ds.PatientId
INNER JOIN PatientProtocols pp
	ON ds.PatientId = pp.PatientId AND s.SpecimenReferenceNumber LIKE pp.PtProtocolStudyId + '%'
INNER JOIN Protocols p
    ON pp.ProtocolId = p.ProtocolId
WHERE
	 {1}
ORDER BY
    RequestIdentifier ASC";

        /// <summary>
        /// Returns a list of specimens based on Protocol patients.
        /// Optionally filtered by search params.
        /// </summary>
        /// <param name="protocolId">The protocol to search</param>
        /// <param name="datasetSQL">The dataset to search</param>
        /// <param name="searchString">The optional string to search</param>
        /// <param name="searchColumn">The optional column to search</param>
        /// <param name="includeStatuses"></param>
        /// <param name="excludeStatuses"></param>
        /// <returns></returns>
        public DataTable GetSpecimenInventoryByProtocol(int protocolId, string datasetSQL, string searchString, string searchColumn, string[] includeStatuses, string[] excludeStatuses)
        {
            string[] searchColumns = new string[] { "PtProtocolStudyId", "SpecimenReferenceNumber", "SpecimenStatus", "SpecimenSite" };
            string [] searchLikeColumns = new string[] { "SpecimenReferenceNumber", "PtProtocolStudyId" };
            string sql =
@"
SELECT
	sa.*,
    s.*,
    pp.PatientProtocolId,
    pp.PtProtocolStudyId
FROM SpecimenAccessions sa
INNER JOIN 
(
    SELECT
        s.*,
        sites.ShortName AS [SpecimenSite]
    FROM Specimens s
    LEFT OUTER JOIN ProjectOrganization sites
        ON LEFT(s.SpecimenReferenceNumber, 2) = sites.OrgNum
)
s
    ON sa.SpecimenAccessionId = s.SpecimenAccessionId
INNER JOIN ({0}) ds
    ON sa.PatientId = ds.PatientId
INNER JOIN PatientProtocols pp
	ON ds.PatientId = pp.PatientId AND s.SpecimenReferenceNumber LIKE pp.PtProtocolStudyId + '%'
WHERE {1}
            ";
            // build search clause
            List<string> searchClauses = new List<string>();
            // required search
            searchClauses.Add("pp.ProtocolId = @ProtocolId");
            // optional search sql
            if (!string.IsNullOrEmpty(searchColumn) && searchColumns.Contains(searchColumn))
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    // special case
                    if (searchLikeColumns.Contains(searchColumn))
                        searchClauses.Add(searchColumn + " LIKE '%' + @SearchString + '%'");
                    else
                        searchClauses.Add(searchColumn + " = @SearchString");
                }
                else
                {
                    searchClauses.Add(searchColumn + " IS NULL");
                }
            }
            // optional: include statuses
            if (includeStatuses.Length > 0)
            {
                string[] pNames = new string[includeStatuses.Length];
                for (int i = 0; i < includeStatuses.Length; i++)
                {
                    string pName = "@IncludeStatus_" + i;
                    pNames[i] = pName;
                }
                searchClauses.Add("SpecimenStatus IN(" + string.Join(",", pNames) + ")");
            }
            if (excludeStatuses.Length > 0)
            {
                string[] pNames = new string[excludeStatuses.Length];
                for (int i = 0; i < excludeStatuses.Length; i++)
                {
                    string pName = "@ExcludeStatus_" + i;
                    pNames[i] = pName;
                }
                searchClauses.Add("SpecimenStatus NOT IN(" + string.Join(",", pNames) + ")");
            }
            // optional: exclude statuses
            string whereSQL = string.Join(" AND ", searchClauses.ToArray());
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(sql, datasetSQL, whereSQL));
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            // optional search params
            if (!string.IsNullOrEmpty(searchString) && !string.IsNullOrEmpty(searchColumn) && searchColumns.Contains(searchColumn))
            {
                DataAccessHelper.AddStringInputParam(com, "SearchString", searchString);
            }
            // optional: add status params
            if (includeStatuses.Length > 0)
            {
                for (int i = 0; i < includeStatuses.Length; i++)
                    DataAccessHelper.AddStringInputParam(com, "IncludeStatus_" + i, includeStatuses[i]);
            }
            if (excludeStatuses.Length > 0)
            {
                for (int i = 0; i < excludeStatuses.Length; i++)
                    DataAccessHelper.AddStringInputParam(com, "ExcludeStatus_" + i, excludeStatuses[i]);
            }
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns dataset comprised of DISTINCT PtProtocolStudyId, DISTINCT SpecimenStatus
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="datasetSQL"></param>
        /// <param name="includeStatuses"></param>
        /// <param name="excludeStatuses"></param>
        /// <returns></returns>
        public DataSet GetSpecimenInventoryFiltersByProtocol(int protocolId, string datasetSQL, string[] includeStatuses, string[] excludeStatuses)
        {
            string[] searchColumns = new string[] { "PtProtocolStudyId", "SpecimenStatus" };
            string baseSQL =
@"
SELECT ISNULL({0},'') AS [FieldValue], COUNT(SpecimenId) AS [FieldCount], ISNULL({0},'[NONE]') + ' (' +  CAST(COUNT(SpecimenId) as varchar(max)) + ')' AS [FieldText]
FROM SpecimenAccessions sa
INNER JOIN Specimens s
    ON sa.SpecimenAccessionId = s.SpecimenAccessionId
INNER JOIN ({1}) ds
    ON sa.PatientId = ds.PatientId
INNER JOIN PatientProtocols pp
	ON ds.PatientId = pp.PatientId AND s.SpecimenReferenceNumber LIKE pp.PtProtocolStudyId + '%'
WHERE {2}
GROUP BY {0}
            ";
            List<string> searchClauses = new List<string>();
            searchClauses.Add("pp.ProtocolId = @ProtocolId");
            // optional: include statuses
            if (includeStatuses.Length > 0)
            {
                string[] pNames = new string[includeStatuses.Length];
                for (int i = 0; i < includeStatuses.Length; i++)
                {
                    string pName = "@IncludeStatus_" + i;
                    pNames[i] = pName;
                }
                searchClauses.Add("SpecimenStatus IN(" + string.Join(",", pNames) + ")");
            }
            if (excludeStatuses.Length > 0)
            {
                string[] pNames = new string[excludeStatuses.Length];
                for (int i = 0; i < excludeStatuses.Length; i++)
                {
                    string pName = "@ExcludeStatus_" + i;
                    pNames[i] = pName;
                }
                searchClauses.Add("SpecimenStatus NOT IN(" + string.Join(",", pNames) + ")");
            }
            string whereSQL = string.Join(" AND ", searchClauses.ToArray());
            string[] sql = new string[searchColumns.Length];
            for (int i = 0; i < searchColumns.Length; i++)
            {
                sql[i] = string.Format(baseSQL, searchColumns[i], datasetSQL, whereSQL);
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Join(" ", sql));
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            // optional: add status params
            if (includeStatuses.Length > 0)
            {
                for (int i = 0; i < includeStatuses.Length; i++)
                    DataAccessHelper.AddStringInputParam(com, "IncludeStatus_" + i, includeStatuses[i]);
            }
            if (excludeStatuses.Length > 0)
            {
                for (int i = 0; i < excludeStatuses.Length; i++)
                    DataAccessHelper.AddStringInputParam(com, "ExcludeStatus_" + i, excludeStatuses[i]);
            }
            DataSet ds = DataAccessHelper.GetList(com);
            return ds;
        }
               
        /// <summary>
        /// For the specified Protocol, get a list of related Specimens
        /// </summary>
        /// <param name="protocolId">The protocol to restrict specimen data</param>
        /// <param name="datasetSQL">The dataset of patients</param>
        /// <param name="collectionStatusList">Optional list of SpecimenCollection.CollectionStatus restrictions</param>
        /// <param name="specimens">Optional list of Specimen.SpecimenId restrictions</param>
        /// <returns></returns>
        public DataTable GetSpecimenTransfersByProtocol(int protocolId, string datasetSQL, string[] collectionStatusList, int[] specimens)
        {                
            List<string> restrictions = new List<string>();
            // add required restrictions
            restrictions.Add("pp.ProtocolId = @ProtocolId");
            restrictions.Add("r.RequestIdentifier LIKE p.ProtocolNum + '%'");
            // add specimen restrictions
            if (specimens.Length > 0)
                restrictions.Add("s.SpecimenId IN(" + string.Join(",", specimens.Select(s => s.ToString()).ToArray()) + ")");
            // add optional restrictions
            string[] collectionStatusParams = new string[collectionStatusList.Length];
            List<string> statusRestrictions = new List<string>();

            // add collection status params
            if (collectionStatusList.Length > 0)
            {
                for (int i = 0; i < collectionStatusList.Length; i++)
                    collectionStatusParams[i] = "CollectionStatus_" + i;
                statusRestrictions.Add("c.CollectionStatus IN (@" + string.Join(",@", collectionStatusParams) + ")");
            }
            // restrict to specimen status or collection status
            if (statusRestrictions.Count() > 0)
            {
                restrictions.Add("(" + string.Join(" OR ", statusRestrictions.ToArray()) + ")");
            }
          
            // string statusSQL = !string.IsNullOrEmpty(status) ? " AND s.SpecimenStatus = @SpecimenStatus " : "";
            string whereSQL = string.Join(" AND " , restrictions.ToArray());
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(SPECIMEN_TRANSFER_SQL_FORMAT, datasetSQL, whereSQL));
            // add required params
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            // add optional collection status
            if (collectionStatusList.Length > 0)
            {
                for (int i = 0; i < collectionStatusList.Length; i++)
                    DataAccessHelper.AddStringInputParam(com, collectionStatusParams[i], collectionStatusList[i]);
            }
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of Specimens in the collection, by dataset
        /// <param name="protocolId"></param>
        /// <param name="collectionId"></param>
        /// <param name="datasetSQL"></param>
        /// </summary>
        public DataTable GetTransferSpecimensByProtocol(int protocolId, int collectionId, string datasetSQL)
        {
            string sql_format =
@"
SELECT DISTINCT
	ssc.CollectionId,
    ssc.SpecimenCollectionId,
	s.SpecimenId,	
	s.SpecimenReferenceNumber,
	s.SpecimenType,
	s.SpecimenSubType,
	s.SpecimenStatus, 
	s.SpecimenOriginalQty,
	s.SpecimenRemainingQty,
	s.SpecimenUnits
FROM  Specimen_SpecimenCollections ssc
INNER JOIN Specimens s
	ON ssc.specimenId = s.SpecimenId
INNER JOIN SpecimenAccessions sa
	ON sa.SpecimenAccessionId = s.SpecimenAccessionId
INNER JOIN ({0}) ds
	ON sa.PatientId = ds.PatientId
INNER JOIN PatientProtocols pp
    ON ds.PatientId = pp.PatientId AND s.SpecimenReferenceNumber LIKE pp.PtProtocolStudyId + '%'
WHERE
    pp.ProtocolId = @ProtocolId
    AND
	ssc.CollectionId = @CollectionId
";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(sql_format, datasetSQL));
            // add required params
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataAccessHelper.AddIntInputParam(com, "CollectionId", collectionId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets the next RequestIdentifier by Protocol
        /// </summary>
        /// <param name="protocolNum"></param>
        /// <returns></returns>
        public string GetNextRequestIdByProtocol(string protocolNum)
        {
            string sql =
@"
-- get current MAX id for Protocol
SELECT
	ISNULL(MAX(FLOOR(CAST([IdString] as float))), 0) AS [MaxId]
FROM
(
		SELECT REPLACE(RequestIdentifier, @ProtocolNum + '-', '') AS [IdString]
		FROM SpecimenRequests
		WHERE
			RequestIdentifier LIKE @ProtocolNum + '-%'
) a
WHERE
	ISNUMERIC([IdString]) = 1
";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            // add required params
            DataAccessHelper.AddStringInputParam(com, "ProtocolNum", protocolNum);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            int maxId = Convert.ToInt32(dt.Rows[0][0]);
            int nextId = maxId + 1;
            return protocolNum + "-" + nextId;
        }

        /// <summary>
        /// Search for transfers by RequestIdentifier or SpecimenReferenceNumber.
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="datasetSQL"></param>
        /// <param name="searchColumn"></param>
        /// <param name="searchValue"></param>
        /// <returns></returns>
        public DataTable SearchSpecimenTransfersByProtocol(int protocolId, string datasetSQL, string searchColumn, string searchValue)
        {
            string[] columns = new string[] { "RequestIdentifier", "SpecimenReferenceNumber" };
            if (!columns.Contains(searchColumn))
                throw new Exception("Cannot search column '" + searchColumn + "', only columns ['" + string.Join("','", columns) + "']");

            string whereSQL = searchColumn + " LIKE '%' + @SearchValue + '%'";
            string formatString = searchColumn == "SpecimenReferenceNumber" ? SPECIMEN_SEARCH_BY_TRANSFER_SQL_FORMAT : SPECIMEN_TRANSFER_SQL_FORMAT;
            SqlCommand com = DataAccessHelper.CreateSqlCommand(string.Format(formatString, datasetSQL, whereSQL));
            // add required params
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataAccessHelper.AddStringInputParam(com, "SearchValue", searchValue);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public DataTable GetSpecimenReport(int patientProtocolId, int? specimenAccessionId, params string[] specimenTypes)
        {
            string sql =
            @"
            SELECT
                sa.*,
                s.*
            FROM SpecimenAccessions sa
            INNER JOIN Specimens s
	            ON sa.SpecimenAccessionId = s.SpecimenAccessionId
            INNER JOIN PatientProtocols pp
	            ON sa.PatientId = pp.PatientId AND s.SpecimenReferenceNumber LIKE pp.PtProtocolStudyId + '%'
            {0}
            ";
            List<string> where = new List<string>();
            where.Add("PatientProtocolId = @PatientProtocolId");
            // add specimenAccessionId restricion
            if (specimenAccessionId.HasValue)
            {
                where.Add("sa.SpecimenAccessionId = @SpecimenAccessionId");
            }
            // add specimen type params where clause
            if (specimenTypes.Length > 0)
            {
                string[] typeParams = new string[specimenTypes.Length];
                for (int i = 0; i < specimenTypes.Length; i++)
                {
                    string pName = "@SpecimenType_" + i;
                    typeParams[i] = pName;
                }
                // i.e., "WHERE SpecimenType IN (@SpecimenType_0,@SpecimenType_1,...)"
                where.Add("s.SpecimenType IN (" + string.Join(", ", typeParams) + ")");
            }

            string whereSQL = where.Count > 0 ? " WHERE " + string.Join(" AND ", where.ToArray()) : "";
            string fullSQL = string.Format(sql, whereSQL);
            SqlCommand com = DataAccessHelper.CreateSqlCommand(fullSQL);
            // add patient restriction
            DataAccessHelper.AddIntInputParam(com, "PatientProtocolId", patientProtocolId);
            // add SpecimenAccessionId
            if (specimenAccessionId.HasValue)
            {
                DataAccessHelper.AddIntInputParam(com, "SpecimenAccessionId", specimenAccessionId.Value);
            }
            // add specimen type params
            if (specimenTypes.Length > 0)
            {
                for (int i = 0; i < specimenTypes.Length; i++)
                {
                    string pName = "SpecimenType_" + i;
                    string pValue = specimenTypes[i];
                    DataAccessHelper.AddStringInputParam(com, pName, pValue);
                }
            }
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];

            return dt;
        }

        #endregion




        #region methods for Storage Management
        public void DeleteBoxReferenceFromSpecimens(int boxId)
        {
            DataTable dt = new DataTable();

            string sql = "";
            sql += "UPDATE Specimens ";
            sql += "SET BoxId = Null, ";
            sql += "PositionId = Null ";
            sql += "WHERE BoxId = " + boxId;

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
        }

        /// <summary>
        /// Returns a DataSet (array of DataTables) which traces back the path to a SiteId.
        /// This returns the an array of sibling 
        /// </summary>
        /// <param name="boxId"></param>
        /// <returns></returns>
        public DataSet GetBoxAndAncestors(int boxId)
        {
            string sql = "DECLARE @BoxId INT ";
            sql += "DECLARE @ContainerId INT ";
            sql += "DECLARE @StorageId INT ";
            sql += "DECLARE @SiteId INT ";
            sql += "SET @BoxId=" + boxId + " ";
            sql += "SELECT @ContainerId=ContainerId FROM SpecimenBoxes Where BoxId=@BoxId ";
            sql += "SELECT @StorageId=StorageId FROM SpecimenContainers Where ContainerId=@ContainerId ";
            sql += "SELECT @SiteId=SiteId FROM SpecimenStorages Where StorageId=@StorageId ";
            sql += "SELECT * FROM SpecimenBoxes Where ContainerId=@ContainerId ";
            sql += "SELECT * FROM SpecimenContainers Where StorageId=@StorageId ";
            sql += "SELECT * FROM SpecimenStorages Where SiteId=@SiteId ";
            sql += "SELECT * FROM SpecimenSites Where SiteId=@SiteId ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            //DataAccessHelper.AddIntInputParam(com, "MyBoxId", boxId);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet results = new DataSet();
            da.Fill(results);
            return results;
        }

        #endregion for Storage Management




        #region Helper Functions
        public string GetCommaDelimitedStringFromArray(string[] sArray)
        {
            StringBuilder sb = new StringBuilder(System.String.Empty);

            foreach (string s in sArray)
            {
                sb.Append(s);
                sb.Append(',');
            }

            sb.Remove(sb.Length - 1, 1);
            return sb.ToString();
        }

        /// <summary>
        /// Concatenates two strings that are already in SQL VALUES IN format
        /// </summary>
        /// <param name="firstStr">First string in 'str1', 'str2', 'str3' format or empty string</param>
        /// <param name="secondStr">Second string in 'str1', 'str2', 'str3' format or empty string</param>
        /// <returns>Concatenated string in SQL VALUES IN format 'str1', 'str2', 'str3'</returns>
        public string ConcatenateSQLValuesInStrings(string firstStr, string secondStr)
        {
            StringBuilder sb = new StringBuilder(System.String.Empty);

            if (!string.IsNullOrEmpty(firstStr))
            {
                sb.Append(firstStr);
                sb.Append(",");
            }
            if (!string.IsNullOrEmpty(secondStr))
            {
                sb.Append(secondStr);
                sb.Append("'");
            }

            if (sb.Length > 0)
            {
                sb.Remove(sb.Length - 1, 1);
            }
            return sb.ToString();
        }

        /// <summary>
        /// Takes an array of strings and puts every element in one string in 'str1','str2','str3' format
        /// ready to be used for SQL VALUES IN()
        /// </summary>
        /// <param name="sArray">Array of strings to put in SQL format for VALUES IN clause</param>
        /// <returns>A string in the SQL format for VALUES IN (e.g. 'str1','str2','str3')</returns>
        public string ConvertToSQLValuesInFormat(string[] sArray)
        {
            if (sArray.Length == 1 && string.IsNullOrEmpty(sArray[0]))
            {
                return System.String.Empty;
            }
            for (int i = 0; i < sArray.Length; i++)
            {
                if (!sArray[i].StartsWith("'")) // do not wrap in single quotes if for some reason it already has them
                {
                    sArray[i] = "'" + sArray[i] + "'";
                }
            }
            string sqlValuesIn = String.Join(",", sArray);

            return sqlValuesIn;
        }

        #endregion Helper Functions

        public DataSet LoadDropDownList(string listName, string arg)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_LoadDropDownList");
            DataAccessHelper.AddStringInputParam(com, "listName", listName);
            DataAccessHelper.AddStringInputParam(com, "arg", arg);

            return DataAccessHelper.GetList(com);
        }


        #region Code Graveyard

        /*
         /// <summary>
        /// Get subspecimens of a specimen by id.
        /// </summary>
        /// <param name="specimenId"></param>
        /// <returns></returns>
        public DataTable GetSubSpecimens(int specimenId, string idType)
        {
            DataTable dt = new DataTable();

            string sql = "";
            sql += "SELECT DISTINCT s.specimenid, p.patientid, sa.AccessionProcName, i.Identifier, ";
            sql += "s.specimenReferenceNumber, s.specimenStatus, s.specimenType, s.specimenPreservationType, s.specimenSubType, s.specimenOriginalQty, s.specimenRemainingQty, s.specimenUnits, s.boxId, s.positionId, sb.boxName, sp.position ";
            sql += "FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ";
            sql += "LEFT OUTER JOIN SpecimenPositions sp ON sp.boxId=s.boxId AND sp.positionId=s.positionId ";
            sql += "LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=sp.boxId ";
            sql += "LEFT OUTER JOIN Patients p ON p.patientid=sa.patientid ";
            sql += "LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType= '" + idType + "') AS i ON p.patientId=i.patientId ";
            sql += "WHERE s.ParentSpecimenId = " + specimenId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }
         
        /// <summary>
        /// Get Specimens based on specimen properties. Order by Box name and then position id.
        /// </summary>
        /// <param name="collectDateFrom"></param>
        /// <param name="collectDateTo"></param>
        /// <param name="typeSubTypeArr">[*,2] array of strings with Type value at [*,0] and comma-delimited Subtype at [*,1]</param>
        /// <param name="identifier">Patient Identifier from Identifiers table</param>
        /// <param name="status"></param>
        /// <param name="boxName"></param>
        /// <param name="idType">Id Types defined by lookup code</param>
        /// <param name="showAll"></param>
        /// <returns>DataTable with specimens based on properties in search criteria</returns>
        public DataTable GetLocalSpecimens(string collectDateFrom, string collectDateTo,
                                          string[,] typeSubTypeArr, string identifier, string status, string boxName, string idType, string referenceNum, bool showAll, bool useBoxNameWildcard)
        {
            DataTable dt = new DataTable();

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT DISTINCT s.specimenid, p.patientid, sc.collectionName, sa.AccessionProcName, i.identifier, ");
            sql.Append("s.specimenReferenceNumber, s.specimenType, s.specimenSubType, s.specimenPreservationType, s.specimenStatus, s.specimenOriginalQty, s.specimenRemainingQty, s.specimenUnits, sp.boxId, sb.boxName, sp.positionId, sp.Position ");
            sql.Append("FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ");
            sql.Append("LEFT OUTER JOIN SpecimenPositions sp ON sp.boxId=s.boxId AND sp.positionId=s.positionId ");
            sql.Append("LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=sp.boxId ");
            sql.Append("LEFT OUTER JOIN Patients p ON p.patientid=sa.patientid ");
            sql.Append("LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType= '" + idType + "') AS i ON p.patientId=i.patientId ");
            sql.Append("LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=s.collectionId ");

            StringBuilder wc = new StringBuilder(); //WHERE clause
            if (collectDateFrom.Length > 0 && collectDateTo.Length > 0)
            {
                wc.Append("AND sa.AccessionDate BETWEEN '" + collectDateFrom + "' AND '" + collectDateTo + "' ");
            }
            else if (collectDateFrom.Length > 0)
            {
                wc.Append("AND sa.AccessionDate >= '" + collectDateFrom + "' ");
            }
            else if (collectDateTo.Length > 0)
            {
                wc.Append("AND sa.AccessionDate <= '" + collectDateTo + "' ");
            }


            if (identifier.Length > 0)
            {
                wc.Append("AND i.identifier LIKE '%" + identifier + "%' ");
            }

            // Box Name
            if (boxName.Length > 0 && useBoxNameWildcard == true)
            {
                wc.Append("AND sb.boxName LIKE '%" + boxName + "%' ");
            }
            else if (boxName.Length > 0 && useBoxNameWildcard == false)
            {
                wc.Append("AND sb.boxName = '" + boxName + "'");
            }

            // Reference Number / Vial Number
            if (referenceNum.Length > 0)
            {
                wc.Append("AND s.specimenReferenceNumber LIKE '%" + referenceNum + "%' ");
            }

            // Specimen type and subtypes 
            // look at each element in 2d array to create the AND ( ... OR ... OR ... ) clause for type and subtype
            StringBuilder sb = new StringBuilder();
            int numOfPairs = typeSubTypeArr.GetLength(0);

            sb.Append("AND (");
            for (int i = 0; i < numOfPairs; i++)
            {
                string typeVal = typeSubTypeArr[i, 0];
                string subTypeVal = typeSubTypeArr[i, 1];

                if (!string.IsNullOrEmpty(typeVal))
                {
                    if (!string.IsNullOrEmpty(subTypeVal))
                    {
                        string[] subTypeValArr = typeSubTypeArr[i, 1].Split(new Char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                        subTypeVal = ConvertToSQLValuesInFormat(subTypeValArr);
                        sb.Append("(s.SpecimenType='" + typeVal + "' AND s.SpecimenSubType IN (" + subTypeVal + ")) OR ");
                    }
                    else
                    {
                        sb.Append("(s.SpecimenType='" + typeVal + "') OR ");
                    }
                }
            }
            if (sb.Length > 5) // we test for > 5 because "AND (" is 5
            {
                sb.Remove(sb.Length - 4, 4); //remove last OR and spaces
                sb.Append(") ");

                wc.Append(sb.ToString());
            }

            if (status.Length > 0)
            {
                wc.Append("AND s.specimenStatus = '" + status + "' ");
            }
            if (!showAll)
            {
                wc.Append("AND s.specimenStatus NOT LIKE '%Unavailable%' ");
            }

            if (wc.Length > 0)
            {
                wc.Remove(0, 3); //removes the first AND
                wc.Insert(0, " WHERE ");
            }

            sql.Append(wc.ToString());

            sql.Append("ORDER BY sb.boxName, sp.positionId ");

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }
        */


        /*
        public DataTable GetAllSpecimensInRecordRange(string idType, bool showAll, int startRow, int numRows)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT DISTINCT s.specimenid, p.patientid, sc.collectionName, sa.AccessionProcName, i.Identifier, ");
            sql.Append("s.specimenReferenceNumber, s.specimenType,  s.specimenSubType,  s.specimenPreservationType, s.specimenStatus, s.specimenOriginalQty, s.specimenRemainingQty, s.specimenUnits, sp.boxId, sb.boxName, sp.positionId, sp.Position ");
            sql.Append("FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ");
            sql.Append("LEFT OUTER JOIN SpecimenPositions sp ON sp.boxId=s.boxId AND sp.positionId=s.positionId ");
            sql.Append("LEFT OUTER JOIN SpecimenBoxes sb ON sb.boxId=sp.boxId ");
            sql.Append("LEFT OUTER JOIN Patients p ON p.patientid=sa.patientid ");
            sql.Append("LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType= '" + idType + "') AS i ON p.patientId=i.patientId ");
            sql.Append("LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=s.collectionId ");

            if (!showAll)
            {
                //sql.Append("WHERE s.specimenStatus = 'Available' OR s.specimenStatus = '' ");
                sql.Append("WHERE s.specimenStatus NOT LIKE '%Unavailable%' OR SpecimenStatus IS NULL ");
            }

            sql.Append("ORDER BY sb.boxName, sp.positionId ");

            SqlCommand com = new SqlCommand(sql.ToString());

            SqlDataAdapter da = new SqlDataAdapter(com);
            //da.TableMappings.Add("Table", dt.TableName);
            if (startRow >= 0 && numRows > 0)
            {
                da.Fill(ds, startRow, numRows, "s");
            }
            else
            {
                da.Fill(ds);
            }

            //DataAccessHelper.GetList(com, startRow, numRows, "s");
            if (ds.Tables[0] != null)
            {
                dt = ds.Tables[0];
            }
            return dt;
        }
        */

        //GetLocalSpecimens that Westmead has
        /*public DataTable GetLocalSpecimens(string collectDateFrom, string collectDateTo,
                                           string[] typeArr, string[] subTypeArr, string identifier, string status, string boxName, string idType, bool showAll)
        {
            DataTable dt = new DataTable();

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT DISTINCT s.specimenid, p.patientid, sc.collectionName, sa.AccessionProcName, i.identifier, ");
            sql.Append("s.specimenReferenceNumber, s.specimenType, s.specimenSubType, s.specimenPreservationType, s.specimenStatus, s.specimenRemainingQty, s.specimenUnits, s.boxId, s.positionId ");
            sql.Append("FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ");
            sql.Append("LEFT OUTER JOIN SpecimenPositions sl ON s.boxId=sl.boxId AND s.positionId=sl.positionId ");
            sql.Append("LEFT OUTER JOIN Patients p ON p.patientid=sa.patientid ");
            sql.Append("LEFT OUTER JOIN (SELECT Identifier, PatientId FROM Identifiers WHERE IdType= '" + idType + "') AS i ON p.patientId=i.patientId ");
            sql.Append("LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=s.collectionId ");

            StringBuilder wc = new StringBuilder(); //WHERE clause
            if (collectDateFrom.Length > 0 && collectDateTo.Length > 0)
            {
                wc.Append("AND sa.AccessionDate BETWEEN '" + collectDateFrom + "' AND '" + collectDateTo + "' ");
            }
            else if (collectDateFrom.Length > 0)
            {
                wc.Append("AND sa.AccessionDate >= '" + collectDateFrom + "' ");
            }
            else if (collectDateTo.Length > 0)
            {
                wc.Append("AND sa.AccessionDate <= '" + collectDateTo + "' ");
            }

            if (identifier.Length > 0)
            {
                wc.Append("AND i.identifier LIKE '%" + identifier + "%' ");
            }
     
            // specimen type and subtypes 
            string types = ConvertToSQLValuesInFormat(typeArr);
            if (types.Length > 0)
            {
                wc.Append("AND s.SpecimenType IN (" + types + ") ");
            }

            string subTypes = ConvertToSQLValuesInFormat(subTypeArr);
            if (subTypes.Length > 0)
            {
                wc.Append("AND s.SpecimenSubType IN (" + subTypes + ") ");
            }

            if (status.Length > 0)
            {
                wc.Append("AND s.specimenStatus = '" + status + "' ");
            }
            if (!showAll)
            {
                wc.Append("AND s.specimenStatus NOT LIKE '%Unavailable%' ");
            }

            if (wc.Length > 0)
            {
                wc.Remove(0, 3); //removes the first AND
                wc.Insert(0, " WHERE ");
            }

            sql.Append(wc.ToString());

            sql.Append("ORDER BY s.boxId, s.positionId ");

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }
        */

        /// <summary>
        /// Get specimens based on breast cancer clinical/research data
        /// </summary>
        /// <param name="ageDiagFrom">Youngest age of patient at diagnosis.</param>
        /// <param name="ageDiagTo">Oldest age of patient at diagnosis.</param>
        /// <param name="priHistDiag"></param>
        /// <param name="histpathGrade"></param>
        /// <param name="ER"></param>
        /// <param name="PR"></param>
        /// <param name="Her2ICC"></param>
        /// <param name="nodePositive"></param>
        /// <param name="adjuvAgent"></param>
        /// <param name="replapseStatus"></param>
        /// <param name="bloodSamplesArr"></param>
        /// <param name="tissueSamplesArr"></param>
        /// <param name="tissueType"></param>
        /// <returns>DataTable with specimens based on breast cancer search criteria.</returns>
        /*public DataTable GetBreastResearchSpecimens(string ageDiagFrom, string ageDiagTo,
                                                    string priHistDiag, string histpathGrade,
                                                    string ER, string PR, string Her2ICC, string nodePositive,
                                                    string adjuvAgent, string replapseStatus,
                                                    string bloodSamplesArr,
                                                    string tissueSamplesArr, string tissueType, string idType, bool showAll)
        {
            DataTable dt = new DataTable();

            StringBuilder sql = new StringBuilder();
            sql.Append("SELECT DISTINCT p.patientid, s.specimenid, sc.collectionName, sa.accessionProcName, idn.Identifier, ");
            sql.Append("s.specimenReferenceNumber, s.specimenStatus, s.specimenType, s.specimenSubType,  s.specimenPreservationType, s.specimenRemainingQty, s.specimenUnits, s.boxId, sl.position ");
            sql.Append("FROM Specimens s INNER JOIN SpecimenAccessions sa ON sa.specimenaccessionid=s.specimenaccessionid ");
            sql.Append("LEFT OUTER JOIN SpecimenPositions sl ON s.boxId=sl.boxId AND s.positionId=sl.positionId ");
            sql.Append("LEFT OUTER JOIN Patients p ON p.patientid=sa.patientid ");
            sql.Append("LEFT OUTER JOIN Identifiers idn ON idn.patientid=p.patientId AND idn.idType='" + idType + "' ");
            sql.Append("LEFT OUTER JOIN Status st ON st.patientId=p.patientId AND st.statusDisease='Breast Cancer' ");
            sql.Append("LEFT OUTER JOIN SpecimenCollections sc ON sc.collectionId=s.collectionId ");
            sql.Append("LEFT OUTER JOIN Pathology path ON path.patientid=p.patientid ");
            sql.Append("LEFT OUTER JOIN PathologyStageGrade pathSG ON pathSG.PathologyId=path.PathologyId ");
            sql.Append("LEFT OUTER JOIN PathTest PathT ON PathT.PathologyId=path.PathologyId ");

            StringBuilder wc = new StringBuilder(); //WHERE clause
            if (ageDiagFrom.Length > 0 && ageDiagTo.Length > 0)
            {
                wc.Append("AND dateDiff(year,p.ptBirthDate,st.StatusDate) BETWEEN '" + ageDiagFrom + "' AND '" + ageDiagTo + "' ");
            }
            else if (ageDiagFrom.Length > 0)
            {
                wc.Append("AND dateDiff(year,p.ptBirthDate,st.StatusDate) >= '" + ageDiagFrom + "' ");
            }
            else if (ageDiagTo.Length > 0)
            {
                wc.Append("AND dateDiff(year,p.ptBirthDate,st.StatusDate) <= '" + ageDiagTo + "' ");
            }

            if (priHistDiag.Length > 0)
            {
                wc.Append("AND path.PathHistology = '" + priHistDiag + "' ");
            }
            if (histpathGrade.Length > 0)
            {
                wc.Append("AND pathSG.PathStageSystem = '" + histpathGrade + "' ");
            }

            if (ER.Length > 0)
            {
                wc.Append("AND pathT.PathTest = '" + ER + "' AND pathT.PathResult = '" + ER + "'");
            }
            if (PR.Length > 0)
            {
                wc.Append("AND pathT.PathTest = '" + PR + "' AND pathT.PathResult = '" + PR + "'");
            }
            if (Her2ICC.Length > 0)
            {
                wc.Append("AND pathT.PathTest = '" + Her2ICC + "' AND pathT.PathResult = '" + Her2ICC + "'");
            }

            if (bloodSamplesArr.Length > 0)
            {
                wc.Append("AND s.SpecimenType IN (" + bloodSamplesArr + ") ");
            }
            if (tissueSamplesArr.Length > 0)
            {
                wc.Append("AND s.SpecimenPreservationType IN (" + tissueSamplesArr + ") ");
            }
            if (tissueType.Length > 0)
            {
                // TODO: this reference is wrong
                wc.Append("AND path.PathSpecimenType LIKE '" + tissueType + "'AND path.PathSite = 'Breast'");
            }
            if (!showAll)
            {
                wc.Append("AND s.specimenStatus NOT LIKE '%Unavailable%' ");
            }

            if (wc.Length > 0)
            {
                wc.Remove(0, 3); //removes the first AND
                wc.Insert(0, " WHERE ");
            }

            sql.Append(wc.ToString());

            sql.Append("ORDER BY s.boxId, sl.position ");

            DataAccessHelper.ExecuteSqlSelect(sql.ToString(), dt);
            return dt;
        }*/



        /*public DataTable GetSpecimensByColumnValue(string colName, int colValue)
        {
            DataTable dt = new DataTable();

            string sql = "";
            sql += "SELECT * FROM Specimens WHERE boxId=" + colValue + "";
            
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }*/


        /*public DataTable GetAllCollections()
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                         "FROM SpecimenCollections ";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }*/
        /*public DataTable GetCollectionDetails(int collectionId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                         "FROM SpecimenCollections " +
                         "WHERE CollectionId = " + collectionId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);

            return dt;
        }*/


        /*/// <summary>
        /// Gets all the specimens in the system
        /// </summary>
        /// <param name="curePageNumber"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        public DataSet GetAllSpecimens(int curePageNumber, int pageSize, string idType)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimen_GetAllSpecimens");
            DataAccessHelper.AddStringInputParam(com, "idType", idType);
            DataAccessHelper.AddIntInputParam(com, "curePageNumber", curePageNumber);
            DataAccessHelper.AddIntInputParam(com, "pageSize", pageSize);
            return DataAccessHelper.GetList(com, 0, 0);

        }*/

        /*/// <summary>
        /// Gets Specimens based on specimen properties
        /// </summary>
        /// <returns></returns>
        public DataSet FindLocalSpecimens(
            int curePageNumber,
            int pageSize,
            Nullable<DateTime> collectDateFrom,
            Nullable<DateTime> collectDateTo,
            string specimenType,
            string specimenTypesArray,
            string identifier,
            string idType,
            string specimenStatus,
            string specimenTissueStatus,
            //string vialNo,
            string boxNo)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimen_GetAllSpecimens");
            DataAccessHelper.AddDateTimeInputParam(com, "collectDateFrom", collectDateFrom);
            DataAccessHelper.AddDateTimeInputParam(com, "collectDateTo", collectDateTo);
            DataAccessHelper.AddStringInputParam(com, "specimenType", specimenType);
            DataAccessHelper.AddStringInputParam(com, "specimenTypesArray", specimenTypesArray);
            // DataAccessHelper.AddStringInputParam(com, "tbRefMask", tbRefMask);
            DataAccessHelper.AddStringInputParam(com, "Identifier", identifier);
            DataAccessHelper.AddStringInputParam(com, "IdType", idType);
            DataAccessHelper.AddStringInputParam(com, "specimenStatus", specimenStatus);
            DataAccessHelper.AddStringInputParam(com, "specimenTissueStatus", specimenTissueStatus);
            //DataAccessHelper.AddStringInputParam(com, "vialNo", vialNo);
            DataAccessHelper.AddStringInputParam(com, "boxNo", boxNo);
            DataAccessHelper.AddIntInputParam(com, "curePageNumber", curePageNumber);
            DataAccessHelper.AddIntInputParam(com, "pageSize", pageSize);
            return DataAccessHelper.GetList(com, 0, 0);
        }*/

        /*/// <summary>
        /// Gets specimens based on breast cancer clinical/research data
        /// </summary>
        /// <returns></returns>
        public DataSet FindBreastResearchSpecimens(
            int curePageNumber,
            int pageSize,
            string ageDiagFrom,
            string ageDiagTo,
            string priHistDiag,
            string histpathGrade,
            string ER,
            string PR,
            string Her2ICC,
            string nodePositive,
            string adjuvAgent,
            string replapseStatus,
            string bloodSamplesArr,
            string tissueSamplesArr,
            string tissueType
           )
        {
            // ok to leave this one as stored proc
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_GetBreastResearchSpecimens");
            DataAccessHelper.AddIntInputParam(com, "ageDiagFrom", ageDiagFrom);
            DataAccessHelper.AddIntInputParam(com, "ageDiagTo", ageDiagTo);
            DataAccessHelper.AddStringInputParam(com, "priHistDiag", priHistDiag);
            DataAccessHelper.AddStringInputParam(com, "histpathGrade", histpathGrade);
            DataAccessHelper.AddStringInputParam(com, "ER", ER);
            DataAccessHelper.AddStringInputParam(com, "PR", PR);
            DataAccessHelper.AddStringInputParam(com, "Her2ICC", Her2ICC);
            DataAccessHelper.AddStringInputParam(com, "nodePositive", nodePositive);
            DataAccessHelper.AddStringInputParam(com, "adjuvAgent", adjuvAgent);
            DataAccessHelper.AddStringInputParam(com, "replapseStatus", replapseStatus);
            DataAccessHelper.AddStringInputParam(com, "bloodSamplesArr", bloodSamplesArr);
            DataAccessHelper.AddStringInputParam(com, "tissueSamplesArr", tissueSamplesArr);
            DataAccessHelper.AddStringInputParam(com, "tissueType", tissueType);
            DataAccessHelper.AddIntInputParam(com, "curePageNumber", curePageNumber);
            DataAccessHelper.AddIntInputParam(com, "pageSize", pageSize);
            return DataAccessHelper.GetList(com, 0, 0);
            //return DataAccessHelper.GetList(com);
        }*/

        //public void RemoveSpecimenFromCollection(int specimenId)
        //{
        //    string sql = "UPDATE Specimens " +
        //                 "SET CollectionId = " + DBNull.Value +
        //                 "WHERE SpecimenId = " + specimenId + "";
        //    SqlCommand com = new SqlCommand(sql, DataAccessHelper.GetConnection());
        //    DataAccessHelper.GetList(com);
        //    //execute here
        //    //DataAccessHelper.ExecuteSqlSelect(sql, dt);
        //}
        #endregion
    }
}
