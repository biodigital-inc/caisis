using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("EncReviewOfSystems")]
    [ParentTablename("Encounters")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class EncReviewOfSystem : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncounterId = "EncounterId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncReviewOfSystemId = "EncReviewOfSystemId";

        [DataType(typeof(System.String))]
        public static readonly String ROS_System = "ROS_System";

        [DataType(typeof(System.String))]
        public static readonly String ROS_Symptom = "ROS_Symptom";

        [DataType(typeof(System.String))]
        public static readonly String ROS_Result = "ROS_Result";

        [DataType(typeof(System.String))]
        public static readonly String ROS_RelatedTo = "ROS_RelatedTo";

        [DataType(typeof(System.String))]
        public static readonly String ROS_Presenting = "ROS_Presenting";

        [DataType(typeof(System.String))]
        public static readonly String ROS_Notes = "ROS_Notes";

    }
}
