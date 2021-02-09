*************************************************************************

 Basic instructions for installing a new Caisis SQL Server database follow.
 More detail on installing Caisis can be found on the Caisis.org wiki:
 http://caisis.org/wiki/index.php?title=Installation

**************************************************************************

- Create a new database in SQL Server 2005 or 2008. 
- Choose compatibilty level: SQL Server 2005 (90)
- Choose Collation: SQL_Latin1_General_CP1_CI_AS
- Create a server login for the application and assign it to the database (write down this user and password)
- Give the login data reader/writer permissions on the database.

After completing the above, run the following script files in this order:

1.BuildDatabaseObjects.sql
2.SecurityData.sql
3.ImportMetaData.sql
4.CTCAE_TableData.sql
5.GrantPermissions.sql (for the user parameter specify the server login created above)


SecurityData.sql contains the below data
---------------------------------------
Datasets
Users
Groups
Roles
Permissions
UserGroups
RolePermissions
GroupDatasets

ImportMetaData.sql contains the below data
---------------------------------------
Diseases
DiseaseAttributes
DiseaseAttributeValues
LookupCodes
LookupAttributes
LookupCodeAttributes
LookupParentChildCodes
LookupSynonyms
HelpSections
HelpSectionFields
MetadataFieldAttributeValueOptions
MetadataTables
MetadataFields
MetadataFieldAttributes
MetadataFieldAttributeValues
MetadataTableAttributes
MetadataTableAttributeValues


CTCAE_TableData.sql contains the below data
---------------------------------------
CTC_AE_Category
CTC_AE_Terminology
CTC_AE_Toxicity_Grades
CTC_AE_Toxicity_Terms