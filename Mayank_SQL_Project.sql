
/*

         SQL PROJECT
DATASET :- US HEALTHCARE DATASET
ANALYSIS:- TO check and analyze the Billing amount test reports and fetchinng days of stay


*/

use ind08;   -- DATABASE CREATED
select * from hea_data;

show databases;
select * from hea_data;

desc hea_data;

-- drop table ind08;

show tables;

/* 


Fetching Patient Dteails using Alter Operations


*/

-- to add column  in table at first 
alter table hea_data add column First_column varchar(20) first;
select * from hea_data;

-- To add Column After Existing Column
alter table hea_data add column Exi_column varchar(20) after Name;

-- to add column in table at last (BY Default)
alter table hea_data add column Last_Column varchar(20);

-- To Add Column Before Column
alter table hea_data add column Surname varchar(20) after Name;

#to drop column from table health data
alter table hea_data drop column First_column;

select * from hea_data;

#to rename  column in table 
alter table hea_data rename column  First_Column  to fiirst_Column;
select * from hea_data;

#to  modify  or change the  datatype 
alter table hea_data modify column fiirst_Column char(20);

#


/*

Applying Update Query to Fetch Patient Details

DML

*/

-- Fetch patients Profile and Update Medical Condition
update hea_data set Medical_Condition = "Hyper_Obesity" where Name="Chad Byrd";

-- Fetch Patients  Profile and Update their Billing Amount
Update hea_data set B_Amt=22322 where Name ="Patrick Parker" and Gender = "Male";
select  * from hea_data;

-- Fetch Charles Horton Patients Profile and Update their Test Results
update hea_data set Test_Results=Inconclusive where Name="Charles Horton" and Gender="Male";


/*


Fetching Details Of Patients using Delete Query

*/
delete from hea_data where RoomNo=126 and Ins_Prov="Medicare";
delete from hea_data where Name="Amy Roberts" and Test_Results="Abnormal";


select * from hea_data;

-- to retrieve data from table 
select * from hea_data;

-- to retrieve specific Columns
select Name,Age,Gender from hea_data;


/*


Fetching Details Of patient Using Operators



*/


/*
  Fetching Patient Details Using Comparison Operators
*/ 

-- write a query whose billing Amount is equal to 20800
select * from hea_data where B_Amt =22522.363384853266 ;

-- Fetching billing AMount Greater than 30k
select * from hea_data where B_Amt < 30000;

-- Fetcching billing Amount Greater Than equal to  35k 
select * from hea_data where B_Amt >=  35000;  

-- Fetching Billing Amount Not Equal to 47508.00017915965
Select * from hea_data where B_Amt <>47508.00017915965;


-- Fetching Billing Amount Less Than 50k
select * from hea_data  where B_Amt < 50000;


/*
Fetching Queries Using Logical Operators
*/

-- Fetch All Patients OF Hospital Where They Are females And their Billing Amount is Less Than 50k;
select * from hea_data where Gender="Female" and B_Amt<50000;

-- Fetch And Give Data Of Customers having Blood Group o negative with insaueance insurance provider is Blue Cross;
select * from hea_data where Blood_Type="O+" and Ins_Prov="Blue Cross";

-- Fetch Male patients Name and Age having insaurance from Atena and billing Amount is  below 60k;
select Name,Age from hea_data where ins_prov="Blue Cross" and B_Amt<40000 and Gender="Male";

-- Fetch patients Having Blood Group o postive and billing amount greater than 30k;
select  * from hea_data where Blood_Type="O+" and B_Amt>30000;

/*

Fetching Details Using Membership Operator



*/

select * from hea_data;

-- Write a Query to find Patients having insaurance provider except Aetna and BlueCross

select * from hea_data where Ins_Prov not in ("Aetna","Blue Cross");


/*


Range Operator Query 

*/

select Name,Blood_Type,Gender,Medical_Condition,Date_Admission,B_Amt from hea_data where B_Amt between 40000 and 50000;
select *  from hea_data where RoomNo between 200 and 300;
select * from hea_data;

/*

Fetching Queries In Null Operators

*/

select * from hea_data where Date_Admission is not null;
select * from hea_data where Date_Admission is null;


/*

Fetching patients Data using Case Operators
 

*/
select * from hea_data;

select * from hea_data;

select Medical_Condition,
case 
when age <= 40 then "Cured"
when age > 40 and age <= 60 then "Moderately Cured"
when age  >60 then "Can't Predict"
end
as Cure_Condition 
from hea_data;

/*

Fetching Patient Details Using Like Operators


*/

-- Check Out Details Of Patients Having Name Starting With A 
select * from hea_data where Name like "A%";
-- Check Out Details of patients having Doctor name ending with n
select *  from hea_data where Doctor like "%n";
-- Check Out Details Of patients Having Name Starting A and Ending with s
select *  from hea_data where Name like "A%s";

-- Check out details of patients having Medical Conditioh Exact 8 Characters
select * from hea_data where Medical_Condition like "________";

select * from hea_data;

/*

Extracting patients Information using Distinct Clause

*/

-- Fetch Distinct Medical Conditions Of patients
select distinct Medical_Condition from hea_data;

-- fetch patient details Of Distinct age 
select distinct Age from hea_data;

-- fetch Which Insaurance Provider is Opeted By patients
select Distinct Ins_Prov from hea_data;

select * from hea_data;


/*

Fetch Queries Using OrderBy Clause

*/


-- Extract Patient Details And Arrange Them Alphabetically
select * from hea_data  order by name ;

-- Extract Patients Details having Cancer And Showcase It Alphabetically
select * from hea_data where Medical_Condition="Arthritis" order by Name;

-- Extract Patient details and arrange Them in descending Order 
select *  from hea_data order by B_Amt desc;

-- Extract Male PAtient Details  And arrange Billing amount by higher state and Name alphabetically 
select * from hea_data where Gender="Male" order by Name,B_Amt desc;


select * from hea_data;

/*

Fetching Patient Details Using Limit Clause

*/

-- Access High Billing Amount of Top 5 Male Patients 
select *  from hea_data where Gender="Male" order by B_Amt desc limit 0,5 ;

-- Acces first 100 rows 
select * from hea_data limit 0,100;

-- Access 11 to 20  Records From Top
select * from hea_data limit 10,10;

-- Access Details Such as Name,Gender,Medical Condition having Second Highest Billing Amount Of Patient
select Distinct B_Amt,Name,Gender,Medical_Condition from hea_data order by B_Amt desc limit 1,1;

-- Access Details Of Patient Having Fourth Highhest Billing Amount 

select distinct B_Amt,Name from hea_data order by B_Amt desc limit 3,1;

-- Access 100 th Lowest Billing Amount
select distinct B_Amt,Name from hea_data order by B_Amt limit 99,1;
select * from hea_data;


/*


          EXTRACTING INFORMATION OF PATIENTS USING
					"STRING FUNCTIONS"
                    
*/

/*
CONCAT
*/
-- Merge medical conditions and Name of Patients 
select concat(Name,"-",Medical_Condition) as Information from hea_data ;

/*
UPPER
*/

-- Highlight Their Medical Condition to Capital Letters
select upper(Medical_Condition) as MedCon from hea_data;

/*
LOWER
*/

-- Highlight test results in lower case for confidentiality
select lower(Test_Results) as Results from hea_data;

/*
REPLACE
*/
-- Replace Gender e letter to % 
select replace(Gender,"e","u") as gen from hea_data;

-- remove spaces and replace it with Dash
select replace(Name," ","-") as Modified_Names from hea_data;
/*
LENGTH
*/
-- count length of Name Column
select length(Name) as LengthCount from hea_data;

-- Count Length of Medicines column
select length(Medicines) as LengthOfMeds,Medicines from hea_data;

select * from hea_data;

/*
Substring
*/

select substr("Hello Dear",1,5) ;
select substr("Hello Dear",1,11);



/*

BUILT-IN FUNCTIONS

*/

-- For Current Date and time 
select now();

-- for current date 
select curdate();

-- for current time
select curtime();

-- find how many days patient was admittedd in hospital 
select datediff("2020/8/23","2020/8/20");


-- To find age 
select datediff("2024/04/08","1998/05/03")/365;

select * from hea_data;


/*


Fetching Queries Using Group By Clause


*/


-- Find Count of Insaurance Provider for Patients
select Ins_Prov,count(*) from hea_data group by Ins_Prov;

-- Find Maxx Billing Of patients And Details of Each Blood Group 
select Blood_Type,max(B_Amt) from hea_data group by Blood_Type;

-- Find number of Patients From each Hospital , Admiision wise and Sort it by  Admission type Alphabetiucally
select Hospital,Admission_Type,count(*) from hea_data group by Admission_Type,Hospital order by Admission_Type;
select * from hea_data;



/*


Fetching Patients Details By Using Having Clause
Syntax- Select col,Agg func() from <Table Name > group by col having condition

*/

-- fetch Details Of Max billing Amount From Each Insaurance Provider
select Ins_Prov,max(B_Amt) from hea_data group by Ins_Prov order by max(B_Amt) desc;

--  Fetch number of patients Details whose Billinng amount is Greater than 45000 from eacch insaurance Providder
select Ins_Prov,count(*) from hea_data where B_Amt > 45000 group by Ins_Prov order by count(*) desc;

-- Number of patients from each room where Number of Patients in Eacch room is greater than 30;
select RoomNo,count(*) from hea_data group by RoomNo having count(*) >30 ;

-- Number Of Patients from each room where Number Of Patients in Each room is less than 30
select RoomNo,count(*) from hea_data group by RoomNo having count(*)<20;


Select *  from hea_data;



/*

Fetching Patient Details Using SubQuery


*/

-- Create A Table of 30 Patients having Name Age >35 Gender from health table
create table new_headata(select Name,Age,Gender,Blood_Type from hea_data where  Age>35 order by Name limit 0,30);
select * from new_headata;

-- Fetch Patient details having 2nd Highest Billing Amount
select max(B_Amt)from hea_data where B_Amt < (select max(B_Amt) from hea_data);



select * from hea_data;









































 