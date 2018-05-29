using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Seeds")]
    [Disease("Prostate")]
    [HasSiblings]
    [NoLock]
    public class Seed : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SeedId = "SeedId";

        [DataType(typeof(System.Int32))]
        public static readonly String SeedShipmentNum = "SeedShipmentNum";

        [DataType(typeof(System.Int32))]
        public static readonly String SeedPackageNum = "SeedPackageNum";

        [DataType(typeof(System.Int32))]
        public static readonly String SeedVialNum = "SeedVialNum";

        [DataType(typeof(System.String))]
        public static readonly String SeedCertificationNum = "SeedCertificationNum";

        [DataType(typeof(System.String))]
        public static readonly String SeedLotNum = "SeedLotNum";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String SeedDeliveryDateText = "SeedDeliveryDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String SeedDeliveryDate = "SeedDeliveryDate";

        [DataType(typeof(System.String))]
        public static readonly String SeedReceivedBy = "SeedReceivedBy";

        [DataType(typeof(System.String))]
        public static readonly String SeedIsotope = "SeedIsotope";

        [DataType(typeof(System.String))]
        public static readonly String SeedNumReceived = "SeedNumReceived";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String SeedAssayDateText = "SeedAssayDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String SeedAssayDate = "SeedAssayDate";

        [DataType(typeof(System.String))]
        public static readonly String SeedAssayActivity = "SeedAssayActivity";

        [DataType(typeof(System.String))]
        public static readonly String SeedActivityMin = "SeedActivityMin";

        [DataType(typeof(System.String))]
        public static readonly String SeedActivityMax = "SeedActivityMax";

        [DataType(typeof(System.String))]
        public static readonly String SeedCurrentActivity = "SeedCurrentActivity";

        [DataType(typeof(System.String))]
        public static readonly String SeedNum = "SeedNum";

        [DataType(typeof(System.Byte))]
        public static readonly String SeedDisposed = "SeedDisposed";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String SeedRestockedDateText = "SeedRestockedDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String SeedRestockedDate = "SeedRestockedDate";

    }
}
