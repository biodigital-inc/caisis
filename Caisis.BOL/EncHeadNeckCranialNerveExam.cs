using System;
using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("EncHeadNeckCranialNerveExam")]
    [ParentTablename("Encounters")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class EncHeadNeckCranialNerveExam : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncounterId = "EncounterId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncHeadNeckCranialNerveExamId = "EncHeadNeckCranialNerveExamId";

        [DataType(typeof(System.String))]
        public static readonly String EncSide = "EncSide";

        [DataType(typeof(System.String))]
        public static readonly String EncCranialNerveII = "EncCranialNerveII";

        [DataType(typeof(System.String))]
        public static readonly String EncCranialNerveIII_IV_VI = "EncCranialNerveIII_IV_VI";

        [DataType(typeof(System.String))]
        public static readonly String EncSupraorbitalV1 = "EncSupraorbitalV1";

        [DataType(typeof(System.String))]
        public static readonly String EncSupratrochlearV1 = "EncSupratrochlearV1";

        [DataType(typeof(System.String))]
        public static readonly String EncInfraorbitalV2 = "EncInfraorbitalV2";

        [DataType(typeof(System.String))]
        public static readonly String EnclingualV3 = "EnclingualV3";

        [DataType(typeof(System.String))]
        public static readonly String EncMentalV3 = "EncMentalV3";

        [DataType(typeof(System.String))]
        public static readonly String EncInfAlveolarV3 = "EncInfAlveolarV3";

        [DataType(typeof(System.String))]
        public static readonly String EncMasseterAtrophyV3 = "EncMasseterAtrophyV3";

        [DataType(typeof(System.String))]
        public static readonly String EncTemporalVII = "EncTemporalVII";

        [DataType(typeof(System.String))]
        public static readonly String EncZygomaticVII = "EncZygomaticVII";

        [DataType(typeof(System.String))]
        public static readonly String EncBuccalVII = "EncBuccalVII";

        [DataType(typeof(System.String))]
        public static readonly String EncMarginalVII = "EncMarginalVII";

        [DataType(typeof(System.String))]
        public static readonly String EncHouseBrackmannScore = "EncHouseBrackmannScore";

        [DataType(typeof(System.String))]
        public static readonly String EncVagusX = "EncVagusX";

        [DataType(typeof(System.String))]
        public static readonly String EncVocalCord = "EncVocalCord";

        [DataType(typeof(System.String))]
        public static readonly String EncAccessoryXI = "EncAccessoryXI";

        [DataType(typeof(System.String))]
        public static readonly String EncHypoglossalXII = "EncHypoglossalXII";

        [DataType(typeof(System.String))]
        public static readonly String EncOtherNamedNerve = "EncOtherNamedNerve";

        [DataType(typeof(System.String))]
        public static readonly String EncOtherNamedNerveResult = "EncOtherNamedNerveResult";

    }
}