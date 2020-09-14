# Caisis
http://www.caisis.org

## Software Prerequisites
1. .NET 2.0 with .NET 3.5 extensions
2. Microsoft IIS 7.0+
3. SQL Server 2008+
4. Visual Studio 2012 (Professional or Community)

## Setup

1. Clone the repo onto your local drive.
2. Open IIS and create a new virtual directory using the wizard named "dev" as the alias.
3. Click "browse" and locate the "Caisis.UI" directory and select it as the virtual directory root.
4. Launch Visual Studio (may need Admin for debugging) and open the "Caisis.sln" in the source code root.
5. Update the web.config file with your database connection string and other local parameters (See comments in web.config file).
6. To test that it is working properly, build the application and browse to http://localhost/dev/Login.aspx
7. Login with username "admin" and password "password". Go to the admin untility to add additional users.
