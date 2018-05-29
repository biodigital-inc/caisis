using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DxPulmonaryTest")] // v5.0
    [ParentTablename("Diagnostics")]
    [Disease("Thoracic")]
    [Exportable]
    [NoLock]
    public class PulmonaryTest: BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiagnosticId = "DiagnosticId";

        [DataType(typeof(System.String))]
        public static readonly String DxFev1L = "DxFev1L";

        [DataType(typeof(System.String))]
        public static readonly String  DxPercFev1 = "DxPercFev1";

        [DataType(typeof(System.String))]
        public static readonly String  DxPercDLCO = "DxPercDLCO";

        [DataType(typeof(System.String))]
        public static readonly String  DxPercRA_Sat = "DxPercRA_Sat";

        [DataType(typeof(System.String))]
        public static readonly String  DxPercVentilated = "DxPercVentilated";

        [DataType(typeof(System.String))]
        public static readonly String DxPercQ_Perfusion = "DxPercQ_Perfusion";

    }
}
