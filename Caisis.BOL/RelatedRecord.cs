using System;
using System.Data;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("RelatedRecords")]
    [Disease("All")]
    [NoLock]
    public class RelatedRecord : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String RelatedRecordId = "RelatedRecordId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String DestTableName = "DestTableName";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String DestPrimaryKey = "DestPrimaryKey";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String SrcTableName = "SrcTableName";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String SrcPrimaryKey = "SrcPrimaryKey";

        [DataType(typeof(System.String))]
        public static readonly String SrcPrimaryKeyText = "SrcPrimaryKeyText";

        [DataType(typeof(System.Int32))]
        public static readonly String SrcSecPrimaryKey = "SrcSecPrimaryKey";

        [DataType(typeof(System.String))]
        public static readonly String SrcSecPrimaryKeyText = "SrcSecPrimaryKeyText";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String SrcSystem = "SrcSystem";

        [DataType(typeof(System.Int32))]
        public static readonly String RelationStrength = "RelationStrength";
    }
}