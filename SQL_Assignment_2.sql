--Q1) Create   Database Name as Order_Stores_Data 

CREATE database Order_Stores_Data 

--Q2) Create two Table names as Orders_Table and Stores_Table
--Q3) Insert All records present here in the Orders_table and Stores_Table
use 
Order_Stores_Data
GO

create table 
Orders_Table (
OrderDate date Not Null,
Region char(10) Not Null,
Rep varchar(50) Not Null,
Order_Item varchar(45) Null,
Units int Not Null,
Unit_Cost decimal(16,2) Not Null,
Total_Price decimal(10,2) Not Null,
Order_Id int Not Null)

create table 
Stores_Table (
Store_Id int Not Null,
StoreType char(6) Not Null,
Assortment int Not Null,
CompetitionDistance int Not Null,
Month int Not Null,
Year int Not Null,
PromoInterval varchar(25) Null)

insert into Orders_Table values
('1-6-21',	'East',	'Aruna',	'Pencil',	95,	 1.99, 	 189.05, 	1)

insert into 
Orders_Table values
('1-23-21',	'Central', 'Kivell',	'Eraser',	50,	 19.99, 999.50, 2)

insert into Orders_Table
(OrderDate,	Region,	Rep,	Units,	Unit_Cost,	Total_Price,	Order_Id) 
values
('2-9-21',	'Central',	'Ganesh',		36,	 4.99, 	 179.64, 	3)

insert into Orders_Table
(OrderDate,	Region,	Rep,	Units,	Unit_Cost,	Total_Price,	Order_Id)
values
('2-26-21',	'Central',	'Payal',		27,	 19.99, 	 539.73, 	4)

insert into Orders_Table
(OrderDate,	Region,	Rep,	Units,	Unit_Cost,	Total_Price,	Order_Id)
values
('3-15-21',	'West',	'Sorvino',		56,	 2.99, 	 167.44, 	5)

insert into Orders_Table
values('4-1-21',	'East',	'Hitesh',	'Pencil',	60,	 4.99, 	 299.40, 	6)

insert into Orders_Table
(OrderDate,	Region,	Rep,	Units,	Unit_Cost,	Total_Price,	Order_Id) 
values
('4-18-21',	'Central',	'Akshita',		75,	 1.99, 	 149.25, 	7)

insert into Orders_Table values
('5-5-21',	'Central',	'Ruchika',	'Books',	90,	 4.99, 	 449.10, 	8)

insert into Orders_Table
(OrderDate,	Region,	Rep,	Units,	Unit_Cost,	Total_Price,	Order_Id)
values
('5-22-21',	'West',	'Surbhi', 		32,	 1.99, 	 63.68, 	9)
insert into Orders_Table 
values('6-8-21',	'East',	'Jones',	'Suitcase',	60,	 8.99, 	 539.40, 	10)




insert into Stores_Table values(
1,	'c',	50,	1270,	9,	2008,	'Jan')

insert into Stores_Table values
(2,	'a',	34,	570,	11,	2007,	'Feb')

insert into Stores_Table values
(3,	'a',	12,	14130,	12,	2006,	'Mar')

insert into Stores_Table(Store_Id,	StoreType,	Assortment,	CompetitionDistance,	Month,	Year) values
(4,	'c',	48,	620,	9,	2009)

insert into Stores_Table values
(5,	'a',	36,	29910,	4,	2015,	'May')

insert into Stores_Table values
(6,	'a',	27,	310,	12,	2013,	'June')

insert into Stores_Table(Store_Id,	StoreType,	Assortment,	CompetitionDistance,	Month,	Year) values
(7,	'a',	37,	24000,	4,	2013)

insert into Stores_Table values
(8,	'a',	48,	7520,	10,	2014,	'Aug')

insert into Stores_Table(Store_Id,	StoreType,	Assortment,	CompetitionDistance,	Month,	Year) 
values
(9,	'a',	50,	2030,	8,	2000)

insert into Stores_Table values
(10,	'a',	26,	3160,	9,	2009,	'Oct')





--Q3) Make Order_Id  Column as Primary Key.
ALTER TABLE ORDERS_TABLE
ADD PRIMARY KEY (ORDER_ID);

--Q4) Add one Column Name  as Store_Names and insert the records given above in Stores table.

Alter table Stores_Table add Store_Names varchar(50)
update Stores_Table set Store_Names='Car' where Store_id=1
update Stores_Table set Store_Names='Bikes' where Store_id=2
update Stores_Table set Store_Names='Hardware' where Store_id=3
update Stores_Table set Store_Names='Electrics' where Store_id=4
update Stores_Table set Store_Names='Fibers' where Store_id=5
update Stores_Table set Store_Names='Elastics' where Store_id=6
update Stores_Table set Store_Names='Books' where Store_id=7
update Stores_Table set Store_Names='Shoes' where Store_id=8
update Stores_Table set Store_Names='Clothes' where Store_id=9
update Stores_Table set Store_Names='Scraps' where Store_id=10

--Q5) Make Stored_Id as a Foreign Key with reference too Orders_Table 

Alter table Stores_table 
Add Primary Key(Store_Id)

Alter table Stores_table 
Add Foreign Key(Store_Id) References orders_table(order_id)


--Q6) Update the missing  records in the Order_item Column in Order_table missing records are given in this sheet

update Orders_Table set Order_Item='Compass' where Order_Id=3
update Orders_Table set Order_Item='Torch' where Order_Id=4
update Orders_Table set Order_Item='Phone' where Order_Id=5
update Orders_Table set Order_Item='Laptop' where Order_Id=7
update Orders_Table set Order_Item='Box' where Order_Id=9


--Q7) Update the missing records in the PromoInterval Column in Stores Table.

update Stores_Table  set PromoInterval ='April'  where Store_Id=4
update Stores_Table  set PromoInterval ='July'  where Store_Id=7
update Stores_Table  set PromoInterval ='September'  where Store_Id=9

--Q8) Rename the column name  of Assortment to Store_Nos in Stores_Table.

sp_rename 'Stores_Table.Assortment', 'Store_Nos', 'Column'


--Q9) Rename the column name  of Order_Item to Item_name  and Rep Column as Customers_name in Orders_Table.
sp_rename 'Orders_Table.Order_Item', 'Item_Name','Column'
go

sp_rename 'Orders_table.Rep', 'Customers_Name','Column'
go

--Q10) Sort the Unit Cost of Orders_table in Descding order and Total column in Ascending order.

select* from Orders_Table
Order by 
Unit_cost desc,
Total_price asc;


--Q11) Convert Customers_name to Cus_Name  and find how many  Cus_Name in each region.

sp_rename 'Orders_Table.Customers_Name', 'Cus_Name','Column'
go

SELECT Region,
Count(Cus_Name) as No_Of_Customers 

From 
Orders_Table 
Group by 
Region


--Q12) Find the sum of Total_Price Column and Unit Cost  in Orders_Table 

select sum(Total_price)
from Orders_Table

select sum(Unit_Cost)
from Orders_Table

--Q13) Show me OrderDate  , Unit Cost  , StoreType and Year in One table and names that table as Order_Stores_Table.

create view [Order_Stores_Table] 
as
select  OrderDate,Unit_Cost,StoreType,Year
from Orders_Table,Stores_Table  


--Q14)  Give me Order_Item  and Region whose Order_Id is 4 , 5, 6 ,9

SELECT Order_ID,Region,Item_name 
From Orders_Table where Order_id in(4,5,6,9)

--Q15) Show me year  whose ComptetitionDistance is 29910  , 310 , 3160

Select Year,CompetitionDistance
from Stores_Table where CompetitionDistance in (29910  , 310 , 3160);

--Q16)  Give me that Item_name whose  Total_Price is greater than 200 and less than 400

select Item_name from Orders_table 
where Total_price >200 and Total_price < 400;

--Q17) Rename the CompetitionDistance as CD and find the total CD in Stores_Table.

sp_rename 'Stores_Table.CompetitionDistance', 'CD','Column'
select sum(CD) from Stores_Table;

--Q18) What is the Total Count of Stores_Type and CD columns

Select count(StoreType) as No_of_Stores, count(CD) as Total from Stores_table 

--Q19) Apply the Cross Join in  Orders_Table and Stores_Table.
Select Custo_Name , Store_Names
from 
Orders_Table 
cross join
Stores_Table

--Q20) DROP both the databases
drop database Order_Stores_Data 