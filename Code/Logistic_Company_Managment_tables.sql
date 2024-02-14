create database lcm;
use lcm;

-- Employee_details
create table Employee_details (
Emp_ID int(4) primary key,
Emp_NAME varchar(30),
Emp_BRANCH varchar(15),
Emp_DESIGNATION varchar(40),
Emp_ADDR varchar(100),
Emp_CONT_NO varchar(10) unique key);

-- Membership
create table Membership(
M_ID int primary key,
START_DATE text,
END_DATE text);

-- Cutomer
create table Customer(
Cust_ID int(4) primary key,
Cust_NAME varchar(30),
Cust_Email_ID varchar(40),
Cust_CONT_NO varchar(10) unique,
Cust_ADDR varchar(100),
Cust_TYPE varchar(30),#(Wholesale, Retail, Internal Goods)
M_ID int,
foreign key (M_ID) references membership(M_ID)on update cascade on delete cascade);

-- shipment_details
create table Shipment_details(
SD_ID varchar(6) primary key,
SD_CONTENT varchar(40),
SD_DOMAIN varchar(15),#(International / Domestic)
SD_TYPE varchar(15),#(Express / Regular)
SD_WEIGHT VARCHAR (10),
SD_CHARGES INT (10),
SD_ADDR VARCHAR (100),
DS_ADDR VARCHAR (100),
Cust_ID INT (4),
foreign key (Cust_ID) references customer(Cust_ID)on update cascade on delete cascade);

-- Payment_details
create table Payment_details(
PAYMENT_ID varchar(40) primary key,
AMOUNT int,
PAYMENT_STATUS varchar(10),#(Paid / Not Paid)
PAYMENT_DATE text,
PAYMENT_MODE varchar(25),#(COD / Card Payment)
SD_ID varchar(6),#foreign key
Cust_ID int(4),#foreign key
foreign key (SD_ID)references shipment_details(SD_ID) on update cascade on delete cascade,
foreign key (Cust_ID) references customer(Cust_ID)on update cascade on delete cascade);

-- status
create table Status(
CURRENT_ST varchar(15),
SENT_DATE text,
DELIVERY_DATE text, #Date when the product was/will be delivered
status_SH_ID varchar(6) primary key);

-- Employee_manages_shipment
create table Employee_Manages_Shipment(
Emp_ID int(5),
SD_ID varchar(6),
Status_SH_ID varchar(6),
foreign key (Emp_ID) references employee_details(Emp_ID) on update cascade on delete cascade,
foreign key (SD_ID) references Payment_details(SD_ID) on update cascade on delete cascade,
foreign key (Status_SH_ID) references status(Status_SH_ID)
on update cascade on delete cascade);
