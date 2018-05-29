using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Xml;
using System.Configuration;
using System.Linq;

using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.Controller
{
	/// <summary>
	/// Used to contain information pertaining to a single Sql criteria.  This contstruct is used
	/// for creating Dataset SQL.
	/// </summary>
	public class Dimension
	{
		public string DimType;
		public int PrimKey;
		public Dimension ()  
		{
		}
	}

	/// <summary>
	/// Contains the values related to one dimension of a sql query.  Some example dimension  groups include
	/// Physician, Institution or Disease.
	/// </summary>
	public class DimensionGroup  
	{
		public bool institution = false, disease = false, physician = false, protocol = false, all = false;
		public string orInstitution = "", orDisease = "", orPhysician = "", orProtocol = "";
		public string[] aliasNames = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
		public Dimension[] dimensions = new Dimension[26];
		public int dimNum = 0;
		
		public DimensionGroup() 
		{
		}
	}

	/// <summary>
	/// This class contains methods used to dynamically create SQL for retrieving patient records as 
	/// defined by DataSet criteria.
	/// </summary>
	public class DataSetController
	{
		protected bool rootGroup = true;
		
		public DataSetController()
		{
		}

		/// <summary>
		/// Retrieves the SQL string for a specified dataset.
		/// </summary>
		/// <param name="datasetId">Int representing the dataset for which we are constructing sql.</param>
		/// <returns></returns>
		public string GetDatasetSQL(int datasetId)  
		{
		
			XmlNode dsNod = this.FindDatasetNode(datasetId);
			string sql = this.GetAndGroupString(dsNod);
			sql = sql.Insert(sql.IndexOf("PatientId",0),"* ");
			string sql2 = this._RemoveLeadingWord(sql, "PatientId");
			sql = sql.Substring(0, sql.IndexOf("PatientId")-1)+sql2;
			return sql;
		}

        /// <summary>
        /// Returns if a Patient (by patient id) is in the specifiec dataset.
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="datasetSQL"></param>
        /// <returns></returns>
        public bool IsPatientInDataset(int patientId, string datasetSQL)
        {
            bool isInDataset = false;
            if (!string.IsNullOrEmpty(datasetSQL))
            {
                isInDataset = new PatientDa().IsPatientInDataset(patientId, datasetSQL);
            }
            return isInDataset;
        }

        /// <summary>
        /// Retrieves the sql string for a "And" dimension group.  This method is called by ProcessChildren method 
        /// when an And group is encountered.
        /// </summary>
        /// <param name="dimNod">The XmlNode which starts the dimension group.</param>
        /// <returns></returns>
		private string GetAndGroupString(XmlNode dimNod)  
		{
			DimensionGroup dg = new DimensionGroup();

			string groupString = "";
			string whereClause = this.ProcessChildren(dimNod, "and", dg);			
			string fromClause = "";
			//fromClause = this._AddFromClause("INNER", dg);
	
		
			//select from view within database that contains minimum columns. other sp's reference this view as well
			groupString = "SELECT DISTINCT Dataset_Patients.PatientId FROM Dataset_Patients ";
			//string combinedString = "Select Patients.PtFirstName, Patients.PtLastName, Patients.PtMiddleName, Patients.PtSuffix, Patients.PtTitle, Patients.PtMRN, Patients.PatientId, Patients.PtBirthDateText, Patients.PtContactStatus, Patients.PtNotes from Patients";

			if (dg.all == true)  
			{
				whereClause = "";
				fromClause = "";
			}
			
			if (!whereClause.Equals(""))  
			{
				whereClause = this._RemoveLeadingWord(whereClause, "and");
				groupString +=fromClause +" WHERE "+whereClause;
			}
			return groupString;
		}


		/// <summary>
		/// Builds the Sql string for a single dimension included in an "And" dimension group by creating a 
		/// DimensionGroup object.
		/// </summary>
		/// <param name="dimNod">The dimension XmlNode.</param>
		/// <param name="dg">DimensionGroup object that the Dimension belongs to.  This object is being build with each 
		/// recursive call to this method.</param>
		/// <returns></returns>
		private string GetAndDimensionString(XmlNode dimNod, DimensionGroup dg)  
		{
			string selectStr = "";
			string dimType = dimNod.Attributes["type"].Value;

			//BaseDataAccess da = null;
			int key = 0;

			switch(dimType)
			{
				case "Institution":
					dg.institution = true;
                    InstitutionDa ida = new InstitutionDa();
					key = ida.GetPrimKey(dimNod.Attributes["value"].Value);
					selectStr = "Dataset_Patients.patientid in(SELECT PatientId FROM PatientInstitutions WHERE institutionid = "+ key.ToString()+") ";
					break;
				case "Physician":
					dg.physician = true;
                    PhysicianDa pda = new PhysicianDa();
					key = pda.GetPrimKey(dimNod.Attributes["value"].Value, dimNod.Attributes["value2"].Value);
					selectStr = "Dataset_Patients.patientid in(SELECT PatientId FROM PatientPhysicians WHERE PhysicianId = "+ key.ToString()+") ";
					break;
				case "Protocol":
					dg.protocol = true;
                    ProtocolDa protda = new ProtocolDa();
                    key = protda.GetPrimKey(dimNod.Attributes["value"].Value);
					selectStr = "Dataset_Patients.patientid in (Select patientId from PatientProtocols where protocolId = "+key.ToString()+ ") ";
					break;
				case "Disease":
					dg.disease = true;
                    DiseaseDa dda = new DiseaseDa();
                    key = dda.GetPrimKey(dimNod.Attributes["value"].Value);
					selectStr = "Dataset_Patients.patientid in(SELECT PatientId FROM PatientDiseases WHERE DiseaseId = "+ key.ToString()+") ";
					break;
				case "All":
					dg.all = true;
					selectStr = " ";
					break;
			}		
			return selectStr;
		}

		/// <summary>
		/// Builds the Sql string for a single dimension included in an "Or" dimension group by creating a 
		/// DimensionGroup object.
		/// </summary>
		/// <param name="dimNod">The dimension XmlNode.</param>
		/// <param name="dg">DimensionGroup object that the Dimension belongs to.  This object is being build with each 
		/// recursive call to this method.</param>
		private void GetOrDimensionString(XmlNode dimNod, DimensionGroup dg)    
		{
			string dimType = dimNod.Attributes["type"].Value;

			//BaseDataAccess da = null;
			int key = 0;

			switch(dimType)
			{
				case "Institution":
					dg.institution = true;
                    InstitutionDa ida = new InstitutionDa();
                    key = ida.GetPrimKey(dimNod.Attributes["value"].Value);
					dg.orInstitution += key.ToString()+", ";
					break;
				case "Physician":
					dg.physician = true;
                    PhysicianDa pda = new PhysicianDa();
                    key = pda.GetPrimKey(dimNod.Attributes["value"].Value, dimNod.Attributes["value2"].Value);
					dg.orPhysician += key.ToString()+", ";
					break;
				case "Protocol":
					dg.protocol = true;
                    ProtocolDa protda = new ProtocolDa();
                    key = protda.GetPrimKey(dimNod.Attributes["value"].Value);
					dg.orProtocol += key.ToString()+", ";
					break;
				case "Disease":
					dg.disease = true;
                    DiseaseDa diseaseda = new DiseaseDa();
					key = diseaseda.GetPrimKey(dimNod.Attributes["value"].Value);
					dg.orDisease += key.ToString()+", ";
					break;
				case "All":
					dg.all = true;
					break;
			}		
		} 

		/// <summary>
		/// Retrieves the sql string for a "Or" dimension group.  This method is called by ProcessChildren method 
		/// when an Or group is encountered.
		/// </summary>
		/// <param name="dimNod">The XmlNode which starts the dimension group.</param>
		/// <returns></returns>
		private string GetOrGroupString(XmlNode dimNod)  
		{
			DimensionGroup dg = new DimensionGroup();

			string whereClause = this.ProcessChildren(dimNod, "or", dg);
			string fromClause = "";
			string groupString = "SELECT DISTINCT Dataset_Patients.PatientId FROM Dataset_Patients ";
			
			fromClause = this._AddFromClause("LEFT OUTER", dg);

			// the following series of if statements adds the clauses for each or Type and removes the trailing commas
			whereClause += this._ParseOrString(dg.orDisease, PatientDisease.DiseaseId);
			whereClause += this._ParseOrString(dg.orInstitution, PatientInstitution.InstitutionId);
			whereClause += this._ParseOrString(dg.orProtocol, PatientProtocol.ProtocolId);
			whereClause += this._ParseOrString(dg.orPhysician, PatientPhysician.PhysicianId);

			
			if (!whereClause.Equals(""))  
			{
				//remove leading opStr ("and" & "or" operators are always added leading each clause)
				//create the parentheses for the subquery
				groupString += fromClause+" where "+this._RemoveLeadingWord(whereClause, "or");
			}
			return groupString;
		}

		/// <summary>
		/// Recursive method used to step through the nodes of the Xml tree.
		/// </summary>
		/// <param name="nodAdult">The parent node of the current node being processed.</param>
		/// <param name="opStr">The type of dimension group that the current dimension belongs to.</param>
		/// <param name="dg">DimensionGroup that the current dimension belongs to.</param>
		/// <returns></returns>
		private string ProcessChildren(XmlNode nodAdult, string opStr, DimensionGroup dg)  
		{
			string groupString = "";
			
			if(nodAdult == null)
			{
				throw new SystemException("The XML for the dataset you selected has not been properly defined.");
			}

			XmlNode dimChild = nodAdult.FirstChild;

			while (dimChild!= null)  
			{
				if (dimChild.Name.Equals("dimension"))  
				{
					if (opStr.Equals("and"))  
					{
						groupString += " and "+this.GetAndDimensionString(dimChild, dg);
					} 
					else if (opStr.Equals("or"))
					{
						this.GetOrDimensionString(dimChild, dg);
					}
				}
				else if (dimChild.Name.Equals("dimGroup"))  
				{
					string groupType = dimChild.Attributes["operator"].Value;
					if (groupType.Equals("and"))  
					{
						groupString += " and DataSet_Patients.PatientId in ("+this.GetAndGroupString(dimChild)+")";					
					
					}
					else if (groupType.Equals("or"))  
					{
						groupString += " and DataSet_Patients.PatientId in ("+this.GetOrGroupString(dimChild)+")";					
					}
				}				
				dimChild = dimChild.NextSibling;
			}	//end inside while loop
		
			return groupString;			
		}

		/// <summary>
		/// Helper function thath adds the clauses for each or Type and removes the trailing commas
		/// </summary>
		/// <param name="orString"></param>
		/// <param name="primKeyName"></param>
		/// <returns></returns>
 		private string _ParseOrString(string orString, string primKeyName)  
		{
			if (!orString.Equals(""))  
			{
				orString = orString.Substring(0, orString.Length-2);
				if (orString.IndexOf(",") > -1)  
				{
					return " or "+primKeyName+" IN("+orString+")";
				}
				else 
				{
					return " or "+primKeyName+" = "+orString;
				}
						
			}
			return "";
		}

		private string _RemoveLeadingWord(string str, string word)  
		{
			if (str.Length > 0)
			{
				int startIndex = str.IndexOf(word) + word.Length;
				int length = str.Length - startIndex;
				return str.Substring(startIndex, length);
			}
			return "";
		}






		private XmlDocument ReadXml()  
		{
            string datasetXmlPath = AppDomain.CurrentDomain.BaseDirectory + "\\App_Data\\Datasets.xml";

			XmlTextReader xtr = new XmlTextReader(datasetXmlPath);
			
			xtr.WhitespaceHandling = WhitespaceHandling.None;
		
			XmlDocument xd = new XmlDocument();
			
			try 
			{
				xd.Load(xtr);
			}
			catch (Exception e)  
			{
				xtr.Close();
				throw e;
			}
			xtr.Close(); 
			return xd;
		}
	
		public XmlNode FindDatasetNode(int datasetId)  
		{
			XmlDocument xd = this.ReadXml();

			XmlNode xnodRoot = xd.DocumentElement;

			XmlNode dsNod;

			if(xnodRoot.HasChildNodes && xnodRoot.Name.Equals("datasets"))
			{
				dsNod = xnodRoot.FirstChild;
				while(dsNod != null)  
				{
					if (dsNod.Name.Equals("dataset") && 
						int.Parse(dsNod.Attributes["id"].Value) == datasetId)  
					{
						return dsNod;
					}
					dsNod = dsNod.NextSibling;
				}
			}
			else 
			{
				throw new SystemException("XML must have datasets as a parent root.");
			}
			return null;
		}	

		private string _AddFromClause(string joinType, DimensionGroup dg)  
		{
			string fromString = "";
			// add the from clauses
			if (dg.institution)  
			{
				fromString += joinType+" JOIN PatientInstitutions ON Dataset_Patients.PatientId = PatientInstitutions.PatientId ";
			}
			if (dg.physician)  
			{
				fromString += joinType+" JOIN PatientPhysicians ON Dataset_Patients.PatientId = PatientPhysicians.PatientId ";
			}
			if (dg.disease)  
			{
				fromString += joinType+" JOIN PatientDiseases ON Dataset_Patients.PatientId = PatientDiseases.PatientId ";
			}
			if (dg.protocol)  
			{
				fromString += joinType+" JOIN PatientProtocols ON Dataset_Patients.PatientId = PatientProtocols.PatientId ";
			}
			return fromString;
		}

		/*
		 private string GetAndDimensionString(XmlNode dimNod, DimensionGroup dg)  
		{
			string selectStr = "";
			string dimType = dimNod.Attributes["type"].Value;

			BaseDataAccess da = null;
			int key = 0;

			switch(dimType)
			{
				case "Institution":
					this.institution = true;
					da = new InstitutionDa();
					key = ((InstitutionDa)da).GetPrimKey(dimNod.Attributes["value"].Value);
					selectStr = "Dataset_Patients.patientid in(SELECT PatientId FROM PatientInstitutions WHERE institutionid = "+ key.ToString()+") ";
					break;
				case "Physician":
					this.physician = true;
					da = new PhysicianDa();
					key = ((PhysicianDa)da).GetPrimKey(dimNod.Attributes["value"].Value, dimNod.Attributes["value2"].Value);
					selectStr = "Dataset_Patients.patientid in(SELECT PatientId FROM PatientPhysicians WHERE PhysicianId = "+ key.ToString()+") ";
					break;
				case "Protocol":
					this.protocol = true;
					da = new ProtocolDa();
					key = ((ProtocolDa)da).GetPrimKey(dimNod.Attributes["value"].Value);
					selectStr = "Dataset_Patients.patientid in (Select patientId from PatientProtocols where protocolId = "+key.ToString()+ ") ";
					break;
				case "Disease":
					this.disease = true;
					da = new DiseaseDa();
					key = ((DiseaseDa)da).GetPrimKey(dimNod.Attributes["value"].Value);
					selectStr = "Dataset_Patients.patientid in(SELECT PatientId FROM PatientDiseases WHERE DiseaseId = "+ key.ToString()+") ";
					break;
				case "All":
					this.all = true;
					selectStr = " ";
					break;
			}		
			return selectStr;
		}
		*/

		
	}

}