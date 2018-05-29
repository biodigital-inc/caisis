using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for Allergy.
	/// </summary>
	public class AllergyDa : BaseDA
	{
		

		public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormListAllergies");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}



			
	}
}
