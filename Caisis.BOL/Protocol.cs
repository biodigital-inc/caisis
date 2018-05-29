using System;
using System.Data;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Protocols")]
    [Disease("All")]
    [HasSiblings]
    public class Protocol : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolId = "ProtocolId";

        [DataType(typeof(System.Int32))]
        public static readonly String ProjectId = "ProjectId";

        [DataType(typeof(System.String))]
        public static readonly String ProtocolNum = "ProtocolNum";

        [DataType(typeof(System.String))]
        public static readonly String ProtocolTitle = "ProtocolTitle";

        [DataType(typeof(System.String))]
        public static readonly String ProtocolAlias = "ProtocolAlias";

        [DataType(typeof(System.String))]
        public static readonly String ProtocolPI = "ProtocolPI";

        [DataType(typeof(System.String))]
        public static readonly String ProtocolDept = "ProtocolDept";

        [DataType(typeof(System.String))]
        public static readonly String ProtocolNotes = "ProtocolNotes";

		//public override void Delete(int primaryKey)
		//{
		//    DeleteWithVerification(new ProtocolDa().ValidateProtocolDeletion, primaryKey, "protocol",
		//        delegate (DataTable dt, string singularName)
		//        {
		//            int count = (int) dt.Rows[0]["TableCount"];

		//            if (count > 1)
		//            {
		//                return String.Format("You are unable to delete this protocol because there are currently {0} patients associated with it.\nPlease contact the system admin for help deleting this protocol.", count);
		//            }
		//            else
		//            {
		//                return "You are unable to delete this protocol because there is a patient currently associated with it.\nPlease contact the system admin for help deleting this protocol.";
		//            }
		//        });
		//}
    }
}
