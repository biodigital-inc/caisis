using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for SpecimenTrackerDa.
    /// </summary>
    public class SpecimenTrackerDa
    {

        public string newPrimaryKey = "";
        public Int32 daTotalRecords = 0;
        public SpecimenTrackerDa()
        {

            // TODO: Add constructor logic here

        }

        public DataSet FindLocalSpecimens(int curePageNumber, int pageSize
            , DateTime collectDateFrom
            , DateTime collectDateTo
            , string specimenType
            , string specimenTypesArray
            , string tbRefMask
            , string specimenStatus
            , string specimenTissueStatus
            , string vialNo
            , string boxNo

        )
        {
            //SqlCommand com=DataAccessHelper.CreateCommand("spSpecimenTr_Local_findSpecimens");
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimens_GetLocal");
            DataAccessHelper.AddDateTimeInputParam(com, "collectDateFrom", collectDateFrom);
            DataAccessHelper.AddDateTimeInputParam(com, "collectDateTo", collectDateTo);
            DataAccessHelper.AddStringInputParam(com, "specimenType", specimenType);
            DataAccessHelper.AddStringInputParam(com, "specimenTypesArray", specimenTypesArray);
            DataAccessHelper.AddStringInputParam(com, "tbRefMask", tbRefMask);
            DataAccessHelper.AddStringInputParam(com, "specimenStatus", specimenStatus);
            DataAccessHelper.AddStringInputParam(com, "specimenTissueStatus", specimenTissueStatus);
            DataAccessHelper.AddStringInputParam(com, "vialNo", vialNo);
            DataAccessHelper.AddStringInputParam(com, "boxNo", boxNo);

            DataAccessHelper.AddIntInputParam(com, "curePageNumber", curePageNumber);
            DataAccessHelper.AddIntInputParam(com, "pageSize", pageSize);
            return DataAccessHelper.GetList(com, 0, 0);
            //return DataAccessHelper.GetList(com);
        }
        public DataSet FindSpecimens(int curePageNumber, int pageSize)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimens_GetLocal");
            DataAccessHelper.AddIntInputParam(com, "curePageNumber", curePageNumber);
            DataAccessHelper.AddIntInputParam(com, "pageSize", pageSize);
            return DataAccessHelper.GetList(com, 0, 0);

        }

        public DataSet FindAllSpecimens()
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Local_findSpecimens");

            return DataAccessHelper.GetList(com);
        }

        public DataSet FindResearchSpecimens(int curePageNumber, int pageSize
            , int ageDiagFrom
            , int ageDiagTo
            , string priHistDiag
            , string histpathGrade
            , string ER
            , string PR
            , string Her2ICC
            , string nodePositive
            , string adjuvAgent
            , string replapseStatus
            , string bloodSamplesArr
            , string tissueSamplesArr
            , string tissueType
            )
        {
            //SqlCommand com=DataAccessHelper.CreateCommand("spSpecimenTr_Research_findSpecimens");

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimens_GetResearch");

            DataAccessHelper.AddIntInputParam(com, "ageDiagFrom", ageDiagFrom);
            DataAccessHelper.AddIntInputParam(com, "ageDiagTo", ageDiagTo);
            DataAccessHelper.AddStringInputParam(com, "priHistDiag", priHistDiag);
            DataAccessHelper.AddStringInputParam(com, "histpathGrade", histpathGrade);
            DataAccessHelper.AddStringInputParam(com, "ER", ER);
            DataAccessHelper.AddStringInputParam(com, "PR", PR);
            DataAccessHelper.AddStringInputParam(com, "Her2ICC", Her2ICC);
            DataAccessHelper.AddStringInputParam(com, "nodePositive", nodePositive);
            DataAccessHelper.AddStringInputParam(com, "adjuvAgent", adjuvAgent);
            DataAccessHelper.AddStringInputParam(com, "replapseStatus", replapseStatus);
            DataAccessHelper.AddStringInputParam(com, "bloodSamplesArr", bloodSamplesArr);
            DataAccessHelper.AddStringInputParam(com, "tissueSamplesArr", tissueSamplesArr);
            DataAccessHelper.AddStringInputParam(com, "tissueType", tissueType);

            DataAccessHelper.AddIntInputParam(com, "curePageNumber", curePageNumber);
            DataAccessHelper.AddIntInputParam(com, "pageSize", pageSize);
            return DataAccessHelper.GetList(com, 0, 0);
            //return DataAccessHelper.GetList(com);
        }
        public DataSet FindCollections(
            string name
            , string type
            , string status
            , DateTime dateFrom
            , DateTime dateTo
            )
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_FindCollections");
            DataAccessHelper.AddStringInputParam(com, "name", name);
            DataAccessHelper.AddStringInputParam(com, "type", type);
            DataAccessHelper.AddStringInputParam(com, "status", status);
            DataAccessHelper.AddDateTimeInputParam(com, "dateFrom", dateFrom);
            DataAccessHelper.AddDateTimeInputParam(com, "dateTo", dateTo);

            //DataSet ds=DataAccessHelper.GetList(com);
            //DataTable dt=ds.Tables[0];
            return DataAccessHelper.GetList(com);

        }

        public DataSet GetCollectionDetails(int collectionId)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Collections_GetDetails");
            DataAccessHelper.AddIntInputParam(com, "collectionId", collectionId);
            DataAccessHelper.AddStringInputParam(com, "arg", "");

            return DataAccessHelper.GetList(com);

        }
        public DataSet GetSpecimenInfo(int specimenId)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimen_getInfo");
            DataAccessHelper.AddIntInputParam(com, "specimenId", specimenId);
            DataAccessHelper.AddStringInputParam(com, "arg", "");

            return DataAccessHelper.GetList(com);

        }

        public DataSet GetSpecimenInfoByPositionId(
            int positionId
            , int boxId
            , string boxName)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimen_GetDetailsByPositionId");
            DataAccessHelper.AddIntInputParam(com, "positionId", positionId);
            DataAccessHelper.AddIntInputParam(com, "boxId", boxId);
            DataAccessHelper.AddStringInputParam(com, "boxName", boxName);

            return DataAccessHelper.GetList(com);

        }
        public DataSet GetSubSpecimenDetails(int parentId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimen_GetChildDetails");
            DataAccessHelper.AddIntInputParam(com, "parentId", parentId);
            DataAccessHelper.AddStringInputParam(com, "arg", "");

            return DataAccessHelper.GetList(com);

        }
        public DataSet GetSpecimenDetails(int collectionId, string collectionIdList, string arg)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimen_GetDetails");
            DataAccessHelper.AddIntInputParam(com, "collectionId", collectionId);
            DataAccessHelper.AddLongStringInputParam(com, "collectionIdList", collectionIdList);
            DataAccessHelper.AddStringInputParam(com, "arg", arg);

            return DataAccessHelper.GetList(com);

        }

        // new one added by eftaker
        public DataSet GetSpecimenDetails(int collectionId, string collectionIdList, string arg, string IdentifierType)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimen_GetDetails");
            DataAccessHelper.AddIntInputParam(com, "collectionId", collectionId);
            DataAccessHelper.AddLongStringInputParam(com, "collectionIdList", collectionIdList);
            DataAccessHelper.AddStringInputParam(com, "arg", arg);
            DataAccessHelper.AddStringInputParam(com, "IdentifierType", IdentifierType);

            return DataAccessHelper.GetList(com);

        }

        public string RemoveSpecimen(int specimenId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Collection_RemoveSpecimen");


            DataAccessHelper.AddStringOutputParam(com, "msg");

            DataAccessHelper.AddIntInputParam(com, "specimenId", specimenId);


            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;
        }
        public string DeleteSpecimen(int specimenId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimen_DeleteRecord");


            DataAccessHelper.AddStringOutputParam(com, "msg");

            DataAccessHelper.AddIntInputParam(com, "specimenId", specimenId);


            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;
        }
        //AddSpecimen(vialNo,sampleType,sizeVol,sampleStatus,freezerTank,shelfRack,userLoginID)
        public string AddSpecimen(
            int parientId
            , string specimenVial
            , string SampleType
            , string SizeVol
            , string RemainingVol
            , string SampleStatus
            , string FreezerTank
            , string ShelfRack
            , string BoxNo
            , int BoxID
            , int positionId
            , string userName)
        {



            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimen_AddRecord");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);

            DataAccessHelper.AddIntInputParam(com, "parientId", parientId);
            DataAccessHelper.AddStringInputParam(com, "specimenVial", specimenVial);
            DataAccessHelper.AddStringInputParam(com, "SampleType", SampleType);
            DataAccessHelper.AddStringInputParam(com, "SizeVol", SizeVol);
            DataAccessHelper.AddStringInputParam(com, "RemainingVol", RemainingVol);
            DataAccessHelper.AddStringInputParam(com, "SampleStatus", SampleStatus);
            DataAccessHelper.AddStringInputParam(com, "FreezerTank", FreezerTank);
            DataAccessHelper.AddStringInputParam(com, "ShelfRack", ShelfRack);
            DataAccessHelper.AddStringInputParam(com, "BoxNo", BoxNo);
            DataAccessHelper.AddIntInputParam(com, "BoxID", BoxID);
            DataAccessHelper.AddIntInputParam(com, "positionId", positionId);


            DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);



            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);


            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;

        }

        public string UpdateSpecimen(
            int specimenId
            , string specimenVial
            , string SampleType
            , string SizeVol
            , string SampleStatus
            , string FreezerTank
            , string ShelfRack
            , string BoxName
            , string positionId
            , string notes
            , string userName)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimen_UpdateRecord");

            DataAccessHelper.AddStringOutputParam(com, "msg");



            DataAccessHelper.AddIntInputParam(com, "specimenId", specimenId);
            DataAccessHelper.AddStringInputParam(com, "specimenVial", specimenVial);
            DataAccessHelper.AddStringInputParam(com, "SampleType", SampleType);
            DataAccessHelper.AddStringInputParam(com, "SizeVol", SizeVol);
            DataAccessHelper.AddStringInputParam(com, "SampleStatus", SampleStatus);
            DataAccessHelper.AddStringInputParam(com, "FreezerTank", FreezerTank);
            DataAccessHelper.AddStringInputParam(com, "ShelfRack", ShelfRack);
            DataAccessHelper.AddStringInputParam(com, "BoxName", BoxName);
            DataAccessHelper.AddStringInputParam(com, "positionId", positionId);
            DataAccessHelper.AddStringInputParam(com, "notes", notes);

            DataAccessHelper.AddStringInputParam(com, "userName", userName);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;

        }
        public string UpdateTransferSpecimens(
            int specimenId
            , int transferId
            , string specimenVial

            , string FreezerTank
            , string ShelfRack
            , string BoxName
            , string positionId
            , string notes
            , string userName)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_UpdateSpecimens");

            DataAccessHelper.AddStringOutputParam(com, "msg");



            DataAccessHelper.AddIntInputParam(com, "specimenId", specimenId);
            DataAccessHelper.AddIntInputParam(com, "transferId", transferId);
            DataAccessHelper.AddStringInputParam(com, "specimenVial", specimenVial);
            DataAccessHelper.AddStringInputParam(com, "FreezerTank", FreezerTank);
            DataAccessHelper.AddStringInputParam(com, "ShelfRack", ShelfRack);
            DataAccessHelper.AddStringInputParam(com, "BoxName", BoxName);
            DataAccessHelper.AddStringInputParam(com, "positionId", positionId);
            DataAccessHelper.AddStringInputParam(com, "notes", notes);

            DataAccessHelper.AddStringInputParam(com, "userName", userName);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;

        }

        public DataSet LoadSpecimenDDList(string listName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Specimen_LoadDDList");
            DataAccessHelper.AddStringInputParam(com, "listName", listName);

            return DataAccessHelper.GetList(com);

        }


        public DataSet GetSpecimenListDetails(string specimenIds)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_CollectionInfo_GetSpecimensListDetails");
            DataAccessHelper.AddLongStringInputParam(com, "specimenIds", specimenIds);
            return DataAccessHelper.GetList(com);

        }
        public DataSet LoadStorageDetails(string tableName, int arg)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_AdminLoadDDList");
            DataAccessHelper.AddStringInputParam(com, "tableName", tableName);
            DataAccessHelper.AddIntInputParam(com, "arg", arg);
            return DataAccessHelper.GetList(com);
        }
        public DataSet LoadStorageDetailsByName(string tableName, int arg, string arg2)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_AdminLoadDDList");
            DataAccessHelper.AddStringInputParam(com, "tableName", tableName);
            DataAccessHelper.AddIntInputParam(com, "arg", arg);
            DataAccessHelper.AddStringInputParam(com, "arg2", arg2);
            return DataAccessHelper.GetList(com);
        }

        public DataSet GetSiteInfo(string siteName, int siteId)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_StorageInventory_GetSiteInfo");
            DataAccessHelper.AddStringInputParam(com, "siteName", siteName);
            DataAccessHelper.AddIntInputParam(com, "siteId", siteId);
            return DataAccessHelper.GetList(com);
        }

        public DataSet GetStorageInfo(string storageName, int storageId)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_StorageInventory_GetStorageInfo");
            DataAccessHelper.AddStringInputParam(com, "storageName", storageName);
            DataAccessHelper.AddIntInputParam(com, "storageId", storageId);
            return DataAccessHelper.GetList(com);
        }
        public DataSet GetContainerInfo(string containerName, int containerId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_StorageInventory_GetContainerInfo");
            DataAccessHelper.AddStringInputParam(com, "containerName", containerName);
            DataAccessHelper.AddIntInputParam(com, "containerId", containerId);
            return DataAccessHelper.GetList(com);
        }

        public DataSet GetBoxInfo(string boxName, int boxId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_StorageInventory_GetBoxInfo");
            DataAccessHelper.AddStringInputParam(com, "boxName", boxName);
            DataAccessHelper.AddIntInputParam(com, "boxId", boxId);
            return DataAccessHelper.GetList(com);
        }
        public string AddSite(
            string siteName
            , string siteAddress
            , string siteCity
            , string siteState
            , string sitePOCode
            , string userName
        )
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_AdminAddSite");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);

            DataAccessHelper.AddStringInputParam(com, "siteName", siteName);
            DataAccessHelper.AddStringInputParam(com, "siteAddress1", siteAddress);
            DataAccessHelper.AddStringInputParam(com, "siteAddress2", siteAddress);
            DataAccessHelper.AddStringInputParam(com, "siteCity", siteCity);
            DataAccessHelper.AddStringInputParam(com, "siteState", siteState);
            DataAccessHelper.AddStringInputParam(com, "SitePostalCode", sitePOCode);
            DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);


            //DataAccessHelper.AddStringOutputParam(com,msg );	
            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            //			if(outParams["NewPrimaryKey"] != System.DBNull.Value)
            //			{
            //				int keyVal=(int)outParams["NewPrimaryKey"];
            //				if (keyVal>0)
            //					return true;
            //			}
            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;
        }
        public string AddStorageToSite(
        int siteID
        , string storageName
        , string storageType
        , string storageStatus
        , int maxContainerNo
        , int curContainerNo
        , string userName
        )
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_AdminAddStorage");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);

            DataAccessHelper.AddIntInputParam(com, "siteID", siteID);
            DataAccessHelper.AddStringInputParam(com, "StorageName", storageName);
            DataAccessHelper.AddStringInputParam(com, "storageType", storageType);
            DataAccessHelper.AddStringInputParam(com, "storageStatus", storageStatus);
            DataAccessHelper.AddIntInputParam(com, "maxContainerNo", maxContainerNo);
            DataAccessHelper.AddIntInputParam(com, "curContainerNo", curContainerNo);

            DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);



            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);


            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;

        }

        public string AddContainerToStorage(
            int storageID
            , string containerName
            , string containerType
            , string containerStatus
            , int maxBoxNo
            , int curBoxNo
            , string userName
            )
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_AdminAddContainer");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);

            DataAccessHelper.AddIntInputParam(com, "storageID", storageID);
            DataAccessHelper.AddStringInputParam(com, "containerName", containerName);
            DataAccessHelper.AddStringInputParam(com, "containerType", containerType);
            DataAccessHelper.AddStringInputParam(com, "containerStatus", containerStatus);
            DataAccessHelper.AddIntInputParam(com, "maxBoxNo", maxBoxNo);
            DataAccessHelper.AddIntInputParam(com, "curBoxNo", curBoxNo);

            DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;
        }

        public string AddBoxToContainer(
            int containerID
            , string boxName
            , string boxType
            , string boxStatus
            , int NoOfColumns
            , int NoOfRows
            , int maxPositionNo
            , int curPositionNo
            , string userName
            )
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_AdminAddBox");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);

            DataAccessHelper.AddIntInputParam(com, "containerID", containerID);
            DataAccessHelper.AddStringInputParam(com, "boxName", boxName);
            DataAccessHelper.AddStringInputParam(com, "boxType", boxType);
            DataAccessHelper.AddStringInputParam(com, "boxStatus", boxStatus);
            DataAccessHelper.AddIntInputParam(com, "NoOfColumns", NoOfColumns);
            DataAccessHelper.AddIntInputParam(com, "NoOfRows", NoOfRows);
            DataAccessHelper.AddIntInputParam(com, "maxPositionNo", maxPositionNo);
            DataAccessHelper.AddIntInputParam(com, "curPositionNo", curPositionNo);

            DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;

        }
        public DataSet LoadDropDownList(string listName, string arg)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_LoadDropDownList");
            DataAccessHelper.AddStringInputParam(com, "listName", listName);
            DataAccessHelper.AddStringInputParam(com, "arg", arg);

            return DataAccessHelper.GetList(com);
        }
        public DataSet LoadTransferRequestList(string listName, string arg)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_LoadTransferRequestList");
            DataAccessHelper.AddStringInputParam(com, "listName", listName);
            DataAccessHelper.AddStringInputParam(com, "arg", arg);

            return DataAccessHelper.GetList(com);
        }




        public DataSet LoadCollectionDDList(string listName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_LoadDDList2");
            DataAccessHelper.AddStringInputParam(com, "listName", listName);

            return DataAccessHelper.GetList(com);
        }

        public string SaveCollectionInfo(
            int collectionId
            , string CollectionName
            , string CollectionProjectCode
            , DateTime CollectionAssignDate
            , string CollectionType
            , string CollectionStatus
            , string CollectionAssignNotes
            , string userName)
        //Id,Name,ProjectCode,DateCreated,Type,Status,userLoginID
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Collection_UpdateInfo");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);

            DataAccessHelper.AddIntInputParam(com, "collectionId", collectionId);

            DataAccessHelper.AddStringInputParam(com, "CollectionName", CollectionName);
            DataAccessHelper.AddStringInputParam(com, "CollectionProjectCode", CollectionProjectCode);
            DataAccessHelper.AddDateTimeInputParam(com, "CollectionAssignDate", CollectionAssignDate);

            DataAccessHelper.AddStringInputParam(com, "CollectionType", CollectionType);
            DataAccessHelper.AddStringInputParam(com, "CollectionStatus", CollectionStatus);
            DataAccessHelper.AddStringInputParam(com, "CollectionAssignNotes", CollectionAssignNotes);

            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;


        }
        public string SaveSpecimensToCollection(
            int collectionId
            , string specimenIds
            , string CollectionName
            //			,string CollectionProjectCode
            //			,DateTime CollectionAssignDate
            //			,string CollectionType
            //			,string CollectionStatus
            //			,string CollectionAssignNotes
            , string userName)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Collection_AddSpecimens");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);

            DataAccessHelper.AddIntInputParam(com, "collectionId", collectionId);
            DataAccessHelper.AddLongStringInputParam(com, "specimenIds", specimenIds);

            DataAccessHelper.AddStringInputParam(com, "CollectionName", CollectionName);
            //			DataAccessHelper.AddStringInputParam(com, "CollectionProjectCode",CollectionProjectCode );	
            //			DataAccessHelper.AddDateTimeInputParam(com, "CollectionAssignDate",CollectionAssignDate );
            //
            //			DataAccessHelper.AddStringInputParam(com, "CollectionType",CollectionType );	
            //			DataAccessHelper.AddStringInputParam(com, "CollectionStatus",CollectionStatus );	
            //			DataAccessHelper.AddStringInputParam(com, "CollectionAssignNotes",CollectionAssignNotes );	

            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;


        }
        public string CreateCollection(
            string specimenIds
            , string CollectionName
            , string CollectionProjectCode
            , DateTime CollectionAssignDate
            , string CollectionType
            , string CollectionStatus
            , string CollectionAssignNotes
            , string userName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Collection_AddNew");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);

            DataAccessHelper.AddLongStringInputParam(com, "specimenIds", specimenIds);

            DataAccessHelper.AddStringInputParam(com, "CollectionName", CollectionName);
            DataAccessHelper.AddStringInputParam(com, "CollectionProjectCode", CollectionProjectCode);
            DataAccessHelper.AddDateTimeInputParam(com, "CollectionAssignDate", CollectionAssignDate);

            DataAccessHelper.AddStringInputParam(com, "CollectionType", CollectionType);
            DataAccessHelper.AddStringInputParam(com, "CollectionStatus", CollectionStatus);
            DataAccessHelper.AddStringInputParam(com, "CollectionAssignNotes", CollectionAssignNotes);


            DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;


        }

        //*****************************Transfer request*************************************
        public string SaveTransferRequest(
            string RequestIdentifier
            , DateTime RequestDate
            , string requestType
            , string RequestGenInstituition
            , string RequestGenContactName
            , string RequestRecInstitution
            , string RequestRecContactName
            , string RequestProject
            , string RequestStatus
            , int RequestCollectionId
            , string RequestNotes
            , string collectionIdList
            , string institutionList
            , string contactList
            , string userName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_AddRequest");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);


            DataAccessHelper.AddStringInputParam(com, "RequestIdentifier", RequestIdentifier);
            DataAccessHelper.AddDateTimeInputParam(com, "RequestDate", RequestDate);

            DataAccessHelper.AddStringInputParam(com, "requestType", requestType);
            DataAccessHelper.AddStringInputParam(com, "RequestGenInstituition", RequestGenInstituition);
            DataAccessHelper.AddStringInputParam(com, "RequestGenContactName", RequestGenContactName);

            DataAccessHelper.AddStringInputParam(com, "RequestRecInstitution", RequestRecInstitution);
            DataAccessHelper.AddStringInputParam(com, "RequestRecContactName", RequestRecContactName);
            DataAccessHelper.AddStringInputParam(com, "RequestProject", RequestProject);
            DataAccessHelper.AddStringInputParam(com, "RequestStatus", RequestStatus);
            DataAccessHelper.AddIntInputParam(com, "RequestCollectionId", RequestCollectionId);
            DataAccessHelper.AddStringInputParam(com, "RequestNotes", RequestNotes);

            DataAccessHelper.AddLongStringInputParam(com, "collectionIdList", collectionIdList);
            DataAccessHelper.AddLongStringInputParam(com, "institutionList", institutionList);
            DataAccessHelper.AddLongStringInputParam(com, "contactList", contactList);



            DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            if (outParams["NewPrimaryKey"] != System.DBNull.Value)
            {
                newPrimaryKey = outParams["NewPrimaryKey"].ToString();

            }
            return keyVal;

        }
        public DataSet FindTransferRequests(string Criteria)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_ExternalRequest");

            return DataAccessHelper.GetList(com);
        }
        public string SaveDispatchInfo(

            int SpecimenRequestId
            , int collectionId
            , DateTime DispatchDate
            , string DispatchTime
            , string DispatchedBy
            , string boxId
            , string LoggerN
            , string Method
            , string TrackingN
            , string Status
            , string userName

            )
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_AddDispatchInfo");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);


            DataAccessHelper.AddIntInputParam(com, "SpecimenRequestId", SpecimenRequestId);
            DataAccessHelper.AddIntInputParam(com, "collectionId", collectionId);
            DataAccessHelper.AddDateTimeInputParam(com, "DispatchDate", DispatchDate);


            DataAccessHelper.AddStringInputParam(com, "DispatchTime", DispatchTime);
            DataAccessHelper.AddStringInputParam(com, "DispatchedBy", DispatchedBy);
            DataAccessHelper.AddStringInputParam(com, "boxId", boxId);

            DataAccessHelper.AddStringInputParam(com, "LoggerN", LoggerN);
            DataAccessHelper.AddStringInputParam(com, "Method", Method);
            DataAccessHelper.AddStringInputParam(com, "TrackingN", TrackingN);
            DataAccessHelper.AddStringInputParam(com, "Status", Status);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;



        }
        public string SaveExternalDispatchInfo(
            //(gRequestId,gCollectionId,dDate,dispTime,dispBy,dispBoxId,dispLoggerNo,dispMethod,dispTrackNo,dispNotes,status,userName);
            int SpecimenRequestId
            , int Collectionid
            , DateTime DispatchDate
            , string DispatchTime
            , string DispatchInstitution
            , string DispatchContact
            , string DispatchedBy
            , string boxId
            , string LoggerN
            , string Method
            , string TrackingN
            , string DispatchpNotes
            , string Status
            , string userName

            )
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_AddExternalDispatchInfo");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);


            DataAccessHelper.AddIntInputParam(com, "SpecimenRequestId", SpecimenRequestId);
            DataAccessHelper.AddIntInputParam(com, "Collectionid", Collectionid);
            DataAccessHelper.AddDateTimeInputParam(com, "DispatchDate", DispatchDate);


            DataAccessHelper.AddStringInputParam(com, "DispatchTime", DispatchTime);
            DataAccessHelper.AddStringInputParam(com, "DispatchInstitution", DispatchInstitution);
            DataAccessHelper.AddStringInputParam(com, "DispatchContact", DispatchContact);
            DataAccessHelper.AddStringInputParam(com, "DispatchedBy", DispatchedBy);
            DataAccessHelper.AddStringInputParam(com, "boxId", boxId);

            DataAccessHelper.AddStringInputParam(com, "LoggerN", LoggerN);
            DataAccessHelper.AddStringInputParam(com, "Method", Method);
            DataAccessHelper.AddStringInputParam(com, "TrackingN", TrackingN);
            DataAccessHelper.AddStringInputParam(com, "Status", Status);
            DataAccessHelper.AddStringInputParam(com, "DispatchpNotes", DispatchpNotes);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;



        }

        public string SaveReceivingInfo(
        int RequestId
        , int SpecimenDistributionId
        , int CollectionId
        , DateTime ReceiveDate
        , string ReceiveTime
        , string ReceivedBy
        , string Integrity
        , string Notes
        , string Status
        , string userName)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_UpdateReceivingInfo");

            DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");
            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddIntInputParam(com, "userName", userName);

            DataAccessHelper.AddIntInputParam(com, "RequestId", RequestId);
            DataAccessHelper.AddIntInputParam(com, "SpecimenDistributionId", SpecimenDistributionId);
            DataAccessHelper.AddIntInputParam(com, "CollectionId", CollectionId);
            DataAccessHelper.AddDateTimeInputParam(com, "ReceiveDate", ReceiveDate);
            DataAccessHelper.AddStringInputParam(com, "ReceiveTime", ReceiveTime);
            DataAccessHelper.AddStringInputParam(com, "ReceivedBy", ReceivedBy);
            DataAccessHelper.AddStringInputParam(com, "Integrity", Integrity);
            DataAccessHelper.AddStringInputParam(com, "Notes", Notes);
            DataAccessHelper.AddStringInputParam(com, "Status", Status);

            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;

        }




        public string SaveExternalReceivingInfo(
            int SpecimenRequestId
            , int CollectionId
            , DateTime ReceivedDate
            , string ReceivedTime
            , string ReceivedInstitution
            , string ReceivedConatct
            , string ReceivedIntegrity
            , string ReceivedNotes
            , string Status
            , string userName)
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_AddExternalReceiveInfo");


            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);


            DataAccessHelper.AddIntInputParam(com, "SpecimenRequestId", SpecimenRequestId);
            DataAccessHelper.AddIntInputParam(com, "CollectionId", CollectionId);
            DataAccessHelper.AddDateTimeInputParam(com, "ReceivedDate", ReceivedDate);
            DataAccessHelper.AddStringInputParam(com, "ReceivedTime", ReceivedTime);
            DataAccessHelper.AddStringInputParam(com, "ReceivedInstitution", ReceivedInstitution);
            DataAccessHelper.AddStringInputParam(com, "ReceivedConatct", ReceivedConatct);
            DataAccessHelper.AddStringInputParam(com, "ReceivedIntegrity", ReceivedIntegrity);
            DataAccessHelper.AddStringInputParam(com, "ReceivedNotes", ReceivedNotes);
            DataAccessHelper.AddStringInputParam(com, "Status", Status);

            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;

        }

        public DataSet GetTransferRequestDetails(
            int requestId
            , string requestType

            )
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_GetRequestDetails");
            DataAccessHelper.AddIntInputParam(com, "requestId", requestId);
            DataAccessHelper.AddStringInputParam(com, "requestType", requestType);

            return DataAccessHelper.GetList(com);

        }
        public DataSet GetExternalTransferRequestDetails(
            int requestId
            , int collectionId
            , string collectionIdList
            , string requestType
            , string arg

            )
        {

            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_GetExternalRequestDetails");
            DataAccessHelper.AddIntInputParam(com, "requestId", requestId);
            DataAccessHelper.AddIntInputParam(com, "collectionId", collectionId);
            DataAccessHelper.AddLongStringInputParam(com, "collectionIdList", collectionIdList);
            DataAccessHelper.AddStringInputParam(com, "requestType", requestType);
            DataAccessHelper.AddStringInputParam(com, "arg", arg);

            return DataAccessHelper.GetList(com);

        }
        public DataSet GetTransferDistributionDetails(
            int requestId
            , string arg)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_GetDistributionDetails");
            DataAccessHelper.AddIntInputParam(com, "requestId", requestId);
            DataAccessHelper.AddStringInputParam(com, "arg", arg);

            return DataAccessHelper.GetList(com);

        }
        public string GetInternalTransferLog(int transferId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_GetLogInternal");

            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddIntInputParam(com, "transferId", transferId);




            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;

        }
        public string AssignLocationToCollection(
            int requestId
            , int collectionId
            , string specimenIdList
            , string freezerTank
            , string shelfOrRack
            , string boxName
            , int boxId
            , string keepPositionId
            , string userName
            )
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_AssignLocationForCollection");

            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddIntInputParam(com, "requestId", requestId);
            DataAccessHelper.AddIntInputParam(com, "collectionId", collectionId);

            DataAccessHelper.AddLongStringInputParam(com, "specimenIdList", specimenIdList);
            DataAccessHelper.AddStringInputParam(com, "freezerTank", freezerTank);
            DataAccessHelper.AddStringInputParam(com, "shelfOrRack", shelfOrRack);
            DataAccessHelper.AddStringInputParam(com, "boxName", boxName);
            DataAccessHelper.AddIntInputParam(com, "boxId", boxId);
            DataAccessHelper.AddStringInputParam(com, "keepPositionId", keepPositionId);

            DataAccessHelper.AddStringInputParam(com, "userName", userName);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;

        }
        public string MoveBox(
            int priBoxId
            , string priBoxName
            , int priShelfId
            , string priShelfName
            , int secBoxId
            , string secBoxName
            , int secShelfId
            , string secShelfName
            , string username)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_StorageInventory_moveBox");

            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddIntInputParam(com, "priBoxId", priBoxId);
            DataAccessHelper.AddIntInputParam(com, "priShelfId", priShelfId);
            DataAccessHelper.AddIntInputParam(com, "secBoxId", secBoxId);
            DataAccessHelper.AddIntInputParam(com, "secShelfId", secShelfId);



            DataAccessHelper.AddStringInputParam(com, "priBoxName", priBoxName);
            DataAccessHelper.AddStringInputParam(com, "priShelfName", priShelfName);
            DataAccessHelper.AddStringInputParam(com, "secBoxName", secBoxName);
            DataAccessHelper.AddStringInputParam(com, "secShelfName", secShelfName);

            DataAccessHelper.AddStringInputParam(com, "username", username);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;


        }

        public string DeleteCollection(int collectionId, string username)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_StorageInventory_deleteCollection");

            DataAccessHelper.AddStringOutputParam(com, "msg");
            DataAccessHelper.AddIntInputParam(com, "collectionId", collectionId);

            DataAccessHelper.AddStringInputParam(com, "username", username);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;
        }
        public string AssignLocationToCollectionExternal(
            int requestId
            , string collectionIdList
            , string specimenIdList
            , string freezerTank
            , string shelfOrRack
            , string boxName
            , int boxId
            , string keepPositionId
            , string userName
            )
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_AssignLocationForCollectionExternal");


            DataAccessHelper.AddStringOutputParam(com, "msg");

            DataAccessHelper.AddIntInputParam(com, "requestId", requestId);
            DataAccessHelper.AddLongStringInputParam(com, "collectionIdList", collectionIdList);
            DataAccessHelper.AddLongStringInputParam(com, "specimenIdList", specimenIdList);

            DataAccessHelper.AddStringInputParam(com, "freezerTank", freezerTank);
            DataAccessHelper.AddStringInputParam(com, "shelfOrRack", shelfOrRack);
            DataAccessHelper.AddStringInputParam(com, "boxName", boxName);
            DataAccessHelper.AddIntInputParam(com, "boxId", boxId);
            DataAccessHelper.AddStringInputParam(com, "keepPositionId", keepPositionId);
            DataAccessHelper.AddStringInputParam(com, "userName", userName);
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

            System.Collections.Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            string keyVal = "failure";
            if (outParams["msg"] != System.DBNull.Value)
            {
                keyVal = outParams["msg"].ToString();
            }
            return keyVal;

        }

        public DataSet LoadUserDetails(string userCriteria, string arg)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spSpecimenTr_Transfer_GetUserDetails");
            DataAccessHelper.AddStringInputParam(com, "userCriteria", userCriteria);
            DataAccessHelper.AddStringInputParam(com, "arg", arg);
            return DataAccessHelper.GetList(com);

        }

        public string UserEmailAddress(string userName, string Command)
        {
            string email = "";
            SpecimenTrackerDa da = new SpecimenTrackerDa();
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            ds = da.LoadUserDetails(userName, Command);

            dt = ds.Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                email = dr["userEmail"].ToString();
            }
            return email;

        }

        
    }
}