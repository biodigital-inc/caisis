using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for ImageProstateDa.
	/// </summary>
	public class ImageProstateDa : BaseDA //ChildDataAccessRelOne
	{
		

		public DataSet GetDxImageProstateRecentDosimetry(int patientId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetDxImageProstateRecentDosimetry");
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);

			return DataAccessHelper.GetRecord(com);
		}
			
	}
}
