
***********************************************************************************************************
**** USING CAISIS VERSION 7.0 SOURCE CODE WITH VISUAL STUDIO 2005 (.Net Framework 2.0 Compatible only) ****
***********************************************************************************************************


1. Copy the Caisis45SourceFiles folder to your local drive (although not necessary, We recommend creating a C:/Projects/ folder and putting  
   this folder within it). Rename the Caisis45SourceFiles folder to Caisis. 

2. Open IIS and create a new virtual directory using the wizard. Use "dev4" as the alias. In the next step browse to
   the Caisis/Caisis.Ui directory and select it. In the next step allow the default permissions. Close IIS. 

3. Open the Caisis/Caisis.sln file in Visual Studio 2005

4. Update the web.config file with your database connection string and other local parameters (See comments in web.config file).

5. To test that it is working properly, build the application and browse to http://localhost/dev4/login.aspx

6. Login with username "admin" and password "password". Go to the admin untility to add additional users.


The Caisis v4.5 data model, dictionary, class library and other documentation can be found on http:///www.caisis.org/

Please contact CaisisAdmin@mskcc.org or  caisis@biodigitalsystems.com with questions. 
