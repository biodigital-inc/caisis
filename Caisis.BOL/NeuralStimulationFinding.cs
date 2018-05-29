using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("NeuralStimulationProcFinding")]
    [ParentTablename("Procedures")]
    [Disease("Prostate")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class NeuralStimulationFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String NeuralStimulationProcFindingId = "NeuralStimulationProcFindingId";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindSide = "ProcFindSide";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindSite = "ProcFindSite";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindLevel = "ProcFindLevel";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindOrder = "ProcFindOrder";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindIntensity = "ProcFindIntensity";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindmA = "ProcFindmA";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindMovement = "ProcFindMovement";

    }
}
