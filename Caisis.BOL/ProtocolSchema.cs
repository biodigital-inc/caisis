using System;

namespace Caisis.BOL
{
    [Tablename("ProtocolMgr_ProtocolSchemas")]
    [ParentTablename("ProtocolMgr_ProtocolVersions")]
    [HasSiblings]
	[NoLock]
    public class ProtocolSchema : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolSchemaId = "ProtocolSchemaId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolVersionId = "ProtocolVersionId";

        [DataType(typeof(System.Byte))]
        public static readonly String ProtocolArmActive = "ProtocolArmActive";

        [DataType(typeof(System.String))]
        public static readonly String ProtocolArmNumber = "ProtocolArmNumber";

        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolArmMaxAccrual = "ProtocolArmMaxAccrual";

        [DataType(typeof(System.String))]
        public static readonly String ProtocolArmDescription = "ProtocolArmDescription";

    }
}
