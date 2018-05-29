using System.Collections.Generic;
using System.Text;
using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
    public class PatientEducationDa : BaseDA
    {
        public PatientEducationDa()
        {
            // TODO: Add constructor logic here
        }

		public DataTable GetMostRecentPatientProfile(int patientId)
		{
			DataTable dt = new DataTable();

			string sql = "SELECT TOP 1 * " +
						"FROM PatientEdProfile " +
						"WHERE PatientId=" + patientId + " " +
						"ORDER BY ProfileCreateDate DESC ";

			DataAccessHelper.ExecuteSqlSelect(sql, dt);
			return dt;
		}

        public DataTable GetAllDiseaseTypes()
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                        "FROM PatientEdDisease ";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }
		public DataTable GetAllVisitTypes()
		{
			DataTable dt = new DataTable();

			string sql = "SELECT * " +
						"FROM PatientEdVisitType ";

			DataAccessHelper.ExecuteSqlSelect(sql, dt);
			return dt;
		}

        public DataTable GetPacketsByDiseaseAndVisitType(int diseaseId, int visitTypeId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT p.PacketName, p.PacketId " +
                        "FROM  PatientEdDisease_VisitType_SubTopic s " +
                        "INNER JOIN PatientEdPacket p ON s.PacketId = p.PacketId " +
                        "WHERE s.VisitTypeId=" + visitTypeId +
                        "AND s.DiseaseId=" + diseaseId + 
                        "GROUP BY p.PacketName, p.PacketId";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        // NOTE: will eventually use GetAll() from BizObject
        public DataTable GetAllSections() 
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                        "FROM PatientEdSection ";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;       
        }

        public DataRow GetSectionById(int sectionId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                        "FROM PatientEdSection " +
                        "WHERE SectionId=" + sectionId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt.Rows[0];
        }

        public DataTable GetSectionsByVisitTypeAndDiseaseId(int visitTypeId, int diseaseId)
        {
            DataTable dt = new DataTable();

			string sql = "SELECT DISTINCT sec.SectionId, sec.SectionName " +
					"FROM PatientEdDisease d INNER JOIN PatientEdDisease_VisitType_SubTopic s ON d.DiseaseId=s.DiseaseId " +
					"INNER JOIN PatientEdVisitType v ON s.VisitTypeId=v.VisitTypeId " +
					"INNER JOIN PatientEdSubTopic st ON st.SubTopicId=s.SubTopicId " +
					"INNER JOIN PatientEdTopic t ON t.TopicId=st.TopicId " +
					"INNER JOIN PatientEdSection sec ON sec.SectionId=t.SectionId ";

			if (visitTypeId > 0 && diseaseId > 0)
			{
				sql += "WHERE v.VisitTypeId=" + visitTypeId + " AND d.DiseaseId=" + diseaseId + "";
			}
			else if (visitTypeId > 0)
			{
				sql += "WHERE v.VisitTypeId=" + visitTypeId + " ";
			}
			else if (diseaseId > 0)
			{
				sql += "WHERE d.DiseaseId=" + diseaseId + " ";
			}
          
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        public DataRow GetTopicById(int topicId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                        "FROM PatientEdTopic " +
                        "WHERE TopicId=" + topicId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt.Rows[0];
        }

        public DataTable GetTopicsBySection(int sectionId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                        "FROM PatientEdTopic " +
                        "WHERE SectionId=" + sectionId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        /// <summary>
        /// Gets topics by section id and disease id, if existent. If disease id is 0, gets all topics for this section id.
        /// </summary>
        /// <param name="sectionId"></param>
        /// <param name="diseaseId"></param>
        /// <returns></returns>
        public DataTable GetTopicsBySectionIdAndDiseaseId(int sectionId, int diseaseId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT DISTINCT t.TopicId, t.TopicName " +
                        "FROM PatientEdTopic t INNER JOIN PatientEdSubTopic st ON t.TopicId=st.TopicId " + 
                        "INNER JOIN PatientEdDisease_VisitType_SubTopic s ON s.SubTopicId=st.SubTopicId " +
                        "INNER JOIN PatientEdDisease d ON d.DiseaseId=s.DiseaseId " + 
                        "WHERE t.SectionId=" + sectionId + " ";

            if (diseaseId > 0)
            {
                sql += " AND d.DiseaseId=" + diseaseId + "";

            }

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

		/// <summary>
		/// Gets topics by section id, and disease id and visitType id, if existent. If disease id is 0, gets all topics for this section id and visitType id. If 
		/// </summary>
		/// <param name="sectionId"></param>
		/// <param name="diseaseId"></param>
		/// <returns></returns>
		public DataTable GetTopicsBySectionIdAndVisitTypeAndDiseaseId(int sectionId, int visitTypeId, int diseaseId)
		{
			DataTable dt = new DataTable();

			string sql = "SELECT DISTINCT t.TopicId, t.TopicName " +
						"FROM PatientEdTopic t INNER JOIN PatientEdSubTopic st ON t.TopicId=st.TopicId " +
						"INNER JOIN PatientEdDisease_VisitType_SubTopic s ON s.SubTopicId=st.SubTopicId " +
						"INNER JOIN PatientEdDisease d ON d.DiseaseId=s.DiseaseId " +
						"WHERE t.SectionId=" + sectionId + " ";

			if (visitTypeId > 0 && diseaseId > 0)
			{
				sql += "WHERE v.VisitTypeId=" + visitTypeId + " AND d.DiseaseId=" + diseaseId + "";
			}
			else if (visitTypeId > 0)
			{
				sql += "WHERE v.VisitTypeId=" + visitTypeId + " ";
			}
			else if (diseaseId > 0)
			{
				sql += "WHERE d.DiseaseId=" + diseaseId + " ";
			}
          
			DataAccessHelper.ExecuteSqlSelect(sql, dt);
			return dt;
		}

        public DataTable GetSubTopicsByTopic(int topicId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                        "FROM PatientEdSubTopic " +
                        "WHERE TopicId=" + topicId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

		//public DataTable GetSubTopicsByTopic(int topicId)
		//{
		//    DataTable dt = new DataTable();

		//    string sql = "SELECT * " +
		//                 "FROM PatientEdSubTopic st INNER JOIN PatientEdDisease_VisitType_SubTopic s " +
		//                 "ON st.SubTopicId=s.SubTopicId " +
		//                 "WHERE st.TopicId=" + topicId + "";

		//    DataAccessHelper.ExecuteSqlSelect(sql, dt);
		//    return dt;
		//}

		public DataTable GetSubTopicsByTopicAndDiseaseId(int topicId, int diseaseId)
		{
			DataTable dt = new DataTable();

			string sql = "SELECT * " +
						"FROM PatientEdSubTopic st INNER JOIN PatientEdDisease_VisitType_SubTopic s ON st.SubTopicId=s.SubTopicId  " +
						"WHERE st.TopicId=" + topicId + "";

			if (diseaseId > 0)
			{
				sql += " AND s.DiseaseId=" + diseaseId + "";

			}

			DataAccessHelper.ExecuteSqlSelect(sql, dt);
			return dt;
		}


        public DataRow GetSubTopicById(int subTopicId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                        "FROM PatientEdSubTopic " +
                        "WHERE SubTopicId=" + subTopicId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt.Rows[0];
        }

        /// <summary>
        /// OBSOLETE: Get subtopics for a default disease profile based on visit type
        /// </summary>
        /// <param name="visitType"></param>
        /// <param name="diseaseId"></param>
        /// <returns></returns>
        public DataTable GetSubTopicsByDiseaseAndVisitType(int visitType, int diseaseId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                        "FROM  PatientEdDisease_VisitType_SubTopic " +
                        "WHERE VisitTypeId=" + visitType +
                        "AND DiseaseId=" + diseaseId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        /// <summary>
        /// Get all records from the PatientEdDisease_VisitType_SubTopic table 
        /// with this packet id
        /// </summary>
        /// <param name="subTopicId"></param>
        /// <returns></returns>
        public DataTable GetDiseaseVisitSubTopicByPacket(int packetId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                        "FROM  PatientEdDisease_VisitType_SubTopic " +
                        "WHERE PacketId=" + packetId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

		/// <summary>
		/// Get all records from the PatientEdDisease_VisitType_SubTopic table 
		/// with this subTopic id
		/// </summary>
		/// <param name="subTopicId"></param>
		/// <returns></returns>
		public DataTable GetDiseaseVisitSubTopicBySubTopic(int subTopicId)
		{
			DataTable dt = new DataTable();

			string sql = "SELECT * " +
						"FROM  PatientEdDisease_VisitType_SubTopic " +
						"WHERE SubTopicId=" + subTopicId + "";

			DataAccessHelper.ExecuteSqlSelect(sql, dt);
			return dt;
		}

        // TODO: could just use pId without the others? 
        public DataTable GetDefaultDocumentByDiseaseVisitPacketIds(int dId, int vId, int pId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT * " +
                        "FROM  PatientEdDisease_VisitType_SubTopic" + 
                        " WHERE DiseaseId=" + dId + "" +
                        " AND VisitTypeId=" + vId + "" +
                        " AND PacketId=" + pId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        // OBSOLETE
		public DataTable GetDefaultDocumentByDiseaseAndVisit(int dId, int vId)
		{
			DataTable dt = new DataTable();

			string sql = "SELECT * " +
						"FROM  PatientEdDisease_VisitType_SubTopic ";

			string whereClause = "";

			if (dId > 0)
			{
				whereClause = " WHERE DiseaseId=" + dId + "";
			}
			else
			{
				whereClause = " WHERE DiseaseId IS NULL ";
			}

			if (vId > 0)
			{
				whereClause += " AND VisitTypeId=" + vId + "";
			}
			else
			{
				whereClause += " AND VisitTypeId IS NULL ";
			}

			sql += whereClause;

			DataAccessHelper.ExecuteSqlSelect(sql, dt);
			return dt;
		}

        public DataRow GetSubTopicProfileContent(int subTopicId)
        {
            DataTable dt = new DataTable();

            string sql = "SELECT s.SectionId,s.sectionName, s.SectionDescription, t.topicId, t.TopicName, t.topicDescription, st.SubTopicName, st.SubTopicContent " + 
                         "FROM PatientEdSubTopic st INNER JOIN PatientEdTopic t ON st.topicId=t.topicId INNER JOIN PatientEdSection s ON t.sectionId=s.sectionId " +  
                         "WHERE SubTopicId=" + subTopicId + "";

            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt.Rows[0];
        }

		public DataRow GetVisitTypeById(int visitTypeId)
		{
			DataTable dt = new DataTable();

			string sql = "SELECT * " +
						"FROM PatientEdVisitType " +
						"WHERE VisitTypeId = " + visitTypeId + "";

			DataAccessHelper.ExecuteSqlSelect(sql, dt);
			return dt.Rows[0];

		}


		//public DataTable GetAllProfilesForPatient(int pId)
		//{
		//    DataTable dt = new DataTable();

		//    string sql = "SELECT pr.LastPrintedTime, pr.LastPrintedBy, d.DiseaseName, v.VisitTypeName " +
		//                "FROM PatientEdProfile pr, PatientEdDisease d, PatientEdVisitType v " +
		//                "WHERE pr.ProfileDiseaseId=d.DiseaseId AND pr.ProfileVisitTypeId=v.VisitTypeId " +
		//                "AND pr.PatientId=" + pId + " " +
		//                "ORDER BY pr.LastPrintedTime DESC ";
				
		//    DataAccessHelper.ExecuteSqlSelect(sql, dt);
		//    return dt;
		//}

		public DataTable GetAllProfilesForPatient(int pId)
		{
			DataTable dt = new DataTable();

			string sql = "SELECT CASE WHEN pr.LastPrintedTime IS NULL THEN 1 ELSE 0 END AS SortOrder, " +
							"pr.ProfileId, pr.ProfileVisitTypeId, pr.LastPrintedTime, pr.LastPrintedBy, d.DiseaseName, v.VisitTypeName " +
							"FROM PatientEdProfile pr, PatientEdDisease d, PatientEdVisitType v " +
							"WHERE pr.ProfileDiseaseId=d.DiseaseId AND pr.ProfileVisitTypeId=v.VisitTypeId " +
							"AND pr.PatientId=" + pId + " " +
							"ORDER BY SortOrder DESC, pr.LastPrintedTime DESC ";
				
			DataAccessHelper.ExecuteSqlSelect(sql, dt);
			return dt;
		}

		public DataTable GetProfileDocPartsByProfileId(int proId)
		{
		    DataTable dt = new DataTable();

		    string sql = "SELECT * " +
		                "FROM PatientEdProfileDocPart " +
		                "WHERE ProfileId=" + proId + " " +
		                "ORDER BY OrderNumber ASC ";

		    DataAccessHelper.ExecuteSqlSelect(sql, dt);
		    return dt;
		}

		/*public DataTable GetProfileDocPartsByProfileId(int profileId)
		{
			DataTable dt = new DataTable();

			string sql = "SELECT p.ProfileDocPartId, p.ProfileId, p.SubTopicId , st.SubTopicName, st.SubTopicContent  " +
						"FROM PatientEdProfileDocPart p INNER JOIN PatientEdSubTopic st ON st.SubTopicId=p.SubTopicId " +
						"WHERE ProfileId=" + profileId + "";

			DataAccessHelper.ExecuteSqlSelect(sql, dt);
			return dt;
		}*/

		public void DeleteProfileDocPartByProfileIdAndSubTopicId(int proId, int stId)
		{
			string sql = "DELETE FROM PatientEdProfileDocPart " +
						"WHERE ProfileDocPartId= " +
							"(SELECT ProfileDocPartId " +
							"FROM PatientEdProfileDocPart " +
							"WHERE ProfileId=" + proId + " AND SubTopicId=" + stId + ") ";

			SqlCommand sqlcmd = DataAccessHelper.CreateSqlCommand(sql);
			DataAccessHelper.ExecuteScalar(sqlcmd);
		}
    }
}