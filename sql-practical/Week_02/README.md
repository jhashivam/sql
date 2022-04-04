## Week 2: Create My First Database and Table

***SQL is more than just a means for extracting knowledge from data. It’s also a language for defining the structures that hold data so we can organize relationships in the data***

CREATE DATABASE AND TABLE

> A table is a grid of rows and columns that store data. Each row holds a collection of columns, and each column contains data of a specified type: most commonly, numbers, characters, and dates. We use SQL to define the structure of a table and how each table might relate to other tables in the database. We also use SQL to extract, or query, data from tables.

We will create our first database, add a table, and then insert several rows of data into the table using SQL in the pgAdmin interface. Then, you’ll use pgAdmin to view the results. Let’s start with a look at tables.

### Understanding Tables

Knowing tables is fundamental to understanding the data in your database. Whenever we start working with a fresh database, the first thing I do is look at the tables within. I look for clues in the table names and their column structure. Do the tables contain text, numbers, or both? How many rows are in each table?

Next, I look at how many tables are in the database. The simplest database might have a single table. A full-bore application that handles customer data or tracks air travel might have dozens or hundreds. The number of tables tells me not only how much data I will need to analyze, but also hints that I should explore relationships among the data in each table.

> let’s look at an example of what the contents of tables might look like. We will use a hypothetical database for managing a school’s class enrollment; within that database are several tables that track students and their classes. The first table, called `student_enrollment`, shows the students that are signed up for each class section:

| student_id | class_id   | class_section | semester |
| ---------- | ---------- | ------------- | ---------|
| CHRISPA004 | COMPSCI101 |  3            | Fall 2023 |
| DAVISHE010 | COMPSCI101 |  3            | Fall 2023 |
| ABRILDA002 | ENG101     |  40           | Fall 2023 |
| DAVISHE010 | ENG101     |  40           | Fall 2023 |
| RILEYPH002 | ENG101     |  40           | Fall 2023 |

This table shows that two students have signed up for COMPSCI101, and three have signed up for ENG101. But where are the details about each student and class? In this example, these details are stored in separate tables called students and classes, and those tables relate to this one. This is where the power of a relational database begins to show itself.

The first several rows of the students table include the following:

student_id    first_name    last_name    dob
----------    ----------    ---------    ----------
ABRILDA002    Abril         Davis        2005-01-10
CHRISPA004    Chris         Park         1999-04-10
DAVISHE010    Davis         Hernandez    2006-09-14
RILEYPH002    Riley         Phelps       2005-06-15
The students table contains details on each student, using the value in the student_id column to identify each one. That value acts as a unique key that connects both tables, giving you the ability to create rows such as the following with the class_id column from student_enrollment and the first_name and last_name columns from students:

class_id      first_name    last_name
----------    ----------    ---------
COMPSCI101    Davis         Hernandez
COMPSCI101    Chris         Park
ENG101        Abril         Davis
ENG101        Davis         Hernandez
ENG101        Riley         Phelps
The classes table would work the same way, with a class_id column and several columns of detail about the class. Database builders prefer to organize data using separate tables for each main entity the database manages in order to reduce redundant data. In the example, we store each student’s name and date of birth just once. Even if the student signs up for multiple classes—as Davis Hernandez did—we don’t waste database space entering his name next to each class in the student_enrollment table. We just include his student ID.

Given that tables are a core building block of every database, in this chapter you’ll start your SQL coding adventure by creating a table inside a new database. Then you’ll load data into the table and view the completed table.

Creating a Database
The PostgreSQL program you installed in Chapter 1 is a database management system, a software package that allows you to define, manage, and query data stored in databases. A database is a collection of objects that includes tables, functions, and much more. When you installed PostgreSQL, it created a database server—an instance of the application running on your computer—that includes a default database called postgres.

According to the PostgreSQL documentation, the default postgres database is “meant for use by users, utilities and third-party applications” (see https://www.postgresql.org/docs/current/app-initdb.html). We’ll create a new database to use for the examples in the book rather than use the default, so we can keep objects related to a particular topic or application organized together. This is good practice: it helps avoid a pileup of tables in a single database that have no relation to each other, and it ensures that if your data will be used to power an application, such as a mobile app, then the app database will contain only relevant information.

To create a database, you need just one line of SQL, shown in Listing 2-1, which we’ll run in a moment using pgAdmin. You can find this code, along with all the examples in this book, in the files you downloaded from GitHub via the link at https://www.nostarch.com/practical-sql-2nd-edition/.

CREATE DATABASE analysis;
Listing 2-1: Creating a database named analysis

This statement creates a database named analysis on your server using default PostgreSQL settings. Note that the code consists of two keywords—CREATE and DATABASE—followed by the name of the new database. You end the statement with a semicolon, which signals the end of the command. You must end all PostgreSQL statements with a semicolon, as part of the ANSI SQL standard. In some circumstances your queries will work even if you omit the semicolon, but not always, so using the semicolon is a good habit to form.

Executing SQL in pgAdmin
In Chapter 1, you installed the graphical administrative tool pgAdmin (if you didn’t, go ahead and do that now). For much of our work, you’ll use pgAdmin to run the SQL statements you write, known as executing the code. Later in the book in Chapter 18, I’ll show you how to run SQL statements in a terminal window using the PostgreSQL command line program psql, but getting started is a bit easier with a graphical interface.

We’ll use pgAdmin to run the SQL statement in Listing 2-1 that creates the database. Then, we’ll connect to the new database and create a table. Follow these steps:

Run PostgreSQL. If you’re using Windows, the installer sets PostgreSQL to launch every time you boot up. On macOS, you must double-click Postgres.app in your Applications folder (if you have an elephant icon in your menu bar, it’s already running).
Launch pgAdmin. You’ll be prompted to enter the master password for pgAdmin you set the first time you launched the application.
As you did in Chapter 1, in the left vertical pane (the object browser) click the arrow to the left of the Servers node to show the default server. Depending on how you installed PostgreSQL, the default server may be named localhost or PostgreSQL x, where x is the version of the application. You may receive another password prompt. This prompt is for PostgreSQL, not pgAdmin, so enter the password you set for PostgreSQL during installation. You should see a brief message that pgAdmin is establishing a connection.
In pgAdmin’s object browser, expand Databases and click postgres once to highlight it, as shown in Figure 2-1.

Figure 2-1: The default postgres database

Open the Query Tool by choosing Tools▶Query Tool.
In the Query Editor pane (the top horizontal pane), enter the code from Listing 2-1.
Click the Execute/Refresh icon (shaped like a right arrow) to execute the statement. PostgreSQL creates the database, and in the Output pane in the Query Tool under Messages you’ll see a notice indicating the query returned successfully, as shown in Figure 2-2.

Figure 2-2: Creating a database named analysis

To see your new database, right-click Databases in the object browser. From the pop-up menu, select Refresh, and the analysis database will appear in the list, as shown in Figure 2-3.

Figure 2-3: The analysis database displayed in the object browser

Good work! You now have a database called analysis, which you can use for the majority of the exercises in this book. In your own work, it’s generally a best practice to create a new database for each project to keep tables with related data together.

NOTE
Instead of entering the code from the listings, you can open the files you downloaded from GitHub in pgAdmin and run listings individually by highlighting a listing and clicking Execute/Refresh. To open a file, in the Query Tool click the Open File icon and navigate to the place where you saved the code.

Connecting to the analysis Database
Before you create a table, you must ensure that pgAdmin is connected to the analysis database rather than to the default postgres database.

To do that, follow these steps:

Close the Query Tool by clicking the X at the far right of the tool pane. You don’t need to save the file when prompted.
In the object browser, click analysis once.
Open a new Query Tool window, this time connected to the analysis database, by choosing Tools▶Query Tool.
You should now see the label analysis/postgres@localhost at the top of the Query Tool window. (Again, instead of localhost, your version may show PostgreSQL.)
Now, any code you execute will apply to the analysis database.

Creating a Table
As I mentioned, tables are where data lives and its relationships are defined. When you create a table, you assign a name to each column (sometimes referred to as a field or attribute) and assign each column a data type. These are the values the column will accept—such as text, integers, decimals, and dates—and the definition of the data type is one way SQL enforces the integrity of data. For example, a column defined as date will accept data in only one of several standard formats, such as YYYY-MM-DD. If you try to enter characters not in a date format, for instance, the word peach, you’ll receive an error.

Data stored in a table can be accessed and analyzed, or queried, with SQL statements. You can sort, edit, and view the data, as well as easily alter the table later if your needs change.

Let’s make a table in the analysis database.

Using the CREATE TABLE Statement
For this exercise, we’ll use an often-discussed piece of data: teacher salaries. Listing 2-2 shows the SQL statement to create a table called teachers. Let’s review the code before you enter it into pgAdmin and execute it.

1 CREATE TABLE teachers (
  2 id bigserial,
  3 first_name varchar(25),
    last_name varchar(50),
    school varchar(50),
  4 hire_date date,
  5 salary numeric
6 );
Listing 2-2: Creating a table named teachers with six columns

This table definition is far from comprehensive. For example, it’s missing several constraints that would ensure that columns that must be filled do indeed have data or that we’re not inadvertently entering duplicate values. I cover constraints in detail in Chapter 8, but in these early chapters I’m omitting them to focus on getting you started on exploring data.

The code begins with the two SQL keywords CREATE and TABLE 1 that, together with the name teachers, signal PostgreSQL that the next bit of code describes a table to add to the database. Following an opening parenthesis, the statement includes a comma-separated list of column names along with their data types. For style purposes, each new line of code is on its own line and indented four spaces, which isn’t required but makes the code more readable.

Each column name represents one discrete data element defined by a data type. The id column 2 is of data type bigserial, a special integer type that auto-increments every time you add a row to the table. The first row receives the value of 1 in the id column, the second row 2, and so on. The bigserial data type and other serial types are PostgreSQL-specific implementations, but most database systems have a similar feature.

Next, we create columns for the teacher’s first name and last name and for the school where they teach 3. Each is of the data type varchar, a text column with a maximum length specified by the number in parentheses. We’re assuming that no one in the database will have a last name of more than 50 characters. Although this is a safe assumption, you’ll discover over time that exceptions will always surprise you.

The teacher’s hire_date 4 is set to the data type date, and the salary column 5 is numeric. I’ll cover data types more thoroughly in Chapter 4, but this table shows some common examples of data types. The code block wraps up 6 with a closing parenthesis and a semicolon.

Now that you have a sense of how SQL looks, let’s run this code in pgAdmin.

Making the teachers Table
You have your code and you’re connected to the database, so you can make the table using the same steps we did when we created the database:

Open the pgAdmin Query Tool (if it’s not open, click analysis once in pgAdmin’s object browser, and then choose Tools▶Query Tool).
Copy the CREATE TABLE script from Listing 2-2 into the SQL Editor (or highlight the listing if you’ve elected to open the Chapter_02.sql file from GitHub with the Query Tool).
Execute the script by clicking the Execute/Refresh icon (shaped like a right arrow).
If all goes well, you’ll see a message in the pgAdmin Query Tool’s bottom output pane that reads Query returned successfully with no result in 84 msec. Of course, the number of milliseconds will vary depending on your system.

Now, find the table you created. Go back to the main pgAdmin window and, in the object browser, right-click analysis and choose Refresh. Choose Schemas▶public▶Tables to see your new table, as shown in Figure 2-4.


Figure 2-4: The teachers table in the object browser

Expand the teachers table node by clicking the arrow to the left of its name. This reveals more details about the table, including the column names, as shown in Figure 2-5. Other information appears as well, such as indexes, triggers, and constraints, but I’ll cover those in later chapters. Clicking the table name and then selecting the SQL menu in the pgAdmin workspace will display SQL statements that would be used to re-create the teachers table (note that this display includes additional default notations that were implicitly added when you created the table).


Figure 2-5: Table details for teachers

Congratulations! So far, you’ve built a database and added a table to it. The next step is to add data to the table so you can write your first query.

Inserting Rows into a Table
You can add data to a PostgreSQL table in several ways. Often, you’ll work with a large number of rows, so the easiest method is to import data from a text file or another database directly into a table. But to get started, we’ll add a few rows using an INSERT INTO ... VALUES statement that specifies the target columns and the data values. Then we’ll view the data in its new home.

Using the INSERT Statement
To insert some data into the table, you first need to erase the CREATE TABLE statement you just ran. Then, following the same steps you did to create the database and table, copy the code in Listing 2-3 into your pgAdmin Query Tool (or, if you opened the Chapter_02.sql file from GitHub in the Query Tool, highlight this listing).

1 INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
2 VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);3
Listing 2-3: Inserting data into the teachers table

This code block inserts names and data for six teachers. Here, the PostgreSQL syntax follows the ANSI SQL standard: after the INSERT INTO keywords is the name of the table, and in parentheses are the columns to be filled 1. In the next row are the VALUES keyword and the data to insert into each column in each row 2. You need to enclose the data for each row in a set of parentheses, and inside each set of parentheses, use a comma to separate each column value. The order of the values must also match the order of the columns specified after the table name. Each row of data ends with a comma, except the last row, which ends the entire statement with a semicolon 3.

Notice that certain values that we’re inserting are enclosed in single quotes, but some are not. This is a standard SQL requirement. Text and dates require quotes; numbers, including integers and decimals, don’t require quotes. I’ll highlight this requirement as it comes up in examples. Also, note the date format we’re using: a four-digit year is followed by the month and date, and each part is joined by a hyphen. This is the international standard for date formats; using it will help you avoid confusion. (Why is it best to use the format YYYY-MM-DD? Check out https://xkcd.com/1179/ to see a great comic about it.) PostgreSQL supports many additional date formats, and I’ll use several in examples.

You might be wondering about the id column, which is the first column in the table. When you created the table, your script specified that column to be the bigserial data type. So as PostgreSQL inserts each row, it automatically fills the id column with an auto-incrementing integer. I’ll cover that in detail in Chapter 4 when I discuss data types.

Now, run the code. This time, the message area of the Query Tool should say this:

INSERT 0 6
Query returned successfully in 150 msec.
The last of the two numbers after the INSERT keyword reports the number of rows inserted: 6. The first number is an unused legacy PostgreSQL value that is returned only to maintain wire protocol; you can safely ignore it.

Viewing the Data
You can take a quick look at the data you just loaded into the teachers table using pgAdmin. In the object browser, locate the table and right-click. In the pop-up menu, choose View/Edit Data▶All Rows. As Figure 2-6 shows, you’ll see the six rows of data in the table with each column filled by the values in the SQL statement.


Figure 2-6: Viewing table data directly in pgAdmin

Notice that even though you didn’t insert a value for the id column, each teacher has an ID number assigned. Also, each column header displays the data type you defined when creating the table. (Note that in this example, varchar, fully expanded in PostgreSQL, is character varying.) Seeing the data type in the results will help later when you decide how to write queries that handle data differently depending on its type.

You can view data using the pgAdmin interface in a few ways, but we’ll focus on writing SQL to handle those tasks.

Getting Help When Code Goes Bad
There may be a universe where code always works, but unfortunately, we haven’t invented a machine capable of transporting us there. Errors happen. Whether you make a typo or mix up the order of operations, computer languages are unforgiving about syntax. For example, if you forget a comma in the code in Listing 2-3, PostgreSQL squawks back an error:

ERROR:  syntax error at or near "("
LINE 4:     ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43...
            ^
Fortunately, the error message hints at what’s wrong and where: we made a syntax error near an open parenthesis on line 4. But sometimes error messages can be more obscure. In that case, you do what the best coders do: a quick internet search for the error message. Most likely, someone else has experienced the same issue and might know the answer. I’ve found that I get the best search results by entering the error message verbatim in the search engine, specifying the name of my database manager, and limiting results to more recent items to avoid using outdated information.

Formatting SQL for Readability
SQL requires no special formatting to run, so you’re free to use your own psychedelic style of uppercase, lowercase, and random indentations. But that won’t win you any friends when others need to work with your code (and sooner or later someone will). For the sake of readability and being a good coder, here are several generally accepted conventions:

Uppercase SQL keywords, such as SELECT. Some SQL coders also uppercase the names of data types, such as TEXT and INTEGER. I use lowercase characters for data types in this book to separate them in your mind from keywords, but you can uppercase them if desired.
Avoid camel case and instead use lowercase_and_underscores for object names, such as tables and column names (see more details about case in Chapter 8).
Indent clauses and code blocks for readability using either two or four spaces. Some coders prefer tabs to spaces; use whichever works best for you or your organization.
We’ll explore other SQL coding conventions as we go through the book, but these are the basics.

Wrapping Up
You accomplished quite a bit in this chapter: you created a database and a table and then loaded data into it. You’re on your way to adding SQL to your data analysis toolkit! In the next chapter, you’ll use this set of teacher data to learn the basics of querying a table using SELECT.

TRY IT YOURSELF
Here are two exercises to help you explore concepts related to databases, tables, and data relationships:

Imagine you’re building a database to catalog all the animals at your local zoo. You want one table to track the kinds of animals in the collection and another table to track the specifics on each animal. Write CREATE TABLE statements for each table that include some of the columns you need. Why did you include the columns you chose?
Now create INSERT statements to load sample data into the tables. How can you view the data via the pgAdmin tool? Create an additional INSERT statement for one of your tables. Purposely omit one of the required commas separating the entries in the VALUES clause of the query. What is the error message? Would it help you find the error in the code?
Solutions to all exercises are available in the Try_It_Yourself.sql file included with the book’s resources.