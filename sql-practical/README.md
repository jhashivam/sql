# SQL with Data Storytelling
### Learn SQL with Data Storytelling

## Which Database does we used?

We use [PostgreSQL](https://www.postgresql.org), which is free and open source. PostgreSQL is used by some of the world's largest companies. Its SQL syntax adheres closely to the ANSI SQL standard, and the concepts you learn will apply to most database management systems, including MySQL, Oracle, SQLite, and others. Note that Microsoft SQL Server employs a variant of SQL called T-SQL, which is not covered by Practical SQL.

## What's In This Repository?

**Code**: All the SQL statements and command-line listings used is organized by Week folders.

**Data**: CSV and JSON files plus GIS shapefiles to import, also organized by Week. **NOTE!** See the warning below about opening CSV files with Excel or text editors in the section on Getting the Code and Data.

**Exercises**: The "Try It Yourself" questions and answers for each Week, listed separately. Try working through the questions before peeking at the answers.

**Software Installation Updates**: Over time, the instructions for installing PostgreSQL and additional components may change. You'll find updates noted at [software-installation-updates.md](https://github.com/shivamjhads/sql/blob/main/sql-practical/software-installation-updates.md).


## What's Covered in Each Week?

* Week 1: Setting Up Your Coding Environment
* Week 2: Creating Your First Database and Table
* Week 3: Beginning Data Exploration with SELECT
* Week 4: Understanding Data Types
* Week 5: Importing and Exporting Data
* Week 6: Basic Math and Stats with SQL
* Week 7: Joining Tables in a Relational Database
* Week 8: Table Design That Works for You
* Week 9: Extracting Information by Grouping and Summarizing
* Week 10: Inspecting and Modifying Data
* Week 11: Statistical Functions In SQL
* Week 12: Working With Dates and Times
* Week 13: Advanced Query Techniques
* Week 14: Mining Text to Find Meaningful Data
* Week 15: Analyzing Spatial Data with PostGIS
* Week 16: Working With JSON Data
* Week 17: Saving Time with Views, Functions, and Triggers
* Week 18: Using PostgreSQL from the Command Line
* Week 19: Maintaining Your Database
* Week 20: Telling Your Data's Story
* Appendix: Additional PostgreSQL Resources

## How Do I Get the Code and Data?

**Non-GitHub Users**

You can obtain all the code and data at once by downloading this repository as a .zip file. To do that:

* Click the **Code** button at top right.
* Click **Download ZIP**
* Unzip the file on your computer. Place it in a directory that's easy to remember so you can reference it during the exercises that include importing data to PostgreSQL.
* For additional instructions, please read Week 1 in the book.

**Warning about CSV files!**: Opening CSV files with Excel could lead to data loss. Excel will remove leading zeros from numbers that are intended to be stored as text, such as ZIP codes. To view the contents of a CSV file, only do so with a plain-text editor and be careful not to save the file in an encoding other than UTF-8.