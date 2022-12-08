
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
(4,'Home',	'yearly',	"$1,000,000"),
(5,'Home',	'6-month',	"$100,000 "),
(6,'Home',	'6-month',	"$250,000 "),
(7,'Home',	'6-month',	"$500,000 "),
(8,'Home',	'6-month',	"$1,000,000"),
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

-- Question 1.
select * 
from policy;

-- Write the SQL command to change client Chris Isaac to Chris Pearson:
UPDATE client
SET client_name = 'Chris Pearson'
WHERE client_name = 'Chris Isaac';

-- Write the SQL command to display all policies that have a policy type of 'Home'
select * 
from policy
where policyType like 'Home';

-- Write the SQL command to display all columns for policies that have yearly terms
select * 
from policy
where policyTerm like 'Yearly';

-- Write the SQL command that displays the client name, address, and age sorted by age in descending order in the figure below
select
client_name,
client_address,
client_age
from client
order by client_age desc;

-- Write the SQL command that calculates the average age of all clients:
select 
avg(client_age)
from client;

-- Write the SQL command that lists the name and age of clients who are between the ages of 22 and 40
select 
client_name,
client_age
from client
where client_age between 22 and 40;

-- Write the SQL command that lists all home policies that have a policy limit under $250,000.
select * 
from policy
where trim(policyLimits) > '$1,000,000' and trim(policyLimits) <= ('$250,000')
and policyType = 'Home';

-- lists the client's name and address for all addresses that contain 'Featherstone' and order by age in ascending order
select
client_name,
client_address,
client_age
from client
where client_address like '%Featherstone%' 
order by client_age;

-- lists the name, address, and age of clients who are age 35 and above and whose address contains the number 8
select 
client_name,
client_address,
client_age
from client
where client_age >= 35 and client_address like '%8%';

-- Write the SQL command that returns the total # of policies offered
select count(*)
from policy;

-- Write the SQL command that returns the policy type and the total count of policies by type
select 
policyType,
count(*) as count_of_policies
from policy
group by policyType;

--  Write the SQL command that returns the youngest and oldest client
select 
client_name,
client_age
from 
client
where client_age = 
	(select 
	min(client_age) as min_age
	from client)
    OR
     client_age = 
	(select 
	max(client_age) as min_age
	from client);
    
select 
min(client_age) as youngest_client,
max(client_age) as oldest_client
from client;

-- Write the SQL command that lists all clients that have a home insurance policy:
select 
a.*,
c.*
from client as a
inner join policy_list b
on a.clientID = b.CLIENT_clientID
inner join policy c 
on b.POLICY_policyID = c.policyID
where policyType = 'Home';

-- Write the SQL command that lists all of the instances of a policy where the client ID is equal to #2
select 
a.*,
c.*
from client as a
inner join policy_list b
on a.clientID = b.CLIENT_clientID
inner join policy c 
on b.POLICY_policyID = c.policyID
where a.clientID = 2;


-- List all clients along with their respective policies
select 
a.*,
c.*
from client as a
left join policy_list b
on a.clientID = b.CLIENT_clientID
inner join policy c 
on b.POLICY_policyID = c.policyID;



