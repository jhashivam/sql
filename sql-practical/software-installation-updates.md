# SQL with Data Storytelling
### Learn SQL with Data Storytelling

### Software Installation Updates

#### macOS

- **Installing a Text Editor**: The source data you’ll add to a SQL database is typically stored in multiple text files, often in a format called comma-separated values (CSV)
     - Visual Studio Code by Microsoft: https://code.visualstudio.com/
     - Atom by GitHub: https://atom.io/

- **Downloading from GitHub**: https://github.com/shivamjhads/sql/tree/main/sql-practical.

- **Installing PostgreSQL and pgAdmin**:
     For macOS users, I recommend obtaining Postgres.app, an open source macOS application that includes PostgreSQL as well as the PostGIS extension and a few other goodies. Separately, you’ll need to install the pgAdmin GUI and the Python language for use in functions.

     Installing Postgres.app and pgAdmin
     
     Follow these steps:

     1. Visit https://postgresapp.com/ and download the latest release of the app. This will be a Disk Image file that ends in .dmg.

     2. Double-click the .dmg file to open it, and then drag and drop the app icon into your Applications folder.

     3. In your Applications folder, double-click the app icon to launch Postgres.app. (If you see a dialog that says the app cannot be opened because the developer cannot be verified, click Cancel. Then right-click the app icon and choose Open.) When Postgres.app opens, click Initialize to create and start a PostgreSQL database server.
     
     A small elephant icon will appear in your menu bar to indicate that you now have a database running. To set up the included PostgreSQL command line tools so you’re able to use them in future, open your Terminal application and run the following single line of code at the prompt (you can copy the code as a single line from the Postgres.app site at https://postgresapp.com/documentation/install.html):

     ```
     sudo mkdir -p /etc/paths.d && 
     echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp
     ```

     You may be prompted for the password you use to log in to your Mac. Enter that. The commands should execute without providing any output.

     Next, because Postgres.app doesn’t include pgAdmin, follow these steps to install pgAdmin:

     1. Visit the pgAdmin site’s page for macOS downloads at
        https://www.pgadmin.org/download/pgadmin-4-macos/.
     2. Select the latest version and download the installer (look for a Disk Image file that ends in .dmg).
     3. Double-click the .dmg file, click through the prompt to accept the terms, and then drag pgAdmin’s elephant app icon into your Applications folder.

- **Installing Python**:

     1. Visit the official Python site at https://www.python.org/ and click the Downloads menu.
     2. In the list of releases, find and download the latest version of Python 3.9. Choose the appropriate installer for your Mac’s processor—an Intel chip on older Macs or Apple Silicon for newer models. The download is an Apple software package file that ends in .pkg.
     3. Double-click the package file to install Python, clicking through license agreements. Close the installer when finished.

- **Working with pgAdmin**:
     Setup the pgAdmin, an administration and management tool for PostgreSQL. The pgAdmin software is free, it’s a full-featured tool as powerful as paid tools such as Microsoft’s SQL Server Management Studio. With pgAdmin, you get a graphical interface where you can configure multiple aspects of your PostgreSQL server and databases, and—most appropriately for a SQL query tool for writing, running, and saving queries.
    
    - Launching pgAdmin and Setting a Master Password
    - macOS: Click the pgAdmin icon in your Applications folder, making sure you’ve also launched Postgres.app.
    - On macOS, when you launch pgAdmin the first time, a dialog might appear that displays “pgAdmin4.app can’t be opened because it is from an      unidentified developer.” Right-click the icon and click Open. The next dialog should give you the option to open the app; going forward, your Mac will remember you’ve granted this permission.

    !(https://github.com/shivamjhads/sql/blob/main/sql-practical/Week-01/01.png)

- **Connecting to the Default postgres Database**:

    PostgreSQL is a database management system, which means it’s software that allows you to define, manage, and query databases. When you installed PostgreSQL, it created a database server—an instance of the application running on your computer—that includes a default database called postgres. A database is a collection of objects that includes tables, functions, and much more, and this is where your actual data will lie. We use the SQL language (as well as pgAdmin) to manage objects and data stored in the database.

    Let’s connect to the default postgres database to explore pgAdmin. Use the following steps:

    1. In the object browser, click the downward-pointing arrow to the left of the Servers node to show the default server. Depending on your operating system, the default server name could be localhost or PostgreSQL x, where x is the Postgres version number.
    2. Double-click the server name. If prompted, enter the database password you chose during installation (you can choose to save the password so you don’t need type it in the future). A brief message appears while pgAdmin is establishing a connection. When you’re connected, several new object items should display under the server name.
    3. Expand Databases and then expand the default database postgres.
    4. Under postgres, expand the Schemas object, and then expand public.

    !(https://github.com/shivamjhads/sql/blob/main/sql-practical/Week-01/02.png)

  ***NOTE*** 
    If pgAdmin doesn’t show a default under Servers, you’ll need to add it. Right-click Servers, and click Create▶Server. In the dialog, type a name for your server in the General tab. On the Connection tab, in the Host name/address box, enter localhost. Fill in your username and the password you supplied when installing PostgreSQL and then click Save. You should now see your server listed.
    