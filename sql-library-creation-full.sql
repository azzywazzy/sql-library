create database Library;

use Library;

create table members(
	card_number char(8) not null unique primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    dob date,
    is_over_18 bit,
    address_1 varchar(50),
    address_2 varchar(50),
    postcode varchar(8),
    phone_number varchar(20),
    email varchar(254),
    creation_date date,
    renewal_date date,
    account_status enum('Active', 'Inactive') 
    );
    
create table author(
	author_id smallint not null unique primary key,
    author_first varchar(50) not null,
    author_last varchar(50) not null
    );
        
create table item(
	isbn char(13) not null unique primary key,
    title tinytext not null,
    description text,
    category_id smallint,
    is_available bit
    );

create table book_author(
	book_author_id int primary key,
    isbn char(13),
    author_id smallint,
    foreign key(isbn) references item(isbn),
	foreign key(author_id) references author(author_id)
    );

create table location_id(
	branch_id tinyint not null unique primary key,
    branch_name varchar(50) not null,
    address_1 varchar(50),
    address_2 varchar(50),
    postcode varchar(8),
    phone_number varchar(20) not null
    );

create table copy(
	item_barcode char(8) not null unique primary key,
	isbn char(13),
	branch_id tinyint,
	foreign key (branch_id) references location_id(branch_id),
	foreign key (isbn) references item(isbn)
    );

create table loan(
  loan_number mediumint not null auto_increment primary key,
  loan_date date,
  card_number char(8),
  item_barcode char(8),
  branch_id tinyint,
  due_date date,
  returned_date date,
  foreign key (card_number) references members(card_number),
  foreign key (item_barcode) references copy(item_barcode),
  foreign key (branch_id) references location_id(branch_id)
  );

insert into members values('10000001', 'Lyra', 'Silvertongue', 
'1990-09-23', 1, 'Jordan College', 'Oxford', 'OX1 4AU', '07484 123456', 'lyra.silvertongue@gmail.com', 
'2023-03-19', '2026-03-19', 'Active');

insert into author values(00001, 'Philip', 'Pullman');

insert into item values('9780440238133', 'His Dark Materials: The Golden Compass (Book 1)',"Lyra is rushing to the cold, far North, where witch clans and armored bears rule. North, where the Gobblers take the children they steall—including her friend Roger. North, where her fearsome uncle Asriel is trying to build a bridge to a parallel world.

Can one small girl make a difference in such great and terrible endeavors? This is Lyra: a savage, a schemer, a liar, and as fierce and true a champion as Roger or Asriel could want.

But what Lyra doesn't know is that to help one of them will be to betray the other...

A masterwork of storytelling and suspense, Philip Pullman's award-winning The Golden Compass is the first in the His Dark Materials series, which continues with The Subtle Knife and The Amber Spyglass.
", 32, 1);

insert into book_author values (1, '9780440238133', 00001);

insert into location_id values(1, 'York', '5 Main Street','Bishopthorpe', 'YO6 4DJ', '01904 715715');

insert into copy values('12345', '9780440238133', 1);

 insert into loan values (1, '2023-01-01', '10000001', '12345', 1, '2023-01-21', '2023-01-10');