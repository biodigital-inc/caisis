using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ColorectalPath")]
    [ParentTablename("Pathology")]
    [Disease("Colorectal")]
    [Exportable]
    [NoLock]
    public class ColorectalPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathICD9_Code = "PathICD9_Code";

        [DataType(typeof(System.String))]
        public static readonly String PathICD0_Code = "PathICD0_Code";

        [DataType(typeof(System.String))]
        public static readonly String PathDiseaseExtent = "PathDiseaseExtent";

        [DataType(typeof(System.String))]
        public static readonly String PathPercResponse = "PathPercResponse";

    }
}
