using System;

namespace Caisis.BOL
{
    [Tablename("Project")]
    [NoLock]
    public class Project : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectId = "ProjectId";

        [DataType(typeof(System.Int32))]
        public static readonly String ParentProjectId = "ParentProjectId";

        [DataType(typeof(System.String))]
        public static readonly String Title = "Title";

        [DataType(typeof(System.String))]
        public static readonly String ShortName = "ShortName";

        [DataType(typeof(System.String))]
        public static readonly String ProjectNum = "ProjectNum";

        [DataType(typeof(System.String))]
        public static readonly String Description = "Description";

        [DataType(typeof(System.String))]
        public static readonly String Type = "Type";

        [DataType(typeof(System.String))]
        public static readonly String Status = "Status";

        [DataType(typeof(System.String))]
        public static readonly String Priority = "Priority";

        [DataType(typeof(System.String))]
        public static readonly String Phase = "Phase";

        [DataType(typeof(System.String))]
        public static readonly String Risk = "Risk";

        [DataType(typeof(System.String))]
        public static readonly String AgentName = "AgentName";

        [DataType(typeof(System.String))]
        public static readonly String ClassOfDrug = "ClassOfDrug";
    
        [DataType(typeof(System.String))]
        public static readonly String AdditionalFormNames = "AdditionalFormNames";

        [DataType(typeof(System.String))]
        public static readonly String FileFolder = "FileFolder";
    
        [DataType(typeof(System.String))]
        public static readonly String ProtocolPhase = "ProtocolPhase";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";

    }
}
