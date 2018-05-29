using System;

namespace Caisis.BOL
{
    [Tablename("PatientEdPacket")]
    [NoBaseColumns]

    public class PatientEdPacket : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PacketId = "PacketId";

        [DataType(typeof(System.String))]
        public static readonly String PacketName = "PacketName";
    }
}