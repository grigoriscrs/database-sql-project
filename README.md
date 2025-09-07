\# Job Application Management System



This repository contains a robust MySQL database project designed to manage a job application and evaluation process. It includes the database schema, data insertion scripts, and a suite of stored procedures, functions, and triggers to handle various application management tasks, from evaluating candidates to generating historical reports and logging all changes.



\## Project Structure



The project is organized into several key SQL files, each serving a specific purpose:



\* \*\*`create.sql`\*\*: Defines the database schema, including tables for `companies`, `users`, `evaluators`, `employees`, `job` listings, `applications`, and more. It establishes all the necessary relationships and constraints.



\* \*\*`insertfinal.sql`\*\*: Populates the database with sample data for demonstration and testing purposes.



\* \*\*`applicationstriggers.sql`\*\*: Contains triggers that enforce business rules on the `applications` table. These include checks for submission deadlines, the number of active applications per candidate, and restrictions on cancelling an application.



\* \*\*`triggerslog.sql`\*\*: A comprehensive set of triggers that automatically log `INSERT`, `UPDATE`, and `DELETE` actions on key tables like `job`, `user`, and `degree` into a central `log` table.



\* \*\*`manage\_application.sql`\*\*: A stored procedure that handles the creation, activation, and cancellation of job applications. It's the central point for managing the lifecycle of an application.



\* \*\*`calculategrade.sql`\*\*: A stored function that calculates a candidate's score based on their degrees, foreign languages, and projects.



\* \*\*`evaluate.sql`\*\*: A stored procedure that automates the evaluation process. It uses the `calculategrade.sql` function to determine a score for a candidate and stores the evaluation details.



\* \*\*`applicationwinner.sql`\*\*: A stored procedure to determine the winner of a job position by calculating the average evaluation score for all candidates and selecting the highest-scoring one.



\* \*\*`applicationbyeval.sql`\*\*: A stored procedure to retrieve all applications that have been evaluated by a specific evaluator.



\* \*\*`generate\_history.sql`\*\*: A stored procedure to generate a large amount of historical application data for performance testing and reporting.



\* \*\*`historybyrange.sql`\*\*: A stored procedure to retrieve application history based on a score range, allowing for focused reporting.



\* \*\*`evaluation\_stored.sql`\*\*: A stored procedure to get the evaluation grade for a specific application.



\## Key Features



\* \*\*Relational Database Design\*\*: The schema is designed to be highly normalized, ensuring data integrity and efficiency.



\* \*\*Automated Evaluation\*\*: The project uses stored procedures and functions to automate complex logic, such as candidate scoring and evaluation averaging.



\* \*\*Data Integrity and Auditing\*\*: Triggers are used to enforce critical business rules and log all data modifications, ensuring a secure and auditable system.



\* \*\*Application Lifecycle Management\*\*: A single procedure manages the entire lifecycle of a job application, from creation to cancellation or selection.



\* \*\*Comprehensive Reporting\*\*: The system includes functions for generating reports on application history, evaluator performance, and more.



\* \*\*Sample Data\*\*: The `insertfinal.sql` script provides a ready-to-use dataset, making it easy to test and demonstrate the functionality.



\## Usage



To use this project, simply execute the SQL files in the following order:



1\. \*\*`create.sql`\*\*: To create the database and all its tables.



2\. \*\*`insertfinal.sql`\*\*: To populate the database with sample data.



3\. Execute the other `.sql` files to create the stored procedures, functions, and triggers.



Once set up, you can call the stored procedures and functions to interact with the database and see the system in action.

