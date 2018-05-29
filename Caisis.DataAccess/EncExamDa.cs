using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for EncExamDREDa.
	/// </summary>
	public class EncExamDa : BaseDA
	{
		

		public DataSet ValidateEncExam(int EncounterId, string Exam, string ExamSystem)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spValidateEncExam");
			DataAccessHelper.AddIntInputParam(com, "EncounterId", EncounterId);
			DataAccessHelper.AddStringInputParam(com, "Exam", Exam);
			DataAccessHelper.AddStringInputParam(com, "ExamSystem", ExamSystem);
			return DataAccessHelper.GetList(com);
		}



	}
}
