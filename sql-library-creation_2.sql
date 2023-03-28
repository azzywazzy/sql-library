create database Library;

use Library;

create table members(
	card_number char(8) not null unique primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    dob date,
    address_1 varchar(50),
    address_2 varchar(50),
    phone_number varchar(20),
    email varchar(254),
    creation_date date,
    renewal_date date,
    account_status enum('Active', 'Inactive') );
    
alter table members
add column postcode varchar(8) after address_2;
    
insert into members values('10000001', 'Lyra', 'Silvertongue', 
'1990-09-23', 'Jordan College', 'Oxford', 'OX1 4AU', '07484 123456', 'lyra.silvertongue@gmail.com', 
'2023-03-19', '2026-03-19', 'Active');

select * from members;

alter table members
add column is_over_18 bit;

update members
set is_over_18 = 1
where card_number = '10000001';



