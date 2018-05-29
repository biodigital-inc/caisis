using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for Patient.
	/// </summary>
	public class QOL_TherapyDa : BaseDA
	{
	
		public DataSet FormListQOL_Therapy(int PatientId, string FormName, string FormType)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormListQOL_Therapy");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}






			
	}
}
