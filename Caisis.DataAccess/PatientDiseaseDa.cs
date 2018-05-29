using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Patient Disease Da calls stored procedures.
	/// </summary>
	public class PatientDiseaseDa : BaseDA //: ChildDataAccess
	{
		/*
        protected override void SetParams()  
		{
			this._GetStoredProc				= "spGetPatientDiseasesRecord";
			this._InsertStoredProc			= "spInsertPatientDiseasesRecord";
			this._UpdateStoredProc			= "spUpdatePatientDiseasesRecord";
			this._DeleteStoredProc			= "";
			this._GetByParentStoredProc		= "spGetPatientDiseases";
			//table has two primary keys.. use patient id for now
		}

		protected override void SuppressInsertColumns(DataTable dt)  
		{
			DataColumnCollection dcCol = dt.Columns;

			if(dcCol["LockedBy"] != null && dcCol["LockedTime"] != null)
			{
				_SuppressColumn(dcCol["LockedBy"]);
				_SuppressColumn(dcCol["LockedTime"]);
			}

			_SuppressColumn(dcCol["UpdatedBy"]);
			_SuppressColumn(dcCol["EnteredBy"]);

			//do NOT want to suppress the insertion of the primary key (same as parent key)
			//base.SuppressInsertColumns(dt);
		}	

		override protected void SuppressUpdateColumns(DataTable dt)  
		{
			DataColumnCollection dcCol = dt.Columns;
			
			_SuppressColumn(dcCol["UpdatedBy"]);
			_SuppressColumn(dcCol["EnteredBy"]);
			_SuppressColumn(dcCol["EnteredTime"]);

			if(dcCol["LockedBy"] != null && dcCol["LockedTime"] != null)
			{
				_SuppressColumn(dcCol["LockedBy"]);
				_SuppressColumn(dcCol["LockedTime"]);
			}

		}
		*/

		//following two methods are used in inserting new patients using dimension from XML- 
		//called from PatientController
		//also called from PatientDisease form on front end
        [Obsolete]
		public void InsertPatientDisease(int patientId, int diseaseId, SqlTransaction trans)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spInsertPatientDiseasesRecord", trans);
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			DataAccessHelper.AddIntInputParam(com, "DiseaseId", diseaseId);
			DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

			DataAccessHelper.ExecuteScalar(com);
		}

        [Obsolete]
		public void InsertPatientDisease(int patientId, int diseaseId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spInsertPatientDiseasesRecord");
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			DataAccessHelper.AddIntInputParam(com, "DiseaseId", diseaseId);
			DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

			DataAccessHelper.ExecuteScalar(com);
		
		}
		



		public DataSet GetPatientDisease(int patientId, int diseaseId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientDiseasesRecord");
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			DataAccessHelper.AddIntInputParam(com, "DiseaseId", diseaseId);

			return DataAccessHelper.GetRecord(com);

		}
		//not called anywhere
		public void UpdatePatientDisease(int patientId, int diseaseId, int newDiseaseId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdatePatientDiseasesRecord");
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			DataAccessHelper.AddIntInputParam(com, "DiseaseId", diseaseId);
			DataAccessHelper.AddIntInputParam(com, "NewDiseaseId", newDiseaseId);
			//DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

			DataAccessHelper.ExecuteScalar(com);
		}

		//public DataSet GetPatientDiseaseRecord(int primKey, int primKeyTwo)  
		//{
		//	SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientDiseaseRecord");
		//	DataAccessHelper.AddIntInputParam(com, "PatientId", primKey);
		//	DataAccessHelper.AddIntInputParam(com, "DiseaseId", primKeyTwo);
		//	return DataAccessHelper.GetRecord(com);
		//}

		public bool DeletePatientDiseaseRecord(int primKey, int primKeyTwo)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spDeletePatientDiseasesRecord");
			DataAccessHelper.AddIntInputParam(com, "PatientId", primKey);
			DataAccessHelper.AddIntInputParam(com, "DiseaseId", primKeyTwo);
			DataAccessHelper.ExecuteScalar(com);
			return true;
		}

		public DataSet ValidatePatientDisease(int patientId, int diseaseId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientDiseasesRecord");
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			DataAccessHelper.AddIntInputParam(com, "DiseaseId", diseaseId);
			return DataAccessHelper.GetList(com);
		}

        public DataSet GetDistinctPatientDiseases(string datasetSql)
        {
            DataSet ds = new DataSet();

            string sql = @"
                SELECT Diseases.DiseaseName
                FROM PatientDiseases
                INNER JOIN Diseases 
                ON PatientDiseases.DiseaseId = Diseases.DiseaseId ";
            sql += "INNER JOIN (" + datasetSql + ") AS ds ON PatientDiseases.PatientId= ds.PatientId ";
            sql += @"
                GROUP BY Diseases.DiseaseName
                ORDER BY Diseases.DiseaseName ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            ds = DataAccessHelper.GetRecord(com);

            return ds;
        }

	}
}