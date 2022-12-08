# Lab 3 - SQL Practice in MySQL Workbench
This lab will meet the following objectives:

1.  Write SQL commands to create database objects such as tables, indexes, and views as well as commands to define access rights to those database objects.

2.  Write SQL commands to insert, update, delete, and retrieve data within the database tables.

## Instructions
For this lab, you will practice writing SQL commands that create tables, insert, delete, update and retrieve data.  Using the ER model below, you will re-create the model in MySQL workbench and insert the data found in the provided text files of this repository.  

![alt text](https://instructorc.github.io/site/slides/database/images/general/table_view.PNG)

You will record your relationships within this readme file.  When writing down the relationships, make sure to adhere to the following bullet points below.


## Requirements

### Deliverable 1 - Data Definition Language (5 Points)
1 Recreate the database schema identified above.  You can do this one of two ways.  You can use the Modeling tool in Workbench or you can write the SQL commands to create the database and related tables.  Whether you create the database schema using the database modeling tool in MySQL workbench or you create via command line, you will need to provide the commands used to create the database and related tables.  You can include those commands within the file you will use for deliverable 2.  
  1. Make sure all of the relationships are properly configured
  2. Make sure the primary key is specified and auto increments for both the **CLIENT** and **POLICY** table
  3. Make sure all columns in the database are marked as NOT NULL
  4. Enforce that the relationship between **CLIENT** and **POLICY** are strong and enforce cascading if either a **CLIENT** or **POLICY** is deleted.
  5. Include the SQL commands used for creating the database and tables into the file you will use for deliverable 2.
  
Code:

insert into client (clientID, client_name, client_address, client_age)
values
(1, 'James Clark',	'1001 Plymouth Ave',	38),
(2, 'Leah Nicole',	'2401 Chicago Ave. #212',	36),
(3, 'Silas Alexander',	'5012 Humboldt Lane',	22),
(4,'Noah Charles',	'501 College Ave.',	25),
(5,'Chris Isaac',	"228 e, 149th st.",	37),
(6,'Noah Charles',	'501 College Ave.',	25),
(7,'Brittney Owens',	'321 Thursday Ave.', 42),
(8,'Kurt Douglas',	'123 Mt. Glenwood',	58),
(9,'Areta Farries',	'789 Touy Ave.', 62),
(10,'Jessica Daniel',	'698 Featherstone',	47),
(11,'Gary Moore',	'698 Featherstone',	48),
(12,'Elnora Daniel',	'698 Featherstone',	61),
(13,'Daniel Moore',	'698 Featherstone',	22),
(14,'Cheryl Pearson',	"228 e, 149th st.",	67);

insert into policy (policyID, policyType, policyTerm, policyLimits)
VALUES
(1,'Home',	'yearly',	"$100,000 "),
(2,'Home',	'yearly',	"$250,000 "),
(3,'Home',	'yearly',	"$500,000 "),
(4,'Home',	'yearly',	"$1,000,000 "),
(5,'Home',	'6-month',	"$100,000 "),
(6,'Home',	'6-month',	"$250,000 "),
(7,'Home',	'6-month',	"$500,000 "),
(8,'Home',	'6-month',	"$1,000,000 "),
(9,'Car',	'yearly',	"$60,000 "),
(10,'Car',	'yearly',	"$120,000 "),
(11,'Car',	'6-month',	"$60,000 "),
(12,'Car',	'6-month',	"$120,000 ");

insert into policy_list (CLIENT_clientID, POLICY_policyID)
VALUES
(2,	1),
(9,1),
(13,1),
(2,	4),
(5,	4),
(8,	5),
(14,6),
(11,7),
(1,	8),
(3,	8),
(7,	9),
(1,	10),
(3,	10),
(7,	10),
(10,10),
(6,	11),
(4,	12);

Code to create tables:
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `clientID` INT NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(55) NOT NULL,
  `client_address` VARCHAR(55) NOT NULL,
  `client_age` INT NOT NULL,
  PRIMARY KEY (`clientID`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mydb`.`policy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`policy` (
  `policyID` INT NOT NULL AUTO_INCREMENT,
  `policyType` VARCHAR(55) NOT NULL,
  `policyTerm` VARCHAR(45) NOT NULL,
  `policyLimits` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`policyID`))
ENGINE = InnoDB;
-- ----------------------------------------------------
-- Table `mydb`.`policy_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`policy_list` (
  `CLIENT_clientID` INT NOT NULL,
  `POLICY_policyID` INT NOT NULL,
  PRIMARY KEY (`CLIENT_clientID`, `POLICY_policyID`),
  INDEX `policyID_idx` (`POLICY_policyID` ASC) VISIBLE,
  CONSTRAINT `clientID`
    FOREIGN KEY (`CLIENT_clientID`)
    REFERENCES `mydb`.`client` (`clientID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `policyID`
    FOREIGN KEY (`POLICY_policyID`)
    REFERENCES `mydb`.`policy` (`policyID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


### Deliverable 2 - Data Manipulation Language (10 Points)
Create a file called **lab3.sql** and add the following queries into the file.  
You will need to take a screenshot of the rendered output for each command and place a screenshot of your output beneath the example output provided.  
Make sure to place a SQL comment above each command identifying the query. 
In order to make changes to the data, you may need to change the SQL Editor settings.  
You can do this by navigating to EDIT -> SQL Editor -> and unchecking Safe Updates.  It is advised to restart MySQL Workbench after changing this setting.
<br>First, write the SQL commands to insert data into each of the tables. Your insert statements should also be included in the lab2.sql file.  **The data files are listed in the repository for this lab**
1.  Write the SQL command to list all clients and all the columns pertaining to a client.  The intended output is below.
<img src="https://instructorc.github.io/site/slides/database/images/lab3/1.PNG" width="350" alt="output query 1"/>
![image](https://user-images.githubusercontent.com/117416920/206367784-aebce551-a813-4dbf-b0c7-01cf43e2c715.png)


2.  Write the SQL command to change client Chris Isaac to Chris Pearson.  No output for this command


3.  Write the SQL command to display all policies that have a policy type of 'Home'.
<img src="https://instructorc.github.io/site/slides/database/images/lab3/3.PNG" width="300" alt="output query 3"/>

![image](https://user-images.githubusercontent.com/117416920/206369546-9638dba8-8620-4602-9910-6717c862cc5c.png)


4.  Write the SQL command to display all columns for policies that have yearly terms
<img src="https://instructorc.github.io/site/slides/database/images/lab3/4.PNG" width="300" alt="output query 4"/>

![image](https://user-images.githubusercontent.com/117416920/206369686-5e3e31c3-1fa2-4cf2-a856-ec1e038ae39d.png)


5.  Write the SQL command that displays the client name, address, and age sorted by age in descending order in the figure below
<img src="https://instructorc.github.io/site/slides/database/images/lab3/5.PNG" width="300" alt="output query 5"/>

![image](https://user-images.githubusercontent.com/117416920/206369924-5e24988d-7334-42e4-b18f-6b083d5faaa9.png)

6.  Write the SQL command that calculates the average age of all clients
<img src="https://instructorc.github.io/site/slides/database/images/lab3/6.PNG" width="90" alt="output query 6"/>

![image](https://user-images.githubusercontent.com/117416920/206370131-946d0d93-ac70-472b-a68c-3b56c13367a8.png)


7.  Write the SQL command that lists the name and age of clients who are between the ages of 22 and 40
<img src="https://instructorc.github.io/site/slides/database/images/lab3/7.PNG" width="180" alt="output query 7"/>

![image](https://user-images.githubusercontent.com/117416920/206370352-4c7617b0-a086-4133-b24a-76f65b1ea1ce.png)

8.  Write the SQL command that lists all home policies that have a policy limit under $250,000.
<img src="https://instructorc.github.io/site/slides/database/images/lab3/8.PNG" width="270" alt="output query 8"/>

I'm not sure why it is having trouble reading the 1,000,000$ prices:

![image](https://user-images.githubusercontent.com/117416920/206373057-592069e6-07cf-4c5f-a7bf-17ae33b4f77a.png)

9.  Write the SQL  command that lists the client's name and address for all addresses that contain 'Featherstone' and order by age in ascending order.
<img src="https://instructorc.github.io/site/slides/database/images/lab3/9.PNG" width="200" alt="output query 9"/>

![image](https://user-images.githubusercontent.com/117416920/206373570-35c2e197-ee51-4d0f-8de4-ffef824d0780.png)

10.  Write the SQL command that lists the name, address, and age of clients who are age 35 and above and whose address contains the number 8
<img src="https://instructorc.github.io/site/slides/database/images/lab3/10.PNG" width="300" alt="output query 10"/>

![image](https://user-images.githubusercontent.com/117416920/206373883-a4b667b6-e61a-4b38-8d63-a453d07c1868.png)

11.  Write the SQL command that returns the total # of policies offered
<img src="https://instructorc.github.io/site/slides/database/images/lab3/11.PNG" width="80" alt="output query 11"/>



12.  Write the SQL command that returns the policy type and the total count of policies by type
<img src="https://instructorc.github.io/site/slides/database/images/lab3/12.PNG" width="170" alt="output query 12"/>
13.  Write the SQL command that returns the youngest and oldest client
<img src="https://instructorc.github.io/site/slides/database/images/lab3/13.PNG" width="170" alt="output query 13"/>
14.  Write the SQL command that lists all clients that have a home insurance policy
<img src="https://instructorc.github.io/site/slides/database/images/lab3/14.PNG" width="450" alt="output query 14"/>
15.  Write the SQL command that lists all of the instances of a policy where the client ID is equal to #2
<img src="https://instructorc.github.io/site/slides/database/images/lab3/15.PNG" width="450" alt="output query 15"/>

### Extra Credit (2 Points)
List all clients along with their respective policies.<br>
<img src="https://instructorc.github.io/site/slides/database/images/lab3/ec.PNG" width="550" alt="output query Extra credit"/>



## Submission Guidelines

For this lab, you will submit 2 items to the repository that has been assigned to you.  The two items that you will need to submit are listed below: 
1. The README.MD file that includes screenshots of the result grid window for each SQL query
   1. Include the image beneath the output image I provide

2. The **lab3.sql** file.  The lab3.sql file should be uploaded to your repository

Once you have completed both of the items above, you will need to submit the link to your repository for lab3 prior to the due date and time listed.  Make sure you receive an email confirmation notifying you that the assignment has been submitted.


## Lab Resources
- [W3 Schools SQL tutorial](https://www.w3schools.com/sql/)
- [Make a ReadMe file Web-based Editor](https://www.makeareadme.com/)
