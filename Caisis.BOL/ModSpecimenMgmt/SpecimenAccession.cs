using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

using Caisis.DataAccess;

namespace Caisis.BOL
{
  
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [Tablename("SpecimenAccessions")]
    public class SpecimenAccession : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SpecimenAccessionId = "SpecimenAccessionId";

        [DataType(typeof(System.String))]
        public static readonly String PathologyReferenceNumber = "PathologyReferenceNumber";

        [NotNull]
        [ForeignKey]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.String))]
        public static readonly String HoldingCondition = "HoldingCondition";

        [DataType(typeof(System.String))]
        public static readonly String CollectInstitution = "AccessionInstitution";

        [DataType(typeof(System.String))]
        public static readonly String CollectDepartment = "AccessionDepartment";

        [DataType(typeof(System.String))]
        public static readonly String CollectDateText = "AccessionDateText";

        [DataType(typeof(System.DateTime))]
        public static readonly String CollectDate = "AccessionDate";

        [DataType(typeof(System.String))]
        public static readonly String CollectTime = "AccessionTime";

        [DataType(typeof(System.String))]
        public static readonly String CollectProcName = "AccessionProcName";

        [DataType(typeof(System.String))]
        public static readonly String TimeReceivedInLab = "TimeReceivedInLab";

        [DataType(typeof(System.String))]
        public static readonly String PathologyLab = "PathologyLab";

        [DataType(typeof(System.String))]
        public static readonly String TimeFrozen = "TimeFrozen";

        [DataType(typeof(System.DateTime))]
        public static readonly String DateBanked = "DateBanked";

        [DataType(typeof(System.String))]
        public static readonly String NTubesEDTA = "NumberTubesEDTA";

        [DataType(typeof(System.String))]
        public static readonly String NTubesClotted = "NumberTubesClotted";

        [DataType(typeof(System.String))]
        public static readonly String NTubesGel = "NumberTubesGel";

        [DataType(typeof(System.String))]
        public static readonly String NTubesOther = "NumberTubesOther";

        [DataType(typeof(System.String))]
        public static readonly String NTubesOtherType = "NumberTubesOtherType";

        [DataType(typeof(System.String))]
        public static readonly String CollectNotes = "AccessionNotes";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String AccessionAnatomicSite = "AccessionAnatomicSite";

        [DataType(typeof(System.String))]
        public static readonly String AccessionVisitType = "AccessionVisitType";

        [DataType(typeof(System.String))]
        public static readonly String AccessionProcInstrument = "AccessionProcInstrument";

        [DataType(typeof(System.String))]
        public static readonly String AccessionProcInstrumentType = "AccessionProcInstrumentType";

		/// <summary>
		/// Accessions with specimens can not be deleted unless the specimens are deleted first. 
		/// Unique case because specimens may have events or child specimens associated with them.
		/// </summary>
		/// <param name="primaryKey"></param>
		public override void Delete(int primaryKey)
		{
			IEnumerable<Specimen> specimens = BusinessObject.GetByParent<Specimen>(primaryKey);

			int count = specimens.Count();

			if (count > 0)
			{
				ChildDataPreventsDeleteException.MessageBuilderDelegate m =
					delegate(DataTable t, string s)
					{
						return s;
					};

				string message = "The Accession can not be deleted because it has " + count + " Specimen(s) derived from it.\n \n If you would like to delete the Accession please delete each Specimen first.";
				throw new ChildDataPreventsDeleteException(new DataTable(), message, m);
			}
			else
			{
				base.Delete(primaryKey);
			}
		}
    }
}
