--Basics Questions:-
--1) Create two Databases Name :- Brands , and  Products
create database Brands

create database Products
--2) Create two tables in SQL Server  name  as ITEMS_Table in Brands database and PRODUCT_Table in Products database.
--3)  After Creating both the tables Add records in that tables (records are available above)
use Brands 
Go

create table ITEMS_Table(
Item_Id numeric(18,0) Not Null, 
item_description varchar(80) Not Null,
vendor_nos int Not Null,
vendor_name nvarchar(80) Not Null,
bottle_size numeric(15,2) Not Null,
bottle_price money Not Null
)

INSERT into ITEMS_Table values (1, 'Travis Hasse Apple Pie',	305, 'Mhw Ltd',	750,	$9.77 )
INSERT into ITEMS_Table values (2,	'D''aristi Xtabentun',	391,	'Anchor Distilling (preiss Imports)',	750,	$14.12 )
INSERT into ITEMS_Table values (3,	'Hiram Walker Peach Brandy',	370,	'Pernod Ricard Usa/austin Nichols',	1000,	$6.50)
INSERT into ITEMS_Table values (4,	'Oak Cross Whisky',	305,	'Mhw Ltd',	750,	$25.33 )
INSERT into ITEMS_Table values (5,	'Uv Red(cherry) Vodka',	380,	'Phillips Beverage Company',	200,	$1.97 )
INSERT into ITEMS_Table values (6,	'Heaven Hill Old Style White Label',	259,	'Heaven Hill Distilleries Inc.',	750,	$6.37 )
INSERT into ITEMS_Table values (7,	'Hyde Herbal Liqueur',	194,	'Fire Tail Brands Llc',	750,	$5.06 )
INSERT into ITEMS_Table values (8,	'Dupont Calvados Fine Reserve',	403,	'Robert Kacher Selections',	750,	$23.61 )

use Products 
Go

create table PRODUCT_Table (
Product_Id int Not Null,
Country	varchar(50) Not Null,
Product varchar(50) Not Null,
Units_Sold decimal(16,2) Not Null,
Manufacturing_Price numeric(16,2) Not Null,
Sale_Price Money Not Null,
Gross_Sales Money Not Null,
Sales Money Not Null,
COGS 	Money Not Null,
Profit Money Not Null,
Date	datetime Not Null,
Month_Number	int Not Null,
Month_Name varchar(50) Not Null,
Year int Not Null)
select * FROM PRODUCT_Table


INSERT into PRODUCT_Table values (1,'Canada','Carretera', 1618.5,	$3.00, 	 $20.00, $32370.00, $32370.00, $16185.00, $16185.00, 	'01-01-2014',	1, 'January', 	2014)
INSERT into PRODUCT_Table values (2,	'Germany',	 'Carretera', 	1321,	 $3.00, 	 $20.00, 	 $26420.00,  $26420.00, 	 $13210.00, 	 $13210.00, 	'01-01-2014',	1,	 'January', 	2015)
INSERT into PRODUCT_Table values (3,	'France',	 'Carretera', 	2178,	 $3.00, 	 $15.00, 	 $32670.00,  $32670.00, 	 $21780.00, 	 $10890.00, 	'01-06-2014',	6,	 'June', 	2016)
INSERT into PRODUCT_Table values (4,	'Germany',	 'Carretera', 	888,	 $3.00, 	 $15.00, 	 $13320.00, 		 $13320.00, 	 $8880.00, 	 $4440.00, 	'01-06-2014',	6,	 'June', 	2017)
INSERT into PRODUCT_Table values (5,	'Mexico',	 'Carretera', 	2470,	 $3.00, 	 $15.00, 	 $37050.00, 		 $37050.00, 	 $24700.00, 	 $12350.00, 	'01-06-2014',	6,	 'June', 	2018)
INSERT into PRODUCT_Table values (6,	'Germany',	 'Carretera', 	1513,	 $3.00, 	 $350.00, 	 $529550.00, 		 $529550.00, 	 $393380.00, 	 $136170.00, 	'01-12-2014',	12,	 'December', 	2019)
INSERT into PRODUCT_Table values (7,	'Germany',	 'Montana', 	921,	 $5.00, 	 $15.00, 	 $13815.00, 		 $13815.00, 	 $9210.00, 	 $4605.00, 	'01-03-2014',	3,	 'March', 	2020)
INSERT into PRODUCT_Table values (8,	'Canada',	 'Montana', 	2518,	 $5.00, 	 $12.00, 	 $30216.00, 		 $30216.00, 	 $7554.00, 	 $22662.00, 	'01-06-2014',	6,	 'June', 	2021)


--4) Delete those product having the Units Sold 1618.5 , 888 and 2470.
delete from PRODUCT_Table where Units_Sold in (1618.5,  888,  2470)

--5) DROP the table and Create it again.
drop table ITEMS_Table

use Brands 
Go

create table ITEMS_Table(
Item_Id numeric(18,0) Not Null, 
item_description varchar(80) Not Null,
vendor_nos int Not Null,
vendor_name nvarchar(80) Not Null,
bottle_size numeric(15,2) Not Null,
bottle_price money Not Null
)

INSERT into ITEMS_Table values (1, 'Travis Hasse Apple Pie',	305, 'Mhw Ltd',	750,	$9.77 )
INSERT into ITEMS_Table values (2,	'D''aristi Xtabentun',	391,	'Anchor Distilling (preiss Imports)',	750,	$14.12 )
INSERT into ITEMS_Table values (3,	'Hiram Walker Peach Brandy',	370,	'Pernod Ricard Usa/austin Nichols',	1000,	$6.50)
INSERT into ITEMS_Table values (4,	'Oak Cross Whisky',	305,	'Mhw Ltd',	750,	$25.33 )
INSERT into ITEMS_Table values (5,	'Uv Red(cherry) Vodka',	380,	'Phillips Beverage Company',	200,	$1.97 )
INSERT into ITEMS_Table values (6,	'Heaven Hill Old Style White Label',	259,	'Heaven Hill Distilleries Inc.',	750,	$6.37 )
INSERT into ITEMS_Table values (7,	'Hyde Herbal Liqueur',	194,	'Fire Tail Brands Llc',	750,	$5.06 )
INSERT into ITEMS_Table values (8,	'Dupont Calvados Fine Reserve',	403,	'Robert Kacher Selections',	750,	$23.61 )

 
 drop table PRODUCT_Table 

 use Products 
Go

create table PRODUCT_Table (
Product_Id int Not Null,
Country	varchar(50) Not Null,
Product varchar(50) Not Null,
Units_Sold decimal(16,2) Not Null,
Manufacturing_Price numeric(16,2) Not Null,
Sale_Price Money Not Null,
Gross_Sales Money Not Null,
Sales Money Not Null,
COGS 	Money Not Null,
Profit Money Not Null,
Date	datetime Not Null,
Month_Number	int Not Null,
Month_Name varchar(50) Not Null,
Year int Not Null)
select * FROM PRODUCT_Table


INSERT into PRODUCT_Table values (1,'Canada','Carretera', 1618.5,	$3.00, 	 $20.00, $32370.00, $32370.00, $16185.00, $16185.00, 	'01-01-2014',	1, 'January', 	2014)
INSERT into PRODUCT_Table values (2,	'Germany',	 'Carretera', 	1321,	 $3.00, 	 $20.00, 	 $26420.00,  $26420.00, 	 $13210.00, 	 $13210.00, 	'01-01-2014',	1,	 'January', 	2015)
INSERT into PRODUCT_Table values (3,	'France',	 'Carretera', 	2178,	 $3.00, 	 $15.00, 	 $32670.00,  $32670.00, 	 $21780.00, 	 $10890.00, 	'01-06-2014',	6,	 'June', 	2016)
INSERT into PRODUCT_Table values (4,	'Germany',	 'Carretera', 	888,	 $3.00, 	 $15.00, 	 $13320.00, 		 $13320.00, 	 $8880.00, 	 $4440.00, 	'01-06-2014',	6,	 'June', 	2017)
INSERT into PRODUCT_Table values (5,	'Mexico',	 'Carretera', 	2470,	 $3.00, 	 $15.00, 	 $37050.00, 		 $37050.00, 	 $24700.00, 	 $12350.00, 	'01-06-2014',	6,	 'June', 	2018)
INSERT into PRODUCT_Table values (6,	'Germany',	 'Carretera', 	1513,	 $3.00, 	 $350.00, 	 $529550.00, 		 $529550.00, 	 $393380.00, 	 $136170.00, 	'01-12-2014',	12,	 'December', 	2019)
INSERT into PRODUCT_Table values (7,	'Germany',	 'Montana', 	921,	 $5.00, 	 $15.00, 	 $13815.00, 		 $13815.00, 	 $9210.00, 	 $4605.00, 	'01-03-2014',	3,	 'March', 	2020)
INSERT into PRODUCT_Table values (8,	'Canada',	 'Montana', 	2518,	 $5.00, 	 $12.00, 	 $30216.00, 		 $30216.00, 	 $7554.00, 	 $22662.00, 	'01-06-2014',	6,	 'June', 	2021)


--Intermediate Questions
--Big Table :--
--1) Find the Total Sale Price  and  Gross Sales 

select sum(Sale_Price) from PRODUCT_Table 
select sum(Gross_Sales) from PRODUCT_Table 

--2) In which year we have got the highest sales

select Year from PRODUCT_Table 
where Sales=(select max(Sales) from PRODUCT_Table )

--3)  Which Product having the sales of $ 37,050.00

select Product from PRODUCT_Table
where Sales=37050.00 

--4) Which Countries lies between profit of $ 4,605 to $  22 , 662.00

select Country from Product_Table
where Profit between $ 4605 and $  22662.00

--5) Which Product Id having the sales of $ 24 , 700.00

select Product_Id from Product_Table
where Sales= 24700.00


--Small Table :--

1) Find the item_description having the bottle size of 750

select item_description from ITEMS_Table
where bottle_size=750


--2) Find the vendor Name having the vendor_nos 305 , 380 , 391

select vendor_name from ITEMS_Table
where vendor_nos in (305 , 380 , 391)


--3) What is total Bottle_price 

select sum(bottle_price) from Items_Table


--4) Make Primary Key to Item_id

Alter Table ITEMS_Table
Add Primary Key(Item_Id )


--5) Which item id having the bottle_price of $ 5.06

select Item_Id from Items_Table
where bottle_price = $ 5.06



--Advance Questions:--
--1) Apply INNER  , FULL OUTER , LEFT JOIN types on both the table 
--INNER
select 

ITEMS_Table.Item_Id, 
ITEMS_Table.bottle_size,
ITEMS_Table.bottle_price,
PRODUCT_Table.Product_Id,
PROduct_Table.Units_Sold

from 
[Brands].[dbo].[ITEMS_Table]

Inner Join 
[Products].[dbo].[PRODUCT_Table]

on 
ITEMS_Table.Item_Id=PRODUCT_Table.Product_Id


--FULL OUTER
select 
ITEMS_Table.Item_Id,
ITEMS_Table.bottle_price,
PROduct_Table.Units_Sold

from 
[Brands].[dbo].[ITEMS_Table]

Full Outer Join 
[Products].[dbo].[PRODUCT_Table]

on 
ITEMS_Table.Item_Id=PRODUCT_Table.Product_Id


--LEFT JOIN
select 
ITEMS_Table.Item_Id,
ITEMS_Table.bottle_price,
PROduct_Table.Country

from 
[Brands].[dbo].[ITEMS_Table]

Left Join 
[Products].[dbo].[PRODUCT_Table]

on 
ITEMS_Table.Item_Id=PRODUCT_Table.Product_Id


--2) Apply  OUTER  ,  RIGHT JOIN , CROSS JOIN types  on both the table 

--OUTER
select 
ITEMS_Table.Item_Id,
ITEMS_Table.bottle_price,
PROduct_Table.Product_Id

from 
[Brands].[dbo].[ITEMS_Table]

Left Outer Join 
[Products].[dbo].[PRODUCT_Table]

on 
ITEMS_Table.Item_Id=PRODUCT_Table.Product_Id


--RIGHT JOIN 
select
ITEMS_Table.Item_Id,
ITEMS_Table.bottle_price,
ITEMS_Table.vendor_name,
PROduct_Table.Product_Id

from 
[Brands].[dbo].[ITEMS_Table]

Right Outer Join 
[Products].[dbo].[PRODUCT_Table]

on 
ITEMS_Table.Item_Id=PRODUCT_Table.Product_Id



--CROSS JOIN
select ITEMS_Table.bottle_price,
PROduct_Table.Product_Id

from 
[Brands].[dbo].[ITEMS_Table]

Cross Join 
[Products].[dbo].[PRODUCT_Table]


--3) Find the item_description and Product having the gross sales of 13,320.00
select 
[Brands].[dbo].[Items_Table].[item_description],  
[Products].[dbo].[PRODUCT_Table].[Product]
from 
[Brands].[dbo].[Items_Table],[Products].[dbo].[PRODUCT_Table]

where  

[Products].[dbo].[PRODUCT_Table].[Gross_Sales]  = $13320.00 


--4)   Split the Item_description Column into Columns Item_desc1 and Item_desc2
ALTER TABLE Items_table
ADD
Item_desc1 VARCHAR(255),
Item_desc2 VARCHAR(255);

UPDATE Items_Table

SET 
    Item_desc1 = substring(item_description,1,charindex(' ',item_description)-1),
    Item_desc2 = substring(item_description,charindex(' ',item_description)+1,len(item_description))


ALTER TABLE ITEMS_TABLE
DROP COLUMN item_description

