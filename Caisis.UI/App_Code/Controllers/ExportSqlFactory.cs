using System;

using System.Data;

using System.Collections;

using Caisis.DataAccess;
using Caisis.BOL;

// v4 BRANDON Had to reference a lot of table names using strings to get this to compile: not good. 

namespace Caisis.Controller
{
	public class ParentChildRelation  
	{
		public string ParentTable;
		public string ChildTable;
		public string ParentKey;
		public string ChildKey;

		public ParentChildRelation (string parentTable, string childTable, string columnName)  
		{
			this.ParentTable = parentTable;
			this.ParentKey = columnName;
			this.ChildTable = childTable;
			this.ChildKey = columnName;
		}
	}
	/// <summary>
	/// Summary description for ExportSqlFactory.
	/// </summary>
	public class ExportSqlFactory
	{
		string privacyLevel;
		string keyDb;
		
		string sqlConnStr;
		protected Hashtable relations = null;
	
		public ExportSqlFactory(string sqlConnStr, string privacyLevel, string keyDb)
		{
			this.keyDb = keyDb;
			this.privacyLevel = privacyLevel.ToLower();;
			this.sqlConnStr = sqlConnStr;
			this.InitDataRelations();
		}


		/// <summary>
		/// Creates the relations between child and parent tables.  These are used for creating the from part of the SQL statements.
		/// </summary>
		private void InitDataRelations()  
		{			
			this.relations = new Hashtable();
            /* v4
             * BRANDON LETS PUT RELATIONSHIPS IN BO'S
             * 
			// base data relations
			this.AddDataRelation(ImageFinding.Table_DxImageFindings, Diagnostic.Table_Diagnostics, Diagnostic.DiagnosticId);
			this.AddDataRelation(FamilyMemberDiagnosis.Table_FamilyMemberDiagnosis, FamilyMember.Table_FamilyMembers, 
				FamilyMember.FamilyMemberId);
			this.AddDataRelation(PatientProtocolStatus.Table_PatientProtocolStatus, PatientProtocol.Table_PatientProtocols,
				PatientProtocol.PatientProtocolId);
			this.AddSxDataRelation(NeuralStimulation.Table_ProcNeuralStimulations);
			this.AddDataRelation(NodePathologyFinding.Table_ProcNodePathFindings, Procedure.Table_Procedures, Procedure.ProcedureId);
			this.AddDataRelation(Node.Table_ProcNodes, Procedure.Table_Procedures, Procedure.ProcedureId);
			this.AddDataRelation(PathologyFinding.Table_ProcPathFindings, Procedure.Table_Procedures, Procedure.ProcedureId);
			this.AddDataRelation(SurveyItem.Table_SurveyItems, Survey.Table_Surveys, Survey.SurveyId);

			// prostate data relations
			this.AddDataRelation(BiopsyCoreProstate.Table_BiopsyCoresProstate, BiopsyProstate.Table_BiopsiesProstate, BiopsyProstate.BiopsyProstateId);
			this.AddDataRelation(ImageFindingProstate.Table_DxImageFindingsProstate, Diagnostic.Table_Diagnostics, Diagnostic.DiagnosticId);
			this.AddDataRelation(ImageProstate.Table_DxImageProstate, Diagnostic.Table_Diagnostics, Diagnostic.DiagnosticId);
			this.AddDataRelation(EncRectalExamFinding.Table_EncRectalExamFindings, Encounter.Table_Encounters, Encounter.EncounterId);
			this.AddDataRelation(EncRectalExam.Table_EncRectalExams, Encounter.Table_Encounters, Encounter.EncounterId);

			this.AddSxDataRelation(Prostatectomy.Table_ProcProstatectomiesOp);
			this.AddSxDataRelation(ProstatectomyPathology.Table_ProcProstatectomiesPath);

			this.AddSxDataRelation(ProstatectomyOpExam.Table_ProstatectomyOpExams);
			this.AddSxDataRelation(ProstatectomyPathologyFinding.Table_ProstatectomyPathFindings);
			this.AddSxDataRelation(ProstatectomyPathologySection.Table_ProstatectomyPathSections);

			// bladder data relations

			this.AddDataRelation(DietaryIntakeItem.Table_DietaryIntakeItems, DietaryIntake.Table_DietaryIntake, DietaryIntake.DietaryIntakeId);
			this.AddDataRelation(EncBimanualExam.Table_EncBimanualExams, Encounter.Table_Encounters, Encounter.EncounterId);
			this.AddDataRelation(EndoscopyPathologyFinding.Table_EndoscopyPathFindings, Endoscopy.Table_ProcEndoscopies, Endoscopy.ProcEndoscopyId);

			this.AddSxDataRelation(Cystectomy.Table_ProcCystectomiesOp);
			this.AddSxDataRelation(CystectomyPathology.Table_ProcCystectomiesPath);
			this.AddSxDataRelation(CystectomyPathologyFinding.Table_CystectomyPathFindings);

			this.AddSxDataRelation(UrinaryDiversion.Table_ProcUrinaryDiversionsOp);
            */
		}

		/// <summary>
		/// Adds one DataRelation for a table related to Surgeries.
		/// </summary>
		/// <param name="childTable">Name of the child Table.</param>
		private void AddSxDataRelation(string childTable)  
		{
			// v4 AddDataRelation(childTable, Surgery.Table_Surgeries, Surgery.SurgeryId)  ;
		}

		/// <summary>
		/// Adds one DataRelation and names it according to the ChildTable.
		/// </summary>
		/// <param name="childTable">Name of the child table.</param>
		/// <param name="parentTable"></param>
		/// <param name="columnName"></param>
		private void AddDataRelation(string childTable, string parentTable, string columnName)  
		{
			ParentChildRelation pr = new ParentChildRelation(parentTable, childTable, columnName);
			this.relations.Add(childTable, pr);
			
		}

		/// <summary>
		/// Returns whether or not table is linked to the Patients table.
		/// </summary>
		/// <param name="tableName">Name of table to be checked.</param>
		/// <returns>True if linked to Patients table, false if not.</returns>
		private bool IsLinkedToPatients(string tableName)  
		{
			switch(tableName)  
			{
            // v4 this doesn't even make sense
				case "LookupCodes" :
				case "Actions" :
				case "Categories" :
				case "Identifiers" :
				case "Physicians" :
				case "Protocols" :
					return false;
				default :
					return true;
			}
		}

		private string GetFromString(DataTable dt)  
		{			
			// create from clause
			string fromStr = sqlConnStr+"."+dt.TableName;
			string tableName = dt.TableName;
			ParentChildRelation dr = (ParentChildRelation)this.relations[tableName];

			// create From String
			if (IsLinkedToPatients(tableName))  
			{
				if (dr != null)  
				{
					fromStr += " INNER JOIN "+dr.ParentTable+" on "+dr.ParentTable+"."+dr.ParentKey+" = "
						+ dr.ChildTable+"."+ dr.ChildKey;
					
					/* * uncomment this and comment out line above to compare shortCutted SQL
					fromStr = "("+fromStr+" INNER JOIN "+sqlConnStr+"."+dr.ParentTable+" on "+dr.ParentTable+"."+dr.ParentKey+" = "
						+ dr.ChildTable+"."+ dr.ChildKey+")"						
						+ " INNER JOIN ["+this.keyDb+"].tmpSelectedPatients on "+ dr.ParentTable +".PatientId = tmpSelectedPatients.PatientId ";
			*/
					
			}
				else 
				{
					//fromStr +=	" INNER JOIN tmpSelectedPatients on "+tableName+".PatientId = tmpSelectedPatients.PatientId ";
					 fromStr +=	" INNER JOIN ["+this.keyDb+"].tmpSelectedPatients on "+tableName+".PatientId = tmpSelectedPatients.PatientId ";
					//fromStr +=	" INNER JOIN "+sqlConnStr+".Patients on "+tableName+".PatientId = Patients.PatientId ";
				}
			}

			fromStr = " from "+fromStr;

			return fromStr;
		}

		private bool IncludeColumn(string colName)  
		{
			if (colName.IndexOf("Entered") == -1 && colName.IndexOf("Updated") == -1 && 
				colName.IndexOf("Locked") == -1 && colName.IndexOf("PatientId") == -1)  
			{
				return true;
			}
			else 
			{
				return false;
			}
		}

		private string GetLimitedSelect(DataTable dt)  
		{
			string selectStr = "";
			string tableName = dt.TableName;
			ParentChildRelation dr = (ParentChildRelation)this.relations[tableName];

			DataColumnCollection cols = dt.Columns;
		
			// if table contains PatientId, must add AnonymousId
			if (dr == null && this.IsLinkedToPatients(tableName))  
			{
				selectStr += " AnonymousId, ";
			}

			foreach(DataColumn col in cols)  
			{
				if (!tableName.Equals("Patients"))  
				{
					if (this.IncludeColumn(col.ColumnName))
						selectStr += col.Table.TableName+"."+col.ColumnName+", ";
				}
				else 
				{
					// Patient table is select statement is generated differently from all other tables
					if (IncludePatientColumn(col.ColumnName))  
					{
						selectStr += col.Table.TableName+"."+col.ColumnName+", ";
					}
				}
			}
			// remove last comma
			selectStr = selectStr.Substring(0, selectStr.Length-2);

			return selectStr;
		}

		/// <summary>
		/// Parses one item in a Sql select list so that it is DeIdentified, ie. Dates have been truncated to year.
		/// </summary>
		/// <param name="col">DataColumn to be parsed into sql select.</param>
		/// <returns>Sql segment containing the column item.</returns>
		private string GetDeidentifiedSelectItem(DataColumn col)  
		{
			//add only the Year of a DateTime value to the sql selectString
			if ((Type.GetTypeCode(col.DataType)).Equals(TypeCode.DateTime))  
			{
				string datePrefix = col.ColumnName.Substring(0, col.ColumnName.Length-4);
				return "Year(["+ col.ColumnName+"]) as "+datePrefix+"Year, ";
			}
			else 
			{
				return col.Table.TableName+"."+col.ColumnName+", ";
			}
		}


		/// <summary>
		/// Returns the Select into sql string for a specified table for the DeIdentified privacy level.
		/// </summary>
		/// <param name="dt">DataTable for which SQL will be generated.</param>
		/// <returns>Sql string.</returns>
        /// 
		private string GetDeidentifiedSelect(DataTable dt)  
		{	
			string selectStr = "";
			string tableName = dt.TableName;
			ParentChildRelation dr = (ParentChildRelation)this.relations[tableName];

			DataColumnCollection cols = dt.Columns;
		
			// if table contains PatientId, must add AnonymousId
			if (dr == null && this.IsLinkedToPatients(tableName))  
			{
				selectStr += " AnonymousId, ";
			}

			foreach(DataColumn col in cols)  
			{
				if (!tableName.Equals("Patients"))  
				{
					// the following columns should not be included.
					if (IncludeColumn(col.ColumnName) && col.ColumnName.IndexOf("DateText") == -1)  
						selectStr += this.GetDeidentifiedSelectItem(col);
				}
				else 
				{
					// Patient table is select statement is generated differently from all other tables
					if (IncludePatientColumn(col.ColumnName) && col.ColumnName.IndexOf("City") == -1 
						&& col.ColumnName.IndexOf("PostalCode") == -1)  
					{
						selectStr += this.GetDeidentifiedSelectItem(col);
					}
				}
			}
			// remove last comma
			selectStr = selectStr.Substring(0, selectStr.Length-2);

			return selectStr;
		}

		/// <summary>
		/// Determines if the specified column should be included in a Patient table export.
		/// </summary>
		/// <param name="colName">Name of the specified column.</param>
		/// <returns>True if column should be included, false if not.</returns>
		private bool IncludePatientColumn(string colName)  
		{
			if (colName.IndexOf("Contact") == -1 && colName.IndexOf("Name") == -1 && colName.IndexOf("Business") == -1
				&& colName.IndexOf("Address") == -1 && colName.IndexOf("Phone") == -1 && colName.IndexOf("Title") == -1
				&& colName.IndexOf("Company") == -1 && colName.IndexOf("Title") == -1 && colName.IndexOf("Spouse") == -1)  
			{
				if (IncludeColumn(colName))
				{
					return true;
				}
			}
			return false;
		}

		/// <summary>
		/// Determines if table should be exported only when privacy level is set to "Identified"
		/// </summary>
		/// <param name="tableName">Table name. </param>
		/// <returns>True if table should only be exported at "Identified" privacy.  False if not.</returns>
		private bool IsIdentifiedOnlyExport(string tableName)  
		{
			switch (tableName)  
			{
				case "Actions":
				case "Categories":
				case "Identifiers":
				case "Narratives":
				case "PatientPhysicians" :
				case "Physicians":
				case "Protocols" :
					return true;
				default :
					return false;
			}
		}

		private string GetIdentifiedSelect(DataTable dt)  
		{
			string selectStr = "";
			string tableName = dt.TableName;
			ParentChildRelation dr = (ParentChildRelation)this.relations[tableName];

			
			if (dr == null && this.IsLinkedToPatients(dt.TableName))  
				selectStr += "tmpSelectedPatients.PtMRN, ";

			DataColumnCollection cols = dt.Columns;
		
			foreach(DataColumn col in cols)  
			{
				selectStr += col.Table.TableName+"."+col.ColumnName+", ";					
			}
			// remove last comma
			selectStr = selectStr.Substring(0, selectStr.Length-2);
			

			return selectStr;


		}


		/// <summary>
		/// Retrieves the SQL string to be used for select Into export for the specified table
		/// </summary>
		/// <param name="dt">DataTable which represents the database table to be exported.</param>
		/// <returns>SQL string used for export.</returns>
		public string GetSelectSql(DataTable dt)  
		{
			if (!privacyLevel.Equals("identified") && IsIdentifiedOnlyExport(dt.TableName))  
			{
				return null;
			}

			ParentChildRelation dr = null;

			if (dt.Columns[Patient.PatientId] == null)  
			{
				dr = (ParentChildRelation)this.relations[dt.TableName];
			}

			string selectStr = "select ";

			switch (this.privacyLevel)  
			{
				case "identified":
					selectStr += this.GetIdentifiedSelect(dt);
					break;
				case "deidentified":
					selectStr += this.GetDeidentifiedSelect(dt);
					break;
				case "limited":
					selectStr += this.GetLimitedSelect(dt);
					break;
			}			

			string fromStr = this.GetFromString(dt);


			return selectStr +" into "+ dt.TableName+fromStr;
		}


	
	}
}
