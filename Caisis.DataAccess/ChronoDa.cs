using System;
using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for ChronoDa.
	/// </summary>
	public class ChronoDa
	{
		public ChronoDa()  
		{
		}

        /// <summary>
        /// Allows choice of list type and hiding/showing lab values
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="listType"></param>
        /// <param name="userName"></param>
        /// <param name="excludeLabs"></param>
        /// <returns></returns>
		public DataSet GetChronoList(int patientId, string listType, string userName, bool excludeLabs)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spChronologicalList");
			DataAccessHelper.AddIntInputParam(com, "patientId", patientId);
			DataAccessHelper.AddBitInputParam(com, listType, 1);
            DataAccessHelper.AddStringInputParam(com, "ExcludeLabs", (excludeLabs? 1:0).ToString());
			DataAccessHelper.AddStringInputParam(com, "UserName", userName);
            
			return DataAccessHelper.GetList(com);
		}

        /// <summary>
        /// defaults to showing labs (if applicable to the list type)
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="listType"></param>
        /// <param name="userName"></param>
        /// <returns></returns>
        public DataSet GetChronoList(int patientId, string listType, string userName)
        {
            return GetChronoList(patientId, listType, userName, false);  
        }

        /// <summary>
        /// Defaults to Listing all values
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="userName"></param>
        /// <returns></returns>
		public DataSet GetChronoList(int patientId, string userName)  
		{
            return GetChronoList(patientId, "ListAll", userName, false);  
		}
		

	}
}
