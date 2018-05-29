using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("HelpSections")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class HelpSection : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String HelpSectionId = "HelpSectionId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String HelpSectionName = "HelpSectionName";

        [DataType(typeof(System.String))]
        public static readonly String HelpSectionDescription = "HelpSectionDescription";

        [DataType(typeof(System.String))]
        public static readonly String HelpSectionImage = "HelpSectionImage";

    }
}
