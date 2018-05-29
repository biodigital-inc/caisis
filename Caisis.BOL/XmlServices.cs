using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;

using Caisis.DataAccess;
using System.Web;

namespace Caisis.BOL
{
    public class XmlServices
    {
		static Dictionary<string, Dictionary<string, string>> excludedFields = new Dictionary<string, Dictionary<string, string>>();   

        public static List<IBusinessObject> ReadXml(string xml, out string notes, out string notesTable, out string notesField)
        {
            List<IBusinessObject> list = new List<IBusinessObject>();
            StringBuilder notesBuffer = new StringBuilder();

            XmlReader reader = XmlNodeReader.Create(new StringReader(xml));

            string currentElementName = null;
            IBusinessObject currentBO = null;
            bool currentBOHasData = false;
            bool recordNotes = false;

            // we have to handle Status, PathTest, QOL_Therapy as special cases, since they have fieldnames = tablenames
            bool insideSpecialTable = false; 

            notesTable = null;
            notesField = null;

			Truncator truncator = null;

            while (reader.Read())
            {
                // state machine: every tag hit either forks or saves
                switch (reader.NodeType)
                {
                    case XmlNodeType.EndElement:
                        if (insideSpecialTable && reader.Name == currentBO.TableName)
                        {
                            insideSpecialTable = false;
                        }
                        break;
                    case XmlNodeType.Element:
                        currentElementName = reader.Name;
                        //if ((!insideSpecialTable && BOFactory.CanBuild(currentElementName)) || currentElementName == "NoTable")
						if ((!insideSpecialTable && BusinessObjectFactory.CanBuildBusinessObject(currentElementName)) || currentElementName == "NoTable")
                        {
                            if (currentBOHasData)
                            {
                                list.Add(currentBO);

								if (truncator != null)
									truncator.Finish();
                            }

                            if (currentElementName == "NoTable")
                            {
                                notesTable = reader.GetAttribute("PutDataInTable");
                                notesField = reader.GetAttribute("PutDataInField");
                                currentBO = null;
                                recordNotes = true;
                            }
                            else
                            {
                                //currentBO = BOFactory.GetBO(currentElementName);
								currentBO = BusinessObjectFactory.BuildBusinessObject(currentElementName);
                                recordNotes = false;
                                //if (currentBO.HasColumn(currentBO.Tablename))
								if (currentBO.HasField(currentBO.TableName))
                                {
                                    insideSpecialTable = true;
                                }

								truncator = new Truncator(currentBO);
                            }

                            currentBOHasData = false;
                        }
                        break;
                    case XmlNodeType.Text:
                        if (reader.Value != null && reader.Value != "")
                        {
                            // if (recordNotes) // OR !currentBO.HasField(currentElementName)
							if (recordNotes || !currentBO.HasField(currentElementName))
                            {
                                notesBuffer.Append(" | ");
                                notesBuffer.Append(currentElementName);
                                notesBuffer.Append(" :: ");
                                notesBuffer.Append(reader.Value);
                            }
                            else
                            {
                                currentBO[currentElementName] = truncator.HandleValue(currentElementName, reader.Value);
                                currentBOHasData = true;
                            }
                        }
                        break;
                }
            }

            // finishing up
            if (currentBOHasData)
            {
                list.Add(currentBO);

				if (truncator != null)
					truncator.Finish();
            }

            reader.Close();

            if (notesBuffer.Length > 0)
            {
                notes = "OTHER EFORM DATA: " + notesBuffer.ToString();
            }
            else
            {
                notes = null;
            }

            return list;
        }

        /// <summary>
        /// Migrates an eform, saving each record.
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="xml"></param>
        /// <param name="migrationErrorLog"></param>
        /// <param name="settings"></param>
        /// <returns>True on success, false if there were migration errors, in which case the migrationErrorLog will be non-null.</returns>
        public static bool MigrateEformXml(int patientId, string xml, out string migrationErrorLog, XmlServiceSettings settings)
        {
            int? encounterid = null; // will read it after saving encounter and propagate it to dependant objects
            int? opdetailid = null;
			int? currentProcedureId = null; // used to handle pathology records; we can have multiple procedures
            DateTime? opdate = null;
            string opdatetext = null;
            string notes;
            string notesTable;
            string notesField;

			bool migrationErrors = false;
			migrationErrorLog = null;
			StringBuilder migrationErrorLogBuffer = new StringBuilder();

            List<IBusinessObject> ancestors = new List<IBusinessObject>();

            foreach (IBusinessObject bizo in ReadXml(xml, out notes, out notesTable, out notesField))
            {
				try
				{
					bool childErrors = false;

					if (bizo.HasField(Patient.PatientId))
					{
						bizo[Patient.PatientId] = patientId;
					}

					// allow more than one Encounter
					if (!(bizo is Encounter) && bizo.HasField(Encounter.EncounterId) && encounterid != null)
					{
						bizo[Encounter.EncounterId] = encounterid;
					}

					if (bizo is Procedure && opdetailid != null)
					{
						bizo[Procedure.OperatingRoomDetailId] = opdetailid;

						if (opdate != null && IsEmpty(bizo[Procedure.ProcDate]))
						{
							bizo[Procedure.ProcDate] = opdate.Value;
						}

						if (opdatetext != null && opdatetext != "" && IsEmpty(bizo[Procedure.ProcDateText]))
						{
							bizo[Procedure.ProcDateText] = opdatetext;
						}
					}

                    if (!(bizo is Procedure)
                        && bizo.HasField(Procedure.ProcedureId)
                        && currentProcedureId.HasValue
                        // only set if not already populated
                        && bizo.IsNull(Procedure.ProcedureId))
                    {
                        bizo[Procedure.ProcedureId] = currentProcedureId;
                    }

					if (!(bizo is Procedure || bizo is OperatingRoomDetail || bizo is MedicalTherapy) &&
						bizo.HasField(OperatingRoomDetail.OperatingRoomDetailId) &&
						opdetailid.HasValue)
					{
						bizo[OperatingRoomDetail.OperatingRoomDetailId] = opdetailid;
					}

					if (bizo.TableName == notesTable)
					{
						//if (notesField != null && bizo.HasColumn(notesField) && notes != null)
						if (notesField != null && bizo.HasField(notesField) && notes != null)
						{
							bizo[notesField] += notes;
						}
                    }

                    //if (BOFactory.HasParentTable(bizo.Tablename) && bizo.ParentTablename != "Patients" && ancestors.Count > 0)
                    if (BusinessObject.HasParentTable(bizo.TableName) && bizo.ParentTableName != "Patients" && ancestors.Count > 0)
                    {
                        // parent key set: do nothing
                        if (!bizo.IsNull(bizo.ParentKeyName))
                        {
                            // do nothhing
                        }
                        else
                        {
                            int? parentKey = GetParentKey(ancestors, bizo);
                            if (parentKey.HasValue)
                            {
                                bizo[bizo.ParentKeyName] = parentKey.Value;
                            }
                            else
                            {
                                // migration error
                                migrationErrors = true;
                                childErrors = true;
                                migrationErrorLogBuffer.AppendFormat("Did not attempt to insert {0} record because of a problem with the parent record.", bizo.TableName);
                                migrationErrorLogBuffer.AppendLine();
                            }
                        }
                    }

					//BizObject _b = bizo as BizObject;
					BusinessObject _b = bizo as BusinessObject;

					if (_b != null)
					{
						//foreach (DataColumn c in _b.table.Columns)
						//{
						//    if (c.ColumnName.EndsWith("DataSource"))
						//    {
						//        bizo[c.ColumnName] = "EForm";
						//    }
						//}

						foreach (string fieldname in _b.FieldNames)
						{
							if (fieldname.EndsWith("DataSource"))
								bizo[fieldname] = "EForm";
						}

						_b.InsideEForm = true;
					}

					// Don't allow errors to stop the migration process. Append errors to the log and send to the admin.

					try
					{
						if (!childErrors)
						{
							// bizo.Save();
							Save(bizo, settings);
						}
					}
					catch (Exception e)
					{
						migrationErrors = true;

						migrationErrorLogBuffer.AppendFormat("Error inserting into {0} table.", bizo.TableName);
						migrationErrorLogBuffer.AppendLine();
						migrationErrorLogBuffer.AppendLine("Attempted to insert the following fields:");
						DumpRecord(migrationErrorLogBuffer, _b);
						migrationErrorLogBuffer.AppendLine();
						migrationErrorLogBuffer.AppendLine("Error detail follows:");
						migrationErrorLogBuffer.AppendLine(e.Message);
						migrationErrorLogBuffer.AppendLine(e.StackTrace);
					}

					if (bizo is Encounter)
					{
						object oEncounterId = bizo[Encounter.EncounterId];
						if (oEncounterId != null && oEncounterId != DBNull.Value)
						{
							encounterid = (int) oEncounterId;
						}
						else
						{
							migrationErrorLogBuffer.AppendLine("Could not insert the encounter. See above for details.");
						}
					}

					if (bizo is OperatingRoomDetail)
					{
						object oOpDetailId = bizo[OperatingRoomDetail.OperatingRoomDetailId];

						if (oOpDetailId != null && oOpDetailId != DBNull.Value)
						{
							opdetailid = (int) oOpDetailId;

							object oDate = bizo[OperatingRoomDetail.OpDate];
							object oDateText = bizo[OperatingRoomDetail.OpDateText];

							if (oDate != null && oDate != DBNull.Value)
							{
								opdate = (DateTime) oDate;
							}

							if (oDateText != null)
							{
								opdatetext = oDateText.ToString();
							}
						}
						else
						{
							migrationErrorLogBuffer.AppendLine("Could not insert the operating room detail. See above for details.");
						}
					}

					if (bizo is Procedure)
					{
						object oCurrentProcedureId = bizo[Procedure.ProcedureId];

						if (oCurrentProcedureId != null && oCurrentProcedureId != DBNull.Value)
						{
							currentProcedureId = (int) oCurrentProcedureId;
						}
						else
						{
							migrationErrorLogBuffer.AppendLine("Could not insert the procedure. See above for details.");
						}
					}

					Percolate(ancestors, bizo);
				}
				catch (Exception outerE)
				{
					migrationErrors = true;

					migrationErrorLogBuffer.AppendFormat("General error caught while migrating data for {0} table.", bizo.TableName);
					migrationErrorLogBuffer.AppendLine();
					migrationErrorLogBuffer.AppendLine("Error message follows:");
					migrationErrorLogBuffer.AppendLine(outerE.Message);
					migrationErrorLogBuffer.AppendLine(outerE.StackTrace);
				}
            }

			if (migrationErrors)
			{
				migrationErrorLogBuffer.AppendLine("see appended xml:");
				migrationErrorLogBuffer.AppendLine(xml);
				migrationErrorLog = migrationErrorLogBuffer.ToString();
				return false;
			}
			else
			{
				return true;
			}
        }

		private static void Save(IBusinessObject b, XmlServiceSettings settings)
		{
            if ((b is Procedure || b is OperatingRoomDetail) && !settings.EnableDuplicateRecords.Contains(b.TableName))
            {
                Dictionary<string, object> searchCriteria;

				if (b is Procedure)
				{
					searchCriteria =
						new Dictionary<string, object>()
						{
							{ Procedure.PatientId, b[Procedure.PatientId] },
							{ Procedure.ProcSurgeon, b[Procedure.ProcSurgeon] },
							{ Procedure.ProcName, b[Procedure.ProcName] },
							{ Procedure.ProcDate, b[Procedure.ProcDate] },
							{ Procedure.ProcCPT_Code, b[Procedure.ProcCPT_Code] }
						};
				}
				else
				{
					searchCriteria =
						new Dictionary<string, object>()
						{
							{ OperatingRoomDetail.PatientId, b[OperatingRoomDetail.PatientId] },
							{ OperatingRoomDetail.OpDate, b[OperatingRoomDetail.OpDate] }
						};
				}

				IEnumerable<IBusinessObject> existing = BusinessObject.GetByFields(b.TableName, searchCriteria);

				if (existing.Count() == 1) // if there's more than one, just insert
				{
					IBusinessObject ex = existing.First();

					foreach (string f in ex.FieldNames)
					{
						if (ExcludeField(b, f) || IsEmpty(b[f]))
							b[f] = ex[f];
					}
				}
			}
				
			b.Save();
		}

		#region record-merging support
		
		private static bool IsEmpty(object value)
		{
			return value == null || value == DBNull.Value || value.ToString() == "";
		}

		// awkward mix of general and specific, will become more general in future versions (as merge/migration itself becomes more general)
		private static bool ExcludeField(IBusinessObject bizo, string fieldname)
		{
			string tablename = bizo.TableName;

			if (!excludedFields.ContainsKey(tablename))
			{
				InitializeExcludeFields(bizo);
			}

			return excludedFields[tablename].ContainsKey(fieldname);
		}

		private static void InitializeExcludeFields(IBusinessObject bizo)
		{
			Dictionary<string, string> entry = new Dictionary<string, string>();

			// fields common to all tables
			entry[bizo.PrimaryKeyName] = null;
			entry[bizo.ParentKeyName] = null;
			entry[BusinessObject.EnteredBy] = null;
			entry[BusinessObject.EnteredTime] = null;
			entry[BusinessObject.UpdatedBy] = null;
			entry[BusinessObject.UpdatedTime] = null;
			entry[BusinessObject.LockedBy] = null;
			entry[BusinessObject.LockedTime] = null;

			// we should put this into xml or some data store if we ever deal with more than Procedures
			if (bizo is Procedure)
			{
				entry[Procedure.ProcCPT_Code] = null;
				entry[Procedure.ProcCPT_Description] = null;
				entry[Procedure.ProcCPT_Modifier] = null;
			}

			// add the entry for this table ...
			excludedFields[bizo.TableName] = entry;
		}

		#endregion

		private static void Percolate(List<IBusinessObject> list, IBusinessObject b)
        {
            if (list.Count == 0)
            {
                list.Add(b);
            }
            else
            {
                // if one of my siblings (i.e. we have the same parent) is in the stack, pop my sibling and his kids from the stack
                for (int i = list.Count - 1; i >= 0; i--)
                {
                    if (list[i].TableName == b.TableName || list[i].ParentTableName == b.ParentTableName)
                    {
                        list.RemoveRange(i, list.Count - i);
                        break;
                    }
                }

                // if my parent is at the top of the stack or the stack is empty, push me onto the stack
                if (list.Count == 0 || list[list.Count - 1].TableName == b.ParentTableName)
                {
                    list.Add(b);
                }
            }
        }

        private static int? GetParentKey(List<IBusinessObject> list, IBusinessObject b)
        {
            for (int i = list.Count - 1; i >= 0; i--)
            {
                IBusinessObject ib = list[i];
                if (ib.TableName == b.ParentTableName && ib.HasField(b.ParentKeyName))
                {
                    if (!ib.IsNull(b.ParentKeyName))
                        return (int)ib[b.ParentKeyName];
                    else
                        return null;
                }
            }
            return null;
        }

		private static void DumpRecord(StringBuilder b, BusinessObject bizo)
		{
			//foreach (DataColumn col in bizo.table.Columns)
			foreach (string fieldname in bizo.FieldNames)
			{
				//string fieldname = col.ColumnName;
				object val = bizo[fieldname];

				if (val != null && val != DBNull.Value)
				{
					b.Append(fieldname);
					b.Append(": ");
					b.AppendLine(val.ToString());
				}
			}
		}

		private class Truncator
		{
			IBusinessObject bo;
			string tablename;

			List<KeyValuePair<string, string>> log = 
				new List<KeyValuePair<string, string>>();

			internal Truncator(IBusinessObject bo)
			{
				this.bo = bo;
				this.tablename = bo.TableName;
			}

			internal string HandleValue(string fieldname, string value)
			{
				int? maxlen = BusinessObject.GetFieldMaxLength(tablename, fieldname);

				// ints, bools, etc. don't have a maxlen, so just return the value
				if (!maxlen.HasValue)
					return value;

				// trunate and log the field/value pair if necessary
				if (value.Length > maxlen)
				{
					Log(fieldname, value);
					return value.Substring(0, maxlen.Value); 
				}
				else
				{
					return value;
				}
			}

			internal string GetTruncatedFields()
			{
				if (log.Count == 0)
					return string.Empty;

				StringBuilder b = new StringBuilder(" | TRUNCATED");

				foreach (var kvp in log)
				{
					b.Append(" | ")
					 .Append(kvp.Key)
					 .Append(" : ")
					 .Append(kvp.Value);
				}

				return b.ToString();
			}

			// if the bo has a usable notes field, and the truncated field string
			// will fit, add the truncated field string to the notes
			internal void Finish()
			{
				// find the notes field
				string notesField = GetNotesField(bo);
				string truncationNotes = GetTruncatedFields();

				// if the field has enough room, append
				if (notesField != null)
				{
					string existingNotes = (bo[notesField] as string) ?? string.Empty;
					
					if (existingNotes.Length + truncationNotes.Length <= bo.GetFieldMaxLength(notesField))
					{
						bo[notesField] = existingNotes + truncationNotes;
					}
				}
			}

			private string GetNotesField(IBusinessObject b)
			{
				var query =
					from f in b.FieldNames
					let len = f.Length
					let size = b.GetFieldMaxLength(f) ?? 0
					where f.EndsWith("Notes")
					orderby size descending, f.Length ascending
					select f;

				return query.FirstOrDefault();
			}

			private void Log(string fieldname, string value)
			{
				log.Add(new KeyValuePair<string, string>(fieldname, value));
			}
		}
    }

    public class XmlServiceSettings
    {
        private string[] enableDuplicateRecords = new string[0];

        public string[] EnableDuplicateRecords
        {
            get
            {
                return enableDuplicateRecords;
            }
            set
            {
                enableDuplicateRecords = value;
            }
        }

        public XmlServiceSettings()
        {
        }
    }
}
