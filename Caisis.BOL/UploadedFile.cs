using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Files")]
    [Disease("All")]
    [HasSiblings]
    public class UploadedFile : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String FileId = "FileId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String TableName = "TableName";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String TablePrimaryKey = "TablePrimaryKey";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String OriginalFileName = "OriginalFileName";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String FileExtension = "FileExtension";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String FileType = "FileType";

        [DataType(typeof(System.String))]
        public static readonly String FileLabel = "FileLabel";

        [NotNull]
        [DataType(typeof(System.Byte))]
        public static readonly String OnFileServer = "OnFileServer";

        [DataType(typeof(System.String))]
        public static readonly String FilePath = "FilePath";

    }
}
