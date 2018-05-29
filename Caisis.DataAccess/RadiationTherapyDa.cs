using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for RadiationTherapyDa.
	/// </summary>
	public class RadiationTherapyDa : BaseDA
	{
	
		public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormListRadiationTherapy");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}
		

			
	}
}