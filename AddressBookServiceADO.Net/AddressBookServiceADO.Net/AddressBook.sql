-- Create a database
create database AddressBookService;
-- View database name
use AddressBookService;
select DB_NAME() 

-- Create table in the database
create table Address_Book
(
FirstName varchar(25) not null,
LastName varchar(25) not null,
Address varchar(60) not null,
City varchar(15) not null,
State varchar(15) not null,
Zipcode varchar(6) not null,
PhoneNumber varchar(12) not null,
Email varchar(25) not null
);

-- Inserting data in table
insert into Address_Book values
('Tony','Stark','Stark Tower 59th Street Broadway','Manhattan','NewYork','100001','8987224534','ironman@gmail.com'),
('Steve','Rogers','Times Square','Brooklyn','Texas','11224','9876778434','captainAmerica@yahoo.com'),
('Bruce','Banner','Vandalia','Greater Dayton','Florida','45441','1403425611','incredibleHulk@gmail.com'),
('Peter','Parker','20 Ingram Street, Forest Hills, Queens','NewYork City','NewYork','10023','4013224355','spiderman@gmail.com'),
('Stephen','Strange','177A Bleecker Street, Greenwich Village','Manhattan','NewYork','10431','6300964579','drStrange@yahoo.com'),
('Thor','Odinson','RoyalPalace','Asgard','Florida','224','7849876734','thor@rediffmail.com'),
('Natasha','Romanoff','Broadway street','NewYork City','NewYork','10028','45667365277','blackwidow@gmail.com')

-- View AddressBook table
select * from Address_Book

-- Edit existing contact using persons's name
update Address_Book
set PhoneNumber = '7654567885',Zipcode='534260' where FirstName = 'Bruce';
select* from Address_Book;

-- Delete contact using person's name
delete Address_Book
where FirstName = 'Natasha';

select* from Address_Book;

-- Retrieve contacts belonging to City or state from Address_Book
select * from Address_Book
where City = 'NewYork City' or State = 'Florida';

-- Count contacts by City in Address_Book  
select City,count(City) from Address_Book group by City;
-- Count contacts by State in Address_Book  
select State,count(State) from Address_Book group by State;

-- Sort contacts by first name for a given city
select * from Address_Book
where City = 'Manhattan'
order by FirstName asc;

-- Add addressbook name and type columns
alter table Address_book add addressbook_name varchar(20), type varchar(20);
-- update records for newly added columns
update address_book set addressbook_name = 'Home',type = 'Family' where FirstName = 'Tony' or FirstName = 'Peter';
update address_book set addressbook_name = 'Home',type = 'Friends' where FirstName = 'Steve' or FirstName = 'Bruce' or FirstName = 'Thor';
update address_book set addressbook_name = 'Office',type = 'Profession' where FirstName = 'Stephen' or FirstName = 'Natasha';

select * from Address_book;

-- Count contacts by type
select type, COUNT(FirstName) from address_book group by type;

-- Add a contact to both Friend and Family type
Insert into address_book values
('Peter','Parker','20 Ingram Street, Forest Hills, Queens','NewYork City','NewYork','10023','4013224355','spiderman@gmail.com','Home','Friends');
select * from address_book;

--Create table Contact_Details
create table Contact_Details
(
Contact_ID int identity(1,1) not null,
FirstName varchar(25) not null,
LastName varchar(25) not null,
Address varchar(60) not null,
City varchar(15) not null,
State varchar(15) not null,
Zipcode varchar(6) not null,
PhoneNumber varchar(12) not null,
Email varchar(25) not null
);

-- Inserting data in table
insert into Contact_Details values
('Tony','Stark','Stark Tower, 59th Street, Broadway','Manhattan','NewYork','100001','8987224534','ironman@gmail.com'),
('Steve','Rogers','Times Square','Brooklyn','Texas','11224','9876778434','captainAmerica@yahoo.com'),
('Bruce','Banner','Vandalia','Greater Dayton','Florida','45441','1403425611','incredibleHulk@gmail.com'),
('Peter','Parker','20 Ingram Street, Forest Hills, Queens','NewYork City','NewYork','10023','4013224355','spiderman@gmail.com'),
('Stephen','Strange','177A Bleecker Street, Greenwich Village','Manhattan','NewYork','10431','6300964579','drStrange@yahoo.com'),
('Thor','Odinson','RoyalPalace','Asgard','Florida','224','7849876734','thor@rediffmail.com'),
('Natasha','Romanoff','Broadway street','NewYork City','NewYork','10028','45667365277','blackwidow@gmail.com'),
('Pepper','Potts','Stark Tower, 59th Street, Broadway','Manhattan','NewYork','100001','8987224534','pepper@gmail.com'),
('Edwin','Jarvis','Avengers Mansion, 890 Fifth Avenue', 'Manhattan', 'Texas','112','67676886','jarvis@gmail.com'),
('Howard','Stark','Richford','Manhattan','NewYork','100001','9876543256','stark@yahoo.com');
select * from Contact_Details;

-- Create table Contact_Type
create table Contact_Type
(
ContactID int not null,
AddressBookName varchar(20) not null,
Contact_Type varchar(20) not null
);

-- Inserting data in tablee
insert into Contact_Type values
(1,'Home','Family'),
(2,'Home','Friends'),
(3,'Home','Friends'),
(4,'Home','Friends'),
(5,'Office','Profession'),
(6,'Home','Friends'),
(7,'Office','Profession'),
(8,'Home','Family'),
(9,'Home','Family'),
(10,'Home','Family')
--View Contact_type
select * from Contact_Type

--Join contact_Details and contact_type tables
select * from Contact_Details contact inner join Contact_Type type
on (contact.Contact_ID = type.ContactID)