using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for Patient.
	/// </summary>
	public class ProtocolDa : BaseDA
	{
		

		public DataSet GetDistinctProtocols()  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetDistinctProtocols");
			//DataAccessHelper.AddIntInputParam(com, "patientId", patientId);
	
			return DataAccessHelper.GetList(com);		
		}

        /// <summary>
        /// Get filtered list of Distinct Protocols.
        /// </summary>
        /// <param name="searchFilter">"All","",number(0-9) or range (eg. a-d). NOTE: (All = "")</param>
        /// <returns></returns>
        public DataSet GetDistinctProtocols(string searchFilter)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetDistinctProtocols");
            DataAccessHelper.AddStringInputParam(com, "Search", searchFilter);
            return DataAccessHelper.GetList(com);
        }

		//used on insert new patients into dimensions
		public int GetPrimKey(string protocolName)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetDatasetDimensionValue");
			
			DataAccessHelper.AddStringInputParam(com, "Dimension", "Protocols");
			DataAccessHelper.AddStringInputParam(com, "InputValue", protocolName);
			DataAccessHelper.AddIntOutputParam(com, "OutputValue");
			
			Hashtable outParams = DataAccessHelper.ExecuteScalar(com);
			
			if(outParams["OutputValue"] != System.DBNull.Value)
			{
				return (int)outParams["OutputValue"];
			}
			else
			{
				return -1;
			}
		}




		public DataSet ValidateProtocolDeletion(int ProtocolId)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spValidateProtocolDeletion");
			DataAccessHelper.AddIntInputParam(com, "ProtocolId", ProtocolId);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}
	}
}