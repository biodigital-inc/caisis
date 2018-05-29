using System;

using System.Data;
using System.Data.Odbc;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;

using System.IO;
using System.Text;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Security;

using System.Xml;


namespace Caisis.Controller
{

	
    // BRANDON
  
    public class DataExportController
	{
		protected ArrayList selectedTables;
		protected int exportUserId;

		
		// write file to virtual or physical path specified in web.config
		public string  FILE_LOCATION = CaisisConfiguration.GetWebConfigValue("exportFileLocation");
		
		protected string FILE_NAME;		
		
		public string method = "FILE"; //= ;
		public string exportFormat;
		
		public DataExportController ()
		{
		}



        public IEnumerable<string> GetDiseaseTableList(string tableCategory)
        {
            // return BusinessObjectFactory.GetTablenamesForDisease(tableCategory);
			return BusinessObject.GetTableNamesWithMetadataAttributeValue("Disease", tableCategory);
        }

		protected int LogUserExport(UserExport biz)  
		{
			// v4 
            //UserExportDa da = new UserExportDa();
			//DataRow dr = biz.Tables[0].Rows[0];
			//int userExportId = da.InsertRecord(dr);
			//dr[UserExport.UserExportId] = userExportId;
			//return userExportId;

            biz.Save();
            return (int)biz[biz.PrimaryKeyName];
            
		}

	
		protected void SetNewDBName(int userExportId)  
		{
			SecurityController sc = new SecurityController();
			this.FILE_NAME = FILE_LOCATION+sc.GetUserName()+userExportId.ToString();
		}

        protected void EndExport(UserExport biz)  
		{			
			// v4 DataRow dr = biz.Tables[UserExport.Table_UserExport].Rows[0];
			UserExportPatientsDa tmp = new UserExportPatientsDa();
            if (((string)biz["privacyLevel"]).Equals("Identified"))  
			{					
				tmp.DeleteRecords(exportUserId.ToString());
			}
		}
/*
		protected void AddTables(ArrayList selectedTables, BusinessObject [] tableList)  
		{
			foreach (BusinessObject biz in tableList)  
			{
				selectedTables.Add(biz);
			}

		}
*/
		protected ArrayList ConvertNamesToTables(ArrayList selectedTableNames)  
		{
			ArrayList tables = new ArrayList();
			//BusinessObjectFactory fact = new BusinessObjectFactory();
            //BusinessObjectFactory fact = new BusinessObjectFactory();
			foreach (string tableName in selectedTableNames)  
			{
                tables.Add(BusinessObjectFactory.BuildBusinessObject(tableName));
			}
			return tables;
		}



		protected void InitExport(UserExport biz,  string datasetSql,  ArrayList selectedTableNames)  
		{
			DataView view = new UserExport[] { biz }.AsDataView();

			//this.ValidatePrivacyLevel(biz.DataSourceView.Table);
			this.ValidatePrivacyLevel(view.Table);
						
			selectedTables = ConvertNamesToTables(selectedTableNames);
			this.AddParentTables(selectedTables);

			exportUserId = this.LogUserExport(biz);
			
			this.SetNewDBName(exportUserId);
			            
			//DataRow dr = biz.Tables[UserExport.Table_UserExport].Rows[0];
			UserExportPatientsDa tmp = new UserExportPatientsDa();
			tmp.CreateTable(datasetSql, exportUserId);
			
		}
		


		virtual public object GetDataExport(UserExport biz, string datasetSql,  ArrayList selectedTableNames)  
		{		
			return null;
		}

		public void ValidatePrivacyLevel(DataTable dt)  
		{
			DataRow dr = dt.Rows[0];
			string appType = appType = ((string)dr[UserExport.IRB_ApprovalType]);
					
			switch (((string)dr[UserExport.PrivacyLevel]).ToLower())  
			{
				case "limited":
					if (appType.IndexOf("Data Use Agreement") == -1)  
					{
						throw new ClientException("Wrong approval type for limited privacy level.");
					}
					break;
				case "identified" :
					if (appType.IndexOf("None") != -1 || appType.IndexOf("Data User Agreement") != -1)  
					{
						throw new ClientException("Wrong approval type for identified privacy level.");
					}
					if (dr[UserExport.IRB_ApprovalDate] == DBNull.Value)  
					{
						throw new ClientException("Approval Date cannot be null for identified privacy level.");
					}
					string purpose = ((string)dr[UserExport.Purpose]);
					if (purpose.IndexOf("Operations Data Analysis") == -1)  
					{
						throw new ClientException("Wrong purpose type for identified privacy level.");
					}
					break;
			}
		}

		private int FindTable(string parentTable, ArrayList exportTables)  
		{
			for(int i=0; i< exportTables.Count; i++)  
			{
				BusinessObject biz = (BusinessObject)exportTables[i];
				//if (biz.DataSourceView.Table.Rows.Count > 0 && biz.Tablename.Equals(parentTable))  
				//{
				//    return i;
				//}

				if (!biz.IsEmpty && biz.TableName == parentTable)
					return i;
			}
			return -1;
		}

		private ArrayList AddParentTables(ArrayList selectedTables)
		{
            /* v4
            BusinessObjectFactory boFact = new BusinessObjectFactory();
            
			DataAccessFactory daFact = new DataAccessFactory();

			for(int i=0; i < selectedTables.Count; i++)  
			{
				BusinessObject currTable = (BusinessObject)selectedTables[i];
				string tableName = currTable.Tablename;
				if (currTable is EmptyBusinessObject)  
				{
					tableName  = currTable.Tables[0].TableName;
				}
				
				BaseDataAccess da = daFact.GetDataAccess(tableName);
				string parentTableName = da.ParentTableName;
					
				if (parentTableName != null)  
				{
					int parentTableIndex = this.FindTable(parentTableName, selectedTables);
					if (parentTableIndex != -1)  
					{
						if (parentTableIndex > i)  
						{
							object parentTable = selectedTables[parentTableIndex];
							selectedTables.RemoveAt(parentTableIndex);
							selectedTables.Insert(0, parentTable);
							i++;
						}
					}
					else 
					{
						BusinessObject parentTable = boFact.GetBusinessObject(parentTableName);
						selectedTables.Insert(0, parentTable);
						i++;
					}
				}
			}

			if (this.FindTable(Patient.Table_Patients, selectedTables) == -1)  
			{
				selectedTables.Add(boFact.GetBusinessObject(Patient.Table_Patients));
			}
            */
			return selectedTables;
		}


	}
}