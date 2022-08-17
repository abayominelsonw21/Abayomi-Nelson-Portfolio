use orange_database;

drop table customer_dog;
drop table Dog;
drop table Customer;
drop table Service;
drop table Employee;
drop table Location;

CREATE TABLE Location(
StoreID NCHAR(10) NOT NULL,
Address NCHAR(20),
city NCHAR(20),
state NCHAR(20),
ZipCode NCHAR(20),
PRIMARY KEY (StoreID));

INSERT INTO Location VALUES ('S001','123 Puppy Way','Baton Rouge','LA','70820');
insert INTO Location Values('S002','56 Old Jefferson Way','Praireville','LA','70769');


CREATE TABLE Employee(
EIN NCHAR(50) NOT NULL,
fName NCHAR(50),
lName NCHAR(50),
JobTitle NCHAR(50),
StoreID NCHAR(50),
BossID nchar(50),
PRIMARY KEY (EIN),
foreign key (StoreID) References location(StoreId),
foreign key(BossID) References Employee(EIN));

-- Store Managers are at the top of the list
insert into Employee values('E001','Bob','Marley','Store Manager','S001',null);
insert into Employee values('E020','Amanda','Paige','Store Manager','S002',null);

-- Assistant Mangers work direcly under the store managers
insert into Employee values('E002','Karen','Johnson','Assistant Manager','S001','E001');
insert into Employee values('E021','David','Edunds','Associate Mangaer','S002','E020');

-- Leads report directly to the Assistant Mangers
insert into Employee values('E003','Heather','James','Lead Groomer','S001','E002');
insert into Employee values('E004','Christian','Manning','Lead Trainer','S001','E002');
insert into Employee values('E005','Issac','Slater','Lead Sitter','S001','E002');
insert into Employee values('E022','Bella','Pullman','Lead Groomer','S002','E021');
insert into Employee values('E023','Jack','Knox','Lead Trainer','S002','E021');
insert into Employee values('E024','Sue','Patty','Lead Sitter','S002','E021');

-- Employees report directly to their leads
insert into Employee values('E006','Joan','Robertson','Groomer','S001','E003');
insert into Employee values('E007','Sean','Smith','Groomer','S001','E003');
insert into Employee values('E008','Jada','Williams','Groomer','S001','E003');
insert into Employee values('E009','Nick','St.Mary','Groomer','S001','E003');
insert into Employee values('E010','Jade','Washington','Groomer','S001','E003');
insert into Employee values('E011','Ceaser','Millian','Trainer','S001','E004');
insert into Employee values('E012','Isabelle','Walker','Trainer','S001','E004');
insert into Employee values('E013','Asia','Truman','Trainer','S001','E004');
insert into Employee values('E014','Isabelle','Walker','Trainer','S001','E004');
insert into Employee values('E015','Zach','Snyder','Sitter','S001','E005');
insert into Employee values('E016','Nick','James','Sitter','S001','E005');
insert into Employee values('E017','Lindsey','Whitman','Sitter','S001','E005');
insert into Employee values('E018','Jasmine','Brown','Sitter','S001','E005');
insert into Employee values('E019','Ari','Wright','Sitter','S001','E005');
insert into Employee values('E025','Sarah','Thorn','Groomer','S002','E022');
insert into Employee values('E026','Diane','Skinner','Groomer','S002','E022');
insert into Employee values('E027','Heather','Miller','Trainer','S002','E024');
insert into Employee values('E028','Robert','Blake','Sitter','S002','E024');
insert into Employee values('E029','Jack','Black','Sitter','S002','E024');



CREATE TABLE Service(
ServiceID NCHAR(10) NOT NULL,
ServiceType NCHAR(10),
EIN nchar(10),
DateGiven nchar(10),
Cost NCHAR(10),
primary key(ServiceID),
Foreign Key (EIN) References Employee(EIN));

insert INTO Service values('SER001','Grooming','E026','01/06/2022','60');
INSERT INTO Service values('SER002','Boarding','E017','01/18/2022','45');
insert into Service values('SER003','Trainning','E027','01/19/2022','50');
insert into Service values('SER004','Boarding','E028','01/20/2022','50');
insert into Service values('SER005','Grooming','E006','01/20/2022','55');
insert into Service values('SER006','Grooming','E009','01/02/2022','60');
insert into Service values('SER007','Broading','E029','01/13/2022','50');
insert into Service values('SER008','Trainning','E013','01/15/2022','80');
insert into Service values('SER009','Grooming','E026','01/21/2022','40');
insert into Service values('SER010','Broading','E015','01/22/2022','50');
insert into Service values('SER011','Trainning','E011','01/25/2022','70');
insert into Service values('SER012','Broading','E027','01/27/2022','50');
insert into Service values('SER013','Grooming','E026','01/29/2022','65');
insert into Service values('SER014','Trainning','E012','01/16/2022','65');
insert into Service values('SER015','Broading','E028','01/03/2022','70');
insert into Service values('SER016','Trainning','E027','01/06/2022','60');



create table Customer(
CID NCHAR(10) NOT NULL,
Fname NCHAR(10),
Lname NCHAR(10),
PhoneNum varchar(20),
EmergencyNum varchar(20),
Primary Key(CID));


Insert into Customer values('C001','John','Doe','(225)555-1234','911');
insert into Customer values('C002','Taylor','Washington','(225)324-5683','(123)504-1234');
insert into Customer values('C003','Neno','Walters','(225)219-1288','(123)504-6733');
insert into Customer values('C004','Destiny','Winters','(225)123-4566','(123)222-9876');
insert into Customer values('C005','Calvin','Benard','(225)324-5683','(123)504-1204');
insert into Customer values('C006','Glenn','Nelson','(225)324-5683','(123)504-7540');
insert into Customer values('C007','Emment','Smith','(225)324-5683','(123)985-7073');
insert into Customer values('C008','Chad','Smithy','(225)324-5683','(123)504-3483');
insert into Customer values('C009','Lance','Ross','(225)845-4368','(123)403-2834');
insert into Customer values('C010','Micheal','Jordan','(225)757-2355','(911)504-5643');






create table Dog(
DogID NCHAR(10) NOT NULL,
DogName NCHAR(10),
Breed NCHAR(20),
Gender NCHAR(10),
ServiceID NCHAR(10),
primary key (DogID),
Foreign Key (ServiceID) References Service(ServiceID));

Insert into Dog values('D001','Fido','Bulldog','M','SER001');
Insert into Dog values('D002','Milo','Rottweiler','M','SER002');
Insert into Dog values('D003','Fluffy','null','F','SER003');
Insert into Dog values('D004','Sky','German Shepard','F','SER004');
Insert into Dog values('D005','Alex','Rottweiler','F','SER005');
Insert into Dog values('D006','Rex','Rottweiler','M','SER006');
Insert into Dog values('D007','Dora','null','F','SER007');
Insert into Dog values('D008','Mozart','St.Bernard','M','SER008');
Insert into Dog values('D009','Lela','Pitbull','F','SER009');
Insert into Dog values('D010','Ghost','null','M','SER010');
Insert into Dog values('D011','Hunter','Bloodhound','M','SER011');
Insert into Dog values('D012','Kimmy','Great Dane','F','SER012');
Insert into Dog values('D013','Patty','Poodle','F','SER013');
Insert into Dog values('D014','Jr','Boxer','M','SER014');
Insert into Dog values('D015','Kitty','Beagle','F','SER015');
Insert into Dog values('D016','Spot','Pitbull','M','SER016');

create table Customer_Dog(
DogID nchar(10),
CID nchar(10),
foreign key(CID) references Customer(CID),
foreign key(DogID) references Dog(DogID));


insert into Customer_Dog values('D001','C001');
insert into Customer_Dog  values('D002','C001');
insert into Customer_Dog values('D001','C002');
insert into Customer_Dog values('D003','C003');
insert into Customer_Dog values('D004','C004');
insert into Customer_Dog values('D005','C005');
insert into Customer_Dog values('D006','C006');
insert into Customer_Dog values('D007','C007');
insert into Customer_Dog values('D008','C008');
insert into Customer_Dog values('D009','C009');
insert into Customer_Dog values('D010','C010');
insert into Customer_Dog values('D011','C010');
insert into Customer_Dog values('D012','C010');
insert into Customer_Dog values('D013','C005');
insert into Customer_Dog values('D014','C006');
insert into Customer_Dog values('D015','C003');
insert into Customer_Dog values('D016','C004');


COMMIT;

#1 How many different types of dogs are on the dog table?  
select count(distinct breed) from dog; 
#2 Find services that are greater than the average cost
SELECT ServiceID, ServiceType 
FROM Service 
WHERE cost >(SELECT AVG(cost)
              FROM service);
#3 Count the number of employees at Store #2 
 select count(ein) as 'total employes'
 from employee e, location l 
 where l.storeid = e.storeid
 and e.storeid = 'S002';
#4 Find the average price of a grooming service. 
SELECT ServiceType, AVG(cost) as avgcost
FROM service
WHERE serviceType  in ('Grooming');

#5 Find out which employees do not have a boss
SELECT Fname, lname, jobtitle 
FROM employee
WHERE bossid IS NULL;

#6 List the employees at the Baton Rouge Location
SELECT e.EIN, e.fName, e.lName, l.city
FROM employee e, location l
WHERE e.storeID = l.storeID
AND l.city = 'Baton Rouge';
#7 Find names of employees that start with the letter a. 
SELECT EIN, Fname, Lname 
FROM Employee 
WHERE Fname LIKE 'a%' 
ORDER BY Fname; 
#8 Find all the names of the male dogs.
SELECT DogName, DogID FROM Dog WHERE Gender IN (SELECT Gender FROM Dog WHERE Gender = 'M') GROUP BY DogID; 
