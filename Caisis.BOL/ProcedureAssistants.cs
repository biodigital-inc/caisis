using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProcedureAssistants")]
    [ParentTablename("Procedures")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class ProcedureAssistant : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureAssistantId = "ProcedureAssistantId";

        [DataType(typeof(System.String))]
        public static readonly String ProcAssistant = "ProcAssistant";

        [DataType(typeof(System.String))]
        public static readonly String ProcAssistantType = "ProcAssistantType";

        [DataType(typeof(System.String))]
        public static readonly String ProcAccreditation = "ProcAccreditation";   
    }
}
