using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Caisis.BOL
{
    [Tablename("PCCTCFiles")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class PCCTCFiles : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PCCTCFileID = "PCCTCFileID";

        [DataType(typeof(System.String))]
        public static readonly String PCCTCFileName = "PCCTCFileName";

        [DataType(typeof(System.String))]
        public static readonly String PCCTCFileData = "PCCTCFileData";
    }
}