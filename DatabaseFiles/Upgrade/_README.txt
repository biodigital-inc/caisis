*****************************************************************************************************

 Basic instructions for upgrading the Caisis database from v6.0 to 7.0 follow.
 
 More detail on installing Caisis can be found on the Caisis.org wiki:
 http://caisis.org/wiki/index.php?title=Installation



**** Update Scripts ***********************************************************************************

A script to do a bulk upgrade from 6.0 to 7.0 has been provided(6.0_to_7.0_upgrade_script.sql) 
in place of running each script individually. We recommend making a copy of your database and 
running the scripts on the copy first. Be sure to back up your database before running the bulk 
upgrade so you can rollback and run each script individually if the bulk upgrade fails.

GrantPermissions.sql MUST be run after the other sql upgrade scripts to set the stored procedure 
permissions (regardless if the bulk upgrade script is used or if each script is run individually).

Check ChangeLog.xls for a brief overview of what each script file will do and instructions 
on how to run the upgrade process safely.

Caisis runs on SQL Server 2005 and SQL Server 2008 under compatibility level 90.


**** Metadata and LookupCodes *************************************************************************

After running the upgrade the final step is to update your lookup codes and metadata. 
The web application will not function correctly if this step is not done. Running the file 
ImportMetaData.sql allows you to update your lookup codes and metadata with the contents of the file.
Please backup your data before going through this process. 


**** For Tables You Modified *********************************************************************************

The tabled modified during the upgrade are noted in the Changelog.xls. If you modified these tables then you will 
need to reapply your modifications after running the upgrade script. Before upgrading make a 
table that contains the extra columns you added plus the primary key of the table for each table
you modifed. After the upgrade is completed add the extra columns back and use an update query 
joined by primary key to add the data back. If you modified stored procedures then you can use 
Changelog.xls to find out if they were changed during the upgrade and then reapply your modifications.


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