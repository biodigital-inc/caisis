using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Web;

using Caisis.DataAccess;
using Caisis.Security;
using Caisis.BOL;

using System.Linq;
using System.Runtime.Serialization;
using System.Xml;
using System.Xml.Linq;

namespace Caisis.Controller
{
	 
	// PUT BIZ RULES HERE AND REMOVE FROM UI AND DA
	// 1) More than one eform should not be started for the same physician, with the same name, on the same date
	// 2) An eform that is approved should never ever change status again (currently in js scripts and eformbasepage)
	// 3) Determine rules for data entry user concurrency issues after further observance in clinic

    /// <summary>
    /// Controller logic for handling authentication, validation, logging, and interface to an EForm.
    /// </summary>
	public class EFormController : Controller.BaseController
	{
        private static readonly string USE_EFORM_VALUE_ATTRIBUTE = "UseAsEformValue";

		protected DataAccess.EFormsDa _da;
        protected string _primKeyName;
		
		public EFormController()
		{
			_da = new EFormsDa();
			// v4 _primKeyName = _da.PrimaryKeyName;
            EForm eform = new EForm();
            _primKeyName = eform.PrimaryKeyName;
		}

		/// <summary>
		/// Checks if this eform for this patient already exists with an approval other than approved or completed
		/// </summary>
		/// <param name="patientId"></param>
		/// <param name="eformName"></param>
		/// <param name="currentStatus"></param>
		/// <returns>-1 for no record or primary key</returns>
		[Obsolete]
		public int IsNewEForm(int patientId, string eformName)  
		{
			// could make more efficient by creating sp for specifically for this
			// TODO: need currentStatus? should just make sure status is not "Approved"
			DataSet ds = _da.GetPatientOpenEformByName(patientId, eformName);
			
			if(ds.Tables[0].Rows.Count == 0)
			{
				return -1; // no record
			}
			else
			{ 
				// return primkey
				int primKey = int.Parse(ds.Tables[0].Rows[0][EForm.EFormId].ToString()); // should ref bizobj

				return primKey;
			}
		}
		
		/// <summary>
		/// Determine if combination of session vars is a valid record in the appointments table
		/// </summary>
		/// <param name="mrn"></param>
		/// <param name="physician"></param>
		/// <param name="clinicDate"></param>
		public DataTable ValidateSessionAppointmentData(object mrn, object physician, object clinicDate)
		{
			DataTable table = new DataTable();

			if (mrn != null && physician != null && clinicDate != null)
			{
				EFormsDa da = new EFormsDa();

				table = da.GetPatientAppointmentRecord(mrn.ToString(), physician.ToString(), DateTime.Parse(clinicDate.ToString()));
			}

			return table;
		}

        /// <summary>
        /// Gets the current status of the EForm
        /// </summary>
        /// <param name="eformId"></param>
        /// <returns></returns>
		public string GetEFormStatus(int eformId)
		{
			string eformStatus = _da.GetEFormStatus(eformId);
			
			return eformStatus;
		}

		public DataSet GetEformsClinicList(string datasetSql, string apptPhysician, string apptClinicDate)
		{
			DataSet ds = _da.GetEformsClinicList(datasetSql, apptPhysician, apptClinicDate);
			
			return ds;
		}
		
		public DataSet GetRecord(int eformId)
		{
            DataSet ds = _da.GetEformsRecord(eformId);
            return ds;
		}

		public DataSet GetOpenRecordByName(int patientId, string eformName)
		{
			DataSet ds = _da.GetPatientOpenEformByName(patientId, eformName);
			
			return ds;
		}

        /// <summary>
        /// Updates the EForm's Current Status
        /// </summary>
        /// <param name="eformId"></param>
        /// <param name="currentStatus"></param>
        /// <param name="userName"></param>
		public void UpdateEFormStatus(int eformId, string currentStatus, string userName)
		{
			if (CanEditEForm())  
			{
				// add call to update EFormLog

				// RULE :once an eform is approved, it can no longer be updated
				string status = this.GetEFormStatus(eformId);

				if(status != "" && status.IndexOf("Approved") == -1) // -1 then approved was not present, update
				{
                    // update EForm status
                    EForm eform = new EForm();
                    eform.Get(eformId);
                    eform[EForm.CurrentStatus] = currentStatus;
                    eform.Save();

                    // add log entry
                    LogEForm(eformId, currentStatus);

                    // _da.UpdateEFormStatus(eformId, currentStatus, userName);
                }
            }
			else
			{
				throw new ClientException("Please contact your administrator for access to this eform.", true);
			}
		}

        [Obsolete("Backwards compatibility, use XmlDocument version")]
        public void UpdateEFormRecord(int eformId, string eformXml, string eformHtml, string currentStatus, string userName)
        {
            XmlDocument _eformXml = new XmlDocument();
            if (!string.IsNullOrEmpty(eformXml))
                _eformXml.LoadXml(eformXml);
            UpdateEFormRecord(eformId, _eformXml, eformHtml, currentStatus);
        }

        /// <summary>
        /// Updates the EForm record with the XML, HTML Transform and Current Status.
        /// </summary>
        /// <param name="eformId"></param>
        /// <param name="eformXml"></param>
        /// <param name="eformHtml"></param>
        /// <param name="currentStatus"></param>
        public void UpdateEFormRecord(int eformId, XmlDocument eformXml, string eformHtml, string currentStatus)
		{
			if (CanEditEForm())  
			{
                // load existing EForm record
                EForm eform = new EForm();
                eform.Get(eformId);
                eform[EForm.EFormXML] = eformXml.InnerXml;
                eform[EForm.EFormReport] = eformHtml;
                eform[EForm.CurrentStatus] = currentStatus;
                // optional EForm Appt Fields
                SetEFormApptFields(eform, eformXml);
                // update
                eform.Save();

                // add log entry
                LogEForm(eformId, currentStatus);

                // _da.UpdateEFormRecord(eformId, eFormXmlString, eformHtml, currentStatus, userName);
            }
			else
			{
                throw new ClientException("Please contact your administrator for access to this eform.", true);
			}
		}
                
        /// <summary>
        /// Updates the EForm's XML and Current Status
        /// </summary>
        /// <param name="eformId"></param>
        /// <param name="s"></param>
        /// <param name="currentStatus"></param>
        /// <param name="userName"></param>
        /// <returns></returns>
		public int UpdateEFormXml(int eformId, string s, string currentStatus, string userName)
		{
			if (CanEditEForm())  
			{
                // update the EForm record
                EForm eform = new EForm();
                eform.Get(eformId);
                eform[EForm.EFormXML] = s;
                eform[EForm.CurrentStatus] = currentStatus;
                eform.Save();

                // add log entry
                LogEForm(eformId, currentStatus);

                // possibly add call to update EFormLog ; will update very often
                //_da.UpdateEFormXml(eformId, s, currentStatus, userName);
            }
            else
			{
                throw new ClientException("Please contact your administrator for access to this eform.", true);
			}
			// should return xml string used to repopulate form
			return eformId;
		}
	
        /// <summary>
        /// Updates the EForm's HTML Transform and Current Status
        /// </summary>
        /// <param name="eformId"></param>
        /// <param name="narrative"></param>
        /// <param name="currentStatus"></param>
        /// <param name="userName"></param>
        /// <returns></returns>
		public bool UpdateEFormReport(int eformId, string narrative, string currentStatus, string userName)
		{
			bool returnVal = false;

			if (CanEditEForm())  
			{
                // update EForm record
                EForm eform = new EForm();
                eform.Get(eformId);
                eform[EForm.EFormReport] = narrative;
                eform[EForm.CurrentStatus] = currentStatus;
                eform.Save();

                // add log entry
                LogEForm(eformId, currentStatus);

                return true;
				// add call to update EFormLog
		
				//returnVal = _da.UpdateEFormReport(eformId, narrative, currentStatus, userName);
			}
			else
			{
                throw new ClientException("Please contact your administrator for access to this eform.", true);
			}
			
			return returnVal;
		}

        [Obsolete("Backwards compatibility, use XmlDocument version")]
        public int InsertRecord(int userId, int patientId, string eformName, string eformXml, string currentStatus, object eformApptTime, string eformApptPhysician, string userName)
        {
            XmlDocument _eformXml = new XmlDocument();
            if (!string.IsNullOrEmpty(eformXml))
                _eformXml.LoadXml(eformXml);
            return InsertRecord(userId, patientId, eformName, _eformXml, currentStatus, eformApptTime, eformApptPhysician);
        }

        /// <summary>
        /// Inserts a new EForm record
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="patientId"></param>
        /// <param name="eformName"></param>
        /// <param name="eformXml"></param>
        /// <param name="currentStatus"></param>
        /// <param name="eformApptTime"></param>
        /// <param name="eformApptPhysician"></param>
        /// <returns></returns>
        public int InsertRecord(int userId, int patientId, string eformName, XmlDocument eformXml, string currentStatus, object eformApptTime, string eformApptPhysician)
		{
			int eformId;

			if (CanEditEForm())  
			{
                // create new EForm record
                EForm eform = new EForm();
                eform[EForm.UserId] = userId;
                eform[EForm.PatientId] = patientId;
                eform[EForm.EFormName] = eformName;
                eform[EForm.EFormXML] = eformXml.InnerXml;
                eform[EForm.CurrentStatus] = currentStatus;
                eform[EForm.EformApptTime] = eformApptTime;
                eform[EForm.EformApptPhysician] = eformApptPhysician;
                // optional EForm Appt Fields
                SetEFormApptFields(eform, eformXml);
                // insert
                eform.Save();

                eformId = (int)eform[EForm.EFormId];

                // add log entry
                LogEForm(eformId, currentStatus);

                // newPrimKey = _da.InsertEFormsRecord(userId, patientId, eformName, eFormXmlString, currentStatus, _eformApptTime, _eformApptPhysician, userName);
            }
			else
			{
                throw new ClientException("Please contact your administrator to create this eform.", true);
			}
			
			return eformId;
		}

        /// <summary>
        /// Adds an EFormLog entry
        /// </summary>
        /// <param name="eformId"></param>
        /// <param name="currentStatus"></param>
        public void LogEForm(int eformId, string currentStatus)
        {
            string updatedBy = new SecurityController().GetUserName();
            _da.InsertEFormsLogRecord(eformId, currentStatus, updatedBy, DateTime.Now);
        }
	
        /// <summary>
        /// Returns if the current user can Edit EForms
        /// </summary>
        /// <returns></returns>
		public static bool CanEditEForm()  
		{
			return PermissionManager.HasPermission(PermissionManager.EFormEdit);
		}

        /// <summary>
        /// Returns if the current user can Approve EForms
        /// </summary>
        /// <returns></returns>
		public static bool CanApproveEForm()  
		{
            return PermissionManager.HasPermission(PermissionManager.EFormApprove);
		}

        /// <summary>
        /// Returns if the current user can Initiate EForms
        /// </summary>
        /// <returns></returns>
		public static bool CanInitiateEForm()  
		{
            return PermissionManager.HasPermission(PermissionManager.EFormInitiate);
		}

        /// <summary>
        /// Returns if more than one eform by name can be entered per patient per day
        /// </summary>
        /// <param name="eformName"></param>
        /// <returns></returns>
        public static bool CanAllowMultiple(string eformName)
        {
            EformConfig config = EformConfig.GetByName(eformName);
            return config != null ? config.AllowMultiple : false;
        }

        /// <summary>
        /// Returns if eform navigation is visible by default
        /// </summary>
        /// <param name="eformName"></param>
        /// <returns></returns>
        public static bool ShownNavigation(string eformName)
        {
            EformConfig config = EformConfig.GetByName(eformName);
            string showNav = config.GetConfigurationValue("showNav");
            if (!string.IsNullOrEmpty(showNav))
            {
                return bool.Parse(showNav);
            }
            // default
            else
            {
                return true;
            }
        }

        /// <summary>
        /// Returns the Export settings for an EForm
        /// </summary>
        /// <param name="eformName">The name of the EForm</param>
        /// <returns>Export Settings</returns>
        public static XmlServiceSettings GetEFormExportSettings(string eformName)
        {
            XmlServiceSettings settings = new XmlServiceSettings();
            EformConfig config = EformConfig.GetByName(eformName);
            if (config != null)
            {
                string enableDuplicateTables = config.GetConfigurationValue("allowDuplicateRecords");
                if (!string.IsNullOrEmpty(enableDuplicateTables))
                {
                    settings.EnableDuplicateRecords = enableDuplicateTables.Split(',');
                }
            }
            return settings;
        }

		/*protected virtual object _InsertRecord(DataSet args, SqlTransaction trans)  
		{
			base.AuthorizeInsert();
			DataRow dr = args.Tables[0].Rows[0];
			dr[BusinessObject.EnteredBy] = base.GetUserName();
			dr[BusinessObject.UpdatedBy] = base.GetUserName();//comment out if you want no update username stamped on insert
			return _da.InsertRecord(args, trans);
		}*/

        #region EFORM DEFAULT VALUES

        private static readonly string[] EformDefaultSelectors = new string[] { "DefaultSource", "DefaultValue", "DefaultValueSourceTable", "DefaultValueSourceField", "DefaultValueSourceRecordId", "RequireSiblings", "TriggeredBySiblings", "TriggeredByChildren" };

        /// <summary>
        /// Defines a type of Default EForm Value
        /// </summary>
        public enum EformDefaultType
        {
            /// <summary>
            /// Defines a simple default value, i.e., set value="My Value" when siblings have data
            /// </summary>
            Default,
            /// <summary>
            /// Defines a case when the value = target value
            /// </summary>
            SourceValue,
            /// <summary>
            /// Defines a case when a static value is set based on the target having a value
            /// </summary>
            SourceDefaultValue
        }
        
        public delegate void EformDefaultCallback(EformDefaultValueField eField, XmlNode target, IEnumerable<XmlNode> targetSiblings, IEnumerable<XmlNode> sources);

        /// <summary>
        /// Represents an EFromDefaultValue containing Table, Field and Record Id for source and target fields.
        /// </summary>
        public class EformDefaultValueField
        {
            private string sourceTable = "";
            private string sourceField = "";
            private string sourceRecordId = "";

            private string defaultValue = "";
            private string targetTable = "";
            private string targetField = "";
            private string targetRecordId = "";

            private bool requireSiblings = true;
            private bool triggeredBySiblings = false;
            private bool triggeredByChildren = true;

            /// <summary>
            /// Gets of sets the table name of the source field
            /// </summary>
            public string SourceTable
            {
                get
                {
                    return sourceTable;
                }
                set
                {
                    sourceTable = value;
                }
            }

            /// <summary>
            /// Gets or sets the field name of the source field
            /// </summary>
            public string SourceField
            {
                get
                {
                    return sourceField;
                }
                set
                {
                    sourceField = value;
                }
            }

            /// <summary>
            /// Gets of sets the source table record id
            /// </summary>
            public string SourceRecordId
            {
                get
                {
                    return sourceRecordId;
                }
                set
                {
                    sourceRecordId = value;
                }
            }

            /// <summary>
            /// Gets or sets the static default value
            /// </summary>
            public string DefaultValue
            {
                get
                {
                    return defaultValue;
                }
                set
                {
                    defaultValue = value;
                }
            }

            /// <summary>
            /// Gets or sets the table name of the target
            /// </summary>
            public string TargetTable
            {
                get
                {
                    return targetTable;
                }
                set
                {
                    targetTable = value;
                }
            }

            /// <summary>
            /// Gets ror sets the field name of the target
            /// </summary>
            public string TargetField
            {
                get
                {
                    return targetField;
                }
                set
                {
                    targetField = value;
                }
            }

            /// <summary>
            /// Gets or sets the record if of the target
            /// </summary>
            public string TargetRecordId
            {
                get
                {
                    return targetRecordId;
                }
                set
                {
                    targetRecordId = value;
                }
            }

            /// <summary>
            /// Gets or sets if the target table requires sibling data
            /// </summary>
            public bool RequireSiblings
            {
                get
                {
                    return requireSiblings;
                }
                set
                {
                    requireSiblings = value;
                }
            }

            /// <summary>
            /// Gets or sets whether the default logic is trigged by the target's siblings
            /// </summary>
            public bool TriggeredBySiblings
            {
                get
                {
                    return triggeredBySiblings;
                }
                set
                {
                    triggeredBySiblings = value;
                }
            }

            /// <summary>
            /// Gets or sets if the default value is triggered by child table values
            /// </summary>
            public bool TriggeredByChildren
            {
                get
                {
                    return triggeredByChildren;
                }
                set
                {
                    triggeredByChildren = value;
                }
            }

            /// <summary>
            /// Returns the type of default logic
            /// </summary>
            /// <returns></returns>
            public EformDefaultType GetDefaultType()
            {
                if (!string.IsNullOrEmpty(SourceTable))// && !string.IsNullOrEmpty(SourceRecordId))
                {
                    if (!string.IsNullOrEmpty(SourceField) && string.IsNullOrEmpty(DefaultValue))
                    {
                        return EformDefaultType.SourceValue;
                    }
                    else if (!string.IsNullOrEmpty(DefaultValue))
                    {
                        return EformDefaultType.SourceDefaultValue;
                    }
                }
                return EformDefaultType.Default;
            }

            /// <summary>
            /// For the given string in format "TableName.FieldName,RecordId", parse and set referenced strings
            /// </summary>
            /// <param name="defaultFieldAttribute"></param>
            /// <param name="table"></param>
            /// <param name="field"></param>
            /// <param name="recordId"></param>
            public static void ParseDefaultField(string defaultFieldAttribute, ref string table, ref string field, ref string recordId)
            {
                if (!string.IsNullOrEmpty(defaultFieldAttribute))
                {
                    // format: Table.FieldName,RecordId || Table.FieldName
                    string[] pairs = defaultFieldAttribute.Split(',');
                    if (pairs.Length > 0)
                    {
                        var tableField = pairs[0].Split('.');
                        // set table + field
                        if (tableField.Length == 2)
                        {
                            table = tableField[0];
                            field = tableField[1];
                            // optionally set record Id
                            if (pairs.Length > 1)
                            {
                                recordId = pairs[1];
                            }
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Returns a list of eform default value configurations for the current eform document
        /// </summary>
        /// <param name="xml"></param>
        /// <returns></returns>
        public static IEnumerable<EformDefaultValueField> GetEformDefaultValues(XmlDocument xml)
        {
            var efields = new List<EformDefaultValueField>();
            VisitEformDefaultValues(xml, (eField, target, targetSiblings, sources) => { efields.Add(eField); });
            return efields;
        }

        /// <summary>
        /// Sets the default values based on xml configuration
        /// </summary>
        /// <param name="xml"></param>
        /// <returns></returns>
        public static void TransformEformDefaultValues(XmlDocument xml)
        {
            // for each eform default field, set value based on siblings and targets
            VisitEformDefaultValues(xml, (eField, target, targetSiblings, sources) =>
            {
                var type = eField.GetDefaultType();
                string targetNodeValue = target.InnerText;
                // validate sibling data: if sigbling data required, checked for any non empty values
                bool siblingsHaveValue = targetSiblings.Where(s => !string.IsNullOrEmpty(s.InnerText)).Count() > 0;
                bool siblingDataValid = !eField.RequireSiblings || targetSiblings.Count() == 0 || siblingsHaveValue;
                if (siblingDataValid)
                {
                    // determin type
                    switch (type)
                    {
                        case EformDefaultType.Default:
                            if (siblingsHaveValue && string.IsNullOrEmpty(targetNodeValue))
                            {
                                target.InnerText = eField.DefaultValue;
                            }
                            else if (!siblingsHaveValue && !string.IsNullOrEmpty(targetNodeValue))
                            {
                                target.InnerText = string.Empty;
                            }
                            break;
                        case EformDefaultType.SourceValue:
                            if (sources.Count() > 0)
                            {
                                string sourceValue = sources.First().InnerText;
                                if (!string.IsNullOrEmpty(sourceValue) && string.IsNullOrEmpty(targetNodeValue))
                                {
                                    target.InnerText = sourceValue;
                                }
                            }
                            break;
                        case EformDefaultType.SourceDefaultValue:
                            bool sourcesHaveValue = sources.Where(s => !string.IsNullOrEmpty(s.InnerText)).Count() > 0;
                            if (sourcesHaveValue && string.IsNullOrEmpty(targetNodeValue))
                            {
                                target.InnerText = eField.DefaultValue;
                            }
                            break;
                        default:
                            break;
                    }
                }
            });
        }

        /// <summary>
        /// For the given Eform document, selected EformDefaultFields and invoke callback
        /// </summary>
        /// <param name="xml"></param>
        /// <param name="visitEformDefaultFields"></param>
        public static void VisitEformDefaultValues(XmlDocument xml, EformDefaultCallback visitEformDefaultFields)
        {
            // build dynamic select to check for any applicable attribute
            string xPath = "//*[@" + string.Join(" or @", EformDefaultSelectors) + "]";
            XmlNodeList nodes = xml.SelectNodes(xPath);
            foreach (XmlNode target in nodes)
            {
                // target properties
                string table = target.ParentNode.Name;
                string field = target.Name;
                string recordId = target.ParentNode.Attributes["RecordId"] != null ? target.ParentNode.Attributes["RecordId"].Value : "";
                var selectAttributes = EformDefaultSelectors.ToDictionary(aName => aName, aName => target.Attributes[aName] != null ? target.Attributes[aName].Value : "");

                // required target mappings
                string defaultTable = "";
                string defaultField = "";
                string defaultRecordId = "";

                // parse from DefaultValue
                string defaultFieldAttribute = selectAttributes["DefaultSource"];
                EformDefaultValueField.ParseDefaultField(defaultFieldAttribute, ref defaultTable, ref defaultField, ref defaultRecordId);
                // parse from individual mappings
                if (string.IsNullOrEmpty(defaultTable))
                {
                    defaultTable = selectAttributes["DefaultValueSourceTable"];
                    defaultField = selectAttributes["DefaultValueSourceField"];
                    defaultRecordId = selectAttributes["DefaultValueSourceRecordId"];
                }

                // validate: target required
                if (string.IsNullOrEmpty(table) || string.IsNullOrEmpty(field)) // || string.IsNullOrEmpty(recordId))
                {
                    continue;
                }

                // source properties
                string defaultValue = selectAttributes["DefaultValue"];
                string requireSiblings = selectAttributes["RequireSiblings"];
                string triggeredBySiblings = selectAttributes["TriggeredBySiblings"];
                string triggeredByChildren = selectAttributes["TriggeredByChildren"];

                // build new config
                EformDefaultValueField efield = new EformDefaultValueField();
                // set source fields
                efield.SourceTable = defaultTable;
                efield.SourceField = defaultField;
                efield.SourceRecordId = defaultRecordId;
                // set default value (optional)
                efield.DefaultValue = defaultValue;
                // set target fields
                efield.TargetTable = table;
                efield.TargetField = field;
                efield.TargetRecordId = recordId;
                // check sibling data
                if (!string.IsNullOrEmpty(requireSiblings))
                {
                    efield.RequireSiblings = bool.Parse(requireSiblings);
                }
                // trigger sibling
                if (!string.IsNullOrEmpty(triggeredBySiblings))
                {
                    efield.TriggeredBySiblings = bool.Parse(triggeredBySiblings);
                }
                if (!string.IsNullOrEmpty(triggeredByChildren))
                {
                    efield.TriggeredByChildren = bool.Parse(triggeredByChildren);
                }

                // set callback items
                IEnumerable<XmlNode> targetSiblings = SelectTarget(target).Except(new XmlNode[] { target });
                IEnumerable<XmlNode> sources = new XmlNode[0];
                // for complex mappings, locate "other" nodes (require table + field)
                if (!string.IsNullOrEmpty(defaultTable) && !string.IsNullOrEmpty(defaultField))
                {
                    // ???
                    //else
                    //{
                    //    exprFormat = string.Format("//{0}[@RecordId='{1}']", defaultTable, defaultRecordId);
                    //}

                    /* //Table[RecordId='RecordId']/Field OR //Table/Field */
                    string exprFormat = exprFormat = !string.IsNullOrEmpty(defaultRecordId) ? "//{0}[@RecordId='{2}']/{1}" : "//{0}/{1}";
                    string expr = string.Format(exprFormat, defaultTable, defaultField, defaultRecordId);
                    sources = xml.SelectNodes(expr).Cast<XmlNode>();
                }

                // invoke callback
                visitEformDefaultFields(efield, target, targetSiblings, sources);
            }
        }

        /// <summary>
        /// For the given node, get a list of parent's children (siblings + self)
        /// </summary>
        /// <param name="target"></param>
        /// <returns></returns>
        private static IEnumerable<XmlNode> SelectTarget(XmlNode target)
        {
            string tableName = target.ParentNode.Name;
            var children = target.ParentNode.ChildNodes.Cast<XmlNode>();
            return SelectTarget(tableName, children);
        }

        private static IEnumerable<XmlNode> SelectTarget(string tableName, IEnumerable<XmlNode> tableNodes)
        {
            var fieldNames = BusinessObject.GetFieldNames(tableName);
            var fieldNodes = from node in tableNodes
                             join field_name in fieldNames on node.Name equals field_name
                             select node;
            return fieldNodes;
        }

        #endregion

        #region EFORM APPT FIELDS

        /// <summary>
        /// For the given EForm, set Appt fields based on optional XML overrides
        /// </summary>
        /// <param name="eform"></param>
        /// <param name="eformXml"></param>
        public void SetEFormApptFields(EForm eform, XmlDocument eformXml)
        {
            Dictionary<string, object> eFormApptFields = GetEFormApptFields(eformXml);
            if (eFormApptFields.ContainsKey(EForm.EformApptTime))
            {
                eform[EForm.EformApptTime] = eFormApptFields[EForm.EformApptTime];
            }
            if (eFormApptFields.ContainsKey(EForm.EformApptPhysician))
            {
                eform[EForm.EformApptPhysician] = eFormApptFields[EForm.EformApptPhysician];
            }
        }

        /// <summary>
        /// For the given XML Document, get a list of EForm Appt field values
        /// </summary>
        /// <param name="eformXml"></param>
        /// <returns></returns>
        public Dictionary<string,  object> GetEFormApptFields(XmlDocument eformXml)
        {
            // get UseAsEFormValue field dictionary
            Dictionary<string, object> fieldValues = new Dictionary<string, object>();
            string xPath = string.Format("//*[@{0}]", USE_EFORM_VALUE_ATTRIBUTE);
            var useAsEformList = eformXml.SelectNodes(xPath).Cast<XmlNode>().ToDictionary(n => n.Attributes[USE_EFORM_VALUE_ATTRIBUTE].Value, n => n.InnerText);
            if (useAsEformList.Count > 0)
            {
                // set ApptTime
                if (useAsEformList.ContainsKey(EForm.EformApptTime))
                {
                    fieldValues.Add(EForm.EformApptTime, useAsEformList[EForm.EformApptTime]);
                }
                // set ApptPhysician
                if (useAsEformList.ContainsKey(EForm.EformApptPhysician))
                {
                    fieldValues.Add(EForm.EformApptPhysician, useAsEformList[EForm.EformApptPhysician]);
                }
            }
            return fieldValues;
        }

        #endregion

    }
}
