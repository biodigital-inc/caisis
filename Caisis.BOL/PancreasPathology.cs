using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PancreasPath")]
    [ParentTablename("Pathology")]
    [Disease("Pancreas")]
    [Exportable]
    [NoLock]
    public class PancreasPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathExtraParenchymalInv = "PathExtraParenchymalInv";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathDifferentiation = "PathDifferentiation";

        [DataType(typeof(System.String))]
        public static readonly String PathPerineuralInv = "PathPerineuralInv";

        [DataType(typeof(System.String))]
        public static readonly String PathPancreaticMargin = "PathPancreaticMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathAnteriorMargin = "PathAnteriorMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathPosteriorMargin = "PathPosteriorMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathDuodenalMargin = "PathDuodenalMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathGastricMargin = "PathGastricMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathBileDuctMargin = "PathBileDuctMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathAnteriorPeritonealInv = "PathAnteriorPeritonealInv";

        [DataType(typeof(System.String))]
        public static readonly String PathPancreatitis = "PathPancreatitis";

        [DataType(typeof(System.String))]
        public static readonly String PathFibrosis = "PathFibrosis";

        [DataType(typeof(System.String))]
        public static readonly String PathDuodenum = "PathDuodenum";

        [DataType(typeof(System.String))]
        public static readonly String PathStomach = "PathStomach";

        [DataType(typeof(System.String))]
        public static readonly String PathPanIn = "PathPanIn";

        [DataType(typeof(System.String))]
        public static readonly String PathIPMN = "PathIPMN"; // v5.0

        // not in MSK VERSION LEAVE COMMENTED!
        //[DataType(typeof(System.String))]
        //public static readonly String PathOtherOrganInv = "PathOtherOrganInv";

        [DataType(typeof(System.String))]
        public static readonly String PathLymphaticInv = "PathLymphaticInv";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String PathEpitheliumType = "PathEpitheliumType";

        [DataType(typeof(System.String))]
        public static readonly String PathDysplasia = "PathDysplasia";

        [DataType(typeof(System.String))]
        public static readonly String PathCarcinoma = "PathCarcinoma";

        [DataType(typeof(System.String))]
        public static readonly String PathCarcinomaType = "PathCarcinomaType";

        [DataType(typeof(System.String))]
        public static readonly String PathPercCarcinoma = "PathPercCarcinoma";
        
        [DataType(typeof(System.String))]
        public static readonly String PathCarcinomaMaxDim = "PathCarcinomaMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathNonneoplastic = "PathNonneoplastic";

        [DataType(typeof(System.String))]
        public static readonly String PathAddTissueMargin = "PathAddTissueMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathProximalMargin = "PathProximalMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathDistalMargin = "PathDistalMargin";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String PathFocality = "PathFocality";

        [DataType(typeof(System.String))]
        public static readonly String PathExtraParenchymalInv2 = "PathExtraParenchymalInv2";

        [DataType(typeof(System.String))]
        public static readonly String PathKi67 = "PathKi67";

        [DataType(typeof(System.String))]
        public static readonly String PathHPF = "PathHPF";

        [DataType(typeof(System.String))]
        public static readonly String PathWHO = "PathWHO";
    }
}
