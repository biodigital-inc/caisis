using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DentalImplantProc")]
    [ParentTablename("Procedures")]
    [Disease("All")]
    [Exportable]
    [NoLock]
    public class DentalImplantProc : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcIntraOralSite = "ProcIntraOralSite";

        [DataType(typeof(System.String))]
        public static readonly String ProcExtraoralAuricularSite = "ProcExtraoralAuricularSite";

        [DataType(typeof(System.String))]
        public static readonly String ProcExtraoralNasalSite = "ProcExtraoralNasalSite";

        [DataType(typeof(System.String))]
        public static readonly String ProcExtraoralOrbitalSite = "ProcExtraoralOrbitalSite";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumOfImplant = "ProcNumOfImplant";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantSite = "ProcImplantSite";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantBrand = "ProcImplantBrand";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantType = "ProcImplantType";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantDiameter = "ProcImplantDiameter";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantLength = "ProcImplantLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcBone = "ProcBone";

        [DataType(typeof(System.String))]
        public static readonly String ProcBoneDescription = "ProcBoneDescription";

        [DataType(typeof(System.String))]
        public static readonly String ProcBoneClassification = "ProcBoneClassification";

        [DataType(typeof(System.String))]
        public static readonly String ProcProsthesis = "ProcProsthesis";

        [DataType(typeof(System.String))]
        public static readonly String ProcIntraoralType = "ProcIntraoralType";

        [DataType(typeof(System.DateTime))]
        public static readonly String ProcProsthesisDeliveryDate = "ProcProsthesisDeliveryDate";
    }
}
