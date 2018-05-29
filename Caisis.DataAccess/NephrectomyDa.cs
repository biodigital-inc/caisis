using System;
using System.Data;
using System.Data.SqlClient;



using System.Collections;


namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for NephrectomyDa.
	/// </summary>
    public class NephrectomyDa : BaseDA//ChildDataAccessRelOne
	{



        /// <summary>
        /// Gets distinct lab test names for patient 
        /// </summary>
        /// <param name="PatientId"></param>
        /// <returns></returns>
        public DataTable GetNephrectomies(int PatientId)
        {
            string sql = @"
               SELECT *
               FROM OperatingRoomDetails 
                    LEFT OUTER JOIN
                       (NephrectomyProc INNER JOIN Procedures ON NephrectomyProc.ProcedureId = Procedures.ProcedureId) 
                    ON OperatingRoomDetails.OperatingRoomDetailId = Procedures.OperatingRoomDetailId 
                    LEFT OUTER JOIN
                       (NephrectomyPath INNER JOIN Pathology ON NephrectomyPath.PathologyId = Pathology.PathologyId) 
                    ON OperatingRoomDetails.OperatingRoomDetailId = Pathology.OperatingRoomDetailId
               WHERE (OperatingRoomDetails.PatientId = @PatientId) AND 
                     (Pathology.OperatingRoomDetailId IS NOT NULL OR Procedures.OperatingRoomDetailId IS NOT NULL) ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataTable dt = DataAccessHelper.GetList(com).Tables[0];

            return dt;
        }
			

	}
}
