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


> This table shows that two students have signed up for `COMPSCI101`, and three have signed up for `ENG101`. But where are the details about each student and class? In this example, these details are stored in separate tables called `students` and `classes`, and those tables relate to this one. This is where the power of a relational database begins to show itself.

The first several rows of the `students` table include the following:

| student_id | first_name | last_name | dob |
| ---------- | ---------- | --------- | ---------- |
|ABRILDA002 | Abril | Davis | 2005-01-10 |
|CHRISPA004 | Chris | Park | 1999-04-10 |
|DAVISHE010 | Davis | Hernandez | 2006-09-14 |
|RILEYPH002 | Riley | Phelps | 2005-06-15 |


The `students` table contains details on each student, using the value in the `student_id` column to identify each one. That value acts as a unique key that connects both tables, giving you the ability to create rows such as the following with the `class_id` column from `student_enrollment` and the `first_name` and `last_name` columns from `students`:

| class_id | first_name | last_name |
| ---------- | ---------- | --------- |
| COMPSCI101 | Davis | Hernandez |
| COMPSCI101 | Chris | Park |
| ENG101 | Abril | Davis |
| ENG101 | Davis | Hernandez |
| ENG101 | Riley | Phelps |

> The `classes` table would work the same way, with a `class_id` column and several columns of detail about the class. Database builders prefer to organize data using separate tables for each main entity the database manages in order to reduce redundant data. In the example, we store each student’s name and date of birth just once. Even if the student signs up for multiple classes—as Davis Hernandez did—we don’t waste database space entering his name next to each class in the student_enrollment table. We just include his student ID.

### Creating a Database

 The PostgreSQL program is a database management system, a software package that allows you to define, manage, and query data stored in databases. A database is a collection of objects that includes tables, functions, and much more. When we installed PostgreSQL, it created a database server—an instance of the application running on our computer—that includes a default database called postgres.

According to the PostgreSQL documentation, the default postgres database is “meant for use by users, utilities and third-party applications” (see https://www.postgresql.org/docs/current/app-initdb.html). We’ll create a new database to use for the excercises.

To create a database, you need just one line of SQL, `CREATE DATABASE analysis;`  we’ll run using pgAdmin. You can find this code in [GitHub SQL Repository](https://github.com/jhashivam/sql/blob/main/sql-practical/Week_02/Week_02.sql).

```
CREATE DATABASE analysis;
```
![Creating a database named analysis](https://github.com/jhashivam/sql/blob/main/sql-practical/Week_02/05.png)

This statement creates a database named analysis on your server using default PostgreSQL settings. Note that the code consists of two keywords—CREATE and DATABASE—followed by the name of the new database. You end the statement with a semicolon, which signals the end of the command. You must end all PostgreSQL statements with a semicolon, as part of the ANSI SQL standard. In some circumstances your queries will work even if you omit the semicolon, but not always, so using the semicolon is a good habit to form.

We’ll use pgAdmin to run the SQL statement - 

- Open the Query Tool by choosing Tools▶Query Tool.
In the Query Editor pane (the top horizontal pane), enter the code from Listing 2-1.
Click the Execute/Refresh icon (shaped like a right arrow) to execute the statement. PostgreSQL creates the database, and in the Output pane in the Query Tool under Messages you’ll see a notice indicating the query returned successfully, as shown in Figure 2-2.

### Creating a Table
Tables are where data lives and its relationships are defined. When you create a table, you assign a name to each column (sometimes referred to as a field or attribute) and assign each column a data type. These are the values the column will accept—such as text, integers, decimals, and dates—and the definition of the data type is one way SQL enforces the integrity of data. For example, a column defined as date will accept data in only one of several standard formats, such as YYYY-MM-DD.

Data stored in a table can be accessed and analyzed, or queried, with SQL statements. You can sort, edit, and view the data, as well as easily alter the table later if your needs change.

Let’s make a table in the analysis database.

Using the `CREATE TABLE` Statement

For this exercise, we’ll use an often-discussed piece of data: teacher salaries. Listing 2-2 shows the SQL statement to create a table called teachers. Let’s review the code before you enter it into pgAdmin and execute it.
```
Creating a table named teachers with six columns

 CREATE TABLE teachers (
   id bigserial,
   first_name varchar(25),
   last_name varchar(50),
   school varchar(50),
   hire_date date,
   salary numeric
 );
```

> Each column name represents one discrete data element defined by a data type. The id column 2 is of data type `bigserial`, a special integer type that `auto-increments` every time you add a row to the table. The first row receives the value of 1 in the id column, the second row 2, and so on. The `bigserial` data type and other serial types are PostgreSQL-specific implementations, but most database systems have a similar feature.

> Next, we create columns for the teacher’s first name and last name and for the school where they teach 3. Each is of the data type `varchar`, a text column with a maximum length specified by the number in parentheses. We’re assuming that no one in the database will have a last name of more than 50 characters. 

> The teacher’s hire_date 4 is set to the data type `date`, and the salary column 5 is numeric.

![Creating a Table named teacher](https://github.com/jhashivam/sql/blob/main/sql-practical/Week_02/06.png)


### Insert Rows into a Table

```
INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
```


![View the data](https://github.com/jhashivam/sql/blob/main/sql-practical/Week_02/07.png)