using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("BrachyTherapy")]
    [ParentTablename("Patients")]
    [Disease("Prostate")]
    [Exportable]
    public class BrachyTherapy : BusinessObject
    {
        [DataType(typeof(System.Int32))]
        public static readonly String OperatingRoomDetailId = "OperatingRoomDetailId";

        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.String))]
        public static readonly String BrachyCPT_Code = "BrachyCPT_Code";

        [DataType(typeof(System.String))]
        public static readonly String BrachyCPT_Description = "BrachyCPT_Description";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPhysician = "BrachyPhysician";

        [DataType(typeof(System.Byte))]
        public static readonly String BrachyPending = "BrachyPending";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String BrachyDateText = "BrachyDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String BrachyDate = "BrachyDate";

        [DataType(typeof(System.String))]
        public static readonly String BrachyTime = "BrachyTime";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPrescribedDose = "BrachyPrescribedDose";

        [DataType(typeof(System.String))]
        public static readonly String BrachyDoseNotes = "BrachyDoseNotes";

        [DataType(typeof(System.String))]
        public static readonly String BrachyIsotope = "BrachyIsotope";

        [DataType(typeof(System.String))]
        public static readonly String BrachyRecTotalActivity = "BrachyRecTotalActivity";

        [DataType(typeof(System.String))]
        public static readonly String BrachySeedStrength = "BrachySeedStrength";

        [DataType(typeof(System.String))]
        public static readonly String BrachyTotalActivity = "BrachyTotalActivity";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPercActivity = "BrachyPercActivity";

        [DataType(typeof(System.String))]
        public static readonly String BrachyNumSeedsPlanned = "BrachyNumSeedsPlanned";

        [DataType(typeof(System.String))]
        public static readonly String BrachyNumNeedlesPlanned = "BrachyNumNeedlesPlanned";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPreV100 = "BrachyPreV100";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPreV150 = "BrachyPreV150";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPreV200 = "BrachyPreV200";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPreD90 = "BrachyPreD90";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPreUrethraVolume = "BrachyPreUrethraVolume";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPreUrethraD90 = "BrachyPreUrethraD90";

        [DataType(typeof(System.String))]
        public static readonly String BrachyOpUS_Volume = "BrachyOpUS_Volume";

        [DataType(typeof(System.String))]
        public static readonly String BrachyOpV100 = "BrachyOpV100";

        [DataType(typeof(System.String))]
        public static readonly String BrachyOpV150 = "BrachyOpV150";

        [DataType(typeof(System.String))]
        public static readonly String BrachyOpV200 = "BrachyOpV200";

        [DataType(typeof(System.String))]
        public static readonly String BrachyOpD90 = "BrachyOpD90";

        [DataType(typeof(System.String))]
        public static readonly String BrachyOpUrethraVolume = "BrachyOpUrethraVolume";

        [DataType(typeof(System.String))]
        public static readonly String BrachyOpUrethraD90 = "BrachyOpUrethraD90";

        [DataType(typeof(System.String))]
        public static readonly String BrachyNumSeeds = "BrachyNumSeeds";

        [DataType(typeof(System.String))]
        public static readonly String BrachyNumNeedles = "BrachyNumNeedles";

        [DataType(typeof(System.String))]
        public static readonly String BrachyDVH = "BrachyDVH";

        [DataType(typeof(System.String))]
        public static readonly String BrachyV90 = "BrachyV90";

        [DataType(typeof(System.String))]
        public static readonly String BrachyV100 = "BrachyV100";

        [DataType(typeof(System.String))]
        public static readonly String BrachyV150 = "BrachyV150";

        [DataType(typeof(System.String))]
        public static readonly String BrachyV200 = "BrachyV200";

        [DataType(typeof(System.String))]
        public static readonly String BrachyD80 = "BrachyD80";

        [DataType(typeof(System.String))]
        public static readonly String BrachyD90 = "BrachyD90";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPercD90 = "BrachyPercD90";

        [DataType(typeof(System.String))]
        public static readonly String BrachyD100 = "BrachyD100";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPercD100 = "BrachyPercD100";

        [DataType(typeof(System.String))]
        public static readonly String BrachyMinDose = "BrachyMinDose";

        [DataType(typeof(System.String))]
        public static readonly String BrachyMPD = "BrachyMPD";

        [DataType(typeof(System.String))]
        public static readonly String BrachyVg100 = "BrachyVg100";

        [DataType(typeof(System.String))]
        public static readonly String BrachyMaxUrethraDose = "BrachyMaxUrethraDose";

        [DataType(typeof(System.String))]
        public static readonly String BrachyAvgUrethraDose = "BrachyAvgUrethraDose";

        [DataType(typeof(System.String))]
        public static readonly String BrachyUrethraV100 = "BrachyUrethraV100";

        [DataType(typeof(System.String))]
        public static readonly String BrachyUrethraV150 = "BrachyUrethraV150";

        [DataType(typeof(System.String))]
        public static readonly String BrachyUrethraV200 = "BrachyUrethraV200";

        [DataType(typeof(System.String))]
        public static readonly String BrachyUrethraD90 = "BrachyUrethraD90";

        [DataType(typeof(System.String))]
        public static readonly String BrachyUrethraD30 = "BrachyUrethraD30";

        [DataType(typeof(System.String))]
        public static readonly String BrachyUrethraD5 = "BrachyUrethraD5";

        [DataType(typeof(System.String))]
        public static readonly String BrachyRectumV100 = "BrachyRectumV100";

        [DataType(typeof(System.String))]
        public static readonly String BrachyRectumV150 = "BrachyRectumV150";

        [DataType(typeof(System.String))]
        public static readonly String BrachyRectumV200 = "BrachyRectumV200";

        [DataType(typeof(System.String))]
        public static readonly String BrachyMaxRectumDose = "BrachyMaxRectumDose";

        [DataType(typeof(System.String))]
        public static readonly String BrachyAvgRectumDose = "BrachyAvgRectumDose";

        [DataType(typeof(System.String))]
        public static readonly String BrachyLungSeeds = "BrachyLungSeeds";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPelvisSeeds = "BrachyPelvisSeeds";

        [DataType(typeof(System.String))]
        public static readonly String BrachyProstateSeeds = "BrachyProstateSeeds";

        [DataType(typeof(System.String))]
        public static readonly String BrachyNVB = "BrachyNVB";

        [DataType(typeof(System.String))]
        public static readonly String BrachyPenileBulb = "BrachyPenileBulb";

        [DataType(typeof(System.String))]
        public static readonly String BrachyInstitution = "BrachyInstitution";

        [DataType(typeof(System.String))]
        public static readonly String BrachyNotes = "BrachyNotes";

        [DataType(typeof(System.String))]
        public static readonly String BrachyDataSource = "BrachyDataSource";

        [DataType(typeof(System.String))]
        public static readonly String BrachyQuality = "BrachyQuality";

    }
}
