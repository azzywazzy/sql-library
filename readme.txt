Get into Tech Exercise 18 - SQL Library

Want to create a SQL database for a library

Tables:
members
items
copies
transactions
locations

Members:
Description:
	holds account and contact details for library members
Fields:
card_number char(8) not null unique primary key
	library card number/account number, 8 digits, stored as string, required
first_name varchar(50) not null
	member's first name(s), required
last_name varchar(50) not null
	member's surname(s), required
dob date()
	member's date of birth, needed to ensure children do not check out inappropriate materials
address_1 varchar(50)
	first line of member's address
address_2 varchar(50)
	city/town for member's address
postcode varchar(8)
	post code for member's address
phone_number varchar(20) not null
	member's phone number
email varchar(254)
	member's email
creation_date date() not null
	date account created
renewal_date date() not null
	date account renewal is required (x years from creation date, and then x years from previous renewal date)
account_status enum('Active', 'Inactive') not null
	status of the account, inactive is renewal date is in the past

Items:
Description:
	holds details for each item (unique ISBN), there is a separate table to capture multiple copies of the same ISBN
Fields:
isbn char(13) not null primary key
	ISBN (international standard book number) is unique for each specific edition of a book title from one specific publisher
title tiny text not null
	title of the book
author_first varchar(50)
	first name of the author
author_last varchar(50)
	surname of the author
description text
	a description of the book, may be multiple paragraphs long
category set()
	TBC what options category will have
... more to add

Copies:
Description:
	each record refers to a unique physical book, linked to Items table via ISBN to access item details, and to Locations table via branch_id to access location details
Fields:
barcode char(8) not null unique primary key
	a unique identifier for each physical book
isbn char(13) not null 
	foreign key (isbn) references items(isbn)
branch_id tinyint(3)
	  foreign key (branch_id) references locations(branch_id)
due_date date()
	look up in transaction table via barcode (join statement? Need to look into how to do this)

Transactions:
Description:
	each record is an action that happened to a copy of an item (e.g. borrow, return, transfer between branches)
	? do we also need initial transactions for adding new books into the system and for removing them (e.g. if damaged)
Fields:
transaction_num mediumint not null unsigned auto_increment primary key
	a unique identifier for each transaction
transaction_date date()
	the date of the transaction
card_number char(8)
	foreign key (card_number) references members(card_number)
	allows link of a transaction to a member (would be irrelevant for addition/removal of copies)
transaction_type enum('Borrow', 'Return', 'Add', 'Remove')
	select from a list of options: Borrow, Return, Add, Remove
item_barcode char(8)
	foreign key (item_barcode) references copies(barcode)
	allows link of a transaction to a copy of an item
branch_id tinyint(3)
	foreign key (branch_id) references locations(branch_id)
	this should be the branch where the item currently is, or where it was last (before being borrowed)
	? of if the item is out on loan, should the branch ID be null, or a certain ID that translates to not being in any branch?
due_date date()
	only relevant for transaction_type = Borrow
	date the copy is due to be returned by (e.g. transaction date + 3 weeks)

Locations:
Description:
	holds details of all library branches in the network
Fields:
branch_id tinyint(3) not null unique primary key
	a unique identifier for each branch
name varchar(50) not null
	branch name 
address_1
	first line of the branch address
address_2
	city/town of the branch address
postcode varchar(8)
	postcode of the branch address 
phone_number varchar(20)
	main phone number of the branch
manager_first varchar(50)
	branch manager's first name
manager_last varchar(50)
	branch manager's last name
	
